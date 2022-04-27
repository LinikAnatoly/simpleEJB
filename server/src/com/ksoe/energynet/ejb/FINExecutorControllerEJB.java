//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
/**
 * EJB Controller for FINExecutor;
 *
 */
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.ejb.generated.FINExecutorControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class FINExecutorControllerEJB extends FINExecutorControllerEJBGen {

	public FINExecutorControllerEJB() {
	}


	public FINExecutorShortList getFINExecutorList(
			FINExecutorFilter filterObject, int fromPosition, int quantity) {

		return getFINExecutorList(filterObject, fromPosition, quantity, false);
	}

	public String[] getAllIdsByParent(String parent) {
		return this.getAllIdsByParent(parent, null);
	}
	public String[] getAllIdsByParent(String parent, boolean isMDAX) {
		return this.getAllIdsByParent(parent, (Boolean)isMDAX);
	}

	/**
	 *
	 * Достать коды всех вложенных подразделений
	 *
	 * @param parentCode
	 * @param выборка по данным Axapta (true - да, false - нет)
	 * @return коды всех вложенных подразделений включая parentCode
	 */
	private String[] getAllIdsByParent(String parent, Boolean isUsesMDAX) {

		String strDatasourceConnectException = "Нет связи!";
		Connection netConn = null;
		Connection finConn = null;

		try {
			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	    	AuthLogic netAuth = new AuthLogic(netConn, getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;

			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

	    	finConn = getConnection(finConnectionData.connectionString);

	    	FINExecutorDAO objectDAO = new FINExecutorDAO(getUserProfile(), finConn);

	    	Vector<String> vec = objectDAO.getByParent(parent, isUsesMDAX);
	    	return vec.toArray(new String[vec.size()]);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(strDatasourceConnectException, e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}


	/* FINExecutor. Получить список для просмотра по фильтру */
	public FINExecutorShortList getFINExecutorList(
			FINExecutorFilter filterObject, int fromPosition, int quantity,
			boolean reloadFinExecutor) {

		String strDatasourceConnectException = "Нет связи!";
		Connection netConn = null;
		Connection finConn = null;

		try {
			/////
			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	    	AuthLogic netAuth = new AuthLogic(netConn, getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();

			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}


			strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			try {

				finConn = getConnection(finConnectionData.connectionString);

			} catch (Exception e) {
				throw new EnergyproSystemException(strDatasourceConnectException, e);
			}

			/////

	    	FINExecutorDAO objectDAO = new FINExecutorDAO(getUserProfile(), finConn);
	    	/////

	    	if (reloadFinExecutor) {
				return objectDAO.getFINExecutorList(filterObject, fromPosition, quantity, reloadFinExecutor);
			} else {
				return objectDAO.getFINExecutorList(filterObject, fromPosition, quantity);
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(strDatasourceConnectException, e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}

	/*
	 * по коду подразделения выбирает все айди подразделений из кадров которые
	 * имеют признак НВЗ_Е
	 */
	public String getPodrIdFromKadryByDepartmentCodeNVZ_E(int departmentCode,
			String dateSrez) {
		try {
			FINExecutorDAO objectDAO = new FINExecutorDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			return objectDAO.getPodrIdFromKadryByDepartmentCodeNVZ_E(departmentCode, dateSrez);

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

	/*
	 * по коду подразделения выбирает все айди подразделений из кадров которые
	 * имеют признак НВЗ
	 */
	public String getPodrIdFromKadryByDepartmentCodeNVZ(int departmentCode,
			String dateSrez) {
		try {
			FINExecutorDAO objectDAO = new FINExecutorDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			return objectDAO.getPodrIdFromKadryByDepartmentCodeNVZ(departmentCode, dateSrez);

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

	// возвращает строку fincode из finexecutor (код подразделения из кадров) по коду подразделения из аксапты
	public String getpodrFinCodeBypodrAxCodeFromFinexecutor(String podrAxCode) {
		try {
			DepartmentLogic depLogic = new DepartmentLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            String podrFinCodes = depLogic.getpodrFinCodeBypodrAxCodeFromFinexecutor(podrAxCode);
            return podrFinCodes;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					" Ошибка при определении кода подразделения !",
					e);
		} finally {
			closeConnection();
		}
	}
} // end of EJB Controller for FINExecutor