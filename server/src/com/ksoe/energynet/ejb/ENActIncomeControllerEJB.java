
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENActIncome;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import java.math.BigDecimal;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActIncomServ2ProvDAO;
import com.ksoe.energynet.dataminer.ENActIncome2ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncome2ProvDAO;
import com.ksoe.energynet.dataminer.ENActIncomeDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENSOPayBillProvDAO;
import com.ksoe.energynet.dataminer.ENServicesContractKindDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2ProvDAO;
import com.ksoe.energynet.ejb.generated.ENActIncomeControllerEJBGen;
import com.ksoe.energynet.logic.ActIncomeLogic;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.valueobject.ENActIncome;
import com.ksoe.energynet.valueobject.ENActIncome2ENAct;
import com.ksoe.energynet.valueobject.ENActIncome2Prov;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENSOPayBillProv;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncome2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncome2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.custtransks.CustTransksActions;
import com.ksoe.mdax.services.ledgertransks.LedgerTransksActions;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKFINWorkType2ENServicesContractKindDAO;
import com.ksoe.techcard.dataminer.TKFINWorkTypeDAO;

public class ENActIncomeControllerEJB extends ENActIncomeControllerEJBGen
 {

  public ENActIncomeControllerEJB() {}


	/* ENActIncome. Добавить */
	@Override
	public int add(ENActIncome object) {
		Connection enConn = null;
		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			if (object.dategen == null) {
				object.dategen = new Date();
			}

		    // проверим нет-ли такого акта (договор, период)...
			ActIncomeLogic lg = new ActIncomeLogic(enConn, getUserProfile());
			int isInAct = lg.checkActIncome(object.contractNumber, object.actDateStart, object.actDateEnd, false);
			if (isInAct == 0) {
				System.out.println("contractNumber = " + object.contractNumber);
				System.out.println("actDateStart = "
						+ new SimpleDateFormat("dd.MM.yyyy").format(object.actDateStart).toString());
				System.out.println("actDateEnd = "
						+ new SimpleDateFormat("dd.MM.yyyy").format(object.actDateEnd).toString());
				throw new EnergyproSystemException(
						"За вказаний період за цім договором вже складено прибутковий акт ...");
			}

			// акты делают в будущем !!! нету часов в ФК ;)
			Date dd = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dd);
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			calendar.add(Calendar.MONTH, 1);
			Date maxDate = calendar.getTime();

			if (object.dategen.after(maxDate)) {
				throw new EnergyproSystemException(
						"Дата акту не повинна перевищувати "
								+ new SimpleDateFormat("dd.MM.yyyy").format(
										maxDate).toString(), getUserProfile());
			}

			object.setDomain_info(null);
			object.statusRef.code = ENActIncomeStatus.GOOD;

			ENActIncomeDAO objectDAO = new ENActIncomeDAO(getUserProfile(), enConn);
			object.code = objectDAO.add(object);

			int validateActIncode = lg.validateActIncome(object.code, object.contractNumber, object.actDateStart, object.actDateEnd, false);
			if (validateActIncode == 0) {
				throw new EnergyproSystemException(
						"За вказаний період не знайдено проведених видаткових актів ...");
			}

			return object.code;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENActIncome%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


	// типа проведение акта в ФК
	public FKProvResult close(int code, int isClient , Date postingDate) {
		Connection enConn = null;
		FKProvResult result;
		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENActIncomeDAO objectDAO = new ENActIncomeDAO(getUserProfile(), enConn);
			ENActIncome actIncome = objectDAO.getObject(code);

			result = this.moveToFK(actIncome,  postingDate == null ? actIncome.dategen : postingDate );
			
			actIncome.statusRef.code = ENActIncomeStatus.CLOSED;
			
			objectDAO.save(actIncome);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't sigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
		return result;
	}

	// типа ОТМЕНА !!! проведения акта в ФК
	public void unClose(int code, int isClient) {
		Connection enConn = null;
		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENActIncomeDAO objectDAO = new ENActIncomeDAO(getUserProfile(), enConn);
			ENActIncome actIncode = objectDAO.getObject(code);
			
			this.deleteFromFK(actIncode); 

			actIncode.statusRef.code = ENActIncomeStatus.SIGNATURE;
			objectDAO.save(actIncode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't sigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void signatured(int actCode) {
		try {
			ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.sigantured(actCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't sigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void unSignatured(int actCode) {
		try {
			ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.unSigantured(actCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't unSigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENActIncome. Удалить + связка с расходными актами */
	@Override
	public void remove(int code) {
		Connection enConn = null;
		int i = 0;
		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENActIncomeDAO objectDAO = new ENActIncomeDAO(getUserProfile(), enConn);
			ENActIncome actIn = objectDAO.getObject(code);

			// вынесем связку ... если есть..
			ENActIncome2ENActDAO a2aDAO = new ENActIncome2ENActDAO(getUserProfile(), enConn);
			ENActIncome2ENActFilter a2aFilter = new ENActIncome2ENActFilter();
			a2aFilter.actIncomeRef.code = actIn.code;
			ENActIncome2ENActShortList a2aList = a2aDAO.getScrollableFilteredList(a2aFilter, 0, -1);

			if (a2aList.totalCount != 0) {
				for (i = 0; i < a2aList.totalCount; i++) {
					a2aDAO.remove(a2aList.get(i).code);
				}
			}

			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't connect to DataSource", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	public FKProvResult moveToFK(ENActIncome actIncome , Date postingDate  ) {
		Connection enConn = null;
		Connection finConn = null;
		Connection authConn = null;

	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);


	            ENActIncome2ProvDAO inc2provDAO = new ENActIncome2ProvDAO(enConn, getUserProfile());
            	ENActIncome2ProvFilter inc2provFilter = new ENActIncome2ProvFilter();
            	
            	inc2provFilter.actIncomeRef.code = actIncome.code;
            	ENActIncome2ProvShortList inc2provList  = inc2provDAO.getScrollableFilteredList(inc2provFilter, 0, -1);
            	if (inc2provList.totalCount>0) {
            		ENActIncome2Prov inc2provObj = inc2provDAO.getObject(inc2provList.get(0).code);
            		if (inc2provObj.partId != Integer.MIN_VALUE) {
            			throw new SystemException(" По договору вже передані проводки!!! \n" + 
            		              " partid= " + inc2provObj.partId );
            		}
            	}

	             
	            ENGeneralContractsDAO genContractDAO = new ENGeneralContractsDAO(enConn, getUserProfile());
	            

                DepartmentLogic depLogic = new DepartmentLogic(enConn, getUserProfile());
                ENActIncome2ENActDAO inc2actDAO = new ENActIncome2ENActDAO(enConn, getUserProfile()); 
                ActLogic actLogic = new ActLogic(enConn, getUserProfile());

                
                TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(getUserProfile(), enConn);
                FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
                
                
                TKFINWorkTypeDAO finWorkTypeDao = new TKFINWorkTypeDAO(enConn, getUserProfile());
                TKFINWorkType2ENServicesContractKindDAO finWorkType2ServicesContractKindDao = 
                		new TKFINWorkType2ENServicesContractKindDAO(enConn, getUserProfile());

                
                
                /** SUPP-58594... 23.01.2017 +++ при отсутствии связи с договором в АХ */
    			if (actIncome.generalContractRef.code == Integer.MIN_VALUE) {
    				ContractLogic cLogic = new ContractLogic(enConn, getUserProfile());
    				actIncome.generalContractRef.code = cLogic
    						.addByContractNumber(actIncome.contractNumber, actIncome.partnerCode, actIncome.finDocCode, true, true);
    			}


                ENGeneralContractsFilter genContractFilter = new ENGeneralContractsFilter();
                genContractFilter.code = actIncome.generalContractRef.code;
                ENGeneralContractsShortList genContractList = genContractDAO.getScrollableFilteredList(genContractFilter, 0, -1);

	           // Проверки на статус
	            if (actIncome.statusRef.code != ENActIncomeStatus.SIGNATURE ) {
	                throw new EnergyproSystemException(
	                        "Договір має бути на підписанні !");
	            }

              String cehCode = "";
              String cehCodePodr = "";
              
              // SUPP-103693
              cehCode = "000"; 
              cehCodePodr = "000";  
 
              
              String kau = null;
              String account = null;
              
            
              String V_Prov_Buffer = "";
              String description = "";

              description = "Послуга з надання прав використання опор повітряних ліній" + actIncome.contractNumber +
              		      " від " + new SimpleDateFormat("dd.MM.yyyy").format(actIncome.contractDate).toString();

              ENActIncome2ENActFilter inc2actFil = new ENActIncome2ENActFilter();
              inc2actFil.actIncomeRef.code = actIncome.code;
              ENActIncome2ENActShortList inc2actList = inc2actDAO.getScrollableFilteredList(inc2actFil, 0, -1);
              
              java.math.BigDecimal sumBase = new java.math.BigDecimal(0);
              for (int i = 0; i < inc2actList.totalCount; i++) {
            	  sumBase = sumBase.add( actLogic.getSumByActCode(inc2actList.get(i).actRefCode) ) ;
			  }

              
              
              BigDecimal sumTotal = sumBase.multiply( new BigDecimal(1.2)).setScale(2, BigDecimal.ROUND_HALF_UP);
              BigDecimal sumVat = sumTotal.subtract(sumBase).setScale(2, BigDecimal.ROUND_HALF_UP);
              sumBase = sumBase.setScale(2, BigDecimal.ROUND_HALF_UP);
              
              // под заданию SUPP-63611 добавим проверку (база + ндс = обща сумма) 
              if( (sumBase.add(sumVat).setScale(2, BigDecimal.ROUND_HALF_UP)).compareTo(sumTotal) != 0  ){
            	  throw new EnergyproSystemException(" \n Невірно заведені суми  "    ); 
              }

            

            String _messageId = "";

              // Передача проводок по услугам со стороны Mdax ( 0-только в фин. , 1-и в фин и в АХ , 2- только в АХ)
             int posting_move_config = 0;
 
      		/* Группа договора mDAX*/
            String axContractGroupCode = "";

            if (genContractList.totalCount == 0 ) {
            	throw new EnergyproSystemException(" Недостатньо даних по договору ФК/AX !!! ");
            } else {
            	actIncome.partnerCode = genContractList.get(0).partnerCode;
            	actIncome.finDocCode = genContractList.get(0).finDocCode;
            	actIncome.contractNumber = genContractList.get(0).contractNumber;

            	axContractGroupCode = genContractList.get(0).axContractGroupCode;

                  }

    	   V_Prov_Buffer = fpLogic.generateQuery4ENActIncome(
  						cehCode, cehCodePodr,
  						actIncome.partnerCode,
  						actIncome.finDocCode,
  						sumTotal, sumBase, sumVat,  						
  						description,
  						postingDate);
				   	    	
              FKProvResult provResult = new FKProvResult();

              if (V_Prov_Buffer != "")
              {
                  provResult = fpLogic.createPostings(V_Prov_Buffer);
              }
              else
              {
                  throw new EnergyproSystemException("Не знайдений перелік проводок!");
              }




              String retVouchermDAX = "";
              if (provResult.partId != Integer.MIN_VALUE || !retVouchermDAX.equals("") ) {
	                // сейвим развязку 
	            	
	            	ENActIncome2Prov inc2prov = new ENActIncome2Prov();
	            	inc2prov.datePosting = postingDate;
	            	inc2prov.actIncomeRef.code = actIncome.code;
	            	inc2prov.partId = provResult.partId;
	            	inc2prov.voucher = "";
	            	inc2prov.dateEdit = new Date();
	            	inc2prov.userGen = getUserProfile().userName;
	            	
	            	inc2provDAO.add(inc2prov);

	            }
 


	            return provResult;

	        } catch (DatasourceConnectException e) {
	            throw new EnergyproSystemException("Помилка зв'язку з БД!", e);
	        } catch (PersistenceException e) {
	            throw new EnergyproSystemException(e.getMessage(), e);
	        } finally {
	            closeConnection();
	            try {
	                if (enConn != null && !enConn.isClosed()) {
	                    enConn.close();
	                    enConn = null;
	                }
	            } catch (SQLException e) {
	            }
	        }
	    }
	
	/**
     *	Получить список проводок по доходному акту
     *
     *	@param actIncomeCode - код доходного акта
     *
     */
	public FKProvObjectShortList getPostingsList(int actIncomeCode) {

		FKProvObjectShortList result = new FKProvObjectShortList();
		Connection finConn = null;

		try {
			ENActIncome2ProvDAO income2ProvDao = new ENActIncome2ProvDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENActIncome2ProvFilter actIncome2ProvFilter = new ENActIncome2ProvFilter();
			actIncome2ProvFilter.actIncomeRef.code = actIncomeCode;

			ENActIncome2ProvShortList actIncome2ProvShortList = income2ProvDao.getScrollableFilteredList(actIncome2ProvFilter, 0, -1);

			if (actIncome2ProvShortList.totalCount == 0) {
				return result;
			}

			if (actIncome2ProvShortList.totalCount > 1) {
				throw new SystemException("\n\n"
						+ "Знайдено декілька (" + actIncome2ProvShortList.totalCount + ") пачок проводок для цього акту!");
			}

			int partId = actIncome2ProvShortList.get(0).partId;
			if (partId == Integer.MIN_VALUE) {
				throw new SystemException("\n\n" + "Відсутній код пачки проводок для цього акту!");
			}

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

			return fpLogic.getProvListFromFin(partId);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с БД Фин.Коллекции ...", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}
	
	/*
	 * удалить проводки из ФК 
	 * */
	
	 public void deleteFromFK(ENActIncome actIncome) {
	        Connection enConn = null;
	        Connection finConn = null;
	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	            ENActIncome2ProvDAO ai2ProvDAO = new ENActIncome2ProvDAO(enConn, getUserProfile()); 
	            ENActIncome2ProvFilter ai2ProvFil = new ENActIncome2ProvFilter();
	            ai2ProvFil.actIncomeRef.code = actIncome.code;
	            ENActIncome2ProvShortList ai2ProvList = ai2ProvDAO.getScrollableFilteredList(ai2ProvFil, 0, -1);
	            
	            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
	            
	            if (ai2ProvList.totalCount != 0 ) {
	            	fpLogic.deleteProv(ai2ProvList.get(0).partId , getUserProfile().userName);
	            } 
	            
	            for (int i = 0; i < ai2ProvList.totalCount; i++) {
	            	ai2ProvDAO.remove(ai2ProvList.get(i).code);
				}

	        
	        } catch (DatasourceConnectException e) {
	            throw new EnergyproSystemException("Помилка зв'язку з БД!", e);
	        } catch (PersistenceException e) {
	            throw new EnergyproSystemException(e.getMessage(), e);
	        } finally {
	            closeConnection();
	            try {
	                if (enConn != null && !enConn.isClosed()) {
	                    enConn.close();
	                    enConn = null;
	                }
	            } catch (SQLException e) {
	            }
	        }
	    }

} // end of EJB Controller for ENActIncome