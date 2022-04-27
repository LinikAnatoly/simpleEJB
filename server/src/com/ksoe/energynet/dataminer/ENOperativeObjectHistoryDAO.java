
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
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENOperativeObjectHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENOperativeObjectHistory;
import com.ksoe.energynet.valueobject.brief.ENOperativeObjectHistoryShort;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectHistoryShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENOperativeObjectHistory;
 *
 */

public class ENOperativeObjectHistoryDAO extends ENOperativeObjectHistoryDAOGen {

    public ENOperativeObjectHistoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENOperativeObjectHistoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }



	@Override
	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENOperativeObjectHistoryShortList result = new ENOperativeObjectHistoryShortList();
		ENOperativeObjectHistoryShort anObject;
		result.list = new Vector<ENOperativeObjectHistoryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECTHISTR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENOPERATIVEOBJECTHISTR.CODE"+
			",ENOPERATIVEOBJECTHISTR.CONTRACTNUMBER"+
			",ENOPERATIVEOBJECTHISTR.CONTRACTDATE"+
			",ENOPERATIVEOBJECTHISTR.NAME"+
			",ENOPERATIVEOBJECTHISTR.PARTNERCODE"+
			",ENOPERATIVEOBJECTHISTR.FINDOCCODE"+
			",ENOPERATIVEOBJECTHISTR.FINDOCID"+
			", ENOPERATIVEOBJECT.CODE " +
			", ENOPERATIVEOBJECT.NAME " +
			", ENOPERATIVEOBJECT.CONTRACTNUMBER " +
			", ENOPERATIVEOBJECT.CONTRACTDATE " +
			", ENOPERATIVEOBJECT.PARTNERCODE " +
			", ENOPERATIVEOBJECT.PARTNERNAME " +
			", ENOPERATIVEOBJECT.FINDOCCODE " +
			", ENOPERATIVEOBJECT.FINDOCID " +
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +

			" FROM ENOPERATIVEOBJECTHISTR left join ENGENERALCONTRACTS on ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECTHISTR.GENERALCONTRACTREFCODE " +
			", ENOPERATIVEOBJECT " +
			// ", ENGENERALCONTRACTS " +

		"";
		whereStr = " ENOPERATIVEOBJECT.CODE = ENOPERATIVEOBJECTHISTR.OBJECTREFCODE" ; //+
		// whereStr += " AND ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECTHISTR.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENOperativeObjectHistoryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.partnerCode = set.getString(5);
				anObject.finDocCode = set.getString(6);
				anObject.finDocID = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}

				anObject.objectRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.objectRefCode = Integer.MIN_VALUE;
				}
				anObject.objectRefName = set.getString(9);
				anObject.objectRefContractNumber = set.getString(10);
				anObject.objectRefContractDate = set.getDate(11);
				anObject.objectRefPartnerCode = set.getString(12);
				anObject.objectRefPartnerName = set.getString(13);
				anObject.objectRefFinDocCode = set.getString(14);
				anObject.objectRefFinDocID = set.getInt(15);
				if(set.wasNull()) {
					anObject.objectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(17);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(18);
				anObject.generalContractRefContractNumber = set.getString(19);
				anObject.generalContractRefContractDate = set.getDate(20);
				anObject.generalContractRefCommentGen = set.getString(21);
				anObject.generalContractRefPartnerId = set.getInt(22);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(23);
				anObject.generalContractRefPartnerName = set.getString(24);
				anObject.generalContractRefContractRegDate = set.getDate(25);
				anObject.generalContractRefContractStartDate = set.getDate(26);
				anObject.generalContractRefContractEndDate = set.getDate(27);
				anObject.generalContractRefAxContractId = set.getString(28);
				anObject.generalContractRefAxContractCode = set.getString(29);
				anObject.generalContractRefAxContractNumber = set.getString(30);
				anObject.generalContractRefAxContractAccount = set.getString(31);
				anObject.generalContractRefAxContractDate = set.getDate(32);
				anObject.generalContractRefAxContractCommentGen = set.getString(33);
				anObject.generalContractRefAxContractGroupCode = set.getString(34);
				anObject.generalContractRefAxPartnerCode = set.getString(35);
				anObject.generalContractRefAxPartnerName = set.getString(36);
				anObject.generalContractRefUserGen = set.getString(37);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


} // end of ENOperativeObjectHistoryDAO
