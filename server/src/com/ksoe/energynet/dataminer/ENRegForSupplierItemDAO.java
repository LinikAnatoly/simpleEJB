
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENRegForSupplierItemDAOGen;
import com.ksoe.energynet.valueobject.ENRegForSupplierItem;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierItemShort;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENRegForSupplierItem;
 *
 */

public class ENRegForSupplierItemDAO extends ENRegForSupplierItemDAOGen {

    public ENRegForSupplierItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRegForSupplierItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    @Override
	public int add(ENRegForSupplierItem anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    @Override
	public void save(ENRegForSupplierItem anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }

	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENRegForSupplierItemShortList result = new ENRegForSupplierItemShortList();
		ENRegForSupplierItemShort anObject;
		result.list = new Vector<ENRegForSupplierItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENREGFORSUPPLIERITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENREGFORSUPPLIERITEM.CODE"+
			",ENREGFORSUPPLIERITEM.RECORDPOINTEIC"+
			",ENREGFORSUPPLIERITEM.CUSTOMERUID"+
			",ENREGFORSUPPLIERITEM.DATEPLANNED"+
			",ENREGFORSUPPLIERITEM.DATECOMPLETE"+
			",ENREGFORSUPPLIERITEM.DESCRIPTION"+
			",ENREGFORSUPPLIERITEM.CALCNUMBER"+
			",ENREGFORSUPPLIERITEM.CALCNAME"+
			",ENREGFORSUPPLIERITEM.COSTWITHOUTVAT"+
			",ENREGFORSUPPLIERITEM.COSTVAT"+
			",ENREGFORSUPPLIERITEM.COSTWITHVAT"+
			",ENREGFORSUPPLIERITEM.DHDISCONNECTIONCODE"+
			",ENREGFORSUPPLIERITEM.COMMENTGEN"+
			",ENREGFORSUPPLIERITEM.USERGEN"+
			",ENREGFORSUPPLIERITEM.DATEEDIT"+
			", ENREGFORSUPPLIER.CODE " +
			", ENREGFORSUPPLIER.NUMBERGEN " +
			", ENREGFORSUPPLIER.DATEFROM " +
			", ENREGFORSUPPLIER.DATETO " +
			", ENREGFORSUPPLIER.SUPPLIERCODE " +
			", ENREGFORSUPPLIER.COMMENTGEN " +
			", ENREGFORSUPPLIER.USERGEN " +
			", ENREGFORSUPPLIER.DATEEDIT " +
			", ENREGFORSUPPLIERTYPE.CODE " +
			", ENREGFORSUPPLIERTYPE.NAME " +
			", ENREGFORSUPPLIERTYPE.DESCRIPTION " +
			", ENDISCONNECTINITIATOR.CODE " +
			", ENDISCONNECTINITIATOR.NAME " +
			", PLAN.CODE " +
			", FACT.CODE " +
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +
		" FROM ENREGFORSUPPLIERITEM " +
			" LEFT JOIN ENREGFORSUPPLIER on ENREGFORSUPPLIER.CODE = ENREGFORSUPPLIERITEM.REGISTRYREFCODE "+
			" LEFT JOIN ENREGFORSUPPLIERTYPE on ENREGFORSUPPLIERTYPE.CODE = ENREGFORSUPPLIERITEM.REGISTRYTYPEREFCODE "+
			" LEFT JOIN ENDISCONNECTINITIATOR on ENDISCONNECTINITIATOR.CODE = ENREGFORSUPPLIERITEM.INITIATORREFCODE "+
			" LEFT JOIN ENPLANWORK PLAN on PLAN.CODE = ENREGFORSUPPLIERITEM.PLANREFCODE "+
			" LEFT JOIN ENPLANWORK FACT on FACT.CODE = ENREGFORSUPPLIERITEM.FACTREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENREGFORSUPPLIERITEM.CLASSIFICATIONTYPERFCD "+
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
				anObject = new ENRegForSupplierItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.recordpointEic = set.getString(2);
				anObject.customerUid = set.getString(3);
				anObject.datePlanned = set.getDate(4);
				anObject.dateComplete = set.getDate(5);
				anObject.description = set.getString(6);
				anObject.calcNumber = set.getString(7);
				anObject.calcName = set.getString(8);
				anObject.costWithoutVAT = set.getBigDecimal(9);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(10);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(11);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dhDisconnectionCode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.dhDisconnectionCode = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(13);
				anObject.userGen = set.getString(14);
				anObject.dateEdit = set.getTimestamp(15);

				anObject.registryRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.registryRefCode = Integer.MIN_VALUE;
				}
				anObject.registryRefNumberGen = set.getString(17);
				anObject.registryRefDateFrom = set.getDate(18);
				anObject.registryRefDateTo = set.getDate(19);
				anObject.registryRefSupplierCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.registryRefSupplierCode = Integer.MIN_VALUE;
				}
				anObject.registryRefCommentGen = set.getString(21);
				anObject.registryRefUserGen = set.getString(22);
				anObject.registryRefDateEdit = set.getTimestamp(23);
				anObject.registryTypeRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.registryTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.registryTypeRefName = set.getString(25);
				anObject.registryTypeRefDescription = set.getString(26);
				anObject.initiatorRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.initiatorRefCode = Integer.MIN_VALUE;
				}
				anObject.initiatorRefName = set.getString(28);
				
				anObject.planRefCode = set.getInt(29);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				
				anObject.factRefCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.factRefCode = Integer.MIN_VALUE;
				}

				anObject.classificationTypeRefCode = set.getInt(31);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRefName = set.getString(32);
				anObject.classificationTypeRefKod = set.getString(33);

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
	
    
} // end of ENRegForSupplierItemDAO
