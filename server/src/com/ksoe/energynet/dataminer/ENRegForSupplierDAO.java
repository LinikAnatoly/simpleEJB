
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
import com.ksoe.energynet.dataminer.generated.ENRegForSupplierDAOGen;
import com.ksoe.energynet.valueobject.ENRegForSupplier;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierShort;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENRegForSupplier;
 *
 */

public class ENRegForSupplierDAO extends ENRegForSupplierDAOGen {

    public ENRegForSupplierDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRegForSupplierDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

	public ENRegForSupplierShortList getScrollableFilteredList(ENRegForSupplier aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENRegForSupplierShortList result = new ENRegForSupplierShortList();
		ENRegForSupplierShort anObject;
		result.list = new Vector<ENRegForSupplierShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENREGFORSUPPLIER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENREGFORSUPPLIER.CODE"+
			",ENREGFORSUPPLIER.NUMBERGEN"+
			",ENREGFORSUPPLIER.DATEFROM"+
			",ENREGFORSUPPLIER.DATETO"+
			",ENREGFORSUPPLIER.SUPPLIERCODE"+
			",ENREGFORSUPPLIER.COMMENTGEN"+
			",ENREGFORSUPPLIER.USERGEN"+
			",ENREGFORSUPPLIER.DATEEDIT"+
			", ENREGFORSUPPLIERTYPE.CODE " +
			", ENREGFORSUPPLIERTYPE.NAME " +
			", ENREGFORSUPPLIERTYPE.DESCRIPTION " +
			", ENREGFORSUPPLIERSTATUS.CODE " +
			", ENREGFORSUPPLIERSTATUS.NAME " +
			", coalesce((select s.name from supplier s where s.code = ENREGFORSUPPLIER.SUPPLIERCODE), '') as suppliername " +
		" FROM ENREGFORSUPPLIER " +
		"        LEFT JOIN ENREGFORSUPPLIERTYPE on ENREGFORSUPPLIERTYPE.CODE = ENREGFORSUPPLIER.TYPEREFCODE, " +
		"      ENREGFORSUPPLIERSTATUS " +
		" WHERE ENREGFORSUPPLIERSTATUS.CODE = ENREGFORSUPPLIER.STATUSREFCODE " +
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
				anObject = new ENRegForSupplierShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateFrom = set.getDate(3);
				anObject.dateTo = set.getDate(4);
				anObject.supplierCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.supplierCode = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);

				anObject.typeRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(10);
				anObject.typeRefDescription = set.getString(11);
				anObject.statusRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(13);
				anObject.supplierName = set.getString(14);

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

    @Override
	public int add(ENRegForSupplier anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    @Override
	public void save(ENRegForSupplier anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }
    
} // end of ENRegForSupplierDAO
