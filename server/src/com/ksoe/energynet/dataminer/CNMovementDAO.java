
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.CNMovementDAOGen;
import com.ksoe.energynet.valueobject.CNMovement;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.brief.CNMovementShort;
import com.ksoe.energynet.valueobject.lists.CNMovementShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNMovement;
  *
  */

public class CNMovementDAO extends CNMovementDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public CNMovementDAO() {super();}
  //public CNMovementDAO(Connection aConnection) {super(aConnection);}
  //public CNMovementDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNMovementDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNMovementDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  @Override
  public int[] getFilteredCodeArray(CNMovement aFilterObject,
    String anCondition, String anOrderBy,
    int fromPosition, int quantity,Vector aBindObjects) throws PersistenceException
  {
   Vector result = new Vector();

   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   String ssPrefix = null;

   switch (aFilterObject.subsystemRef.code) {
	  case CNSubsystemType.SS_CONNECTION: //Присоединение
		{
		  ssPrefix = "cn";
		  break;
		}
	  case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
		{
		  ssPrefix = "ncn";
		  break;
		}
	  case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
		{
		  ssPrefix = "cn_20110314";
		  break;
		}
	  case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
		{
	      ssPrefix = "eap";
	      break;
		}
	  case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
	      ssPrefix = "adso";
	      break;
		}
	  default:
		{
		  throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
		}
	  }

   String     selectStr = "SELECT " + ssPrefix + "_MOVEMENT.ID FROM CN." + ssPrefix + "_MOVEMENT";
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = ssPrefix + "_MOVEMENT.ID";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     if(aFilterObject != null)
     {
       if(aFilterObject.id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID = ?";
       }
       if(aFilterObject.id_state != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_STATE = ?";
       }
       if(aFilterObject.startdate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.STARTDATE = ?";
       }
        if (aFilterObject.note != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.NOTE = ?";
            else
                whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.NOTE LIKE ?";
        }
       if(aFilterObject.id_parent != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_PARENT = ?";
       }
       if(aFilterObject.id_user != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_USER = ?";
       }
       if(aFilterObject.realdate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.REALDATE = ?";
       }
       if(aFilterObject.canceled != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.CANCELED = ?";
       }
       if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_USER_CANCELED = ?";
       }
       if(aFilterObject.canceleddate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.CANCELEDDATE = ?";
       }
        if (aFilterObject.cancelednote != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.CANCELEDNOTE = ?";
            else
                whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.CANCELEDNOTE LIKE ?";
        }
       if(aFilterObject.is_completed != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.IS_COMPLETED = ?";
       }
       if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_MOVEMENT_STATUS = ?";
       }
        if (aFilterObject.addnote != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ADDNOTE = ?";
            else
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ADDNOTE LIKE ?";
        }
       if(aFilterObject.read_status != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.READ_STATUS = ?";
       }
       if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_USER_READ = ?";
       }
       if(aFilterObject.read_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.READ_DATE = ?";
       }
       if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  " + ssPrefix + "_MOVEMENT.ID_USER_CREATED = ?";
       }
       if(aFilterObject.modifytime != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.MODIFYTIME = ?";
       }
       if(aFilterObject.pastdate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.PASTDATE = ?";
       }
       /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.SUBSYSTEMREFCODE = ? ";
       }*/
       if(aFilterObject.id_pack != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_PACK = ? ";
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

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id);
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_state);
        }
       if(aFilterObject.startdate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.startdate.getTime()));
       }
        if (aFilterObject.note != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.NOTE = ?";
            else
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.NOTE LIKE ?";

          if(aFilterObject.note != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.note);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
        if(aFilterObject.id_parent != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_parent);
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_user);
        }
       if(aFilterObject.realdate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.realdate.getTime()));
       }
        if(aFilterObject.canceled != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.canceled);
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_user_canceled);
        }
       if(aFilterObject.canceleddate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.canceleddate.getTime()));
       }
        if (aFilterObject.cancelednote != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.CANCELEDNOTE = ?";
            else
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.CANCELEDNOTE LIKE ?";

          if(aFilterObject.cancelednote != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.cancelednote);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
        if(aFilterObject.is_completed != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.is_completed);
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_movement_status);
        }
        if (aFilterObject.addnote != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ADDNOTE = ?";
            else
                whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ADDNOTE LIKE ?";

          if(aFilterObject.addnote != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.addnote);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
        if(aFilterObject.read_status != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.read_status);
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_user_read);
        }
       if(aFilterObject.read_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.read_date.getTime()));
       }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_user_created);
        }
       if(aFilterObject.modifytime != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.modifytime.getTime()));
       }
       if(aFilterObject.pastdate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.pastdate.getTime()));
       }
      /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.subsystemRef.code);
      }*/
      if(aFilterObject.id_pack != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.id_pack);
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

       result.add(new Integer(set.getInt(1)));
      }

     int[] array;

     array = new int[result.size()];
     for(int j = 0;j < result.size();j++)
      array[j] = ((Integer)result.get(j)).intValue();

     return array;
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
   } // end of getFilteredCodeArray

  @Override
public CNMovementShortList getScrollableFilteredList(CNMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNMovementShortList result = new CNMovementShortList();
    CNMovementShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    String ssPrefix = null;

    switch (aFilterObject.subsystemRef.code) {
	  case CNSubsystemType.SS_CONNECTION: //Присоединение
		{
		  ssPrefix = "cn";
		  break;
		}
	  case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
		{
		  ssPrefix = "ncn";
		  break;
		}
	  case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
		{
		  ssPrefix = "cn_20110314";
		  break;
		}
	  case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
		{
	      ssPrefix = "eap";
	      break;
		}
	  case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
	      ssPrefix = "adso";
	      break;
		}
	  default:
		{
		  throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
		}
	  }

    if(orderBy.length() == 0)
     orderBy = ssPrefix + "_MOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
      ", " + ssPrefix + "_MOVEMENT.ID"+
      ", " + ssPrefix + "_MOVEMENT.ID_STATE"+
      ", " + ssPrefix + "_MOVEMENT.STARTDATE"+
      ", " + ssPrefix + "_MOVEMENT.NOTE"+
      ", " + ssPrefix + "_MOVEMENT.ID_PARENT"+
      ", " + ssPrefix + "_MOVEMENT.ID_USER"+
      ", " + ssPrefix + "_MOVEMENT.REALDATE"+
      ", " + ssPrefix + "_MOVEMENT.CANCELED"+
      ", " + ssPrefix + "_MOVEMENT.ID_USER_CANCELED"+
      ", " + ssPrefix + "_MOVEMENT.CANCELEDDATE"+
      ", " + ssPrefix + "_MOVEMENT.CANCELEDNOTE"+
      ", " + ssPrefix + "_MOVEMENT.IS_COMPLETED"+
      ", " + ssPrefix + "_MOVEMENT.ID_MOVEMENT_STATUS"+
      ", " + ssPrefix + "_MOVEMENT.ADDNOTE"+
      ", " + ssPrefix + "_MOVEMENT.READ_STATUS"+
      ", " + ssPrefix + "_MOVEMENT.ID_USER_READ"+
      ", " + ssPrefix + "_MOVEMENT.READ_DATE"+
      ", " + ssPrefix + "_MOVEMENT.ID_USER_CREATED"+
      ", " + ssPrefix + "_MOVEMENT.MODIFYTIME"+
      ", " + ssPrefix + "_MOVEMENT.PASTDATE"+
      ", " + ssPrefix + "_MOVEMENT.ID_PACK"+

     " FROM CN." + ssPrefix + "_MOVEMENT";

      if(aFilterObject != null)
      {
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_STATE = ?";
        }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER( " + ssPrefix + "_MOVEMENT.NOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER( " + ssPrefix + "_MOVEMENT.NOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER( " + ssPrefix + "_MOVEMENT.CANCELEDNOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER( " + ssPrefix + "_MOVEMENT.CANCELEDNOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_MOVEMENT.ADDNOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_MOVEMENT.ADDNOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.PASTDATE = ?";
        }
        /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }*/
        if(aFilterObject.id_pack != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_MOVEMENT.ID_PACK = ? ";
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
         if(aFilterObject.id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id);
         }
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }
        if(aFilterObject.startdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startdate.getTime()));
        }

           if(aFilterObject.note != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.note);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_parent != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_parent);
         }
         if(aFilterObject.id_user != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user);
         }
        if(aFilterObject.realdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.realdate.getTime()));
        }
         if(aFilterObject.canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.canceled);
         }
         if(aFilterObject.id_user_canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_canceled);
         }
        if(aFilterObject.canceleddate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.canceleddate.getTime()));
        }

           if(aFilterObject.cancelednote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.cancelednote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.is_completed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_completed);
         }
         if(aFilterObject.id_movement_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_movement_status);
         }

           if(aFilterObject.addnote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.addnote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.read_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.read_status);
         }
         if(aFilterObject.id_user_read != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_read);
         }
        if(aFilterObject.read_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.read_date.getTime()));
        }
         if(aFilterObject.id_user_created != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_created);
         }
        if(aFilterObject.modifytime != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.modifytime.getTime()));
        }
        if(aFilterObject.pastdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.pastdate.getTime()));
        }
       /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }*/
       if(aFilterObject.id_pack != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.id_pack);
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

        anObject = new CNMovementShort();

        anObject.id = set.getInt(1);
        if ( set.wasNull() )
            anObject.id = Integer.MIN_VALUE;
        anObject.id_state = set.getInt(2);
        if ( set.wasNull() )
            anObject.id_state = Integer.MIN_VALUE;
        anObject.startdate = set.getDate(3);
        anObject.note = set.getString(4);
        anObject.id_parent = set.getInt(5);
        if ( set.wasNull() )
            anObject.id_parent = Integer.MIN_VALUE;
        anObject.id_user = set.getInt(6);
        if ( set.wasNull() )
            anObject.id_user = Integer.MIN_VALUE;
        anObject.realdate = set.getDate(7);
        anObject.canceled = set.getInt(8);
        if ( set.wasNull() )
            anObject.canceled = Integer.MIN_VALUE;
        anObject.id_user_canceled = set.getInt(9);
        if ( set.wasNull() )
            anObject.id_user_canceled = Integer.MIN_VALUE;
        anObject.canceleddate = set.getDate(10);
        anObject.cancelednote = set.getString(11);
        anObject.is_completed = set.getInt(12);
        if ( set.wasNull() )
            anObject.is_completed = Integer.MIN_VALUE;
        anObject.id_movement_status = set.getInt(13);
        if ( set.wasNull() )
            anObject.id_movement_status = Integer.MIN_VALUE;
        anObject.addnote = set.getString(14);
        anObject.read_status = set.getInt(15);
        if ( set.wasNull() )
            anObject.read_status = Integer.MIN_VALUE;
        anObject.id_user_read = set.getInt(16);
        if ( set.wasNull() )
            anObject.id_user_read = Integer.MIN_VALUE;
        anObject.read_date = set.getDate(17);
        anObject.id_user_created = set.getInt(18);
        if ( set.wasNull() )
            anObject.id_user_created = Integer.MIN_VALUE;
        anObject.modifytime = set.getDate(19);
        anObject.pastdate = set.getDate(20);

        /*anObject.subsystemRefCode = set.getInt(21);
		if(set.wasNull())
		   anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(22);
        anObject.cnPackRefCode = set.getInt(23);
		if(set.wasNull())
		   anObject.cnPackRefCode = Integer.MIN_VALUE;*/

        anObject.cnPackRefPackCode = set.getInt(21);
		if(set.wasNull())
		   anObject.cnPackRefPackCode = Integer.MIN_VALUE;

		/*anObject.cnPackRefName = set.getString(25);
        anObject.cnPackRefId_ren = set.getInt(26);

        if(set.wasNull())
		   anObject.cnPackRefId_ren = Integer.MIN_VALUE;
        anObject.cnPackRefRenName = set.getString(27);
        anObject.cnPackRefId_district = set.getInt(28);
		if(set.wasNull())
		   anObject.cnPackRefId_district = Integer.MIN_VALUE;
        anObject.cnPackRefDistrictName = set.getString(29);
        anObject.cnPackRefId_pack_status = set.getInt(30);
		if(set.wasNull())
		   anObject.cnPackRefId_pack_status = Integer.MIN_VALUE;
        anObject.cnPackRefStatusName = set.getString(31);
        anObject.cnPackRefDescription = set.getString(32);
        anObject.cnPackRefPower = set.getBigDecimal(33);
        if(anObject.cnPackRefPower != null)
          anObject.cnPackRefPower = anObject.cnPackRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cnPackRefAddress = set.getString(34);
        anObject.cnPackRefAddress_jur = set.getString(35);
        anObject.cnPackRefReg_num_cn_contract = set.getString(36);
        anObject.cnPackRefDate_cn_contract = set.getDate(37);
        anObject.cnPackRefReg_num_spl_pp_contract = set.getString(38);
        anObject.cnPackRefDate_spl_pp_contract = set.getDate(39);
        anObject.cnPackRefReg_num_tu_contract = set.getString(40);
        anObject.cnPackRefDate_tu_contract = set.getDate(41);
        anObject.cnPackRefReg_num_tu_cr_contract = set.getString(42);
        anObject.cnPackRefDate_tu_cr_contract = set.getDate(43);
        anObject.cnPackRefProject_num = set.getString(44);
        anObject.cnPackRefProject_date = set.getDate(45);
        anObject.cnPackRefOver5 = set.getInt(46);
		if(set.wasNull())
		   anObject.cnPackRefOver5 = Integer.MIN_VALUE;
        anObject.cnPackRefStatus = set.getInt(47);
		if(set.wasNull())
		   anObject.cnPackRefStatus = Integer.MIN_VALUE;
        anObject.cnPackRefLetter_num_customer = set.getString(48);
        anObject.cnPackRefDate_letter_customer = set.getDate(49);
        anObject.cnPackRefLetter_num = set.getString(50);
        anObject.cnPackRefDate_letter = set.getDate(51);
        anObject.cnPackRefReliability_class = set.getString(52);
        anObject.cnPackRefId_waiting_status = set.getInt(53);
		if(set.wasNull())
		   anObject.cnPackRefId_waiting_status = Integer.MIN_VALUE;
        anObject.cnPackRefWaitingStatus = set.getString(54);
        anObject.cnPackRefIs_payable = set.getInt(55);
		if(set.wasNull())
		   anObject.cnPackRefIs_payable = Integer.MIN_VALUE;
        anObject.cnPackRefWorksize = set.getString(56);
        anObject.cnPackRefWork_inc_net = set.getString(57);
        anObject.cnPackRefBusiness_type = set.getString(58);
        anObject.cnPackRefEstimateterm = set.getInt(59);
		if(set.wasNull())
		   anObject.cnPackRefEstimateterm = Integer.MIN_VALUE;
        anObject.cnPackRefEstimatedate = set.getDate(60);
        anObject.cnPackRefBuildingterm = set.getInt(61);
		if(set.wasNull())
		   anObject.cnPackRefBuildingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuildingdate = set.getDate(62);
        anObject.cnPackRefBuyingterm = set.getInt(63);
		if(set.wasNull())
		   anObject.cnPackRefBuyingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuyingdate = set.getDate(64);
        anObject.cnPackRefEstimate_num = set.getString(65);
        anObject.cnPackRefEstimate_contract_date = set.getDate(66);
        anObject.cnPackRefIs_reserv = set.getInt(67);
		if(set.wasNull())
		   anObject.cnPackRefIs_reserv = Integer.MIN_VALUE;*/

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

  public CNMovement getObject(int uid, int ssID) throws PersistenceException
  {
   CNMovement result = new CNMovement();
   result.id = uid;
   result.subsystemRef.code = ssID;
   loadObject(result);
   if(result.id == Integer.MIN_VALUE)
    return null;
   return result;
  }

  @Override
public void loadObject(CNMovement anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   String ssPrefix = null;

   switch (anObject.subsystemRef.code) {
	  case CNSubsystemType.SS_CONNECTION: //Присоединение
		{
		  ssPrefix = "cn";
		  break;
		}
	  case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
		{
		  ssPrefix = "ncn";
		  break;
		}
	  case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
		{
		  ssPrefix = "cn_20110314";
		  break;
		}
	  case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
		{
	      ssPrefix = "eap";
	      break;
		}
	  case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
	      ssPrefix = "adso";
	      break;
		}
	  default:
		{
		  throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
		}
	  }

   selectStr = "SELECT  " +
   	   ssPrefix + "_MOVEMENT.ID, " +
	   ssPrefix + "_MOVEMENT.ID_STATE, " +
	   ssPrefix + "_MOVEMENT.STARTDATE, " +
	   ssPrefix + "_MOVEMENT.NOTE, " +
	   ssPrefix + "_MOVEMENT.ID_PARENT, " +
	   ssPrefix + "_MOVEMENT.ID_USER, " +
	   ssPrefix + "_MOVEMENT.REALDATE, " +
	   ssPrefix + "_MOVEMENT.CANCELED, " +
	   ssPrefix + "_MOVEMENT.ID_USER_CANCELED, " +
	   ssPrefix + "_MOVEMENT.CANCELEDDATE, " +
	   ssPrefix + "_MOVEMENT.CANCELEDNOTE, " +
	   ssPrefix + "_MOVEMENT.IS_COMPLETED, " +
	   ssPrefix + "_MOVEMENT.ID_MOVEMENT_STATUS, " +
	   ssPrefix + "_MOVEMENT.ADDNOTE, " +
	   ssPrefix + "_MOVEMENT.READ_STATUS, " +
	   ssPrefix + "_MOVEMENT.ID_USER_READ, " +
	   ssPrefix + "_MOVEMENT.READ_DATE, " +
	   ssPrefix + "_MOVEMENT.ID_USER_CREATED, " +
	   ssPrefix + "_MOVEMENT.MODIFYTIME, " +
	   ssPrefix + "_MOVEMENT.PASTDATE, " +
	   ssPrefix + "_MOVEMENT.ID_PACK " +

     " FROM CN." + ssPrefix + "_MOVEMENT WHERE " + ssPrefix + "_MOVEMENT.ID = ?";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObject.id);
     set = statement.executeQuery();
     if(!set.next())
      anObject.id = Integer.MIN_VALUE;
     else
      {
       anObject.id = set.getInt(1);
       anObject.id_state = set.getInt(2);
       if ( set.wasNull() )
          anObject.id_state = Integer.MIN_VALUE;
       anObject.startdate = set.getDate(3);
       anObject.note = set.getString(4);
       anObject.id_parent = set.getInt(5);
       if ( set.wasNull() )
          anObject.id_parent = Integer.MIN_VALUE;
       anObject.id_user = set.getInt(6);
       if ( set.wasNull() )
          anObject.id_user = Integer.MIN_VALUE;
       anObject.realdate = set.getDate(7);
       anObject.canceled = set.getInt(8);
       if ( set.wasNull() )
          anObject.canceled = Integer.MIN_VALUE;
       anObject.id_user_canceled = set.getInt(9);
       if ( set.wasNull() )
          anObject.id_user_canceled = Integer.MIN_VALUE;
       anObject.canceleddate = set.getDate(10);
       anObject.cancelednote = set.getString(11);
       anObject.is_completed = set.getInt(12);
       if ( set.wasNull() )
          anObject.is_completed = Integer.MIN_VALUE;
       anObject.id_movement_status = set.getInt(13);
       if ( set.wasNull() )
          anObject.id_movement_status = Integer.MIN_VALUE;
       anObject.addnote = set.getString(14);
       anObject.read_status = set.getInt(15);
       if ( set.wasNull() )
          anObject.read_status = Integer.MIN_VALUE;
       anObject.id_user_read = set.getInt(16);
       if ( set.wasNull() )
          anObject.id_user_read = Integer.MIN_VALUE;
       anObject.read_date = set.getDate(17);
       anObject.id_user_created = set.getInt(18);
       if ( set.wasNull() )
          anObject.id_user_created = Integer.MIN_VALUE;
       anObject.modifytime = set.getDate(19);
       anObject.pastdate = set.getDate(20);
       anObject.id_pack = set.getInt(21);
       if ( set.wasNull() )
           anObject.id_pack = Integer.MIN_VALUE;
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

} // end of CNMovementDAO

