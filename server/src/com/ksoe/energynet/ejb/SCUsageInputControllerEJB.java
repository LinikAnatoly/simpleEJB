
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for SCUsageInput;
  *
  */



import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.logic.signing.DocSigningProcessor;
import com.ksoe.docflow.logic.signing.DocSigningProcessorImpl;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.ejb.generated.SCUsageInputControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.SCUsageInputLogic;
import com.ksoe.energynet.util.LockUtils;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputStatus;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class SCUsageInputControllerEJB extends SCUsageInputControllerEJBGen {
	
	private static final long serialVersionUID = 1L;


	public SCUsageInputControllerEJB() {
	}

	public class SCUsageInputAutoCreated {
		public static final int NO = 0;
		public static final int YES = 1;
	}
	
	private void checkDateGen(SCUsageInput object) {
		if (object.dateGen.getTime() < object.dateFinal.getTime()) {
			throw new EnergyproSystemException("\n\n"
					+ "Бух. дата документів повинна бути більша або дорівнювати даті закінчення періоду формування ...??");
		}		
	}

	@Override
	public int add(SCUsageInput object) {
		return add(object, null);
	}

	public int add(SCUsageInput object, DFDocSigner[] dfDocSigners) {
		Connection docFlowConnection = null;

		try {

			if (object.dateStart.getTime() > object.dateFinal.getTime()) {
				throw new EnergyproSystemException("\n\n"
						+ "Вам не здається, що дата початку повинна бути менша за дату кінця?\n"
						+ "Перевірте правильність складання видаткового акту!");
			}

			this.checkDateGen(object);

			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			scUsageInputLogic.checkMolCodes(object);

			object.setDomain_info(null);

			SCUsageInputDAO objectDAO = new SCUsageInputDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			object.numberInt = objectDAO._collectAutoIncrementNumber();

			object.numberDoc = "" + object.numberInt + "/" + (object.molCode == null ? logic.mol2podr(object.molCodeCounter)  : logic.mol2podr(object.molCode));

			object.statusRef.code = SCUsageInputStatus.GOOD;

			System.out.println("####### autoCreated = " + object.autoCreated);
			if (object.autoCreated == Integer.MIN_VALUE) {
				object.autoCreated = SCUsageInputAutoCreated.NO;
			}

			int objectCode = objectDAO.add(object);

	    	if (dfDocSigners != null && dfDocSigners.length > 0) {
	    		object.code = objectCode;
	    		docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), object);
				docSigningLogic.addDocWithSigners(object, dfDocSigners);
	    	}

	    	return objectCode;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.SCUsageInput%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public void remove(int code) {
		try {
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			// NET-4596 Отменяем связанный документ в документообороте
			scUsageInputLogic.cancelDFDoc(code);
			scUsageInputLogic.removeSCUsageInput2DFDoc(code, Integer.MIN_VALUE, true);

			SCUsageInputDAO objectDAO = new SCUsageInputDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.SCUsageInput%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void fillUsageInput(int usageInputCode) {
		boolean isLocked = false;

		Connection docFlowConnection = null;

		try {
			SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			SCUsageInputDAO uiDao = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			SCUsageInput ui = uiDao.getObject(usageInputCode);

			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Документи для вводу лічильників в експлуатацію № %s від %s вже формуються!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Документи для вводу лічильників в експлуатацію з кодом %d вже формуються!"
							, usageInputCode));
				}

			}

			DocSigningLogic docSigningLogic = null;

			// NET-4596 Проверим сразу наличие подписантов
			if (DocSigningLogic.isSignable(ui)) {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), ui);
				//if (checkDocCode) {
					docSigningLogic.checkDocCodeForObject(ui);
				//}
				docSigningLogic.checkIfSigningStartIsPossible(ui);
			}

			logic.fillUsageInput(usageInputCode);

			if (DocSigningLogic.isReadyForSigning(ui)) {
				// Добавляем бух. данные для прихода счетчиков от абонентов (для документов, подписываемых ЭЦП)
				SCUsageInputLogic usageInputlogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				usageInputlogic.addOzInfo(usageInputCode);
			}

			// NET-4596 Подписание документа
			if (docSigningLogic != null) {
				docSigningLogic.createFirstDocMovementForSigning(ui);
			}

		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			if(isLocked) LockUtils.unLockEntity(usageInputCode);

	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}


	public void fillUsageInputZKU(int usageInputCode) {
		boolean isLocked = false;
	  
		Connection docFlowConnection = null;
	  
		try {
			SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);

			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Документи для вводу лічильників в експлуатацію № %s від %s вже формуються!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Документи для вводу лічильників в експлуатацію з кодом %d вже формуються!"
							, usageInputCode));
				}
			}

			DocSigningLogic docSigningLogic = null;

			// NET-4596 Проверим сразу наличие подписантов
			if (DocSigningLogic.isSignable(ui)) {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), ui);
				//if (checkDocCode) {
					docSigningLogic.checkDocCodeForObject(ui);
				//}
				docSigningLogic.checkIfSigningStartIsPossible(ui);
			}

			logic.fillUsageInputZKU(usageInputCode);
			logic.fillUsageInputOnlyZKU(usageInputCode);

			ui = uiDAO.getObject(usageInputCode);
			ui.statusRef.code = SCUsageInputStatus.FILLED;
			uiDAO.save(ui);

			// NET-4596 Подписание документа
			if (docSigningLogic != null) {
				docSigningLogic.createFirstDocMovementForSigning(ui);
			}

		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			if(isLocked) LockUtils.unLockEntity(usageInputCode);

	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}




  public void undoFillUsageInput(int usageInputCode){
	boolean isLocked = false;
    try
    {
    	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
    			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
    			getUserProfile());
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		SCUsageInput ui = uiDAO.getObject(usageInputCode);
		
		isLocked = LockUtils.lockEntity(usageInputCode);
		if(!isLocked) {
			if(ui != null) {
				throw new SystemException(String.format("Формування документів для вводу лічильників в експлуатацію № %s від %s вже відміняється!"
						, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
			} else {
				throw new SystemException(String.format("Формування документів для вводу лічильників в експлуатацію з кодом %d вже відміняється!"
						, usageInputCode));
			}
		}

    	logic.undoFillUsageInput(usageInputCode);

    	// NET-4596 Отменяем связанный документ в документообороте
    	SCUsageInputLogic uiLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	uiLogic.cancelDFDoc(usageInputCode);
    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    catch (RemoteException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
        } catch (CreateException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
        }
    finally {
    	if(isLocked) LockUtils.unLockEntity(usageInputCode);
    	closeConnection();
    }
  }

  	@Override
  	public void save(SCUsageInput object) {
  		save(object, null);
  	}

  	public void save(SCUsageInput object, DFDocSigner[] dfDocSigners) {
  		Connection docFlowConn = null;
  		Connection authConnection = null;

  		try {
		  // SUPP-68136 Проверка даты бух. документов на случай если она была изменена
		  this.checkDateGen(object);

		  SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  scUsageInputLogic.checkMolCodes(object);

		  SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  ENActDAO actDao = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  SCUsageInput oldObject = uiDAO.getObject(object.code);

		  if (oldObject.dateGen.compareTo(object.dateGen) != 0
				  && object.statusRef.code != SCUsageInputStatus.GOOD) {
			  // Изменять дату на НЕ черновых документах можно только бухгалтерам
			  authConnection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
			  AuthLogic authLogic = new AuthLogic(authConnection, getUserProfile());
			  if (! authLogic.isUserBuh()) {
				  throw new SystemException("\n\nДля зміни дати на документі, що не є чорновим, зверніться до Центральної бухгалтерії!");
			  }
		  }

		  if (oldObject.dateGen.compareTo(object.dateGen) != 0
				  && object.statusRef.code == SCUsageInputStatus.FILLED) {
			  /// SUPP-68136 Если была поменяна дата бух. документов и уже 
			  /// были сформированы строки, то необходимо перебить даты проведения расходных актов
			  Context context = new InitialContext();
			  Object objRef = context.lookup(ENActController.JNDI_NAME);
			  ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
			  ENActController actController = actHome.create();
			  List<Integer> actCodes = actDao.getActCodesListBySCUsageInput(object);
			  for (int actCode : actCodes) {
				  ENAct act = actDao.getObject(actCode);
				  act.dateGen = object.dateGen;
				  actController.changeDateMove(act);
			  }
		  }

		  if (object.statusRef.code == SCUsageInputStatus.GOOD) {
			  if (DocSigningLogic.isSignable(object)) {
				  docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				  DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConn, getUserProfile(), object);
				  if (DocSigningLogic.isReadyForSigning(object) || docSigningLogic.getDocCodeForObject(object) > 0) {
					  docSigningLogic.createOrRemoveDocWithSigners(object, dfDocSigners);
				  }
			  }
		  }

		  uiDAO.save(object);

  		} catch (DatasourceConnectException e) {
  			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} finally {
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (authConnection != null && ! authConnection.isClosed()) {
                	authConnection.close();
                	authConnection = null;
                }
            } catch (SQLException e) {
            }
		}
  	}


  public void undoFillUsageInputZKU(int usageInputCode){
	  boolean isLocked = false;
	    try
	    {
	    	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
	    			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
	    			getUserProfile());
	    	
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);
			
			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Формування документів для вводу лічильників в експлуатацію № %s від %s вже відміняється!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Формування документів для вводу лічильників в експлуатацію з кодом %d вже відміняється!"
							, usageInputCode));
				}
			}
	    	
	    	logic.undoFillUsageInputZKU(usageInputCode);
	        logic.undoFillUsageInputOnlyZKU(usageInputCode);

	    	// NET-4596 Отменяем связанный документ в документообороте
	    	SCUsageInputLogic uiLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	uiLogic.cancelDFDoc(usageInputCode);
	    }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    catch (RemoteException e) {
	            e.printStackTrace();
	            throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
	        } catch (NamingException e) {
	            e.printStackTrace();
	            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
	        } catch (CreateException e) {
	            e.printStackTrace();
	            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
	        }
	    finally {
	    	if(isLocked) LockUtils.unLockEntity(usageInputCode);
	    	closeConnection();
	    }
	  }


  	public void processInSC(int usageInputCode) {
  		processInSC(usageInputCode, null);
  	}

    public void processInSC(int usageInputCode, Object caller) {
    	boolean isLocked = false;
	    try {
	    	long processInSCStartTime = System.nanoTime();
	    	
	    	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
	        		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
	        		getUserProfile());
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);
			
			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію № %s від %s вже здійснюється!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію з кодом %d вже здійснюється!"
							, usageInputCode));
				}
			}

        	SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int dfDocCode = usageInputLogic.getDFDocCodeForSCUsageInput(usageInputCode);
            if (dfDocCode > 0) {
            	// Т.к. при проведении со стороны документооборота вызывается этот же метод, будем передавать при вызове оттуда 
            	// доп. параметр caller, чтобы понимать, откуда вызов (если не передан, значит, проводят по-старому со стороны документа на ввод в экспл.)
            	if (caller == null) {
                	throw new SystemException("\n\nNET-4596 Для проведення цього документу на введення лічильників в експлуатацію потрібно завершити " + 
                			"пов'язане завдання в документообігу!\n" + "Код документу: " + dfDocCode);
            	}
            }

	    	logic.processInSC(usageInputCode);

	        long processInSCEndTime = System.nanoTime();
	        long processInSCTime = (processInSCEndTime - processInSCStartTime) / 1000000;
			System.out.println("###########  seal... processInSCTime = " + processInSCTime);
	
	    }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    catch (ParseException e) {    throw new EnergyproSystemException(e.getMessage(),e);    }
	    catch (RemoteException e) {
	        e.printStackTrace();
	        throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
	    } catch (NamingException e) {
	        e.printStackTrace();
	        throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
	    } catch (CreateException e) {
	        e.printStackTrace();
	        throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
	    }
	
	    finally {
	    	if(isLocked) LockUtils.unLockEntity(usageInputCode);
	    	closeConnection();
	    }
   }

    public void processInSCZKU(int usageInputCode) {
    	processInSCZKU(usageInputCode, null);
    }

    public void processInSCZKU(int usageInputCode, Object caller) {
    	boolean isLocked = false;
        try {

        	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
            		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
            		getUserProfile());
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);
			
			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію № %s від %s вже здійснюється!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію з кодом %d вже здійснюється!"
							, usageInputCode));
				}
			}

        	SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int dfDocCode = usageInputLogic.getDFDocCodeForSCUsageInput(usageInputCode);
            if (dfDocCode > 0) {
            	// Т.к. при проведении со стороны документооборота вызывается этот же метод, будем передавать при вызове оттуда 
            	// доп. параметр caller, чтобы понимать, откуда вызов (если не передан, значит, проводят по-старому со стороны документа на ввод в экспл.)
            	if (caller == null) {
                	throw new SystemException("\n\nNET-4596 Для проведення цього документу на введення лічильників в експлуатацію потрібно завершити " + 
                			"пов'язане завдання в документообігу!\n" + "Код документу: " + dfDocCode);
            	}
            }

        	logic.processInSCZKU(usageInputCode);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (ParseException e) {    throw new EnergyproSystemException(e.getMessage(),e);    }
        catch (RemoteException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
        } catch (CreateException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
        }

        finally {
        	if(isLocked) LockUtils.unLockEntity(usageInputCode);
        	closeConnection();
        }
   }


    public void isPrint(int usageInputCode){
        try
        {
        	SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            SCUsageInput uiObj = uiDAO.getObject(usageInputCode);
            if (uiObj.statusRef.code==SCUsageInputStatus.CLOSED)
            {
              uiObj.isprinted=1;
              uiDAO.save(uiObj);
            }
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't set print",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
        }

	/**
	 * Метод для отмены проведения документов, подписанных с помощью ЭЦП
	 * (для отдельных прав)
	 *
	 * @param usageInputCode
	 */
    public void cancelProcessInSCByEcp(int usageInputCode) {
    	cancelProcessInSC(usageInputCode);
    }

    public void cancelProcessInSC(int usageInputCode){
    	boolean isLocked = false;

    	Connection docFlowConn = null;

        try {
        	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
        			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
        			getUserProfile());
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);
			
			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію № %s від %s вже відміняється!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію з кодом %d вже відміняється!"
							, usageInputCode));
				}
			}

        	logic.cancelProcessInSC(usageInputCode);

            // NET-4596 Отменяем закрытие связанного движения в документообороте
        	SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int dfDocCode = usageInputLogic.getDFDocCodeForSCUsageInput(usageInputCode);
            if (dfDocCode > 0) {
            	docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
    			DocSigningProcessor docSigningProcessor = new DocSigningProcessorImpl(ui, docFlowConn, getUserProfile());
    			docSigningProcessor.doActionsForDocUnClosing(ui);
            }
        }
        catch (RemoteException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
        } catch (CreateException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally {
        	if(isLocked) LockUtils.unLockEntity(usageInputCode);
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
        	closeConnection();
        }
    }

	/**
	 * Метод для отмены проведения документов, подписанных с помощью ЭЦП
	 * (для отдельных прав)
	 *
	 * @param usageInputCode
	 */
    public void cancelProcessInSCZKUByEcp(int usageInputCode) {
    	cancelProcessInSCZKU(usageInputCode);
    }

    public void cancelProcessInSCZKU(int usageInputCode){
    	boolean isLocked = false;

    	Connection docFlowConn = null;

        try
        {
        	SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
            		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
            		getUserProfile());
			SCUsageInputDAO uiDAO = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput ui = uiDAO.getObject(usageInputCode);
			
			isLocked = LockUtils.lockEntity(usageInputCode);
			if(!isLocked) {
				if(ui != null) {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію № %s від %s вже відміняється!"
							, ui.numberDoc, Tools.dateFormatDefault.format(ui.dateGen)));
				} else {
					throw new SystemException(String.format("Проведення документів для вводу лічильників в експлуатацію з кодом %d вже відміняється!"
							, usageInputCode));
				}
			}
			
        	logic.cancelProcessInSCZKU(usageInputCode);

            // NET-4596 Отменяем закрытие связанного движения в документообороте
        	SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int dfDocCode = usageInputLogic.getDFDocCodeForSCUsageInput(usageInputCode);
            if (dfDocCode > 0) {
            	docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
    			DocSigningProcessor docSigningProcessor = new DocSigningProcessorImpl(ui, docFlowConn, getUserProfile());
    			docSigningProcessor.doActionsForDocUnClosing(ui);
            }
        }
        catch (RemoteException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("RemoteException :" + e.getMessage(), e);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
        } catch (CreateException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't fillUsageInput.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally	{
        	if(isLocked) LockUtils.unLockEntity(usageInputCode);
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
        	closeConnection();
        }
        }

	public void setIsDocsReceived(int scUsageInputCode, int isDocsReceived) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код документа на введення лічильників в експлуатацію!");
		}
		if (isDocsReceived != 0 && isDocsReceived != 1) {
			throw new IllegalArgumentException("\n\nНеприпустиме значення для ознаки отримання первинних документів (припустимі значення: 0 або 1)!");
		}

		try {
			SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCUsageInput scUsageInput = scUsageInputDao.getObjectNOSEGR(scUsageInputCode);
			if (scUsageInput == null) {
				throw new SystemException("\n\nНе знайдено документ на введення лічильників в експлуатацію з кодом " + scUsageInputCode + " !");
			}
			scUsageInput.isDocsReceived = isDocsReceived;
			scUsageInputDao.save(scUsageInput);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for SCUsageInput