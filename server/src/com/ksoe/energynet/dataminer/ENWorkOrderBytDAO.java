
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKAccountingType;

/**
 * DAO Object for ENWorkOrderByt;
 *
 */

public class ENWorkOrderBytDAO extends ENWorkOrderBytDAOGen {

    public ENWorkOrderBytDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderBytDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENWorkOrderByt anObject) throws PersistenceException
    {
    	/*
    	if (anObject.statusRef == null)
    	{
    		anObject.statusRef = new ENWorkOrderBytStatusRef();
    		anObject.statusRef.code = ENWorkOrderBytStatus.DRAFT;
    	}
    	else if (anObject.statusRef.code == Integer.MIN_VALUE)
    	{
    		anObject.statusRef.code = ENWorkOrderBytStatus.DRAFT;
    	}
    	*/
    	
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENWorkOrderByt anObject) throws PersistenceException
    {
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
    
    public void remove(int uid) throws PersistenceException
    {
    	ENWorkOrderByt object = getObject(uid);

  	    super.remove(uid);

  	    // Удаляем finWorker'а (в FINWorkerDAO - проверка на связки)
  	    if (object.finWorker != null)
  	    {
  	    	if (object.finWorker.code > Integer.MIN_VALUE)
  	    	{
  	    		FINWorkerDAO wDAO = new FINWorkerDAO(getConnection(), getUserProfile());
  	    		wDAO.remove(object.finWorker.code);
  		    }
  	    }
    }
    
    public ENWorkOrderBytShortList getScrollableFilteredList(ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENWorkOrderBytShortList result = new ENWorkOrderBytShortList();
     ENWorkOrderBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      //orderBy = "ENWORKORDERBYT.CODE";
      orderBy = "ENWORKORDERBYT.DATEGEN DESC, ENWORKORDERBYT.CODE DESC";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENWORKORDERBYT.CODE"+
      ",ENWORKORDERBYT.NUMBERGEN"+
      ",ENWORKORDERBYT.DATEGEN"+
      ",ENWORKORDERBYT.COMMENTGEN"+
      ",ENWORKORDERBYT.DATEADD"+
      ",ENWORKORDERBYT.DATEEDIT"+
      ",ENWORKORDERBYT.USERADD"+
      ",ENWORKORDERBYT.USEREDIT"+

       ", ENDEPARTMENT.CODE " +
       ", ENDEPARTMENT.SHORTNAME " +
       ", ENDEPARTMENT.DATESTART " +
       ", ENDEPARTMENT.DATEFINAL " +
       ", ENDEPARTMENT.RENCODE " +
       ", ENDEPARTMENT.SHPZBALANS " +
       ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
       ", ENDEPARTMENT.KAU_1884 " +
       ", ENDEPARTMENT.NAME_1884 " +
      ", ENWORKORDERBYT.SITEREFCODE" +
       ", FINWORKER.CODE " +
       ", FINWORKER.NAME " +
       ", FINWORKER.TABNUMBER " +
       ", FINWORKER.POSITIONNAME " +
       ", FINWORKER.POSITIONCODE " +
       ", FINWORKER.DEPARTMENTNAME " +
       ", FINWORKER.DEPARTMENTCODE " +
       ", FINWORKER.PRICEGEN " +
       ", FINWORKER.CATEGOR " +
       ", FINWORKER.FINCODE " +
       ", FINWORKER.ISSENTASSIGNMENT " +
       ", FINWORKER.CHARGEPERCENT " +
       
      ", ENWORKORDERBYTTYPE.CODE " +
      ", ENWORKORDERBYTTYPE.NAME " +

      ", ENWORKORDERBYTSTATUS.CODE " +
      ", ENWORKORDERBYTSTATUS.NAME " +
      
      " FROM ENWORKORDERBYT " +
      ", ENDEPARTMENT " +
      ", FINWORKER " +
      ", ENWORKORDERBYTTYPE " +
      ", ENWORKORDERBYTSTATUS " +
      //" WHERE "
   "";
      whereStr = " ENDEPARTMENT.CODE = ENWORKORDERBYT.DEPARTMENTREFCODE" ; //+
       whereStr = whereStr +" AND FINWORKER.CODE = ENWORKORDERBYT.FINWORKERCODE" ; //+
       whereStr = whereStr +" AND ENWORKORDERBYTTYPE.CODE = ENWORKORDERBYT.TYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENWORKORDERBYTSTATUS.CODE = ENWORKORDERBYT.STATUSREFCODE" ;
     //selectStr = selectStr + " ${s} ENWORKORDERBYT.CODE IN ( SELECT ENWORKORDERBYT.CODE FROM ENWORKORDERBYT ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYT.CODE = ?";
         }
          if (aFilterObject.numberGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYT.NUMBERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYT.NUMBERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYT.DATEGEN = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYT.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYT.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYT.DATEADD = ?";
         }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYT.DATEEDIT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYT.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYT.USERADD) LIKE UPPER(?)";
          }
          if (aFilterObject.userEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userEdit.indexOf('*',0) < 0 && aFilterObject.userEdit.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYT.USEREDIT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYT.USEREDIT) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYT.MODIFY_TIME = ?";
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYT.DEPARTMENTREFCODE = ? ";
         }
         if(aFilterObject.siteRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYT.SITEREFCODE = ? ";
         }
         if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYT.FINWORKERCODE = ? ";
         }
         ///// Для корректного поиска по работнику
         if(aFilterObject.finWorker.finCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "FINWORKER.FINCODE = ? ";
         }
         if (aFilterObject.finWorker.tabNumber != null) {
             if (whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finWorker.tabNumber.indexOf('*', 0) < 0
                     && aFilterObject.finWorker.tabNumber.indexOf('?', 0) < 0)
                 whereStr = whereStr + "  FINWORKER.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  FINWORKER.TABNUMBER LIKE ?";
         }    
         /////
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYT.TYPEREFCODE = ? ";
         }         
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYT.STATUSREFCODE = ? ";
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

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }

            if(aFilterObject.numberGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.numberGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
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
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
         }

            if(aFilterObject.userAdd != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userAdd);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.userEdit != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userEdit);
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
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.siteRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.siteRef.code);
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finWorker.code);
        }
        ///// Для корректного поиска по работнику
        if(aFilterObject.finWorker.finCode != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finWorker.finCode);
        }
        if(aFilterObject.finWorker.tabNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.finWorker.tabNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }       
        /////
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }        
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }        
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new ENWorkOrderBytShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.numberGen = set.getString(2);
         anObject.dateGen = set.getDate(3);
         anObject.commentGen = set.getString(4);
         anObject.dateAdd = set.getTimestamp(5);
         anObject.dateEdit = set.getTimestamp(6);
         anObject.userAdd = set.getString(7);
         anObject.userEdit = set.getString(8);

         anObject.departmentRefCode = set.getInt(9);
     if(set.wasNull())
       anObject.departmentRefCode = Integer.MIN_VALUE;
         anObject.departmentRefShortName = set.getString(10);
         anObject.departmentRefDateStart = set.getDate(11);
         anObject.departmentRefDateFinal = set.getDate(12);
         anObject.departmentRefRenCode = set.getInt(13);
     if(set.wasNull())
       anObject.departmentRefRenCode = Integer.MIN_VALUE;
         anObject.departmentRefShpzBalans = set.getString(14);
         anObject.departmentRefKau_table_id_1884 = set.getInt(15);
     if(set.wasNull())
       anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.departmentRefKau_1884 = set.getString(16);
         anObject.departmentRefName_1884 = set.getString(17);
         anObject.siteRefCode = set.getInt(18);
     if(set.wasNull())
       anObject.siteRefCode = Integer.MIN_VALUE;
         anObject.finWorkerCode = set.getInt(19);
     if(set.wasNull())
       anObject.finWorkerCode = Integer.MIN_VALUE;
         anObject.finWorkerName = set.getString(20);
         anObject.finWorkerTabNumber = set.getString(21);
         anObject.finWorkerPositionName = set.getString(22);
         anObject.finWorkerPositionCode = set.getInt(23);
     if(set.wasNull())
       anObject.finWorkerPositionCode = Integer.MIN_VALUE;
         anObject.finWorkerDepartmentName = set.getString(24);
         anObject.finWorkerDepartmentCode = set.getString(25);
         anObject.finWorkerPriceGen = set.getBigDecimal(26);
         if(anObject.finWorkerPriceGen != null)
           anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.finWorkerCategor = set.getInt(27);
     if(set.wasNull())
       anObject.finWorkerCategor = Integer.MIN_VALUE;
         anObject.finWorkerFinCode = set.getInt(28);
     if(set.wasNull())
       anObject.finWorkerFinCode = Integer.MIN_VALUE;
         anObject.finWorkerIsSentAssignment = set.getInt(29);
     if(set.wasNull())
       anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
         anObject.finWorkerChargePercent = set.getBigDecimal(30);
         if(anObject.finWorkerChargePercent != null)
           anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.typeRefCode = set.getInt(31);
         if(set.wasNull())
           anObject.typeRefCode = Integer.MIN_VALUE;
         anObject.typeRefName = set.getString(32);

         anObject.statusRefCode = set.getInt(33);
         if(set.wasNull())
           anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(34);
             
          result.list.add(anObject);
        }

       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       //return null;
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


    public boolean checkUnboundSealsInClosedPlans(int workOrderBytCode) throws PersistenceException
    {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;

        String selectStr = 
        		"  select " +
				"    ei.countfact, " +
				"   " +
				"    coalesce((select count(distinct s.code)   " +
				"              from scseal s   " +
				"              where  " +
				"                s.estimateitemrefcode = ei.code),   " +
				"            0) as countreserved  " +
				"    " +
				"  from enestimateitem ei " +
				"  where ei.code in  " +
				"  (  " +
				"     select distinct ei.code  " +
				"     from  " +
				"       enestimateitem ei, enplanworkitem pi, enplanwork p, " +
				"       enworkorderbytitem wbi  " +
				"     where ei.planitemrefcode = pi.code  " +
				"       and ei.planrefcode = p.code " +
				"       and p.statuscode <> " + ENPlanWorkStatus.GOOD +
				"       and wbi.planrefcode = p.code " +
				"       and wbi.planitemrefcode = pi.code  " +
				"       and pi.countgen > 0  " +
				"       and wbi.workorderbytrefcode = ? " +
				"       and ei.countfact > 0  " +
				"       and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				"  ) ";

        try
        {
	        statement = connection.prepareStatement(selectStr);
	
	        statement.setInt(1, workOrderBytCode);
	
	        set = statement.executeQuery();

	        for( ; set.next() ; )
	        {
	            BigDecimal countFact = set.getBigDecimal(1);
	            if(countFact != null)
	            	countFact = countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	            
	            BigDecimal countReserved = set.getBigDecimal(2);
	            if(countReserved != null)
	            	countReserved = countReserved.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	            
	            if (countFact.compareTo(countReserved) > 0)
	            {
	            	return true;
	            }
	        }
	        
	        return false;

	    }
	    catch(SQLException e)
        {
	        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	        throw new SystemException(e.getMessage(), e);
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



} // end of ENWorkOrderBytDAO
