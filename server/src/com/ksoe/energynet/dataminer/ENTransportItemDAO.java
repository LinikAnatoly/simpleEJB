
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportItem;
  *
  */

public class ENTransportItemDAO extends ENTransportItemDAOGen {

//  public ENTransportItemDAO() {super();}
//  public ENTransportItemDAO(Connection aConnection) {super(aConnection);}
//  public ENTransportItemDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  @Override
public void save(ENTransportItem anObject) throws PersistenceException
  {
	   anObject.dateEdit = new Date();
	   anObject.userGen = getUserProfile().userName;
       save(anObject,null);
  }

  @Override
public int add(ENTransportItem anObject) throws PersistenceException
  {
	   anObject.dateEdit = new Date();
	   anObject.userGen = getUserProfile().userName;
       return super.add(anObject);
  }

  @Override
public void remove(int uid)  throws PersistenceException
  {
	  ENTransportItem object = getObject(uid);

	  ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getConnection(),getUserProfile());
	  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(getConnection(), getUserProfile());


	  ENDistanceDAO dDAO = new ENDistanceDAO(getConnection() , getUserProfile());
	  ENDistanceFilter dFilter = new ENDistanceFilter();
	  dFilter.transportItemRef.code = object.code;
	  ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);
	  for (int i=0; i < dList.totalCount; i++){
		  dDAO.remove(dList.get(i).code);
	  }

	  // пересчитаем Время доставки
	  TransportLogic tLogic = new TransportLogic( getConnection(), getUserProfile());
	  tLogic.createDeliveryTimeForPlan( object.planRef.code );

	  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
	  t2Filter.transportRef.code = uid;
	  ENTransport2ENEstimateShortList t2List = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);
	  for (int i=0; i < t2List.totalCount; i++){
		  t2DAO.remove(t2List.get(i).code);
		  estDAO.remove(t2List.get(i).estimateRefCode);
	  }

	  ENTransportItem2TransportItemDAO t2tDAO = new ENTransportItem2TransportItemDAO(getConnection() , getUserProfile());
	  ENTransportItem2TransportItemFilter t2tFilter = new ENTransportItem2TransportItemFilter();
	  t2tFilter.outRef.code = uid;
	  int[] t2tArr = t2tDAO.getFilteredCodeArray(t2tFilter, 0, -1);
	  for (int q=0; q < t2tArr.length; q++){
		  t2tDAO.remove(t2tArr[q]);
	  }

	  super.remove(uid);

	  if (object.finWorker != null){
		  if ( object.finWorker.code > Integer.MIN_VALUE){
			  FINWorkerDAO wDAO = new FINWorkerDAO(getConnection() , getUserProfile());
			  wDAO.remove(object.finWorker.code);
		  }
	  }

  }


  public ENTransportItemShortList getListForTravelSheetItem(ENTransportItemFilter aFilterObject) throws PersistenceException
  {
	   ENTransportItemShortList result = new ENTransportItemShortList();
	   ENTransportItemShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;
	   String     whereStr = "";
	   String     condition = "";
	   String     orderBy = "";

	   selectStr = " select  " +
		   " tr.tktransporttypecode, " +
		   " tktp.name, " +
		   " tr.transportcode, " +
		   " tktr.name, " +
		   " f.name, " +
		   " (select ename ||' (інв.№'||invnumber||')' from enelementdata where ecode = p.elementrefcode) as  " +
		   " ename, " +
		   " fmd.finmolname, " +
		   " sum(tr.countworkfact),  " +
		   " coalesce(sum(ds.distance), 0) " +
		   ", p.code " +
		   ", p.kindcode " +

		   //", pi.countgen " +
		   ", w.workordernumber " +
		   ", p.datestart " +

		   " from  " +
		   " enplanwork p,  enplanworkitem pi , entransportitem tr " +
		   " left join endistance ds on ds.transportitemrefcode = tr.code, " +
		   " enworkorder w, enworkorder2enplanwork w2p, finmoldata fmd, " +
		   " finexecutor f , tktransport tktr, tktransporttype tktp " +
		   " where " +
		   " p.code = pi.planrefcode and pi.countgen<>0  " +
		   " and tr.planitemrefcode = pi.code " +
		   // пока будем искать среди тех, которых НЕТУ в листах ...
		   //" and tr.finworkercode is null " +
		   //" and tr.transportrealcode is null " +
		   // !!! такое же условие в ENTravelSheetControllerEJB.addItems
		   " and tr.code not in (select q.transportitemrefcode from entravlshttm2trnsprttm q )" +
		   " and w2p.plancode = p.code and w2p.workordercode = w.code  " +
		   " and fmd.workordercode = w.code and fmd.moltyperefcode = 1 " +
		   " and p.finexecutorcode = f.code " +
		   " AND tktp.code = tr.tktransporttypecode " +
		   " and tktr.code = tr.transportcode " +

		   aFilterObject.conditionSQL +

		   //" ------------- " +
		   //" and p.kindcode = 3 and p.statuscode = 3 " +
		   //" and p.departmentrefcode = 4 " +
		   //" and p.datestart = to_date('01.02.2011', 'dd.MM.yyyy') " +
		   //" --------------------- " +
		   " group by tr.tktransporttypecode, " +
		   " tktp.name, tr.transportcode, tktr.name, f.name, p.elementrefcode ,fmd.finmolname, p.code , p.kindcode " +
		   //", pi.countgen " +
		   ", w.workordernumber, p.datestart " +
		   " order by p.datestart , p.code " ;

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {

			  /* " tr.tktransporttypecode, " +
			   " tktp.name, " +
			   " tr.transportcode, " +
			   " tktr.name, " +
			   " f.name, " +
			   " (select ename ||' ('||invnumber||')' from enelementdata where ecode = p.elementrefcode) as  " +
			   " ename, " +
			   " fmd.finmolname, " +
			   " sum(tr.countworkfact),  " +
			   " coalesce(sum(ds.distance), 0) " +
*/
	    	anObject = new ENTransportItemShort();

	       anObject.tktransportTypeCode = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.tktransportTypeCode = Integer.MIN_VALUE;

	       anObject.tktransportTypeName = set.getString(2);

	       anObject.transportCode = set.getInt(3);
	       if ( set.wasNull() )
	           anObject.transportCode = Integer.MIN_VALUE;

	       anObject.transportName = set.getString(4);

	       anObject.planRefFinExecutorName = set.getString(5);
	       anObject.elementName = set.getString(6);
	       anObject.planRefMOLName = set.getString(7);
	       anObject.countWorkFact = set.getBigDecimal(8);
	       if (anObject.countWorkFact != null)
	    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.distance = set.getBigDecimal(9);
	       if (anObject.distance != null)
	    	   anObject.distance = anObject.distance.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.planRefCode = set.getInt(10);
	       if (set.wasNull())
	    	   anObject.planRefCode = Integer.MIN_VALUE;

	       anObject.planRefKindCode = set.getInt(11);
	       if (set.wasNull())
	    	   anObject.planRefKindCode = Integer.MIN_VALUE;

	       //anObject.planItemRefCountGen = set.getBigDecimal(12);
	       //if (anObject.planItemRefCountGen != null){
	    	//   anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3, BigDecimal.ROUND_HALF_UP);
	       //}

	       anObject.planRefWorkOrderNumber = set.getString(12);
	       anObject.planRefDateStart = set.getDate(13);

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

  //public ENTransportItemShortList getListForActCalcNorms(int tabNumber, Date dateGen) throws PersistenceException
  public ENTransportItemShortList getListForActCalcNorms(String tabNumber, int planCode) throws PersistenceException
  {
	   ENTransportItemShortList result = new ENTransportItemShortList();
	   ENTransportItemShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   selectStr = " 			 Select  " +
	   " 			 ent.code " +
	   "              , ent.tktransporttypecode " +
	   "              , ent.planrefcode " +
	   "              , ent.countworkfact   " +
	   " 			 From entransportitem ent ,  finworker fw,  enact2enplanwork  " +
	   " ena2, enplanworkitem pwi , enplanwork p " +
	   " 			 Where  " +
	   " 			 ent.planrefcode = ena2.plancode  " +
	   " 			 and ent.planrefcode =  p.code  " +
	   " 			 and ent.finworkercode = fw.code  " +
	   " 			 and ent.planitemrefcode = pwi.code  " +
	   " 			 and pwi.planrefcode = p.code  " +
	   " 			 and pwi.countgen > 0   " +
	   " 			 and fw.tabnumber = ? " +
	   " 			 and p.code = ? " ;

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     statement.setString(1, tabNumber);
	     //statement.setDate(2, new java.sql.Date(dateGen.getTime()));
	     statement.setInt(2, planCode);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {

	    	anObject = new ENTransportItemShort();

	    	anObject.code = set.getInt(1);
		    if ( set.wasNull() )
		         anObject.code = Integer.MIN_VALUE;

	       anObject.tktransportTypeCode = set.getInt(2);
	       if ( set.wasNull() )
	           anObject.tktransportTypeCode = Integer.MIN_VALUE;

	       anObject.planRefCode = set.getInt(3);
	       if ( set.wasNull() )
	           anObject.planRefCode = Integer.MIN_VALUE;

	       anObject.countWorkFact = set.getBigDecimal(4);
	       if (anObject.countWorkFact != null){
	    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, BigDecimal.ROUND_HALF_UP);
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

	public ENTransportItemShortList getListForActCalcNormsByPositionAndSalary(
			String tabNumber, int planCode, int positionCode, BigDecimal salary, String positionId)
			throws PersistenceException {
		ENTransportItemShortList result = new ENTransportItemShortList();
		ENTransportItemShort anObject;
		result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   selectStr = " 			 Select  " +
	   " 			 ent.code " +
	   "              , ent.tktransporttypecode " +
	   "              , ent.planrefcode " +
	   "              , ent.countworkfact   " +
	   " 			 From entransportitem ent ,  finworker fw,  enact2enplanwork  " +
	   " ena2, enplanworkitem pwi , enplanwork p " +
	   " 			 Where  " +
	   " 			 ent.planrefcode = ena2.plancode  " +
	   " 			 and ent.planrefcode =  p.code  " +
	   " 			 and ent.finworkercode = fw.code  " +
	   " 			 and ent.planitemrefcode = pwi.code  " +
	   " 			 and pwi.planrefcode = p.code  " +
	   " 			 and pwi.countgen > 0   " +
	   " 			 and fw.tabnumber = ? " +

	   ( ((positionId != null) && (!positionId.equals(""))) ? " and fw.positionid = '" + positionId + "'" : " and fw.positioncode = " + positionCode ) +

	   " 			 and fw.pricegen = ? " +
	   " 			 and p.code = ? " ;

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     statement.setString(1, tabNumber);
	     statement.setBigDecimal(2, salary);
	     statement.setInt(3, planCode);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {

	    	anObject = new ENTransportItemShort();

	    	anObject.code = set.getInt(1);
		    if ( set.wasNull() )
		         anObject.code = Integer.MIN_VALUE;

	       anObject.tktransportTypeCode = set.getInt(2);
	       if ( set.wasNull() )
	           anObject.tktransportTypeCode = Integer.MIN_VALUE;

	       anObject.planRefCode = set.getInt(3);
	       if ( set.wasNull() )
	           anObject.planRefCode = Integer.MIN_VALUE;

	       anObject.countWorkFact = set.getBigDecimal(4);
	       if (anObject.countWorkFact != null){
	    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, BigDecimal.ROUND_HALF_UP);
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

  public ENTransportItemShortList getListForDistances(int planCode) throws PersistenceException
  {
	   ENTransportItemShortList result = new ENTransportItemShortList();
	   ENTransportItemShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   selectStr = "    SELECT " +
	   		" entransportitem.code, " +
	   		" tktransport.name, " +
	   		"  entransportitem.distancenorm, " +
	   		" entransportitem.amountofjourneys" +
	   		" FROM  " +
	   		" TKTRANSPORT " +
	   		" , ENTRANSPORTITEM" +
	   		" WHERE " +
	   		" TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE " +
	   		" AND ENTRANSPORTITEM.CODE IN " +
	   		"     (select min(entransportitem.code) from entransportitem, enplanworkitem " +
	   		"     where entransportitem.planrefcode = " + planCode +
	   		"       and entransportitem.planitemrefcode = enplanworkitem.code " +
	   		"       and enplanworkitem.countgen > 0 " +
	   		"  group by entransportitem.transportcode) " +
	   		"order by tktransport.name ";

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {
	    	anObject = new ENTransportItemShort();

	       anObject.code = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.code = Integer.MIN_VALUE;

	       anObject.transportName = set.getString(2);

	       anObject.distanceNorm = set.getBigDecimal(3);
	       if (anObject.distanceNorm != null)
	    	   anObject.distanceNorm = anObject.distanceNorm.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.amountOfJourneys = set.getInt(4);
	       if (set.wasNull())
	    	   anObject.amountOfJourneys = Integer.MIN_VALUE;

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


  public ENTransportItemShortList getListDetailedForTravelSheetItem(ENTransportItemFilter aFilterObject) throws PersistenceException
  {
	   ENTransportItemShortList result = new ENTransportItemShortList();
	   ENTransportItemShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;
	   String     whereStr = "";
	   String     condition = "";
	   String     orderBy = "";

	   selectStr = " select  " +
		   " tr.tktransporttypecode, " +
		   " tktp.name, " +
		   " tr.transportcode, " +
		   " tktr.name, " +
		   " f.name, " +
		   " (select ename ||' (інв.№'||invnumber||')' from enelementdata where ecode = p.elementrefcode) as  " +
		   " ename, " +
		   " fmd.finmolname, " +
		   " (tr.countworkfact),  " +
		   //" coalesce(sum(ds.distance), 0) " +
		   " coalesce((select sum(ds.distance) from endistance ds where ds.transportitemrefcode = tr.code), 0) " +
		   ", p.code " +
		   ", p.kindcode " +

		   //", pi.countgen " +
		   ", w.workordernumber " +
		   ", p.datestart " +

		   " , tc.techkartnumber, tc.name " +
		   " , (select fw.name from finworker fw where fw.code = tr.finworkercode) " +
		   " , (select tkr.name from tktransportreal tkr where tkr.code = tr.transportrealcode )" +
		   " , tr.code " +
		   " from  " +
		   " enplanwork p,  enplanworkitem pi , entransportitem tr left join entravlshttm2trnsprttm on " +
		   "(entravlshttm2trnsprttm.transportitemrefcode = tr.code and entravlshttm2trnsprttm.transportitemrefcode is null), " +
		   " enworkorder w, enworkorder2enplanwork w2p, finmoldata fmd, " +
		   " finexecutor f , tktransport tktr, tktransporttype tktp " +
		   " , tktechcard tc " +
		   " where " +
		   " p.code = pi.planrefcode and pi.countgen<>0  " +
		   " and tr.planitemrefcode = pi.code " +
		   " and pi.kartarefcode = tc.code " +
		   // пока будем искать среди тех, которых НЕТУ в листах ...
		   //" and tr.finworkercode is null " +
		   //" and tr.transportrealcode is null " +
		   // !!! такое же условие в ENTravelSheetControllerEJB.addItems
		   " and w2p.plancode = p.code and w2p.workordercode = w.code  " +
		   " and fmd.workordercode = w.code and fmd.moltyperefcode = 1 " +
		   " and p.finexecutorcode = f.code " +
		   " AND tktp.code = tr.tktransporttypecode " +
		   " and tktr.code = tr.transportcode " +

		   aFilterObject.conditionSQL +

		   //" ------------- " +
		   //" and p.kindcode = 3 and p.statuscode = 3 " +
		   //" and p.departmentrefcode = 4 " +
		   //" and p.datestart = to_date('01.02.2011', 'dd.MM.yyyy') " +
		   //" --------------------- " +
		   //" group by tr.tktransporttypecode, " +
		   //" tktp.name, tr.transportcode, tktr.name, f.name, p.elementrefcode ,fmd.finmolname, p.code , p.kindcode " +
		   //", pi.countgen " +
		   //", w.workordernumber, p.datestart " +
		   " order by p.datestart , p.code , tr.tktransporttypecode, tr.transportcode " ;

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {

			  /* " tr.tktransporttypecode, " +
			   " tktp.name, " +
			   " tr.transportcode, " +
			   " tktr.name, " +
			   " f.name, " +
			   " (select ename ||' ('||invnumber||')' from enelementdata where ecode = p.elementrefcode) as  " +
			   " ename, " +
			   " fmd.finmolname, " +
			   " sum(tr.countworkfact),  " +
			   " coalesce(sum(ds.distance), 0) " +
*/
	    	anObject = new ENTransportItemShort();

	       anObject.tktransportTypeCode = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.tktransportTypeCode = Integer.MIN_VALUE;

	       anObject.tktransportTypeName = set.getString(2);

	       anObject.transportCode = set.getInt(3);
	       if ( set.wasNull() )
	           anObject.transportCode = Integer.MIN_VALUE;

	       anObject.transportName = set.getString(4);

	       anObject.planRefFinExecutorName = set.getString(5);
	       anObject.elementName = set.getString(6);
	       anObject.planRefMOLName = set.getString(7);
	       anObject.countWorkFact = set.getBigDecimal(8);
	       if (anObject.countWorkFact != null)
	    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.distance = set.getBigDecimal(9);
	       if (anObject.distance != null)
	    	   anObject.distance = anObject.distance.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.planRefCode = set.getInt(10);
	       if (set.wasNull())
	    	   anObject.planRefCode = Integer.MIN_VALUE;

	       anObject.planRefKindCode = set.getInt(11);
	       if (set.wasNull())
	    	   anObject.planRefKindCode = Integer.MIN_VALUE;

	       //anObject.planItemRefCountGen = set.getBigDecimal(12);
	       //if (anObject.planItemRefCountGen != null){
	    	//   anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3, BigDecimal.ROUND_HALF_UP);
	       //}

	       anObject.planRefWorkOrderNumber = set.getString(12);
	       anObject.planRefDateStart = set.getDate(13);

	       anObject.kartaNum = set.getString(14);
	       anObject.kartaRefName = set.getString(15);
	       anObject.finWorkerName = set.getString(16);
	       anObject.transportRealName = set.getString(17);
	       anObject.code = set.getInt(18);
	       if (set.wasNull())
	    	   anObject.code = Integer.MIN_VALUE;


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

  public ENTransportItemShortList getListDetailedForTransportOrder(ENTransportItemFilter aFilterObject) throws PersistenceException
  {
	   ENTransportItemShortList result = new ENTransportItemShortList();
	   ENTransportItemShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;
	   String     whereStr = "";
	   String     condition = "";
	   String     orderBy = "";

	   selectStr = " select  " +
		   " tr.tktransporttypecode, " +
		   " tktp.name, " +
		   " tr.transportcode, " +
		   " tktr.name, " +
		   " f.name, " +
		   " (select ename ||' (інв.№'||invnumber||')' from enelementdata where ecode = p.elementrefcode) as  " +
		   " ename, " +
		   " fmd.finmolname, " +
		   " (tr.countworkfact),  " +
		   " coalesce((select sum(ds.distance) from endistance ds where ds.transportitemrefcode = tr.code), 0) " +
		   ", p.code " +
		   ", p.kindcode " +
		   ", w.workordernumber " +
		   ", p.datestart " +
		   " , tc.techkartnumber, tc.name " +
		   " , (select fw.name from finworker fw where fw.code = tr.finworkercode) " +
		   " , (select tkr.name from tktransportreal tkr where tkr.code = tr.transportrealcode )" +
		   " , tr.code " +
		   " from  " +
		   " enplanwork p,  enplanworkitem pi , entransportitem tr, " +
		   " enworkorder w, enworkorder2enplanwork w2p, finmoldata fmd, " +
		   " finexecutor f , tktransport tktr, tktransporttype tktp " +
		   " , tktechcard tc " +
		   " where " +
		   " p.code = pi.planrefcode and pi.countgen<>0  " +
		   " and tr.planitemrefcode = pi.code " +
		   " and pi.kartarefcode = tc.code " +
		   " and w2p.plancode = p.code and w2p.workordercode = w.code  " +
		   " and fmd.workordercode = w.code and fmd.moltyperefcode = 1 " +
		   " and p.finexecutorcode = f.code " +
		   " AND tktp.code = tr.tktransporttypecode " +
		   " and tktr.code = tr.transportcode " +

		   aFilterObject.conditionSQL +

		   " order by p.datestart , p.code , tr.tktransporttypecode, tr.transportcode " ;

	   try
	    {
	     statement = connection.prepareStatement(selectStr);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {

	    	anObject = new ENTransportItemShort();

	       anObject.tktransportTypeCode = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.tktransportTypeCode = Integer.MIN_VALUE;

	       anObject.tktransportTypeName = set.getString(2);

	       anObject.transportCode = set.getInt(3);
	       if ( set.wasNull() )
	           anObject.transportCode = Integer.MIN_VALUE;

	       anObject.transportName = set.getString(4);

	       anObject.planRefFinExecutorName = set.getString(5);
	       anObject.elementName = set.getString(6);
	       anObject.planRefMOLName = set.getString(7);
	       anObject.countWorkFact = set.getBigDecimal(8);
	       if (anObject.countWorkFact != null)
	    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.distance = set.getBigDecimal(9);
	       if (anObject.distance != null)
	    	   anObject.distance = anObject.distance.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.planRefCode = set.getInt(10);
	       if (set.wasNull())
	    	   anObject.planRefCode = Integer.MIN_VALUE;

	       anObject.planRefKindCode = set.getInt(11);
	       if (set.wasNull())
	    	   anObject.planRefKindCode = Integer.MIN_VALUE;

	       anObject.planRefWorkOrderNumber = set.getString(12);
	       anObject.planRefDateStart = set.getDate(13);

	       anObject.kartaNum = set.getString(14);
	       anObject.kartaRefName = set.getString(15);
	       anObject.finWorkerName = set.getString(16);
	       anObject.transportRealName = set.getString(17);
	       anObject.code = set.getInt(18);
	       if (set.wasNull())
	    	   anObject.code = Integer.MIN_VALUE;

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



  @Override
public ENTransportItemShortList getScrollableFilteredList(ENTransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENTransportItemShortList result = new ENTransportItemShortList();
   ENTransportItemShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENTRANSPORTITEM.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENTRANSPORTITEM.CODE"+
    // бля порядок ПОЛЕЙ ...
    //",ENTRANSPORTITEM.DISTANCETO"+
    //",ENTRANSPORTITEM.DISTANCEALONG"+
   // ",ENTRANSPORTITEM.DISTANCEFROM"+
    ",null as q, null as q1, null as q3" +
    ",ENTRANSPORTITEM.COUNTWORKGEN"+
    ",ENTRANSPORTITEM.COUNTWORKFACT"+
    ",ENTRANSPORTITEM.PRICE"+
    ",ENTRANSPORTITEM.COST"+
    ",ENTRANSPORTITEM.USERGEN"+
    ",ENTRANSPORTITEM.DATEEDIT"+

     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORKITEM.CODE " +
     ", ENPLANWORKITEM.COUNTGEN " +
     ", ENPLANWORKITEM.USERGEN " +
     ", ENPLANWORKITEM.DATEEDIT " +
    ", ENTRANSPORTITEM.TRANSPORTREALCODE" +
    ", ENTRANSPORTITEM.TRANSPORTCODE" +

// вынести .. это не используеться
    /*
    ", ENMANNINGTABLE.CODE " +
     ", ENMANNINGTABLE.DATESTART " +
     ", ENMANNINGTABLE.DATEFINAL " +
     ", ENWORKER.CODE " +
     ", ENWORKER.NAME " +
     ", ENWORKER.TABNUMBER " +
     ", ENWORKER.ISMOL " +
     */
// --------------------------------
     ", ENESTIMATEITEMTYPE.CODE " +
     ", ENESTIMATEITEMTYPE.NAME " +

     //", TKTRANSPORTREAL.NAME " +
     //", TKTRANSPORTREAL.GOSNUMBER " +
     //", TKTRANSPORTREAL.INVNUMBER " +
     //", TKTRANSPORT.NAME  " +

     //", ENTRANSPORTITEM.FINWORKERCODE "+
     //", FINWORKER.NAME "+
     //", FINWORKER.TABNUMBER "+
     //", FINWORKER.POSITIONNAME "+
     //", FINWORKER.FINCODE "+

     ", (select TKTRANSPORTREAL.NAME from TKTRANSPORTREAL where TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRANSPORTREALCODE) " +
     ", (select TKTRANSPORTREAL.GOSNUMBER from TKTRANSPORTREAL where TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRANSPORTREALCODE) " +
     ", (select TKTRANSPORTREAL.INVNUMBER from TKTRANSPORTREAL where TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRANSPORTREALCODE) " +

     " ,TKTRANSPORT.NAME, ENTRANSPORTITEM.FINWORKERCODE " +

     ", (select FINWORKER.NAME from FINWORKER where FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE) " +
     ", (select FINWORKER.TABNUMBER from FINWORKER where FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE) " +
     ", (select FINWORKER.POSITIONNAME from FINWORKER where FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE) " +
     ", (select FINWORKER.FINCODE from FINWORKER where FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE) " +


     ", kr.code, kr.techkartnumber, kr.name " +
     //", enelementdata.ecode, enelementdata.ename,  enelementdata.invnumber " +

     " , enplanwork.elementrefcode " +
     ", (select ename from enelementdata where ecode = enplanwork.elementrefcode) as ename " +
     ", (select invnumber from enelementdata where ecode = enplanwork.elementrefcode) as invnumber " +

     ", ENTRANSPORTITEM.TKTRANSPORTTYPECODE , TKTRANSPORTTYPE.NAME " +
     ", coalesce((select sum(distance) from endistance where transportitemrefcode = ENTRANSPORTITEM.CODE),0) " +
     ", ENTRANSPORTITEM.TRAILERTRANSPORTREALCD" +
     ", ENTRANSPORTITEM.ISUSETRAILER" +
     ", ENTRANSPORTDEPARTMENT.CODE " +
     ", ENTRANSPORTDEPARTMENT.NAME " +
    " FROM  " +
    " TKTRANSPORTTYPE, "+

    //" enelementdata, " +

    " ENESTIMATEITEMTYPE, ENPLANWORK, ENPLANWORKITEM " +
    // АС а че так было???
    //" left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
    ", TKTECHCARD kr " +

    " ,TKTRANSPORT, ENTRANSPORTITEM  LEFT JOIN ENTRANSPORTDEPARTMENT ON  ENTRANSPORTITEM.TRANSPORTDEPARTMENTCOD =  ENTRANSPORTDEPARTMENT.CODE " +
//  вынести .. это не используеться
//    " left join ENMANNINGTABLE on ENMANNINGTABLE.CODE = ENTRANSPORTITEM.MANNINGTABLECODE " +
//    " left join ENWORKER on ENWORKER.CODE = ENTRANSPORTITEM.WORKERFACTCODE" +
// -----------------------------


    //" left join TKTRANSPORTREAL on TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRANSPORTREALCODE" +
    //" left join FINWORKER on FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE "+


    //",  " +
    //" WHERE "
	"";
    whereStr = " ENPLANWORK.CODE = ENTRANSPORTITEM.PLANREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE" ; //+
     //whereStr = whereStr + " and enelementdata.ecode = ENPLANWORK.elementrefcode ";
     whereStr = whereStr +" and TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE " ;
     //whereStr = whereStr +" AND ENMANNINGTABLE.CODE = ENTRANSPORTITEM.MANNINGTABLECODE" ; //+
     //whereStr = whereStr +" AND ENWORKER.CODE = ENTRANSPORTITEM.WORKERFACTCODE" ; //+

     whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENTRANSPORTITEM.TYPEREFCODE" ; //+

     whereStr = whereStr +" AND TKTRANSPORTTYPE.CODE = ENTRANSPORTITEM.TKTRANSPORTTYPECODE" ; //+

     // было в лефт джойне ..
     whereStr = whereStr + " and kr.code = ENPLANWORKITEM.kartarefcode ";

		//selectStr = selectStr + " ${s} ENTRANSPORTITEM.CODE IN ( SELECT ENTRANSPORTITEM.CODE FROM ENTRANSPORTITEM ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.CODE = ?";
       }
/*
       if(aFilterObject.distanceTo != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.DISTANCETO = ?";
       }
       if(aFilterObject.distanceAlong != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.DISTANCEALONG = ?";
       }
       if(aFilterObject.distanceFrom != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.DISTANCEFROM = ?";
       }
*/
       if(aFilterObject.countWorkGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.COUNTWORKGEN = ?";
       }
       if(aFilterObject.countWorkFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.COUNTWORKFACT = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.PRICE = ?";
       }
       if(aFilterObject.cost != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.COST = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTITEM.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTITEM.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTITEM.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTITEM.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.DATEEDIT = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTITEM.MODIFY_TIME = ?";
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.PLANREFCODE = ? ";
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.PLANITEMREFCODE = ? ";
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.TRANSPORTREALCODE = ? ";
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.TRANSPORTCODE = ? ";
       }
       /*
       if(aFilterObject.manningTable.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.MANNINGTABLECODE = ? ";
       }
       if(aFilterObject.workerFact.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.WORKERFACTCODE = ? ";
       }
       */
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.TYPEREFCODE = ? ";
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.FINWORKERCODE = ? ";
       }
       if (aFilterObject.tktransportType.code != Integer.MIN_VALUE){
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTITEM.TKTRANSPORTTYPECODE = ? ";
       }
       if(aFilterObject.trailerTransportReal.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.TRAILERTRANSPORTREALCD = ? ";
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTITEM.TRANSPORTDEPARTMENTCOD = ? ";
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
/*
       if(aFilterObject.distanceTo != null){
           number++;
           aFilterObject.distanceTo = aFilterObject.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.distanceTo);
       }
       if(aFilterObject.distanceAlong != null){
           number++;
           aFilterObject.distanceAlong = aFilterObject.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.distanceAlong);
       }
       if(aFilterObject.distanceFrom != null){
           number++;
           aFilterObject.distanceFrom = aFilterObject.distanceFrom.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.distanceFrom);
       }
*/
       if(aFilterObject.countWorkGen != null){
           number++;
           aFilterObject.countWorkGen = aFilterObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countWorkGen);
       }
       if(aFilterObject.countWorkFact != null){
           number++;
           aFilterObject.countWorkFact = aFilterObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countWorkFact);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.cost != null){
           number++;
           aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.cost);
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
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planRef.code);
      }
      if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planItemRef.code);
      }
      if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportReal.code);
      }
      if(aFilterObject.transport.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transport.code);
      }
      /*
      if(aFilterObject.manningTable.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.manningTable.code);
      }
      if(aFilterObject.workerFact.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.workerFact.code);
      }
      */
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.finWorker.code);
      }
      if(aFilterObject.tktransportType.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.tktransportType.code);
      }
      if(aFilterObject.trailerTransportReal.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.trailerTransportReal.code);
      }
      if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportDepartment.code);
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

       anObject = new ENTransportItemShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
/*
       anObject.distanceTo = set.getBigDecimal(2);
       if(anObject.distanceTo != null)
           anObject.distanceTo = anObject.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.distanceAlong = set.getBigDecimal(3);
       if(anObject.distanceAlong != null)
           anObject.distanceAlong = anObject.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.distanceFrom = set.getBigDecimal(4);
       if(anObject.distanceFrom != null)
           anObject.distanceFrom = anObject.distanceFrom.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
*/
       anObject.countWorkGen = set.getBigDecimal(5);
       if(anObject.countWorkGen != null)
           anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.countWorkFact = set.getBigDecimal(6);
       if(anObject.countWorkFact != null)
           anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(7);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(8);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(9);
       anObject.dateEdit = set.getDate(10);


       anObject.planRefCode = set.getInt(11);

       anObject.planRefDateGen = set.getDate(12);

       anObject.planRefDateStart = set.getDate(13);

       anObject.planRefDateFinal = set.getDate(14);

       anObject.planRefYearGen = set.getInt(15);

       anObject.planRefMonthGen = set.getInt(16);

       anObject.planRefUserGen = set.getString(17);

       anObject.planRefDateEdit = set.getDate(18);

       anObject.planItemRefCode = set.getInt(19);

       anObject.planItemRefCountGen = set.getBigDecimal(20);
       if(anObject.planItemRefCountGen != null)
         anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.planItemRefUserGen = set.getString(21);

       anObject.planItemRefDateEdit = set.getDate(22);
       anObject.transportRealCode = set.getInt(23);
       if (set.wasNull())
    	   anObject.transportRealCode = Integer.MIN_VALUE;

       anObject.transportCode = set.getInt(24);
       /*
       anObject.manningTableCode = set.getInt(25);

       anObject.manningTableDateStart = set.getDate(26);

       anObject.manningTableDateFinal = set.getDate(27);

       anObject.workerFactCode = set.getInt(28);

       anObject.workerFactName = set.getString(29);

       anObject.workerFactTabNumber = set.getString(30);

       anObject.workerFactIsMol = set.getInt(31);
       */
       anObject.typeRefCode = set.getInt(25);

       anObject.typeRefName = set.getString(26);

       anObject.transportRealName = set.getString(27);
       anObject.transportRealGosNumber = set.getString(28);
       anObject.transportRealInvNumber = set.getString(29);
       anObject.transportName = set.getString(30);

       anObject.finWorkerCode = set.getInt(31);
       anObject.finWorkerName = set.getString(32);
       anObject.finWorkerTabNumber = set.getString(33);
       anObject.finWorkerPositionName = set.getString(34);
       anObject.finCode = set.getInt(35);

       anObject.kartaRefCode = set.getInt(36);
       anObject.kartaNum = set.getString(37);
       anObject.kartaRefName = set.getString(38);

       anObject.elementCode = set.getInt(39);
       anObject.elementName = set.getString(40);
       anObject.elementInvNumber = set.getString(41);

       anObject.tktransportTypeCode = set.getInt(42);
       anObject.tktransportTypeName = set.getString(43);

       anObject.distance = set.getBigDecimal(44);
       if(anObject.distance != null)
           anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.trailerTransportRealCode = set.getInt(45);
       anObject.isUseTrailer = set.getInt(46);

       anObject.transportDepartmentCode = set.getInt(47);

       anObject.transportDepartmentName = set.getString(48);

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
   _checkConditionToken(condition,"code","ENTRANSPORTITEM.CODE");
   _checkConditionToken(condition,"countworkgen","ENTRANSPORTITEM.COUNTWORKGEN");
   _checkConditionToken(condition,"countworkfact","ENTRANSPORTITEM.COUNTWORKFACT");
   _checkConditionToken(condition,"price","ENTRANSPORTITEM.PRICE");
   _checkConditionToken(condition,"cost","ENTRANSPORTITEM.COST");
   _checkConditionToken(condition,"numberlist","ENTRANSPORTITEM.NUMBERLIST");
   _checkConditionToken(condition,"commentgen","ENTRANSPORTITEM.COMMENTGEN");
   _checkConditionToken(condition,"usergen","ENTRANSPORTITEM.USERGEN");
   _checkConditionToken(condition,"dateedit","ENTRANSPORTITEM.DATEEDIT");
   _checkConditionToken(condition,"modify_time","ENTRANSPORTITEM.MODIFY_TIME");
     // relationship conditions
/*
   _checkConditionToken(condition,"planref","PLANREFCODE");
   _checkConditionToken(condition,"planref.code","PLANREFCODE");
   _checkConditionToken(condition,"planitemref","PLANITEMREFCODE");
   _checkConditionToken(condition,"planitemref.code","PLANITEMREFCODE");
   _checkConditionToken(condition,"transportreal","TRANSPORTREALCODE");
   _checkConditionToken(condition,"transportreal.code","TRANSPORTREALCODE");
   _checkConditionToken(condition,"transport","TRANSPORTCODE");
   _checkConditionToken(condition,"transport.code","TRANSPORTCODE");
   _checkConditionToken(condition,"typeref","TYPEREFCODE");
   _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
   _checkConditionToken(condition,"tktransporttype","TKTRANSPORTTYPECODE");
   _checkConditionToken(condition,"tktransporttype.code","TKTRANSPORTTYPECODE");
   _checkConditionToken(condition,"finworker","FINWORKERCODE");
   _checkConditionToken(condition,"finworker.code","FINWORKERCODE");
*/
   return condition.toString();
  }



	public String getFinWorkerByAct(int actCode) throws PersistenceException,
			DatasourceConnectException {
		Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		PreparedStatement statement = null;
		ResultSet set = null;

		String SQL = " select group_concat(cast(fw.code as text), ',') " +
				" from entransportitem ent, finworker fw, enact2enplanwork ena2, enplanworkitem pwi " +
				" where ena2.actrefcode = " + actCode +
				" and ent.planrefcode = ena2.plancode " +
				" and ent.finworkercode = fw.code " +
				" and ent.planitemrefcode = pwi.code " +
				" and pwi.countgen > 0 ";

		String finWorkers = "";

		try {
			statement = connection.prepareStatement(SQL);

			set = statement.executeQuery();
			for (int i = 0; set.next(); i++) {
				finWorkers = set.getString(1);
			}

			if (finWorkers == "") {
				finWorkers = "null";
			}

			System.out.println("getFinWorkerByAct : " + finWorkers);
			return finWorkers;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + SQL);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return finWorkers;
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

	private transient java.sql.Connection connection = null;

	protected java.sql.Connection getConnection(String dataSourceName)
			throws DatasourceConnectException {
		try {
			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext
					.lookup(dataSourceName);
			connection = dataSource.getConnection();
			return connection;
		} catch (NamingException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		}
	}


	public void updateTransportDepartmentOnTransportitem(int transportItemCode , int transportDepartmentCode) throws PersistenceException
	  {
	  	Connection connection = getConnection();

			String updTransportItem =
		        "UPDATE entransportitem SET transportdepartmentcod = ? " +
		        " WHERE CODE = ? ";

			PreparedStatement statement = null;

			try
			{
				statement = connection.prepareStatement(updTransportItem);


				if (transportDepartmentCode ==  Integer.MIN_VALUE){
					statement.setNull(1,java.sql.Types.INTEGER);
				}

				else
				{
					statement.setInt(1,transportDepartmentCode);
				}
				statement.setInt(2,transportItemCode);





			    statement.execute();
			}
		  	catch(SQLException e)
		  	{
		  	  System.out.println(e.getMessage()+"\nstatement - " + updTransportItem + "\n tiCode = " + transportItemCode);
		  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		  	}
		    finally
		    {
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		     statement = null;
		    }
	  }

	/**Выборка времени траспорта с фильтром по техкартам **/
	public ENTransportItemShortList getListForActCalcNormsByPositionAndSalarySomeTechCard(String tabNumber, int planCode, int positionCode, BigDecimal salary , String TechCardCodes) throws PersistenceException
	  {
		   ENTransportItemShortList result = new ENTransportItemShortList();
		   ENTransportItemShort anObject;
		   result.list = new Vector();

		   String     selectStr;
		   Connection connection = getConnection();
		   PreparedStatement statement = null;
		   ResultSet  set = null;

		   selectStr = " 			 Select  " +
		   " 			 ent.code " +
		   "              , ent.tktransporttypecode " +
		   "              , ent.planrefcode " +
		   "              , ent.countworkfact   " +
		   " 			 From entransportitem ent ,  finworker fw,  enact2enplanwork  " +
		   " ena2, enplanworkitem pwi , enplanwork p " +
		   " 			 Where  " +
		   " 			 ent.planrefcode = ena2.plancode  " +
		   " 			 and ent.planrefcode =  p.code  " +
		   " 			 and ent.finworkercode = fw.code  " +
		   " 			 and ent.planitemrefcode = pwi.code  " +
		   " 			 and pwi.planrefcode = p.code  " +
		   " 			 and pwi.countgen > 0   " +
		   " 			 and fw.tabnumber = ? " +

		   " 			 and fw.positioncode = ? " +
		   " 			 and fw.pricegen = ? " +

		   " 			 and p.code = ? " +
		   "             and pwi.kartarefcode  in ( " + TechCardCodes + ")" ;

		   try
		    {
		     statement = connection.prepareStatement(selectStr);

		     statement.setString(1, tabNumber);
		     //statement.setDate(2, new java.sql.Date(dateGen.getTime()));
		     statement.setInt(2, positionCode);
		     statement.setBigDecimal(3, salary);
		     statement.setInt(4, planCode);

		     set = statement.executeQuery();
		     int i;
		     for(i = 0;set.next();i++)
		      {

		    	anObject = new ENTransportItemShort();

		    	anObject.code = set.getInt(1);
			    if ( set.wasNull() )
			         anObject.code = Integer.MIN_VALUE;

		       anObject.tktransportTypeCode = set.getInt(2);
		       if ( set.wasNull() )
		           anObject.tktransportTypeCode = Integer.MIN_VALUE;

		       anObject.planRefCode = set.getInt(3);
		       if ( set.wasNull() )
		           anObject.planRefCode = Integer.MIN_VALUE;

		       anObject.countWorkFact = set.getBigDecimal(4);
		       if (anObject.countWorkFact != null){
		    	   anObject.countWorkFact = anObject.countWorkFact.setScale(2, BigDecimal.ROUND_HALF_UP);
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



} // end of ENTransportItemDAO

