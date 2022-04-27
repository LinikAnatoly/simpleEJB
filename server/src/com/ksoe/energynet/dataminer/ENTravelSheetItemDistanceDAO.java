
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKTransportReal2TKFuelKoefDAO;
import com.ksoe.techcard.valueobject.filter.TKTransportReal2TKFuelKoefFilter;
import com.ksoe.techcard.valueobject.lists.TKTransportReal2TKFuelKoefShortList;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDistanceDAOGen;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENTravelSheetItemDistance;  
  * 	
  */


public class ENTravelSheetItemDistanceDAO extends ENTravelSheetItemDistanceDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTravelSheetItemDistanceDAO() {super();}
  //public ENTravelSheetItemDistanceDAO(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetItemDistanceDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetItemDistanceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItemDistanceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENTravelSheetItemDistanceShortList result = new ENTravelSheetItemDistanceShortList();
   ENTravelSheetItemDistanceShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENTRAVELSHEETITEMDSTNC.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENTRAVELSHEETITEMDSTNC.CODE"+
    ",ENTRAVELSHEETITEMDSTNC.DISTANCE"+
    ",ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS"+
    ",ENTRAVELSHEETITEMDSTNC.KOEF"+

     ", ENTRAVELSHEETITEM.CODE " +
     ", ENTRAVELSHEETITEM.TRAVELFROM " +
     ", ENTRAVELSHEETITEM.TRAVELTO " +
     ", ENTRAVELSHEETITEM.TIMESTART " +
     ", ENTRAVELSHEETITEM.TIMEFINAL " +
     ", ENTRAVELSHEETITEM.SPEEDOMETERSTART " +
     ", ENTRAVELSHEETITEM.SPEEDOMETERFINAL " +
     ", ENTRAVELSHEETITEM.FUELCOUNTERSTART " +
     ", ENTRAVELSHEETITEM.FUELCOUNTERFINAL " +
     ", ENTRAVELSHEETITEM.SUMDISTANCES " +
     ", ENTRAVELSHEETITEM.SUMMACHINEHOURS " +
     ", ENTRAVELSHEETITEM.DATEEDIT " +
     ", ENTRAVELSHEETITEM.USERGEN " +
    " FROM ENTRAVELSHEETITEMDSTNC " +
    ", ENTRAVELSHEETITEM " +
    //" WHERE " 
	""; 
    whereStr = " ENTRAVELSHEETITEM.CODE = ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENTRAVELSHEETITEMDSTNC.CODE IN ( SELECT ENTRAVELSHEETITEMDSTNC.CODE FROM ENTRAVELSHEETITEMDSTNC ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.CODE = ?";
       }
       if(aFilterObject.distance != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.DISTANCE = ?";
       }
       if(aFilterObject.sumMachineHours != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS = ?";
       }
       if(aFilterObject.koef != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.KOEF = ?";
       }
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE = ? ";
       }

     }

	  

     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
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
       if(aFilterObject.distance != null){
           number++;
           aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.distance);
       }
       if(aFilterObject.sumMachineHours != null){
           number++;
           aFilterObject.sumMachineHours = aFilterObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.sumMachineHours);
       }
       if(aFilterObject.koef != null){
           number++;
           aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.koef);
       }
      if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.travelSheetItemRef.code);
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

       anObject = new ENTravelSheetItemDistanceShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.distance = set.getBigDecimal(2);
       if(anObject.distance != null)
           anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.sumMachineHours = set.getBigDecimal(3);
       if(anObject.sumMachineHours != null)
           anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.koef = set.getBigDecimal(4);
       if(anObject.koef != null)
           anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.travelSheetItemRefCode = set.getInt(5);
		if(set.wasNull())
		   anObject.travelSheetItemRefCode = Integer.MIN_VALUE;		
       anObject.travelSheetItemRefTravelFrom = set.getString(6);
       anObject.travelSheetItemRefTravelTo = set.getString(7);
       anObject.travelSheetItemRefTimeStart = set.getTimestamp(8);
       anObject.travelSheetItemRefTimeFinal = set.getTimestamp(9);
       anObject.travelSheetItemRefSpeedometerStart = set.getBigDecimal(10);
       if(anObject.travelSheetItemRefSpeedometerStart != null)
         anObject.travelSheetItemRefSpeedometerStart = anObject.travelSheetItemRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefSpeedometerFinal = set.getBigDecimal(11);
       if(anObject.travelSheetItemRefSpeedometerFinal != null)
         anObject.travelSheetItemRefSpeedometerFinal = anObject.travelSheetItemRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefFuelCounterStart = set.getBigDecimal(12);
       if(anObject.travelSheetItemRefFuelCounterStart != null)
         anObject.travelSheetItemRefFuelCounterStart = anObject.travelSheetItemRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefFuelCounterFinal = set.getBigDecimal(13);
       if(anObject.travelSheetItemRefFuelCounterFinal != null)
         anObject.travelSheetItemRefFuelCounterFinal = anObject.travelSheetItemRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefSumDistances = set.getBigDecimal(14);
       if(anObject.travelSheetItemRefSumDistances != null)
         anObject.travelSheetItemRefSumDistances = anObject.travelSheetItemRefSumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefSumMachineHours = set.getBigDecimal(15);
       if(anObject.travelSheetItemRefSumMachineHours != null)
         anObject.travelSheetItemRefSumMachineHours = anObject.travelSheetItemRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.travelSheetItemRefDateEdit = set.getTimestamp(16);
       anObject.travelSheetItemRefUserGen = set.getString(17);

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
	 * Суммирует длину расстояний по коду строки путевого
	 * 
	 * @param travelSheetItemCode - код строки путевого листа
	 * @return <b>BigDecimal</b> сумму расстояний
	 * 			<b>null</b> не возвращается никогда
	 */
	public BigDecimal getSumDistancesByTravelSheetItemCode(int travelSheetItemCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		
		ENTravelSheetItemDistanceFilter itemDistanceFilter = new ENTravelSheetItemDistanceFilter();
		itemDistanceFilter.travelSheetItemRef.code = travelSheetItemCode;
		
		ENTravelSheetItemDistanceShortList itemDistanceList = this.getScrollableFilteredList(itemDistanceFilter, 0, -1);
		
		for(int i = 0; i < itemDistanceList.totalCount; i++)
			out = out.add(itemDistanceList.get(i).distance);
		
		return out;
		
	}

	/**
	 * 
	 * Суммирует машиночасов по коду строки путевого
	 * 
	 * @param travelSheetItemCode - код строки путевого листа
	 * @return <b>BigDecimal</b> сумму машиночасов
	 * 			<b>null</b> не возвращается никогда
	 */
	public BigDecimal getSumMachineHoursByTravelSheetItemCode(int travelSheetItemCode) throws PersistenceException	
	{
		BigDecimal out = new BigDecimal(0);
		
		ENTravelSheetItemDistanceFilter itemDistanceFilter = new ENTravelSheetItemDistanceFilter();
		itemDistanceFilter.travelSheetItemRef.code = travelSheetItemCode;
		
		ENTravelSheetItemDistanceShortList itemDistanceList = this.getScrollableFilteredList(itemDistanceFilter, 0, -1);
		
		for(int i = 0; i < itemDistanceList.totalCount; i++)
			out = out.add(itemDistanceList.get(i).sumMachineHours);
		
		return out;
		
	}

	public void remove(int code) throws PersistenceException
	{
		  ENTravelSheetItemDistance2TKFuelKoefDAO tsid2fkDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(), getUserProfile());
		  
		  // Удаление всех коэффициентов на строку
		  ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		  tsid2fkFilter.travelSheetItemDistanceRef.code = code;
		  int[] tsid2fkCodes = tsid2fkDAO.getFilteredCodeArray(tsid2fkFilter, 0, -1);
		  
		  for(int i = 0; i < tsid2fkCodes.length; i++)
			  tsid2fkDAO.remove(tsid2fkCodes[i]);
		  
		 super.remove(code);
	}
	
	/**
	 * 
	 * Возвращает суммарный коэффициент
	 * 
	 * @param travelSheetItemDistanceCode - код дистанции строки путевого листа
	 * @return <b>BigDecimal</b> суммарный коэффициент от 1 и более
	 */
	public BigDecimal getAggregateSumOfKoefs(int travelSheetItemDistanceCode) throws PersistenceException
	{
		return getAggregateSumOfKoefs(travelSheetItemDistanceCode, new BigDecimal(1));
	}
	
	/**
	 * 
	 * Возвращает суммарный коэффициент для дистанции с учетом суммы коэффициентов на транспорт
	 * 
	 * @param travelSheetItemDistanceCode - код дистанции строки путевого листа
	 * @param transportRealCode - код транспорта
	 * @return <b>BigDecimal</b> суммарный коэффициент от 1 и более
	 */
	public BigDecimal getAggregateSumOfKoefsWithTransportRealKoefs(int travelSheetItemDistanceCode, int transportRealCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(1);
		ENTravelSheetItemDistance2TKFuelKoefDAO tsid2fkDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(), getUserProfile());		
		ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		tsid2fkFilter.travelSheetItemDistanceRef.code = travelSheetItemDistanceCode;
		ENTravelSheetItemDistance2TKFuelKoefShortList tsid2fkList = tsid2fkDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
		for(int i = 0; i < tsid2fkList.totalCount; i++)
			out = out.add(tsid2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));
		
		TKTransportReal2TKFuelKoefDAO tr2fkDAO = new TKTransportReal2TKFuelKoefDAO(getConnection(), getUserProfile());
		TKTransportReal2TKFuelKoefFilter tr2fkFilter = new TKTransportReal2TKFuelKoefFilter();
		tr2fkFilter.transportRealRef.code = transportRealCode;		
		TKTransportReal2TKFuelKoefShortList tr2fkList = tr2fkDAO.getScrollableFilteredList(tr2fkFilter, 0, -1);
		for(int i = 0; i < tr2fkList.totalCount; i++)
			out = out.add(tr2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));

		
		return out;
	}

	/**
	 * 
	 * Возвращает суммарный коэффициент для дистанции с учетом заданного коэффициента 
	 * 
	 * @param travelSheetItemDistanceCode - код дистанции строки путевого листа
	 * @param transportRealCode - код транспорта
	 * @param koef - заданный коэффициент
	 * @return <b>BigDecimal</b> суммарный коэффициент от koef и более
	 */
	public BigDecimal getAggregateSumOfKoefs(int travelSheetItemDistanceCode, BigDecimal koef) throws PersistenceException, IllegalArgumentException
	{
		if(koef == null) throw new IllegalArgumentException("koef can't be null");
		BigDecimal out = koef;
		ENTravelSheetItemDistance2TKFuelKoefDAO tsid2fkDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(), getUserProfile());		
		ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		tsid2fkFilter.travelSheetItemDistanceRef.code = travelSheetItemDistanceCode;
		ENTravelSheetItemDistance2TKFuelKoefShortList tsid2fkList = tsid2fkDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
		for(int i = 0; i < tsid2fkList.totalCount; i++)
			out = out.add(tsid2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));
		
		return out;
	}
	
} // end of ENTravelSheetItemDistanceDAO

