package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.dataminer.CCCustomerDAO;
import com.ksoe.callcenter.dataminer.CCJointLineContragentsDAO;
import com.ksoe.callcenter.dataminer.CCRecordPointDAO;
import com.ksoe.callcenter.dataminer.CCRenDAO;
import com.ksoe.callcenter.valueobject.CCCustomer;
import com.ksoe.callcenter.valueobject.CCJointLineContragents;
import com.ksoe.callcenter.valueobject.CCRecordPoint;
import com.ksoe.callcenter.valueobject.CCRen;
import com.ksoe.callcenter.valueobject.brief.CCRecordPointShort;
import com.ksoe.callcenter.valueobject.filter.CCJointLineContragentsFilter;
import com.ksoe.callcenter.valueobject.filter.CCRecordPointFilter;
import com.ksoe.callcenter.valueobject.filter.CCRenFilter;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class CallCenterLogic extends LogicModule {

	public CallCenterLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

    public CCRecordPointShort getCCRecordPointShort(CCRecordPointFilter ccRecordPointFilter) throws PersistenceException {
    	return getCCRecordPointShort(ccRecordPointFilter, true);
    }

    public CCRecordPointShort getCCRecordPointShort(CCRecordPointFilter ccRecordPointFilter, boolean isException) throws PersistenceException {

		Connection ccConnection = null;

		try {

			ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

			CCRecordPointDAO ccRecordPointDAO = new CCRecordPointDAO(ccConnection, userProfile);
			int[] ccRecordPointArr = ccRecordPointDAO.getFilteredCodeArray(ccRecordPointFilter, 0, -1);

			if (ccRecordPointArr.length >= 1) {

				return ccRecordPointDAO.getShortObject(ccRecordPointArr[0]);

			} /*else if (ccRecordPointArr.length > 1) {

				throw new SystemException("\n\nЗа вказаними критеріями пошуку знайдено декілька (" + ccRecordPointArr.length + ") точок обліку!");

			}*/ else {

				if (isException) {
					throw new SystemException("\n\nЗа вказаними критеріями пошуку не знайдено жодної точки обліку!");
				} else {
					return null;
				}

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		//return null;
    }

    public CCRecordPointShort getCCRecordPointShortByEIC(String eic, boolean isException) throws PersistenceException {

		CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
		ccRecordPointFilter.eic = eic;

		return getCCRecordPointShort(ccRecordPointFilter, isException);

    }

    public CCRecordPoint getCCRecordPoint(CCRecordPointFilter ccRecordPointFilter, boolean isException) throws PersistenceException {

		Connection ccConnection = null;

		try {

			ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

			CCRecordPointDAO ccRecordPointDAO = new CCRecordPointDAO(ccConnection, userProfile);
			int[] ccRecordPointArr = ccRecordPointDAO.getFilteredCodeArray(ccRecordPointFilter, 0, -1);

			if (ccRecordPointArr.length >= 1) {

				return ccRecordPointDAO.getObject(ccRecordPointArr[0]);

			} /*else if (ccRecordPointArr.length > 1) {

				throw new SystemException("\n\nЗа вказаними критеріями пошуку знайдено декілька (" + ccRecordPointArr.length + ") точок обліку!");

			}*/ else {

				if (isException) {
					throw new SystemException("\n\nЗа вказаними критеріями пошуку не знайдено жодної точки обліку!");
				} else {
					return null;
				}

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		//return null;
    }

    public CCRecordPoint getCCRecordPointByEIC(String eic, boolean isException) throws PersistenceException {

		CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
		ccRecordPointFilter.eic = eic;

		return getCCRecordPoint(ccRecordPointFilter, isException);

    }

    public CCRecordPoint getCCRecordPointByEIC(String eic, boolean isByt, boolean isException) throws PersistenceException {

		CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
		if (isByt) {
			ccRecordPointFilter.isProm = 0;
		} else {
			ccRecordPointFilter.isProm = 1;
		}
		ccRecordPointFilter.eic = eic;

		return getCCRecordPoint(ccRecordPointFilter, isException);

    }

    public String getCustomerUIDByEIC(String eic, boolean isException) throws PersistenceException {

		Connection ccConnection = null;

		try {

			ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

			CCRecordPointDAO ccRecordPointDAO = new CCRecordPointDAO(ccConnection, userProfile);

			CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
			ccRecordPointFilter.eic = eic;

			int[] ccRecordPointArr = ccRecordPointDAO.getFilteredCodeArray(ccRecordPointFilter, 0, -1);

			if (ccRecordPointArr.length >= 1) {

				CCRecordPoint ccRecordPoint = ccRecordPointDAO.getObject(ccRecordPointArr[0]);

				if (ccRecordPoint == null) {
					if (isException) {
						throw new SystemException("\n\nНе знайдено жодної точки обліку з EIC \"" + eic + "\" !");
					} else {
						return "";
					}
				}

				CCCustomerDAO ccCustomerDAO = new CCCustomerDAO(ccConnection, userProfile);
				CCCustomer ccCustomer = ccCustomerDAO.getObject(ccRecordPoint.customerRef.code);

				if (ccCustomer == null) {
					if (isException) {
						throw new SystemException("\n\nНе знайдено споживача з кодом " + ccRecordPoint.customerRef.code + " !");
					} else {
						return "";
					}
				}

				return ccCustomer.uid;

			} /*else if (ccRecordPointArr.length > 1) {

				throw new SystemException("\n\nЗа вказаними критеріями пошуку знайдено декілька (" + ccRecordPointArr.length + ") точок обліку!");

			}*/ else {

				if (isException) {
					throw new SystemException("\n\nНе знайдено жодної точки обліку з EIC \"" + eic + "\" !");
				} else {
					return "";
				}

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		//return null;
    }

    public int getRenCodeByEIC(String eic, boolean isException) throws PersistenceException {

		Connection ccConnection = null;

		try {

			CCRecordPoint ccRecordPoint = getCCRecordPointByEIC(eic, isException);

			if (ccRecordPoint != null) {

				ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

				CCRenDAO ccRenDAO = new CCRenDAO(ccConnection, userProfile);

				CCRenFilter ccRenFilter = new CCRenFilter();
				ccRenFilter.res = ccRecordPoint.res;

				int[] ccRenArr = ccRenDAO.getFilteredCodeArray(ccRenFilter, 0, -1);

				if (ccRenArr.length == 0) {

					if (isException) {
						throw new SystemException("\n\nНе знайдено РЕМ з шифром \"" + ccRecordPoint.res + "\" !");
					} else {
						return Integer.MIN_VALUE;
					}

				} else {

					CCRen ccRen = ccRenDAO.getObject(ccRenArr[0]);

					if (ccRecordPoint.isProm == 1) {
						return ccRen.rencode;
					} else {
						return ccRen.rencodebyt;
					}

				}

			} else {

				if (isException) {
					throw new SystemException("\n\nНе вдалося визначити РЕМ для точки обліку з EIC \"" + eic + "\" !");
				} else {
					return Integer.MIN_VALUE;
				}

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}
    }

    public BillingServerData getBillingServerDataByCCRecordPoint(CCRecordPoint ccRecordPoint, boolean isException) throws PersistenceException {
    	if (ccRecordPoint == null) {
    		throw new SystemException("\n\nНе задано точку обліку!");
    	}

		Connection ccConnection = null;

		try {
			ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

	        PreparedStatement statement = null;
	        ResultSet set = null;

	        String sql = "select r.jboss_ip, r.jboss_jnpport " +
						 "  from ccren r " +
						 " where r.res = ?";

	        try {
	            statement = ccConnection.prepareStatement(sql);
	            statement.setString(1, ccRecordPoint.res);
	            set = statement.executeQuery();

	            if (set.next()) {
	            	DepartmentLogic departmentLogic = new DepartmentLogic(ccConnection, userProfile);
	            	BillingServerData serverData = departmentLogic.new BillingServerData();
	            	serverData.billingServerIp = set.getString(1);
	            	serverData.billingServerJnpPort = set.getString(2);
	            	return serverData;
	            }

	        } catch (SQLException e) {
	        	throw new SystemException(e.getMessage(), e);
	        } finally {
	            try {
	                if (set != null)
	                    set.close();
	            } catch (SQLException e) {
	            }
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	        }

	        if (isException) {
	        	throw new SystemException("\n\nНе вдалося знайти дані для підключення до білінгу РЕМ!");
	        } else {
	        	return null;
	        }
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}
    }



    /**
     *
     * @param contragentName
     * @param partnerCode
     * @param axPartnerCode
     */
	public void addContragent(String contragentName, String partnerCode, String axPartnerCode) {

		Connection ccConnection = null;

		try {

			ccConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);

			CCJointLineContragentsDAO lineContragentsDao = new CCJointLineContragentsDAO(ccConnection, userProfile);

			CCJointLineContragentsFilter lineContragentsFilter = new CCJointLineContragentsFilter();
			lineContragentsFilter.partnerCode = partnerCode;
			lineContragentsFilter.axPartnerCode = axPartnerCode;

			int[] cArr = lineContragentsDao.getFilteredCodeArray(lineContragentsFilter, 0, -1);
			if (cArr.length == 0) {

				CCJointLineContragents lineContragents = new CCJointLineContragents();
				lineContragents.name = contragentName;
				lineContragents.partnerCode = partnerCode;
				lineContragents.axPartnerCode = axPartnerCode;

				lineContragentsDao.add(lineContragents);
			}



		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (ccConnection != null && !ccConnection.isClosed()) {
					ccConnection.close();
					ccConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}


}
