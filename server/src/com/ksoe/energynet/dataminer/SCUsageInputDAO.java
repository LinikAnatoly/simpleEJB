
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

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.SCUsageInputDAOGen;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.brief.SCUsageInputShort;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for SCUsageInput;
  *
  */

public class SCUsageInputDAO extends SCUsageInputDAOGen {


    @Override
	public int add(SCUsageInput anObject) throws PersistenceException
    {
        anObject.dateEdit = new Date();
        anObject.userGen = getUserProfile().userName;
        return super.add(anObject);
    }

    @Override
	public void save(SCUsageInput anObject) throws PersistenceException
    {
        anObject.dateEdit = new Date();
        anObject.userGen = getUserProfile().userName;
        super.save(anObject);
    }


  public SCUsageInputDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int _collectAutoIncrementNumber()
          throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("SCUSAGEINPUT", "NUMBERINT");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
          if (sequenceValue == null) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUT", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
          if (!sequenceValue.isNextValueAvailable()) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUT", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
          throw new PersistenceException(
                  "Can't obtain auto increment value from: SCUSAGEINPUT");
      } else {

          return nextSeqValue.intValue();
      }
  }


  @Override
  public SCUsageInputShortList getScrollableFilteredList(SCUsageInput aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   SCUsageInputShortList result = new SCUsageInputShortList();
   SCUsageInputShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "SCUSAGEINPUT.DATEGEN DESC, SCUSAGEINPUT.CODE DESC"; //"SCUSAGEINPUT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "SCUSAGEINPUT.CODE"+
    ",SCUSAGEINPUT.NUMBERDOC"+
    ",SCUSAGEINPUT.DATEGEN"+
    ",SCUSAGEINPUT.DATESTART"+
    ",SCUSAGEINPUT.DATEFINAL"+
    ",SCUSAGEINPUT.MOLCODE"+
    ",SCUSAGEINPUT.MOLNAME"+
    ",SCUSAGEINPUT.DATEEDIT"+
    ",SCUSAGEINPUT.USERGEN"+

     ", ENDEPARTMENT.CODE " +
     ", ENDEPARTMENT.SHORTNAME " +
     ", ENDEPARTMENT.DATESTART " +
     ", ENDEPARTMENT.DATEFINAL " +
     ", SCUSAGEINPUTSTATUS.CODE " +
     ", SCUSAGEINPUTSTATUS.NAME " +
     ", SCUSAGEINPUT.ISZKU " + 
     ", SCUSAGEINPUT.ISDOCSRECEIVED "+
    " FROM SCUSAGEINPUT " +
    ", ENDEPARTMENT " +
    ", SCUSAGEINPUTSTATUS " +
    //" WHERE "
    "";
    whereStr = " ENDEPARTMENT.CODE = SCUSAGEINPUT.DEPARTMENTCODE" ; //+
     whereStr = whereStr +" AND SCUSAGEINPUTSTATUS.CODE = SCUSAGEINPUT.STATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} SCUSAGEINPUT.CODE IN ( SELECT SCUSAGEINPUT.CODE FROM SCUSAGEINPUT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.CODE = ?";
       }
        if (aFilterObject.numberDoc != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.NUMBERDOC) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.NUMBERDOC) LIKE UPPER(?)";
        }
       if(aFilterObject.numberInt != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.NUMBERINT = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.DATEGEN = ?";
       }
       if(aFilterObject.dateStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.DATESTART = ?";
       }
       if(aFilterObject.dateFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.DATEFINAL = ?";
       }
        if (aFilterObject.molCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.MOLCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.MOLCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.molName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.MOLNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.MOLNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.COMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.DATEEDIT = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.USERGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(SCUSAGEINPUT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(SCUSAGEINPUT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.MODIFY_TIME = ?";
       }
       if(aFilterObject.isDocsReceived != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.ISDOCSRECEIVED = ?";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "SCUSAGEINPUT.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "SCUSAGEINPUT.STATUSREFCODE = ? ";
       }

       if(aFilterObject.autoCreated != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  SCUSAGEINPUT.AUTOCREATED = ?";
       }

     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%SCUsageInput.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND SCUSAGEINPUT.DOMAIN_INFO IS NOT NULL";
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

          if(aFilterObject.numberDoc != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.numberDoc);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.numberInt != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.numberInt);
        }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
       if(aFilterObject.dateStart != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
       }
       if(aFilterObject.dateFinal != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
       }

          if(aFilterObject.molCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.molCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.molName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.molName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
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
       if(aFilterObject.isDocsReceived != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.isDocsReceived);
       }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.department.code);
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }

      if(aFilterObject.autoCreated != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.autoCreated);
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

       anObject = new SCUsageInputShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.numberDoc = set.getString(2);
       anObject.dateGen = set.getDate(3);
       anObject.dateStart = set.getDate(4);
       anObject.dateFinal = set.getDate(5);
       anObject.molCode = set.getString(6);
       anObject.molName = set.getString(7);
       anObject.dateEdit = set.getTimestamp(8);
       anObject.userGen = set.getString(9);

       anObject.departmentCode = set.getInt(10);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
       anObject.departmentShortName = set.getString(11);
       anObject.departmentDateStart = set.getDate(12);
       anObject.departmentDateFinal = set.getDate(13);
       anObject.statusRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
       anObject.statusRefName = set.getString(15);
       anObject.iszku = set.getInt(16);
       if(set.wasNull())
       anObject.iszku = Integer.MIN_VALUE;

       anObject.isDocsReceived = set.getInt(17);
       if(set.wasNull())
    	   anObject.isDocsReceived = Integer.MIN_VALUE;

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

  public SCUsageInput getObjectNOSEGR(int uid) throws PersistenceException
  {
   SCUsageInput result = new SCUsageInput();
   result.code = uid;
   loadObjectNOSEGR(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }


 public void loadObjectNOSEGR(SCUsageInput anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
   "SELECT  SCUSAGEINPUT.CODE, SCUSAGEINPUT.NUMBERDOC, SCUSAGEINPUT.NUMBERINT, SCUSAGEINPUT.DATEGEN, SCUSAGEINPUT.DATESTART, SCUSAGEINPUT.DATEFINAL, SCUSAGEINPUT.MOLCODE, SCUSAGEINPUT.MOLNAME, SCUSAGEINPUT.COMMENTGEN, SCUSAGEINPUT.DATEEDIT, SCUSAGEINPUT.ISZKU, SCUSAGEINPUT.ISPRINTED, SCUSAGEINPUT.MOLCODECOUNTER, SCUSAGEINPUT.MOLNAMECOUNTER, SCUSAGEINPUT.AUTOCREATED, SCUSAGEINPUT.USERGEN, SCUSAGEINPUT.DOMAIN_INFO, SCUSAGEINPUT.MODIFY_TIME, SCUSAGEINPUT.DEPARTMENTCODE, SCUSAGEINPUT.STATUSREFCODE "
   +" FROM SCUSAGEINPUT WHERE SCUSAGEINPUT.CODE = ?";

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
       anObject.numberDoc = set.getString(2);
       anObject.numberInt = set.getInt(3);
       if ( set.wasNull() )
          anObject.numberInt = Integer.MIN_VALUE;
       anObject.dateGen = set.getDate(4);
       anObject.dateStart = set.getDate(5);
       anObject.dateFinal = set.getDate(6);
       anObject.molCode = set.getString(7);
       anObject.molName = set.getString(8);
       anObject.commentGen = set.getString(9);
       anObject.dateEdit = set.getTimestamp(10);
       anObject.iszku = set.getInt(11);
       if ( set.wasNull() )
          anObject.iszku = Integer.MIN_VALUE;
       anObject.isprinted = set.getInt(12);
       if ( set.wasNull() )
          anObject.isprinted = Integer.MIN_VALUE;
       anObject.molCodeCounter = set.getString(13);
       anObject.molNameCounter = set.getString(14);
       anObject.autoCreated = set.getInt(15);
       if ( set.wasNull() )
          anObject.autoCreated = Integer.MIN_VALUE;
       anObject.userGen = set.getString(16);
       anObject.domain_info = set.getString(17);
       anObject.modify_time = set.getLong(18);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.department.code = set.getInt(19);
       if ( set.wasNull() )
           anObject.department.code = Integer.MIN_VALUE;
       anObject.statusRef.code = set.getInt(20);
       if ( set.wasNull() )
           anObject.statusRef.code = Integer.MIN_VALUE;
       if(anObject.department.code != Integer.MIN_VALUE)
       {
          anObject.setDepartment(
     new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
   }
       if(anObject.statusRef.code != Integer.MIN_VALUE)
       {
          anObject.setStatusRef(
     new com.ksoe.energynet.dataminer.generated.SCUsageInputStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
   }
     }
   }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     throw new SystemException(e.getMessage(), e);
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

	public int[] getFilteredCodeArrayNOSEGR(SCUsageInputFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArrayNOSEGR(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArrayNOSEGR(SCUsageInputFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArrayNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public int[] getFilteredCodeArrayNOSEGR(SCUsageInput aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUT.CODE FROM SCUSAGEINPUT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				/*if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}*/
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

} // end of SCUsageInputDAO

