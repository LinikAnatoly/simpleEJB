
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENMetrologyCounterDAOGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENMetrologyCounter;
  *
  */

public class ENMetrologyCounterDAO extends ENMetrologyCounterDAOGen {

    @Override
	public void remove(int uid) throws PersistenceException
    {
        ENMetrologyCounter obj = getObject(uid);

        super.remove(uid);

        ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
        eDao.remove(obj.element.code);
    }



  public ENMetrologyCounterDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMetrologyCounterDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENMETROLOGYCOUNTER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENMETROLOGYCOUNTER.CODE"+
			",ENMETROLOGYCOUNTER.INVNUMBER"+
			",ENMETROLOGYCOUNTER.NAME"+
			",ENMETROLOGYCOUNTER.BUILDNUMBER"+
			",ENMETROLOGYCOUNTER.ACCOUNT"+
			",ENMETROLOGYCOUNTER.DEPARTMETFKCODE"+
			",ENMETROLOGYCOUNTER.MOLCODE"+
			",ENMETROLOGYCOUNTER.DATEIN"+
			",ENMETROLOGYCOUNTER.DATEBUILD"+
			",ENMETROLOGYCOUNTER.COST"+
			",ENMETROLOGYCOUNTER.SCCODE"+
			",ENMETROLOGYCOUNTER.COUNTERTYPE"+
			",ENMETROLOGYCOUNTER.PHASITY"+
			",ENMETROLOGYCOUNTER.ZONES"+
			", ENELEMENT.CODE " +
			", RQSTORAGEZONE.CODE " +
			", RQSTORAGEZONE.NAME " +
			", TKACCOUNTINGTYPE.CODE " +
			", TKACCOUNTINGTYPE.NAME " +
		" FROM ENMETROLOGYCOUNTER " +
			" INNER JOIN ENELEMENT ON ENELEMENT.CODE = ENMETROLOGYCOUNTER.ELEMENTCODE " +
			" INNER JOIN TKACCOUNTINGTYPE ON TKACCOUNTINGTYPE.CODE = ENMETROLOGYCOUNTER.ACCOUNTINGTYPEREFCODE " +
			" LEFT JOIN RQSTORAGEZONE ON RQSTORAGEZONE.CODE = ENMETROLOGYCOUNTER.ZONEREFCODE " +
		"";
	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new ENMetrologyCounterShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.cost = set.getBigDecimal(10);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(12);
				anObject.phasity = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.phasity = Integer.MIN_VALUE;
				}
				anObject.zones = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.zones = Integer.MIN_VALUE;
				}

				anObject.elementCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.zoneRefCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefName = set.getString(17);
				anObject.accountingTypeRefCode = set.getInt(18);
				if(set.wasNull()) {
					anObject.accountingTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.accountingTypeRefName = set.getString(19);

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
	 * Получить список счетчиков {@link ENMetrologyCounterShortList} по акту {@link ENAct}
	 * 
	 * @param act акт {@link ENAct}
	 * @return список счетчиков {@link ENMetrologyCounterShortList}
	 * @throws PersistenceException
	 */
	public ENMetrologyCounterShortList getListByAct(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий акт!");
		}
		ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
		filter.conditionSQL = " EXISTS (SELECT FROM enelement AS el1 "
				+ " INNER JOIN enplanwork AS pw1 ON el1.code = pw1.elementrefcode "
				+ " INNER JOIN enact2enplanwork AS acpw1 ON pw1.code = acpw1.plancode "
				+ " WHERE acpw1.actrefcode = ? AND el1.code = ENMETROLOGYCOUNTER.ELEMENTCODE"
				+ ")";
		return this.getScrollableFilteredList(filter, 0, -1, new Vector<Integer>(Arrays.asList(act.code)));
	}
	
	/**
	 * 
	 * Получить счетчик по инвентарному номеру
	 * 
	 * @param invNumber инветарный номер
	 * @return объект счетчика {@link ENMetrologyCounterShort} или {@code null}
	 * если счетчика с таким инвентарным нет
	 * @throws PersistenceException 
	 */
	public ENMetrologyCounterShort getShortObjectByInvNumber(String invNumber) throws PersistenceException {
		if(invNumber == null || invNumber.trim().length() == 0) {
			throw new java.lang.NullPointerException("Не заданий інвентарний номер!");
		}
		ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
		filter.invNumber = invNumber;
		ENMetrologyCounterShortList list = this.getScrollableFilteredList(filter, 0, -1);
		if(list.totalCount > 0) {
			if(list.totalCount == 1) {
				return list.get(0);
			} else {
				throw new SystemException(String.format("Помилка у кількості записів для інвентарного № %s (%d)"
						, invNumber, list.size()));
			}
		} else {
			return null;
		}
	}
	
	/**
	 * 
	 * Получить счетчик по инвентарному номеру
	 * 
	 * @param invNumber инветарный номер
	 * @return объект счетчика {@link ENMetrologyCounter} или {@code null}
	 * если счетчика с таким инвентарным нет
	 * @throws PersistenceException 
	 */
	public ENMetrologyCounter getObjectByInvNumber(String invNumber) throws PersistenceException {
		if(invNumber == null || invNumber.trim().length() == 0) {
			throw new java.lang.NullPointerException("Не заданий інвентарний номер!");
		}
		ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
		filter.invNumber = invNumber;
		int[] codes = this.getFilteredCodeArray(filter, 0, -1);
		if(codes.length > 0) {
			if(codes.length == 1) {
				return this.getObject(codes[0]);
			} else {
				throw new SystemException(String.format("Помилка у кількості записів для інвентарного № %s (%d)"
						, invNumber, codes.length));
			}
		} else {
			return null;
		}
	}

} // end of ENMetrologyCounterDAO

