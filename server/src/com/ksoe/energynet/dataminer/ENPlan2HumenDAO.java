
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
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENPlan2HumenDAOGen;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.ENPlan2Humen;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.brief.ENPlan2HumenShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPlan2Humen;
  *
  */

/*
 *
 *
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * изменен МЕТОД АДД !!!! убрана проверка наличия плана (из за сегрегации !!!)
 *
 */


public class ENPlan2HumenDAO extends ENPlan2HumenDAOGen {

  //public ENPlan2HumenDAO() {super();}
  //public ENPlan2HumenDAO(Connection aConnection) {super(aConnection);}
  //public ENPlan2HumenDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENPlan2HumenDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlan2HumenDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void deleteByPlanCode_(int planCode) throws PersistenceException
  {
	   if(getUserProfile() == null)
		    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   //ResultSet  set = null;


	   selectStr = "delete from enplan2humen where planrefcode = ?";

		   try
		    {
		     statement = connection.prepareStatement(selectStr);

		     statement.setInt(1, planCode);

		     statement.execute();
		    }
		   catch(SQLException e)
		    {
		     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
		     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		    }
		   finally
		    {
		     //try {if (set != null) set.close();}             catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		     if(connection != super.getConnection())
		      {
		       try{connection.close();} catch(SQLException e){}
		      }
		    }
  }


  public void deleteByPlanCodeAndTabNumber_(int planCode, String tabNumber, int humenKindCode) throws PersistenceException
  {
	   if(getUserProfile() == null)
		    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   //ResultSet  set = null;


	   selectStr = "delete from enplan2humen where planrefcode = ? and  tabnumber = ? and humenkindrefcode = ? ";

		   try
		    {
		     statement = connection.prepareStatement(selectStr);

		     statement.setInt(1, planCode);
		     statement.setString(2, tabNumber);
		     statement.setInt(3, humenKindCode);

		     statement.execute();
		    }
		   catch(SQLException e)
		    {
		     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
		     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		    }
		   finally
		    {
		     //try {if (set != null) set.close();}             catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		     if(connection != super.getConnection())
		      {
		       try{connection.close();} catch(SQLException e){}
		      }
		    }
  }



  public boolean isPersonHavingMoreThanOneJob(String tabNumber, int planCode) throws PersistenceException
  {


   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   boolean out = false;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "select coalesce(sum(m), 0), coalesce(sum(d), 0) from( " +
		   " select 1 as m , 0 as d from  enhumenitem h, finworker fw, enplanworkitem pi where h.finworkercode = fw.code and pi.planrefcode = h.planrefcode " +
		   " and h.planitemrefcode = pi.code and pi.countgen <> 0 " +
		   " and h.planrefcode = ? " +
		   " and fw.tabnumber = ? " +
		   "union all " +
		   "select 0 as m , 1 as d from entransportitem t, finworker fw, enplanworkitem pi " +
		   " where t.finworkercode = fw.code and pi.planrefcode = t.planrefcode and t.planitemrefcode = pi.code and pi.countgen <> 0 " +
		   " and t.planrefcode = ? " +
		   " and fw.tabnumber = ? " +
		   " ) as dat";



   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setInt(1, planCode);
     statement.setString(2, tabNumber);

     statement.setInt(3, planCode);
     statement.setString(4, tabNumber);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
    	 if (( set.getInt(1) > 0) && (set.getInt(2) > 0)){
    		 out = true;
    	 }
       }

     return out;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return out;
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



  public ENPlan2HumenShortList getListByDateAndTabNumber_2_(String tabNumber, Date planDate) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "  select  " +
   "     plancode, datestart, dategen, numbergen, actcode, statusrefcode,  " +
   "     (sum(countfact) + sum(deliverytime)) as timegen_  " +
   "     " +
   "    , tabnumber, fio , humenkind " +
   "     " +
   "     from (  " +
   "     SELECT  " +
   "     p.code as plancode, p.datestart , a.dategen, a.numbergen,  " +
   "      a.code as actcode, a.statusrefcode  " +
   "     ,h.countfact,   " +
   // время доставки посчитаем отдельно ...
   //"     coalesce((select sum(dt.deliverytimefact) from endeliverytime dt where  " +
   //" dt.humenitemrefcode   " +
   //"     = h.code),0) as deliverytime  " +
   "     0 as deliverytime  " +
   "     " +
   "    , fw.tabnumber, fw.name as fio, 1 as humenkind  " +
   "     " +
   "     from enact a , enact2enplanwork a2p, enplanwork p,   " +
   "      finworker fw  , enplanworkitem pi   " +
   "     , enhumenitem h  " +
   "       " +
   "     where  " +
   "     p.code = pi.planrefcode  and pi.countgen <> 0 and pi.code = h.planitemrefcode  " +
   "     and a2p.actrefcode = a.code and a2p.plancode = p.code  " +
   "      and p.code = h.planrefcode and h.finworkercode = fw.code  " +
   "     and fw.tabnumber = ?  " +
   "     and p.datestart = ? " +
   "     and a.statusrefcode = " + ENActStatus.GOOD +
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +
   "      " +
   "      " +
   "     union all " +
   "      " +
   "     SELECT  " +
   "     p.code as plancode, p.datestart , a.dategen, a.numbergen,  " +
   "      a.code as actcode, a.statusrefcode  " +
   "     ,0 as countfact,   " +
   "     0 as deliverytime  " +
   "     " +
   "    , fw.tabnumber, fw.name as fio, 2 as humenkind  " +
   "     " +
   "     from enact a , enact2enplanwork a2p, enplanwork p,   " +
   "      finworker fw  , enplanworkitem pi   " +
   "     , entransportitem h  " +
   "       " +
   "     where  " +
   "     p.code = pi.planrefcode  and pi.countgen <> 0 and pi.code = h.planitemrefcode  " +
   "     and a2p.actrefcode = a.code and a2p.plancode = p.code  " +
   "      and p.code = h.planrefcode and h.finworkercode = fw.code  " +
   "     and fw.tabnumber = ?  " +
   "     and p.datestart = ? " +
   "     and a.statusrefcode = " + ENActStatus.GOOD +
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +
   "      " +

   " union all " +
   " SELECT p.code as plancode, p.datestart , a.dategen, a.numbergen, a.code as actcode, a.statusrefcode ,p2h.timeworkfact,  0 as deliverytime " +
   " , p2h.tabnumber as tabnumber, p2h.fio as fio, p2h.humenkindrefcode as humenkind " +
   "  from enact a , enact2enplanwork a2p, enplanwork p, enplan2humen p2h where " +
   " a2p.actrefcode = a.code and a2p.plancode = p.code and p.code = p2h.planrefcode " +
   " and p2h.tabnumber = ? and p.datestart = ? " +
   //---------
   " and a.statusrefcode <> " + ENActStatus.GOOD + // типа на подписи и проведенные
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +

   "     ) dat  " +
   "     group by plancode, datestart, dategen, numbergen, actcode, statusrefcode , tabnumber,  " +
   " fio , humenkind " +
   // в логике ОКРУГЛЕНИЕ ...
   " order by tabnumber, datestart, humenkind "
   ;



   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setString(1, tabNumber);
     statement.setDate(2, new java.sql.Date(planDate.getTime()));

     statement.setString(3, tabNumber);
     statement.setDate(4, new java.sql.Date(planDate.getTime()));

     statement.setString(5, tabNumber);
     statement.setDate(6, new java.sql.Date(planDate.getTime()));

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

    	 //" plancode, datestart, dategen, numbergen, actcode, statusrefcode, " +
    	 //  " (sum(countfact) + sum(deliverytime)) as timegen_ " +

    	 //  ", tabnumber, fio " +

       anObject = new ENPlan2HumenShort();
       anObject.planRefCode = set.getInt(1);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;

       anObject.planRefDateStart = set.getDate(2);

       anObject.actRefDateGen = set.getDate(3);

	   anObject.actRefNumberGen = set.getString(4);

       anObject.actRefCode = set.getInt(5);
	   if(set.wasNull())
		   anObject.actRefCode = Integer.MIN_VALUE;

       anObject.actRefStatusCode = set.getInt(6);
	   if(set.wasNull())
		  anObject.actRefStatusCode = Integer.MIN_VALUE;


       anObject.timeWorkGen = set.getBigDecimal(7);
       if(anObject.timeWorkGen != null)
           anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       /*
       anObject.timeWorkFact = set.getBigDecimal(8);
       if(anObject.timeWorkFact != null)
           anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		*/

       anObject.tabNumber = set.getString(8);
       anObject.fio = set.getString(9);
       anObject.humenKindRefCode = set.getInt(10);
       if (set.wasNull()){
    	   anObject.humenKindRefCode = Integer.MIN_VALUE;
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


	public ENPlan2HumenShortList getListByDateAndTabNumberAndPositionAndSalary(
			String tabNumber, Date planDate, int positionCode,
			BigDecimal salary, String positionId, int actCode) throws PersistenceException {

		ENPlan2HumenShortList result = new ENPlan2HumenShortList();
		ENPlan2HumenShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");

		selectStr = "  select  " +
				"     plancode, datestart, dategen, numbergen, actcode, statusrefcode,  " +
			    "     (sum(countfact) + sum(deliverytime)) as timegen_  " +
			    "     " +
			    "    , tabnumber, fio, humenkind, positioncode, pricegen, positionid " +
			    "     " +
			    "     from (  " +
			    "     SELECT  " +
			    "     p.code as plancode, p.datestart , a.dategen, a.numbergen,  " +
			    "      a.code as actcode, a.statusrefcode  " +
			    "     ,h.countfact,   " +
			    // время доставки посчитаем отдельно ...
			    //"     coalesce((select sum(dt.deliverytimefact) from endeliverytime dt where  " +
			    //" dt.humenitemrefcode   " +
			    //"     = h.code),0) as deliverytime  " +
				"     0 as deliverytime  " +
				"     " +
				"    , fw.tabnumber, fw.positioncode, fw.pricegen, fw.name as fio, 1 as humenkind, fw.positionid  " +
				"     " +
				"     from enact a , enact2enplanwork a2p, enplanwork p,   " +
				"      finworker fw  , enplanworkitem pi   " +
				"     , enhumenitem h  " +
				"       " +
				"     where  " +
				"     p.code = pi.planrefcode  and pi.countgen <> 0 and pi.code = h.planitemrefcode  " +
				"     and a2p.actrefcode = a.code and a2p.plancode = p.code  " +
				"      and p.code = h.planrefcode and h.finworkercode = fw.code  " +
				"     and fw.tabnumber = ?  " +
				"     and p.datestart = ? " +

				( ((positionId != null) && (!positionId.equals(""))) ? " and fw.positionid = ? " : " and fw.positioncode = " + positionCode ) +

				"     and fw.pricegen = ?  " +

				"     and a.statusrefcode = " + ENActStatus.GOOD +
			    // без перевезень ...
			    " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +

			    // Если передан код акта, выбираем только по нему
			    (actCode > 0 ? " and a.code = " + actCode : "") +

			    "      " +
			    "      " +
			    "     union all " +
			    "      " +
			    
			    "     SELECT  " +
			    "     p.code as plancode, p.datestart , a.dategen, a.numbergen,  " +
			    "      a.code as actcode, a.statusrefcode  " +
			    "     ,0 as countfact,   " +
			    "     0 as deliverytime  " +
			    "     " +
			    "    , fw.tabnumber, fw.positioncode, fw.pricegen, fw.name as fio, 2 as humenkind, fw.positionid  " +
			    "     " +
			    "     from enact a , enact2enplanwork a2p, enplanwork p,   " +
			    "      finworker fw  , enplanworkitem pi   " +
			    "     , entransportitem h  " +
			    "       " +
			    "     where  " +
			    "     p.code = pi.planrefcode  and pi.countgen <> 0 and pi.code = h.planitemrefcode  " +
			    "     and a2p.actrefcode = a.code and a2p.plancode = p.code  " +
			    "      and p.code = h.planrefcode and h.finworkercode = fw.code  " +
			    "     and fw.tabnumber = ?  " +
			    "     and p.datestart = ? " +

				( ((positionId != null) && (!positionId.equals(""))) ? " and fw.positionid = ? " : " and fw.positioncode = " + positionCode ) +

				"     and fw.pricegen = ?  " +

			    "     and a.statusrefcode = " + ENActStatus.GOOD +
			    // без перевезень ...
			    " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +
			    "      " +

			    // Если передан код акта, выбираем только по нему
			    (actCode > 0 ? " and a.code = " + actCode : "") +

			    " union all " +

			    " SELECT p.code as plancode, p.datestart , a.dategen, a.numbergen, a.code as actcode, a.statusrefcode, p2h.timeworkfact,  0 as deliverytime " +
			    " , p2h.tabnumber as tabnumber, p2h.positioncode as positioncode, p2h.pricegen as pricegen, p2h.fio as fio, p2h.humenkindrefcode as humenkind " +
			    " , p2h.positionid as positionid "+
			    "  from enact a , enact2enplanwork a2p, enplanwork p, enplan2humen p2h where " +
			    " a2p.actrefcode = a.code and a2p.plancode = p.code and p.code = p2h.planrefcode " +
			    " and p2h.tabnumber = ? " +
			    " and p.datestart = ? " +


			    ( ((positionId != null) && (!positionId.equals(""))) ? " and p2h.positionid = ? " : " and p2h.positioncode = " + positionCode ) +

			    "     and p2h.pricegen = ?  " +
			    //---------
			    " and a.statusrefcode <> " + ENActStatus.GOOD + // типа на подписи и проведенные
			    // без перевезень ...
			    " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +

			    // Если передан код акта, выбираем только по нему
			    (actCode > 0 ? " and a.code = " + actCode : "") +

			    "     ) dat  " +
			    "     group by plancode, datestart, dategen, numbergen, actcode, statusrefcode , tabnumber,  " +
			    " fio , humenkind, positioncode, pricegen, positionid " +
			    // в логике ОКРУГЛЕНИЕ ...
			    " order by tabnumber, datestart, positioncode, pricegen, humenkind, positionid  "
			    ;


		try {
			statement = connection.prepareStatement(selectStr);

			statement.setString(1, tabNumber);
			statement.setDate(2, new java.sql.Date(planDate.getTime()));
			statement.setString(3, positionId);
			statement.setBigDecimal(4, salary);

			statement.setString(5, tabNumber);
			statement.setDate(6, new java.sql.Date(planDate.getTime()));
			statement.setString(7, positionId);
			statement.setBigDecimal(8, salary);

			statement.setString(9, tabNumber);
			statement.setDate(10, new java.sql.Date(planDate.getTime()));
			statement.setString(11, positionId);
			statement.setBigDecimal(12, salary);


			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENPlan2HumenShort();
				anObject.planRefCode = set.getInt(1);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;

				anObject.planRefDateStart = set.getDate(2);

				anObject.actRefDateGen = set.getDate(3);

				anObject.actRefNumberGen = set.getString(4);

				anObject.actRefCode = set.getInt(5);
				if (set.wasNull())
					anObject.actRefCode = Integer.MIN_VALUE;

				anObject.actRefStatusCode = set.getInt(6);
				if (set.wasNull())
					anObject.actRefStatusCode = Integer.MIN_VALUE;

				anObject.timeWorkGen = set.getBigDecimal(7);
				if (anObject.timeWorkGen != null)
					anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.tabNumber = set.getString(8);
				anObject.fio = set.getString(9);
				anObject.humenKindRefCode = set.getInt(10);
				if (set.wasNull()) {
					anObject.humenKindRefCode = Integer.MIN_VALUE;
				}

				anObject.positionCode = set.getInt(11);

				anObject.priceGen = set.getBigDecimal(12);
				if (anObject.priceGen != null)
					anObject.priceGen = anObject.priceGen.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.positionId = set.getString(13);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
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




  public ENPlan2HumenShortList getListByDateAndTabNumber(String tabNumber,int actCode) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " select " +
   " plancode, datestart, dategen, numbergen, actcode, statusrefcode, " +
   " (sum(countfact) + sum(deliverytime)) as timegen_ " +

   ", tabnumber, fio " +

   " from ( " +
   " SELECT " +
   " p.code as plancode, p.datestart , a.dategen, a.numbergen, " +
   "  a.code as actcode, a.statusrefcode " +
   " ,h.countfact,  " +
   " coalesce((select sum(dt.deliverytimefact) from endeliverytime dt where dt.humenitemrefcode  " +
   " = h.code),0) as deliverytime " +

   ", fw.tabnumber, fw.name as fio " +

   " from enact a , enact2enplanwork a2p, enplanwork p,  " +
   "  finworker fw  , enplanworkitem pi  " +
   " , enhumenitem h " +
   "  " +
   " where " +
   " p.code = pi.planrefcode  and pi.countgen <> 0 and pi.code = h.planitemrefcode " +
   " and a2p.actrefcode = a.code and a2p.plancode = p.code " +
   "  and p.code = h.planrefcode and h.finworkercode = fw.code " +
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +

   " and fw.tabnumber = ? " +
   " and p.datestart in  " +
   " (select p2.datestart from enact2enplanwork a2p2, enplanwork p2 " +
   " where a2p2.plancode = p2.code " +
   " and a2p2.actrefcode = ? " +
   // без перевезень
   " and p2.staterefcode <> " + ENPlanWorkState.TRUCKING +
   " ) " +
   " ) dat " +
   " group by plancode, datestart, dategen, numbergen, actcode, statusrefcode , tabnumber, fio " +
   " order by datestart";



   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setString(1, tabNumber);
     statement.setInt(2, actCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

    	 //" plancode, datestart, dategen, numbergen, actcode, statusrefcode, " +
    	 //  " (sum(countfact) + sum(deliverytime)) as timegen_ " +

    	 //  ", tabnumber, fio " +

       anObject = new ENPlan2HumenShort();
       anObject.planRefCode = set.getInt(1);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;

       anObject.planRefDateStart = set.getDate(2);

       anObject.actRefDateGen = set.getDate(3);

	   anObject.actRefNumberGen = set.getString(4);

       anObject.actRefCode = set.getInt(5);
	   if(set.wasNull())
		   anObject.actRefCode = Integer.MIN_VALUE;

       anObject.actRefStatusCode = set.getInt(6);
	   if(set.wasNull())
		  anObject.actRefStatusCode = Integer.MIN_VALUE;


       anObject.timeWorkGen = set.getBigDecimal(7);
       if(anObject.timeWorkGen != null)
           anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       /*
       anObject.timeWorkFact = set.getBigDecimal(8);
       if(anObject.timeWorkFact != null)
           anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		*/

       anObject.tabNumber = set.getString(8);
       anObject.fio = set.getString(9);
       anObject.humenKindRefCode = ENHumenItemKind.ELTEH;

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


  public ENPlan2HumenShortList getTabNumberList2(int actCode, String actCodes) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " select distinct fw.tabnumber, p.datestart, 1 as humenkind " +
   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
   " enhumenitem h " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and a2p.actrefcode = ? " +
   // без перевезень ...
   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING +
   " union all " +
   " select distinct fw.tabnumber, p.datestart, 2 as humenkind " +
   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
   " entransportitem h " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and a2p.actrefcode = ? " +
   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING ;

   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setInt(1, actCode);
     statement.setInt(2, actCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlan2HumenShort();
       anObject.tabNumber = set.getString(1);
       anObject.planRefDateStart = set.getDate(2);
       anObject.humenKindRefCode = set.getInt(3);
       if (set.wasNull()){
    	   anObject.humenKindRefCode = Integer.MIN_VALUE;
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



	public ENPlan2HumenShortList getTabNumberList(int actCode,
			int departmentCode) throws PersistenceException {
		ENPlan2HumenShortList result = new ENPlan2HumenShortList();
		ENPlan2HumenShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		if (getUserProfile() == null)
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");

		selectStr = " select distinct fw.tabnumber, fw.positioncode, fw.pricegen, p.datestart, 1 as humenkind, fw.positionid " +
		   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
		   " enhumenitem h " +
		   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
		   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
		   "  and a2p.actrefcode = ? " +
		   " and p.departmentrefcode = ? " +
		   // без перевезень ...
		   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING +
		   " union all " +
		   " select distinct fw.tabnumber, fw.positioncode, fw.pricegen, p.datestart, 2 as humenkind, fw.positionid " +
		   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
		   " entransportitem h " +
		   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
		   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
		   "  and a2p.actrefcode = ? " +
		   " and p.departmentrefcode = ? " +
		   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING ;

		try {
			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, actCode);
			statement.setInt(2, departmentCode);

			statement.setInt(3, actCode);
			statement.setInt(4, departmentCode);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENPlan2HumenShort();
				anObject.tabNumber = set.getString(1);
				anObject.positionCode = set.getInt(2);

				anObject.priceGen = set.getBigDecimal(3);
				if (anObject.priceGen != null)
					anObject.priceGen = anObject.priceGen.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.planRefDateStart = set.getDate(4);

				anObject.humenKindRefCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.humenKindRefCode = Integer.MIN_VALUE;
				}

				anObject.positionId = set.getString(6);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
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




  public ENPlan2HumenShortList getActListByTabNumberAndDate2(String tabNumber, Date datePlan, String noActCodes, int departmentCode) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "  SELECT  " +
   /*"   distinct a.code as actcode , a.statusrefcode , a.numbergen, a.dategen " +
   " from enact a , enact2enplanwork a2p, enplanwork p, " +
   "         finworker fw  , enplanworkitem pi   , enhumenitem h            " +
   "  where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.actrefcode = a.code and a2p.plancode = p.code    " +
   "  and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and fw.tabnumber = ? " +
   "  and p.datestart = ? " +*/

   " distinct a.code as actcode, a.statusrefcode, a.numbergen, a.dategen "+
   " from enact a , enact2enplanwork a2p, enplanwork p, "+
   "  enplanworkitem pi ,  enhumenitem h , "+
   "  (select fw.code from finworker fw where fw.tabnumber = ?) as tcode "+
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode "+
   " and a2p.actrefcode = a.code and a2p.plancode = p.code "+
   " and p.code = h.planrefcode "+
   " and h.finworkercode = tcode.code "+
   " and p.datestart = ? "+
   " and a.statusrefcode = " + ENActStatus.GOOD +

   " and p.departmentrefcode = ? " +

   "  and a.code not in ("+ noActCodes +") " +
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +
   "  union " +
   "   SELECT  " +
   /*"   distinct a.code as actcode, a.statusrefcode, a.numbergen, a.dategen " +
   " 	from enact a , enact2enplanwork a2p, enplanwork p, " +
   "     finworker fw  , enplanworkitem pi   , entransportitem h    " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.actrefcode = a.code and a2p.plancode = p.code    " +
   "  and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and fw.tabnumber = ? " +
   "  and p.datestart = ? " +*/

   " distinct a.code as actcode, a.statusrefcode, a.numbergen, a.dategen "+
   " from enact a , enact2enplanwork a2p, enplanwork p, "+
   "  enplanworkitem pi ,  entransportitem h , "+
   "  (select fw.code from finworker fw where fw.tabnumber = ?) as tcode "+
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode "+
   " and a2p.actrefcode = a.code and a2p.plancode = p.code "+
   " and p.code = h.planrefcode "+
   " and h.finworkercode = tcode.code "+
   " and p.datestart = ? "+
   " and a.statusrefcode = " + ENActStatus.GOOD +

   " and p.departmentrefcode = ? " +

   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +
   "  and a.code not in ("+ noActCodes +") ";


   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setString(1, tabNumber);
     statement.setDate(2, new java.sql.Date(datePlan.getTime()));
     statement.setInt(3, departmentCode);

     statement.setString(4, tabNumber);
     statement.setDate(5, new java.sql.Date(datePlan.getTime()));
     statement.setInt(6, departmentCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlan2HumenShort();

       anObject.actRefCode = set.getInt(1);
       if (set.wasNull()){
    	   anObject.actRefCode = Integer.MIN_VALUE;
       }

       anObject.actRefStatusCode = set.getInt(2);
       if (set.wasNull()){
    	   anObject.actRefStatusCode = Integer.MIN_VALUE;
       }

       anObject.actRefNumberGen = set.getString(3);
       anObject.actRefDateGen = set.getDate(4);

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




  public ENPlan2HumenShortList getActListByTabNumberAndDate(String tabNumber, Date datePlan, String noActCodes) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "  SELECT  " +
   "   distinct p.datestart , a.code as actcode, " +
   "    a.statusrefcode , 1 as humenkind     " +
   " from enact a , enact2enplanwork a2p, enplanwork p, " +
   "         finworker fw  , enplanworkitem pi   , enhumenitem h            " +
   "  where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.actrefcode = a.code and a2p.plancode = p.code    " +
   "  and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and fw.tabnumber = ? " +
   "  and p.datestart = ? " +
   "  and a.code not in ("+ noActCodes +") " +
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING +

   "  union all " +
   "   SELECT  " +
   "   distinct p.datestart , a.code as actcode, " +
   "    a.statusrefcode, 2 as humenkind     " +
   " 	from enact a , enact2enplanwork a2p, enplanwork p, " +
   "     finworker fw  , enplanworkitem pi   , entransportitem h    " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.actrefcode = a.code and a2p.plancode = p.code    " +
   "  and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and fw.tabnumber = ? " +
   "  and p.datestart = ? " +
   "  and a.code not in ("+ noActCodes +") "+
   // без перевезень ...
   " and a.acttyperefcode <> " + ENPlanWorkState.TRUCKING ;


   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setString(1, tabNumber);
     statement.setDate(2, new java.sql.Date(datePlan.getTime()));

     statement.setString(3, tabNumber);
     statement.setDate(4, new java.sql.Date(datePlan.getTime()));


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlan2HumenShort();
       anObject.planRefDateStart = set.getDate(1);

       anObject.actRefCode = set.getInt(2);
       if (set.wasNull()){
    	   anObject.actRefCode = Integer.MIN_VALUE;
       }
       anObject.actRefStatusCode = set.getInt(3);
       if (set.wasNull()){
    	   anObject.actRefStatusCode = Integer.MIN_VALUE;
       }
       anObject.humenKindRefCode = set.getInt(4);
       if (set.wasNull()){
    	   anObject.humenKindRefCode = Integer.MIN_VALUE;
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


  public ENPlanWorkShortList getRelatedWorkOrders(String tabNumbers, String dates) throws PersistenceException
  {
	  ENPlanWorkShortList result = new ENPlanWorkShortList();
	  ENPlanWorkShort anObject;

	  result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "select p.datestart, w.workordernumber from enplanwork p, enhumenitem h, finworker fw " +
   			"  , enworkorder2enplanwork w2p, enworkorder w  where " +
   			" p.code = h.planrefcode and h.finworkercode = fw.code and p.kindcode = 4 " +
   			" and p.code = w2p.plancode and w2p.workordercode = w.code " +
   			" and p.datestart in (" + dates + ") " +
   			" and fw.tabnumber in (" + tabNumbers + ") " +
   			" and p.code not in (select a2p.plancode from enact2enplanwork a2p) " +
   			" group by p.datestart ,w.workordernumber order by p.datestart, w.workordernumber" ;

   try
    {
     statement = connection.prepareStatement(selectStr);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlanWorkShort();
       anObject.dateStart = set.getDate(1);

       anObject.workOrderNumber = set.getString(2);

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



  public ENPlan2HumenShortList getRelatedWorkOrdersByTabNumber(String tabNumber, String actCodes, String dates) throws PersistenceException
  {
	  ENPlan2HumenShortList result = new ENPlan2HumenShortList();
	  ENPlan2HumenShort anObject;

	  result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " select as1.name, a.numbergen, a.dategen, w.workordernumber, p.datestart, sum(p2h.timeworkfact) " +
   "   from  " +
   " enplanwork p , enworkorder2enplanwork w2p, enworkorder w  " +
   " ,  enact2enplanwork a2p, enact a, enplan2humen p2h, enactstatus as1 " +
   "  where  " +
   "  p.kindcode = 4 and p.code = w2p.plancode and w2p.workordercode = w.code  " +
   " and p.datestart in ("+ dates +")  " +
   " and p.code = a2p.plancode and a2p.actrefcode = a.code and a.statusrefcode = as1.code " +
   " and a2p.actrefcode in (" + actCodes + ") " +
   " and p2h.planrefcode = p.code " +
   " and p2h.tabnumber = ? " +
   " group by as1.name,a.numbergen, a.dategen, w.workordernumber, p.datestart " +
   " order by p.datestart, a.dategen";

   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setString(1,tabNumber);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlan2HumenShort();
       anObject.actRefStatusName = set.getString(1);
       anObject.actRefNumberGen = set.getString(2);
       anObject.actRefDateGen = set.getDate(3);
       anObject.planRefWorkOrderNumber = set.getString(4);
       anObject.planRefDateStart = set.getDate(5);
       anObject.timeWorkFact = set.getBigDecimal(6);
       if (anObject.timeWorkFact != null){
    	   anObject.timeWorkFact = anObject.timeWorkFact.setScale(2, BigDecimal.ROUND_HALF_UP);
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

  @Override
public int add(ENPlan2Humen anObject, boolean aUseSequential) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;

   String lock_ = "";

	anObject.modify_time = System.currentTimeMillis();

   if(aUseSequential)
    _collectAutoIncrementFields(anObject,connection);

   selectStr = "INSERT INTO ENPLAN2HUMEN (CODE,TABNUMBER,FIO,POSITIONCODE,PRICEGEN,TIMEWORKGEN,TIMEWORKFACT,TIMEDELIVERY,POSITIONID,MODIFY_TIME,PLANREFCODE,HUMENKINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

   try
    {
     statement = connection.prepareStatement(selectStr);
     if (anObject.code != Integer.MIN_VALUE )
        statement.setInt(1,anObject.code);
     else
        statement.setNull(1,java.sql.Types.INTEGER);
     statement.setString(2,anObject.tabNumber);
     statement.setString(3,anObject.fio);

     if (anObject.positionCode != Integer.MIN_VALUE )
        statement.setInt(4,anObject.positionCode);
     else
        statement.setNull(4,java.sql.Types.INTEGER);
     if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
     statement.setBigDecimal(5,anObject.priceGen);


     if (anObject.timeWorkGen != null)
        anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
     statement.setBigDecimal(6,anObject.timeWorkGen);
     if (anObject.timeWorkFact != null)
        anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
     statement.setBigDecimal(7,anObject.timeWorkFact);
     if (anObject.timeDelivery != null)
         anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(8,anObject.timeDelivery);

     statement.setString(9,anObject.positionId);

     if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
     else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));


     /* пусть СУБД проверяет ...

     if (anObject.planRef.code != Integer.MIN_VALUE){
       if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
          throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlan2Humen.planRef.code%} = {%"+anObject.planRef.code+"%}");
       statement.setInt(10,anObject.planRef.code);
     }
     else
       statement.setNull(10,java.sql.Types.INTEGER);
     */

     if (anObject.planRef.code != Integer.MIN_VALUE){
   	  statement.setInt(11,anObject.planRef.code);
     }
     else
     {
   	  throw new EnergyproSystemException("Кода плану НЕМАЄ !!!");
     }

     /*
     if (anObject.humenKindRef.code != Integer.MIN_VALUE){
       if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen(connection,getUserProfile()).exists(anObject.humenKindRef.code))
          throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlan2Humen.humenKindRef.code%} = {%"+anObject.humenKindRef.code+"%}");
       statement.setInt(11,anObject.humenKindRef.code);
     }
     else
       statement.setNull(11,java.sql.Types.INTEGER);
       */

     if (anObject.humenKindRef.code != Integer.MIN_VALUE){
         statement.setInt(12,anObject.humenKindRef.code);
       }
       else
       	throw new EnergyproSystemException("Немає типу Працівника ...");

	  //System.out.println("Lock add " + anObject.tabNumber + " , " + getUserProfile().userName);
     //synchronized (lock_) {
   	  statement.execute();
     //}
	  //System.out.println("unLock add " + anObject.tabNumber + " , " + getUserProfile().userName);

     return anObject.code;
    }
   catch(SQLException e)
    {
          _sequenceTable.clear();
          EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return Integer.MIN_VALUE;
    }
       catch(Exception e)
    {
     _sequenceTable.clear();
     throw new PersistenceException("Error in method {%ENPlan2HumenDAOGen.add%}",e);
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


public void remove(int uid) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();

   String lock_ = "";

   selectStr = "DELETE FROM  ENPLAN2HUMEN WHERE CODE = ?";

   /*
   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   ENPlan2Humen object = getObject(uid);

   if(object == null)
    throw new PersistenceException("{%ENPlan2Humen.getObject%} access denied");

   if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlan2Humen.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
    throw new PersistenceException("{%ENPlan2Humen.remove%} access denied");
    */

   PreparedStatement statement = null;
   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,uid);
	  //System.out.println("Lock remove " + uid + " , " + getUserProfile().userName);
     //synchronized (lock_)
     {
   	  statement.execute();
     }
	  //System.out.println("unLock remove " + uid + " , " + getUserProfile().userName);

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

  @Override
public boolean exists(int anObjectCode) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   if(anObjectCode == Integer.MIN_VALUE)
    return false;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlan2Humen.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPlan2Humen.getObject%} access denied");
   */

   selectStr =

   "SELECT  ENPLAN2HUMEN.CODE FROM  ENPLAN2HUMEN WHERE  ENPLAN2HUMEN.CODE = ?";
   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObjectCode);
     set = statement.executeQuery();
     if(set.next())
      return true;
     return false;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return false;
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

  ///////////// PRIVATE SECTION ///////////////
  static private Hashtable _sequenceTable = new Hashtable();

  public ENPlan2HumenShortList getTabNumberListByPlanSomeTechCard(int planCode, int departmentCode) throws PersistenceException
  {
   ENPlan2HumenShortList result = new ENPlan2HumenShortList();
   ENPlan2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " select distinct fw.tabnumber, fw.positioncode, fw.pricegen, p.datestart, 1 as humenkind , sum(h.countfact) as countfact " +
   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
   " enhumenitem h , enelement el " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and a2p.plancode = ? " +
   "  and p.departmentrefcode = ? " +
   "  and p.elementrefcode = el.code  " +
   // по техкартам из строк репортов
   "  and case when el.typerefcode = 5 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000222) " +
   "  when el.typerefcode = 1 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000227) " +
   "  when el.typerefcode = 2 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000223) " +
   "  end " +
   // без перевезень ...
   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING +
   " group by fw.tabnumber, fw.positioncode, fw.pricegen, p.datestart " +
   " union all " +
   " select distinct fw.tabnumber, fw.positioncode, fw.pricegen, p.datestart, 2 as humenkind , 0 as countfact " +
   " from enact2enplanwork a2p, enplanwork p, finworker fw  , enplanworkitem pi   ,  " +
   " entransportitem h , enelement el " +
   " where  p.code = pi.planrefcode and pi.countgen <> 0 and pi.code = h.planitemrefcode   " +
   "  and a2p.plancode = p.code and p.code = h.planrefcode and h.finworkercode = fw.code   " +
   "  and a2p.plancode = ? " +
   "  and p.departmentrefcode = ? " +
   "  and p.elementrefcode = el.code  " +
// по техкартам из строк репортов
   "  and case when el.typerefcode = 5 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000222) " +
   "  when el.typerefcode = 1 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000227) " +
   "  when el.typerefcode = 2 then pi.kartarefcode in (select q.techcardcode from tkreportitem2techcard q  where q.reportitemcode = 500000223) " +
   "  end " +
   " and p.staterefcode <> " + ENPlanWorkState.TRUCKING ;

   try
    {
     statement = connection.prepareStatement(selectStr);

     statement.setInt(1, planCode);
     statement.setInt(2, departmentCode);

     statement.setInt(3, planCode);
     statement.setInt(4, departmentCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENPlan2HumenShort();
       anObject.tabNumber = set.getString(1);

       anObject.positionCode = set.getInt(2);
       if (set.wasNull()){
   	       anObject.positionCode = Integer.MIN_VALUE;
       }

       anObject.priceGen = set.getBigDecimal(3);
       if(anObject.priceGen != null)
           anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.planRefDateStart = set.getDate(4);
       anObject.humenKindRefCode = set.getInt(5);
       if (set.wasNull()){
    	   anObject.humenKindRefCode = Integer.MIN_VALUE;
       }
       anObject.timeWorkGen = set.getBigDecimal(6);
       if(anObject.timeWorkGen != null)
           anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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



	public boolean isEqual(ENPlan2Humen inObject) throws PersistenceException {
		ENPlan2Humen obj = new ENPlan2Humen();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.tabNumber == null && obj.tabNumber == null) {
		} else if (inObject.tabNumber == null || obj.tabNumber == null)
			return false;
		else if (!inObject.tabNumber.equals(obj.tabNumber)) {
			return false;
		}

		if (inObject.fio == null && obj.fio == null) {
		} else if (inObject.fio == null || obj.fio == null)
			return false;
		else if (!inObject.fio.equals(obj.fio)) {
			return false;
		}

		if (inObject.positionCode != obj.positionCode) {
			return false;
		}

		if (inObject.priceGen == null && obj.priceGen == null) {
		} else if (inObject.priceGen == null || obj.priceGen == null)
			return false;
		else if (!inObject.priceGen.equals(obj.priceGen)) {
			return false;
		}

		if (inObject.timeWorkGen == null && obj.timeWorkGen == null) {
		} else if (inObject.timeWorkGen == null || obj.timeWorkGen == null)
			return false;
		else if (!inObject.timeWorkGen.equals(obj.timeWorkGen)) {
			return false;
		}

		if (inObject.timeWorkFact == null && obj.timeWorkFact == null) {
		} else if (inObject.timeWorkFact == null || obj.timeWorkFact == null)
			return false;
		else if (!inObject.timeWorkFact.equals(obj.timeWorkFact)) {
			return false;
		}

		if (inObject.timeDelivery == null && obj.timeDelivery == null) {
		} else if (inObject.timeDelivery == null || obj.timeDelivery == null)
			return false;
		else if (!inObject.timeDelivery.equals(obj.timeDelivery)) {
			return false;
		}

		if (inObject.positionId == null && obj.positionId == null) {
		} else if (inObject.positionId == null || obj.positionId == null)
			return false;
		else if (!inObject.positionId.equals(obj.positionId)) {
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code) {
			return false;
		}
		if (inObject.humenKindRef.code != obj.humenKindRef.code) {
			return false;
		}
		return true;
	}


	public ENPlan2Humen getObject(int uid) throws PersistenceException {
		ENPlan2Humen result = new ENPlan2Humen();
		result.code = uid;
		loadObject(result);
		if (result.code == Integer.MIN_VALUE)
			return null;
		return result;
	}

	public void loadObject(ENPlan2Humen anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "SELECT  ENPLAN2HUMEN.CODE, ENPLAN2HUMEN.TABNUMBER, ENPLAN2HUMEN.FIO, ENPLAN2HUMEN.POSITIONCODE, ENPLAN2HUMEN.PRICEGEN, ENPLAN2HUMEN.TIMEWORKGEN, ENPLAN2HUMEN.TIMEWORKFACT, ENPLAN2HUMEN.TIMEDELIVERY, ENPLAN2HUMEN.POSITIONID, ENPLAN2HUMEN.MODIFY_TIME, ENPLAN2HUMEN.PLANREFCODE, ENPLAN2HUMEN.HUMENKINDREFCODE "
				+ " FROM ENPLAN2HUMEN WHERE ENPLAN2HUMEN.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, anObject.code);
			set = statement.executeQuery();
			if (!set.next())
				anObject.code = Integer.MIN_VALUE;
			else {
				anObject.code = set.getInt(1);
				anObject.tabNumber = set.getString(2);
				anObject.fio = set.getString(3);
				anObject.positionCode = set.getInt(4);
				if (set.wasNull())
					anObject.positionCode = Integer.MIN_VALUE;
				anObject.priceGen = set.getBigDecimal(5);
				if (anObject.priceGen != null)
					anObject.priceGen = anObject.priceGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.timeWorkGen = set.getBigDecimal(6);
				if (anObject.timeWorkGen != null)
					anObject.timeWorkGen = anObject.timeWorkGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.timeWorkFact = set.getBigDecimal(7);
				if (anObject.timeWorkFact != null)
					anObject.timeWorkFact = anObject.timeWorkFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.timeDelivery = set.getBigDecimal(8);
				if (anObject.timeDelivery != null)
					anObject.timeDelivery = anObject.timeDelivery.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.positionId = set.getString(9);
				anObject.modify_time = set.getLong(10);
				if (set.wasNull())
					anObject.modify_time = Long.MIN_VALUE;
				anObject.planRef.code = set.getInt(11);
				if (set.wasNull())
					anObject.planRef.code = Integer.MIN_VALUE;
				anObject.humenKindRef.code = set.getInt(12);
				if (set.wasNull())
					anObject.humenKindRef.code = Integer.MIN_VALUE;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);

		} finally {
			try {
				if (set != null)
					set.close();
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




} // end of ENPlan2HumenDAO

