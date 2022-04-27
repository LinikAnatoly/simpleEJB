
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
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENTravelSheet;
  *
  */

public class ENTravelSheetDAO extends ENTravelSheetDAOGen {

  //public ENTravelSheetDAO() {super();}
  //public ENTravelSheetDAO(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int[] getFilteredArray(ENTravelSheetFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
    return getFilteredArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null, true);
  }

  @Override
public int[] getFilteredCodeArray(ENTravelSheetFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null, true);
  }


  public int[] getFilteredCodeArray(ENTravelSheetFilter aFilterObject, int fromPosition, int quantity, boolean isSegregation) throws PersistenceException
  {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null, isSegregation);
  }


  public int[] getFilteredCodeArray(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects, boolean isSegregation) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    if (isSegregation){
        SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
        if(segregationInfo.isAccessDenied())
        throw new PersistenceException("{%ENTravelSheet.getList%} access denied");

        whereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());

        if(whereStr.length() == 0)
        whereStr = " (ENTRAVELSHEET.DOMAIN_INFO IS NOT NULL) ";
        else
        whereStr = " "+whereStr;
    }

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.STATUSREFCODE = ? ";
        }

        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN LIKE ?";

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
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN LIKE ?";

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
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }

       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
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

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
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


    } // end of getFilteredCodeArray



  @Override
public int add(ENTravelSheet anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    return super.add(anObject);
  }


  @Override
public void save(ENTravelSheet anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    super.save(anObject);
  }

  @Override
public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
    return getScrollableFilteredList( aFilterObject, anCondition, anOrderBy, fromPosition, quantity, aBindObjects, true) ;
  }

  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects, boolean isSegregation) throws PersistenceException
   {
    ENTravelSheetShortList result = new ENTravelSheetShortList();
    ENTravelSheetShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    //String     condition =  anCondition == null  ? "" : anCondition ;
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVELSHEET.CODE"+
     ",ENTRAVELSHEET.NUMBERGEN"+
     ",ENTRAVELSHEET.DATESTART"+
     ",ENTRAVELSHEET.DATEFINAL"+
     ",ENTRAVELSHEET.SPEEDOMETERSTART"+
     ",ENTRAVELSHEET.SPEEDOMETERFINAL"+
     ",ENTRAVELSHEET.TIMESTART"+
     ",ENTRAVELSHEET.TIMEFINAL"+
     ",ENTRAVELSHEET.DATEEDIT"+
     ",ENTRAVELSHEET.USERGEN"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", tr1.CODE " +
      ", tr1.NAME " +
      ", tr1.INVNUMBER " +
      ", tr1.GOSNUMBER " +
      ", tr2.CODE " +
      ", tr2.NAME " +
      ", tr2.INVNUMBER " +
      ", tr2.GOSNUMBER " +
      ", tr3.CODE " +
      ", tr3.NAME " +
      ", tr3.INVNUMBER " +
      ", tr3.GOSNUMBER " +
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
      ", ENTRAVELWORKMODE.CODE " +
      ", ENTRAVELWORKMODE.NAME " +
      ", ENTRAVELSHEETTYPE.CODE " +
      ", ENTRAVELSHEETTYPE.NAME " +
      ", ENTRAVELSHEETSTATUS.CODE " +
      ", ENTRAVELSHEETSTATUS.NAME " +

      ",ENTRAVELSHEET.FUELCOUNTERSTART"+
      ",ENTRAVELSHEET.FUELCOUNTERFINAL"+


     " FROM ENTRAVELSHEET " +
     " left join TKTRANSPORTREAL tr2 on ENTRAVELSHEET.TRAILER1CODE = tr2.CODE " +
     " left join TKTRANSPORTREAL tr3 on ENTRAVELSHEET.TRAILER2CODE = tr3.CODE " +
     ", TKTRANSPORTREAL tr1" +
     ", ENDEPARTMENT " +
     ", FINWORKER " +
     ", ENTRAVELWORKMODE " +
     ", ENTRAVELSHEETTYPE " +
     ", ENTRAVELSHEETSTATUS " +
     //" WHERE "
    "";
     whereStr = " ENDEPARTMENT.CODE = ENTRAVELSHEET.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND tr1.CODE = ENTRAVELSHEET.TRANSPORTREALCODE" ; //+
      //whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRAVELSHEET.TRAILER1CODE" ; //+
      //whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRAVELSHEET.TRAILER2CODE" ; //+
      whereStr = whereStr +" AND FINWORKER.CODE = ENTRAVELSHEET.FINWORKERCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELWORKMODE.CODE = ENTRAVELSHEET.WORKMODEREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETTYPE.CODE = ENTRAVELSHEET.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETSTATUS.CODE = ENTRAVELSHEET.STATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRAVELSHEET.CODE IN ( SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.USERGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.STATUSREFCODE = ? ";
        }

        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }


      }

      // бортуем сегрегацию ;)
    if (isSegregation){
        SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
        if(segregationInfo.isAccessDenied())
        throw new PersistenceException("{%ENTravelSheet.getList%} access denied");

        String domainWhereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());

        if (domainWhereStr.length() != 0){
        // domainWhereStr = "  AND ENTRAVELSHEET.DOMAIN_INFO IS NOT NULL";
        //else
        if (whereStr.length() == 0)
            whereStr = domainWhereStr;
        else
            whereStr = " "+whereStr + " AND " +domainWhereStr;
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
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
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }

       if(aFilterObject.fuelCounterStart != null){
           number++;
           aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
       }
       if(aFilterObject.fuelCounterFinal != null){
           number++;
           aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
       }


      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        /*
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }
         */

        anObject = new ENTravelSheetShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getString(2);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.speedometerStart = set.getBigDecimal(5);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(6);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeStart = set.getTimestamp(7);
        anObject.timeFinal = set.getTimestamp(8);
        anObject.dateEdit = set.getTimestamp(9);
        anObject.userGen = set.getString(10);

        anObject.departmentCode = set.getInt(11);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(12);
        anObject.departmentDateStart = set.getDate(13);
        anObject.departmentDateFinal = set.getDate(14);
        anObject.transportRealCode = set.getInt(15);
        if(set.wasNull())
        anObject.transportRealCode = Integer.MIN_VALUE;
        anObject.transportRealName = set.getString(16);
        anObject.transportRealInvNumber = set.getString(17);
        anObject.transportRealGosNumber = set.getString(18);
        anObject.trailer1Code = set.getInt(19);
        if(set.wasNull())
        anObject.trailer1Code = Integer.MIN_VALUE;
        anObject.trailer1Name = set.getString(20);
        anObject.trailer1InvNumber = set.getString(21);
        anObject.trailer1GosNumber = set.getString(22);
        anObject.trailer2Code = set.getInt(23);
        if(set.wasNull())
        anObject.trailer2Code = Integer.MIN_VALUE;
        anObject.trailer2Name = set.getString(24);
        anObject.trailer2InvNumber = set.getString(25);
        anObject.trailer2GosNumber = set.getString(26);
        anObject.finWorkerCode = set.getInt(27);
        if(set.wasNull())
        anObject.finWorkerCode = Integer.MIN_VALUE;
        anObject.finWorkerName = set.getString(28);
        anObject.finWorkerTabNumber = set.getString(29);

        anObject.finWorkerPositionName = set.getString(30);
        anObject.finWorkerPositionCode = set.getInt(31);
        if(set.wasNull())
        anObject.finWorkerPositionCode = Integer.MIN_VALUE;
        anObject.finWorkerDepartmentName = set.getString(32);
        anObject.finWorkerDepartmentCode = set.getString(33);
        anObject.finWorkerPriceGen = set.getBigDecimal(34);
        if(anObject.finWorkerPriceGen != null)
          anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorkerCategor = set.getInt(35);
        if(set.wasNull())
        anObject.finWorkerCategor = Integer.MIN_VALUE;
        anObject.finWorkerFinCode = set.getInt(36);
        if(set.wasNull())
        anObject.finWorkerFinCode = Integer.MIN_VALUE;
        anObject.finWorkerIsSentAssignment = set.getInt(37);
        if(set.wasNull())
        anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
        anObject.workModeRefCode = set.getInt(38);
        if(set.wasNull())
        anObject.workModeRefCode = Integer.MIN_VALUE;
        anObject.workModeRefName = set.getString(39);
        anObject.typeRefCode = set.getInt(40);
        if(set.wasNull())
        anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(41);
        anObject.statusRefCode = set.getInt(42);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(43);

        anObject.fuelCounterStart = set.getBigDecimal(44);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(45);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);


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



    // /////////// PRIVATE SECTION ///////////////
    protected static Hashtable _sequenceTable = new Hashtable();

    public String _collectAutoIncrementNumber() throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRAVELSHEET", "NUMBERGEN");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) {
            sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRAVELSHEET",
                        "NUMBERGEN");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRAVELSHEET",
                        "NUMBERGEN");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRAVELSHEET");
        } else {

            return nextSeqValue.toString();
        }
    }


  public static String processCondition(String aCondition)
  {
   if(aCondition == null || aCondition.length() == 0)
    return "";

   StringBuffer condition = new StringBuffer(aCondition);
   _checkConditionToken(condition,";"," ");
   _checkConditionToken(condition,"--"," ");
   _checkConditionToken(condition,"\r"," ");
   _checkConditionToken(condition,"\n"," ");
   _checkConditionToken(condition,"||"," OR ");
   _checkConditionToken(condition,"&&"," AND ");
   _checkConditionToken(condition,"==","=");
   _checkConditionToken(condition,"!=","<>");
   _checkConditionToken(condition,"code","ENTRAVELSHEET.CODE");
   _checkConditionToken(condition,"numbergen","ENTRAVELSHEET.NUMBERGEN");
   _checkConditionToken(condition,"datestart","ENTRAVELSHEET.DATESTART");
   _checkConditionToken(condition,"datefinal","ENTRAVELSHEET.DATEFINAL");
   _checkConditionToken(condition,"speedometerstart","ENTRAVELSHEET.SPEEDOMETERSTART");
   _checkConditionToken(condition,"speedometerfinal","ENTRAVELSHEET.SPEEDOMETERFINAL");
   _checkConditionToken(condition,"fuelcounterstart","ENTRAVELSHEET.FUELCOUNTERSTART");
   _checkConditionToken(condition,"fuelcounterfinal","ENTRAVELSHEET.FUELCOUNTERFINAL");
   _checkConditionToken(condition,"timestart","ENTRAVELSHEET.TIMESTART");
   _checkConditionToken(condition,"timefinal","ENTRAVELSHEET.TIMEFINAL");
   _checkConditionToken(condition,"commentgen","ENTRAVELSHEET.COMMENTGEN");
   _checkConditionToken(condition,"dateedit","ENTRAVELSHEET.DATEEDIT");
   _checkConditionToken(condition,"usergen","ENTRAVELSHEET.USERGEN");
   _checkConditionToken(condition,"domain_info","ENTRAVELSHEET.DOMAIN_INFO");
   _checkConditionToken(condition,"modify_time","ENTRAVELSHEET.MODIFY_TIME");
     // relationship conditions
   _checkConditionToken(condition,"department","DEPARTMENTCODE");
   _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
   _checkConditionToken(condition,"transportreal","TRANSPORTREALCODE");
   _checkConditionToken(condition,"transportreal.code","TRANSPORTREALCODE");
   _checkConditionToken(condition,"trailer1","TRAILER1CODE");
   _checkConditionToken(condition,"trailer1.code","TRAILER1CODE");
   _checkConditionToken(condition,"trailer2","TRAILER2CODE");
   _checkConditionToken(condition,"trailer2.code","TRAILER2CODE");
   //_checkConditionToken(condition,"finworker","FINWORKERCODE");
   _checkConditionToken(condition,"finworker.code","FINWORKERCODE");
   _checkConditionToken(condition,"workmoderef","WORKMODEREFCODE");
   _checkConditionToken(condition,"workmoderef.code","WORKMODEREFCODE");
   _checkConditionToken(condition,"typeref","TYPEREFCODE");
   _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
   _checkConditionToken(condition,"statusref","STATUSREFCODE");
   _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
   return condition.toString();
  }



  /**
   *  массив кодов без сегрегации
   */
  public int[] getFilteredArray(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects, boolean isSegregation) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.STATUSREFCODE = ? ";
        }

        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN LIKE ?";

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
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN LIKE ?";

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
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }

       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
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

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
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


    } // end of getFilteredCodeArray


  @Override
public void loadObject(ENTravelSheet anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
   "SELECT  ENTRAVELSHEET.CODE, ENTRAVELSHEET.NUMBERGEN, ENTRAVELSHEET.DATESTART, ENTRAVELSHEET.DATEFINAL, ENTRAVELSHEET.SPEEDOMETERSTART, ENTRAVELSHEET.SPEEDOMETERFINAL, ENTRAVELSHEET.FUELCOUNTERSTART, ENTRAVELSHEET.FUELCOUNTERFINAL, ENTRAVELSHEET.TIMESTART, ENTRAVELSHEET.TIMEFINAL, ENTRAVELSHEET.COMMENTGEN, ENTRAVELSHEET.DATEEDIT, ENTRAVELSHEET.USERGEN, ENTRAVELSHEET.DOMAIN_INFO, ENTRAVELSHEET.MODIFY_TIME, ENTRAVELSHEET.ISMOBILIZTN, ENTRAVELSHEET.DEPARTMENTCODE, ENTRAVELSHEET.TRANSPORTREALCODE, ENTRAVELSHEET.TRAILER1CODE, ENTRAVELSHEET.TRAILER2CODE, ENTRAVELSHEET.FINWORKERCODE, ENTRAVELSHEET.FINWORKER_ADDITINL_1CD, ENTRAVELSHEET.FINWORKER_ADDITINL_2CD, ENTRAVELSHEET.WORKMODEREFCODE, ENTRAVELSHEET.TYPEREFCODE, ENTRAVELSHEET.STATUSREFCODE "
   +" FROM ENTRAVELSHEET WHERE ENTRAVELSHEET.CODE = ?";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObject.code);
     set = statement.executeQuery();
     if(!set.next())
      anObject.code = Integer.MIN_VALUE;
     else
      {
       anObject.code = set.getInt(1);
       anObject.numberGen = set.getString(2);
       anObject.dateStart = set.getDate(3);
       anObject.dateFinal = set.getDate(4);
       anObject.speedometerStart = set.getBigDecimal(5);
       if(anObject.speedometerStart != null)
           anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.speedometerFinal = set.getBigDecimal(6);
       if(anObject.speedometerFinal != null)
           anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.fuelCounterStart = set.getBigDecimal(7);
       if(anObject.fuelCounterStart != null)
           anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.fuelCounterFinal = set.getBigDecimal(8);
       if(anObject.fuelCounterFinal != null)
           anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeStart = set.getTimestamp(9);
       anObject.timeFinal = set.getTimestamp(10);
       anObject.commentGen = set.getString(11);
       anObject.dateEdit = set.getTimestamp(12);
       anObject.userGen = set.getString(13);
       anObject.domain_info = set.getString(14);
       anObject.modify_time = set.getLong(15);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.isMobiliztn = set.getInt(16);
       if ( set.wasNull() )
          anObject.isMobiliztn = Integer.MIN_VALUE;
       anObject.department.code = set.getInt(17);
       if ( set.wasNull() )
           anObject.department.code = Integer.MIN_VALUE;
       anObject.transportReal.code = set.getInt(18);
       if ( set.wasNull() )
           anObject.transportReal.code = Integer.MIN_VALUE;
       anObject.trailer1.code = set.getInt(19);
       if ( set.wasNull() )
           anObject.trailer1.code = Integer.MIN_VALUE;
       anObject.trailer2.code = set.getInt(20);
       if ( set.wasNull() )
           anObject.trailer2.code = Integer.MIN_VALUE;
       anObject.finWorker.code = set.getInt(21);
       if ( set.wasNull() )
           anObject.finWorker.code = Integer.MIN_VALUE;
       anObject.finWorker_additional_1.code = set.getInt(22);
       if ( set.wasNull() )
           anObject.finWorker_additional_1.code = Integer.MIN_VALUE;
       anObject.finWorker_additional_2.code = set.getInt(23);
       if ( set.wasNull() )
           anObject.finWorker_additional_2.code = Integer.MIN_VALUE;
       anObject.workModeRef.code = set.getInt(24);
       if ( set.wasNull() )
           anObject.workModeRef.code = Integer.MIN_VALUE;
       anObject.typeRef.code = set.getInt(25);
       if ( set.wasNull() )
           anObject.typeRef.code = Integer.MIN_VALUE;
       anObject.statusRef.code = set.getInt(26);
       if ( set.wasNull() )
           anObject.statusRef.code = Integer.MIN_VALUE;
       if(anObject.department.code != Integer.MIN_VALUE)
       {
          anObject.setDepartment(
     new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
   }
       if(anObject.transportReal.code != Integer.MIN_VALUE)
       {
          anObject.setTransportReal(
     new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.transportReal.code));
   }
       if(anObject.trailer1.code != Integer.MIN_VALUE)
       {
          anObject.setTrailer1(
     new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.trailer1.code));
   }
       if(anObject.trailer2.code != Integer.MIN_VALUE)
       {
          anObject.setTrailer2(
     new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.trailer2.code));
   }
       if(anObject.finWorker.code != Integer.MIN_VALUE)
       {
          anObject.setFinWorker(
     new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
   }
       if(anObject.finWorker_additional_1.code != Integer.MIN_VALUE)
       {
          anObject.setFinWorker_additional_1(
     new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker_additional_1.code));
   }
       if(anObject.finWorker_additional_2.code != Integer.MIN_VALUE)
       {
          anObject.setFinWorker_additional_2(
     new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker_additional_2.code));
   }
       if(anObject.workModeRef.code != Integer.MIN_VALUE)
       {
          anObject.setWorkModeRef(
     new com.ksoe.energynet.dataminer.generated.ENTravelWorkModeDAOGen(connection,getUserProfile()).getRef(anObject.workModeRef.code));
   }
       if(anObject.typeRef.code != Integer.MIN_VALUE)
       {
          anObject.setTypeRef(
     new com.ksoe.energynet.dataminer.generated.ENTravelSheetTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
   }
       if(anObject.statusRef.code != Integer.MIN_VALUE)
       {
          anObject.setStatusRef(
     new com.ksoe.energynet.dataminer.generated.ENTravelSheetStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
   }

     }
   }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     throw new SystemException(e.getMessage(), e);
    }
   finally
    {
     try {if(set != null) set.close(); if (statement != null) statement.close();}
     catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  @Override
public ENTravelSheet getObject(int uid) throws PersistenceException
  {
   ENTravelSheet result = new ENTravelSheet();
   result.code = uid;
   loadObject(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }


  @Override
public int[] getFilteredCodeArray(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.isMobiliztn != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.ISMOBILIZTN = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.STATUSREFCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN LIKE ?";

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
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN LIKE ?";

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
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if(aFilterObject.isMobiliztn != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isMobiliztn);
         }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
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
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
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


    } // end of getFilteredCodeArray




} // end of ENTravelSheetDAO

