package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.energynet.dataminer.ENAct2HumenDAO;
import com.ksoe.energynet.dataminer.ENAct2OSTableDAO;
import com.ksoe.energynet.dataminer.ENAct2SCUsageInputDAO;
import com.ksoe.energynet.dataminer.ENAct2TransportDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENCountersStateVerificationDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENGiveCounterDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENPlan2HumenDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkStateDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.FinKodIstDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCLogicDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2ENActDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2ProvDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2SCCounterDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZInfoDAO;
import com.ksoe.energynet.ejb.ENAct2ENPlanWorkController;
import com.ksoe.energynet.ejb.ENAct2ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.ENActController;
import com.ksoe.energynet.ejb.ENActControllerHome;
import com.ksoe.energynet.ejb.ENRecordPointBytController;
import com.ksoe.energynet.ejb.ENRecordPointBytControllerHome;
import com.ksoe.energynet.ejb.FINMolController;
import com.ksoe.energynet.ejb.FINMolControllerHome;
import com.ksoe.energynet.ejb.SCUsageInputController;
import com.ksoe.energynet.ejb.SCUsageInputControllerEJB.SCUsageInputAutoCreated;
import com.ksoe.energynet.ejb.SCUsageInputControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.ENAct2OSTable;
import com.ksoe.energynet.valueobject.ENAct2SCUsageInput;
import com.ksoe.energynet.valueobject.ENAct2Transport;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.RevisionSotr;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterSetupInfo;
import com.ksoe.energynet.valueobject.SCCounterSetupInfo.revisionData;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;
import com.ksoe.energynet.valueobject.SCUsageInputStatus;
import com.ksoe.energynet.valueobject.brief.ENGiveCounterShort;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort;
import com.ksoe.energynet.valueobject.brief.SCCounterDataShort;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2SCCounterShort;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZInfoShort;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2OSTableFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2TransportFilter;
import com.ksoe.energynet.valueobject.filter.ENCountersStateVerificationFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENElementFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.filter.ENPlan2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMolFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.filter.FinKodIstFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ENActFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ProvFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2OSTableShortList;
import com.ksoe.energynet.valueobject.lists.ENCountersStateVerificationShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENElementShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2RQFKOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMolShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energynet.valueobject.lists.FinKodIstShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterDataShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ENActShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ProvShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2SCCounterShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZInfoShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.fin.dataminer.SCMolDAO;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FINMolType;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.filter.SCMolFilter;
import com.ksoe.fin.valueobject.lists.SCMolShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQApprovedCostDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderDAO;
import com.ksoe.rqorder.logic.OrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQApprovedCostStatus;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQOrderItemStatus;
import com.ksoe.rqorder.valueobject.brief.RQApprovedCostShort;
import com.ksoe.rqorder.valueobject.filter.RQApprovedCostFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderFilter;
import com.ksoe.rqorder.valueobject.lists.RQApprovedCostShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrderShortList;
import com.ksoe.techcard.dataminer.TKAccountingTypeDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKFINWorkTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKFINWorkType;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.filter.TKFINWorkTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;
import com.ksoe.techcard.valueobject.lists.TKTechCardShortList;

public class SCLogic extends EnergyNetLogicModule {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private class uiiData {
		public int code;
		public String molCode;
	}

	public SCLogic(Connection connection, Connection finConnection,
			UserProfile userProfile) {
		super(connection, finConnection, userProfile);
	}


	/**
	 *
	 * Счета с которых можно устанавливать счетчики
	 *
	 * */
	private static Vector<String> accountsForCounterInstallation = new Vector<String>();
	private static String accountSettingStr = "";

	public void readAccountsFromSettings() throws PersistenceException {
		ENSettingsLogic sLogic = new ENSettingsLogic(connection, userProfile);
		String setting = sLogic.getValue(ENSettingsKeysConsts.ACCOUNTS_FOR_COUNTERS_PUT_IN_SERVICE);
		if(setting.compareTo(accountSettingStr) != 0) {
			accountsForCounterInstallation = Tools.divideOnWords(setting, ",");
			accountSettingStr = setting;
		}
	}

	// mode = 1 - установка, 0 - снятие ...
	public void chkAccount4Install(int mode, String accountIn, int isMoveZKU) throws PersistenceException {
		if (accountIn == null)
			return;
		// String acc = accountIn.substring(0, 2);

		if (isMoveZKU == 1) {
			if (!((accountIn.equals("1121")) || (accountIn.equals("1128")) || (accountIn.equals("1062")))) {
				throw new EnergyproSystemException(
						"Знімати лічильники можна тільки з рахунків 1121, 1128, 1062  ..., а не з " + accountIn);
			}
		} else {
			if (mode == 1) {
				this.readAccountsFromSettings();
				if(!accountsForCounterInstallation.contains(accountIn)) {
					new EnergyproSystemException(String.format("Встановлювати лічильники можна тільки з рахунків %s, а не з %s"
							, accountsForCounterInstallation, accountIn));
				}
			}

			if (mode == 0) {
				// if ( ! acc.equals("11"))
				if (!((accountIn.equals("1121")) || (accountIn.equals("1128")) || (accountIn.equals("1062"))  )) {
					throw new EnergyproSystemException(
							"Знімати лічильники можна тільки з рахунків 1121, 1128, 1062  ..., а не з " + accountIn);
				}

			}
		}
	}

	/**
	 *
	 * SUPP-67738 Утверждение и разутверждение плана по снятию счетчика
	 *
	 * Функция проверит по посланному в нее объекту {@link SCCounter} и если
	 * это счетчик который снимается без ввода другого счетчика в эксплуатацию
	 * , то тогда будет произведено утверждение или разутверждения такого плана
	 * без формирования акта (в зависимости от посланого параметра isClose)
	 *
	 * также SUPP-68238
	 *
	 * @param c объект {@link SCCounter} план которого нужно обработать
	 * @param isClose {@code true} - если происходит утверждение плана, {@code false} - разутверждение
	 * @throws PersistenceException
	 * @throws
	 */
	private void closeOrUnclosePlanCounterUnMount(SCCounter c, boolean isClose) throws PersistenceException {
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);
		/*SUPP-67738 Если при формировании ведомости в плане был только один выводимый счетчик,
		 * то нужно отменить утверждение этого плана */
		ENPlanWork plan = new ENPlanWork();
		plan.code = planLogic.getPlanCodeByEstimate(c.estimateItemRef.code);
		plan = planLogic.getPlanByCode(plan.code);
		if(scCounterDAO.getCounterCodeInPlan(plan, true) == Integer.MIN_VALUE) {
			ENWorkOrder workOrder = planLogic.getWorkOrderByPlanCode(plan.code);
			// SUPP-67738 Временно удаляется счетчик (потом запись будет восстановлена)
			// Для того, чтобы разутвердить план
			Integer estimateItemCode = null;
			if(isClose) {
				estimateItemCode = c.estimateItemRef.code;
				c.estimateItemRef.code = Integer.MIN_VALUE;
				scCounterDAO.save(c);
			} else {
				scCounterDAO.remove(c.code);
			}

			String errWrongStatus = String.format("Помилка у статусі для наряду № %s від %s:\n"
					+ "план з кодом %d повинен бути %s"
					, workOrder.workOrderNumber, new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen)
					, plan.code, (isClose) ? "чорновим" : "затвердженим");
			if(isClose) {
				if(plan.status.code != ENPlanWorkStatus.GOOD) {
					throw new SystemException(errWrongStatus);
				}
			} else {
				if(plan.status.code != ENPlanWorkStatus.LOCKED) {
					throw new SystemException(errWrongStatus);
				}
			}

			if(planLogic.coutEstimateResources__(plan.code) > 0) {


				throw new SystemException(String.format("На плані лише по зняттю лічильника не повинно бути жодного матеріалу."
						+ "\n Обнуліть усі нормативні матеріали, які не використовуються!"
						+ "\n Наряд № %s від %s, сис. код плану: %d."
						, workOrder.workOrderNumber, new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen), plan.code));
			}

			try {
				if(isClose) {
					planLogic.closePlan(plan.code, ENConsts.isClient_SERVER);
				} else {
					planLogic.openPlan(plan.code, ENConsts.isClient_SERVER);
				}
			} catch(DatasourceConnectException e) {
				throw new SystemException(e);
			}


			if(isClose) {
				c.estimateItemRef.code = estimateItemCode;
				scCounterDAO.save(c);
			} else {
				scCounterDAO.add(c);
			}
		}
	}

	public void undoFillUsageInput(int usageInputCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {
		undoFillUsageInput(usageInputCode, Integer.MIN_VALUE);
	}

	public void undoFillUsageInput(int usageInputCode, int actCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {

		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);
		SCUsageInputItemOZInfoDAO ozInfoDAO = new SCUsageInputItemOZInfoDAO(connection, userProfile);
		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		if (ui.statusRef.code != SCUsageInputStatus.FILLED) {
			throw new EnergyproSystemException("Невірний статус ...");
		}

		// ------------------------
		Context context = new InitialContext();
		Object objRef = context.lookup(ENActController.JNDI_NAME);
		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
				ENActControllerHome.class);
		ENActController actController = actHome.create();

		// ---------------------------

		SCUsageInputItemFilter iiFilter = new SCUsageInputItemFilter();
		iiFilter.usageInputRef.code = usageInputCode;
		int[] iiArr = uiiDAO.getFilteredCodeArray(iiFilter, 0, -1);
		for (int i = 0; i < iiArr.length; i++) {
			SCUsageInputItem uii = uiiDAO.getObject(iiArr[i]);
			SCUsageInputItemOZFilter iioFilter = new SCUsageInputItemOZFilter();
			iioFilter.usageInputItemRef.code = iiArr[i];
			int[] iioArr = ozDAO.getFilteredCodeArray(iioFilter, 0, -1);
			for (int j = 0; j < iioArr.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
				o2cFilter.ozRef.code = iioArr[j];
				SCUsageInputItemOZ2SCCounterShortList o2cList = ii2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
				for (int k = 0; k < o2cList.totalCount; k++) {
					ii2cDAO.remove(o2cList.get(k).code);
					SCCounter c = scCounterDAO.getObject(o2cList.get(k).scCounterRefCode);
					c.statusRef.code = SCCounterStatus.GOOD;

					// передернуть стоимость ...
					if (c.invNumber != null) {
						boolean isException = true;
						if (userProfile.userName.equalsIgnoreCase("energynet")) {
							isException = false;
						}

						ENMetrologyCounterShort mc = getCounterInSC(c.scCode, c.invNumber, isException);
						if (mc != null) {
							c.cost = mc.cost;
						}
					}
					scCounterDAO.save(c);

					if(uii.kindRef.code == SCUsageInputItemKind.UsageOut) {
						/*SUPP-67738 Если при формировании ведомости в плане был только один выводимый счетчик,
						 * то нужно отменить утверждение этого плана */
						this.closeOrUnclosePlanCounterUnMount(c, false);
					}
				}



				// вынесим связки с актами ...
				SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
				o2aFilter.usageInputItemOZRef.code = iioArr[j];
				SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
				for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {
					o2aDAO.remove(o2aList.get(o2a).code);

					if (actCode != Integer.MIN_VALUE) {
						ENAct2SCUsageInputDAO act2ozDao = new ENAct2SCUsageInputDAO(userProfile, connection);

						ENAct2SCUsageInputFilter act2ozFilter = new ENAct2SCUsageInputFilter();
						act2ozFilter.actRef.code = actCode;

						int act2ozArr[] = act2ozDao.getFilteredCodeArray(act2ozFilter, 0, -1);
						for (int g = 0; g < act2ozArr.length; g++) {
							act2ozDao.remove(act2ozArr[g]);
						}
					} else {
						// вынесем акт ...
						actController.remove(o2aList.get(o2a).enActRefCode, ENConsts.isClient_SCCOUNTER);
					}
				}

				// доп инфо тоже заборт
				ozInfoDAO.removeByOZCode(iioArr[j]);

				ozDAO.remove(iioArr[j]);
			}
			uiiDAO.remove(iiArr[i]);
		}

		ui.statusRef.code = SCUsageInputStatus.GOOD;
		uiDAO.save(ui);

		if (actCode != Integer.MIN_VALUE) {
			uiDAO.remove(usageInputCode);
		}
	}

	public void undoFillUsageInputZKU(int usageInputCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);
		SCUsageInputItemOZInfoDAO ozInfoDAO = new SCUsageInputItemOZInfoDAO(connection, userProfile);

		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		if (ui.statusRef.code != SCUsageInputStatus.FILLED) {
			throw new EnergyproSystemException("Невірний статус ...");
		}

		// ------------------------
		Context context = new InitialContext();
		Object objRef = context.lookup(ENActController.JNDI_NAME);
		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
				ENActControllerHome.class);
		ENActController actController = actHome.create();
		// ---------------------------

		SCUsageInputItemFilter iiFilter = new SCUsageInputItemFilter();
		iiFilter.usageInputRef.code = usageInputCode;
		iiFilter.conditionSQL = "scusageinputitem.kindrefcode not in (4,5) ";
		int[] iiArr = uiiDAO.getFilteredCodeArray(iiFilter, 0, -1);
		for (int i = 0; i < iiArr.length; i++) {
			SCUsageInputItemOZFilter iioFilter = new SCUsageInputItemOZFilter();
			iioFilter.usageInputItemRef.code = iiArr[i];
			iioFilter.conditionSQL = "scusageinputitemoz.usageinputitemrefcode in (select ui.code from scusageinputitem ui where ui.kindrefcode not in (4,5)) ";
			int[] iioArr = ozDAO.getFilteredCodeArray(iioFilter, 0, -1);
			for (int j = 0; j < iioArr.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
				o2cFilter.ozRef.code = iioArr[j];
				SCUsageInputItemOZ2SCCounterShortList o2cList = ii2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
				for (int k = 0; k < o2cList.totalCount; k++) {
					ii2cDAO.remove(o2cList.get(k).code);
					SCCounter c = scCounterDAO.getObject(o2cList.get(k).scCounterRefCode);
					c.statusRef.code = SCCounterStatus.GOOD;

					// передернуть стоимость ...
					if (c.invNumber != null) {
						ENMetrologyCounterShort mc = getCounterInSC(c.scCode, c.invNumber, true);
						c.cost = mc.cost;
					}

					scCounterDAO.save(c);
				}

				// вынесим связки с актами ...
				SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
				o2aFilter.usageInputItemOZRef.code = iioArr[j];
				SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
				for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {
					o2aDAO.remove(o2aList.get(o2a).code);
					// вынесем акт ...
					actController.remove(o2aList.get(o2a).enActRefCode, ENConsts.isClient_SCCOUNTER);

				}

				// доп инфо тоже заборт
				ozInfoDAO.removeByOZCode(iioArr[j]);

				ozDAO.remove(iioArr[j]);

			}
			uiiDAO.remove(iiArr[i]);
		}

	}

	public void undoFillUsageInputOnlyZKU(int usageInputCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);
		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		// ------------------------
		Context context = new InitialContext();
		Object objRef = context.lookup(ENActController.JNDI_NAME);
		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
				ENActControllerHome.class);
		ENActController actController = actHome.create();
		// ---------------------------

		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

		SCUsageInputItemFilter iiFilter = new SCUsageInputItemFilter();
		iiFilter.usageInputRef.code = usageInputCode;
		iiFilter.conditionSQL = "scusageinputitem.kindrefcode in (4,5)";
		int[] iiArr = uiiDAO.getFilteredCodeArray(iiFilter, 0, -1);
		SCUsageInputItem uiiObj;

		for (int i = 0; i < iiArr.length; i++) {
			uiiObj = uiiDAO.getObject(iiArr[i]);
			SCUsageInputItemOZFilter iioFilter = new SCUsageInputItemOZFilter();
			iioFilter.usageInputItemRef.code = iiArr[i];
			iioFilter.conditionSQL = "scusageinputitemoz.usageinputitemrefcode in (select ui.code from scusageinputitem ui where ui.kindrefcode in (4,5)) ";
			int[] iioArr = ozDAO.getFilteredCodeArray(iioFilter, 0, -1);

			for (int j = 0; j < iioArr.length; j++) {

				SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
				o2cFilter.ozRef.code = iioArr[j];
				SCUsageInputItemOZ2SCCounterShortList o2cList = ii2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
				for (int k = 0; k < o2cList.totalCount; k++) {
					SCCounter c = scCounterDAO.getObject(o2cList.get(k).scCounterRefCode);

					ii2cDAO.remove(o2cList.get(k).code);
					// передернуть стоимость ...
					if (c.sccodezku > 0) {
						// cnt.costzku_b=scShort.costzku;
						if (uiiObj.kindRef.code == SCUsageInputItemKind.UsageInputZKU) // Новое
																						// зку
						{
							scLogicDAO.untransferCounterMountInSCZKU(c.sccodezku);
						} else {
							c.costzku = c.costzku_b;
						}

					} else {
						c.costzku = new BigDecimal(0);
						c.costzku_b = new BigDecimal(0);
					}
					c.statusRef.code = SCCounterStatus.GOOD;

					scCounterDAO.save(c);
				}

				// вынесим связки с актами ...
				SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
				o2aFilter.usageInputItemOZRef.code = iioArr[j];
				SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
				for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {
					o2aDAO.remove(o2aList.get(o2a).code);

					// вынесем акт ...
					actController.remove(o2aList.get(o2a).enActRefCode, ENConsts.isClient_SCCOUNTER);

				}

				ozDAO.remove(iioArr[j]);
			}
			uiiDAO.remove(iiArr[i]);
		}

		ui.statusRef.code = SCUsageInputStatus.GOOD;
		uiDAO.save(ui);

	}

	public void fillUsageInput(int usageInputCode)
			throws RemoteException, PersistenceException, NamingException, CreateException {
		fillUsageInput(usageInputCode, Integer.MIN_VALUE);
	}

	public void fillUsageInput(int usageInputCode, int actCode)
			throws PersistenceException, RemoteException, NamingException, CreateException {

		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		ENActDAO actDAO = new ENActDAO(connection, userProfile);
		ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);

		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		if (ui.statusRef.code != SCUsageInputStatus.GOOD) {
			throw new EnergyproSystemException("\n\n " + "Невірний статус ...");
		}

		/**
		 * SUPP-32675... 22.04.2015 +++ при вводе в эксплуатацию счетчиков,
		 * установленных по договорам услуг (многотарифный счетчик), затраты по
		 * монтажу не включаем в стоимость счетчика....
		 *
		 * если код акта не MIN_VALUE - значит вызов для услуг по замене
		 * счетчика
		 */
		boolean countersServices = false;
		if (actCode != Integer.MIN_VALUE) {
			countersServices = true;
		}

		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);
		SCUsageInputItemOZ2ENActDAO oz2actDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		Vector<Integer> invoice = new Vector<Integer>();
		invoice.add(0, null);
		invoice.add(1, null);

		Vector<uiiData> invoiceOut = new Vector<uiiData>();

		// ------------------------
		Context context = new InitialContext();
		Object objAct2PlanRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
		ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
				.narrow(objAct2PlanRef, ENAct2ENPlanWorkControllerHome.class);
		ENAct2ENPlanWorkController act2planController = act2planHome.create();

		Object objFINMolRef = context.lookup(FINMolController.JNDI_NAME);
		FINMolControllerHome finMOLHome = (FINMolControllerHome) PortableRemoteObject.narrow(objFINMolRef,
				FINMolControllerHome.class);
		FINMolController finMolController = finMOLHome.create();
		// ---------------------------

		ActLogic actLogic = new ActLogic(connection, userProfile);

		Vector<SCCounterDataShort> oz = new Vector<SCCounterDataShort>();
		// сняли счетчики ОЕ
		SCCounterDataShortList counterDataList = scCounterDAO.getData4filling(ui.molCodeCounter, ui.dateStart,
				ui.dateFinal, true, actCode);


		int docCount = 0;
		docCount = counterDataList.totalCount;

		// проверим подразделения и молов
		// мож еще что ...

		// 21.01.2020 убрана проверка проверявшая МОЛ разнарядки и МОЛ демонтируемого счетчика
		// после совещания с коммерческой дирекцией

		String priconnDoc;
		Date priconnDate;

		//SUPP-67738 Добавление к списку на установку счетчиков абонентов
		counterDataList.list.addAll(scCounterDAO.getData4filling(ui.molCodeCounter, ui.dateStart,
				ui.dateFinal, false, actCode).list);
		// SUPP-67738 Только необходимо убрать счетчики абонентов которые демонтажем приходуются в РЭС
		Vector<SCCounterDataShort> vecCounterData = new Vector<SCCounterDataShort>();
		for(SCCounterDataShort scData : counterDataList.list) {
			if(scData.usageItemKind != SCUsageInputItemKind.InputUsing) {
				vecCounterData.add(scData);
			}
		}
		counterDataList.list = vecCounterData;
		counterDataList.totalCount = counterDataList.list.size();
		docCount = counterDataList.totalCount;

		for (SCCounterDataShort scShort : counterDataList.list) {

			priconnDoc = null;
			priconnDate = null;
			int actCode_ = Integer.MIN_VALUE;

			// SUPP-61275 Бывает, что попадаются уже счетчики с актом, из-за которых
			// далее возникают ошибки так просто пропускать их нельзя - нужно каждый случай
			// разбирать отдельно.
			if (scShort.actCode != Integer.MIN_VALUE
					/** 14.04.2017... +++ для услуг со счетчиком код акта всегда есть */
					&& !countersServices) {
				throw new SystemException(String.format("Для лічильника інв. № %s (план з кодом %d) вже складений акт"
						, scShort.invNumber, scShort.planRefCode));
			}

				if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {
					if (scShort.actCode == Integer.MIN_VALUE) {
						ENAct act = new ENAct();
						act.dateGen = ui.dateGen;
						act.dateAct = ui.dateGen;

						ENTechCond2PlanWorkDAO tc2pwDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
						ENTechCond2PlanWorkFilter tc2pwFilter = new ENTechCond2PlanWorkFilter();
						tc2pwFilter.planRef.code = scShort.planRefCode;
						ENTechCond2PlanWorkShortList tc2pwList = tc2pwDAO.getScrollableFilteredList(tc2pwFilter, 0, -1);

						if (tc2pwList.totalCount > 0) {
							ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(connection,
									userProfile);
							ENTechConditionsServicesFilter tcServicesFilter = new ENTechConditionsServicesFilter();
							tcServicesFilter.code = tc2pwList.get(0).techConServicesRefCode;
							ENTechConditionsServicesShortList tcServicesList = tcServicesDAO
									.getScrollableFilteredListWITHOUT_SEGR(tcServicesFilter, null, null, 0, 1, null);
							act.numberGen = tcServicesList.get(0).contractNumber;
							priconnDoc = tcServicesList.get(0).contractNumber;
							priconnDate = tcServicesList.get(0).contractDate;
						} else {
							// SUPP-61275 20.11.2017 Если не счетчик абонента, тогда номер акта формируется
							// как и раньше (инв. номер / номер подразделения)
							// если счетчик абонента (т.е. тот у которого нет инвентарного номера
							// тогда формируется: заводской / номер подразделения
							if(scShort.invNumber != null && scShort.invNumber.length() > 0) {
								act.numberGen = scShort.invNumber + "/" + mol2podr(ui.molCode);
							} else {
								if(scShort.buildNumber != null && scShort.buildNumber.length() > 0) {
									act.numberGen = (scShort.buildNumber.length() < 6) ? scShort.buildNumber
											: scShort.buildNumber.substring(0, 6) + "/" + mol2podr(ui.molCode);
								} else {
									act.numberGen = (String.valueOf(scShort.code).length() < 6) ? String.valueOf(scShort.code)
											: String.valueOf(scShort.code).substring(0, 6) + "/" + mol2podr(ui.molCode);
								}
							}
						}

						act.element.code = scShort.planElementRefCode;
						act.actTypeRef.code = scShort.planStateRefCode;
						act.commentGen = "Авто из ОЗ № " + ui.numberDoc;
						act.statusRef.code = ENActStatus.GOOD;
						// накинем ИНВ. счетчика ...
						act.invNumber = scShort.invNumber;
						actCode_ = actDAO.add(act);
						// данные МОЛа ...
						// свяжем с акт с планом

						// связка акта и плана
						ENAct2ENPlanWork a2p = new ENAct2ENPlanWork();
						a2p.actRef.code = actCode_;
						a2p.plan.code = scShort.planRefCode;

						System.out.println("clcAct " + userProfile.userName + " planRef = " + scShort.planRefCode);

						act2planController.add(a2p, ENConsts.isClient_SCCOUNTER);
					} else {
						actCode_ = scShort.actCode;
					}

					// расчет актов уехал в самый конец...
					// пересчитаем акт !!!
					// actLogic.fillActData(actCode_, false);
				}

			scShort.actCode = actCode_;

			if (priconnDoc != null) {
				SCCounter cnt = scCounterDAO.getObject(scShort.code);
				cnt.priconndoc = priconnDoc;
				cnt.priconndate = priconnDate;
				scCounterDAO.save(cnt);
			}

			SCCounterDataShort scDataNew = scShort;
			if (scDataNew.usageItemKind == SCUsageInputItemKind.UsageInput) {

				if (actCode != Integer.MIN_VALUE) {
					scDataNew.actCode = actCode;
				}

				if (scDataNew.actCode == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("\n\n " + "Акт не знайдено ... переформуйте строки ...");
				}
			}

			// разбивка на ОЗ
			if (scDataNew.usageItemKind == 1) {
				if (invoice.get(0) == null)
					invoice.set(0, new Integer(1));
			}

			if (scDataNew.usageItemKind == 2) {
				if (invoice.get(1) == null)
					invoice.set(1, new Integer(2));

				//
				int uii = getInUII(scDataNew.molCode, invoiceOut);
				if (uii == Integer.MIN_VALUE) {
					uiiData uii_ = new uiiData();
					uii_.molCode = scDataNew.molCode;
					uii_.code = Integer.MIN_VALUE;
					invoiceOut.add(uii_);
				}
			}

			int ozCode = getInOZ(scDataNew, oz);
			if (ozCode == Integer.MIN_VALUE) {
				scDataNew.ozCode = oz.size() + 1;
				scDataNew.ozCount = 1;
				// scShort.molCode =
				oz.add(scDataNew);
			} else {
				SCCounterDataShort scShort1 = (SCCounterDataShort) oz.get(ozCode);
				scShort1.ozCount++;
				oz.set(ozCode, scShort1);
			}
		}
		///// end 1 /////

		// ввод в Экспл
		int itemIn = Integer.MIN_VALUE;
		if (invoice.get(0) != null) {
			SCUsageInputItem item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.UsageInput;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0; // пока 0 .. по хорошему вкинуть реальное кол-во
								// или обнвить потом
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
			item.scCode = Integer.MIN_VALUE;
			//////////
			item.molCode = ui.molCode;
			item.molName = ui.molName;
			///////////
			itemIn = uiiDAO.add(item);
		}

		// вывод из Экспл
		// сделаем отдельно .. для нескольких молов
		int itemOut = Integer.MIN_VALUE;
		if (invoice.get(1) != null) {

			for (int i = 0; i < counterDataList.totalCount; i++) {
				SCCounterDataShort scShort = counterDataList.get(i);
				if (scShort.usageItemKind == SCUsageInputItemKind.UsageOut) {

					for (int ww = 0; ww < invoiceOut.size(); ww++) {

						//////////////////
						int uu = getInUII(scShort.molCode, invoiceOut);
						if (uu == Integer.MIN_VALUE) {
							throw new EnergyproSystemException("gluk in getInUII" + scShort.molCode);
						}
						uiiData uii__ = ((uiiData) invoiceOut.get(uu));

						if (uii__.code == Integer.MIN_VALUE) {
							SCUsageInputItem item = new SCUsageInputItem();
							item.kindRef.code = SCUsageInputItemKind.UsageOut;
							item.usageInputRef.code = usageInputCode;
							item.countGen = 0; // пока 0 .. по хорошему вкинуть
												// реальное кол-во или обнвить
												// потом
							item.numberInt = uiiDAO._collectAutoIncrementNumber();
							item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
							item.scCode = Integer.MIN_VALUE;

							if (ui.molCode.equals(scShort.molCode)) {
								item.molName = ui.molName;
							} else {
								FINMolFilter finMOLFilter = new FINMolFilter();
								finMOLFilter.id = uii__.molCode;
								finMOLFilter.state = 1; // только работающие ...
								FINMolShortList finMOLList = finMolController.getScrollableFilteredList(finMOLFilter, 0,
										-1);

								if (finMOLList.totalCount != 1)
									throw new EnergyproSystemException("\n\n" + "Кількість працючих МВО ("
											+ uii__.molCode + ") не дорівнює 1 ... кількість " + finMOLList.totalCount);

								item.molName = finMOLList.get(0).text; // вытянуть
																		// из ФК
																		// ...
							}
							item.molCode = uii__.molCode;
							/////////////////
							itemOut = uiiDAO.add(item);
							uii__.code = itemOut;
							invoiceOut.set(uu, uii__);
						}
					}
				}
			}
		}

		for (int i = 0; i < oz.size(); i++) {
			SCCounterDataShort scShort = oz.get(i);
			SCUsageInputItemOZ ozz = new SCUsageInputItemOZ();

			ozz.numberInt = ozDAO._collectAutoIncrementNumber__();
			ozz.numberDoc = "" + ozz.numberInt + "/" + mol2podr(ui.molCode);
			ozz.account = scShort.account;
			// ozz.cost = scShort.cost;
			ozz.counterType = scShort.name; // бух тип в СККоунтре в НАМЕ .. а
											// билинговый в коунтерТайп
			ozz.countGen = scShort.ozCount;

			ozz.budgetRef.code = scShort.budgetRefCode;

			if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput)
				ozz.usageInputItemRef.code = itemIn;
			else if (scShort.usageItemKind == SCUsageInputItemKind.UsageOut) {
				int uu = getInUII(scShort.molCode, invoiceOut);
				if (uu == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("gluk in getInUII" + scShort.molCode);
				}
				uiiData uii__ = ((uiiData) invoiceOut.get(uu));
				ozz.usageInputItemRef.code = uii__.code;
				// а тут еще НЕТ счетчиков .. перенесем выше ...
				// типа не совпадают РЭСы у тех кто поставил и кто снял ;)
				/*
				 * if ( ! mol2podr(ui.molCode).equals(mol2podr(uii__.molCode))){
				 * //if ( ! scShort.molCode.equals((uii__.molCode))){ throw new
				 * EnergyproSystemException(
				 * "Не співпадають підрозділи у того, хто встановив лічильник ("
				 * + mol2podr(ui.molCode) + ") і у того хто його знімає (" +
				 * mol2podr(uii__.molCode) + ")... сер № " +
				 * scShort.buildNumber); }
				 */
			} else
				throw new EnergyproSystemException(
						"\n\n " + "Unknown scShort.usageItemKind... code = " + scShort.usageItemKind);

			ozz.code = ozDAO.add(ozz);

			// выше добавили и перезалили акты ... лист поменялся !!!!
			// docCount = counterDataList.totalCount;
			// counterDataList = scCounterDAO.getData4filling(ui.molCodeCounter,
			// ui.dateStart, ui.dateFinal, 1);

			String ozAccount = (scShort.account == null) ? "" : scShort.account;
			String ozMolCode = (scShort.molCode == null) ? "" : scShort.molCode;

			for (SCCounterDataShort sc : counterDataList.list) {

				String scCounterAccount = (sc.account == null) ? "" : sc.account;
				String scCounterMolCode = (sc.molCode == null) ? "" : sc.molCode;

				if ((scCounterAccount.equals(ozAccount)) &&
				(scCounterMolCode.equals(ozMolCode))
				&& sc.budgetRefCode == scShort.budgetRefCode) {
					// типа наш клиент (совпало счет + цена + тип)
					SCUsageInputItemOZ2SCCounter ii2c = new SCUsageInputItemOZ2SCCounter();
					ii2c.ozRef.code = ozz.code;
					ii2c.scCounterRef.code = sc.code;
					ii2cDAO.add(ii2c);

					// обновим статус ...
					SCCounter cnt = scCounterDAO.getObject(sc.code);
					cnt.statusRef.code = SCCounterStatus.IN_ACT;
					scCounterDAO.save(cnt);

					// свяжем акт с ОЗ
					if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {
						if (sc.actCode <= 0) {
							ENPlanWork plan = planDao.getObject(scShort.planRefCode);
							if (plan.typeRef.code != ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU && 
									plan.typeRef.code != ENPlanWorkType.EZ_CHANGE_ZKU &&
									plan.typeRef.code != ENPlanWorkType.EZ_SETUP_ZKU) {
								throw new SystemException("\n\nПомилка зв'язку ОЗ з актом (не вдалося визначити код акту)!\n" +
										"Перевірте коректність складання плану (можливо, один і той самий лічильник прив'язаний у плані " +
										"і як встановлений, і як знятий).\n" +
										"Для таких планів підвид робіт має бути: \"ЕЗ - Установка ЗКУ\", " +
										"\"ЕЗ - Установка ЗКУ с заменой(переносом) счетчика\" або \"ЕЗ - Замена счетчика в составе ЗКУ\".\n" +
										"Код плану: " + scShort.planRefCode);
							}
						}
						SCUsageInputItemOZ2ENAct oz2act = new SCUsageInputItemOZ2ENAct();
						oz2act.usageInputItemOZRef.code = ozz.code;
						oz2act.enActRef.code = sc.actCode;
						oz2actDAO.add(oz2act);
					}

					if(scShort.usageItemKind == SCUsageInputItemKind.UsageOut) {
						// SUPP-67738 Если счетчик только снимается, то план по снятию счетчика
						// утверждается без акта
						this.closeOrUnclosePlanCounterUnMount(cnt, true);
					}
				}
			}
		}

		// пересохраним общее кол-во в ОЗ
		SCUsageInputItemFilter iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		int[] iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			int iiCount = 0;
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			ozFilter1.usageInputItemRef.code = iiArr1[i];

			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);

			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter ii2ozFilter = new SCUsageInputItemOZ2SCCounterFilter();
				ii2ozFilter.ozRef.code = ozArr1[j];
				int[] scArr = ii2cDAO.getFilteredCodeArray(ii2ozFilter, 0, -1);
				SCUsageInputItemOZ oz1 = ozDAO.getObject(ozArr1[j]);
				oz1.countGen = scArr.length;
				iiCount = iiCount + scArr.length;
				ozDAO.save(oz1);
			}

			SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ii.countGen = iiCount;
			uiiDAO.save(ii);
		}

		// счетчики абонов ....
		SCCounterDataShortList abCounterDataList = scCounterDAO.getData4filling(ui.molCodeCounter, ui.dateStart,
				ui.dateFinal, false, actCode);

		// SUPP-67738 Отбор только тех счетчиков, которые попали как
		// на приходование и передачу, а не на ввод в эксплуатацию
		Vector<SCCounterDataShort> abCounterDataVec = new Vector<SCCounterDataShort>();
		for(SCCounterDataShort scShortAb : abCounterDataList.list) {
			if(scShortAb.usageItemKind == SCUsageInputItemKind.InputUsing) {
				abCounterDataVec.add(scShortAb);
			}
		}
		String buhName = "";
		String actInvitationNumber = "";
		int budgetRefCode = Integer.MIN_VALUE;
		int ozCode = Integer.MIN_VALUE;
		if (abCounterDataVec.size() > 0) {

			SCUsageInputItem item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.InputUsing;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0;// abCounterDataList.totalCount;
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);

			item.molCode = ui.molCode;
			item.molName = ui.molName;

			item.scCode = Integer.MIN_VALUE;
			item.code = uiiDAO.add(item);

			for (SCCounterDataShort sc2 : abCounterDataVec) {

				/*SUPP-58999
				 * Для тех счетчиков где задан акт приглашения (на экспертизу?) будут формироваться
				 * отдельные ОЗшки так как в информации для этих ОЗ будет выбираться другой бухгалтерский счет
				 * */
				if (!buhName.trim().equals(sc2.name.trim())
						|| budgetRefCode != sc2.budgetRefCode
						|| !actInvitationNumber.equals((sc2.actInvitationNumber == null) ? "" : sc2.actInvitationNumber)) {

					actInvitationNumber = (sc2.actInvitationNumber == null) ? "" : sc2.actInvitationNumber;
					buhName = sc2.name.trim();
					budgetRefCode = sc2.budgetRefCode;
					SCUsageInputItemOZ ozz = new SCUsageInputItemOZ();

					ozz.numberInt = ozDAO._collectAutoIncrementNumber__();
					ozz.numberDoc = "" + ozz.numberInt + "/" + mol2podr(ui.molCode);
					ozz.account = null;
					ozz.cost = null;
					ozz.budgetRef.code = budgetRefCode;
					ozz.counterType = buhName;
					ozz.countGen = 0; // abCounterDataList.totalCount;
					ozz.usageInputItemRef.code = item.code;
					ozCode = ozDAO.add(ozz);
				}

				SCUsageInputItemOZ2SCCounter ii2c = new SCUsageInputItemOZ2SCCounter();
				ii2c.ozRef.code = ozCode;
				ii2c.scCounterRef.code = sc2.code;
				ii2cDAO.add(ii2c);

				// обновим статус ...
				SCCounter cnt = scCounterDAO.getObject(sc2.code);
				cnt.statusRef.code = SCCounterStatus.IN_ACT;
				scCounterDAO.save(cnt);
			}
		}

		// пересохраним общее кол-во в ОЗ
		iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		iiFilter1.kindRef.code = SCUsageInputItemKind.InputUsing;
		iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			int iiCount = 0;
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			ozFilter1.usageInputItemRef.code = iiArr1[i];

			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter ii2ozFilter = new SCUsageInputItemOZ2SCCounterFilter();
				ii2ozFilter.ozRef.code = ozArr1[j];
				int[] scArr = ii2cDAO.getFilteredCodeArray(ii2ozFilter, 0, -1);
				SCUsageInputItemOZ oz1 = ozDAO.getObject(ozArr1[j]);
				oz1.countGen = scArr.length;
				iiCount = iiCount + scArr.length;
				ozDAO.save(oz1);
			}

			SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ii.countGen = iiCount;
			uiiDAO.save(ii);
		}

		if ((docCount == 0) && (abCounterDataList.totalCount == 0)) {
			throw new EnergyproSystemException("\n\n" + "Немає лічильників для формування документів!");
		}

		// перекинем статусы Актов, что бы они не перерасчитывали время ...
		// уже это в ФИЛЛ акте ...

		iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		iiFilter1.kindRef.code = SCUsageInputItemKind.UsageInput;
		iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			ozFilter1.usageInputItemRef.code = iiArr1[i];
			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);

			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2ENActFilter oz2actFilter = new SCUsageInputItemOZ2ENActFilter();
				oz2actFilter.usageInputItemOZRef.code = ozArr1[j];
				SCUsageInputItemOZ2ENActShortList oz2aList = oz2actDAO.getScrollableFilteredList(oz2actFilter, 0, -1);
				for (int aa = 0; aa < oz2aList.totalCount; aa++) {
					ENAct act__ = actDAO.getObject(oz2aList.get(aa).enActRefCode);

					/**
					 * если код акта не MIN_VALUE - значит вызов для услуг по
					 * замене счетчика
					 */
					if (actCode != Integer.MIN_VALUE) {

						/** расчет акта и перевед на подписания */
						actLogic.fillActData(act__.code, true);

						/** расчет фактически затрат по договору */
						ServicesLogic sLogic = new ServicesLogic(connection, userProfile);
						ENServicesObject servicesObject = sLogic.getServicesObjectByElementCode(act__.element.code);

						servicesObject.contractServicesSumma = sLogic.recalcServicesFactCalc(servicesObject, false,
								false);

						/** проверка рентабельности по договору */
						if(servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION) {
							sLogic.validateProfitability(servicesObject);
						}

					} else {
						actLogic.fillActData(act__.code, true);
						/**
						 * Расчет отчислений с з/п для акта выполненных работ
						 */
						actLogic.calculateSalaryCharges(act__.code);
					}
				}
			}
		}

		/**
		 * SUPP-32675... 22.04.2015 +++ при вводе в эксплуатацию счетчиков,
		 * установленных по договорам услуг (многотарифный счетчик), затраты по
		 * монтажу не включаем в стоимость счетчика....
		 *
		 */
		if (!countersServices) {
			/**
			 * SUPP-32230... +++ 07.04.2015....
			 *
			 * после формирования строк и расчета актов, для ввода в
			 * эксплуатацию увеличиваем счтоимость счетчика
			 *
			 */
			for (SCCounterDataShort scDataNew : counterDataList.list) {
				if (scDataNew.usageItemKind == SCUsageInputItemKind.UsageInput) {

					SCCounter cnt = scCounterDAO.getObject(scDataNew.code);

					SCCounterSetupInfo rpData__ = counterInstallPlace(cnt.estimateItemRef.code, true);

					//SUPP-67738 Стоимость счетчика абонента не увеличивается
					if(cnt.invNumber != null && cnt.invNumber.trim().length() > 0) {
						scDataNew.cost = scDataNew.cost.add(rpData__.actSumGen).setScale(2, BigDecimal.ROUND_HALF_UP);
						cnt.cost = cnt.cost.add(rpData__.actSumGen);
						scCounterDAO.save(cnt);
					}


				}
			}
		}

		ui.statusRef.code = SCUsageInputStatus.FILLED;
		uiDAO.save(ui);
	}

	public void fillUsageInputZKU(int usageInputCode)
			throws PersistenceException, RemoteException, NamingException, CreateException {

		// int www = 0;
		// if (www == 0){
		// throw new EnergyproSystemException("Эта функция будет доступна
		// немного позже ... через пару часов ...");
		// }

		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);

		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);

		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		ENActDAO actDAO = new ENActDAO(connection, userProfile);

		if (ui.statusRef.code != SCUsageInputStatus.GOOD) {
			throw new EnergyproSystemException("Невірний статус ...");
		}

		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

		SCUsageInputItemOZ2ENActDAO oz2actDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		Vector<Integer> invoice = new Vector<Integer>();
		invoice.add(0, null);
		invoice.add(1, null);

		Vector<uiiData> invoiceOut = new Vector<uiiData>();

		// ------------------------
		Context context = new InitialContext();
		Object objAct2PlanRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
		ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
				.narrow(objAct2PlanRef, ENAct2ENPlanWorkControllerHome.class);
		ENAct2ENPlanWorkController act2planController = act2planHome.create();

		Object objFINMolRef = context.lookup(FINMolController.JNDI_NAME);
		FINMolControllerHome finMOLHome = (FINMolControllerHome) PortableRemoteObject.narrow(objFINMolRef,
				FINMolControllerHome.class);
		FINMolController finMolController = finMOLHome.create();
		// ---------------------------

		ActLogic actLogic = new ActLogic(connection, userProfile);

		Vector<SCCounterDataShort> oz = new Vector<SCCounterDataShort>();
		// сняли счетчики ОЕ
		SCCounterDataShortList counterDataList = scCounterDAO.getData4fillingZKU(ui.molCodeCounter, ui.dateStart,
				ui.dateFinal, 1);

		int docCount = 0;
		docCount = counterDataList.totalCount;

		/// Добавляются счетчики абонентов, которые установлены в ЗКУ
		/*SCCounterDataShortList counterDataListAbon = scCounterDAO.getData4fillingZKUAbon(ui.molCodeCounter,
				ui.dateStart, ui.dateFinal, 0);

		Vector<SCCounterDataShort> vecCounterDataListAbon = new Vector<SCCounterDataShort>();
		for(SCCounterDataShort cou : counterDataListAbon.list) {
			if(cou.invNumber == null && cou.isChangeInZKU == 1) {
				vecCounterDataListAbon.add(cou);
			}
		}

		counterDataList.list.addAll(vecCounterDataListAbon);
		counterDataList.totalCount = counterDataList.size();*/

		// проверим подразделения и молов
		// мож еще что ...

		String priconnDoc;
		Date priconnDate;

		SCCounterDataShortList counterDataListAbon = scCounterDAO.getData4fillingZKUAbon(ui.molCodeCounter,
				ui.dateStart, ui.dateFinal, 0);
		Vector<SCCounterDataShort> vecCounterDataAbon = new Vector<SCCounterDataShort>();
		for(SCCounterDataShort scData : counterDataListAbon.list) {
			if(scData.usageItemKind != SCUsageInputItemKind.InputUsing
					&& /*SUPP-71154*/ scData.usageItemKind != Integer.MIN_VALUE
					&& scData.isChangeInZKU != 0) {
				vecCounterDataAbon.add(scData);
			}
		}

		counterDataList.list.addAll(vecCounterDataAbon);
		counterDataList.totalCount = counterDataList.list.size();

		for (int i = 0; i < counterDataList.totalCount; i++) {
			SCCounterDataShort scShort = counterDataList.get(i);
			priconnDoc = null;
			priconnDate = null;

			if (scShort.actCode == Integer.MIN_VALUE) {
				// скреатим АКТ .. и свяжем с планом ... + пересчет
				// throw new EnergyproSystemException("Наряд № " +
				// counterDataList.get(i).workOrderNumber + " не включено до
				// Акту на списання ТМЦ");

				if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {
					int actCode_ = Integer.MIN_VALUE;
					if (scShort.actCode == Integer.MIN_VALUE) {

						ENAct act = new ENAct();
						act.dateGen = ui.dateGen;
						act.dateAct = ui.dateGen;

						ENTechCond2PlanWorkDAO tc2pwDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
						ENTechCond2PlanWorkFilter tc2pwFilter = new ENTechCond2PlanWorkFilter();
						tc2pwFilter.planRef.code = scShort.planRefCode;
						ENTechCond2PlanWorkShortList tc2pwList = tc2pwDAO.getScrollableFilteredList(tc2pwFilter, 0, -1);

						if (tc2pwList.totalCount > 0) {
							ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(connection,
									userProfile);
							ENTechConditionsServicesFilter tcServicesFilter = new ENTechConditionsServicesFilter();
							tcServicesFilter.code = tc2pwList.get(0).techConServicesRefCode;
							ENTechConditionsServicesShortList tcServicesList = tcServicesDAO
									.getScrollableFilteredListWITHOUT_SEGR(tcServicesFilter, null, null, 0, 1, null);
							act.numberGen = tcServicesList.get(0).contractNumber;
							priconnDoc = tcServicesList.get(0).contractNumber;
							priconnDate = tcServicesList.get(0).contractDate;

						} else {
							// SUPP-61275 20.11.2017 Если не счетчик абонента, тогда номер акта формируется
							// как и раньше (инв. номер / номер подразделения)
							// если счетчик абонента (т.е. тот у которого нет инвентарного номера
							// тогда формируется: заводской / номер подразделения
							if(scShort.invNumber != null && scShort.invNumber.length() > 0) {
								act.numberGen = scShort.invNumber + "/" + mol2podr(ui.molCode);
							} else {
								if(scShort.buildNumber != null && scShort.buildNumber.length() > 0) {
									act.numberGen = (scShort.buildNumber.length() < 6) ? scShort.buildNumber
											: scShort.buildNumber.substring(0, 6) + "/" + mol2podr(ui.molCode);
								} else {
									act.numberGen = (String.valueOf(scShort.code).length() < 6) ? String.valueOf(scShort.code)
											: String.valueOf(scShort.code).substring(0, 6) + "/" + mol2podr(ui.molCode);
								}
							}
						}

						// act.numberGen = scShort.invNumber + "/" +
						// mol2podr(ui.molCode);
						act.element.code = scShort.planElementRefCode;
						act.actTypeRef.code = scShort.planStateRefCode;
						act.commentGen = "Авто из ОЗ № " + ui.numberDoc;
						act.statusRef.code = ENActStatus.GOOD;
						// накинем ИНВ. счетчика ...
						act.invNumber = scShort.invNumber;
						actCode_ = actDAO.add(act);

						// данные МОЛа ...
						// свяжем с акт с планом

						// связка акта и плана
						ENAct2ENPlanWork a2p = new ENAct2ENPlanWork();
						a2p.actRef.code = actCode_;
						a2p.plan.code = scShort.planRefCode;
						System.out.println("clcAct " + userProfile.userName + " planRef = " + scShort.planRefCode);
						act2planController.add(a2p, ENConsts.isClient_SCCOUNTER);

					} else {
						actCode_ = scShort.actCode;
					}

					// пересчитаем акт !!!
					actLogic.fillActData(actCode_, false);
					/**
					 * Расчет отчислений с з/п для акта выполненных работ
					 */
					actLogic.calculateSalaryCharges(actCode_);

				}
			}

			if (priconnDoc != null) {
				SCCounter cnt = scCounterDAO.getObject(scShort.code);
				cnt.priconndoc = priconnDoc;
				cnt.priconndate = priconnDate;
				scCounterDAO.save(cnt);
			}
		}

		// Нооовая переразбивка на ОЗ ...
		counterDataList = scCounterDAO.getData4fillingZKU(ui.molCodeCounter, ui.dateStart, ui.dateFinal, 1);
		counterDataListAbon = scCounterDAO.getData4fillingZKUAbon(ui.molCodeCounter,
				ui.dateStart, ui.dateFinal, 0);
		vecCounterDataAbon = new Vector<SCCounterDataShort>();
		for(SCCounterDataShort scData : counterDataListAbon.list) {
			if(scData.usageItemKind != SCUsageInputItemKind.InputUsing
					&& /*SUPP-71154*/ scData.usageItemKind != Integer.MIN_VALUE
					&& scData.isChangeInZKU != 0) {
				vecCounterDataAbon.add(scData);
			}
		}
		counterDataList.list.addAll(vecCounterDataAbon);
		counterDataList.totalCount = counterDataList.list.size();

		for (int i = 0; i < counterDataList.totalCount; i++) {
			SCCounterDataShort scShort = counterDataList.get(i);

			// для счетчиков в ЗКУ увеличиваем стоимость part,other затраты
			// ложим на ЗКУ

			if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {

				if (scShort.actCode == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("Акт не знайдено ... переформуйте строки ...");
				}

				if(scShort.invNumber != null || (scShort.invNumber == null && scShort.isChangeInZKU != 0)) {
					SCCounter cnt = scCounterDAO.getObject(scShort.code);

					// 07.02.2018 Меняется условие - теперь для счетчиков без инвентарного номера будет
					// вызываться метод counterInstallPlaceWOZKU, но стоимость сохранятся не будет.

					SCCounterSetupInfo rpData__ = counterInstallPlaceWOZKU(cnt.estimateItemRef.code, true);

					if(scShort.invNumber != null) {
						scShort.cost = scShort.cost.add(rpData__.actSumGen).setScale(2, BigDecimal.ROUND_HALF_UP);

						cnt.cost = cnt.cost.add(rpData__.actSumGen);
						scCounterDAO.save(cnt);
					}
				}
			}

			// разбивка на ОЗ
			if (scShort.usageItemKind == 1) {
				if (invoice.get(0) == null)
					invoice.set(0, new Integer(1));
			}

			if (scShort.usageItemKind == 2) {
				if (invoice.get(1) == null)
					invoice.set(1, new Integer(2));

				//
				int uii = getInUII(scShort.molCode, invoiceOut);
				if (uii == Integer.MIN_VALUE) {
					uiiData uii_ = new uiiData();
					uii_.molCode = scShort.molCode;
					uii_.code = Integer.MIN_VALUE;
					invoiceOut.add(uii_);
				}
			}

			// if (scShort.isChangeInZKU==0)
			// {
			int ozCode = getInOZ(scShort, oz);
			if (ozCode == Integer.MIN_VALUE) {
				scShort.ozCode = oz.size() + 1;
				scShort.ozCount = 1;
				// scShort.molCode =
				oz.add(scShort);
			} else {
				SCCounterDataShort scShort1 = (SCCounterDataShort) oz.get(ozCode);
				scShort1.ozCount++;
				oz.set(ozCode, scShort1);
			}
			// }

		}

		// ввод в Экспл
		int itemIn = Integer.MIN_VALUE;
		if (invoice.get(0) != null) {
			SCUsageInputItem item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.UsageInput;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0; // пока 0 .. по хорошему вкинуть реальное кол-во
								// или обнвить потом
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
			item.scCode = Integer.MIN_VALUE;
			//////////
			item.molCode = ui.molCode;
			item.molName = ui.molName;
			///////////
			itemIn = uiiDAO.add(item);
		}

		// вывод из Экспл
		// сделаем отдельно .. для нескольких молов
		int itemOut = Integer.MIN_VALUE;
		if (invoice.get(1) != null) {

			for (int i = 0; i < counterDataList.totalCount; i++) {
				SCCounterDataShort scShort = counterDataList.get(i);
				if (scShort.usageItemKind == SCUsageInputItemKind.UsageOut) {

					for (int ww = 0; ww < invoiceOut.size(); ww++) {

						//////////////////
						int uu = getInUII(scShort.molCode, invoiceOut);
						if (uu == Integer.MIN_VALUE) {
							throw new EnergyproSystemException("gluk in getInUII" + scShort.molCode);
						}
						uiiData uii__ = ((uiiData) invoiceOut.get(uu));

						if (uii__.code == Integer.MIN_VALUE) {
							SCUsageInputItem item = new SCUsageInputItem();
							item.kindRef.code = SCUsageInputItemKind.UsageOut;
							item.usageInputRef.code = usageInputCode;
							item.countGen = 0; // пока 0 .. по хорошему вкинуть
												// реальное кол-во или обнвить
												// потом
							item.numberInt = uiiDAO._collectAutoIncrementNumber();
							item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
							item.scCode = Integer.MIN_VALUE;

							if (ui.molCode.equals(scShort.molCode)) {
								item.molName = ui.molName;
							} else {
								FINMolFilter finMOLFilter = new FINMolFilter();
								finMOLFilter.id = uii__.molCode;
								finMOLFilter.state = 1; // только работающие ...
								FINMolShortList finMOLList = finMolController.getScrollableFilteredList(finMOLFilter, 0,
										-1);
								if (finMOLList.totalCount != 1)
									throw new EnergyproSystemException("Кількість працючих МВО (" + uii__.molCode
											+ ") не дорівнює 1 ... кількість " + finMOLList.totalCount);
								item.molName = finMOLList.get(0).text; // вытянуть
																		// из ФК
																		// ...
							}
							item.molCode = uii__.molCode;
							/////////////////
							itemOut = uiiDAO.add(item);
							uii__.code = itemOut;
							invoiceOut.set(uu, uii__);
						}
					}
				}
			}
		}

		for (int i = 0; i < oz.size(); i++) {
			SCCounterDataShort scShort = (SCCounterDataShort) oz.get(i);
			SCUsageInputItemOZ ozz = new SCUsageInputItemOZ();

			ozz.numberInt = ozDAO._collectAutoIncrementNumber__();
			ozz.numberDoc = "" + ozz.numberInt + "/" + mol2podr(ui.molCode);
			ozz.account = scShort.account;
			ozz.budgetRef.code = scShort.budgetRefCode;
			ozz.cost = scShort.cost;
			ozz.counterType = scShort.name; // бух тип в СККоунтре в НАМЕ .. а
											// билинговый в коунтерТайп
			ozz.countGen = scShort.ozCount;

			if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput)
				ozz.usageInputItemRef.code = itemIn;
			else if (scShort.usageItemKind == SCUsageInputItemKind.UsageOut) {
				int uu = getInUII(scShort.molCode, invoiceOut);
				if (uu == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("gluk in getInUII" + scShort.molCode);
				}
				uiiData uii__ = ((uiiData) invoiceOut.get(uu));
				ozz.usageInputItemRef.code = uii__.code;
				// а тут еще НЕТ счетчиков .. перенесем выше ...
				// типа не совпадают РЭСы у тех кто поставил и кто снял ;)
				/*
				 * if ( ! mol2podr(ui.molCode).equals(mol2podr(uii__.molCode))){
				 * //if ( ! scShort.molCode.equals((uii__.molCode))){ throw new
				 * EnergyproSystemException(
				 * "Не співпадають підрозділи у того, хто встановив лічильник ("
				 * + mol2podr(ui.molCode) + ") і у того хто його знімає (" +
				 * mol2podr(uii__.molCode) + ")... сер № " +
				 * scShort.buildNumber); }
				 */
			} else
				throw new EnergyproSystemException("Unknown scShort.usageItemKind ... code = " + scShort.usageItemKind);

			ozz.code = ozDAO.add(ozz);

			// выше добавили и перезалили акты ... лист поменялся !!!!
			docCount = counterDataList.totalCount;
			counterDataList = scCounterDAO.getData4fillingZKU(ui.molCodeCounter, ui.dateStart, ui.dateFinal, 1);
			counterDataListAbon = scCounterDAO.getData4fillingZKUAbon(ui.molCodeCounter,
					ui.dateStart, ui.dateFinal, 0);
			vecCounterDataAbon = new Vector<SCCounterDataShort>();
			for(SCCounterDataShort scData : counterDataListAbon.list) {
				if(scData.usageItemKind != SCUsageInputItemKind.InputUsing
						&& /*SUPP-71154*/ scData.usageItemKind != Integer.MIN_VALUE
						&& scData.isChangeInZKU != 0) {
					vecCounterDataAbon.add(scData);
				}
			}
			counterDataList.list.addAll(vecCounterDataAbon);
			counterDataList.totalCount = counterDataList.list.size();

			String ozAccount = (scShort.account == null) ? "" : scShort.account;
			String ozMolCode = (scShort.molCode == null) ? "" : scShort.molCode;

			for (int j = 0; j < counterDataList.totalCount; j++) {

				SCCounterDataShort sc = counterDataList.get(j);

				String scCounterAccount = (sc.account == null) ? "" : sc.account;
				String scCounterMolCode = (sc.molCode == null) ? "" : sc.molCode;


				if ((scCounterAccount.equals(ozAccount)) &&
						sc.budgetRefCode == scShort.budgetRefCode &&
				(sc.usageItemKind == scShort.usageItemKind) && (scCounterMolCode.equals(ozMolCode))) {
					// типа наш клиент (совпало счет + цена + тип)
					SCUsageInputItemOZ2SCCounter ii2c = new SCUsageInputItemOZ2SCCounter();
					ii2c.ozRef.code = ozz.code;
					ii2c.scCounterRef.code = sc.code;
					ii2cDAO.add(ii2c);

					// обновим статус ...
					SCCounter cnt = scCounterDAO.getObject(sc.code);
					cnt.statusRef.code = SCCounterStatus.IN_ACT;
					scCounterDAO.save(cnt);

					// свяжем акт с ОЗ

					if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {
						SCUsageInputItemOZ2ENAct oz2act = new SCUsageInputItemOZ2ENAct();
						oz2act.usageInputItemOZRef.code = ozz.code;
						oz2act.enActRef.code = sc.actCode;
						oz2actDAO.add(oz2act);
					}

				}

			}

		}

		// пересохраним общее кол-во в ОЗ
		SCUsageInputItemFilter iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		int[] iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			int iiCount = 0;
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			ozFilter1.usageInputItemRef.code = iiArr1[i];
			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter ii2ozFilter = new SCUsageInputItemOZ2SCCounterFilter();
				ii2ozFilter.ozRef.code = ozArr1[j];
				int[] scArr = ii2cDAO.getFilteredCodeArray(ii2ozFilter, 0, -1);
				SCUsageInputItemOZ oz1 = ozDAO.getObject(ozArr1[j]);
				oz1.countGen = scArr.length;
				iiCount = iiCount + scArr.length;
				ozDAO.save(oz1);
			}
			SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ii.countGen = iiCount;
			uiiDAO.save(ii);
		}

		// счетчики абонов ....
		SCCounterDataShortList abCounterDataList = scCounterDAO.getData4fillingZKU(ui.molCodeCounter, ui.dateStart,
				ui.dateFinal, 0);
		String buhName = "";
		String actInvitationNumber = "";
		int budgetRefCode = Integer.MIN_VALUE;
		int ozCode = Integer.MIN_VALUE;
		if (abCounterDataList.totalCount > 0) {

			SCUsageInputItem item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.InputUsing;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0;// abCounterDataList.totalCount;
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);

			item.molCode = ui.molCode;
			item.molName = ui.molName;

			item.scCode = Integer.MIN_VALUE;
			item.code = uiiDAO.add(item);

			for (int qq = 0; qq < abCounterDataList.totalCount; qq++) {

				SCCounterDataShort sc2 = abCounterDataList.get(qq);

				/*SUPP-58999
				 * Для тех счетчиков где задан акт приглашения (на экспертизу?) будут формироваться
				 * отдельные ОЗшки так как в информации для этих ОЗ будет выбираться другой бухгалтерский счет
				 * */
				if (!buhName.trim().equals(sc2.name.trim()) ||
						budgetRefCode != sc2.budgetRefCode ||
						!actInvitationNumber.equals((sc2.actInvitationNumber == null) ? "" : sc2.actInvitationNumber)) {

					actInvitationNumber = (sc2.actInvitationNumber == null) ? "" : sc2.actInvitationNumber;
					budgetRefCode = sc2.budgetRefCode;
					buhName = sc2.name.trim();
					SCUsageInputItemOZ ozz = new SCUsageInputItemOZ();

					ozz.numberInt = ozDAO._collectAutoIncrementNumber__();
					ozz.numberDoc = "" + ozz.numberInt + "/" + mol2podr(ui.molCode);
					ozz.account = null;
					ozz.cost = null;
					ozz.budgetRef.code = budgetRefCode;
					ozz.budgetRef.code = sc2.budgetRefCode;
					ozz.counterType = buhName;
					ozz.countGen = 0; // abCounterDataList.totalCount;
					ozz.usageInputItemRef.code = item.code;
					ozCode = ozDAO.add(ozz);
				}

				SCUsageInputItemOZ2SCCounter ii2c = new SCUsageInputItemOZ2SCCounter();
				ii2c.ozRef.code = ozCode;
				ii2c.scCounterRef.code = sc2.code;
				ii2cDAO.add(ii2c);

				// обновим статус ...
				SCCounter cnt = scCounterDAO.getObject(sc2.code);
				cnt.statusRef.code = SCCounterStatus.IN_ACT;
				scCounterDAO.save(cnt);
			}

		}

		// пересохраним общее кол-во в ОЗ
		iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		iiFilter1.kindRef.code = SCUsageInputItemKind.InputUsing;
		iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			int iiCount = 0;
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			// SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ozFilter1.usageInputItemRef.code = iiArr1[i];
			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter ii2ozFilter = new SCUsageInputItemOZ2SCCounterFilter();
				ii2ozFilter.ozRef.code = ozArr1[j];
				int[] scArr = ii2cDAO.getFilteredCodeArray(ii2ozFilter, 0, -1);
				SCUsageInputItemOZ oz1 = ozDAO.getObject(ozArr1[j]);
				oz1.countGen = scArr.length;
				iiCount = iiCount + scArr.length;
				ozDAO.save(oz1);
			}
			SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ii.countGen = iiCount;
			uiiDAO.save(ii);
		}

		if ((docCount != 0) || (abCounterDataList.totalCount != 0)) {
			// throw new EnergyproSystemException("Немає лічильників для
			// формування документів!");

			// перекинем статусы Актов, что бы они не перерасчитывали время ...
			// уже это в ФИЛЛ акте ...

			iiFilter1 = new SCUsageInputItemFilter();
			iiFilter1.usageInputRef.code = usageInputCode;
			iiFilter1.kindRef.code = SCUsageInputItemKind.UsageInput;
			iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

			for (int i = 0; i < iiArr1.length; i++) {
				SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
				// SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
				ozFilter1.usageInputItemRef.code = iiArr1[i];
				int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
				for (int j = 0; j < ozArr1.length; j++) {
					SCUsageInputItemOZ2ENActFilter oz2actFilter = new SCUsageInputItemOZ2ENActFilter();
					oz2actFilter.usageInputItemOZRef.code = ozArr1[j];
					SCUsageInputItemOZ2ENActShortList oz2aList = oz2actDAO.getScrollableFilteredList(oz2actFilter, 0,
							-1);
					for (int aa = 0; aa < oz2aList.totalCount; aa++) {
						ENAct act__ = actDAO.getObject(oz2aList.get(aa).enActRefCode);
						act__.statusRef.code = ENActStatus.SIGNATURE;
						actDAO.save(act__);
					}
				}
			}
		}

		// ui.statusRef.code = SCUsageInputStatus.FILLED;
		// uiDAO.save(ui);

	}

	public int getNumUnZKU(String invCounter, String lschet) throws PersistenceException {
		SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);
		return scLogicDAO.getNumUnZKU(invCounter, finConnection, lschet, getRenByDomain());
	}

	public void fillUsageInputOnlyZKU(int usageInputCode)
			throws PersistenceException, RemoteException, NamingException, CreateException {
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);

		SCUsageInputItemOZ2SCCounterDAO ii2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		ENActDAO actDAO = new ENActDAO(connection, userProfile);

		SCUsageInputItemOZ2ENActDAO oz2actDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		if (ui.statusRef.code != SCUsageInputStatus.GOOD) {
			throw new EnergyproSystemException("Невірний статус ...");
		}

		SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

		Vector<Integer> invoice = new Vector<Integer>();
		invoice.add(0, null);

		Vector<SCCounterDataShort> oz = new Vector<SCCounterDataShort>();

		// abon
		Context context = new InitialContext();
		Object objAct2PlanRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
		ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
				.narrow(objAct2PlanRef, ENAct2ENPlanWorkControllerHome.class);
		ENAct2ENPlanWorkController act2planController = act2planHome.create();
		// ---------------------------

		ActLogic actLogic = new ActLogic(connection, userProfile);
		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		String accountZku = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_ZKU, ui.dateGen);

		SCCounterDataShortList counterDataListAbon = scCounterDAO.getData4fillingZKUAbon(ui.molCodeCounter,
				ui.dateStart, ui.dateFinal, 0);

		String priconnDoc = null;
		Date priconnDate = null;

		for (int i = 0; i < counterDataListAbon.totalCount; i++) {
			SCCounterDataShort scShort = counterDataListAbon.get(i);

			priconnDoc = null;
			priconnDate = null;

			if (scShort.actCode == Integer.MIN_VALUE) {
				// скреатим АКТ .. и свяжем с планом ... + пересчет
				// throw new EnergyproSystemException("Наряд № " +
				// counterDataList.get(i).workOrderNumber + " не включено до
				// Акту на списання ТМЦ");

				if (scShort.usageItemKind == SCUsageInputItemKind.UsageInput) {
					int actCode_ = Integer.MIN_VALUE;
					if (scShort.actCode == Integer.MIN_VALUE) {
						ENAct act = new ENAct();
						act.dateGen = ui.dateGen;
						act.dateAct = ui.dateGen;
						ENTechCond2PlanWorkDAO tc2pwDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
						ENTechCond2PlanWorkFilter tc2pwFilter = new ENTechCond2PlanWorkFilter();
						tc2pwFilter.planRef.code = scShort.planRefCode;
						ENTechCond2PlanWorkShortList tc2pwList = tc2pwDAO.getScrollableFilteredList(tc2pwFilter, 0,
								-1);

						if (tc2pwList.totalCount > 0) {
							ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(connection,
									userProfile);
							ENTechConditionsServicesFilter tcServicesFilter = new ENTechConditionsServicesFilter();
							tcServicesFilter.code = tc2pwList.get(0).techConServicesRefCode;
							ENTechConditionsServicesShortList tcServicesList = tcServicesDAO
									.getScrollableFilteredListWITHOUT_SEGR(tcServicesFilter, null, null, 0, 1,
											null);
							act.numberGen = tcServicesList.get(0).contractNumber;
							priconnDoc = tcServicesList.get(0).contractNumber;
							priconnDate = tcServicesList.get(0).contractDate;

						} else {
							act.numberGen = scShort.buildNumber + "/" + mol2podr(ui.molCode);
						}

						// act.numberGen = scShort.invNumber + "/" +
						// mol2podr(ui.molCode);
						act.element.code = scShort.planElementRefCode;
						act.actTypeRef.code = scShort.planStateRefCode;
						act.commentGen = "Авто из ОЗ № " + ui.numberDoc;
						act.statusRef.code = ENActStatus.GOOD;
						// накинем ИНВ. счетчика ...
						act.invNumber = scShort.invNumber;
						actCode_ = actDAO.add(act);
						// данные МОЛа ...
						// свяжем с акт с планом

						// связка акта и плана
						ENAct2ENPlanWork a2p = new ENAct2ENPlanWork();
						a2p.actRef.code = actCode_;
						a2p.plan.code = scShort.planRefCode;
						System.out.println("clcAct " + userProfile.userName + " planRef = " + scShort.planRefCode);
						act2planController.add(a2p, ENConsts.isClient_SCCOUNTER);
					} else {
						actCode_ = scShort.actCode;
					}

					// пересчитаем акт !!!
					actLogic.fillActData(actCode_, false);
					/**
					 * Расчет отчислений с з/п для акта выполненных работ
					 */
					actLogic.calculateSalaryCharges(actCode_);

				}
			}

			if (priconnDoc != null) {
				SCCounter cnt = scCounterDAO.getObject(scShort.code);
				cnt.priconndoc = priconnDoc;
				cnt.priconndate = priconnDate;
				scCounterDAO.save(cnt);
			}
		}

		// сняли счетчики ОЕ
		SCCounterDataShortList counterDataList = scCounterDAO.getData4fillingOnlyZKU(ui.molCodeCounter,
				ui.dateStart, ui.dateFinal, usageInputCode);

		int docCount = counterDataList.totalCount;

		SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

		Date aDate;
		String aNumberGen;
		boolean isZKUExists = false;
		boolean isZKU = false;

		int numOZZKU = ozDAO._collectAutoIncrementNumber__();
		int numOZINZKU = ozDAO._collectAutoIncrementNumber__();

		String numOZZKUStr = numOZZKU + "/" + mol2podr(ui.molCode);
		String numOZINZKUStr = numOZINZKU + "/" + mol2podr(ui.molCode);

		for (int i = 0; i < counterDataList.totalCount; i++) {
			SCCounterDataShort scShort = counterDataList.get(i);

			SCCounter cnt = scCounterDAO.getObject(scShort.code);
			SCCounterSetupInfo rpData__;

			if (scShort.actCode == Integer.MIN_VALUE) {
				rpData__ = counterInstallPlaceZKU(cnt.estimateItemRef.code, false);
			} else {
				rpData__ = counterInstallPlaceZKU(cnt.estimateItemRef.code, true);
			}

			int matCodeZKU;

			if (scShort.isChangeInZKU == 0) // Новое ЗКУ
			{
				scShort.costzku = rpData__.actSumGen.setScale(2, BigDecimal.ROUND_HALF_UP);
				cnt.costzku_b = new BigDecimal(0);
				cnt.costzku = rpData__.actSumGen.setScale(2, BigDecimal.ROUND_HALF_UP);
				scCounterDAO.save(cnt);

				/*
				 * if (rpData__.actCode>0) {
				 * a=actDAO.getObject(rpData__.actCode); aDate=a.dateGen;
				 * aNumberGen=a.numberGen; } else {
				 * aDate=rpData__.installDate; aNumberGen=null; }
				 */

				aDate = ui.dateGen;
				aNumberGen = numOZZKUStr;

				int sccodeZKU = scLogicDAO.transferCounterMountInSCZKU(cnt.scCode, aNumberGen, aDate,
						userProfile.userName, new Date(),
						"Ввод в эксплуатацию ЗКУ ,инв.-" + cnt.invNumber + " ,заводской-" + cnt.buildNumber,
						// scLogicDAO.getPlaceUst(cnt.scCode),
						scCounterDAO.getAddr(cnt.estimateItemRef.code), cnt.dateIn,
						// scLogicDAO.getDateUst(cnt.scCode),
						cnt.lschet,
						// scLogicDAO.getLschet(cnt.scCode),
						"ЗКУ-" + cnt.lschet, cnt.namezku, ui.molCode, cnt.priconndoc, cnt.priconndate,
						this.getIsStandardConnection(cnt));

				// scLogicDAO.updateStatusZKUInSC(sccodeZKU,false);

				cnt.sccodezku = sccodeZKU;

				cnt.invnumberzku = scLogicDAO.getInvNumberZKU(sccodeZKU);
				cnt.podrCodeZKU = scLogicDAO.getPodrCodeZKU(cnt.sccodezku);

				/// 19.01.2018 Проверка на то, что задвоились инвентарные номера  после
				/// выполнения операции лучше вывести ошибку, так как потом устранять
				// эту ошибку достаточно трудозатратно
				if(scLogicDAO.getIsKodInvDoubledInCountersread(cnt.invnumberzku))
				{
					throw new SystemException(String.format("Операція приведе до задвоєння інвентарного № %s. \n "
							+ " Повторіть операцію ще раз!", cnt.invnumberzku));
				}

			} else {

//				if (scShort.sccodezku < 0) {
//					throw new EnergyproSystemException("ЗКУ для лічильника з інв.-" + scShort.invNumber
//							+ " не знайдено в скан-лічильниках ! ");
//				}
//
				if ((scShort.costzku == null) || (scShort.costzku.doubleValue() < 0)) {
					scShort.costzku = new BigDecimal(0);
				}

				cnt.costzku_b = scShort.costzku;

			}

			if (cnt.accountzku == null) {
				cnt.accountzku = accountZku;
			}

			if (scShort.namezku == null) {
				if ((cnt.phasity.intValue() == 1) || (cnt.phasity.intValue() < 0)) {
					matCodeZKU = TKConsts.TKMATERIALS_ZKU_1F;
				} else {
					matCodeZKU = TKConsts.TKMATERIALS_ZKU_3F;
				}

				cnt.namezku = new TKMaterialsDAO(connection, userProfile).getObject(matCodeZKU).name;
				scShort.namezku = cnt.namezku;

			}

			/*???if (cnt.podrCodeZKU == null && sccodeZKU == null ) {
				cnt.podrCodeZKU = scLogicDAO.getPodrCodeZKU(sccodeZKU);
			}*/

			scCounterDAO.save(cnt);

			int ozCode = getInOZZKU(scShort, oz);
			if (ozCode == Integer.MIN_VALUE) {
				scShort.ozCode = oz.size() + 1;
				scShort.ozCount = 1;
				oz.add(scShort);
				if ((scShort.usageItemKind == SCUsageInputItemKind.UsageInputInZKU) && (!isZKUExists)) {
					isZKUExists = true;
				}

				if ((scShort.usageItemKind == SCUsageInputItemKind.UsageInputZKU) && (!isZKU)) {
					isZKU = true;
				}

			} else {
				SCCounterDataShort scShort1 = (SCCounterDataShort) oz.get(ozCode);
				scShort1.ozCount++;
				oz.set(ozCode, scShort1);
				if ((scShort1.usageItemKind == SCUsageInputItemKind.UsageInputInZKU) && (!isZKUExists)) {
					isZKUExists = true;
				}

				if ((scShort1.usageItemKind == SCUsageInputItemKind.UsageInputZKU) && (!isZKU)) {
					isZKU = true;
				}

			}

		}

		SCUsageInputItem item;

		// ввод в Экспл
		int itemIn = Integer.MIN_VALUE;
		int itemInZKU = Integer.MIN_VALUE;

		if (isZKU) {
			item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.UsageInputZKU;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0; // пока 0 .. по хорошему вкинуть реальное
								// кол-во или обнвить потом
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
			item.scCode = Integer.MIN_VALUE;
			//////////
			item.molCode = ui.molCode;
			item.molName = ui.molName;
			///////////
			itemIn = uiiDAO.add(item);
		}

		if (isZKUExists) {
			item = new SCUsageInputItem();
			item.kindRef.code = SCUsageInputItemKind.UsageInputInZKU;
			item.usageInputRef.code = usageInputCode;
			item.countGen = 0; // пока 0 .. по хорошему вкинуть реальное
								// кол-во или обнвить потом
			item.numberInt = uiiDAO._collectAutoIncrementNumber();
			item.numberDoc = "" + item.numberInt + "/" + mol2podr(ui.molCode);
			item.scCode = Integer.MIN_VALUE;
			//////////
			item.molCode = ui.molCode;
			item.molName = ui.molName;
			///////////
			itemInZKU = uiiDAO.add(item);
		}

		for (int i = 0; i < oz.size(); i++) {
			SCCounterDataShort scShort = (SCCounterDataShort) oz.get(i);
			SCUsageInputItemOZ ozz = new SCUsageInputItemOZ();

			ozz.account = scShort.accountzku;
			ozz.cost = scShort.costzku;
			ozz.budgetRef.code = scShort.budgetRefCode;
			ozz.counterType = scShort.namezku; // бух тип в СККоунтре в НАМЕ
												// .. а билинговый в
												// коунтерТайп
			ozz.countGen = scShort.ozCount;

			if (scShort.usageItemKind == SCUsageInputItemKind.UsageInputZKU) {
				ozz.usageInputItemRef.code = itemIn;

				ozz.numberInt = numOZZKU;
				ozz.numberDoc = numOZZKUStr;
			} else if (scShort.usageItemKind == SCUsageInputItemKind.UsageInputInZKU) {
				ozz.usageInputItemRef.code = itemInZKU;

				ozz.numberInt = numOZINZKU;
				ozz.numberDoc = numOZINZKUStr;
			} else {
				throw new EnergyproSystemException(
						"Unknown scShort.usageItemKind ... code = " + scShort.usageItemKind);
			}

			ozz.code = ozDAO.add(ozz);

			// выше добавили и перезалили акты ... лист поменялся !!!!
			docCount = counterDataList.totalCount;
			counterDataList = scCounterDAO.getData4fillingOnlyZKU(ui.molCodeCounter, ui.dateStart, ui.dateFinal,
					usageInputCode);

			for (int j = 0; j < counterDataList.totalCount; j++) {

				SCCounterDataShort sc = counterDataList.get(j);

				if ((sc.accountzku.equals(scShort.accountzku)) &&
						sc.budgetRefCode == scShort.budgetRefCode &&
				(sc.usageItemKind == scShort.usageItemKind)) {
					// типа наш клиент (совпало счет + цена + тип)
					SCUsageInputItemOZ2SCCounter ii2c = new SCUsageInputItemOZ2SCCounter();
					ii2c.ozRef.code = ozz.code;
					ii2c.scCounterRef.code = sc.code;
					ii2cDAO.add(ii2c);

					// обновим статус ...
					SCCounter cnt = scCounterDAO.getObject(sc.code);
					cnt.statusRef.code = SCCounterStatus.IN_ACT;
					scCounterDAO.save(cnt);

					if (sc.invNumber == null &&
							scShort.usageItemKind != SCUsageInputItemKind.UsageInputInZKU) {
						SCUsageInputItemOZ2ENAct oz2act = new SCUsageInputItemOZ2ENAct();
						oz2act.usageInputItemOZRef.code = ozz.code;
						oz2act.enActRef.code = sc.actCode;
						oz2actDAO.add(oz2act);
					}

				}

			}

		}

		// пересохраним общее кол-во в ОЗ
		SCUsageInputItemFilter iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		int[] iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			int iiCount = 0;
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			ozFilter1.usageInputItemRef.code = iiArr1[i];
			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2SCCounterFilter ii2ozFilter = new SCUsageInputItemOZ2SCCounterFilter();
				ii2ozFilter.ozRef.code = ozArr1[j];
				int[] scArr = ii2cDAO.getFilteredCodeArray(ii2ozFilter, 0, -1);
				SCUsageInputItemOZ oz1 = ozDAO.getObject(ozArr1[j]);
				oz1.countGen = scArr.length;
				iiCount = iiCount + scArr.length;
				ozDAO.save(oz1);
			}
			SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ii.countGen = iiCount;
			uiiDAO.save(ii);
		}

		// abon
		iiFilter1 = new SCUsageInputItemFilter();
		iiFilter1.usageInputRef.code = usageInputCode;
		iiFilter1.kindRef.code = SCUsageInputItemKind.UsageInputZKU;
		iiArr1 = uiiDAO.getFilteredCodeArray(iiFilter1, 0, -1);

		for (int i = 0; i < iiArr1.length; i++) {
			SCUsageInputItemOZFilter ozFilter1 = new SCUsageInputItemOZFilter();
			// SCUsageInputItem ii = uiiDAO.getObject(iiArr1[i]);
			ozFilter1.usageInputItemRef.code = iiArr1[i];
			int[] ozArr1 = ozDAO.getFilteredCodeArray(ozFilter1, 0, -1);
			for (int j = 0; j < ozArr1.length; j++) {
				SCUsageInputItemOZ2ENActFilter oz2actFilter = new SCUsageInputItemOZ2ENActFilter();
				oz2actFilter.usageInputItemOZRef.code = ozArr1[j];
				SCUsageInputItemOZ2ENActShortList oz2aList = oz2actDAO.getScrollableFilteredList(oz2actFilter, 0,
						-1);
				for (int aa = 0; aa < oz2aList.totalCount; aa++) {
					ENAct act__ = actDAO.getObject(oz2aList.get(aa).enActRefCode);
					act__.statusRef.code = ENActStatus.SIGNATURE;
					actDAO.save(act__);
				}
			}
		}

		if (docCount == 0) {
			throw new EnergyproSystemException("Немає ЗКУ для формування документів!");
		}

		ui.statusRef.code = SCUsageInputStatus.FILLED;
		uiDAO.save(ui);

	}

	public int getInUII(String molCode, Vector<uiiData> uiiList) {
		int out = Integer.MIN_VALUE;

		if (uiiList == null) {
			return out;
		}

		for (int i = 0; i < uiiList.size(); i++) {
			uiiData uii = (uiiData) uiiList.get(i);
			if (uii.molCode.equals(molCode)) {
				return i;
			}
		}
		return out;
	}

	public int getInOZ(SCCounterDataShort scShort, Vector<SCCounterDataShort> ozList) {
		int out = Integer.MIN_VALUE;

		if (ozList == null) {
			return out;
		}

		for (int i = 0; i < ozList.size(); i++) {
			SCCounterDataShort oz = ozList.get(i);

			String ozMolCode = (oz.molCode == null) ? "" : oz.molCode;
			String ozAccount = (oz.account == null) ? "" : oz.account;
			String scMolCode = (scShort.molCode == null) ? "" : scShort.molCode;
			String scAccount = (scShort.account == null) ? "" : scShort.account;

			if ((ozAccount.equals(scAccount)) &&
			(oz.usageItemKind == scShort.usageItemKind) &&
			(ozMolCode.equals(scMolCode)) &&
			(oz.budgetRefCode == scShort.budgetRefCode)) {
				return i;
			}
		}
		return out;
	}

	public int getInOZZKU(SCCounterDataShort scShort, Vector<SCCounterDataShort> ozList) {
		int out = Integer.MIN_VALUE;

		if (ozList == null) {
			return out;
		}

		for (int i = 0; i < ozList.size(); i++) {
			SCCounterDataShort oz = ozList.get(i);
			if ((oz.accountzku.equals(scShort.accountzku)) &&
			(oz.usageItemKind == scShort.usageItemKind) &&
			(oz.budgetRefCode == scShort.budgetRefCode)) {
				return i;
			}
		}
		return out;
	}

	public ENMetrologyCounterShort getCounterInSC(int scCode, String invNum, boolean isException) {
		ENMetrologyCounterShort out = null;
		try {
			ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
			f.scCode = scCode;
			ENMetrologyCounterShortList list = getCountersListFromScanCounter(f, 0, -1);

			if (isException) {
				if (list.totalCount == 0)
					throw new EnergyproSystemException("Лічильник не знайдено в СК з інв. № " + invNum + " :: scCode = " + scCode);
				if (list.totalCount > 1)
					throw new EnergyproSystemException("З інв. № " + invNum + " знайдено декілька лічильників");
			}

			if (list.totalCount > 0) {
				out = list.get(0);
			}
			return out;

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
	}
	
	private void checkCounterLock(int scCode) {
		ENMetrologyCounter obj = new ENMetrologyCounter();
		obj.scCode = scCode;
		new CounterLogic(connection, userProfile).checkCounterLock(obj);
	}

	public void lockCounterInSC_(int scCode, String orderNum, Date dateIn, int lockCode) {
		ENMetrologyCounter obj = new ENMetrologyCounter();
		obj.scCode = scCode;
		new CounterLogic(connection, userProfile).lockCounter(obj, orderNum, dateIn, lockCode);
	}

	public void lockCounterInSCByPlanCode(int scCode, int planCode, int lockCode) {
		try {
			String orderNum = null;
			Date dateIn = null;

			PlanWorkLogic pwLogic = new PlanWorkLogic(connection, userProfile);
			ENWorkOrder workOrder = pwLogic.getWorkOrderByPlanCode(planCode);

			if (workOrder != null) {
				orderNum = workOrder.workOrderNumber;
				dateIn = workOrder.dateGen;
			}

			this.lockCounterInSC_(scCode, orderNum, dateIn, lockCode);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void lockSeal(int sealSCCode, String workOrderBytNumber, Date workOrderBytDate,
    		String executorTabNum, String executorFIO, int lockCode, boolean changeLockTypeOnly) {
		 lockSeal(sealSCCode, workOrderBytNumber, workOrderBytDate,
	    		 executorTabNum,  executorFIO,  lockCode,  changeLockTypeOnly, null, null);
	}


	public void lockSeal(int sealSCCode, String workOrderBytNumber, Date workOrderBytDate,
    		String executorTabNum, String executorFIO, int lockCode) {
		 lockSeal(sealSCCode, workOrderBytNumber, workOrderBytDate,
	    		 executorTabNum,  executorFIO,  lockCode,  false, null, null);
	}


    public void lockSeal(int sealSCCode, String workOrderBytNumber, Date workOrderBytDate,
    		String executorTabNum, String executorFIO, int lockCode, boolean changeLockTypeOnly, String orderNum, Date orderDate)
    {

		try
		{
			if (sealSCCode == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4530 Не заданий код пломби зі ScanCounters!");
			}

			CounterLogic counterLogic = new CounterLogic(connection, userProfile);

			ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
			f.scCode = sealSCCode;

			ENMetrologyCounterShortList scList = getSealsListFromScanCounter(f, 0, -1);
			if (scList.totalCount != 1)
			{
				throw new SystemException("\n\nNET-4530 Пломба не найдена или больше 1 ... код = " + f.scCode);
			}

			ENMetrologyCounterShort seal = scList.get(0);

			if (lockCode > 0 && seal.lockCode > 0)
			{
				throw new EnergyproSystemException("Пломбу (код = " + sealSCCode + ") вже заблоковано: " +
						counterLogic.lockCode2Text(seal.lockCode) +
						" № док " + seal.lockReason + " від " +
						((seal.lockDate != null) ? new SimpleDateFormat("dd.MM.yyyy").format(seal.lockDate) : " невідомо "));
			}

			if (lockCode < 0)
			{
				// если разблокируем .. а он не заблокирован - выход ...
				if (seal.lockCode == Integer.MIN_VALUE) return;

				if (Math.abs(lockCode) != seal.lockCode && seal.lockCode > 0)
				{
					throw new EnergyproSystemException("Пломбу (код = " + seal.scCode + ") заблоковано для ішної мети: " +
							counterLogic.lockCode2Text(seal.lockCode) +
							" № док " + seal.lockReason + " від " +
							((seal.lockDate != null) ? new SimpleDateFormat("dd.MM.yyyy").format(seal.lockDate) : " невідомо "));
				}
			}

			//int mode = lockCode > 0 ? 1 : 0;
			if (changeLockTypeOnly) {
				updateSealLockOnly(sealSCCode, lockCode);
			} else if (orderNum != null && orderDate != null)
			{
				updateSealForOrder(sealSCCode, orderNum, orderDate, lockCode);
			} else
				updateSeal(sealSCCode, workOrderBytNumber, workOrderBytDate, executorTabNum, executorFIO, lockCode);

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
    }

    public ENMetrologyCounterShortList checkSealInScanCounters(int sealSCCode)
    {
    	return checkSealInScanCounters(sealSCCode, false);
    }

    /**
     * Метод для проверки наличия пломбы в ScanCounters (по sccode (он же num_un в ScanCounters))
     *
     * @param sealSCCode - код пломбы (num_un) в ScanCounters
     * @param showAll - искать пломбу без учета признака SHOW_ = 'Y'
     *
     * @return лист с найденными пломбами (если кол-во элементов в листе <> 1 (0 или > 1), будет матюк!)
     */
    public ENMetrologyCounterShortList checkSealInScanCounters(int sealSCCode, boolean showAll)
    {
		try
		{
			if (sealSCCode == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4530 Не заданий код пломби зі ScanCounters (scCode)!");
			}

			ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
			f.scCode = sealSCCode;

			ENMetrologyCounterShortList scList = getSealsListFromScanCounter(f, 0, -1, showAll);

			if (scList.totalCount == 0)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено пломбу в ScanCounters! Код (в SC): " + sealSCCode);
			}

			if (scList.totalCount > 1)
			{
				throw new SystemException("\n\nNET-4530 Кількість пломб у ScanCounters > 1! Код (в SC): " + sealSCCode);
			}

			return scList;

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
    }

    public ENMetrologyCounterShortList getSealsFromScanCounters(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity)
    {
    	return getSealsFromScanCounters(filterObject, fromPosition, quantity, false);
    }

    public ENMetrologyCounterShortList getSealsFromScanCounters(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity, boolean showAll)
    {
		try
		{
			return getSealsListFromScanCounter(filterObject, fromPosition, quantity, showAll);

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
    }

    public void updateSealExecutor(int sealSCCode, String executorTabNum, String executorFIO)
    {
		try
		{
			// Снимаем блокировку перед апдейтом (иначе ругается триггер в ScanCounters)
			lockSeal(sealSCCode, null, null, null, null,
					 -1 * ENMetrologyCounter.BILLING_LOCK, true);

			String sql = " update countersread.ostable "
					+ "    set tabn_executor = ?, fio_executor = ? "
					+ "  where num_un = ? ";

			PreparedStatement statement = null;

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			statement = finConnection.prepareStatement(sql);

			if (executorTabNum != null)
				statement.setString(1, executorTabNum);
			else
				statement.setNull(1, java.sql.Types.VARCHAR);

			if (executorFIO != null)
				statement.setString(2, executorFIO);
			else
				statement.setNull(2, java.sql.Types.VARCHAR);

			statement.setInt(3, sealSCCode);
			statement.execute();


			// Возвращаем блокировку назад
			lockSeal(sealSCCode, null, null, null, null,
					 ENMetrologyCounter.BILLING_LOCK, true);

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
    }

	public void processInSC(int usageInputCode) throws RemoteException, PersistenceException, ParseException,
			NamingException, CreateException, DatasourceConnectException {
		processInSC(usageInputCode, false);
	}

	private Boolean getIsStandardConnection(SCCounter counter) throws PersistenceException {
		Boolean out = null;
		if (counter.priconndoc != null && counter.priconndoc.length() > 0) {
			ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
			ENTechConditionsServices obj = techCondDao.getObjectByContractNumberAndDate(counter.priconndoc,
					counter.priconndate, true);
			switch (obj.connectionKindRef.code) {
			case ENConnectionKind.STANDART:
				out = true;
				break;
			case ENConnectionKind.NO_STANDART:
				/*SUPP-74615 01.08.2018 Нестандартное по ключ обрабатывается как просто нестандартное*/
			case ENConnectionKind.READY_MADE:
				out = false;
				break;
			default:
				// Такого быть не должно, если договор связан с счетчиком
				// и был найден, то на нем должен быть определенный
				// тип - стандартное или не стандартное присоединение, однако,
				// если такие случаи будут то будем разбираться
				// т.к. теперь необходимо отдавать тип присоединения в
				// скансчетчики
				throw new SystemException(String.format("Для договора № %s датой %s задан непонятный тип присоединения",
						counter.priconndoc, new SimpleDateFormat("dd.mm.yyyyy").format(counter.priconndate)));
			}
		}
		return out;
	}

	public void processInSC(int usageInputCode, boolean countersServices) throws PersistenceException,
			java.text.ParseException, NamingException, RemoteException, CreateException, DatasourceConnectException {
		processInSC(usageInputCode, countersServices, null);
	}

	public void processInSC(int usageInputCode, boolean countersServices, Object caller) throws PersistenceException,
			java.text.ParseException, NamingException, RemoteException, CreateException, DatasourceConnectException {

		try {

			SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

			SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);

			SCUsageInput ui = uiDAO.getObject(usageInputCode);

			if (ui.statusRef.code != SCUsageInputStatus.FILLED) {
				throw new EnergyproSystemException("Накладна ще не складена ...");
			}

			SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
			SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
			SCUsageInputItemOZInfoDAO ozInfoDAO = new SCUsageInputItemOZInfoDAO(connection, userProfile);
			SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);
			SCUsageInputItemOZ2ProvDAO oz2provDAO = new SCUsageInputItemOZ2ProvDAO(connection, userProfile);
			ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
			ENMolDAO molDao = new ENMolDAO(connection, userProfile);

			WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
			PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

			// ------------------------
			Context context = new InitialContext();
			Object objRef = context.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
					ENActControllerHome.class);
			ENActController actController = actHome.create();

			ActLogic actLogic = new ActLogic(connection, userProfile);

			SCCounterDAO cntDAO = new SCCounterDAO(connection, userProfile);
			SCCounter cntObj = null;

			/*
			 * Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			 * ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome)
			 * PortableRemoteObject.narrow(planRef,
			 * ENPlanWorkControllerHome.class); ENPlanWorkController
			 * planController = planHome.create();
			 */
			// ---------------------------

			SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
			uiiFilter.usageInputRef.code = ui.code;
			uiiFilter.orderBySQL = SCUsageInputItem.kindRef_QFielld;
			int[] uiiArr = uiiDAO.getFilteredCodeArray(uiiFilter, 0, -1);
			for (int i = 0; i < uiiArr.length; i++) {

				SCUsageInputItem uii = uiiDAO.getObject(uiiArr[i]);

				// передали накладную ...
				if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
						|| (uii.kindRef.code == SCUsageInputItemKind.UsageOut)) {
					uii.scCode = scLogicDAO.transferInvoiceInSC(uii.kindRef.code, uii.numberDoc, ui.dateGen,
							uii.countGen, mol2podr(uii.molCode), uii.molCode);
				}

				SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
				ozFilter.usageInputItemRef.code = uii.code;
				int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);
				for (int j = 0; j < ozArr.length; j++) {
					System.out.println("process OS " + j + " to " + ozArr.length);
					// if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
					// || (uii.kindRef.code == SCUsageInputItemKind.UsageOut)){
					SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);


					boolean abonCounters = false;

					//SUPP-67738 Если ОЗ с абонентскими счетчиками
					if(uii.kindRef.code == SCUsageInputItemKind.UsageInput
							&& (oz.account == null || oz.account.trim().length() == 0)) {
						abonCounters = true;
					}

					// передали ОЗ ... только для Монтажа/демонтажа ОЕ ...
					if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
							|| (uii.kindRef.code == SCUsageInputItemKind.UsageOut)) {



						if(!abonCounters) {
							molDao.checkMolStatus(uii.molCode);
							oz.scCode = scLogicDAO.addOZSC(uii.kindRef.code, uii.scCode, oz.numberDoc, ui.dateGen,
									uii.molCode, mol2podr(uii.molCode), oz.countGen, oz.counterType, oz.cost, oz.account);
						}
					}

					if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {
						oz.scCode = scLogicDAO.transferInvoiceInSC(uii.kindRef.code,
								/* uii.numberDoc */ oz.numberDoc, ui.dateGen,
								/* uii.countGen */ oz.countGen, mol2podr(uii.molCode), uii.molCode);
					}

					// ---------------------------
					// if (1 == 1) return;
					// --------------------
					SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
					o2cFilter.ozRef.code = oz.code;
					SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
					for (int k = 0; k < o2cList.totalCount; k++) {
						// закинем в СК ... монтаж + демонтаж наших ...
						// монтаж ...
						SCUsageInputItemOZ2SCCounterShort o2cShort = o2cList.get(k);

						// сняли не свой подотчет - в сад переформировывать ...
						/*
						 * if ( !
						 * uii.molCode.equals(o2cShort.scCounterRefMolCode)){
						 * throw new EnergyproSystemException(
						 * "Відмініть складаняя документу "+ui.numberDoc+
						 * " й сформуйте документи заново (інв № "+
						 * o2cShort.scCounterRefInvNumber +")!!!"); }
						 */

						String yearBuild = "";
						if (o2cShort.scCounterRefDateBuild != null) {
							yearBuild = String.valueOf(Tools.getYear(o2cShort.scCounterRefDateBuild));
						}

						cntObj = cntDAO.getObject(o2cShort.scCounterRefCode);

						if (uii.kindRef.code == SCUsageInputItemKind.UsageInput) {

							if(!abonCounters) {
								SCCounterSetupInfo rpData = counterInstallPlace(o2cShort.scCounterEstimateItemRefCode,
										true);
								if (rpData.workerData == null) {
									throw new EnergyproSystemException(
											"Розрахунки зар. плати не знайдено для акту № " + rpData.actNumber);
								}

								// разлочим счетчик ...
								ENWorkOrder wo = woLogic
										.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);

								lockCounterInSC_(o2cShort.scCounterRefScCode,
										wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
										o2cShort.scCounterRefDateIn, ((-1) * ENMetrologyCounter.BILLING_LOCK));

								// lockCounterInSC(o2cShort.scCounterRefScCode, "№
								// нар." + o2cShort.scCounterRefInstallOrderNumber,
								// o2cShort.scCounterRefDateIn, 0);

								scLogicDAO.transferCounterMountInSC(o2cShort.scCounterRefName,
										o2cShort.scCounterRefBuildNumber, yearBuild, oz.scCode,
										o2cShort.scCounterRefInvNumber, rpData.installInfo, rpData.installDate,
										rpData.installPlace, o2cShort.scCounterRefDateCheck,
										o2cShort.scCounterRefInstallOrderNumber, rpData.installDate, rpData.lschet);
										// -----------------------------------
										// if (1==1) return;
										// ---------------------------------

								/**
								 * SUPP-32675... 22.04.2015 +++ при вводе в
								 * эксплуатацию счетчиков, установленных по
								 * договорам услуг (многотарифный счетчик), затраты
								 * по монтажу не включаем в стоимость счетчика....
								 *
								 * если countersServices = true - значит вызов для
								 * услуг по замене счетчика
								 */

								BigDecimal actSumGen = new BigDecimal(0);
								BigDecimal actSumTMC = new BigDecimal(0);
								BigDecimal actSumSalary = new BigDecimal(0);
								BigDecimal actSumTax = new BigDecimal(0);

								if (!countersServices) {
									actSumGen = rpData.actSumGen;
									actSumTMC = rpData.actSumTMC;
									actSumSalary = rpData.actSumSalary;
									actSumTax = rpData.actSumTax;
								}

								int addCode = scLogicDAO.moveCounterDataInSC(uii.scCode, o2cShort.scCounterRefInvNumber,
										rpData.actTypeCode, ui.dateGen,
										oz.numberDoc /* rpData.actNumber */, rpData.actDate, actSumGen, actSumTMC,
										actSumSalary, actSumTax, cntObj.priconndoc, cntObj.priconndate,
										this.getIsStandardConnection(cntObj));

								if (!countersServices) {
									/*SUPP-105396 При нулевой сумме акта доввод не создается в функции moveCounterDataInSC
									 * , но если есть работники, значит это ошибка */
									if(!rpData.workerData.isEmpty() && addCode == Integer.MIN_VALUE) {
										if(actSumGen.compareTo(BigDecimal.ZERO) == 0) {
											throw new SystemException(String.format("\n\nНеправильна сума акту № %s від %s\nСума за актом дорівнює 0 при наявних працівниках!\n"
													+ "Необхідно перерахувати акт!\n\n"
													, rpData.actNumber, Tools.dateFormatDefault.format(rpData.actDate)));
										} else {
											throw new SystemException(String.format("Помилка при вставці довводу для акту № %s від %s"
													, rpData.actNumber, Tools.dateFormatDefault.format(rpData.actDate)));
										}
									}
									for(SCCounterSetupInfo.revisionData rData : rpData.workerData) {
										scLogicDAO.moveCounterAddDataInSC(addCode, rData.tabNumber, rData.balans,
												rData.salary, rData.tax);
									}
								}
							}
						} else
							// приход от монтажа Наших счетчиков
							if (uii.kindRef.code == SCUsageInputItemKind.UsageOut) {
							// SCUsageInputItemOZ2SCCounterShort o2cShort =
							// o2cList.get(k);

							// разлочим счетчик ...
							ENWorkOrder wo = woLogic
									.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);
							lockCounterInSC_(o2cShort.scCounterRefScCode,
									wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
									o2cShort.scCounterRefDateIn, ((-1) * ENMetrologyCounter.BILLING_LOCK));
							// lockCounterInSC(o2cShort.scCounterRefScCode, "№
							// нар." + o2cShort.scCounterRefInstallOrderNumber,
							// o2cShort.scCounterRefDateIn, 0);

							scLogicDAO.transferCounterUnMountInSC(o2cShort.scCounterRefName,
									o2cShort.scCounterRefBuildNumber, yearBuild, o2cShort.scCounterRefCost,
									o2cShort.scCounterRefAccount, oz.scCode, o2cShort.scCounterRefInvNumber);
							// if (1 == 1) return;
							int numUnZKU;
							if (cntObj.sccodezku > 0) {
								numUnZKU = cntObj.sccodezku;
							} else {
								numUnZKU = 0;
							}

							/** 11.06.2018... +++ YurkovskyAV */
							int isLiquid = cntObj.isliquid;
							if (isLiquid == Integer.MIN_VALUE) {
								isLiquid = 1;
							}

							if (cntObj.isMoveToZKU == 1) {
								isLiquid = 1;
							}

							scLogicDAO.moveCounterUnMountInSC(uii.scCode, o2cShort.scCounterRefInvNumber, ui.dateGen,
									numUnZKU, isLiquid, cntObj.actInvitationNumber, cntObj.dateInvitation);

						} else
								// приход от демонтажа Абоновских счетчиков
								if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {

							// SCUsageInputItemOZ2SCCounterShort o2cShort =
							// o2cList.get(k);

							SCCounterSetupInfo rpData = counterInstallPlace(o2cShort.scCounterEstimateItemRefCode,
									false);

							scLogicDAO.transferCounterABUnMountInSC(o2cShort.scCounterRefName,
									o2cShort.scCounterRefBuildNumber, yearBuild,
									/* uii.scCode */ oz.scCode, rpData.installInfo);
									/*
									 * P_ID_NAKLAD Number, -- id накладной
									 * P_KOD_SUBSCH_B varchar2, -- Счет
									 * P_KOD_PODR varchar2, -- Код подразделения
									 * P_KOD_MOL varchar2, -- Код МОЛа P_KOD_IST
									 * varchar2, -- Код источника прихода
									 * P_KOD_ZATR varchar2, -- Код затрат
									 * P_TYPE_COUNTER varchar2, -- Тип счетчика
									 * P_CHARACTERS varchar2, -- Примечание
									 * P_KOD_NAKL varchar2, -- № накладной
									 * прихода P_DT_NAKL date, -- дата накладной
									 * прихода P_DT_DOC date, -- Бух дата
									 * прихода P_SUM_ST_NDS number, -- Стоимость
									 * с НДС P_SUM_NDS number, -- НДС
									 * P_SUM_ST_PERV number, --
									 * Бух.стоим.приобр. P_PRIMECHAN varchar2 --
									 * Описание операции := ‘Автоматический
									 * приход б/у. Energynet.’ P_IS_ENERGYNET
									 * Varchar2 -- Накладная из Энерджинет := 1
									 */

							/*
							 * надо вызывать ОДИН раз ;)) // доп инфо ...
							 * SCUsageInputItemOZInfoFilter ozInfoFilter = new
							 * SCUsageInputItemOZInfoFilter();
							 * ozInfoFilter.usageInputItemOZRef.code = oz.code;
							 * SCUsageInputItemOZInfoShortList ozInfoList =
							 * ozInfoDAO.getScrollableFilteredList(ozInfoFilter,
							 * 0, -1); if (ozInfoList.totalCount == 0){ throw
							 * new EnergyproSystemException(
							 * "Не знайдено бух. інформацію для проведення приходу БУ лічільників від абонентів ..."
							 * ); } SCUsageInputItemOZInfoShort ozInfo =
							 * ozInfoList.get(0);
							 * moveCounterABUnMountInSC(uii.scCode,
							 * ozInfo.account, mol2podr(uii.molCode),
							 * uii.molCode, ozInfo.sourceCode,
							 * ozInfo.expensesCode , oz.counterType ,
							 * o2cShort.scCounterRefName, uii.numberDoc,
							 * ui.dateGen, ui.dateGen, ozInfo.sumWithNds,
							 * ozInfo.sumNds, ozInfo.sumGen );
							 */
						}

						else
							throw new EnergyproSystemException("Непонятный тип накладной ..." + uii.kindRef.code);
					}

					if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {
						// доп инфо ...
						SCUsageInputItemOZInfoFilter ozInfoFilter = new SCUsageInputItemOZInfoFilter();
						ozInfoFilter.usageInputItemOZRef.code = oz.code;
						SCUsageInputItemOZInfoShortList ozInfoList = ozInfoDAO.getScrollableFilteredList(ozInfoFilter,
								0, -1);
						if (ozInfoList.totalCount == 0) {
							throw new EnergyproSystemException("\n\n"
									+ "Не знайдено бух. інформацію для проведення приходу БУ лічільників від абонентів...\n"
									+ "Необхідно заповнити додаткову інформацію на ОЗ-1 для оприбуткування лічильників від абонента!!!\n");
						}
						SCUsageInputItemOZInfoShort ozInfo = ozInfoList.get(0);
						scLogicDAO.moveCounterABUnMountInSC(/* uii.scCode */ oz.scCode, ozInfo.account,
								mol2podr(uii.molCode), uii.molCode, ozInfo.sourceCode, ozInfo.expensesCode,
								oz.counterType, /* o2cShort.scCounterRefName */ null,
								/* uii.numberDoc */ oz.numberDoc, ui.dateGen, ui.dateGen, ozInfo.sumWithNds,
								ozInfo.sumNds, ozInfo.sumGen);
					}

					ozDAO.save(oz);

					// проведем акты с ТМЦ ... чуть не забыли .. только для
					// ПРИХОДА наших ...
					if (uii.kindRef.code == SCUsageInputItemKind.UsageInput) {
						SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
						o2aFilter.usageInputItemOZRef.code = oz.code;
						SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
						for (int tt = 0; tt < o2aList.totalCount; tt++) {

							System.out.println("###########  seal... Start closeAct... actCode = "
									+ o2aList.get(tt).enActRefCode + " :: i = " + tt + " :: total = " + o2aList.totalCount);

							actController.close(o2aList.get(tt).enActRefCode, 0, false, caller);

							System.out.println("###########  seal... End closeAct... actCode = " + o2aList.get(tt).enActRefCode);

						}
					}

					////!!!!! передача проводок по зарплате по ОЗ
					Date startDateMoveProvsByOZ = Tools.encodeDate(2017,9,1); //!!!!! дата старта для актов ТО с сентября 2017


					/* !!!! проверка передавать ли проводки */
					ENPlanWorkFilter plFil = new ENPlanWorkFilter();
					plFil.conditionSQL = " enplanwork.code in ( select ei.planrefcode from scusageinputtmz2sccntr qq , sccounter scc ,  enestimateitem ei " +
											   " where qq.ozrefcode= " + oz.code +
											   " and qq.sccounterrefcode=scc.code " +
											   " and scc.estimateitemrefcode= ei.code )";
					boolean moveProv = true;

					int[] plArr = plDAO.getFilteredCodeArrayNOSEGR(plFil, 0, -1);
					for (int k = 0; k < plArr.length; k++) {
						ENPlanWork plObj = plDAO.getObjectNOSEGR(plArr[k]);
						if (plObj.stateRef.code == ENPlanWorkState.WORK_IN_OUT){
							moveProv = false;
						}
					}

					if(ui.dateGen.compareTo(startDateMoveProvsByOZ) >= 0 && moveProv ) {

					FKProvResult provResult = null;
					provResult = actLogic.movePostingByOZ(oz ,ui );


					String badprovstring = "";
		    		   if (provResult != null ){
		    			   if (provResult.badProvList.totalCount > 0 ) {
		   	               	badprovstring="  ошибки ФК :  ";
		   	               	for (int b = 0; b < provResult.badProvList.totalCount; b++) {

		   	               		badprovstring = badprovstring + "\n"
		   	               				+    " Текст ошибки = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
		   	               				+    " \n Примечание  = " + provResult.badProvList.get(b).primechan
		   	               				+    " \n  bal_ceh " + provResult.badProvList.get(b).bal_ceh
		   	               				+    "  bal_kau " + provResult.badProvList.get(b).bal_kau
		   	               				+    "  bal_sch " + provResult.badProvList.get(b).bal_sch + provResult.badProvList.get(b).bal_sub_sch
		   	               				+    " \n  kor_ceh " + provResult.badProvList.get(b).kor_ceh
		   	               				+    "  kor_kau " + provResult.badProvList.get(b).kor_kau
		   	               				+    "  kor_sch " + provResult.badProvList.get(b).kor_sch + provResult.badProvList.get(b).kor_sub_sch;
		   	   				}

		   	             throw new EnergyproSystemException( "\n" + badprovstring );

		   	               }


		   	   	        if (provResult.partId > Integer.MIN_VALUE  )
		   	               {
		   	                       SCUsageInputItemOZ2Prov oz2Prov = new SCUsageInputItemOZ2Prov();

		   	                       oz2Prov.ozRef.code = oz.code;
		   	                       oz2Prov.partId = provResult.partId;
		   	                       oz2Prov.datePosting = ui.dateGen;
		   	                       //act2Prov.voucher = retVouchermDAX;

		   	                       oz2provDAO.add(oz2Prov);

		   	               }
		    		   }
					}


				}

				// if ( 1 == 1) throw new EnergyproSystemException("qqq");

				uiiDAO.save(uii);

				// проведем накладную в СК ??? мож не надо??

			}

			// закроем Планы, для которых не сформировались АКТЫ ....
			// SCCounterDAO cntDAO = new SCCounterDAO(connection, userProfile);
			SCCounterShortList scList = cntDAO.getPlanNoActs(ui.code);
			int prevPlanCode = Integer.MIN_VALUE;
			for (int i = 0; i < scList.totalCount; i++) {
				if (prevPlanCode != scList.get(i).planRefCode) {
					// if (prevPlanCode == Integer.MIN_VALUE){
					prevPlanCode = scList.get(i).planRefCode;
					// }
					planLogic.closePlan(prevPlanCode, 0);
					// prevPlanCode = scList.get(i).planRefCode;
				}
			}

			ui.statusRef.code = SCUsageInputStatus.CLOSED;
			uiDAO.save(ui);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Нет связи со СканСчетчиками ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		// catch (SQLException e) {throw new
		// EnergyproSystemException(e.getMessage(),e);}
	}

	public void processInSCZKU(int usageInputCode) throws PersistenceException, java.text.ParseException,
			NamingException, RemoteException, CreateException, DatasourceConnectException {

		try {
			SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

			SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);

			SCUsageInput ui = uiDAO.getObject(usageInputCode);

			if (ui.statusRef.code != SCUsageInputStatus.FILLED) {
				throw new EnergyproSystemException("Накладна ще не складена ...");
			}

			SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
			SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
			SCUsageInputItemOZInfoDAO ozInfoDAO = new SCUsageInputItemOZInfoDAO(connection, userProfile);
			SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);
			SCUsageInputItemOZ2ProvDAO oz2provDAO = new SCUsageInputItemOZ2ProvDAO(connection, userProfile);
			ENMolDAO molDao = new ENMolDAO(connection, userProfile);

			WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
			PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
			ActLogic actLogic = new ActLogic(connection, userProfile);

			// ------------------------
			Context context = new InitialContext();
			Object objRef = context.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
					ENActControllerHome.class);
			ENActController actController = actHome.create();

			SCCounterDAO cntDAO = new SCCounterDAO(connection, userProfile);
			SCCounter cntObj = null;
			/*
			 * Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			 * ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome)
			 * PortableRemoteObject.narrow(planRef,
			 * ENPlanWorkControllerHome.class); ENPlanWorkController
			 * planController = planHome.create();
			 */
			// ---------------------------

			SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
			uiiFilter.usageInputRef.code = ui.code;
			uiiFilter.conditionSQL = " scusageinputitem.kindrefcode not in (4, 5) ";
			uiiFilter.orderBySQL = SCUsageInputItem.kindRef_QFielld + " desc";
			int[] uiiArr = uiiDAO.getFilteredCodeArray(uiiFilter, 0, -1);
			for (int i = 0; i < uiiArr.length; i++) {

				SCUsageInputItem uii = uiiDAO.getObject(uiiArr[i]);

				// передали накладную ...
				if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
						|| (uii.kindRef.code == SCUsageInputItemKind.UsageOut)) {
					uii.scCode = scLogicDAO.transferInvoiceInSC(uii.kindRef.code, uii.numberDoc, ui.dateGen,
							uii.countGen, mol2podr(uii.molCode), uii.molCode);
				}

				SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
				ozFilter.usageInputItemRef.code = uii.code;
				int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);
				for (int j = 0; j < ozArr.length; j++) {
					System.out.println("process OS " + j + " to " + ozArr.length);
					// if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
					// || (uii.kindRef.code == SCUsageInputItemKind.UsageOut)){
					SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

					boolean isAbonCounters = oz.account == null;

					// передали ОЗ ... только для Монтажа/демонтажа ОЕ ...
					if ((uii.kindRef.code == SCUsageInputItemKind.UsageInput)
							|| (uii.kindRef.code == SCUsageInputItemKind.UsageOut)) {
						if(!isAbonCounters) {
							molDao.checkMolStatus(uii.molCode);
							oz.scCode = scLogicDAO.addOZSC(uii.kindRef.code, uii.scCode, oz.numberDoc, ui.dateGen,
									uii.molCode, mol2podr(uii.molCode), oz.countGen, oz.counterType, oz.cost, oz.account);
						}
					}

					if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {
						oz.scCode = scLogicDAO.transferInvoiceInSC(uii.kindRef.code,
							/* uii.numberDoc */ oz.numberDoc, ui.dateGen,
							/* uii.countGen */ oz.countGen, mol2podr(uii.molCode), uii.molCode);
					}

					// ---------------------------
					// if (1 == 1) return;
					// --------------------
					SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
					o2cFilter.ozRef.code = oz.code;
					SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
					for (int k = 0; k < o2cList.totalCount; k++) {
						// закинем в СК ... монтаж + демонтаж наших ...
						// монтаж ...
						SCUsageInputItemOZ2SCCounterShort o2cShort = o2cList.get(k);

						// сняли не свой подотчет - в сад переформировывать ...
						/*
						 * if ( !
						 * uii.molCode.equals(o2cShort.scCounterRefMolCode)){
						 * throw new EnergyproSystemException(
						 * "Відмініть складаняя документу "+ui.numberDoc+
						 * " й сформуйте документи заново (інв № "+
						 * o2cShort.scCounterRefInvNumber +")!!!"); }
						 */
						String yearBuild = "";
						if (o2cShort.scCounterRefDateBuild != null) {
							yearBuild = String.valueOf(Tools.getYear(o2cShort.scCounterRefDateBuild));
						}

						cntObj = cntDAO.getObject(o2cShort.scCounterRefCode);

						if (uii.kindRef.code == SCUsageInputItemKind.UsageInput) {
							if(!isAbonCounters) {
								SCCounterSetupInfo rpData = counterInstallPlaceWOZKU(o2cShort.scCounterEstimateItemRefCode,
										true);
								if (rpData.workerData == null) {
									throw new EnergyproSystemException(
											"Розрахунки зар. плати не знайдено для акту № " + rpData.actNumber);
								}

								// разлочим счетчик ...
								ENWorkOrder wo = woLogic
										.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);

								if (cntObj.isMoveToZKU != 1) {
									lockCounterInSC_(o2cShort.scCounterRefScCode,
											wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
											o2cShort.scCounterRefDateIn, ((-1) * ENMetrologyCounter.BILLING_LOCK));
								}

								// lockCounterInSC(o2cShort.scCounterRefScCode, "№
								// нар." + o2cShort.scCounterRefInstallOrderNumber,
								// o2cShort.scCounterRefDateIn, 0);

								scLogicDAO.transferCounterMountInSC(o2cShort.scCounterRefName,
										o2cShort.scCounterRefBuildNumber, yearBuild, oz.scCode,
										o2cShort.scCounterRefInvNumber, rpData.installInfo, rpData.installDate,
										rpData.installPlace, o2cShort.scCounterRefDateCheck,
										o2cShort.scCounterRefInstallOrderNumber, rpData.installDate, rpData.lschet);
								// -----------------------------------
								// if (1==1) return;
								// ---------------------------------

								int addCode = scLogicDAO.moveCouterDataInSCZKU(uii.scCode, o2cShort.scCounterRefInvNumber,
										rpData.actTypeCode, ui.dateGen,
										oz.numberDoc /* rpData.actNumber */ , rpData.actDate, rpData.actSumGen,
										rpData.actSumTMC, rpData.actSumSalary, rpData.actSumTax,
										((cntObj.sccodezku != Integer.MIN_VALUE) ? new BigDecimal(cntObj.sccodezku) : null),
										cntObj.priconndoc, cntObj.priconndate,
										this.getIsStandardConnection(cntObj));

								for (int l = 0; l < rpData.workerData.size(); l++) {

									SCCounterSetupInfo.revisionData rData = (SCCounterSetupInfo.revisionData) rpData.workerData
											.get(l);
									scLogicDAO.moveCounterAddDataInSC(addCode, rData.tabNumber, rData.balans, rData.salary,
											rData.tax);
								}
							}
						} else
							// приход от монтажа Наших счетчиков
							if (uii.kindRef.code == SCUsageInputItemKind.UsageOut) {
							// SCUsageInputItemOZ2SCCounterShort o2cShort =
							// o2cList.get(k);

							// разлочим счетчик ...
							ENWorkOrder wo = woLogic
									.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);
							lockCounterInSC_(o2cShort.scCounterRefScCode,
									wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
									o2cShort.scCounterRefDateIn, ((-1) * ENMetrologyCounter.BILLING_LOCK));
							// lockCounterInSC(o2cShort.scCounterRefScCode, "№
							// нар." + o2cShort.scCounterRefInstallOrderNumber,
							// o2cShort.scCounterRefDateIn, 0);

							/** 11.06.2018... +++ YurkovskyAV */
							int isLiquid = cntObj.isliquid;
							if (isLiquid == Integer.MIN_VALUE) {
								isLiquid = 1;
							}

							if (cntObj.isMoveToZKU == 1) {
								isLiquid = 1;
							}

							scLogicDAO.transferCounterUnMountInSC(o2cShort.scCounterRefName,
									o2cShort.scCounterRefBuildNumber, yearBuild, o2cShort.scCounterRefCost,
									o2cShort.scCounterRefAccount, oz.scCode, o2cShort.scCounterRefInvNumber);
							// if (1 == 1) return;
							if (userProfile.userName.equals("energynet")) {
							System.out.println("### sccodezku = " + cntObj.sccodezku);
							}


							scLogicDAO.moveCounterUnMountInSC(uii.scCode, o2cShort.scCounterRefInvNumber, ui.dateGen,
									cntObj.sccodezku,
								 	isLiquid, cntObj.actInvitationNumber, cntObj.dateInvitation);

						} else
								// приход от демонтажа Абоновских счетчиков
								if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {

							// SCUsageInputItemOZ2SCCounterShort o2cShort =
							// o2cList.get(k);

							SCCounterSetupInfo rpData = counterInstallPlaceWOZKU(o2cShort.scCounterEstimateItemRefCode,
									false);

							scLogicDAO.transferCounterABUnMountInSC(o2cShort.scCounterRefName,
									o2cShort.scCounterRefBuildNumber, yearBuild,
									/* uii.scCode */ oz.scCode, rpData.installInfo);
									/*
									 * P_ID_NAKLAD Number, -- id накладной
									 * P_KOD_SUBSCH_B varchar2, -- Счет
									 * P_KOD_PODR varchar2, -- Код подразделения
									 * P_KOD_MOL varchar2, -- Код МОЛа P_KOD_IST
									 * varchar2, -- Код источника прихода
									 * P_KOD_ZATR varchar2, -- Код затрат
									 * P_TYPE_COUNTER varchar2, -- Тип счетчика
									 * P_CHARACTERS varchar2, -- Примечание
									 * P_KOD_NAKL varchar2, -- № накладной
									 * прихода P_DT_NAKL date, -- дата накладной
									 * прихода P_DT_DOC date, -- Бух дата
									 * прихода P_SUM_ST_NDS number, -- Стоимость
									 * с НДС P_SUM_NDS number, -- НДС
									 * P_SUM_ST_PERV number, --
									 * Бух.стоим.приобр. P_PRIMECHAN varchar2 --
									 * Описание операции := ‘Автоматический
									 * приход б/у. Energynet.’ P_IS_ENERGYNET
									 * Varchar2 -- Накладная из Энерджинет := 1
									 */

							/*
							 * надо вызывать ОДИН раз ;)) // доп инфо ...
							 * SCUsageInputItemOZInfoFilter ozInfoFilter = new
							 * SCUsageInputItemOZInfoFilter();
							 * ozInfoFilter.usageInputItemOZRef.code = oz.code;
							 * SCUsageInputItemOZInfoShortList ozInfoList =
							 * ozInfoDAO.getScrollableFilteredList(ozInfoFilter,
							 * 0, -1); if (ozInfoList.totalCount == 0){ throw
							 * new EnergyproSystemException(
							 * "Не знайдено бух. інформацію для проведення приходу БУ лічільників від абонентів ..."
							 * ); } SCUsageInputItemOZInfoShort ozInfo =
							 * ozInfoList.get(0);
							 * moveCounterABUnMountInSC(uii.scCode,
							 * ozInfo.account, mol2podr(uii.molCode),
							 * uii.molCode, ozInfo.sourceCode,
							 * ozInfo.expensesCode , oz.counterType ,
							 * o2cShort.scCounterRefName, uii.numberDoc,
							 * ui.dateGen, ui.dateGen, ozInfo.sumWithNds,
							 * ozInfo.sumNds, ozInfo.sumGen );
							 */
						}
						else
							throw new EnergyproSystemException("Непонятный тип накладной ..." + uii.kindRef.code);
					}

					if (uii.kindRef.code == SCUsageInputItemKind.InputUsing) {
						// доп инфо ...
						SCUsageInputItemOZInfoFilter ozInfoFilter = new SCUsageInputItemOZInfoFilter();
						ozInfoFilter.usageInputItemOZRef.code = oz.code;
						SCUsageInputItemOZInfoShortList ozInfoList = ozInfoDAO.getScrollableFilteredList(ozInfoFilter,
								0, -1);
						if (ozInfoList.totalCount == 0) {
							throw new EnergyproSystemException(
									"Не знайдено бух. інформацію для проведення приходу БУ лічільників від абонентів ...");
						}
						SCUsageInputItemOZInfoShort ozInfo = ozInfoList.get(0);
						scLogicDAO.moveCounterABUnMountInSC(/* uii.scCode */ oz.scCode, ozInfo.account,
								mol2podr(uii.molCode), uii.molCode, ozInfo.sourceCode, ozInfo.expensesCode,
								oz.counterType, /* o2cShort.scCounterRefName */ null,
								/* uii.numberDoc */ oz.numberDoc, ui.dateGen, ui.dateGen, ozInfo.sumWithNds,
								ozInfo.sumNds, ozInfo.sumGen);
					}

					ozDAO.save(oz);

					// проведем акты с ТМЦ ... чуть не забыли .. только для
					// ПРИХОДА наших ...
					if (uii.kindRef.code == SCUsageInputItemKind.UsageInput) {
						SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
						o2aFilter.usageInputItemOZRef.code = oz.code;
						SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
						for (int tt = 0; tt < o2aList.totalCount; tt++) {

							if (cntDAO.isOneMoreDocument(o2aList.get(tt).enActRefCode)) {
								actController.closeZKU(o2aList.get(tt).enActRefCode, 0);
							} else {
								actController.close(o2aList.get(tt).enActRefCode, 0);
							}

						}
					}

				}

				// if ( 1 == 1) throw new EnergyproSystemException("qqq");

				uiiDAO.save(uii);

				// проведем накладную в СК ??? мож не надо??

			}

			// закроем Планы, для которых не сформировались АКТЫ ....

			SCCounterShortList scList = cntDAO.getPlanNoActs(ui.code);
			int prevPlanCode = Integer.MIN_VALUE;
			for (int i = 0; i < scList.totalCount; i++) {
				if (prevPlanCode != scList.get(i).planRefCode) {
					// if (prevPlanCode == Integer.MIN_VALUE){
					prevPlanCode = scList.get(i).planRefCode;
					// }

					planLogic.closePlan(prevPlanCode, 0);

					// prevPlanCode = scList.get(i).planRefCode;
				}
			}

			ui.statusRef.code = SCUsageInputStatus.CLOSED;
			uiDAO.save(ui);

			provZKU(usageInputCode);


			 ////!!!!! передача проводок по зарплате по ОЗ
			Date startDateMoveProvsByOZ = Tools.encodeDate(2017,9,1); // !!!! дата старта для актов ТО с сентября 2017

			if(ui.dateGen.compareTo(startDateMoveProvsByOZ) >= 0) {

					uiiFilter.conditionSQL = "";
					uiiFilter.usageInputRef.code = ui.code;
					uiiFilter.orderBySQL = SCUsageInputItem.kindRef_QFielld + " desc";
					int[] uiiiArr = uiiDAO.getFilteredCodeArray(uiiFilter, 0, -1);
					for (int i = 0; i < uiiiArr.length; i++) {
						SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
						ozFilter.usageInputItemRef.code = uiiiArr[i];
						int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);
						for (int j = 0; j < ozArr.length; j++) {
			   					    SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

									FKProvResult provResult = null;

									provResult = actLogic.movePostingByOZ(oz ,ui );

									String badprovstring = "";
									   if (provResult != null ){
										   if (provResult.badProvList.totalCount > 0 ) {
									       	badprovstring="  ошибки ФК :  ";
									for (int b = 0; b < provResult.badProvList.totalCount; b++) {

										badprovstring = badprovstring + "\n"
									+    " Текст ошибки = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
									+    " \n Примечание  = " + provResult.badProvList.get(b).primechan
									+    " \n  bal_ceh " + provResult.badProvList.get(b).bal_ceh
									+    "  bal_kau " + provResult.badProvList.get(b).bal_kau
									+    "  bal_sch " + provResult.badProvList.get(b).bal_sch + provResult.badProvList.get(b).bal_sub_sch
									+    " \n  kor_ceh " + provResult.badProvList.get(b).kor_ceh
									+    "  kor_kau " + provResult.badProvList.get(b).kor_kau
									+    "  kor_sch " + provResult.badProvList.get(b).kor_sch + provResult.badProvList.get(b).kor_sub_sch;
										}

									 throw new EnergyproSystemException( "\n" + badprovstring );

									   }


									if (provResult.partId > Integer.MIN_VALUE  )
									   {
									           SCUsageInputItemOZ2Prov oz2Prov = new SCUsageInputItemOZ2Prov();

									           oz2Prov.ozRef.code = oz.code;
									           oz2Prov.partId = provResult.partId;
									           oz2Prov.datePosting = ui.dateGen;
									           //act2Prov.voucher = retVouchermDAX;

									               oz2provDAO.add(oz2Prov);

									       }
									   }
									}
			   }
		  }
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Нет связи со СканСчетчиками ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		// catch (SQLException e) {throw new
		// EnergyproSystemException(e.getMessage(),e);}
	}

	public void provZKU(int uiCode) throws NamingException, RemoteException, CreateException {

		try {
			int NUM_UN_COU = Integer.MIN_VALUE;
			int NUM_UN_ZKU = Integer.MIN_VALUE;
			Date DATEOPERAC = null;
			BigDecimal SUMAKT = null;
			BigDecimal SUMAKTMATERIALS = null;
			BigDecimal SUMAKTMATERIALS_BU = null;
			BigDecimal SUMAKTZARPLATA = null;
			BigDecimal SUMAKTPENSFOND = null;
			int ID_REVISIONDATA = Integer.MIN_VALUE;
			String TABN = null;
			String BALANS = null;
			BigDecimal DSUMAKTZARPLATA = null;
			BigDecimal DSUMAKTPENSFOND = null;

			SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

			SCCounter sc;
			SCCounterDAO scDAO = new SCCounterDAO(connection, userProfile);

			SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
			SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
			SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);

			SCUsageInput ui = uiDAO.getObject(uiCode);

			SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
			uiiFilter.usageInputRef.code = uiCode;
			uiiFilter.kindRef.code = SCUsageInputItemKind.UsageInputZKU;

			int[] uiiArr = uiiDAO.getFilteredCodeArray(uiiFilter, 0, -1);

			for (int i = 0; i < uiiArr.length; i++) {

				SCUsageInputItem uii = uiiDAO.getObject(uiiArr[i]);
				SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
				ozFilter.usageInputItemRef.code = uii.code;
				int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);

				for (int j = 0; j < ozArr.length; j++) {

					SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

					SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
					o2cFilter.ozRef.code = oz.code;
					SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);

					for (int k = 0; k < o2cList.totalCount; k++) {
						sc = scDAO.getObject(o2cList.get(k).scCounterRefCode);
						if ((sc.sccodezku > 0)
						// &&(sc.invNumber!=null)
						) {
							NUM_UN_COU = sc.scCode;
							NUM_UN_ZKU = sc.sccodezku;
							DATEOPERAC = ui.dateGen;
							SUMAKT = sc.costzku;

							int actCode = scDAO.getActCode(sc.code);

							SCCounterSetupInfo rpData__;

							if (actCode == Integer.MIN_VALUE) {
								rpData__ = counterInstallPlaceZKU(sc.estimateItemRef.code, false);
							} else {
								rpData__ = counterInstallPlaceZKU(sc.estimateItemRef.code, true);
							}

							SUMAKTMATERIALS = rpData__.actSumTMC;
							SUMAKTMATERIALS_BU = rpData__.actSumTMC_BU;
							SUMAKTZARPLATA = rpData__.actSumSalary;
							SUMAKTPENSFOND = rpData__.actSumTax;

							ID_REVISIONDATA = scLogicDAO.provCounterMountInSCZKU(NUM_UN_COU, // --
																								// ун.ном
																								// счетчика
									NUM_UN_ZKU, // -- ун.ном ЗКУ
									DATEOPERAC, // -- бух.дата операции
									SUMAKT, // -- первоначальная стоимость ЗКУ
											// общая
									SUMAKTMATERIALS, // -- стоиость по акту
														// материалов
									SUMAKTMATERIALS_BU, // -- стоиость по акту
														// материалов б/у
									SUMAKTZARPLATA, // -- зарплата по акту
													// материалов
									SUMAKTPENSFOND // -- отчисления по акту
													// материалов
							);

							/* занесение данных по сотруднику под доввод */
							if (rpData__.workerData != null) {
								Vector<revisionData> v = rpData__.workerData;
								SCCounterSetupInfo.revisionData wData;

								for (int cWData = 0; cWData < v.size(); cWData++) {
									wData = (SCCounterSetupInfo.revisionData) v.get(cWData);

									TABN = wData.tabNumber;
									BALANS = wData.balans;
									DSUMAKTZARPLATA = wData.salary;
									DSUMAKTPENSFOND = wData.tax;

									scLogicDAO.dovvodCounterMountInSCZKU(ID_REVISIONDATA, // --
																							// id
																							// таблицу
																							// довводов
																							// (Revision_Data)
											TABN, // -- Таб. № сотрудника
											BALANS, // -- ШПЗ сотрудника
													// сотрудника
											DSUMAKTZARPLATA, // -- Сумма
																// зарплаты
																// сотрудника
											DSUMAKTPENSFOND // -- Сумма ЕСВ
															// сотрудника
									);

								}
							}
						}

					}
					SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

					// ------------------------
					Context context = new InitialContext();
					Object objRef = context.lookup(ENActController.JNDI_NAME);
					ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
							ENActControllerHome.class);
					ENActController actController = actHome.create();

					// проведем акты с ТМЦ ...
					if (uii.kindRef.code == SCUsageInputItemKind.UsageInputZKU
							|| uii.kindRef.code == SCUsageInputItemKind.UsageInputInZKU) {
						SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
						o2aFilter.usageInputItemOZRef.code = oz.code;
						SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
						for (int tt = 0; tt < o2aList.totalCount; tt++) {

							if (scDAO.isOneMoreDocument(o2aList.get(tt).enActRefCode)) {
								actController.closeZKU(o2aList.get(tt).enActRefCode, 0);
							} else {
								actController.close(o2aList.get(tt).enActRefCode, 0);
							}

						}
					}

				}
			}

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		// catch (SQLException e) {throw new
		// EnergyproSystemException(e.getMessage(),e);}
	}

	public void unprovZKU(int uiCode) throws NamingException, RemoteException, CreateException {

		try {
			SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

			SCCounter sc;
			SCCounterDAO scDAO = new SCCounterDAO(connection, userProfile);

			SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
			SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);

			SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
			uiiFilter.usageInputRef.code = uiCode;
			uiiFilter.kindRef.code = SCUsageInputItemKind.UsageInputZKU;
			///uiiFilter.conditionSQL = String.format("%s in (?, ?)", SCUsageInputItem.kindRef_QFielld);
			///Vector<Integer> bindedParams = new Vector<Integer>();
			///bindedParams.add(SCUsageInputItemKind.UsageInputZKU);
			///bindedParams.add(SCUsageInputItemKind.UsageInputInZKU);

			int[] uiiArr = uiiDAO.getFilteredCodeArray(uiiFilter, 0, -1);

			for (int i = 0; i < uiiArr.length; i++) {

				SCUsageInputItem uii = uiiDAO.getObject(uiiArr[i]);
				SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
				ozFilter.usageInputItemRef.code = uii.code;
				int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);

				for (int j = 0; j < ozArr.length; j++) {

					SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

					SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
					o2cFilter.ozRef.code = oz.code;
					SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);

					for (int k = 0; k < o2cList.totalCount; k++) {
						sc = scDAO.getObject(o2cList.get(k).scCounterRefCode);
						if (sc.sccodezku > 0) {
							scLogicDAO.unprovCounterMountInSCZKU(sc.sccodezku);
						}
					}

					// ------------------------
					Context context = new InitialContext();
					Object objRef = context.lookup(ENActController.JNDI_NAME);
					ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
							ENActControllerHome.class);
					ENActController actController = actHome.create();
					// ---------------------------
					SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);
					// розлочим акты ...
					SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
					o2aFilter.usageInputItemOZRef.code = oz.code;
					SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
					for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {

						if (scDAO.isOneMoreDocument(o2aList.get(o2a).enActRefCode)) {
							actController.unCloseZKU(o2aList.get(o2a).enActRefCode, 0);
						} else {
							actController.unClose(o2aList.get(o2a).enActRefCode, 0);
						}

					}

				}
			}

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		// catch (SQLException e) {throw new
		// EnergyproSystemException(e.getMessage(),e);}
	}

	public String mol2podr(String molCode) {
		return "0" + molCode.substring(0, 2);
	}

	public void cancelProcessInSC(int usageInputCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {


		Connection finConn = null;
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		} catch (DatasourceConnectException e) {

			throw new SystemException(
					"Can't connect to finConn !!!! ",
					e);
		}

		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemOZ2ProvDAO oz2provDAO =new SCUsageInputItemOZ2ProvDAO(connection, userProfile);
		FKPostingLogic fpLogic = new FKPostingLogic(finConn, userProfile);

		SCUsageInput ui = uiDAO.getObject(usageInputCode);


		if (ui.statusRef.code != SCUsageInputStatus.CLOSED) {
			throw new EnergyproSystemException("Накладана ще не проведена ...");
		}

		// if (1 == 1){
		// throw new EnergyproSystemException("Ця функція тимчасово заблокована
		// ...");
		// }

		// ------------------------
		Context context = new InitialContext();
		Object objRef = context.lookup(ENActController.JNDI_NAME);
		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
				ENActControllerHome.class);
		ENActController actController = actHome.create();
		// ---------------------------

		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);

		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);

		WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
		uiiFilter.usageInputRef.code = ui.code;
		uiiFilter.orderBySQL = SCUsageInputItem.kindRef_QFielld;
		SCUsageInputItemShortList iiList = uiiDAO.getScrollableFilteredList(uiiFilter, 0, -1);
		for (int i = 0; i < iiList.totalCount; i++) {
			if ((iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageInput)
					|| (iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageOut)) {
				unTransferInvoiceInSC(iiList.get(i).scCode, iiList.get(i).kindRefCode, 0);
				unTransferInvoiceInSC(iiList.get(i).scCode, iiList.get(i).kindRefCode, 1);
			}

			// сбросим кодs из СК для ОЗ
			SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
			ozFilter.usageInputItemRef.code = iiList.get(i).code;
			int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);
			for (int j = 0; j < ozArr.length; j++) {
				SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

				if (iiList.get(i).kindRefCode == SCUsageInputItemKind.InputUsing) {
					unTransferInvoiceInSC(oz.scCode, iiList.get(i).kindRefCode, 0);
					unTransferInvoiceInSC(oz.scCode, iiList.get(i).kindRefCode, 1);
				}

				oz.scCode = Integer.MIN_VALUE;
				ozDAO.save(oz);

				// залочим счетчики опять ...
				SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
				o2cFilter.ozRef.code = oz.code;
				SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
				for (int k = 0; k < o2cList.totalCount; k++) {
					if ((iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageInput)
							|| (iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageOut)) {

						SCUsageInputItemOZ2SCCounterShort o2cShort = o2cList.get(k);
						// зАлочим счетчик ... опять ..
						// int planCode =
						// planLogic.getPlanCodeByEstimate(o2cShort.scCounterEstimateItemRefCode);
						ENWorkOrder wo = woLogic.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);
						lockCounterInSC_(o2cShort.scCounterRefScCode,
								wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
								o2cShort.scCounterRefDateIn, ENMetrologyCounter.BILLING_LOCK);
						// scCounterDAO.updateCounter( counter.scCode, "№ нар."
						// + wo.workOrderNumber + "
						// ("+counter.installOrderNumber+")", counter.dateIn,
						// 1);

					}
				}

				// розлочим акты ...
				SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
				o2aFilter.usageInputItemOZRef.code = oz.code;
				SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);
				for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {
					actController.unClose(o2aList.get(o2a).enActRefCode, 0);
				}


			}

			SCUsageInputItem ii = uiiDAO.getObject(iiList.get(i).code);
			ii.scCode = Integer.MIN_VALUE;
			uiiDAO.save(ii);

			// отменить проведение актов в ФК
			//
			/*
			 * if (ii.kindRef.code == SCUsageInputItemKind.UsageInput ){
			 * SCUsageInputItemOZ2ENActFilter o2aFilter = new
			 * SCUsageInputItemOZ2ENActFilter();
			 * o2aFilter.usageInputItemOZRef.code = ii.code;
			 * SCUsageInputItemOZ2ENActShortList o2aList =
			 * o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1); for (int o2a
			 * = 0; o2a < o2aList.totalCount; o2a++){
			 * actController.unClose(o2aList.get(o2a).enActRefCode, 0); } }
			 */

			// откроем Планы, для которых не сформировались АКТЫ ....
			SCCounterDAO cntDAO = new SCCounterDAO(connection, userProfile);
			SCCounterShortList scList = cntDAO.getPlanNoActs(ui.code);
			int prevPlanCode = Integer.MIN_VALUE;
			for (int j = 0; j < scList.totalCount; j++) {
				if (prevPlanCode != scList.get(j).planRefCode) {
					if (prevPlanCode == Integer.MIN_VALUE) {
						prevPlanCode = scList.get(j).planRefCode;
					}

					planLogic.openPlan(prevPlanCode, 0);

					prevPlanCode = scList.get(j).planRefCode;
				}
			}
		}

		// Если документ проводился с применением ЭЦП, будем отменять проведение под юзером energynet
		SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(connection, userProfile);
		String userName = scUsageInputLogic.getUserNameForFKBySCUsageInput(usageInputCode);

		///NET-2335 отменим ередачу проводок по ОЗ
				SCUsageInputItemOZ2ProvFilter oz2provFil = new SCUsageInputItemOZ2ProvFilter();
				oz2provFil.conditionSQL = " scusageinputitemoz2prv.ozrefcode in ( " +
										"	  select oz.code from scusageinputitemoz oz " +
								        "		  where oz.usageinputitemrefcode in ( select item.code from scusageinputitem item where item.usageinputrefcode = "+ usageInputCode +" ) " +
								        " 			  ) ";
				SCUsageInputItemOZ2ProvShortList oz2pList = oz2provDAO.getScrollableFilteredList(oz2provFil, 0, -1);
		        for (int oz2p = 0; oz2p < oz2pList.totalCount; oz2p++) {
		        	fpLogic.deleteProv(oz2pList.get(oz2p).partId, userName);

		        	oz2provDAO.remove(oz2pList.get(oz2p).code);
				}

		ui.statusRef.code = SCUsageInputStatus.FILLED;
		uiDAO.save(ui);
	}

	public void cancelProcessInSCZKU(int usageInputCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {

		Connection finConn = null;
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		} catch (DatasourceConnectException e) {

			throw new SystemException(
					"Can't connect to finConn !!!! ",
					e);
		}
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(connection, userProfile);
		SCUsageInputItemOZ2ProvDAO oz2provDAO =new SCUsageInputItemOZ2ProvDAO(connection, userProfile);
		FKPostingLogic fpLogic = new FKPostingLogic(finConn, userProfile);

		SCUsageInput ui = uiDAO.getObject(usageInputCode);

		SCCounterDAO cntDAO = new SCCounterDAO(connection, userProfile);
		SCCounter cntObj;

		if (ui.statusRef.code != SCUsageInputStatus.CLOSED) {
			throw new EnergyproSystemException("Накладана ще не проведена ...");
		}

		// if (1 == 1){
		// throw new EnergyproSystemException("Ця функція тимчасово заблокована
		// ...");
		// }

		// ------------------------
		Context context = new InitialContext();
		Object objRef = context.lookup(ENActController.JNDI_NAME);
		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef,
				ENActControllerHome.class);
		ENActController actController = actHome.create();
		// ---------------------------

		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(connection, userProfile);

		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);

		SCUsageInputItemOZ2SCCounterDAO o2cDAO = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);

		WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

		SCUsageInputItemDAO uiiDAO = new SCUsageInputItemDAO(connection, userProfile);
		SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
		uiiFilter.usageInputRef.code = ui.code;
		uiiFilter.conditionSQL = " scusageinputitem.kindrefcode not in (4, 5) ";
		uiiFilter.orderBySQL = SCUsageInputItem.kindRef_QFielld;
		SCUsageInputItemShortList iiList = uiiDAO.getScrollableFilteredList(uiiFilter, 0, -1);
		for (int i = 0; i < iiList.totalCount; i++) {
			if ((iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageInput)
					|| (iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageOut)) {
				unTransferInvoiceInSC(iiList.get(i).scCode, iiList.get(i).kindRefCode, 0);
				unTransferInvoiceInSC(iiList.get(i).scCode, iiList.get(i).kindRefCode, 1);
			}

			// сбросим кодs из СК для ОЗ
			SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
			ozFilter.usageInputItemRef.code = iiList.get(i).code;
			int[] ozArr = ozDAO.getFilteredCodeArray(ozFilter, 0, -1);
			for (int j = 0; j < ozArr.length; j++) {
				SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[j]);

				boolean isAbonCounters = oz.account == null;

				if (iiList.get(i).kindRefCode == SCUsageInputItemKind.InputUsing) {
					if(!isAbonCounters) {
						unTransferInvoiceInSC(oz.scCode, iiList.get(i).kindRefCode, 0);
						unTransferInvoiceInSC(oz.scCode, iiList.get(i).kindRefCode, 1);
					}
				}

				oz.scCode = Integer.MIN_VALUE;
				ozDAO.save(oz);

				// залочим счетчики опять ...
				SCUsageInputItemOZ2SCCounterFilter o2cFilter = new SCUsageInputItemOZ2SCCounterFilter();
				o2cFilter.ozRef.code = oz.code;
				SCUsageInputItemOZ2SCCounterShortList o2cList = o2cDAO.getScrollableFilteredList(o2cFilter, 0, -1);
				for (int k = 0; k < o2cList.totalCount; k++) {
					if ((iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageInput)
							|| (iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageOut) && !isAbonCounters) {

						SCUsageInputItemOZ2SCCounterShort o2cShort = o2cList.get(k);
						// зАлочим счетчик ... опять ..
						// int planCode =
						// planLogic.getPlanCodeByEstimate(o2cShort.scCounterEstimateItemRefCode);
						ENWorkOrder wo = woLogic.getWorkOrderByEstimateItemCode(o2cShort.scCounterEstimateItemRefCode);

						cntObj = cntDAO.getObject(o2cShort.scCounterRefCode);
						if ((cntObj.isMoveToZKU != 1) || ((iiList.get(i).kindRefCode == SCUsageInputItemKind.UsageOut)
								&& (cntObj.isMoveToZKU == 1))) {
							lockCounterInSC_(o2cShort.scCounterRefScCode,
									wo.workOrderNumber + " (" + o2cShort.scCounterRefInstallOrderNumber + ")",
									o2cShort.scCounterRefDateIn, ENMetrologyCounter.BILLING_LOCK);
						}

						// scCounterDAO.updateCounter( counter.scCode, "№ нар."
						// + wo.workOrderNumber + "
						// ("+counter.installOrderNumber+")", counter.dateIn,
						// 1);

					}
				}

				// розлочим акты ...
				SCUsageInputItemOZ2ENActFilter o2aFilter = new SCUsageInputItemOZ2ENActFilter();
				o2aFilter.usageInputItemOZRef.code = oz.code;
				SCUsageInputItemOZ2ENActShortList o2aList = o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1);

				for (int o2a = 0; o2a < o2aList.totalCount; o2a++) {
					if (cntDAO.isOneMoreDocument(o2aList.get(o2a).enActRefCode)) {
						actController.unCloseZKU(o2aList.get(o2a).enActRefCode, 0);
					} else {
						actController.unClose(o2aList.get(o2a).enActRefCode, 0);
					}

				}


			}



			SCUsageInputItem ii = uiiDAO.getObject(iiList.get(i).code);
			ii.scCode = Integer.MIN_VALUE;
			uiiDAO.save(ii);

			// отменить проведение актов в ФК
			//
			/*
			 * if (ii.kindRef.code == SCUsageInputItemKind.UsageInput ){
			 * SCUsageInputItemOZ2ENActFilter o2aFilter = new
			 * SCUsageInputItemOZ2ENActFilter();
			 * o2aFilter.usageInputItemOZRef.code = ii.code;
			 * SCUsageInputItemOZ2ENActShortList o2aList =
			 * o2aDAO.getScrollableFilteredList(o2aFilter, 0, -1); for (int o2a
			 * = 0; o2a < o2aList.totalCount; o2a++){
			 * actController.unClose(o2aList.get(o2a).enActRefCode, 0); } }
			 */

			// откроем Планы, для которых не сформировались АКТЫ ....

			SCCounterShortList scList = cntDAO.getPlanNoActs(ui.code);
			int prevPlanCode = Integer.MIN_VALUE;
			for (int j = 0; j < scList.totalCount; j++) {
				if (prevPlanCode != scList.get(j).planRefCode) {
					if (prevPlanCode == Integer.MIN_VALUE) {
						prevPlanCode = scList.get(j).planRefCode;
					}

					planLogic.openPlan(prevPlanCode, 0);

					prevPlanCode = scList.get(j).planRefCode;
				}
			}
		}

		// Если документ проводился с применением ЭЦП, будем отменять проведение под юзером energynet
		SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(connection, userProfile);
		String userName = scUsageInputLogic.getUserNameForFKBySCUsageInput(usageInputCode);

		///NET-2335 отменим ередачу проводок по ОЗ
		SCUsageInputItemOZ2ProvFilter oz2provFil = new SCUsageInputItemOZ2ProvFilter();
		oz2provFil.conditionSQL = " scusageinputitemoz2prv.ozrefcode in ( " +
								"	  select oz.code from scusageinputitemoz oz " +
						        "		  where oz.usageinputitemrefcode in ( select item.code from scusageinputitem item where item.usageinputrefcode = "+ usageInputCode +" ) " +
						        " 			  ) ";
		SCUsageInputItemOZ2ProvShortList oz2pList = oz2provDAO.getScrollableFilteredList(oz2provFil, 0, -1);
        for (int oz2p = 0; oz2p < oz2pList.totalCount; oz2p++) {
        	fpLogic.deleteProv(oz2pList.get(oz2p).partId, userName);

        	oz2provDAO.remove(oz2pList.get(oz2p).code);
		}

		ui.statusRef.code = SCUsageInputStatus.FILLED;
		uiDAO.save(ui);

		unprovZKU(usageInputCode);

	}

	public SCCounter getSCCounterByActCode(int actCode) throws PersistenceException {
		//Выбираем счетчик
		SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);

		SCCounterFilter counterFilter = new SCCounterFilter();
		counterFilter.conditionSQL = " code in (select sc.code " +
					" from net.enplanwork pw, net.enplanworkitem pi, " +
					" enact2enplanwork e2e, enestimateitem ei " +
					" left join sccounter sc on ei.code = sc.estimateitemrefcode " +
					" where pw.code = pi.planrefcode " +
					" and pw.code = e2e.plancode " +
					" and pi.code = ei.planitemrefcode " +
					" and ei.accountingtyperefcode = 2 " +
					" and ei.kindrefcode = 1 " +
					" and ei.countfact > 0 " +
					" and e2e.actrefcode =  " + actCode + ")";

		SCCounterShortList counterList = counterDAO.getScrollableFilteredList(counterFilter, 0, -1);

		if(counterList.totalCount > 1) {
			throw new EnergyproSystemException(String.format("Помилка у кількості для акту з кодом %d (знайдено записів - %d) "
					, actCode, counterList.totalCount));
		}

		if(counterList.totalCount > 0) {
			return counterDAO.getObject(counterList.get(0).code);
		} else {
			return null;
		}

	}
	public int getSCCounterCodeByEstimateItem(int estCode) throws PersistenceException {
		// int out = Integer.MIN_VALUE;
		SCCounterFilter f = new SCCounterFilter();
		f.statusRef.code = SCCounterStatus.GOOD;
		f.estimateItemRef.code = estCode;
		int[] arr = new SCCounterDAO(connection, userProfile).getFilteredCodeArray(f, 0, -1);
		if (arr.length > 1) {
			throw new EnergyproSystemException("Один Эстимэйт на несколько счетчиков  ... код эст= " + estCode);
		}

		return (arr.length == 0) ? Integer.MIN_VALUE : arr[0];

	}

	public ENPlanWorkShort getPlanByInvNumberCounter(ENMetrologyCounterShort mcShort) throws PersistenceException {
		ENPlanWorkShort out = null;

		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);
		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

		SCCounterFilter cnt2Filter = new SCCounterFilter();
		cnt2Filter.invNumber = mcShort.invNumber;
		cnt2Filter.kindRef.code = SCCounterKind.FOR_MOVED;
		cnt2Filter.molCode = mcShort.molCode;
		SCCounterShortList cnt2List = counterDAO.getScrollableFilteredList(cnt2Filter, 0, -1);
		for (int c2 = 0; c2 < cnt2List.totalCount; c2++) {
			ENPlanWork plan2 = planLogic
					.getPlanByCode(planLogic.getPlanCodeByEstimate(cnt2List.get(c2).estimateItemRefCode));
			if (plan2 != null) {
				out = planDAO.getShortObject(plan2.code);
			}
		}

		return out;
	}

	public boolean checkActInOZ(int actCode, boolean isException) throws PersistenceException {
		boolean out = false;

		SCUsageInputItemOZ2ENActDAO o2aDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);
		SCUsageInputItemOZ2ENActFilter f = new SCUsageInputItemOZ2ENActFilter();
		f.enActRef.code = actCode;
		f.conditionSQL = "scusageinputitemoz2nct.enactrefcode not in ("
				+ " select a2s.actrefcode from enact2scusageinput a2s where a2s.actrefcode = " + actCode + ")";

		int[] arr = o2aDAO.getFilteredCodeArray(f, 0, -1);
		if (arr.length > 0) {
			if (isException) {
				throw new EnergyproSystemException("Цей акт зв'язаний з ОЗ ...");
			}
			out = true;
		}
		return out;
	}

	public boolean validateSCCounter2Plan(ENPlanWork plan, ENMetrologyCounterShort mcShort, boolean isException)
			throws PersistenceException {
		boolean out = true;
		/*
		 * if ( ! (((mcShort.account.equals("1530")) ||
		 * (mcShort.account.equals("1531"))) && (mcShort.invNumber != null))) {
		 * return out; }
		 */
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);
		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

		SCCounterFilter cnt2Filter = new SCCounterFilter();
		cnt2Filter.invNumber = mcShort.invNumber;
		cnt2Filter.kindRef.code = SCCounterKind.FOR_MOVED;
		cnt2Filter.molCode = mcShort.molCode;
		SCCounterShortList cnt2List = counterDAO.getScrollableFilteredList(cnt2Filter, 0, -1);
		for (int c2 = 0; c2 < cnt2List.totalCount; c2++) {
			ENPlanWork plan2 = planLogic
					.getPlanByCode(planLogic.getPlanCodeByEstimate(cnt2List.get(c2).estimateItemRefCode));
			if (plan2 != null) {
				ENPlanWorkShort planShort2 = planDAO.getShortObject(plan2.code);
				ENPlanWorkShort planShort = planDAO.getShortObject(plan.code);

				String err = "Це не та точка обліку ( " + planShort.invNumber + " " + planShort.objectName
						+ " ), на яку (" + planShort2.invNumber + " " + planShort2.objectName
						+ ") повинен бути встановлений цей лічильник :((( ";

				if (plan2.elementRef.code != plan.elementRef.code) {
					if (isException) {
						System.out.println("###");
						throw new EnergyproSystemException(err);
					} else {
						System.out.println("###");
						System.out.println(err);
						out = false;
					}
				}
			}

		}
		return out;
	}

	private List<String> getRenByDomain() {
		String domain = userProfile.domainInfo.domain;
		List<String> out = null;

		if (domain.equals("root.blz")) {
			out = Arrays.asList("035");
		} else if (domain.equals("root.ber")) {
			out = Arrays.asList("036");
		} else if (domain.equals("root.ale")) {
			out = Arrays.asList("037");
		} else if (domain.equals("root.vsp")) {
			out = Arrays.asList("038");
		} else if (domain.equals("root.gp")) {
			out = Arrays.asList("039");
		} else if (domain.equals("root.var")) {
			out = Arrays.asList("040");
		} else if (domain.equals("root.sk")) {
			out = Arrays.asList("041");
		} else if (domain.equals("root.cr")) {
			out = Arrays.asList("043");
		} else if (domain.equals("root.hges")) {
			out = Arrays.asList("052");
		} else if (domain.equals("root.lep")) {
			out = Arrays.asList("070");
		} else if (domain.equals("root.gn")) {
			out = Arrays.asList("072");
		} else if (domain.equals("root.gor")) {
			out = Arrays.asList("073");
		} else if (domain.equals("root.iva")) {
			out = Arrays.asList("076");
		} else if (domain.equals("root.kal")) {
			out = Arrays.asList("074");
		} else if (domain.equals("root.kah")) {
			out = Arrays.asList("075");
		} else if (domain.equals("root.nkah")) {
			out = Arrays.asList("080", "054");
		} else if (domain.equals("root.nt")) {
			out = Arrays.asList("078");
		} else if (domain.equals("root.cha")) {
			out = Arrays.asList("079");
		}

		if(out == null) {
			out = Arrays.asList("0");
		}

		return out;
	}

	public int closePlanServiceObj(int planCode_) {

		int out = Integer.MIN_VALUE;
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

		ENPlanWork plan;

		try {
			plan = planLogic.getPlanByCode(planCode_);

			if (plan != null) {
				if (plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT) {
					throw new EnergyproSystemException("\n\n "
							+ "Помилка: тип плану повинен бути - Роботи на сторону!!!\n" + "код плану := " + planCode_);
				}
			} else {
				throw new EnergyproSystemException(
						"\n\n " + "Помилка при визначенні плану!!!\n" + "код плану := " + planCode_);
			}

			if (plan.kind.code != ENPlanWorkKind.NPW) {
				throw new EnergyproSystemException("\n\n " + "Помилка -  вид плану повинен бути - наряд-завдання!!!\n"
						+ "код плану := " + planCode_);
			}

			// найдем факт под этот план ..
			ENPlanWork planFact = null;
			int factCode = planLogic.getFactCode4NPZ(planCode_);

			if (factCode != Integer.MIN_VALUE) {
				planFact = planLogic.getPlanByCode(factCode);
				out = planFact.code;
				if (planFact.status.code == ENPlanWorkStatus.LOCKED) {
					throw new EnergyproSystemException("\n\n" + "Завдання-факт вже затверджено на цю дату!");
				}
			} else {

				boolean parameterizationCounter = true;
				factCode = planLogic.closePlan(planCode_, parameterizationCounter);
				planFact = planLogic.getPlanByCode(factCode);

				if (planFact != null) {
					planFact.dateStart = planFact.dateFinal = plan.dateStart;
					planLogic.save(planFact);
					out = planFact.code;
				}
			}

			return out;

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage());
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Нет связи с EnergyNet");
		}

	}

	static final int [] f1 = {500014755,500019934,2017024704,2017041447,2017041449,2017041452,2017041455,
		2017041444,
		2017041449,
		500020889,
		500011768,
		2017041452,
		2017041482,
		2017041485,
		500020888,
		2017073819
	};

	static final int [] f3 = {75001711,75001712,75001715,75001717,2017041450,2017041457,2017041458,
		2017041499,
		75001465,
		2017041458,
		500020891,
		2017041473,
		2017041457,
		2017041459,
		500020890
	};

	private boolean checkTechCard(int phasity,int planCode_) {
		boolean isCompatible=false;
		try {
		ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
		ENPlanWorkItemShortList piList;
		piFilter.planRef.code = planCode_;
		piFilter.conditionSQL = "countgen > 0";
		piList=pwiDAO.getScrollableFilteredList(piFilter, piFilter.conditionSQL, 0, -1);
		for (int j=0;j<piList.list.size();j++) {

		if (isCompatible) {
			break;
		}

		if (phasity==1) {

		for (int i=0;i<f1.length;i++) {
			if (piList.get(j).kartaRefCode==f1[i]) {
				isCompatible=true;
				break;
			}
		}

		} else {

			for (int i=0;i<f3.length;i++) {
				if (piList.get(j).kartaRefCode==f3[i]) {
					isCompatible=true;
					break;
				}
			}

		}
		}
	} catch (Exception e) {
		throw new EnergyproSystemException(e);
	}
		return isCompatible;
	}

	/**
	 *
	 * Получить код источника прихода по инвентарному номеру счетчика
	 *
	 * @param invNumber инвентарный номер счетчика
	 * @return код источника прихода
	 */
	public String getIncomeKodIst(String invNumber) {
		String sql =  " select o.kod_ist from countersread.ostable o "+
	       	       		 " where o.kod_inv= ? " +
	       	       		 " and o.parent_num_un is null "+
	       	       		 " and o.num_oper < ? " +
	       	       		 " order by o.num_un ";

		Vector<Object> bindedObjects = new Vector<Object>();
		bindedObjects.set(1, invNumber);
		bindedObjects.set(2, 8);

		return BaseDAOUtils.executeStatementAndReadObject(null, sql, bindedObjects
				, new BaseDAOUtils.StringFromResultSetTransformator(), false);
	}

	// isInstall - 1 - установка, 0 - снятие ...
	public int installCounter(int planCode_, int kartaRefCode, SCCounter counter, int isInstall, String tabNumber)
			throws PersistenceException {

		int scPlanCode = Integer.MIN_VALUE;
		PlanWorkLogic planLogic = null;

		try {

			if (kartaRefCode == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("Відсутній код техкарти!!!");
			}

			planLogic = new PlanWorkLogic(connection, userProfile);
			ENMolDAO molDao = new ENMolDAO(connection, userProfile);
			int isService = 0;

			ENPlanWork plan1 = planLogic.getPlanByCode(planCode_);

			if (plan1 != null) {
				if (plan1.typeRef.code == ENPlanWorkType.WORK_IN_OUT) {
					isService = 1;
				}
			} else {
				throw new EnergyproSystemException(
						"\n\n " + "Помилка при визначенні плану!!!\n" + "код плану := " + planCode_);
			}

			if (plan1.kind.code != ENPlanWorkKind.NPW) {
				throw new SystemException("Вказаний код плана не НПЗ!");
			}

			SCCounterDAO scDAO = new SCCounterDAO(connection, userProfile);
			SCCounterFilter scFilter = new SCCounterFilter();
			SCCounterShortList scList;

			ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
			String accountZKU = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_ZKU);

			// могут быть счетчики АБОНв для безоплатной передачи
			// хотя scCode может быть уже не тот ;)

			WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);

			if (counter.invNumber != null) {
				if ((counter.invNumber.trim().length() != 0) && (counter.scCode == Integer.MIN_VALUE)) {
					throw new EnergyproSystemException("\n\n" + "Помилка при передачі лічільника ... є інв. № "
							+ counter.invNumber + ", і його немає у СканСчетчик ...");
				}
			}

			// Биллинг снимая не знает код в СК + мы дергаем 2 РАЗА !!!!!!!!!!
			// переделать
			if (isInstall == 0) {
				if (counter.invNumber != null) {

					ENMetrologyCounterFilter mcFilter = new ENMetrologyCounterFilter();
					mcFilter.invNumber = counter.invNumber.trim();
					mcFilter.buildNumber = counter.buildNumber.trim();

					ENMetrologyCounterShortList mcList = getCountersListFromScanCounter(mcFilter, 0, -1);

					if (mcList.totalCount == 0) {
						throw new EnergyproSystemException("\n\n" + "Лічильник з заводським номером "
								+ counter.buildNumber + " та інвентарним номером " + counter.invNumber
								+ " НЕ знайдено в СканЛічильниках ... перевірте реквізити лічильника ...");
					}

					// снятие не своего подотчета ...
					// типа не совпадают РЭСы у тех кто поставил и кто снял ;)
					ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(planCode_);
					FINMolDataDAO ffDAO = new FINMolDataDAO(connection, userProfile);
					FINMolDataFilter fff = new FINMolDataFilter();
					fff.workOrder.code = wo.code;
					fff.molTypeRef.code = FINMolType.MASTER;
					FINMolDataShortList ffList = ffDAO.getScrollableFilteredList(fff, 0, -1);

					if (ffList.totalCount > 0) {
						if (!mol2podr(mcList.get(0).molCode).equals(mol2podr(ffList.get(0).finMolCode))) {
							if ((!(((mol2podr(mcList.get(0).molCode).equals("051"))
									&& (mol2podr(ffList.get(0).finMolCode).equals("052")))
									|| (
											((mol2podr(mcList.get(0).molCode).equals("052"))	&& (mol2podr(ffList.get(0).finMolCode).equals("051"))) ||
											((mol2podr(mcList.get(0).molCode).equals("052"))	&& (mol2podr(ffList.get(0).finMolCode).equals("042"))) ||
											((mol2podr(mcList.get(0).molCode).equals("051"))	&& (mol2podr(ffList.get(0).finMolCode).equals("042"))) ||
											((mol2podr(mcList.get(0).molCode).equals("042"))	&& (mol2podr(ffList.get(0).finMolCode).equals("051"))) ||
											((mol2podr(mcList.get(0).molCode).equals("042"))	&& (mol2podr(ffList.get(0).finMolCode).equals("052"))) ||
											((mol2podr(mcList.get(0).molCode).equals("078"))	&& (mol2podr(ffList.get(0).finMolCode).equals("072"))) ||
											((mol2podr(mcList.get(0).molCode).equals("072"))	&& (mol2podr(ffList.get(0).finMolCode).equals("078")))


										)

									))
								&& (
										(!(mol2podr(ffList.get(0).finMolCode).equals("009"))) &&
										(!(mol2podr(mcList.get(0).molCode).equals("009")))
									)
								)
							{}
								/*
								throw new EnergyproSystemException("\n\n"
										+ "Не співпадають підрозділи у того, хто встановив лічильник ("
										+ mol2podr(mcList.get(0).molCode) + ") і у того хто його знімає ("
										+ mol2podr(ffList.get(0).finMolCode) + ")... інв № " + counter.invNumber);
								*/
						}
					}

					counter.scCode = mcList.get(0).scCode;

					// 24.12.2021 И.Н.С. Убираем проверки МОЛов 
					// checkMolCodesForCounter(mcList.get(0).molCode, plan1);
				}
			}

			// типа НАШ счетчик
			ENMetrologyCounterShort mcShort = new ENMetrologyCounterShort();
			if ((counter.invNumber != null) && (counter.scCode != Integer.MIN_VALUE)) {

				ENMetrologyCounterFilter mcFilter = new ENMetrologyCounterFilter();
				mcFilter.invNumber = counter.invNumber.trim();
				mcFilter.buildNumber = counter.buildNumber.trim();

				// или по КОДУ ...
				if (counter.scCode != -1) {
					mcFilter.scCode = counter.scCode;
				}

				ENMetrologyCounterShortList mcList = getCountersListFromScanCounter(mcFilter, 0, -1);

				if (mcList.totalCount != 1) {
					throw new EnergyproSystemException(
							"\n\n" + "Кол-во счетчиков не равно 1 (" + mcList.totalCount + ", код в СК="
									+ counter.scCode + "), инв №" + counter.invNumber + " зав №" + counter.buildNumber);
				}

				if (mcList.totalCount > 0) {
					mcShort = mcList.get(0);
					
					// 30.11.2021 Согласовано устно с центральной бухгалтерией - если в справочнике МОЛ статус стоит запрещен
					// то программа не должна давать ничего делать с ним
					if(mcShort.molCode != null && mcShort.molCode.trim().length() > 0) molDao.checkMolStatus(mcShort.molCode);

					// не с того счета снимают ...
					chkAccount4Install(isInstall, mcShort.account, counter.isMoveToZKU);

					// net-4443 // если услуги по установке многотарифн счетч то
					// если счетчик залочен в 7 то разлочим
					if (isService == 1) {
						ENPlanWork plObj = planLogic.getPlanByCode(planCode_);
						ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
						ENServicesObject soObj = soLogic.getServicesObjectByElementCode(plObj.elementRef.code);
						boolean replaceCounterServices = soLogic.checkReplaceCounterServices(plObj.elementRef.code);

						System.out.println(" lockSc counter.scCode = " + counter.scCode);
						System.out.println(" lockSc mcList.totalCount = " + mcList.totalCount);
						System.out.println(" lockSc counter.account = " + mcShort.account);
						System.out.println(" lockSc replaceCounterServices = " + replaceCounterServices);
						System.out.println(" lockSc mcShort.lockCode = " + mcShort.lockCode);

						if (mcShort.account.equals(RQConsts.SCCOUNTER_PARAMETERIZED_MULTIFUNCTIONAL_COUNT)
								&& replaceCounterServices
								&& mcShort.lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK) {
							this.lockCounterInSC_(counter.scCode, soObj.contractNumberServices,
									soObj.contractDateServices, ((-1) * ENMetrologyCounter.SERVICES_COUNTERS_LOCK));
						}

					}

				}

				ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(planCode_);
				
				// SUPP-106872 Проверим lock перед 
				if(!(mcShort.invNumber == null || mcShort.invNumber.trim().length() == 0)) {
					this.checkCounterLock(counter.scCode);
				}
				
				// 16.04.2018 В этом месте не ставился lock для счетчиков, что приводило
				// к их повторному резервированию в наряд-заданиях, что в свою очередь приводило к ошибкам,
				// когда проводили одну ОЗ с наряд-заданиями и не могли провести другую ОЗ с наряд-заданиями, потому
				// что попали одни и те же счетчики.
				if (!(mcShort.account.equals("1534") && (mcShort.invNumber == null || mcShort.invNumber.trim().length() == 0))) {
					lockCounterInSC_(counter.scCode,
							"№ нар." + wo.workOrderNumber + " (" + counter.installOrderNumber + ")", counter.dateIn,
							ENMetrologyCounter.BILLING_LOCK);
				}

			} else {
				// типа Абона и он отдает нам
				// ENMetrologyCounterShort mcShort = new
				// ENMetrologyCounterShort();
				mcShort.buildNumber = counter.buildNumber;
				mcShort.dateBuild = counter.dateBuild;
				mcShort.scCode = Integer.MIN_VALUE;
				mcShort.counterType = counter.name;

				mcShort.dateIn = counter.dateIn;

				// теперь приходят установки Абоновских сч-ков ...
				if (isInstall == 1) {
					// mcShort.account = "";
					// ПОСТОЙ мол будет признаком ... ;)
					mcShort.molCode = null;
					mcShort.departmetFKCode = null;
					// залогируем хитрый счетчик .. шоб проверить ;))
					System.out.println("### Поставили счетчик абона ... " + mcShort.buildNumber);

				} else if (isInstall == 0) {
					mcShort.molCode = counter.molCode;
					mcShort.departmetFKCode = mol2podr(counter.molCode);

				} else {
					throw new EnergyproSystemException("isInstall = " + isInstall);
				}
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

			// из билинга заскочил уже установленный ;))

			SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);
			TKTechCardDAO techCardDao = new TKTechCardDAO(connection, userProfile);

			SCCounterFilter cntFilter = new SCCounterFilter();
			cntFilter.buildNumber = mcShort.buildNumber;
			if (mcShort.invNumber != null && mcShort.invNumber != "") {
				cntFilter.invNumber = mcShort.invNumber;
			}
			cntFilter.departmetFKCode = mcShort.departmetFKCode;
			cntFilter.statusRef.code = SCCounterStatus.GOOD;
			cntFilter.kindRef.code = SCCounterKind.FOR_FACT;

			// установка и снятие может проходить ...
			if (isInstall == 1) {
				cntFilter.conditionSQL = SCCounter.estimateItemRef_QFielld
						+ " = (select ee.code from enestimateitem ee where ee.code = SCCOUNTER.ESTIMATEITEMREFCODE "
						+ "and ee.kindrefcode = " + ENEstimateItemKind.MATERIALS + ")";
			} else {
				cntFilter.conditionSQL = SCCounter.estimateItemRef_QFielld
						+ " = (select ee.code from enestimateitem ee where ee.code = SCCOUNTER.ESTIMATEITEMREFCODE "
						+ "and ee.kindrefcode = " + ENEstimateItemKind.UNMOUNT + ")";
			}

			if (mcShort.invNumber == null || mcShort.invNumber == "") {
				cntFilter.conditionSQL = cntFilter.conditionSQL + " AND " + SCCounter.invNumber_QFielld
						+ " IS NOT NULL ";
			}
			int[] cntArr = counterDAO.getFilteredCodeArray(cntFilter, 0, -1);
			if (cntArr.length > 0) {
				throw new EnergyproSystemException(
						"\n\n" + "Вже є необроблений лічильник з серійним номером " + mcShort.buildNumber + "");
			}

			////////////////////////////////////////////////////////////////////////////////////////////////
			ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
			String techkardsZKU = settingsLogic.getValue(ENSettingsKeysConsts.TECHKARDS_FOR_ZKU);

			ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
			piFilter.planRef.code = planCode_;
			piFilter.conditionSQL = "countgen > 0";
			if (isService != 1) {
				piFilter.kartaRef.code = kartaRefCode;
			}
			int[] piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
			if (piArr.length == 0) {
				if (counter.phasity == null) {
					if (counter.estimateItemRef.code > 0) {
						counter.phasity = new BigDecimal(counter.estimateItemRef.code);
					} else {
						counter.phasity = new BigDecimal(1);
					}
				}

				if (counter.isZKU == 1) {
/*
					if (counter.phasity.doubleValue() == 1) {
						kartaRefCode = 2017041485;
						piFilter.kartaRef.code = 2017041485; // 1zku
					} else {
						kartaRefCode = 2017041459;
						piFilter.kartaRef.code = 2017041459; // 3zku
					}
*/
					if (techkardsZKU.contains(Integer.toString(kartaRefCode))) {
						piFilter.kartaRef.code = kartaRefCode;
					}
					
					piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
					if (piArr.length == 0) {
						if (isService != 1) {
							TKTechCard techCard = techCardDao.getObject(kartaRefCode);

							throw new EnergyproSystemException("\n\n" + "На НПЗ немає потрібної роботи! - "
									+ techCard.techKartNumber + " " + techCard.name);
						}
					}

				} else {
					if (isService != 1) {
						if (!checkTechCard(counter.phasity.intValue(),planCode_)) {
						throw new EnergyproSystemException("\n\n" + "На НПЗ немає потрібної роботи! План:" + planCode_
								+ ", техкарта: " + kartaRefCode);
						}
					}
				}
			}

			int currPlanCode = planLogic.getParentCurrentPlanCode(planCode_);
			piFilter = new ENPlanWorkItemFilter();
			piFilter.planRef.code = currPlanCode;
			piFilter.conditionSQL = "countgen > 0";
			if (isService != 1) {
				piFilter.kartaRef.code = kartaRefCode;
			}
			piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
			if (piArr.length == 0) {
				if (isService != 1) {
					if (!checkTechCard(counter.phasity.intValue(),currPlanCode)) {
					  throw new EnergyproSystemException("\n\n" + "На місячному плані немає потрібної роботи!");
					}
				}
			}
			////////////////////////////////////////////////////////////////////////////////////////////////

			// из Биллинга пришел код НПЗ .. мы его закрыли .. и имеем код ФАКТА
			// ...
			// может прийти код уже закрытого плана - типа установка после
			// снятия (при замене)
			ENPlanWork plan = planLogic.getPlanByCode(planCode_);

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(plan.dateStart);

			Calendar calendar1 = Calendar.getInstance();
			calendar1.setTime(counter.dateIn);

			System.out.println("plan- " + plan.dateStart + ", counter.dateIn- " + counter.dateIn);

			if ((calendar.get(Calendar.YEAR) != calendar1.get(Calendar.YEAR))
					|| (calendar.get(Calendar.MONTH) != calendar1.get(Calendar.MONTH))
					|| (calendar.get(Calendar.DATE) != calendar1.get(Calendar.DATE))) {

				if (isService != 1) {
					System.out.println("type plan=" + planLogic.getPlanByCode(planCode_).typeRef.code);
					System.out.println("isService=" + isService);
					throw new EnergyproSystemException("\n\n"
							+ "Дата початку робіт в завдані-план повинна співпадати з датою наряду на заміну лічильника!");
				}
			}

			System.out.println("plan.dateStart_old=" + plan.dateStart);

			counter.dateIn = com.ksoe.energynet.util.Tools.clearTimeOfDate(counter.dateIn);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			counter.dateIn = dateFormat.parse(dateFormat.format(counter.dateIn));

			plan.dateStart = plan.dateFinal = counter.dateIn;

			System.out.println("plan.dateStart_new=" + plan.dateStart);

			if (plan.status.code == ENPlanWorkStatus.GOOD) {
				planLogic.save(plan);
				plan = planLogic.getPlanByCode(planCode_);
			}

			if ((plan.kind.code == ENPlanWorkKind.NPW) && (plan.status.code == ENPlanWorkStatus.LOCKED)) {
				// найдем факт под этот план ..
				scPlanCode = planLogic.getFactCode4NPZ(planCode_);

				ENPlanWork planFact = planDAO.getObject(scPlanCode);

				if (planFact.status.code == ENPlanWorkStatus.LOCKED) {
					throw new EnergyproSystemException("\n\n" + "Завдання-факт вже затверджено на цю дату!");
				}
			} else {
				scPlanCode = planLogic.closePlan(planCode_);
				plan = planDAO.getObject(scPlanCode);
				plan.dateStart = plan.dateFinal = counter.dateIn;
				planLogic.save(plan);
			}

			ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

			if (isInstall == 1) {
				// Сохраним ТУ
				ENRecordPointByt rpElement;
				ENRecordPointBytFilter rpFilter = new ENRecordPointBytFilter();
				ENRecordPointBytShortList rpList;

				Context cntr = new InitialContext();
				Object objrRef = cntr.lookup(ENRecordPointBytController.JNDI_NAME);
				ENRecordPointBytControllerHome rpHome = (ENRecordPointBytControllerHome) PortableRemoteObject
						.narrow(objrRef, ENRecordPointBytControllerHome.class);
				ENRecordPointBytController rpController = rpHome.create();

				ENRecordPointBytDAO rpBytDAO = new ENRecordPointBytDAO(connection, userProfile);

				ENPlanWork plansc = planDAO.getObject(scPlanCode);
				rpFilter.element.code = plansc.elementRef.code;
				rpList = rpBytDAO.getScrollableFilteredList(rpFilter, 0, 1);

				if (rpList.list.size() > 0) {
					rpElement = rpBytDAO.getObjectNoSegr(rpList.get(0).code);
					rpElement.serialNumber = counter.buildNumber;
					rpElement.invNumber = counter.invNumber;
					rpElement.counterType = counter.counterType;
					rpElement.phasity = counter.phasity;
					rpElement.dateCounterInst = plansc.dateStart; // counter.dateIn;
					rpElement.dateCounterCheck = counter.dateCheck;
					rpElement.classAccuracy = counter.classAccuracy;
					rpElement.checkperiod = counter.checkperiod;
					rpElement.datecheck = counter.dateNewPeriodCheck;
					rpElement.checkperiod1 = counter.checkperiod1;

					rpController.save(rpElement);
				}
			}

			if (isService != 1) {
				// подкиенм работника в Хумены ...
				if (tabNumber != null) {
					ENHumenItemDAO humenDAO = new ENHumenItemDAO(connection, userProfile);
					ENHumenItemFilter humenFilter = new ENHumenItemFilter();
					humenFilter.planRef.code = scPlanCode;
					humenFilter.conditionSQL = "enhumenitem.planitemrefcode in "
							+ "(select pi.code from enplanworkitem pi where pi.countgen >0 and pi.planrefcode = "
							+ scPlanCode + " and pi.kartarefcode = " + kartaRefCode + ")"
							// " and enhumenitem.finworkercode is null"
							+ "";

					System.out.println("####");
					System.out.println("TN " + tabNumber);
					System.out.println("user " + userProfile.userName);

					ENHumenItemShortList humenList = humenDAO.getScrollableFilteredList(humenFilter, 0, -1);
					if (humenList.totalCount == 1) {
						if (humenList.get(0).finWorkerCode == Integer.MIN_VALUE) {
							// Типа работник 1 и он не заполнен ...

							// нету связи .. пусть меняют .. потом привязывают
							// руками
							FINWorkerDAO finWorkerFKDAO = null;
							finWorkerFKDAO = new FINWorkerDAO(finConnection, userProfile);

							if (finWorkerFKDAO != null) {
								FINWorkerDAO fwDAO = new FINWorkerDAO(connection, userProfile);
								FINWorkerFilter fwFilter = new FINWorkerFilter();
								fwFilter.tabNumber = tabNumber;
								fwFilter.departmentCode = "" + plan.finExecutor.finCode;

								System.out.println("####");
								System.out.println("department = " + plan.finExecutor.name);

								FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(fwFilter, 0, -1,
										plan.dateStart, true);
								if (fList.totalCount == 1) {

									System.out.println("####");
									System.out.println("worker = " + fList.get(0).name);
									// проверим является ли воркер инвалидом
									// дата среза проверки принимаем на дату
									// старт плана
									Date date_srez = plan.dateStart;

									FINLogic fLogicFin = new FINLogic(finConnection, userProfile);
									HumenLogic hLogic = new HumenLogic(connection, userProfile);

									FINWorker w = new FINWorker();
									w.categor = fList.get(0).categor;
									w.departmentCode = fList.get(0).departmentCode;
									w.departmentName = fList.get(0).departmentName;
									w.finCode = fList.get(0).finCode;
									w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER
											: fList.get(0).categor;// fList.get(0).kindRefCode;
									w.name = fList.get(0).name;
									w.positionCode = fList.get(0).positionCode;
									w.positionName = fList.get(0).positionName;
									w.priceGen = fList.get(0).priceGen;
									w.tabNumber = fList.get(0).tabNumber;
									w.isSentAssignment = 0;
									/////
									w.categorId = fList.get(0).categorId;
									w.categorName = fList.get(0).categorName;
									w.workTimeId = fList.get(0).workTimeId;
									/////
									// MDAX-441
									w.positionId = fList.get(0).positionId;

									// если инвалид тогда проставляем в
									// финворкер процент отчислений со
									// справочника FINCHARGEHISTORY и тип
									// отчислений FINChargeType = 2
									// иначе процент отчислений также берем со
									// справочника но только для обычных
									// работников FINChargeType = 1

									if (fLogicFin.getCheckIsInvalid(fList.get(0).tabNumber, date_srez) > 0) {
										// если инвалид
										w.chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,
												date_srez);
										w.chargeRef.code = FINChargeType.IS_INVALID;
									} else { // если НЕ инвалид
										w.chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,
												date_srez);
										w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
									}

									fwDAO.add(w);

									ENHumenItem h = humenDAO.getObject(humenList.get(0).code);
									h.finWorker.code = w.code;
									h.commentGen = "табельный из Штатного";
									humenDAO.save(h);
								}
							}
						}
					}
				}
			}

			int estimateItemCode = Integer.MIN_VALUE;
			int estimateItemNPZCode = Integer.MIN_VALUE;

			ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
			EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);

			int matCodeZKU = Integer.MIN_VALUE;

			// установка
			if (isInstall == 1) {
				// найдем Эстимэйт
				ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
				estFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;
				estFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
				estFilter.planRef.code = scPlanCode;

				if (isService != 1) {

					if (counter.estimateItemRef.code == 1) {
						estFilter.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1F;
					} else if (counter.estimateItemRef.code == 3) {
						estFilter.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3F;
					} else {
						throw new EnergyproSystemException("\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
					}

				} else {

					if (counter.estimateItemRef.code == 1) {
						estFilter.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1FService;
					} else if (counter.estimateItemRef.code == 3) {
						estFilter.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3FService;
					} else {
						throw new EnergyproSystemException("\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
					}
				}

				// както бы еще фильтрануть .. кол-во работ и т.д.
				// или уже развязанный проверка ниже и быстрее ;)
				// estFilter.conditionSQL = "enestimateitem.countfact <> 0";

				if (isService != 1) {
					estFilter.conditionSQL = "enestimateitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem "
							+ " where enplanworkitem.countgen > 0 and enplanworkitem.planrefcode = enestimateitem.planrefcode "
							+ "   and enplanworkitem.kartarefcode = " + kartaRefCode + ")";

				}

				// ENEstimateItemShortList estList =
				// estDAO.getScrollableFilteredList(estFilter, 0, -1);
				int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

				if (estArr.length == 0) {
					ENEstimateItem est = new ENEstimateItem();
					est.planRef.code = scPlanCode;
					est.accountingTypeRef.code = TKAccountingType.COUNTERS;
					est.kindRef.code = ENEstimateItemKind.MATERIALS;
					est.statusRef.code = ENEstimateItemStatus.PRESENT;
					est.countGen = est.price = est.cost = new BigDecimal(0);
					est.countFact = new BigDecimal(1);

					// для демонтажа - в Естимейте - признак одна(0) или три(1)
					// фазы ...
					if (isService != 1) {

						if (counter.estimateItemRef.code == 1) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1F;
						} else if (counter.estimateItemRef.code == 3) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3F;
						} else {
							throw new EnergyproSystemException(
									"\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
						}
					} else {

						if (counter.estimateItemRef.code == 1) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1FService;
						} else if (counter.estimateItemRef.code == 3) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3FService;
						} else {
							throw new EnergyproSystemException(
									"\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
						}

					}

					piFilter = new ENPlanWorkItemFilter();
					piFilter.planRef.code = scPlanCode;
					if (isService != 1) {
						piFilter.kartaRef.code = kartaRefCode;
					}
					piFilter.conditionSQL = "countgen > 0";

					piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);

					if (piArr.length >= 1) {
						est.planItemRef.code = piArr[0];
						est.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
					} else {
						if (piArr.length == 0) {
							if (isService != 1) {
								throw new EnergyproSystemException("\n\n" + "На Факті немає потрібної роботи!");
							}
						}
					}

					estimateItemCode = estDAO.add(est);

					// + свяжем их ... scPlanCode - факт
					// есть ли на НПЗ ...
					// фильтр залит как надо ... меняем ТОЛЬКО код плана
					estFilter.planRef.code = planCode_;
					estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
					// нет создадим ...
					if (estArr.length == 0) {
						est.planRef.code = planCode_;

						piFilter = new ENPlanWorkItemFilter();
						piFilter.planRef.code = planCode_;
						if (isService != 1) {
							piFilter.kartaRef.code = kartaRefCode;
						}
						piFilter.conditionSQL = "countgen > 0";
						piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);

						if (piArr.length == 1) {
							est.planItemRef.code = piArr[0];
							est.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
						} else {
							if (piArr.length == 0) {
								if (isService != 1) {
									throw new EnergyproSystemException("\n\n" + "На НПЗ немає потрібної роботи!");
								}
							}
							est.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
						}

						estimateItemNPZCode = estDAO.add(est);

						if (estimateItemCode != Integer.MIN_VALUE) {
							ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
							e2e.estimateItemOutRef.code = estimateItemCode;
							e2e.estimateItemInRef.code = estimateItemNPZCode;
							e2e.countGen = new BigDecimal(0); // !!! ? типа не
																// было ..
																// значит
																// переход с 0
																// ?????
							e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
							e2eDAO.add(e2e);
						}

					} else {
						// есть - .. по идее оно уже в связке ....
						estimateItemNPZCode = estArr[0];
					}
					// на месячном типа полюбому .. ну да мы не дадим выбрать
					// план? ;) .. стремно !!!

				} else {

					estimateItemCode = estArr[0];

					// это должен быть тот же что и в связках с Месячным
					ENEstimateItem currEstimate = estimateLogic.getCurrentEstimate(estimateItemCode);
					if (currEstimate.code == Integer.MIN_VALUE) {
						if (! checkCounterForFact(mcShort)) {
						//	throw new EnergyproSystemException(
						//			"\n\n" + "немає зв_язку лічильника між місячним планом і НПЗ ... перескладіть НПЗ ...");
							System.out.println("Тут происходит нечто загадочное - " + estimateItemCode);
						}
					}

					ENEstimateItem est = estDAO.getObject(estimateItemCode);
					if (est.countFact.doubleValue() == 0) {
						est.countFact = new BigDecimal(1);
						estDAO.save(est);
					}
				}

				// ставят НОВЫЕ сч-ки ... они под конкретные ТУ
				// if (mcShort.account != null){
				if ((mcShort.account != null)
						&& ((mcShort.account.equals("1530") || (mcShort.account.equals("1531"))))) {

					currPlanCode = planLogic.getParentCurrentPlanCode(planCode_);
					int currEst = Integer.MIN_VALUE;

					estFilter.planRef.code = currPlanCode;
					estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
					// нет создадим ...
					if (estArr.length == 0) {
						ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
						e2e.estimateItemOutRef.code = estimateItemCode;

						/////////////////////
						ENEstimateItem est = new ENEstimateItem();
						est.planRef.code = currPlanCode;
						est.accountingTypeRef.code = TKAccountingType.COUNTERS;
						est.kindRef.code = ENEstimateItemKind.MATERIALS;
						est.statusRef.code = ENEstimateItemStatus.PRESENT;
						est.countGen = est.price = est.cost = new BigDecimal(0);
						est.countFact = new BigDecimal(1);

						// для демонтажа - в Естимейте - признак одна(0) или
						// три(1) фазы ...

						if (isService != 1) {
							if (counter.estimateItemRef.code == 1) {
								est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1F;
							} else if (counter.estimateItemRef.code == 3) {
								est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3F;
							} else {
								throw new EnergyproSystemException(
										"\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
							}
						} else {
							if (counter.estimateItemRef.code == 1) {
								est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1FService;
							} else if (counter.estimateItemRef.code == 3) {
								est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3FService;
							} else {
								throw new EnergyproSystemException(
										"\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
							}

						}

						piFilter = new ENPlanWorkItemFilter();
						piFilter.planRef.code = currPlanCode;
						if (isService != 1) {
							piFilter.kartaRef.code = kartaRefCode;
						}
						piFilter.conditionSQL = "countgen > 0";
						piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
						if (piArr.length >= 1) {
							est.planItemRef.code = piArr[0];
							est.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
						} else {
							if (piArr.length == 0) {
								throw new EnergyproSystemException("\n\n" + "Роботи не знайдені у плані ...");
							}
						}

						currEst = estDAO.add(est);
						//////////////////////////////////////
					} else {
						// типа был мат-л на месячном ...
						currEst = estArr[0];
					}

					if (estimateItemNPZCode != Integer.MIN_VALUE) {
						ENEstimateItem2ENEstimateItemFilter e2e1Filter = new ENEstimateItem2ENEstimateItemFilter();
						// e2e1.estimateItemInRef.code = currEst;
						e2e1Filter.estimateItemOutRef.code = estimateItemNPZCode;
						e2e1Filter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;

						int[] e2e1Arr = e2eDAO.getFilteredCodeArray(e2e1Filter, 0, -1);

						if (e2e1Arr.length == 0) {
							ENEstimateItem2ENEstimateItem e2e1 = new ENEstimateItem2ENEstimateItem();
							e2e1.estimateItemInRef.code = currEst;
							e2e1.estimateItemOutRef.code = estimateItemNPZCode;
							e2e1.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
							e2e1.countGen = new BigDecimal(0);
							e2eDAO.add(e2e1);
						}
					}

					if (currEst != Integer.MIN_VALUE) {
						if (!estimateLogic.checkCurrentEstimateInFKOrder(currEst)) {

							int eType = new ElementLogic(connection, userProfile)
									.getElementTypeByCode(plan.elementRef.code);
							int movedEstCode = estDAO.getEstimateForCounterMove(plan.departmentRef.code, eType,
									estFilter.materialRef.code);

							if (movedEstCode == Integer.MIN_VALUE) {
								// от куда можно было перебросить - уже нету
								// счетчиков ...
								// проверим по инвентарному - если про него ниче
								// не знаем - просто ставим ...
								if (mcShort.invNumber != null) {
									ENPlanWorkShort shp = getPlanByInvNumberCounter(mcShort);

									if (shp != null) {
										/**
										 * NET-4422... 27.03.2015 +++ усуги...
										 * переход на многотарифный счетчик...
										 */
										boolean replaceCounterServices = false;
										ServicesLogic soLogic = new ServicesLogic(connection, userProfile);

										if (shp.typeRefCode == ENPlanWorkType.WORK_IN_OUT
												&& soLogic.checkReplaceCounterServices(shp.elementRefCode)) {
											replaceCounterServices = true;
										}

										if (!replaceCounterServices) {
											//throw new EnergyproSystemException("\n\n"
											//		+ "Цей лічильник повинен бути встановлений на ТУ " + shp.invNumber);
										}
									}
								}
							} else {

								ENEstimateItem ee = estDAO.getObject(movedEstCode);
								ee.statusRef.code = ENEstimateItemStatus.MOVED;
								estDAO.save(ee);

								estimateLogic.addStatusHistory(ee.code, ee.statusRef.code,
										ENEstimateItem2Type.COUNTER_MOVED);

								ENEstimateItem2ENEstimateItem e2e1 = new ENEstimateItem2ENEstimateItem();
								e2e1.estimateItemInRef.code = movedEstCode;
								e2e1.estimateItemOutRef.code = currEst;
								e2e1.typeRef.code = ENEstimateItem2Type.COUNTER_MOVED;
								e2e1.countGen = new BigDecimal(1);
								e2eDAO.add(e2e1);
							}

						} else {
							// типа счетчик гдето в наличии (приход, перемещ)
							if (!(((mcShort.account.equals("1530")) || (mcShort.account.equals("1531")))
									&& (mcShort.invNumber != null))) {

								boolean isCounter = validateSCCounter2Plan(plan, mcShort, false);
								if (!isCounter) {
									// счетчик перебросили на другой план ...
									ENEstimateItem2ENEstimateItemFilter e2eFilter = new ENEstimateItem2ENEstimateItemFilter();
									e2eFilter.typeRef.code = ENEstimateItem2Type.COUNTER_MOVED;
									e2eFilter.estimateItemInRef.code = currEst;

									int[] e2eArr = e2eDAO.getFilteredCodeArray(e2eFilter, 0, -1);
									if (e2eArr.length > 0) {
										ENPlanWorkShort shp = getPlanByInvNumberCounter(mcShort);
										System.out.println("###1 estCode = " + estimateItemCode);
										throw new EnergyproSystemException("\n\n" + "Лічильник (" + estimateItemCode
												+ ") перенесено з цього плану на план ... Особовий рахунок "
												+ shp.invNumber + " період виконання " + shp.yearGen + ""
												+ shp.monthGen);
									}

									// счетчик перебросили на ЭТОТ план ...
									e2eFilter.estimateItemInRef.code = Integer.MIN_VALUE;
									e2eFilter.estimateItemOutRef.code = currEst;
									ENEstimateItem2ENEstimateItemShortList e2eList = e2eDAO
											.getScrollableFilteredList(e2eFilter, 0, -1);
									if (e2eList.totalCount == 0) {
										System.out.println("###2 estCode = " + estimateItemCode);
										throw new EnergyproSystemException("\n\n" + "Переносьте лічильник ("
												+ estimateItemCode + ") на цей план ...");
									}

								} else {
									ENPlanWorkShort shp = getPlanByInvNumberCounter(mcShort);
									System.out.println("###3 estCode = " + estimateItemCode);
									throw new EnergyproSystemException("\n\n" + "Переносіть лічильник ("
											+ estimateItemCode + ") з плану (Особовий рахунок " + shp.invNumber
											+ " період виконання " + shp.yearGen + "" + shp.monthGen
											+ ") на цей план ...");
								}
							}
						}
					}
				}
			} // end установка

			// снятие
			if (isInstall == 0) {
				// демонтаж ... создадим Естимэйт ...
				ENEstimateItem est = new ENEstimateItem();
				est.planRef.code = scPlanCode;
				est.accountingTypeRef.code = TKAccountingType.COUNTERS;
				est.kindRef.code = ENEstimateItemKind.UNMOUNT;
				est.statusRef.code = ENEstimateItemStatus.PRESENT;
				est.countGen = est.price = est.cost = new BigDecimal(0);
				est.countFact = new BigDecimal(1);

				// для демонтажа - в Естимейте - признак одна(0) или три(1) фазы
				// ...
				if (isService != 1) {
					if (counter.estimateItemRef.code == 1) {
						if (mcShort.invNumber == null) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1F_OLD;
						} else {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1F;
						}
					} else if (counter.estimateItemRef.code == 3) {
						if (mcShort.invNumber == null) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3F_OLD;
						} else {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3F;
						}
					} else {
						throw new EnergyproSystemException("\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
					}
				} else {

					if (counter.estimateItemRef.code == 1) {
						if (mcShort.invNumber == null) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1FService;
						} else {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_1FService;
						}
					} else if (counter.estimateItemRef.code == 3) {
						if (mcShort.invNumber == null) {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3FService;
						} else {
							est.materialRef.code = TKConsts.TKMATERIALS_COUNTER_3FService;
						}
					} else {
						throw new EnergyproSystemException("\n\n" + "Неизвестная фазность у снимаемого счетчика ...");
					}

				}

				piFilter = new ENPlanWorkItemFilter();
				piFilter.planRef.code = scPlanCode;
				if (isService != 1) {
					piFilter.kartaRef.code = kartaRefCode;
				}
				piFilter.conditionSQL = "countgen > 0";

				piArr = pwiDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);

				if (piArr.length >= 1) {
					est.planItemRef.code = piArr[0];
					est.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;

				} else {
					if (piArr.length == 0) {
						throw new EnergyproSystemException("\n\n" + "Роботи не знайдені у плані ...");
					}
				}

				estimateItemCode = estDAO.add(est);

			} // end снятие

			if (estimateItemCode == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("BUg in estimatessssss");
			}

			// или уже развязанный
			int scCode = getSCCounterCodeByEstimateItem(estimateItemCode);
			if (scCode != Integer.MIN_VALUE) {

				SCCounter cc = counterDAO.getObject(scCode);
				throw new EnergyproSystemException("\n\n"
						+ "На нормативній лічильник вже є прив_язаний РЕАЛЬНИЙ лічільник, инв № = " + cc.invNumber);
			}

			// креатим КОУНТЕР и вяжем с Эстимэйтом ...

			SCLogicDAO scLogicDAO = new SCLogicDAO(finConnection, userProfile);

			SCCounter c = new SCCounter();
			c.kindRef.code = SCCounterKind.FOR_FACT;
			c.invNumber = mcShort.invNumber;
			c.buildNumber = mcShort.buildNumber;
			c.cost = mcShort.cost;
			c.name = mcShort.name;

			// если не наш и снятие - тип нормативный ...
			// или установка ;)
			if (counter.invNumber == null) {
				c.name = mcShort.counterType;
			}

			c.counterType = mcShort.counterType;
			c.dateBuild = mcShort.dateBuild;
			c.departmetFKCode = mcShort.departmetFKCode;
			c.molCode = mcShort.molCode;
			c.account = mcShort.account;

			c.scCode = mcShort.scCode;

			c.dateIn = counter.dateIn; // mcShort.dateIn; // ??? может сразу
										// дату ПЛАНА??? в БД дата прихода
			c.installOrderNumber = counter.installOrderNumber;
			c.dateCheck = counter.dateCheck;
			c.reading = counter.reading;

			c.estimateItemRef.code = estimateItemCode;
			c.statusRef.code = SCCounterStatus.GOOD;
			c.dateEdit = new Date();
			c.isMoveToZKU = counter.isMoveToZKU;
			c.elementcode = counter.elementcode;

			if (counter.estimateItemRef.code > 0) {
				c.phasity = new BigDecimal(counter.estimateItemRef.code);
			} else {
				if (counter.phasity != null) {
					c.phasity = counter.phasity;
				} else {
					c.phasity = new BigDecimal(1);
				}
			}

			c.phasity = new BigDecimal(counter.estimateItemRef.code);
			c.lschet = counter.lschet;
			c.checkperiod = counter.checkperiod;
			c.placeust = scDAO.getAddr(estimateItemCode);
			c.isliquid = counter.isliquid;

			if (counter.isZKU == 1) {
				if (counter.estimateItemRef.code == 1) {
					matCodeZKU = TKConsts.TKMATERIALS_ZKU_1F;
				} else {
					matCodeZKU = TKConsts.TKMATERIALS_ZKU_3F;
				}

				c.namezku = new TKMaterialsDAO(connection, userProfile).getObject(matCodeZKU).name;
				c.accountzku = accountZKU;

				if (counter.isExistsZKU == 1) {
					int numUn = scLogicDAO.getNumUnZKU(
							counter.invNumberCounterInZKU,
							finConnection,
							counter.lschet,
							getRenByDomain());

					if (numUn > 0) {
						c.sccodezku = numUn;
						c.costzku = scLogicDAO.getCostZKU(numUn);
						c.invnumberzku = scLogicDAO.getInvNumberZKU(numUn);
						c.podrCodeZKU = scLogicDAO.getPodrCodeZKU(c.sccodezku);

					} else {
						if (counter.elementcode > 0) {
							scFilter.elementcode = counter.elementcode;
							scFilter.conditionSQL = " sccounter.sccodezku > 0 ";
							scFilter.orderBySQL = " sccounter.code desc ";
							scList = scDAO.getScrollableFilteredList(scFilter, 0, 1);

							if (scList.totalCount > 0) {
								c.sccodezku = scList.get(0).sccodezku;
								c.costzku = scList.get(0).costzku;
								c.invnumberzku = scList.get(0).invnumberzku;
								c.podrCodeZKU = scList.get(0).podrCodeZKU;

							} else {
								throw new EnergyproSystemException("\n\n" + "Не знайдено встановлення ЗКУ в EnergyNet");
							}

						} else {
							throw new EnergyproSystemException("\n\n" + "Не знайдено встановлення ЗКУ в EnergyNet");
						}
					}
				}
			}

			/*Проверка на дату движения счетчика, если счетчик уже имеет операции в СканСчетчик датой позже чем дата плана, то
			 * будет выведена ошибка*/
			if(c.invNumber != null && c.invNumber.length() > 0) {
				int planCodeToCheck = planLogic.getPlanCodeByEstimate(c.estimateItemRef.code);
				ENPlanWork planToCheck = planDAO.getObjectNOSEGR(planCodeToCheck);
				this.checkCounterLastMovementDateWithPlanDate(c, planToCheck);
			}

			c.actInvitationNumber=counter.actInvitationNumber;
			c.dateInvitation=counter.dateInvitation;
			c.fundingType = mcShort.fundingType;

			// 24.12.2021 И.Н.С. Убираем проверки МОЛов
			// checkMolCodesForCounter(c.molCode, plan1);

			counterDAO.add(c);

			return scPlanCode;

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
	}

	// isInstall - 1 - установка, 0 - снятие ...
	public void undoInstallCounter(SCCounter counter, int isInstall, boolean isOpenPlan) throws PersistenceException {
		try {

			SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);

			SCCounterFilter counterFilter = new SCCounterFilter();
			counterFilter.invNumber = counter.invNumber;
			// если не наш - нет инв, есть серийный ...
			counterFilter.buildNumber = counter.buildNumber.trim();
			counterFilter.installOrderNumber = counter.installOrderNumber;

			counterFilter.kindRef.code = SCCounterKind.FOR_FACT;

			// найдем по ин.+ сер .. а дальше посмотрим ...
			// counterFilter.statusRef.code = SCCounterStatus.GOOD;

			// а вдруг устновили и еще не было связи ЕН????????
			// !!!!!!!!!!!!!!!!!!!!!
			int[] counterArr = counterDAO.getFilteredCodeArray(counterFilter, 0, -1);
			if ((counterArr.length > 1)) {
				throw new EnergyproSystemException(
						"Кількість лічильників з серійним номером " + counter.buildNumber + " більше 1 ");
			}

			if ((counterArr.length != 0)) {

			SCCounter scCounter = null;
			if ((counterArr.length != 0)) {
				scCounter = counterDAO.getObject(counterArr[0]);
			}

			if (scCounter!=null) {

			if (scCounter.statusRef.code != SCCounterStatus.GOOD) {
				throw new EnergyproSystemException("Лічильник вже в ОЗ... \n"
						+ "Код лічильника = " + scCounter.code + ".");
			}

			if (scCounter.estimateItemRef == null) {
				throw new EnergyproSystemException("На счетчике нет нормативного мат-ла ... код=" + scCounter.code);
			}

			if (scCounter.estimateItemRef.code == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("На счетчике нет нормативного мат-ла ... код=" + scCounter.code);
			}


			if (scCounter.statusRef.code == SCCounterStatus.IN_ACT) {
				throw new EnergyproSystemException("Цей лічильник вже в сформованому ОЗ-1 ...");
			}

			lockCounterInSC_(scCounter.scCode, "(биллинг)№ нар." + scCounter.installOrderNumber, scCounter.dateIn,
					(-1) * ENMetrologyCounter.BILLING_LOCK);


		}

			PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
			ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
			int planCode = planLogic.getPlanCodeByEstimate(scCounter.estimateItemRef.code);

			// net-4443 // если услуги по установке многотарифн счетч то если
			// счетчик залочен в 7 то разлочим

			ENPlanWork plObj = planLogic.getPlanByCodeNOSEGR(planCode);
			if (plObj.typeRef.code == ENPlanWorkType.WORK_IN_OUT
					&& plObj.stateRef.code == ENPlanWorkState.WORK_IN_OUT) {
				ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
				ENServicesObject soObj = soLogic.getServicesObjectByElementCode(plObj.elementRef.code);
				boolean replaceCounterServices = soLogic.checkReplaceCounterServices(plObj.elementRef.code);

				if (counter.account.equals(RQConsts.SCCOUNTER_PARAMETERIZED_MULTIFUNCTIONAL_COUNT)
						&& replaceCounterServices) {
					this.lockCounterInSC_(scCounter.scCode, soObj.contractNumberServices, soObj.contractDateServices,
							ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
				}
			}

					if (isInstall == 1) {
						counterDAO.remove(scCounter.code);
				// при установке мог быть ДЕМОНТАЖ снятого ...
			} else if (isInstall == 0) {
				counterDAO.remove(scCounter.code);
				estDAO.remove(scCounter.estimateItemRef.code);
			} else {
				throw new EnergyproSystemException("error in isInstall = " + isInstall);
			}

			// отменяем ФАКТ до НПЗ ...
			if (isOpenPlan)
				planLogic.openPlan(planCode, 0);

	 }


		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}

	}

	/**
	 * Проверяем, можно ли привязывать счетчик сразу на Задании-Факте
	 * (т.е. на Месячном плане его может не быть)
	 *
	 * @param counter - счетчик
	 * @return <b>true</b> - если счетчик разрешается привязывать сразу на Факте, иначе <b>false</b>
	 */
	public boolean checkCounterForFact(ENMetrologyCounterShort counter) {
		if (counter.account == null || counter.account.equals("")) {
			return false;
		}

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		try {
			// Счет для счетчиков, приходованных от абонентов (не основные средства)
			Vector<String> accounts = settingsLogic.getVectorWithValues("account.for.counters.income.from.customers");
			if (accounts.contains(counter.account)) {
				return true;
			}
			// Счет для прихода основных средств
			Vector<String> accountsAssets = settingsLogic.getVectorWithValues("account.for.assets.income");
			if (accountsAssets.contains(counter.account)) {
				return true;
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return false;
	}

	/*
	 *
	 * FUNCTION EXPL_PROV_INS ( P_ID_NAKLAD Number, -- id накладной P_KOD_INV
	 * Varchar2, -- Инв № P_TYPEREVISIONID Number, -- id на тип доввода
	 * (energynet.entypeworkstate.code):= 3 P_DATEOPERAC Date, -- Бухгалтерская
	 * дата проведения P_NUMAKT Varchar2, -- Номер акта модернизации P_DATEAKT
	 * Date, -- Дата акта модернизации P_SUMAKT Number, -- Сумма по акту
	 * P_SUMAKTMATERIALS Number, -- Сумма материалов по акту P_SUMAKTZARPLATA
	 * Number, -- Сумма зарплаты по акту P_SUMAKTPENSFOND Number, -- Сумма ЕСВ
	 * по акту P_IS_PROV Number, -- Признак проведения :=1 P_OPER_USER Varchar2
	 * -- Имя пользователя осуществившего прроведение P_OPER_DATE Date –
	 * Дата/время проведеня P_PRIMECHAN Varchar2 -- Описание операции :=
	 * ‘Автоматический ввод в экспл. Energynet.’
	 *
	 * ) RETURN Number -- id
	 */

	public int moveCouterDataInSC__(int P_ID_NAKLAD, String P_KOD_INV, int P_TYPEREVISIONID, Date P_DATEOPERAC,
			String P_NUMAKT, Date P_DATEAKT, BigDecimal P_SUMAKT, BigDecimal P_SUMAKTMATERIALS,
			BigDecimal P_SUMAKTZARPLATA, BigDecimal P_SUMAKTPENSFOND) {
		int out = Integer.MIN_VALUE;

		CallableStatement stmt = null;

		// String constInfo = userProfile.userName + ", " + ;
		String query = "begin ? := countersread.pkg_doc.EXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			// register the type of the out param - an Oracle specific type

			stmt.registerOutParameter(1, java.sql.Types.INTEGER); // OracleTypes.NUMERIC);

			stmt.setInt(2, P_ID_NAKLAD);
			stmt.setString(3, P_KOD_INV);
			stmt.setInt(4, P_TYPEREVISIONID);
			stmt.setDate(5, new java.sql.Date(P_DATEOPERAC.getTime()));
			stmt.setString(6, P_NUMAKT);
			stmt.setDate(7, new java.sql.Date(P_DATEAKT.getTime()));
			stmt.setBigDecimal(8, P_SUMAKT);
			stmt.setBigDecimal(9, P_SUMAKTMATERIALS);
			stmt.setBigDecimal(10, P_SUMAKTZARPLATA);
			stmt.setBigDecimal(11, P_SUMAKTPENSFOND);

			stmt.setInt(12, 1);
			stmt.setString(13, userProfile.userName);
			stmt.setTimestamp(14, new java.sql.Timestamp(new Date().getTime()));
			stmt.setString(15, "Автоматический ввод в экспл. Energynet.");

			// execute and retrieve the result set
			stmt.execute();

			out = stmt.getInt(1);

			return out;

		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in countersread.pkg_doc.EXPL_PROV_INS : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}

	}

	/*
	 *
	 * PROCEDURE EXPL_PROV_SOTR_INS ( P_ID_REVISIONADTA Number, -- id таблицу
	 * довводов (Revision_Data) P_TABN Varchar2, -- Таб. № сотрудника P_BALANS
	 * Varchar2, -- ШПЗ сотрудника сотрудника P_SUMAKTZARPLATA Number, -- Сумма
	 * зарплаты сотрудника P_SUMAKTPENSFOND Number, -- Сумма ЕСВ сотрудника
	 *
	 */

	public void moveCounterAddDataInSC__(int P_ID_REVISIONADTA, String P_TABN, String P_BALANS,
			BigDecimal P_SUMAKTZARPLATA, BigDecimal P_SUMAKTPENSFOND) {
		String query = "begin countersread.pkg_doc.EXPL_PROV_SOTR_INS(?, ?, ?, ?, ?); end;";

		CallableStatement stmt = null;

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setInt(1, P_ID_REVISIONADTA);
			stmt.setString(2, P_TABN);
			stmt.setString(3, P_BALANS);
			stmt.setBigDecimal(4, P_SUMAKTZARPLATA);
			stmt.setBigDecimal(5, P_SUMAKTPENSFOND);
			stmt.execute();

		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in moveCouterAddDataInSC : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}

			} catch (SQLException e) {
			}

		}
	}


	// isTransfer - 1 - передача, 0 - проведение
	public void unTransferInvoiceInSC(int scInvoiceCode, int kindCode, int isTransfer) {

		String procName = "error";
		if (kindCode == SCUsageInputItemKind.UsageInput) {
			if (isTransfer == 1)
				procName = "expl_del";
			else if (isTransfer == 0)
				procName = "expl_prov_del";
			else
				throw new EnergyproSystemException("error in isMove code ..." + isTransfer);
		} else if (kindCode == SCUsageInputItemKind.UsageOut) {
			if (isTransfer == 1)
				procName = "UNEXPL_DEL";
			else if (isTransfer == 0)
				procName = "UNEXPL_PROV_DEL";
			else
				throw new EnergyproSystemException("error in isMove code ..." + isTransfer);
		} else if (kindCode == SCUsageInputItemKind.InputUsing) {
			if (isTransfer == 1)
				procName = "PRIHOD_BU_DEL"; // нема такого может PRIHOD_BU_DEL
			else if (isTransfer == 0)
				procName = "PRIHOD_BU_PROV_DEL";
			else
				throw new EnergyproSystemException("error in isMove code ..." + isTransfer);

		} else
			throw new EnergyproSystemException("Ошибка в коде типа Накладной ...");

		String query;
		CallableStatement stmt = null;

		query = "begin countersread.pkg_doc." + procName + "(?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			// set the in param
			stmt.setInt(1, scInvoiceCode);
			stmt.setString(2, "1");

			// execute and retrieve the result set
			stmt.execute();

		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in deleteInvoiceSC : " + e.getMessage());
		} finally {
			try {

				if (stmt != null)
					stmt.close();
				stmt = null;

			} catch (SQLException e) {
			}
		}
	}

	/*
	 *
	 * 1.1.1.Проведение накладной. PROCEDURE EXPL_OUT_PROV_INS ( P_ID_NAKLAD
	 * Number, -- id накладной P_KOD_INV Varchar2, -- Инв № P_OPER_USER Varchar2
	 * -- Имя пользователя осуществившего прроведение P_OPER_DATE Date –
	 * Дата/время проведеня P_PRIMECHAN Varchar2 -- Описание операции :=
	 * ‘Автоматический ввод из экспл. Energynet.’
	 *
	 * )
	 */
	public void moveCounterUnMountInSC__(int P_ID_NAKLAD, String P_KOD_INV, Date P_DATEOPERAC) {
		CallableStatement stmt = null;

		String query = "begin countersread.pkg_doc.UNEXPL_PROV_INS(?, ?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setInt(1, P_ID_NAKLAD);
			stmt.setString(2, P_KOD_INV);
			stmt.setDate(3, new java.sql.Date(P_DATEOPERAC.getTime()));
			stmt.setString(4, userProfile.userName);
			stmt.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));
			stmt.setString(6, "Автоматический вывод из экспл. Energynet.");
			stmt.execute();
		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in moveCounterUnMountInSC (UNEXPL_PROV_INS): " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/*
	 * 1.1.1.Проведение накладной PROCEDURE PRIHOD_BU_PROV_INS ( P_ID_NAKLAD
	 * Number, -- id накладной P_KOD_SUBSCH_B varchar2, -- Счет P_KOD_PODR
	 * varchar2, -- Код подразделения P_KOD_MOL varchar2, -- Код МОЛа P_KOD_IST
	 * varchar2, -- Код источника прихода P_KOD_ZATR varchar2, -- Код затрат
	 * P_TYPE_COUNTER varchar2, -- Тип счетчика P_CHARACTERS varchar2, --
	 * Примечание P_KOD_NAKL varchar2, -- № накладной прихода P_DT_NAKL date, --
	 * дата накладной прихода P_DT_DOC date, -- Бух дата прихода P_SUM_ST_NDS
	 * number, -- Стоимость с НДС P_SUM_NDS number, -- НДС P_SUM_ST_PERV number,
	 * -- Бух.стоим.приобр. P_PRIMECHAN varchar2 -- Описание операции :=
	 * ‘Автоматический приход б/у. Energynet.’ P_IS_ENERGYNET Varchar2 --
	 * Накладная из Энерджинет := 1
	 */

	public void moveCounterABUnMountInSC(int P_ID_NAKLAD, String P_KOD_SUBSCH_B, String P_KOD_PODR, String P_KOD_MOL,
			String P_KOD_IST, String P_KOD_ZATR, String P_TYPE_COUNTER, String P_CHARACTERS, String P_KOD_NAKL,
			Date P_DT_NAKL, Date P_DT_DOC, BigDecimal P_SUM_ST_NDS, BigDecimal P_SUM_NDS, BigDecimal P_SUM_ST_PERV) {

	}

	public void moveCounterABUnMountInSC__(int P_ID_NAKLAD, String P_KOD_SUBSCH_B, String P_KOD_PODR, String P_KOD_MOL,
			String P_KOD_IST, String P_KOD_ZATR, String P_TYPE_COUNTER, String P_CHARACTERS, String P_KOD_NAKL,
			Date P_DT_NAKL, Date P_DT_DOC, BigDecimal P_SUM_ST_NDS, BigDecimal P_SUM_NDS, BigDecimal P_SUM_ST_PERV) {
		CallableStatement stmt = null;

		String query = "begin countersread.pkg_doc.PRIHOD_BU_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setInt(1, P_ID_NAKLAD);
			stmt.setString(2, P_KOD_SUBSCH_B);
			stmt.setString(3, P_KOD_PODR);
			stmt.setString(4, P_KOD_MOL);
			stmt.setString(5, P_KOD_IST);
			stmt.setString(6, P_KOD_ZATR);
			stmt.setString(7, P_TYPE_COUNTER);
			stmt.setString(8, P_CHARACTERS);
			stmt.setString(9, P_KOD_NAKL);
			stmt.setDate(10, new java.sql.Date(P_DT_NAKL.getTime()));
			stmt.setDate(11, new java.sql.Date(P_DT_DOC.getTime()));

			stmt.setBigDecimal(12, P_SUM_ST_NDS);
			stmt.setBigDecimal(13, P_SUM_NDS);
			stmt.setBigDecimal(14, P_SUM_ST_PERV);

			stmt.setString(15, "Автоматический приход б/у. Energynet.");
			stmt.setString(16, "1");

			stmt.execute();
		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in moveCounterABUnMountInSC : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/*
	 * 1.1.1.Передача счетчиков PROCEDURE PRIHOD_BU_COUNTERS ( P_NAME Varchar2,
	 * -- Наименование счетчика P_NOMER Varchar2, -- Заводской номер счетчика
	 * P_YEAR Varchar2, -- Год выпуска P_ID_NAKLADNIE Number, --id на накладную
	 * P_PRIMECHANIE Varcha2, --примечание установки счетчика к примеру лицевой
	 * : 0628245 адрес : Н.П. ХЕРСОН, Ул УШАКОВА, д.66А, кв.57 Ф.И.О. : ГРЕБЕНЮК
	 * ВЯЧЕСЛАВ ДМИТРИЕВИЧ
	 *
	 * )
	 */

	public void transferCounterABUnMountInSC(String P_NAME, String P_NOMER, String P_YEAR, int P_ID_NAKLADNIE,
			String P_PRIMECHANIE) {
		return;
	}

	public void transferCounterABUnMountInSC__(String P_NAME, String P_NOMER, String P_YEAR, int P_ID_NAKLADNIE,
			String P_PRIMECHANIE) {
		CallableStatement stmt = null;

		String query = "begin countersread.pkg_doc.PRIHOD_BU_COUNTERS(?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setString(1, P_NAME);
			stmt.setString(2, P_NOMER);
			stmt.setString(3, P_YEAR);
			stmt.setInt(4, P_ID_NAKLADNIE);
			stmt.setString(5, P_PRIMECHANIE);
			stmt.execute();
		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in transferCounterABUnMountInSC : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/*
	 * PROCEDURE EXPL_OUT_COUNTERS ( P_NAME Varchar2, -- Наименование счетчика
	 * P_NOMER Varchar2, -- Заводской номер счетчика P_YEAR Varchar2, -- Год
	 * выпуска P_ID_RAZNARYADKA Number, -- id ОЗ-1 P_KOD_INV Varchar2, --
	 * инвентарный номер счетчика
	 *
	 * PROCEDURE UNEXPL_COUNTERS ( P_NAME Varchar2, -- Наименование счетчика
	 * P_NOMER Varchar2, -- Заводской номер счетчика P_YEAR Varchar2, -- Год
	 * выпуска P_PRICE Varchar2, -- Цена P_KOD_SUBSCH_B Varchar2, -- счет
	 * P_ID_RAZNARYADKA Number, -- id ОЗ-1 P_KOD_INV Varchar2, -- инвентарный
	 * номер счетчика
	 *
	 *
	 * )
	 */

	public void transferCounterUnMountInSC__(String P_NAME, String P_NOMER, String P_YEAR, BigDecimal P_PRICE,
			String P_KOD_SUBSCH_B, int P_ID_RAZNARYADKA, String P_KOD_INV) {
		CallableStatement stmt = null;

		String query = "begin countersread.pkg_doc.UNEXPL_COUNTERS(?, ?, ?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setString(1, P_NAME);
			stmt.setString(2, P_NOMER);
			stmt.setString(3, P_YEAR);
			stmt.setBigDecimal(4, P_PRICE);

			stmt.setString(5, P_KOD_SUBSCH_B);
			stmt.setInt(6, P_ID_RAZNARYADKA);
			stmt.setString(7, P_KOD_INV);
			stmt.execute();
		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in transferCounterUnMountInSC : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/*
	 * PROCEDURE EXPL_COUNTERS ( P_NAME Varchar2, -- Наименование счетчика
	 * P_NOMER Varchar2, -- Заводской номер счетчика P_YEAR Varchar2, -- Год
	 * выпуска P_ID_RAZNARYADKA Number, -- id ОЗ-1 P_KOD_INV Varchar2, --
	 * инвентарный номер счетчика P_PRIMECHANIE Varcha2, --примечание установки
	 * счетчика к примеру лицевой : 0628245 адрес : Н.П. ХЕРСОН, Ул УШАКОВА,
	 * д.66А, кв.57 Ф.И.О. : ГРЕБЕНЮК ВЯЧЕСЛАВ ДМИТРИЕВИЧ P_DATE_UST Date, --
	 * Дата установки P_PLACE_UST Varchar2, -- Место установки P_LAST_CHECK_DATE
	 * Date, -- Дата последней поверки P_KOD_NZ Varchar2, -- Номер наряд-задания
	 * P_DATE_NZ Date -- Дата наряд-задания
	 *
	 * )
	 */
	public void transferCounterMountInSC__(String P_NAME, String P_NOMER, String P_YEAR, int P_ID_RAZNARYADKA,
			String P_KOD_INV, String P_PRIMECHANIE, Date P_DATE_UST, String P_PLACE_UST, Date P_LAST_CHECK_DATE,
			String P_KOD_NZ, Date P_DATE_NZ) {
		CallableStatement stmt = null;

		String query = "begin countersread.pkg_doc.EXPL_COUNTERS(?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			stmt.setString(1, P_NAME);
			stmt.setString(2, P_NOMER);
			stmt.setString(3, P_YEAR);
			stmt.setInt(4, P_ID_RAZNARYADKA);
			stmt.setString(5, P_KOD_INV);
			stmt.setString(6, P_PRIMECHANIE);
			stmt.setDate(7, new java.sql.Date(P_DATE_UST.getTime()));
			stmt.setString(8, P_PLACE_UST);
			if (P_LAST_CHECK_DATE != null) {
				stmt.setDate(9, new java.sql.Date(P_LAST_CHECK_DATE.getTime()));
			} else {
				stmt.setNull(9, java.sql.Types.DATE);
			}
			stmt.setString(10, P_KOD_NZ);
			stmt.setDate(11, new java.sql.Date(P_DATE_NZ.getTime()));
			stmt.execute();
		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void transfetOZInSC() {

	}

	/*
	 * P_ID_NAKLAD Number, -- id накладной P_CODE_RAZNAR Varchar2, -- № ОЗ-1
	 * P_DATE_RAZNAR Date, -- Дата ОЗ-1 P_KOD_MOL Varchar2, -- МОЛ получателя по
	 * разнарядке P_KOD_PODR Varchar2, -- цех получателя по разнарядке P_KOLVO
	 * Number, --количество по разнарядке P_NAME_COUNTER Number, --наименование
	 * счетчика в ОЗ-1 P_PRICE_COUNTER Number, --цена счетчика в ОЗ-1 (с учетом
	 * затрат) P_SCHCOUNTER Number --счет счетчика в ОЗ-1
	 */

	public int addOZSC__(int kindCode, int P_ID_NAKLAD, String P_CODE_RAZNAR, Date P_DATE_RAZNAR, String P_KOD_MOL,
			String P_KOD_PODR, int P_KOLVO, String P_NAME_COUNTER, BigDecimal P_PRICE_COUNTER, String P_SCHCOUNTER) {
		int out = Integer.MIN_VALUE;

		CallableStatement stmt = null;

		String procName = "error";
		if (kindCode == SCUsageInputItemKind.UsageInput)
			procName = "expl_raznar";
		else if (kindCode == SCUsageInputItemKind.UsageOut)
			procName = "unexpl_raznar";
		else
			throw new EnergyproSystemException("Ошибка в коде типа Накладной ...");

		// String constInfo = userProfile.userName + ", " + ;
		String query = "begin ? := countersread.pkg_doc." + procName + "(?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

		try {

			stmt = finConnection.prepareCall(query);

			// register the type of the out param - an Oracle specific type

			stmt.registerOutParameter(1, java.sql.Types.INTEGER); // OracleTypes.NUMERIC);

			stmt.setInt(2, P_ID_NAKLAD);
			stmt.setString(3, P_CODE_RAZNAR);
			stmt.setDate(4, new java.sql.Date(P_DATE_RAZNAR.getTime()));

			stmt.setString(5, P_KOD_MOL);
			stmt.setString(6, P_KOD_PODR);
			stmt.setInt(7, P_KOLVO);
			stmt.setString(8, P_NAME_COUNTER);
			stmt.setBigDecimal(9, P_PRICE_COUNTER);
			stmt.setString(10, P_SCHCOUNTER);

			// execute and retrieve the result set
			stmt.execute();

			out = stmt.getInt(1);

			return out;

		} catch (SQLException e) {
			throw new EnergyproSystemException("Error in addInvoice : " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public SCCounterSetupInfo counterInstallPlace(int estimateItemCode, boolean isActData) throws PersistenceException {
		SCCounterSetupInfo out = new SCCounterSetupInfo();
		SCCounterDAO dao = new SCCounterDAO(connection, userProfile);

		out = dao.getSetupInfo(
				estimateItemCode, finConnection);

		if (out == null) {
			throw new EnergyproSystemException(
					"НЕ знайдено даних про встановлення лічильника ... код естімейта = " + estimateItemCode);
		}

		if (!isActData)
			return out;

		// 05.12.2011 - разделение отчислений по неинвалидов и по инвалидам
		ActLogic aLogic = new ActLogic(connection, userProfile);
		String planCodes = aLogic.getPlanCodesByAct(out.actCode);

		FINWorkerDAO fDAO = new FINWorkerDAO(connection, userProfile);
		FINWorkerFilter fiwFilter = new FINWorkerFilter();
		BigDecimal taxPercent = new BigDecimal(0);

		// дотянем данные по ЗП
		BigDecimal salary = new BigDecimal(0);
		BigDecimal tax = new BigDecimal(0);
		ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(connection, userProfile);
		ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
		a2hFilter.actRef.code = out.actCode;
		ENAct2HumenShortList a2hList = a2hDAO.getScrollableFilteredList(a2hFilter, 0, -1);

		if (a2hList.totalCount > 0)
			out.workerData = new Vector<revisionData>();

		for (int i = 0; i < a2hList.totalCount; i++) {
			SCCounterSetupInfo.revisionData wData = out.new revisionData();

			wData.balans = dao.getBalance(a2hList.get(i).tabNumber, a2hList.get(i).actRefDateAct,
					finConnection);

			wData.tabNumber = a2hList.get(i).tabNumber;
			wData.salary = a2hList.get(i).paysWorkBonus; // 11.10.2011 -
															// перебьем
															// paysWork на
															// paysWorkBonus
															// - так как это
															// поле содержит
															// сумму с 50%
															// премии.

			// разделение отчислений по неинвалидов и по инвалидам
			// выберем отчисления для каждого работника из колонки
			// chargepercent таблицы finworker

			// выбор для просто работников
			if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH)
				fiwFilter.conditionSQL = "FINWORKER.CODE " + " IN " + "(SELECT " + " MAX(FINWORKER.CODE) "
						+ " FROM " + " FINWORKER, " + " ENHUMENITEM " + " WHERE "
						+ " FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE " + " AND ENHUMENITEM.PLANREFCODE in ("
						+ planCodes + ")" + " AND FINWORKER.TABNUMBER ='" + a2hList.get(i).tabNumber + "')";
			else
				// выбор для водителей
				fiwFilter.conditionSQL = "FINWORKER.CODE " + " IN " + "(SELECT " + " MAX(FINWORKER.CODE) "
						+ " FROM " + " FINWORKER, " + " ENTRANSPORTITEM " + " WHERE "
						+ " FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE "
						+ " AND ENTRANSPORTITEM.PLANREFCODE in (" + planCodes + ")" + " AND FINWORKER.TABNUMBER ='"
						+ a2hList.get(i).tabNumber + "')";

			// Расчет процента отчислений
			FINWorkerShortList fiwList = fDAO.getScrollableFilteredList(fiwFilter, fiwFilter.conditionSQL, 0, -1);

			if (fiwList.totalCount != 1)
				throw new EnergyproSystemException(
						" Помилка у кількості робітників для табельного номера: " + a2hList.get(i).tabNumber);

			taxPercent = fiwList.get(0).chargePercent.divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);

			wData.tax = wData.salary.multiply(taxPercent).setScale(2, BigDecimal.ROUND_HALF_UP);
			out.workerData.add(wData);
			salary = salary.add(wData.salary).setScale(2, BigDecimal.ROUND_HALF_UP);
			tax = tax.add(wData.tax).setScale(2, BigDecimal.ROUND_HALF_UP);
		}

		out.actSumSalary = salary;
		out.actSumTax = tax;

		SCCounterFilter counterFilter = new SCCounterFilter();
		counterFilter.estimateItemRef.code = estimateItemCode;
		SCCounterShortList counterShortList = dao.getScrollableFilteredList(counterFilter, 0, 1);
		BigDecimal transportCostsForCounter = getTransportCostsForCounter(counterShortList.get(0).code);

		out.actSumTMC = out.actSumTMC.add(transportCostsForCounter);

		out.actSumGen = out.actSumTMC.add(out.actSumSalary).setScale(2, BigDecimal.ROUND_HALF_UP).add(out.actSumTax)
				.setScale(2, BigDecimal.ROUND_HALF_UP);

		return out;
	}

	public SCCounterSetupInfo counterInstallPlaceZKU(int estimateItemCode, boolean isActData)
			throws PersistenceException {
		SCCounterSetupInfo out = new SCCounterSetupInfo();
		SCCounterDAO dao = new SCCounterDAO(connection, userProfile);

		SCCounterFilter scFilter = new SCCounterFilter();
		scFilter.estimateItemRef.code = estimateItemCode;

		SCCounterShortList scList = dao.getScrollableFilteredList(scFilter, 0, -1);

		if (scList.totalCount == 0) {
			throw new EnergyproSystemException(
					"НЕ знайдено даних про встановлення лічильника ... код естімейта = " + estimateItemCode);
		}

		out = dao.getSetupInfoZKU(estimateItemCode,
				finConnection);

		if (out == null) {
			throw new EnergyproSystemException(
					"НЕ знайдено даних про встановлення лічильника ... код естімейта = " + estimateItemCode);
		}

		if (!isActData)
			return out;

		BigDecimal taxPercent = new BigDecimal(0);

		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
		ENEstimateItem eiObj = eiDAO.getObject(estimateItemCode);

		// дотянем данные по ЗП
		BigDecimal salary = new BigDecimal(0);
		BigDecimal tax = new BigDecimal(0);
		ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(connection, userProfile);

		ENAct2HumenShortList a2hList = a2hDAO.getSalaryChargesList(out.actCode);

		ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
		ENHumenItemFilter hFilter = new ENHumenItemFilter();

		double sumTimeAll, sumTimeCounter;

		BigDecimal kzarp = new BigDecimal(0);
		BigDecimal salaryCounter = new BigDecimal(0);
		ENHumenItemShortList hList;

		for (int i = 0; i < a2hList.totalCount; i++) {
			if (out.workerData == null) {
				out.workerData = new Vector<revisionData>();
			}

			if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH) {
				hFilter.planRef.code = eiObj.planRef.code;
				hFilter.conditionSQL = " enhumenitem.CODE in (" + " select hii.code "
						+ " from enhumenitem hii,finworker f,enact2enplanwork a2p "
						+ " where hii.finworkercode=f.code " + " and cast(f.tabnumber as varchar)= '"
						+ a2hList.get(i).tabNumber + "'" + " and hii.planrefcode=a2p.plancode "
						+ " and a2p.actrefcode= " + a2hList.get(i).actRefCode + ")";

				hList = hDAO.getScrollableFilteredList(hFilter, hFilter.conditionSQL, 0, -1);
				sumTimeAll = 0;
				for (int j = 0; j < hList.totalCount; j++) {
					sumTimeAll += hList.get(j).countFact.doubleValue();
				}

				hFilter.planRef.code = eiObj.planRef.code;
				hFilter.conditionSQL = " enhumenitem.CODE in (" + " select hii.code "
						+ " from enhumenitem hii,finworker f,enact2enplanwork a2p,enplanworkitem pi "
						+ " where hii.finworkercode=f.code " + " and cast(f.tabnumber as varchar)= '"
						+ a2hList.get(i).tabNumber + "'" + " and a2p.plancode=pi.planrefcode "
						+ " and pi.code=hii.planitemrefcode " + " and pi.kartarefcode not in ("
						+ ENConsts.TECHCARDS_CONSTS_ZKU + ") " + " and hii.planrefcode=a2p.plancode "
						+ " and a2p.actrefcode= " + a2hList.get(i).actRefCode + ")";

				hList = hDAO.getScrollableFilteredList(hFilter, hFilter.conditionSQL, 0, -1);
				sumTimeCounter = 0;
				for (int j = 0; j < hList.totalCount; j++) {
					sumTimeCounter += hList.get(j).countFact.doubleValue();
				}

				kzarp = new BigDecimal(sumTimeCounter / sumTimeAll).setScale(6, BigDecimal.ROUND_HALF_UP);


				if (scList.get(0).invNumber == null) {
					kzarp = new BigDecimal(0);
				}

				salaryCounter = a2hList.get(i).paysWork.multiply(kzarp).setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			if ((a2hList.get(i).paysWork.subtract(salaryCounter).doubleValue() > 0)
					|| (a2hList.get(i).humenKindRefCode == ENHumenItemKind.DRIVER)) {
				SCCounterSetupInfo.revisionData wData = out.new revisionData();

				wData.balans = dao.getBalance(a2hList.get(i).tabNumber, a2hList.get(i).actRefDateGen,
						finConnection);

				wData.tabNumber = a2hList.get(i).tabNumber;
				wData.salary = a2hList.get(i).paysWork;
				if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH) {
					wData.salary = wData.salary.subtract(salaryCounter);
				}

				taxPercent = a2hList.get(i).chargePercent.divide(new BigDecimal(100)).setScale(4,
						BigDecimal.ROUND_HALF_UP);

				wData.tax = wData.salary.multiply(taxPercent).setScale(2, BigDecimal.ROUND_HALF_UP);
				out.workerData.add(wData);
				salary = salary.add(wData.salary).setScale(2, BigDecimal.ROUND_HALF_UP);
				tax = tax.add(wData.tax).setScale(2, BigDecimal.ROUND_HALF_UP);
				// }
			}
		}

		out.actSumSalary = salary;
		out.actSumTax = tax;
		out.actSumGen = out.actSumTMC.add(out.actSumSalary).setScale(2, BigDecimal.ROUND_HALF_UP).add(out.actSumTax)
				.setScale(2, BigDecimal.ROUND_HALF_UP);

		return out;
	}

	// mm
	public SCCounterSetupInfo counterInstallPlaceWOZKU(int estimateItemCode, boolean isActData)
			throws PersistenceException {
		SCCounterSetupInfo out = new SCCounterSetupInfo();
		SCCounterDAO dao = new SCCounterDAO(connection, userProfile);

		SCCounterFilter scFilter = new SCCounterFilter();
		scFilter.estimateItemRef.code = estimateItemCode;

		SCCounterShortList scList = dao.getScrollableFilteredList(scFilter, 0, -1);

		if (scList.totalCount == 0) {
			throw new EnergyproSystemException(
					"НЕ знайдено даних про встановлення лічильника ... код естімейта = " + estimateItemCode);
		}

		out = dao.getSetupInfoWOZKU(estimateItemCode,
				finConnection);

		if (out == null) {
			throw new EnergyproSystemException(
					"НЕ знайдено даних про встановлення лічильника ... код естімейта = " + estimateItemCode);
		}

		if (!isActData)
			return out;

		// 05.12.2011 - разделение отчислений по неинвалидов и по инвалидам
		ActLogic aLogic = new ActLogic(connection, userProfile);
		String planCodes = aLogic.getPlanCodesByAct(out.actCode);

		FINWorkerDAO fDAO = new FINWorkerDAO(connection, userProfile);
		FINWorkerFilter fiwFilter = new FINWorkerFilter();
		BigDecimal taxPercent = new BigDecimal(0);

		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
		ENEstimateItem eiObj = eiDAO.getObject(estimateItemCode);

		ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
		ENPlanWork pObj = pDAO.getObject(eiObj.planRef.code);

		// дотянем данные по ЗП
		BigDecimal salary = new BigDecimal(0);
		BigDecimal tax = new BigDecimal(0);
		ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(connection, userProfile);
		ENAct2Humen a2hObj;

		ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
		a2hFilter.actRef.code = out.actCode;
		if (pObj.typeRef.code != ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU) {
			a2hFilter.humenKindRef.code = ENHumenItemKind.ELTEH; // без
																	// водителей
		}

		ENAct2HumenShortList a2hList = a2hDAO.getScrollableFilteredList(a2hFilter, 0, -1);

		ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
		ENHumenItemFilter hFilter = new ENHumenItemFilter();

		double sumTimeAll, sumTimeCounter;

		BigDecimal kzarp = new BigDecimal(0);

		ENHumenItemShortList hList;

		for (int i = 0; i < a2hList.totalCount; i++) {
			// if
			// (dao.isWorkerWOZKU(a2hList.get(i).actRefCode,a2hList.get(i).tabNumber))
			// {
			if (out.workerData == null) {
				out.workerData = new Vector<revisionData>();
			}

			a2hObj = a2hDAO.getObject(a2hList.get(i).code);

			if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH) {
				hFilter.planRef.code = eiObj.planRef.code;
				hFilter.conditionSQL = " enhumenitem.CODE in (" + " select hii.code "
						+ " from enhumenitem hii,finworker f,enact2enplanwork a2p "
						+ " where hii.finworkercode=f.code " + " and cast(f.tabnumber as varchar)= '"
						+ a2hList.get(i).tabNumber + "'" + " and hii.planrefcode=a2p.plancode "
						+ " and a2p.actrefcode= " + a2hList.get(i).actRefCode + ")";

				hList = hDAO.getScrollableFilteredList(hFilter, hFilter.conditionSQL, 0, -1);
				sumTimeAll = 0;
				for (int j = 0; j < hList.totalCount; j++) {
					sumTimeAll += hList.get(j).countFact.doubleValue();
					System.out.println("sumTimeAll=" + sumTimeAll);

				}
				hFilter.planRef.code = eiObj.planRef.code;
				hFilter.conditionSQL = " enhumenitem.CODE in (" + " select hii.code "
						+ " from enhumenitem hii,finworker f,enact2enplanwork a2p,enplanworkitem pi "
						+ " where hii.finworkercode=f.code " + " and cast(f.tabnumber as varchar)= '"
						+ a2hList.get(i).tabNumber + "'" + " and a2p.plancode=pi.planrefcode "
						+ " and pi.code=hii.planitemrefcode " + " and pi.kartarefcode not in ("
						+ ENConsts.TECHCARDS_CONSTS_ZKU + ") " + " and hii.planrefcode=a2p.plancode "
						+ " and a2p.actrefcode= " + a2hList.get(i).actRefCode + ")";

				hList = hDAO.getScrollableFilteredList(hFilter, hFilter.conditionSQL, 0, -1);
				sumTimeCounter = 0;
				for (int j = 0; j < hList.totalCount; j++) {
					sumTimeCounter += hList.get(j).countFact.doubleValue();
				}
				// 07.02.2018 Нужно также считать и для счетчиков абонентов
				kzarp = new BigDecimal(sumTimeCounter / sumTimeAll).setScale(6, BigDecimal.ROUND_HALF_UP);

				/*if (scList.get(0).invNumber != null) {
					kzarp = new BigDecimal(sumTimeCounter / sumTimeAll).setScale(6, BigDecimal.ROUND_HALF_UP);
				} else {
					kzarp = new BigDecimal(0);
				}*/
			}

			if ((kzarp.doubleValue() > 0) || (a2hList.get(i).humenKindRefCode == ENHumenItemKind.DRIVER)) {
				SCCounterSetupInfo.revisionData wData = out.new revisionData();

				wData.balans = dao.getBalance(a2hList.get(i).tabNumber, a2hList.get(i).actRefDateGen,
						finConnection);

				wData.tabNumber = a2hList.get(i).tabNumber;
				wData.salary = a2hList.get(i).paysWorkBonus; // 11.10.2011 -
																// перебьем
																// paysWork
																// на
																// paysWorkBonus
																// - так как
																// это поле
																// содержит
																// сумму с
																// 50%
																// премии.

				if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH) {
					wData.salary = wData.salary.multiply(kzarp).setScale(2, BigDecimal.ROUND_HALF_UP);
				}
				// разделение отчислений по неинвалидов и по инвалидам
				// выберем отчисления для каждого работника из колонки
				// chargepercent таблицы finworker

				// выбор для просто работников
				if (a2hList.get(i).humenKindRefCode == ENHumenItemKind.ELTEH)
					fiwFilter.conditionSQL = "FINWORKER.CODE " + " IN " + "(SELECT " + " MAX(FINWORKER.CODE) "
							+ " FROM " + " FINWORKER, " + " ENHUMENITEM " + " WHERE "
							+ " FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE " + " AND ENHUMENITEM.PLANREFCODE in ("
							+ planCodes + ")" + " AND FINWORKER.TABNUMBER ='" + a2hList.get(i).tabNumber + "')";
				else
					// выбор для водителей
					fiwFilter.conditionSQL = "FINWORKER.CODE " + " IN " + "(SELECT " + " MAX(FINWORKER.CODE) "
							+ " FROM " + " FINWORKER, " + " ENTRANSPORTITEM " + " WHERE "
							+ " FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE "
							+ " AND ENTRANSPORTITEM.PLANREFCODE in (" + planCodes + ")"
							+ " AND FINWORKER.TABNUMBER = '" + a2hList.get(i).tabNumber + "')";

				// Расчет процента отчислений
				FINWorkerShortList fiwList = fDAO.getScrollableFilteredList(fiwFilter, fiwFilter.conditionSQL, 0,
						-1);

				if (fiwList.totalCount != 1)
					throw new EnergyproSystemException(
							" Помилка у кількості робітників для табельного номера: " + a2hList.get(i).tabNumber);

				taxPercent = fiwList.get(0).chargePercent.divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);

				wData.tax = wData.salary.multiply(taxPercent).setScale(2, BigDecimal.ROUND_HALF_UP);
				out.workerData.add(wData);
				salary = salary.add(wData.salary).setScale(2, BigDecimal.ROUND_HALF_UP);
				tax = tax.add(wData.tax).setScale(2, BigDecimal.ROUND_HALF_UP);
				// }
				a2hObj.payWorkCou = wData.salary;
			} else {
				a2hObj.payWorkCou = new BigDecimal(0);
			}

			a2hDAO.save(a2hObj);

		}

		out.actSumSalary = salary;
		out.actSumTax = tax;
		out.actSumGen = out.actSumTMC.add(out.actSumSalary).setScale(2, BigDecimal.ROUND_HALF_UP).add(out.actSumTax)
				.setScale(2, BigDecimal.ROUND_HALF_UP);

		return out;
	}

	/**
	 *
	 * Update фазности и зонности для счетчиков по данным по входящим счетчикам
	 * в акте из таблички ENMetrologyCounter
	 *
	 */
	public void updatePhasityAndZonesForCounters(ENAct act) {

		try {
			if (act.actTypeRef.code != ENPlanWorkState.COUNTERS_PARAMETRIZATION
					&& act.actTypeRef.code != ENPlanWorkState.COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE) {
				throw new EnergyproSystemException(
						"Цей метод тільки для акту с типом \"Параметризація лічильників\" або \"Параметризація лічильників (безоплатна)\"");
			}

			ActLogic aLogic = new ActLogic(connection, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			ENMetrologyCounterDAO counterDao = new ENMetrologyCounterDAO(connection, userProfile);
			ENAct2OSTableDAO act2osDao = new ENAct2OSTableDAO(connection, userProfile);

			// Необходимо взять все наряды с акта
			String planCodes = aLogic.getPlanCodesByAct(act.code);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = ENPlanWork.code_QFielld + " IN (" + planCodes + ")";
			ENPlanWorkShortList plans = planDao.getScrollableFilteredList(planFilter, 0, -1);

			ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();

			ENAct2OSTableFilter act2osFilter = new ENAct2OSTableFilter();
			act2osFilter.actRef.code = act.code;

			ENAct2OSTableShortList act2osList = act2osDao.getScrollableFilteredList(act2osFilter, 0, -1);

			Hashtable<String, Integer> invNumber2Phasity = new Hashtable<String, Integer>();
			Hashtable<String, Integer> invNumber2Zones = new Hashtable<String, Integer>();

			for (int i = 0; i < plans.totalCount; i++) {
				counterFilter.element.code = plans.get(i).elementRefCode;
				ENMetrologyCounterShortList counterList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);
				if (counterList.totalCount != 1)
					throw new EnergyproSystemException(
							"Помилка у кількості лічильників при вставці довводів. Сис. код плану: "
									+ plans.get(i).code);

				String invNumber = counterList.get(0).invNumber;
				int phasity = counterList.get(0).phasity;
				int zones = counterList.get(0).zones;

				if (phasity == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("Не задана фазність для лічильника інв. № " + invNumber);
				}

				if (zones == Integer.MIN_VALUE) {
					throw new EnergyproSystemException(
							String.format("Не задана зонність для лічильника інв. № %s ", invNumber));
				}

				if (phasity != 1 && phasity != 3) {
					throw new EnergyproSystemException(
							String.format("Невідома фазність (%d) для лічильника %s", phasity, invNumber));
				}

				invNumber2Phasity.put(invNumber, phasity);
				invNumber2Zones.put(invNumber, zones);
			}

			for (int i = 0; i < act2osList.totalCount; i++) {
				int num_un = act2osList.get(i).num_un;
				String invNumber = act2osList.get(i).invNumber;

				com.ksoe.rqorder.logic.SCLogic oSCLogic = new com.ksoe.rqorder.logic.SCLogic(
						finConnection, userProfile);
				oSCLogic.updateCounterPhasity(num_un, invNumber2Phasity.get(invNumber),
						invNumber2Zones.get(invNumber));
			}

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} finally {

		}
	}

	/*** отмена проведения пломб в эксплуатацию
	 *
	 * @param actCode
	 */

	public void undoInsertSealIntoExpl(int actCode) {

		try {

			com.ksoe.rqorder.dataminer.SCLogicDAO scDao = new com.ksoe.rqorder.dataminer.SCLogicDAO(
					finConnection, userProfile);

			scDao.EXPL_KSU_PROV_DEL(actCode);
			SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
			SCSealFilter f = new SCSealFilter();
			f.conditionSQL = " scseal.estimateitemrefcode in ( "  +
					" select ei.code from enplanwork p, enestimateitem ei, " +
					" enact2enplanwork a2p " +
					" where p.code = a2p.plancode " +
					" and ei.planrefcode = p.code " +
					" and ei.kindrefcode = " + ENEstimateItemKind.MATERIALS +
					" and a2p.actrefcode = " + actCode + ")";

			int[] arr = sealDAO.getFilteredCodeArray(f, 0, -1);

			for (int seals=0;seals<arr.length;seals++) {
				SCSeal seal = sealDAO.getObject(arr[seals]);
				checkSCSealIsLiquidated(seal, true);
				lockSeal(seal.scCode, null, null, null, null, SCSealLockType.FOR_WRITEOFF, true);
			}



		}  catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
	}


	/*** Вставка ввода в эксплуатацию пломб
	 *
	 * @param actCode
	 */
	public void insertSealIntoExpl(int actCode) {

		try {

			ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
			SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
			ENActDAO actDAO = new ENActDAO(connection, userProfile);
			com.ksoe.energynet.dataminer.SCLogicDAO scEnDao = new com.ksoe.energynet.dataminer.SCLogicDAO(
					finConnection, userProfile);
			ENAct act = actDAO.getObject(actCode);

			ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
			ENElement element = elementDAO.getObject(act.element.code, false);

			///// 22.02.2018 NET-4561 Определяем, является ли акт актом на списание пломб при проведении экспертизы счетчиков
			if (element.elementInRef.code == ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
				// В этом случае будет вызываться insertSealForLiquidation
				return;
			}
			/////

			// SUPP-66105 Определение является ли счетчик основным средством
			BigDecimal assetsMinimalCost = settingsLogic.getBigDecimalValue(ENSettingsKeysConsts.ASSETS_MINIMAL_COST, act.dateGen)
					.setScale(2, BigDecimal.ROUND_HALF_UP);
			boolean isAsset = false;
			boolean isAbonCounter = false;
			SCCounter counter = this.getSCCounterByActCode(actCode);
			if (counter != null ){
				//SUPP-67738 Определяем является ли счетчик абонентским (переменная isAbonCounter)
				if (counter.invNumber != null && !counter.invNumber.equals("") ){
					BigDecimal counterIncomeSum = scEnDao.getCounterIncomeCost(counter.scCode);
					// SUPP-66105 16.04.2018 Для определения является ли счетчик ОС используется стоимость приобретения
					if(counterIncomeSum != null && counterIncomeSum.compareTo(assetsMinimalCost) >= 0) {
						isAsset = true;
					}
				} else {
					isAbonCounter = true;
				}
			}



			Date P_DATEOPERAC = act.dateGen;
			String P_NUMAKT = "";
			Date P_DATEAKT = null;
			String P_LSCHET = "";
			String P_PLACE_UST = "";
			Date P_DATE_UST = null;
			String P_CONNECT_NUM ="";
			Date P_CONNECT_DATE = null;
			int P_CONNECT_IS_STANDARD = Integer.MIN_VALUE;
			String P_CHARACTERS = "";
			String P_KOD_IST = "", P_KOD_INV_OS = "", P_VID_WORK = "";
			int P_NUMUN_COU = Integer.MIN_VALUE;
			int IS_ZKU = Integer.MIN_VALUE; // Определение монтажа счетчика. 0 - не в ЗКУ, 1 - в ЗКУ, MIN_VALUE - не акт монтажа
			String P_TECHCARD = "";

			/// если есть незакрытое сменное задание, то не будем давать проводить акт
			/// !!! - не делают установку в биллинге

			ENWorkOrderBytDAO wobDAO = new ENWorkOrderBytDAO(connection, userProfile);
			ENWorkOrderBytFilter wobFilter = new ENWorkOrderBytFilter();
			wobFilter.conditionSQL = " code in ( " +
					" select wob.code from enworkorderbytitem wobi, enworkorderbyt wob " +
					" where wobi.workorderbytrefcode = wob.code " +
					" and wobi.planrefcode in " +
					" (select ch.planoldrefcode from enplancorrecthistory ch where ch.plannewrefcode in ( " +
					" select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode = " +  actCode + ")))";
			ENWorkOrderBytShortList wobList = wobDAO.getScrollableFilteredList(wobFilter, 0, -1);

			for (int pff = 0; pff<wobList.totalCount; pff++) {
			  if (wobList.get(pff).statusRefCode != ENWorkOrderBytStatus.CLOSED) {
				  throw new SystemException("Змінне Завдання з номером " + wobList.get(pff).numberGen +
						                    " від " + wobList.get(pff).dateGen + " (код: " + wobList.get(pff).code +
						                    ") повинно бути закритим, а воно знаходиться у статусі - " + wobList.get(pff).statusRefName + "!");
			  }

			}


			/// если связь с ОЗ, то берем номер и дату ОЗ
			if (checkActInOZ(actCode, false)) {
                SCUsageInputItemOZDAO itemOZDAO = new SCUsageInputItemOZDAO(connection, userProfile);

                SCUsageInputItemOZFilter itemOZFilter = new SCUsageInputItemOZFilter();
                itemOZFilter.conditionSQL = "scusageinputitemoz.code in ( " +
                          " select scui.usageinputitemozrefcod " +
                          " from scusageinputitemoz2nct scui " +
                          " where scui.enactrefcode = " + actCode +
                          " and  scui.enactrefcode not in " +
                          " ( select a2s.actrefcode from enact2scusageinput a2s" +
                          "  where a2s.actrefcode = " +  actCode + " )) ";

				SCUsageInputItemOZShortList itemOZList = itemOZDAO.getScrollableFilteredList(itemOZFilter, 0, -1);
				if (itemOZList.totalCount == 0) {
					throw new SystemException("Что то пошло не так!");
				} else {
					P_NUMAKT = itemOZList.get(0).numberDoc;
					P_DATEAKT = new SCUsageInputDAO(connection, userProfile)
							.getObject(new SCUsageInputItemDAO(connection,userProfile)
							.getObject(itemOZList.get(0).usageInputItemRefCode).usageInputRef.code).dateGen;

	                SCUsageInputDAO usageinputDAO = new SCUsageInputDAO(connection, userProfile);

	                // определяем акт ОЗ по ЗКУ или обычный
	                SCUsageInputFilter usageinputFilter = new SCUsageInputFilter();
	                usageinputFilter.conditionSQL = "scusageinput.code in ( " +
	                          " select scui.usageinputrefcode " +
	                          " from scusageinputitem scui " +
	                          " where scui.code = " + itemOZList.get(0).usageInputItemRefCode + " ) ";
	                SCUsageInputShortList scusageinputList = usageinputDAO.getScrollableFilteredList(usageinputFilter, 0, -1);

	                if (scusageinputList.get(0).iszku == 1)
	                {
                       IS_ZKU = 1;
	                }
	                else
	                {
	                	IS_ZKU = 0;

	                	SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);

	                	SCCounterFilter counterFilter = new SCCounterFilter();
	                	counterFilter.conditionSQL = "sccounter.code in" +
	                				" (select s.code " +
	                					" from enact2enplanwork e2e, enestimateitem ei, sccounter s " +
	                					" where e2e.plancode = ei.planrefcode " +
	                					" and ei.accountingtyperefcode = 2 " +
	                					" and s.estimateitemrefcode = ei.code " +
	                					" and ei.kindrefcode = 1 " +
	                					" and e2e.actrefcode = " + act.code + " ) ";
	                	SCCounterShortList counterList = counterDAO.getScrollableFilteredList(counterFilter, 0, -1);

	                	P_NUMUN_COU = counterList.get(0).scCode;
	                }
				}

			} else {
				P_NUMAKT = act.numberGen;
				P_DATEAKT = act.dateAct;
			}

			// место и дата установки
			ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkFilter pwFilter = new ENPlanWorkFilter();
			pwFilter.conditionSQL =  " code in (select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode = " + actCode + ")";
			int[] planArr = pwDAO.getFilteredCodeArray(pwFilter, 0, -1);

			if (planArr.length > 0) {

				ENPlanWork plan = pwDAO.getObject(planArr[0]);
				ENElement el = new ENElementDAO(connection, userProfile).getObject(plan.elementRef.code);

				if (el.typeRef.code == ENElementType.TY_BYT) {
        		  ENRecordPointBytDAO rpBytDAO = new ENRecordPointBytDAO(connection, userProfile);
        		  ENRecordPointBytFilter rpBytFilter = new ENRecordPointBytFilter();
        		  rpBytFilter.element.code = el.code;

					ENRecordPointBytShortList rpBytList = rpBytDAO.getScrollableFilteredList(rpBytFilter, 0, -1);
					if (rpBytList.totalCount == 0) {
						throw new SystemException("Что то пошло не так!");
					} else {
						P_PLACE_UST = rpBytList.get(0).address;
						P_LSCHET = rpBytList.get(0).accountNumber;
					}

				} else if (el.typeRef.code == ENElementType.TY_PROM) {

					ENRecordPointPromDAO rpPromDAO = new ENRecordPointPromDAO(connection, userProfile);
            		ENRecordPointPromFilter rpPromFilter = new ENRecordPointPromFilter();
            		rpPromFilter.element.code = el.code;

					ENRecordPointPromShortList rpPromList = rpPromDAO.getScrollableFilteredList(rpPromFilter, 0, -1);
					if (rpPromList.totalCount == 0) {
						throw new SystemException("Что то пошло не так!");
					} else {
						P_PLACE_UST = rpPromList.get(0).recordPointAddr;
						P_LSCHET = rpPromList.get(0).accountNumber;
					}
				}

				P_DATE_UST = plan.dateStart;
			}


			ENPlanWorkStateDAO psDAO = new ENPlanWorkStateDAO(connection, userProfile);
			ENPlanWorkState ps = psDAO.getObject(act.actTypeRef.code);

			ENElementDAO elDAO = new ENElementDAO(connection, userProfile);
			ENElementFilter elFilter = new ENElementFilter();
			elFilter.code = act.element.code;
			ENElementShortList elList = elDAO.getScrollableFilteredList(elFilter, 0, -1);

			P_CHARACTERS =  "Объект: " + elList.get(0).objectName + "; Тип акта: " + ps.name;
			P_KOD_INV_OS = elList.get(0).objectInvNumber;

			// для присоединений
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
			if (act.actTypeRef.code == 7)
			//если акт услуга на сторону, то определяем через элемент (объект планирования договор)
			{
				soFilter.conditionSQL = " code in ( select o.code" +
                                    " from net.enservicesobject o, net.enact a " +
                                    " where o.elementcode = a.elementcode " +
                                    " and a.code = " + act.code + ")";
			}
			else
			{
				 soFilter.conditionSQL = " code in ( select tcs2so.servicesobjectrefcode " +
                            " from enact2enplanwork a2p, entechcond2planwork tc2pw, " +
                            " enservicesobject2techcondtnsservices tcs2so " +
                            " where a2p.plancode = tc2pw.planrefcode " +
                            " and tc2pw.techconservicesrefcode = tcs2so.techcondservrefcode " +
                            " and a2p.actrefcode = " + act.code + ")";
			}
			ENServicesObjectShortList soList = soDAO.getScrollableFilteredList(soFilter, 0, -1);

			if (soList.totalCount > 0) {

				P_CONNECT_NUM = soList.get(0).contractNumber;
				P_CONNECT_DATE = soList.get(0).contractDate;

				ENTechConditionsServicesDAO tcDAO = new ENTechConditionsServicesDAO(connection, userProfile);
				ENTechConditionsServicesFilter tcFilter = new ENTechConditionsServicesFilter();
				if (act.actTypeRef.code == 7)
				{
					tcFilter.conditionSQL = " code in ( select s.techcondservrefcode " +
                                        " from net.enservicesobject2techcondtnsservices s, enact a, enservicesobject o " +
                                        " where s.servicesobjectrefcode = o.code " +
                                        " and a.elementcode = o.elementcode " +
                                        " and a.code = " + act.code + ")";
				}
				else
				{
					tcFilter.conditionSQL = " code in ( select tcs2so.techcondservrefcode " +
	                        " from enact2enplanwork a2p, entechcond2planwork tc2pw, " +
	                        " enservicesobject2techcondtnsservices tcs2so " +
	                        " where a2p.plancode = tc2pw.planrefcode " +
	                        " and tc2pw.techconservicesrefcode = tcs2so.techcondservrefcode " +
	                        " and a2p.actrefcode = " + act.code + ")";
				}
				ENTechConditionsServicesShortList tcList = tcDAO.getScrollableFilteredList(tcFilter, 0, -1);
				if (tcList.totalCount > 0) {
					P_CONNECT_IS_STANDARD = tcList.get(0).connectionKindRefCode;
				}

				else
				{
					tcFilter.conditionSQL = " code in ( select e2p.techconservicesrefcode " +
                                            " from net.entechcond2planwork e2p, net.enact2enplanwork a2p " +
                                            " where e2p.planrefcode = a2p.plancode " +
                                            " and a2p.actrefcode = " + act.code + ")";

					ENTechConditionsServicesShortList tcOldList = tcDAO.getScrollableFilteredList(tcFilter, 0, -1);

					if (tcOldList.totalCount > 0)
					{
						P_CONNECT_IS_STANDARD = tcOldList.get(0).connectionKindRefCode;
					}

				}

			}

			// выберем для услуг на сторону вид работ с калькуляции
			TKFINWorkTypeDAO tFinDAO = new TKFINWorkTypeDAO(connection, userProfile);
			TKFINWorkTypeFilter tFinFilter = new TKFINWorkTypeFilter();
			tFinFilter.conditionSQL = " code in (select distinct tfin.code " +
				    " from enact2enplanwork p, enplanworkitem i, " +
					" tktechcard t, tkclassificationtype tct, tkfinworktype tfin " +
					" where  p.plancode = i.planrefcode " +
					" and t.code = i.kartarefcode " +
					" and tct.code = t.classificationtypecode " +
					" and tct.finworktypecode = tfin.code " +
					" and p.actrefcode = " + act.code + ")";
		     int[] tFinArr  = tFinDAO.getFilteredCodeArray(tFinFilter, 0, -1);
			if (tFinArr.length > 1) {
				throw new SystemException("Для этого акта добавлены калькуляции с разным видом услуг!");
			}
			else
			if (tFinArr.length == 0) {
				P_VID_WORK = "";
			} else
			{
				TKFINWorkType tFin = tFinDAO.getObject(tFinArr[0]);
				P_VID_WORK = tFin.finCode;
			}

			///// определение источника для акта
			FinKodIstDAO fIstDAO = new FinKodIstDAO(connection, userProfile);
			FinKodIstFilter fIstFilter = new FinKodIstFilter();
			fIstFilter.conditionSQL = " code in ( " +
					" select ff.kodistrefcode from enact2finkodist ff " +
					" where ff.actrefcode = " + act.code +
					" )";

			FinKodIstShortList fIstList = fIstDAO.getScrollableFilteredList(fIstFilter, 0, -1);


			if(!isAsset && !(isAbonCounter && IS_ZKU == 0)) {

				if (fIstList.totalCount != 1) {
					throw new SystemException("\n\n"
							+ "В акте " + act.numberGen  +" присутствует номерная пломба! \n"
							+ "Укажите источник ТМЦ в расходном акте!");
				}
				else {
					P_KOD_IST =  Integer.toString(fIstList.get(0).value);
				}
			} else {
				if(isAsset) {
					P_KOD_IST = settingsLogic.getValue(ENSettingsKeysConsts.COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_ASSETS_MOUNT, act.dateGen);
				}
				if(isAbonCounter) {
					P_KOD_IST = settingsLogic.getValue(ENSettingsKeysConsts.COUNTERS_KOD_IST_SEALS_CONSUMING_WITH_CUSTOMER_MOUNT, act.dateGen);
				}

			}

			com.ksoe.rqorder.dataminer.SCLogicDAO scDao = new com.ksoe.rqorder.dataminer.SCLogicDAO(
					finConnection, userProfile);

			SCSealFilter f = new SCSealFilter();
			f.conditionSQL = " scseal.estimateitemrefcode in ( "  +
					" select ei.code from enplanwork p, enestimateitem ei, " +
					" enact2enplanwork a2p " +
					" where p.code = a2p.plancode " +
					" and ei.planrefcode = p.code " +
					" and ei.kindrefcode = " + ENEstimateItemKind.MATERIALS +
					" and a2p.actrefcode = " + act.code + ")";

			int[] arr = sealDAO.getFilteredCodeArray(f, 0, -1);
			for (int seals=0;seals<arr.length;seals++) {

				SCSeal seal = sealDAO.getObject(arr[seals]);

				lockSeal(seal.scCode, null, null, null, null, SCSealLockType.FOR_WRITEOFF*-1, true);

				TKTechCardDAO TKDAO = new TKTechCardDAO(connection, userProfile);

				TKTechCardFilter TKDAOFilter = new TKTechCardFilter();
				TKDAOFilter.conditionSQL = " code in(" +
							" select pi.kartarefcode " +
							" from net.enestimateitem ei, net.enplanworkitem pi " +
							" where ei.planitemrefcode = pi.code " +
							" and pi.countgen > 0 " +
							" and ei.code = " + seal.estimateItemRef.code + ")";

				TKTechCardShortList TKList = TKDAO.getScrollableFilteredList(TKDAOFilter, 0, -1);
				if (TKList.totalCount == 0) {
					throw new SystemException("Для пломбы =" + seal.buildNumber + " работа обнулена");
				}

				P_TECHCARD = TKList.get(0).techKartNumber;

				if (IS_ZKU == 1)
				// если пломба из акта ввода в экспл.ЗКУ, определяем привзязана ли пломба к ЗКУ или к счетчику
				{
					//Выбираем счетчик
					SCCounterDAO counterDAO = new SCCounterDAO(connection, userProfile);

					SCCounterFilter counterFilter = new SCCounterFilter();
					counterFilter.conditionSQL = " code in (select sc.code " +
								" from net.enplanwork pw, net.enplanworkitem pi, " +
								" enact2enplanwork e2e, enestimateitem ei " +
								" left join sccounter sc on ei.code = sc.estimateitemrefcode " +
								" where pw.code = pi.planrefcode " +
								" and pw.code = e2e.plancode " +
								" and pi.code = ei.planitemrefcode " +
								" and ei.accountingtyperefcode = 2 " +
								" and ei.kindrefcode = 1 " +
								" and ei.countfact > 0 " +
								" and e2e.actrefcode =  " + act.code + ")";

					SCCounterShortList counterList = counterDAO.getScrollableFilteredList(counterFilter, 0, -1);

					// если ТК к которой привязана пломба из спсика ТК с ЗКУ, то передаем num_un ЗКУ
					if (ENConsts.TECHCARDS_CONSTS_ZKU.indexOf(String.valueOf(TKList.get(0).code)) >= 0)
					{
						P_NUMUN_COU = 0; //counterList.get(0).sccodezku;
					}
					else
					{
						P_NUMUN_COU = counterList.get(0).scCode;
					}

				}

				scDao.EXPL_KSU_PROV_INS(seal.invNumber, P_DATEOPERAC, P_NUMAKT, P_DATEAKT, userProfile.getUserName(), new Date(),
						"Автоматическое списание КСУ. EnergyNET", P_LSCHET, P_PLACE_UST, P_DATE_UST,
						P_CONNECT_NUM, P_CONNECT_DATE, P_CONNECT_IS_STANDARD, act.code, P_CHARACTERS,
						P_KOD_IST , P_KOD_INV_OS , P_VID_WORK, act.actTypeRef.code, P_NUMUN_COU, P_TECHCARD );
			}

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
	}


	public void insertSealForLiquidation(int actCode) {

		insertSealForLiquidation(actCode, ENEstimateItemKind.UNMOUNT);

	}


	/*** Вставка ликвидации пломб
	 *
	 * @param actCode
	 */
	public void insertSealForLiquidation(int actCode, int estimateKind) {

		try {

			SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
			ENActDAO actDAO = new ENActDAO(connection, userProfile);
			ENAct act = actDAO.getObject(actCode);

			String P_NUM_INV = ""; //, -- инвентарник ликвидируемого КСУ
            String P_NUMAKT = act.numberGen; // -- номер документа на ликвидацию
            Date P_DATEAKT = act.dateAct; // -- дата документа ликвидации
            Date P_DATEOPERAC = act.dateGen; //-- бух дата операци
            String P_OPER_USER = userProfile.userName; // -- Имя пользователя осуществившего
            Date P_OPER_DATE = new Date(); // -- Дата/время проведеня
            String P_PRIMECHAN = "Ликвидация КСУ из НЭТа"; // -- Описание операции
            int P_RQFKORDERCODE = act.code; //-- код документа EN (для отмены)

            int lockCode;

            if (estimateKind == ENEstimateItemKind.UNMOUNT) {
            	lockCode = SCSealLockType.FOR_WRITEOFF;
            } else {
            	lockCode = ENMetrologyCounter.WRITE_OFF_LOCK;
            }

			com.ksoe.rqorder.dataminer.SCLogicDAO scDao = new com.ksoe.rqorder.dataminer.SCLogicDAO(
					finConnection, userProfile);

			SCSealFilter f = new SCSealFilter();
			f.conditionSQL = " scseal.estimateitemrefcode in ( "  +
					" select ei.code from enplanwork p, enestimateitem ei, " +
					" enact2enplanwork a2p " +
					" where p.code = a2p.plancode " +
					" and ei.planrefcode = p.code " +
					" and ei.kindrefcode = " + estimateKind +
					" and a2p.actrefcode = " + actCode + ")";

			int[] arr = sealDAO.getFilteredCodeArray(f, 0, -1);

			for (int seals=0;seals<arr.length;seals++) {
				SCSeal seal = sealDAO.getObject(arr[seals]);
				P_NUM_INV = seal.invNumber;

				lockSeal(seal.scCode, null, null, null, null, lockCode*-1, true);

				scDao.LIKV_KSU_PROV_INS(P_NUM_INV, P_NUMAKT ,P_DATEAKT ,P_DATEOPERAC,P_OPER_USER,P_OPER_DATE,P_PRIMECHAN,P_RQFKORDERCODE);
			}


		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}

	}


	/*** Проверяет, есть ли в этом акте пломбы
	 *
	 * @param actCode
	 * @param estimateKind
	 * @return
	 * @throws PersistenceException
	 */

	public boolean checkSealsInAct(int actCode, int estimateKind) throws PersistenceException {
		boolean out = false;

		SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
		SCSealFilter f = new SCSealFilter();
		f.conditionSQL = " scseal.estimateitemrefcode in ( "  +
				" select ei.code from enplanwork p, enestimateitem ei, " +
				" enact2enplanwork a2p " +
				" where p.code = a2p.plancode " +
				" and ei.planrefcode = p.code " +
				" and ei.kindrefcode = " + estimateKind +
				" and a2p.actrefcode = " + actCode + ")";

		int[] arr = sealDAO.getFilteredCodeArray(f, 0, -1);
		if (arr.length > 0) {
			out = true;
		}
		return out;
	}


	public boolean checkSealsInPlan(int planCode) throws PersistenceException
	{
		if (planCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4530 Не заданий код плану!");
		}

		boolean out = false;

		SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
		SCSealFilter f = new SCSealFilter();
		f.conditionSQL =
			" scseal.estimateitemrefcode in ( "  +
			"   select ei.code " +
			"   from enestimateitem ei " +
			"   where ei.planrefcode = " + planCode +
			")";

		int[] arr = sealDAO.getFilteredCodeArray(f, 0, -1);

		if (arr.length > 0) {
			out = true;
		}

		return out;
	}

	/**
	 *
	 * Вставка информации по довводам в ПК СканСчетчики
	 *
	 * @param act
	 *            акт по доработке (ремонтам) счетчиков
	 */
	public void insertDovvodInfoForMetrologyRepair(ENAct act) {

		try {

			ActLogic aLogic = new ActLogic(connection, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			ENMetrologyCounterDAO counterDao = new ENMetrologyCounterDAO(connection, userProfile);
			ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(connection, userProfile);
			FINMaterialsDAO finMatDAO = new FINMaterialsDAO(connection, userProfile);
			FINWorkerDAO fworkerDAO = new FINWorkerDAO(connection, userProfile);
			ENPlan2HumenDAO plan2HumenDao = new ENPlan2HumenDAO(connection, userProfile);

			FINLogic finLogic = new FINLogic(
					finConnection, userProfile);
			SCLogicDAO scDao = new SCLogicDAO(
					finConnection, userProfile);

			SCCounterDAO scCounterDao = new SCCounterDAO(connection, userProfile);
			ENAct2OSTableDAO act2ostableDao = new ENAct2OSTableDAO(connection, userProfile);

			ENCountersStateVerificationDAO stateVerificationDAO = new ENCountersStateVerificationDAO(connection, userProfile);

			// По дате акта определяем фонд рабочего времени в месяце
			BigDecimal workHoursInMonth = finLogic.getWorkTimeInMonth(act.dateGen);

			// Необходимо взять все наряды с акта
			String planCodes = aLogic.getPlanCodesByAct(act.code);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = ENPlanWork.code_QFielld + " IN (" + planCodes + ")";
			// 15.06.2018 Для счетчиков из основных средств не вставляем довводы
			planFilter.conditionSQL += String.format(" and not exists (select 1 from  %s as mc1 where mc1.%s = %s and mc1.%s = ?)"
					, ENMetrologyCounter.tableName, ENMetrologyCounter.element_Field
					, ENPlanWork.elementRef_QFielld, ENMetrologyCounter.accountingTypeRef_Field);
			Vector<Integer> bindedParams = new Vector<Integer>();
			bindedParams.add(TKAccountingType.OS);
			ENPlanWorkShortList plans = planDao.getScrollableFilteredList(planFilter, 0, -1, bindedParams);

			ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();

			// Теперь идет цикл по нарядам, вытаскиваются суммы по довводу
			for (int i = 0; i < plans.totalCount; i++) {
				counterFilter.element.code = plans.get(i).elementRefCode;
				ENMetrologyCounterShortList counterList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);
				if (counterList.totalCount != 1)
					throw new EnergyproSystemException(
							"Помилка у кількості лічильників при вставці довводів. Сис. код плану: "
									+ plans.get(i).code);

				String invNumber = counterList.get(0).invNumber;
				int num_un = counterList.get(0).scCode;

				BigDecimal sumAkt = new BigDecimal(0);
				BigDecimal sumMaterials = new BigDecimal(0);
				BigDecimal sumAktPensFund = new BigDecimal(0);
				BigDecimal sumZarplata = new BigDecimal(0);

				/* Материалы */
				ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
				eFilter.planRef.code = plans.get(i).code;
				eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
				eFilter.conditionSQL = ENEstimateItem.countFact_QFielld + " <> 0";

				ENEstimateItemShortList eList = estimateDAO.getScrollableFilteredList(eFilter, eFilter.conditionSQL, 0,
						-1);

				for (int j = 0; j < eList.totalCount; j++) {
					FINMaterialsFilter finMatFilter = new FINMaterialsFilter();
					finMatFilter.estimateItemRef.code = eList.get(j).code;
					finMatFilter.statusRef.code = FINMaterialsStatus.GOOD;

					FINMaterialsShortList finMatList = finMatDAO.getScrollableFilteredList(finMatFilter, 0, -1);

					for (int z = 0; z < finMatList.totalCount; z++) {
						sumMaterials = sumMaterials.add(finMatList.get(z).cost);
					}
				}

				// Заработная плата
				ENPlan2HumenFilter plan2HumenFilter = new ENPlan2HumenFilter();
				plan2HumenFilter.planRef.code = plans.get(i).code;

				ENPlan2HumenShortList plan2HumenList = plan2HumenDao.getScrollableFilteredList(plan2HumenFilter, 0, -1);

				if (plan2HumenList.totalCount == 0) {
					throw new EnergyproSystemException(
							"Не знайдено даних про працівників. Сис. код плану: " + plans.get(i).code);
				}

				Vector<RevisionSotr> revisionSotrVec = new Vector<RevisionSotr>();

				for (int j = 0; j < plan2HumenList.totalCount; j++) {
					FINWorkerFilter fworkerFilter = new FINWorkerFilter();
					fworkerFilter.conditionSQL = " EXISTS (select 1 from enhumenitem as hu where hu.finworkercode = FINWORKER.CODE and hu.countfact <> 0 and hu.planrefcode = "
							+ plans.get(i).code + ")";
					fworkerFilter.tabNumber = plan2HumenList.get(j).tabNumber;

					FINWorkerShortList fworkerList = fworkerDAO.getScrollableFilteredList(fworkerFilter, 0, -1);

					if (fworkerList.totalCount == 0)
						throw new EnergyproSystemException(
								"Помилка кількості для табельного номеру " + fworkerList.get(0).tabNumber);

					FINWorker fworker = fworkerDAO.getObject(fworkerList.get(0).code);

					// Расчет заработной платы
					BigDecimal workZarp = fworker.priceGen.divide(workHoursInMonth, 8, 2);
					workZarp = workZarp.multiply(new BigDecimal(1.5));
					workZarp = workZarp.multiply(plan2HumenList.get(j).timeWorkFact);
					workZarp = workZarp.setScale(2, BigDecimal.ROUND_HALF_UP);

					// Отчисления с зарплаты
					BigDecimal pensFund = workZarp.multiply(fworker.chargePercent.divide(new BigDecimal(100)))
							.setScale(2, BigDecimal.ROUND_HALF_UP);

					sumZarplata = sumZarplata.add(workZarp).setScale(2, BigDecimal.ROUND_HALF_UP);
					sumAktPensFund = sumAktPensFund.add(pensFund).setScale(2, BigDecimal.ROUND_HALF_UP);

					RevisionSotr revSotr = new RevisionSotr();

					revSotr.balans = scCounterDao.getBalance("" + fworker.tabNumber, plans.get(i).dateFinal,
							finConnection);
					revSotr.tabNumber = "" + fworker.tabNumber;
					revSotr.salary = workZarp;
					revSotr.tax = pensFund;

					revisionSotrVec.add(revSotr);

				}

				// Сумма по акту (по счетчику)
				sumAkt = sumMaterials.add(sumZarplata).add(sumAktPensFund).setScale(2, BigDecimal.ROUND_HALF_UP);

				// Вставка данных в Сканы
				int id_revision_data = scDao.revision_ins(num_un, act.actTypeRef.code, act.dateGen, act.numberGen,
						act.dateAct, sumAkt, sumMaterials, sumZarplata, sumAktPensFund, invNumber);

				// Вставка по работникам
				for (int j = 0; j < revisionSotrVec.size(); j++) {
					scDao.revision_sotr_ins(id_revision_data, // -- id таблицу
																// довводов
																// (Revision_Data)
							revisionSotrVec.get(j).tabNumber, // -- Таб. №
																// сотрудника
							revisionSotrVec.get(j).balans, // -- ШПЗ сотрудника
															// сотрудника
							revisionSotrVec.get(j).salary, // -- Сумма зарплаты
															// сотрудника
							revisionSotrVec.get(j).tax); // -- Сумма ЕСВ
															// сотрудника
				}

				// Запись уникального кода из Скансчетчиков
				int new_num_un = scDao.getNumUn(id_revision_data);

				if (new_num_un == Integer.MIN_VALUE)
					throw new EnergyproSystemException("Не знайдено дані по лічильниках.");

				// Запись в связку данных по вставленному довводу
				ENAct2OSTable act2Ostable = new ENAct2OSTable();
				act2Ostable.actRef.code = act.code;
				act2Ostable.invNumber = invNumber;
				act2Ostable.num_un = new_num_un;
				act2ostableDao.add(act2Ostable);

				///// Вставляем доввод по Госповерке
				ActLogic actLogic = new ActLogic(connection, userProfile);

				if (actLogic.checkActTypeForCountersStateVerification(act)) {

					ENCountersStateVerificationFilter stateVerificationFilter = new ENCountersStateVerificationFilter();
					stateVerificationFilter.actRef.code = act.code;
					stateVerificationFilter.invNumber = invNumber;

					ENCountersStateVerificationShortList stateVerificationList = stateVerificationDAO.getScrollableFilteredList(stateVerificationFilter, 0, -1);

					if (stateVerificationList.totalCount == 0) {
						throw new SystemException("\n\nNET-4559 Видатковий акт не зв'язано з актом на послуги зі сторони (на Держповірку)!");
					} else {
						Date p_dateOperac = stateVerificationList.get(0).fkOrderRefDatePosting;
						if (p_dateOperac == null) {
							p_dateOperac = stateVerificationList.get(0).fkOrderRefDateGen;
						}
						Date p_dateAkt = stateVerificationList.get(0).fkOrderRefDateGen;
						String p_numAkt = stateVerificationList.get(0).fkOrderRefNumberDoc;
						BigDecimal p_sumAkt = stateVerificationList.get(0).priceGen; //stateVerificationList.get(0).fkOrderRefSumWithoutNds;

						int revision_type = ENPlanWorkState.SERVICES_FROM_OUT;
						if(act.actTypeRef.code == ENPlanWorkState.COUNTERS_EXPERTISE) {
							revision_type = FKConsts.COUNTERSREAD_REVISION_TYPE_SERVICES_FROM_OUT_VERIFICATION_FOR_EXPERTISE;
						}


						id_revision_data = scDao.revision_ins(new_num_un, revision_type,
								p_dateOperac, p_numAkt, p_dateAkt,
								p_sumAkt, new BigDecimal(0), new BigDecimal(0), new BigDecimal(0),
								invNumber);

						// Запись уникального кода из Скансчетчиков
						new_num_un = scDao.getNumUn(id_revision_data);

						if (new_num_un == Integer.MIN_VALUE)
							throw new EnergyproSystemException("Не знайдено дані по лічильниках.");

						// Запись в связку данных по вставленному довводу
						act2Ostable = new ENAct2OSTable();
						act2Ostable.actRef.code = act.code;
						act2Ostable.invNumber = invNumber;
						act2Ostable.num_un = new_num_un;
						act2ostableDao.add(act2Ostable);
					}

				}
				/////

			}
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
	}

	/**
	 *
	 * Удаление информации по довводам в ПК СканСчетчики
	 *
	 * @param actCode
	 *            код акта по доработке (ремонтам) счетчиков)
	 */
	public void removeDovvodInfoForMetrologyRepair(int actCode) {

		try {

			ActLogic aLogic = new ActLogic(connection, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			ENMetrologyCounterDAO counterDao = new ENMetrologyCounterDAO(connection, userProfile);
			SCLogicDAO scLogicDAO = new SCLogicDAO(
					finConnection, userProfile);
			ENAct2OSTableDAO act2ostableDao = new ENAct2OSTableDAO(connection, userProfile);

			// Необходимо взять все наряды с акта
			String planCodes = aLogic.getPlanCodesByAct(actCode);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = ENPlanWork.code_QFielld + " IN (" + planCodes + ")";
			ENPlanWorkShortList plans = planDao.getScrollableFilteredList(planFilter, 0, -1);

			ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();

			// Теперь идет цикл по нарядам, вытаскиваются суммы по довводу
			for (int i = 0; i < plans.totalCount; i++) {
				counterFilter.element.code = plans.get(i).elementRefCode;
				ENMetrologyCounterShortList counterList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);
				if (counterList.totalCount != 1)
					throw new EnergyproSystemException(
							"Помилка у кількості лічильників при видаленні довводів. Сис. код плану: "
									+ plans.get(i).code);

				ENAct2OSTableFilter act2ostableFilter = new ENAct2OSTableFilter();
				act2ostableFilter.actRef.code = actCode;
				act2ostableFilter.invNumber = counterList.get(0).invNumber;
				act2ostableFilter.orderBySQL = "ENACT2OSTABLE.NUM_UN DESC";

				ENAct2OSTableShortList act2ostableList = act2ostableDao.getScrollableFilteredList(act2ostableFilter, 0, -1);

				for (int j = 0; j < act2ostableList.totalCount; j++) {
					// Отмена
					int num_un = act2ostableList.get(j).num_un;
					//System.out.println(" @@@ revision_del by num_un ");
					scLogicDAO.revision_del(num_un);
					// Удаление связки
					act2ostableDao.remove(act2ostableList.get(j).code);
				}

			}

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}

	}

	/**
	 *
	 * Проведение акта ликвидации счетчиков в части Скансчетчиках
	 *
	 * @param act
	 *            объект ENAct
	 */
	public void moveLikvidationActToSC(ENAct act) {

		try {
			ActLogic aLogic = new ActLogic(connection, userProfile);
			SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
			SCLogicDAO logicDao = new SCLogicDAO(
					finConnection, userProfile);

			// Необходимо взять все наряды с акта
			String planCodes = aLogic.getPlanCodesByAct(act.code);

			// Все счетчики для списания в этих нарядах
			SCCounterFilter counterFilter = new SCCounterFilter();
			counterFilter.statusRef.code = SCCounterStatus.GOOD;
			counterFilter.kindRef.code = SCCounterKind.FOR_WRITEOFF;
			counterFilter.conditionSQL = ENEstimateItem.planRef_QFielld + " IN (" + planCodes + ")";

			SCCounterShortList counterList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);

			for (int i = 0; i < counterList.totalCount; i++) {
				// Разлочить счетчик
				lockCounterInSC_(counterList.get(i).scCode, null, null, (-1) * ENMetrologyCounter.WRITE_OFF_LOCK);
				logicDao.likvidation_ins(counterList.get(i).scCode, act.numberGen, act.dateAct, act.dateGen,
						counterList.get(i).account);
			}
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
	}

	/**
	 *
	 * Отмена проведения акта ликвидации счетчиков в части Скансчетчиках
	 *
	 * @param actCode
	 *            код акта
	 */
	public void unMoveLikvidationActToSC(int actCode) {

		try {
			ActLogic aLogic = new ActLogic(connection, userProfile);
			SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
			SCLogicDAO logicDao = new SCLogicDAO(
					finConnection, userProfile);
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, userProfile);

			// Необходимо взять все наряды с акта
			String planCodes = aLogic.getPlanCodesByAct(actCode);

			// Все счетчики для списания в этих нарядах
			SCCounterFilter counterFilter = new SCCounterFilter();
			counterFilter.statusRef.code = SCCounterStatus.GOOD;
			counterFilter.kindRef.code = SCCounterKind.FOR_WRITEOFF;
			counterFilter.conditionSQL = ENEstimateItem.planRef_QFielld + " IN (" + planCodes + ")";

			SCCounterShortList counterList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);

			int estimateItemOldCode = Integer.MIN_VALUE;
			ENWorkOrder workOrder = null;

			// Отмена проведения списания (ликвидации)
			for (int i = 0; i < counterList.totalCount; i++) {
				logicDao.likvidation_del(counterList.get(i).scCode);
				if (estimateItemOldCode != counterList.get(i).estimateItemRefCode) {
					workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(counterList.get(i).estimateItemRefCode);
				}

				// Обратно лочиться счетчик в Скансчетчиках
				lockCounterInSC_(counterList.get(i).scCode, workOrder.workOrderNumber, workOrder.dateGen,
						ENMetrologyCounter.WRITE_OFF_LOCK);
			}
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
	}



	/**
	 *
	 * Функция преобразует объект ENMetrologyCounter в SCCounter
	 *
	 * @param obj
	 *            объект класса ENMetrologyCounter
	 * @param scCounterKind
	 *            код вида SCCounter
	 * @return объект типа SCCounter
	 */
	public SCCounter createSCCounterFromMetrologyCounter(ENMetrologyCounter obj, int scCounterKind) {
		SCCounter out = new SCCounter();

		out.account = obj.account;
		out.buildNumber = obj.buildNumber;
		out.cost = obj.cost;
		out.name = obj.name;
		out.counterType = obj.counterType;
		out.dateBuild = obj.dateBuild;
		out.dateIn = obj.dateIn;
		out.departmetFKCode = obj.departmetFKCode;
		out.invNumber = obj.invNumber;
		out.molCode = obj.molCode;
		out.scCode = obj.scCode;

		if(obj.phasity != Integer.MIN_VALUE) {
			out.phasity = new BigDecimal(obj.phasity);
		}

		// с клиента заежжает код Эстимэйта !!!!
		out.estimateItemRef.code = obj.element.code;

		out.kindRef.code = scCounterKind;
		out.statusRef.code = SCCounterStatus.GOOD;

		out.zoneRef.code = obj.zoneRef.code;

		return out;
	}

	public SCCounter createSCCounterFromMetrologyCounter(ENMetrologyCounterShort obj, int scCounterKind) {
		SCCounter out = new SCCounter();

		out.account = obj.account;
		out.buildNumber = obj.buildNumber;
		out.cost = obj.cost;
		out.name = obj.name;
		out.counterType = obj.counterType;
		out.dateBuild = obj.dateBuild;
		out.dateIn = obj.dateIn;
		out.departmetFKCode = obj.departmetFKCode;
		out.invNumber = obj.invNumber;
		out.molCode = obj.molCode;
		out.scCode = obj.scCode;

		if(obj.phasity != Integer.MIN_VALUE) {
			out.phasity = new BigDecimal(obj.phasity);
		}


		out.kindRef.code = scCounterKind;
		out.statusRef.code = SCCounterStatus.GOOD;

		out.zoneRef.code = obj.zoneRefCode;

		return out;
	}

	public ENMetrologyCounter createENMetrologyCounterFromSCCounter(SCCounter counter) {
		ENMetrologyCounter out = new ENMetrologyCounter();
		out.account = counter.account;
		out.buildNumber = counter.buildNumber;
		out.cost = counter.cost;
		out.name = counter.name;
		out.counterType = counter.counterType;
		out.dateBuild = counter.dateBuild;
		out.dateIn = counter.dateIn;
		out.departmetFKCode = counter.departmetFKCode;
		out.invNumber = counter.invNumber;
		out.molCode = counter.molCode;
		out.scCode = counter.scCode;
		out.phasity = (counter.phasity != null) ? counter.phasity.intValue() : Integer.MIN_VALUE;

		out.zoneRef.code = counter.zoneRef.code;

		return out;
	}

	/**
	 * Функция преобразует объект ENMetrologyCounter в SCSeal
	 *
	 * @param obj - объект класса ENMetrologyCounterShort
	 * @param lockType - код вида блокировки SCSeal
	 *
	 * @return объект типа SCSeal
	 */
	public SCSeal createSCSealFromMetrologyCounterShort(ENMetrologyCounterShort obj, int lockType) {
		SCSeal out = new SCSeal();

		out.account = obj.account;
		out.buildNumber = obj.buildNumber;
		out.cost = obj.cost;
		out.name = obj.name;
		//out.counterType = obj.counterType;
		out.dateBuild = obj.dateBuild;
		out.dateIn = obj.dateIn;
		out.departmetFKCode = obj.departmetFKCode;
		out.invNumber = obj.invNumber;
		out.molCode = obj.molCode;
		out.molName = obj.molCode; // molName у нас не передается

		out.scCode = obj.scCode;

		// код Эстимэйта будем сетить в вызывающем методе
		// out.estimateItemRef.code = obj.element.code;

		out.lockTypeRef.code = lockType;
		out.statusRef.code = SCSealStatus.GOOD;

		out.zoneRef.code = obj.zoneRefCode;

		out.typeRef.code = obj.typeObject;

		return out;
	}

	public SCCounter createSCCounterFromMetrologyCounterShort(ENMetrologyCounterShort obj, int scKindRefCode) {
		SCCounter out = new SCCounter();

		out.account = obj.account;
		out.buildNumber = obj.buildNumber;
		out.cost = obj.cost;
		out.name = obj.name;
		//out.counterType = obj.counterType;
		out.dateBuild = obj.dateBuild;
		out.dateIn = obj.dateIn;
		out.departmetFKCode = obj.departmetFKCode;
		out.invNumber = obj.invNumber;
		out.molCode = obj.molCode;
		out.scCode = obj.scCode;
		out.statusRef.code = SCSealStatus.GOOD;
		out.zoneRef.code = obj.zoneRefCode;
		out.kindRef.code = scKindRefCode;

		return out;
	}

	public SCCounter createSCCounterWithPrihod(SCCounterShort scShort, int scCounterKind) throws PersistenceException {

		SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);

		SCCounter out = new SCCounter();

		out.account = scShort.account;
		out.buildNumber = scShort.buildNumber;
		out.cost = scShort.cost;
		out.name = scShort.name;
		out.counterType = scShort.counterType;
		out.dateBuild = scShort.dateBuild;
		out.dateIn = scShort.dateIn;
		out.departmetFKCode = scShort.departmetFKCode;
		out.invNumber = scShort.invNumber;
		out.molCode = scShort.molCode;
		out.scCode = scShort.scCode;

		// с клиента заежжает код Эстимэйта !!!!
		out.estimateItemRef.code = scShort.estimateItemRefCode;

		out.kindRef.code = scCounterKind;
		out.statusRef.code = SCCounterStatus.GOOD;
		out.zoneRef.code = scShort.zoneRefCode;

		counterDao.add(out);

		return out;
	}

	/* приходит естимейт ЗАДАНИЯ ПЛАН */
	public int autoBindingCounterOnNPZPlan(ENEstimateItem eiObj) throws PersistenceException {

		int scCounterCode = Integer.MIN_VALUE;

			// ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection,
			// userProfile);
			PlanWorkLogic pwLogic = new PlanWorkLogic(connection, userProfile);
			EstimateLogic eiLogic = new EstimateLogic(connection, userProfile);
			// ENEstimateItem2ENEstimateItemDAO ei2eiDAO = new
			// ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
			SCCounterDAO sccDAO = new SCCounterDAO(connection, userProfile);
			ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
			int codeMonthPlan = pwLogic.getMonthPlanCodeByAnyPlanCode(eiObj.planRef.code);
			ENPlanWork monthPlanObj = pDAO.getObject(codeMonthPlan);

			// TODO: проверить!!!
			ENEstimateItem estimateMonthPlan = eiLogic.getEstimateFromCurrentPlanByEstimateCode(eiObj.code); // eiLogic.getParentByMovedType(eiObj.code,
																												// ENEstimateItemType.AUTO);

			if (estimateMonthPlan == null) {
				return Integer.MIN_VALUE;
			}

			if (estimateMonthPlan.code == Integer.MIN_VALUE) {
				return Integer.MIN_VALUE;
			}

			// если при приходе под месячный естимейт сгенерился sccounter по
			// приходу тогда автоматом сгенерим sccounter для сменного задания
			SCCounterFilter sccFilter = new SCCounterFilter();
			sccFilter.estimateItemRef.code = estimateMonthPlan.code;
			sccFilter.kindRef.code = SCCounterKind.FOR_PRIHOD;

			int[] sccArr = sccDAO.getFilteredCodeArray(sccFilter, 0, -1);
			if (sccArr.length > 0) {
				System.out.println("Найден sccounter приходный, код = " + sccArr[0]);

				// по месячному естимейту , лицевому(инв номер с плана), код
				// подразделения , списку МОЛов в подразделении с плана , 15
				// счету выберем счетчик

				// String strMol =
				// this.getMolListFromCountersreadByEndepartmentCode(monthPlanObj.departmentRef.code);
				String strMol = this.getMasterListByMOLList(
						this.getMolListFromCountersreadByEndepartmentCode(monthPlanObj.departmentRef.code));
				if (strMol.equals("")) {
					throw new EnergyproSystemException(
							"\n\nNET-4376 Не визначені доступні МОЛи для пошуку лічильників!!!");
				}

				// countersread.ostable лицевой счет (с того плана на котором
				// висит естимейт)
				String personalAccount = new ElementLogic(connection, userProfile)
						.getElementInvNumberByIstimateItemCode(estimateMonthPlan.code);

				ENMetrologyCounterFilter cntrFilter = new ENMetrologyCounterFilter();

				cntrFilter.conditionSQL = " a.kod_mol in (  " + strMol + ")" + " and a.kod_subsch_b like '15%' "
						+ " and a.personalaccount =  '" + personalAccount + "'" + " and a.enestimateitemcode =  "
						+ estimateMonthPlan.code + " and a.departmentcode =  " + monthPlanObj.departmentRef.code
						+ " and nvl(a.energy_lock, 0) <= 0 "; // не брать
																// залоченные
																// счетчики

				ENMetrologyCounterShortList cntrList = getCountersListFromScanCounter(cntrFilter, 0, -1);

				// ??? Нужна ли такая проверка ?
				if (cntrList.totalCount > 1) {
					throw new EnergyproSystemException("\n\nNET-4376 Під план знайдено більше одного лічильника !!!");
				}

				if (cntrList.totalCount == 1) {
					ENMetrologyCounter mCounterObj = new ENMetrologyCounter();

					mCounterObj.account = cntrList.get(0).account;
					mCounterObj.buildNumber = cntrList.get(0).buildNumber;
					mCounterObj.cost = cntrList.get(0).cost;
					mCounterObj.name = cntrList.get(0).name;
					mCounterObj.counterType = cntrList.get(0).counterType;
					mCounterObj.dateBuild = cntrList.get(0).dateBuild;
					mCounterObj.dateIn = cntrList.get(0).dateIn;
					mCounterObj.departmetFKCode = cntrList.get(0).departmetFKCode;
					mCounterObj.invNumber = cntrList.get(0).invNumber;
					mCounterObj.molCode = cntrList.get(0).molCode;
					mCounterObj.scCode = cntrList.get(0).scCode;

					// естимейт из ЗАДАНИЯ ПЛАН
					mCounterObj.element.code = eiObj.code;

					SCCounter sccounter = this.createSCCounterFromMetrologyCounter(mCounterObj,
							SCCounterKind.FOR_WORKORDERBYT);
					scCounterCode = sccDAO.add(sccounter);

					///////////////////////////////////////////////////
					// Устанавливаем блокировку для счетчика в ScanCounters (с
					/////////////////////////////////////////////////// типом
					/////////////////////////////////////////////////// "блокировка
					/////////////////////////////////////////////////// для
					/////////////////////////////////////////////////// установки
					/////////////////////////////////////////////////// в
					/////////////////////////////////////////////////// биллинге")
					this.lockCounterInSCByPlanCode(sccounter.scCode, eiObj.planRef.code,
							ENMetrologyCounter.BILLING_LOCK);
					///////////////////////////////////////////////////
				}

			}

			// ретурним код sccounter
			return scCounterCode;
	}

	/*
	 *
	 * Список МОЛ-ов из countersread по коду подразделения
	 *
	 */
	public String getMolListFromCountersreadByEndepartmentCode(int endepartmentcode) throws PersistenceException {
		SCMolDAO scmDAO = new SCMolDAO(
				finConnection, userProfile);
		ENDepartment2EPRenDAO dep2renDAO = new ENDepartment2EPRenDAO(connection, userProfile);

		String strMol = "";

		ENDepartment2EPRenFilter dep2renFilter = new ENDepartment2EPRenFilter();
		dep2renFilter.departmentRef.code = endepartmentcode;

		ENDepartment2EPRenShortList dep2renList = dep2renDAO.getFilteredList(dep2renFilter);

		if (dep2renList.totalCount > 0) {

			SCMolFilter scmf = new SCMolFilter();
			scmf.conditionSQL = " substr(SCMOL.KOD_MOL,1,2) =  " + dep2renList.get(0).finRenCode;

			// SCMolShortList scmlist = scmDAO.getFilteredList(scmf);
			SCMolShortList scmlist = scmDAO.getScrollableFilteredList(scmf, scmf.conditionSQL, "", 0, -1, null);

			for (int i = 0; i < scmlist.totalCount; i++) {

				if (strMol.equals("")) {
					strMol = "'" + scmlist.get(i).kod_mol + "'";
				} else {
					strMol = strMol + ", " + "'" + scmlist.get(i).kod_mol + "'";
				}

			}

		}

		return strMol;
	}

	public String getMasterListByMOLList(String molListIn) {
		try {
			if (molListIn == null) {
				return "";
			}

			if (molListIn.equals("")) {
				return "";
			}

			ENMolFilter molFilter = new ENMolFilter();
			molFilter.typeRef.code = ENMolType.MASTER;
			molFilter.statusRef.code = ENMolStatus.VALID;
			molFilter.conditionSQL = "ENMOL.FINCODE in (" + molListIn + ")";

			ENMolDAO molDAO = new ENMolDAO(connection, userProfile);

			ENMolShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);

			String strMol = "";

			for (int i = 0; i < molList.totalCount; i++) {
				if (strMol.equals("")) {
					strMol = "'" + molList.get(i).finCode + "'";
				} else {
					strMol = strMol + ", " + "'" + molList.get(i).finCode + "'";
				}
			}

			return strMol;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int bindCounter(int workOrderBytItemCode, SCCounter counter) {
		int scCounterCode = Integer.MIN_VALUE;
		// Признак того, есть ли уже на строке задания привязанный счетчик
		boolean isBytItemWithCounter = false;

		if (workOrderBytItemCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4376 Не вказано код строки змінного завдання!");
		}

		if (counter == null) {
			throw new SystemException("\n\nNET-4376 Не вказано лічильник!");
		}

		if (counter.invNumber == null) {
			throw new SystemException("\n\nNET-4376 Не вказано лічильник (інв. №)!");
		}

		if (counter.invNumber.equals("")) {
			throw new SystemException("\n\nNET-4376 Не вказано лічильник (інв. №)!");
		}

		// Ссылку counter.estimateItemRef.code будем создавать ниже
		// автоматически
		/*
		 * if (counter.estimateItemRef == null) { throw new SystemException(
		 * "\n\nNET-4376 Не знайдено estimateItemRef для лічильника!"); }
		 *
		 * if (counter.estimateItemRef.code == Integer.MIN_VALUE) { throw new
		 * SystemException(
		 * "\n\nNET-4376 Не знайдено estimateItemRef для лічильника!"); }
		 */

		try {
			// Переменные со словом "current" в названии - все, что относится к
			// текущей редактируемой строке
			// сменного задания. Без "current" - то, что относится к новому
			// привязываемому счетчику
			ENMetrologyCounterShort counterSC = null;
			ENMetrologyCounterShort currentCounterSC = null;

			int departmentCodeCurrent = Integer.MIN_VALUE;
			int departmentCode = Integer.MIN_VALUE;

			String personalAccountCurrent = "";
			String personalAccount = "";

			int estimateItemCodeCurrent = Integer.MIN_VALUE;
			int estimateItemCode = Integer.MIN_VALUE;

			ENWorkOrderBytItemDAO itemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);

			ENWorkOrderBytItem item = itemDAO.getObject(workOrderBytItemCode);

			if (item == null) {
				throw new SystemException(
						"\n\nNET-4376 Не знайдено строку змінного завдання! Код = " + workOrderBytItemCode);
			}

			SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

			SCCounter currentCounter = null;

			// Сбрасываем код эстимейта - ниже определим его сами
			counter.estimateItemRef.code = Integer.MIN_VALUE;

			if (item.scCounterRef != null) {
				if (item.scCounterRef.code > Integer.MIN_VALUE) {
					isBytItemWithCounter = true;

					currentCounter = scCounterDAO.getObject(item.scCounterRef.code);

					/////// !!!!!!!!!!!!!!! ВСЕ СТРОКИ БУДУТ АПДЕЙТИТЬСЯ ОДИН
					/////// РАЗ В ЭТОМ МЕТОДЕ!!!!!
					// Если в сменном задании несколько строк, ссылающихся на
					/////// одну и ту же работу,
					// метод bindCounter будет вызываться для каждой из них с
					/////// одним и тем же счетчиком!!!
					/*
					 * if (currentCounter.scCode == counter.scCode) { return
					 * item.scCounterRef.code; }
					 */
					///////

					if (currentCounter == null) {
						throw new SystemException(
								"\n\nNET-4376 Не знайдено лічильник (sccounter)! Код = " + item.scCounterRef.code);
					}

					if (currentCounter.invNumber == null) {
						throw new SystemException("\n\nNET-4376 Не знайдено лічильник - інв. № (sccounter)! Код = "
								+ item.scCounterRef.code);
					}

					if (currentCounter.invNumber.equals("")) {
						throw new SystemException("\n\nNET-4376 Не знайдено лічильник - інв. № (sccounter)! Код = "
								+ item.scCounterRef.code);
					}

					if (currentCounter.invNumber.equals("")) {
						throw new SystemException("\n\nNET-4376 Не знайдено лічильник - інв. № (sccounter)! Код = "
								+ item.scCounterRef.code);
					}

					if (currentCounter.estimateItemRef == null) {
						throw new SystemException(
								"\n\nNET-4376 Не знайдено estimateItemRef для лічильника (sccounter)! Код sccounter = "
										+ item.scCounterRef.code);
					}

					if (currentCounter.estimateItemRef.code == Integer.MIN_VALUE) {
						throw new SystemException(
								"\n\nNET-4376 Не знайдено estimateItemRef для лічильника (sccounter)! Код sccounter = "
										+ item.scCounterRef.code);
					}

					if (!counter.invNumber.equals(currentCounter.invNumber)) {
						// изменяем ссылку на estimateItem
						counter.estimateItemRef.code = currentCounter.estimateItemRef.code;
					} else {
						throw new SystemException(
								"\n\nNET-4376 Обраний лічильник ВЖЕ ПРИВ'ЯЗАНО до змінного завдання! scCode = "
										+ counter.scCode);
					}
				}
			}

			// Если код эстимейта неизвестен (это будет в том случае, если на
			// строке задания не было привязанного счетчика),
			// нужно найти в плане счетчик
			if (counter.estimateItemRef.code == Integer.MIN_VALUE) {
				ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
				eiFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;
				eiFilter.planItemRef.code = item.planItemRef.code;
				eiFilter.conditionSQL = "ENESTIMATEITEM.COUNTFACT > 0";

				ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);

				int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);

				if (eiArr.length > 1) {
					throw new SystemException("\n\nNET-4376 Знайдено декілька (" + eiArr.length
							+ ") лічильників для однієї роботи! Код роботи в плані: " + item.planItemRef.code);
				} else if (eiArr.length == 1) {
					// эстимейт с задания план
					counter.estimateItemRef.code = eiArr[0];
				}
			}

			if (counter.estimateItemRef.code == Integer.MIN_VALUE) {
				throw new SystemException(
						"\n\nNET-4376 Не знайдено лічильник у плані! Код плана: " + item.planRef.code);
			}

			EstimateLogic eiLogic = new EstimateLogic(connection, userProfile);

			if (isBytItemWithCounter) // если счетчик был привязан к строке
										// задания
			{
				//////////////
				ENMetrologyCounterFilter currentCounterSCFilter = new ENMetrologyCounterFilter();
				// currentCounterSCFilter.scCode = currentCounter.scCode;
				currentCounterSCFilter.invNumber = currentCounter.invNumber;

				currentCounterSC = getCounterFromScanCounters(currentCounterSCFilter, true);

				if (currentCounterSC == null) {
					throw new SystemException(
							"\n\nNET-4376 Не знайдено лічильник у ScanCounters! Інв.№: " + currentCounter.invNumber);
				}

				departmentCodeCurrent = eiLogic.getDepartmentByEstimateItemCode(currentCounter.estimateItemRef.code);
				personalAccountCurrent = item.accountNumber;
				estimateItemCodeCurrent = eiLogic
						.getEstimateFromCurrentPlanByEstimateCode(currentCounter.estimateItemRef.code).code;
						//////////////

				//////////////
				ENMetrologyCounterFilter counterSCFilter = new ENMetrologyCounterFilter();
				counterSCFilter.scCode = counter.scCode;

				counterSC = getCounterFromScanCounters(counterSCFilter, true);

				if (counterSC == null) {
					throw new SystemException(
							"\n\nNET-4376 Не знайдено лічильник у ScanCounters! scCode = " + counter.scCode);
				}

				departmentCode = counterSC.departmentCode;
				personalAccount = counterSC.personalAccount;
				if (counterSC.enestimateItemCode != Integer.MIN_VALUE) {
					estimateItemCode = eiLogic
							.getEstimateFromCurrentPlanByEstimateCode(counterSC.enestimateItemCode).code;
				} else {
					estimateItemCode = Integer.MIN_VALUE;
				}
				//////////////

				//////////////
				// Меняем местами привязки для нетовских счетчиков (sccounter) и
				////////////// для ScanCounters (ostable) -
				// estimateItemCode, departmentCode, personalAccount
				// ***if (estimateItemCode > Integer.MIN_VALUE)
				// ***{
				SCCounterFilter scCounterFilterCurrent = new SCCounterFilter();
				scCounterFilterCurrent.kindRef.code = SCCounterKind.FOR_PRIHOD;
				scCounterFilterCurrent.invNumber = currentCounter.invNumber;

				int scCounterCurrentArr[] = scCounterDAO.getFilteredCodeArray(scCounterFilterCurrent, 0, -1);

				for (int i = 0; i < scCounterCurrentArr.length; i++) {
					SCCounter scCounterCurrent = scCounterDAO.getObject(scCounterCurrentArr[i]);
					scCounterCurrent.estimateItemRef.code = estimateItemCode;
					scCounterDAO.save(scCounterCurrent);
				}
				// ***}

				// ***if (estimateItemCodeCurrent > Integer.MIN_VALUE)
				// ***{
				SCCounterFilter scCounterFilter = new SCCounterFilter();
				scCounterFilter.kindRef.code = SCCounterKind.FOR_PRIHOD;
				scCounterFilter.invNumber = counter.invNumber;

				int scCounterArr[] = scCounterDAO.getFilteredCodeArray(scCounterFilter, 0, -1);

				for (int i = 0; i < scCounterArr.length; i++) {
					SCCounter scCounter = scCounterDAO.getObject(scCounterArr[i]);
					scCounter.estimateItemRef.code = estimateItemCodeCurrent;
					scCounterDAO.save(scCounter);
				}
				// ***}

				///////////////////////////////////////////////////
				// Снимаем блокировку для счетчика в ScanCounters (для того
				/////////////////////////////////////////////////// счетчика,
				/////////////////////////////////////////////////// который
				/////////////////////////////////////////////////// удаляется) -
				// перед тем, как апдейтить ниже (иначе триггер не даст
				/////////////////////////////////////////////////// проапдейтить
				/////////////////////////////////////////////////// залоченный
				/////////////////////////////////////////////////// счетчик)
				lockCounterInSCByPlanCode(currentCounter.scCode, item.planRef.code,
						(-1) * ENMetrologyCounter.BILLING_LOCK);
						///////////////////////////////////////////////////

				// Апдейтим привязку счетчиков под планы в ScanCounters (но
				// только, если этот счетчик был в приходе ПОД ПЛАН!)
				if (scCounterCurrentArr.length > 0 || scCounterArr.length > 0) {
					updateCountersreadOstableByInvNum(currentCounter.invNumber, personalAccount, departmentCode,
							estimateItemCode);
					updateCountersreadOstableByInvNum(counter.invNumber, personalAccountCurrent, departmentCodeCurrent,
							estimateItemCodeCurrent);
				}
				/////////////

				/////////////
				// Удаляем текущий привязанный к строке задания счетчик (ниже
				///////////// будет создан новый)
				// Также удаляем привязку со всех строк задания, связанных с той
				///////////// же работой
				ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();

				itemFilter.workOrderBytRef.code = item.workOrderBytRef.code;
				itemFilter.planItemRef.code = item.planItemRef.code;
				itemFilter.scCounterRef.code = item.scCounterRef.code;
				// itemFilter.conditionSQL = "code <> " + item.code;

				int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, -1);

				// Сбрасываем ссылку на sccounter, чтобы его удалить
				for (int i = 0; i < itemArr.length; i++) {
					ENWorkOrderBytItem item1 = itemDAO.getObject(itemArr[i]);
					item1.scCounterRef.code = Integer.MIN_VALUE;
					itemDAO.save(item1);
				}

				// Удаляем сам счетчик (sccounter)
				scCounterDAO.remove(item.scCounterRef.code);

				// Нужно перечитать item, т.к. выше в цикле он был изменен!
				item = itemDAO.getObject(item.code);
				/////////////
			} else // Если счетчика на строке задания не
					// было!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			{
				/*
				 * departmentCodeCurrent =
				 * eiLogic.getDepartmentByEstimateItemCode(counter.
				 * estimateItemRef.code); personalAccountCurrent =
				 * item.accountNumber; estimateItemCodeCurrent =
				 * eiLogic.getEstimateFromCurrentPlanByEstimateCode(counter.
				 * estimateItemRef.code).code;
				 *
				 * SCCounterFilter scCounterFilter = new SCCounterFilter();
				 * scCounterFilter.kindRef.code = SCCounterKind.FOR_PRIHOD;
				 * scCounterFilter.estimateItemRef.code =
				 * estimateItemCodeCurrent;
				 */

				//////////////
				departmentCodeCurrent = eiLogic.getDepartmentByEstimateItemCode(counter.estimateItemRef.code);
				personalAccountCurrent = item.accountNumber;
				estimateItemCodeCurrent = eiLogic
						.getEstimateFromCurrentPlanByEstimateCode(counter.estimateItemRef.code).code;

				if (estimateItemCodeCurrent > Integer.MIN_VALUE) {
					ENMetrologyCounterFilter currentCounterSCFilter = new ENMetrologyCounterFilter();
					// currentCounterSCFilter.scCode = currentCounter.scCode;
					// currentCounterSCFilter.invNumber =
					// currentCounter.invNumber;
					currentCounterSCFilter.conditionSQL = " a.enestimateitemcode = " + estimateItemCodeCurrent;

					currentCounterSC = getCounterFromScanCounters(currentCounterSCFilter, false);
				} else {
					currentCounterSC = null;
				}

				/*
				 * if (currentCounterSC == null) { throw new SystemException(
				 * "\n\nNET-4376 Не знайдено лічильник у ScanCounters! [estimateItemCode = "
				 * + estimateItemCodeCurrent + "]"); }
				 */
				//////////////

				//////////////
				ENMetrologyCounterFilter counterSCFilter = new ENMetrologyCounterFilter();
				counterSCFilter.scCode = counter.scCode;

				counterSC = getCounterFromScanCounters(counterSCFilter, true);

				if (counterSC == null) {
					throw new SystemException(
							"\n\nNET-4376 Не знайдено лічильник у ScanCounters! scCode = " + counter.scCode);
				}

				departmentCode = counterSC.departmentCode;
				personalAccount = counterSC.personalAccount;
				if (counterSC.enestimateItemCode != Integer.MIN_VALUE) {
					estimateItemCode = eiLogic
							.getEstimateFromCurrentPlanByEstimateCode(counterSC.enestimateItemCode).code;
				} else {
					estimateItemCode = Integer.MIN_VALUE;
				}
				//////////////

				int scCounterCurrentArr[] = new int[0];

				//////////////
				// Меняем местами привязки для нетовских счетчиков (sccounter) и
				////////////// для ScanCounters (ostable) -
				// estimateItemCode, departmentCode, personalAccount
				if (/* estimateItemCode > Integer.MIN_VALUE && */currentCounterSC != null) {
					SCCounterFilter scCounterFilterCurrent = new SCCounterFilter();
					scCounterFilterCurrent.kindRef.code = SCCounterKind.FOR_PRIHOD;
					scCounterFilterCurrent.invNumber = currentCounterSC.invNumber;

					scCounterCurrentArr = scCounterDAO.getFilteredCodeArray(scCounterFilterCurrent, 0, -1);

					for (int i = 0; i < scCounterCurrentArr.length; i++) {
						SCCounter scCounterCurrent = scCounterDAO.getObject(scCounterCurrentArr[i]);
						scCounterCurrent.estimateItemRef.code = estimateItemCode;
						scCounterDAO.save(scCounterCurrent);
					}
				}

				// ***if (estimateItemCodeCurrent > Integer.MIN_VALUE)
				// ***{
				SCCounterFilter scCounterFilter = new SCCounterFilter();
				scCounterFilter.kindRef.code = SCCounterKind.FOR_PRIHOD;
				scCounterFilter.invNumber = counter.invNumber;

				int scCounterArr[] = scCounterDAO.getFilteredCodeArray(scCounterFilter, 0, -1);

				for (int i = 0; i < scCounterArr.length; i++) {
					SCCounter scCounter = scCounterDAO.getObject(scCounterArr[i]);
					scCounter.estimateItemRef.code = estimateItemCodeCurrent;
					scCounterDAO.save(scCounter);
				}
				// ***}

				// Апдейтим привязку счетчиков под планы в ScanCounters (но
				// только, если этот счетчик был в приходе ПОД ПЛАН!)
				if (scCounterCurrentArr.length > 0 || scCounterArr.length > 0) {
					if (currentCounterSC != null) {
						updateCountersreadOstableByInvNum(currentCounterSC.invNumber, personalAccount, departmentCode,
								estimateItemCode);
					}
					updateCountersreadOstableByInvNum(counter.invNumber, personalAccountCurrent, departmentCodeCurrent,
							estimateItemCodeCurrent);
				}
				/////////////
			}

			counter.kindRef.code = SCCounterKind.FOR_WORKORDERBYT;
			scCounterCode = scCounterDAO.add(counter);

			// Сохраняем ссылку на счетчик на строке задания
			item.scCounterRef.code = scCounterCode;
			itemDAO.save(item);

			///////////////////////////////////////////////////
			// Устанавливаем блокировку для счетчика в ScanCounters (с типом
			/////////////////////////////////////////////////// "блокировка для
			/////////////////////////////////////////////////// установки в
			/////////////////////////////////////////////////// биллинге")
			lockCounterInSCByPlanCode(counter.scCode, item.planRef.code, ENMetrologyCounter.BILLING_LOCK);
			///////////////////////////////////////////////////

			///////////////////////////////////////////////////
			// Привяжем счетчик на всех строках этого же задания, связанных с
			/////////////////////////////////////////////////// той же работой,
			/////////////////////////////////////////////////// что и текущая
			/////////////////////////////////////////////////// строка
			ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();

			itemFilter.workOrderBytRef.code = item.workOrderBytRef.code;
			itemFilter.planItemRef.code = item.planItemRef.code;
			itemFilter.conditionSQL = "code <> " + item.code;

			int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, -1);

			for (int i = 0; i < itemArr.length; i++) {
				ENWorkOrderBytItem item1 = itemDAO.getObject(itemArr[i]);
				item1.scCounterRef.code = scCounterCode;
				itemDAO.save(item1);
			}
			///////////////////////////////////////////////////

			return scCounterCode;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public ENMetrologyCounterShort getCounterFromScanCounters(ENMetrologyCounterFilter counterFilter,
			boolean mustBeOnlyOne) {
		if (counterFilter == null) {
			throw new SystemException("\n\nНе задано параметри для пошуку лічильника! [counterFilter == null]");
		}

		try {

			ENMetrologyCounterShortList counterList = getCountersListFromScanCounter(counterFilter, 0, -1);

			if (mustBeOnlyOne) {
				if (counterList.totalCount == 0) {
					throw new SystemException(
							"\n\nЗа вказаними критеріями пошуку не знайдено жодного лічильника у ScanCounters! "
									+ "[counterFilter.scCode = " + counterFilter.scCode + "]");
				}

				if (counterList.totalCount > 1) {
					throw new SystemException("\n\nЗа вказаними критеріями пошуку знайдено декілька ("
							+ counterList.totalCount + ") лічильників у ScanCounters! " + "[counterFilter.scCode = "
							+ counterFilter.scCode + "]");
				}

				return counterList.get(0);
			} else {
				if (counterList.totalCount >= 1) {
					return counterList.get(0);
				}
			}

			return null;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 *
	 * @param код МОЛ или маска
	 *
	 * @param phasity
	 *            - фазность счетчика
	 * @param zoneType
	 *            - зонность
	 * @param materialCode
	 *            - код материала
	 * @param price
	 *            - граничная цена (если не задана то не фильтровать )
	 *
	 */
	public ENMetrologyCounterShort getParametrizedCounter(String molCode, int phasity, int zoneType, int materialCode,
			BigDecimal price) {
		// Мы не должны выбирать из остатков те счетчики, которые пришли по
		// нашей автоматической заявке
		// (т.е. счетчики, инв. номера которых есть в нашей связке
		// RQApCost2Item2Services - инв. номера туда попадут после прихода).

		ENMetrologyCounterFilter scFilter = new ENMetrologyCounterFilter();
		scFilter.account = RQConsts.SCCOUNTER_PARAMETERIZED_MULTIFUNCTIONAL_COUNT;
		String molCondition = " a.kod_mol like '" + molCode + "'";
		if(molCode.equals("52%")) {
			molCondition = " (a.kod_mol like '" + molCode + "' OR a.kod_mol = '4201')";
		}
		// SUPP-61308 Добавление условия, чтобы не брались счетчики из аварийного запаса is_avar <> 1
		scFilter.conditionSQL = molCondition + " and nvl(a.energy_lock,0) <= 0  " + " and nvl(a.is_avar, 0) <> 1 " + " and a.phasity = "
				+ phasity + " and a.zones = " + zoneType + " and a.materialcode =  " + materialCode
				+ /*SUPP-106652*/ "and (a.prizn_prih is null or a.prizn_prih <> '0')\n"
				// если зашло условие по цене счетчика то через ф-ю выбоки сумм
				// без параметризации ограничим сумму
				+ new String(price.compareTo(new BigDecimal(0)) == 1
						? " and countersread.get_sum_without_parametrizac(a.kod_inv) <= " + price : " ");
		scFilter.orderBySQL = " sum_without_parametrizac desc ";

		return getCounterFromScanCountersWithoutParametrizac(scFilter, false);
	}

	/**
	 * Выбор остатков из Скансчетчиков по коду материала
	 *
	 * @param materialCode
	 *            - код материала
	 * @param podrCodes
	 *            - список кодов подразделений
	 *
	 * @return список счетчиков
	 */
	public ENMetrologyCounterShortList getCounters(int materialCode) {
		if (materialCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код матеріала!");
		}

		try {
			ENMetrologyCounterFilter scFilter = new ENMetrologyCounterFilter();
			scFilter.conditionSQL = " a.materialcode = " + materialCode + " and a.show_ = 'Y' " +
					" and nvl(a.energy_lock,0) <= 0 "
					+ " and substr(a.kod_subsch_b,1,2) = '15'"
					// 11.12.2017 - поговорили с Юрковским , решили что нужно добавить ограничение . не должны учитываться счетчики с признаками is_vrtu или is_avar
					+ " and NVL ( a.is_vrtu , 0) = 0 and NVL ( a.is_avar , 0) = 0 "
					/*17.06.2021 со слов NovohatskayaSS для формирования заявки не будут браться в остатки
					 * счетчики ИП (инвест. программы)*/
					+ " and nvl(a.prizn_prih, '') <> '0'";

			return getCountersListFromScanCounter(scFilter, 0, -1);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public RQApprovedCostShort getApprovedCost(int phasity, int materialCode) {
		RQApprovedCostShort apCostShort = null;

		try {
			RQApprovedCostDAO apCostDAO = new RQApprovedCostDAO(connection, userProfile);
			// RQOrderDAO orderDAO = new RQOrderDAO(connection, userProfile);

			RQApprovedCostFilter apCostFilter = new RQApprovedCostFilter();
			// Ищем не только Утвержденные, но и Черновые тоже - если находим
			// Черновые, нужно поругаться и отправить в ОМТС!!!
			// Доб. статус "Закрытые" ??? (Для тех, у к-рых countfact
			// сравнялся с countgen, нужно сетить его автоматом) ???
			// apCostFilter.approvedCostStatusRef.code =
			// RQApprovedCostStatus.APPROVED;
			apCostFilter.counterPhasity = phasity;
			apCostFilter.conditionSQL = " rqapprovedcost.code in ( \n" + "           select ac.code  \n"
					+ "           from rqorderitem oi, rqapprovedcost ac \n"
					+ "           where oi.statusrefcode = " + RQOrderItemStatus.GOOD
					+ "             and oi.code = ac.rqorderitemrefcode  \n" + "           and oi.materialcode = "
					+ materialCode + " \n" + "           and ac.approvedcoststatusrfcd in ("
					+ RQApprovedCostStatus.DRAFT + ", " + RQApprovedCostStatus.APPROVED + ") \n" + "  ) \n" +
					// 24.04.15 Будем сразу выбирать только такие строки, в
					// которых еще есть свободное кол-во
					" and rqapprovedcost.countfact < rqapprovedcost.countgen";
			// 24.04.15 Сортируем по коду, чтобы вначале выбирались более старые
			// строки
			apCostFilter.orderBySQL = "rqapprovedcost.code";

			RQApprovedCostShortList apCostList = apCostDAO.getScrollableFilteredList(apCostFilter, 0, -1);

			/*
			 * Проверим ниже по-другому // Проверим вначале на наличие черновых
			 * for (int i = 0; i < apCostList.totalCount; i++) { if
			 * (apCostList.get(i).approvedCostStatusRefCode ==
			 * RQApprovedCostStatus.DRAFT) { RQOrderFilter orderFilter = new
			 * RQOrderFilter(); orderFilter.conditionSQL = "RQORDER.code in " +
			 * " ( " + " select oi.orderrefcode " +
			 * "   from rqorderitem oi, rqapprovedcost ac " +
			 * "  where ac.rqorderitemrefcode = oi.code " + "    and ac.code = "
			 * + apCostList.get(i).code + " ) "; RQOrderShortList orderList =
			 * orderDAO.getScrollableFilteredList(orderFilter, 0, -1);
			 *
			 * if (orderList.totalCount > 0) { throw new SystemException(
			 * "\n\nNET-4455 Ціна на лічильники ще не затверджена! Зверніться, будь ласка, до ВМТП!"
			 * + "\n\nЗаявка на закупівлю лічильників: №" +
			 * orderList.get(0).numberDoc + " від " + new
			 * SimpleDateFormat("dd.MM.yyyy").format(orderList.get(0).dateGen));
			 * }
			 *
			 * throw new SystemException(
			 * "\n\nNET-4455 Ціна на лічильники ще не затверджена! Зверніться, будь ласка, до ВМТП!"
			 * ); } }
			 */

			/*
			 * Будем пока брать первую запись из найденных if
			 * (apCostList.totalCount > 1) { throw new SystemException(
			 * "\n\nNET-4455 Знайдено більше однієї затвердженої ціни за вказаними параметрами!"
			 * ); }
			 */

			// if (apCostList.totalCount == 1)
			if (apCostList.totalCount >= 1) {
				apCostShort = apCostList.get(0);

				if (apCostShort.approvedCostStatusRefCode == RQApprovedCostStatus.DRAFT) {
					RQOrderDAO orderDAO = new RQOrderDAO(connection, userProfile);

					RQOrderFilter orderFilter = new RQOrderFilter();
					orderFilter.conditionSQL = "RQORDER.code in " + " ( " + " select oi.orderrefcode "
							+ "   from rqorderitem oi, rqapprovedcost ac " + "  where ac.rqorderitemrefcode = oi.code "
							// + "    and oi.statusrefcode = " + RQOrderItemStatus.GOOD
							+ "    and ac.code = " + apCostShort.code + " ) ";
					RQOrderShortList orderList = orderDAO.getScrollableFilteredListNOSEGR(orderFilter, 0, -1);

					if (orderList.totalCount > 0) {

						/**
						 * Почтовая рассылка при создании автоматической заявки
						 */
						OrderLogic logic = new OrderLogic(connection, userProfile);
						logic.sendMail(orderList.get(0).numberDoc, orderList.get(0).dateGen);

						throw new SystemException(
								"\n\nNET-4455 Ціна на лічильники ще не затверджена! Зверніться, будь ласка, до ВМТП!"
										+ "\n\nЗаявка на закупівлю лічильників: №" + orderList.get(0).numberDoc
										+ " від "
										+ new SimpleDateFormat("dd.MM.yyyy").format(orderList.get(0).dateGen));
					}

					throw new SystemException(
							"\n\nNET-4455 Ціна на лічильники ще не затверджена! Зверніться, будь ласка, до ВМТП!");
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return apCostShort;
	}

	public void updateCountersreadOstableByInvNum(String invNum, String personalAccount, int departmentCode,
			int estimateItemCode) {

		try {
			SCCounterDAO scCounterDAO = new SCCounterDAO(
					finConnection, userProfile);
			scCounterDAO.updateCountersreadOstableByInvNum(invNum, personalAccount, departmentCode, estimateItemCode);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * Проведение акта дефектации счетчиков
	 *
	 * @param act
	 *            - акт дефектации (объект ENAct)
	 */
	public void closeActDefect(ENAct act) {

		if (act == null) {
			throw new SystemException("\n\nNET-4392 Немає даних про акт!");
		}

		try {

			SCLogicDAO scDAO = new SCLogicDAO(
					finConnection, userProfile);

			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = " code in " + " (select ap.plancode " + "    from enact2enplanwork ap "
					+ "   where ap.actrefcode = " + act.code + ")";

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

			int[] planArr = planDAO.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);

			if (planArr.length == 0) {
				throw new EnergyproSystemException(
						"\n\nNET-4392 До акту з кодом " + act.code + " не включено жодного плану!");
			}

			CounterLogic counterLogic = new CounterLogic(connection, userProfile);

			ENAct2OSTableDAO act2OSTableDAO = new ENAct2OSTableDAO(connection, userProfile);

			for (int i = 0; i < planArr.length; i++) {
				ENPlanWork plan = planDAO.getObjectNOSEGR(planArr[i]);

				if (plan != null) {
					ENMetrologyCounter counter = counterLogic.getCounterByElementCode(plan.elementRef.code);

					if (counter == null) {
						throw new EnergyproSystemException(
								"\n\nNET-4392 Лічильник для плана з кодом " + planArr[i] + " (код плану) не знайдено!");
					}

					if (counter.invNumber == null) {
						throw new EnergyproSystemException("\n\nNET-4392 Лічильник для плана з кодом " + planArr[i]
								+ " (код плану) не має інв. номера!");
					}

					// Проводим в ScanCounters
					// scDao.defect_prov_ins(counter.scCode, act.numberGen,
					// act.dateAct, act.dateGen, act.commentGen);
					int new_num_un = scDAO.defect_prov_ins(counter.scCode, act.numberGen, act.dateAct, act.dateGen,
							userProfile.userName.toUpperCase(), "Автоматическая дефектация. EnergyNet.");

					if (new_num_un == Integer.MIN_VALUE) {
						throw new EnergyproSystemException("\n\nNET-4392 Не знайдено даних про лічильник з кодом "
								+ counter.scCode + " після проведення акту дефектації!");
					}

					// Сохраняем связку акта с новым кодом (num_un) счетчика
					// (для возможности дальнейшей отмены проведения акта)
					ENAct2OSTable act2OSTable = new ENAct2OSTable();
					act2OSTable.actRef.code = act.code;
					act2OSTable.invNumber = counter.invNumber;
					act2OSTable.num_un = new_num_un;
					act2OSTableDAO.add(act2OSTable);
				} else {
					throw new EnergyproSystemException("\n\nNET-4392 План з кодом " + planArr[i] + " не знайдено!");
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * Отмена проведения акта дефектации счетчиков
	 *
	 * @param act
	 *            - акт дефектации (объект ENAct)
	 */
	public void undoCloseActDefect(ENAct act) {
		if (act == null) {
			throw new SystemException("\n\nNET-4392 Немає даних про акт!");
		}
		try {
			ENAct2OSTableDAO act2OSTableDAO = new ENAct2OSTableDAO(connection, userProfile);

			ENAct2OSTableFilter act2OSTableFilter = new ENAct2OSTableFilter();
			act2OSTableFilter.actRef.code = act.code;

			ENAct2OSTableShortList act2OSTableList = act2OSTableDAO.getScrollableFilteredList(act2OSTableFilter, 0, -1);

			if (act2OSTableList.totalCount == 0) {
				throw new EnergyproSystemException(
						"\n\nNET-4392 До акту з кодом " + act.code + " не включено жодного лічильнику!");
			}


			SCLogicDAO scDAO = new SCLogicDAO(
					finConnection, userProfile);

			for (int i = 0; i < act2OSTableList.totalCount; i++) {
				if (act2OSTableList.get(i).num_un == Integer.MIN_VALUE) {
					throw new EnergyproSystemException(
							"\n\nNET-4392 Помилка пошуку лічильників для акту з кодом " + act.code + " !");
				}

				// Отменяем проведение в ScanCounters
				scDAO.defect_prov_del(act2OSTableList.get(i).num_un);

				// Удаляем запись из связки
				act2OSTableDAO.remove(act2OSTableList.get(i).code);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public BigDecimal getTransportCostsForCounter(int scCode) {

		BigDecimal transportCostsForCounter = new BigDecimal(0);
		if (scCode == Integer.MIN_VALUE)
			return new BigDecimal(0);

		try {
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = " code in ( " + " select enp.code as planworkcode 	"
					+ " from sccounter sc ,enestimateitem eni ,enplanwork enp ,enelement el "
					+ " where sc.estimateitemrefcode = eni.code " + " and eni.accountingtyperefcode = "
					+ TKAccountingType.COUNTERS + /* Счетчики */
					" and enp.code = eni.planrefcode " + " and enp.elementrefcode = el.code " + " and sc.code = "
					+ scCode + ") ";

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			int[] planArr;

			planArr = planDAO.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);

			if (planArr.length != 1) {
				throw new EnergyproSystemException(
						"\n\nДля лічильника не знайдено план, або кількість планів більше одного!"
								+ "\n\nsccounter.code=" + scCode);
			}

			ENAct2TransportFilter act2TransportFilter = new ENAct2TransportFilter();
			act2TransportFilter.conditionSQL = "code in ( " + "SELECT en2tr.code "
					+ " FROM   net.enact2transport en2tr , enact2enplanwork a2p  , entransportitem t "
					+ " where en2tr.actrefcode = a2p.actrefcode " + " and t.planrefcode = a2p.plancode "
					+ " and a2p.plancode = " + planArr[0] + " ) ";

			ENAct2TransportDAO act2TransportDAO = new ENAct2TransportDAO(connection, userProfile);
			int[] act2TransportArr;
			act2TransportArr = act2TransportDAO.getFilteredCodeArray(act2TransportFilter,
					act2TransportFilter.conditionSQL, null, 0, -1, null);
			if (act2TransportArr.length > 0) {
				for (int act2TransportCode : act2TransportArr) {
					ENAct2Transport act2Transport = act2TransportDAO.getObject(act2TransportCode);
					if (act2Transport.paysWork != null) {
						transportCostsForCounter = transportCostsForCounter.add(act2Transport.paysWork);
					}
				}
			}

		} catch (PersistenceException e) {

			e.printStackTrace();
		}

		return transportCostsForCounter;
	}

	/**
	 * создание и формирование строк ОЗ по счетчикам при подписании акта на
	 * услуги при замене на многотарифный
	 *
	 * @param actCode
	 *            - код акта
	 *
	 */
	public void createUsageInput(int actCode) {
		Connection docFlowConnection = null;

		try {
			ENActDAO actDao = new ENActDAO(userProfile, connection);
			ENAct2SCUsageInputDAO act2ozDao = new ENAct2SCUsageInputDAO(userProfile, connection);
			ENMolDAO molDAO = new ENMolDAO(userProfile, connection);

			ENAct act = actDao.getObject(actCode);

			int usageInputCode = Integer.MIN_VALUE;

			ENAct2SCUsageInputFilter act2ozFilter = new ENAct2SCUsageInputFilter();
			act2ozFilter.actRef.code = actCode;

			int act2ozArr[] = act2ozDao.getFilteredCodeArray(act2ozFilter, 0, -1);
			if (act2ozArr.length > 0) {
				ENAct2SCUsageInput act2oz = act2ozDao.getObject(act2ozArr[0]);
				usageInputCode = act2oz.scUsageInputRef.code;
			}

			if (usageInputCode == Integer.MIN_VALUE) {
				Context context = new InitialContext();
				Object usageInputControllerRef = context.lookup(SCUsageInputController.JNDI_NAME);
				SCUsageInputControllerHome usageInputHome = (SCUsageInputControllerHome) PortableRemoteObject
						.narrow(usageInputControllerRef, SCUsageInputControllerHome.class);
				SCUsageInputController usageInputController = usageInputHome.create();

				int departmentCode = Integer.MIN_VALUE;
				ENPlanWorkDAO planDao = new ENPlanWorkDAO(userProfile, connection);
				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();

				planFilter.conditionSQL = "enplanwork.code = (select a2p.plancode "
						+ " from enact2enplanwork a2p where a2p.actrefcode = " + actCode + " limit 1)";

				int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
				if (planArr.length > 0) {
					departmentCode = planDao.getObject(planArr[0]).departmentRef.code;
				}

				if (departmentCode == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("\n\n " + "Помилка при визначенні підрозділу в плані!");
				}

				SCCounterDAO sccDAO = new SCCounterDAO(userProfile, connection);
				SCCounterFilter sccFilter = new SCCounterFilter();
				sccFilter.kindRef.code = SCCounterKind.FOR_FACT;
				sccFilter.conditionSQL = " sccounter.estimateitemrefcode in \n"
						// + "	( select ei.code from enestimateitem ei \n" + "	where ei.planrefcode = " + planArr[0]
						// SUPP-67133....
						+ "	( select ei.code from enestimateitem ei \n"
						+ "	where ei.planrefcode in (select a2p.plancode "
						+ " from enact2enplanwork a2p where a2p.actrefcode = " + actCode + ") "
						+ " \n" + "	and ei.accountingtyperefcode = " + TKAccountingType.COUNTERS + " \n"
						+ "	and ei.kindrefcode = " + ENEstimateItemKind.MATERIALS + "  )  ";

				SCCounterShortList sccList = sccDAO.getScrollableFilteredList(sccFilter, 0, -1);

				if (sccList.totalCount == 0) {
					throw new EnergyproSystemException("\n\n " + "На акті не знайдено лічильник для формування документів введення в експлуатацію!!!");
				}

				SCUsageInput usageInput = new SCUsageInput();
				usageInput.code = Integer.MIN_VALUE;
				usageInput.numberDoc = "Auto";
				usageInput.dateGen = act.dateGen;
				usageInput.dateStart = act.dateAct;
				usageInput.dateFinal = act.dateGen;

				/****** МОЛ из Сканов */
				if(sccList.get(0).molCode != null) {
					usageInput.molCode = sccList.get(0).molCode; // 08.07.2015
					// act.finMolCode;
					// // ?????
					ENMolFilter molFilter = new ENMolFilter();
					molFilter.finCode = sccList.get(0).molCode;
					ENMolShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);
					if (molList.totalCount == 0) {
						throw new EnergyproSystemException("\n\n " + "Помилка при визначенні МВО для лічильника!!!");
					}
					usageInput.molName = molList.get(0).name;
				} else {
					usageInput.molCode = act.finMolCode;
					usageInput.molName = act.finMolName;
				}

				/*******************  */

				usageInput.department.code = departmentCode;
				usageInput.iszku = 0;
				usageInput.molCodeCounter = act.finMolCode;
				usageInput.molNameCounter = act.finMolName;
				usageInput.autoCreated = SCUsageInputAutoCreated.YES;

				usageInputCode = usageInputController.add(usageInput);

				ENAct2SCUsageInput act2oz = new ENAct2SCUsageInput();
				act2oz.actRef.code = actCode;
				act2oz.scUsageInputRef.code = usageInputCode;

				act2ozDao.add(act2oz);
			}

			SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(userProfile, connection);
			SCUsageInput scUsageInput = scUsageInputDao.getObjectNOSEGR(usageInputCode);

			/* 24.12.2021 И.Н.С. Убираем проверки МОЛов (подписантов) - подписывать может кто угодно
			// SUPP-105890 Проверка подписантов для документа
			if (DocSigningLogic.isReadyForSigning(scUsageInput)) {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, userProfile, scUsageInput);

				// Подписантов берем из акта
				ActLogic actLogic = new ActLogic(connection, userProfile);
				DFDocSigner[] dfDocSigners = actLogic.getDFDocSigners(act);

				docSigningLogic.checkDocSigners(scUsageInput, dfDocSigners);
			}
			*/

			fillUsageInput(usageInputCode, actCode);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public ENMetrologyCounterShort getCounterFromScanCountersWithoutParametrizac(ENMetrologyCounterFilter counterFilter,
			boolean mustBeOnlyOne) {
		if (counterFilter == null) {
			throw new SystemException("\n\nНе задано параметри для пошуку лічильника! [counterFilter == null]");
		}

		try {

			ENMetrologyCounterShortList counterList = getCountersListFromScanCounterWithoutParametrezac(counterFilter, 0, -1);

			if (mustBeOnlyOne) {
				if (counterList.totalCount == 0) {
					throw new SystemException(
							"\n\nЗа вказаними критеріями пошуку не знайдено жодного лічильника у ScanCounters! "
									+ "[counterFilter.scCode = " + counterFilter.scCode + "]");
				}

				if (counterList.totalCount > 1) {
					throw new SystemException("\n\nЗа вказаними критеріями пошуку знайдено декілька ("
							+ counterList.totalCount + ") лічильників у ScanCounters! " + "[counterFilter.scCode = "
							+ counterFilter.scCode + "]");
				}

				return counterList.get(0);
			} else {
				if (counterList.totalCount >= 1) {
					return counterList.get(0);
				}
			}

			return null;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public ENMetrologyCounterShort getCounterSSS() {
		ENMetrologyCounterShort out = null;
		try

		{
			SCCounterDAO counterDao = new SCCounterDAO(userProfile, connection);
			SCCounterFilter counterFilter = new SCCounterFilter();

			/*
			 * counterFilter.conditionSQL =
			 * "sccounter.code in (select s.sccode from sccounter s " +
			 * " where to_timestamp(s.modify_time/1000) between '10.03.2015' and '07.04.2015' "
			 * + " and s.costold is not null and s.cost = s.costold limit 3)";
			 */

			// counterFilter.conditionSQL = "sccounter.code = 1012627605";

			counterFilter.conditionSQL = " sccounter.invnumber is not null "
					+ " and sccounter.code in (select scusageinputtmz2sccntr.sccounterrefcode "
					+ " from scusageinputtmz2sccntr  " + " where scusageinputtmz2sccntr.ozrefcode in ( "
					+ " select oz.code from scusageinputitemoz oz " + " where oz.usageinputitemrefcode  "
					+ " in (select scusageinputitem.code  "
					+ " from scusageinputitem where scusageinputitem.usageinputrefcode in ( "
					+ " 500002144,500002075,500002081,500002181,500002201,500002096,500002180,500002053,500002177,500002143,500002095, "
					+ " 500002111,500002164,500002234,500002103,500002320,500002219,500002235,500002310,500002315,500002303,500002222, "
					+ " 500002304,500002171,500002274,500002326,500002275,500002163,500002076,500002108,500002104,500002287,500002294, "
					+ " 500002058,500002087,500002089,500002086 " + " ) ) ) ) ";

			SCCounterShortList countersList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);
			for (int i = 0; i < countersList.totalCount; i++) {
				SCCounter counters = counterDao.getObject(countersList.get(i).code);

				ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
				f.invNumber = counters.invNumber;
				ENMetrologyCounterShortList list = getCountersListFromScanCounter(f, 0, -1);

				if (list.totalCount > 0) {

					System.out.println("&& ###### countersCode = " + counters.code + ", netCost = "
							+ countersList.get(i).cost + ", scCost = " + list.get(0).cost + " netCost <> scCost = "
							+ (counters.cost.doubleValue() != list.get(0).cost.doubleValue()));

					if (counters.cost.doubleValue() != list.get(0).cost.doubleValue()) {
						counters.cost = list.get(0).cost;
						counterDao.save(counters);
					}

				}

			}

			return out;

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
	}


    public void updateCounterEstimateCode(int counterSCCode, int estimateItemCode) throws PersistenceException
    {
        String sql = "update countersread.ostable set enestimateitemcode = ? where num_un = ?";

        PreparedStatement statement = null;
        ResultSet  set = null;
        try
        {
        	Connection connection = finConnection;

            statement = connection.prepareStatement(sql);

            if (estimateItemCode != Integer.MIN_VALUE)
            {
            	statement.setInt(1, estimateItemCode);
            }
            else
            {
            	statement.setNull(1, java.sql.Types.INTEGER);
            }

            statement.setInt(2, counterSCCode);

            statement.execute();

        } catch(SQLException e)
        {
        	System.out.println(e.getMessage()+"\nstatement - "+ sql);
        	EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
    }



	/**
	 * метод для апдейта Countersread.Ostable при приходе с автоматической
	 * заявки то апдейтим в OSTABLE materialcode , phasity, rqorderitemcode
	 */
	public void updateCountersreadOstableOnPrihodApprovedCost(int materialСode, int phasity, int rqorderitemcode,
			int num_un) {
		try {

		    String sql = "update countersread.ostable set materialcode = ? ,  phasity = ? , rqorderitemcode = ? where num_un = ?";

		    Connection connection = finConnection;
		    PreparedStatement statement = null;

			statement = connection.prepareStatement(sql);

			statement.setInt(1, materialСode);
			if (phasity != Integer.MIN_VALUE) {
				statement.setInt(2, phasity);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}

			if (rqorderitemcode != Integer.MIN_VALUE) {
				statement.setInt(3, rqorderitemcode);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			statement.setInt(4, num_un);

			statement.execute();


		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	private SCCounterShort createCounterShort(ENMetrologyCounterShort counter) {
		SCCounterShort counterShort = new SCCounterShort();
		counterShort.code = Integer.MIN_VALUE;
		counterShort.account = counter.account;
		counterShort.invNumber = counter.invNumber;
		counterShort.buildNumber = counter.buildNumber;
		counterShort.cost = counter.cost;
		counterShort.dateBuild = counter.dateBuild;
		counterShort.dateIn = counter.dateIn;
		counterShort.departmetFKCode = counter.departmetFKCode;
		counterShort.molCode = counter.molCode;
		if(counter.phasity != Integer.MIN_VALUE) {
			counterShort.phasity = new BigDecimal(counter.phasity);
		}
		counterShort.scCode = counter.scCode;
		counterShort.estimateItemRefCode = Integer.MIN_VALUE;
		counterShort.name = counter.name;
		counterShort.zoneRefCode = counter.zoneRefCode;
		counterShort.zoneRefName = counter.zoneRefName;
		counterShort.counterType = counter.counterType;
		return counterShort;
	}

	public List<SCCounterShort> getListOfGiveCountersByConsumer(ENServicesObject so, boolean isCloseSCConn) throws PersistenceException, DatasourceConnectException {
		return this.getListOfGiveCountersByConsumer(so, isCloseSCConn, false);
	}

	public List<SCCounterShort> getListOfGiveCountersByConsumer(ENServicesObject so, boolean isCloseSCConn, boolean isException) throws PersistenceException, DatasourceConnectException {

			ENGiveCounterDAO giveCounterDao = new ENGiveCounterDAO(connection, userProfile);
			ENServicesObject2RQFKOrderDAO sofoDao = new ENServicesObject2RQFKOrderDAO(connection, userProfile);
			RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(connection, userProfile);

			List<SCCounterShort> list = new ArrayList<SCCounterShort>();

	        ENGiveCounterFilter giveCounterFilter = new ENGiveCounterFilter();
	        giveCounterFilter.servicesObjectRef.code = so.code;

	        ENGiveCounterShortList giveCounterList = giveCounterDao.getScrollableFilteredList(giveCounterFilter, 0, -1);

	        if (giveCounterList.totalCount == 0) {
	        	if (isException) {
	        		throw new EnergyproSystemException(String.format("Не знайдено введених лічильників для договору № %s", so.contractNumberServices));
	        	} else {
	        		return list;
	        	}
	        }

	        ENServicesObjectFilter sofoFilter = new ENServicesObjectFilter();
	        sofoFilter.code = so.code;
	        ENServicesObject2RQFKOrderShortList sofoList = sofoDao.getENServicesObject2RQFKOrderShortListByServicesObject(sofoFilter);
	        if (sofoList.totalCount == 0) {
	        	if (isException) {
	        		throw new EnergyproSystemException(String.format("Не знайдено прибуткового ордеру для договору № %s", so.contractNumberServices));
	        	} else {
	        		return list;
	        	}
	        }

	        Vector<RQFKOrder> fkOrders = new Vector<RQFKOrder>();

	        for(ENServicesObject2RQFKOrderShort sofo : sofoList.list) {
	        	RQFKOrder fkOrder = fkOrderDao.getObjectNOSEGR(sofo.fkOrderRefCode);
	        	fkOrderDao.checkFKOrderInStatuses(fkOrder, isException, RQFKOrderStatus.COUNTER_IN_SC);
	        	fkOrders.add(fkOrder);
	        }

	        for(ENGiveCounterShort giveCounter : giveCounterList.list) {
	        	String invNumber = null;
	        	for(RQFKOrder fkOrder : fkOrders) {
	        		invNumber = this.getInvNumberBySerialNumber(giveCounter.serialNumber, fkOrder.numberDoc, isException, false);
	        		if(invNumber != null) {
	        			break;
	        		}
	        	}
	        	if (invNumber == null) {
	        		if (isException) {
	        			throw new EnergyproSystemException(String.format("Не знайдено даних у програмі \"СканЛічильник\" для лічильника із серійним № %s", giveCounter.serialNumber));
	        		} else {
	        			return list;
	        		}
	        	}

	        	ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();
	        	counterFilter.invNumber = invNumber;
	        	ENMetrologyCounterShortList counterList = getCountersListFromScanCounter(counterFilter, 0, -1);
	        	if (counterList.totalCount != 1) {
	        		if (isException) {
	        			throw new EnergyproSystemException(String.format("Помилка у кількості записів для лічильника із інвентарним %s (знайдено записів: %d)", invNumber, counterList.totalCount));
	        		} else {
	        			return list;
	        		}
	        	}
	        	list.add(this.createCounterShort(counterList.get(0)));
	        }


			return list;
	}

	public SCCounterShortList getCounterForServicesObject(int soObjCode) {
		return getCounterForServicesObject(soObjCode, true);
	}

	/**
	 * По договору услуг на сторону показываем счетчик, который относится к
	 * услуге
	 *
	 * @param soObjCode
	 *            - код договора
	 * @param showForCanceled
	 *            - выбирать ли счетчик для отмененных договоров
	 *
	 **/
	public SCCounterShortList getCounterForServicesObject(int soObjCode, boolean showForCanceled) {
		try {
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(userProfile, connection);
			// ENEstimateItemDAO eiDAO = new
			// ENEstimateItemDAO(userProfile,connection);
			SCCounterDAO scDAO = new SCCounterDAO(userProfile, connection);
			ServicesLogic sl = new ServicesLogic(connection, userProfile);
			TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
			// RQApCost2Item2ServicesDAO apc2SoDAO = new
			// RQApCost2Item2ServicesDAO(userProfile,connection);
			// RQOrderItemDAO riDAO = new
			// RQOrderItemDAO(userProfile,connection);
			// RQOrderDAO rDAO = new RQOrderDAO(userProfile,connection);
			// Connection fkConnection = null;
			// fkConnection =
			// getNEWConnection(com.ksoe.authorization.util.AuthorizationJNDINames.SCANCOUNTER_DATASOURCE_);
			SCMolDAO scmDAO = new SCMolDAO(finConnection, userProfile);

			SCCounterShortList result = new SCCounterShortList();
			SCCounterShort anObject;
			result.list = new Vector<SCCounterShort>();
			anObject = new SCCounterShort();

			ENServicesObject soObj = soDAO.getObjectNoRef(soObjCode);
			// ищем счетчик переданый на РЕС автоматическим ордером под месячн
			// план

			// если договор Відмінений , Скасований , Відмова замовника від
			// послуг то не показываем счетчик
			if (!showForCanceled) {
				if (soObj.contractStatusRef.code == ENServicesContractStatus.CANCELED
						|| soObj.contractStatusRef.code == ENServicesContractStatus.TERMINATED
						|| soObj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES) {
					return result;
				}
			}

			// Если договор на установку счетчика абонента, то возвращаем тот счетчик, что принес абонент
			if(classificationTypeDao.isGiveCounterOnBalanceByServicesObjectCode(soObj.code)) {
				List<SCCounterShort> giveCounters = this.getListOfGiveCountersByConsumer(soObj, true);
				for(SCCounterShort shortCounter : giveCounters) {
					result.list.add(shortCounter);
				}
				return result;
			}

			SCCounterFilter scFilter = new SCCounterFilter();
			scFilter.conditionSQL = " SCCOUNTER.CODE in ( select sc.code from enplanwork p , sccounter sc , enestimateitem ei  \n"
					+ " where p.elementrefcode =  " + soObj.element.code + "\n" + " and p.kindcode in ("
					+ ENPlanWorkKind.NPW + "," + ENPlanWorkKind.FACT + ")" + "\n"
					+ " and sc.estimateitemrefcode = ei.code " + "\n" + " and ei.planrefcode = p.code  " + "\n"
					+ " and ei.kindrefcode = " + ENEstimateItemKind.MATERIALS + " ) ";
			SCCounterShortList scList = scDAO.getScrollableFilteredList(scFilter, 0, -1);
			String kod_inv = "";
			if (scList.totalCount > 0) {
				kod_inv = scList.get(0).invNumber;

				ENMetrologyCounterFilter scanFilter = new ENMetrologyCounterFilter();

				scanFilter.conditionSQL = " a.kod_inv_num =  " + "'"+kod_inv+"'"; // SUPP-76697 код инв строковый, выборка работает быстрее
				ENMetrologyCounterShortList enMetrolList = getCountersListFromScanCounter(scanFilter, 0, -1);

				if (enMetrolList.totalCount > 0) {
					anObject.scCode = enMetrolList.get(0).scCode;

					anObject.invNumber = enMetrolList.get(0).invNumber;
					anObject.name = enMetrolList.get(0).name;
					anObject.buildNumber = enMetrolList.get(0).buildNumber;
					anObject.molCode = enMetrolList.get(0).molCode;

					SCMolFilter scmf = new SCMolFilter();
					scmf.conditionSQL = " SCMOL.KOD_MOL =  " + enMetrolList.get(0).molCode;
					SCMolShortList scmlist = scmDAO.getScrollableFilteredList(scmf, scmf.conditionSQL, "", 0, -1, null);
					if (scmlist.totalCount > 0) {
						anObject.counterType = scmlist.get(0).name_mol;
					} else {
						anObject.counterType = " ";
					}
					anObject.account = enMetrolList.get(0).account;
					anObject.kindRefName = "";
					result.list.add(anObject);
					result.totalCount = 1;
					return result;
				}
			}

			// ищем перемещенные под мес планы
			scFilter = new SCCounterFilter();
			scFilter.conditionSQL = " SCCOUNTER.CODE in ( Select sc.code  \n"
					+ " from rqfkorderitem2enstmttm fi2ei , enplanwork p , enestimateitem ei , sccounter sc , rqfkorderitem fi , rqfkorder f \n"
					+ " where fi2ei.estimateitemcode = ei.code \n" + " and ei.planrefcode = p.code  \n"
					+ " and p.elementrefcode = " + soObj.element.code + "\n" + " and p.kindcode = "
					+ ENPlanWorkKind.CURRENT + "  \n" + " and ei.code = sc.estimateitemrefcode \n"
					+ " and fi2ei.sccounterrefcode = sc.code \n" + " and fi2ei.fkorderitemrefcode = fi.code  \n"
					+ " and fi.fkorderrefcode  = f.code \n" + " and f.kindcode = " + RQFKOrderKind.RASHOD_OE2REM
					+ "  \n" + " and f.molincode in ('1814', '1889', '4201', '2750', '2704', '4203') \n" + " limit 1  ) ";

			scList = scDAO.getScrollableFilteredList(scFilter, 0, -1);
			kod_inv = "";
			int kindPlan = Integer.MIN_VALUE;
			if (scList.totalCount > 0) {
				kod_inv = scList.get(0).invNumber;
				kindPlan = ENPlanWorkKind.CURRENT; // типа нашли счетчик уже
													// перемещенный ну или
													// только под перемещение
													// под месяччный план
			}
			// если определили инвентарный счетчика под мес план то дернем его
			// посл сост со сканов
			if (!kod_inv.equals("") && kindPlan == ENPlanWorkKind.CURRENT) {

				ENMetrologyCounterFilter scanFilter = new ENMetrologyCounterFilter();

				scanFilter.conditionSQL = " a.kod_inv_num =  " + "'"+kod_inv+"'"; // SUPP-76697 код инв строковый, выборка работает быстрее
				ENMetrologyCounterShortList enMetrolList = getCountersListFromScanCounter(scanFilter, 0,
						-1);

				if (enMetrolList.totalCount > 0) {
					anObject.scCode = enMetrolList.get(0).scCode;

					anObject.invNumber = enMetrolList.get(0).invNumber;
					anObject.name = enMetrolList.get(0).name;
					anObject.buildNumber = enMetrolList.get(0).buildNumber;
					anObject.molCode = enMetrolList.get(0).molCode;

					SCMolFilter scmf = new SCMolFilter();
					scmf.conditionSQL = " SCMOL.KOD_MOL =  " + enMetrolList.get(0).molCode;
					SCMolShortList scmlist = scmDAO.getScrollableFilteredList(scmf, scmf.conditionSQL, "", 0, -1, null);
					if (scmlist.totalCount > 0) {
						anObject.counterType = scmlist.get(0).name_mol;
					} else {
						anObject.counterType = " ";
					}
					anObject.account = enMetrolList.get(0).account;
					anObject.kindRefName = "";
					result.list.add(anObject);
					result.totalCount = 1;
					return result;
				}
			} // иначе ищем заредервированный счетчик под естимейт кошториса
			else {
				// код естимейта с кошториса
				int codeCounterEstimateByCalculationPlan = sl.getENEstimateItemCodeCounterByServicesObjectAndKindPlan(
						soObj.element.code, ENPlanWorkKind.CALCULATION);

				if (codeCounterEstimateByCalculationPlan != Integer.MIN_VALUE) {
					// ещем в сканах по естимейту счетчик зарезервированный
					ENMetrologyCounterFilter scanFilter = new ENMetrologyCounterFilter();
					scanFilter.conditionSQL = " a.enestimateitemcode =  " + codeCounterEstimateByCalculationPlan;
					ENMetrologyCounterShortList enMetrolList = getCountersListFromScanCounter(scanFilter, 0,
							-1);

					if (enMetrolList.totalCount > 0) {
						anObject.scCode = enMetrolList.get(0).scCode;

						anObject.invNumber = enMetrolList.get(0).invNumber;
						anObject.name = enMetrolList.get(0).name;
						anObject.buildNumber = enMetrolList.get(0).buildNumber;
						anObject.molCode = enMetrolList.get(0).molCode;

						SCMolFilter scmf = new SCMolFilter();
						scmf.conditionSQL = " SCMOL.KOD_MOL =  " + enMetrolList.get(0).molCode;
						SCMolShortList scmlist = scmDAO.getScrollableFilteredList(scmf, scmf.conditionSQL, "", 0, -1,
								null);
						if (scmlist.totalCount > 0) {
							anObject.counterType = scmlist.get(0).name_mol;
						} else {
							anObject.counterType = " ";
						}

						anObject.account = enMetrolList.get(0).account;
						anObject.kindRefName = "Зарезервовано для договору";
						result.list.add(anObject);
						result.totalCount = 1;
						return result;
					}
				}
			}

			/*
			 * в заявке не ищем и не показываем под договор . покажем общ кол-во
			 * завленное . // если не ретурнили ниче значит поищем еще счетчики
			 * которые заказались в заявке RQApCost2Item2ServicesFilter
			 * apc2SoFilter = new RQApCost2Item2ServicesFilter();
			 * apc2SoFilter.servicesObjectRef.code = soObjCode;
			 * RQApCost2Item2ServicesShortList apc2SoList =
			 * apc2SoDAO.getScrollableFilteredList(apc2SoFilter, 0, -1); if
			 * (apc2SoList.totalCount > 0 ){ RQOrderItem riObj =
			 * riDAO.getObject(apc2SoList.get(0).rqOrderItemRefCode); RQOrder
			 * rObj = rDAO.getObject(riObj.orderRef.code); anObject.invNumber =
			 * ""; anObject.name = riObj.materialNameGen; anObject.buildNumber =
			 * "Замовлено. Заявка №" + rObj.numberDoc + " від " + new
			 * SimpleDateFormat("dd.MM.yyyy").format(rObj.orderPeriod).toString(
			 * ); anObject.molCode = ""; anObject.counterType = "";
			 * anObject.account = ""; anObject.kindRefName = "" ;
			 * result.list.add(anObject); result.totalCount = 1; return result;
			 * }
			 */

			return result;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't get getCounterForServicesObject.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
	}

	public boolean isWorkOrderBytWithSeals(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(connection, userProfile);

			ENWorkOrderBytFilter workOrderBytFilter = new ENWorkOrderBytFilter();

			workOrderBytFilter.conditionSQL =
			    " code in ( " +
			    "   select distinct wbi.workorderbytrefcode " +
			    "   from " +
			    "     enestimateitem ei, enplanworkitem pi, " +
			    "     enworkorderbytitem wbi " +
			    "   where ei.planitemrefcode = pi.code " +
			    "     and wbi.planitemrefcode = pi.code " +
			    "     and pi.countgen > 0 " +
			    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
			    "     and ei.countfact > 0 " +
			    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
			    " )";

			int[] workOrderBytArr = workOrderBytDAO.getFilteredCodeArray(workOrderBytFilter, 0, -1);

			return (workOrderBytArr.length > 0);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getSealsCountForWorkOrderByt(int workOrderBytCode)
	{
		try
		{
			int sealCount = 0;

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

			ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
			estimateFilter.conditionSQL =
			    " code in ( " +
			    "   select distinct ei.code " +
			    "   from " +
			    "     enestimateitem ei, enplanworkitem pi, " +
			    "     enworkorderbytitem wbi " +
			    "   where ei.planitemrefcode = pi.code " +
			    "     and wbi.planitemrefcode = pi.code " +
			    "     and pi.countgen > 0 " +
			    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
			    "     and ei.countfact > 0 " +
			    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
			    " )";

			int[] estimateCodes = estimateItemDAO.getFilteredCodeArray(estimateFilter, 0, -1);

			for (int i = 0; i < estimateCodes.length; i++)
			{
				ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateCodes[i]);

			    if (estimateItem == null)
			    {
			    	throw new SystemException("\n\nNET-4530 Не знайдено матеріал на плані! Код матеріала: " + estimateCodes[i]);
			    }

			    sealCount += estimateItem.countFact.intValue();
			}

			return sealCount;
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getSealsCountReservedByPlanForWorkOrderByt(int workOrderBytCode)
	{
		try
		{
            SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);

            SCSealFilter sealFilter = new SCSealFilter();
            /*
            sealFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is not null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
        		" ) " +
        		" and estimateitemrefcode is not null ";
            */
            sealFilter.conditionSQL =
			    " code in ( " +
			    "   select distinct s.code " +
			    "   from " +
			    "     enestimateitem ei, enplanworkitem pi, " +
			    "     enworkorderbytitem wbi, scseal s " +
			    "   where ei.planitemrefcode = pi.code " +
			    "     and wbi.planitemrefcode = pi.code " +
			    "     and pi.countgen > 0 " +
			    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
			    "     and ei.countfact > 0 " +
			    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
			    "     and s.estimateitemrefcode = ei.code " +
			    "     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
			    " )";

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

			return sealArr.length;
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getSealsCountByFactForWorkOrderByt(int workOrderBytCode)
	{
		try
		{
			int sealCount = 0;

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

			ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
			estimateFilter.conditionSQL =
					" code in ( " +
					" 	SELECT " +
					" 	  distinct ei.code " +
					" 	FROM " +
					" 	  ENWORKORDERBYTITEM wbi, " +
					" 	  enestimateitem ei, " +
					" 	  enplanwork plan, " +
					" 	  enplanwork fact, " +
					" 	  enplancorrecthistory ch " +
					"   WHERE " +
					"     ei.planrefcode = fact.code " +
					"     and wbi.planrefcode = plan.code " +
					"     and plan.code = ch.planoldrefcode " +
					"     and fact.code = ch.plannewrefcode " +
					"     and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0 " +
				    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    " )";

			int[] estimateCodes = estimateItemDAO.getFilteredCodeArray(estimateFilter, 0, -1);

			for (int i = 0; i < estimateCodes.length; i++)
			{
				ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateCodes[i]);

			    if (estimateItem == null)
			    {
			    	throw new SystemException("\n\nNET-4530 Не знайдено матеріал на плані! Код матеріала: " + estimateCodes[i]);
			    }

			    sealCount += estimateItem.countFact.intValue();
			}

			return sealCount;
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean checkWorkOrderBytForStatus(int workOrderBytCode, int statusCode, boolean isException)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(connection, userProfile);

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			return checkWorkOrderBytForStatus(workOrderByt, statusCode, isException);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean checkWorkOrderBytForStatus(ENWorkOrderByt workOrderByt, int statusCode, boolean isException)
	{
		if (workOrderByt == null)
		{
			throw new SystemException("\n\nNET-4530 Не задано змінне завдання !");
		}

		if (workOrderByt.statusRef.code != statusCode)
		{
			String statusName = "";

			switch (statusCode)
			{
				case ENWorkOrderBytStatus.DRAFT:
					statusName = "Чорнове";
					break;
				case ENWorkOrderBytStatus.FORMED:
					statusName = "Складене";
					break;
				case ENWorkOrderBytStatus.APPROVED:
					statusName = "Затверджене";
					break;
				case ENWorkOrderBytStatus.COMPLETED:
					statusName = "Виконане";
					break;
				case ENWorkOrderBytStatus.CLOSED:
					statusName = "Завершене";
					break;
				default:
					throw new SystemException("\n\nNET-4530 Невідомий код статуса Змінного завдання: " + statusCode + " !");
			}

			if (isException)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderByt.code +
						" повинно бути в статусі \"" + statusName + "\" !");
			}
			else
			{
				return false;
			}
		}

		return true;

	}

	public void checkPlanStatusForSeal(SCSeal seal, String additionalException)
	{
		try
		{
			if (seal.estimateItemRef != null)
			{
				if (seal.estimateItemRef.code != Integer.MIN_VALUE)
				{
					ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);
					ENEstimateItem estimateItem = estimateItemDAO.getObject(seal.estimateItemRef.code);

					ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
					ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

					if (plan.status.code != ENPlanWorkStatus.GOOD)
					{
						if (additionalException == null)
						{
							additionalException = "";
						}

						if (! additionalException.equals(""))
						{
							additionalException = "\n" + additionalException;
						}

						throw new SystemException("\n\nNET-4530 План, до якого прив'язано пломбу № " + seal.buildNumber +
								", вже не є ЧОРНОВИМ!" + additionalException);
					}
				}
			}
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkSealsStatusesForWorkOrderByt(int workOrderBytCode, boolean unusedOnly, String additionalException)
	{
		try
		{
			if (additionalException == null)
			{
				additionalException = "";
			}

			if (! additionalException.equals(""))
			{
				additionalException = "\n" + additionalException;
			}

			SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);

            SCSealFilter sealFilter = new SCSealFilter();
            if (unusedOnly)
            {
	            sealFilter.conditionSQL =
	        		" code in " +
	        		" ( " +
	        		"   select distinct swb.sealrefcode " +
	        		"   from scseal2enworkorderbyt swb " +
	        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
	        		"     and swb.workorderbytitemrefcod is null " +
	        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT + // или все проверять?
	        		" ) " +
	        		" and estimateitemrefcode is null ";
            }
            else
            {
	            sealFilter.conditionSQL =
	        		" code in " +
	        		" ( " +
	        		"   select distinct swb.sealrefcode " +
	        		"   from scseal2enworkorderbyt swb " +
	        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
	        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT + // или все проверять?
	        		" ) ";
            }

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

			for (int i = 0; i < sealArr.length; i++)
			{
				SCSeal seal = sealDAO.getObject(sealArr[i]);

				if (seal.statusRef.code == SCSealStatus.INSTALLED)
				{
					throw new SystemException("\n\nNET-4530 Пломбу № " + seal.buildNumber +
							" вже встановлено в білінгу!" + additionalException);
				}

				if (seal.statusRef.code == SCSealStatus.UNINSTALLED)
				{
					throw new SystemException("\n\nNET-4530 Пломбу № " + seal.buildNumber +
							" вже знято в білінгу!" + additionalException);
				}

				/*
				 * Вот это проверять нужно только для использованных, потому что пока задание было завершенным,
				 * такую пломбу могли уже куда-то утянуть и установить (потому что после завершения
				 * задания она разлочивается)
				 */
				if (seal.estimateItemRef != null)
				{
					if (seal.estimateItemRef.code != Integer.MIN_VALUE)
					{
						// Проверим счет в ScanCounters
						checkSealSCAccount(seal.scCode, "2013", additionalException);
					}
				}

			}
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 * Проверка бух. счета пломбы в ScanCounters (если счет != account, то матюк)
	 *
	 * @param scCode - код пломбы в ScanCounters (num_un)
	 * @param account - бух. счет
	 * @param additionalException - дополнительный текст ошибки
	 *
	 */
	public void checkSealSCAccount(int scCode, String account, String additionalException)
	{
		if (scCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4530 Не заданий код пломби зі ScanCounters (scCode)!");
		}

		if (account == null)
		{
			throw new SystemException("\n\nNET-4530 Не заданий бух. рахунок!");
		}

		ENMetrologyCounterShortList scList = checkSealInScanCounters(scCode);
		ENMetrologyCounterShort scSeal = scList.get(0);

		if (scSeal.account == null)
		{
			throw new SystemException("\n\nNET-4530 Не вказано бух. рахунок для пломби в ScanCounters! Код пломби (в SC): " + scCode);
		}

		if (additionalException == null)
		{
			additionalException = "";
		}

		if (! additionalException.equals(""))
		{
			additionalException = "\n" + additionalException;
		}

		if (! scSeal.account.equals(account))
		{
			throw new SystemException("\n\nNET-4530 Бух. рахунок для пломби № " + scSeal.buildNumber +
					" повинен бути " + account + "!" + additionalException);
		}
	}


	public void undoInsertSealForLiquidation(int actCode) {
		com.ksoe.rqorder.dataminer.SCLogicDAO scDao = new com.ksoe.rqorder.dataminer.SCLogicDAO(finConnection, userProfile);
		scDao.LIKV_KSU_PROV_DEL(actCode);
	}

    /**
     *
     * Подходит ли счет счетчика для параметризации
     *
     * @param account счет
     * @return true - подходит, false - нет
     */
	public boolean isAccountForParametrization(String account) {
		SCLogicDAO logicDao = new SCLogicDAO(finConnection, userProfile);
		return logicDao.isAccountForParametrization(account);
	}

    /**
     *
     * Список счетов для параметризации через запятую
     *
     * @return Список счетов для параметризации через запятую
     */
    public String getStringAccountsForParametrization() {
		SCLogicDAO logicDao = new SCLogicDAO(finConnection, userProfile);
		return logicDao.getStringAccountsForParametrization();
    }

    /**
     *
     * Інвентарний номер лічильника по його заводському
     *
     * @param serialNumber заводской № счетчика
     * @return инвентарный номер с системы СканСчетчик
     */
    public String getInvNumberBySerialNumber(String serialNumber) {
    	return this.getInvNumberBySerialNumber(serialNumber, null, true);
    }

    /**
     *
     * Інвентарний номер лічильника по його заводському
     *
     * @param serialNumber заводской № счетчика
     * @param номер приходного ордера по которому оприходывался счетчик
     * @return инвентарный номер с системы СканСчетчик
     */
    public String getInvNumberBySerialNumber(String serialNumber, String incomeOrderNumber, boolean exceptionWhenNotFound) {
    	return this.getInvNumberBySerialNumber(serialNumber, incomeOrderNumber, exceptionWhenNotFound, true);
    }

    /**
     *
     * Інвентарний номер лічильника по його заводському
     *
     * @param serialNumber заводской № счетчика
     * @param номер приходного ордера по которому оприходывался счетчик
     * @param isCloseSCConn закрывать ли соединение
     * @return инвентарный номер с системы СканСчетчик
     */
    public String getInvNumberBySerialNumber(String serialNumber, String incomeOrderNumber, boolean exceptionWhenNotFound, boolean isCloseSCConn) {
		SCLogicDAO logicDao = new SCLogicDAO(finConnection, userProfile);
		return logicDao.getInvNumberBySerialNumber(serialNumber, incomeOrderNumber, exceptionWhenNotFound, isCloseSCConn);
	}

	/**
	 *
	 * Проверяет, что пломба была списана в более поздних актах
	 *
	 * @param seal пломба для проверки
	 * @param throwException нужно ли вызывать исключение
	 * @return true - списана / false - нет
	 * @throws PersistenceException
	 */
	public boolean checkSCSealIsLiquidated(SCSeal seal, boolean throwException) throws PersistenceException  {
        PreparedStatement statement = null;
        ResultSet set = null;
        boolean result = false;
        int actCode = Integer.MIN_VALUE;
        String sql = null;

        try {
        	sql = String.format(" select o1.rqfkordercode from countersread.ostable o, countersread.ostable o1 where " +
        			" o.NUM_UN = ? " +
        			" and o.kod_inv = o1.kod_inv " +
        			" and o1.NUM_OPER = ? " +
        			" and o1.TYPE_OBJECT in (%s) ", Tools.repeatSymbol("?", ",", FKConsts.COUNTERSREAD_KSU_OBJECT_TYPES.length));


        	statement = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE).prepareStatement(sql);

        	statement.setInt(1, seal.scCode);
        	statement.setInt(2, FKConsts.COUNTERSREAD_NUM_OPER_LIQUIDATION);
        	int count = 3;
        	for(int item : FKConsts.COUNTERSREAD_KSU_OBJECT_TYPES) {
        		statement.setInt(count++, item);
        	}

            set = statement.executeQuery();
            while(set.next()) {
            	result = true;
            	actCode = set.getInt(1);
            }

            if(result && throwException) {
            	ENActDAO actDao = new ENActDAO(connection, userProfile);
            	ENAct act = actDao.getObject(actCode);
            	throw new EnergyproSystemException(String.format("Пломба № %s була списана пізніше у акті № %s від %s. Спочатку потрібно відмінити проведення цього акту."
            			, seal.buildNumber, act.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)));
            }

            return result;
        } catch(SQLException e) {
            throw new PersistenceException(e.getMessage(), e);
        } catch (DatasourceConnectException e) {
        	throw new SystemException(e.getMessage(), e);
		} finally {
            try {if (set != null) set.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
}

	/**
	 *
	 * Дата последнего движения для пломбы / Счетчика из картотеки СканСчетчик
	 *
	 * @param invNumber инв. номер пломбы или счетчика
	 * @return дата последнего движения или null если не найдено
	 * @throws DatasourceConnectException
	 */
	public Date getDateOfLastMovementByInvNumber(String invNumber) throws DatasourceConnectException {
		try {
			String sql =   "select max(nvl(o1.dt_oper, o1.dt_doc)) from countersread.ostable o1 where o1.kod_inv = ? \n ";
			Vector<Object> bindObjects = new Vector<Object>();
			bindObjects.add(invNumber);
			return BaseDAOUtils.executeStatementAndReadObject(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					sql, bindObjects, new BaseDAOUtils.DateFromResultSetTransformator(), true);
		} finally {
		}
	}

	/**
	 *
	 * Проверка даты  последней операции с пломбой в бух. учете и датой плана
	 *
	 * Если дата последней операции больше чем плана, то будет выброшено соответствующее исключение
	 *
	 * @param seal пломба которую собираются использовать в плане
	 * @param plan план
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public void checkSealLastMovementDateWithPlanDate(SCSeal seal, ENPlanWork plan) throws PersistenceException, DatasourceConnectException {
		this.checkSCObjectLastMovementDateWithPlanDate(false, seal.invNumber, plan);
	}

	/**
	 *
	 * Проверка даты  последней операции с счетчиком в бух. учете и датой плана
	 *
	 * Если дата последней операции больше чем плана, то будет выброшено соответствующее исключение
	 *
	 * @param counter пломба которую собираются использовать в плане
	 * @param plan план
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public void checkCounterLastMovementDateWithPlanDate(SCCounter counter, ENPlanWork plan) throws PersistenceException, DatasourceConnectException {
		this.checkSCObjectLastMovementDateWithPlanDate(true, counter.invNumber, plan);
	}

	private void checkSCObjectLastMovementDateWithPlanDate(boolean isCounter, String invNumber, ENPlanWork plan) throws DatasourceConnectException, PersistenceException {
		/*Если дата последнего движения по объекту больше чем дата плана, то не даем привязать такой объект к плану*/
		if(invNumber == null || invNumber.length() == 0) return;

		Date sealLastMovementDate = this.getDateOfLastMovementByInvNumber(invNumber);
		if(sealLastMovementDate != null && sealLastMovementDate.after(plan.dateFinal)) {
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, userProfile);
			ENWorkOrder workOrder = workOrderLogic.getWorkOrderByPlanCode(plan.code);
			String typeName = (isCounter) ? "з лічильником": "з пломбою";
			String workOrderNum = (workOrder == null ? "Невідомо" : workOrder.workOrderNumber);
			throw new SystemException(String.format("Дата останьої операції %s у бухгалтерському обліку інвентарний № %s (%s) більша ніж дата наряд-завдання № %s (%s)", typeName, invNumber
					, new SimpleDateFormat("dd.MM.yyyy").format(sealLastMovementDate), workOrderNum, new SimpleDateFormat("dd.MM.yyyy").format(plan.dateFinal)));
		}
	}

	/**
	 *
	 * Удаление с договора перерезервированного счетчика
	 *
	 * @param counter счетчик {@link SCCounter}
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public void removeRereservedCounter(SCCounter counter) throws PersistenceException, DatasourceConnectException {
		if(counter == null) {
			throw new java.lang.NullPointerException();
		}
		if(counter.kindRef.code != SCCounterKind.FOR_SERVICES_RERESERVING) {
			throw new java.lang.IllegalArgumentException(String.format("Неправильный вид счетчика для инвентарного № %s: %d", counter.invNumber, counter.kindRef.code));
		}

			SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
			ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
			filter.invNumber = counter.invNumber;
			counterDao.remove(counter.code);

			ENMetrologyCounterShortList list = getCountersListFromScanCounter(filter, 0, -1);
			if(list.totalCount > 0) {
				if(list.totalCount != 1) {
					throw new SystemException(String.format("Помилка у кількості для лічильника з інв. № %s: %d"
							, filter.invNumber, list.totalCount));
				}

				if(list.get(0).enestimateItemCode == counter.estimateItemRef.code) {
					if(list.get(0).lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK) {
						this.lockCounterInSC_(list.get(0).scCode, "", null, (-1) * ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
					}
					ENMetrologyCounterShortList listAll = getCountersListFromScanCounterShowAll(filter, 0, -1);
					for(ENMetrologyCounterShort counterShort : listAll.list) {
						if(counterShort.enestimateItemCode == counter.estimateItemRef.code) {
							this.updateCounterEstimateCode(counterShort.scCode, Integer.MIN_VALUE);
						}
					}
				}
			}
	}

	public final boolean isCustomerCounterAccount(String account) throws PersistenceException {

		if(account == null) {
			throw new java.lang.NullPointerException();
		}

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		Vector<String> accountsFromCustomers = new Vector<String>();

		accountsFromCustomers.add(settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_COUNTERS_INCOME_FROM_CUSTOMERS, new Date()));
		accountsFromCustomers.add(settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_ASSETS_INCOME, new Date()));

		return accountsFromCustomers.contains(account);
	}


    /**
    *
    * Возвращает счетчик ВРТУ или нет
    *
    * @param kod_inv инвентарный счетчика
    * @return true - ВРТУ, false - нет или null если информация не найдена
    */
   public Boolean isVrtu(String kod_inv) {
   		Boolean out = null;
   		PreparedStatement statement = null;
   		ResultSet  set = null;
    try {
    	String sql = "select IS_VRTU from countersread.ostable o where o.kod_inv = ? and o.show_ = 'Y'";
    	Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

    	statement = connection.prepareStatement(sql);
		statement.setString(1, kod_inv);

		set = statement.executeQuery();
		if(set.next()) {
			Integer result = set.getInt(1);
			if(set.wasNull()) result = 0;
			if(result == 1) out = true; else out = false;
		}
			return out;

		} catch (SQLException e) {
			throw new SystemException(e);

		} catch (DatasourceConnectException e) {
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
	}


   /**
   *
   * Возвращает фазность счетчика
   *
   * @param kod_inv инвентарный счетчика
   * @return фазность счетчика
   */
  public int getPhasity(String kod_inv) {
  		int out = Integer.MIN_VALUE;
  		PreparedStatement statement = null;
  		ResultSet  set = null;
	try {

		String sql = "select phasity from countersread.ostable o where o.kod_inv = ? and o.show_ = 'Y'";
		Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

    	statement = connection.prepareStatement(sql);
    	statement.setString(1, kod_inv);

    	set = statement.executeQuery();
    	if(set.next()) {
    		Integer result = set.getInt(1);
    		if(set.wasNull()) result = Integer.MIN_VALUE;
    		if(result == 1 || result == 3) out = result;
    	}
    	return out;

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
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

	}



  public void updateSealForOrder(int sealSCCode, String orderNum, Date orderDate,
  		int lockCode) throws PersistenceException {


      String sql =
      		" update countersread.ostable " +
              "    set energy_lock = ?, " +
      		"        order_num = ?, order_date = ? " +
      		"  where num_un = ? ";

      PreparedStatement statement = null;
      ResultSet  set = null;
      try
      {
    	  if (finConnection != null && finConnection.isClosed()) {
    		  finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
    	  }

          statement = finConnection.prepareStatement(sql);

          statement.setString(1, new Integer(lockCode).toString());

          statement.setString(2, orderNum);

          statement.setDate(3,new java.sql.Date(orderDate.getTime()));

          statement.setInt(4, sealSCCode);

          statement.execute();

      } catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} catch (DatasourceConnectException e) {
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
	}



  public void updateSealLockOnly(int sealSCCode, int lockCode) throws PersistenceException
  {

      String sql =
      		" update countersread.ostable " +
              "    set energy_lock = ? " +
      		"  where num_un = ? ";

      PreparedStatement statement = null;
      ResultSet  set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			statement = finConnection.prepareStatement(sql);

			statement.setString(1, new Integer(lockCode).toString());
			statement.setInt(2, sealSCCode);

			statement.execute();

      } catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} catch (DatasourceConnectException e) {
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
	}

  public void updateSeal(int sealSCCode, String workOrderBytNumber, Date workOrderBytDate,
  		String executorTabNum, String executorFIO, int lockCode) throws PersistenceException
  {
  	/*
		tabn_executor varchar2(6) - Таб получат.обекта (из сменного задания)
		fio_executor varchar2(255) - ФИО получателя объекта (из сменного задания)
		orderbyt_num varchar2(20) - номер сменного задания
		orderbyt_date dare - дата сменного задания
  	 */

      String sql =
      		" update countersread.ostable " +
              "    set energy_lock = ?, " +
      		"        orderbyt_num = ?, orderbyt_date = ?, " +
      		"        tabn_executor = ?, fio_executor = ? " +
      		"  where num_un = ? ";


      PreparedStatement statement = null;
      ResultSet  set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			statement = finConnection.prepareStatement(sql);

			statement.setString(1, new Integer(lockCode).toString());

			if (workOrderBytNumber != null)
				statement.setString(2, workOrderBytNumber);
			else
				statement.setNull(2, java.sql.Types.VARCHAR);

			if (workOrderBytDate == null)
				statement.setNull(3, java.sql.Types.DATE);
			else
				statement.setDate(3,
						new java.sql.Date(workOrderBytDate.getTime()));

			if (executorTabNum != null)
				statement.setString(4, executorTabNum);
			else
				statement.setNull(4, java.sql.Types.VARCHAR);

			if (executorFIO != null)
				statement.setString(5, executorFIO);
			else
				statement.setNull(5, java.sql.Types.VARCHAR);

			statement.setInt(6, sealSCCode);

			statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} catch (DatasourceConnectException e) {
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
	}

	public ENMetrologyCounterShortList getCountersListFromScanCounter(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		return this.getCountersListFromScanCounter(aFilterObject, fromPosition, quantity, TKAccountingType.COUNTERS);
	}

	  /**
	   *
	   * Выборка счетчиков из СканСчетчиков и Основных средств
	   *
	   * Из-за того, что в oracle записи в выборке начинаются с 1го номера, то вызов метода с параметром fromPosition = 0
	   * и fromPosition = 1 вернут одинаковый результат.
	   *
	   * @param filterObject объект фильтра {@link ENMetrologyCounterFilter}
	   * @param fromPosition с какой позиции выбирать
	   * @param quantity количество записей или -1 если нужно выбрать все
	   * @param accountingTypeCode код типа учета {@link TKAccountingType}
	   * @return лист объектов {@link ENMetrologyCounterShortList}
	   * @throws java.rmi.RemoteException
	   */
	public ENMetrologyCounterShortList getCountersListFromScanCounter(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity, Integer accountingTypeCode) throws PersistenceException {

		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			// Проверка параметров
			if(accountingTypeCode != null && accountingTypeCode != Integer.MIN_VALUE) {
				if(accountingTypeCode != TKAccountingType.COUNTERS && accountingTypeCode != TKAccountingType.OS)  {
					throw new SystemException("Неправильний тип обліку - потрібен бути або лічильники або Основні засоби");
				}
			}

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			  // Выборка вида для счетчиков
			  ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
			  String kindCodeAssetsCounter = settingsLogic.getValue(ENSettingsKeysConsts.ASSETS_COUNTER_KIND);

			  TKAccountingTypeDAO accountingTypeDao = new TKAccountingTypeDAO(connection, userProfile);
			  TKAccountingType counterAccountingType = accountingTypeDao.getObject(TKAccountingType.COUNTERS);
			  TKAccountingType osAccountingType = accountingTypeDao.getObject(TKAccountingType.OS);

			String condition = (aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL);

			String orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL);

			String whereStr = "";

          if(orderBy.length() == 0)
              orderBy = " a.kod_oborud";


          String selectStrCounter = "SELECT %s rownum rnum, a.num_un, a.kod_mol, a.dt_doc, " +
                  " a.kod_podr, a.kod_inv " +
                  "        , a.str_name, a.kod_oborud, a.dt_vypusk, " +
                  "        a.kod_ist, a.num_oper, a.dt_oper, a.characters, a.sum_st_realiz, " +
                  "        a.kod_inv_old, a.primechan, a.kod_postav, a.sum_st_perv, " +
                  "        a.sum_nds, a.kod_poluch, a.sum_realiz_s_nds, a.sum_realiz_nds, " +
                  "        a.kod_nal_nakl, a.kod_nakl, a.dt_nakl, a.parent_num_un, " +
                  "        a.child_num_un, a.show_, a.type_mut, a.kod_subsch_b, a.realdata, " +
                  "        a.sum_st_vyb, a.code_dogovor, a.user_name_ins, a.user_name_mut, " +
                  "        a.user_name_vyb, a.code_dogovor_vyb, a.info_insert_os, " +
                  "        a.info_last_update_os, a.kod_nakl_vyb, a.dt_nakl_vyb, " +
                  "        a.primechan_vyb, a.type_counter, a.num_pack_copy, a.kod_ist_vyb, " +
                  "        a.date_ust, a.place_ust, a.stroke_code, a.id_zavod " +

                  " , a.energy_lock , a.order_num , a.order_date " +

                  " , a.personalaccount, a.departmentcode, a.enestimateitemcode " +
                  " , a.storagezonecode, a.storagezonename, a.phasity, a.zones, a.materialcode, a.is_avar," +
                  " a.type_object, " +
                  " cast(a.prizn_prih as number) as prizn_prih, " +
                  " cast(0 as numeric) as is_from_os " +
                  " FROM countersread.ostable a where a.show_='Y' and a.type_object = " + ENConsts.SCANCOUNTERS_TYPEOBJECT_COUNTER;

          String selectStrOS = "SELECT %s" +
                  " rownum rnum, " +
    			  "a.num_un, " +
    			  "a.kod_mol, " +
    			  "a.dt_doc, " +
    			  "a.kod_podr, " +
    			  "a.kod_inv, " +
    			  "a.str_name, " +
    			  "a.kod_oborud, " +
    			  "a.dt_vypusk, " +
    			  "a.kod_ist, " +
    			  "a.num_oper, " +
    			  "a.dt_oper, " +
    			  "a.characters, " +
    			  "a.sum_st_realiz, " +
    			  "a.kod_inv_old, " +
    			  "a.primechan, " +
    			  "a.kod_postav, " +
    			  "a.sum_st_perv, " +
    			  "a.sum_nds, " +
    			  "a.kod_poluch, " +
    			  "a.sum_realiz_s_nds, " +
    			  "a.sum_realiz_nds, " +
    			  "a.kod_nal_nakl, " +
    			  "a.kod_nakl, " +
    			  "a.dt_nakl, " +
    			  "a.parent_num_un, " +
    			  "a.child_num_un, " +
    			  "a.show_, " +
    			  "a.type_mut, " +
    			  "a.kod_subsch_b, " +
    			  "a.realdata, " +
    			  "a.sum_st_vyb, " +
    			  "a.code_dogovor, " +
    			  "a.user_name_ins, " +
    			  "a.user_name_mut, " +
    			  "a.user_name_vyb, " +
    			  "a.code_dogovor_vyb, " +
    			  "a.info_insert_os, " +
    			  "a.info_last_update_os, " +
    			  "a.kod_nakl_vyb, " +
    			  "a.dt_nakl_vyb, " +
    			  "a.primechan_vyb, " +
    			  "cast(null as varchar(1)) as type_counter, " +
    			  "cast(null as numeric) as num_pack_copy, " +
    			  "a.kod_ist_vyb, " +
    			  "cast(null as date) as date_ust, " +
    			  "cast(null as varchar(1)) as place_ust, " +
    			  "cast(null as varchar(1)) as stroke_code, " +
    			  "cast(null as numeric) as id_zavod, " +
    			  "cast(a.energy_lock as varchar(5)) as energy_lock, " +
    			  "a.order_num, " +
    			  "a.order_date, " +
    			  "cast(null as varchar(1)) as personalaccount, " +
    			  "cast(null as number) as departmentcode, " +
    			  "cast(null as number) as enestimateitemcode, " +
    			  "cast(null as number) as storagezonecode, " +
    			  "cast(null as varchar(1)) as storagezonename, " +
    			  "cast(null as number) as phasity, " +
    			  "cast(null as number) as zones, " +
    			  "cast(null as number) as materialcode, " +
    			  "cast(null as number) as is_avar, " +
    			  "cast(null as number) as prizn_prih, " +
    			  /*В случае с основными можно точно быть уверенным, что выбираем счетчик*/
    			  "cast(" + ENConsts.SCANCOUNTERS_TYPEOBJECT_COUNTER + " as numeric) as type_object, " +
    			  "1 as is_from_os " +
    			  "FROM os_t.ostable a where a.show_='Y' and a.kod_vid = '" + kindCodeAssetsCounter + "'";


          selectStr = selectStrCounter;

          if(accountingTypeCode != null
        		  && accountingTypeCode == TKAccountingType.OS) {
        	  selectStr = selectStrOS;
          }

          // Если был послан параметр тип учета пустой или равный ОЗ тогда
          if(accountingTypeCode == null
        		  || accountingTypeCode == Integer.MIN_VALUE) {
        	  selectStrOS = String.format(selectStrOS, "");
        	  selectStrCounter = String.format(selectStrCounter, "");
        	  selectStr = String.format("%s union all %s", selectStrCounter, selectStrOS);
        	  /*удаляется этот кусок запроса*/
        	  selectStr = selectStr.replace("rownum rnum,", "");
        	  selectStr = "select rownum rnum, a.* from (select %s a.* from (" + selectStr + ") a) a";
          }

          if(quantity == 0) {
        	  throw new SystemException("Помилка - неможливо обрати 0 записів - використовуйте параметр -1");
          }

          if(quantity > 0) {
        	  // если задано выбрать только nое количество записей, то будет использоваться oracleвский hint
        	  selectStr = String.format(selectStr, String.format("/*+ FIRST_ROWS(%d) */ ", quantity));
          } else {
        	  selectStr = String.format(selectStr, "");
          }

          if(aFilterObject != null)
          {

              if (aFilterObject.invNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + "  a.kod_inv = ?";
                  else
                      whereStr = whereStr + " a.kod_inv LIKE ?";
              }
              if (aFilterObject.name != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                      whereStr = whereStr + "  UPPER(a.str_name) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.str_name) LIKE UPPER(?)";
              }
              if (aFilterObject.buildNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + "  TRIM(UPPER(a.kod_oborud)) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.kod_oborud) LIKE UPPER(?)";
              }

              if (aFilterObject.account != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                      whereStr = whereStr + "  UPPER(a.kod_subsch_b) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.kod_subsch_b) LIKE UPPER(?)";
              }
              if (aFilterObject.departmetFKCode != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
                      whereStr = whereStr + "  UPPER(a.kod_podr) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.kod_podr) LIKE UPPER(?)";
              }
              if (aFilterObject.molCode != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                      whereStr = whereStr + "  UPPER(a.kod_mol) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.kod_mol) LIKE UPPER(?)";
              }
              if(aFilterObject.dateIn != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.dt_doc = ?";
              }
              if(aFilterObject.dateBuild != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.dt_vypusk = ?";
              }
              if(aFilterObject.cost != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.sum_st_nds = ?";
              }
              if(aFilterObject.scCode != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.num_un = ?";
              }
              if (aFilterObject.counterType != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
                      whereStr = whereStr + "  UPPER(a.type_counter) = UPPER(?)";
                  else
                      whereStr = whereStr + " UPPER(a.type_counter) LIKE UPPER(?)";
              }
              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.storagezonecode = ?";
              }
              if(aFilterObject.phasity != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.phasity = ?";
              }
              if(aFilterObject.zones != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  a.zones = ?";
              }
          }


          if(condition.length() != 0)
          {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";

              whereStr = whereStr + " (" + condition + ")";
          }
//       + " WHERE" +  сделано выше ????
          if(whereStr.length() != 0) {
        	  if(accountingTypeCode == null || accountingTypeCode == Integer.MIN_VALUE) {
                  selectStr = selectStr + " WHERE " + whereStr;
        	  } else {
        		  selectStr = selectStr + " AND " + whereStr;
        	  }
          }

          // selectStr = selectStr + ") ";

          selectStr = selectStr + " ORDER BY " + orderBy;

          if(quantity > 0) {
        	  selectStr = String.format("select * from (%s) where rnum between ? and ?", selectStr);
          }
          if(quantity < 0 && fromPosition > 0) {
        	  selectStr = String.format("select * from (%s) where rnum >= ?", selectStr);
          }

          statement = finConnection.prepareStatement(selectStr);

          int number = 0;
          if(aFilterObject != null){
              if(aFilterObject.code != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,aFilterObject.code);
              }

              if(aFilterObject.invNumber != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.invNumber);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }

              if(aFilterObject.name != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.name);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }

              if(aFilterObject.buildNumber != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.buildNumber);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }

              if(aFilterObject.account != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.account);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }

              if(aFilterObject.departmetFKCode != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.departmetFKCode);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }

              if(aFilterObject.molCode != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.molCode);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              if(aFilterObject.dateIn != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
              }
              if(aFilterObject.dateBuild != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
              }
              if(aFilterObject.cost != null){
                  number++;
                  aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                  statement.setBigDecimal(number,aFilterObject.cost);
              }
              if(aFilterObject.scCode != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,aFilterObject.scCode);
              }

              if(aFilterObject.counterType != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(aFilterObject.counterType);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,aFilterObject.zoneRef.code);
              }
              if(aFilterObject.phasity != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,aFilterObject.phasity);
              }
              if(aFilterObject.zones != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,aFilterObject.zones);
              }
          }

          if(quantity > 0) {
              number++;
              statement.setInt(number, fromPosition);
              number++;
              statement.setInt(number, (fromPosition + quantity - ((fromPosition > 0) ? 1 : 0) ));
          }
          if(quantity < 0 && fromPosition > 0) {
              number++;
              statement.setInt(number, fromPosition);
          }


          if(quantity < 0)
          quantity = Integer.MAX_VALUE/2;

          set = statement.executeQuery();
          int i;
          for(i = 0;set.next();i++)
          {
              if(i < fromPosition)
              continue;
              else if(i >= fromPosition + quantity)
              {
              i++;
              break;
              }

              anObject = new ENMetrologyCounterShort();

              anObject.code = -1; // 15.06.2018 раньше эта цифра стояла в запросе

              anObject.invNumber = set.getString("kod_inv");
              anObject.name = set.getString("str_name");
              anObject.buildNumber = set.getString("kod_oborud");
              anObject.account = set.getString("kod_subsch_b");
              anObject.departmetFKCode = set.getString("kod_podr");
              anObject.molCode = set.getString("kod_mol");
              anObject.dateIn = set.getDate("dt_doc");
              anObject.dateBuild = set.getDate("dt_vypusk");
              anObject.cost = set.getBigDecimal("sum_st_perv");
              if(anObject.cost != null)
                  anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              anObject.scCode = set.getInt("num_un");
              if ( set.wasNull() )
                  anObject.scCode = Integer.MIN_VALUE;
              anObject.counterType = set.getString("type_counter");

              anObject.lockCode = set.getInt("energy_lock");
              if (set.wasNull())
                  anObject.lockCode = Integer.MIN_VALUE;

              anObject.lockReason = set.getString("order_num");

              anObject.lockDate = set.getDate("order_date");

              anObject.personalAccount = set.getString("personalaccount");

              anObject.departmentCode = set.getInt("departmentcode");
              if (set.wasNull())
                  anObject.departmentCode = Integer.MIN_VALUE;

              anObject.enestimateItemCode = set.getInt("enestimateitemcode");
              if (set.wasNull())
                  anObject.enestimateItemCode = Integer.MIN_VALUE;
              anObject.zoneRefCode = set.getInt("storagezonecode");
              if (set.wasNull())
                  anObject.zoneRefCode = Integer.MIN_VALUE;
              anObject.zoneRefName = set.getString("storagezonename");

              anObject.phasity = set.getInt("phasity");
              if(set.wasNull()) {
              	anObject.phasity = Integer.MIN_VALUE;
              }
              anObject.zones = set.getInt("zones");
              if(set.wasNull()) {
              	anObject.zones = Integer.MIN_VALUE;
              }

              anObject.materialcode = set.getInt("materialcode");
              if(set.wasNull()) {
              	anObject.materialcode = Integer.MIN_VALUE;
              }

              anObject.isEmergency = (set.getInt("is_avar") == FKConsts.COUNTERSREAD_IS_AVAR_TRUE ? true : false);
              if(set.wasNull()) {
            	  anObject.isEmergency = false;
              }

              anObject.fundingType = set.getInt("prizn_prih");
              if(set.wasNull()) {
            	  anObject.fundingType = Integer.MIN_VALUE;
              }

              if(set.getInt("is_from_os") == 1) {
            	  anObject.accountingTypeRefCode = osAccountingType.code;
            	  anObject.accountingTypeRefName = osAccountingType.name;
              } else {
            	  anObject.accountingTypeRefCode = counterAccountingType.code;
            	  anObject.accountingTypeRefName = counterAccountingType.name;
              }



              result.list.add(anObject);
          }

          result.setTotalCount(i);

          return result;
          }
          catch(SQLException e)
          {
          System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} catch (DatasourceConnectException e) {
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
	}




	  public ENMetrologyCounterShortList getSealsListFromScanCounter(ENMetrologyCounterFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
	  {
		  return getSealsListFromScanCounter(aFilterObject, fromPosition, quantity, false);
	  }

	  /**
	   * Получение списка пломб из ScanCounters
	   */
	public ENMetrologyCounterShortList getSealsListFromScanCounter(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity, boolean showAll) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr = "";
        PreparedStatement statement = null;
        ResultSet  set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

	          String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);
	          String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

	          String whereStr = "";
	          if (! showAll)
	          {
	        	  whereStr = " a.show_ = 'Y'"; // and a.kod_podr = '027'"; // только те что НАДО !!!
	          }

	          // 12.05.16 Берем только пломбы!!!
	          if (whereStr.length() == 0)
	          {
	        	  whereStr = " a.type_object in (" + ENConsts.SCANCOUNTERS_TYPEOBJECT_ALL_SEALS + ")";
	          }
	          else
	          {
	        	  whereStr = whereStr + " and a.type_object in (" + ENConsts.SCANCOUNTERS_TYPEOBJECT_ALL_SEALS + ")";
	          }

	          if(orderBy.length() == 0)
	              orderBy = " a.kod_oborud";

	          if(quantity < 0)
	          quantity = Integer.MAX_VALUE/2;


	          selectStr =
	              " SELECT -1 as ccode , a.num_un, a.kod_mol, a.dt_doc, " +
	              " a.kod_podr, a.kod_inv " +
	              "        , a.str_name, a.kod_oborud, a.dt_vypusk, " +
	              "        a.kod_ist, a.num_oper, a.dt_oper, a.characters, a.sum_st_realiz, " +
	              "        a.kod_inv_old, a.primechan, a.kod_postav, a.sum_st_perv, " +
	              "        a.sum_nds, a.kod_poluch, a.sum_realiz_s_nds, a.sum_realiz_nds, " +
	              "        a.kod_nal_nakl, a.kod_nakl, a.dt_nakl, a.parent_num_un, " +
	              "        a.child_num_un, a.show_, a.type_mut, a.kod_subsch_b, a.realdata, " +
	              "        a.sum_st_vyb, a.code_dogovor, a.user_name_ins, a.user_name_mut, " +
	              "        a.user_name_vyb, a.code_dogovor_vyb, a.info_insert_os, " +
	              "        a.info_last_update_os, a.kod_nakl_vyb, a.dt_nakl_vyb, " +
	              "        a.primechan_vyb, a.type_counter, a.num_pack_copy, a.kod_ist_vyb, " +
	              "        a.date_ust, a.place_ust, a.stroke_code, a.id_zavod " +

	              " , a.energy_lock , a.order_num , a.order_date " +

	              " , a.personalaccount, a.departmentcode, a.enestimateitemcode " +
	              " , a.storagezonecode, a.storagezonename, a.phasity, a.zones " +

	              // Доп. поля для пломб
	 	          " , a.type_object " +
		          " , a.tabn_executor " +
		          " , a.fio_executor " +
		          " , a.orderbyt_num " +
		          " , a.orderbyt_date " +

	              "   FROM countersread.ostable a" ;

	          if(aFilterObject != null)
	          {

	              if (aFilterObject.invNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_inv) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_inv) LIKE UPPER(?)";
	              }
	              if (aFilterObject.name != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.str_name) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.str_name) LIKE UPPER(?)";
	              }
	              if (aFilterObject.buildNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  TRIM(UPPER(a.kod_oborud)) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_oborud) LIKE UPPER(?)";
	              }

	              if (aFilterObject.account != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_subsch_b) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_subsch_b) LIKE UPPER(?)";
	              }
	              if (aFilterObject.departmetFKCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_podr) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_podr) LIKE UPPER(?)";
	              }
	              if (aFilterObject.molCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_mol) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_mol) LIKE UPPER(?)";
	              }
	              if(aFilterObject.dateIn != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_doc = ?";
	              }
	              if(aFilterObject.dateBuild != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_vypusk = ?";
	              }
	              if(aFilterObject.cost != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.sum_st_nds = ?";
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.num_un = ?";
	              }
	              if (aFilterObject.counterType != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.type_counter) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.type_counter) LIKE UPPER(?)";
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.storagezonecode = ?";
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.phasity = ?";
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.zones = ?";
	              }

	          }


	          if(condition.length() != 0)
	          {
	              if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";

	              whereStr = whereStr + " (" + condition + ")";
	          }
//	       + " WHERE" +  сделано выше ????
	          if(whereStr.length() != 0)
	              selectStr = selectStr + " WHERE" + whereStr;

	          // selectStr = selectStr + ") ";

	          selectStr = selectStr + " ORDER BY " + orderBy;


	          statement = finConnection.prepareStatement(selectStr);

	          int number = 0;
	          if(aFilterObject != null){
	              if(aFilterObject.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.code);
	              }

	              if(aFilterObject.invNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.invNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.name != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.name);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.buildNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.buildNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.account != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.account);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.departmetFKCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.departmetFKCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.molCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.molCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.dateIn != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
	              }
	              if(aFilterObject.dateBuild != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
	              }
	              if(aFilterObject.cost != null){
	                  number++;
	                  aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	                  statement.setBigDecimal(number,aFilterObject.cost);
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.scCode);
	              }

	              if(aFilterObject.counterType != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.counterType);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zoneRef.code);
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.phasity);
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zones);
	              }
	          }


	          set = statement.executeQuery();
	          int i;
	          for(i = 0;set.next();i++)
	          {
	              if(i < fromPosition)
	              continue;
	              else if(i >= fromPosition + quantity)
	              {
	              i++;
	              break;
	              }

	              anObject = new ENMetrologyCounterShort();

	              anObject.code = set.getInt(1);
	              if ( set.wasNull() )
	                  anObject.code = Integer.MIN_VALUE;

	              anObject.invNumber = set.getString("kod_inv");
	              anObject.name = set.getString("str_name");
	              anObject.buildNumber = set.getString("kod_oborud");
	              anObject.account = set.getString("kod_subsch_b");
	              anObject.departmetFKCode = set.getString("kod_podr");
	              anObject.molCode = set.getString("kod_mol");
	              anObject.dateIn = set.getDate("dt_doc");
	              anObject.dateBuild = set.getDate("dt_vypusk");
	              anObject.cost = set.getBigDecimal("sum_st_perv");
	              if(anObject.cost != null)
	                  anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	              anObject.scCode = set.getInt("num_un");
	              if ( set.wasNull() )
	                  anObject.scCode = Integer.MIN_VALUE;
	              anObject.counterType = set.getString("type_counter");

	              anObject.lockCode = set.getInt("energy_lock");
	              if (set.wasNull())
	                  anObject.lockCode = Integer.MIN_VALUE;

	              anObject.lockReason = set.getString("order_num");

	              anObject.lockDate = set.getDate("order_date");

	              anObject.personalAccount = set.getString("personalaccount");

	              anObject.departmentCode = set.getInt("departmentcode");
	              if (set.wasNull())
	                  anObject.departmentCode = Integer.MIN_VALUE;

	              anObject.enestimateItemCode = set.getInt("enestimateitemcode");
	              if (set.wasNull())
	                  anObject.enestimateItemCode = Integer.MIN_VALUE;
	              anObject.zoneRefCode = set.getInt("storagezonecode");
	              if (set.wasNull())
	                  anObject.zoneRefCode = Integer.MIN_VALUE;
	              anObject.zoneRefName = set.getString("storagezonename");

	              anObject.phasity = set.getInt("phasity");
	              if(set.wasNull()) {
	              	anObject.phasity = Integer.MIN_VALUE;
	              }
	              anObject.zones = set.getInt("zones");
	              if(set.wasNull()) {
	              	anObject.zones = Integer.MIN_VALUE;
	              }

	              /////////////
	              // Доп. поля для пломб
	              anObject.typeObject = set.getInt("type_object");
	              if(set.wasNull()) {
	            	  anObject.typeObject = Integer.MIN_VALUE;
	              }

	              anObject.tabnExecutor = set.getString("tabn_executor");
	              anObject.fioExecutor = set.getString("fio_executor");
	              anObject.orderBytNum = set.getString("orderbyt_num");

	              anObject.orderBytDate = set.getDate("orderbyt_date");
	              /////////////

	              result.list.add(anObject);
	          }

	          result.setTotalCount(i);
	          return result;
	          }
	          catch(SQLException e)
	          {
	          System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	          EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	          return null;

	          } catch (DatasourceConnectException e) {
	        	  throw new SystemException(e.getMessage(), e);
			}
	          finally
	          {
	          try {if (set != null) set.close();}             catch (SQLException e) {}
	          try {if (statement != null) statement.close();} catch (SQLException e) {}
	          }
	  }



	  /**
	   * Забиваем на show_ = Y
	   * **/
	public ENMetrologyCounterShortList getCountersListFromScanCounterShowAll(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			String condition = (aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL);

			String orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL);

	          // 12.05.16 Берем только счетчики!!!
	          String whereStr = " a.type_object = " + ENConsts.SCANCOUNTERS_TYPEOBJECT_COUNTER;

	          if(orderBy.length() == 0)
	              orderBy = " a.kod_oborud";

	          if(quantity < 0)
	          quantity = Integer.MAX_VALUE/2;


	          selectStr =
	              " SELECT -1 as ccode , a.num_un, a.kod_mol, a.dt_doc, " +
	              " a.kod_podr, a.kod_inv " +
	              "        , a.str_name, a.kod_oborud, a.dt_vypusk, " +
	              "        a.kod_ist, a.num_oper, a.dt_oper, a.characters, a.sum_st_realiz, " +
	              "        a.kod_inv_old, a.primechan, a.kod_postav, a.sum_st_perv, " +
	              "        a.sum_nds, a.kod_poluch, a.sum_realiz_s_nds, a.sum_realiz_nds, " +
	              "        a.kod_nal_nakl, a.kod_nakl, a.dt_nakl, a.parent_num_un, " +
	              "        a.child_num_un, a.show_, a.type_mut, a.kod_subsch_b, a.realdata, " +
	              "        a.sum_st_vyb, a.code_dogovor, a.user_name_ins, a.user_name_mut, " +
	              "        a.user_name_vyb, a.code_dogovor_vyb, a.info_insert_os, " +
	              "        a.info_last_update_os, a.kod_nakl_vyb, a.dt_nakl_vyb, " +
	              "        a.primechan_vyb, a.type_counter, a.num_pack_copy, a.kod_ist_vyb, " +
	              "        a.date_ust, a.place_ust, a.stroke_code, a.id_zavod " +

	              " , a.energy_lock , a.order_num , a.order_date " +

	              " , a.personalaccount, a.departmentcode, a.enestimateitemcode " +
	              " , a.storagezonecode, a.storagezonename, a.phasity, a.zones " +

	              "   FROM countersread.ostable a" ;
	              /*
	          selectStr = "SELECT "+
	          "ENMETROLOGYCOUNTER.CODE"+
	          ",ENMETROLOGYCOUNTER.INVNUMBER"+
	          ",ENMETROLOGYCOUNTER.NAME"+
	          ",ENMETROLOGYCOUNTER.BUILDNUMBER"+
	          ",ENMETROLOGYCOUNTER.ACCOUNT"+
	          ",ENMETROLOGYCOUNTER.DEPARTMETFKCODE"+
	          ",ENMETROLOGYCOUNTER.MOLCODE"+
	          ",ENMETROLOGYCOUNTER.DATEIN"+
	          ",ENMETROLOGYCOUNTER.DATEBUILD"+
	          ",ENMETROLOGYCOUNTER.COST"+
	          ",ENMETROLOGYCOUNTER.SCCODE"+
	          ",ENMETROLOGYCOUNTER.COUNTERTYPE"+

	          ", ENELEMENT.CODE " +
	          " FROM ENMETROLOGYCOUNTER " +
	          ", ENELEMENT " +
	          //" WHERE "
	          "";
	          whereStr = " ENELEMENT.CODE = ENMETROLOGYCOUNTER.ELEMENTCODE" ; //+
	              //selectStr = selectStr + " ${s} ENMETROLOGYCOUNTER.CODE IN ( SELECT ENMETROLOGYCOUNTER.CODE FROM ENMETROLOGYCOUNTER ";

//	       " ";
	*
	*/
	          if(aFilterObject != null)
	          {

	              if (aFilterObject.invNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_inv) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_inv) LIKE UPPER(?)";
	              }
	              if (aFilterObject.name != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.str_name) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.str_name) LIKE UPPER(?)";
	              }
	              if (aFilterObject.buildNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  TRIM(UPPER(a.kod_oborud)) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_oborud) LIKE UPPER(?)";
	              }

	              if (aFilterObject.account != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_subsch_b) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_subsch_b) LIKE UPPER(?)";
	              }
	              if (aFilterObject.departmetFKCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_podr) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_podr) LIKE UPPER(?)";
	              }
	              if (aFilterObject.molCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_mol) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_mol) LIKE UPPER(?)";
	              }
	              if(aFilterObject.dateIn != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_doc = ?";
	              }
	              if(aFilterObject.dateBuild != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_vypusk = ?";
	              }
	              if(aFilterObject.cost != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.sum_st_nds = ?";
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.num_un = ?";
	              }
	              if (aFilterObject.counterType != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.type_counter) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.type_counter) LIKE UPPER(?)";
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.storagezonecode = ?";
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.phasity = ?";
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.zones = ?";
	              }
	          }


	          if(condition.length() != 0)
	          {
	              if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";

	              whereStr = whereStr + " (" + condition + ")";
	          }
//	       + " WHERE" +  сделано выше ????
	          if(whereStr.length() != 0)
	              selectStr = selectStr + " WHERE" + whereStr;

	          // selectStr = selectStr + ") ";

	          selectStr = selectStr + " ORDER BY " + orderBy;


	          statement = finConnection.prepareStatement(selectStr);

	          int number = 0;
	          if(aFilterObject != null){
	              if(aFilterObject.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.code);
	              }

	              if(aFilterObject.invNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.invNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.name != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.name);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.buildNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.buildNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.account != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.account);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.departmetFKCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.departmetFKCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.molCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.molCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.dateIn != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
	              }
	              if(aFilterObject.dateBuild != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
	              }
	              if(aFilterObject.cost != null){
	                  number++;
	                  aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	                  statement.setBigDecimal(number,aFilterObject.cost);
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.scCode);
	              }

	              if(aFilterObject.counterType != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.counterType);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zoneRef.code);
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.phasity);
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zones);
	              }
	          }


	          set = statement.executeQuery();
	          int i;
	          for(i = 0;set.next();i++)
	          {
	              if(i < fromPosition)
	              continue;
	              else if(i >= fromPosition + quantity)
	              {
	              i++;
	              break;
	              }

	              anObject = new ENMetrologyCounterShort();

	              anObject.code = set.getInt(1);
	              if ( set.wasNull() )
	                  anObject.code = Integer.MIN_VALUE;

	              anObject.invNumber = set.getString("kod_inv");
	              anObject.name = set.getString("str_name");
	              anObject.buildNumber = set.getString("kod_oborud");
	              anObject.account = set.getString("kod_subsch_b");
	              anObject.departmetFKCode = set.getString("kod_podr");
	              anObject.molCode = set.getString("kod_mol");
	              anObject.dateIn = set.getDate("dt_doc");
	              anObject.dateBuild = set.getDate("dt_vypusk");
	              anObject.cost = set.getBigDecimal("sum_st_perv");
	              if(anObject.cost != null)
	                  anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	              anObject.scCode = set.getInt("num_un");
	              if ( set.wasNull() )
	                  anObject.scCode = Integer.MIN_VALUE;
	              anObject.counterType = set.getString("type_counter");

	              anObject.lockCode = set.getInt("energy_lock");
	              if (set.wasNull())
	                  anObject.lockCode = Integer.MIN_VALUE;

	              anObject.lockReason = set.getString("order_num");

	              anObject.lockDate = set.getDate("order_date");

	              anObject.personalAccount = set.getString("personalaccount");

	              anObject.departmentCode = set.getInt("departmentcode");
	              if (set.wasNull())
	                  anObject.departmentCode = Integer.MIN_VALUE;

	              anObject.enestimateItemCode = set.getInt("enestimateitemcode");
	              if (set.wasNull())
	                  anObject.enestimateItemCode = Integer.MIN_VALUE;
	              anObject.zoneRefCode = set.getInt("storagezonecode");
	              if (set.wasNull())
	                  anObject.zoneRefCode = Integer.MIN_VALUE;
	              anObject.zoneRefName = set.getString("storagezonename");

	              anObject.phasity = set.getInt("phasity");
	              if(set.wasNull()) {
	              	anObject.phasity = Integer.MIN_VALUE;
	              }
	              anObject.zones = set.getInt("zones");
	              if(set.wasNull()) {
	              	anObject.zones = Integer.MIN_VALUE;
	              }

	              result.list.add(anObject);
	          }

	          result.setTotalCount(i);
	          return result;
	          }
	          catch(SQLException e)
	          {
	          System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	          EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	          return null;
	          } catch (DatasourceConnectException e) {
	        	  throw new SystemException(e.getMessage(), e);
			}
	          finally
	          {
	          try {if (set != null) set.close();}             catch (SQLException e) {}
	          try {if (statement != null) statement.close();} catch (SQLException e) {}
	          }

	  }


	  /***
	   * счетчики с полем - стоимость без параметризации
	   * */
	public ENMetrologyCounterShortList getCountersListFromScanCounterWithoutParametrezac(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet  set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

	          String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);
	          String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

	          String whereStr = " a.show_ = 'Y'"; // and a.kod_podr = '027'"; // только те что НАДО !!!

	          // 12.05.16 Берем только счетчики!!!
	          whereStr = whereStr + " and a.type_object = " + ENConsts.SCANCOUNTERS_TYPEOBJECT_COUNTER;

	          if(orderBy.length() == 0)
	              orderBy = " a.kod_oborud";

	          if(quantity < 0)
	          quantity = Integer.MAX_VALUE/2;


	          selectStr =
	        		  		  "        SELECT ccode , num_un, kod_mol, dt_doc,  \n" +
	        				  "                       kod_podr, kod_inv  \n" +
	        				  "                       , str_name, kod_oborud, dt_vypusk,  \n" +
	        				  "                       kod_ist, num_oper, dt_oper, characters, sum_st_realiz,  \n" +
	        				  "                       kod_inv_old, primechan, kod_postav, sum_st_perv,  \n" +
	        				  "                       sum_nds, kod_poluch, sum_realiz_s_nds, sum_realiz_nds,  \n" +
	        				  "                       kod_nal_nakl, kod_nakl, dt_nakl, parent_num_un,  \n" +
	        				  "                       child_num_un, show_, type_mut, kod_subsch_b, realdata,  \n" +
	        				  "                       sum_st_vyb, code_dogovor, user_name_ins, user_name_mut,  \n" +
	        				  "                       user_name_vyb, code_dogovor_vyb, info_insert_os,  \n" +
	        				  "                       info_last_update_os, kod_nakl_vyb, dt_nakl_vyb,  \n" +
	        				  "                       primechan_vyb, type_counter, num_pack_copy, kod_ist_vyb,  \n" +
	        				  "                       date_ust, place_ust, stroke_code, id_zavod  \n" +
	        				  "                , energy_lock , order_num , order_date                \n" +
	        				  "                , personalaccount, departmentcode, enestimateitemcode  \n" +
	        				  "                , storagezonecode, storagezonename, phasity, zones  \n" +
	        				  "                , sum_without_parametrizac \n" +
	        				  "                , rqorderitemcode \n" +
	        				  "                , materialcode   \n" +
	        				  " FROM ( \n" +

	              " SELECT -1 as ccode , a.num_un, a.kod_mol, a.dt_doc, " +
	              " a.kod_podr, a.kod_inv " +
	              "        , a.str_name, a.kod_oborud, a.dt_vypusk, " +
	              "        a.kod_ist, a.num_oper, a.dt_oper, a.characters, a.sum_st_realiz, " +
	              "        a.kod_inv_old, a.primechan, a.kod_postav, a.sum_st_perv, " +
	              "        a.sum_nds, a.kod_poluch, a.sum_realiz_s_nds, a.sum_realiz_nds, " +
	              "        a.kod_nal_nakl, a.kod_nakl, a.dt_nakl, a.parent_num_un, " +
	              "        a.child_num_un, a.show_, a.type_mut, a.kod_subsch_b, a.realdata, " +
	              "        a.sum_st_vyb, a.code_dogovor, a.user_name_ins, a.user_name_mut, " +
	              "        a.user_name_vyb, a.code_dogovor_vyb, a.info_insert_os, " +
	              "        a.info_last_update_os, a.kod_nakl_vyb, a.dt_nakl_vyb, " +
	              "        a.primechan_vyb, a.type_counter, a.num_pack_copy, a.kod_ist_vyb, " +
	              "        a.date_ust, a.place_ust, a.stroke_code, a.id_zavod " +

	              " , a.energy_lock , a.order_num , a.order_date " +

	              " , a.personalaccount, a.departmentcode, a.enestimateitemcode " +
	              " , a.storagezonecode, a.storagezonename, a.phasity, a.zones " +
	              " , countersread.get_sum_without_parametrizac(a.kod_inv) as sum_without_parametrizac " +
	              " , a.rqorderitemcode " +
	              " , a.materialcode " +

	              "   FROM countersread.ostable a" ;

	          if(aFilterObject != null)
	          {

	              if (aFilterObject.invNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_inv) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_inv) LIKE UPPER(?)";
	              }
	              if (aFilterObject.name != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.str_name) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.str_name) LIKE UPPER(?)";
	              }
	              if (aFilterObject.buildNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  TRIM(UPPER(a.kod_oborud)) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_oborud) LIKE UPPER(?)";
	              }

	              if (aFilterObject.account != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_subsch_b) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_subsch_b) LIKE UPPER(?)";
	              }
	              if (aFilterObject.departmetFKCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_podr) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_podr) LIKE UPPER(?)";
	              }
	              if (aFilterObject.molCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_mol) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_mol) LIKE UPPER(?)";
	              }
	              if(aFilterObject.dateIn != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_doc = ?";
	              }
	              if(aFilterObject.dateBuild != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_vypusk = ?";
	              }
	              if(aFilterObject.cost != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.sum_st_nds = ?";
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.num_un = ?";
	              }
	              if (aFilterObject.counterType != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.type_counter) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.type_counter) LIKE UPPER(?)";
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.storagezonecode = ?";
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.phasity = ?";
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.zones = ?";
	              }
	          }


	          if(condition.length() != 0)
	          {
	              if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";

	              whereStr = whereStr + " (" + condition + ")";
	          }
//	       + " WHERE" +  сделано выше ????
	          if(whereStr.length() != 0)
	              selectStr = selectStr + " WHERE" + whereStr;

	           selectStr = selectStr + " ) ";

	          selectStr = selectStr + " ORDER BY " + orderBy;

	          statement = finConnection.prepareStatement(selectStr);

	          int number = 0;
	          if(aFilterObject != null){
	              if(aFilterObject.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.code);
	              }

	              if(aFilterObject.invNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.invNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.name != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.name);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.buildNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.buildNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.account != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.account);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.departmetFKCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.departmetFKCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.molCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.molCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.dateIn != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
	              }
	              if(aFilterObject.dateBuild != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
	              }
	              if(aFilterObject.cost != null){
	                  number++;
	                  aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	                  statement.setBigDecimal(number,aFilterObject.cost);
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.scCode);
	              }

	              if(aFilterObject.counterType != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.counterType);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zoneRef.code);
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.phasity);
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zones);
	              }
	          }


	         // System.out.println("############### getCounterList "
	          //        + "Executing query: " + ((LoggableStatement)statement).getQueryString());

	          set = statement.executeQuery();
	          int i;
	          for(i = 0;set.next();i++)
	          {
	              if(i < fromPosition)
	              continue;
	              else if(i >= fromPosition + quantity)
	              {
	              i++;
	              break;
	              }

	              anObject = new ENMetrologyCounterShort();

	              anObject.code = set.getInt(1);
	              if ( set.wasNull() )
	                  anObject.code = Integer.MIN_VALUE;

	              anObject.invNumber = set.getString("kod_inv");
	              anObject.name = set.getString("str_name");
	              anObject.buildNumber = set.getString("kod_oborud");
	              anObject.account = set.getString("kod_subsch_b");
	              anObject.departmetFKCode = set.getString("kod_podr");
	              anObject.molCode = set.getString("kod_mol");
	              anObject.dateIn = set.getDate("dt_doc");
	              anObject.dateBuild = set.getDate("dt_vypusk");
	              anObject.cost = set.getBigDecimal("sum_st_perv");
	              if(anObject.cost != null)
	                  anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	              anObject.scCode = set.getInt("num_un");
	              if ( set.wasNull() )
	                  anObject.scCode = Integer.MIN_VALUE;
	              anObject.counterType = set.getString("type_counter");

	              anObject.lockCode = set.getInt("energy_lock");
	              if (set.wasNull())
	                  anObject.lockCode = Integer.MIN_VALUE;

	              anObject.lockReason = set.getString("order_num");

	              anObject.lockDate = set.getDate("order_date");

	              anObject.personalAccount = set.getString("personalaccount");

	              anObject.departmentCode = set.getInt("departmentcode");
	              if (set.wasNull())
	                  anObject.departmentCode = Integer.MIN_VALUE;

	              anObject.enestimateItemCode = set.getInt("enestimateitemcode");
	              if (set.wasNull())
	                  anObject.enestimateItemCode = Integer.MIN_VALUE;
	              anObject.zoneRefCode = set.getInt("storagezonecode");
	              if (set.wasNull())
	                  anObject.zoneRefCode = Integer.MIN_VALUE;
	              anObject.zoneRefName = set.getString("storagezonename");

	              anObject.phasity = set.getInt("phasity");
	              if(set.wasNull()) {
	              	anObject.phasity = Integer.MIN_VALUE;
	              }

	              anObject.zones = set.getInt("zones");
	              if(set.wasNull()) {
	              	anObject.zones = Integer.MIN_VALUE;
	              }

	              anObject.sum_without_parametrizac = set.getBigDecimal("sum_without_parametrizac");
	              if(anObject.sum_without_parametrizac != null)
	                  anObject.sum_without_parametrizac = anObject.sum_without_parametrizac.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

	              anObject.rqorderitemcode = set.getInt("rqorderitemcode");
	              if(set.wasNull()) {
	              	anObject.rqorderitemcode = Integer.MIN_VALUE;
	              }

	              anObject.materialcode = set.getInt("materialcode");
	              if(set.wasNull()) {
	              	anObject.materialcode = Integer.MIN_VALUE;
	              }

	              result.list.add(anObject);
	          }

	          result.setTotalCount(i);
	          return result;
	          }
	          catch(SQLException e)
	          {
	          System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	          EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	          return null;
	          } catch (DatasourceConnectException e) {
	        	  throw new SystemException(e.getMessage(), e);
			}
	          finally
	          {
	          try {if (set != null) set.close();}             catch (SQLException e) {}
	          try {if (statement != null) statement.close();} catch (SQLException e) {}
	          }
	  }


	  /**
	   *
	   * список наименований счетчиков по DISTINCT из СканСчетчик"ов .... */

	public ENMetrologyCounterShortList getCountersListFromScanCounterDistinctName(
			ENMetrologyCounterFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			if (finConnection != null && finConnection.isClosed()) {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			}

			  String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);
	          String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );
	          String whereStr = " a.show_ = 'Y'"; // and a.kod_podr = '027'"; // только те что НАДО !!!

	          // 12.05.16 Берем только счетчики!!!
	          whereStr = whereStr + " and a.type_object = " + ENConsts.SCANCOUNTERS_TYPEOBJECT_COUNTER;

	              orderBy = " a.str_name";

	          if(quantity < 0)
	          quantity = Integer.MAX_VALUE/2;


	          selectStr =
	              " SELECT distinct a.str_name " +
	              "   FROM countersread.ostable a" ;

	          if(aFilterObject != null)
	          {

	              if (aFilterObject.invNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_inv) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_inv) LIKE UPPER(?)";
	              }
	              if (aFilterObject.name != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.str_name) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.str_name) LIKE UPPER(?)";
	              }
	              if (aFilterObject.buildNumber != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  TRIM(UPPER(a.kod_oborud)) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_oborud) LIKE UPPER(?)";
	              }

	              if (aFilterObject.account != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_subsch_b) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_subsch_b) LIKE UPPER(?)";
	              }
	              if (aFilterObject.departmetFKCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_podr) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_podr) LIKE UPPER(?)";
	              }
	              if (aFilterObject.molCode != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.kod_mol) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.kod_mol) LIKE UPPER(?)";
	              }
	              if(aFilterObject.dateIn != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_doc = ?";
	              }
	              if(aFilterObject.dateBuild != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.dt_vypusk = ?";
	              }
	              if(aFilterObject.cost != null) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.sum_st_nds = ?";
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.num_un = ?";
	              }
	              if (aFilterObject.counterType != null) {
	                  if(whereStr.length() != 0)
	                      whereStr = whereStr + " AND ";
	                  if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
	                      whereStr = whereStr + "  UPPER(a.type_counter) = UPPER(?)";
	                  else
	                      whereStr = whereStr + " UPPER(a.type_counter) LIKE UPPER(?)";
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.storagezonecode = ?";
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.phasity = ?";
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE) {
	                  if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";
	                  whereStr = whereStr + "  a.zones = ?";
	              }
	          }


	          if(condition.length() != 0)
	          {
	              if(whereStr.length() != 0)
	                  whereStr = whereStr + " AND ";

	              whereStr = whereStr + " (" + condition + ")";
	          }
//	       + " WHERE" +  сделано выше ????
	          if(whereStr.length() != 0)
	              selectStr = selectStr + " WHERE" + whereStr;

	          // selectStr = selectStr + ") ";

	          selectStr = selectStr + " ORDER BY " + orderBy;

	          statement = finConnection.prepareStatement(selectStr);

	          int number = 0;
	          if(aFilterObject != null){
	              if(aFilterObject.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.code);
	              }

	              if(aFilterObject.invNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.invNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.name != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.name);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.buildNumber != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.buildNumber);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.account != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.account);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.departmetFKCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.departmetFKCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }

	              if(aFilterObject.molCode != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.molCode);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.dateIn != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
	              }
	              if(aFilterObject.dateBuild != null){
	                  number++;
	                  statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
	              }
	              if(aFilterObject.cost != null){
	                  number++;
	                  aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	                  statement.setBigDecimal(number,aFilterObject.cost);
	              }
	              if(aFilterObject.scCode != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.scCode);
	              }

	              if(aFilterObject.counterType != null){
	                  number++;
	                  StringBuffer likeStr = new StringBuffer();
	                  likeStr.append(aFilterObject.counterType);
	                  for(int i = 0;i < likeStr.length();i++){
	                          if(likeStr.charAt(i) == '*')
	                              likeStr.setCharAt(i,'%');
	                          if(likeStr.charAt(i) == '?')
	                              likeStr.setCharAt(i,'_');
	                  }
	                  statement.setString(number,likeStr.toString());
	              }
	              if(aFilterObject.zoneRef.code != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zoneRef.code);
	              }
	              if(aFilterObject.phasity != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.phasity);
	              }
	              if(aFilterObject.zones != Integer.MIN_VALUE){
	                  number++;
	                  statement.setInt(number,aFilterObject.zones);
	              }
	          }


	          set = statement.executeQuery();
	          int i;
	          for(i = 0;set.next();i++)
	          {
	              if(i < fromPosition)
	              continue;
	              else if(i >= fromPosition + quantity)
	              {
	              i++;
	              break;
	              }

	              anObject = new ENMetrologyCounterShort();


	              anObject.name = set.getString("str_name");


	              result.list.add(anObject);
	          }

	          result.setTotalCount(i);
	          return result;
	          }
	          catch(SQLException e)
	          {
	          System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	          EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	          return null;
	          } catch (DatasourceConnectException e) {
	        	  throw new SystemException(e.getMessage(), e);
			}
	          finally
	          {
	          try {if (set != null) set.close();}             catch (SQLException e) {}
	          try {if (statement != null) statement.close();} catch (SQLException e) {}
	          }
	  }

	/**
	 *
	 * Обновить информацию по счетчикам в EnergyNet по акту
	 * после проведения (или отмены проведения)
	 *
	 * Процедура должна вызываться в конце проведения (или отмены) акта когда информация
	 * в Фин. коллекции обновлена
	 *
	 * @param act {@link ENAct}
	 * @throws PersistenceException
	 */
	public void updateCountersAfterActMoving(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new SystemException("Немає акту");
		}

		ENMetrologyCounterDAO metrologyCounterDao = new ENMetrologyCounterDAO(connection, userProfile);
		SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);

		ENMetrologyCounterShortList list = metrologyCounterDao.getListByAct(act);
		SCCounterShortList list1 = counterDao.getListByAct(act, null);

		Hashtable<String, ENMetrologyCounterShort> counters = new Hashtable<String, ENMetrologyCounterShort>();
		for(ENMetrologyCounterShort counter : list.list) counters.put(counter.invNumber, counter);
		for(SCCounterShort counter : list1.list) {
			if(counter.invNumber != null && counter.invNumber.trim().length() > 0) {
				ENMetrologyCounterShort metrologyCounter =
						metrologyCounterDao.getShortObjectByInvNumber(counter.invNumber);
				if(metrologyCounter != null) {
					counters.put(counter.invNumber, metrologyCounter);
				}
			}
		}

		Set<String> invNumbers = counters.keySet();
		for(String invNumber : invNumbers) {
			ENMetrologyCounterShort counter = counters.get(invNumber);
			ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
			filter.invNumber = invNumber;
			ENMetrologyCounterShortList counterAfterList = this.getCountersListFromScanCounter(filter, 0, -1
					, counter.accountingTypeRefCode);
			if(counterAfterList.totalCount > 0) {
				ENMetrologyCounterShort counterAfter = counterAfterList.get(0);
				ENMetrologyCounter obj = metrologyCounterDao.getObject(counter.code);
				obj.account = counterAfter.account;
				obj.cost = counterAfter.cost;
				obj.scCode = counterAfter.scCode;
				metrologyCounterDao.save(obj);
			}
		}

	}

	/**
	 * SUPP-106296 Проверка МОЛов для документов на ввод счетчиков в эксплуатацию
	 * (проверяем, чтобы МОЛ, на котором находится устанавливаемый или снимаемый счетчик,
	 * совпадал с МОЛом в наряде на плане, куда этот счетчик добавляется)
	 *
	 * @param counterMolCode - МОЛ, на котором числится счетчик
	 * @param plan - план, куда счетчик привязывается
	 */
	private void checkMolCodesForCounter(String counterMolCode, ENPlanWork plan) {

		if (counterMolCode == null || counterMolCode.trim().isEmpty()) {
			// Если не задан код МОЛа, это типа счетчик абонента, поэтому не будем проверять
			// throw new IllegalArgumentException("\n\nНе заданий код МВО для лічильника!");
			return;
		}
		if (plan == null || plan.code <= 0) {
			throw new IllegalArgumentException("\n\nНе задано план!");
		}

		// Проверку выполняем только для планов, дата которых не ранее даты
		// запуска механизма подписания документов на ввод счетчиков в эксплуатацию ЭЦП
		if (plan.dateStart.compareTo(DFConsts.SCUSAGEINPUT_SIGNING_START) < 0) {
			return;
		}
		try {
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, userProfile);
			ENWorkOrder workOrder = workOrderLogic.getWorkOrderByPlanCode(plan.code);
			if (workOrder == null || workOrder.code <= 0) {
				throw new SystemException("\n\nНе знайдено наряд-завдання для плану з кодом " + plan.code + " !");
			}

			FINMolDataDAO finMolDataDao = new FINMolDataDAO(connection, userProfile);
			FINMolDataFilter finMolDataFilter = new FINMolDataFilter();
			finMolDataFilter.workOrder.code = workOrder.code;
			finMolDataFilter.molTypeRef.code = FINMolType.MASTER;

			FINMolDataShortList finMolDataList = finMolDataDao.getScrollableFilteredList(finMolDataFilter, 0, -1);
			if (finMolDataList == null || finMolDataList.list == null || finMolDataList.list.isEmpty()) {
				throw new SystemException("\n\nНе знайдено МВО-майстра для наряд-завдання з кодом " + workOrder.code + " !");
			}
			if (finMolDataList.get(0) == null
					|| finMolDataList.get(0).finMolCode == null
					|| finMolDataList.get(0).finMolCode.trim().isEmpty()) {
				throw new SystemException("\n\nНе заданий код МВО-майстра для наряд-завдання з кодом " + workOrder.code + " !");
			}

			String workOrderMolCode = finMolDataList.get(0).finMolCode;

			if (! counterMolCode.equals(workOrderMolCode)) {
				throw new SystemException(String.format(ENConsts.SCUSAGEINPUT_CHECK_MOL_ERROR_MESSAGE +
						"МВО у наряд-завданні: %s, МВО лічильника: %s.\n" +
						"Вам необхідно зробити внутрішнє переміщення лічильників на МВО %s.\n" +
						"Код плану: %d.",
						workOrderMolCode, counterMolCode,
						workOrderMolCode,
						plan.code
						));
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

}
