//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENUnitedGroup2TechCondServicesDAOGen;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;
import com.ksoe.energynet.valueobject.brief.ENUnitedGroup2TechCondServicesShort;
import com.ksoe.energynet.valueobject.lists.ENUnitedGroup2TechCondServicesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENUnitedGroup2TechCondServices;
 *
 */

public class ENUnitedGroup2TechCondServicesDAO extends
        ENUnitedGroup2TechCondServicesDAOGen {

    public ENUnitedGroup2TechCondServicesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENUnitedGroup2TechCondServicesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


    public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(
            ENUnitedGroup2TechCondServices aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) throws PersistenceException {
        ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
        ENUnitedGroup2TechCondServicesShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = " 2 ";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = " select " +
                //" coalesce((select enunitdgrp2tchcndsrvcs.code from enunitdgrp2tchcndsrvcs " +
                //"  where enunitdgrp2tchcndsrvcs.techcondservrefcode = entechconditionsservcs.code),-1) as ug2tcode, " +
                " coalesce(enunitdgrp2tchcndsrvcs.code, -1) as ug2tcode, " +

                " entechconditionsservcs.code, " +

                " entechconditionsservcs.partnername, " +
                " entechconditionsservcs.contractnumber||'/'||entechconditionsservcs.fincontractnumber, " +
                " entechconditionsservcs.tyservicespower, " +

                " (select l.invnumber from enline04 l " +
                " where l.code = entechconditionsservcs.airline04refcode) as line04invnumber, " +
                " (select l.name from enline04 l " +
                " where l.code = entechconditionsservcs.airline04refcode) as line04name, " +

                " (select s.invnumber from ensubstation04 s " +
                " where s.code = entechconditionsservcs.s04refcode) as tp04invnumber, " +
                " (select s.name from ensubstation04 s " +
                " where s.code = entechconditionsservcs.s04refcode) as tp04name, " +

                " (select li.invnumber from enline10 li " +
                " where li.code = entechconditionsservcs.airline10refcode) as line10invnumber, " +
                " (select li.name from enline10 li " +
                " where li.code = entechconditionsservcs.airline10refcode) as line10name, " +

                " (select so.invnumber from ensubstation150 so " +
                " where so.code = entechconditionsservcs.s35refcode) as pc35invnumber, " +
                " (select so.name from ensubstation150 so " +
                " where so.code = entechconditionsservcs.s35refcode) as pc35name, " +

                " coalesce((select coalesce(sum(d.paysum),0) from enpriconnectiondata d " +
                " where d.techcondservrefcode = entechconditionsservcs.code),0) as paysum, " +  // 14

                " enunitdgrp2tchcndsrvcs.costlines04building, " +
                " enunitdgrp2tchcndsrvcs.costlines10building, " +

                /** группа unitedGroupL04D1 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d1refcod, " +
                " (select g.name from enunitedgroupconnectns g " +
                " where g.code = enunitdgrp2tchcndsrvcs.unitedgroupl04d1refcod),  " +
                " (select g.description from enunitedgroupconnectns g " +
                " where g.code = enunitdgrp2tchcndsrvcs.unitedgroupl04d1refcod),  " +
                " enunitdgrp2tchcndsrvcs.costlines04building1, " +

                /** группа unitedGroupL04D2 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d2refcod, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d2refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d2refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines04building2," +

                /** группа unitedGroupL04D3 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d3refcod, " +
                "(select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d3refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl04d3refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines04building3, " +

                /** группа unitedGroupTP04 */
                " enunitdgrp2tchcndsrvcs.unitedgrouptp04refcode, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgrouptp04refcode), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgrouptp04refcode), " +                           // 31

                /** группа unitedGroupL10D1 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d1refcod, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d1refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d1refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines10building1, " +

                /** группа unitedGroupL10D2 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d2refcod, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d2refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d2refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines10building2, " +

                /** группа unitedGroupL10D3 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d3refcod, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d3refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d3refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines10building3, " +

                /** группа unitedGroupL10D4 */
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d4refcod, " +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d4refcod), " +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupl10d4refcod), " +
                " enunitdgrp2tchcndsrvcs.costlines10building4, " +

                /** группа unitedGroupPS35 */
                " enunitdgrp2tchcndsrvcs.unitedgroupps35refcode," +
                " (select g.name from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupps35refcode)," +
                " (select g.description from enunitedgroupconnectns g where g.code = " +
                " enunitdgrp2tchcndsrvcs.unitedgroupps35refcode), " +                          // 50

                " entechconditionsservcs.airline04refcode as line04code, " +
                " entechconditionsservcs.s04refcode as tp04code, " +
                " entechconditionsservcs.airline10refcode as line10code, " +
                " entechconditionsservcs.s35refcode as pc35code " +                // 54

                " from entechconditionsservcs " +
                " left join enunitdgrp2tchcndsrvcs on enunitdgrp2tchcndsrvcs.techcondservrefcode = entechconditionsservcs.code " +

                "";

                whereStr = " entechconditionsservcs.connectionkindrefcode = " + ENConnectionKind.NO_STANDART;
                whereStr = whereStr + " and entechconditionsservcs.fincontractnumber is not null";


        if(aFilterObject != null) {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.CODE = ?";
            }
            if(aFilterObject.costLines04Building != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING = ?";
            }
            if(aFilterObject.costLines04Building1 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1 = ?";
            }
            if(aFilterObject.costLines04Building2 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2 = ?";
            }
            if(aFilterObject.costLines04Building3 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3 = ?";
            }
            if(aFilterObject.costLines10Building != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING = ?";
            }
            if(aFilterObject.costLines10Building1 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1 = ?";
            }
            if(aFilterObject.costLines10Building2 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2 = ?";
            }
            if(aFilterObject.costLines10Building3 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3 = ?";
            }
            if(aFilterObject.costLines10Building4 != null) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4 = ?";
            }
            if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE = ? ";
            }
            if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE = ? ";
            }
            if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD = ? ";
            }
            if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE = ? ";
            }
        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE " + whereStr;

        selectStr = selectStr + " ORDER BY " + orderBy;

        selectStr = selectStr + " OFFSET " + fromPosition;
        if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;

            if(aFilterObject != null){
                if(aFilterObject.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.code);
                }
               if(aFilterObject.costLines04Building != null){
                   number++;
                   aFilterObject.costLines04Building = aFilterObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines04Building);
               }
               if(aFilterObject.costLines04Building1 != null){
                   number++;
                   aFilterObject.costLines04Building1 = aFilterObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines04Building1);
               }
               if(aFilterObject.costLines04Building2 != null){
                   number++;
                   aFilterObject.costLines04Building2 = aFilterObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines04Building2);
               }
               if(aFilterObject.costLines04Building3 != null){
                   number++;
                   aFilterObject.costLines04Building3 = aFilterObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines04Building3);
               }
               if(aFilterObject.costLines10Building != null){
                   number++;
                   aFilterObject.costLines10Building = aFilterObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines10Building);
               }
               if(aFilterObject.costLines10Building1 != null){
                   number++;
                   aFilterObject.costLines10Building1 = aFilterObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines10Building1);
               }
               if(aFilterObject.costLines10Building2 != null){
                   number++;
                   aFilterObject.costLines10Building2 = aFilterObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines10Building2);
               }
               if(aFilterObject.costLines10Building3 != null){
                   number++;
                   aFilterObject.costLines10Building3 = aFilterObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines10Building3);
               }
               if(aFilterObject.costLines10Building4 != null){
                   number++;
                   aFilterObject.costLines10Building4 = aFilterObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                   statement.setBigDecimal(number,aFilterObject.costLines10Building4);
               }
              if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.techCondServRef.code);
              }
              if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL04D1Ref.code);
              }
              if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL04D2Ref.code);
              }
              if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL04D3Ref.code);
              }
              if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupTP04Ref.code);
              }
              if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL10D1Ref.code);
              }
              if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL10D2Ref.code);
              }
              if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL10D3Ref.code);
              }
              if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupL10D4Ref.code);
              }
              if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,aFilterObject.unitedGroupPS35Ref.code);
              }
             }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
//                if (i < fromPosition)
//                    continue;
//                else if (i >= fromPosition + quantity) {
//                    i++;
//                    break;
//                }

                anObject = new ENUnitedGroup2TechCondServicesShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;

                anObject.code = set.getInt(1);
                anObject.techCondServRefCode = set.getInt(2);
                if (set.wasNull())
                    anObject.techCondServRefCode = Integer.MIN_VALUE;

                anObject.techCondServRefPartnerName = set.getString(3);
                anObject.techCondServRefContractNumber = set.getString(4);
                anObject.techCondServRefTyServicesPower = set.getBigDecimal(5);
                if (anObject.techCondServRefTyServicesPower != null)
                    anObject.techCondServRefTyServicesPower = anObject.techCondServRefTyServicesPower
                            .setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

                anObject.line04InvNumber = set.getString(6);
                anObject.line04Name = set.getString(7);

                anObject.tp04InvNumber = set.getString(8);
                anObject.tp04Name = set.getString(9);

                anObject.line10invnumber = set.getString(10);
                anObject.line10Name = set.getString(11);

                anObject.pc35InvNumber = set.getString(12);
                anObject.pc35Name = set.getString(13);

                anObject.paySum = set.getBigDecimal(14);
                if (anObject.paySum != null)
                    anObject.paySum = anObject.paySum
                            .setScale(5, java.math.BigDecimal.ROUND_HALF_UP);


                anObject.costLines04Building = set.getBigDecimal(15);
                if (anObject.costLines04Building != null)
                    anObject.costLines04Building = anObject.costLines04Building
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                anObject.costLines10Building = set.getBigDecimal(16);
                if (anObject.costLines10Building != null)
                    anObject.costLines10Building = anObject.costLines10Building
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL04D1 */
                anObject.unitedGroupL04D1RefCode = set.getInt(17);
                if (set.wasNull())
                    anObject.unitedGroupL04D1RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL04D1RefName = set.getString(18);
                anObject.unitedGroupL04D1RefDescription = set.getString(19);

                anObject.costLines04Building1 = set.getBigDecimal(20);
                if (anObject.costLines04Building1 != null)
                    anObject.costLines04Building1 = anObject.costLines04Building1
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL04D2 */
                anObject.unitedGroupL04D2RefCode = set.getInt(21);
                if (set.wasNull())
                    anObject.unitedGroupL04D2RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL04D2RefName = set.getString(22);
                anObject.unitedGroupL04D2RefDescription = set.getString(23);

                anObject.costLines04Building2 = set.getBigDecimal(24);
                if (anObject.costLines04Building2 != null)
                    anObject.costLines04Building2 = anObject.costLines04Building2
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL04D3 */
                anObject.unitedGroupL04D3RefCode = set.getInt(25);
                if (set.wasNull())
                    anObject.unitedGroupL04D3RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL04D3RefName = set.getString(26);
                anObject.unitedGroupL04D3RefDescription = set.getString(27);

                anObject.costLines04Building3 = set.getBigDecimal(28);
                if (anObject.costLines04Building3 != null)
                    anObject.costLines04Building3 = anObject.costLines04Building3
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupTP04 */
                anObject.unitedGroupTP04RefCode = set.getInt(29);
                if (set.wasNull())
                    anObject.unitedGroupTP04RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupTP04RefName = set.getString(30);
                anObject.unitedGroupTP04RefDescription = set.getString(31);



                /** группа unitedGroupL10D1 */
                anObject.unitedGroupL10D1RefCode = set.getInt(32);
                if (set.wasNull())
                    anObject.unitedGroupL10D1RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL10D1RefName = set.getString(33);
                anObject.unitedGroupL10D1RefDescription = set.getString(34);

                anObject.costLines10Building1 = set.getBigDecimal(35);
                if (anObject.costLines10Building1 != null)
                    anObject.costLines10Building1 = anObject.costLines10Building1
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL10D2 */
                anObject.unitedGroupL10D2RefCode = set.getInt(36);
                if (set.wasNull())
                    anObject.unitedGroupL10D2RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL10D2RefName = set.getString(37);
                anObject.unitedGroupL10D2RefDescription = set.getString(38);

                anObject.costLines10Building2 = set.getBigDecimal(39);
                if (anObject.costLines10Building2 != null)
                    anObject.costLines10Building2 = anObject.costLines10Building2
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL10D3 */
                anObject.unitedGroupL10D3RefCode = set.getInt(40);
                if (set.wasNull())
                    anObject.unitedGroupL10D3RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL10D3RefName = set.getString(41);
                anObject.unitedGroupL10D3RefDescription = set.getString(42);

                anObject.costLines10Building3 = set.getBigDecimal(43);
                if (anObject.costLines10Building3 != null)
                    anObject.costLines10Building3 = anObject.costLines10Building3
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupL10D4 */
                anObject.unitedGroupL10D4RefCode = set.getInt(44);
                if (set.wasNull())
                    anObject.unitedGroupL10D4RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupL10D4RefName = set.getString(45);
                anObject.unitedGroupL10D4RefDescription = set.getString(46);

                anObject.costLines10Building4 = set.getBigDecimal(47);
                if (anObject.costLines10Building4 != null)
                    anObject.costLines10Building4 = anObject.costLines10Building4
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                /** группа unitedGroupPS35 */
                anObject.unitedGroupPS35RefCode = set.getInt(48);
                if (set.wasNull())
                    anObject.unitedGroupPS35RefCode = Integer.MIN_VALUE;

                anObject.unitedGroupPS35RefName = set.getString(49);
                anObject.unitedGroupPS35RefDescription = set.getString(50);


                anObject.line04Code = set.getInt(51);
                if (set.wasNull())
                    anObject.line04Code = Integer.MIN_VALUE;

                anObject.tp04Code = set.getInt(52);
                if (set.wasNull())
                    anObject.tp04Code = Integer.MIN_VALUE;

                anObject.line10Code = set.getInt(53);
                if (set.wasNull())
                    anObject.line10Code = Integer.MIN_VALUE;

                anObject.pc35Code = set.getInt(54);
                if (set.wasNull())
                    anObject.pc35Code = Integer.MIN_VALUE;



                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    public ENUnitedGroup2TechCondServicesShortList getENLine04ListByTechCondServices(int techCondServicesCode) throws PersistenceException
    {
        if (techCondServicesCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("Не вказано код договору!");
        }

        ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
        ENUnitedGroup2TechCondServicesShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        //String whereStr = "";


        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr =
            " select  \n" +
            "   q.groupcode,  \n" +
            "   (select g.name from enunitedgroupconnectns g where g.code = q.groupcode) as groupname, \n" +
            "   (select g.description from enunitedgroupconnectns g where g.code = q.groupcode) as groupdescription, \n" +
            "   tc.code as tccode, tc.partnername, tc.contractnumber, tc.cnpackcode, tc.cnsubsystemtyperefcode, \n" +
            "   (select st.name  \n" +
            "    from cnsubsystemtype st  \n" +
            "    where st.code = tc.cnsubsystemtyperefcode) as cnsubsystemname, \n" +

            "   (select l.invnumber from enline04 l where l.code = tc.airline04refcode) as line04invnumber, \n" +
            "   (select l.name from enline04 l where l.code = tc.airline04refcode) as line04name \n" +

            " from  \n" +
            " ( \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl04d1refcod as groupcode, 1 as partnum \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc \n" +
            "   where g2tc.unitedgroupl04d1refcod in \n" +
            "   ( \n" +
            "   select  \n" +
            "     g2tc1.unitedgroupl04d1refcod  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1 \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   ) \n" +
            "  \n" +
            "   union all \n" +
            "  \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl04d2refcod as groupcode, 2 as partnum  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc \n" +
            "   where g2tc.unitedgroupl04d2refcod in \n" +
            "   ( \n" +
            "   select  \n" +
            "     g2tc1.unitedgroupl04d2refcod  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1 \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   ) \n" +
            "  \n" +
            "   union all \n" +
            "  \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl04d3refcod as groupcode, 3 as partnum \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc \n" +
            "   where g2tc.unitedgroupl04d3refcod in \n" +
            "   ( \n" +
            "   select  \n" +
            "     g2tc1.unitedgroupl04d3refcod  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1 \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   ) \n" +
            " ) q,  \n" +
            " entechconditionsservcs tc,  \n" +
            " enservicesobject so, enservicesobject2techcondtnsservices so2tc \n" +
            ///// 12.06.13 И.Н.С. Самого себя тоже показываем
            //" where q.techcondservrefcode <> ? \n" +
            //"   and tc.code = q.techcondservrefcode \n" +
            /////
            " where tc.code = q.techcondservrefcode \n" +
            "   and so2tc.servicesobjectrefcode = so.code \n" +
            "   and so2tc.techcondservrefcode = tc.code \n" +
            " order by groupcode, groupname, partnername ";

        try {
            statement = connection.prepareStatement(selectStr);


            statement.setInt(1, techCondServicesCode);
            statement.setInt(2, techCondServicesCode);
            statement.setInt(3, techCondServicesCode);
            //statement.setInt(4, techCondServicesCode);


            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENUnitedGroup2TechCondServicesShort();

/*
  q.groupcode,
  groupname,
  groupdescription,
  tccode, tc.partnername, tc.contractnumber,
  tc.cnpackcode, tc.cnsubsystemtyperefcode, cnsubsystemname,
  line04invnumber, line04name
 */

                //anObject.code = set.getInt(1);
                //if (set.wasNull())
                anObject.code = Integer.MIN_VALUE;

                anObject.unitedGroupL04D1RefCode = set.getInt(1);
                if (set.wasNull())
                    anObject.unitedGroupL04D1RefCode = Integer.MIN_VALUE;
                anObject.unitedGroupL04D1RefName = set.getString(2);
                anObject.unitedGroupL04D1RefDescription = set.getString(3);

                anObject.techCondServRefCode = set.getInt(4);
                if (set.wasNull())
                    anObject.techCondServRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefPartnerName = set.getString(5);
                anObject.techCondServRefContractNumber = set.getString(6);

                anObject.techCondServRefCnPackCode = set.getInt(7);
                if (set.wasNull())
                    anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefCode = set.getInt(8);
                if (set.wasNull())
                    anObject.techCondServRefCnSubsystemRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefName = set.getString(9);

                anObject.line04InvNumber = set.getString(10);
                anObject.line04Name = set.getString(11);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    public ENUnitedGroup2TechCondServicesShortList getENSubstation04ListByTechCondServices(int techCondServicesCode) throws PersistenceException
    {
        if (techCondServicesCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("Не вказано код договору!");
        }

        ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
        ENUnitedGroup2TechCondServicesShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        //String whereStr = "";


        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr =
            " select  \n" +
            "   q.groupcode,  \n" +
            "   (select g.name from enunitedgroupconnectns g where g.code = q.groupcode) as groupname, \n" +
            "   (select g.description from enunitedgroupconnectns g where g.code = q.groupcode) as groupdescription, \n" +
            "   tc.code as tccode, \n" +
            "   tc.partnername, tc.contractnumber, tc.cnpackcode, tc.cnsubsystemtyperefcode, \n" +
            "   (select st.name  \n" +
            "    from cnsubsystemtype st  \n" +
            "    where st.code = tc.cnsubsystemtyperefcode) as cnsubsystemname, \n" +
            "              \n" +
            "   (select s.invnumber from ensubstation04 s where s.code = tc.s04refcode) as s04invnumber,  \n" +
            "   (select s.name from ensubstation04 s where s.code = tc.s04refcode) as s04name  \n" +
            " from  \n" +
            " ( \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgrouptp04refcode as groupcode \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc \n" +
            "   where g2tc.unitedgrouptp04refcode in \n" +
            "   ( \n" +
            "   select  \n" +
            "     g2tc1.unitedgrouptp04refcode  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1 \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   ) \n" +
            " ) q,  \n" +
            " entechconditionsservcs tc,  \n" +
            " enservicesobject so, enservicesobject2techcondtnsservices so2tc \n" +
            ///// 12.06.13 И.Н.С. Самого себя тоже показываем
            //" where q.techcondservrefcode <> ? \n" +
            //"   and tc.code = q.techcondservrefcode \n" +
            /////
            " where tc.code = q.techcondservrefcode \n" +
            "   and so2tc.servicesobjectrefcode = so.code \n" +
            "   and so2tc.techcondservrefcode = tc.code \n" +
            " order by groupname, partnername ";


        try {
            statement = connection.prepareStatement(selectStr);


            statement.setInt(1, techCondServicesCode);
            //statement.setInt(2, techCondServicesCode);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENUnitedGroup2TechCondServicesShort();

/*
  q.groupcode,
  groupname,
  groupdescription,
  tccode, tc.partnername, tc.contractnumber,
  tc.cnpackcode, tc.cnsubsystemtyperefcode, cnsubsystemname,
  s04invnumber, s04name
 */

                //anObject.code = set.getInt(1);
                //if (set.wasNull())
                anObject.code = Integer.MIN_VALUE;

                anObject.unitedGroupTP04RefCode = set.getInt(1);
                if (set.wasNull())
                    anObject.unitedGroupTP04RefCode = Integer.MIN_VALUE;
                anObject.unitedGroupTP04RefName = set.getString(2);
                anObject.unitedGroupTP04RefDescription = set.getString(3);

                anObject.techCondServRefCode = set.getInt(4);
                if (set.wasNull())
                    anObject.techCondServRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefPartnerName = set.getString(5);
                anObject.techCondServRefContractNumber = set.getString(6);

                anObject.techCondServRefCnPackCode = set.getInt(7);
                if (set.wasNull())
                    anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefCode = set.getInt(8);
                if (set.wasNull())
                    anObject.techCondServRefCnSubsystemRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefName = set.getString(9);

                anObject.tp04InvNumber = set.getString(10);
                anObject.tp04Name = set.getString(11);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public ENUnitedGroup2TechCondServicesShortList getENLine10ListByTechCondServices(int techCondServicesCode) throws PersistenceException
    {
        if (techCondServicesCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("Не вказано код договору!");
        }

        ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
        ENUnitedGroup2TechCondServicesShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        //String whereStr = "";


        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr =
            " select   \n" +
            "   q.groupcode,   \n" +
            "   (select g.name from enunitedgroupconnectns g where g.code = q.groupcode) as groupname,  \n" +
            "   (select g.description from enunitedgroupconnectns g where g.code = q.groupcode) as groupdescription,  \n" +
            "   tc.code as tccode, tc.partnername, tc.contractnumber, tc.cnpackcode, tc.cnsubsystemtyperefcode,  \n" +
            "   (select st.name   \n" +
            "    from cnsubsystemtype st   \n" +
            "    where st.code = tc.cnsubsystemtyperefcode) as cnsubsystemname,  \n" +
            "             \n" +
            "   (select l.invnumber from enline10 l where l.code = tc.airline10refcode) as line10invnumber,  \n" +
            "   (select l.name from enline10 l where l.code = tc.airline10refcode) as line10name  \n" +
            "             \n" +
            " from   \n" +
            " (  \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl10d1refcod as groupcode, 1 as partnum  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc  \n" +
            "   where g2tc.unitedgroupl10d1refcod in  \n" +
            "   (  \n" +
            "   select   \n" +
            "     g2tc1.unitedgroupl10d1refcod   \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1  \n" +
            "   where g2tc1.techcondservrefcode = ?  \n" +
            "   )  \n" +
            "               \n" +
            "   union all  \n" +
            "               \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl10d2refcod as groupcode, 2 as partnum   \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc  \n" +
            "   where g2tc.unitedgroupl10d2refcod in  \n" +
            "   (  \n" +
            "   select   \n" +
            "     g2tc1.unitedgroupl10d2refcod   \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1  \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   )  \n" +
            "                \n" +
            "   union all  \n" +
            "               \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl10d3refcod as groupcode, 3 as partnum  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc  \n" +
            "   where g2tc.unitedgroupl10d3refcod in  \n" +
            "   (  \n" +
            "   select   \n" +
            "     g2tc1.unitedgroupl10d3refcod   \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1  \n" +
            "   where g2tc1.techcondservrefcode = ?  \n" +
            "   )  \n" +
            "                \n" +
            "   union all  \n" +
            "               \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupl10d4refcod as groupcode, 4 as partnum  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc  \n" +
            "   where g2tc.unitedgroupl10d4refcod in  \n" +
            "   (  \n" +
            "   select   \n" +
            "     g2tc1.unitedgroupl10d4refcod   \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1  \n" +
            "   where g2tc1.techcondservrefcode = ?  \n" +
            "   )    \n" +
            " ) q,   \n" +
            " entechconditionsservcs tc,   \n" +
            " enservicesobject so, enservicesobject2techcondtnsservices so2tc  \n" +
            ///// 12.06.13 И.Н.С. Самого себя тоже показываем
            //" where q.techcondservrefcode <> ? \n" +
            //"   and tc.code = q.techcondservrefcode \n" +
            /////
            " where tc.code = q.techcondservrefcode \n" +
            "   and so2tc.servicesobjectrefcode = so.code  \n" +
            "   and so2tc.techcondservrefcode = tc.code  \n" +
            " order by groupcode, groupname, partnername ";


        try {
            statement = connection.prepareStatement(selectStr);


            statement.setInt(1, techCondServicesCode);
            statement.setInt(2, techCondServicesCode);
            statement.setInt(3, techCondServicesCode);
            statement.setInt(4, techCondServicesCode);
            //statement.setInt(5, techCondServicesCode);


            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENUnitedGroup2TechCondServicesShort();

/*
  q.groupcode,
  groupname,
  groupdescription,
  tccode, tc.partnername, tc.contractnumber,
  tc.cnpackcode, tc.cnsubsystemtyperefcode, cnsubsystemname,
  line10invnumber, line10name
 */

                //anObject.code = set.getInt(1);
                //if (set.wasNull())
                anObject.code = Integer.MIN_VALUE;

                anObject.unitedGroupL10D1RefCode = set.getInt(1);
                if (set.wasNull())
                    anObject.unitedGroupL10D1RefCode = Integer.MIN_VALUE;
                anObject.unitedGroupL10D1RefName = set.getString(2);
                anObject.unitedGroupL10D1RefDescription = set.getString(3);

                anObject.techCondServRefCode = set.getInt(4);
                if (set.wasNull())
                    anObject.techCondServRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefPartnerName = set.getString(5);
                anObject.techCondServRefContractNumber = set.getString(6);

                anObject.techCondServRefCnPackCode = set.getInt(7);
                if (set.wasNull())
                    anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefCode = set.getInt(8);
                if (set.wasNull())
                    anObject.techCondServRefCnSubsystemRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefName = set.getString(9);

                anObject.line10invnumber = set.getString(10);
                anObject.line10Name = set.getString(11);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    public ENUnitedGroup2TechCondServicesShortList getENSubstation35ListByTechCondServices(int techCondServicesCode) throws PersistenceException
    {
        if (techCondServicesCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("Не вказано код договору!");
        }

        ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
        ENUnitedGroup2TechCondServicesShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        //String whereStr = "";


        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr =
            " select  \n" +
            "   q.groupcode,  \n" +
            "   (select g.name from enunitedgroupconnectns g where g.code = q.groupcode) as groupname, \n" +
            "   (select g.description from enunitedgroupconnectns g where g.code = q.groupcode) as groupdescription, \n" +
            "   tc.code as tccode, \n" +
            "   tc.partnername, tc.contractnumber, tc.cnpackcode, tc.cnsubsystemtyperefcode, \n" +
            "   (select st.name  \n" +
            "    from cnsubsystemtype st  \n" +
            "    where st.code = tc.cnsubsystemtyperefcode) as cnsubsystemname, \n" +
            "              \n" +
            "   (select s.invnumber from ensubstation150 s where s.code = tc.s35refcode) as s35invnumber,  \n" +
            "   (select s.name from ensubstation150 s where s.code = tc.s35refcode) as s35name  \n" +
            " from  \n" +
            " ( \n" +
            "   select g2tc.techcondservrefcode, g2tc.unitedgroupps35refcode as groupcode \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc \n" +
            "   where g2tc.unitedgroupps35refcode in \n" +
            "   ( \n" +
            "   select  \n" +
            "     g2tc1.unitedgroupps35refcode  \n" +
            "   from enunitdgrp2tchcndsrvcs g2tc1 \n" +
            "   where g2tc1.techcondservrefcode = ? \n" +
            "   ) \n" +
            " ) q,  \n" +
            " entechconditionsservcs tc,  \n" +
            " enservicesobject so, enservicesobject2techcondtnsservices so2tc \n" +
            ///// 12.06.13 И.Н.С. Самого себя тоже показываем
            //" where q.techcondservrefcode <> ? \n" +
            //"   and tc.code = q.techcondservrefcode \n" +
            /////
            " where tc.code = q.techcondservrefcode \n" +
            "   and so2tc.servicesobjectrefcode = so.code \n" +
            "   and so2tc.techcondservrefcode = tc.code \n" +
            " order by groupname, partnername ";



        try {
            statement = connection.prepareStatement(selectStr);


            statement.setInt(1, techCondServicesCode);
            //statement.setInt(2, techCondServicesCode);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENUnitedGroup2TechCondServicesShort();

/*
  q.groupcode,
  groupname,
  groupdescription,
  tccode, tc.partnername, tc.contractnumber,
  tc.cnpackcode, tc.cnsubsystemtyperefcode, cnsubsystemname,
  s35invnumber, s35name
 */

                //anObject.code = set.getInt(1);
                //if (set.wasNull())
                anObject.code = Integer.MIN_VALUE;

                anObject.unitedGroupPS35RefCode = set.getInt(1);
                if (set.wasNull())
                    anObject.unitedGroupPS35RefCode = Integer.MIN_VALUE;
                anObject.unitedGroupPS35RefName = set.getString(2);
                anObject.unitedGroupPS35RefDescription = set.getString(3);

                anObject.techCondServRefCode = set.getInt(4);
                if (set.wasNull())
                    anObject.techCondServRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefPartnerName = set.getString(5);
                anObject.techCondServRefContractNumber = set.getString(6);

                anObject.techCondServRefCnPackCode = set.getInt(7);
                if (set.wasNull())
                    anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefCode = set.getInt(8);
                if (set.wasNull())
                    anObject.techCondServRefCnSubsystemRefCode = Integer.MIN_VALUE;
                anObject.techCondServRefCnSubsystemRefName = set.getString(9);

                anObject.pc35InvNumber = set.getString(10);
                anObject.pc35Name = set.getString(11);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }



} // end of ENUnitedGroup2TechCondServicesDAO

