
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENIPItem2TKMaterialsDAOGen;
import com.ksoe.energynet.valueobject.ENIPItem2TKMaterials;
import com.ksoe.energynet.valueobject.brief.ENIPItem2TKMaterialsShort;
import com.ksoe.energynet.valueobject.lists.ENIPItem2TKMaterialsShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIPItem2TKMaterials;
 *
 */

public class ENIPItem2TKMaterialsDAO extends ENIPItem2TKMaterialsDAOGen {

    public ENIPItem2TKMaterialsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPItem2TKMaterialsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


    public ENIPItem2TKMaterialsShortList getScrollableFilteredList(
            ENIPItem2TKMaterials aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) throws PersistenceException {

        ENIPItem2TKMaterialsShortList result = new ENIPItem2TKMaterialsShortList();
        ENIPItem2TKMaterialsShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "ENIPITEM2TKMATERIALS.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = " select enipitem2tkmaterials.code, ms.name, m.name , enipitem2tkmaterials.ismaterialforcount " +
                " from enipitem2tkmaterials, tkmaterials m, tkmeasurement ms";

        whereStr = " enipitem2tkmaterials.materialrefcode = m.code";
        whereStr = whereStr + " and m.measurementcode = ms.code";

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENIPITEM2TKMATERIALS.CODE = ?";
            }
            if (aFilterObject.ipItemRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENIPITEM2TKMATERIALS.IPITEMREFCODE = ? ";
            }
            if (aFilterObject.materialRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENIPITEM2TKMATERIALS.MATERIALREFCODE = ? ";
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
        if (quantity > -1)
            selectStr = selectStr + " LIMIT " + quantity;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.ipItemRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.ipItemRef.code);
                }
                if (aFilterObject.materialRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.materialRef.code);
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENIPItem2TKMaterialsShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;

                anObject.materialMasurement = set.getString(2);
                anObject.materialRefName = set.getString(3);
                anObject.isMaterialForCount = set.getInt(4);
                if (set.wasNull())
                    anObject.isMaterialForCount = 0;

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
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
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

} // end of ENIPItem2TKMaterialsDAO
