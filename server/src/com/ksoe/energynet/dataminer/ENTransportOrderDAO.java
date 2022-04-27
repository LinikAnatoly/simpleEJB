
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.brief.ENTransportOrderShort;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENTransportOrder;  
  * 	
  */

public class ENTransportOrderDAO extends ENTransportOrderDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportOrderDAO() {super();}
  //public ENTransportOrderDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportOrderDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENTransportOrderShortList getGroupedTransportListByPlanCode(int planCode) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
//   selectStr = " SELECT  \n" +
//   "     ENTRANSPORTORDER.CODE \n" +
//   "     ,ENTRANSPORTORDER.TIMESTART \n" +
//   "     ,ENTRANSPORTORDER.TIMEFINAL \n" +
//   "     ,ENTRANSPORTORDER.DATESTART \n" +
//   "     ,ENTRANSPORTORDER.DATEFINAL \n" +
//   "     ,ENTRANSPORTORDER.DATEEDIT \n" +
//   "     ,ENTRANSPORTORDER.USERGEN \n" +
//   "      , ENTRANSPORTORDERSTATUS.CODE  \n" +
//   "      , ENPLANWORK.CODE  \n" +
//   "      , TKTRANSPORTCLASSIFICTN.CODE  \n" +
//   "      , TKTRANSPORTCLASSIFICTN.NAME  \n" +
//   "      , TKTRANSPORTREAL.CODE  \n" +
//   "      , TKTRANSPORTREAL.NAME  \n" +
//   "      , TKTRANSPORTREAL.INVNUMBER  \n" +
//   "      , TKTRANSPORTREAL.GOSNUMBER  \n" +
//   "      FROM  \n" +
//   "       ENTRANSPORTORDERSTATUS  \n" +
//   "     , ENPLANWORK  \n" +
//   "     , TKTRANSPORT  \n" +
//   "     , TKTRANSPORTCLASSIFICTN \n" +
//   "     , ENTRANSPORTORDER LEFT JOIN TKTRANSPORTREAL  \n" +
//   "     ON TKTRANSPORTREAL.CODE = ENTRANSPORTORDER.TRANSPORTREALCODE \n" +
//   "     where  \n" +
//   "  ENTRANSPORTORDERSTATUS.CODE = ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD  \n" +
//   "  AND ENPLANWORK.CODE = ENTRANSPORTORDER.PLANREFCODE  \n" +
//   "  AND TKTRANSPORT.CODE = ENTRANSPORTORDER.TRANSPORTCODE  \n" +
//   "  AND TKTRANSPORTCLASSIFICTN.CODE = TKTRANSPORT.TRANSPORTCLASSIFICTNCD \n" + 
//   "  AND ENPLANWORK.CODE = ? \n" +
//   "   \n" +
//   "  UNION ALL \n" +
//   "   \n" +
//   " SELECT  \n" +
//   "      -1    \n" +
//   "     ,null \n" +
//   "     ,null \n" +
//   "     ,null \n" +
//   "     ,null \n" +
//   "     ,null \n" +
//   "     ,null \n" +
//   "      , null \n" +
//   "      , ENPLANWORK.CODE  \n" +
//   "      , TKTRANSPORTCLASSIFICTN.CODE  \n" +
//   "      , TKTRANSPORTCLASSIFICTN.NAME  \n" +
//   "      , null \n" +
//   "  , null \n" +
//   "  , null \n" +
//   "  , null \n" +
//   "      FROM  \n" +
//   "       ENPLANWORK  \n" +
//   "     , ENPLANWORKITEM  \n" +
//   "     , TKTRANSPORT \n" +
//   "     , ENTRANSPORTITEM \n" + 
//   "     , TKTRANSPORTCLASSIFICTN \n" +
//   "     WHERE \n" +
//   "  TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE  \n" +
//   "  AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE \n" +
//   "  AND ENPLANWORKITEM.COUNTGEN > 0  \n" + 
//   "  AND ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.code \n" +
//   "  AND ENPLANWORK.CODE = ? \n" +
//   "  AND TKTRANSPORTCLASSIFICTN.CODE = TKTRANSPORT.TRANSPORTCLASSIFICTNCD \n" + 
//   "  AND ENTRANSPORTITEM.CODE NOT IN  \n" +
//   "  (SELECT ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE FROM ENTRNSPRTRDR2TRNSPRTTM  \n" +
//   "  WHERE ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE IN \n" +
//   "  (SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER WHERE  \n" +
//   "  ENTRANSPORTORDER.PLANREFCODE = ?)) \n" +
//   "   AND ENTRANSPORTITEM.CODE NOT IN \n" + 
//   "  (SELECT ENTRANSPRTTM2TRNSPRTTM.outrefcode FROM ENTRANSPRTTM2TRNSPRTTM )" +
//   "   and entransportitem.code not in " +
//   "  (select entravlshttm2trnsprttm.transportitemrefcode from entravlshttm2trnsprttm )" +
//   "group by TKTRANSPORTCLASSIFICTN.CODE, TKTRANSPORTCLASSIFICTN.NAME, ENPLANWORK.CODE \n" + 
//   "order by 11, 1";

//// Небольшая оптимизация при переходе на ПГ 9.1   
   
   selectStr = " SELECT " + 
   " ENTRANSPORTORDER.CODE " + 
   " ,ENTRANSPORTORDER.TIMESTART " +
   " ,ENTRANSPORTORDER.TIMEFINAL " + 
   " ,ENTRANSPORTORDER.DATESTART " + 
   " ,ENTRANSPORTORDER.DATEFINAL " + 
   " ,ENTRANSPORTORDER.DATEEDIT " + 
   " ,ENTRANSPORTORDER.USERGEN " + 
   " , ENTRANSPORTORDERSTATUS.CODE " +  
   " , ENPLANWORK.CODE  " + 
   " , TKTRANSPORTCLASSIFICTN.CODE  " + 
   " , TKTRANSPORTCLASSIFICTN.NAME  " + 
   " , TKTRANSPORTREAL.CODE  " + 
   " , TKTRANSPORTREAL.NAME " + 
   " , TKTRANSPORTREAL.INVNUMBER  " + 
   " , TKTRANSPORTREAL.GOSNUMBER  " + 
   " FROM " +  
   "   ENTRANSPORTORDER LEFT JOIN TKTRANSPORTREAL  " + 
   "  ON TKTRANSPORTREAL.CODE = ENTRANSPORTORDER.TRANSPORTREALCODE " + 
   "  join  ENPLANWORK on (ENPLANWORK.CODE = ENTRANSPORTORDER.PLANREFCODE  AND ENPLANWORK.CODE = ? ) " + 
   "  join ENTRANSPORTORDERSTATUS on (ENTRANSPORTORDERSTATUS.CODE = ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD  ) " + 
   "  join TKTRANSPORT on (TKTRANSPORT.CODE = ENTRANSPORTORDER.TRANSPORTCODE  ) " +
   "  join TKTRANSPORTCLASSIFICTN on ( TKTRANSPORTCLASSIFICTN.CODE = TKTRANSPORT.TRANSPORTCLASSIFICTNCD  ) " +         
   " UNION ALL " +
   " SELECT  " + 
   " -1 " +    
   " ,null " + 
   " ,null " + 
   " ,null " + 
   " ,null " + 
   " ,null " + 
   " ,null " + 
   " ,null " + 
   " , ENPLANWORK.CODE  "  +
   " , TKTRANSPORTCLASSIFICTN.CODE  " + 
   " , TKTRANSPORTCLASSIFICTN.NAME  " + 
   " , null " + 
   " , null " + 
   " , null " + 
   " , null " + 
   " FROM  " +
   "  TKTRANSPORTCLASSIFICTN " +
   ", TKTRANSPORT " +
   ", ENTRANSPORTITEM  LEFT JOIN ENTRNSPRTRDR2TRNSPRTTM on " + 
    " (ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE = ENTRANSPORTITEM.CODE) " + 
    "  LEFT JOIN ENTRANSPRTTM2TRNSPRTTM on (ENTRANSPRTTM2TRNSPRTTM.outrefcode = ENTRANSPORTITEM.CODE) " + 
    "   LEFT JOIN  entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = ENTRANSPORTITEM.CODE) " + 
    "   join ENPLANWORKITEM on (ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE AND ENPLANWORKITEM.COUNTGEN > 0 ) " + 
    "   join ENPLANWORK on (ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE  and ENPLANWORK.CODE = ? ) " + 
    " WHERE " + 
    " TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE   " + 
    " AND TKTRANSPORTCLASSIFICTN.CODE = TKTRANSPORT.TRANSPORTCLASSIFICTNCD  " + 
    " and ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE is null " + 
    " and ENTRANSPRTTM2TRNSPRTTM.outrefcode is null " + 
    " and entravlshttm2trnsprttm.transportitemrefcode is null " + 
    " group by TKTRANSPORTCLASSIFICTN.CODE, TKTRANSPORTCLASSIFICTN.NAME, ENPLANWORK.CODE  " + 
    " order by 11, 1 ";
   
////
   try
    {
	 
     statement = connection.prepareStatement(selectStr);
     int number = 0;
    
     statement.setInt(1, planCode);
     statement.setInt(2, planCode);
     
     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
      
       anObject = new ENTransportOrderShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.timeStart = set.getTimestamp(2);		
       anObject.timeFinal = set.getTimestamp(3);		
       anObject.dateStart = set.getTimestamp(4);		
       anObject.dateFinal = set.getTimestamp(5);		
       anObject.dateEdit = set.getTimestamp(6);		
       anObject.userGen = set.getString(7);
       anObject.transportOrderStatusCode = set.getInt(8);
		if(set.wasNull())
		   anObject.transportOrderStatusCode = Integer.MIN_VALUE;		
       anObject.planRefCode = set.getInt(9);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;		
       
       anObject.transportCode = set.getInt(10);
		if(set.wasNull())
		   anObject.transportCode = Integer.MIN_VALUE;		
       anObject.transportName = set.getString(11);
       anObject.transportRealCode = set.getInt(12);
		if(set.wasNull())
		   anObject.transportRealCode = Integer.MIN_VALUE;		
       anObject.transportRealName = set.getString(13);
       anObject.transportRealInvNumber = set.getString(14);
       anObject.transportRealGosNumber = set.getString(15);

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
   * Возвращает лист с незаявленным транспортом
   * 
   * @param transportCode - код транспортной классификации
   * @param orderDateStart - начало периода
   * @param orderDateFinal - конец периода
   * @param transportDepartmentCode - код транспортного подразделения
   * @return ENTransportOrderShortList
   * @throws PersistenceException
   */
  public ENTransportOrderShortList getGroupedTransportListByTransportCode(int transportCode, Date orderDateStart, Date orderDateFinal, int transportDepartmentCode) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
//   selectStr = " SELECT  \n" +
//   "               pCode, \n" +
//   "               transportCode, \n" +
//   "               transportName, \n" +
//   "               elementName, \n" +
//   "               workOrder,    \n" +
//   "               finMolName,  \n" +
//   "               finExecutor,  \n" +
//   "      		  kindCode, \n" +
//   "               kindName, \n" +
//   "               departmentName FROM \n" +
//   "  (SELECT   \n" +
//   "                 ENPLANWORK.CODE  as pCode \n" +
//   "                , TKTRANSPORT.CODE   as transportCode \n" +
//   "                , TKTRANSPORT.NAME as transportName \n" +
//   "                ,  coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') as elementName    \n" +
//   "                , ENWORKORDER.WORKORDERNUMBER as workOrder    \n" +
//   "                , FINMOLDATA.FINMOLNAME as finMolName  \n" +
//   "                , FINEXECUTOR.NAME  as finExecutor  \n" +
//   "      		  , ENPLANWORKKIND.CODE   as kindCode \n" +
//   "                , ENPLANWORKKIND.NAME   as kindName \n" +
//   "                , ENDEPARTMENT.NAME    as departmentName \n" +
//   "                  \n" +
//   "                FROM     \n" +
//   "                 ENPLANWORK     \n" +
//   "               , ENPLANWORKITEM     \n" +
//   "               , TKTRANSPORT    \n" +
//   "               , ENTRANSPORTITEM     \n" +
//   "               , ENELEMENTDATA    \n" +
//   "               , ENWORKORDER    \n" +
//   "               , ENWORKORDER2ENPLANWORK     \n" +
//   "               , FINMOLDATA    \n" +
//   "               , FINEXECUTOR    \n" +
//   "               , ENPLANWORKKIND    \n" +
//   "               , ENDEPARTMENT      \n" +
//   "               WHERE    \n" +
//   "            TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE     \n" +
//   "            AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE    \n" +
//   "            AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE    \n" +
//   "            AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE    \n" +
//   "       	  AND ENTRANSPORTITEM.CODE not in (select transportitemrefcode from entravlshttm2trnsprttm)    \n" +
//   "            AND ENPLANWORKITEM.COUNTGEN > 0      \n" +
//   "            AND ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE    \n" +
//   "            AND ENTRANSPORTITEM.CODE NOT IN     \n" +
//   "            (SELECT ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE FROM ENTRNSPRTRDR2TRNSPRTTM)    \n" +
//   "            AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE    \n" +
//   "            AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    \n" +
//   "            AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE    \n" +
//   "            AND FINMOLDATA.workordercode = ENWORKORDER.CODE    \n" +
//   "      	  AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE    \n" +
//   "            and ((ENPLANWORK.KINDCODE =    3  \n" +
//   "            and ENPLANWORK.STATUSCODE in  (1,3)  )      \n" +
//   "      )    \n" +
//   "       	  AND FINMOLDATA.MOLTYPEREFCODE = 1 \n" +
//   "            AND (TKTRANSPORT.TRANSPORTCLASSIFICTNCD = ?)    \n" +
//   "            AND ENPLANWORK.DATESTART >= ?    \n" +
//   "            AND ENPLANWORK.DATESTART <= ? \n" +
//   "            and enplanwork.departmentrefcode in     \n" +
//   "           	 (select      \n" +
//   "           		 entransportdep2dep.departmentcode      \n" +
//   "                 from     \n" +
//   "                	 entransportdep2dep      \n" +
//   "                 where      \n" +
//   "                	 entransportdep2dep.transportdepartmentcod = ?)    \n" +
//   "                   \n" +
//   "                   \n" +
//   "           union all      \n" +
//   "            \n" +
//   "            \n" +
//   "            SELECT   \n" +
//   "                 ENPLANWORK.CODE  as pCode \n" +
//   "                , TKTRANSPORT.CODE   as transportCode \n" +
//   "                , TKTRANSPORT.NAME as transportName \n" +
//   "                ,  coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') as elementName    \n" +
//   "                , ENWORKORDER.WORKORDERNUMBER as workOrder    \n" +
//   "                , FINMOLDATA.FINMOLNAME as finMolName  \n" +
//   "                , FINEXECUTOR.NAME  as finExecutor  \n" +
//   "      		  , ENPLANWORKKIND.CODE   as kindCode \n" +
//   "                , ENPLANWORKKIND.NAME   as kindName \n" +
//   "                , ENDEPARTMENT.NAME    as departmentName  \n" +
//   "                  \n" +
//   "                FROM     \n" +
//   "                 ENPLANWORK     \n" +
//   "               , ENPLANWORKITEM     \n" +
//   "               , TKTRANSPORT    \n" +
//   "               , ENTRANSPORTITEM     \n" +
//   "               , ENELEMENTDATA    \n" +
//   "               , ENWORKORDER    \n" +
//   "               , ENWORKORDER2ENPLANWORK     \n" +
//   "               , FINMOLDATA    \n" +
//   "               , FINEXECUTOR    \n" +
//   "               , ENPLANWORKKIND    \n" +
//   "               , ENDEPARTMENT      \n" +
//   "               WHERE    \n" +
//   "            TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE     \n" +
//   "            AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE    \n" +
//   "            AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE    \n" +
//   "            AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE    \n" +
//   "       	  AND ENTRANSPORTITEM.CODE not in (select transportitemrefcode from entravlshttm2trnsprttm)    \n" +
//   "            AND ENPLANWORKITEM.COUNTGEN > 0      \n" +
//   "            AND ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE    \n" +
//   "            AND ENTRANSPORTITEM.CODE NOT IN     \n" +
//   "            (SELECT ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE FROM ENTRNSPRTRDR2TRNSPRTTM)    \n" +
//   "            AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE    \n" +
//   "            AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    \n" +
//   "            AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE    \n" +
//   "            AND FINMOLDATA.workordercode = ENWORKORDER.CODE    \n" +
//   "      	  AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE    \n" +
//   "            and ((ENPLANWORK.KINDCODE =    4  \n" +
//   "            and ENPLANWORK.STATUSCODE = 1 )      \n" +
//   "      )    \n" +
//   "       	  AND FINMOLDATA.MOLTYPEREFCODE = 1 \n" +
//   "            AND (TKTRANSPORT.TRANSPORTCLASSIFICTNCD = ?)    \n" +
//   "            AND ENPLANWORK.DATESTART >= ?    \n" +
//   "            AND ENPLANWORK.DATESTART <= ? \n" +
//   "            and enplanwork.departmentrefcode in     \n" +
//   "           	 (select      \n" +
//   "           		 entransportdep2dep.departmentcode      \n" +
//   "                 from     \n" +
//   "                	 entransportdep2dep      \n" +
//   "                 where      \n" +
//   "                	 entransportdep2dep.transportdepartmentcod = ?) \n" +
//   "            and entransportitem.code not in (select entransprttm2trnsprttm.outrefcode from entransprttm2trnsprttm)) as unordered_query \n" +
//   "                     \n" +
//   "                      \n" +
//   "          group by pCode, \n" +
//   "               transportCode, \n" +
//   "               transportName, \n" +
//   "               elementName,    \n" +
//   "               workOrder,    \n" +
//   "               finMolName,  \n" +
//   "               finExecutor,  \n" +
//   "      		  kindCode, \n" +
//   "               kindName, \n" +
//   "               departmentName \n" +
//   "          order by 5, 1;  \n" +
//   "  \n";

   
////// Небольшая оптимизация после перехода на ПГ 9.1

   selectStr =   " SELECT  " + 
  " pCode, " +
  " transportCode, " +
  " transportName, " +
  " elementName, " +
  " workOrder,    " +
  " finMolName,  " +
  " finExecutor,  " +
  " kindCode, " +
  " kindName, " +
  " departmentName FROM " +
  " (SELECT   " + 
  "   ENPLANWORK.CODE  as pCode " + 
  "  , TKTRANSPORT.CODE   as transportCode " +
  "  , TKTRANSPORT.NAME as transportName " + 
  " ,(select coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') from enelementdata where enelementdata.ecode = enelement.code ) as elementName  " +  
  " , ENWORKORDER.WORKORDERNUMBER as workOrder " +   
  " , FINMOLDATA.FINMOLNAME as finMolName " + 
  " , FINEXECUTOR.NAME  as finExecutor " +   
  " , ENPLANWORKKIND.CODE   as kindCode " + 
  " , ENPLANWORKKIND.NAME   as kindName " + 
  " , ENDEPARTMENT.NAME    as departmentName " +     
  " FROM " +      
   "  ENELEMENT  " +  
   " , ENWORKORDER  join   FINMOLDATA  on (FINMOLDATA.workordercode = ENWORKORDER.CODE AND FINMOLDATA.MOLTYPEREFCODE = 1) " + 
   ", ENWORKORDER2ENPLANWORK   " +    
   ", FINEXECUTOR " +         
   ", ENTRANSPORTITEM LEFT JOIN entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = ENTRANSPORTITEM.code) "  +
   "  left join ENTRNSPRTRDR2TRNSPRTTM on (ENTRANSPORTITEM.code = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE) " + 
   " join TKTRANSPORT on (TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE and TKTRANSPORT.TRANSPORTCLASSIFICTNCD = ?) " + 
   " join ENPLANWORKITEM on (ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE AND ENPLANWORKITEM.COUNTGEN > 0 ) " + 
   " join ENPLANWORK on (ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE  " + 
   "                      and ENPLANWORK.KINDCODE = 3  " + 
   "                     and ENPLANWORK.STATUSCODE in (1,3) " + 
   "                     and ENPLANWORK.DATESTART >= ? " + 
   "                     AND ENPLANWORK.DATESTART <= ? " + 
   "                     and enplanwork.departmentrefcode in   " +   
   "  	                  (select entransportdep2dep.departmentcode from entransportdep2dep " +   
   "                       where  entransportdep2dep.transportdepartmentcod = ?) ) " + 
   "  join ENDEPARTMENT on (ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ) " + 
   "  join ENPLANWORKKIND on (ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE ) " + 
   "  WHERE    " + 
   "  entravlshttm2trnsprttm.transportitemrefcode is null  " + 
   " AND  ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE is NULL " +   
   " AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE   " +  
   " AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    " + 
   " AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE  " +   
   " AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE  " +    
   " union all   " + 
   " SELECT " +   
   " ENPLANWORK.CODE  as pCode " + 
   ", TKTRANSPORT.CODE   as transportCode " +  
   ", TKTRANSPORT.NAME as transportName " + 
   ", (select coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') from enelementdata where enelementdata.ecode = enelement.code ) as elementName " +   
   ", ENWORKORDER.WORKORDERNUMBER as workOrder  " +   
   ", FINMOLDATA.FINMOLNAME as finMolName " + 
   ", FINEXECUTOR.NAME  as finExecutor  " + 
   ", ENPLANWORKKIND.CODE   as kindCode " + 
   ", ENPLANWORKKIND.NAME   as kindName " + 
   ", ENDEPARTMENT.NAME    as departmentName " + 
   " FROM   " +   
   " ENELEMENT " +   
   ", ENWORKORDER  join   FINMOLDATA  on (FINMOLDATA.workordercode = ENWORKORDER.CODE AND FINMOLDATA.MOLTYPEREFCODE = 1) " + 
   ", ENWORKORDER2ENPLANWORK  " +     
   ", FINEXECUTOR        " +  
   ", ENTRANSPORTITEM " + 
   "  LEFT JOIN entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = ENTRANSPORTITEM.code) " + 
   "  left join ENTRNSPRTRDR2TRNSPRTTM on (ENTRANSPORTITEM.code = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE) " + 
   "  left join entransprttm2trnsprttm on (entransprttm2trnsprttm.outrefcode = ENTRANSPORTITEM.code) " + 
   "  join TKTRANSPORT on (TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE and TKTRANSPORT.TRANSPORTCLASSIFICTNCD = ?) " + 
   "  join ENPLANWORKITEM on (ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE AND ENPLANWORKITEM.COUNTGEN > 0 ) " + 
   "  join ENPLANWORK on (ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE  " + 
   "                      and ENPLANWORK.KINDCODE = 4 " + 
   "                      and ENPLANWORK.STATUSCODE = 1 " + 
   "                      and ENPLANWORK.DATESTART >= ?   "+  
   "                      AND ENPLANWORK.DATESTART <= ? " + 
   "                      and enplanwork.departmentrefcode in    " +  
   "	                        (select entransportdep2dep.departmentcode from entransportdep2dep    " +   
   "                       where  entransportdep2dep.transportdepartmentcod = ?) ) " + 
   "  join ENDEPARTMENT on (ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ) " + 
   "  join ENPLANWORKKIND on (ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE ) " +    
   " WHERE    " + 
   "   entravlshttm2trnsprttm.transportitemrefcode is null  " +
   " AND  ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE is NULL " + 
   " and  entransprttm2trnsprttm.outrefcode is null " + 
   " AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE " +    
   " AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    " + 
   " AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE   " +  
   " AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE ) as unordered_query " + 
" group by pCode,  transportCode, transportName,  elementName, workOrder, finMolName, finExecutor, kindCode, kindName, departmentName " + 
" order by 5, 1  "; 
   
/////   
   
   

   try
    {
	 
     statement = connection.prepareStatement(selectStr);
     int number = 0;
    
     statement.setInt(1, transportCode);
     statement.setDate(2, new java.sql.Date(orderDateStart.getTime()));
     statement.setDate(3, new java.sql.Date(orderDateFinal.getTime()));
     statement.setInt(4, transportDepartmentCode);
     
     statement.setInt(5, transportCode);
     statement.setDate(6, new java.sql.Date(orderDateStart.getTime()));
     statement.setDate(7, new java.sql.Date(orderDateFinal.getTime()));

     statement.setInt(8, transportDepartmentCode);
     
     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
      
       anObject = new ENTransportOrderShort();

       anObject.code = Integer.MIN_VALUE;	
       anObject.planRefCode = set.getInt(1);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;
		
       anObject.transportCode = set.getInt(2);
		if(set.wasNull())
		   anObject.transportCode = Integer.MIN_VALUE;	
	   anObject.transportName = set.getString(3);	
       anObject.elementName = set.getString(4);
       anObject.planRefWorkOrderNumber = set.getString(5);
       anObject.finMOLName = set.getString(6);
       anObject.finExecutor = set.getString(7);
       anObject.planRefKindCode = set.getInt(8);
       anObject.planRefKindName = set.getString(9);
       anObject.planRefDepartmentName = set.getString(10);
       
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

  public ENTransportOrderShortList getGroupedTransportListByDateAndDepartment(Date orderDateStart,Date orderDateFinal, int transportDepartmentCode) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
//   selectStr = " SELECT  \n" +
//   "               pCode, \n" +
//   "               transportCode, \n" +
//   "               transportName, \n" +
//   "               elementName, \n" +
//   "               workOrder,    \n" +
//   "               finMolName,  \n" +
//   "               finExecutor,  \n" +
//   "      		  kindCode, \n" +
//   "               kindName, \n" +
//   "               departmentName FROM \n" +
//   "  (SELECT   \n" +
//   "                 ENPLANWORK.CODE  as pCode \n" +
//   "                , TKTRANSPORT.CODE   as transportCode \n" +
//   "                , TKTRANSPORT.NAME as transportName \n" +
//   "                ,  coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') as elementName    \n" +
//   "                , ENWORKORDER.WORKORDERNUMBER||' ('||to_char(ENWORKORDER.DATEGEN,'dd.mm.yyyy')||')' as workOrder    \n" +
//   "                , FINMOLDATA.FINMOLNAME as finMolName  \n" +
//   "                , FINEXECUTOR.NAME  as finExecutor  \n" +
//   "      		  , ENPLANWORKKIND.CODE   as kindCode \n" +
//   "                , ENPLANWORKKIND.NAME   as kindName \n" +
//   "                , ENDEPARTMENT.NAME    as departmentName \n" +
//   "                  \n" +
//   "                FROM     \n" +
//   "                 ENPLANWORK     \n" +
//   "               , ENPLANWORKITEM     \n" +
//   "               , TKTRANSPORT    \n" +
//   "               , ENTRANSPORTITEM     \n" +
//   "               , ENELEMENTDATA    \n" +
//   "               , ENWORKORDER    \n" +
//   "               , ENWORKORDER2ENPLANWORK     \n" +
//   "               , FINMOLDATA    \n" +
//   "               , FINEXECUTOR    \n" +
//   "               , ENPLANWORKKIND    \n" +
//   "               , ENDEPARTMENT      \n" +
//   "               WHERE    \n" +
//   "            TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE     \n" +
//   "            AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE    \n" +
//   "            AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE    \n" +
//   "            AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE    \n" +
//   "       	  AND ENTRANSPORTITEM.CODE not in (select transportitemrefcode from entravlshttm2trnsprttm)    \n" +
//   "            AND ENPLANWORKITEM.COUNTGEN > 0      \n" +
//   "            AND ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE    \n" +
//   "            AND ENTRANSPORTITEM.CODE NOT IN     \n" +
//   "            (SELECT ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE FROM ENTRNSPRTRDR2TRNSPRTTM)    \n" +
//   "            AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE    \n" +
//   "            AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    \n" +
//   "            AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE    \n" +
//   "            AND FINMOLDATA.workordercode = ENWORKORDER.CODE    \n" +
//   "      	  AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE    \n" +
//   "            and ((ENPLANWORK.KINDCODE =    3  \n" +
//   "            and ENPLANWORK.STATUSCODE in  (1,3)  )      \n" +
//   "      )    \n" +
//   "       	  AND FINMOLDATA.MOLTYPEREFCODE = 1 \n" +
//   "            AND ENPLANWORK.DATESTART >= ?    \n" +
//   "            AND ENPLANWORK.DATESTART <= ?    \n" +
//   "            and enplanwork.departmentrefcode in     \n" +
//   "           	 (select      \n" +
//   "           		 entransportdep2dep.departmentcode      \n" +
//   "                 from     \n" +
//   "                	 entransportdep2dep      \n" +
//   "                 where      \n" +
//   "                	 entransportdep2dep.transportdepartmentcod = ?)    \n" +
//   "                   \n" +
//   "                   \n" +
//   "           union all      \n" +
//   "            \n" +
//   "            \n" +
//   "            SELECT   \n" +
//   "                 ENPLANWORK.CODE  as pCode \n" +
//   "                , TKTRANSPORT.CODE   as transportCode \n" +
//   "                , TKTRANSPORT.NAME as transportName \n" +
//   "                ,  coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') as elementName    \n" +
//   "                , ENWORKORDER.WORKORDERNUMBER as workOrder    \n" +
//   "                , FINMOLDATA.FINMOLNAME as finMolName  \n" +
//   "                , FINEXECUTOR.NAME  as finExecutor  \n" +
//   "      		  , ENPLANWORKKIND.CODE   as kindCode \n" +
//   "                , ENPLANWORKKIND.NAME   as kindName \n" +
//   "                , ENDEPARTMENT.NAME    as departmentName  \n" +
//   "                  \n" +
//   "                FROM     \n" +
//   "                 ENPLANWORK     \n" +
//   "               , ENPLANWORKITEM     \n" +
//   "               , TKTRANSPORT    \n" +
//   "               , ENTRANSPORTITEM     \n" +
//   "               , ENELEMENTDATA    \n" +
//   "               , ENWORKORDER    \n" +
//   "               , ENWORKORDER2ENPLANWORK     \n" +
//   "               , FINMOLDATA    \n" +
//   "               , FINEXECUTOR    \n" +
//   "               , ENPLANWORKKIND    \n" +
//   "               , ENDEPARTMENT      \n" +
//   "               WHERE    \n" +
//   "            TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE     \n" +
//   "            AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE    \n" +
//   "            AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE    \n" +
//   "            AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE    \n" +
//   "       	  AND ENTRANSPORTITEM.CODE not in (select transportitemrefcode from entravlshttm2trnsprttm)    \n" +
//   "            AND ENPLANWORKITEM.COUNTGEN > 0      \n" +
//   "            AND ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE    \n" +
//   "            AND ENTRANSPORTITEM.CODE NOT IN     \n" +
//   "            (SELECT ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE FROM ENTRNSPRTRDR2TRNSPRTTM)    \n" +
//   "            AND ENELEMENTDATA.ECODE = ENPLANWORK.ELEMENTREFCODE    \n" +
//   "            AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    \n" +
//   "            AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE    \n" +
//   "            AND FINMOLDATA.workordercode = ENWORKORDER.CODE    \n" +
//   "      	  AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE    \n" +
//   "            and ((ENPLANWORK.KINDCODE =    4  \n" +
//   "            and ENPLANWORK.STATUSCODE = 1 )      \n" +
//   "      )    \n" +
//   "       	  AND FINMOLDATA.MOLTYPEREFCODE = 1 \n" +
//   "            AND ENPLANWORK.DATESTART >= ?   \n" +
//   "            AND ENPLANWORK.DATESTART <= ? \n" +
//   "            and enplanwork.departmentrefcode in     \n" +
//   "           	 (select      \n" +
//   "           		 entransportdep2dep.departmentcode      \n" +
//   "                 from     \n" +
//   "                	 entransportdep2dep      \n" +
//   "                 where      \n" +
//   "                	 entransportdep2dep.transportdepartmentcod = ?) \n" +
//   "            and entransportitem.code not in (select entransprttm2trnsprttm.outrefcode from entransprttm2trnsprttm)) as unordered_query \n" +
//   "                     \n" +
//   "                      \n" +
//   "          group by pCode, \n" +
//   "               transportCode, \n" +
//   "               transportName, \n" +
//   "               elementName,    \n" +
//   "               workOrder,    \n" +
//   "               finMolName,  \n" +
//   "               finExecutor,  \n" +
//   "      		  kindCode, \n" +
//   "               kindName, \n" +
//   "               departmentName \n" +
//   "          order by 5, 1;  \n" +
//   "  \n";

////Небольшая оптимизация после перехода на ПГ 9.1

   selectStr =   " SELECT  " + 
  " pCode, " +
  " transportCode, " +
  " transportName, " +
  " elementName, " +
  " workOrder,    " +
  " finMolName,  " +
  " finExecutor,  " +
  " kindCode, " +
  " kindName, " +
  " departmentName," +
  " phonenumber " +
  " FROM " +
  " (SELECT   " + 
  "   ENPLANWORK.CODE  as pCode " + 
  "  , TKTRANSPORT.CODE   as transportCode " +
  "  , TKTRANSPORT.NAME as transportName " + 
  " ,(select coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') from enelementdata where enelementdata.ecode = enelement.code ) as elementName  " +  
  " , ENWORKORDER.WORKORDERNUMBER as workOrder " +   
  " , FINMOLDATA.FINMOLNAME as finMolName " + 
  " , FINEXECUTOR.NAME  as finExecutor " +   
  " , ENPLANWORKKIND.CODE   as kindCode " + 
  " , ENPLANWORKKIND.NAME   as kindName " + 
  " , ENDEPARTMENT.NAME    as departmentName " +
	 ", (select mol1.phonenumber from enmol as mol1 WHERE mol1.fincode = FINMOLDATA.FINMOLCODE) as phonenumber " +
  " FROM " +      
   "  ENELEMENT  " +  
   " , ENWORKORDER  join   FINMOLDATA  on (FINMOLDATA.workordercode = ENWORKORDER.CODE AND FINMOLDATA.MOLTYPEREFCODE = 1) " + 
   ", ENWORKORDER2ENPLANWORK   " +    
   ", FINEXECUTOR " +         
   ", ENTRANSPORTITEM LEFT JOIN entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = ENTRANSPORTITEM.code) "  +
   "  left join ENTRNSPRTRDR2TRNSPRTTM on (ENTRANSPORTITEM.code = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE) " + 
   " join TKTRANSPORT on (TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE) " + 
   " join ENPLANWORKITEM on (ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE AND ENPLANWORKITEM.COUNTGEN > 0 ) " + 
   " join ENPLANWORK on (ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE  " + 
   "                      and ENPLANWORK.KINDCODE = 3  " + 
   "                     and ENPLANWORK.STATUSCODE in (1,3) " + 
   "                     and ENPLANWORK.DATESTART >= ? " + 
   "                     AND ENPLANWORK.DATESTART <= ? " + 
   "                     and enplanwork.departmentrefcode in   " +   
   "  	                  (select entransportdep2dep.departmentcode from entransportdep2dep " +   
   "                       where  entransportdep2dep.transportdepartmentcod = ?) ) " + 
   "  join ENDEPARTMENT on (ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ) " + 
   "  join ENPLANWORKKIND on (ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE ) " + 
   "  WHERE    " + 
   "  entravlshttm2trnsprttm.transportitemrefcode is null  " + 
   " AND  ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE is NULL " +   
   " AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE   " +  
   " AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    " + 
   " AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE  " +   
   " AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE  " +    
   " union all   " + 
   " SELECT " +   
   " ENPLANWORK.CODE  as pCode " + 
   ", TKTRANSPORT.CODE   as transportCode " +  
   ", TKTRANSPORT.NAME as transportName " + 
   ", (select coalesce(ENELEMENTDATA.ENAME,'') || ' інв.№ ' || coalesce(ENELEMENTDATA.INVNUMBER,'') from enelementdata where enelementdata.ecode = enelement.code ) as elementName " +   
   ", ENWORKORDER.WORKORDERNUMBER as workOrder  " +   
   ", FINMOLDATA.FINMOLNAME as finMolName " + 
   ", FINEXECUTOR.NAME  as finExecutor  " + 
   ", ENPLANWORKKIND.CODE   as kindCode " + 
   ", ENPLANWORKKIND.NAME   as kindName " + 
   ", ENDEPARTMENT.NAME    as departmentName " + 
   ", (select mol1.phonenumber from enmol as mol1 WHERE mol1.fincode = FINMOLDATA.FINMOLCODE) as phonenumber " +
   " FROM   " +   
   " ENELEMENT " +   
   ", ENWORKORDER  join   FINMOLDATA  on (FINMOLDATA.workordercode = ENWORKORDER.CODE AND FINMOLDATA.MOLTYPEREFCODE = 1) " + 
   ", ENWORKORDER2ENPLANWORK  " +     
   ", FINEXECUTOR        " +  
   ", ENTRANSPORTITEM " + 
   "  LEFT JOIN entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = ENTRANSPORTITEM.code) " + 
   "  left join ENTRNSPRTRDR2TRNSPRTTM on (ENTRANSPORTITEM.code = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE) " + 
   "  left join entransprttm2trnsprttm on (entransprttm2trnsprttm.outrefcode = ENTRANSPORTITEM.code) " + 
   "  join TKTRANSPORT on (TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE) " + 
   "  join ENPLANWORKITEM on (ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE AND ENPLANWORKITEM.COUNTGEN > 0 ) " + 
   "  join ENPLANWORK on (ENTRANSPORTITEM.PLANREFCODE = ENPLANWORK.CODE  " + 
   "                      and ENPLANWORK.KINDCODE = 4 " + 
   "                      and ENPLANWORK.STATUSCODE = 1 " + 
   "                      and ENPLANWORK.DATESTART >= ?   "+  
   "                      AND ENPLANWORK.DATESTART <= ? " + 
   "                      and enplanwork.departmentrefcode in    " +  
   "	                        (select entransportdep2dep.departmentcode from entransportdep2dep    " +   
   "                       where  entransportdep2dep.transportdepartmentcod = ?) ) " + 
   "  join ENDEPARTMENT on (ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ) " + 
   "  join ENPLANWORKKIND on (ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE ) " +    
   " WHERE    " + 
   "   entravlshttm2trnsprttm.transportitemrefcode is null  " +
   " AND  ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE is NULL " + 
   " and  entransprttm2trnsprttm.outrefcode is null " + 
   " AND ENELEMENT.CODE = ENPLANWORK.ELEMENTREFCODE " +    
   " AND ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE    " + 
   " AND ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE   " +  
   " AND FINEXECUTOR.CODE = ENPLANWORK.FINEXECUTORCODE ) as unordered_query " + 
" group by pCode,  transportCode, transportName,  elementName, workOrder, finMolName, finExecutor, kindCode, kindName, departmentName, phoneNumber " + 
" order by 5, 1  "; 
   
///// 

   try
    {
	 
     statement = connection.prepareStatement(selectStr);
     int number = 0;
    
     statement.setDate(1, new java.sql.Date(orderDateStart.getTime()));
     statement.setDate(2, new java.sql.Date(orderDateFinal.getTime()));
     
     statement.setInt(3, transportDepartmentCode);
     
     statement.setDate(4, new java.sql.Date(orderDateStart.getTime()));
     statement.setDate(5, new java.sql.Date(orderDateFinal.getTime())); 
     statement.setInt(6, transportDepartmentCode);
     
     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
      
       anObject = new ENTransportOrderShort();

       anObject.code = Integer.MIN_VALUE;	
       anObject.planRefCode = set.getInt(1);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;
		
       anObject.transportCode = set.getInt(2);
		if(set.wasNull())
		   anObject.transportCode = Integer.MIN_VALUE;	
	   anObject.transportName = set.getString(3);	
       anObject.elementName = set.getString(4);
       anObject.planRefWorkOrderNumber = set.getString(5);
       anObject.finMOLName = set.getString(6);
       anObject.finExecutor = set.getString(7);
       anObject.planRefKindCode = set.getInt(8);
       anObject.planRefKindName = set.getString(9);
       anObject.planRefDepartmentName = set.getString(10);
       anObject.finMolPhoneNumber = set.getString(11);
       
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
  
  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENTRANSPORTORDER.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENTRANSPORTORDER.CODE"+
    ",ENTRANSPORTORDER.NUMBERGEN"+
    ",ENTRANSPORTORDER.TIMESTART"+
    ",ENTRANSPORTORDER.TIMEFINAL"+
    ",ENTRANSPORTORDER.DATESTART"+
    ",ENTRANSPORTORDER.DATEFINAL"+
    ",ENTRANSPORTORDER.DATEEDIT"+
    ",ENTRANSPORTORDER.USERGEN"+
     ", ENTRANSPORTORDERSTATUS.CODE " +
     ", ENTRANSPORTORDERSTATUS.NAME " +
     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.YEARORIGINAL " +
     ", ENPLANWORK.MONTHORIGINAL " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORK.WORKORDERNUMBER " +
     ", ENPLANWORK.DATEWORKORDER " +
     ", ENPLANWORK.PRICONNECTIONNUMBER " +
     ", ENPLANWORK.SERVICESFSIDEFINID " +
     ", ENPLANWORK.SERVICESFSIDECNNUM " +
     ", TKTRANSPORT.CODE " +
     ", TKTRANSPORT.NAME " +
     ", (select tktransportreal.code from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.name from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.invnumber from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.gosnumber from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     //", TKTRANSPORTREAL.CODE " +
     //", TKTRANSPORTREAL.NAME " +
     //", TKTRANSPORTREAL.INVNUMBER " +
     //", TKTRANSPORTREAL.GOSNUMBER " +
     ", ENTRANSPORTDEPARTMENT.CODE " +
     ", ENTRANSPORTDEPARTMENT.NAME " +
     ", (select (ename||' інв. № '||coalesce(invnumber,'б/н')) from enelementdata where ecode = ENPLANWORK.ELEMENTREFCODE) as elementname" + 
     ", (select finexecutor.name from finexecutor where finexecutor.code = ENPLANWORK.FINEXECUTORCODE) " +
     ", (select finmoldata.finmolname from finmoldata where finmoldata.workordercode = ENWORKORDER.CODE and finmoldata.moltyperefcode = " +FINMolType.MASTER+ ")" +
     ", ENPLANWORKKIND.CODE " +
     ", ENPLANWORKKIND.NAME " +
     ", ENDEPARTMENT.NAME " +
     ", (select entravelsheet.code from entransportorder2travl , entravelsheet where  entransportorder2travl.transportordercode = entransportorder.code and entransportorder2travl.travelsheetcode = entravelsheet.code )" +   
     ", (select entravelsheet.numbergen from entransportorder2travl , entravelsheet where  entransportorder2travl.transportordercode = entransportorder.code and entransportorder2travl.travelsheetcode = entravelsheet.code )" +      
     ", ENTRANSPORTORDER.ISASSIGNMENT " + 
     ", ENTRANSPORTORDER.PARENTREFCODE " +
	 ", ENTRANSPORTORDER.ISAPPROVED " +
	 ", ENTRANSPORTORDER.ISREJECTED " +
	 ", (select mol1.phonenumber from finmoldata as moldata1 inner join enmol as mol1 on mol1.fincode = moldata1.finmolcode where moldata1.workordercode = ENWORKORDER.CODE and moldata1.moltyperefcode = " +FINMolType.MASTER+ ") as phonenumber " +
     ", (select string_agg(finmoldata.finmolcode,',') from finmoldata where finmoldata.workordercode = ENWORKORDER.CODE and finmoldata.moltyperefcode = " +FINMolType.MECHANIC + ")" +
	 ", (select min(encheckpointpasslisttm.dateevent) from entransportorder2travl, encheckpointpasslisttm where entransportorder2travl.travelsheetcode = encheckpointpasslisttm.travelsheetrefcode and entransportorder2travl.transportordercode = entransportorder.code and encheckpointpasslisttm.eventtyperefcode = 1) " + 
     ", (select max(encheckpointpasslisttm.dateevent) from entransportorder2travl, encheckpointpasslisttm where entransportorder2travl.travelsheetcode = encheckpointpasslisttm.travelsheetrefcode and entransportorder2travl.transportordercode = entransportorder.code and encheckpointpasslisttm.eventtyperefcode = 2) " +
   " FROM ENTRANSPORTORDER " +
    ", ENTRANSPORTORDERSTATUS " +
    ", ENPLANWORK " +
    ", ENPLANWORKKIND " +
    ", ENWORKORDER2ENPLANWORK " +
    ", ENWORKORDER " +
    ", TKTRANSPORT " +
   // ", TKTRANSPORTREAL " +
    ", ENTRANSPORTDEPARTMENT " +
    ", ENDEPARTMENT " +
    //" WHERE " 
	""; 
    whereStr = " ENTRANSPORTORDERSTATUS.CODE = ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENTRANSPORTORDER.PLANREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE" ;
     whereStr = whereStr +" AND TKTRANSPORT.CODE = ENTRANSPORTORDER.TRANSPORTCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENWORKORDER2ENPLANWORK.PLANCODE" ; //+
     whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE" ; //+
     //whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRANSPORTORDER.TRANSPORTREALCODE" ; //+
     whereStr = whereStr +" AND ENTRANSPORTDEPARTMENT.CODE = ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD" ; //+
     whereStr = whereStr +" AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE" ; //+
		//selectStr = selectStr + " ${s} ENTRANSPORTORDER.CODE IN ( SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.CODE = ?";
       }
        if (aFilterObject.numbergen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.timeStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.TIMESTART = ?";
       }
       if(aFilterObject.timeFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.TIMEFINAL = ?";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATEFINAL = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.COMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATEEDIT = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.USERGEN) LIKE UPPER(?)";
        }
       
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.MODIFY_TIME = ?";
       }
       if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD = ? ";
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.PLANREFCODE = ? ";
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTCODE = ? ";
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTREALCODE = ? ";
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD = ? ";
       }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.PARENTREFCODE = ?";
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

          if(aFilterObject.numbergen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.numbergen);
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
       if(aFilterObject.dateStart != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
       }
       if(aFilterObject.dateFinal != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
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
      if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportOrderStatus.code);
      }
      if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planRef.code);
      }
      if(aFilterObject.transport.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transport.code);
      }
      if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportReal.code);
      }
      if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportDepartment.code);
      }
      if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.parentRef.code);
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

       anObject = new ENTransportOrderShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.numbergen = set.getString(2);
       anObject.timeStart = set.getTimestamp(3);		
       anObject.timeFinal = set.getTimestamp(4);		
       anObject.dateStart = set.getTimestamp(5);		
       anObject.dateFinal = set.getTimestamp(6);		
       anObject.dateEdit = set.getTimestamp(7);		
       anObject.userGen = set.getString(8);

       anObject.transportOrderStatusCode = set.getInt(9);
		if(set.wasNull())
		   anObject.transportOrderStatusCode = Integer.MIN_VALUE;		
       anObject.transportOrderStatusName = set.getString(10);
       anObject.planRefCode = set.getInt(11);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;		
       anObject.planRefDateGen = set.getDate(12);
       anObject.planRefDateStart = set.getDate(13);
       anObject.planRefDateFinal = set.getDate(14);
       anObject.planRefYearGen = set.getInt(15);
		if(set.wasNull())
		   anObject.planRefYearGen = Integer.MIN_VALUE;		
       anObject.planRefMonthGen = set.getInt(16);
		if(set.wasNull())
		   anObject.planRefMonthGen = Integer.MIN_VALUE;		
       anObject.planRefYearOriginal = set.getInt(17);
		if(set.wasNull())
		   anObject.planRefYearOriginal = Integer.MIN_VALUE;		
       anObject.planRefMonthOriginal = set.getInt(18);
		if(set.wasNull())
		   anObject.planRefMonthOriginal = Integer.MIN_VALUE;		
       anObject.planRefUserGen = set.getString(19);
       anObject.planRefDateEdit = set.getDate(20);
       anObject.planRefWorkOrderNumber = set.getString(21);
       anObject.planRefDateWorkOrder = set.getDate(22);
       anObject.planRefPriConnectionNumber = set.getString(23);
       anObject.planRefServicesFSideFinId = set.getInt(24);
		if(set.wasNull())
		   anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;		
       anObject.planRefServicesFSideCnNum = set.getString(25);
       anObject.transportCode = set.getInt(26);
		if(set.wasNull())
		   anObject.transportCode = Integer.MIN_VALUE;		
       anObject.transportName = set.getString(27);
       anObject.transportRealCode = set.getInt(28);
		if(set.wasNull())
		   anObject.transportRealCode = Integer.MIN_VALUE;		
       anObject.transportRealName = set.getString(29);
       anObject.transportRealInvNumber = set.getString(30);
       anObject.transportRealGosNumber = set.getString(31);
       anObject.transportDepartmentCode = set.getInt(32);
		if(set.wasNull())
		   anObject.transportDepartmentCode = Integer.MIN_VALUE;		
       anObject.transportDepartmentName = set.getString(33);
       
       anObject.elementName = set.getString(34);
       anObject.finExecutor = set.getString(35);
       anObject.finMOLName = set.getString(36);
       anObject.planRefKindCode = set.getInt(37);
       anObject.planRefKindName = set.getString(38);
       anObject.planRefDepartmentName = set.getString(39);
       anObject.travelSheetCode = set.getInt(40);
       anObject.travelSheetNumber = set.getString(41);
       anObject.isAssignment = set.getInt(42);
		if(set.wasNull())
			   anObject.isAssignment = Integer.MIN_VALUE;	
       anObject.parentRefCode = set.getInt(43);
		if(set.wasNull())
		   anObject.parentRefCode = Integer.MIN_VALUE;	
	   anObject.isApproved = set.getInt(44);
		if(set.wasNull())
			   anObject.isApproved = Integer.MIN_VALUE;	   
	   anObject.isRejected = set.getInt(45);
		if(set.wasNull())
			   anObject.isRejected = Integer.MIN_VALUE;
		
		anObject.finMolPhoneNumber = set.getString(46);
		anObject.mechanicFinMolCode = set.getString(47);
       
	    anObject.minRideOut = set.getTimestamp(48);		
	    anObject.maxRideIn = set.getTimestamp(49);	
		
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
   * Возвращает short для ENTransportOrder без учета сегрегации по коду <b>anObjectCode</b>
   */
  public ENTransportOrderShort getShortObjectWithoutSegregation(int anObjectCode) throws PersistenceException
  {
   ENTransportOrderFilter filterObject = new ENTransportOrderFilter();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredListWithoutSegregation(filterObject).list;
   if(list.size() > 0)
    return (ENTransportOrderShort)list.get(0);
   return null;
  }   
  
  public ENTransportOrderShortList getFilteredListWithoutSegregation(ENTransportOrderFilter filterObject) throws PersistenceException
  {   
   return getScrollableFilteredListWithoutSegregation(filterObject,0,-1);
  }

  /**
   * 
   * Возвращает лист с транспортными заявками, в кот. заполненно 2 поля: transportCode, transportName
   * 
   * @param aFilterObject фильтр заявок для выборки используются только transportDepartment.code, dateStart, dateFinal
   * @param fromPosition с какой позиции начать
   * @param quantity количество ENTransportOrderShortList
   * @return лист транспортных завок
   * @throws PersistenceException
   */
  public ENTransportOrderShortList getListOfNormTransport(ENTransportOrderFilter aFilterObject, int fromPosition,int quantity) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(aFilterObject.conditionSQL);
   String     orderBy = processCondition(aFilterObject.orderBySQL);
	
   if(orderBy.length() == 0)
    orderBy =     "			(select \n" +
    "				tr1.transportclassifictncd \n" +
    "			from \n" +
    "				tktransport as tr1 \n" +
    "			where tr1.code = transportcode) \n";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
  /* selectStr = " select distinct " +
   		" tktransport.code " + 
   		", tktransport.name " + 
   		" from " +
   		" tktransport left join entransportorder on tktransport.code = entransportorder.transportcode "; */
   
//   selectStr = " select \n" +
//   					" (select \n" +
//   					"		tr1.transportclassifictncd \n" +
//   					"	from \n" +
//   					"		tktransport as tr1 \n" +
//   					"	where \n" +
//   					"		tr1.code = transportcode) \n" +
//   				", 	(select \n" +
//   				"			trcl.name \n" +
//   				"	from \n" +
//   				"			tktransport as tr1, \n" +
//   				"			tktransportclassifictn as trcl \n" +
//   				"	where \n" +
//   				"			trcl.code = tr1.transportclassifictncd \n" +
//   				"			and tr1.code = transportcode) \n" +
//   				",  sum(tr_plan) \n" + 
//   				", sum(tr_plan) - sum(tr_work) \n" +
//   		" from  tktransport,  ( \n" +
//   		
//   " 		select \n" +
//   " 			entransportitem.transportcode \n" +
//   ", 			count(distinct enplanwork.code) as tr_plan \n" +
//   ", 			0 as tr_work \n" +
//   " 		from \n" +
//   " 			entransportitem \n" +
//   ", 			enplanwork \n" +
//   ", 			enworkorder2enplanwork \n" +
//   ", 			finmoldata \n" +
//   ", 			enplanworkitem \n" +
//   " 			where \n" +
//   " 			enplanworkitem.code =  \n" +
//   " 			entransportitem.planitemrefcode \n" +
//   " 			and enplanwork.departmentrefcode in \n" +
//   " 							(select entransportdep2dep.departmentcode \n" +
//   " 							from entransportdep2dep       \n" +
//   " 							where entransportdep2dep.transportdepartmentcod =   ?  ) \n" +
//   " 			and enplanwork.datestart >= ? \n" +
//   " 			and enplanwork.datestart <= ? \n" +
//   " 			and enplanwork.finexecutorcode is not null \n" +
//   "    		and enplanwork.kindcode = 3 \n" +
//   " 			and enplanwork.statuscode in (1,3) \n" +
//   " 			and entransportitem.code not in \n" + 
//   " 									(select \n" +
//   " 										entrnsprtrdr2trnsprttm.transportitemcode \n" + 
//   " 									from entrnsprtrdr2trnsprttm) \n" +
//   "    		and entransportitem.code not in \n" +
//   " 								(select q.transportitemrefcode \n" +
//   " 										from entravlshttm2trnsprttm q) \n" +
//   "    		and enplanwork.code = enworkorder2enplanwork.plancode \n" + 
//   " 			and finmoldata.workordercode = enworkorder2enplanwork.WORKORDERCODE \n" +
//   "    		and enplanworkitem.planrefcode = enplanwork.code \n" + 
//   " 			and enplanworkitem.countgen <> 0 \n" +
//   "    	group by  entransportitem.transportcode \n" +
//   "  \n" +
//   
//   "    union all  \n" +
//   
//   "    	select \n" +
//   " 			entransportitem.transportcode, \n" +
//   " 			count (distinct enplanwork.code) as tr_plan, \n" +
//   " 			0 as tr_work \n" +
//   "    	from \n" +
//   " 			entransportitem, \n" +
//   "			enplanwork, \n" +
//   "			enworkorder2enplanwork, \n" +
//   "			finmoldata, enplanworkitem \n" +
//   "		where \n" +
//   "			enplanworkitem.code = entransportitem.planitemrefcode \n" +
//   "        	and enplanwork.departmentrefcode in \n" +
//   "									(select \n" +
//   "										entransportdep2dep.departmentcode \n" +
//   "									from \n" +
//   "										entransportdep2dep \n" +
//   "									where  \n" +
//   " 										entransportdep2dep.transportdepartmentcod = ?  ) \n" +
//   " 			and enplanwork.datestart >= ? \n" +
//   "			and enplanwork.datestart <= ? \n" +
//   "			and enplanwork.code =  enworkorder2enplanwork.plancode \n" +
//   "      		and enplanwork.kindcode = 4 \n" +
//   "			and enplanwork.statuscode = 1 \n" +
//   "    		and entransportitem.code not in \n" +
//   "								(select \n" +
//   "									q.transportitemrefcode \n" +
//   "								from \n" +
//   "									entravlshttm2trnsprttm q) \n" +
//   "    		and finmoldata.workordercode = enworkorder2enplanwork.WORKORDERCODE \n" +
//   "    		and enplanworkitem.planrefcode = enplanwork.code \n" +
//   "			and enplanworkitem.countgen <> 0 \n" +
//   "			and entransportitem.code not in \n" +
//   "										(select  \n" +
//   " 											entransprttm2trnsprttm.outrefcode \n" +
//   "										from entransprttm2trnsprttm) \n" +
//   "			and entransportitem.code not in " +
//   "										(select " +
//   "											entrnsprtrdr2trnsprttm.transportitemcode " +
//   "										from  \n" +
//   " 											entrnsprtrdr2trnsprttm) \n" +
//   " 		group by  entransportitem.transportcode  \n" +
//   
//   "    union all  \n" +
//   
//   "    	select \n" +
//   "		  	entransportorder.transportcode, \n" +
//   "			count(entransportorder.code) as tr_plan, \n" +
//   "			0 as tr_work \n" +
//   "    	from \n" +
//   " 			entransportorder \n" +
//   "		where \n" +
//   "			entransportorder.transportdepartmentcod = ? \n" +
//   "    		and to_date(to_char(entransportorder.datestart, 'dd.mm.yyyy'),'dd.mm.yyyy') >= ? \n" +
//   "			and to_date(to_char(entransportorder.datefinal, 'dd.mm.yyyy'),'dd.mm.yyyy') <= ? \n" +
//   "    	group by  entransportorder.transportcode \n" +
//   "  \n" +
//   
//   "    union all \n" +
//   
//   "       	select " +
//   " 			entransportorder.transportcode, \n" +
//   "			0 as tr_plan, \n" +
//   "			count(entransportorder.code) as tr_work \n" +
//   "    	from " +
//   "			entransportorder " +
//   "		where " +
//   "			entransportorder.transportdepartmentcod = ? \n" +
//   "    		and to_date(to_char(entransportorder.datestart, 'dd.mm.yyyy'),'dd.mm.yyyy') >= ? " +
//   "			and to_date(to_char(entransportorder.datefinal, 'dd.mm.yyyy'),'dd.mm.yyyy') <= ? \n" +
//   "    		and entransportorder.transportorderstatuscd in (2,3) \n" +
//   "    	group by  entransportorder.transportcode \n" +
//   "       ) as qqq \n" +
//   " where qqq.transportcode = tktransport.code \n" +
//   "    group by \n" +
//   "			(select \n" +
//   "				tr1.transportclassifictncd \n" +
//   "			from \n" +
//   "				tktransport as tr1 \n" +
//   "			where tr1.code = transportcode), \n" +
//   "			(select \n" +
//   "				trcl.name \n" +
//   "			from \n" +
//   "				tktransport as tr1, \n" +
//   "				tktransportclassifictn  as trcl \n" +
//   "			where \n" +
//   "				trcl.code = tr1.transportclassifictncd \n" +
//   "				and tr1.code = transportcode)  \n";
   
 selectStr =  " select "  +  
		 " (select " + 
			"	tr1.transportclassifictncd  " + 
			" from " + 
			"	tktransport as tr1 " + 
			" where " + 
			"	tr1.code = transportcode) " + 
	        " , 	(select " + 
			"	trcl.name " +
		    " from " +
			"	tktransport as tr1,  " + 
			"	tktransportclassifictn as trcl " + 
		    " where " + 
			"	trcl.code = tr1.transportclassifictncd " + 
			"	and tr1.code = transportcode) " + 
	        " ,  sum(tr_plan) " +  
	        " , sum(tr_plan) - sum(tr_work) " + 
            " from  tktransport, " +
            " (  " +
            " select " + 
            " entransportitem.transportcode " +
            " ,	count(distinct enplanwork.code) as tr_plan " + 
            " , 0 as tr_work " + 
            " from " + 
            " enworkorder2enplanwork " + 
            " , finmoldata " + 
            " , entransportitem left join entrnsprtrdr2trnsprttm on (entrnsprtrdr2trnsprttm.transportitemcode  = entransportitem.code) " + 
            " left join entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = entransportitem.code) " + 
            " join enplanworkitem on (enplanworkitem.code = entransportitem.planitemrefcode and enplanworkitem.countgen <> 0) " + 
            " join enplanwork on (enplanworkitem.planrefcode = enplanwork.code and enplanwork.departmentrefcode in " + 
			"	(select entransportdep2dep.departmentcode " + 
			" 	from entransportdep2dep     " +   
			"	where entransportdep2dep.transportdepartmentcod =  ?  ) " + 
            " and enplanwork.datestart >= ? " + 
            " and enplanwork.datestart <= ? " +   
            " and enplanwork.finexecutorcode is not null " + 
            " and enplanwork.kindcode = 3 " + 
            " and enplanwork.statuscode in (1,3) )" +
            " where entrnsprtrdr2trnsprttm.transportitemcode is NULL " + 
            " and entravlshttm2trnsprttm.transportitemrefcode is null " + 
            " and enplanwork.code = enworkorder2enplanwork.plancode " +   
            " and finmoldata.workordercode = enworkorder2enplanwork.WORKORDERCODE " + 
        " group by  entransportitem.transportcode " + 
" union all  " + 
        " select " + 
" entransportitem.transportcode " + 
" , 			count(distinct enplanwork.code) as tr_plan " + 
" , 			0 as tr_work " + 
" from " + 
" enworkorder2enplanwork " + 
" , 			finmoldata " + 
" , entransportitem left join entrnsprtrdr2trnsprttm on (entrnsprtrdr2trnsprttm.transportitemcode  = entransportitem.code) " +
" left join entravlshttm2trnsprttm on (entravlshttm2trnsprttm.transportitemrefcode = entransportitem.code) " + 
" left join entransprttm2trnsprttm on (entransprttm2trnsprttm.outrefcode = entransportitem.code) " + 
" join enplanworkitem on (enplanworkitem.code = entransportitem.planitemrefcode and enplanworkitem.countgen <> 0) " + 
" join enplanwork on (enplanworkitem.planrefcode = enplanwork.code and " + 
                   "  enplanwork.departmentrefcode in  " + 
				   " (select entransportdep2dep.departmentcode " + 
				   "  from entransportdep2dep " +       
				   " where entransportdep2dep.transportdepartmentcod =  ?  )  " + 
" and enplanwork.datestart >= ?  " + 
" and enplanwork.datestart <= ? " +   
" and enplanwork.finexecutorcode is not null " + 
" and enplanwork.kindcode = 4 " + 
" and enplanwork.statuscode = 1 ) " + 
" where entrnsprtrdr2trnsprttm.transportitemcode is NULL " + 
" and entravlshttm2trnsprttm.transportitemrefcode is null " + 
" and entransprttm2trnsprttm.outrefcode is null " +
" and enplanwork.code = enworkorder2enplanwork.plancode  " + 
" and finmoldata.workordercode = enworkorder2enplanwork.WORKORDERCODE " + 
" group by  entransportitem.transportcode " +

" union all  " + 

" select " + 
" entransportorder.transportcode, " + 
" count(entransportorder.code) as tr_plan, " + 
" 0 as tr_work " + 
" from entransportorder " + 
" where " + 
" entransportorder.transportdepartmentcod = ? " +
" and to_date(to_char(entransportorder.datestart, 'dd.mm.yyyy'),'dd.mm.yyyy') >= ? " + 
" and to_date(to_char(entransportorder.datefinal, 'dd.mm.yyyy'),'dd.mm.yyyy') <= ?  " + 
" group by  entransportorder.transportcode " + 
" union all  " + 
" select " + 
" entransportorder.transportcode, " + 
" 0 as tr_plan, " + 
" count(entransportorder.code) as tr_work " + 
" from  " + 
" entransportorder  " + 
" where  " + 
" entransportorder.transportdepartmentcod = ? " + 
" and to_date(to_char(entransportorder.datestart, 'dd.mm.yyyy'),'dd.mm.yyyy') >= ? " +   
" and to_date(to_char(entransportorder.datefinal, 'dd.mm.yyyy'),'dd.mm.yyyy') <= ? " +  
" and entransportorder.transportorderstatuscd in (2,3) " + 
" group by  entransportorder.transportcode " + 
" ) as qqq " +
" where qqq.transportcode = tktransport.code " + 
" group by " +
" (select " + 
"	tr1.transportclassifictncd " + 
" from " + 
"	tktransport as tr1 " + 
" where tr1.code = transportcode), " + 
" (select " + 
" 	trcl.name " +
" from " +
"	tktransport as tr1, " + 
"	tktransportclassifictn  as trcl " + 
" where " + 
"	trcl.code = tr1.transportclassifictncd " + 
"	and tr1.code = transportcode)" ;
	

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
     
     statement.setInt(1, aFilterObject.transportDepartment.code);
     statement.setDate(2, new java.sql.Date(aFilterObject.dateStart.getTime()));
     statement.setDate(3, new java.sql.Date(aFilterObject.dateFinal.getTime()));
     statement.setInt(4, aFilterObject.transportDepartment.code);
     statement.setDate(5, new java.sql.Date(aFilterObject.dateStart.getTime()));
     statement.setDate(6, new java.sql.Date(aFilterObject.dateFinal.getTime()));
     statement.setInt(7, aFilterObject.transportDepartment.code);
     statement.setDate(8, new java.sql.Date(aFilterObject.dateStart.getTime()));
     statement.setDate(9, new java.sql.Date(aFilterObject.dateFinal.getTime()));
     statement.setInt(10, aFilterObject.transportDepartment.code);
     statement.setDate(11, new java.sql.Date(aFilterObject.dateStart.getTime()));
     statement.setDate(12, new java.sql.Date(aFilterObject.dateFinal.getTime()));

     

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
       
       anObject = new ENTransportOrderShort();
       
       
       
       anObject.transportCode = set.getInt(1);
       if ( set.wasNull() )
    	   anObject.transportCode = Integer.MIN_VALUE;
       anObject.transportName = set.getString(2);
       anObject.unOrderedTransportQty = set.getInt(3);
       if(set.wasNull())
		   anObject.unOrderedTransportQty = Integer.MIN_VALUE;
       
       anObject.orderedTransportQty = set.getInt(4);
       if(set.wasNull())
		   anObject.orderedTransportQty = Integer.MIN_VALUE;

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
   * Возвращает лист с транспортными заявками по заданным условиям без учета сегрегации
   * 
   * @param aFilterObject
   * @param fromPosition
   * @param quantity
   * @return
   * @throws PersistenceException
   */
  public ENTransportOrderShortList getScrollableFilteredListWithoutSegregation(ENTransportOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
  {   
   ENTransportOrderShortList result = new ENTransportOrderShortList();
   ENTransportOrderShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(aFilterObject.conditionSQL);
   String     orderBy = processCondition(aFilterObject.orderBySQL);
	
   if(orderBy.length() == 0)
    orderBy = "ENTRANSPORTORDER.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENTRANSPORTORDER.CODE"+
    ",ENTRANSPORTORDER.NUMBERGEN"+
    ",ENTRANSPORTORDER.TIMESTART"+
    ",ENTRANSPORTORDER.TIMEFINAL"+
    ",ENTRANSPORTORDER.DATESTART"+
    ",ENTRANSPORTORDER.DATEFINAL"+
    ",ENTRANSPORTORDER.DATEEDIT"+
    ",ENTRANSPORTORDER.USERGEN"+
     ", ENTRANSPORTORDERSTATUS.CODE " +
     ", ENTRANSPORTORDERSTATUS.NAME " +
     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.YEARORIGINAL " +
     ", ENPLANWORK.MONTHORIGINAL " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORK.WORKORDERNUMBER " +
     ", ENPLANWORK.DATEWORKORDER " +
     ", ENPLANWORK.PRICONNECTIONNUMBER " +
     ", ENPLANWORK.SERVICESFSIDEFINID " +
     ", ENPLANWORK.SERVICESFSIDECNNUM " +
     ", TKTRANSPORT.CODE " +
     ", TKTRANSPORT.NAME " +
     ", (select tktransportreal.code from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.name from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.invnumber from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     ", (select tktransportreal.gosnumber from tktransportreal where code = ENTRANSPORTORDER.TRANSPORTREALCODE)" +
     //", TKTRANSPORTREAL.CODE " +
     //", TKTRANSPORTREAL.NAME " +
     //", TKTRANSPORTREAL.INVNUMBER " +
     //", TKTRANSPORTREAL.GOSNUMBER " +
     ", ENTRANSPORTDEPARTMENT.CODE " +
     ", ENTRANSPORTDEPARTMENT.NAME " +
     ", (select (ename||' інв. № '||coalesce(invnumber,'б/н')) from enelementdata where ecode = ENPLANWORK.ELEMENTREFCODE) as elementname" + 
     ", (select finexecutor.name from finexecutor where finexecutor.code = ENPLANWORK.FINEXECUTORCODE) " +
     ", (select finmoldata.finmolname from finmoldata where finmoldata.workordercode = ENWORKORDER.CODE and finmoldata.moltyperefcode = " +FINMolType.MASTER+ ")" +
     ", ENPLANWORKKIND.CODE " +
     ", ENPLANWORKKIND.NAME " +
     ", ENDEPARTMENT.NAME " +
     ", (select entravelsheet.code from entransportorder2travl , entravelsheet where  entransportorder2travl.transportordercode = entransportorder.code and entransportorder2travl.travelsheetcode = entravelsheet.code )" +   
     ", (select entravelsheet.numbergen from entransportorder2travl , entravelsheet where  entransportorder2travl.transportordercode = entransportorder.code and entransportorder2travl.travelsheetcode = entravelsheet.code )" +      
     ", ENTRANSPORTORDER.ISASSIGNMENT " + 
     ", ENTRANSPORTORDER.PARENTREFCODE " +
	 ", ENTRANSPORTORDER.ISAPPROVED " + 
	 ", ENTRANSPORTORDER.ISREJECTED " +
	 
	 ", (select o.numbergen from entransportorder o where o.code = ENTRANSPORTORDER.PARENTREFCODE) " +
	 ", ENWORKORDER.WORKORDERNUMBER " +
	 
   " FROM ENTRANSPORTORDER " +
    ", ENTRANSPORTORDERSTATUS " +
    ", ENPLANWORK " +
    ", ENPLANWORKKIND " +
    ", ENWORKORDER2ENPLANWORK " +
    ", ENWORKORDER " +
    ", TKTRANSPORT " +
   // ", TKTRANSPORTREAL " +
    ", ENTRANSPORTDEPARTMENT " +
    ", ENDEPARTMENT " +
    //" WHERE " 
	""; 
    whereStr = " ENTRANSPORTORDERSTATUS.CODE = ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENTRANSPORTORDER.PLANREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE" ;
     whereStr = whereStr +" AND TKTRANSPORT.CODE = ENTRANSPORTORDER.TRANSPORTCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENWORKORDER2ENPLANWORK.PLANCODE" ; //+
     whereStr = whereStr +" AND ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE" ; //+
     //whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRANSPORTORDER.TRANSPORTREALCODE" ; //+
     whereStr = whereStr +" AND ENTRANSPORTDEPARTMENT.CODE = ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD" ; //+
     whereStr = whereStr +" AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE" ; //+
		//selectStr = selectStr + " ${s} ENTRANSPORTORDER.CODE IN ( SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.CODE = ?";
       }
        if (aFilterObject.numbergen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.timeStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.TIMESTART = ?";
       }
       if(aFilterObject.timeFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.TIMEFINAL = ?";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATEFINAL = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.COMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.DATEEDIT = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTRANSPORTORDER.USERGEN) LIKE UPPER(?)";
        }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.MODIFY_TIME = ?";
       }
       if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD = ? ";
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.PLANREFCODE = ? ";
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTCODE = ? ";
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTREALCODE = ? ";
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD = ? ";
       }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTRANSPORTORDER.PARENTREFCODE = ?";
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

          if(aFilterObject.numbergen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.numbergen);
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
       if(aFilterObject.dateStart != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
       }
       if(aFilterObject.dateFinal != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
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
      if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportOrderStatus.code);
      }
      if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planRef.code);
      }
      if(aFilterObject.transport.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transport.code);
      }
      if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportReal.code);
      }
      if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.transportDepartment.code);
      }
      if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.parentRef.code);
      }
     }
     
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

       anObject = new ENTransportOrderShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.numbergen = set.getString(2);
       anObject.timeStart = set.getTimestamp(3);		
       anObject.timeFinal = set.getTimestamp(4);		
       anObject.dateStart = set.getTimestamp(5);		
       anObject.dateFinal = set.getTimestamp(6);		
       anObject.dateEdit = set.getTimestamp(7);		
       anObject.userGen = set.getString(8);

       anObject.transportOrderStatusCode = set.getInt(9);
		if(set.wasNull())
		   anObject.transportOrderStatusCode = Integer.MIN_VALUE;		
       anObject.transportOrderStatusName = set.getString(10);
       anObject.planRefCode = set.getInt(11);
		if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;		
       anObject.planRefDateGen = set.getDate(12);
       anObject.planRefDateStart = set.getDate(13);
       anObject.planRefDateFinal = set.getDate(14);
       anObject.planRefYearGen = set.getInt(15);
		if(set.wasNull())
		   anObject.planRefYearGen = Integer.MIN_VALUE;		
       anObject.planRefMonthGen = set.getInt(16);
		if(set.wasNull())
		   anObject.planRefMonthGen = Integer.MIN_VALUE;		
       anObject.planRefYearOriginal = set.getInt(17);
		if(set.wasNull())
		   anObject.planRefYearOriginal = Integer.MIN_VALUE;		
       anObject.planRefMonthOriginal = set.getInt(18);
		if(set.wasNull())
		   anObject.planRefMonthOriginal = Integer.MIN_VALUE;		
       anObject.planRefUserGen = set.getString(19);
       anObject.planRefDateEdit = set.getDate(20);
       anObject.planRefWorkOrderNumber = set.getString(21);
       anObject.planRefDateWorkOrder = set.getDate(22);
       anObject.planRefPriConnectionNumber = set.getString(23);
       anObject.planRefServicesFSideFinId = set.getInt(24);
		if(set.wasNull())
		   anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;		
       anObject.planRefServicesFSideCnNum = set.getString(25);
       anObject.transportCode = set.getInt(26);
		if(set.wasNull())
		   anObject.transportCode = Integer.MIN_VALUE;		
       anObject.transportName = set.getString(27);
       anObject.transportRealCode = set.getInt(28);
		if(set.wasNull())
		   anObject.transportRealCode = Integer.MIN_VALUE;		
       anObject.transportRealName = set.getString(29);
       anObject.transportRealInvNumber = set.getString(30);
       anObject.transportRealGosNumber = set.getString(31);
       anObject.transportDepartmentCode = set.getInt(32);
		if(set.wasNull())
		   anObject.transportDepartmentCode = Integer.MIN_VALUE;		
       anObject.transportDepartmentName = set.getString(33);
       
       anObject.elementName = set.getString(34);
       anObject.finExecutor = set.getString(35);
       anObject.finMOLName = set.getString(36);
       anObject.planRefKindCode = set.getInt(37);
       anObject.planRefKindName = set.getString(38);
       anObject.planRefDepartmentName = set.getString(39);
       anObject.travelSheetCode = set.getInt(40);
       anObject.travelSheetNumber = set.getString(41);
       anObject.isAssignment = set.getInt(42);
		if(set.wasNull())
			   anObject.isAssignment = Integer.MIN_VALUE;	
       anObject.parentRefCode = set.getInt(43);
		if(set.wasNull())
		   anObject.parentRefCode = Integer.MIN_VALUE;	
	   anObject.isApproved = set.getInt(44);
		if(set.wasNull())
			   anObject.isApproved = Integer.MIN_VALUE;	  
	   anObject.isRejected = set.getInt(45);
		if(set.wasNull())
			   anObject.isRejected = Integer.MIN_VALUE;	 	   
       
		anObject.parentRefNumbergen = set.getString(46);
		anObject.planRefWorkOrderNumber = set.getString(47);

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

  public void removeWithoutSegregation(int uid) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();

   selectStr = "DELETE FROM  ENTRANSPORTORDER WHERE CODE = ?";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   ENTransportOrderShort object = getShortObjectWithoutSegregation(uid);

   if(object == null)
    throw new PersistenceException("{%ENTransportOrder.getObject%} access denied");

   PreparedStatement statement = null;
   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,uid);
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

  public void updateTimeForTransportOrder(int transportOrderCode, Date dateStart, Date dateFinal, Date timeStart, Date timeFinal) throws PersistenceException
  {
  	Connection connection = getConnection();

	String updOrder =
        "UPDATE ENTRANSPORTORDER SET TIMESTART = ? , TIMEFINAL = ? , DATESTART = ? , DATEFINAL = ? " +
        " WHERE CODE = ?";

	PreparedStatement statement = null;

	try
	{
		statement = connection.prepareStatement(updOrder);

        if (timeStart == null)
          statement.setDate(1,null);
        else
          statement.setTimestamp(1,new java.sql.Timestamp(timeStart.getTime()));		
        if (timeFinal == null)
          statement.setDate(2,null);
        else
          statement.setTimestamp(2,new java.sql.Timestamp(timeFinal.getTime()));		
        if (dateStart == null)
          statement.setDate(3,null);
        else
          statement.setTimestamp(3,new java.sql.Timestamp(dateStart.getTime()));		
        if (dateFinal == null)
          statement.setDate(4,null);
        else
          statement.setTimestamp(4,new java.sql.Timestamp(dateFinal.getTime()));			
		
	    statement.setInt(5, transportOrderCode);

	    statement.execute();
	}
  	catch(SQLException e)
  	{
  	  System.out.println(e.getMessage()+"\nstatement - " + updOrder + "\n transportOrderCode = " + transportOrderCode);
  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
  	}
    finally
    {
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     statement = null;
    }	  
  }
  

  public ENTransportOrder getObjectNOSEGR(int uid) throws PersistenceException
  {
   ENTransportOrder result = new ENTransportOrder();
   result.code = uid;
   loadObjectNOSEGR(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }


 public void loadObjectNOSEGR(ENTransportOrder anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   

   selectStr = 
   "SELECT  ENTRANSPORTORDER.CODE, ENTRANSPORTORDER.NUMBERGEN, ENTRANSPORTORDER.TIMESTART, ENTRANSPORTORDER.TIMEFINAL, ENTRANSPORTORDER.DATESTART, ENTRANSPORTORDER.DATEFINAL, ENTRANSPORTORDER.ISASSIGNMENT, ENTRANSPORTORDER.ISAPPROVED, ENTRANSPORTORDER.ISREJECTED, ENTRANSPORTORDER.COMMENTGEN, ENTRANSPORTORDER.DATEEDIT, ENTRANSPORTORDER.USERGEN, ENTRANSPORTORDER.MODIFY_TIME, ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD, ENTRANSPORTORDER.PLANREFCODE, ENTRANSPORTORDER.TRANSPORTCODE, ENTRANSPORTORDER.TRANSPORTREALCODE, ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD, ENTRANSPORTORDER.PARENTREFCODE "
   +" FROM ENTRANSPORTORDER WHERE ENTRANSPORTORDER.CODE = ?";

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
       anObject.numbergen = set.getString(2);
       anObject.timeStart = set.getTimestamp(3);		
       anObject.timeFinal = set.getTimestamp(4);		
       anObject.dateStart = set.getTimestamp(5);		
       anObject.dateFinal = set.getTimestamp(6);		
       anObject.isAssignment = set.getInt(7);
       if ( set.wasNull() )
          anObject.isAssignment = Integer.MIN_VALUE;
       anObject.isApproved = set.getInt(8);
       if ( set.wasNull() )
          anObject.isApproved = Integer.MIN_VALUE;
       anObject.isRejected = set.getInt(9);
       if ( set.wasNull() )
          anObject.isRejected = Integer.MIN_VALUE;
       anObject.commentGen = set.getString(10);
       anObject.dateEdit = set.getTimestamp(11);		
       anObject.userGen = set.getString(12);
       anObject.modify_time = set.getLong(13);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.transportOrderStatus.code = set.getInt(14);
       if ( set.wasNull() )
           anObject.transportOrderStatus.code = Integer.MIN_VALUE;
       anObject.planRef.code = set.getInt(15);
       if ( set.wasNull() )
           anObject.planRef.code = Integer.MIN_VALUE;
       anObject.transport.code = set.getInt(16);
       if ( set.wasNull() )
           anObject.transport.code = Integer.MIN_VALUE;
       anObject.transportReal.code = set.getInt(17);
       if ( set.wasNull() )
           anObject.transportReal.code = Integer.MIN_VALUE;
       anObject.transportDepartment.code = set.getInt(18);
       if ( set.wasNull() )
           anObject.transportDepartment.code = Integer.MIN_VALUE;
       anObject.parentRef.code = set.getInt(19);
       if ( set.wasNull() )
           anObject.parentRef.code = Integer.MIN_VALUE;
       if(anObject.transportOrderStatus.code != Integer.MIN_VALUE)
       {
          anObject.setTransportOrderStatus(
		   new com.ksoe.energynet.dataminer.generated.ENTransportOrderStatusDAOGen(connection,getUserProfile()).getObject(anObject.transportOrderStatus.code));
	   }
       if(anObject.planRef.code != Integer.MIN_VALUE)
       {
          anObject.setPlanRef(
		   new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
	   }
       if(anObject.transport.code != Integer.MIN_VALUE)
       {
          anObject.setTransport(
		   new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).getRef(anObject.transport.code));
	   }
       if(anObject.transportReal.code != Integer.MIN_VALUE)
       {
          anObject.setTransportReal(
		   new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.transportReal.code));
	   }
       if(anObject.transportDepartment.code != Integer.MIN_VALUE)
       {
          anObject.setTransportDepartment(
		   new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.transportDepartment.code));
	   }
       if(anObject.parentRef.code != Integer.MIN_VALUE)
       {
          anObject.setParentRef(
		   new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
	   }
     } 
   }
   catch(SQLException e) 
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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


  
} // end of ENTransportOrderDAO

