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

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.docflow.valueobject.DFDocAttachment;
import com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentShort;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDocAttachment;
 *
 */

public class ENDocAttachmentDAO extends ENDocAttachmentDAOGen {

	public ENDocAttachmentDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENDocAttachmentDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}



	@Override
	public int add(ENDocAttachment anObject) throws PersistenceException {

		if (anObject.signingStatus == Integer.MIN_VALUE) {
			anObject.signingStatus = DFDocAttachment.NOT_SIGN;
		}

		return add(anObject,true);
	}


	@Override
	public void save(ENDocAttachment anObject) throws PersistenceException {

		if (anObject.signingStatus == Integer.MIN_VALUE) {
			anObject.signingStatus = DFDocAttachment.NOT_SIGN;
		}

		save(anObject,null);
	}



	@Override
	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDocAttachmentShortList result = new ENDocAttachmentShortList();
		ENDocAttachmentShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTACHMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDOCATTACHMENT.CODE"+
			",ENDOCATTACHMENT.COMMENTGEN"+
			",ENDOCATTACHMENT.FILELINK"+
			",ENDOCATTACHMENT.FILESIZE"+
			",ENDOCATTACHMENT.USERADD"+
			",ENDOCATTACHMENT.DATEADD"+
			",ENDOCATTACHMENT.USERGEN"+
			",ENDOCATTACHMENT.DATEEDIT"+
			", ENDOCATTACHMENTSTATUS.CODE " +
			", ENDOCATTACHMENTSTATUS.NAME " +
			", parentAtt.CODE " +
			", parentAtt.COMMENTGEN " +
			", parentAtt.FILELINK " +
			", parentAtt.FILESIZE " +
			", parentAtt.USERADD " +
			", parentAtt.DATEADD " +
			", parentAtt.USERGEN " +
			", parentAtt.DATEEDIT " +
			", ENDOCATTACHMENTSERVER.CODE " +
			", ENDOCATTACHMENTSERVER.NAME " +
			", ENDOCATTACHMENTSERVER.SERVERIP " +
			", ENDOCATTACHMENTSERVER.USERNAME " +
			", ENDOCATTACHMENTSERVER.USERPASS " +
			", ENDOCATTACHMENTTYPE.CODE " +
			", ENDOCATTACHMENTTYPE.NAME " +
			", ENDOCATTACHMENT.SIGNINGSTATUS " +

		" FROM ENDOCATTACHMENT " +
			" LEFT JOIN ENDOCATTACHMENTSTATUS on ENDOCATTACHMENTSTATUS.CODE = ENDOCATTACHMENT.STATUSCODE "+
			" LEFT JOIN ENDOCATTACHMENT parentAtt on parentAtt.CODE = ENDOCATTACHMENT.PARENTREFCODE "+
			" LEFT JOIN ENDOCATTACHMENTSERVER on ENDOCATTACHMENTSERVER.CODE = ENDOCATTACHMENT.SERVERREFCODE "+
			" LEFT JOIN ENDOCATTACHMENTTYPE on ENDOCATTACHMENTTYPE.CODE = ENDOCATTACHMENT.TYPEREFCODE "+
		"";


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
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
				anObject = new ENDocAttachmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(2);
				anObject.fileLink = set.getString(3);
				anObject.filesize = set.getLong(4);
				if(set.wasNull()) {
					anObject.filesize = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(5);
				anObject.dateAdd = set.getTimestamp(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);

				anObject.statusCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.statusName = set.getString(10);
				anObject.parentRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefCommentGen = set.getString(12);
				anObject.parentRefFileLink = set.getString(13);
				anObject.parentRefFilesize = set.getLong(14);
				if(set.wasNull()) {
					anObject.parentRefFilesize = Long.MIN_VALUE;
				}
				anObject.parentRefUserAdd = set.getString(15);
				anObject.parentRefDateAdd = set.getTimestamp(16);
				anObject.parentRefUserGen = set.getString(17);
				anObject.parentRefDateEdit = set.getTimestamp(18);
				anObject.serverRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.serverRefCode = Integer.MIN_VALUE;
				}
				anObject.serverRefName = set.getString(20);
				anObject.serverRefServerIp = set.getString(21);
				anObject.serverRefUserName = set.getString(22);
				anObject.serverRefUserPass = set.getString(23);
				anObject.typeRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(25);


				anObject.signingStatus = set.getInt(26);
				if (set.wasNull()) {
					anObject.signingStatus = Integer.MIN_VALUE;
				}



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




	public ENDocAttachmentShortList getLinksList() throws PersistenceException {
		ENDocAttachmentShortList result = new ENDocAttachmentShortList();
		ENDocAttachmentShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT att.filelink " +
				" FROM \"tempAtt\" as att ";

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENDocAttachmentShort();
				anObject.fileLink = set.getString(1);
				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
			// return null;
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


} // end of ENDocAttachmentDAO
