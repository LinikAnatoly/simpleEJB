
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBudgets2NomenclaturesDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort;
import com.ksoe.energynet.valueobject.filter.ENBudgets2NomenclaturesFilter;
import com.ksoe.energynet.valueobject.lists.ENBudgets2NomenclaturesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
/**
 * EJB Controller for ENBudgets2Nomenclatures;
 *
 */
import com.ksoe.energynet.ejb.generated.ENBudgets2NomenclaturesControllerEJBGen;

public class ENBudgets2NomenclaturesControllerEJB extends
		ENBudgets2NomenclaturesControllerEJBGen {

	public ENBudgets2NomenclaturesControllerEJB() {
	}
	
	private void checkMatIdAndBudget(ENBudgets2Nomenclatures object) throws DatasourceConnectException, PersistenceException {
		
		
		ENBudgets2NomenclaturesDAO dao = new ENBudgets2NomenclaturesDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENDepartmentDAO depDao = new ENDepartmentDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENBudgets2NomenclaturesFilter filter = new ENBudgets2NomenclaturesFilter();
		filter.nn = object.nn;
		filter.conditionSQL = String.format("%s <> ?", ENBudgets2Nomenclatures.code_QFielld);
		filter.conditionSQL += String.format(" and (%s is null", ENBudgets2Nomenclatures.budgetRef_QFielld);
		Vector<Object> vec = new Vector<Object>();
		vec.add(object.code);
		
		
		if(object.budgetRef.code != Integer.MIN_VALUE) {
			filter.conditionSQL += String.format(" or %s = ?", ENBudgets2Nomenclatures.budgetRef_QFielld);
			vec.add(object.budgetRef.code);
		}
		filter.conditionSQL += ")";

		
		ENBudgets2NomenclaturesShortList list = dao.getScrollableFilteredList(filter, 0, -1, vec);
		
		if(list.totalCount == 0) {
			return;
		}
		
		Vector<Integer> budgetCodes = new Vector<Integer>();
		
		for(ENBudgets2NomenclaturesShort obj : list.list) {
			if(obj.budgetRefCode != Integer.MIN_VALUE) {
				budgetCodes.add(obj.budgetRefCode);
			}
		}
		
		if(budgetCodes.size() == 0) {
			throw new EnergyproSystemException(String.format("Матеріал (н/н %s назва %s) вже введений у довідник без бюджетотримача", object.nn, object.mat_name));
		}
		
		if(object.budgetRef.code != Integer.MIN_VALUE) {
			ENDepartment dep = depDao.getObject(object.budgetRef.code);
			throw new EnergyproSystemException(String.format("Матеріал (н/н %s назва %s) вже введений у довідник для бюджетотримача %s", object.nn, object.mat_name, dep.name));
		}
	}
	
	public int add(ENBudgets2Nomenclatures object) {
		try {
			ENBudgets2NomenclaturesDAO dao = new ENBudgets2NomenclaturesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkMatIdAndBudget(object);
			


		    return dao.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
		
	}
	
	public void save(ENBudgets2Nomenclatures object) {
		try {
			ENBudgets2NomenclaturesDAO objectDAO = new ENBudgets2NomenclaturesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkMatIdAndBudget(object);

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBudgets2Nomenclatures