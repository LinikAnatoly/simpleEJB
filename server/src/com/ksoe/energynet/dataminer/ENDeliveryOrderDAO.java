
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENDeliveryOrderDAOGen;
import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energynet.valueobject.brief.ENDeliveryOrderShort;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENDeliveryOrder;
  *
  */

public class ENDeliveryOrderDAO extends ENDeliveryOrderDAOGen {

    public ENDeliveryOrderShortList getScrollableFilteredList(ENDeliveryOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        ENDeliveryOrderShortList result = new ENDeliveryOrderShortList();
        ENDeliveryOrderShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "d.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr =
            " SELECT " +
            " d.code " +
            " ,d.transportinrefcode " +
            " ,d.transportoutcode " +
            " ,tr.gosnumber " +
            " ,tr.name " +
            " ,fw.name " +
            " ,ed.ename, ed.invnumber " +
            " ,sum(ds.distance) " +
            "  FROM " +
            " endeliveryorder AS d " +
            " INNER JOIN entransportitem AS tin ON d.transportinrefcode = tin.code " +
            " INNER JOIN entransportitem AS tout ON d.transportoutcode = tout.code " +
            " INNER JOIN enplanwork AS pl ON tout.planrefcode = pl.code " +
            " INNER JOIN enelementdata AS ed ON pl.elementrefcode = ed.ecode " +
            " LEFT JOIN endistance AS ds ON tout.code = ds.transportitemrefcode " +
            " LEFT JOIN tktransportreal AS tr ON tout.transportrealcode = tr.code " +
            " LEFT JOIN finworker AS fw ON tout.finworkercode = fw.code ";
        String groupSQL = " GROUP BY  " +
            " d.code, d.transportinrefcode, d.transportoutcode, " +
            " tr.gosnumber, tr.name, fw.name, ed.ename, ed.invnumber ";

            //selectStr = selectStr + " ${s} ENDELIVERYORDER.CODE IN ( SELECT ENDELIVERYORDER.CODE FROM ENDELIVERYORDER ";

        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  d.CODE = ?";
            }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(d.COMMENTGEN) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(d.COMMENTGEN) LIKE UPPER(?)";
            }

            if(aFilterObject.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  d.MODIFY_TIME = ?";
            }
            if(aFilterObject.transportInRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "d.TRANSPORTINREFCODE = ? ";
            }
            if(aFilterObject.transportOut.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "d.TRANSPORTOUTCODE = ? ";
            }

        }

        if(condition.length() != 0)
        {
            //if(whereStr.length() != 0)
            //    whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
//     + " WHERE" +  сделано выше ????
         //if(whereStr.length() != 0)
          //   selectStr = selectStr + " WHERE " + whereStr;

        // selectStr = selectStr + ") ";
        selectStr += (whereStr.isEmpty() ? "" : " WHERE " + whereStr);

        selectStr = selectStr + groupSQL + " ORDER BY " + orderBy;

        try
        {
        statement = connection.prepareStatement(selectStr);
        int number = 0;
        if(aFilterObject != null){
            if(aFilterObject.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.code);
            }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
        if(aFilterObject.transportInRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.transportInRef.code);
        }
        if(aFilterObject.transportOut.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.transportOut.code);
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

            anObject = new ENDeliveryOrderShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;

            anObject.transportInRefCode = set.getInt(2);
            anObject.transportOutCode = set.getInt(3);

            anObject.outGosNomer = set.getString(4);
            anObject.outName = set.getString(5);
            anObject.outDriverName = set.getString(6);
            anObject.outObject = set.getString(7);
            anObject.outInvNumber = set.getString(8);
            anObject.outDistance = set.getBigDecimal(9);
            if (anObject.outDistance != null)
                anObject.outDistance = anObject.outDistance.setScale(3, BigDecimal.ROUND_HALF_UP);

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


  public ENDeliveryOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDeliveryOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

} // end of ENDeliveryOrderDAO

