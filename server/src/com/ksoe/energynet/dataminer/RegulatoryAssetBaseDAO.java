
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Vector;
import java.util.stream.Collectors;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBaseDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseGroupShort;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseShort;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for RegulatoryAssetBase;
 *
 */

public class RegulatoryAssetBaseDAO extends RegulatoryAssetBaseDAOGen {

    public RegulatoryAssetBaseDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBaseDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Получить актив РБА {@link RegulatoryAssetBase} по заданному инвентарному номеру
     * 
     * @param inventoryNumber инвентарный номер
     * @return объект актива РБА {@link RegulatoryAssetBase} для заданного инвентарного № или {@code null}
     * @throws PersistenceException
     * @throws SystemException если inventoryNumber пустое значение или для заданного инвентарного найдено более 1 записи
     * @throws NullPointerException если inventoryNumber == {@code null}
     */
    public RegulatoryAssetBase getByInventoryNumber(String inventoryNumber) throws PersistenceException {
    	Objects.requireNonNull(inventoryNumber, "Не задан обязательный параметр (Инвентарный №)!");
    	if(inventoryNumber.trim().length() == 0) throw new SystemException("Не задан обязательный параметр (Инвентарный №)!");
    	RegulatoryAssetBaseFilter filter = new RegulatoryAssetBaseFilter();
    	filter.inventoryNumber = inventoryNumber;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	if(codes.length > 1) throw new SystemException(String.format("Помилка у кількості для інвентарного № %s (всього записів - %d)", inventoryNumber, codes.length));
    	if(codes.length == 0) {
    		return null;
    	} else {
    		return this.getObject(codes[0]);
    	}
    }
    
    public boolean otherAssetHasSameInventory(RegulatoryAssetBase asset) {
    	String sql = String.format("SELECT count(*) FROM regulatoryassetbase WHERE code <> ? AND inventorynumber = ?");
    	Integer result = BaseDAOUtils.executeStatementAndReadObject(getConnection(), sql, Arrays.asList(asset.code, asset.inventoryNumber)
    			, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    	return (result != null && result > 0);
    }
    
    public void checkInventory(RegulatoryAssetBase asset) {
    	if(this.otherAssetHasSameInventory(asset)) {
    		throw new SystemException(String.format("\n\nВже існує актив із інвентарним номером \"%s\"\n\n", asset.inventoryNumber));
    	}
    }
	
	public String buildCondition(RegulatoryAssetBaseFilter filter) {
		String out = buildCondition((RegulatoryAssetBase)filter);
		if(filter != null) {
			if(filter.groupsList != null && filter.groupsList.length > 0) {
				out = BaseDAOUtils.addToCondition(String.format("%s IN (%s)"
						, RegulatoryAssetBase.groupRef_QFielld, Tools.repeatSymbol("?", ",", filter.groupsList.length)), out);
			}
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
    
    public List<? extends Object> getParametersByFilter(RegulatoryAssetBaseFilter filter) {
    	List<Object> result = new ArrayList<Object>();
    	if(filter != null) {
    		if(filter.code != Integer.MIN_VALUE) result.add(filter.code);
    		if(filter.inventoryNumber != null) result.add(BaseDAOUtils.getLikeString(filter.inventoryNumber));
    		if(filter.name != null) result.add(BaseDAOUtils.getLikeString(filter.name));
    		if(filter.incomeDate != null) result.add(filter.incomeDate);
    		if(filter.documentNumber != null) result.add(BaseDAOUtils.getLikeString(filter.documentNumber));
    		if(filter.originalValue != null) result.add(filter.originalValue);
    		if(filter.usefulLife != Integer.MIN_VALUE) result.add(filter.usefulLife);
    		if(filter.initial != null) result.add(filter.initial);
    		if(filter.investition != null) result.add(filter.investition);
    		if(filter.investitionProgramName != null) result.add(BaseDAOUtils.getLikeString(filter.investitionProgramName));
    		if(filter.investitionProgramYear != Integer.MIN_VALUE) result.add(filter.investitionProgramYear);
    		if(filter.investitionProgramCipher != null) result.add(BaseDAOUtils.getLikeString(filter.investitionProgramCipher));
    		if(filter.connection != null) result.add(filter.connection);   
    		if(filter.connectionNumber != null) result.add(BaseDAOUtils.getLikeString(filter.connectionNumber));
    		if(filter.connectionDate != null) result.add(filter.connectionDate);
    		if(filter.connectionContragent != null) result.add(BaseDAOUtils.getLikeString(filter.connectionContragent));
    		if(filter.categoryCode != Integer.MIN_VALUE) result.add(filter.categoryCode);
    		if(filter.parentRef != null && filter.parentRef.code != Integer.MIN_VALUE) result.add(filter.parentRef.code);
    		if(filter.groupRef != null && filter.groupRef.code != Integer.MIN_VALUE) result.add(filter.groupRef.code);
    		if(filter.fundingSourceRef != null && filter.fundingSourceRef.code != Integer.MIN_VALUE) result.add(filter.fundingSourceRef.code);
    		
    		if(filter.groupsList != null) {
    			result.addAll(Arrays.asList(filter.groupsList).stream().map(RegulatoryAssetBaseGroupShort::getCode).collect(Collectors.toList()));
    		}
    	}
    	return result;
    }
    
    public String getConditionByFromToParameters(RegulatoryAssetBaseFilter filter) {
    	String condition = "";
    	if(filter == null) return condition;
    	if(filter.getIncomeDateFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.incomeDate_QFielld), condition);
    	if(filter.getIncomeDateTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.incomeDate_QFielld), condition);
    	if(filter.getOriginalValueFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.originalValue_QFielld), condition);
    	if(filter.getOriginalValueTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.originalValue_QFielld), condition);
    	if(filter.getUsefulLifeFrom() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.usefulLife_QFielld), condition);
    	if(filter.getUsefulLifeTo() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.usefulLife_QFielld), condition);
    	if(filter.getWriteOffDateFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.writeOffDate_QFielld), condition);
    	if(filter.getWriteOffDateTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.writeOffDate_QFielld), condition);
    	if(filter.getInvestitionProgramYearFrom() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.investitionProgramYear_QFielld), condition);
    	if(filter.getInvestitionProgramYearTo() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.investitionProgramYear_QFielld), condition);
    	if(filter.getConnectionDateFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.connectionDate_QFielld), condition);
    	if(filter.getConnectionDateTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.connectionDate_QFielld), condition);
    	if(filter.getCodeFrom() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBase.code_QFielld), condition);
    	if(filter.getCodeTo() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBase.code_QFielld), condition);
    	return condition;
    }
    
    public List<? extends Object> getFromToParametersByFilter(RegulatoryAssetBaseFilter filter) {
    	List<Object> result = new ArrayList<Object>();
    	if(filter != null) {
    		if(filter.getIncomeDateFrom() != null) result.add(filter.getIncomeDateFrom());
    		if(filter.getIncomeDateTo() != null) result.add(filter.getIncomeDateTo());
    		if(filter.getOriginalValueFrom() != null) result.add(filter.getOriginalValueFrom());
    		if(filter.getOriginalValueTo() != null) result.add(filter.getOriginalValueTo());
    		if(filter.getUsefulLifeFrom() != Integer.MIN_VALUE) result.add(filter.getUsefulLifeFrom());
    		if(filter.getUsefulLifeTo() != Integer.MIN_VALUE) result.add(filter.getUsefulLifeTo());
    		if(filter.getWriteOffDateFrom() != null) result.add(filter.getWriteOffDateFrom());
    		if(filter.getWriteOffDateTo() != null) result.add(filter.getWriteOffDateTo());
    		if(filter.getInvestitionProgramYearFrom() != Integer.MIN_VALUE) result.add(filter.getInvestitionProgramYearFrom());
    		if(filter.getInvestitionProgramYearTo() != Integer.MIN_VALUE) result.add(filter.getInvestitionProgramYearTo());
    		if(filter.getConnectionDateFrom() != null) result.add(filter.getConnectionDateFrom());
    		if(filter.getConnectionDateTo() != null) result.add(filter.getConnectionDateTo());
    		if(filter.getCodeFrom() != Integer.MIN_VALUE) result.add(filter.getCodeFrom());
    		if(filter.getCodeTo() != Integer.MIN_VALUE) result.add(filter.getCodeTo());
    	}
    	return result;    	
    }
    
	
	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBase aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBaseShortList result = new RegulatoryAssetBaseShortList();
		RegulatoryAssetBaseShort anObject;
		result.list = new Vector<RegulatoryAssetBaseShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATORYASSETBASE.CODE"+
			",REGULATORYASSETBASE.INVENTORYNUMBER"+
			",REGULATORYASSETBASE.NAME"+
			",REGULATORYASSETBASE.INCOMEDATE"+
			",REGULATORYASSETBASE.ORIGINALVALUE"+
			",REGULATORYASSETBASE.INITIAL"+
			",REGULATORYASSETBASE.WRITEOFFNUMBER"+
			",REGULATORYASSETBASE.WRITEOFFDATE"+
			",REGULATORYASSETBASE.USEFULLIFE"+
			", REGULATORYASSETBASEGRP.CODE " +
			", REGULATORYASSETBASEGRP.NUMBER " +
			", REGULATORYASSETBASEGRP.NAME " +
			", REGULATORYASSETBASE.DOCUMENTNUMBER " +
		" FROM REGULATORYASSETBASE " +
			" LEFT JOIN REGULATORYASSETBASEGRP on REGULATORYASSETBASEGRP.CODE = REGULATORYASSETBASE.GROUPREFCODE "+
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
				anObject = new RegulatoryAssetBaseShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.inventoryNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.incomeDate = set.getDate(4);
				anObject.originalValue = set.getBigDecimal(5);
				if(anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.initial = set.getBoolean(6);
				if ( set.wasNull() ) {
					anObject.initial = null;
				}
				anObject.writeOffNumber = set.getString(7);
				anObject.writeOffDate = set.getDate(8);
				anObject.usefulLife = set.getInt(9);
				if(set.wasNull()) {
					anObject.usefulLife = Integer.MIN_VALUE;
				}
				anObject.groupRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.groupRefCode = Integer.MIN_VALUE;
				}
				anObject.groupRefNumber = set.getString(11);
				anObject.groupRefName = set.getString(12);
				anObject.documentNumber = set.getString(13);

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
} // end of RegulatoryAssetBaseDAO
