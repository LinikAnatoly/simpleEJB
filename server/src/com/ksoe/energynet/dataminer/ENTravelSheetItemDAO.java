
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENTravelSheetItem;  
  * 	
  */

public class ENTravelSheetItemDAO extends ENTravelSheetItemDAOGen {

//  public ENTravelSheetItemDAO() {super();}
//  public ENTravelSheetItemDAO(Connection aConnection) {super(aConnection);}
// public ENTravelSheetItemDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
  public int add(ENTravelSheetItem anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  return super.add(anObject);	  
  }
  
  public void save(ENTravelSheetItem anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  super.save(anObject);
  }
  
 
  public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
  
  public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {   
    ENTravelSheetItemShortList result = new ENTravelSheetItemShortList();
    ENTravelSheetItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);
	
    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
    selectStr = "SELECT "+
     "ENTRAVELSHEETITEM.CODE"+
     ",ENTRAVELSHEETITEM.TRAVELFROM"+
     ",ENTRAVELSHEETITEM.TRAVELTO"+
     ",ENTRAVELSHEETITEM.TIMESTART"+
     ",ENTRAVELSHEETITEM.TIMEFINAL"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERSTART"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERFINAL"+
     ",ENTRAVELSHEETITEM.SUMDISTANCES"+
     ",ENTRAVELSHEETITEM.SUMMACHINEHOURS"+
     ",ENTRAVELSHEETITEM.DATEEDIT"+
     ",ENTRAVELSHEETITEM.USERGEN"+

      ", tsi2.CODE " +
      ", tsi2.TRAVELFROM " +
      ", tsi2.TRAVELTO " +
      ", tsi2.TIMESTART " +
      ", tsi2.TIMEFINAL " +
      ", tsi2.SPEEDOMETERSTART " +
      ", tsi2.SPEEDOMETERFINAL " +
      ", tsi2.SUMDISTANCES " +
      ", tsi2.SUMMACHINEHOURS " +
      ", tsi2.DATEEDIT " +
      ", tsi2.USERGEN " +
      
      ", ENTRAVELSHEET.CODE " +
      ", ENTRAVELSHEET.NUMBERGEN " +
      ", ENTRAVELSHEET.DATESTART " +
      ", ENTRAVELSHEET.DATEFINAL " +
      ", ENTRAVELSHEET.SPEEDOMETERSTART " +
      ", ENTRAVELSHEET.SPEEDOMETERFINAL " +
      ", ENTRAVELSHEET.TIMESTART " +
      ", ENTRAVELSHEET.TIMEFINAL " +
      ", ENTRAVELSHEET.DATEEDIT " +
      ", ENTRAVELSHEET.USERGEN " +
      
      ", ENTRAVELSHEETITEMKIND.CODE " +
      ", ENTRAVELSHEETITEMKIND.NAME " +
      ", ENTRAVELSHEETITEMSTATS.CODE " +
      ", ENTRAVELSHEETITEMSTATS.NAME " +
      
      ",ENTRAVELSHEETITEM.FUELCOUNTERSTART"+
      ",ENTRAVELSHEETITEM.FUELCOUNTERFINAL"+
      
      ",tsi2.FUELCOUNTERSTART"+
      ",tsi2.FUELCOUNTERFINAL"+
      ", (select w.workordernumber from enworkorder2enplanwork w2p, enworkorder w where " +
      "  	w2p.plancode = ENTRAVELSHEETITEM.planrefcode and w2p.workordercode = w.code ) as workOrderNumber " +
      
      ", ENTRAVELSHEETITEM.PLANREFCODE " +
      ", ENTRAVELSHEETITEM.HEATINGTIME " +
      ", ENTRAVELSHEETITEM.RASHODPROBEG " +
      ", ENTRAVELSHEETITEM.RASHODWORK " +
      ", ENTRAVELSHEETITEM.TRANSPORTKOEF " +
  	
    ",ENTRAVELSHEETITEM.DISTANCEBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS"+
  	",ENTRAVELSHEETITEM.TRAVELORDER"+
      
     " FROM ENTRAVELSHEETITEM " +
     " left join ENTRAVELSHEETITEM tsi2 on (ENTRAVELSHEETITEM.PARENTITEMREFCODE = tsi2.CODE and tsi2.travelsheetrefcode =  ENTRAVELSHEETITEM.travelsheetrefcode)" +
     ", ENTRAVELSHEET " +
     ", ENTRAVELSHEETITEMKIND " +
     ", ENTRAVELSHEETITEMSTATS " +
     //" WHERE " 
	""; 
     //whereStr = " ENTRAVELSHEETITEM.CODE = ENTRAVELSHEETITEM.PARENTITEMREFCODE" ; //+
      whereStr = whereStr +" ENTRAVELSHEET.CODE = ENTRAVELSHEETITEM.TRAVELSHEETREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETITEMKIND.CODE = ENTRAVELSHEETITEM.KINDREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETITEMSTATS.CODE = ENTRAVELSHEETITEM.STATUSREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENTRAVELSHEETITEM.CODE IN ( SELECT ENTRAVELSHEETITEM.CODE FROM ENTRAVELSHEETITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.CODE = ?";
        }
         if (aFilterObject.travelFrom != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.travelFrom.indexOf('*',0) < 0 && aFilterObject.travelFrom.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEETITEM.TRAVELFROM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEETITEM.TRAVELFROM) LIKE UPPER(?)";
         }
         if (aFilterObject.travelTo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.travelTo.indexOf('*',0) < 0 && aFilterObject.travelTo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEETITEM.TRAVELTO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEETITEM.TRAVELTO) LIKE UPPER(?)";
         }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.TIMEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.sumDistances != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.SUMDISTANCES = ?";
        }
        if(aFilterObject.sumMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.SUMMACHINEHOURS = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEETITEM.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEETITEM.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEETITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEETITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.parentItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETITEM.PARENTITEMREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETITEM.TRAVELSHEETREFCODE = ? ";
        }
        // он дето делс€ !!!
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETITEM.PLANREFCODE = ? ";
        }
        
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETITEM.KINDREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETITEM.STATUSREFCODE = ? ";
        }
        
        
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.heatingTime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.HEATINGTIME = ?";
        }
        if(aFilterObject.rashodProbeg != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.RASHODPROBEG = ?";
        }
        if(aFilterObject.rashodWork != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.RASHODWORK = ?";
        }
        if(aFilterObject.transportKoef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.TRANSPORTKOEF = ?";
        }
        if(aFilterObject.distanceByGPS != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETITEM.DISTANCEBYGPS = ?";
        }
        if(aFilterObject.hoursByGPS != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.HOURSBYGPS = ?";
        }
        if(aFilterObject.hoursInMotionByGPS != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.hoursinmotionbygps = ?";
        }
        if(aFilterObject.hoursStopWorkByGPS != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.hoursstopworkbygps = ?";
        }
        if(aFilterObject.hoursStopOffByGPS != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.hoursStopOffByGPS = ?";
        }
        if(aFilterObject.travelOrder != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEM.travelorder = ?";
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

           if(aFilterObject.travelFrom != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.travelFrom);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.travelTo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.travelTo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
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
        if(aFilterObject.sumDistances != null){
            number++;
            aFilterObject.sumDistances = aFilterObject.sumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDistances);
        }
        if(aFilterObject.sumMachineHours != null){
            number++;
            aFilterObject.sumMachineHours = aFilterObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumMachineHours);
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.parentItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentItemRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
       }
       
       // дето делос€ !!!!
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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
       if(aFilterObject.heatingTime != null){
           number++;
           aFilterObject.heatingTime = aFilterObject.heatingTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.heatingTime);
       }
       if(aFilterObject.rashodProbeg != null){
           number++;
           aFilterObject.rashodProbeg = aFilterObject.rashodProbeg.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.rashodProbeg);
       }
       if(aFilterObject.rashodWork != null){
           number++;
           aFilterObject.rashodWork = aFilterObject.rashodWork.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.rashodWork);
       }
       if(aFilterObject.transportKoef != null){
           number++;
           aFilterObject.transportKoef = aFilterObject.transportKoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.transportKoef);
       }
       if(aFilterObject.distanceByGPS != null){
           number++;
           aFilterObject.distanceByGPS = aFilterObject.distanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.distanceByGPS);
       }
       if(aFilterObject.hoursByGPS != null){
           number++;
           aFilterObject.hoursByGPS = aFilterObject.hoursByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.hoursByGPS);
       }
       if(aFilterObject.hoursInMotionByGPS != null){
           number++;
           aFilterObject.hoursInMotionByGPS = aFilterObject.hoursInMotionByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.hoursInMotionByGPS);
       }
       if(aFilterObject.hoursStopWorkByGPS != null){
           number++;
           aFilterObject.hoursStopWorkByGPS = aFilterObject.hoursStopWorkByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.hoursStopWorkByGPS);
       }
       if(aFilterObject.hoursStopOffByGPS != null){
           number++;
           aFilterObject.hoursStopOffByGPS = aFilterObject.hoursStopOffByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.hoursStopOffByGPS);
       }
       if(aFilterObject.travelOrder != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.travelOrder);
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

        anObject = new ENTravelSheetItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.travelFrom = set.getString(2);
        anObject.travelTo = set.getString(3);
        anObject.timeStart = set.getTimestamp(4);		
        anObject.timeFinal = set.getTimestamp(5);		
        anObject.speedometerStart = set.getBigDecimal(6);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(7);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDistances = set.getBigDecimal(8);
        if(anObject.sumDistances != null)
            anObject.sumDistances = anObject.sumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumMachineHours = set.getBigDecimal(9);
        if(anObject.sumMachineHours != null)
            anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateEdit = set.getTimestamp(10);		
        anObject.userGen = set.getString(11);

        anObject.parentItemRefCode = set.getInt(12);
		if(set.wasNull())
		   anObject.parentItemRefCode = Integer.MIN_VALUE;		
        anObject.parentItemRefTravelFrom = set.getString(13);
        anObject.parentItemRefTravelTo = set.getString(14);
        anObject.parentItemRefTimeStart = set.getTimestamp(15);
        anObject.parentItemRefTimeFinal = set.getTimestamp(16);
        anObject.parentItemRefSpeedometerStart = set.getBigDecimal(17);
        if(anObject.parentItemRefSpeedometerStart != null)
          anObject.parentItemRefSpeedometerStart = anObject.parentItemRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentItemRefSpeedometerFinal = set.getBigDecimal(18);
        if(anObject.parentItemRefSpeedometerFinal != null)
          anObject.parentItemRefSpeedometerFinal = anObject.parentItemRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentItemRefSumDistances = set.getBigDecimal(19);
        if(anObject.parentItemRefSumDistances != null)
          anObject.parentItemRefSumDistances = anObject.parentItemRefSumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentItemRefSumMachineHours = set.getBigDecimal(20);
        if(anObject.parentItemRefSumMachineHours != null)
          anObject.parentItemRefSumMachineHours = anObject.parentItemRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentItemRefDateEdit = set.getTimestamp(21);
        anObject.parentItemRefUserGen = set.getString(22);
        anObject.travelSheetRefCode = set.getInt(23);
		if(set.wasNull())
		   anObject.travelSheetRefCode = Integer.MIN_VALUE;		
        anObject.travelSheetRefNumberGen = set.getString(24);
        anObject.travelSheetRefDateStart = set.getDate(25);
        anObject.travelSheetRefDateFinal = set.getDate(26);
        anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(27);
        if(anObject.travelSheetRefSpeedometerStart != null)
          anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(28);
        if(anObject.travelSheetRefSpeedometerFinal != null)
          anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefTimeStart = set.getTimestamp(29);
        anObject.travelSheetRefTimeFinal = set.getTimestamp(30);
        anObject.travelSheetRefDateEdit = set.getTimestamp(31);
        anObject.travelSheetRefUserGen = set.getString(32);
        anObject.kindRefCode = set.getInt(33);
		if(set.wasNull())
		   anObject.kindRefCode = Integer.MIN_VALUE;		
        anObject.kindRefName = set.getString(34);
        anObject.statusRefCode = set.getInt(35);
		if(set.wasNull())
		   anObject.statusRefCode = Integer.MIN_VALUE;		
        anObject.statusRefName = set.getString(36);

        anObject.fuelCounterStart = set.getBigDecimal(37);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(38);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.parentItemRefFuelCounterStart = set.getBigDecimal(39);
        if(anObject.parentItemRefFuelCounterStart != null)
          anObject.parentItemRefFuelCounterStart = anObject.parentItemRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentItemRefFuelCounterFinal = set.getBigDecimal(40);
        if(anObject.parentItemRefFuelCounterFinal != null)
          anObject.parentItemRefFuelCounterFinal = anObject.parentItemRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        
        anObject.workOrderNumber = set.getString(41);
        
        anObject.planRefCode = set.getInt(42);
        if (set.wasNull())
        	anObject.planRefCode = Integer.MIN_VALUE;
        
        anObject.heatingTime = set.getBigDecimal(43);
        if(anObject.heatingTime != null)
            anObject.heatingTime = anObject.heatingTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        
        anObject.rashodProbeg = set.getBigDecimal(44);
        if(anObject.rashodProbeg != null)
            anObject.rashodProbeg = anObject.rashodProbeg.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.rashodWork = set.getBigDecimal(45);
        if(anObject.rashodWork != null)
            anObject.rashodWork = anObject.rashodWork.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.transportKoef = set.getBigDecimal(46);
        if(anObject.transportKoef != null)
            anObject.transportKoef = anObject.transportKoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.distanceByGPS = set.getBigDecimal(47);
		if(anObject.distanceByGPS != null) {
			anObject.distanceByGPS = anObject.distanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursByGPS = set.getBigDecimal(48);
		if(anObject.hoursByGPS != null) {
			anObject.hoursByGPS = anObject.hoursByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursInMotionByGPS = set.getBigDecimal(49);
		if(anObject.hoursInMotionByGPS != null) {
			anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursStopWorkByGPS = set.getBigDecimal(50);
		if(anObject.hoursStopWorkByGPS != null) {
			anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursStopOffByGPS = set.getBigDecimal(51);
		if(anObject.hoursStopOffByGPS != null) {
			anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.travelOrder = set.getInt(52);
		if ( set.wasNull() ) {
			anObject.travelOrder = Integer.MIN_VALUE;
		}
        
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

 

  public ENTravelSheetItemShortList getListForFact(int travelSheetCode) throws PersistenceException
   {   
    ENTravelSheetItemShortList result = new ENTravelSheetItemShortList();
    ENTravelSheetItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";



    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
    selectStr = "SELECT "+
     "ENTRAVELSHEETITEM.CODE"+
     ",ENTRAVELSHEETITEM.TRAVELFROM"+
     ",ENTRAVELSHEETITEM.TRAVELTO"+
     ",ENTRAVELSHEETITEM.TIMESTART"+
     ",ENTRAVELSHEETITEM.TIMEFINAL"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERSTART"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERFINAL"+
     ",ENTRAVELSHEETITEM.SUMDISTANCES"+
     ",ENTRAVELSHEETITEM.SUMMACHINEHOURS"+
     ",ENTRAVELSHEETITEM.DATEEDIT"+
     ",ENTRAVELSHEETITEM.USERGEN"+

      
      ",ENTRAVELSHEETITEM.FUELCOUNTERSTART"+
      ",ENTRAVELSHEETITEM.FUELCOUNTERFINAL"+
      
      ", (select w.workordernumber from enworkorder2enplanwork w2p, enworkorder w where " +
      "  	w2p.plancode = ENTRAVELSHEETITEM.planrefcode and w2p.workordercode = w.code ) as workOrderNumber " +
      
      ", coalesce(sum(ei.countfact), 0)," +
      
      // AS 16.05.2011
      //" coalesce(sum(fm.quantity),0) " +
      
      " coalesce( (" +
      "  select sum(fm.quantity) from entravlshttm2trnsprttm ti2tr,  entransport2enestimate tr2ei, enestimateitem ei, finmaterials fm " + 
      "    where tr2ei.transportrefcode = ti2tr.transportitemrefcode and ti2tr.travelsheetitemrefcode = ENTRAVELSHEETITEM.code " +
    "		and ei.code = tr2ei.estimaterefcode and ei.kindrefcode = " + ENEstimateItemKind.GSM +
    "		and  ei.code = fm.estimateitemrefcode and  fm.statusrefcode = " + FINMaterialsStatus.GOOD + "), 0) " +

    ", (select w.dategen from enworkorder2enplanwork w2p, enworkorder w where " +
    "  	w2p.plancode = ENTRAVELSHEETITEM.planrefcode and w2p.workordercode = w.code ) as workOrderDate " +
    
    ", ENTRAVELSHEETITEM.HEATINGTIME " +
    ", ENTRAVELSHEETITEM.RASHODPROBEG " +
    ", ENTRAVELSHEETITEM.RASHODWORK " +
    ", ENTRAVELSHEETITEM.TRANSPORTKOEF " +
    
	",ENTRAVELSHEETITEM.DISTANCEBYGPS"+
	",ENTRAVELSHEETITEM.HOURSBYGPS"+
	",ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS"+
	",ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS"+
	",ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS"+
	",ENTRAVELSHEETITEM.TRAVELORDER"+
    
     " FROM ENTRAVELSHEETITEM " +     
     " left join entravlshttm2trnsprttm ti2tr on ti2tr.travelsheetitemrefcode = ENTRAVELSHEETITEM.code " +
     " left join entransport2enestimate tr2ei on tr2ei.transportrefcode = ti2tr.transportitemrefcode " +
     " left join enestimateitem ei on " +
     "   ei.code = tr2ei.estimaterefcode and ei.kindrefcode = " + ENEstimateItemKind.GSM +
     //AS" left join finmaterials fm on " +
     //"   ei.code = fm.estimateitemrefcode and fm.statusrefcode = " + FINMaterialsStatus.GOOD +   
	 " where ENTRAVELSHEETITEM.travelsheetrefcode = ? and ENTRAVELSHEETITEM.kindrefcode = " + ENTravelSheetItemKind.FACT +
	 " group by " +
     "ENTRAVELSHEETITEM.CODE"+
     ",ENTRAVELSHEETITEM.TRAVELFROM"+
     ",ENTRAVELSHEETITEM.TRAVELTO"+
     ",ENTRAVELSHEETITEM.TIMESTART"+
     ",ENTRAVELSHEETITEM.TIMEFINAL"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERSTART"+
     ",ENTRAVELSHEETITEM.SPEEDOMETERFINAL"+
     ",ENTRAVELSHEETITEM.SUMDISTANCES"+
     ",ENTRAVELSHEETITEM.SUMMACHINEHOURS"+
     ",ENTRAVELSHEETITEM.DATEEDIT"+
     ",ENTRAVELSHEETITEM.USERGEN"+
      ",ENTRAVELSHEETITEM.FUELCOUNTERSTART"+
      ",ENTRAVELSHEETITEM.FUELCOUNTERFINAL"+
      ", (select w.workordernumber from enworkorder2enplanwork w2p, enworkorder w where " +
      "  	w2p.plancode = ENTRAVELSHEETITEM.planrefcode and w2p.workordercode = w.code )" +
      
      ", (select w.dategen from enworkorder2enplanwork w2p, enworkorder w where " +
      "  	w2p.plancode = ENTRAVELSHEETITEM.planrefcode and w2p.workordercode = w.code )" +  
      ", ENTRAVELSHEETITEM.HEATINGTIME " +
      ", ENTRAVELSHEETITEM.RASHODPROBEG " +
      ", ENTRAVELSHEETITEM.RASHODWORK " +
      ", ENTRAVELSHEETITEM.TRANSPORTKOEF " +
  	",ENTRAVELSHEETITEM.DISTANCEBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS"+
  	",ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS"+
  	",ENTRAVELSHEETITEM.TRAVELORDER"+
      
	 " order by ENTRAVELSHEETITEM.TRAVELORDER, ENTRAVELSHEETITEM.speedometerstart, ENTRAVELSHEETITEM.code";


    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1, travelSheetCode);
      
      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {


        anObject = new ENTravelSheetItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.travelFrom = set.getString(2);
        anObject.travelTo = set.getString(3);
        anObject.timeStart = set.getTimestamp(4);		
        anObject.timeFinal = set.getTimestamp(5);		
        anObject.speedometerStart = set.getBigDecimal(6);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(7);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDistances = set.getBigDecimal(8);
        if(anObject.sumDistances != null)
            anObject.sumDistances = anObject.sumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumMachineHours = set.getBigDecimal(9);
        if(anObject.sumMachineHours != null)
            anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateEdit = set.getTimestamp(10);		
        anObject.userGen = set.getString(11);


        anObject.fuelCounterStart = set.getBigDecimal(12);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(13);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.workOrderNumber = set.getString(14);
        
        anObject.estimateCount = set.getBigDecimal(15);
        if (anObject.estimateCount != null)
        	anObject.estimateCount = anObject.estimateCount.setScale(2, BigDecimal.ROUND_HALF_UP);
        
        anObject.finmaterialsCount = set.getBigDecimal(16);
        if (anObject.finmaterialsCount != null)
        	anObject.finmaterialsCount = anObject.finmaterialsCount.setScale(2, BigDecimal.ROUND_HALF_UP);        
        
        anObject.planRefDateStart = set.getDate(17);
        
        anObject.heatingTime = set.getBigDecimal(18);
        if (anObject.heatingTime != null)
        	anObject.heatingTime = anObject.heatingTime.setScale(2, BigDecimal.ROUND_HALF_UP);
        
        anObject.rashodProbeg = set.getBigDecimal(19);
        if (anObject.rashodProbeg != null)
        	anObject.rashodProbeg = anObject.rashodProbeg.setScale(3, BigDecimal.ROUND_HALF_UP);
        
        anObject.rashodWork = set.getBigDecimal(20);
        if (anObject.rashodWork != null)
        	anObject.rashodWork = anObject.rashodWork.setScale(3, BigDecimal.ROUND_HALF_UP);
        
        anObject.transportKoef = set.getBigDecimal(21);
        if (anObject.transportKoef != null)
        	anObject.transportKoef = anObject.transportKoef.setScale(3, BigDecimal.ROUND_HALF_UP);

        anObject.distanceByGPS = set.getBigDecimal(22);
		if(anObject.distanceByGPS != null) {
			anObject.distanceByGPS = anObject.distanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursByGPS = set.getBigDecimal(23);
		if(anObject.hoursByGPS != null) {
			anObject.hoursByGPS = anObject.hoursByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursInMotionByGPS = set.getBigDecimal(24);
		if(anObject.hoursInMotionByGPS != null) {
			anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursStopWorkByGPS = set.getBigDecimal(25);
		if(anObject.hoursStopWorkByGPS != null) {
			anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.hoursStopOffByGPS = set.getBigDecimal(26);
		if(anObject.hoursStopOffByGPS != null) {
			anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.travelOrder = set.getInt(27);
		if ( set.wasNull() ) {
			anObject.travelOrder = Integer.MIN_VALUE;
		}

        
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


  /**
   * 
   * ѕроцедура дл€ установки нужного modify_time дл€ ENTravelSheetItem
   * 
   * @param code код ENTravelSheetItem
   * @param modify_time врем€ изменени€ в миллисекундах
   */
  public void updateModify_time(int code, long modify_time) throws PersistenceException
  {
	   String     selectStr;
	    Connection connection = getConnection();

	    selectStr = "UPDATE ENTRAVELSHEETITEM SET MODIFY_TIME = ? WHERE CODE = ?";

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    ENTravelSheetItem object = getObject(code);

	    if(object == null)
	     throw new PersistenceException("{%ENTravelSheetItem.getObject%} access denied");

	    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
	     throw new PersistenceException("{%ENTravelSheetItem.remove%} access denied");

	    PreparedStatement statement = null;
	    try
	     {
	      statement = connection.prepareStatement(selectStr);
	      statement.setLong(1, modify_time);
	      statement.setInt(2,code);
	      statement.execute();
	     }
	    catch(SQLException e)
	     {
	      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	     }
	    finally
	     {
	      try {if (statement != null) statement.close();} catch (SQLException e) {}
	      if(connection != super.getConnection())
	       {
	        try{connection.close();} catch(SQLException e){}
	       }
	     }
  }
  
  


} // end of ENTravelSheetItemDAO

