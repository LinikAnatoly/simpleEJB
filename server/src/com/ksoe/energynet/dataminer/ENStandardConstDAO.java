//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENStandardConstDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.brief.ENStandardConstShort;
import com.ksoe.energynet.valueobject.lists.ENStandardConstShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENStandardConst;
 *
 */

public class ENStandardConstDAO extends ENStandardConstDAOGen {

	public ENStandardConstDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENStandardConstDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}
	
	/**
	 * 
	 * Возвращение значения стандартной велечины на заданную дату
	 * 
	 * @param standardConstCode код стандартной величины
	 * @param date заданная дата
	 * @return значение стандартной величины на заданную дату или {@code null} если <br>
	 * 			значение не было найдено
	 * @throws PersistenceException 
	 */
	public BigDecimal getENStandardConstEntryOnDate(int standardConstCode, Date date) {
		return this.getENStandardConstEntryOnDate(standardConstCode, date, false);
	}

	/**
	 * 
	 * Возвращение значения стандартной велечины на заданную дату
	 * 
	 * @param standardConstCode код стандартной величины
	 * @param date заданная дата
	 * @param throwExceptionIfNotExists выдавать исключение если запись со <br>стандартной величиной на заданную дату
	 * не было найдено
	 * @return значение стандартной величины на заданную дату или {@code null} если <br>
	 * 			значение не было найдено
	 * @throws PersistenceException 
	 */
	public BigDecimal getENStandardConstEntryOnDate(int standardConstCode, Date date, boolean throwExceptionIfNotExists) {
		try {
			if(standardConstCode == Integer.MIN_VALUE) {
				throw new SystemException("standardConstCode can't be null");
			}
			if(date == null) {
				throw new SystemException("date can't be null");			
			}
			
			String sql = "select net.get_standard_const_entry_on_date(?, ?)";
			Vector<Object> params = new Vector<Object>();
			params.add(standardConstCode);
			params.add(date);
			
			BigDecimal result = BaseDAOUtils.executeStatementAndReadObject(this.getConnection(), sql, params
					, new BaseDAOUtils.BigDecimalFromResultSetTransformator()
					, false);
			
			if(result == null && throwExceptionIfNotExists) {
				ENStandardConstDAO standardConstDao = new ENStandardConstDAO(this.getConnection(), this.getUserProfile());
				ENStandardConst standardConst = standardConstDao.getObject(standardConstCode);
				if(standardConst == null) throw new SystemException(String.format("Не знайдено запис у довіднику стандартних величин із кодом %d"
						, standardConstCode));
				throw new SystemException(String.format("Немає запису у довіднику стандартних величин для величини \"%s\" на дату %s"
						, standardConst.name
						, Tools.dateFormatDefault.format(date)));
			}
			
			return result;	
		} catch(PersistenceException e) {
			throw new SystemException(e);
		}
	}

	public ENStandardConstShortList getScrollableFilteredList(
			ENStandardConst aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENStandardConstShortList result = new ENStandardConstShortList();
		ENStandardConstShort anObject;
		result.list = new Vector<ENStandardConstShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENSTANDARDCONST.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = " select enstandardconst.code, enstandardconst.name, " +
				" conentry.ecode, conentry.eentry, " +
				" conentry.estart, conentry.eend " +

				" from " +
				" (select enstandardconstentry.code as ecode, enstandardconstentry.constentry as eentry, " +
				"         enstandardconstentry.startdate as estart, enstandardconstentry.enddate as eend, " +
				"         enstandardconstentry.constrefcode as concode " +
				"    from (select constrefcode, max(startdate) as dat1 from enstandardconstentry " +
				"   where startdate <= current_date and enddate >= current_date " +
				"   group by constrefcode) cnt " +
				"   inner join enstandardconstentry on cnt.constrefcode = enstandardconstentry.constrefcode " +
				"     and cnt.dat1 = enstandardconstentry.startdate) conentry " +
				" right join enstandardconst on enstandardconst.code = conentry.concode";

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENSTANDARDCONST.CODE = ?";
			}
			if (aFilterObject.name != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.name.indexOf('*', 0) < 0
						&& aFilterObject.name.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENSTANDARDCONST.NAME) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENSTANDARDCONST.NAME) LIKE UPPER(?)";
			}

		}

		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";

			whereStr = whereStr + " (" + condition + ")";
		}

		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE " + whereStr;

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}

				if (aFilterObject.name != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.name);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
//				if (i < fromPosition)
//					continue;
//				else if (i >= fromPosition + quantity) {
//					i++;
//					break;
//				}

				anObject = new ENStandardConstShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.name = set.getString(2);

		        anObject.entryCode = set.getInt(3);
		        if ( set.wasNull() )
		            anObject.entryCode = Integer.MIN_VALUE;
		        anObject.entryValue = set.getBigDecimal(4);
		        if(anObject.entryValue != null)
		            anObject.entryValue = anObject.entryValue.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
		        anObject.entryStartDate = set.getDate(5);
		        anObject.entryEndDate = set.getDate(6);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
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


} // end of ENStandardConstDAO

