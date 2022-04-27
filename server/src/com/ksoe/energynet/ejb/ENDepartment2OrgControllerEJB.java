
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Vector;

import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartment2OrgDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;

/**
 * EJB Controller for ENDepartment2Org;
 *
 */

import com.ksoe.energynet.ejb.generated.ENDepartment2OrgControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDepartment2Org;
import com.ksoe.energynet.valueobject.filter.ENDepartment2OrgFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.services.custvendservice.CustFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.lists.RQOrgShortList;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService_Service;

public class ENDepartment2OrgControllerEJB extends
		ENDepartment2OrgControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ENDepartment2OrgControllerEJB() {
	}
	
	/**
	 * 
	 * Установка ID организации из Axapta для объекта связи подразделения и организации {@link ENDepartment2Org}
	 * 
	 * Должен использоваться в методах добавления и сохранения объектов.
	 * 
	 * @param object объект связи подразделения и организации {@link ENDepartment2Org}
	 * @throws DatasourceConnectException
	 * @throws PersistenceException
	 */
	private void setAxOrgId(ENDepartment2Org object) throws DatasourceConnectException, PersistenceException {
		
		// Если уже установлен ID организации из Аксапты или не передался ID из
		// финколлекции, то производится
		// выход из метода
		if(object.axOrgId != Integer.MIN_VALUE || object.org_id == Integer.MIN_VALUE) {
			return;
		}
		
		RQOrgDAO objectDAO = new RQOrgDAO(getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
		
		RQOrg org = objectDAO.getObjectFromFK(object.org_id);

        CustomerService_Service custService = new CustomerService_Service();
        CustomerService custProxy = custService.getBasicHttpBindingCustomerService();
        ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
        ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass); 
                    
        CustFinder custFinder = new CustFinder(custProxy);
        custFinder.parmCriteriaFKPartnerCode(org.codeorg);

        RQOrgShortList orgList = custFinder.getAXCustomerList();
        if(orgList.totalCount > 0 && orgList.get(0).axOrgId != Integer.MIN_VALUE) {
        	object.axOrgId = orgList.get(0).axOrgId;
        }
	}
	
	public int add(ENDepartment2Org object) {
		try {
			ENDepartment2OrgDAO objectDAO = new ENDepartment2OrgDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkUnique(object);
			this.setAxOrgId(object);

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDepartment2Org%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENDepartment2Org object) {
		try {
			ENDepartment2OrgDAO objectDAO = new ENDepartment2OrgDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkUnique(object);
			this.setAxOrgId(object);
			
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENDepartment2Org%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/**
	 * 
	 * Проверка на уникальность введенного подразделения
	 * 
	 * Процедура проверит, что в базе данных нет еще такого введенного 
	 * подразделения. Если нет, то метод просто отработает, а
	 * если есть, то будет сгенерировано соответствующее исключение.
	 * 
	 * Также будет сгененирировано {@link java.lang.NullPointerException} если вместо
	 * подразделения был послан {@code null} или не заполнено одно из значений.
	 * 
	 * @param object объект подразделения {@link ENDepartment2Org}
	 * 
	 * @throws DatasourceConnectException
	 * @throws PersistenceException
	 */
	private void checkUnique(ENDepartment2Org object) throws DatasourceConnectException, PersistenceException {
		if(object == null || (object.org_id == Integer.MIN_VALUE 
				&& object.axOrgId == Integer.MIN_VALUE)) throw new java.lang.NullPointerException();
		ENDepartment2OrgDAO dao = new ENDepartment2OrgDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		
		ENDepartment2OrgFilter filter = new ENDepartment2OrgFilter();
		filter.departmentRef.code = object.departmentRef.code;
		
		Vector<Integer> params = null;
		
		if(object.code != Integer.MIN_VALUE) {
			filter.conditionSQL = String.format("%s <> ?", ENDepartment2Org.code_QFielld);
			params = new Vector<Integer>();
			params.add(object.code);
		}
		
		long count = dao.count(filter, params);
		
		if(count > 0) {
			ENDepartmentDAO depDao = new ENDepartmentDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENDepartment dep = depDao.getObject(object.departmentRef.code);
			throw new SystemException(String.format("Підрозділ \"%s\" вже введенний у цей довідник"
					, dep.name));
		}
		
	}

} // end of EJB Controller for ENDepartment2Org