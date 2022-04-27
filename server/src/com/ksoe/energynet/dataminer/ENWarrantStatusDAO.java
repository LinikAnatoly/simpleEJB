//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENWarrantStatusDAOGen;
import com.ksoe.energynet.valueobject.ENWarrantStatus;
import com.ksoe.energynet.valueobject.brief.ENWarrantStatusShort;
import com.ksoe.energynet.valueobject.lists.ENWarrantStatusShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENWarrantStatus;
 *
 */

public class ENWarrantStatusDAO extends ENWarrantStatusDAOGen {


    public ENWarrantStatusDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWarrantStatusDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENWarrantStatusShortList getScrollableFilteredList(ENWarrantStatus aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        ENWarrantStatusShortList result = new ENWarrantStatusShortList();
        ENWarrantStatusShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "ENWARRANTSTATUS.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
        "ENWARRANTSTATUS.CODE"+
        ",ENWARRANTSTATUS.NAME"+

        " FROM ENWARRANTSTATUS " +
        //" WHERE "
        "";
            //selectStr = selectStr + " ${s} ENWARRANTSTATUS.CODE IN ( SELECT ENWARRANTSTATUS.CODE FROM ENWARRANTSTATUS ";

        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENWARRANTSTATUS.CODE = ?";
            }
            if (aFilterObject.name != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(ENWARRANTSTATUS.NAME) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(ENWARRANTSTATUS.NAME) LIKE UPPER(?)";
            }

        }



        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
    // + " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE " + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
        {
        statement = connection.prepareStatement(selectStr);
        int number = 0;
        if(aFilterObject != null){
            if(aFilterObject.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.code);
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
        }

        if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

            anObject = new ENWarrantStatusShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.name = set.getString(2);


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
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
            try{connection.close();} catch(SQLException e){}
        }
        }
    }


} // end of ENWarrantStatusDAO
