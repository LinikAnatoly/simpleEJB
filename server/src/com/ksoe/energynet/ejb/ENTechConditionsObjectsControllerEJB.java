//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTechConditionsObjects;
 *
 */

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energyWorkflow.valueobject.WFGroupType;
import com.ksoe.energyWorkflow.valueobject.WFPack;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.ejb.generated.ENTechConditionsObjectsControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENTechConditionsObjectsControllerEJB extends
        ENTechConditionsObjectsControllerEJBGen {

    public ENTechConditionsObjectsControllerEJB() {
    }

    /* ENTechConditionsObjects. Добавить */
    @Override
	public int add(ENTechConditionsObjects object) {
        try {

            object.setDomain_info(null);

            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;

            ENElement e = new ENElement();
            e.typeRef.code = ENElementType.TECHCONDITIONS;

            ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            if (object.element.renRef != null) {
                if (object.element.renRef.code != Integer.MIN_VALUE) {
                    e.renRef.code = object.element.renRef.code;
                }
            }

            if (e.renRef.code == Integer.MIN_VALUE) {
                e.renRef.code = 0;
            }

            object.element.code = elementDAO.add(e);
            object.element.renRef.code = e.renRef.code;
            object.element.typeRef.code = e.typeRef.code;

            ENTechConditionsObjectsDAO objectDAO = new ENTechConditionsObjectsDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            if (object.building != null && !object.building.equals("")) {
                object.building = object.building.replaceAll("\n"," ").trim();
            }

            if (object.connectionPowerPlaces != null && !object.connectionPowerPlaces.equals("")) {
                object.connectionPowerPlaces = object.connectionPowerPlaces.replaceAll("\n"," ").trim();
            }

            if (object.connectionPowerPoint != null && !object.connectionPowerPoint.equals("")) {
                object.connectionPowerPoint = object.connectionPowerPoint.replaceAll("\n"," ").trim();
            }

            return objectDAO.add(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENTechConditionsObjects%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENTechConditionsObjects. Изменить */
    @Override
	public void save(ENTechConditionsObjects object) {

        Connection wfConnection = null;
        try {

            ENTechConditionsObjectsDAO objectDAO = new ENTechConditionsObjectsDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            if (object.building == null)
            {object.building = "";}

            if (object.building != null && !object.building.equals("")) {
                object.building = object.building.replaceAll("\n"," ").trim();
            }

            if (object.connectionPowerPlaces != null && !object.connectionPowerPlaces.equals("")) {
                object.connectionPowerPlaces = object.connectionPowerPlaces.replaceAll("\n"," ").trim();
            }

            if (object.connectionPowerPoint != null && !object.connectionPowerPoint.equals("")) {
                object.connectionPowerPoint = object.connectionPowerPoint.replaceAll("\n"," ").trim();
            }

            ENTechConditionsObjects oldObject = objectDAO.getObject(object.code);
            if ((oldObject.dateGen == null && object.dateGen != null) ||
                    (oldObject.dateGen != null && object.dateGen == null) ||
                    (oldObject.dateGen != null && object.dateGen != null && oldObject.dateGen.compareTo(object.dateGen) != 0 ))  {
                ServicesLogic sLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                ENServicesObject so = sLogic.getServicesObjectByTechCoditionObjectCode(object.code);

                wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
                WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, getUserProfile());

                WFPack wfPack = workFlowLogic.getWFPackByENServicesObjectCode(so.code);
                if (wfPack == null) {
                    return;
                }

               if (workFlowLogic.getPackGroupCode(wfPack.code, WFGroupType.TECH_CONDITION_DATE_CORRECTION) == Integer.MIN_VALUE) {
                   throw new SystemException("Пакет не знаходиться на стадіях, які дозволяють редагувати дату технічних умов!");
               }

            }


            objectDAO.save(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENTechConditionsObjects%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
            try {
                if (wfConnection != null && !wfConnection.isClosed()) {
                    wfConnection.close();
                    wfConnection = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    /* ENTechConditionsObjects. Удалить */
    @Override
	public void remove(int code) {
        try {
            ENTechConditionsObjectsDAO objectDAO = new ENTechConditionsObjectsDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTechConditionsObjects object = objectDAO.getObject(code);

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.elementRef.code = object.element.code;
            int[] plArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
            if (plArr.length > 0) {
                throw new EnergyproSystemException(
                        "Видаляти не можна!!! Для цього об’єкту існують плани!!! ");
            }

            objectDAO.remove(code);

            ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            elDAO.remove(object.element.code);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENTechConditionsObjects%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENTechConditionsObjects. Сгенерить идентификатор для техусловий */
    public void generateIdentNumber(int code) {
        try {
            TechConditionsLogic techLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            techLogic.generateIdentNumber(code);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't generateIdentNumber {%com.ksoe.energynet.valueobject.ENTechConditionsObjects%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENTechConditionsObjects. Сгенерить идентификатор для техусловий */
    public void resetIdentNumber(int code) {
        try {
            TechConditionsLogic techLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            techLogic.resetIdentNumber(code);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't resetIdentNumber {%com.ksoe.energynet.valueobject.ENTechConditionsObjects%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



    /**
     * Получить список Тех.Условий для сайта
     *
     * @param ENTechConditionsObjectsFilter
     * @return ENTechConditionsObjectsShortList
     */
	public ENTechConditionsObjectsShortList getPublicListTechConditions(ENTechConditionsObjectsFilter filterObject) {
		try {

			TechConditionsLogic techConditionsLogic = new  TechConditionsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return techConditionsLogic.getPublicListTechConditions(filterObject);

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



} // end of EJB Controller for ENTechConditionsObjects