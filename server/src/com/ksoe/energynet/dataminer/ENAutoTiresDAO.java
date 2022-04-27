
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENAutoTiresDAOGen;
import com.ksoe.energynet.ejb.ENEstimateItemController;
import com.ksoe.energynet.ejb.ENEstimateItemControllerHome;
import com.ksoe.energynet.ejb.ENPlanWorkController;
import com.ksoe.energynet.ejb.ENPlanWorkControllerHome;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.ENAutoTiresInstallInfo;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresShort;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
*  DAO Object for ENAutoTires;
*
*/

public class ENAutoTiresDAO extends ENAutoTiresDAOGen {

  public ENAutoTiresDAO() {super();}
  public ENAutoTiresDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  @Override
public ENAutoTiresShortList getScrollableFilteredList(ENAutoTires aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresShortList result = new ENAutoTiresShortList();
    ENAutoTiresShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRES.CODE"+
     ",ENAUTOTIRES.TYPENAME"+
     ",ENAUTOTIRES.GARAGENUMBER"+
     ",ENAUTOTIRES.SERIALNUMBER"+
     ",ENAUTOTIRES.FACTORY"+
     ",ENAUTOTIRES.POTENCIAL"+

     ", ENAUTOTIRES.DISTANCEALL " +
     //", coalesce(enautotires.distanceall,0)+(select coalesce(sum(td.recorddistance),0) " +
     //" from enautotiresdistance td where td.tiresrefcode = enautotires.code) " +

     ",ENAUTOTIRES.NOMINAL"+

     ",ENAUTOTIRES.MATERIALREFCODE" +
     ",ENAUTOTIRES.DEPARTMENTREFCODE" +
     ",ENTIRESINSTALLSTATUS.CODE " +
     ",ENTIRESINSTALLSTATUS.NAME " +

     " FROM ENAUTOTIRES " +
     ", ENTIRESINSTALLSTATUS " +
     //" WHERE "
    "";
     whereStr = " ENTIRESINSTALLSTATUS.CODE = ENAUTOTIRES.INSTALLSTATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENAUTOTIRES.CODE IN ( SELECT ENAUTOTIRES.CODE FROM ENAUTOTIRES ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.CODE = ?";
        }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.TYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.TYPENAME) LIKE UPPER(?)";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.GARAGENUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.GARAGENUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.SERIALNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.SERIALNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.FACTORY) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.FACTORY) LIKE UPPER(?)";
         }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.POTENCIAL = ?";
        }
        if(aFilterObject.distanceAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.DISTANCEALL = ?";
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.NOMINAL) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.NOMINAL) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.INSTALLSTATUSREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENAUTOTIRES.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.typeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.typeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.garageNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.garageNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.serialNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.factory != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.factory);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
        if(aFilterObject.distanceAll != null){
            number++;
            aFilterObject.distanceAll = aFilterObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceAll);
        }

           if(aFilterObject.nominal != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nominal);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installStatusRef.code);
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

        anObject = new ENAutoTiresShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.typeName = set.getString(2);
        anObject.garageNumber = set.getString(3);
        anObject.serialNumber = set.getString(4);
        anObject.factory = set.getString(5);
        anObject.potencial = set.getBigDecimal(6);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceAll = set.getBigDecimal(7);
        if(anObject.distanceAll != null)
            anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.nominal = set.getString(8);

        anObject.materialRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.materialRefCode = Integer.MIN_VALUE;
        anObject.departmentRefCode = set.getInt(10);
        if(set.wasNull())
        anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefCode = set.getInt(11);
        if(set.wasNull())
        anObject.installStatusRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefName = set.getString(12);

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

    public ENAutoTiresInstallInfo getInstallInfo(int tiresCode)
            throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ENAutoTiresInstallInfo info = null;

        try {
            String selectStr = " select tr.invnumber, tr.gosnumber, tr.buhname, ti.name "
                    + " from tktransportreal tr, enautotireshistory th, entiresinstallplaces ti "
                    + " where tr.code = th.transportrealrefcode "
                    + " and th.installplacesrefcode = ti.code "
                    + " and th.uninstalldate is null "
                    + " and th.tiresrefcode = " + tiresCode;

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                info = new ENAutoTiresInstallInfo();
                info.invNumber = resultSet.getString(1);
                info.gosNumber = resultSet.getString(2);
                info.transportMark = resultSet.getString(3);
                info.installPlaces = resultSet.getString(4);
            }

            resultSet.close();
            return info;
        } catch (SQLException e) {
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;
        } finally {
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

    public int preparePlanByAutoTires(Date date) {
        int totalCount = 0;
        try {

            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

            Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENAutoTiresDAO tiresDAO = new ENAutoTiresDAO(connection, userProfile);

            Vector list = tiresDAO.getInfoForPlanAutoTires(date);
            totalCount = list.size();
            makePlanByAutoTires(list, date);

            System.out.println("Make Plan By AutoTires is done, total count = "
                    + list.size());
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e);
        } finally {
        }
        return totalCount;
    }

    public class DomainInfo {
        public String domainName;
        public int minCodeValue;
        public int maxCodeValue;
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

    public DomainInfo getDomainInfo(String userName)
            throws PersistenceException, DatasourceConnectException {

    	Connection connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);
        PreparedStatement statement = null;
        DomainInfo info = null;

        try {
            String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
                    + " from auth_domain d"
                    + " where d.name = (select user_domain"
                    + " from auth_user"
                    + " where user_name = " + "'" + userName + "')";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                info = new DomainInfo();
                info.domainName = resultSet.getString(1);
                info.minCodeValue = resultSet.getInt(2);
                info.maxCodeValue = resultSet.getInt(3);
            }
            resultSet.close();

            return info;
        } catch (SQLException e) {
            throw new PersistenceException("Can't get DomainInfo", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public class InfoForAutoTires {
        public int elementCode;
        public int departmentCode;
        public int departmentRenCode;
        public int materialCode;
        public BigDecimal countGen;

        public InfoForAutoTires() {
        }
    }

    public Vector getInfoForPlanAutoTires(Date date)
            throws PersistenceException, DatasourceConnectException {

        Vector list = new Vector();
        String selectStr = null;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        int planMonth, planYear;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        planMonth = calendar.get(Calendar.MONTH);
        planYear = calendar.get(Calendar.YEAR);

        try {
//            selectStr = " select tr.enelementcode, d.code, d.rencode, t.materialrefcode, count(t.code) " +
//                    " from tktransportreal tr, enautotireshistory th, enautotires t, " +
//                    " entiresinstallplaces pl, endepartment d " +
//                    " where th.transportrealrefcode = tr.code " +
//                    " and d.code = tr.departmentrefcode " +
//                    " and pl.code = th.installplacesrefcode " +
//                    " and t.code = th.tiresrefcode " +
//                    " and th.uninstalldate is null " +
//                    " and t.materialrefcode is not null " +
//                    " and (t.potencial - t.distanceall) <= 100 " +
//                    //" and tr.enelementcode in (1008000178,1008000229) " +   // DEBUG
//
//                    // откинем  объекты, на которые были сформированы планы в прошлом месяце
//                    " and tr.enelementcode not in " +
//                    " (select pl.elementrefcode from enplanwork pl " +
//                    " where pl.typerefcode = " + ENPlanWorkType.TRANSPORT_SERVICES +
//                    "  and pl.staterefcode = " + ENPlanWorkState.TRANSPORT_SERVICES +
//                    "  and pl.monthgen = " + planMonth + " and pl.yeargen = " + planYear + ")" +
//
//                    " group by tr.enelementcode, d.code, d.rencode, t.materialrefcode " +
//
//                    " union all " +
//                    " select tr.enelementcode, d.code, d.rencode, a.materialrefcode, count(a.code) " +
//                    " from tktransportreal tr, enaccumulatorshistory ah, enaccumulators a, endepartment d " +
//                    " where ah.transportrealrefcode = tr.code " +
//                    " and d.code = tr.departmentrefcode " +
//                    " and a.code = ah.accumulatorsrefcode " +
//                    " and ah.uninstalldate is null " +
//                    " and a.materialrefcode is not null " +
//                    " and (a.potencial - a.mileageall) <= 30 " +
//                    //" and tr.enelementcode in (1008000178,1008000229) " +   // DEBUG !!!!!!!!
//
//                    // откинем  объекты, на которые были сформированы планы в прошлом месяце
//                    " and tr.enelementcode not in " +
//                    " (select pl.elementrefcode from enplanwork pl " +
//                    " where pl.typerefcode = " + ENPlanWorkType.TRANSPORT_SERVICES +
//                    "  and pl.staterefcode = " + ENPlanWorkState.TRANSPORT_SERVICES +
//                    "  and pl.monthgen = " + planMonth + " and pl.yeargen = " + planYear + ")" +
//
//                    " group by tr.enelementcode, d.code, d.rencode, a.materialrefcode " +
//                    " order by 1 ";

            selectStr =    " select tr.enelementcode, d.code, d.rencode, t.materialrefcode, count(t.code) " +
            " from  enautotireshistory th , enautotires t, " +
            " entiresinstallplaces pl, endepartment d, " +
             " tktransportreal tr left join  enplanwork on " +
             " (enplanwork.elementrefcode = tr.enelementcode and " +
             " enplanwork.typerefcode = "  + ENPlanWorkType.TRANSPORT_SERVICES +
            " and enplanwork.staterefcode = " + ENPlanWorkType.TRANSPORT_SERVICES +
            " and enplanwork.monthgen = " + planMonth + " and enplanwork.yeargen = " + planYear + ")" +
            " where th.transportrealrefcode = tr.code " +
            " and d.code = tr.departmentrefcode " +
            " and pl.code = th.installplacesrefcode " +
            " and t.code = th.tiresrefcode " +
            " and th.uninstalldate is null " +
            " and t.materialrefcode is not null " +
            " and (t.potencial - t.distanceall) <= 100 " +
            " and enplanwork.elementrefcode is null " +
            " group by tr.enelementcode, d.code, d.rencode, t.materialrefcode " +
            " union all " +
            " select tr.enelementcode, d.code, d.rencode, a.materialrefcode, count(a.code) " +
            " from  enaccumulatorshistory ah, enaccumulators a, endepartment d, " +
            " tktransportreal tr left join  enplanwork on " +
             " (enplanwork.elementrefcode = tr.enelementcode and " +
             " enplanwork.typerefcode = " + ENPlanWorkType.TRANSPORT_SERVICES +
            " and enplanwork.staterefcode = " + ENPlanWorkType.TRANSPORT_SERVICES +
            " and enplanwork.monthgen = " + planMonth + " and enplanwork.yeargen = " + planYear + ")" +
            " where ah.transportrealrefcode = tr.code " +
            " and d.code = tr.departmentrefcode " +
            " and a.code = ah.accumulatorsrefcode " +
            " and ah.uninstalldate is null " +
            " and a.materialrefcode is not null " +
            " and (a.potencial - a.mileageall) <= 30 " +
             " and enplanwork.elementrefcode is null " +
            " group by tr.enelementcode, d.code, d.rencode, a.materialrefcode " +
            " order by 1";


            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                InfoForAutoTires info = new InfoForAutoTires();
                info.elementCode = resultSet.getInt(1);
                info.departmentCode = resultSet.getInt(2);
                info.departmentRenCode = resultSet.getInt(3);
                info.materialCode = resultSet.getInt(4);
                info.countGen = resultSet.getBigDecimal(5);

                list.add(info);
            }
            resultSet.close();
            System.out
                    .println("select InfoForAutoTires is done ! Total count = "
                            + list.size());

            return list;
        } catch (SQLException e) {
            throw new PersistenceException("Can't InfoForAutoTires codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }

    private void makePlanByAutoTires(Vector list, Date date)
            throws DatasourceConnectException, PersistenceException {

        UserProfile userProfile = new UserProfile();
        userProfile.userName = "energynet";

        DomainInfo domainInfo = new DomainInfo();
        domainInfo = getDomainInfo(userProfile.userName);
        userProfile.domainInfo.domain = domainInfo.domainName;
        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

        DepartmentLogic departmentLogic = new DepartmentLogic(connection, userProfile);

        int planMonth, planYear;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        planMonth = calendar.get(Calendar.MONTH) + 1;
        planYear = calendar.get(Calendar.YEAR);

        Date planStartDate, planEndDate;

        Calendar start = Calendar.getInstance();
        start.setTime(date);
        start.set(Calendar.DATE, start.getActualMinimum(Calendar.DATE));
        planStartDate = start.getTime();

        Calendar end = Calendar.getInstance();
        end.setTime(date);
        end.set(Calendar.DATE, end.getActualMaximum(Calendar.DATE));
        planEndDate = end.getTime();

        ENPlanWork plan = null;
        try {

            Context context = new InitialContext();
            Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();

            int elementCode = -1;

            for (int i = 0; i < list.size(); i++) {
                if (i % 100 == 0)
                    System.out.println("Ok! Plan By AutoTires... planCount = " + i);
                ENAutoTiresDAO.InfoForAutoTires info = (ENAutoTiresDAO.InfoForAutoTires) list.get(i);

                int elementCodeNew = info.elementCode;
                if (elementCodeNew != elementCode) {
                    elementCode = elementCodeNew;
                    System.out.println("elementCodeNew = " + elementCodeNew);

                    if (elementCodeNew >= 0) {
                        plan = new ENPlanWork();
                        plan.dateGen = new Date();
                        plan.dateStart = planStartDate;
                        plan.dateFinal = planEndDate;
                        plan.yearGen = planYear;
                        plan.monthGen = planMonth;

                        plan.sourceRef.code = ENPlanWorkSource.MANUAL;
                        plan.elementRef.code = info.elementCode;
                        plan.renRef.code = departmentLogic.getEPRen2Department(info.departmentCode);
                        plan.departmentRef.code = info.departmentCode;
                        plan.typeRef.code = ENPlanWorkType.TRANSPORT_SERVICES;
                        plan.stateRef.code = ENPlanWorkState.TRANSPORT_SERVICES;
                        plan.kind.code = ENPlanWorkKind.CURRENT;
                        plan.budgetRef.code = 75000016;  // 'СТ';
                        plan.responsibilityRef.code = 75000017;  // 'СТ';

                        plan.finExecutor.name = "Відділ матеріально-технічного постачання";
                        plan.finExecutor.finCode = 45;
                        plan.finExecutor.finTypeName = "Промышленный персонал";
                        plan.finExecutor.finTypeCode = 1;
                        plan.finExecutor.finKindName = "Відділ";
                        plan.finExecutor.finKindCode = 3;
                        plan.finExecutor.finCehName = "Апарат управління";
                        plan.finExecutor.finCehCode = 3;

                        ///// MDAX-441
                        plan.finExecutor.axOrgId = "018";
                        plan.finExecutor.axParentOrgId = "0001";
                        plan.finExecutor.axParentOrgName = "АДМІНІСТРАТИВНО-УПРАВЛІНСЬКА ЧАСТИНА";
                        plan.finExecutor.axOrgTypeId = 3;
                        plan.finExecutor.axOrgTypeName = "Отдел";
                        /////


                        plan.status.code = ENPlanWorkStatus.GOOD;
                        plan.formRef.code = ENPlanWorkForm.PLANNED;

                        plan.code = planController.addAutoPlanByTires(plan, userProfile);

                    }
                }

                Object estimateRef = context.lookup(ENEstimateItemController.JNDI_NAME);
                ENEstimateItemControllerHome estimateHome = (ENEstimateItemControllerHome) PortableRemoteObject.narrow(estimateRef, ENEstimateItemControllerHome.class);
                ENEstimateItemController estimateController = estimateHome.create();

                ENEstimateItem estimate = new ENEstimateItem();
                estimate.planRef.code = plan.code;
                estimate.materialRef.code = info.materialCode;
                estimate.countGen = info.countGen;
                estimate.countFact = info.countGen;

                estimateController.addTires(estimate, userProfile);

            }

            System.out.println("Make Plan By AutoTires is done, total count = "
                    + list.size());

        } catch (NamingException e) {
            e.printStackTrace();
        } catch (RemoteException e) {
            e.printStackTrace();
        } catch (CreateException e) {
            e.printStackTrace();
        }
    }


} // end of ENAutoTiresDAO