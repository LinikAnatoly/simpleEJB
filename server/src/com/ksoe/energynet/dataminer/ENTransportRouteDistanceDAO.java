
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
import com.ksoe.energynet.dataminer.generated.ENTransportRouteDistanceDAOGen;
import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
import com.ksoe.energynet.valueobject.brief.ENTransportRouteDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistance2TKFuelKoefShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENTransportRouteDistance;  
  * 	
  */

public class ENTransportRouteDistanceDAO extends ENTransportRouteDistanceDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRouteDistanceDAO() {super();}
  //public ENTransportRouteDistanceDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportRouteDistanceDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRouteDistanceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDistanceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

	/**
	 * 
	 * Возвращает суммарный коэффициент
	 * 
	 * @param TransportRouteDistanceCode - код дистанции строки маршрута
	 * @return <b>BigDecimal</b> суммарный коэффициент от 1 и более
	 */
	public BigDecimal getAggregateSumOfKoefs(int transportRouteDistanceCode) throws PersistenceException
	{
		return getAggregateSumOfKoefs(transportRouteDistanceCode, new BigDecimal(1));
	}
	
	/**
	 * 
	 * Возвращает суммарный коэффициент с учетом заданного коэффициента
	 * 
	 * @param TransportRouteDistanceCode - код дистанции строки маршрута
	 * @param koef - заданный коэффициент
	 * @return <b>BigDecimal</b> суммарный коэффициент от koef и более
	 */
	public BigDecimal getAggregateSumOfKoefs(int transportRouteDistanceCode, BigDecimal koef) throws PersistenceException, IllegalArgumentException
	{
		if(koef == null) throw new IllegalArgumentException("koef can't be null");
		BigDecimal out = koef;
		ENTransportRouteDistance2TKFuelKoefDAO trd2fkDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(), getUserProfile());
		ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		trd2fkFilter.transportRouteDistanceRef.code = transportRouteDistanceCode;
		ENTransportRouteDistance2TKFuelKoefShortList trd2fkList = trd2fkDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
		for(int i = 0; i < trd2fkList.totalCount; i++)
			out = out.add(trd2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));
		
		return out;
	}
	
	/**
	 * 
	 * Суммирует длину расстояний по коду строки маршрута
	 * 
	 * @param transportrouteCode - код строки маршрута
	 * @return <b>BigDecimal</b> сумму расстояний
	 * 			<b>null</b> не возвращается никогда
	 */
	public BigDecimal getSumDistancesByTransportRouteCode(int transportRouteCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		
		ENTransportRouteDistanceFilter itemDistanceFilter = new ENTransportRouteDistanceFilter();
		itemDistanceFilter.transportRouteRef.code = transportRouteCode;
		
		ENTransportRouteDistanceShortList itemDistanceList = this.getScrollableFilteredList(itemDistanceFilter, 0, -1);
		
		for(int i = 0; i < itemDistanceList.totalCount; i++)
			out = out.add(itemDistanceList.get(i).distance);
		
		return out;
		
	}
	
	/**
	 * 
	 * Возвращает суммарный коэффициент для дистанции с учетом суммы коэффициентов на транспорт
	 * 
	 * @param transportrouteCode - код строки маршрута
	 * @param transportRealCode - код транспорта
	 * @return <b>BigDecimal</b> суммарный коэффициент от 1 и более
	 */
	public BigDecimal getAggregateSumOfKoefsWithTransportRealKoefs(int transportRouteDistanceCode, int transportRealCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(1);
		ENTransportRouteDistance2TKFuelKoefDAO trd2fkDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(), getUserProfile());
		ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		trd2fkFilter.transportRouteDistanceRef.code = transportRouteDistanceCode;
		ENTransportRouteDistance2TKFuelKoefShortList trd2fkList = trd2fkDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
		for(int i = 0; i < trd2fkList.totalCount; i++)
			out = out.add(trd2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));
		
		TKTransportReal2TKFuelKoefDAO tr2fkDAO = new TKTransportReal2TKFuelKoefDAO(getConnection(), getUserProfile());
		TKTransportReal2TKFuelKoefFilter tr2fkFilter = new TKTransportReal2TKFuelKoefFilter();
		tr2fkFilter.transportRealRef.code = transportRealCode;		
		TKTransportReal2TKFuelKoefShortList tr2fkList = tr2fkDAO.getScrollableFilteredList(tr2fkFilter, 0, -1);
		for(int i = 0; i < tr2fkList.totalCount; i++)
			out = out.add(tr2fkList.get(i).tkFuelKoefRefKoef.divide(new BigDecimal(100),4,BigDecimal.ROUND_HALF_UP));

		
		return out;
	}

	
	public void remove(int code) throws PersistenceException
	{
		  ENTransportRouteDistance2TKFuelKoefDAO tsid2fkDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(), getUserProfile());
		  
		  // Удаление всех коэффициентов на строку
		  ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		  trd2fkFilter.transportRouteDistanceRef.code = code;
		  int[] tsid2fkCodes = tsid2fkDAO.getFilteredCodeArray(trd2fkFilter, 0, -1);
		  
		  for(int i = 0; i < tsid2fkCodes.length; i++)
			  tsid2fkDAO.remove(tsid2fkCodes[i]);
		  
		 super.remove(code);
	}
	
	public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
	   {   
	    ENTransportRouteDistanceShortList result = new ENTransportRouteDistanceShortList();
	    ENTransportRouteDistanceShort anObject;
	    result.list = new Vector();

	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;
	    String     whereStr = "";
	    String     condition = processCondition(anCondition);
	    String     orderBy = processCondition(anOrderBy);
		
	    if(orderBy.length() == 0)
	     orderBy = "ENTRANSPORTROUTEDISTNC.CODE";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		 
	    selectStr = "SELECT "+
	     "ENTRANSPORTROUTEDISTNC.CODE"+
	     ",ENTRANSPORTROUTEDISTNC.DISTANCE"+
	     ",ENTRANSPORTROUTEDISTNC.KOEF"+

	      ", ENTRANSPORTROUTE.CODE " +
	      ", ENTRANSPORTROUTE.DISTANCE " +
	      ", ENTRANSPORTROUTE.WEIGHT " +
	      ", ENTRANSPORTROUTE.DISTANCENEW " +
	      ", ENTRANSPORTROUTE.SPEEDOMETERSTART " +
	      ", ENTRANSPORTROUTE.SPEEDOMETERFINAL " +
	      ", ENTRANSPORTROUTE.FUELCOUNTERSTART " +
	      ", ENTRANSPORTROUTE.FUELCOUNTERFINAL " +
	      ", ENTRANSPORTROUTE.DATEEDIT " +
	      ", ENTRANSPORTROUTE.USERGEN " +
	     " FROM ENTRANSPORTROUTEDISTNC " +
	     ", ENTRANSPORTROUTE " +
	     //" WHERE " 
		""; 
	     whereStr = " ENTRANSPORTROUTE.CODE = ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE" ; //+
			//selectStr = selectStr + " ${s} ENTRANSPORTROUTEDISTNC.CODE IN ( SELECT ENTRANSPORTROUTEDISTNC.CODE FROM ENTRANSPORTROUTEDISTNC ";

//	 " ";
	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.CODE = ?";
	        }
	        if(aFilterObject.distance != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.DISTANCE = ?";
	        }
	        if(aFilterObject.koef != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.KOEF = ?";
	        }
	        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE = ? ";
	        }

	      }

		  

	      if(condition.length() != 0)
	      {
	         if(whereStr.length() != 0)
	            whereStr = whereStr + " AND ";

	         whereStr = whereStr + " (" + condition + ")";
	      }
//	 + " WHERE" +  сделано выше ????
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
	        if(aFilterObject.koef != null){
	            number++;
	            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
	            statement.setBigDecimal(number,aFilterObject.koef);
	        }
	       if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.transportRouteRef.code);
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

	        anObject = new ENTransportRouteDistanceShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.distance = set.getBigDecimal(2);
	        if(anObject.distance != null)
	            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.koef = set.getBigDecimal(3);
	        if(anObject.koef != null)
	            anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);

	        anObject.transportRouteRefCode = set.getInt(4);
			if(set.wasNull())
			   anObject.transportRouteRefCode = Integer.MIN_VALUE;		
	        anObject.transportRouteRefDistance = set.getBigDecimal(5);
	        if(anObject.transportRouteRefDistance != null)
	          anObject.transportRouteRefDistance = anObject.transportRouteRefDistance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefWeight = set.getBigDecimal(6);
	        if(anObject.transportRouteRefWeight != null)
	          anObject.transportRouteRefWeight = anObject.transportRouteRefWeight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefDistanceNew = set.getBigDecimal(7);
	        if(anObject.transportRouteRefDistanceNew != null)
	          anObject.transportRouteRefDistanceNew = anObject.transportRouteRefDistanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefSpeedometerStart = set.getBigDecimal(8);
	        if(anObject.transportRouteRefSpeedometerStart != null)
	          anObject.transportRouteRefSpeedometerStart = anObject.transportRouteRefSpeedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefSpeedometerFinal = set.getBigDecimal(9);
	        if(anObject.transportRouteRefSpeedometerFinal != null)
	          anObject.transportRouteRefSpeedometerFinal = anObject.transportRouteRefSpeedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefFuelCounterStart = set.getBigDecimal(10);
	        if(anObject.transportRouteRefFuelCounterStart != null)
	          anObject.transportRouteRefFuelCounterStart = anObject.transportRouteRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefFuelCounterFinal = set.getBigDecimal(11);
	        if(anObject.transportRouteRefFuelCounterFinal != null)
	          anObject.transportRouteRefFuelCounterFinal = anObject.transportRouteRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.transportRouteRefDateEdit = set.getTimestamp(12);
	        anObject.transportRouteRefUserGen = set.getString(13);

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



} // end of ENTransportRouteDistanceDAO

