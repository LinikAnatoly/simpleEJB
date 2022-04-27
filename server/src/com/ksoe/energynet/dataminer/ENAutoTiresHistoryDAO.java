
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
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENAutoTiresHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.ENAutoTiresHistory;
import com.ksoe.energynet.valueobject.ENTiresInstallStatus;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresHistoryShort;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresHistoryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENAutoTiresHistory;
  *
  */

public class ENAutoTiresHistoryDAO extends ENAutoTiresHistoryDAOGen {

  public ENAutoTiresHistoryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresHistoryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresHistoryShortList result = new ENAutoTiresHistoryShortList();
    ENAutoTiresHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRESHISTORY.CODE"+
     ",ENAUTOTIRESHISTORY.INSTALLDATE"+
     ",ENAUTOTIRESHISTORY.UNINSTALLDATE"+

     ",ENAUTOTIRESHISTORY.DISTANCE"+

     //", (select coalesce(sum(td.recorddistance),0) " +
     //"     from enautotireshistory th, enautotiresdistance td " +
     //"    where th.transportrealrefcode = td.transportrealrefcode " +
     //"      and th.tiresrefcode = td.tiresrefcode " +
     //"      and th.tiresrefcode = enautotireshistory.tiresrefcode " +
     //"      and th.transportrealrefcode = enautotireshistory.transportrealrefcode) " +

     ", ENAUTOTIRESHISTORY.ACTINSTALLNUMBER " +
     ", ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER " +

     ", ENAUTOTIRESHISTORY.REPLACEMENTREASON " +

     ", ENAUTOTIRES.CODE " +
     ", ENAUTOTIRES.TYPENAME " +
     ", ENAUTOTIRES.GARAGENUMBER " +
     ", ENAUTOTIRES.SERIALNUMBER " +
     ", ENAUTOTIRES.FACTORY " +
     ", ENAUTOTIRES.POTENCIAL " +

     ", ENAUTOTIRES.DISTANCEALL " +
     //", coalesce(enautotires.distanceall,0)+(select coalesce(sum(td.recorddistance),0) " +
     //" from enautotiresdistance td where td.tiresrefcode = enautotires.code) " +

     ", ENAUTOTIRES.NOMINAL " +
     ", ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE" +
     ", ENTIRESINSTALLPLACES.CODE " +
     ", ENTIRESINSTALLPLACES.NAME " +

     " FROM ENAUTOTIRESHISTORY " +
     ", ENAUTOTIRES " +
     ", ENTIRESINSTALLPLACES " +
     //" WHERE "
	"";
     whereStr = " ENAUTOTIRES.CODE = ENAUTOTIRESHISTORY.TIRESREFCODE" ; //+
      whereStr = whereStr +" AND ENTIRESINSTALLPLACES.CODE = ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENAUTOTIRESHISTORY.CODE IN ( SELECT ENAUTOTIRESHISTORY.CODE FROM ENAUTOTIRESHISTORY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.REPLACEMENTREASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.REPLACEMENTREASON) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENAUTOTIRESHISTORY.DOMAIN_INFO IS NOT NULL";
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
        if(aFilterObject.installDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installDate.getTime()));
        }
        if(aFilterObject.uninstallDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.uninstallDate.getTime()));
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }

           if(aFilterObject.replacementReason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.replacementReason);
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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installPlacesRef.code);
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

        anObject = new ENAutoTiresHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.installDate = set.getDate(2);
        anObject.uninstallDate = set.getDate(3);
        anObject.distance = set.getBigDecimal(4);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.actInstallNumber = set.getString(5);
        anObject.actUninstallNumber = set.getString(6);

        anObject.replacementReason = set.getString(7);

        anObject.tiresRefCode = set.getInt(8);
		if(set.wasNull())
		   anObject.tiresRefCode = Integer.MIN_VALUE;
        anObject.tiresRefTypeName = set.getString(9);
        anObject.tiresRefGarageNumber = set.getString(10);
        anObject.tiresRefSerialNumber = set.getString(11);
        anObject.tiresRefFactory = set.getString(12);
        anObject.tiresRefPotencial = set.getBigDecimal(13);
        if(anObject.tiresRefPotencial != null)
          anObject.tiresRefPotencial = anObject.tiresRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefDistanceAll = set.getBigDecimal(14);
        if(anObject.tiresRefDistanceAll != null)
          anObject.tiresRefDistanceAll = anObject.tiresRefDistanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefNominal = set.getString(15);
        anObject.transportRealRefCode = set.getInt(16);
		if(set.wasNull())
		   anObject.transportRealRefCode = Integer.MIN_VALUE;
        anObject.installPlacesRefCode = set.getInt(17);
		if(set.wasNull())
		   anObject.installPlacesRefCode = Integer.MIN_VALUE;
        anObject.installPlacesRefName = set.getString(18);

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

	public int add(ENAutoTiresHistory anObject) throws PersistenceException {
		UserProfile userProfile = getUserProfile();
		Connection connection = getConnection();
		try {
			if (anObject.installDate != null && anObject.uninstallDate == null) {
				ENAutoTiresDAO tDao = new ENAutoTiresDAO(getUserProfile(), getConnection());
				ENAutoTires tires = tDao.getObject(anObject.tiresRef.code);
				tires.installStatusRef.code = ENTiresInstallStatus.YES;
				tDao.save(tires);
			}
			return super.add(anObject);
		} finally {
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void save(ENAutoTiresHistory anObject) throws PersistenceException {
		UserProfile userProfile = getUserProfile();
		Connection connection = getConnection();
		try {
			if (anObject.installDate != null && anObject.uninstallDate != null) {
				ENAutoTiresDAO tDao = new ENAutoTiresDAO(getUserProfile(), getConnection());
				ENAutoTires tires = tDao.getObject(anObject.tiresRef.code);
				tires.installStatusRef.code = ENTiresInstallStatus.NO;
				tDao.save(tires);
			}
			super.save(anObject);
		} finally {
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public Date getLastUninstallDate(int tiresCode) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		Date lastUninstallDate = null;

		try {
			String selectStr =
				" select max(th.uninstalldate) from enautotireshistory th " +
				" where th.tiresrefcode = " + tiresCode;

			statement = connection.prepareStatement(selectStr);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				lastUninstallDate = resultSet.getDate(1);
			}

			resultSet.close();

			return lastUninstallDate;
		} catch (SQLException e) {
			throw new PersistenceException(
					"Can't get lastUninstallDate for ENAutoTires", e);
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

	public Date getLastInstallDate(int tiresCode) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		Date lastInstallDate = null;

		try {
			String selectStr =
				" select max(th.installdate) from enautotireshistory th " +
				" where th.tiresrefcode = " + tiresCode;

			statement = connection.prepareStatement(selectStr);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				lastInstallDate = resultSet.getDate(1);
			}

			resultSet.close();

			return lastInstallDate;
		} catch (SQLException e) {
			throw new PersistenceException(
					"Can't get lastInstallDate for ENAutoTires", e);
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

	public int checkInstallPlaces(int transportCode, int installPlacesCode) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int installPlaces = Integer.MIN_VALUE;

		try {
			String selectStr =
				" select th.installplacesrefcode from enautotireshistory th " +
				" where th.uninstalldate is null " +
				"   and th.installplacesrefcode = " + installPlacesCode +
				"   and th.transportrealrefcode = " + transportCode;

			statement = connection.prepareStatement(selectStr);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				installPlaces = resultSet.getInt(1);
			}

			resultSet.close();

			return installPlaces;
		} catch (SQLException e) {
			throw new PersistenceException(
					"Can't get checkInstallPlaces for ENAutoTires", e);
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

	public String getFreeInstallPlaces(int transportCode)
			throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		String freeInstallPlaces = "";

		try {
//			String selectStr =
//				" select pl.name from entiresinstallplaces pl where pl.code not in (" +
//				" select th.installplacesrefcode from enautotireshistory th " +
//				" where th.uninstalldate is null " +
//				"  and th.transportrealrefcode = " + transportCode + ")";
			
			String selectStr = "select entiresinstallplaces.name " +
					" from entiresinstallplaces  left join enautotireshistory on " +
					" (enautotireshistory.installplacesrefcode = entiresinstallplaces.code " +
					" and enautotireshistory.uninstalldate is null " +
					" and enautotireshistory.transportrealrefcode = " + transportCode + ")" +
                    " where enautotireshistory.installplacesrefcode is null";
			

			statement = connection.prepareStatement(selectStr);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				if (freeInstallPlaces != "")
					freeInstallPlaces = freeInstallPlaces + ", ";
				freeInstallPlaces = freeInstallPlaces + resultSet.getString(1);
			}

			resultSet.close();

			return freeInstallPlaces;
		} catch (SQLException e) {
			throw new PersistenceException(
					"Can't get getFreeInstallPlaces for ENAutoTires", e);
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

} // end of ENAutoTiresHistoryDAO