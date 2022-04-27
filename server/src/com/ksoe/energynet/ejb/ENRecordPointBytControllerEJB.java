
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.NamingException;

/**
* EJB Controller for ENRecordPointByt;
*
*/

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.contract.ejb.PersonalAccountController;
import com.ksoe.contract.ejb.PersonalAccountControllerHome;
import com.ksoe.contract.ejb.RecordPointController;
import com.ksoe.contract.ejb.RecordPointControllerHome;
import com.ksoe.contract.valueobject.PersonalAccount;
import com.ksoe.contract.valueobject.RecordPoint;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.ejb.generated.ENRecordPointBytControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.util.BillingEjbCache;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENRecordPointBytControllerEJB extends ENRecordPointBytControllerEJBGen {

	public ENRecordPointBytControllerEJB() {
	}
	
	
	/*ENRecordPointByt. Изменить*/
	  public void save(ENRecordPointByt object)
	   {
	    try
	     {
	      object.setDomain_info(null);	      
	      
	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      el = elDAO.getObject(object.element.code);

	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 el.renRef.code = object.element.renRef.code;
		      }
	      }
	      
	      if (object.element.elementInRef != null){
		        if (object.element.elementInRef.code != Integer.MIN_VALUE){
			      ENElement inElement = elDAO.getObject(object.element.elementInRef.code);		      
			      el.elementInRef.code = inElement.code;
			      el.renRef.code = inElement.renRef.code;	    	  
		        }
		      }
		      
		  if ( el.renRef.code == Integer.MIN_VALUE){
		    	  throw new EnergyproSystemException("Element not bound to EPRen.");
		  }
		  
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
		      
		  elDAO.save(el);
	 
	      ENRecordPointBytDAO objectDAO = new ENRecordPointBytDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENRecordPointByt%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	/* ENRecordPointByt. Добавить */
	@Override
	public int add(ENRecordPointByt object) {
		try {
			// object.setDomain_info(null);

			ENElement e = new ENElement();
			e.typeRef.code = ENElementType.TY_BYT;
			// !!!!!!! Опачки !!!! а тут уже надо знать окуда(обьект АУТ И ИН
			// ..)
			// + РЭС !!!!!
			// el.elementInRef.code = object.element.elementInRef.code;
			// el.renRef.code = object.element.renRef.code;
			// el.code = elDAO.add(el);

			// значит только по ИН-элементу !!! а он вааще нужен???
			// это пошли ХИТРЫЕ елементы ...
			ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			if (object.element.renRef != null) {
				if (object.element.renRef.code != Integer.MIN_VALUE) {
					e.renRef.code = object.element.renRef.code;
				}
			}

			if (e.renRef.code == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("Element not bound to EPRen.");
			}

			if (object.element.geoDepartmentRef != null) {
		    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
		    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
		    	  }
		    	  
		      }
			
			e.code = elementDAO.add(e);

			object.element.code = e.code;

			ENRecordPointBytDAO objectDAO = new ENRecordPointBytDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENRecordPointByt%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENRecordPointByt. Получить объект без сегрегации */
	public ENRecordPointByt getObjectNoSegr(int code) {
		try {
			ENRecordPointBytDAO objectDAO = new ENRecordPointBytDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return objectDAO.getObjectNoSegr(code);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't get {%com.ksoe.energynet.valueobject.ENRecordPointByt%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/** ENRecordPointByt. проверка наличия ENRecordPointByt... */
	public boolean checkRecordPointByt(int elementCode) {
		try {
			ENRecordPointBytDAO recordPointBytDao = new ENRecordPointBytDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			boolean existRecordPointByt = recordPointBytDao.checkRecordPointByt(elementCode);

			return existRecordPointByt;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't checkRecordPointByt. elementCode = " + elementCode, e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public String getPersonalAccountUidByCode(int code, int departmentCode) {
		
		try {
			DepartmentLogic departmentLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			BillingServerData serverData = departmentLogic.getServerDataByDepartmentCode(departmentCode);
            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
            	throw new SystemException("\n \n"
                        + String.format("Помилка при визначенні РЕМ для особового рахунку з кодом %d та підрозділу %d", code, departmentCode));
            }
            RecordPointControllerHome recordPointHome = (RecordPointControllerHome)BillingEjbCache.getHome("ksoe/contract/RecordPointController", "com.ksoe.contract.ejb.RecordPointControllerHome",
            		serverData.billingServerIp, serverData.billingServerJnpPort);
            PersonalAccountControllerHome personalAccountHome = (PersonalAccountControllerHome)BillingEjbCache.getHome("ksoe/contract/PersonalAccountController", "com.ksoe.contract.ejb.PersonalAccountControllerHome",
            		serverData.billingServerIp, serverData.billingServerJnpPort);
            PersonalAccountController personalAccountController = personalAccountHome.create();
            RecordPointController recordPointController = recordPointHome.create();
            RecordPoint recordPoint = recordPointController.getObject(code);
    		PersonalAccount personalAccount = personalAccountController.getObject(recordPoint.personalAccountRef.code);
    		return (personalAccount == null) ? null : personalAccount.uid;
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't get personal account uid by code = " + code);
		} catch (NamingException | CreateException | RemoteException  e) {
			throw new SystemException(e);
		}
	}

} // end of EJB Controller for ENRecordPointByt