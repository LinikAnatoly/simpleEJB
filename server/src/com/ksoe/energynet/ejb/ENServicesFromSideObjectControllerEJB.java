
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENServicesFromSideObject;
  *
  */



import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServFromSide2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesFromSideObjectDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENServicesFromSideObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENServFromSide2PlanWork;
import com.ksoe.energynet.valueobject.ENServFromSideStatus;
import com.ksoe.energynet.valueobject.ENServicesFromSideObject;
import com.ksoe.energynet.valueobject.brief.ENServicesFromSideObjectShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServFromSide2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.valueobject.RQOrder;
import com.ksoe.rqorder.valueobject.RQOrderCreationMethod;
import com.ksoe.rqorder.valueobject.RQOrderItem;
import com.ksoe.rqorder.valueobject.filter.RQOrderItemFilter;

public class ENServicesFromSideObjectControllerEJB extends ENServicesFromSideObjectControllerEJBGen
 {

  public ENServicesFromSideObjectControllerEJB() {}

	public ENServicesObjectShortList getContractList(ENServicesObjectFilter f,
			int fromPosition, int quantity) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			return objectDAO.getContractList(f, fromPosition, quantity);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENServicesFromSideObject. Добавить */
	@Override
	public int add(ENServicesFromSideObject object) {
		try {
			object.setDomain_info(null);
			
			ENServicesFromSideObjectDAO objectDAO = new ENServicesFromSideObjectDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			object.numberProject = "" + objectDAO._collectAutoIncrementNumberProject();
		        
			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			ENElement e = new ENElement();
			e.typeRef.code = ENElementType.SERVICES_FROM_SIDE_OBJECT;

			ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			if (object.element.renRef != null) {
				if (object.element.renRef.code != Integer.MIN_VALUE) {
					e.renRef.code = object.element.renRef.code;
				}
			}

			if (e.renRef.code == Integer.MIN_VALUE) {
				e.renRef.code = 0;
			}

			object.element.code = elementDAO.add(e);
			object.element.renRef.code = e.renRef.code;
			object.element.typeRef.code = e.typeRef.code;
			object.statusRef.code = ENServFromSideStatus.DRAFT;

	
			return objectDAO.add(object);
			
			
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENServicesFromSideObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENServicesFromSideObject. Удалять нельзя если есть планы */
	@Override
	public void remove(int code) {
		try {
			ENServicesFromSideObjectDAO objectDAO = new ENServicesFromSideObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesFromSideObject object = objectDAO.getObject(code);

			/*
			 * если были планы в САД ...
			 */

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.elementRef.code = object.element.code;
			int[] plArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
			if (plArr.length > 0) {
				throw new EnergyproSystemException(
						"Видаляти не можна!!! Для цього об’екту складени плани!!!");
			}

			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENServicesFromSideObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
    // Подписание договора "
	public int signed(int svoCode ) {
		try {
			ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
			
			if(soObj.finDocID == Integer.MIN_VALUE){
				throw new SystemException("\n\n Не вказано договір з Фін.коллекції!!!");
			} 
			
			soObj.statusRef.code = ENServFromSideStatus.SIGNED;
			soDAO.save(soObj);

			return svoCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
		} catch (PersistenceException e) {
            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}
	
    //Отмена подписания договора "
	public int unSigned(int svoCode ) {
	
		try {
			ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
			soObj.statusRef.code = ENServFromSideStatus.DRAFT;
			soDAO.save(soObj);

			return svoCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
		} catch (PersistenceException e) {
            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}
	
	// оплата договора "
		public int pay(int svoCode ) {
			try {
				ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
				soObj.statusRef.code = ENServFromSideStatus.PAY;
				soDAO.save(soObj);

				return svoCode;

	        } catch (DatasourceConnectException e) {
	            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
			} catch (PersistenceException e) {
	            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
			} finally {
				closeConnection();
			}
		}
		
		// відміна оплати договора "
			public int unPay(int svoCode ) {
				try {
					ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
					ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
					soObj.statusRef.code = ENServFromSideStatus.SIGNED;
					soDAO.save(soObj);

					return svoCode;

		        } catch (DatasourceConnectException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} catch (PersistenceException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} finally {
					closeConnection();
				}
			}
			
			
			
			// роботи виконані 
		public int workExecuted(int svoCode ) {
			try {
				ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
				soObj.statusRef.code = ENServFromSideStatus.WORK_EXECUTE;
				soDAO.save(soObj);

				return svoCode;

	        } catch (DatasourceConnectException e) {
	            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
			} catch (PersistenceException e) {
	            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
			} finally {
				closeConnection();
			}
		}
		
		// відміна статуса роботи виконані 
			public int workUnExecuted(int svoCode ) {
				try {
					ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
					ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
					soObj.statusRef.code = ENServFromSideStatus.PAY;
					soDAO.save(soObj);

					return svoCode;

		        } catch (DatasourceConnectException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} catch (PersistenceException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} finally {
					closeConnection();
				}
			}

			
			// договір завершений  
			public int workCompleted(int svoCode ) {
				try {
					ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
					ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
					soObj.statusRef.code = ENServFromSideStatus.WORK_COMPLETED;
					soDAO.save(soObj);

					return svoCode;

		        } catch (DatasourceConnectException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} catch (PersistenceException e) {
		            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
				} finally {
					closeConnection();
				}
			}
			
			// відміна статуса договір завершений 
				public int workUnCompleted(int svoCode ) {
					try {
						ENServicesFromSideObjectDAO soDAO = new ENServicesFromSideObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
						ENServicesFromSideObject soObj = soDAO.getObject(svoCode);
						soObj.statusRef.code = ENServFromSideStatus.WORK_EXECUTE;
						soDAO.save(soObj);

						return svoCode;

			        } catch (DatasourceConnectException e) {
			            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
					} catch (PersistenceException e) {
			            throw new SystemException("Can't signed servicesFromSide.Code = " + svoCode, e);
					} finally {
						closeConnection();
					}
				}
				
				
				/*ENServicesFromSideObject. Изменить*/
				  public void save(ENServicesFromSideObject object)
				   {
				    try
				     {
				      object.setDomain_info(null);
				      ENServicesFromSideObjectDAO sfsDAO = new ENServicesFromSideObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				      ENServFromSide2PlanWorkDAO sfs2pDAO = new ENServFromSide2PlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				      ENPlanWorkDAO pDAO = new ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				      RQOrderItemDAO oiDAO = new RQOrderItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				      RQOrderDAO oDAO = new RQOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				      
				      ENServFromSide2PlanWorkFilter sfs2pFil = new ENServFromSide2PlanWorkFilter();
				      sfs2pFil.servFromSideRef.code=object.code;
				      
				      int[] sfs2plArr = sfs2pDAO.getFilteredCodeArray(sfs2pFil, 0, -1);
				      
				      for (int i = 0; i < sfs2plArr.length; i++) {
				    	
				    	ENServFromSide2PlanWork sfs2pObj = sfs2pDAO.getObject(sfs2plArr[i]); 
						ENPlanWork pObj = pDAO.getObject(sfs2pObj.planRef.code);
						
						System.out.println("begin code plan " + pObj.code);
						
						/*Проверка , когда естимейт в заявке и на заявке указан договор тогда не даем менять и на объекте ENServicesFromSideObject */
						RQOrderItemFilter oiFil = new RQOrderItemFilter();
						oiFil.conditionSQL = " rqorderitem.findocid is not NULL \n"+
									" and rqorderitem.code in ( select oi2ei.orderitemcode from  enservfromside2planwrk sfs2p , enestimateitem ei , rqorderitem2enestimttm oi2ei ,rqorderitem oii \n"+    
									" where  sfs2p.planrefcode = ei.planrefcode \n"+
									" and  sfs2p.servfromsiderefcode = "+ object.code +" \n"+
									" and  oi2ei.estimateitemcode = ei.code \n"+
									" and  oi2ei.orderitemcode=oii.code  \n"+
									" and  (oii.findocid is not null and oii.findocid <> "+object.finDocID+") \n"+ 
									" )  ";
						int[] oiArr = oiDAO.getFilteredCodeArray(oiFil, 0, -1);
						if (oiArr.length != 0) {
						
						RQOrderItem oiObj = oiDAO.getObject(oiArr[0]);
						RQOrder oObj = oDAO.getObject(oiObj.orderRef.code); 
						
				                throw new SystemException(String.format( " Змінити договір неможливо, на заявці %$ вказаний інший код договору - ( %$ ) !!!!  "
				                        ,oObj.numberDoc+" від "+ new SimpleDateFormat("dd.MM.yyyy").format(oObj.dateGen)   , oiObj.contractNumber)    );
				            
				        }
						// иначе сетим такой же дог на плане усли отличается 
						if(object.finDocID != pObj.servicesFSideFinId){	
					    	pObj.servicesFSideFinId = object.finDocID;
					    	pObj.servicesFSideCnNum = object.contractNumber;
					    	pObj.partnerCode = object.partnerCode;
					    	pObj.finDocCode = object.finDocCode;
					    	
					       pDAO.save(pObj);
						}
						
					  }
				         
				     
					        	
					
				      
				      
				      
				      sfsDAO.save(object);
				      
				     }
				    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENServicesFromSideObject%} object.",e);}
				    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
				    finally                              {closeConnection();}
				   }


	 /*ENServicesFromSideObject. Получить объект*/
	 public ENServicesFromSideObjectShort getShortObjectWithBillAndPaySum(int code)
	 {
		 try
		 {
			 ENServicesFromSideObjectDAO objectDAO = new ENServicesFromSideObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			 return objectDAO.getShortObjectWithBillAndPaySum(code);
		 }
		 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get {%com.ksoe.energynet.valueobject.ENServicesFromSideObject%} object.",e);}
		 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		 finally                              {closeConnection();}
	 }



} // end of EJB Controller for ENServicesFromSideObject