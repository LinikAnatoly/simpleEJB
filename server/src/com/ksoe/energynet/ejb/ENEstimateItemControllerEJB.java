//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
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

            // ���� � �������(���2���) ���� ���� (���� � ����������) + ������
            // ����
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
     * ����� ���������� ������ ����� ���������� �� ������������� ��������� ����� � ����� �� ����� ���������, ��� � �������� ��������
     *
     * @param estimateCode - ��� ��������� �� �������-����� (��� �������-�����)
     *
     * @return ������ ����� ����������, ����������� �������
     */
    public String getEstimateCodesFromCurrentPlan(int estimateCode)
    {
    	//String out = "-1";
    	String out = "";

        try {
            ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateCode);

            if (estimateItem == null) {
            	throw new SystemException("\n\n�� �������� ������� �� ����! [estimateCode = " + estimateCode + "]");
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
                throw new SystemException("\n\n�������� �������� ������� ����� �� г���� �� ̳������ ������!");
            }

            /** �� ����� ������ �� ��� ������������ ������ */
            if (plan.status.code == ENPlanWorkStatus.LOCKED)
            {
                throw new SystemException("�� ������������ ������ ������� �������� ��������");
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

            // SUPP-25681 - ��� ���������� ��������� �� �������� "��������� ��������� " �������� Null pointer ���� ��� ������ �����
            if (statusCode == Integer.MIN_VALUE)
                return statusCode;

            PlanWorkLogic pLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENPlanWork plan = pLogic.getPlanCodeByEstimateItemCode(estimateItemCode);

            if (plan.kind.code != ENPlanWorkKind.YEAR && plan.kind.code != ENPlanWorkKind.CURRENT)
            {
                throw new SystemException("\n\n�������� ������� ���������� ����� ������ �� ������� � �������� ������!");
            }

            /** �� ����� ������ ������ �� ��� ������������ ������ */
            if (plan.kind.code == ENPlanWorkKind.YEAR && plan.status.code == ENPlanWorkStatus.LOCKED)
            {
                throw new SystemException("�� ������� ������������ ������ ������ ������ ������ ����������");
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
                        "�� ��� ���� �������� �� ��������� ...");

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
                * EnergyproSystemException("���������� �������� �� ����
                * ��������, �� ����'���� �� ����!"); }
                */

                // AS 24.05.2011 ��������� �� ������ ��������� ���-�� ��� �����
                // if ( object.planItemRef.code == Integer.MIN_VALUE ){
                if ((eType != ENElementType.WRITING_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_NO_OBJECT)
                        && (eType != ENElementType.PURCHASES_OBJECT)) {
                    throw new EnergyproSystemException(
                            "���������� �������� �� ���� ��������, �� ����'���� �� ���� !");
                }
                // }
            }

            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? ���
                                                                    // ��
                                                                    // ����������
                                                                    // ...

            // if (object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_OE &&
            // object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_REM)
            // if (object.statusRef.code != ENEstimateItemStatus.PRESENT)

            // /// 02.03.12 ��� ���������� ��������� � �������� ���� �����
            // ������� ��� ������ "��������� ���������"
            // *** object.statusRef.code = ENEstimateItemStatus.PRESENT;
            object.statusRef.code = ENEstimateItemStatus.UNUSED;
            // ///

            int code = objectDAO.add(object);

            /////
            // 19.03.15 NET-4440 ������� ������ � ������� ��� �� �����
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

            // ������� �� ������ ������
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
            // ������� ��� ��� ���� ...
            // finFilter.statusRef.code = FINMaterialsStatus.GOOD;

            finFilter.estimateItemRef.code = estimateItemCode;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);
            for (int i = 0; i < finArr.length; i++) {
                finMaterialsDAO.remove(finArr[i]);
            }

            // ������� ������� ��������� ;)
            ENElement2EstimateItemFilter el2eFilter = new ENElement2EstimateItemFilter();
            el2eFilter.estimateItemRef.code = estimateItemCode;
            ENElement2EstimateItemDAO el2eDAO = new ENElement2EstimateItemDAO(
                    enConn, getUserProfile());
            ENElement2EstimateItemShortList el2eList = el2eDAO
                    .getScrollableFilteredList(el2eFilter, 0, -1);
            for (int i = 0; i < el2eList.totalCount; i++) {
                // !!!!!!!!!!!!!
                // ������� ��������� !! ������ �� ����� !!!!
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
                                "�� ���� ������� �������� �� ���� ("
                                        + objArr.length
                                        + ") ������ ��� ������� ... ��� �������� "
                                        + el2eList.get(i).elementRefCode);
                    }
                    objDAO.remove(objArr[0]);
                }
            }

            this.remove(estimateItemCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
            // ������� ��� ��� ���� ...
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
            // ������� ��� ��� ���� ...
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
                // ������� ��������� !! ������ �� ����� !!!!
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
                                "�� ���� ������� �������� �� ���� ("
                                        + objArr.length
                                        + ") ������ ��� ������� ... ��� �������� "
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
                //        "������� �� ������� ������ � ����� �������������� ������� ...");
                TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
                TmaterialFilter nnFilter = new TmaterialFilter();
                nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
                nnFilter.id = nomenclatureCode;
                nnFilter.nn = nn;

                TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                        nnFilter, 0, -1);
                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

				// ��������, �������� �� ������� ��������� ...
				TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
				TKMaterials mat = matDAO.getObject(object.materialRef.code);

				if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
				    throw new EnergyproSystemException(
				            "�� ���������� ������� ����� ... '"
				                    + mat.measurement.name + "' �� '"
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
                            "�� ������� ������� �� ����� ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }

                if (frcData.finCFOCode == null || frcData.finCFOCode.length() == 0)
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "��������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                if(object.price == null)
                	throw new EnergyproSystemException("������ ���� ������������� ��������");

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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
        	{throw new EnergyproSystemException("�� ������� ���� ��� �������������� ������������ ��������!");}

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

            /* ������ �������� � ���������� ���. ��������� ���� ������� ������� */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "������� � ������� ������������ ��������, ��� ��������: "
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
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // �������� �������� �� ������� ��������� ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� ... '"
                                    + mat.measurement.name + "' �� '"
                                    + m.mesure_unitText + "'");
                }

                /* �������� ������� ��������� ����� */
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
                            "�� ���� ���� ���������� ����, ������� �� ������������");

                TKTechCardDAO tcDAO = new TKTechCardDAO(enConn,
                        getUserProfile());

                for (int i = 0; i < piList.totalCount; i++) {
                    TKTechCard tcObj = tcDAO
                            .getObject(piList.get(i).kartaRefCode);

                    if (tcObj.measurement.code != mat.measurement.code)
                        throw new EnergyproSystemException(
                                "�� ���������� ������� ����� �� ����� "
                                        + tcObj.name + " ("
                                        + tcObj.measurement.name
                                        + ") �� ������������� �������� "
                                        + mat.name + " ("
                                        + mat.measurement.name + ")");

                }

                // �������� �� ������ ���������� ������������...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ����� ... '"
                                    + mat.name.trim().toUpperCase() + "' �� '"
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
                            "�� ������� ������� �� ����� ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = divCode4Order; //  molList.get(0).finMolCode;
                fm.div_name = divName4Order; // molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                /* 28.07.16 frcData ���� ����� �� ������������!
                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }
				*/

                fm.frc_code = 27;
                fm.frc_name = "������������";
                fm.budget_core_id = 52;

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "����������� ���������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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

            /* ������ �������� � ���������� ���. ��������� ���� ������� ������� */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "������� � ������� ������������ ��������, ��� ��������: "
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
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // �������� �������� �� ������� ��������� ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� ... '"
                                    + mat.measurement.name + "' �� '"
                                    + m.mesure_unitText + "'");
                }

                // �������� �� ������ ���������� ������������...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ����� ... '"
                                    + mat.name.trim().toUpperCase() + "' �� '"
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
                            "�� ������� ������� �� ����� ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "����������� ���������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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

            /* ������ �������� � ���������� ���. ��������� ���� ������� ������� */
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "������� � ������� ������������ ��������, ��� ��������: "
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
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // �������� �������� �� ������� ��������� ....
                TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn,
                        getUserProfile());
                TKMaterials mat = matDAO.getObject(object.materialRef.code);

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� ... '"
                                    + mat.measurement.name + "' �� '"
                                    + m.mesure_unitText + "'");
                }

                /* �������� ������� ��������� ����� */
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
                            "�� ���� ���� ���������� ����, ������� �� ����������");

                // �������� �� ������ ���������� ������������...
                // if ( !
                // mat.name.trim().toUpperCase().equals(m.name.trim().toUpperCase())){
                // throw new EnergyproSystemException("�� ���������� ����� ...
                // '"+mat.name.trim().toUpperCase()+"' �� '" +
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
                            "�� ������� ������� �� ����� ...");
                }
                
                ENMol recipient = (molCode != null && molCode.trim().length() > 0) ? molDao.getMolByFinCode(molCode.trim()) 
                		:  molDao.getMolByFinCode(molList.get(0).finMolCode);
                if(recipient == null) {
                	throw new SystemException(String.format("\n\n�� �������� ��� �� ����� \"%s\" � �������� ����������-������������ ��� �������� \"EnergyNet\"\n\n"
                			, ((molCode != null && molCode.trim().length() > 0) ? molCode.trim() : molList.get(0).finMolCode))
                			);
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = recipient.finCode;
                fm.div_name = recipient.name;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }

                fm.frc_code = new Integer(frcData.finCFOCode).intValue();
                fm.frc_name = frcData.departmentRefShortName;
                fm.budget_core_id = frcData.finRenCode;

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = molList.get(0).finMolCode;
                fm.partner_name = molList.get(0).finMolName;
                
                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "����������� ���������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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


            /** 17.09.2014... +++  ��� �������� ��������������� ���������������
             *  ��������� ����������� � ������ �������� �� ��������...
             *  ��� ����� ������ � � �������-�����...
             */
            if (!writingTransformers) {
                if (plan.kind.code != ENPlanWorkKind.FACT) {
                    throw new EnergyproSystemException(
                            "���������� �������� ��������� �� ���� ...");
                }
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                int out = this.add(object);
                return out;
                // !!! ���� ��� ��� ����������� �������� !!!
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
                        "������������ �� �������� ... ��� " + nomenclatureCode);
            }

            TmaterialShort m = nnList.get(0);

            // �������� �������� �� ������� ��������� ....
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                throw new EnergyproSystemException(
                        "�� ���������� ������� ����� ... '"
                                + mat.measurement.name + "' �� '"
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
                        "�� ������� ������� �� �����-������� ...");
            }

            fm.molDataRef.code = molList.get(0).code;
            fm.div_code = molList.get(0).finMolCode;
            fm.div_name = molList.get(0).finMolName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "net.����������� �����";

            fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // ��������
            fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "�� ��� �� ������� ��� ���������������� � ����� = "
                                + plan.budgetRef.code);
            }

            if (frcData.finCFOCode == null || frcData.finCFOCode.length() == 0)
                throw new EnergyproSystemException(
                        "�� ��� �� ������� ��� ���������������� � ����� = "
                                + plan.budgetRef.code);

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;
            fm.ax_frc_code = String.format("%02d", fm.frc_code);

            // ??? ��������� ��� ���� ������� ����� ��� ������� ....
            // fm.molDataRef.code = molList.get(0).code;
            fm.doc_date = wo.dateGen;
            fm.doc_num = wo.workOrderNumber;

            fm.partner = fm.div_code;
            fm.partner_name = fm.div_name;

            // ���� �������� ��� ���������� ...
            fm.party_id = 1000;
            fm.party_discription = "��������";

            // ��� �� ����� ����� ... ������� ��� ���� ;)
            fm.finDocItemCode = 0;

            fm.mu_id = m.mesure_unitId;
            fm.mu_name = m.mesure_unitText;

            if(object.price == null)
            	throw new EnergyproSystemException("������ ���� ������������� ��������");

            // ����� ����� ���� � EstimateItem'�, � �� �� �����������
            fm.price = object.price; // m.cost;
            fm.calc_price = object.price; // m.cost;
            fm.quantity = object.countFact;
            fm.cost = fm.calc_price.multiply(fm.quantity).setScale(2,
                    BigDecimal.ROUND_HALF_UP);

            // ���� ��������� ������� � 0, ������ �������
            if (fm.cost.compareTo(new BigDecimal(0)) <= 0)
            {
            	fm.cost = new BigDecimal(0.01);
            }

            checkAccountUnmount(account);
            fm.bal_sch = account;

            // /// 05.12.11 ���������� ����� ���������������� ��������� �
            // �������� ����������� ��� �������� ��� ��� ����
            if (finMaterialParentCode != Integer.MIN_VALUE) {
                fm.parentRef.code = finMaterialParentCode;
            }
            // ///
            
            int out = this.add(object);

            fm.estimateItemRef.code = out;
            fm.statusRef.code = FINMaterialsStatus.GOOD;
            finMaterialsDAO.add(fm);

            // ������� ������� ... ���� ����������� � ������
            // ��� ���������� ...
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
                    obj.name = fm.mat_name + " �� " + parentElement.objectName
                            + " (��� � " + parentElement.objectInvNumber + ")";
                    obj.commentGen = "����������� � ����� �"
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
        	{throw new EnergyproSystemException("�� ������� ���� ��� �������������� ������������ ��������!");}

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn,
                    getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            /*
            * �������� �� ���������� ���������� ���� ������������� ������ ��
            * ����� � ����� ���� �� ������������
            */
            if (plan.stateRef.code != ENPlanWorkState.PRODUCTION)
                throw new EnergyproSystemException(
                        "������������ ������� ����� �������� ����� ��� ����� � ����� ���� \"������������\"");

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "���������� �������� ��������� �� ���� ...");
            }

            /*
            * if(nomenclatureCode == Integer.MIN_VALUE) throw new
            * EnergyproSystemException("������ �������������� �����!");
            */

            /*
            * �������� �� ��, ��� �� ���������� ��� ��������� ���� ������������
            * ��� ����� �����
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
                        "������������ ������� �� ���� ����� ��� ������ �����!");

            /* �������� ��������� */
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            /* �������� ������� ��������� ����� */
            ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(enConn,
                    getUserProfile());
            ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
            piFilter.planRef.code = plan.code;
            piFilter.conditionSQL = "COUNTGEN <> 0";

            ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(
                    piFilter, piFilter.conditionSQL, 0, -1);

            if (piList.totalCount == 0)
                throw new EnergyproSystemException(
                        "�� ���� ���� ���������� ����, ������� �� ������������");

            TKTechCardDAO tcDAO = new TKTechCardDAO(enConn, getUserProfile());

            for (int i = 0; i < piList.totalCount; i++) {
                TKTechCard tcObj = tcDAO.getObject(piList.get(i).kartaRefCode);

                if (tcObj.measurement.code != mat.measurement.code)
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� �� ����� "
                                    + tcObj.name + " ("
                                    + tcObj.measurement.name
                                    + ") �� ������������� �������� "
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
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                // ������� ������������ �� ��
                nnList = nnDAO.getScrollableFilteredList(nnFilter, null, null, 0, -1, null, true);

                if (nnList.totalCount != 1) {
                    throw new EnergyproSystemException(
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // �������� �������� �� ������� ��������� ....

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� ... '"
                                    + mat.measurement.name + "' �� '"
                                    + m.mesure_unitText + "'");
                }

                // �������� �� ������ ���������� ������������...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ����� ... '"
                                    + mat.name.trim().toUpperCase() + "' �� '"
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
                            "�� ������� ������� �� ����� ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = divCode4Order; //molList.get(0).finMolCode; // ������ ����� ������� ��� ��� ������� � �����
                fm.div_name = divName4Order; //molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // ��������
                fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative

                /* 28.07.16 frcData ���� ����� �� ������������!
                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }
				*/

                /*
                * SUP-498 ������� �� 03.09.2012 -- ������ ��� "�������
                * ���������" ��� ��� � ���. ��� ������� ��������� �����
                * ������������� �� ��������� ���
                */
                fm.frc_code = 27;
                fm.frc_name = "������������";
                fm.budget_core_id = 52;
                fm.ax_frc_code = String.format("%02d", fm.frc_code);

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "����������� ���������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                /*SUPP-8756*/if(m.cost == null) m.cost = new BigDecimal(0);

                // ����� ����� ���� � EstimateItem'�, � �� �� �����������
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
            * �������� �� ���������� ���������� ���� ������������� ������ ��
            * ����� � ����� ���� �� ������������
            */
            if (plan.stateRef.code != ENPlanWorkState.WORK_IN_OUT)
                throw new EnergyproSystemException(
                        "������������ ������� ��� ���� �� ������� ����� �������� ����� ��� ����� � ����� ���� \"������ �� �������\"");

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "���������� �������� ��������� �� ���� ...");
            }

            /* �������� ��������� */
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
                            "������������ �� �������� ... ��� "
                                    + nomenclatureCode);
                }

                TmaterialShort m = nnList.get(0);

                // �������� �������� �� ������� ��������� ....

                if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ������� ����� ... '"
                                    + mat.measurement.name + "' �� '"
                                    + m.mesure_unitText + "'");
                }

                // �������� �� ������ ���������� ������������...
                if (!mat.name.trim().toUpperCase().equals(
                        m.name.trim().toUpperCase())) {
                    throw new EnergyproSystemException(
                            "�� ���������� ����� ... '"
                                    + mat.name.trim().toUpperCase() + "' �� '"
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
                            "�� ������� ������� �� ����� ...");
                }

                fm.molDataRef.code = molList.get(0).code;
                fm.div_code = molList.get(0).finMolCode;
                fm.div_name = molList.get(0).finMolName;

                fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
                fm.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
                fm.rest_purpose_name = "net.����������� �����";

                ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                        getUserProfile()).getFKDataByBudegetCode(
                        plan.budgetRef.code, true);
                if (frcData == null) {
                    throw new EnergyproSystemException(
                            "�� ��� �� ������� ��� ���������������� � ����� = "
                                    + plan.budgetRef.code);
                }

                /*
                * SUP-498 ������� �� 03.09.2012 -- ������ ��� "�������
                * ���������" ��� ��� � ���. ��� ������� ��������� �����
                * ������������� �� ��������� ���
                */
                fm.frc_code = 27;
                fm.frc_name = "������������";
                fm.budget_core_id = 52;

                // ??? ��������� ��� ���� ������� ����� ��� ������� ....
                // fm.molDataRef.code = molList.get(0).code;
                fm.doc_date = wo.dateGen;
                fm.doc_num = wo.workOrderNumber;

                fm.partner = fm.div_code;
                fm.partner_name = fm.div_name;

                // ���� �������� ��� ���������� ...
                fm.party_id = 1000;
                fm.party_discription = "����������� ���������";

                // ��� �� ����� ����� ... ������� ��� ���� ;)
                fm.finDocItemCode = 0;

                fm.mu_id = m.mesure_unitId;
                fm.mu_name = m.mesure_unitText;

                /*SUPP-8756*/if(m.cost == null) m.cost = new BigDecimal(0);

                // ����� ����� ���� � EstimateItem'�, � �� �� �����������
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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

            Boolean uses_mdax_item = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_ITEM); // ������������ � �������

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            ENMolDAO molDao = new ENMolDAO(enConn, getUserProfile());

            ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

            if (plan.kind.code != ENPlanWorkKind.FACT) {
                throw new EnergyproSystemException(
                        "�������� ���� ������� ��������� �� ���� ...");
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException("������ ������������ !!!");

            }

            /*
            * �������� �� ���������� �������������� ���������� ������ �� �����
            * � ����� ���� �� ������������
            */

            /* ����������� � ���������� �������*/
            if (plan.stateRef.code != ENPlanWorkState.REFINEMENT
                    && plan.stateRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT
                    && plan.stateRef.code != ENPlanWorkState.TMC_TRANSFER)
                throw new EnergyproSystemException(
                        "���������� ������� ����� �������� ����� ��� ����� � ����� ���� \"�������\"");

            /*
            * �������� �� ��, ��� �� ���������� ��� ��������������� ���������
            * ��� ����� �����
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
                        "�� ���� ��� � ���� ������ �������� ���� �������!");

            TmaterialDAO nnDAO = new TmaterialDAO(finConn, getUserProfile());
            TmaterialFilter nnFilter = new TmaterialFilter();
            nnFilter.status = FKConsts.TMATERIAL_STATUS_ACTIVE;
            nnFilter.id = nomenclatureCode;
            nnFilter.nn = nn;

            TmaterialShortList nnList = nnDAO.getScrollableFilteredList(
                    nnFilter, 0, -1);
            if (nnList.totalCount != 1) {
                throw new EnergyproSystemException(
                        "������������ �� �������� ��� �� ������� ... ��� "
                                + nomenclatureCode);
            }

            TmaterialShort m = nnList.get(0);

            // �������� �������� �� ������� ��������� ....
            TKMaterialsDAO matDAO = new TKMaterialsDAO(enConn, getUserProfile());
            TKMaterials mat = matDAO.getObject(object.materialRef.code);

            if (!mat.measurement.name.toUpperCase().equals(m.mesure_unitText.toUpperCase())) {
                throw new EnergyproSystemException(
                        "�� ���������� ������� ����� ... '"
                                + mat.measurement.name + "' �� '"
                                + m.mesure_unitText + "'");
            }

            BigDecimal costIN = object.cost;

            int out = this.add(object);

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterials fm = new FINMaterials();

            // ������������ ������ � �� ���� ����������� ���������� �� �������
            TmaterialShortList tmListFK = orderLogic.getTmaterialListByNN(nn, m.name, true);
            if (uses_mdax_item)        	{

        		if (tmListFK.totalCount == 0) {
        			throw new EnergyproSystemException(" ������� ��� ������ � �� �������� �� ������� ��������  " + m.name + " " + m.nn);
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
                        "�� ������� ������� �� ����� ...");
            }
            
            ENMol recipient = (molCode != null && molCode.trim().length() > 0) ? molDao.getMolByFinCode(molCode.trim()) 
            		:  molDao.getMolByFinCode(molList.get(0).finMolCode);
            if(recipient == null) {
            	throw new SystemException(String.format("\n\n�� �������� ��� �� ����� %s � �������� ����������-������������ ��� �������� \"EnergyNet\"\n\n"
            			, ((molCode != null && molCode.trim().length() > 0) ? molCode.trim() : molList.get(0).finMolCode))
            			);
            }

            fm.molDataRef.code = molList.get(0).code;
            fm.div_code = recipient.finCode;
            fm.div_name = recipient.name;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "net.����������� �����";
            // ���������� ������� ��� �������
            fm.ax_rest_purpose_id = RQConsts.REST_PURPOSE_ID_WMSLOCATIONID_GENERAL_MDAX; // ��������
            fm.ax_rest_purpose_typeid =  RQConsts.REST_PURPOSE_TYPE_ID_WMSLOCATIONID_NETOPERATIVE_MDAX; // net operative


            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "�� ��� �� ������� ��� ���������������� � ����� = "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.ax_frc_code = String.format("%02d", fm.frc_code);
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // ??? ��������� ��� ���� ������� ����� ��� ������� ....
            // fm.molDataRef.code = molList.get(0).code;
            fm.doc_date = wo.dateGen;
            fm.doc_num = wo.workOrderNumber;

            fm.partner = molList.get(0).finMolCode;
            fm.partner_name = molList.get(0).finMolName;

            // ���� �������� ��� ���������� ...
            fm.party_id = 1001;
            fm.party_discription = "����� ���������";

            // ��� �� ����� ����� ... ������� ��� ���� ;)
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
    * ����� ��� ���������� ���������� ��������� � �������� ���� �� ������� ��
    * �������
    *
    * @param object - ����������� �������� (ENEstimateItem)
    * @param nomenclatureCode - ��� ������������
    * @param nn - �������������� �����
    * @param account - ����
    *
    * @return ��� ������������ � ���� ������������ ��������� (ENEstimateItem'�)
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
                        "\n \n NET-3079 �������� ��������� ��� �������������� ��������� �� ̳������ ������!");
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ������ ������������ !!!");
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
                                        "\n \n NET-3079 �� ��������� ��� ��������� ��� ���������-��������! \n "
                                                + "�������� �������� ��������� ���������� (��� ����� ������� �������� ������� ���)!");
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
                        "\n \n NET-3079 �������� �������� ��������� ������� ����� ��� ����� ������ �� �������, �� ����� ������ "
                                + "\"������ � ������������� �������� ���������\"!");
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
                        "\n \n NET-3079 ������������ �� �������� ��� �� ������� (���: "
                                + nomenclatureCode + ")!");
            }

            // /////////////////////////////////////////////////////////////////////////////////
            // �������� �� ���������� ������������ � ������� ��������� � ����.
            // ��������� � ����� � � ������������� � ���� ������������
            // (�� �������� � ��������� ��� ���������� ��������� �������)
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
                        "\n \n NET-3079 ������������� ����� �������� ( "
                                + nName
                                + " ) �� ������� � ������ ������������ �������� ( "
                                + eName
                                + " ). ����� ������������ ��� ������� ����!");
            }

            if (!nUnit.equals(eUnit)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ������������� ������� ����� �������� ( "
                                + nUnit
                                + " ) �� ������� � �������� ����� ������������ �������� ( "
                                + eUnit
                                + " ). ����� ������������ ��� ������� ����!");
            }
            // /////////////////////////////////////////////////////////////////////////////////

            // ������ ������ "��������� ���������"!
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
                        "\n \n NET-3079 ������ ��� ��� ���������� �� ���� (�� �� ��� ���� ������������� �������� ���������)!");
            }

            // fm.molDataRef.code = molList.get(0).code;
            fm.div_code = mpList.get(0).molCode;
            fm.div_name = mpList.get(0).molName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_TRANZIT; // RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "�������";

            if (plan.budgetRef == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �������� ������ �������������� �� ����!");
            }

            if (plan.budgetRef.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �������� ������ �������������� �� ����!");
            }

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ��� ��� �� �������� ��� �������������� � ����� "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // fm.molDataRef.code = molList.get(0).code;

            // ///
            // ���� � ����� ��������� ��� ���� ����������.
            // ��� �������� ����� (��� ���������� ���� ������-��������), ��
            // ������ ����� ���-�� ������.
            // �� �.�. ��� ���� � finmaterials �������������, ���� ���� ���-��
            // ��������� :)

            // fm.doc_date = wo.dateGen;
            // fm.doc_num = wo.workOrderNumber;

            if (contractNumber == null || contractDate == null
                    || partnerCode == null || partnerName == null
                    || contractNumber == "" || partnerCode == ""
                    || partnerName == "") {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �� ������� ������ � Գ��������� ��� ���� �� �������!");
            }

            fm.doc_date = contractDate;
            fm.doc_num = contractNumber;
            // ///

            // fm.partner = fm.div_code;
            // fm.partner_name = fm.div_name;
            fm.partner = partnerCode;
            fm.partner_name = partnerName;

            // ���� �������� ��� ���������� ...
            fm.party_id = -1;
            fm.party_discription = "�������� ���������";

            // ��� �� ����� ����� ... ������� ��� ���� ;)
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
            throw new EnergyproSystemException("��� ����� � �������������!", e);
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
    * ����� ��� �������������� ���������� ��������� � �������� ����� �� �������
    * �� �������
    *
    * @param object - ����������� �������� (ENEstimateItem)
    * @param nomenclatureCode - ��� ������������
    * @param nn - �������������� �����
    *
    * @param account - ����
    */
    public void saveCustomerMaterial(ENEstimateItem object,
    		int nomenclatureCode, String nn,
    		String account) {
        Connection finConn = null;
        Connection enConn = null;

        try {
            // ������ ������ "��������� ���������"!
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
                        "\n \n NET-3079 �� ������� ��������������� ����� ��� ̳������ �����!");
            }

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            finFilter.statusRef.code = FINMaterialsStatus.GOOD;
            finFilter.estimateItemRef.code = object.code;
            int[] finArr = finMaterialsDAO.getFilteredCodeArray(finFilter, 0,
                    -1);

            // ������ �������� � ���������� ���. ���������
            if (finArr.length != 0) {
                if (finArr.length != 1)
                    throw new EnergyproSystemException(
                            "\n \n NET-3079 ������� � ������� ����''������ ��������, ��� ��������: "
                                    + object.code);

                finMaterialsDAO.remove(finArr[0]);
            }

            if (nn == null)
            {
            	nn = "";
            }

            if (nomenclatureCode == Integer.MIN_VALUE && nn.equals("")) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ������ ������������ !!!");
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
                                        "\n \n NET-3079 �� ��������� ��� ��������� ��� ���������-��������! \n "
                                                + "���������� �������� ��������� ���������� (��� ����� ������� �������� ������� ���)!");
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
                        "\n \n NET-3079 ����������� �������� ��������� ������� ����� ��� ����� ������ �� �������, �� ����� ������ "
                                + "\"������ � ������������� �������� ���������\"!");
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
                        "\n \n NET-3079 ������������ �� �������� ��� �� ������� (���: "
                                + nomenclatureCode + ")!");
            }

            // /////////////////////////////////////////////////////////////////////////////////
            // �������� �� ���������� ������������ � ������� ��������� � ����.
            // ��������� � ����� � � ������������� � ���� ������������
            // (�� �������� � ��������� ��� ���������� ��������� �������)
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
                        "\n \n NET-3079 ������������� ����� �������� ( "
                                + nName
                                + " ) �� ������� � ������ ������������ �������� ( "
                                + eName
                                + " ). ����� ������������ ��� ������� ����!");
            }

            if (!nUnit.equals(eUnit)) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ������������� ������� ����� �������� ( "
                                + nUnit
                                + " ) �� ������� � �������� ����� ������������ �������� ( "
                                + eUnit
                                + " ). ����� ������������ ��� ������� ����!");
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
                        "\n \n NET-3079 ������ ��� ��� ���������� �� ���� (�� �� ��� ���� ������������� �������� ���������)!");
            }

            // fm.molDataRef.code = molList.get(0).code;
            fm.div_code = mpList.get(0).molCode;
            fm.div_name = mpList.get(0).molName;

            fm.rest_purpose_id = RQConsts.REST_PURPOSE_ID_TRANZIT; // RQConsts.REST_PURPOSE_ID_OPERATIVE;
            fm.rest_purpose_name = "�������";

            if (plan.budgetRef == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �������� ������ �������������� �� ����!");
            }

            if (plan.budgetRef.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �������� ������ �������������� �� ����!");
            }

            ENDepartment2EPRenShort frcData = new DepartmentLogic(enConn,
                    getUserProfile()).getFKDataByBudegetCode(
                    plan.budgetRef.code, true);
            if (frcData == null) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ��� ��� �� �������� ��� �������������� � ����� "
                                + plan.budgetRef.code);
            }

            fm.frc_code = new Integer(frcData.finCFOCode).intValue();
            fm.frc_name = frcData.departmentRefShortName;
            fm.budget_core_id = frcData.finRenCode;

            // fm.molDataRef.code = molList.get(0).code;

            // ///
            // ���� � ����� ��������� ��� ���� ����������.
            // ��� �������� ����� (��� ���������� ���� ������-��������), ��
            // ������ ����� ���-�� ������.
            // �� �.�. ��� ���� � finmaterials �������������, ���� ���� ���-��
            // ��������� :)

            // fm.doc_date = wo.dateGen;
            // fm.doc_num = wo.workOrderNumber;

            if (contractNumber == null || contractDate == null
                    || partnerCode == null || partnerName == null
                    || contractNumber == "" || partnerCode == ""
                    || partnerName == "") {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 �� ������� ������ � Գ��������� ��� ���� �� �������!");
            }

            fm.doc_date = contractDate;
            fm.doc_num = contractNumber;
            // ///

            // fm.partner = fm.div_code;
            // fm.partner_name = fm.div_name;
            fm.partner = partnerCode;
            fm.partner_name = partnerName;

            // ���� �������� ��� ���������� ...
            fm.party_id = 1001;
            fm.party_discription = "�������� ���������";

            // ��� �� ����� ����� ... ������� ��� ���� ;)
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
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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
    * ����� ��� �������� ���������� ��������� � �������� ����� �� ������� ��
    * �������
    *
    * @param estimateItemCode -
    *            ��� ������������ ��������� (ENEstimateItem)
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
                        "\n \n NET-3079 �� ������� ��������������� ����� ��� ̳������ �����!");
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
                                        "\n \n NET-3079 �� ��������� ��� ��������� ��� ���������-��������! \n "
                                                + "�������� �������� ��������� ���������� (��� ����� ������� �������� ������� ���)!");
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
                        "\n \n NET-3079 ��������� �������� ��������� ������� ����� ��� ����� ������ �� �������, �� ����� ������ "
                                + "\"������ � ������������� �������� ���������\"!");
            }
            // ///////////////////////////////////////////////////////////////////////////////////////////////////////////

            FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(enConn,
                    getUserProfile());
            FINMaterialsFilter finFilter = new FINMaterialsFilter();
            // ������� ��� ��� ���� ...
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
            throw new EnergyproSystemException("��� ����� � ����� ������!", e);
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
                            "��� ���� �������� �� ���� (� "
                                    + act.numberGen
                                    + " ) ... ��������� ����'���� �� ����!!! ...\n �� �� ������� ���, � ���� ������� ���� ;(");
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
                        "���� ���� ��� ����������� ����� �� ����� ��_��� ...");
            }

            // ���������� ���������� ��������� EnergyNet - �����
            if (object.materialRef.code == TKMaterials.SYSTEM_MATERIAL) {
                if (!authLogic.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "addSystemMaterial"))
                    throw new EnergyproSystemException(
                            "� ��� ���� ���� �������� ��������� ������� � ����");

            }

            if (planLogic.isNotEditablePlan(plan)) {
                throw new EnergyproSystemException(
                        "PlanWork closed or canceled , code="
                                + object.planRef.code);
            }

            /*
            * �.�. +++ 17.01.2013 +++ ������������� ���� �������� ��������
            * ����� ��� �����
            */
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (object.accountingTypeRef.code != TKAccountingType.SERVICES_FROM_SIDE
                        && object.deliveryTime < 0) {
                    throw new EnergyproSystemException(
                            ""
                                    + "\n"
                                    + "\n ��� �������� ���������� ��������� ����� ���������� � �䒺���� ���������!!!");
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
                            "�� ��� ���� �������� �� ��������� ...");
                }
            }

            if (plan.kind.code == ENPlanWorkKind.CURRENT) {
                planLogic.validateMOLinPlan(plan.code);
            }

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            // NET-2888 �������� ���� �� ��������� ������ ��������
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (!authLogic.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "changeDeliveryTime")) {
                    throw new EnergyproSystemException(
                            "\n \n NET-2888 � ��� ���� ���� �� ���� ������ ���������� ��������!");
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
            // ������ ���������� ��������� ��������� ��������� ��� �������� �
            // �������
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLAN) {

                /*
                * if (eType == ENElementType.TRANSPORT) { throw new
                * EnergyproSystemException("���������� �������� �� ����
                * ��������, �� ����'���� �� ����!"); }
                */

                // AS 24.05.2011 ��������� �� ������ ��������� ���-�� ��� �����
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

                        	///// 02.06.16 NET-4530 ��� ��������� ����� �� ���������
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
	                                    "���������� �������� �� ���� ��������, �� ����'���� �� ���� !");
                        }
                    }
                }
                // }
            }
            // ///////////////////////////////////////////////////////////

            // ������ ��������� !!! ����������� ���-�� �� ���� � �������� ...
            EstimateLogic eLogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? ���
                                                                    // ��
                                                                    // ����������
                                                                    // ...

            // if (object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_OE &&
            // object.statusRef.code != ENEstimateItemStatus.IN_SKLAD_REM)
            if ((object.statusRef.code != ENEstimateItemStatus.PRESENT)
                    && (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION)
                    && (object.statusRef.code != ENEstimateItemStatus.UNUSED)   // 02.03.12
                                                                                // �����
                                                                                // ���������
                                                                                // �����
                                                                                // �
                                                                                // �������
                                                                                // "���������
                                                                                // ���������"
            		&& (object.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION)) // 24.11.14
            {
                object.statusRef.code = ENEstimateItemStatus.PLANNED;
            }

            if (object.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "���������� �������� �� ���� �������� � �������� \"� ��������\"! \n"
                                + "�������������� ������ \"��������� ���������\"!");
            }

            eLogic.checkInRQOrder(object, true, plan);

            eLogic.checkAddForMetrology(object);

            // ��� ���-�� ... �� ��
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
                        "�������� � ������ \""
                                + new TKMaterialsDAO(
                                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                        getUserProfile())
                                        .getObject(TKMaterials.SYSTEM_MATERIAL).name
                                + "\" ���������� ��������������� � ������");
            }

            /* 12.05.2012 +++ ��� ��������� ������, �������� ������ �� ��������� */
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
                            "\n \n ��� ����������� ������� �������� ��������� ����� � ������!!!");
                }
            }

            /* 05.12.2011 +++ ��� ���������� �������� �� �������� "� ��������" */
            if (plan.typeRef.code == ENPlanWorkType.TRUCKING
                    && object.kindRef.code == ENEstimateItemKind.MATERIALS) {
                object.statusRef.code = ENEstimateItemStatus.BY_TRUCKING;
            }

            /* 16.01.2012 +++ ��� ����� �� ������� ������ "������� ���" */
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
            // 19.11.14 NET-4415 ��������, ������� ����� ��������������� ���
            if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������ ��� ������� � �������� ������
            	if (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT)
            	{
	            	// ������� ���� �� ������������
	            	planLogic.createPlanForCPP(object);
            	}
            	else
            	{
            		throw new EnergyproSystemException("\n\nNET-4415 �������� ������� � �������� \"������ �����������\" ������� ����� " +
            				"�� г���� �� ̳������ ������!");
            	}
            }
            ////////////////////////////////////////////////////////////////

            // 27.02.2013 NET-4212 ���� ������ �� ������� � ���� �� ��������� ��
            // ���� ��������� ���� � �������� �������� ��� ��� ����
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        object.planItemRef.code);
            }

            // /////////////////////////

            // ---------------------------------

            // ��� ��� �������� �������� .. � ������� ���� ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                if ((object.planItemRef == null)
                        || (object.planItemRef.code == Integer.MIN_VALUE)) {
                    throw new EnergyproSystemException(
                            "�������� ��� ���� �� ��������� ...");
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
                * parentCurrentPlanItem.commentGen = "������ ������� �
                * ��������� �����"; piDAO.add(parentCurrentPlanItem); }
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
                *  } //else //{ // �������� �� ������ ... ���� ������� ��� ..
                * //}
                *
                *
                */
            }

            // -------------------------------------------------------------------------------

            /////
            // 19.03.15 NET-4440 ������� ������ � ������� ��� �� �����
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

            // ���������� ���������� ��������� EnergyNet - �����
            if (object.materialRef.code == TKMaterials.SYSTEM_MATERIAL) {
                if (!l.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "addSystemMaterial"))
                    throw new EnergyproSystemException(
                            "� ��� ���� ���� �������� ��������� ������� � ����");

            }

            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem oldObject = objectDAO.getObject(object.code);

            // NET-2888 �������� ���� �� ��������� ������ ��������
            if (object.deliveryTime != oldObject.deliveryTime) {
                if (!l.checkPermission(
                        "ksoe/energynet/ENEstimateItemController",
                        "changeDeliveryTime")) {
                    throw new EnergyproSystemException(
                            "\n \n NET-2888 � ��� ���� ���� �� ���� ������ ���������� ��������!");
                }
            }

            /*
            * �.�. +++ 17.01.2013 +++ ������������� ���� �������� ��������
            * ����� ��� �����
            */
            if (object.deliveryTime != Integer.MIN_VALUE) {
                if (object.accountingTypeRef.code != TKAccountingType.SERVICES_FROM_SIDE
                        && object.deliveryTime < 0) {
                    throw new EnergyproSystemException(
                            ""
                                    + "\n"
                                    + "\n ��� �������� ���������� ��������� ����� ���������� � �䒺���� ���������!!!");
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
            // /// 31.12.10 �������� �� ����� ��������� � ���������
            // �� ���� ����� ��������� ������ ��� ���������
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInContract(object.code);
            // ///

            // ���� ����� ������� // ���� � ����� ������� �� ���� ������
            if (plan.kind.code == ENPlanWorkKind.CURRENT){
            	eLogic.checkInPurchaseItem(object);
            }


            // ���� �������� ������� - ����� � ���� ...
            // � ����� ������ .. ����� ��������� ��� ������(������� �� ��������
            // �� ��� ��� � �.�.) � ��� ������ ...
            eLogic.checkInSCCounterByEstimateItemCode(object.code);

            int sealsCount = eLogic.getSCSealsCountByEstimateItemCode(object.code, false);

            // 04.06.16 ��� ����� ���� �������� ���-�� � ������� ������� ()
            if (object.countFact.intValue() < sealsCount)
            {
            	throw new SystemException("\n\nNET-4530 ��� ������� ��'������ � �������� ��� ��� � ������� " + sealsCount + " ��.!\n" +
            			"����������� ������� �� ���� ���� ����� �� " + sealsCount + "!");
            }

            // ///
            // 16.11.12 NET-3079 ��������, ����� �� ������������� ���
            // �������������� ��������� ���������
            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && object.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS
                    && oldObject.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ��� ������� ��� �������������! \n "
                                + "³������� ���������� ���� ���������-�������� �� ���� ����������� �������� � ������ �� �������!");
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
                // ������ ���������� ��������� ��������� ��������� ��� ��������
                // � �������
                /*
                * if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLAN) {
                * if (eType == ENElementType.TRANSPORT) { throw new
                * EnergyproSystemException("���������� �������� �� ����
                * ��������, �� ����'���� �� ����!"); } }
                * /////////////////////////////////////////////////////////////
                */
                // ��� ���� ;)
                // AS 24.05.2011 ��������� �� ������ ��������� ���-�� ��� �����
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
                                        "���������� �������� �� ���� ��������, �� ����'���� �� ���� !");
                        }
                    }
                }

            }

            // ��� ��� ���-�� ��������� �� ������ ��������� �����������....

            ElementLogic elLogic = new ElementLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            int elType = elLogic.getElementTypeByCode(plan.elementRef.code);
            if (elType == ENElementType.SIZ) {
                if (object.countFact.doubleValue() >= 0.0000001
                        && object.countFact.doubleValue() > object.countGen
                                .doubleValue()) {
                    throw new EnergyproSystemException(
                            "³����������� ������� �� ������� ������������ ����������.... ");
                }
            }

            // ������ ��������� !!! ����������� ���-�� �� ���� � �������� ...

            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            // �������� �������� ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(object.code);
            if ((fList.totalCount > 0) && (object.countFact.doubleValue() == 0)) {
                throw new EnergyproSystemException(
                        "���� ����������������� ��������� ... ������� �������� !!!",
                        getUserProfile());
            }

            if (plan.typeRef.code == ENPlanWorkType.WRITINGS) {
                if ((plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_MNMA
                		&& plan.stateRef.code != ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/)
                        || object.kindRef.code != ENEstimateItemKind.UNMOUNT) {
                    throw new EnergyproSystemException(
                            "�� ����� ���� �������� �� ����������� ...");
                }
            }

            // /// 21.04.11
            // �� ����� �������� ��������, � �������� � �������� ����� �������
            // "������������ ��� ���������� �����"
            // / 06.06.12 NET-2112 ��������� �� �������������� ����� ������
            // ��������� � ����� "���������" (�.�. ������ ��������������� � �.�.
            // �� �����)
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
                            /** SUPP-14862... 03.04.2014 �������� ���������� (������/������)..... */
                            ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
                            eiFilter.materialRef.code = object.materialRef.code;
                            eiFilter.planItemRef.code = object.planItemRef.code;
                            eiFilter.conditionSQL = "enestimateitem.countfact > 0";

                            int eiArr[] = eDAO.getFilteredCodeArray(eiFilter, 0, -1);
                            if (eiArr.length == 1) {
                                throw new EnergyproSystemException("\n\n" +
                                        "��� ������� � ����'������� ��� ��������� ������! ������� ������� ������������!");
                            }
                        }
                    }
                }
            }
            // /
            // ///

            // ������ !!! ... �� ���� ���� ���-� � ����� ��� ��� ��� ���
            // �������� ������
            if (object.statusRef != null) {
                if (object.statusRef.code > Integer.MIN_VALUE) {
                    // object.statusRef.code = ENEstimateItemStatus.TEMP;
                    // ��� �������� ������ - ��������� ������� �� ���-�

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
                            * ���������� �� ���������, ���� ���� ��� � ������
                            * (������, ������, �� ����� ����...)
                            * ENEstimateItemShortList eList =
                            * eDAO.getScrollableFilteredList(eFilter, 0, -1);
                            * if (eList.totalCount > 0) throw new
                            * EnergyproSystemException("��� ������� ���
                            * ��������� ��� ����������� !!!");
                            */
                            eLogic.validateInOrders(object.code);
                            // //////////////////////

                        }

                        // /// 01.03.12 ��� ��������� �� ����� (���� ��� � �����
                        // � ������������� ���������� ��� ���� ���� �� ����
                        // ���������� ��������)
                        // ������ ���� ����������� ��� �������� (���� �-�
                        // ������������ ��� ���������� �����, �������� ��� �����
                        // �� ����)
                        // *** logic.validateInOrdered(plan);
                        // ///
                    }
                } else {
                    object.statusRef.code = ENEstimateItemStatus.PLANNED;
                }
            } else {
                object.statusRef.code = ENEstimateItemStatus.PLANNED;
            }

            object = eLogic.calculateEstimateItemNoSave(object); // !!?? ���
                                                                    // ��
                                                                    // ����������
                                                                    // ...

            // ENEstimateItemDAO objectDAO = new
            // ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            if (object.countFact.doubleValue() > 0) {
            	eLogic.checkInRQOrder(object, true, plan);
            }


            // ENEstimateItem oldObject = objectDAO.getObject(object.code);

            // ��� ���-�� ... �� ��
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
                        "�������� � ������ \""
                                + new TKMaterialsDAO(
                                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                                        getUserProfile())
                                        .getObject(TKMaterials.SYSTEM_MATERIAL).name
                                + "\" ���������� ��������������� � ������");
            }


            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 ��������, ������� ����� ��������������� ���
            if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION &&
            	oldObject.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������� ���� �� ������������
            	logic.createPlanForCPP(object);
            }
            else if (object.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������������� ������ � ����� �� ������������
            	logic.recalcPlanForCPP(object, false);
            }
            else if (object.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION &&
            		 oldObject.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������������� ������ � ����� �� ������������ � ������� ������ � ���� ������
            	logic.recalcPlanForCPP(object, true);
            }
            ////////////////////////////////////////////////////////////////


            objectDAO.save(object);

            // 27.02.2013 NET-4212 ���� ������ �� ������� � ���� �� ��������� ��
            // ���� ��������� ���� � �������� �������� ��� ��� ����
            if (object.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        object.planItemRef.code);
            }

            // ---------------------------------

            // ��� ��� �������� �������� .. � ������� ���� ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                if ((object.planItemRef == null)
                        || (object.planItemRef.code == Integer.MIN_VALUE)) {
                    throw new EnergyproSystemException(
                            "�������� ��� ���� �� ��������� ...");
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
                * parentCurrentPlanItem.commentGen = "������ ������� �
                * ��������� �����"; piDAO.add(parentCurrentPlanItem); }
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
                *  } //else //{ // �������� �� ������ ... ���� ������� ��� ..
                * //}
                *
                *
                */
            }

            // -------------------------------------------------------------------------------

            /////
            // 19.03.15 NET-4440 ������� ������ � ������� ��� �� �����
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

            // �������� �������� ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(code);
            if (fList.totalCount > 0) {
                throw new EnergyproSystemException(
                        "���� ����������������� ��������� ... ������� �������� !!!",
                        getUserProfile());
            }

            // /// 31.12.10 �������� �� ����� ��������� � ���������
            eLogic.checkInContract(code);
            // ///

            // ��� �������� ������ - ��������� ������� �� ���-�
            ENPlanWork plan = logic.getPlanByCode(obj.planRef.code);
            // NET-1200 ���� �������� ������������� ��������� �� �������� � ����
            // ��������� �� �������������� ����� ��������
            if (plan.typeRef.code == ENPlanWorkType.WRITINGS) {
                if (obj.kindRef.code != ENEstimateItemKind.UNMOUNT)
                    throw new EnergyproSystemException(
                            "� ����� ����� �������� �� �����������  ...");
            }

            if (plan.kind.code == ENPlanWorkKind.FACT) {
                eLogic.checkInSCCounterByEstimateItemCode(code);
                eLogic.getSCSealsCountByEstimateItemCode(code, true);
            }


         // ���� ����� ������� // ���� � ����� ������� �� ���� ������
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInPurchaseItem(obj);

            // /// 21.04.11
            // �� ����� ������� ��������, � �������� � �������� ����� �������
            // "������������ ��� ���������� �����"

            // / 06.06.12 NET-2112 ��������� �� �������������� ����� ������
            // ��������� � ����� "���������" (�.�. ������ ��������������� � �.�.
            // �� �����)
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
                                    "��� ������� � ����'������� ��� ��������� ������! �������� ���� �������!");
                    }
                }
            }
            // /
            // ///

            // ///
            // 16.11.12 NET-3079 ��������, ����� �� ������� ��� ��������������
            // ��������� ���������
            if (plan.kind.code == ENPlanWorkKind.CURRENT
                    && obj.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS
                    && obj.statusRef.code == ENEstimateItemStatus.PRESENT) {
                throw new EnergyproSystemException(
                        "\n \n NET-3079 ��� ������� ��� �������������! \n "
                                + "³������� ���������� ���� ���������-�������� �� ���� ����������� �������� � ������ �� �������!");
            }
            // ///

            if (plan.kind.code == ENPlanWorkKind.CURRENT) {

                logic.validateMOLinPlan(plan.code);

                // ��� �� ����� ��������� ... �� ����� ���� ������� .. � ��
                // ��������� �� �� ��������� ...
                if (obj.statusRef.code != ENEstimateItemStatus.PLANNED &&
                	obj.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION
                /*
                * �� ���� ����� ����� �������... && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_SKLAD_OE) && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_SKLAD_REM) && (object.statusRef.code !=
                * ENEstimateItemStatus.IN_MOL)
                */
                ) {
                    if (!(obj.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS && obj.statusRef.code == ENEstimateItemStatus.UNUSED)) {
                        throw new EnergyproSystemException(
                                "��� ������� ��� ��������� ��� ����������� !!!",
                                getUserProfile());
                    }
                }

                // ���� �� ���������� �� ���� ����� ... ���� �� - � ��� ..
                logic.validateInOrdered(plan);

                eLogic.checkInRQOrder(obj, true);

            }

            if (obj.kindRef.code == ENEstimateItemKind.GSM) {
                throw new EnergyproSystemException(
                        "�� ���? ... ����������� � ���������� ... ����'����� �� ��������� ���������� ...",
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

            // ��� ��� �������� �������� .. � ������� ���� ...
            if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
                    && (plan.typeRef.code == ENPlanWorkType.AVR)) {

                // if ((obj.planItemRef == null ) || ( obj.planItemRef.code ==
                // Integer.MIN_VALUE)){
                // throw new EnergyproSystemException("�������� ��� ���� ��
                // ��������� ...");
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
                *  } //else //{ // �������� �� ������ ... ���� ������� ��� ..
                * //}
                *
                */
            }

            // -------------------------------------------------------------------------------


            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 ��������, ������� ����� ��������������� ���
            if (obj.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������������� ������ � ����� �� ������������ � ������� ������ � ���� ������
            	logic.recalcPlanForCPP(obj, true);
            }
            ////////////////////////////////////////////////////////////////


            // ������� �� ������ ...
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

            // 19.03.15 ��������� ����� �� ��������!
            boolean isFuel = eLogic.isFuel(code);

            objectDAO.remove(code);

            // 27.02.2013 NET-4212 ���� ������ �� ������� � ���� �� ��������� ��
            // ���� ��������� ���� � �������� �������� ��� ��� ����
            if (obj.typeRef.code == ENEstimateItemType.MANUAL_BY_PLANITEM
                    && plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT
                    && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT
                    && plan.kind.code == ENPlanWorkKind.CALCULATION) {
                copyEstimateitemFromCALCULATION2CALCULATION_SINGLE(plan,
                        obj.planItemRef.code);
            }

            /////
            // 19.03.15 NET-4440 ������� ������ � ������� ��� �� �����
            if (isFuel)
            {
            	logic.generatePlanFuelHistory(obj.planRef.code, plan.dateStart);
            }
            /////

            // throw new EnergyproSystemException("��������� ������� ������ !!!!
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
                        "��� ���� �������� �� ���� (� "
                                + act.numberGen
                                + " ) ... ��������� ����'���� �� ����!!! ...\n �� �� ������� ���, � ���� ������� ���� ;(");
            }
            ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            EstimateLogic Elogic = new EstimateLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());


            ENEstimateItem estOld;

            // ������

            ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem2ENEstimateItemFilter est2estFilter = new ENEstimateItem2ENEstimateItemFilter();

            for (int i = 0; i < oldEstimateList.length; i++) {
                // �� ������� ��������� � �������� ����� ������� �������� ��
                // ������ � ����� (������� ��������� ���������� � ������������ �
                // ���� �� ��������)
                // ��������� ���������� �� ������� ��������� � ���-�� �� ������
                // . ���� ���-�� �� ������ ����� ��� ������ ���������� ��
                // ������� ��������� ����� ������ �.� ������ ������� ������ ���
                // ���������

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
                            "������� ��� ��������� ����� ����� �� ��������!");
                }

                // ��������� ��������� �������� ��� ���� �������� � �����
                // ���������� � �� ��������� ������� �������� �� ������
                // ������������ ���������
                ENEstimateItem est = Elogic.getEstimateByOldEstimate(codePlan,
                        oldEstimateList[i].code);
                // ���� �� ����� �������� �������� � ������ ������ �������� 2
                // ��������
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

                    //������������� ������ ������� � �� , ��� �� ������ �� ����������� ��������� �������� ������
                   eilogic.createFinmaterialForWritingOffProtection(
                      		  estOld.code
                      		, estInsertedCode
                      		, oldEstimateList[i].countFact
                      		, codePlan
                      		, oldEstimateList[i].userGen // ��������� ���������� ��� ���.� ������� ��� ���������� (������������ � ���� ���������)
                      		, oldEstimateList[i].materialRefName// ��� ���������� ��� �������� ������� ��� ���������� (������������ � ���� ���������)
                      		, oldEstimateList[i].orderNumber //  �������� ������������� ���������� ��� �������� ������������� ������� ��� ���������� (������������ � ���� ���������)

                    			);



                } else
                // ���� ����� �� ������ ��������� � ������ ������
                {
                    est.countFact = (est.countFact)
                            .add(oldEstimateList[i].countFact);
                    est.countGen = (est.countGen)
                            .add(oldEstimateList[i].countFact);
                    objectDAO.save(est);

                  //������������� ������ ������� � �� , ��� �� ������ �� ����������� ��������� �������� ������
                    estInsertedCode = est.code;

                    	eilogic.createFinmaterialForWritingOffProtection(
                      		  estOld.code
                      		, estInsertedCode
                      		, oldEstimateList[i].countFact
                      		, codePlan
                      		, oldEstimateList[i].userGen // ��������� ���������� ��� ���.� ������� ��� ���������� (������������ � ���� ���������)
                      		, oldEstimateList[i].materialRefName// ��� ���������� ��� �������� ������� ��� ���������� (������������ � ���� ���������)
                      		, oldEstimateList[i].orderNumber //  �������� ������������� ���������� ��� �������� ������������� ������� ��� ���������� (������������ � ���� ���������)

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

            // �������� �������� ...
            FINMaterialsShortList fList = eLogic
                    .getFINMaterialsListByEstimateItemCode(code);
            if (fList.totalCount > 0) {
                /*throw new EnergyproSystemException(
                        "���� ����������������� ��������� ... ������� �������� !!!",
                        getUserProfile());*/
            	//SUPP-67830  ��� �������� ������������ ���������  ������� �������� �������� ���������
            	for (int ff = 0; ff < fList.totalCount; ff++) {
            		finMaterialsController.removeMaterials(fList.get(ff).code);
				}

            }

            // /// 31.12.10 �������� �� ����� ��������� � ���������
            eLogic.checkInContract(code);
            // ///

            // ��� �������� ������ - ��������� ������� �� ���-�
            ENPlanWork plan = logic.getPlanByCode(obj.planRef.code);


            // ���� ����� ������� // ���� � ����� ������� �� ���� ������
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

            // ������� �� ������ ...
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

            // throw new EnergyproSystemException("��������� ������� ������ !!!!
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

            if (dismountFromEstimate != Integer.MIN_VALUE) { // ���� ��� ��
                                                                // ��������� ���
                                                                // ������������
                                                                // ��� ��������
                                                                // �� ������� �
                                                                // ������
                ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile());
                ENEstimateItem2ENEstimateItem est2est = new ENEstimateItem2ENEstimateItem();
                est2est.countGen = object.countFact;
                // IN ��� ��� ������� �����������
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    est2est.estimateItemInRef.code = dismountFromEstimate;
                est2est.estimateItemOutRef.code = out;
                est2est.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
                est2estDAO.add(est2est);
            }

            return out;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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

            // ������ ������
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
                // IN ��� ��� ������� �����������
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    estObject.estimateItemInRef.code = dismountFromEstimate;
                if (object.code != Integer.MIN_VALUE)
                    estObject.estimateItemOutRef.code = object.code;
                estObject.typeRef.code = ENEstimateItem2Type.UNMOUNT_WRITE_OFF;
                // ���� ������ �������� � ������������ ��������� �� ��� ������
                // �� ����� � �� �� �������
                if (dismountFromEstimate != Integer.MIN_VALUE)
                    est2estDAO.save(estObject);
                else
                    est2estDAO.remove(est2estArr[e]);

            }

            saveUnmount(object, nomenclatureCode, nn, account);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
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

    // ���������� ��������� ��� ����������� �� �������� ��������� �����������
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
            * 18.10.2012 +++ ��� ������� ������ (����������, �������) ��������� -
            * ���� �� ���� �������� (������ "� �������") ���������� ������
            *
            */
            ENPlanWork plan = planDAO.getObject(object.planRef.code);
            if (plan.stateRef.code == ENPlanWorkState.BSZ
                    && plan.typeRef.code == ENPlanWorkType.SIZ) {

                if (oldObject.statusRef.code != ENEstimateItemStatus.PRESENT) {
                    throw new EnergyproSystemException(
                            "\n \n �������� ������� ������� ���� �� ������� � �������� \"� ��������\" ");
                }

                if (plan.kind.code == ENPlanWorkKind.YEAR)
                {
                	throw new SystemException("�� ��������������� �� ������ � ������ �������!");
                }

                /* �������� �� ������� ������ */
                RQOrderItem2ENEstimateItemDAO o2eDAO = new RQOrderItem2ENEstimateItemDAO(
                        getUserProfile(),
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                RQOrderItem2ENEstimateItemFilter o2eFilter = new RQOrderItem2ENEstimateItemFilter();
                o2eFilter.estimateItem.code = oldObject.code;
                int o2eArr[] = o2eDAO.getFilteredCodeArray(o2eFilter, 0, -1);
                if (o2eArr.length > 0) {
                    throw new EnergyproSystemException(
                            "\n \n ��� ������� ����������!!! "
                                    + "\n �������� ������� ������� ���� �� ������� � �������� \"� ��������\","
                                    + "\n ���� ��� ������������ ������!!! ");
                }

                objectDAO.changeCountFact(object.code, object.countFact,
                        ENEstimateItemStatus.PRESENT);

            } else {
                if (oldObject.countFact.doubleValue() != 0) {
                    throw new EnergyproSystemException(
                            "�������� ������� ���� ������� �������");
                }

                /*
                * 01.03.2012 +++ ������ ���-�� � ������ ������ "���������
                * ���������"
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


            // ������ ��������� !!! ����������� ���-�� �� ���� � �������� ...
            object = eLogic.calculateEstimateItemNoSave(object); // !!?? ��� �� ����������...

            object.statusRef.code = ENEstimateItemStatus.PLANNED;

            eLogic.checkInRQOrder(object, true, plan);

            // ��� ���-�� ... �� ��
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

    /* ENEstimateItem. ������ ���������� � ������� ��������� ��������� */
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

    /* ENEstimateItem. ������ ��� ����� �� � ������������ */
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
    * ��� ���������� , ��������������, �������� ���������� � ��������� ���
    * ����� �� ������� �������� ��������� � ����� "������ �� ������� �����" �
    * ��������� � �������� �� ��� �������� ��������� ����� ���� ������
    * ��������� �� ��������� ��������� � ����� ��������� "������ �� �������
    * �����".
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
        // ���� ����� ��������� ����
        if (plSingleCalculation != null) {

            // ���� �� �������� � ��������� �������� � ����� �� ������ �� ����
            // ����� ������ planworkitem ���� �� ��������� ���������
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
                    // ������ � ��������� ��������� ��������� �� ����������
                    // ������ � ����� "������ �� ������� �����"
                    for (int i = 0; i < eiArr.length; i++) {
                        eiDAO.remove(eiArr[i]);
                    }
                    // ������� ��� ��������� � ��������� � �������� ���
                    // ��������� ����������
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
    * �������� ����������� ����� ��� ���������������, �������������, ������������ � ���������� ���������
    * @param account ���������� ����
    */
    public void checkAccount(String account) {
        if(account == null || account.equals(""))
            throw new EnergyproSystemException("������ ���������� �������!");
        if(account.length() != 4)
            throw new EnergyproSystemException("������� ����������� ������� ������� ���� 4 �������");
        if(!Tools.checkIfStringConsistsOfDigits(account))
            throw new EnergyproSystemException("������������ ������ ����������� �������: \"" + account+"\"");
    }

    /**SUPP-79044 �������� ����������� ����� ��� ���������������� ���������
     * @param account ���������� ���� ���������������� ���������
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
    		throw new SystemException(String.format("��������� ������������ ������������ ������� �� ������� \"%s\".\n" +
    				"�������� ������� ��� ������������� ������������ ��������: %s"
    				, account, java.util.Arrays.toString(Tools.getQuotedStringArray(approvedAccounts))));
    	}
    }

    /**
    * 21.02.2014 SUPP-8470 �������������� ����� �������� ��� ��������� �� ������
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
    * 21.02.2014 SUPP-8470 ������� �������� ��� ��������� �� ������
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
     * NET-4445 - ���������� ��� ��������� � ��������� ����� �� ������������ � �� num_un ������� ��������� �������� (��� ������� �������� � sccounter ��� ����������� �� ����������)
     *          - ������������ ��� ������������ ����� �� ����������� �������� � ���������� ���� �� ������� �� ����� 1533.
     *          --  � ��������� ���� �� ����� ����� ���� �� �������� ,
     *              ���� ����� ���� �� ��� �� ����� �� ��������� � ����� ���������� �� ������ , �� ��������
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


 /** ���������� ���������� � ������������ � ������� ��������
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

   /**  �������� ����`���� �������� ����� �������� �� ������� ��������
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


     // �������� ���������� � ������  ������ ��������� � ��������� enestimateitem2contrct
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


     /**  ������ ���������� ��� ��������� � ��������� encontract
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

       // ³������ ����`���� �������� ����� �������� � ����� �� ��������
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

       /**  ���������� ��������� ���������� � ���� �������
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




     //  �������� �� ��������� ( ���������������  ���� � �� ���� �������) . �������� ������� �������� � �����. ��������� � ������ � ��������� �������
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

         //  �������� �� ������� ( ���������������  ���� � �� ���� �������) . �������� ������� �������� � �����. ��������� � ������ � ��������� �������
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

         // �������� �� ���������� ( ���������������  ���� � �� ���� �������) . �������� ������� �������� � �����. ��������� � ������ � ��������� �������
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
