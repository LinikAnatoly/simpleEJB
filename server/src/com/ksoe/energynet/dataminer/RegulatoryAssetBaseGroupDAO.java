
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBaseGroupDAOGen;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseGroup;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseGroupShort;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseGroupFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseGroupShortList;

/**
 * DAO Object for RegulatoryAssetBaseGroup;
 *
 */

public class RegulatoryAssetBaseGroupDAO extends RegulatoryAssetBaseGroupDAOGen {

    public RegulatoryAssetBaseGroupDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBaseGroupDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public RegulatoryAssetBaseGroupShortList getScrollableFilteredList(RegulatoryAssetBaseGroup aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBaseGroupShortList result = new RegulatoryAssetBaseGroupShortList();
		RegulatoryAssetBaseGroupShort anObject;
		result.list = new Vector<RegulatoryAssetBaseGroupShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASEGRP.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATORYASSETBASEGRP.CODE"+
			",REGULATORYASSETBASEGRP.NUMBER"+
			",REGULATORYASSETBASEGRP.NAME"+
			", parent.CODE " +
			", parent.NUMBER " +
			", parent.NAME " +
			" , EXISTS (SELECT FROM REGULATORYASSETBASEGRP AS childGroups WHERE childGroups.parentrefcode = REGULATORYASSETBASEGRP.CODE) AS has_child" +
			", REGULATORYASSETBASEGRP.USEFULLIFE" +
		" FROM REGULATORYASSETBASEGRP " +
			" LEFT JOIN REGULATORYASSETBASEGRP AS parent on REGULATORYASSETBASEGRP.PARENTREFCODE = parent.CODE"+
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
				anObject = new RegulatoryAssetBaseGroupShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.number = set.getString(2);
				anObject.name = set.getString(3);

				anObject.parentRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefNumber = set.getString(5);
				anObject.parentRefName = set.getString(6);
				anObject.hasChildren = set.getBoolean(7);
				if(set.wasNull()) anObject.hasChildren = null;
				anObject.usefulLife = set.getInt(8);

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


	/**
	 * 
	 * Получить объект группы активов РБА {@link RegulatoryAssetBaseGroup} по номеру
	 * 
	 * @param number номер группы {@link RegulatoryAssetBaseGroup}
	 * @return объект группы активов РБА {@link RegulatoryAssetBaseGroup}
	 * @throws PersistenceException при ошибке считывания данных из базы
	 * @throws NullPointerException если номер группы равен {@code null}
	 * @throws SystemException если номер группы пустой
	 */
	public RegulatoryAssetBaseGroup getByNumber(String number) throws PersistenceException {
		Objects.requireNonNull(number, "Не задан необходимый параметр (группа)!");
		if(number.trim().length() == 0) throw new SystemException("Не задан необходимый параметр (группа)!");
		RegulatoryAssetBaseGroupFilter filter = new RegulatoryAssetBaseGroupFilter();
		filter.number = number;
		int[] codes = this.getFilteredCodeArray(filter, 0, -1);
		if(codes.length > 1) throw new SystemException(String.format("Помилка у кількості для номеру групи \"%s\" (всього знайдено записів: %d)", number, codes.length));
		if(codes.length == 0) {
			return null;
		} else {
			return this.getObject(codes[0]);
		}
	}


} // end of RegulatoryAssetBaseGroupDAO
