
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Thu Oct 08 13:57:38 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.brief.ENDepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENDepartment;
  *
  */

public class ENDepartmentDAO extends ENDepartmentDAOGen {

	public ENDepartmentShortList getDepartmentListFromSprav(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
	   {
	    ENDepartmentShortList result = new ENDepartmentShortList();
	    ENDepartmentShort anObject;
	    result.list = new Vector();

	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;
	    String     whereStr = "";
	    String     condition = processCondition(anCondition);
	    String     orderBy = processCondition(anOrderBy);

	    if(orderBy.length() == 0)
	     orderBy = " sa.name ";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    selectStr = "select sa.id  , sa.name from sprav.service sa ";


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

	        anObject = new ENDepartmentShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.shortName = set.getString(2);


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

	  public ENDepartmentShortList getScrollableFilteredList(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
	   {
	    ENDepartmentShortList result = new ENDepartmentShortList();
	    ENDepartmentShort anObject;
	    result.list = new Vector();

	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;
	    String     whereStr = "";
	    String     condition = processCondition(anCondition);
	    String     orderBy = processCondition(anOrderBy);

	    if(orderBy.length() == 0)
	     orderBy = "ENDEPARTMENT.CODE";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    selectStr =
	    		" select endepartment.code, " +
	    		" endepartment.shortname, " +
	    		" endepartment.datestart, " +
	    		" endepartment.datefinal, " +
	    		" endepartment.parentrefcode, " +
	    		" (select e1.shortname from endepartment e1 where e1.code = endepartment.parentrefcode), " +
	    		" endepartmenttype.code, " +
	    		" endepartmenttype.name, " +
	    		" endepartment.rencode, " +
	    		" endepartment.shpzbalans, " +
	    		" endepartment.kau_1884, " +
	    		" endepartment.name_1884, " +
	    		" endepartment.managementrefcode, " +
	    		" endepartment.hrmorganizationid " +  
	    		" from endepartment, endepartmenttype";

	      whereStr = whereStr + " endepartmenttype.code = endepartment.typerefcode and datefinal is null";

	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENDEPARTMENT.CODE = ?";
	        }
	         if (aFilterObject.shortName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME = ?";
	             else
	                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME LIKE ?";
	         }
	        if(aFilterObject.dateStart != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENDEPARTMENT.DATESTART = ?";
	        }
	        if(aFilterObject.dateFinal != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENDEPARTMENT.DATEFINAL = ?";
	        }
	        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENDEPARTMENT.PARENTREFCODE = ? ";
	        }
	        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENDEPARTMENT.TYPEREFCODE = ? ";
	        }
	        if(aFilterObject.renCode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENDEPARTMENT.RENCODE = ? ";
	        }
	        if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENDEPARTMENT.MANAGEMENTREFCODE = ? ";
	        }
	        if (aFilterObject.hrmorganizationid != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.HRMORGANIZATIONID) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENDEPARTMENT.HRMORGANIZATIONID) LIKE UPPER(?)";
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
	         if (aFilterObject.name != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENDEPARTMENT.NAME = ?";
	             else
	                 whereStr = whereStr + " ENDEPARTMENT.NAME LIKE ?";

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
	         }
	         if (aFilterObject.shortName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME = ?";
	             else
	                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME LIKE ?";

	           if(aFilterObject.shortName != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.shortName);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if(aFilterObject.isVirtual != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.isVirtual);
	         }
	        if(aFilterObject.dateStart != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
	        }
	        if(aFilterObject.dateFinal != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
	        }
	       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.parentRef.code);
	       }
	       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.typeRef.code);
	       }

	       if(aFilterObject.renCode != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.renCode);
	       }

	       if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.managementRef.code);
	       }
	     
	       if(aFilterObject.hrmorganizationid != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.hrmorganizationid);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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

	        anObject = new ENDepartmentShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.shortName = set.getString(2);
	        anObject.dateStart = set.getDate(3);
	        anObject.dateFinal = set.getDate(4);

	        anObject.parentRefCode = set.getInt(5);
			if(set.wasNull())
				anObject.parentRefCode = Integer.MIN_VALUE;
	        anObject.parentRefShortName = set.getString(6);

	        anObject.typeRefCode = set.getInt(7);
			if(set.wasNull())
				anObject.typeRefCode = Integer.MIN_VALUE;
	        anObject.typeRefName = set.getString(8);

	        anObject.renCode = set.getInt(9);
	        if ( set.wasNull() )
	            anObject.renCode = Integer.MIN_VALUE;

	        anObject.shpzBalans = set.getString(10);
	        anObject.kau_1884 = set.getString(11);
	        anObject.name_1884 = set.getString(12);

	        anObject.managementRefCode = set.getInt(13);
			if(set.wasNull())
				anObject.managementRefCode = Integer.MIN_VALUE;
			
			anObject.hrmorganizationid = set.getString(14);

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

	  public int getRenCodeFromEndepartmentByCode(int codeDepartment) throws PersistenceException {
			Connection connection = getConnection();
			PreparedStatement statement = null;
			ResultSet set = null;

			String SQL = " select d.rencode from endepartment d where d.code = " + codeDepartment ;

			int renCode = Integer.MIN_VALUE;

			try {
				statement = connection.prepareStatement(SQL);

				set = statement.executeQuery();
				int i;
				for (i = 0; set.next(); i++) {
					renCode = set.getInt(1);
					if (set.wasNull())
						renCode = Integer.MIN_VALUE;
				}

				return renCode;
			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + SQL);
				EnergyproPersistenceExceptionAnalyzer.analyser
						.throwPersistenceException(e);
				return renCode;
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



  //public ENDepartmentDAO() {super();}
  //public ENDepartmentDAO(Connection aConnection) {super(aConnection);}
  //public ENDepartmentDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENDepartmentDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDepartmentDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void save(ENDepartment department) throws PersistenceException
  {
	  ENDepartment oldDepartment = getObject(department.code);

	  if (oldDepartment.renCode != Integer.MIN_VALUE) {

		  department.renCode = oldDepartment.renCode;
	  }

	  super.save(department);
  }
  
  public int[] getFilteredCodeArray(ENDepartmentFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> parameters) throws PersistenceException {
	  return super.getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL)
			  , fromPosition, quantity, parameters);
  }


} // end of ENDepartmentDAO

