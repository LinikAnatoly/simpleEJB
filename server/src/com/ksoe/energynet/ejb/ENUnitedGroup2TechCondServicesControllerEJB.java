//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENUnitedGroup2TechCondServices;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENUnitedGroup2TechCondServicesDAO;
import com.ksoe.energynet.dataminer.ENUnitedGroupConnectionsDAO;
import com.ksoe.energynet.ejb.generated.ENUnitedGroup2TechCondServicesControllerEJBGen;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;
import com.ksoe.energynet.valueobject.ENUnitedGroupConnections;
import com.ksoe.energynet.valueobject.brief.ENUnitedGroup2TechCondServicesShort;
import com.ksoe.energynet.valueobject.filter.ENUnitedGroup2TechCondServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENUnitedGroup2TechCondServicesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENUnitedGroup2TechCondServicesControllerEJB extends
        ENUnitedGroup2TechCondServicesControllerEJBGen {

    public ENUnitedGroup2TechCondServicesControllerEJB() {
    }

    /* ENUnitedGroup2TechCondServices. Добавить */
    public int add(ENUnitedGroup2TechCondServices object) {
        try {
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            TechConditionsLogic tcLogic = new TechConditionsLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            int objectCode = Integer.MIN_VALUE;

            /** проверка участия в группе unitedGroupL04D1 */
            if (object.costLines04Building1 != null
                    && object.costLines04Building1.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL04D1);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL04D1Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL04D1Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL04D1Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL04D1Filter, 0, -1);
                if (unitedGroupL04D1Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL04D1Arr[0]);
                    oldObject.costLines04Building1 = object.costLines04Building1;
                    oldObject.unitedGroupL04D1Ref.code = object.unitedGroupL04D1Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            /** проверка участия в группе unitedGroupL04D2 */
            if (object.costLines04Building2 != null
                    && object.costLines04Building2.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL04D2);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL04D2Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL04D2Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL04D2Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL04D2Filter, 0, -1);
                if (unitedGroupL04D2Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL04D2Arr[0]);
                    oldObject.costLines04Building2 = object.costLines04Building2;
                    oldObject.unitedGroupL04D2Ref.code = object.unitedGroupL04D2Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            /** проверка участия в группе unitedGroupL04D3 */
            if (object.costLines04Building3 != null
                    && object.costLines04Building3.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL04D3);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL04D3Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL04D3Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL04D3Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL04D3Filter, 0, -1);
                if (unitedGroupL04D3Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL04D3Arr[0]);
                    oldObject.costLines04Building3 = object.costLines04Building3;
                    oldObject.unitedGroupL04D3Ref.code = object.unitedGroupL04D3Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            /** проверка участия в группе unitedGroupTP04 */
            if (object.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {

                /** проверка принадлежности к одной подстанции */
                tcLogic.checkSubstations(object, ENElementType.SUBSTATION04);

                ENUnitedGroup2TechCondServicesFilter unitedGroupTP04Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupTP04Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupTP04Arr[] = objectDAO.getFilteredCodeArray(unitedGroupTP04Filter, 0, -1);
                if (unitedGroupTP04Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupTP04Arr[0]);
                    oldObject.unitedGroupTP04Ref.code = object.unitedGroupTP04Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            /** проверка участия в группе unitedGroupL10D1 */
            if (object.costLines10Building1 != null
                    && object.costLines10Building1.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL10D1);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL10D1Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL10D1Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL10D1Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL10D1Filter, 0, -1);
                if (unitedGroupL10D1Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL10D1Arr[0]);
                    oldObject.costLines10Building1 = object.costLines10Building1;
                    oldObject.unitedGroupL10D1Ref.code = object.unitedGroupL10D1Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }

            /** проверка участия в группе unitedGroupL10D2 */
            if (object.costLines10Building2 != null
                    && object.costLines10Building2.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL10D2);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL10D2Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL10D2Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL10D2Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL10D2Filter, 0, -1);
                if (unitedGroupL10D2Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL10D2Arr[0]);
                    oldObject.costLines10Building2 = object.costLines10Building2;
                    oldObject.unitedGroupL10D2Ref.code = object.unitedGroupL10D2Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }

            /** проверка участия в группе unitedGroupL10D3 */
            if (object.costLines10Building3 != null
                    && object.costLines10Building3.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL10D3);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL10D3Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL10D3Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL10D3Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL10D3Filter, 0, -1);
                if (unitedGroupL10D3Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL10D3Arr[0]);
                    oldObject.costLines10Building3 = object.costLines10Building3;
                    oldObject.unitedGroupL10D3Ref.code = object.unitedGroupL10D3Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }

            /** проверка участия в группе unitedGroupL10D4 */
            if (object.costLines10Building4 != null
                    && object.costLines10Building4.doubleValue() > 0) {

                /** проверка принадлежности к одной линии  */
                tcLogic.checkLines(object, groupType.unitedGroupL10D4);

                ENUnitedGroup2TechCondServicesFilter unitedGroupL10D4Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupL10D4Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupL10D4Arr[] = objectDAO.getFilteredCodeArray(unitedGroupL10D4Filter, 0, -1);
                if (unitedGroupL10D4Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupL10D4Arr[0]);
                    oldObject.costLines10Building4 = object.costLines10Building4;
                    oldObject.unitedGroupL10D4Ref.code = object.unitedGroupL10D4Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            /** проверка участия в группе unitedGroupPS35 */
            if (object.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {

                /** проверка принадлежности к одной подстанции */
                tcLogic.checkSubstations(object, ENElementType.SUBSTATION150);

                ENUnitedGroup2TechCondServicesFilter unitedGroupPS35Filter = new ENUnitedGroup2TechCondServicesFilter();
                unitedGroupPS35Filter.techCondServRef.code = object.techCondServRef.code;
                int unitedGroupPS35Arr[] = objectDAO.getFilteredCodeArray(unitedGroupPS35Filter, 0, -1);
                if (unitedGroupPS35Arr.length > 0) {
                    ENUnitedGroup2TechCondServices oldObject = objectDAO.getObject(unitedGroupPS35Arr[0]);
                    oldObject.unitedGroupPS35Ref.code = object.unitedGroupPS35Ref.code;
                    objectDAO.save(oldObject);
                    objectCode = oldObject.code;
                } else {
                    objectCode = objectDAO.add(object);
                }
            }


            return objectCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENUnitedGroup2TechCondServices. Сохранить строки договоров */
    public void saveUnitedGroup2TcsItems(
            ENUnitedGroup2TechCondServicesShort[] unitedGroup2TcsItems) {
        try {
            ENUnitedGroup2TechCondServicesDAO utcsDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            TechConditionsLogic tcLogic = new TechConditionsLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            /** проверка участия в группе unitedGroupL04D1 */
            if (unitedGroup2TcsItems[0].costLines04Building1 != null
                    && unitedGroup2TcsItems[0].costLines04Building1.doubleValue() > 0) {

                int unitedGroupL04D1 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL04D1Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL04D1List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL04D1Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL04D1Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl04d1refcod is not null ";
                    unitedGroupL04D1List = utcsDAO.getScrollableFilteredList(unitedGroupL04D1Filter, 0, -1);

                    if (unitedGroupL04D1List.totalCount > 0) {
                        unitedGroupL04D1 = unitedGroupL04D1List.get(0).unitedGroupL04D1RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL04D1 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D1RefDescription;
                    unitedGroupL04D1 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL04D1);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D1RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL04D1Ref.code = unitedGroupL04D1;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines04Building1 = unitedGroup2TcsItems[i].costLines04Building1;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupL04D2 */
            if (unitedGroup2TcsItems[0].costLines04Building2 != null
                    && unitedGroup2TcsItems[0].costLines04Building2.doubleValue() > 0) {

                int unitedGroupL04D2 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL04D2Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL04D2List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL04D2Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL04D2Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl04d2refcod is not null ";
                    unitedGroupL04D2List = utcsDAO.getScrollableFilteredList(unitedGroupL04D2Filter, 0, -1);

                    if (unitedGroupL04D2List.totalCount > 0) {
                        unitedGroupL04D2 = unitedGroupL04D2List.get(0).unitedGroupL04D2RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL04D2 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D2RefDescription;
                    unitedGroupL04D2 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL04D2);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D2RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL04D2Ref.code = unitedGroupL04D2;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines04Building2 = unitedGroup2TcsItems[i].costLines04Building2;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupL04D3 */
            if (unitedGroup2TcsItems[0].costLines04Building3 != null
                    && unitedGroup2TcsItems[0].costLines04Building3.doubleValue() > 0) {

                int unitedGroupL04D3 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL04D3Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL04D3List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL04D3Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL04D3Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl04d3refcod is not null ";
                    unitedGroupL04D3List = utcsDAO.getScrollableFilteredList(unitedGroupL04D3Filter, 0, -1);

                    if (unitedGroupL04D3List.totalCount > 0) {
                        unitedGroupL04D3 = unitedGroupL04D3List.get(0).unitedGroupL04D3RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL04D3 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D3RefDescription;
                    unitedGroupL04D3 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL04D3);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL04D3RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL04D3Ref.code = unitedGroupL04D3;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines04Building3 = unitedGroup2TcsItems[i].costLines04Building3;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupTP04
             *  ничего нет лучше, чем примечание......
             */
            if (unitedGroup2TcsItems[0].unitedGroupTP04RefDescription != null) {

                int unitedGroupTP04 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupTP04Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupTP04List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupTP04Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupTP04Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgrouptp04refcode is not null ";
                    unitedGroupTP04List = utcsDAO.getScrollableFilteredList(unitedGroupTP04Filter, 0, -1);

                    if (unitedGroupTP04List.totalCount > 0) {
                        unitedGroupTP04 = unitedGroupTP04List.get(0).unitedGroupTP04RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupTP04 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupTP04RefDescription;
                    unitedGroupTP04 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupTP04);
                    group.description = unitedGroup2TcsItems[0].unitedGroupTP04RefDescription;
                    groupDAO.save(group);
                }

                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupTP04Ref.code = unitedGroupTP04;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;

                    this.add(utcs);
                }
            }



            /** проверка участия в группе unitedGroupL10D1 */
            if (unitedGroup2TcsItems[0].costLines10Building1 != null
                    && unitedGroup2TcsItems[0].costLines10Building1.doubleValue() > 0) {

                int unitedGroupL10D1 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL10D1Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL10D1List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL10D1Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL10D1Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl10d1refcod is not null ";
                    unitedGroupL10D1List = utcsDAO.getScrollableFilteredList(unitedGroupL10D1Filter, 0, -1);

                    if (unitedGroupL10D1List.totalCount > 0) {
                        unitedGroupL10D1 = unitedGroupL10D1List.get(0).unitedGroupL10D1RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL10D1 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D1RefDescription;
                    unitedGroupL10D1 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL10D1);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D1RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL10D1Ref.code = unitedGroupL10D1;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines10Building1 = unitedGroup2TcsItems[i].costLines10Building1;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupL10D2 */
            if (unitedGroup2TcsItems[0].costLines10Building2 != null
                    && unitedGroup2TcsItems[0].costLines10Building2.doubleValue() > 0) {

                int unitedGroupL10D2 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL10D2Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL10D2List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL10D2Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL10D2Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl10d2refcod is not null ";
                    unitedGroupL10D2List = utcsDAO.getScrollableFilteredList(unitedGroupL10D2Filter, 0, -1);

                    if (unitedGroupL10D2List.totalCount > 0) {
                        unitedGroupL10D2 = unitedGroupL10D2List.get(0).unitedGroupL10D2RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL10D2 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D2RefDescription;
                    unitedGroupL10D2 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL10D2);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D2RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL10D2Ref.code = unitedGroupL10D2;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines10Building2 = unitedGroup2TcsItems[i].costLines10Building2;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupL10D3 */
            if (unitedGroup2TcsItems[0].costLines10Building3 != null
                    && unitedGroup2TcsItems[0].costLines10Building3.doubleValue() > 0) {

                int unitedGroupL10D3 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL10D3Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL10D3List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL10D3Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL10D3Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl10d3refcod is not null ";
                    unitedGroupL10D3List = utcsDAO.getScrollableFilteredList(unitedGroupL10D3Filter, 0, -1);

                    if (unitedGroupL10D3List.totalCount > 0) {
                        unitedGroupL10D3 = unitedGroupL10D3List.get(0).unitedGroupL10D3RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL10D3 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D3RefDescription;
                    unitedGroupL10D3 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL10D3);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D3RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL10D3Ref.code = unitedGroupL10D3;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines10Building3 = unitedGroup2TcsItems[i].costLines10Building3;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupL10D4 */
            if (unitedGroup2TcsItems[0].costLines10Building4 != null
                    && unitedGroup2TcsItems[0].costLines10Building4.doubleValue() > 0) {

                int unitedGroupL10D4 = Integer.MIN_VALUE;
                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupL10D4Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupL10D4List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupL10D4Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupL10D4Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupl10d4refcod is not null ";
                    unitedGroupL10D4List = utcsDAO.getScrollableFilteredList(unitedGroupL10D4Filter, 0, -1);

                    if (unitedGroupL10D4List.totalCount > 0) {
                        unitedGroupL10D4 = unitedGroupL10D4List.get(0).unitedGroupL10D4RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupL10D4 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D4RefDescription;
                    unitedGroupL10D4 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupL10D4);
                    group.description = unitedGroup2TcsItems[0].unitedGroupL10D4RefDescription;
                    groupDAO.save(group);
                }


                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupL10D4Ref.code = unitedGroupL10D4;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    utcs.costLines10Building4 = unitedGroup2TcsItems[i].costLines10Building4;

                    this.add(utcs);
                }
            }


            /** проверка участия в группе unitedGroupPS35
             *  ничего нет лучше, чем примечание......
             */
            if (unitedGroup2TcsItems[0].unitedGroupPS35RefDescription != null) {
                int unitedGroupPS35 = Integer.MIN_VALUE;

                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServicesFilter unitedGroupPS35Filter = new ENUnitedGroup2TechCondServicesFilter();
                    ENUnitedGroup2TechCondServicesShortList unitedGroupPS35List = new ENUnitedGroup2TechCondServicesShortList();
                    unitedGroupPS35Filter.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;
                    unitedGroupPS35Filter.conditionSQL = " enunitdgrp2tchcndsrvcs.unitedgroupps35refcode is not null ";
                    unitedGroupPS35List = utcsDAO.getScrollableFilteredList(unitedGroupPS35Filter, 0, -1);

                    if (unitedGroupPS35List.totalCount > 0) {
                        unitedGroupPS35 = unitedGroupPS35List.get(0).unitedGroupPS35RefCode;
                    }
                }

                ENUnitedGroupConnectionsDAO groupDAO = new ENUnitedGroupConnectionsDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENUnitedGroupConnections group = new ENUnitedGroupConnections();

                if (unitedGroupPS35 == Integer.MIN_VALUE) {
                    group.name = "" + groupDAO._collectAutoIncrementFields();
                    group.description = unitedGroup2TcsItems[0].unitedGroupPS35RefDescription;
                    unitedGroupPS35 = groupDAO.add(group);
                } else {
                    group = groupDAO.getObject(unitedGroupPS35);
                    group.description = unitedGroup2TcsItems[0].unitedGroupPS35RefDescription;
                    groupDAO.save(group);
                }

                for (int i = 0; i < unitedGroup2TcsItems.length; i++) {
                    ENUnitedGroup2TechCondServices utcs = new ENUnitedGroup2TechCondServices();

                    utcs.unitedGroupPS35Ref.code = unitedGroupPS35;
                    utcs.techCondServRef.code = unitedGroup2TcsItems[i].techCondServRefCode;

                    this.add(utcs);
                }
            }



        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get saveUnitedGroup2TcsItems.", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    public ENUnitedGroup2TechCondServicesShortList getENLine04ListByTechCondServices(int techCondServicesCode)
    {
        try {
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            return objectDAO.getENLine04ListByTechCondServices(techCondServicesCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't getENLine04ListByTechCondServices",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENUnitedGroup2TechCondServicesShortList getENSubstation04ListByTechCondServices(int techCondServicesCode)
    {
        try {
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            return objectDAO.getENSubstation04ListByTechCondServices(techCondServicesCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't getENSubstation04ListByTechCondServices",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENUnitedGroup2TechCondServicesShortList getENLine10ListByTechCondServices(int techCondServicesCode)
    {
        try {
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            return objectDAO.getENLine10ListByTechCondServices(techCondServicesCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't getENLine10ListByTechCondServices",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public ENUnitedGroup2TechCondServicesShortList getENSubstation35ListByTechCondServices(int techCondServicesCode)
    {
        try {
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            return objectDAO.getENSubstation35ListByTechCondServices(techCondServicesCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't getENLine10ListByTechCondServices",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public class groupType {
        public static final int unitedGroupL04D1 = 401;
        public static final int unitedGroupL04D2 = 402;
        public static final int unitedGroupL04D3 = 403;
        public static final int unitedGroupL10D1 = 101;
        public static final int unitedGroupL10D2 = 102;
        public static final int unitedGroupL10D3 = 103;
        public static final int unitedGroupL10D4 = 104;
    }

} // end of EJB Controller for ENUnitedGroup2TechCondServices