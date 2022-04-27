
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

import com.ksoe.energynet.dataminer.generated.FINDoc2MolDataDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.brief.FINDoc2MolDataShort;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINDoc2MolData;
  *
  */

public class FINDoc2MolDataDAO extends FINDoc2MolDataDAOGen {



	public FINDoc2MolDataShortList getListByActCode(int actCode) throws PersistenceException {
		ENAct act = new ENAct();
		act.code = actCode;
		return this.getListByAct(act);
	}
	public FINDoc2MolDataShortList getListByAct(ENAct act) throws PersistenceException {
		FINMolDataDAO molDataDao = new FINMolDataDAO(getConnection(), getUserProfile());
		int[] molDataCodes = molDataDao.getCodesByENAct(act);
		if(molDataCodes == null || molDataCodes.length == 0) return null;
		FINDoc2MolDataFilter filter = new FINDoc2MolDataFilter();
		filter.conditionSQL = String.format("%s in (%s)", FINDoc2MolData.molData_QFielld, Tools.repeatSymbol("?", ",", molDataCodes.length));
		Vector<Object> binded = new Vector<Object>();
		for(int molDataCode : molDataCodes) binded.add(molDataCode);
		return this.getScrollableFilteredList(filter, 0, -1, binded);
	}
    public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        FINDoc2MolDataShortList result = new FINDoc2MolDataShortList();
        FINDoc2MolDataShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "FINDOC2MOLDATA.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
        "FINDOC2MOLDATA.CODE"+
        ",FINDOC2MOLDATA.FINDOCCODE"+

        ", FINMOLDATA.CODE " +
        ", FINMOLDATA.FINMOLCODE " +
        ", FINMOLDATA.FINMOLNAME " +
        ", FINDOCTYPE.CODE " +
        ", FINDOCTYPE.NAME " +
        ", FINMOLDATA.MOLTYPEREFCODE " +
        ", FINMOLTYPE.NAME " +
        ",FINDOC2MOLDATA.FINDOCCODE2 "+
        ",FINDOC2MOLDATA.AXJOURNALID "+
        " FROM FINDOC2MOLDATA " +
        ", FINMOLDATA " +
        ", FINDOCTYPE " +
        ", FINMOLTYPE " +
        //" WHERE "
        "";
        whereStr = " FINMOLDATA.CODE = FINDOC2MOLDATA.MOLDATACODE" ; //+
        whereStr = whereStr +" AND FINDOCTYPE.CODE = FINDOC2MOLDATA.FINDOCTYPEREFCODE" ; //+
        whereStr = whereStr + " AND FINMOLTYPE.CODE = FINMOLDATA.MOLTYPEREFCODE ";
            //selectStr = selectStr + " ${s} FINDOC2MOLDATA.CODE IN ( SELECT FINDOC2MOLDATA.CODE FROM FINDOC2MOLDATA ";

//     " ";
        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.CODE = ?";
            }
            if(aFilterObject.finDocCode != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.FINDOCCODE = ?";
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.MODIFY_TIME = ?";
            }
            if(aFilterObject.molData.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.MOLDATACODE = ? ";
            }
            if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.FINDOCTYPEREFCODE = ? ";
            }
            if (aFilterObject.axJournalId != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.axJournalId.indexOf('*',0) < 0 && aFilterObject.axJournalId.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(FINDOC2MOLDATA.AXJOURNALID) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(FINDOC2MOLDATA.AXJOURNALID) LIKE UPPER(?)";
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
            if(aFilterObject.finDocCode != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.finDocCode);
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
        if(aFilterObject.molData.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.molData.code);
        }
        if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finDocTypeRef.code);
        }
        if(aFilterObject.axJournalId != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.axJournalId);
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

            anObject = new FINDoc2MolDataShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.finDocCode = set.getInt(2);
            if ( set.wasNull() )
                anObject.finDocCode = Integer.MIN_VALUE;


            anObject.molDataCode = set.getInt(3);

            anObject.molDataFinMolCode = set.getString(4);

            anObject.molDataFinMolName = set.getString(5);

            anObject.finDocTypeRefCode = set.getInt(6);

            anObject.finDocTypeRefName = set.getString(7);

            anObject.molDataTypeRefCode = set.getInt(8);
            anObject.molDataTypeRefName = set.getString(9);

            anObject.finDocCode2 = set.getInt(10);
            if ( set.wasNull() )
                anObject.finDocCode2 = Integer.MIN_VALUE;
            
            anObject.axJournalId = set.getString(11);

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


/*
    public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        FINDoc2MolDataShortList result = new FINDoc2MolDataShortList();
        FINDoc2MolDataShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "FINDOC2MOLDATA.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
        "FINDOC2MOLDATA.CODE"+
        ",FINDOC2MOLDATA.FINDOCCODE"+

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
        ", FINMOLDATA.CODE " +
        ", FINMOLDATA.FINMOLCODE " +
        ", FINMOLDATA.FINMOLNAME " +
        ", FINDOCTYPE.CODE " +
        ", FINDOCTYPE.NAME " +

        ", FINMOLDATA.MOLTYPEREFCODE " +
        ", FINMOLTYPE.NAME " +
        " FROM " +

        " FINDOC2MOLDATA left join ENACT on ENACT.CODE = FINDOC2MOLDATA.ACTCODE " +
        " left join ENWORKORDER on ENWORKORDER.CODE = FINDOC2MOLDATA.WORKORDERCODE " +

        ", FINMOLDATA " +
        ", FINDOCTYPE " +
        ", FINMOLTYPE " +
        //" WHERE "
        "";
        //whereStr = " ENACT.CODE = FINDOC2MOLDATA.ACTCODE" ; //+
        // whereStr = whereStr +" AND ENWORKORDER.CODE = FINDOC2MOLDATA.WORKORDERCODE" ; //+
        whereStr = whereStr +" FINMOLDATA.CODE = FINDOC2MOLDATA.MOLDATACODE" ; //+
        whereStr = whereStr +" AND FINDOCTYPE.CODE = FINDOC2MOLDATA.FINDOCTYPEREFCODE " ; //+
        whereStr = whereStr + " AND FINMOLTYPE.CODE = FINMOLDATA.MOLTYPEREFCODE ";
            //selectStr = selectStr + " ${s} FINDOC2MOLDATA.CODE IN ( SELECT FINDOC2MOLDATA.CODE FROM FINDOC2MOLDATA ";

//     " ";
        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.CODE = ?";
            }
            if(aFilterObject.finDocCode != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.FINDOCCODE = ?";
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINDOC2MOLDATA.MODIFY_TIME = ?";
            }
            if(aFilterObject.act.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.ACTCODE = ? ";
            }
            if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.WORKORDERCODE = ? ";
            }
            if(aFilterObject.molData.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.MOLDATACODE = ? ";
            }
            if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINDOC2MOLDATA.FINDOCTYPEREFCODE = ? ";
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
            if(aFilterObject.finDocCode != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.finDocCode);
            }
            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
        if(aFilterObject.act.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.act.code);
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrder.code);
        }
        if(aFilterObject.molData.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.molData.code);
        }
        if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finDocTypeRef.code);
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

            anObject = new FINDoc2MolDataShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.finDocCode = set.getInt(2);
            if ( set.wasNull() )
                anObject.finDocCode = Integer.MIN_VALUE;


            anObject.actCode = set.getInt(3);

            anObject.actNumberGen = set.getString(4);

            anObject.actDateGen = set.getDate(5);

            anObject.actFinDocCode = set.getInt(6);

            anObject.actFinDocMechanicCode = set.getInt(7);

            anObject.actFinMolName = set.getString(8);

            anObject.actFinMechanicName = set.getString(9);

            anObject.actUserGen = set.getString(10);

            anObject.actDateEdit = set.getDate(11);

            anObject.workOrderCode = set.getInt(12);

            anObject.workOrderWorkOrderNumber = set.getString(13);

            anObject.workOrderDateGen = set.getDate(14);

            anObject.workOrderFinMolCode = set.getString(15);

            anObject.workOrderFinMolName = set.getString(16);

            anObject.workOrderFinMechanicCode = set.getString(17);

            anObject.workOrderFinMechanicName = set.getString(18);

            anObject.workOrderUserGen = set.getString(19);

            anObject.workOrderDateEdit = set.getDate(20);

            anObject.molDataCode = set.getInt(21);

            anObject.molDataFinMolCode = set.getString(22);

            anObject.molDataFinMolName = set.getString(23);

            anObject.finDocTypeRefCode = set.getInt(24);

            anObject.finDocTypeRefName = set.getString(25);

            anObject.finMolTypeRefCode = set.getInt(26);
            anObject.finMolTypeRefName = set.getString(27);

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
*/


  public FINDoc2MolDataDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINDoc2MolDataDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of FINDoc2MolDataDAO

