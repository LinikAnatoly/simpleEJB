
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENInspectionSheetDAO;
import com.ksoe.energynet.dataminer.ENInspectionSheetItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.ejb.generated.ENInspectionSheetControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.InspectionSheetLogic;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.energynet.valueobject.ENInspectionSheetStatus;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetItemShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;

public class ENInspectionSheetControllerEJB extends
		ENInspectionSheetControllerEJBGen {


	public ENInspectionSheetControllerEJB() {
	}


	public class InspectionKind {
		/** плановий */
		public static final int PLANED = 1;
		/** післяаварійний */
		public static final int POST_ACCIDENT = 2;
		/** позаплановий */
		public static final int NO_PLANED = 3;
	}


	public class EquipmentKind {
		/** низковольтное - Листи огляду ( ПЛ 0.4кВ, ПЛ 10кВ, ТП 6-10кВ ) */
		public static final int LOW_VOLTAGE = 1;
		/** высоковольтное - Листи огляду ( ПС 35-150 кВ, Лінії 35-150 кВ ) */
		public static final int HIGH_VOLTAGE = 2;
	}



	/* ENInspectionSheet. Изменить */
	@Override
	public void save(ENInspectionSheet object) {
		try {
			ENInspectionSheetDAO objectDAO = new ENInspectionSheetDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			if (object.takeIntoCalculation == Integer.MIN_VALUE) {
				object.takeIntoCalculation = ENConsts.NO;
			}

			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENInspectionSheet%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENInspectionSheet. Добавить */
	@Override
	public int add(ENInspectionSheet inspectionSheet) {

		int inspectionSheetCode = Integer.MIN_VALUE;

		try {

			InspectionSheetLogic inspectionSheetLogic = new InspectionSheetLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElementDAO enElementDao = new ENElementDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


			if (inspectionSheet.takeIntoCalculation == Integer.MIN_VALUE) {
				inspectionSheet.takeIntoCalculation = ENConsts.NO;
			}


			int elementType = enElementDao.getObject(inspectionSheet.elementRef.code).typeRef.code;

			if (elementType == ENElementType.LINE04
					|| elementType == ENElementType.LINE10
					|| elementType == ENElementType.SUBSTATION04) {

				inspectionSheetCode = inspectionSheetLogic.makeSheetGeneral(inspectionSheet, EquipmentKind.LOW_VOLTAGE);

			} else if (elementType == ENElementType.LINE150) {

				inspectionSheetCode = inspectionSheetLogic.makeSheetGeneral(inspectionSheet, EquipmentKind.HIGH_VOLTAGE);

			} else {

				inspectionSheetCode = inspectionSheetLogic.makeSheetHighSide(inspectionSheet);
			}


			return inspectionSheetCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENInspectionSheet%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENInspectionSheet. Удалить */
	@Override
	public void remove(int sheetCode) {
		try {
			ENInspectionSheetDAO objectDAO = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENInspectionSheetItemDAO inspectionSheetItemDao = new ENInspectionSheetItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet inspectionSheet = objectDAO.getObject(sheetCode);

			if (inspectionSheet.statusRef.code != ENInspectionSheetStatus.DRAFT) {
				throw new SystemException("\n\n"
						+ "Лист огляду вже не чорновий!!!");
			}

			ENInspectionSheetItemFilter sheetItemFilter = new ENInspectionSheetItemFilter();
			sheetItemFilter.sheetRef.code = sheetCode;

			int sheetItemArr[] = inspectionSheetItemDao.getFilteredCodeArray(sheetItemFilter, 0, -1);
			 for (int i = 0; i < sheetItemArr.length; i++) {
				 inspectionSheetItemDao.remove(sheetItemArr[i]);
			 }


			objectDAO.remove(sheetCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENInspectionSheet%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/** ENInspectionSheet. Отправить на подписание. */
	public void sendToSigning(int inspectionSheetCode) {
		try {
			ENInspectionSheetDAO objectDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet inspectionSheet = objectDao.getObject(inspectionSheetCode);
			if (inspectionSheet.statusRef.code != ENInspectionSheetStatus.DRAFT) {
				throw new SystemException("\n\n"
						+ "Лист огляду вже не чорновий!!!");
			}

			inspectionSheet.statusRef.code = ENInspectionSheetStatus.ON_SIGNATURE;

			objectDao.save(inspectionSheet);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/** ENInspectionSheet. Возврат в черновой. */
	public void unSigning(int inspectionSheetCode) {
		try {
			ENInspectionSheetDAO objectDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet inspectionSheet = objectDao.getObject(inspectionSheetCode);
			if (inspectionSheet.statusRef.code != ENInspectionSheetStatus.ON_SIGNATURE) {
				throw new SystemException("\n\n"
						+ "Лист огляду чорновий або підписаний!!!");
			}

			inspectionSheet.statusRef.code = ENInspectionSheetStatus.DRAFT;

			objectDao.save(inspectionSheet);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/** ENInspectionSheet. Подписать. */
	public void signed(int inspectionSheetCode) {
		try {
			ENInspectionSheetDAO objectDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet inspectionSheet = objectDao.getObject(inspectionSheetCode);
			if (inspectionSheet.statusRef.code != ENInspectionSheetStatus.ON_SIGNATURE) {
				throw new SystemException("\n\n"
						+ "Лист огляду повинен мати статус \"На підписанні\"!!!");
			}

			inspectionSheet.statusRef.code = ENInspectionSheetStatus.SIGNED;

			objectDao.save(inspectionSheet);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/** ENInspectionSheet. Отмена подписания. */
	public void unSigned(int inspectionSheetCode) {
		try {
			ENInspectionSheetDAO objectDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet inspectionSheet = objectDao.getObject(inspectionSheetCode);
			if (inspectionSheet.statusRef.code != ENInspectionSheetStatus.SIGNED) {
				throw new SystemException("\n\n"
						+ "Лист огляду вже чорновий або на підписанні!!!");
			}

			inspectionSheet.statusRef.code = ENInspectionSheetStatus.ON_SIGNATURE;

			objectDao.save(inspectionSheet);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 *  ENInspectionSheet. Создание плана на основании листа осмотра.
	 *
	 *  @param inspectionSheetCode
	 *  @param plan
	 *
	 *  @return planCode
	 */
	public int createPlanFromInspectionSheet(int inspectionSheetCode, ENPlanWork plan) {

		int planCode = Integer.MIN_VALUE;

		try {
			ENInspectionSheetDAO objectDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENInspectionSheetItemDAO iItemDao = new ENInspectionSheetItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKTechCardDAO techCardDao = new TKTechCardDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkItemDAO planWorkItemDao = new ENPlanWorkItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));



			ENInspectionSheet inspectionSheet = objectDao.getObject(inspectionSheetCode);
			if (inspectionSheet.planRef.code != Integer.MIN_VALUE) {
				throw new SystemException("\n\n"
						+ "Для цього листа огляду план еже був створений!!! \n"
						+ "Код плану = " + inspectionSheet.planRef.code);
			}


			TKTechCardFilter techCardFilter = new TKTechCardFilter();
			techCardFilter.conditionSQL = " code in (select tt.techcardrefcode "
					+ " from eninspectionsheetitem si, tkdefects2techcard tt "
					+ " where tt.classificationtyperfcd = si.classificationtyperfcd "
					+ " and si.sheetrefcode = " + inspectionSheetCode + ") ";

			int techCardArr[] = techCardDao.getFilteredCodeArray(techCardFilter, 0, -1);

			if (techCardArr.length == 0) {
				throw new SystemException("\n\n"
						+ "Для цього листа огляду не знайдено жодної роботи!!!");
			}


			Context cntPlanWork = new InitialContext();
			Object planRef = cntPlanWork.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planWorkHome = (ENPlanWorkControllerHome) PortableRemoteObject
					.narrow(planRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planWorkController = planWorkHome.create();

			boolean isForTechConditions = false;
			boolean isForAVR = true;
			boolean isFromCallCenter = false;
			boolean createPlanFromInspectionSheet = true;

			plan.status.code = ENPlanWorkStatus.GOOD;

			planCode = planWorkController.add(plan, isForTechConditions, isForAVR, isFromCallCenter, createPlanFromInspectionSheet);


			Context cntPlanWorkItem = new InitialContext();
			Object planWorkItemRef = cntPlanWorkItem.lookup(ENPlanWorkItemController.JNDI_NAME);
			ENPlanWorkItemControllerHome planWorkItemHome = (ENPlanWorkItemControllerHome) PortableRemoteObject
					.narrow(planWorkItemRef, ENPlanWorkItemControllerHome.class);
			ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();


			/**  выявленные дефекты для плана  */
			ENInspectionSheetItemFilter iiFilter = new ENInspectionSheetItemFilter();
			iiFilter.conditionSQL = " eninspectionsheetitem.code in ( "
					+ " select si.code from eninspectionsheetitem si, tkdefects2techcard tt  "
					+ " where tt.classificationtyperfcd = si.classificationtyperfcd  "
					+ " and si.isdetecting = " + ENInspectionSheetItem.ISDETECTING_YES
					+ " and si.sheetrefcode = " + inspectionSheetCode + " )";

			ENInspectionSheetItemShortList iiList = iItemDao.getScrollableFilteredList(iiFilter, 0, -1);

			for (int i = 0; i < iiList.totalCount; i++) {

				ENPlanWorkItemFilter planWorkItemFilter = new ENPlanWorkItemFilter();
				planWorkItemFilter.planRef.code = planCode;
				planWorkItemFilter.kartaRef.code = iiList.get(i).techCardCode;

				int planWorkItemArr[] = planWorkItemDao.getFilteredCodeArray(planWorkItemFilter, 0, -1);

				if (planWorkItemArr.length == 0) {

					ENPlanWorkItem planWorkItem = new ENPlanWorkItem();
					planWorkItem.planRef.code = planCode;
					planWorkItem.kartaRef.code = iiList.get(i).techCardCode;
					planWorkItem.commentGen = iiList.get(i).commentGen;

					if (iiList.get(i).countGen != null && iiList.get(i).countGen.doubleValue() > 1) {
						planWorkItem.countGen = iiList.get(i).countGen;
					} else {
						planWorkItem.countGen = new BigDecimal(1);
					}

					planWorkItemController.add(planWorkItem, isForAVR);

				} else {

					ENPlanWorkItem planWorkItem = planWorkItemDao.getObject(planWorkItemArr[0]);

					planWorkItem.commentGen = planWorkItem.commentGen == null ?
							iiList.get(i).commentGen : planWorkItem.commentGen + "\n" + iiList.get(i).commentGen;

					if (iiList.get(i).countGen != null && iiList.get(i).countGen.doubleValue() > 1) {
						planWorkItem.countGen = planWorkItem.countGen.add(iiList.get(i).countGen);
					} else {
						planWorkItem.countGen = planWorkItem.countGen.add(new BigDecimal(1));
					}

					planWorkItemController.save(planWorkItem);

				}

			}



			inspectionSheet.planRef.code = planCode;
			objectDao.save(inspectionSheet);


			return planCode;

		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 *  ENInspectionSheet. Копировать лист осмотра.
	 *
	 *  @param sheetCode
	 */
	public int copySheet(int sheetCode) {
		try {
			int newSheetCode = Integer.MIN_VALUE;

			ENInspectionSheetDAO sheetDao = new ENInspectionSheetDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENInspectionSheetItemDAO sheetItemDao = new ENInspectionSheetItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInspectionSheet newSheet = sheetDao.getObject(sheetCode);
			newSheet.code = Integer.MIN_VALUE;
			newSheet.userGen = getUserProfile().userName;
			newSheet.dateGen = new Date();
			newSheet.dateEdit = new Date();
			newSheet.modify_time = Long.MIN_VALUE;
			newSheet.statusRef.code = ENInspectionSheetStatus.DRAFT;
			newSheet.planRef.code = Integer.MIN_VALUE;

			newSheetCode = sheetDao.add(newSheet);

			ENInspectionSheetItemFilter sheetItemFilter = new ENInspectionSheetItemFilter();
			sheetItemFilter.sheetRef.code = sheetCode;

			int siArr[] = sheetItemDao.getFilteredCodeArray(sheetItemFilter, 0, -1);
			for (int i = 0; i < siArr.length; i++) {

				ENInspectionSheetItem sheetItem = sheetItemDao.getObject(siArr[i]);
				sheetItem.code = Integer.MIN_VALUE;
				sheetItem.modify_time = Long.MIN_VALUE;
				sheetItem.userGen = getUserProfile().userName;
				sheetItem.dateEdit = new Date();
				sheetItem.sheetRef.code = newSheetCode;

				sheetItemDao.add(sheetItem);
			}

			return newSheetCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public int getVoltageClassCodeByVoltageNominalCode(int voltageNominalCode) {
		try {
			InspectionSheetLogic inspectionSheetLogic = new InspectionSheetLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return inspectionSheetLogic.getVoltageClassCodeByVoltageNominalCode(voltageNominalCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't getVoltageClassCodeByVoltageNominalCode", e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENInspectionSheet