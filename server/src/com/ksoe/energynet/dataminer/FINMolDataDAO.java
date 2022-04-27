
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.FINMolDataDAOGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.brief.FINMolDataShort;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINMolData;
  *
  */

public class FINMolDataDAO extends FINMolDataDAOGen {
	
	/**
	 * 
	 * Возвращает коды МОЛдат {@link FINMolData#code} связанных с актом {@link ENAct}
	 * 
	 * @param act заданный акт {@link ENAct}
	 * @return массив кодов МОЛдаты {@link FINMolData}
	 * @throws PersistenceException
	 */
	public int[] getCodesByENAct(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		FINMolDataFilter filter = new FINMolDataFilter();
		filter.act.code = act.code;
		return this.getFilteredCodeArray(filter, 0, -1);
	}
    public FINMolDataShortList getScrollableFilteredList(FINMolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        FINMolDataShortList result = new FINMolDataShortList();
        FINMolDataShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "FINMOLDATA.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
        "FINMOLDATA.CODE"+
        ",FINMOLDATA.FINMOLCODE"+
        ",FINMOLDATA.FINMOLNAME"+

        ", FINMOLTYPE.CODE " +
        ", FINMOLTYPE.NAME " +
        ", ENACT.CODE " +
        ", ENACT.NUMBERGEN " +
        ", ENACT.DATEGEN " +
        ", ENACT.FINDOCCODE " +
        ", ENACT.FINDOCMECHANICCODE " +
        ", ENACT.FINMOLNAME " +
        ", ENACT.FINMECHANICNAME " +
        ", ENACT.USERGEN " +
        ", ENACT.DATEEDIT " +
        ", ENWORKORDER.CODE " +
        ", ENWORKORDER.WORKORDERNUMBER " +
        ", ENWORKORDER.DATEGEN " +
        ", ENWORKORDER.FINMOLCODE " +
        ", ENWORKORDER.FINMOLNAME " +
        ", ENWORKORDER.FINMECHANICCODE " +
        ", ENWORKORDER.FINMECHANICNAME " +
        ", ENWORKORDER.USERGEN " +
        ", ENWORKORDER.DATEEDIT " +
        ", (select mol1.phonenumber from enmol as mol1 where mol1.fincode = FINMOLDATA.FINMOLCODE) as phonenumber " +
        " FROM FINMOLDATA " +

        " left join ENACT on ENACT.CODE = FINMOLDATA.ACTCODE " +
        " left join ENWORKORDER on ENWORKORDER.CODE = FINMOLDATA.WORKORDERCODE " +


        ", FINMOLTYPE " +
        //", ENACT " +
        //", ENWORKORDER " +
        //" WHERE "
        "";
        whereStr = " FINMOLTYPE.CODE = FINMOLDATA.MOLTYPEREFCODE" ; //+
        // whereStr = whereStr +" AND ENACT.CODE = FINMOLDATA.ACTCODE" ; //+
        // whereStr = whereStr +" AND ENWORKORDER.CODE = FINMOLDATA.WORKORDERCODE" ; //+
            //selectStr = selectStr + " ${s} FINMOLDATA.CODE IN ( SELECT FINMOLDATA.CODE FROM FINMOLDATA ";

//     " ";
        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINMOLDATA.CODE = ?";
            }
            if (aFilterObject.finMolCode != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(FINMOLDATA.FINMOLCODE) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(FINMOLDATA.FINMOLCODE) LIKE UPPER(?)";
            }
            if (aFilterObject.finMolName != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(FINMOLDATA.FINMOLNAME) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(FINMOLDATA.FINMOLNAME) LIKE UPPER(?)";
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINMOLDATA.MODIFY_TIME = ?";
            }
            if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINMOLDATA.MOLTYPEREFCODE = ? ";
            }
            if(aFilterObject.act.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINMOLDATA.ACTCODE = ? ";
            }
            if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINMOLDATA.WORKORDERCODE = ? ";
            }

        }



        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
//     + " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

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

            if(aFilterObject.finMolCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.finMolCode);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.finMolName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.finMolName);
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
        if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.molTypeRef.code);
        }
        if(aFilterObject.act.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.act.code);
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrder.code);
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

            anObject = new FINMolDataShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.finMolCode = set.getString(2);
            anObject.finMolName = set.getString(3);


            anObject.molTypeRefCode = set.getInt(4);

            anObject.molTypeRefName = set.getString(5);

            anObject.actCode = set.getInt(6);

            anObject.actNumberGen = set.getString(7);

            anObject.actDateGen = set.getDate(8);

            anObject.actFinDocCode = set.getInt(9);

            anObject.actFinDocMechanicCode = set.getInt(10);

            anObject.actFinMolName = set.getString(11);

            anObject.actFinMechanicName = set.getString(12);

            anObject.actUserGen = set.getString(13);

            anObject.actDateEdit = set.getDate(14);

            anObject.workOrderCode = set.getInt(15);

            anObject.workOrderWorkOrderNumber = set.getString(16);

            anObject.workOrderDateGen = set.getDate(17);

            anObject.workOrderFinMolCode = set.getString(18);

            anObject.workOrderFinMolName = set.getString(19);

            anObject.workOrderFinMechanicCode = set.getString(20);

            anObject.workOrderFinMechanicName = set.getString(21);

            anObject.workOrderUserGen = set.getString(22);

            anObject.workOrderDateEdit = set.getDate(23);
            
            anObject.phoneNumber = set.getString(24);

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




  public FINMolDataDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINMolDataDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of FINMolDataDAO

