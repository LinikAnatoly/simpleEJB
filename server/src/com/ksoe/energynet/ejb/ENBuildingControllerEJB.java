
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBuilding;
 *
 */

import java.sql.SQLException;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENBuilding2CommissionDAO;
import com.ksoe.energynet.dataminer.ENBuilding2ENactDAO;
import com.ksoe.energynet.dataminer.ENBuilding2OSDataDAO;
import com.ksoe.energynet.dataminer.ENBuildingDAO;
import com.ksoe.energynet.ejb.generated.ENBuildingControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.ENBuildingStatus;
import com.ksoe.energynet.valueobject.filter.ENBuilding2CommissionFilter;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ENactFilter;
import com.ksoe.energynet.valueobject.filter.ENBuilding2OSDataFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilding2CommissionShortList;
import com.ksoe.energynet.valueobject.lists.ENBuilding2OSDataShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.util.WebServicesConsts;




public class ENBuildingControllerEJB extends
		ENBuildingControllerEJBGen {
	
	private java.sql.Connection fkOSConnection = null;
	
	 protected java.sql.Connection getFKOSConnection() throws DatasourceConnectException
	    {
	    try {
	    if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
	        return fkOSConnection;
	    }

	    InitialContext initialContext = new InitialContext();
	    DataSource dataSource = (DataSource) initialContext
	            .lookup(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	    fkOSConnection = dataSource.getConnection();
	    return fkOSConnection;
	    } catch (NamingException e) {
	    throw new DatasourceConnectException(AuthorizationJNDINames.FINMATERIAL_DATASOURCE, e);
	    } catch (SQLException e) {
	    throw new DatasourceConnectException(AuthorizationJNDINames.FINMATERIAL_DATASOURCE, e);
	    }
	    }

	public ENBuildingControllerEJB() {
	}
	
	
	/* ENBuilding. Добавить */
	public int add(ENBuilding object) {
		try {
			ENBuildingDAO objectDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.setDomain_info(null);
		    
		    if (object.invNumberOZ != null){
		    	if (!object.invNumberOZ.equals("")){
			    	throw new SystemException(
							"Додавання неможливо, інвентарний об`єкта вже існує!!! ");
			    }
		    	
		    }
		    
		    
		    object.userGen = getUserProfile().userName;
	        object.dateGen = new Date();
	        object.statusRef.code = ENBuildingStatus.DRAFT;

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBuilding%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENBuilding. Изменить */
	public void save(ENBuilding object) {
		try {
			ENBuildingDAO objectDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.setDomain_info(null);
	        object.dateEdit = new Date();
	        
	        
	        if (object.invNumberOZ != null){
		    	if (!object.invNumberOZ.equals("")){
			    	throw new SystemException(
							"Редагування неможливо, інвентарний об`єкта вже існує!!! ");
			    }
		    	
		    }
	        
	        if (object.statusRef.code != ENBuildingStatus.DRAFT ){
		    	throw new SystemException(
						"Редагування можливе якщо статус ОЗ-1 черновий !!! ");
		    }

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENBuilding%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	public void createOZ(int ozCode)
	  {
		   try {

			   ENBuildingDAO objectDAO = new ENBuildingDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			   ENBuilding2CommissionDAO b2cDAO = new ENBuilding2CommissionDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			   ENBuilding obj = objectDAO.getObject(ozCode);

			   if (obj.statusRef.code == ENBuildingStatus.DRAFT ) {
			   obj.statusRef.code = ENBuildingStatus.SIGNED;
			   objectDAO.save(obj);
			   } else
			   {throw new SystemException("Документ ОЗ повинен бути зі статусом Черновий !!!");}

			 
			   ENBuilding2CommissionFilter b2cFil = new ENBuilding2CommissionFilter();
			   b2cFil.ENBuildingRef.code = ozCode;
			   ENBuilding2CommissionShortList b2cList = b2cDAO.getScrollableFilteredList(b2cFil, 0, -1);
			  
			   if (b2cList.totalCount==0)
			      {throw new SystemException("Не заведені члени комісії,особи що приймають об`єкт або здають !!!");}


		   }
		   catch (DatasourceConnectException e) {throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENBuilding%} object.",e);}
		    catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}

	  }
	
	public void unCreateOZ(int ozCode)
	  {
		   try {

			   ENBuildingDAO objectDAO = new ENBuildingDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			   ENBuilding2OSDataDAO ozDataDAO = new ENBuilding2OSDataDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			   ENBuilding2OSDataFilter ozDataFilter = new ENBuilding2OSDataFilter();
			   ozDataFilter.ENBuildingRef.code = ozCode;
			   ENBuilding2OSDataShortList ozDataList = ozDataDAO.getScrollableFilteredList(ozDataFilter, 0, -1);

			   ENBuilding obj = objectDAO.getObject(ozCode);

			   if (obj.statusRef.code == ENBuildingStatus.SIGNED ) {
			   obj.statusRef.code = ENBuildingStatus.DRAFT;
			   objectDAO.save(obj);
			   // удаляем данные бух
			   if (ozDataList.totalCount != 0){
				   ozDataDAO.remove(ozDataList.get(0).code);
			   }

			   } else
			   {
				   throw new EnergyproSystemException("Документ ОЗ повинен бути складеним!!!");
			   }

		   }
		   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENBuilding%} object.",e);}
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}

	  }
	
	
	public void moveToOS(int ozCode)
	  {
		boolean isAXPurchaseOrder = false; 
		
		   try {

			   ENBuildingDAO objectDAO = new ENBuildingDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			   ENBuilding obj = objectDAO.getObject(ozCode);
			   
			   AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());			   
			   AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			   
			   
			   if (obj.statusRef.code == ENBuildingStatus.SIGNED ) {

				// Приход ОС 
				   
				   
            	if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_PURCHASEORDER))
            	{
            		isAXPurchaseOrder = true;
            	}
            	
            	int sessionTimeOut = WebServicesConsts.defaultTimeOut * 5;

		            {

		               

                	/** с откатом транзакции в АХ */
					try {

						movePrihodOSToFK(obj.code);

					} catch (Exception ex) {

						

						throw new SystemException(ex.getMessage(), ex);
					}

                    // 09.01.13 Сохраним бух. дату документа
                   /* Date currentBuhDate = getOSCurrentBuhDate();
                    if (currentBuhDate != null)
                    {
                        obj.datePosting = currentBuhDate;
                    }*/
		                    
                
		        

		            } // конец прихода ОС
		            
			   obj.statusRef.code = ENBuildingStatus.CLOSE;
			   objectDAO.save(obj);
			   } else
			   {
				   throw new EnergyproSystemException("Документ ОЗ повинен бути складеним!!!");
			   }

		   }
		   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENBuilding%} object.",e);}
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}

	  }
	
	
	public void unMoveToOS(int ozCode) {
		try {

			ENBuildingDAO objectDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuilding obj = objectDAO.getObject(ozCode);

			if (obj.statusRef.code == ENBuildingStatus.CLOSE) {/*

				// удалим доввод в ОС для основного
				ReconstrModernizacLogic logic = new ReconstrModernizacLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getUserProfile());
				logic.unMoveDovvodToOS(obj);
				
			*/
				obj.statusRef.code = ENBuildingStatus.SIGNED;
				objectDAO.save(obj);
			   } else {
				throw new EnergyproSystemException(
						"Документ ОЗ повинен бути проведеним!!!");
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't unMoveToOS {%com.ksoe.energynet.valueobject.ENBuilding%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

	}
	
	/* ENBuilding. Удалить */
	public void remove(int code) {
		try {
			ENBuildingDAO objectDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENBuilding2ENactDAO b2aDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuilding2ENactFilter b2aFil = new ENBuilding2ENactFilter();
			b2aFil.ENBuildingRef.code = code;
			int[] b2aArr = b2aDAO.getFilteredCodeArray(b2aFil, 0, -1);
			for (int i = 0; i < b2aArr.length; i++) {
				b2aDAO.remove(b2aArr[i]);
			}

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENBuilding%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	 public void movePrihodOSToFK(int buildingCode)  throws PersistenceException, DatasourceConnectException
	    {
	        try
	        {
	            fkOSConnection = getFKOSConnection();

	            ENBuildingDAO buildingDAO = new ENBuildingDAO(
						getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	            ENBuilding building = buildingDAO.getObject(buildingCode);

 
	            if (building.departmentRef.code == Integer.MIN_VALUE)
	            {
	                throw new EnergyproSystemException("Не вказано підрозділ з ОЗ для ордеру!");
	            }


	            FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, getUserProfile());
	            OSLogic.movePrihodOSToFKBuilding(building);

	        }
	        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
	        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}

	        finally
	        {
	            try {
	                if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
	                    fkOSConnection.close();
	                    fkOSConnection = null;
	                }
	            } catch (SQLException e) {
	            }

	        }
	    }
	 
	 
	 /**
	    * Возвращает текущую бухгалтерскую дату
	    *
	    * @return Текущая бух. дата
	    */
//	    public Date getOSCurrentBuhDate()
//	    {
//	        try
//	        {
//	            fkOSConnection = getFKOSConnection();
//
//	            FKOSLogic OSLogic = new FKOSLogic(fkOSConnection, getUserProfile());
//	            return OSLogic.getCurrentBuhDate();
//
//	        }
//	        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
//	        finally
//	        {
//	            try {
//	                if (fkOSConnection != null && ! fkOSConnection.isClosed()) {
//	                    fkOSConnection.close();
//	                    fkOSConnection = null;
//	                }
//	            } catch (SQLException e) {
//	            }
//
//	        }
//	    }


} // end of EJB Controller for ENBuilding