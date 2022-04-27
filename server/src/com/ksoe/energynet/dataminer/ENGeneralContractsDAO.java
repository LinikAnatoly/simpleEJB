//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENGeneralContracts;
 *
 */

public class ENGeneralContractsDAO extends ENGeneralContractsDAOGen {

	public ENGeneralContractsDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENGeneralContractsDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public int add(ENGeneralContracts contract) throws PersistenceException {
		UserProfile userProfile = getUserProfile();
		Connection connection = getConnection();
		try {

			contract.code = Integer.MIN_VALUE;
			contract.userGen = getUserProfile().userName;
			contract.dateEdit = new Date();

			ContractLogic contractLogic = new ContractLogic(connection, userProfile);
			ENGeneralContracts distContract = contractLogic.checkUnicContract(contract);


			/** если есть такая запись - используем её */
			if (distContract.code != Integer.MIN_VALUE) {

				return distContract.code;

			} else {
				/** если изменилось одно из полей - добавляем */

				return super.add(contract);
			}

		} finally {
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}



	public int[] getUnicFilteredCodeArray(ENGeneralContractsFilter aFilterObject,
			int fromPosition, int quantity) throws PersistenceException {

		return getUnicFilteredCodeArray(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}


	public int[] getUnicFilteredCodeArray(ENGeneralContracts aFilterObject,
			String anCondition, String anOrderBy, int fromPosition,
			int quantity, Vector aBindObjects) throws PersistenceException {

		Vector result = new Vector();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT max(ENGENERALCONTRACTS.CODE) FROM ENGENERALCONTRACTS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String groupBy = processCondition(anOrderBy);

        /* !!! group By !!! */
        if (groupBy.length() == 0)
        	groupBy = " finDocID, finDocCode, contractNumber, contractDate, commentGen, partnerId, partnerCode, partnerName, "
        			+ " axcontractid, axcontractcode, axcontractnumber, axcontractdate, axcontractcommentgen, "
        			+ " axcontractgroupcode, axpartnercode, axpartnername, axcontractaccount ";


	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.CODE = ?";
	        }
	        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.FINDOCID = ?";
	        }
	         if (aFilterObject.finDocCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.FINDOCCODE = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.FINDOCCODE LIKE ?";
	         }
	         if (aFilterObject.contractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTNUMBER = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTNUMBER LIKE ?";
	         }
	        if(aFilterObject.contractDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTDATE = ?";
	        }
	         if (aFilterObject.commentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.COMMENTGEN = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.COMMENTGEN LIKE ?";
	         }
	        if(aFilterObject.partnerId != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERID = ?";
	        }
	         if (aFilterObject.partnerCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERCODE = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERCODE LIKE ?";
	         }
	         if (aFilterObject.partnerName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERNAME = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERNAME LIKE ?";
	         }
	        if(aFilterObject.contractRegDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTREGDATE = ?";
	        }
	        if(aFilterObject.contractStartDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTSTARTDATE = ?";
	        }
	        if(aFilterObject.contractEndDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTENDDATE = ?";
	        }
	         if (aFilterObject.axContractId != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractId.indexOf('*',0) < 0 && aFilterObject.axContractId.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTID = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTID LIKE ?";
	         }
	         if (aFilterObject.axContractCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractCode.indexOf('*',0) < 0 && aFilterObject.axContractCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTCODE = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTCODE LIKE ?";
	         }
	         if (aFilterObject.axContractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractNumber.indexOf('*',0) < 0 && aFilterObject.axContractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTNUMBER = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTNUMBER LIKE ?";
	         }
	         if (aFilterObject.axContractAccount != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractAccount.indexOf('*',0) < 0 && aFilterObject.axContractAccount.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTACCOUNT = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTACCOUNT LIKE ?";
	         }
	        if(aFilterObject.axContractDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTDATE = ?";
	        }
	         if (aFilterObject.axContractCommentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractCommentGen.indexOf('*',0) < 0 && aFilterObject.axContractCommentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN LIKE ?";
	         }
	         if (aFilterObject.axContractGroupCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axContractGroupCode.indexOf('*',0) < 0 && aFilterObject.axContractGroupCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTGROUPCODE = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTGROUPCODE LIKE ?";
	         }
	         if (aFilterObject.axPartnerCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axPartnerCode.indexOf('*',0) < 0 && aFilterObject.axPartnerCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXPARTNERCODE = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXPARTNERCODE LIKE ?";
	         }
	         if (aFilterObject.axPartnerName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.axPartnerName.indexOf('*',0) < 0 && aFilterObject.axPartnerName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXPARTNERNAME = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.AXPARTNERNAME LIKE ?";
	         }
	         if (aFilterObject.userGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.USERGEN = ?";
	             else
	                 whereStr = whereStr + "  ENGENERALCONTRACTS.USERGEN LIKE ?";
	         }
	        if(aFilterObject.dateEdit != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.DATEEDIT = ?";
	        }
	        if(aFilterObject.modify_time != Long.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENGENERALCONTRACTS.MODIFY_TIME = ?";
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

	    selectStr = selectStr + " GROUP BY " + groupBy;

	    try
	     {
	      statement = connection.prepareStatement(selectStr);
	      int number = 0;
	      if(aFilterObject != null){
	         if(aFilterObject.code != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.code);
	         }
	         if(aFilterObject.finDocID != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.finDocID);
	         }
	         if (aFilterObject.finDocCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.FINDOCCODE = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.FINDOCCODE LIKE ?";

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
	         }
	         if (aFilterObject.contractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.CONTRACTNUMBER = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.CONTRACTNUMBER LIKE ?";

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
	         }
	        if(aFilterObject.contractDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
	        }
	         if (aFilterObject.commentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.COMMENTGEN = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.COMMENTGEN LIKE ?";

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
	         }
	         if(aFilterObject.partnerId != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.partnerId);
	         }
	         if (aFilterObject.partnerCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.PARTNERCODE = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.PARTNERCODE LIKE ?";

	           if(aFilterObject.partnerCode != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.partnerCode);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.partnerName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.PARTNERNAME = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.PARTNERNAME LIKE ?";

	           if(aFilterObject.partnerName != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.partnerName);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	        if(aFilterObject.contractRegDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractRegDate.getTime()));
	        }
	        if(aFilterObject.contractStartDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractStartDate.getTime()));
	        }
	        if(aFilterObject.contractEndDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.contractEndDate.getTime()));
	        }
	         if (aFilterObject.axContractId != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractId.indexOf('*',0) < 0 && aFilterObject.axContractId.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTID = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTID LIKE ?";

	           if(aFilterObject.axContractId != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractId);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axContractCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractCode.indexOf('*',0) < 0 && aFilterObject.axContractCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTCODE = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTCODE LIKE ?";

	           if(aFilterObject.axContractCode != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractCode);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axContractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractNumber.indexOf('*',0) < 0 && aFilterObject.axContractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTNUMBER = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTNUMBER LIKE ?";

	           if(aFilterObject.axContractNumber != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractNumber);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axContractAccount != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractAccount.indexOf('*',0) < 0 && aFilterObject.axContractAccount.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTACCOUNT = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTACCOUNT LIKE ?";

	           if(aFilterObject.axContractAccount != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractAccount);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	        if(aFilterObject.axContractDate != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.axContractDate.getTime()));
	        }
	         if (aFilterObject.axContractCommentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractCommentGen.indexOf('*',0) < 0 && aFilterObject.axContractCommentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN LIKE ?";

	           if(aFilterObject.axContractCommentGen != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractCommentGen);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axContractGroupCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axContractGroupCode.indexOf('*',0) < 0 && aFilterObject.axContractGroupCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTGROUPCODE = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXCONTRACTGROUPCODE LIKE ?";

	           if(aFilterObject.axContractGroupCode != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axContractGroupCode);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axPartnerCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axPartnerCode.indexOf('*',0) < 0 && aFilterObject.axPartnerCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXPARTNERCODE = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXPARTNERCODE LIKE ?";

	           if(aFilterObject.axPartnerCode != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axPartnerCode);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.axPartnerName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.axPartnerName.indexOf('*',0) < 0 && aFilterObject.axPartnerName.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXPARTNERNAME = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.AXPARTNERNAME LIKE ?";

	           if(aFilterObject.axPartnerName != null){
	               number++;
	               StringBuffer likeStr = new StringBuffer();
	               likeStr.append(aFilterObject.axPartnerName);
	               for(int i = 0;i < likeStr.length();i++){
	                    if(likeStr.charAt(i) == '*')
	                         likeStr.setCharAt(i,'%');
	                    if(likeStr.charAt(i) == '?')
	                         likeStr.setCharAt(i,'_');
	               }
	               statement.setString(number,likeStr.toString());
	           }
	         }
	         if (aFilterObject.userGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND";
	             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + " ENGENERALCONTRACTS.USERGEN = ?";
	             else
	                 whereStr = whereStr + " ENGENERALCONTRACTS.USERGEN LIKE ?";

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
	  } // end of getFilteredCodeArray


	public ENGeneralContractsShortList getListByAct(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENGeneralContractsFilter gecContrFil = new ENGeneralContractsFilter();
      	 gecContrFil.conditionSQL = " engeneralcontracts.code in  ( select gc.code  from enact2enplanwork a2p , entechcond2planwork tc2p  , entechconditionsservcs vcs  ,  enconnectionkind k , engeneralcontracts gc  \n"+
			" where a2p.actrefcode = " + act.code + " \n"+
			" and a2p.plancode= tc2p.planrefcode  \n"+
			" and tc2p.techconservicesrefcode = vcs.code \n"+
			" and vcs.connectionkindrefcode = k.code \n"+
			" and gc.findocid = vcs.findocid \n"+
			" and gc.partnercode = vcs.partnercode ) \n" ;
      	return this.getScrollableFilteredList(gecContrFil, 0, -1);
	}

	public ENGeneralContractsShortList getOrgList(
			ENGeneralContractsFilter aFilterObject, int fromPosition,
			int quantity) {

		{
			ENGeneralContractsShortList result = new ENGeneralContractsShortList();
			ENGeneralContractsShort anObject;
			result.list = new Vector();

			String selectStr;
			Connection connection = getConnection();
			PreparedStatement statement = null;
			ResultSet set = null;
			String whereStr = "";

			/*
		    selectStr = "select s.partnercode, s.partnername, count(s.contractnumber) "
		    		+ " from engeneralcontracts s "
		    		+ " where s.axcontractcode is null "
		    		+ " and s.findoccode not in ( '00000' ) "
		    		// + "  and s.partnerCode = '0Б0Ц' "
		    		+ " group by s.partnercode, s.partnername "
		    		+ " order by 3 desc";
		    */



			selectStr = "select s.code, s.findoccode, s.contractnumber, s.partnercode "
					+ " from enservicesobject s "
					+ " where s.findocid is not null "
					// + " and s.contractnumber not in ( '01014' ) "
					// + " and s.contractnumber not in ( '01014', '00000', '01023', '01075' ) "
					+ " and s.generalcontractrefcode is null "
					// + " and s.code = 1017061802 "
					// + " and s.contractdateservices >= '01.01.2015' "
					// + " and s.contractdateservices between '01.01.2015' and '01.01.2016' "
					// + " and s.contractdateservices between '01.01.2016' and '01.08.2016' "
					// + " and s.contractdateservices between '01.08.2016' and '01.10.2016' "
					// + " and s.contractdateservices between '01.10.2016' and '31.12.2016' "
					+ " order by s.findocid, s.partnercode ";



			/*
			selectStr = "select s.code, s.findoccode, s.contractnumber, s.partnercode "
					+ " from enservicesfromsidebjct s "
					+ " where s.findocid is not null "
					+ " and s.partnercode is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid ";
			*/

			/*
			selectStr = " select oi.code, oi.findoccode, oi.contractnumber, r.codeorg "
					+ " from rqfkorderitem oi, rqfkorder o, rqorg r "
					+ " where o.code = oi.fkorderrefcode "
					+ " and r.code = o.orgcode "
					+ " and oi.findocid is not null "
					+ " and oi.generalcontractrefcode is null "
					+ " order by oi.findocid, r.codeorg  ";
			*/

			/*
			selectStr = " select o.code, o.findoccode, o.contractnumber, r.codeorg "
					+ " from fincontracts o, rqorg r "
					+ " where r.code = o.orgcode "
					+ " and o.findocid is not null "
					+ " and o.generalcontractrefcode is null "
					+ " order by o.findocid, r.codeorg ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.fincontractnumber, s.partnercode "
					+ " from entechconditionsservcs s "
					+ " where s.findocid is not null "
					+ " and s.partnercode is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid, s.partnercode ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.contractnumber, s.partnercode "
					+ " from enactincome s "
					+ " where s.findocid is not null "
					+ " and s.partnercode is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid, s.partnercode ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.contractnumber, r.codeorg "
					+ " from encontract s, rqorg r "
					+ " where r.code = s.orgcode "
					+ " and s.findocid is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid, r.codeorg ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.contractnumber, r.codeorg "
					+ " from enestimateitem2contrct s, rqorg r "
					+ " where r.code = s.orgcode "
					+ " and s.findocid is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid, r.codeorg ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.contractnumber, s.partnercode "
					+ " from entechagrmnt2srvcsbjct s "
					+ " where s.findocid is not null "
					+ " and s.generalcontractrefcode is null"
					+ " order by s.findocid, s.partnercode ";
			*/

			/*
			selectStr = " select s.code, s.findoccode, s.contractnumber, r.codeorg "
					+ " from rqorderitem s, rqorg r "
					+ " where r.code = s.orgcode "
					+ " and s.findocid is not null "
					+ " and s.generalcontractrefcode is null "
					+ " order by s.findocid, r.codeorg " ;
			*/

			/*
			selectStr = " select bi.code, bi.findoccode, bi.contractnumber, r.codeorg "
					+ " from rqbillitem bi, rqbill b, rqorg r "
					+ " where b.orgcode = r.code "
					+ " and b.code = bi.billrefcode "
					+ " and bi.findocid is not null "
					+ " and bi.generalcontractrefcode is null "
					+ " order by bi.findocid, b.orgcode ";
			*/

			/*
			selectStr = " select b.code, b.findoccode, b.contractnumber, r.codeorg "
					+ " from rqbill b, rqorg r "
					+ " where b.orgcode = r.code "
					+ " and b.findoccode is not null "
					+ " and b.generalcontractrefcode is null "
					+ " order by b.findocid, b.orgcode ";
			*/

			/*
			selectStr = " select r.code, r.findoccode, r.contractnumber, o.codeorg"
					+ " from rqcontract2typepay r, rqorg2typepay o "
					+ " where r.org2typepayrefcode = o.code "
					+ " order by r.findocid, o.codeorg ";
			*/

			/*
			selectStr = " select r.code, r.findoccode, r.contractnumber, r.codeorg "
					+ " from tkmaterials2rqcontrcts r "
					+ " where r.generalcontractrefcode is null "
					+ " order by r.findocid, r.codeorg ";
			*/

			/*
			selectStr = " select r.code, r.findoccode, r.contractnumber, r.partnercode "
					+ " from enoperativeobject r "
					+ " where r.generalcontractrefcode is null "
					+ " order by r.findocid, r.partnercode ";
			*/

			/*
			selectStr = " select r.code, r.findoccode, r.contractnumber, r.orgcode, r.generalcontractrefcode "
					+ " from enipitem2contract r "
					+ " where r.generalcontractrefcode is null "
					+ " order by r.findocid, r.orgcode ";
			*/



		      if(aFilterObject != null)
		      {
		        if(aFilterObject.code != Integer.MIN_VALUE) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.CODE = ?";
		        }
		        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.FINDOCID = ?";
		        }
		         if (aFilterObject.finDocCode != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.FINDOCCODE) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.FINDOCCODE) LIKE UPPER(?)";
		         }
		         if (aFilterObject.contractNumber != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.CONTRACTNUMBER) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.CONTRACTNUMBER) LIKE UPPER(?)";
		         }
		        if(aFilterObject.contractDate != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTDATE = ?";
		        }
		         if (aFilterObject.commentGen != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.COMMENTGEN) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.COMMENTGEN) LIKE UPPER(?)";
		         }
		        if(aFilterObject.partnerId != Integer.MIN_VALUE) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.PARTNERID = ?";
		        }
		         if (aFilterObject.partnerCode != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.PARTNERCODE) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.PARTNERCODE) LIKE UPPER(?)";
		         }
		         if (aFilterObject.partnerName != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.PARTNERNAME) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.PARTNERNAME) LIKE UPPER(?)";
		         }
		        if(aFilterObject.contractRegDate != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTREGDATE = ?";
		        }
		        if(aFilterObject.contractStartDate != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTSTARTDATE = ?";
		        }
		        if(aFilterObject.contractEndDate != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.CONTRACTENDDATE = ?";
		        }
		         if (aFilterObject.axContractId != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axContractId.indexOf('*',0) < 0 && aFilterObject.axContractId.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXCONTRACTID) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXCONTRACTID) LIKE UPPER(?)";
		         }
		         if (aFilterObject.axContractCode != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axContractCode.indexOf('*',0) < 0 && aFilterObject.axContractCode.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXCONTRACTCODE) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXCONTRACTCODE) LIKE UPPER(?)";
		         }
		         if (aFilterObject.axContractNumber != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axContractNumber.indexOf('*',0) < 0 && aFilterObject.axContractNumber.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXCONTRACTNUMBER) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXCONTRACTNUMBER) LIKE UPPER(?)";
		         }
		        if(aFilterObject.axContractDate != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.AXCONTRACTDATE = ?";
		        }
		         if (aFilterObject.axContractCommentGen != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axContractCommentGen.indexOf('*',0) < 0 && aFilterObject.axContractCommentGen.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN) LIKE UPPER(?)";
		         }
		         if (aFilterObject.axContractGroupCode != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axContractGroupCode.indexOf('*',0) < 0 && aFilterObject.axContractGroupCode.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXCONTRACTGROUPCODE) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXCONTRACTGROUPCODE) LIKE UPPER(?)";
		         }
		         if (aFilterObject.axPartnerCode != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axPartnerCode.indexOf('*',0) < 0 && aFilterObject.axPartnerCode.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXPARTNERCODE) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXPARTNERCODE) LIKE UPPER(?)";
		         }
		         if (aFilterObject.axPartnerName != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.axPartnerName.indexOf('*',0) < 0 && aFilterObject.axPartnerName.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.AXPARTNERNAME) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.AXPARTNERNAME) LIKE UPPER(?)";
		         }
		         if (aFilterObject.userGen != null) {
		             if(whereStr.length() != 0)
		                 whereStr = whereStr + " AND ";
		             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
		                 whereStr = whereStr + "  UPPER(ENGENERALCONTRACTS.USERGEN) = UPPER(?)";
		             else
		                 whereStr = whereStr + " UPPER(ENGENERALCONTRACTS.USERGEN) LIKE UPPER(?)";
		         }
		        if(aFilterObject.dateEdit != null) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.DATEEDIT = ?";
		        }
		        if(aFilterObject.modify_time != Long.MIN_VALUE) {
		            if(whereStr.length() != 0)
		               whereStr = whereStr + " AND ";
		            whereStr = whereStr + "  ENGENERALCONTRACTS.MODIFY_TIME = ?";
		        }

		      }


		    try
		     {
		      statement = connection.prepareStatement(selectStr);
		      int number = 0;
		      if(aFilterObject != null){
		         if(aFilterObject.code != Integer.MIN_VALUE){
		             number++;
		             statement.setInt(number,aFilterObject.code);
		         }
		         if(aFilterObject.finDocID != Integer.MIN_VALUE){
		             number++;
		             statement.setInt(number,aFilterObject.finDocID);
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
		         if(aFilterObject.partnerId != Integer.MIN_VALUE){
		             number++;
		             statement.setInt(number,aFilterObject.partnerId);
		         }

		           if(aFilterObject.partnerCode != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.partnerCode);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.partnerName != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.partnerName);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }
		        if(aFilterObject.contractRegDate != null){
		            number++;
		            statement.setDate(number,new java.sql.Date(aFilterObject.contractRegDate.getTime()));
		        }
		        if(aFilterObject.contractStartDate != null){
		            number++;
		            statement.setDate(number,new java.sql.Date(aFilterObject.contractStartDate.getTime()));
		        }
		        if(aFilterObject.contractEndDate != null){
		            number++;
		            statement.setDate(number,new java.sql.Date(aFilterObject.contractEndDate.getTime()));
		        }

		           if(aFilterObject.axContractId != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axContractId);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.axContractCode != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axContractCode);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.axContractNumber != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axContractNumber);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }
		        if(aFilterObject.axContractDate != null){
		            number++;
		            statement.setDate(number,new java.sql.Date(aFilterObject.axContractDate.getTime()));
		        }

		           if(aFilterObject.axContractCommentGen != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axContractCommentGen);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.axContractGroupCode != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axContractGroupCode);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.axPartnerCode != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axPartnerCode);
		               for(int i = 0;i < likeStr.length();i++){
		                    if(likeStr.charAt(i) == '*')
		                         likeStr.setCharAt(i,'%');
		                    if(likeStr.charAt(i) == '?')
		                         likeStr.setCharAt(i,'_');
		               }
		               statement.setString(number,likeStr.toString());
		           }

		           if(aFilterObject.axPartnerName != null){
		               number++;
		               StringBuffer likeStr = new StringBuffer();
		               likeStr.append(aFilterObject.axPartnerName);
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
		      }



		      set = statement.executeQuery();
		      int i;
		      for (i = 0; set.next(); i++) {


		        anObject = new ENGeneralContractsShort();

		        // anObject.partnerCode = set.getString(1);
		        // anObject.partnerName = set.getString(2);

		        anObject.code = set.getInt(1);
		        anObject.finDocCode = set.getString(2);
		        anObject.contractNumber = set.getString(3);
		        anObject.partnerCode = set.getString(4);


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

	}


} // end of ENGeneralContractsDAO
