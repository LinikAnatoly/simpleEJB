
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENInspectionSheetDAOGen;
import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENInspectionSheet;
 *
 */

public class ENInspectionSheetDAO extends ENInspectionSheetDAOGen {

    public ENInspectionSheetDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInspectionSheetDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }



	@Override
	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheet aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {

		ENInspectionSheetShortList result = new ENInspectionSheetShortList();
		ENInspectionSheetShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0) {
			orderBy = "eninspectionsheet.code desc";
		}

		if (quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if (getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENINSPECTIONSHEET.CODE"+
			",ENINSPECTIONSHEET.NAME"+
			",ENINSPECTIONSHEET.INSPECTIONKIND"+
			",ENINSPECTIONSHEET.DATEGEN"+
			",ENINSPECTIONSHEET.USERGEN"+
			",ENINSPECTIONSHEET.DATEEDIT"+
			", ENINSPECTIONSHEETSTATS.CODE " +
			", ENINSPECTIONSHEETSTATS.NAME " +
			", ENELEMENT.CODE " +
			", TKDEFECTS2INSPECTION.CODE " +
			", TKDEFECTS2INSPECTION.NAME " +
			", TKDEFECTS2INSPECTION.USERGEN " +
			", TKDEFECTS2INSPECTION.DATEEDIT " +

            ", case eninspectionsheet.inspectionkind " +
            " when 1 then 'Плановий' " +
            " when 2 then 'Післяаварійний' " +
            " when 3 then 'Позаплановий' end as inspectionKindName " +

			", (select et.name from enelementtype et where et.code = enelement.typerefcode) as elementType " +
			", (select d.invnumber from enelementdata d where d.ecode = enelement.code) as elementInvNumber " +
			", (select d.ename from enelementdata d where d.ecode = enelement.code) as elementName " +
			", EPREN.CODE as renCode " +
			", EPREN.NAME as renName " +
			", ENINSPECTIONSHEET.OBJECTINVNUMBER " +
			", ENINSPECTIONSHEET.OBJECTNAME " +
			", ENINSPECTIONSHEET.EQUIPMENTKIND " +
			", ENINSPECTIONSHEET.TAKEINTOCALCULATION " +


			" FROM ENINSPECTIONSHEET " +
			", ENINSPECTIONSHEETSTATS " +
			", ENELEMENT LEFT JOIN EPREN ON EPREN.CODE = ENELEMENT.RENREFCODE " +
			", TKDEFECTS2INSPECTION ";


		whereStr = " ENINSPECTIONSHEETSTATS.CODE = ENINSPECTIONSHEET.STATUSREFCODE ";
		whereStr += " AND ENELEMENT.CODE = ENINSPECTIONSHEET.ELEMENTREFCODE ";
		whereStr += " AND TKDEFECTS2INSPECTION.CODE = ENINSPECTIONSHEET.DEFECTS2INSPECTREFCODE ";


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
				anObject = new ENInspectionSheetShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.inspectionKind = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.inspectionKind = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getDate(6);

				anObject.statusRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(8);
				anObject.elementRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.defects2InspectRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.defects2InspectRefCode = Integer.MIN_VALUE;
				}

				anObject.defects2InspectRefName = set.getString(11);
				anObject.defects2InspectRefUserGen = set.getString(12);
				anObject.defects2InspectRefDateEdit = set.getTimestamp(13);

				anObject.inspectionKindName = set.getString(14);

				anObject.elementType = set.getString(15);
				anObject.elementInvNumber = set.getString(16);
				anObject.elementName = set.getString(17);

				anObject.renCode = set.getInt(18);
				if (set.wasNull()) {
					anObject.renCode = Integer.MIN_VALUE;
				}

				anObject.renName = set.getString(19);

				anObject.objectInvNumber = set.getString(20);
				anObject.objectName = set.getString(21);

				anObject.equipmentKind = set.getInt(22);
				if (set.wasNull()) {
					anObject.equipmentKind = Integer.MIN_VALUE;
				}

				anObject.takeIntoCalculation = set.getInt(23);
				if ( set.wasNull() ) {
					anObject.takeIntoCalculation = Integer.MIN_VALUE;
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


} // end of ENInspectionSheetDAO
