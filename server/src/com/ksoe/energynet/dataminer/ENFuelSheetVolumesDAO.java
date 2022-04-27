
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENFuelSheetVolumesDAOGen;
import com.ksoe.energynet.valueobject.ENFuelSheetVolumes;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesShort;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENFuelSheetVolumes;
 *
 */

public class ENFuelSheetVolumesDAO extends ENFuelSheetVolumesDAOGen {

    public ENFuelSheetVolumesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelSheetVolumesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENFuelSheetVolumes anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENFuelSheetVolumes anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
    
    public ENFuelSheetVolumesShortList getScrollableFilteredList(ENFuelSheetVolumes aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENFuelSheetVolumesShortList result = new ENFuelSheetVolumesShortList();
     ENFuelSheetVolumesShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENFUELSHEETVOLUMES.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENFUELSHEETVOLUMES.CODE"+
      ",ENFUELSHEETVOLUMES.NAME"+
      ",ENFUELSHEETVOLUMES.DATEGEN"+
      ",ENFUELSHEETVOLUMES.STARTDATE"+
      ",ENFUELSHEETVOLUMES.ENDDATE"+
      ",ENFUELSHEETVOLUMES.FUELTYPE"+
      ",ENFUELSHEETVOLUMES.USERADD"+
      ",ENFUELSHEETVOLUMES.DATEADD"+
      ",ENFUELSHEETVOLUMES.USERGEN"+
      ",ENFUELSHEETVOLUMES.DATEEDIT"+

       ", ENFUELSHEETVOLUMESSTTS.CODE " +
       ", ENFUELSHEETVOLUMESSTTS.NAME " +
       
       " ,( " +
       "    case " + 
       "      when fueltype = 1 then 'Бензин A-92' " +
       "      when fueltype = 2 then 'Бензин A-95' " +
       "      when fueltype = 3 then 'Дизпаливо' " +
       "    end " +
       "  ) as fueltypename " +       
       
      " FROM ENFUELSHEETVOLUMES " +
      ", ENFUELSHEETVOLUMESSTTS " +
      //" WHERE "
   "";
      whereStr = " ENFUELSHEETVOLUMESSTTS.CODE = ENFUELSHEETVOLUMES.STATUSREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENFUELSHEETVOLUMES.CODE IN ( SELECT ENFUELSHEETVOLUMES.CODE FROM ENFUELSHEETVOLUMES ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.CODE = ?";
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELSHEETVOLUMES.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELSHEETVOLUMES.NAME) LIKE UPPER(?)";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.DATEGEN = ?";
         }
         if(aFilterObject.startDate != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.STARTDATE = ?";
         }
         if(aFilterObject.endDate != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.ENDDATE = ?";
         }
         if(aFilterObject.fuelType != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.FUELTYPE = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELSHEETVOLUMES.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELSHEETVOLUMES.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELSHEETVOLUMES.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELSHEETVOLUMES.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.DATEEDIT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELSHEETVOLUMES.MODIFY_TIME = ?";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELSHEETVOLUMES.STATUSREFCODE = ? ";
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

            if(aFilterObject.name != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.name);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
         if(aFilterObject.startDate != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
         }
         if(aFilterObject.endDate != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
         }
          if(aFilterObject.fuelType != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.fuelType);
          }

            if(aFilterObject.userAdd != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userAdd);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new ENFuelSheetVolumesShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.name = set.getString(2);
         anObject.dateGen = set.getDate(3);
         anObject.startDate = set.getDate(4);
         anObject.endDate = set.getDate(5);
         anObject.fuelType = set.getInt(6);
         if ( set.wasNull() )
             anObject.fuelType = Integer.MIN_VALUE;
         anObject.userAdd = set.getString(7);
         anObject.dateAdd = set.getTimestamp(8);
         anObject.userGen = set.getString(9);
         anObject.dateEdit = set.getTimestamp(10);

         anObject.statusRefCode = set.getInt(11);
	     if(set.wasNull())
	       anObject.statusRefCode = Integer.MIN_VALUE;
	     
	     anObject.statusRefName = set.getString(12);
         
         anObject.fuelTypeName = set.getString(13);

          result.list.add(anObject);
        }

       result.setTotalCount(i);
       return result;
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
    }

    
} // end of ENFuelSheetVolumesDAO
