
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENNormativeVolumeAVZDAOGen;
import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;
import com.ksoe.energynet.valueobject.brief.ENNormativeVolumeAVZShort;
import com.ksoe.energynet.valueobject.lists.ENNormativeVolumeAVZShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENNormativeVolumeAVZ;
 *
 */

public class ENNormativeVolumeAVZDAO extends ENNormativeVolumeAVZDAOGen {

    public ENNormativeVolumeAVZDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENNormativeVolumeAVZDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


	@Override
	public ENNormativeVolumeAVZShortList getScrollableFilteredList(
			ENNormativeVolumeAVZ aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector<? extends Object> aBindObjects) throws PersistenceException {

		ENNormativeVolumeAVZShortList result = new ENNormativeVolumeAVZShortList();
		ENNormativeVolumeAVZShort anObject;
		result.list = new Vector<ENNormativeVolumeAVZShort>();

      String     selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     whereStr = "";
      String     condition = processCondition(anCondition);
      String     orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENNORMATIVEVOLUMEAVZ.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
       "ENNORMATIVEVOLUMEAVZ.CODE"+
       ",ENNORMATIVEVOLUMEAVZ.USERGEN"+
       ",ENNORMATIVEVOLUMEAVZ.DATEEDIT"+

        ", budget.CODE " +
        ", budget.SHORTNAME " +
        ", budget.DATESTART " +
        ", budget.DATEFINAL " +
        ", budget.RENCODE " +
        ", budget.SHPZBALANS " +
        ", budget.KAU_TABLE_ID_1884 " +
        ", budget.KAU_1884 " +
        ", budget.NAME_1884 " +

        ", ENDEPARTMENT.CODE " +
        ", ENDEPARTMENT.SHORTNAME " +
        ", ENDEPARTMENT.DATESTART " +
        ", ENDEPARTMENT.DATEFINAL " +
        ", ENDEPARTMENT.RENCODE " +
        ", ENDEPARTMENT.SHPZBALANS " +
        ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
        ", ENDEPARTMENT.KAU_1884 " +
        ", ENDEPARTMENT.NAME_1884 " +
        ", ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID " +
        ", ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_NAME " +
        " FROM ENNORMATIVEVOLUMEAVZ " +
        ", ENDEPARTMENT as budget " +
        ", ENDEPARTMENT ";

        whereStr = " budget.CODE = ENNORMATIVEVOLUMEAVZ.BUDGETREFCODE";
        whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENNORMATIVEVOLUMEAVZ.DEPARTMENTREFCODE";

        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENNORMATIVEVOLUMEAVZ.CODE = ?";
          }
           if (aFilterObject.userGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  UPPER(ENNORMATIVEVOLUMEAVZ.USERGEN) = UPPER(?)";
               else
                   whereStr = whereStr + " UPPER(ENNORMATIVEVOLUMEAVZ.USERGEN) LIKE UPPER(?)";
           }
          if(aFilterObject.dateEdit != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENNORMATIVEVOLUMEAVZ.DATEEDIT = ?";
          }
          if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENNORMATIVEVOLUMEAVZ.BUDGETREFCODE = ? ";
          }
          if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENNORMATIVEVOLUMEAVZ.DEPARTMENTREFCODE = ? ";
          }
          if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID = ? ";
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
              statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
          }
         if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.budgetRef.code);
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.departmentRef.code);
         }
         if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.rest_purpose_type_id);
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

				anObject = new ENNormativeVolumeAVZShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.budgetRefCode = set.getInt(4);
				if (set.wasNull())
					anObject.budgetRefCode = Integer.MIN_VALUE;
				anObject.budgetRefShortName = set.getString(5);
				anObject.budgetRefDateStart = set.getDate(6);
				anObject.budgetRefDateFinal = set.getDate(7);
				anObject.budgetRefRenCode = set.getInt(8);
				if (set.wasNull())
					anObject.budgetRefRenCode = Integer.MIN_VALUE;
				anObject.budgetRefShpzBalans = set.getString(9);
				anObject.budgetRefKau_table_id_1884 = set.getInt(10);
				if (set.wasNull())
					anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
				anObject.budgetRefKau_1884 = set.getString(11);
				anObject.budgetRefName_1884 = set.getString(12);
				anObject.departmentRefCode = set.getInt(13);
				if (set.wasNull())
					anObject.departmentRefCode = Integer.MIN_VALUE;
				anObject.departmentRefShortName = set.getString(14);
				anObject.departmentRefDateStart = set.getDate(15);
				anObject.departmentRefDateFinal = set.getDate(16);
				anObject.departmentRefRenCode = set.getInt(17);
				if (set.wasNull())
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				anObject.departmentRefShpzBalans = set.getString(18);
				anObject.departmentRefKau_table_id_1884 = set.getInt(19);
				if (set.wasNull())
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				anObject.departmentRefKau_1884 = set.getString(20);
				anObject.departmentRefName_1884 = set.getString(21);
				anObject.rest_purpose_type_id = set.getInt(22);
				anObject.rest_purpose_type_name = set.getString(23);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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


} // end of ENNormativeVolumeAVZDAO
