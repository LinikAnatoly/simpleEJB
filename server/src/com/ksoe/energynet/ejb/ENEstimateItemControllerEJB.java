//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENEstimateItem;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENElement2EstimateItemDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENMarkEstimateDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENOtherObjectDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.ejb.generated.ENEstimateItemControllerEJBGen;
import com.ksoe.energynet.logic.AVRLogic;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElement2EstimateItem;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemData;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENMark;
import com.ksoe.energynet.valueobject.ENMarkEstimate;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.ENOtherObject;
import com.ksoe.energynet.valueobject.ENOtherObjectType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServices2Plan;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENElement2EstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENMarkEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENOtherObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.ENElement2EstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemWriteOffShortList;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.dataminer.TmaterialDAO;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.valueobject.brief.TmaterialShort;
import com.ksoe.fin.valueobject.filter.TmaterialFilter;
import com.ksoe.fin.valueobject.lists.TmaterialShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.filter.RQOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderItem2ENEstimateItemFilter;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.logic.MaterialsLogic;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKTechCard;

public class ENEstimateItemControllerEJB extends ENEstimateItemControllerEJBGen {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public ENEstimateItemControllerEJB() {
    }

    /*
    * public String getEstimateStateInfo(int estimateCode) { try {
    * EstimateLogic logic = new
    * EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    * return logic.getEstimateStateByCurrent(estimateCode); } catch
    * (DatasourceConnectException e) {throw new EnergyproSystemException("Can't
    * connect to DB",e);} catch (PersistenceException e) {throw new
    * EnergyproSystemException(e.getMessage(),e);} finally {closeConnection();} }
    */

    public ENEstimateItem getParentByMovedType(int estimateCode, int movedType) {
        try {
            EstimateLogic logic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            return logic.getParentByMovedType(estimateCode, movedType);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't connect to DB", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENEstimateItem getEstimateFromCurrentPlanByEstimateCode(
            int estimateCode) {
        ENEstimateItem out = new ENEstimateItem();
        out.code = Integer.MIN_VALUE;
        try {
            EstimateLogic logic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            out = logic.getEstimateFromCurrentPlanByEstimateCode(estimateCode);

            // типа в связках(Ест2Ест) ниче нету (пока у метрологии) + кривые
            // АВРы
            if (out.code == Integer.MIN_VALUE) {
                out = logic.getEstimateFromCurrentPlanByPlans(estimateCode);
            }

            return out;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't connect to DB", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /**
     * Метод возвращает список кодов эстимейтов из родительского месячного плана с таким же кодом материала, что и заданный эстимейт
     *
     * @param estimateCode - код эстимейта из Задания-Факта (или Задания-Плана)
     *
     * @return список кодов эстимейтов, разделенных запятой
     */
    public String getEstimateCodesFromCurrentPlan(int estimateCode)
    {
    	//String out = "-1";
    	String out = "";

        try {
            ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateCode);

            if (estimateItem == null) {
            	throw new SystemException("\n\nНе знайдено матеріал на плані! [estimateCode = " + estimateCode + "]");
            }

			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int currentPlanCode = planLogic.getParentCurrentPlanCode(estimateItem.planRef.code);

			if (currentPlanCode != Integer.MIN_VALUE) {

				ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
				estimateItemFilter.planRef.code = currentPlanCode;
				estimateItemFilter.materialRef.code = estimateItem.materialRef.code;
				estimateItemFilter.kindRef.code = estimateItem.kindRef.code;

				int[] estArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

				if (estArr.length > 0) {
					out = Tools.intArrayToStr(estArr, ",");
				}
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't connect to DB", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}

        return out;
    }

    public void transformEstimate(int estimateItemCode, ENEstimateItem newEstimate) {
        try {
            EstimateLogic logic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            PlanWorkLogic pLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = pLogic.getPlanCodeByEstimateItemCode(estimateItemCode);

            if (plan.kind.code != ENPlanWorkKind.YEAR && plan.kind.code != ENPlanWorkKind.CURRENT)
            {
                throw new SystemException("\n\nЗмінювати матеріали можливо тільки на Річних та Місячних планах!");
            }

            /** не дадим менять на уже утвержденных планах */
            if (plan.status.code == ENPlanWorkStatus.LOCKED)
            {
                throw new SystemException("На затверджених планах неможна змінювати матеріали");
            }

             logic.transformEstimate(estimateItemCode, newEstimate);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't transformEstimate {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    public int changeStatus(int estimateItemCode, int statusCode) {
        try {
            EstimateLogic logic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            // logic.getEstimateCountByCurrent(estimateItemCode);

            // SUPP-25681 - при добавлении материала со статусом "непотрібно замовляти " возникал Null pointer ниже при выборе плана
            if (statusCode == Integer.MIN_VALUE)
                return statusCode;

            PlanWorkLogic pLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = pLogic.getPlanCodeByEstimateItemCode(estimateItemCode);

            if (plan.kind.code != ENPlanWorkKind.YEAR && plan.kind.code != ENPlanWorkKind.CURRENT)
            {
                throw new SystemException("\n\nИзменять статусы материалов можно только на Годовых и Месячных планах!");
            }

            /** не дадим менять статус на уже утвержденных планах */
            if (plan.kind.code == ENPlanWorkKind.YEAR && plan.status.code == ENPlanWorkStatus.LOCKED)
            {
                throw new SystemException("На годовых утвержденных планах нельзя менять статус материалов");
            }

            return logic.changeStatus(estimateItemCode, statusCode);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    public ENEstimateItemShortList getDetailedEstimateList(
            ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getDetailedEstimateList(eFilter, pFilter);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't getDetailedEstimateList",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENEstimateItemShortList getDetailedEstimateListForTender(
            ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter,
            RQOrderFilter orderFilter, boolean includePlanned,
            boolean includeOrdered, boolean includePresent) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO
                    .getDetailedEstimateListForTender(eFilter, pFilter,
                            orderFilter, includePlanned, includeOrdered,
                            includePresent);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't getDetailedEstimateListForTender", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int addBySRS(ENEstimateItem object) {
        return add(object);
    }

    public int addBySVES(ENEstimateItem object) {
        return add(object);
    }

    public int addBySPS(ENEstimateItem object) {
        return add(object);
    }

    public int addByByt(ENEstimateItem object) {
        return add(object);
    }

    public int addByProm(ENEstimateItem object) {
        return add(object);
    }

    public void saveBySRS(ENEstimateItem object) {
        save(object);
    }

    public void saveBySVES(ENEstimateItem object) {
        save(object);
    }

    public void saveBySPS(ENEstimateItem object) {
        save(object);
    }

    public void saveByByt(ENEstimateItem object) {
        save(object);
    }

    public void saveByProm(ENEstimateItem object) {
        save(object);
    }

    public void removeBySRS(int code) {
        remove(code);
    }

    public void removeBySVES(int code) {
        remove(code);
    }

    public void removeBySPS(int code) {
        remove(code);
    }

    public void removeByByt(int code) {
        remove(code);
    }

    public void removeByProm(int code) {
        remove(code);
    }

    public int addInClosedPlan(ENEstimateItem object) {
        try {
            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

            AuthLogic l = new AuthLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (!l.checkPermission4PlanItems(plan)) {
                throw new EnergyproSystemException(
                        "Acces denied for method addBy... from method ENEstimateItem.add()");
            }

            if (plan.typeRef.code == ENPlanWorkType.WRITINGS)
                throw new EnergyproSystemException(
                        "На цей план матеріали не додаються ...");

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            if (object.planItemRef != null) {
                if (object.planItemRef.code == Integer.MIN_VALUE) {
                    object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
                } else {
                    object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                }
            } else {
                object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
            }

            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLAN) {
                ElementLogic elementLogic = new ElementLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                int eType = elementLogic.getElementTypeByPlan(plan);
                /*
                * if (eType == ENElementType.TRANSPORT) { throw new
                * EnergyproSystemException("Заборонено додавати на план
                * матеріали, не прив'язані до робіт!"); }
                */

                // AS 24.05.2011 пожедание ВС запрет добавлять мат-лы без работ
                // if ( object.planItemRef.code == Integer.MIN_VALUE ){
                if ((eType != ENElementType.WRITING_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_OBJECT)) {
                    throw new EnergyproSystemException(
                            "Заборонено додавати на план матеріали, не прив'язані до робіт !");
                }
                // }
            }

            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? там
                                                                    // же
                                                                    // сохранение
                                                                    // ...

            // if (object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_OE &&
            // object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_REM)
            // if (object.statusRef.code != ENEstimateItemStatus.PRESENT)

            // /// 02.03.12 При добавлении материала в закрытый план будем
            // ставить ему статус "Непотрібно замовляти"
            // *** object.statusRef.code = ENEstimateItemStatus.PRESENT;
            object.statusRef.code = ENEstimateItemStatus.UNUSED;
            // ///

            int code = objectDAO.add(object);

            /////
            // 19.03.15 NET-4440 Создаем запись в истории ГСМ по плану
            if (eLogic.isFuel(code))
            {
            	logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
            }
            /////

            return code;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void removeUnmountForWriteOff_MBP_MNMA(int estimateItemCode) {
        removeUnmount(estimateItemCode);
    }

    public void removeUnmount(int estimateItemCode) {

        Connection enConn = null;

        try {

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            // выносим из связки данные
            ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                    enConn, getUserProfile());
            ENEstimateItem2ENEstimateItemFilter est2estFilter = new ENEstimateItem2ENEstimateItemFilter();
            est2estFilter.estimateItemOutRef.code = estimateItemCode;
            est2estFilter.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
            int[] est2estArr = est2estDAO.getFilteredCodeArray(est2estFilter,
                    0, -1);
            for (int e = 0; e < est2estArr.length; e++) {

                // ENEstimateItem2ENEstimateItem estObject =
                // est2estDAO.getObject(est2estArr[e]);
                est2estDAO.remove(est2estArr[e]);

            }

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            // выносим ВСЕ что есть ...
            // finFilter.statusRef.code = FINMaterialsStatus.GOOD;

            finFilter.estimateItemRef.code = estimateItemCode;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);
            for (int i = 0; i < finArr.length; i++) {
                finMaterialsDAO.remove(finArr[i]);
            }

            // вынесем обьекты Демонтажа ;)
            ENElement2EstimateItemFilter el2eFilter = new ENElement2EstimateItemFilter();
            el2eFilter.estimateItemRef.code = estimateItemCode;
            ENElement2EstimateItemDAO el2eDAO = new ENElement2EstimateItemDAO(
                    enConn, getUserProfile());
            ENElement2EstimateItemShortList el2eList = el2eDAO
                    .getScrollableFilteredList(el2eFilter, 0, -1);
            for (int i = 0; i < el2eList.totalCount; i++) {
                // !!!!!!!!!!!!!
                // вначале вынесенем !! связку НЕ ЮЗАТЬ !!!!
                el2eDAO.remove(el2eList.get(i).code);

                if (el2eList.get(i).elementTypeRefCode == ENElementType.EQUIPMENT_REPAIR_OBJECTS) {
                    ENOtherObjectFilter objFilter = new ENOtherObjectFilter();
                    ENOtherObjectDAO objDAO = new ENOtherObjectDAO(enConn,
                            getUserProfile());
                    objFilter.element.code = el2eList.get(i).elementRefCode;
                    objFilter.typeRef.code = ENOtherObjectType.EQUIPMENT_REPAIR;
                    int[] objArr = objDAO
                            .getFilteredCodeArray(objFilter, 0, -1);
                    if (objArr.length != 1) {
                        throw new EnergyproSystemException(
                                "На один елемент знайдено не один ("
                                        + objArr.length
                                        + ") Обьект для Ремонту ... код елемента "
                                        + el2eList.get(i).elementRefCode);
                    }
                    objDAO.remove(objArr[0]);
                }
            }

            this.remove(estimateItemCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public void removeProduced4Services(int estimateItemCode) {
        this.removeProduced(estimateItemCode);
    }

    public void removeProduced(int estimateItemCode) {
        Connection enConn = null;

        try {

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            // выносим ВСЕ что есть ...
            // finFilter.statusRef.code = FINMaterialsStatus.GOOD;

            finFilter.estimateItemRef.code = estimateItemCode;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);
            for (int i = 0; i < finArr.length; i++) {
                finMaterialsDAO.remove(finArr[i]);
            }

            this.remove(estimateItemCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    public void removeRefinement(int estimateItemCode) {

        Connection enConn = null;

        try {

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            // выносим ВСЕ что есть ...
            // finFilter.statusRef.code = FINMaterialsStatus.GOOD;

            finFilter.estimateItemRef.code = estimateItemCode;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);
            for (int i = 0; i < finArr.length; i++) {
                finMaterialsDAO.remove(finArr[i]);
            }

            this.remove(estimateItemCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public void saveUnmountForWriteOff_MBP_MNMA(ENEstimateItem object,
            int nomenclatureCode, String nn,
            String account) {
        saveUnmount(object, nomenclatureCode, nn, account);
    }

    public void saveUnmount(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            String account) {

        Connection enConn = null;
        Connection finConn = null;

        try {

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            for (int i = 0; i < finArr.length; i++) {
                    finMaterialsDAO.remove(finArr[i]);
            }

            ENElement2EstimateItemFilter el2eFilter = new ENElement2EstimateItemFilter();
            el2eFilter.estimateItemRef.code = object.code;
            ENElement2EstimateItemDAO el2eDAO = new ENElement2EstimateItemDAO(
                    enConn, getUserProfile());
            ENElement2EstimateItemShortList el2eList = el2eDAO
                    .getScrollableFilteredList(el2eFilter, 0, -1);
            for (int j = 0; j < el2eList.totalCount; j++) {
                // !!!!!!!!!!!!!
                // вначале вынесенем !! связку НЕ ЮЗАТЬ !!!!
                el2eDAO.remove(el2eList.get(j).code);

                if (el2eList.get(j).elementTypeRefCode == ENElementType.EQUIPMENT_REPAIR_OBJECTS) {
                    ENOtherObjectFilter objFilter = new ENOtherObjectFilter();
                    ENOtherObjectDAO objDAO = new ENOtherObjectDAO(
                            enConn, getUserProfile());
                    objFilter.element.code = el2eList.get(j).elementRefCode;
                    objFilter.typeRef.code = ENOtherObjectType.EQUIPMENT_REPAIR;
                    int[] objArr = objDAO.getFilteredCodeArray(
                            objFilter, 0, -1);
                    if (objArr.length != 1) {
                        throw new EnergyproSystemException(
                                "На один елемент знайдено не один ("
                                        + objArr.length
                                        + ") Обьект для Ремонту ... код елемента "
                                        + el2eList.get(j).elementRefCode);
                    }
                    objDAO.remove(objArr[0]);
                }
            }

            ENPlanWorkDAO planDao = new ENPlanWorkDAO(enConn, getUserProfile());

            ENPlanWork plan = planDao.getObject(object.planRef.code);

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                //throw new EnergyproSystemException(
                //        "Видаліть та заведіть заново з НОВИМ номенклатурним номером ...");
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

				// проверим, сходятся ли единицы измерения ...
				TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
				TKMaterials mat = matDAO.getObject(object.materialRef.code);

				if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
				    throw new EnergyproSystemException(
				            "Не співпадають одиниці виміру ... '"
				                    + mat.measurement.name + "' та '"
				                    + m.mesure_unitText + "'");
				}

                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic
                        .getWorkOrderByEstimateItemCode(object.code);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }

                if (frcData.finCFOCode == null || frcData.finCFOCode.length() == 0)
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Демонтаж";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                if(object.price == null)
                	throw new EnergyproSystemException("Введіть ціну демонтованого матеріалу");

                fm.price = object.price;
                fm.calc_price = object.price;
                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                checkAccountUnmount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = object.code;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }
            
            this.save(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            /*
            * try { if (finConn != null && ! finConn.isClosed()) {
            * finConn.close(); finConn = null; } } catch (SQLException e) { }
            */
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    public void saveProduced(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            String account,
            String divCode4Order,
            String divName4Order) {
        // Connection finConn = null;
        Connection enConn = null;
        Connection finConn = null;

        try {

        	if (divCode4Order == "")
        	{throw new EnergyproSystemException("Не введено МОЛа для оприбуткування виготовлених матеріалів!");}

            this.save(object);

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            /* Удалим привязку к материалам Фин. коллекции если таковые нашлись */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "Помилка у кількості виготовлених матеріалів, код матеріалу: "
                                    + object.code);

                finMaterialsDAO.remove(finArr[0]);
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // проверим сходяься ли еденицы измерения ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру ... '"
                                    + mat.measurement.name + "' та '"
                                    + m.mesure_unitText + "'");
                }

                /* Проверка единицы измерения работ */
                ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(enConn,
                        getUserProfile());
                ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
                piFilter.planRef.code = plan.code;
                piFilter.conditionSQL = "COUNTGEN <> 0";

                ENPlanWorkItemShortList piList = piDAO
                        .getScrollableFilteredList(piFilter,
                                piFilter.conditionSQL, 0, -1);

                if (piList.totalCount == 0)
                    throw new EnergyproSystemException(
                            "На плані немає неонулених робіт, невідомо що виготовляють");

                TKTechCardDAO tcDAO = new TKTechCardDAO(enConn,
                        getUserProfile());

                for (int i = 0; i < piList.totalCount; i++) {
                    TKTechCard tcObj = tcDAO
                            .getObject(piList.get(i).kartaRefCode);

                    if (tcObj.measurement.code != mat.measurement.code)
                        throw new EnergyproSystemException(
                                "Не співпадають одиниці виміру на роботі "
                                        + tcObj.name + " ("
                                        + tcObj.measurement.name
                                        + ") та виготовленого матеріалу "
                                        + mat.name + " ("
                                        + mat.measurement.name + ")");

                }

                // проверка на полное совпадение наименований...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають назви ... '"
                                    + mat.name.trim().toUpperCase() + "' та '"
                                    + m.name.trim().toUpperCase() + "'");
                }

                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic
                        .getWorkOrderByEstimateItemCode(object.code);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = divCode4Order; //  molList.get(0).finMolCode;
                fm.div_name = divName4Order; // molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                /* 28.07.16 frcData ниже нигде не используется!
                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }
				*/

                fm.frc_code = 27;
                fm.frc_name = "Виготовлення";
                fm.budget_core_id = 52;

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Виготовлена продукція";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                /*SUPP-8756*/if(m.cost == null) m.cost = new BigDecimal(0);

                fm.price = m.cost;
                fm.calc_price = m.cost;
                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                checkAccount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = object.code;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public void saveProduced4Services(ENEstimateItem object,
            int nomenclatureCode, String nn,
            String account) {

        Connection enConn = null;
        Connection finConn = null;

        try {

            this.save(object);

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            /* Удалим привязку к материалам Фин. коллекции если таковые нашлись */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "Помилка у кількості виготовлених матеріалів, код матеріалу: "
                                    + object.code);

                finMaterialsDAO.remove(finArr[0]);
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // проверим сходяься ли еденицы измерения ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру ... '"
                                    + mat.measurement.name + "' та '"
                                    + m.mesure_unitText + "'");
                }

                // проверка на полное совпадение наименований...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають назви ... '"
                                    + mat.name.trim().toUpperCase() + "' та '"
                                    + m.name.trim().toUpperCase() + "'");
                }

                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic
                        .getWorkOrderByEstimateItemCode(object.code);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Виготовлена продукція";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                fm.price = m.cost;
                fm.calc_price = m.cost;
                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                checkAccount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = object.code;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }
    
    public void saveRefinement(ENEstimateItem object,
    		int nomenclatureCode, String nn, String account) {
    	this.saveRefinement(object, nomenclatureCode, nn, account, null);
    }

    public void saveRefinement(ENEstimateItem object,
    		int nomenclatureCode, String nn, String account, String molCode) {
        Connection finConn = null;
        Connection enConn = null;

        try {

            this.save(object);

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            ENMolDAO molDao = new ENMolDAO(enConn, getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            /* Удалим привязку к материалам Фин. коллекции если таковые нашлись */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "Помилка у кількості виготовлених матеріалів, код матеріалу: "
                                    + object.code);

                finMaterialsDAO.remove(finArr[0]);
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // проверим сходяься ли еденицы измерения ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру ... '"
                                    + mat.measurement.name + "' та '"
                                    + m.mesure_unitText + "'");
                }

                /* Проверка единицы измерения работ */
                ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(enConn,
                        getUserProfile());
                ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
                piFilter.planRef.code = plan.code;
                piFilter.conditionSQL = "COUNTGEN <> 0";

                ENPlanWorkItemShortList piList = piDAO
                        .getScrollableFilteredList(piFilter,
                                piFilter.conditionSQL, 0, -1);

                if (piList.totalCount == 0)
                    throw new EnergyproSystemException(
                            "На плані немає неонулених робіт, невідомо що доробляють");

                // проверка на полное совпадение наименований...
                // if ( !
                // mat.name.trim().toUpperCase().equals(m.name.trim().toUpperCase())){
                // throw new EnergyproSystemException("Не співпадають назви ...
                // '"+mat.name.trim().toUpperCase()+"' та '" +
                // m.name.trim().toUpperCase() + "'");
                // }

                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic
                        .getWorkOrderByEstimateItemCode(object.code);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }
                
                ENMol recipient = (molCode != null && molCode.trim().length() > 0) ? molDao.getMolByFinCode(molCode.trim()) 
                		:  molDao.getMolByFinCode(molList.get(0).finMolCode);
                if(recipient == null) {
                	throw new SystemException(String.format("\n\nНе знайдено МВО за кодом \"%s\" у довіднику матеріально-відповідальних осіб програми \"EnergyNet\"\n\n"
                			, ((molCode != null && molCode.trim().length() > 0) ? molCode.trim() : molList.get(0).finMolCode))
                			);
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = recipient.finCode;
                fm.div_name = recipient.name;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = molList.get(0).finMolCode;
                fm.partner_name = molList.get(0).finMolName;
                
                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Виготовлена продукція";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                if (m.cost != null) {
	                fm.price = m.cost;
	                fm.calc_price = m.cost;
	                fm.quantity = object.countFact;
	                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
	                        BigDecimal.ROUND_HALF_UP);
                }
                else {
                	BigDecimal costIN = object.cost;

	                fm.price = costIN.divide(object.countFact, 3,
	                        BigDecimal.ROUND_HALF_UP);
	                fm.calc_price = costIN.divide(object.countFact, 3,
	                        BigDecimal.ROUND_HALF_UP);
	                fm.quantity = object.countFact;
	                fm.cost = costIN; // fm.calc_price.multiply(fm.quantity).setScale(2,
	                                    // BigDecimal.ROUND_HALF_UP);
                }

                checkAccount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = object.code;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            /*
            * try { if (finConn != null && ! finConn.isClosed()) {
            * finConn.close(); finConn = null; } } catch (SQLException e) { }
            */
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    public int addUnmount(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            int isCreateObject, String account) {
        return addUnmount(object, nomenclatureCode, nn, isCreateObject,
                Integer.MIN_VALUE, account);
    }

    public int addUnmount(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            int isCreateObject, int finMaterialParentCode, String account) {
    	return addUnmount(object, nomenclatureCode, nn,
                isCreateObject, finMaterialParentCode, account, false);
    }

    public int addUnmount(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            int isCreateObject, int finMaterialParentCode, String account,
            boolean writingTransformers) {

        Connection finConn = null;
        Connection enConn = null;

        try {

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);


            /** 17.09.2014... +++  при списании трансформаторов домонтированные
             *  материалы добавляются в момент привязки из остатков...
             *  это могут делать и в Задании-Плане...
             */
            if (!writingTransformers) {
                if (plan.kind.code != ENPlanWorkKind.FACT) {
                    throw new EnergyproSystemException(
                            "Демонтовані матеріали додаються на Факті ...");
                }
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                int out = this.add(object);
                return out;
                // !!! ниже еще раз добавляется Естимэйт !!!
            }

            TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
            TmaterialFilter nnFilter = new TmaterialFilter();
            nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
            nnFilter.id = nomenclatureCode;
            nnFilter.nn = nn;

            TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                    nnFilter, 0, -1);
            if (nnList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "Номенклатура не знайдена ... код " + nomenclatureCode);
            }

            TmaterialShort m = nnList.get(0);

            // проверим сходяься ли еденицы измерения ....
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                throw new EnergyproSystemException(
                        "Не співпадають одиниці виміру ... '"
                                + mat.measurement.name + "' та '"
                                + m.mesure_unitText + "'");
            }

            //SUPP-rrrrr

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterials fm = new FINMaterials();

            fm.nn = m.nn;
            fm.mat_name = m.name;
            fm.mat_id = m.id;

            WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                    getUserProfile());

            ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(object.planRef.code);
            FINMolDataDAO molDAO = new FINMolDataDAO(enConn, getUserProfile());
            FINMolDataFilter molFilter = new FINMolDataFilter();
            molFilter.workOrder.code = wo.code;
            molFilter.molTypeRef.code = FINMolType.MASTER;
            FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                    molFilter, 0, -1);
            if (molList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "Не введено майстра на Наряд-завданні ...");
            }

            fm.molDataRef.code = molList.get(0).code;
            fm.div_code = molList.get(0).finMolCode;
            fm.div_name = molList.get(0).finMolName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "net.Оперативный запас";

            fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // загальне
            fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                + plan.budgetRef.code);
            }

            if (frcData.finCFOCode == null || frcData.finCFOCode.length() == 0)
                throw new EnergyproSystemException(
                        "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                + plan.budgetRef.code);

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;
            fm.ax_frc_code = String.format("%02d", fm.frc_code);

            // ??? непонятно как себя поведет потом эта скрутка ....
            // fm.molDataRef.code = molList.get(0).code;
            fm.doc_date = wo.dateGen;
            fm.doc_num = wo.workOrderNumber;

            fm.partner = fm.div_code;
            fm.partner_name = fm.div_name;

            // типа нарисуем при проведении ...
            fm.party_id = 1000;
            fm.party_discription = "Демонтаж";

            // как бы ОЧЕНЬ левый ... обходим нот налл ;)
            fm.finDocItemCode = 0;

            fm.mu_id = m.mesure_unitId;
            fm.mu_name = m.mesure_unitText;

            if(object.price == null)
            	throw new EnergyproSystemException("Введіть ціну демонтованого матеріалу");

            // будем брать цену с EstimateItem'а, а не со справочника
            fm.price = object.price; // m.cost;
            fm.calc_price = object.price; // m.cost;
            fm.quantity = object.countFact;
            fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                    BigDecimal.ROUND_HALF_UP);

            // Если стоимость уезжает в 0, ставим копейку
            if (fm.cost.compareTo(new BigDecimal(0)) <= 0)
            {
            	fm.cost = new BigDecimal(0.01);
            }

            checkAccountUnmount(account);
            fm.bal_sch = account;

            // /// 05.12.11 Добавление связи демонтированного материала с
            // основным списываемым при списании МБП или МНМА
            if (finMaterialParentCode != Integer.MIN_VALUE) {
                fm.parentRef.code = finMaterialParentCode;
            }
            // ///
            
            int out = this.add(object);

            fm.estimateItemRef.code = out;
            fm.statusRef.code = FINMaterialsStatus.GOOD;
            finMaterialsDAO.add(fm);

            // создаем ОБЬЕКТЫ ... типа Обладнанняу У ремонті
            // для ТРАНСПОРТА ...
            if (isCreateObject == 1) {
                // ElementLogic elementLogic = new ElementLogic(enConn,
                // getUserProfile());
                ENElementDAO elementDAO = new ENElementDAO(enConn,
                        getUserProfile());
                // int eType =
                // elementLogic.getElementTypeByCode(plan.elementRef.code);
                // if (eType == ENElementType.TRANSPORT)
                {
                    ENElementShort parentElement = elementDAO
                            .getShortObject(plan.elementRef.code);
                    ENElement element = new ENElement();
                    element.typeRef.code = ENElementType.EQUIPMENT_REPAIR_OBJECTS;
                    element.elementInRef.code = plan.elementRef.code;
                    element.renRef.code = parentElement.renRefCode;
                    elementDAO.add(element);

                    ENOtherObject obj = new ENOtherObject();
                    obj.element.code = element.code;
                    obj.typeRef.code = ENOtherObjectType.EQUIPMENT_REPAIR;
                    obj.buhName = fm.mat_name;
                    obj.invNumber = fm.nn;
                    obj.name = fm.mat_name + " від " + parentElement.objectName
                            + " (інв № " + parentElement.objectInvNumber + ")";
                    obj.commentGen = "демонтовано у наряді №"
                            + wo.workOrderNumber;
                    ENOtherObjectDAO ooDAO = new ENOtherObjectDAO(enConn,
                            getUserProfile());
                    ooDAO.add(obj);

                    ENElement2EstimateItem el2e = new ENElement2EstimateItem();
                    el2e.elementRef.code = element.code;
                    el2e.elementTypeRef.code = element.typeRef.code;
                    el2e.estimateItemRef.code = out;
                    new ENElement2EstimateItemDAO(enConn, getUserProfile())
                            .add(el2e);

                }
            }
            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public int addProduced(ENEstimateItem object,
    		int nomenclatureCode, String nn,
            String account,
            String divCode4Order,
            String divName4Order) {
        Connection finConn = null;
        Connection enConn = null;

        try {

        	if (divCode4Order == "")
        	{throw new EnergyproSystemException("Не введено МОЛа для оприбуткування виготовлених матеріалів!");}

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            /*
            * Проверка на добавление материалов вида изготовленный только на
            * планы с типом акта на изготовление
            */
            if (plan.stateRef.code != ENPlanWorkState.PRODUCTION)
                throw new EnergyproSystemException(
                        "Виготовлений матеріал можна додавати тільки для плану з типом акту \"Виготовлення\"");

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "Виготовлені матеріали додаються на Факті ...");
            }

            /*
            * if(nomenclatureCode == Integer.MIN_VALUE) throw new
            * EnergyproSystemException("Оберіть номенклатурний номер!");
            */

            /*
            * Проверка на то, что не существует еще материала вида Виготовлений
            * для этого плана
            */
            ENEstimateItemDAO esDAO = new ENEstimateItemDAO(enConn,
                    getUserProfile());
            ENEstimateItemFilter esFilter = new ENEstimateItemFilter();
            esFilter.planRef.code = plan.code;
            esFilter.kindRef.code = ENEstimateItemKind.PRODUCED;

            ENEstimateItemShortList esList = esDAO.getScrollableFilteredList(
                    esFilter, 0, -1);
            if (esList.totalCount > 0)
                throw new EnergyproSystemException(
                        "Виготовлений матеріал має бути одним для одного плану!");

            /* Материал естимейта */
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            /* Проверка единицы измерения работ */
            ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(enConn,
                    getUserProfile());
            ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
            piFilter.planRef.code = plan.code;
            piFilter.conditionSQL = "COUNTGEN <> 0";

            ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(
                    piFilter, piFilter.conditionSQL, 0, -1);

            if (piList.totalCount == 0)
                throw new EnergyproSystemException(
                        "На плані немає неонулених робіт, невідомо що виготовляють");

            TKTechCardDAO tcDAO = new TKTechCardDAO(enConn, getUserProfile());

            for (int i = 0; i < piList.totalCount; i++) {
                TKTechCard tcObj = tcDAO.getObject(piList.get(i).kartaRefCode);

                if (tcObj.measurement.code != mat.measurement.code)
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру на роботі "
                                    + tcObj.name + " ("
                                    + tcObj.measurement.name
                                    + ") та виготовленого матеріалу "
                                    + mat.name + " (" + mat.measurement.name
                                    + ")");

            }

            int out = this.add(object);

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                // Вытянем номенклатуру из ФК
                nnList = nnDAO.getScrollableFilteredList(nnFilter, null, null, 0, -1, null, true);

                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // проверим сходяься ли еденицы измерения ....

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру ... '"
                                    + mat.measurement.name + "' та '"
                                    + m.mesure_unitText + "'");
                }

                // проверка на полное совпадение наименований...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають назви ... '"
                                    + mat.name.trim().toUpperCase() + "' та '"
                                    + m.name.trim().toUpperCase() + "'");
                }

                FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                        getUserProfile());
                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic.getWorkOrderByEstimateItemCode(out);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = divCode4Order; //molList.get(0).finMolCode; // теперь будем ставить МОЛ для прихода с формы
                fm.div_name = divName4Order; //molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // загальне
                fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative

                /* 28.07.16 frcData ниже нигде не используется!
                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }
				*/

                /*
                * SUP-498 Задание от 03.09.2012 -- Внести ЦФО "Готовая
                * продукция" для СИТ и ЦПП. вся готовая продукция будет
                * приходоваться на указанное ЦФО
                */
                fm.frc_code = 27;
                fm.frc_name = "Виготовлення";
                fm.budget_core_id = 52;
                fm.ax_frc_code = String.format("%02d", fm.frc_code);

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Виготовлена продукція";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                /*SUPP-8756*/if(m.cost == null) m.cost = new BigDecimal(0);

                // будем брать цену с EstimateItem'а, а не со справочника
                fm.price = object.price; // m.cost;
                fm.calc_price = object.price; // m.cost;
                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                checkAccount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = out;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    public int addProduced4Services(ENEstimateItem object,
    		int nomenclatureCode, String nn,
    		String account) {
        Connection finConn = null;
        Connection enConn = null;

        try {

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            /*
            * Проверка на добавление материалов вида изготовленный только на
            * планы с типом акта на изготовление
            */
            if (plan.stateRef.code != ENPlanWorkState.WORK_IN_OUT)
                throw new EnergyproSystemException(
                        "Виготовлений матеріал для робіт на сторону можна додавати тільки для плану з типом акту \"Роботи на сторону\"");

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "Виготовлені матеріали додаються на Факті ...");
            }

            /* Материал естимейта */
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            int out = this.add(object);

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode != Integer.MIN_VALUE || ! nn.equals("")) {
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Номенклатура не знайдена ... код "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // проверим сходяься ли еденицы измерения ....

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають одиниці виміру ... '"
                                    + mat.measurement.name + "' та '"
                                    + m.mesure_unitText + "'");
                }

                // проверка на полное совпадение наименований...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "Не співпадають назви ... '"
                                    + mat.name.trim().toUpperCase() + "' та '"
                                    + m.name.trim().toUpperCase() + "'");
                }

                FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                        getUserProfile());
                FINMaterials fm = new FINMaterials();

                fm.nn = m.nn;
                fm.mat_name = m.name;
                fm.mat_id = m.id;

                WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                        getUserProfile());

                ENWorkOrder wo = woLogic.getWorkOrderByEstimateItemCode(out);
                FINMolDataDAO molDAO = new FINMolDataDAO(enConn,
                        getUserProfile());
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = wo.code;
                molFilter.molTypeRef.code = FINMolType.MASTER;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                        molFilter, 0, -1);
                if (molList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "Не введено майстра на наряді ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.Оперативный запас";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                    + plan.budgetRef.code);
                }

                /*
                * SUP-498 Задание от 03.09.2012 -- Внести ЦФО "Готовая
                * продукция" для СИТ и ЦПП. вся готовая продукция будет
                * приходоваться на указанное ЦФО
                */
                fm.frc_code = 27;
                fm.frc_name = "Виготовлення";
                fm.budget_core_id = 52;

                // ??? непонятно как себя поведет потом эта скрутка ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // типа нарисуем при проведении ...
                fm.party_id = 1000;
                fm.party_discription = "Виготовлена продукція";

                // как бы ОЧЕНЬ левый ... обходим нот налл ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                /*SUPP-8756*/if(m.cost == null) m.cost = new BigDecimal(0);

                // будем брать цену с EstimateItem'а, а не со справочника
                fm.price = object.price; // m.cost;
                fm.calc_price = object.price; // m.cost;

                fm.quantity = object.countFact;
                fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                        BigDecimal.ROUND_HALF_UP);

                checkAccount(account);
                fm.bal_sch = account;

                fm.estimateItemRef.code = out;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                finMaterialsDAO.add(fm);

            }

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    public int addRefinement(ENEstimateItem object
    		, int nomenclatureCode, String nn, String account) {
    	return this.addRefinement(object, nomenclatureCode, nn, account, null);
    }
    public int addRefinement(ENEstimateItem object
    		, int nomenclatureCode, String nn, String account, String molCode) {
        Connection finConn = null;
        Connection enConn = null;

        try {

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());
            FKOrderLogic orderLogic = new FKOrderLogic(getUserProfile(), enConn);

            Boolean uses_mdax_item = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_ITEM); // номенклатуры с аксапты

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            ENMolDAO molDao = new ENMolDAO(enConn, getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "Матеріали після доробки додаються на Факті ...");
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException("Вкажіть номенклатуру !!!");

            }

            /*
            * Проверка на добавление дорабатываемых материалов только на планы
            * с типом акта на изготовление
            */

            /* эксперимент с Договорами подряда*/
            if (plan.stateRef.code != ENPlanWorkState.REFINEMENT
                    && plan.stateRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT
                    && plan.stateRef.code != ENPlanWorkState.TMC_TRANSFER)
                throw new EnergyproSystemException(
                        "Дороблений матеріал можна додавати тільки для плану з типом акту \"Доробка\"");

            /*
            * Проверка на то, что не существует еще дорабатываемого материала
            * для этого плана
            */
            ENEstimateItemDAO esDAO = new ENEstimateItemDAO(enConn,
                    getUserProfile());
            ENEstimateItemFilter esFilter = new ENEstimateItemFilter();
            esFilter.planRef.code = plan.code;
            esFilter.kindRef.code = ENEstimateItemKind.REFINEMENT;

            ENEstimateItemShortList esList = esDAO.getScrollableFilteredList(
                    esFilter, 0, -1);
            if (esList.totalCount > 0)
                throw new EnergyproSystemException(
                        "На плані вже є одна строка матеріалу після доробки!");

            TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
            TmaterialFilter nnFilter = new TmaterialFilter();
            nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
            nnFilter.id = nomenclatureCode;
            nnFilter.nn = nn;

            TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                    nnFilter, 0, -1);
            if (nnList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "Номенклатура не знайдена або не активна ... код "
                                + nomenclatureCode);
            }

            TmaterialShort m = nnList.get(0);

            // проверим сходяься ли еденицы измерения ....
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                throw new EnergyproSystemException(
                        "Не співпадають одиниці виміру ... '"
                                + mat.measurement.name + "' та '"
                                + m.mesure_unitText + "'");
            }

            BigDecimal costIN = object.cost;

            int out = this.add(object);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterials fm = new FINMaterials();

            // соответствие поищем в ФК если номеклатуры выбераются из аксапты
            TmaterialShortList tmListFK = orderLogic.getTmaterialListByNN(nn, m.name, true);
            if (uses_mdax_item)        	{

        		if (tmListFK.totalCount == 0) {
        			throw new EnergyproSystemException(" Помилка при пошуку у ФК матеріалу що відповідає матеріалу  " + m.name + " " + m.nn);
        		}
        	}

            fm.nn = m.nn;
            fm.mat_name = m.name;
            fm.mat_id = m.id == Integer.MIN_VALUE ? tmListFK.get(0).id :  m.id;

            WorkOrderLogic woLogic = new WorkOrderLogic(enConn,
                    getUserProfile());

            ENWorkOrder wo = woLogic.getWorkOrderByEstimateItemCode(out);
            FINMolDataDAO molDAO = new FINMolDataDAO(enConn, getUserProfile());
            FINMolDataFilter molFilter = new FINMolDataFilter();
            molFilter.workOrder.code = wo.code;
            molFilter.molTypeRef.code = FINMolType.MASTER;
            FINMolDataShortList molList = molDAO.getScrollableFilteredList(
                    molFilter, 0, -1);
            if (molList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "Не введено майстра на наряді ...");
            }
            
            ENMol recipient = (molCode != null && molCode.trim().length() > 0) ? molDao.getMolByFinCode(molCode.trim()) 
            		:  molDao.getMolByFinCode(molList.get(0).finMolCode);
            if(recipient == null) {
            	throw new SystemException(String.format("\n\nНе знайдено МВО за кодом %s у довіднику матеріально-відповідальних осіб програми \"EnergyNet\"\n\n"
            			, ((molCode != null && molCode.trim().length() > 0) ? molCode.trim() : molList.get(0).finMolCode))
            			);
            }

            fm.molDataRef.code = molList.get(0).code;
            fm.div_code = recipient.finCode;
            fm.div_name = recipient.name;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "net.Оперативный запас";
            // назначение остатка для аксапты
            fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // загальне
            fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative


            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "ид ЦФО не найдено для бюджетодержателя с кодом = "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.ax_frc_code = String.format("%02d", fm.frc_code);
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // ??? непонятно как себя поведет потом эта скрутка ....
            // fm.molDataRef.code = molList.get(0).code;
            fm.doc_date = wo.dateGen;
            fm.doc_num = wo.workOrderNumber;

            fm.partner = molList.get(0).finMolCode;
            fm.partner_name = molList.get(0).finMolName;

            // типа нарисуем при проведении ...
            fm.party_id = 1001;
            fm.party_discription = "После доработки";

            // как бы ОЧЕНЬ левый ... обходим нот налл ;)
            fm.finDocItemCode = 0;

            fm.mu_id = m.mesure_unitId== Integer.MIN_VALUE ?  tmListFK.get(0).mesure_unitId : m.mesure_unitId;
            fm.mu_name = m.mesure_unitText;

            fm.price = costIN.divide(object.countFact, 3,
                    BigDecimal.ROUND_HALF_UP);
            fm.calc_price = costIN.divide(object.countFact, 3,
                    BigDecimal.ROUND_HALF_UP);
            fm.quantity = object.countFact;
            fm.cost = costIN; // fm.calc_price.multiply(fm.quantity).setScale(2,
                                // BigDecimal.ROUND_HALF_UP);

            checkAccount(account);
            fm.bal_sch = account;

            fm.estimateItemRef.code = out;
            fm.statusRef.code = FINMaterialsStatus.GOOD;
            finMaterialsDAO.add(fm);

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    /**
    * Метод для добавления материалов заказчика в месячный план по работам на
    * сторону
    *
    * @param object - нормативный материал (ENEstimateItem)
    * @param nomenclatureCode - код номенклатуры
    * @param nn - номенклатурный номер
    * @param account - счет
    *
    * @return код добавленного в план нормативного материала (ENEstimateItem'а)
    */
    public int addCustomerMaterial(ENEstimateItem object,
    		int nomenclatureCode, String nn,
    		String account) {
        Connection finConn = null;
        Connection enConn = null;

        try {

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(enConn, getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            if (plan.kind.code != ENPlanWorkKind.CURRENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Матеріали Замовника для оприбуткування додаються на Місячних планах!");
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Вкажіть номенклатуру !!!");
            }

            boolean isCustomerMaterials = false;
            boolean isContractOnDoingWorks = false;

            String contractNumber = null;
            Date contractDate = null;
            String partnerCode = null;
            String partnerName = null;

            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT) {
                ENElementDAO elementDAO = new ENElementDAO(enConn,
                        getUserProfile());
                ENElement element = elementDAO.getObject(plan.elementRef.code);

                if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {
                    ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
                    soFilter.element.code = element.code;

                    int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

                    if(soArr.length > 0) {
                        soFilter = new ENServicesObjectFilter();
                        soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
                        			+ " and sp1.%s = %s)", ENServices2Plan.tableName
                        			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
                        			, ENServicesObject.code_QFielld);
                        soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
                    }

                    if (soArr.length > 0) {
                        ENServicesObject so = soDAO.getObject(soArr[0]);

                        if (so != null) {
                            // ///
                            if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED) {
                                throw new EnergyproSystemException(
                                        "\n \n NET-3079 За договором вже проведено Акт приймання-передачі! \n "
                                                + "Додавати матеріали замовника заборонено (для цього потрібно спочатку відмінити Акт)!");
                            }
                            // ///

                            if (so.isCustomerMaterials == 1) {
                                isCustomerMaterials = true;
                            }

                            contractNumber = so.contractNumber;
                            contractDate = so.contractDate;
                            partnerCode = so.partnerCode;
                            partnerName = so.name;
                        }
                    }
                }
            }

            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();

            //15.04.2019
            soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
            			+ " and sp1.%s = %s)", ENServices2Plan.tableName
            			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
            			, ENServicesObject.code_QFielld);
            int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
            ENServicesObject so = null;

            if(soArr.length > 0) {
            	so = soDAO.getObject(soArr[0]);
            	isCustomerMaterials = so.isCustomerMaterials == 1;
            	isContractOnDoingWorks = true;
                contractNumber = so.contractNumber;
                contractDate = so.contractDate;
                partnerCode = so.partnerCode;
                partnerName = so.name;
            }

            if (!isCustomerMaterials) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Додавати матеріали замовника можливо тільки для планів послуг на сторону, які мають ознаку "
                                + "\"Роботи з використанням матеріалів Замовника\"!");
            }

            TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
            TmaterialFilter nnFilter = new TmaterialFilter();
            nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
            nnFilter.id = nomenclatureCode;
            nnFilter.nn = nn;

            TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                    nnFilter, 0, -1);
            if (nnList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатура не знайдена або не активна (код: "
                                + nomenclatureCode + ")!");
            }

            // /////////////////////////////////////////////////////////////////////////////////
            // Проверка на совпадение наименования и единицы измерения у норм.
            // материала в плане и у привязываемой к нему номенклатуры
            // (по аналогии с проверкой при проведении приходных ордеров)
            String nName = nnList.get(0).name.toUpperCase().trim();
            if (nName.length() > 255)
                nName = nName.substring(0, 255);

            String nUnit = nnList.get(0).mesure_unitText.toUpperCase().trim();

            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);
            String eName = mat.name.toUpperCase().trim();
            if (eName.length() > 255)
                eName = eName.substring(0, 255);

            String eUnit = mat.measurement.name.toUpperCase().trim();

            if (!nName.equals(eName)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатурна назва матеріалу ( "
                                + nName
                                + " ) не співпадає з назвою нормативного матеріала ( "
                                + eName
                                + " ). Змініть номенклатуру або заведіть нову!");
            }

            if (!nUnit.equals(eUnit)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатурна одиниця виміру матеріалу ( "
                                + nUnit
                                + " ) не співпадає з одиницею виміру нормативного матеріала ( "
                                + eUnit
                                + " ). Змініть номенклатуру або заведіть нову!");
            }
            // /////////////////////////////////////////////////////////////////////////////////

            // Статус всегда "Непотрібно замовляти"!
            object.statusRef.code = ENEstimateItemStatus.UNUSED;

            int out = this.add(object);

            TmaterialShort m = nnList.get(0);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterials fm = new FINMaterials();

            fm.nn = m.nn;
            fm.mat_name = m.name;
            fm.mat_id = m.id;

            ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(enConn,
                    getUserProfile());
            ENMOL2PlanWorkFilter mpFilter = new ENMOL2PlanWorkFilter();
            mpFilter.planRef.code = plan.code;
            ENMOL2PlanWorkShortList mpList = mpDAO.getScrollableFilteredList(
                    mpFilter, 0, -1);

            if (mpList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Вкажіть МВО для рознарядки на плані (на цю МВО буде оприбутковано матеріали замовника)!");
            }

            // fm.molDataRef.code = molList.get(0).code;
            fm.div_code = mpList.get(0).molCode;
            fm.div_name = mpList.get(0).molName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_TRANZIT; // RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "Транзит";

            if (plan.budgetRef == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Спочатку введіть бюджетотримача на плані!");
            }

            if (plan.budgetRef.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Спочатку введіть бюджетотримача на плані!");
            }

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Код ЦФВ не знайдено для бюджетотримача з кодом "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // fm.molDataRef.code = molList.get(0).code;

            // ///
            // Дата и номер документа нам пока неизвестны.
            // Они появятся позже (при проведении акта приема-передачи), их
            // должны будут где-то ввести.
            // Но т.к. эти поля в finmaterials нотналловские, надо туда что-то
            // запихнуть :)

            // fm.doc_date = wo.dateGen;
            // fm.doc_num = wo.workOrderNumber;

            if (contractNumber == null || contractDate == null
                    || partnerCode == null || partnerName == null
                    || contractNumber == "" || partnerCode == ""
                    || partnerName == "") {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Не введено договір з ФінКолекції для робіт на сторону!");
            }

            fm.doc_date = contractDate;
            fm.doc_num = contractNumber;
            // ///

            // fm.partner = fm.div_code;
            // fm.partner_name = fm.div_name;
            fm.partner = partnerCode;
            fm.partner_name = partnerName;

            // типа нарисуем при проведении ...
            fm.party_id = -1;
            fm.party_discription = "Материал Заказчика";

            // как бы ОЧЕНЬ левый ... обходим нот налл ;)
            fm.finDocItemCode = 0;

            fm.mu_id = m.mesure_unitId;
            fm.mu_name = m.mesure_unitText;

            fm.price = object.price;
            fm.calc_price = object.price;
            fm.quantity = object.countFact;
            fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                    BigDecimal.ROUND_HALF_UP);

            checkAccount(account);
            fm.bal_sch = account;

            fm.estimateItemRef.code = out;
            fm.statusRef.code = FINMaterialsStatus.GOOD;

            finMaterialsDAO.add(fm);

            if(isContractOnDoingWorks) {
            	servicesCalculatorLogic.evaluateSumsByENServicesCost(so);
            }

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Нет связи с ФинКоллекцией!", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    /**
    * Метод для редактирования материалов заказчика в месячном плане по работам
    * на сторону
    *
    * @param object - нормативный материал (ENEstimateItem)
    * @param nomenclatureCode - код номенклатуры
    * @param nn - номенклатурный номер
    *
    * @param account - счет
    */
    public void saveCustomerMaterial(ENEstimateItem object,
    		int nomenclatureCode, String nn,
    		String account) {
        Connection finConn = null;
        Connection enConn = null;

        try {
            // Статус всегда "Непотрібно замовляти"!
            object.statusRef.code = ENEstimateItemStatus.UNUSED;

            this.save(object);

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn,
                    getUserProfile());
            ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(enConn, getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            if (plan.kind.code != ENPlanWorkKind.CURRENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Ця функція використовується тільки для Місячних планів!");
            }

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            // Удалим привязку к материалам Фин. коллекции
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "\n \n NET-3079 Помилка у кількості прив''язаних матеріалів, код матеріалу: "
                                    + object.code);

                finMaterialsDAO.remove(finArr[0]);
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Вкажіть номенклатуру !!!");
            }

            boolean isCustomerMaterials = false;

            boolean isContractOnDoingWorks = false;

            String contractNumber = null;
            Date contractDate = null;
            String partnerCode = null;
            String partnerName = null;

            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT) {
                ENElementDAO elementDAO = new ENElementDAO(enConn,
                        getUserProfile());
                ENElement element = elementDAO.getObject(plan.elementRef.code);

                if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {
                    ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
                    soFilter.element.code = element.code;

                    int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

                    //15.04.2019
                    if(soArr.length == 0) {
                    	soFilter = new ENServicesObjectFilter();
                    	soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
                    			+ " and sp1.%s = %s)", ENServices2Plan.tableName
                    			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
                    			, ENServicesObject.code_QFielld);
                    	soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
                    }

                    if (soArr.length > 0) {
                        ENServicesObject so = soDAO.getObject(soArr[0]);

                        if (so != null) {
                            // ///
                            if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED) {
                                throw new EnergyproSystemException(
                                        "\n \n NET-3079 За договором вже проведено Акт приймання-передачі! \n "
                                                + "Редагувати матеріали замовника заборонено (для цього потрібно спочатку відмінити Акт)!");
                            }
                            // ///

                            if (so.isCustomerMaterials == 1) {
                                isCustomerMaterials = true;
                            }

                            contractNumber = so.contractNumber;
                            contractDate = so.contractDate;
                            partnerCode = so.partnerCode;
                            partnerName = so.name;
                        }
                    }
                }
            }

            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();

            //15.04.2019
            soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
            			+ " and sp1.%s = %s)", ENServices2Plan.tableName
            			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
            			, ENServicesObject.code_QFielld);
            int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
            ENServicesObject so = null;

            if(soArr.length > 0) {
            	so = soDAO.getObject(soArr[0]);
            	isCustomerMaterials = so.isCustomerMaterials == 1;
                contractNumber = so.contractNumber;
                contractDate = so.contractDate;
                partnerCode = so.partnerCode;
                partnerName = so.name;
                isContractOnDoingWorks = so.contractTypeRef.code == ENServicesContractType.SHIFT_LINES;
            }


            if (!isCustomerMaterials) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Редагування матеріалів замовника можливо тільки для планів послуг на сторону, які мають ознаку "
                                + "\"Роботи з використанням матеріалів Замовника\"!");
            }

            TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
            TmaterialFilter nnFilter = new TmaterialFilter();
            nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
            nnFilter.id = nomenclatureCode;
            nnFilter.nn = nn;

            TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                    nnFilter, 0, -1);
            if (nnList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатура не знайдена або не активна (код: "
                                + nomenclatureCode + ")!");
            }

            // /////////////////////////////////////////////////////////////////////////////////
            // Проверка на совпадение наименования и единицы измерения у норм.
            // материала в плане и у привязываемой к нему номенклатуры
            // (по аналогии с проверкой при проведении приходных ордеров)
            String nName = nnList.get(0).name.toUpperCase().trim();
            if (nName.length() > 255)
                nName = nName.substring(0, 255);

            String nUnit = nnList.get(0).mesure_unitText.toUpperCase().trim();

            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);
            String eName = mat.name.toUpperCase().trim();
            if (eName.length() > 255)
                eName = eName.substring(0, 255);

            String eUnit = mat.measurement.name.toUpperCase().trim();

            if (!nName.equals(eName)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатурна назва матеріалу ( "
                                + nName
                                + " ) не співпадає з назвою нормативного матеріала ( "
                                + eName
                                + " ). Змініть номенклатуру або заведіть нову!");
            }

            if (!nUnit.equals(eUnit)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Номенклатурна одиниця виміру матеріалу ( "
                                + nUnit
                                + " ) не співпадає з одиницею виміру нормативного матеріала ( "
                                + eUnit
                                + " ). Змініть номенклатуру або заведіть нову!");
            }
            // /////////////////////////////////////////////////////////////////////////////////

            TmaterialShort m = nnList.get(0);

            FINMaterials fm = new FINMaterials();

            fm.nn = m.nn;
            fm.mat_name = m.name;
            fm.mat_id = m.id;

            ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(enConn,
                    getUserProfile());
            ENMOL2PlanWorkFilter mpFilter = new ENMOL2PlanWorkFilter();
            mpFilter.planRef.code = plan.code;
            ENMOL2PlanWorkShortList mpList = mpDAO.getScrollableFilteredList(
                    mpFilter, 0, -1);

            if (mpList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Вкажіть МВО для рознарядки на плані (на цю МВО буде оприбутковано матеріали замовника)!");
            }

            // fm.molDataRef.code = molList.get(0).code;
            fm.div_code = mpList.get(0).molCode;
            fm.div_name = mpList.get(0).molName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_TRANZIT; // RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "Транзит";

            if (plan.budgetRef == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Спочатку введіть бюджетотримача на плані!");
            }

            if (plan.budgetRef.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Спочатку введіть бюджетотримача на плані!");
            }

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Код ЦФВ не знайдено для бюджетотримача з кодом "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // fm.molDataRef.code = molList.get(0).code;

            // ///
            // Дата и номер документа нам пока неизвестны.
            // Они появятся позже (при проведении акта приема-передачи), их
            // должны будут где-то ввести.
            // Но т.к. эти поля в finmaterials нотналловские, надо туда что-то
            // запихнуть :)

            // fm.doc_date = wo.dateGen;
            // fm.doc_num = wo.workOrderNumber;

            if (contractNumber == null || contractDate == null
                    || partnerCode == null || partnerName == null
                    || contractNumber == "" || partnerCode == ""
                    || partnerName == "") {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Не введено договір з ФінКолекції для робіт на сторону!");
            }

            fm.doc_date = contractDate;
            fm.doc_num = contractNumber;
            // ///

            // fm.partner = fm.div_code;
            // fm.partner_name = fm.div_name;
            fm.partner = partnerCode;
            fm.partner_name = partnerName;

            // типа нарисуем при проведении ...
            fm.party_id = 1001;
            fm.party_discription = "Материал Заказчика";

            // как бы ОЧЕНЬ левый ... обходим нот налл ;)
            fm.finDocItemCode = 0;

            fm.mu_id = m.mesure_unitId;
            fm.mu_name = m.mesure_unitText;

            fm.price = object.price;
            fm.calc_price = object.price;
            fm.quantity = object.countFact;
            fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                    BigDecimal.ROUND_HALF_UP);

            checkAccount(account);
            fm.bal_sch = account;

            fm.estimateItemRef.code = object.code;
            fm.statusRef.code = FINMaterialsStatus.GOOD;

            finMaterialsDAO.add(fm);

            if(isContractOnDoingWorks) {
            	servicesCalculatorLogic.evaluateSumsByENServicesCost(so);
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            /*
            * try { if (finConn != null && ! finConn.isClosed()) {
            * finConn.close(); finConn = null; } } catch (SQLException e) { }
            */
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    /**
    * Метод для удаления материалов заказчика в месячном плане по работам на
    * сторону
    *
    * @param estimateItemCode -
    *            код нормативного материала (ENEstimateItem)
    */
    public void removeCustomerMaterial(int estimateItemCode) {

        Connection enConn = null;

        try {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            // ///////////////////////////////////////////////////////////////////////////////////////////////////////////
            ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(enConn,
                    getUserProfile());

            ENEstimateItem object = eiDAO.getObject(estimateItemCode);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());
            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn,
                    getUserProfile());
            ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(enConn, getUserProfile());

            if (plan.kind.code != ENPlanWorkKind.CURRENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Ця функція використовується тільки для Місячних планів!");
            }

            boolean isCustomerMaterials = false;
            boolean isContractOnDoingWorks = false;

            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT) {
                ENElementDAO elementDAO = new ENElementDAO(enConn,
                        getUserProfile());
                ENElement element = elementDAO.getObject(plan.elementRef.code);

                if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {
                    ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
                    soFilter.element.code = element.code;

                    int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

                    //15.04.2019
                    if(soArr.length == 0) {
                    	soFilter = new ENServicesObjectFilter();
                    	soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
                    			+ " and sp1.%s = %s)", ENServices2Plan.tableName
                    			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
                    			, ENServicesObject.code_QFielld);
                    	soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
                    }

                    if (soArr.length > 0) {
                        ENServicesObject so = soDAO.getObject(soArr[0]);

                        if (so != null) {
                            // ///
                            if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED) {
                                throw new EnergyproSystemException(
                                        "\n \n NET-3079 За договором вже проведено Акт приймання-передачі! \n "
                                                + "Видаляти матеріали замовника заборонено (для цього потрібно спочатку відмінити Акт)!");
                            }
                            // ///

                            if (so.isCustomerMaterials == 1) {
                                isCustomerMaterials = true;
                            }

                        }
                    }
                }
            }

            //15.04.2019
            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL = String.format(" exists (select 1 from %s as sp1 where sp1.%s = ? "
            			+ " and sp1.%s = %s)", ENServices2Plan.tableName
            			, ENServices2Plan.planRef_Field, ENServices2Plan.servicesObjectRef_Field
            			, ENServicesObject.code_QFielld);
            int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1, new Vector<Object>(Arrays.asList(plan.code)));
            ENServicesObject so = null;

            if(soArr.length > 0) {
            	so = soDAO.getObject(soArr[0]);
            	isCustomerMaterials = so.isCustomerMaterials == 1;
            	isContractOnDoingWorks = so.contractTypeRef.code == ENServicesContractType.SHIFT_LINES;
            }

            if (!isCustomerMaterials) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Видалення матеріалів замовника можливо тільки для планів послуг на сторону, які мають ознаку "
                                + "\"Роботи з використанням матеріалів Замовника\"!");
            }
            // ///////////////////////////////////////////////////////////////////////////////////////////////////////////

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            // выносим ВСЕ что есть ...
            // finFilter.statusRef.code = FINMaterialsStatus.GOOD;

            finFilter.estimateItemRef.code = estimateItemCode;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);
            for (int i = 0; i < finArr.length; i++) {
                finMaterialsDAO.remove(finArr[i]);
            }

            this.remove(estimateItemCode);

            if(isContractOnDoingWorks) {
            	servicesCalculatorLogic.evaluateSumsByENServicesCost(so);
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Нет связи с базой данных!", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public void save4Refinement(ENEstimateItem object, int isMain4Refinement) {
        try {
            this.save(object);

            ENMarkEstimateDAO dao = new ENMarkEstimateDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            ENMarkEstimateFilter f = new ENMarkEstimateFilter();
            f.estimateItem.code = object.code;
            f.mark.code = ENMark.FOR_REFINEMENT;
            int[] arr = dao.getFilteredCodeArray(f, 0, -1);

            if (isMain4Refinement == 1) {
                if (arr.length == 0) {
                    ENMarkEstimate meObj = new ENMarkEstimate();
                    meObj.estimateItem.code = object.code;
                    meObj.mark.code = ENMark.FOR_REFINEMENT;
                    dao.add(meObj);
                }
            } else if (isMain4Refinement == 0) {
                for (int i = 0; i < arr.length; i++) {
                    dao.remove(arr[i]);
                }
            } else {
                throw new EnergyproSystemException(
                        "isMain4Refinement <> 1 or 0");
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("error on save4Refinement", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int add4Refinement(ENEstimateItem object) {
        try {
            int code = this.add(object);

            ENMarkEstimateDAO dao = new ENMarkEstimateDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            ENMarkEstimate meObj = new ENMarkEstimate();
            meObj.estimateItem.code = code;
            meObj.mark.code = ENMark.FOR_REFINEMENT;
            dao.add(meObj);

            return code;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("error on add4Refinement", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    @Override
	public int add(ENEstimateItem object) {
        try {

            if (object.planRef.code == Integer.MIN_VALUE) {
                new EnergyproSystemException("planRef not found");
            }

            PlanWorkLogic planLogic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            if ((plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP && plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)
                    || (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/ && plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)
                    || (plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA && plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)) {
                ENAct act = new ActLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile()).getActByPlanCode(plan.code, false);
                if (act != null) {
                    throw new EnergyproSystemException(
                            "Цей факт включено до Акту (№ "
                                    + act.numberGen
                                    + " ) ... видаляйте прив'язку до Акта!!! ...\n бо Ви друкуєте акт, а потім змінюєте його ;(");
                }
            }

            ElementLogic elementLogic = new ElementLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
  		  	ENElement e = elementLogic.getElementByCode(plan.elementRef.code);
  		  	int eType = e.typeRef.code; //elementLogic.getElementTypeByPlan(plan);


            AuthLogic authLogic = new AuthLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (!authLogic.checkPermission4PlanItems(plan)) {
                throw new EnergyproSystemException(
                        "Немає прав для редагування Планів на цьому об_єкті ...");
            }

            // Добавление системного материала EnergyNet - МУСОР
            if (object.materialRef.code == TKMaterials.SYSTEM_MATERIAL) {
                if (!authLogic.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "addSystemMaterial"))
                    throw new EnergyproSystemException(
                            "У вас немає прав додавати системний матеріал у план");

            }

            if (planLogic.isNotEditablePlan(plan)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + object.planRef.code);
            }

            /*
            * В.С. +++ 17.01.2013 +++ отрицательный срок поставки разрешен
            * толко для услуг
            */
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (object.accountingTypeRef.code != TKAccountingType.SERVICES_FROM_SIDE
                        && object.deliveryTime < 0) {
                    throw new EnergyproSystemException(
                            ""
                                    + "\n"
                                    + "\n Для матеріалів заборонено вказувати термін постачання з від’ємним значенням!!!");
                }
            }

            if (plan.typeRef.code == ENPlanWorkType.WRITINGS)
            // || plan.typeRef.code == ENPlanWorkType.RESTOCKING)
            {
                if ((plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MNMA
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_TMC)
                        || object.kindRef.code != ENEstimateItemKind.UNMOUNT) {
                    throw new EnergyproSystemException(
                            "На цей план матеріали не додаються ...");
                }
            }

            if (plan.kind.code == ENPlanWorkKind.CURRENT) {
                planLogic.validateMOLinPlan(plan.code);
            }

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            // NET-2888 Проверка прав на изменение сроков поставки
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (!authLogic.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "changeDeliveryTime")) {
                    throw new EnergyproSystemException(
                            "\n \n NET-2888 У Вас немає прав на зміну строків постачання матеріалів!");
                }
            }

            if (object.planItemRef != null) {
                if (object.planItemRef.code == Integer.MIN_VALUE) {
                    object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
                } else {
                	planLogic.checkIfManualMaterialsAddingAllowed(object);

                    object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                }
            } else {
                object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
            }

            // ///////////////////////////////////////////////////////////
            // Службе транспорта запрещаем добавлять материалы без привязки к
            // работам
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLAN) {

                /*
                * if (eType == ENElementType.TRANSPORT) { throw new
                * EnergyproSystemException("Заборонено додавати на план
                * матеріали, не прив'язані до робіт!"); }
                */

                // AS 24.05.2011 пожедание ВС запрет добавлять мат-лы без работ
                // if ( object.planItemRef.code == Integer.MIN_VALUE ){
                if ((eType != ENElementType.WRITING_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_OBJECT)
                        && (eType != ENElementType.NO_OBJECT_RESTOCKING)
                        && (eType != ENElementType.NO_OBJECT_AVR16)
                        && (eType != ENElementType.NO_OBJECT_AVZ)
                        && (eType != ENElementType.NO_OBJECT_COUNTERS_SERVICES)
                ) {

                    if ((plan.stateRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT)
                            && (plan.stateRef.code != ENPlanWorkState.REFINEMENT)
                            && (plan.stateRef.code != ENPlanWorkState.SALE_PRODUCTS)
                            && (plan.stateRef.code != ENPlanWorkState.GIFT)
                            && (plan.typeRef.code != ENPlanWorkType.ENPLANWORKTYPE_WRITEOFF_OS && (plan.stateRef.code != ENPlanWorkState.WRITINGS_OS) )
                    		) {
                        if (object.kindRef.code != ENEstimateItemKind.PRODUCED)
                        {
                        	boolean check = true;

                        	///// 02.06.16 NET-4530 Для снимаемых ПЛОМБ не проверяем
                        	if (object.kindRef.code == ENEstimateItemKind.UNMOUNT)
                        	{
                        		if (object.accountingTypeRef.code == TKAccountingType.SEAL ||
                        			object.accountingTypeRef.code == TKAccountingType.IMP ||
                        			object.accountingTypeRef.code == TKAccountingType.HOLO)
                        		{
                        			check = false;
                        		}
                        	}
                        	/////

                        	if (check)
	                            throw new EnergyproSystemException(
	                                    "Заборонено додавати на план матеріали, не прив'язані до робіт !");
                        }
                    }
                }
                // }
            }
            // ///////////////////////////////////////////////////////////

            // расчет стоимости !!! ФАКТИЧЕСКОЕ кол-во на цену с техкарты ...
            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? там
                                                                    // же
                                                                    // сохранение
                                                                    // ...

            // if (object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_OE &&
            // object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_REM)
            if ((object.statusRef.code != ENEstimateItemStatus.PRESENT)
                    && (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION)
                    && (object.statusRef.code != ENEstimateItemStatus.UNUSED)   // 02.03.12
                                                                                // Будут
                                                                                // добавлять
                                                                                // сразу
                                                                                // в
                                                                                // статусе
                                                                                // "Непотрібно
                                                                                // замовляти"
            		&& (object.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION)) // 24.11.14
            {
                object.statusRef.code = ENEstimateItemStatus.PLANNED;
            }

            if (object.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "Заборонено додавати на план матеріали зі статусом \"У наявності\"! \n"
                                + "Використовуйте статус \"Непотрібно замовляти\"!");
            }

            eLogic.checkInRQOrder(object, true, plan);

            eLogic.checkAddForMetrology(object);

            // тип мат-ла ... из ТК
            MaterialsLogic tkMatLogic = new MaterialsLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (object.accountingTypeRef == null) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }
            if (object.accountingTypeRef.code == Integer.MIN_VALUE) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }

            if (object.kindRef.code == ENEstimateItemKind.UNMOUNT) {
                object.statusRef.code = ENEstimateItemStatus.PRESENT;
            }

            /* SUPP-5077 */
            if (tkMatLogic.checkRootGroupOfMaterial(object.materialRef.code,
                    TKMaterials.SYSTEM_MATERIAL)) {
                throw new EnergyproSystemException(
                        "Матеріали з группи \""
                                + new TKMaterialsDAO(
                                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                        getUserProfile())
                                        .getObject(TKMaterials.SYSTEM_MATERIAL).name
                                + "\" заборонено використовувати у планах");
            }

            /* 12.05.2012 +++ для перевозки грузов, материал только из накладных */
            if (plan.typeRef.code == ENPlanWorkType.TRUCKING) {
                TKTechCardDAO kDAO = new TKTechCardDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());

                ENPlanWorkItem planItem = planItemDAO
                        .getObject(object.planItemRef.code);
                TKTechCard karta = kDAO.getObject(planItem.kartaRef.code);

                if (karta.code == TKTechCard.TRUCKING_CARGO) {
                    throw new EnergyproSystemException(
                            "\n \n Для перевезення вантажу матеріали додаються тільки з ордерів!!!");
                }
            }

            /* 05.12.2011 +++ для перевезень материал со статусом "У наявності" */
            if (plan.typeRef.code == ENPlanWorkType.TRUCKING
                    && object.kindRef.code == ENEstimateItemKind.MATERIALS) {
                object.statusRef.code = ENEstimateItemStatus.BY_TRUCKING;
            }

            /* 16.01.2012 +++ для услуг со стороны статус "матеріал ХОЕ" */
            if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                    || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST
                    || plan.typeRef.code == ENPlanWorkType.SALE_PRODUCTS) {
                if (object.kindRef.code == ENEstimateItemKind.MATERIALS) {
                    object.statusRef.code = ENEstimateItemStatus.KSOE;
                }
            } else {
                if (object.statusRef.code == Integer.MIN_VALUE) {
                    object.statusRef.code = ENEstimateItemStatus.PLANNED;
                }
            }

            if (object.statusRef.code == Integer.MIN_VALUE) {
                object.statusRef.code = ENEstimateItemStatus.PLANNED;
            }

            int code = objectDAO.add(object);

            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
            if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Только для Годовых и Месячных планов
            	if (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT)
            	{
	            	// Создаем план на изготовление
	            	planLogic.createPlanForCPP(object);
            	}
            	else
            	{
            		throw new EnergyproSystemException("\n\nNET-4415 Додавати матеріал зі статусом \"Власне виробництво\" можливо тільки " +
            				"на Річних та Місячних планах!");
            	}
            }
            ////////////////////////////////////////////////////////////////

            // 27.02.2013 NET-4212 если услуги на сторону и план не единичный то
            // ищем единичный план и инсертим естимейт еще под него
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        object.planItemRef.code);
            }

            // /////////////////////////

            // ---------------------------------

            // для АВР проверим месячный .. и накинем туда ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                if ((object.planItemRef == null)
                        || (object.planItemRef.code == Integer.MIN_VALUE)) {
                    throw new EnergyproSystemException(
                            "Матеріали без робіт не додаються ...");
                }

                AVRLogic avrLogic = new AVRLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                avrLogic.recalcCurrentAVRByEstimateItem(object, new BigDecimal(
                        0), false);

                /*
                * ENEstimateItem2ENEstimateItemDAO e2eDAO = new
                * ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                * getUserProfile());
                *
                * ENPlanWorkItem parentCurrentPlanItem =
                * logic.getParentCurrentPlanWorkItem(object.planItemRef.code);
                *
                * if (parentCurrentPlanItem.code == Integer.MIN_VALUE){
                *
                * ENPlanWorkItemDAO piDAO = new
                * ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                *
                * ENPlanWorkItem planItem =
                * piDAO.getObject(object.planItemRef.code);
                *
                * parentCurrentPlanItem.kartaRef.code = planItem.kartaRef.code;
                * parentCurrentPlanItem.countGen = planItem.countGen;
                * parentCurrentPlanItem.commentGen = "работа создана с
                * дочернего плана"; piDAO.add(parentCurrentPlanItem); }
                *  { //if (parentCurrentPlanItem.code > Integer.MIN_VALUE ){
                * ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
                * eFilter.planItemRef.code = parentCurrentPlanItem.code;
                * eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
                * eFilter.materialRef.code = object.materialRef.code; int[]
                * currentArr = objectDAO.getFilteredCodeArray(eFilter, 0, -1);
                * if (currentArr.length == 0){ ENEstimateItem currEstimate =
                * object; currEstimate.planRef.code =
                * parentCurrentPlanItem.planRef.code;
                * currEstimate.planItemRef.code = parentCurrentPlanItem.code;
                * objectDAO.add(currEstimate);
                *
                * ENEstimateItem2ENEstimateItem e2e = new
                * ENEstimateItem2ENEstimateItem(); e2e.estimateItemInRef.code =
                * currEstimate.code; e2e.estimateItemOutRef.code = code;
                * e2e.countGen = object.countFact; e2e.typeRef.code =
                * ENEstimateItem2Type.PLAN_MOVED; e2eDAO.add(e2e);
                *  } else { ENEstimateItem currEstimate =
                * objectDAO.getObject(currentArr[0]); currEstimate.countFact =
                * currEstimate.countFact.add(object.countFact);
                * objectDAO.save(currEstimate);
                *
                * ENEstimateItem2ENEstimateItem e2e = new
                * ENEstimateItem2ENEstimateItem(); e2e.estimateItemInRef.code =
                * currEstimate.code; e2e.estimateItemOutRef.code = object.code;
                * e2e.countGen = object.countFact; e2e.typeRef.code =
                * ENEstimateItem2Type.PLAN_MOVED; e2eDAO.add(e2e); }
                *  } //else //{ // месячный не найден ... выше создали его ..
                * //}
                *
                *
                */
            }

            // -------------------------------------------------------------------------------

            /////
            // 19.03.15 NET-4440 Создаем запись в истории ГСМ по плану
            if (eLogic.isFuel(code))
            {
            	planLogic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
            }
            /////

            return code;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



	public void save(ENEstimateItem object, String account) {
		try {

			ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			FINMaterialsDAO fmDao = new FINMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.cost = object.countFact.multiply(object.price).setScale(2, BigDecimal.ROUND_HALF_UP);

			estimateDAO.save(object);


			FINMaterialsFilter fmFilter = new FINMaterialsFilter();
			fmFilter.estimateItemRef.code = object.code;

			int fmArr[] = fmDao.getFilteredCodeArray(fmFilter, 0, -1);
			for (int i = 0; i < fmArr.length; i++) {
				FINMaterials finMaterials = fmDao.getObject(fmArr[i]);

				finMaterials.calc_price = object.price;
				finMaterials.price = object.price;
				finMaterials.cost = object.cost;
				finMaterials.bal_sch = account;

				fmDao.save(finMaterials);
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
	}



	@Override
	public void save(ENEstimateItem object) {
        try {

            if (object.planRef.code == Integer.MIN_VALUE) {
                new EnergyproSystemException("planRef not found");
            }

            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

            AuthLogic l = new AuthLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (!l.checkPermission4PlanItems(plan)) {
                throw new EnergyproSystemException(
                        "Access denied for method addBy... from method ENEstimateItem.add()");
            }

            // Добавление системного материала EnergyNet - МУСОР
            if (object.materialRef.code == TKMaterials.SYSTEM_MATERIAL) {
                if (!l.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "addSystemMaterial"))
                    throw new EnergyproSystemException(
                            "У вас немає прав додавати системний матеріал у план");

            }

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem oldObject = objectDAO.getObject(object.code);

            // NET-2888 Проверка прав на изменение сроков поставки
            if (object.deliveryTime != oldObject.deliveryTime) {
                if (!l.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "changeDeliveryTime")) {
                    throw new EnergyproSystemException(
                            "\n \n NET-2888 У Вас немає прав на зміну строків постачання матеріалів!");
                }
            }

            /*
            * В.С. +++ 17.01.2013 +++ отрицательный срок поставки разрешен
            * толко для услуг
            */
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (object.accountingTypeRef.code != TKAccountingType.SERVICES_FROM_SIDE
                        && object.deliveryTime < 0) {
                    throw new EnergyproSystemException(
                            ""
                                    + "\n"
                                    + "\n Для матеріалів заборонено вказувати термін постачання з від’ємним значенням!!!");
                }
            }

            if (logic.isNotEditablePlan(plan)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + object.planRef.code);
            }

            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            // /// 31.12.10 Проверка на связь материала с договором
            // АС типа стоит проверять только для МЕСЯЧНОГО
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInContract(object.code);
            // ///

            // план запок тендера // если в плане закупок не даем менять
            if (plan.kind.code == ENPlanWorkKind.CURRENT){
            	eLogic.checkInPurchaseItem(object);
            }


            // если привязан счетчик - нафиг с бара ...
            // в любом случае .. могли наклацать что угодно(сделать из счетчика
            // ОС или ТМЦ и т.д.) и где угодно ...
            eLogic.checkInSCCounterByEstimateItemCode(object.code);

            int sealsCount = eLogic.getSCSealsCountByEstimateItemCode(object.code, false);

            // 04.06.16 Для пломб даем изменить кол-во в большую сторону ()
            if (object.countFact.intValue() < sealsCount)
            {
            	throw new SystemException("\n\nNET-4530 Цей матеріал зв'язаний з пломбами або ІМП у кількості " + sealsCount + " шт.!\n" +
            			"Скорегована кількість не може бути менша за " + sealsCount + "!");
            }

            // ///
            // 16.11.12 NET-3079 Проверим, чтобы не редактировали уже
            // оприходованные материалы заказчика
            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && object.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS
                    && oldObject.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Цей матеріал вже оприбутковано! \n "
                                + "Відміняйте проведення акту приймання-передачі на формі редагування договору з послуг на сторону!");
            }
            // ///

            if (object.countGen.doubleValue() >= 0.0000001) {
                if ((object.countFact.doubleValue() != object.countGen
                        .doubleValue())
                        && (object.typeRef.code == ENEstimateItemType.AUTO)) {
                    object.typeRef.code = ENEstimateItemType.CORRECTED;
                }
            } else {
                object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
                if (object.planItemRef != null) {
                    if (object.planItemRef.code != Integer.MIN_VALUE) {
                        object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                    }
                }

                ElementLogic elementLogic = new ElementLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                int eType = elementLogic.getElementTypeByPlan(plan);

                // ///////////////////////////////////////////////////////////
                // Службе транспорта запрещаем добавлять материалы без привязки
                // к работам
                /*
                * if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLAN) {
                * if (eType == ENElementType.TRANSPORT) { throw new
                * EnergyproSystemException("Заборонено додавати на план
                * матеріали, не прив'язані до робіт!"); } }
                * /////////////////////////////////////////////////////////////
                */
                // уже всем ;)
                // AS 24.05.2011 пожедание ВС запрет добавлять мат-лы без работ
                if (object.planItemRef.code == Integer.MIN_VALUE) {
                    if ((eType != ENElementType.WRITING_NO_OBJECT)
                            && (eType != ENElementType.PURCHASES_NO_OBJECT)
                            && (eType != ENElementType.PURCHASES_OBJECT)
                            && (eType != ENElementType.NO_OBJECT_RESTOCKING)

                    ) {
                        if ((plan.stateRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT)
                                && (plan.stateRef.code != ENPlanWorkState.REFINEMENT)) {
                            if (object.kindRef.code != ENEstimateItemKind.PRODUCED)
                                throw new EnergyproSystemException(
                                        "Заборонено додавати на план матеріали, не прив'язані до робіт !");
                        }
                    }
                }

            }

            // для СиЗ кол-во материала не должно превышать нормативное....

            ElementLogic elLogic = new ElementLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            int elType = elLogic.getElementTypeByCode(plan.elementRef.code);
            if (elType == ENElementType.SIZ) {
                if (object.countFact.doubleValue() >= 0.0000001
                        && object.countFact.doubleValue() > object.countGen
                                .doubleValue()) {
                    throw new EnergyproSystemException(
                            "Відкоригована кількість не повинна перевищувати нормативну.... ");
                }
            }

            // расчет стоимости !!! ФАКТИЧЕСКОЕ кол-во на сену с техкарты ...

            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            // проверим развязку ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(object.code);
            if ((fList.totalCount > 0) && (object.countFact.doubleValue() == 0)) {
                throw new EnergyproSystemException(
                        "Есть зарезервированные материалы ... удалите развязку !!!",
                        getUserProfile());
            }

            if (plan.typeRef.code == ENPlanWorkType.WRITINGS) {
                if ((plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MNMA
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/)
                        || object.kindRef.code != ENEstimateItemKind.UNMOUNT) {
                    throw new EnergyproSystemException(
                            "На цьому плані матеріали не коригуються ...");
                }
            }

            // /// 21.04.11
            // Не дадим обнулить материал, у которого в техкарте стоит признак
            // "обязательный для выполнения работ"
            // / 06.06.12 NET-2112 Проверять на обязательность нужно только
            // материалы с типом "Материалы" (т.е. всякие демонтированные и т.п.
            // не нужно)
            if (object.kindRef.code == ENEstimateItemKind.MATERIALS) {
                if (object.planItemRef != null) {
                    if ((object.countFact.doubleValue() < 0.000001)
                            && (object.planItemRef.code != Integer.MIN_VALUE)) {
                        EstimateLogic estimateLogic = new EstimateLogic(
                                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                getUserProfile());
                        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(
                                getUserProfile(),
                                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                        ENPlanWorkItem pwi = pwiDAO
                                .getObject(object.planItemRef.code);

                        ENEstimateItemData data = estimateLogic
                                .getTKMaterialDataByTechCard(
                                        object.materialRef.code,
                                        pwi.kartaRef.code);

                        if (data.isObligatory == 1) {
                            /** SUPP-14862... 03.04.2014 материал разделился (приход/расход)..... */
                            ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
                            eiFilter.materialRef.code = object.materialRef.code;
                            eiFilter.planItemRef.code = object.planItemRef.code;
                            eiFilter.conditionSQL = "enestimateitem.countfact > 0";

                            int eiArr[] = eDAO.getFilteredCodeArray(eiFilter, 0, -1);
                            if (eiArr.length == 1) {
                                throw new EnergyproSystemException("\n\n" +
                                        "Цей матеріал є обов'язковим для виконання роботи! Нульова кількість неприпустима!");
                            }
                        }
                    }
                }
            }
            // /
            // ///

            // ЗАЯВКИ !!! ... по идее если мат-л в завке или где еще где
            // изменять НЕЛЬЗЯ
            if (object.statusRef != null) {
                if (object.statusRef.code > Integer.MIN_VALUE) {
                    // object.statusRef.code = ENEstimateItemStatus.TEMP;
                    // для поточних планов - проверить заявлен ли мат-л

                    if (plan.kind.code == ENPlanWorkKind.CURRENT) {
                        // !!!!
                        logic.validateMOLinPlan(plan.code);
                        // / !!!!
                        if ((object.statusRef.code != ENEstimateItemStatus.PLANNED)
                        // (object.statusRef.code !=
                        // ENEstimateItemStatus.PLANNED)
                        // &&
                        // (object.statusRef.code != ENEstimateItemStatus.TEMP_)
                        // &&
                        // (object.statusRef.code !=
                        // ENEstimateItemStatus.IN_SKLAD_OE)
                        // &&
                        // (object.statusRef.code !=
                        // ENEstimateItemStatus.IN_SKLAD_REM)
                        // &&
                        // (object.statusRef.code !=
                        // ENEstimateItemStatus.IN_MOL)
                        ) {
                            // //////////////////////
                            /*
                            * ENEstimateItemFilter eFilter = new
                            * ENEstimateItemFilter(); eFilter.code =
                            * object.code; eFilter.conditionSQL = "(
                            * (enestimateitem.code in (select
                            * oe.estimateitemcode from rqorderitem2enestimttm
                            * oe)) or " + " (enestimateitem.code in (select
                            * oe1.estimateitemcode from rqfkorderitem2enstmttm
                            * oe1)) )"; //"and " +
                            * ENEstimateItem.countGen_QFielld + " <> 0 "; // ??
                            * обнуленные не учитываем, даже если они в заявке
                            * (такого, правда, не дожно быть...)
                            * ENEstimateItemShortList eList =
                            * eDAO.getScrollableFilteredList(eFilter, 0, -1);
                            * if (eList.totalCount > 0) throw new
                            * EnergyproSystemException("Цей матеріал вже
                            * заявлений або доставлений !!!");
                            */
                            eLogic.validateInOrders(object.code);
                            // //////////////////////

                        }

                        // /// 01.03.12 Это проверять не будем (типа что в плане
                        // с редактируемым материалом уже есть хотя бы один
                        // заказанный материал)
                        // Пускай себе редактируют или обнуляют (если м-л
                        // обязательный для выполнения работ, обнулить все равно
                        // не даст)
                        // *** logic.validateInOrdered(plan);
                        // ///
                    }
                } else {
                    object.statusRef.code = ENEstimateItemStatus.PLANNED;
                }
            } else {
                object.statusRef.code = ENEstimateItemStatus.PLANNED;
            }

            object = eLogic.calculateEstimateItemNoSave(object); // !!?? там
                                                                    // же
                                                                    // сохранение
                                                                    // ...

            // ENEstimateItemDAO objectDAO = new
            // ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            if (object.countFact.doubleValue() > 0) {
            	eLogic.checkInRQOrder(object, true, plan);
            }


            // ENEstimateItem oldObject = objectDAO.getObject(object.code);

            // тип мат-ла ... из ТК
            MaterialsLogic tkMatLogic = new MaterialsLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (object.accountingTypeRef == null) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }
            if (object.accountingTypeRef.code == Integer.MIN_VALUE) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }

            /* SUPP-5077 */
            if (object.countFact.compareTo(new BigDecimal(0)) != 0
                    && tkMatLogic.checkRootGroupOfMaterial(
                            object.materialRef.code,
                            TKMaterials.SYSTEM_MATERIAL)) {
                throw new EnergyproSystemException(
                        "Матеріали з группи \""
                                + new TKMaterialsDAO(
                                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                        getUserProfile())
                                        .getObject(TKMaterials.SYSTEM_MATERIAL).name
                                + "\" заборонено використовувати у планах");
            }


            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
            if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION &&
            	oldObject.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Создаем план на изготовление
            	logic.createPlanForCPP(object);
            }
            else if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Пересчитываем работы в плане на изготовление
            	logic.recalcPlanForCPP(object, false);
            }
            else if (object.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION &&
            		 oldObject.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Пересчитываем работы в плане на изготовление и удаляем связку с этим планом
            	logic.recalcPlanForCPP(object, true);
            }
            ////////////////////////////////////////////////////////////////


            objectDAO.save(object);

            // 27.02.2013 NET-4212 если услуги на сторону и план не единичный то
            // ищем единичный план и инсертим естимейт еще под него
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        object.planItemRef.code);
            }

            // ---------------------------------

            // для АВР проверим месячный .. и накинем туда ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                if ((object.planItemRef == null)
                        || (object.planItemRef.code == Integer.MIN_VALUE)) {
                    throw new EnergyproSystemException(
                            "Матеріали без робіт не додаються ...");
                }

                AVRLogic avrLogic = new AVRLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                avrLogic.recalcCurrentAVRByEstimateItem(object,
                        oldObject.countFact, false);

                /*
                * ENEstimateItem2ENEstimateItemDAO e2eDAO = new
                * ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                * getUserProfile());
                *
                * ENPlanWorkItem parentCurrentPlanItem =
                * logic.getParentCurrentPlanWorkItem(object.planItemRef.code);
                *
                * if (parentCurrentPlanItem.code == Integer.MIN_VALUE){
                *
                * ENPlanWorkItemDAO piDAO = new
                * ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                *
                * ENPlanWorkItem planItem =
                * piDAO.getObject(object.planItemRef.code);
                *
                * parentCurrentPlanItem.kartaRef.code = planItem.kartaRef.code;
                * parentCurrentPlanItem.countGen = planItem.countGen;
                * parentCurrentPlanItem.commentGen = "работа создана с
                * дочернего плана"; piDAO.add(parentCurrentPlanItem); }
                *  { //if (parentCurrentPlanItem.code > Integer.MIN_VALUE ){
                * ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
                * eFilter.planItemRef.code = parentCurrentPlanItem.code;
                * eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
                * eFilter.materialRef.code = object.materialRef.code; int[]
                * currentArr = objectDAO.getFilteredCodeArray(eFilter, 0, -1);
                * if (currentArr.length == 0){ ENEstimateItem currEstimate =
                * object; currEstimate.planRef.code =
                * parentCurrentPlanItem.planRef.code;
                * currEstimate.planItemRef.code = parentCurrentPlanItem.code;
                * objectDAO.add(currEstimate);
                *
                * ENEstimateItem2ENEstimateItem e2e = new
                * ENEstimateItem2ENEstimateItem(); e2e.estimateItemInRef.code =
                * currEstimate.code; e2e.estimateItemOutRef.code = object.code;
                * e2e.countGen = object.countFact; e2e.typeRef.code =
                * ENEstimateItem2Type.PLAN_MOVED; e2eDAO.add(e2e);
                *  } else {
                *
                * ///BigDecimal deltaP =
                * object.countGen.subtract(oldObject.countGen).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP); BigDecimal deltaF =
                * object.countFact.subtract(oldObject.countFact).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP);
                *
                * ENEstimateItem currEstimate =
                * objectDAO.getObject(currentArr[0]);
                *
                * currEstimate.countFact =
                * currEstimate.countFact.add(deltaF).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP); if
                * (currEstimate.countFact.doubleValue() < 0.000001){
                * currEstimate.countFact = new BigDecimal(0); }
                *
                * objectDAO.save(currEstimate);
                *
                * ENEstimateItem2ENEstimateItem e2e = new
                * ENEstimateItem2ENEstimateItem(); e2e.estimateItemInRef.code =
                * currEstimate.code; e2e.estimateItemOutRef.code = object.code;
                * e2e.countGen = object.countFact; e2e.typeRef.code =
                * ENEstimateItem2Type.PLAN_MOVED; e2eDAO.add(e2e); }
                *  } //else //{ // месячный не найден ... выше создали его ..
                * //}
                *
                *
                */
            }

            // -------------------------------------------------------------------------------

            /////
            // 19.03.15 NET-4440 Создаем запись в истории ГСМ по плану
            if (eLogic.isFuel(object.code))
            {
            	logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
            }
            /////

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    @Override
	public void remove(int code) {
        try {

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem obj = objectDAO.getObject(code);

            AuthLogic l = new AuthLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (!l.checkPermission4PlanItems(obj.planRef.code)) {
                throw new EnergyproSystemException(
                        "Acces denied for method addBy... from method ENEstimateItem.add()");
            }

            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (logic.isNotEditablePlan(obj.planRef.code)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + obj.planRef.code);
            }

            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            // проверим развязку ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(code);
            if (fList.totalCount > 0) {
                throw new EnergyproSystemException(
                        "Есть зарезервированные материалы ... удалите развязку !!!",
                        getUserProfile());
            }

            // /// 31.12.10 Проверка на связь материала с договором
            eLogic.checkInContract(code);
            // ///

            // для поточних планов - проверить заявлен ли мат-л
            ENPlanWork plan = logic.getPlanByCode(obj.planRef.code);
            // NET-1200 если удаление оприходуемого материала от списания и кинд
            // материала не демонтированые тогда ругаемся
            if (plan.typeRef.code == ENPlanWorkType.WRITINGS) {
                if (obj.kindRef.code != ENEstimateItemKind.UNMOUNT)
                    throw new EnergyproSystemException(
                            "З цього плану матеріали не видаляються  ...");
            }

            if (plan.kind.code == ENPlanWorkKind.FACT) {
                eLogic.checkInSCCounterByEstimateItemCode(code);
                eLogic.getSCSealsCountByEstimateItemCode(code, true);
            }


         // план запок тендера // если в плане закупок не даем менять
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInPurchaseItem(obj);

            // /// 21.04.11
            // Не дадим удалить материал, у которого в техкарте стоит признак
            // "обязательный для выполнения работ"

            // / 06.06.12 NET-2112 Проверять на обязательность нужно только
            // материалы с типом "Материалы" (т.е. всякие демонтированные и т.п.
            // не нужно)
            if (obj.kindRef.code == ENEstimateItemKind.MATERIALS) {
                if (obj.planItemRef != null) {
                    if (obj.planItemRef.code != Integer.MIN_VALUE) {
                        EstimateLogic estimateLogic = new EstimateLogic(
                                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                getUserProfile());
                        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(
                                getUserProfile(),
                                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                        ENPlanWorkItem pwi = pwiDAO
                                .getObject(obj.planItemRef.code);

                        ENEstimateItemData data = estimateLogic
                                .getTKMaterialDataByTechCard(
                                        obj.materialRef.code, pwi.kartaRef.code);
                        if (data.isObligatory == 1)
                            throw new EnergyproSystemException(
                                    "Цей матеріал є обов'язковим для виконання роботи! Видаляти його неможна!");
                    }
                }
            }
            // /
            // ///

            // ///
            // 16.11.12 NET-3079 Проверим, чтобы не удаляли уже оприходованные
            // материалы заказчика
            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && obj.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS
                    && obj.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 Цей матеріал вже оприбутковано! \n "
                                + "Відміняйте проведення акту приймання-передачі на формі редагування договору з послуг на сторону!");
            }
            // ///

            if (plan.kind.code == ENPlanWorkKind.CURRENT) {

                logic.validateMOLinPlan(plan.code);

                // так не особо правильно ... он может быть отменен .. и не
                // удалиться из за форейжина ...
                if (obj.statusRef.code != ENEstimateItemStatus.PLANNED &&
                	obj.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION
                /*
                * по идее такие можно удалять... && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_SKLAD_OE) && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_SKLAD_REM) && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_MOL)
                */
                ) {
                    if (!(obj.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS && obj.statusRef.code == ENEstimateItemStatus.UNUSED)) {
                        throw new EnergyproSystemException(
                                "Цей матеріал вже заявлений або доставлений !!!",
                                getUserProfile());
                    }
                }

                // есть ли заказынные на ЭТОМ плане ... если да - в сад ..
                logic.validateInOrdered(plan);

                eLogic.checkInRQOrder(obj, true);

            }

            if (obj.kindRef.code == ENEstimateItemKind.GSM) {
                throw new EnergyproSystemException(
                        "Це ПММ? ... видаляється з транспорту ... прив'язкой до реального транспорту ...",
                        getUserProfile());
            }

            ENMarkEstimateDAO meDAO = new ENMarkEstimateDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
            meFilter.estimateItem.code = obj.code;
            int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
            for (int me = 0; me < meArr.length; me++) {
                meDAO.remove(meArr[me]);
            }

            ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            // ---------------------------------

            // для АВР проверим месячный .. и накинем туда ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                // if ((obj.planItemRef == null ) || ( obj.planItemRef.code ==
                // Integer.MIN_VALUE)){
                // throw new EnergyproSystemException("Матеріали без робіт не
                // додаються ...");
                // }

                AVRLogic avrLogic = new AVRLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                avrLogic.recalcCurrentAVRByEstimateItem(obj, obj.countFact,
                        true);

                /*
                *
                * ENPlanWorkItem parentCurrentPlanItem =
                * logic.getParentCurrentPlanWorkItem(obj.planItemRef.code);
                *
                * if (parentCurrentPlanItem.code == Integer.MIN_VALUE){
                *
                *  } else { //if (parentCurrentPlanItem.code >
                * Integer.MIN_VALUE ){ ENEstimateItemFilter eFilter = new
                * ENEstimateItemFilter(); eFilter.planItemRef.code =
                * parentCurrentPlanItem.code; eFilter.kindRef.code =
                * ENEstimateItemKind.MATERIALS; eFilter.materialRef.code =
                * obj.materialRef.code; int[] currentArr =
                * objectDAO.getFilteredCodeArray(eFilter, 0, -1); if
                * (currentArr.length == 0){
                *  } else {
                *
                * ///BigDecimal deltaP =
                * object.countGen.subtract(oldObject.countGen).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP); //BigDecimal deltaF =
                * obj.countFact.subtract(oldObject.countFact).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP);
                *
                * ENEstimateItem currEstimate =
                * objectDAO.getObject(currentArr[0]); currEstimate.countGen =
                * currEstimate.countGen.subtract(obj.countGen).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP); currEstimate.countFact =
                * currEstimate.countFact.subtract(obj.countFact).setScale(6 ,
                * BigDecimal.ROUND_HALF_UP);
                *
                * if (currEstimate.countGen.doubleValue() < 0.000001){
                * currEstimate.countGen = new BigDecimal(0); }
                *
                * if (currEstimate.countFact.doubleValue() < 0.000001){
                * currEstimate.countFact = new BigDecimal(0); //isDel =
                * (currEstimate.typeRef.code ==
                * ENEstimateItemType.MANUAL_BY_PLANITEM) &&
                * (currEstimate.countGen.doubleValue() < 0.000001 ); }
                *
                * //if (isDel){ // objectDAO // } // else{
                * objectDAO.save(currEstimate); // }
                *  }
                *  } //else //{ // месячный не найден ... выше создали его ..
                * //}
                *
                */
            }

            // -------------------------------------------------------------------------------


            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
            if (obj.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Пересчитываем работы в плане на изготовление и удаляем связку с этим планом
            	logic.recalcPlanForCPP(obj, true);
            }
            ////////////////////////////////////////////////////////////////


            // вынесем из связки ...
            // ENEstimateItem2ENEstimateItemDAO e2eDAO = new
            // ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
            // getUserProfile());
            ENEstimateItem2ENEstimateItemFilter e2eFilter = new ENEstimateItem2ENEstimateItemFilter();
            e2eFilter.estimateItemOutRef.code = obj.code;
            e2eFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            int[] e2eArr = e2eDAO.getFilteredCodeArray(e2eFilter, 0, -1);
            for (int i = 0; i < e2eArr.length; i++) {
                e2eDAO.remove(e2eArr[i]);
            }

            // 19.03.15 Проверить нужно до удаления!
            boolean isFuel = eLogic.isFuel(code);

            objectDAO.remove(code);

            // 27.02.2013 NET-4212 если услуги на сторону и план не единичный то
            // ищем единичный план и инсертим естимейт еще под него
            if (obj.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        obj.planItemRef.code);
            }

            /////
            // 19.03.15 NET-4440 Создаем запись в истории ГСМ по плану
            if (isFuel)
            {
            	logic.generatePlanFuelHistory(obj.planRef.code, plan.dateStart);
            }
            /////

            // throw new EnergyproSystemException("Материалы УДАЛЯТЬ НЕЛЬЗЯ !!!!
            // ");
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENEstimateItemShortList getForBillInvoiceList(
            ENEstimateItemFilter eiFilter, boolean isBill, int billType) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getForBillInvoiceList(eiFilter, isBill, billType);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%ENEstimateItem%} objects.", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int addForWriteOffFromEstimateList(int codePlan,
            ENEstimateItemShort[] oldEstimateList) {
        try {

            ENAct act = new ActLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).getActByPlanCode(codePlan, false);
            if (act != null) {
                throw new EnergyproSystemException(
                        "Цей факт включено до Акту (№ "
                                + act.numberGen
                                + " ) ... видаляйте прив'язку до Акта!!! ...\n бо Ви друкуєте акт, а потім змінюєте його ;(");
            }
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            EstimateLogic Elogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());


            ENEstimateItem estOld;

            // связка

            ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem2ENEstimateItemFilter est2estFilter = new ENEstimateItem2ENEstimateItemFilter();

            for (int i = 0; i < oldEstimateList.length; i++) {
                // по старому эстимейту с которого хотим списать выбираем из
                // связки с типом (Переход естимейта введенного в эксплуатацию в
                // план на списание)
                // проверяем количество со старого естимейта и кол-во со связки
                // . если кол-во из связки равна или больше количеству со
                // старого естимейта тогда ошибка т.к нельзя списать больше чем
                // вводилось

                est2estFilter.conditionSQL = " ENESTIMATEITEM2NSTMTTM.typerefcode IN ( " + ENEstimateItem2Type.MOVEDFORWRITING + " , " + ENEstimateItem2Type.MOVEDFORWRITING_MANUAL_REMOVE + " ) "
                        + " and   ENESTIMATEITEM2NSTMTTM.estimateiteminrefcode =  "  + oldEstimateList[i].code;
                ENEstimateItem2ENEstimateItemShortList est2estList = est2estDAO
                        .getScrollableFilteredList(est2estFilter, 0, -1);
                BigDecimal n2ncount = new BigDecimal(0);
                for (int j = 0; j < est2estList.totalCount; j++) {

                    n2ncount = n2ncount.add(est2estList.get(j).countGen);
                }

                estOld = objectDAO.getObject(oldEstimateList[i].code);

                if (n2ncount.doubleValue() > estOld.countFact.doubleValue()
                        || n2ncount.doubleValue() == estOld.countFact
                                .doubleValue()) {
                    throw new EnergyproSystemException(
                            "Помилка при формуванні строк плану на списання!");
                }

                // проверить вставляли естимейт под план списания с таким
                // материалом и ед измерения который значится на старом
                // передаваемом естимейте
                ENEstimateItem est = Elogic.getEstimateByOldEstimate(codePlan,
                        oldEstimateList[i].code);
                // если не нашли инсертим естимейт и делаем связку естимейт 2
                // естимейт
                int estInsertedCode = Integer.MIN_VALUE;
                if (est.code == Integer.MIN_VALUE) {
                    ENEstimateItem estNew = new ENEstimateItem();
                    estNew.countGen = oldEstimateList[i].countFact;
                    estNew.countFact = oldEstimateList[i].countFact;
                    estNew.planRef.code = codePlan;
                    estNew.planItemRef.code = Integer.MIN_VALUE;
                    estNew.kindRef.code = ENEstimateItemKind.MATERIALS;
                    estNew.typeRef.code = ENEstimateItemType.AUTO;
                    estNew.statusRef.code = estOld.statusRef.code;
                    estNew.accountingTypeRef.code = TKAccountingType.TMC;
                    estNew.materialRef.code = estOld.materialRef.code;
                    estInsertedCode = objectDAO.add(estNew);

                    //автоматически найдем остаток в ФК , что бы руками не подвязывали введенные средства защиты
                   eilogic.createFinmaterialForWritingOffProtection(
                      		  estOld.code
                      		, estInsertedCode
                      		, oldEstimateList[i].countFact
                      		, codePlan
                      		, oldEstimateList[i].userGen // табельный сотрудника или инв.№ бригады или подстанции (взависимости с кого списывают)
                      		, oldEstimateList[i].materialRefName// ФИО сотрудника или название бригады или подстанции (взависимости с кого списывают)
                      		, oldEstimateList[i].orderNumber //  название подразделения сотрудника или название подразделения бригады или подстанции (взависимости с кого списывают)

                    			);



                } else
                // если нашли то апдейт естимейта и апдейт связки
                {
                    est.countFact = (est.countFact)
                            .add(oldEstimateList[i].countFact);
                    est.countGen = (est.countGen)
                            .add(oldEstimateList[i].countFact);
                    objectDAO.save(est);

                  //автоматически найдем остаток в ФК , что бы руками не подвязывали введенные средства защиты
                    estInsertedCode = est.code;

                    	eilogic.createFinmaterialForWritingOffProtection(
                      		  estOld.code
                      		, estInsertedCode
                      		, oldEstimateList[i].countFact
                      		, codePlan
                      		, oldEstimateList[i].userGen // табельный сотрудника или инв.№ бригады или подстанции (взависимости с кого списывают)
                      		, oldEstimateList[i].materialRefName// ФИО сотрудника или название бригады или подстанции (взависимости с кого списывают)
                      		, oldEstimateList[i].orderNumber //  название подразделения сотрудника или название подразделения бригады или подстанции (взависимости с кого списывают)

                    			);

                }

                ENEstimateItem2ENEstimateItem est2est = new ENEstimateItem2ENEstimateItem();
                est2est.countGen = oldEstimateList[i].countFact;// estOld.countFact;
                est2est.estimateItemInRef.code = estOld.code;
                if (estInsertedCode != Integer.MIN_VALUE) {
                    est2est.estimateItemOutRef.code = estInsertedCode;
                } else {
                    est2est.estimateItemOutRef.code = est.code;
                }
                est2est.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING;
                est2estDAO.add(est2est);

            }
            return 1;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%ENEstimateItem%} objects.", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void removeForWriteOff(int code) {
        try {

        	Context context = new InitialContext();

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem obj = objectDAO.getObject(code);

            AuthLogic l = new AuthLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            Object finMaterialsRef = context.lookup(FINMaterialsController.JNDI_NAME);
	        FINMaterialsControllerHome finMaterialsHome = (FINMaterialsControllerHome) PortableRemoteObject.
	        		narrow(finMaterialsRef, FINMaterialsControllerHome.class);
	        FINMaterialsController finMaterialsController = finMaterialsHome.create();

            if (!l.checkPermission4PlanItems(obj.planRef.code)) {
                throw new EnergyproSystemException(
                        "Acces denied for method addBy... from method ENEstimateItem.add()");
            }

            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            if (logic.isNotEditablePlan(obj.planRef.code)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + obj.planRef.code);
            }

            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            // проверим развязку ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(code);
            if (fList.totalCount > 0) {
                /*throw new EnergyproSystemException(
                        "Есть зарезервированные материалы ... удалите развязку !!!",
                        getUserProfile());*/
            	//SUPP-67830  для удаления списываемого материала  вызовем удаление подвязки автоматом
            	for (int ff = 0; ff < fList.totalCount; ff++) {
            		finMaterialsController.removeMaterials(fList.get(ff).code);
				}

            }

            // /// 31.12.10 Проверка на связь материала с договором
            eLogic.checkInContract(code);
            // ///

            // для поточних планов - проверить заявлен ли мат-л
            ENPlanWork plan = logic.getPlanByCode(obj.planRef.code);


            // план запок тендера // если в плане закупок не даем менять
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInPurchaseItem(obj);

            ENMarkEstimateDAO meDAO = new ENMarkEstimateDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
            meFilter.estimateItem.code = obj.code;
            int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
            for (int me = 0; me < meArr.length; me++) {
                meDAO.remove(meArr[me]);
            }

            ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            // вынесем из связки ...
            // ENEstimateItem2ENEstimateItemDAO e2eDAO = new
            // ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
            // getUserProfile());
            ENEstimateItem2ENEstimateItemFilter e2eFilter = new ENEstimateItem2ENEstimateItemFilter();
            e2eFilter.estimateItemOutRef.code = obj.code;
            e2eFilter.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING;
            int[] e2eArr = e2eDAO.getFilteredCodeArray(e2eFilter, 0, -1);
            for (int i = 0; i < e2eArr.length; i++) {
                e2eDAO.remove(e2eArr[i]);
            }

            objectDAO.remove(code);

            // throw new EnergyproSystemException("Материалы УДАЛЯТЬ НЕЛЬЗЯ !!!!
            // ");
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
          finally {
            closeConnection();
        }
    }

    public int addUnmountForWriteOff(ENEstimateItem object,
            int nomenclatureCode, String nn,
            int isCreateObject, int dismountFromEstimate,
            String account) {
        Connection finConn = null;
        Connection enConn = null;

        try {

            int out = addUnmount(object, nomenclatureCode, nn, isCreateObject,
                    account);

            if (dismountFromEstimate != Integer.MIN_VALUE) { // если что то
                                                                // привязали для
                                                                // приходования
                                                                // при списании
                                                                // то вставим в
                                                                // связку
                ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                ENEstimateItem2ENEstimateItem est2est = new ENEstimateItem2ENEstimateItem();
                est2est.countGen = object.countFact;
                // IN это тот который списывается
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    est2est.estimateItemInRef.code = dismountFromEstimate;
                est2est.estimateItemOutRef.code = out;
                est2est.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
                est2estDAO.add(est2est);
            }

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {

            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }

    }

    public int addUnmountForWriteOff_MBP_MNMA(ENEstimateItem object,
            int nomenclatureCode, String nn, int isCreateObject,
            int finMaterialParentCode, String account) {
        return addUnmount(object, nomenclatureCode, nn, isCreateObject,
                finMaterialParentCode, account);
    }

    public void saveUnmountForWriteOff(ENEstimateItem object,
            int nomenclatureCode, String nn,
            int dismountFromEstimate, String account) {

        Connection enConn = null;

        try {

            // апдейт связки
            ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENEstimateItem2ENEstimateItemFilter est2estFilter = new ENEstimateItem2ENEstimateItemFilter();
            est2estFilter.estimateItemOutRef.code = object.code;
            est2estFilter.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
            int[] est2estArr = est2estDAO.getFilteredCodeArray(est2estFilter,
                    0, -1);
            for (int e = 0; e < est2estArr.length; e++) {

                ENEstimateItem2ENEstimateItem estObject = est2estDAO
                        .getObject(est2estArr[e]);

                estObject.countGen = object.countFact;
                // IN это тот который списывается
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    estObject.estimateItemInRef.code = dismountFromEstimate;
                if (object.code != Integer.MIN_VALUE)
                    estObject.estimateItemOutRef.code = object.code;
                estObject.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
                // если убрали подвязку к списываемому материалу то нам связка
                // не нужна и мы ее выносим
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    est2estDAO.save(estObject);
                else
                    est2estDAO.remove(est2estArr[e]);

            }

            saveUnmount(object, nomenclatureCode, nn, account);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            /*
            * try { if (finConn != null && ! finConn.isClosed()) {
            * finConn.close(); finConn = null; } } catch (SQLException e) { }
            */
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    // добавление материала что приходуется от списания счетчиков сканкантерс
    public int addUnmountCountersWriteOff(ENEstimateItem object,
            int nomenclatureCode, String nn, int isCreateObject, String account) {
    	return this.addUnmount(object, nomenclatureCode, nn, isCreateObject, account);
    }

    public void removeUnmountCountersWriteOff(int estimateItemCode) {
    	this.removeUnmount(estimateItemCode);
    }

    public void changeCountFact(ENEstimateItem object) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENEstimateItem oldObject = objectDAO.getObject(object.code);

            /*
            * 18.10.2012 +++ для Средств Защиты (подстанции, бригады) разрешаем -
            * если не было движения (статус "В наличии") проставлен руками
            *
            */
            ENPlanWork plan = planDAO.getObject(object.planRef.code);
            if (plan.stateRef.code == ENPlanWorkState.BSZ
                    && plan.typeRef.code == ENPlanWorkType.SIZ) {

                if (oldObject.statusRef.code != ENEstimateItemStatus.PRESENT) {
                    throw new EnergyproSystemException(
                            "\n \n Змінювати кількість можливо лише на матеріалі зі статусом \"У наявності\" ");
                }

                if (plan.kind.code == ENPlanWorkKind.YEAR)
                {
                	throw new SystemException("Ця функціональність не працює з річними планами!");
                }

                /* проверка на предмет заявки */
                RQOrderItem2ENEstimateItemDAO o2eDAO = new RQOrderItem2ENEstimateItemDAO(
                        getUserProfile(),
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                RQOrderItem2ENEstimateItemFilter o2eFilter = new RQOrderItem2ENEstimateItemFilter();
                o2eFilter.estimateItem.code = oldObject.code;
                int o2eArr[] = o2eDAO.getFilteredCodeArray(o2eFilter, 0, -1);
                if (o2eArr.length > 0) {
                    throw new EnergyproSystemException(
                            "\n \n Цей матеріал замовлявся!!! "
                                    + "\n Змінювати кількість можливо лише на матеріалі зі статусом \"У наявності\","
                                    + "\n який був проставлений вручну!!! ");
                }

                objectDAO.changeCountFact(object.code, object.countFact,
                        ENEstimateItemStatus.PRESENT);

            } else {
                if (oldObject.countFact.doubleValue() != 0) {
                    throw new EnergyproSystemException(
                            "Змінювати можливо лише нульову кількість");
                }

                /*
                * 01.03.2012 +++ меняем кол-во и ставим статус "Непотрібно
                * замовляти"
                */
                objectDAO.changeCountFact(object.code, object.countFact,
                        ENEstimateItemStatus.UNUSED);
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't changeCountFact {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



	public int addTires(ENEstimateItem object, UserProfile up) {
		try {

			ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			MaterialsLogic tkMatLogic = new MaterialsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			if (object.planRef.code == Integer.MIN_VALUE) {
				new EnergyproSystemException("planRef not found");
			}

			ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

            if (logic.isNotEditablePlan(plan)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + object.planRef.code);
            }

			if (object.planItemRef != null) {
				if (object.planItemRef.code == Integer.MIN_VALUE) {
					object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
				} else {
					object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
				}
			} else {
				object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
			}


            // расчет стоимости !!! ФАКТИЧЕСКОЕ кол-во на цену с техкарты ...
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? там же сохранение...

            object.statusRef.code = ENEstimateItemStatus.PLANNED;

            eLogic.checkInRQOrder(object, true, plan);

            // тип мат-ла ... из ТК
            if (object.accountingTypeRef == null) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }
            if (object.accountingTypeRef.code == Integer.MIN_VALUE) {
                object.accountingTypeRef.code = tkMatLogic
                        .getAccountTypeCodeByTKMaterialsCode(object.materialRef.code);
            }

            int code = objectDAO.add(object);

			return code;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


    /* EENEstimateItem. */
    public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOff(
            String str) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getScrollableFilteredListWriteOff(str);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENEstimateItem%} objects.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* EENEstimateItem. */
    public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffSubstation(
            String str) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getScrollableFilteredListWriteOffSubstation(str);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENEstimateItem%} objects.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* EENEstimateItem. */
    public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffBrigade(
            String str) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getScrollableFilteredListWriteOffBrigade(str);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENEstimateItem%} objects.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENEstimateItem. Список материалов и позиций расходной накладной */
    public ENEstimateItemShortList getEstimateByTransportRouteList(
            ENEstimateItemFilter filterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getEstimateByTransportRouteList(filterObject,
                    anCondition, anOrderBy, fromPosition, quantity);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENEstimateItem%} objects.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int[] getFilteredCodeArray(ENEstimateItemFilter aFilterObject,
            int fromPosition, int quantity) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getFilteredCodeArray(aFilterObject, fromPosition,
                    quantity);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get filtered code array of ENEstimateItem", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENEstimateItem. Список для ввода ОС в эксплуатацию */
    public ENEstimateItemShortList getShortListForOSExpl(
            ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getShortListForOSExpl(aFilterObject, fromPosition,
                    quantity);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENEstimateItem%} objects",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /***************************************************************************
    * При добавлении , редактировании, удалении материалов с кошториса для
    * услуг на сторону копируем естимейты с типом "Ручний на частину плана" с
    * кошториса и инсертим их под кошторис единичный перед етим удалив
    * естимейты на кошторисе единичном с типом естимейта "Ручний на частину
    * плана".
    *
    * @throws PersistenceException
    * @throws DatasourceConnectException
    *
    **************************************************************************/
    public void copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(
            ENPlanWork plan, int planItemCode) throws PersistenceException,
            DatasourceConnectException {

        ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getUserProfile(),
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENPlanWorkItemDAO pliDAO = new ENPlanWorkItemDAO(getUserProfile(),
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(),
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
        plFilter.elementRef.code = plan.elementRef.code;
        plFilter.kind.code = ENPlanWorkKind.CALCULATION_SINGLE;
        int[] plArr = plDAO.getFilteredCodeArray(plFilter, 0, -1);
        ENPlanWork plSingleCalculation = null;
        if (plArr.length != 0)
            plSingleCalculation = plDAO.getObject(plArr[0]);
        // если нашли единичный план
        if (plSingleCalculation != null) {

            // если на естимейт с кошториса привязан к какой то работе то ищем
            // такую строку planworkitem тока на единичном кошториса
            if (planItemCode != Integer.MIN_VALUE) {
                ENPlanWorkItem pliObject = pliDAO.getObject(planItemCode);
                ENPlanWorkItemFilter pliForSingleCalculationFilter = new ENPlanWorkItemFilter();
                pliForSingleCalculationFilter.planRef.code = plSingleCalculation.code;
                pliForSingleCalculationFilter.kartaRef.code = pliObject.kartaRef.code;
                int[] pliForSingleCalculationArr = pliDAO.getFilteredCodeArray(
                        pliForSingleCalculationFilter, 0, -1);
                if (pliForSingleCalculationArr.length != 0) {

                    ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
                    eiFilter.planRef.code = plSingleCalculation.code;
                    eiFilter.planItemRef.code = pliForSingleCalculationArr[0];
                    eiFilter.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                    int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
                    // чистим в кошторисе единичном материалы по конкретной
                    // работе с типом "Ручний на частину плана"
                    for (int i = 0; i < eiArr.length; i++) {
                        eiDAO.remove(eiArr[i]);
                    }
                    // выберем все естимейты с кошториса и запихнем для
                    // кошториса единичного
                    eiFilter = new ENEstimateItemFilter();
                    eiFilter.planRef.code = plan.code;
                    eiFilter.planItemRef.code = planItemCode;
                    eiFilter.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                    eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
                    for (int i = 0; i < eiArr.length; i++) {
                        ENEstimateItem eiObj = new ENEstimateItem();
                        eiObj = eiDAO.getObject(eiArr[i]);
                        eiObj.planRef.code = plSingleCalculation.code;
                        eiObj.planItemRef.code = pliForSingleCalculationArr[0];
                        eiObj.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
                        eiDAO.add(eiObj);
                    }

                }
            }

        }

    }

    /**
    * SUPP-6823
    * Проверка балансового счета для демонтированных, изготовленных, доработанных и материалов заказчика
    * @param account балансовый счет
    */
    public void checkAccount(String account) {
        if(account == null || account.equals(""))
            throw new EnergyproSystemException("Введіть балансовий рахунок!");
        if(account.length() != 4)
            throw new EnergyproSystemException("Довжина балансового рахунку повинна бути 4 символи");
        if(!Tools.checkIfStringConsistsOfDigits(account))
            throw new EnergyproSystemException("Неправильний формат балансового рахунку: \"" + account+"\"");
    }

    /**SUPP-79044 Проверка балансового счета для демонтированного материала
     * @param account балансовый счет демонтированного материала
     * @throws DatasourceConnectException
     * @throws PersistenceException */
    public void checkAccountUnmount(String account) throws DatasourceConnectException, PersistenceException {
    	checkAccount(account);
    	ENSettingsLogic logic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	Vector<String> approvedAccounts = logic.getVectorWithValues(ENSettingsKeysConsts.ACCOUNTS_FOR_MATERIALS_UNMOUNTING);
    	boolean approved = approvedAccounts.size() == 0;
    	for(String approvedAccount : approvedAccounts) {
    		if(approved = account.startsWith(approvedAccount)) break;
    	}
    	if(!approved) {
    		throw new SystemException(String.format("Неможливо прибуткувати демонтований матеріал на рахунок \"%s\".\n" +
    				"Дозволені рахунки для прибуткування демонтованих матеріалів: %s"
    				, account, java.util.Arrays.toString(Tools.getQuotedStringArray(approvedAccounts))));
    	}
    }

    /**
    * 21.02.2014 SUPP-8470 автоматический поиск остатков под материалы на планах
    * @param enplanworkCode
    * @return
    */
    public int bindingMaterialsFromRem(int enplanworkCode , java.util.Date orderDate ) {
        try {
            int code = enplanworkCode;

            FKOrderLogic orderLogic = new FKOrderLogic(getUserProfile(),
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            orderLogic.bindingMaterialsFromRemAndMakeFKOrder(enplanworkCode , orderDate);


            return code;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("error on bindingMaterialsFromRem", e);
        } //catch (PersistenceException e) {
        //throw new EnergyproSystemException(e.getMessage(), e);
        //}
    finally {
            closeConnection();
        }
    }


    /**
    * 21.02.2014 SUPP-8470 отвязка остатков под материалы на планах
    * @param enplanworkCode
    * @param enestimateitemCodes
    * @return
    */
    public void UnBindingMaterialsFromRem(int enplanworkCode , String enestimateitemCodes) {
        try {


            FKOrderLogic orderLogic = new FKOrderLogic(getUserProfile(),
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            orderLogic.UnBindingMaterialsFromRemAndMakeFKOrder(enplanworkCode , enestimateitemCodes);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("error on bindingMaterialsFromRem", e);
        } //catch (PersistenceException e) {
        //throw new EnergyproSystemException(e.getMessage(), e);
        //}
    finally {
            closeConnection();
        }
    }

    public ENEstimateItemShortList getForBillInvoiceListForGenerateItem(
            ENEstimateItemFilter eiFilter, boolean isBill, int billType) {
        try {
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            return objectDAO.getForBillInvoiceListForGenerateItem(eiFilter, isBill, billType);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%ENEstimateItem%} getForBillInvoiceListForGenerateItem ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    /**
     * NET-4445 - возвращает код естимейта с месячного плана по инвентарному и по num_un старого состояния счетчика (тот который выбирали в sccounter при перемещении на кладовщика)
     *          - используется для формирования строк на перемещение счетчика с кладовщика реса на мастера по счету 1533.
     *          --  С проверкой если не нашли такой план то ругаемся ,
     *              если нашли план но МОЛ на плане не совпадает с молом получателя на ордере , то ругаемся
     *
     * */
    public int getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(ENMetrologyCounter sc ,String molOutCode) { try {
           EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
         return eilogic.getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(sc,molOutCode);
         }
        catch
         (DatasourceConnectException e) {
        	throw new EnergyproSystemException("Can't  connect to DB",e);
        	} finally {closeConnection();} }


 /** добавление естимейтов в спецификацию к проекту договора
  *
  * @param eiList
  * @throws java.rmi.RemoteException
  */
   public void estimateWithoutContractAdd2SpecificationExecute(ENEstimateItemShort[] eiList){
	   try {
           EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
         eilogic.estimateWithoutContractAdd2SpecificationExecute(eiList);
         }
        catch
         (DatasourceConnectException e) {
        	throw new EnergyproSystemException("Can't  connect to DB",e);
        	} finally {closeConnection();}
   }

   /**  Видалити прив`язку вибраних строк матеріалів із проекту договора
    *
    * @param eiList
    * @throws java.rmi.RemoteException
    */
     public void estimate2ProjectAgreeUnlink(ENEstimateItemShort[] eiList){
  	   try {
             EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
             eilogic.estimate2ProjectAgreeUnlink(eiList);
           }
          catch
           (DatasourceConnectException e) {
          	throw new EnergyproSystemException("Can't  connect to DB",e);
          	} finally {closeConnection();}
     }


     // перечень естимейтов с учетом  связки естимейта к договорам enestimateitem2contrct
     public ENEstimateItemShortList getDetailedEstimate2ContractList(
             ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) {
         try {
             ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                     getUserProfile(),
                     getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
             return objectDAO.getDetailedEstimate2ContractList(eFilter, pFilter);
         } catch (DatasourceConnectException e) {
             throw new EnergyproSystemException("Can't getDetailedEstimate2ContractList",
                     e);
         } catch (PersistenceException e) {
             throw new EnergyproSystemException(e.getMessage(), e);
         } finally {
             closeConnection();
         }
     }


     /**  связка естимейтов без договоров к договорам encontract
      *
      * @param eiList
      * @throws java.rmi.RemoteException
      */
       public void estimateWithoutContractLink2Contract(ENEstimateItemShort[] eiList , int enContractItemCode){
    	   try {
               EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
               eilogic.estimateWithoutContractLink2Contract(eiList ,  enContractItemCode );
             }
            catch
             (DatasourceConnectException e) {
            	throw new EnergyproSystemException("Can't  connect to DB",e);
            	} finally {closeConnection();}
       }

       // Відмінити прив`язку вибраних строк матеріалів з планів від договору
       public void estimateWithContractUnLink2Contract(ENEstimateItemShort[] eiList) {
       try {
           EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
           eilogic.estimateWithContractUnLink2Contract(eiList  );
         }
        catch
         (DatasourceConnectException e) {
        	throw new EnergyproSystemException("Can't  connect to DB",e);
        	} finally {closeConnection();}
   }

       /**  добавление выбранных естимейтов в план закупок
        *
        * @param eiList
        * @throws java.rmi.RemoteException
        */
         public void estimateAdd2Planpurchase(ENEstimateItemShort[] eiList , int planPurchaseCode){
      	   try {

      			  EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                  eilogic.estimateAdd2Planpurchase(eiList ,  planPurchaseCode );
               }
              catch
               (DatasourceConnectException e) {
              	throw new EnergyproSystemException("Can't  connect to DB",e);
              	} finally {closeConnection();}
         }




     //  Списання ЗЗ персоналу ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
         public void writeOffZZOnlyEnergyNETBySizObject(ENEstimateItem  eiObject , String finMolCode ){
        	   try {

       			  EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                  eilogic.writeOffZZOnlyEnergyNET(eiObject.code , finMolCode ,  eiObject.countFact );
                }
               catch
                (DatasourceConnectException e) {
               	throw new EnergyproSystemException("Can't  connect to DB",e);
               	} finally {closeConnection();}
          }

         //  Списання ЗЗ бригады ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
         public void writeOffZZOnlyEnergyNETByBrigadeObject(ENEstimateItem  eiObject , String finMolCode ){
        	   try {

       			  EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                  eilogic.writeOffZZOnlyEnergyNET(eiObject.code , finMolCode ,  eiObject.countFact);
                }
               catch
                (DatasourceConnectException e) {
               	throw new EnergyproSystemException("Can't  connect to DB",e);
               	} finally {closeConnection();}
          }

         // Списання ЗЗ подстанции ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
         public void writeOffZZOnlyEnergyNETBySubstation150Object(ENEstimateItem  eiObject , String finMolCode  ){
      	   try {

     			  EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                eilogic.writeOffZZOnlyEnergyNET(eiObject.code , finMolCode ,  eiObject.countFact );
              }
             catch
              (DatasourceConnectException e) {
             	throw new EnergyproSystemException("Can't  connect to DB",e);
             	} finally {closeConnection();}
        }




} // end of EJB Controller for ENEstimateItem
