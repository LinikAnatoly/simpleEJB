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
import com.ksoe.energynet.dataminer.generated.ENContractDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.brief.ENContractShort;
import com.ksoe.energynet.valueobject.lists.ENContractShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.valueobject.RQOrg;

/**
 * DAO Object for ENContract;
 *
 */

public class ENContractDAO extends ENContractDAOGen {

	public ENContractDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENContractDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public int add(ENContract anObject) throws PersistenceException {
		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;


	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (anObject.finDocCode != null && !anObject.finDocCode.equals("")) {

		    	if (anObject.contractNumber != null && !anObject.contractNumber.equals("")) {

		    		RQOrgDAO orgDao = new RQOrgDAO(getConnection(), getUserProfile());
    	    		RQOrg org = orgDao.getObject(anObject.org.code);

    	    		if (org == null || org.codeorg == null) {
    	    			throw new EnergyproSystemException("\n " +
                                "\n Неможливо визначити постачальника!!!");
    	    		}

		    		boolean isCustomer = false;
		    		boolean isException = false;

		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	anObject.generalContractRef.code = contractLogic
								.addByContractNumber(anObject.contractNumber, org.codeorg, anObject.finDocCode, isCustomer, isException);

		        }
		    }
	    }


		return super.add(anObject);
	}


	@Override
	public void save(ENContract anObject) throws PersistenceException {
		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;

		if (anObject.org.code == Integer.MIN_VALUE){
			throw new EnergyproSystemException("anObject.org.code is null ");
		}


	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (anObject.finDocCode != null && !anObject.finDocCode.equals("")) {

		    	if (anObject.contractNumber != null && !anObject.contractNumber.equals("")) {

		    		RQOrgDAO orgDao = new RQOrgDAO(getConnection(), getUserProfile());
    	    		RQOrg org = orgDao.getObject(anObject.org.code);

    	    		if (org == null || org.codeorg == null) {
    	    			throw new EnergyproSystemException("\n " +
                                "\n Неможливо визначити постачальника!!!");
    	    		}

		    		boolean isCustomer = false;
		    		boolean isException = false;

		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	anObject.generalContractRef.code = contractLogic
								.addByContractNumber(anObject.contractNumber, org.codeorg, anObject.finDocCode, isCustomer, isException);

		        }
		    }
	    }


		super.save(anObject);
	}

	@Override
	public ENContractShortList getScrollableFilteredList(ENContract aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
	   {
	    ENContractShortList result = new ENContractShortList();
	    ENContractShort anObject;
	    result.list = new Vector();

	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;
	    String     whereStr = "";
	    String     condition = processCondition(anCondition);
	    String     orderBy = processCondition(anOrderBy);

	    if(orderBy.length() == 0)
	     orderBy = "ENCONTRACT.CONTRACTDATE";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    selectStr = "SELECT "+
	     "ENCONTRACT.CODE"+
	     ",ENCONTRACT.CONTRACTNUMBER"+
	     ",ENCONTRACT.CONTRACTDATE"+
	     ",ENCONTRACT.CONTRACTENDDATE"+
	     ",ENCONTRACT.FINDOCCODE"+
	     ",ENCONTRACT.FINDOCID"+
	     ",ENCONTRACT.USERGEN"+
	     ",ENCONTRACT.DATEEDIT"+

	     ", ENCONTRACT.ORGCODE" +
	     ", rqorg.name as orgname " +
	     " , ct.name as CONTRACTTYPENAME " +
	     " , ct.code as CONTRACTTYPECODE " +

			", pitend.CODE " +
			", pitend.IDENTID " +
			", pitend.IDENTID2 " +
			", pitend.PURCHASENAME " +
			", pitend.FINANCINGSOURCE " +
			", pitend.SUMGENWITHNDS " +
			", pitend.SUMFACTWITHNDS " +
			", pitend.TENTATIVEYEARGEN " +
			", pitend.TENTATIVEMONTHGEN " +
			", pitend.COUNTSYMBOLFORGROUP " +
			", pitend.COMMENTGEN " +

			", ENCONTRACT.GENERALCONTRACTREFCODE " +  // 24

	     " FROM ENCONTRACT left join encontracttype ct on (ct.code = ENCONTRACT.CONTRACTTYPECODE)    " +
	     "                               left join RQPURCHASEITEMTENDER pitend on ( pitend.CODE = ENCONTRACT.PURCHASEITEMTENDERCODE) "  +
	     " , rqorg " +
	  "";
	    whereStr = "  ENCONTRACT.orgcode = rqorg.code  ";
	    //selectStr = selectStr + " ${s} ENCONTRACT.CODE IN ( SELECT ENCONTRACT.CODE FROM ENCONTRACT ";

	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.CODE = ?";
	        }
	         if (aFilterObject.contractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENCONTRACT.CONTRACTNUMBER) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENCONTRACT.CONTRACTNUMBER) LIKE UPPER(?)";
	         }
	        if(aFilterObject.contractDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.CONTRACTDATE = ?";
	        }
	        if(aFilterObject.contractEndDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.CONTRACTENDDATE = ?";
	        }
	         if (aFilterObject.finDocCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENCONTRACT.FINDOCCODE) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENCONTRACT.FINDOCCODE) LIKE UPPER(?)";
	         }
	        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.FINDOCID = ?";
	        }
	         if (aFilterObject.commentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENCONTRACT.COMMENTGEN) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENCONTRACT.COMMENTGEN) LIKE UPPER(?)";
	         }
	         if (aFilterObject.userGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENCONTRACT.USERGEN) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENCONTRACT.USERGEN) LIKE UPPER(?)";
	         }
	        if(aFilterObject.dateEdit != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.DATEEDIT = ?";
	        }
	        if(aFilterObject.modify_time != Long.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENCONTRACT.MODIFY_TIME = ?";
	        }
	        if(aFilterObject.org.code != Integer.MIN_VALUE) {
	        	if(aFilterObject.org.code !=0) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENCONTRACT.ORGCODE = ? ";
	        	}
	        }

	        if(aFilterObject.purchaseItemTender.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "pitend.CODE = ? ";
	        }

	        if(aFilterObject.org.id != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  rqorg.ID = ?";
	        }

	        if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + " ENCONTRACT.GENERALCONTRACTREFCODE = ?";
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

	           if(aFilterObject.contractNumber != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.contractNumber);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	        if(aFilterObject.contractDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
	        }
	        if(aFilterObject.contractEndDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractEndDate.getTime()));
	        }

	           if(aFilterObject.finDocCode != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.finDocCode);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         if(aFilterObject.finDocID != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.finDocID);
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
	       if(aFilterObject.org.code != Integer.MIN_VALUE) {
	    	   if(aFilterObject.org.code != 0) {
	           number++;
	           statement.setInt(number,aFilterObject.org.code);
	    	   }
	       }

				if (aFilterObject.purchaseItemTender.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.purchaseItemTender.code);
				}

				if (aFilterObject.org.id != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.org.id);
				}

				if (aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.generalContractRef.code);
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

	        anObject = new ENContractShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.contractNumber = set.getString(2);
	        anObject.contractDate = set.getDate(3);
	        anObject.contractEndDate = set.getDate(4);
	        anObject.finDocCode = set.getString(5);
	        anObject.finDocID = set.getInt(6);
	        if ( set.wasNull() )
	            anObject.finDocID = Integer.MIN_VALUE;
	        anObject.userGen = set.getString(7);
	        anObject.dateEdit = set.getDate(8);

	        anObject.orgCode = set.getInt(9);
	        if(set.wasNull())
	        	anObject.orgCode = Integer.MIN_VALUE;

	        anObject.orgName = set.getString(10);

	        anObject.contractTypeName = set.getString("contracttypename");

	        anObject.contractTypeCode = set.getInt("contracttypecode");
	        if ( set.wasNull() )
	            anObject.contractTypeCode = Integer.MIN_VALUE;

	        anObject.generalContractRefCode = set.getInt(24);
	        if ( set.wasNull() )
	            anObject.generalContractRefCode = Integer.MIN_VALUE;


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


	@Override
	public int setParameters(ENContract filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractEndDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.org.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contractType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.purchaseItemTender.code, index, statement);
			index--;
		}
		return index;
	}



} // end of ENContractDAO

