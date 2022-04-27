package com.ksoe.energynet.logic;

import java.rmi.RemoteException;
import java.sql.Connection;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.ksoe.callcenter.valueobject.CCRecordPoint;
import com.ksoe.contract.ejb.RecordPointController;
import com.ksoe.contract.ejb.RecordPointControllerHome;
import com.ksoe.docflow.valueobject.DFDocServicesConsumer;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.logic.ENConsts.DisconnectionInitiator;
import com.ksoe.energynet.util.BillingEjbCache;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energypro.ejb.EPDisconnectOrderController;
import com.ksoe.energypro.ejb.EPDisconnectOrderControllerHome;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class BillingLogic extends LogicModule {

	private static final long serialVersionUID = 1L;

	public BillingLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	/**
	 *
	 * IP-адрес сервера биллинга
	 *
	 * @param departmentCode код подразделения
	 * @return IP-адрес сервера биллинга
	 */
	private BillingServerData getServerDataByDepartmentCode(int departmentCode) {
		DepartmentLogic depLogic = new DepartmentLogic(connection, userProfile);

		BillingServerData serverData = depLogic.getServerDataByDepartmentCode(departmentCode);

		if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
        	throw new SystemException("\n \n"
                    + "Помилка при визначенні РЕМ для особового рахунку!!!");
        }

        return serverData;
	}

	/**
	 *
	 * Получить бытовой RecordPointController
	 *
	 * @param departmentCode код подразделения для определения сервера биллинга
	 * @return
	 * @throws NamingException
	 * @throws RemoteException
	 * @throws CreateException
	 */
	private RecordPointController getReportPointController(int departmentCode) throws NamingException, RemoteException, CreateException {

		BillingServerData serverData = this.getServerDataByDepartmentCode(departmentCode);

		String jndi = com.ksoe.contract.ejb.RecordPointController.JNDI_NAME;
		String ejbHome = com.ksoe.contract.ejb.RecordPointControllerHome.class.getName();
		RecordPointControllerHome ejbRecordPointHome = (RecordPointControllerHome) BillingEjbCache.getHome(jndi, ejbHome,
				serverData.billingServerIp, serverData.billingServerJnpPort);
		RecordPointController rpController = ejbRecordPointHome.create();
		return rpController;
	}

	/**
	 *
	 * Вставка маркера для бытового потребителя
	 *
	 * @param DFDocServicesConsumer заявление бытового потребителя
	 * @param claimCode код заявки из документооборота
	 * @throws NamingException
	 * @throws CreateException
	 * @throws RemoteException
	 */
	public void insertMarkerPersonalAccount(DFDocServicesConsumer docServicesConsumer, int departmentCode) throws NamingException, RemoteException, CreateException {
		try {

			BillingServerData billingServerData = getServerDataByDepartmentCode(departmentCode);

			RecordPointController rpController = this.getReportPointController(departmentCode);
			rpController.insertMarkerPersonalAccount(docServicesConsumer.personalAccount, docServicesConsumer.code, billingServerData.epRenCode);

		} finally {
			closeConnection();
		}
	}

	/**
	 *
	 * Удаление маркера для бытового потребителя
	 *
	 * @param DFDocServicesConsumer заявление бытового потребителя
	 * @param claimCode код заявки из документооборота
	 * @throws NamingException
	 * @throws CreateException
	 * @throws RemoteException
	 */
	public void deleteMarkerPersonalAccount(DFDocServicesConsumer docServicesConsumer, int departmentCode) throws NamingException, RemoteException, CreateException {
		try {

			BillingServerData billingServerData = getServerDataByDepartmentCode(departmentCode);

			RecordPointController rpController = this.getReportPointController(departmentCode);
			rpController.deleteMarkerPersonalAccount(docServicesConsumer.personalAccount, docServicesConsumer.code, billingServerData.epRenCode);

		} finally {
			closeConnection();
		}
	}

	/**
	 *
	 * метод по получению кода задания-плана по коду заявления на зняття контролю
	 *
	 * @param docServicesConsumer заявление потребителя на снятие контроля
	 * @param departmentCode код подразделения
	 * @return Задание-план
	 * @throws CreateException
	 * @throws NamingException
	 * @throws RemoteException
	 * @throws PersistenceException
	 */
	public ENPlanWork getPlanByDFDocServicesConsumer(DFDocServicesConsumer docServicesConsumer, int departmentCode) throws RemoteException, NamingException, CreateException, PersistenceException {
		try {
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			RecordPointController rpController = this.getReportPointController(departmentCode);
			int planCode = rpController.getPlanCodeByClaim(docServicesConsumer.code);
			ENPlanWork plan = planDao.getObjectNOSEGR(planCode);
			if(plan == null) {
				throw new SystemException(String.format("Не знайдено план з кодом %d", planCode));
			}
			return plan;
		} finally {
			closeConnection();
		}
	}

	public DisconnectionInitiator getDisconnectionInitiatorByEIC(String eic, boolean isByt) {
		if (eic == null || eic.trim().equals("")) {
			throw new SystemException("\n\nНе заданий EIC-код точки обліку!");
		}

		try {
			CallCenterLogic ccLogic = new CallCenterLogic(connection, userProfile);
			CCRecordPoint ccRecordPoint = ccLogic.getCCRecordPointByEIC(eic, isByt, true);

			BillingServerData serverData = ccLogic.getBillingServerDataByCCRecordPoint(ccRecordPoint, true);
			if (serverData == null) {
				throw new SystemException("\n\nНе вдалося визначити дані РЕМ для точки обліку з EIC-кодом \"" + eic + "\" !");
			}

			if (ccRecordPoint.isProm == ENConsts.NO) {
				String jndi = com.ksoe.contract.ejb.RecordPointController.JNDI_NAME;
				String ejbHome = com.ksoe.contract.ejb.RecordPointControllerHome.class.getName();
				RecordPointControllerHome ejbRecordPointHome = (RecordPointControllerHome) BillingEjbCache.getHome(jndi, ejbHome,
						serverData.billingServerIp, serverData.billingServerJnpPort);
				RecordPointController recordPointController = ejbRecordPointHome.create();

				return recordPointController.getDisconnectionInitiatorByEIC(eic);
			} else {
				String jndi = com.ksoe.energypro.ejb.EPDisconnectOrderController.JNDI_NAME;
				String ejbHome = com.ksoe.energypro.ejb.EPDisconnectOrderControllerHome.class.getName();
				EPDisconnectOrderControllerHome ejbEPDisconnectOrderHome = (EPDisconnectOrderControllerHome) BillingEjbCache.getHome(jndi, ejbHome,
						serverData.billingServerIp, serverData.billingServerJnpPort);
				EPDisconnectOrderController disconnectOrderController = ejbEPDisconnectOrderHome.create();

				return disconnectOrderController.getDisconnectionInitiatorByEIC(eic);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

}
