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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENNormVolumeAVZItemDAOGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort;
import com.ksoe.energynet.valueobject.lists.ENNormVolumeAVZItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.techcard.valueobject.TEMPNomenclaturesType;

/**
 * DAO Object for ENNormVolumeAVZItem;
 *
 */

public class ENNormVolumeAVZItemDAO extends ENNormVolumeAVZItemDAOGen {

	public ENNormVolumeAVZItemDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENNormVolumeAVZItemDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public ENNormVolumeAVZItemShortList getScrollableFilteredList(
			ENNormVolumeAVZItem aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector<? extends Object> aBindObjects) throws PersistenceException {

		ENNormVolumeAVZItemShortList result = new ENNormVolumeAVZItemShortList();
		ENNormVolumeAVZItemShort anObject;
		result.list = new Vector<ENNormVolumeAVZItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENNORMVOLUMEAVZITEM.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT " +
				"ENNORMVOLUMEAVZITEM.CODE " +
				",ENNORMVOLUMEAVZITEM.COUNTGEN " +
				",ENNORMVOLUMEAVZITEM.USERGEN " +
				",ENNORMVOLUMEAVZITEM.DATEEDIT " +

				", TKMATERIALS.CODE " +
				", TKMATERIALS.NAME " +
				", TKMATERIALS.COST " +
				", TKMATERIALS.DELIVERYDATE " +
				", TKMATERIALS.NUMKATALOG " +
				", TKMATERIALS.IDENTID " +

				", ENNORMATIVEVOLUMEAVZ.CODE " +
				", ENNORMATIVEVOLUMEAVZ.USERGEN " +
				", ENNORMATIVEVOLUMEAVZ.DATEEDIT " +

				", tkmeasurement.code " +
				", tkmeasurement.name " +

				", (select n.nn from tempnomenclatures n " +
				"    where n.materialrefcode = ennormvolumeavzitem.materialrefcode " +
				"      and n.typerefcode = " + TEMPNomenclaturesType.TEMPNOMENCLATURESTYPE_ETALON + ") " +

				", ENNORMVOLUMEAVZITEM.COUNTREQUIRED " +

				" FROM ENNORMVOLUMEAVZITEM " +
				", TKMATERIALS " +
				", tkmeasurement " +
				", ENNORMATIVEVOLUMEAVZ ";

		whereStr = " TKMATERIALS.CODE = ENNORMVOLUMEAVZITEM.MATERIALREFCODE";
		whereStr = whereStr + " AND ENNORMATIVEVOLUMEAVZ.CODE = ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE";
		whereStr = whereStr + " and tkmaterials.measurementcode = tkmeasurement.code";

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.CODE = ?";
			}
			if (aFilterObject.countGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTGEN = ?";
			}
			if (aFilterObject.userGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.userGen.indexOf('*', 0) < 0
						&& aFilterObject.userGen.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENNORMVOLUMEAVZITEM.USERGEN) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENNORMVOLUMEAVZITEM.USERGEN) LIKE UPPER(?)";
			}
			if (aFilterObject.dateEdit != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.DATEEDIT = ?";
			}
			if (aFilterObject.materialRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "ENNORMVOLUMEAVZITEM.MATERIALREFCODE = ? ";
			}
			if (aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE = ? ";
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
		if (quantity > -1)
			selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}
				if (aFilterObject.countGen != null) {
					number++;
					aFilterObject.countGen = aFilterObject.countGen.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.countGen);
				}

				if (aFilterObject.userGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.userGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.dateEdit != null) {
					number++;
					statement.setTimestamp(number, new java.sql.Timestamp(
							aFilterObject.dateEdit.getTime()));
				}
				if (aFilterObject.materialRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.materialRef.code);
				}
				if (aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.normativeVolumeRef.code);
				}
			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENNormVolumeAVZItemShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.countGen = set.getBigDecimal(2);
				if (anObject.countGen != null)
					anObject.countGen = anObject.countGen.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.userGen = set.getString(3);
				anObject.dateEdit = set.getTimestamp(4);

				anObject.materialRefCode = set.getInt(5);
				if (set.wasNull())
					anObject.materialRefCode = Integer.MIN_VALUE;
				anObject.materialRefName = set.getString(6);
				anObject.materialRefCost = set.getBigDecimal(7);
				if (anObject.materialRefCost != null)
					anObject.materialRefCost = anObject.materialRefCost
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.materialRefDeliveryDate = set.getInt(8);
				if (set.wasNull())
					anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
				anObject.materialRefNumkatalog = set.getString(9);
				anObject.materialRefIdentid = set.getString(10);
				anObject.normativeVolumeRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.normativeVolumeRefCode = Integer.MIN_VALUE;
				anObject.normativeVolumeRefUserGen = set.getString(12);
				anObject.normativeVolumeRefDateEdit = set.getTimestamp(13);

				anObject.measurementCode = set.getInt(14);
				if (set.wasNull())
					anObject.measurementCode = Integer.MIN_VALUE;
				anObject.measurementName = set.getString(15);

				anObject.nomenclaturNumber = set.getString(16);

		        anObject.countRequired = set.getBigDecimal(17);
		        if(anObject.countRequired != null)
		            anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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


	public ENNormVolumeAVZItemShortList getNormAVZList(
			Collection<Integer> rest_purpose_types, int fromPosition, int quantity)
			throws PersistenceException {

		ENNormVolumeAVZItemShortList result = new ENNormVolumeAVZItemShortList();
		ENNormVolumeAVZItemShort anObject;
		result.list = new Vector<ENNormVolumeAVZItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		
		if(rest_purpose_types == null || rest_purpose_types.size() == 0) {
			throw new java.lang.NullPointerException("Не задані типи залишки для формування списку!");
		}
		
		Collection<Integer> elementTypeCodes = new ArrayList<Integer>();

		for(int rest_purpose_type_id : rest_purpose_types) {
			switch(rest_purpose_type_id) {
			case RQConsts.REST_PURPOSE_TYPE_ID_AVAR:
				elementTypeCodes.add(ENElementType.NO_OBJECT_AVZ);
				break;
			case RQConsts.REST_PURPOSE_TYPE_ID_AVR16:
				elementTypeCodes.add(ENElementType.NO_OBJECT_AVR16);
				break;
			case RQConsts.REST_PURPOSE_TYPE_ID_PVZ:
				elementTypeCodes.add(ENElementType.NO_OBJECT_RESTOCKING);
				break;
				default:
					throw new SystemException(String.format("Невідомий тип залишку - %d", rest_purpose_type_id));
			}			
		}
		
		String restPurposeTypesIdString = Tools.collection2String(rest_purpose_types, ",");
		String elementTypeCodesString = Tools.collection2String(elementTypeCodes, ", ");


		/*
		selectStr = " select " +
				" a.budgetrefcode, " +
				" a.departmentrefcode, " +
				" t.nameetalon, " +
				" m.name, " +
				" ai.materialrefcode, " +
				" sum(ai.countrequired), " +
				" (select string_agg(nn,',') from tempnomenclatures where materialrefcode = ai.materialrefcode ) as nn, " +
				" coalesce(t.cost,0), " +
				" coalesce(t.deliverydate,30) " +

				" from ennormvolumeavzitem ai, tkmaterials t, tkmeasurement m, ennormativevolumeavz a " +
				" where ai.countrequired <> 0 " +
				" and t.code = ai.materialrefcode " +
				" and m.code = t.measurementcode " +
				" and a.code = ai.normativevolumerefcode " +

				" group by a.budgetrefcode, a.departmentrefcode, ai.materialrefcode, t.nameetalon, m.name, t.cost, t.deliverydate " +
				" order by 1, 2";
		 */
		
		selectStr = 
			"  select " +
			"    a.budgetrefcode, " +
			"    a.departmentrefcode, " +
			"    t.name as materialname, " +
			"    m.name as measurementname, " +
			"    ai.materialrefcode, " +
			"     " +
			"    sum(ai.countrequired) as countrequired, " +
			"     " +
			"    (select sum(i.countrequired) from ennormvolumeavzitem i, ennormativevolumeavz avz " +
			"     where i.materialrefcode = ai.materialrefcode and i.normativevolumerefcode = avz.code " +
			"       and avz.budgetrefcode = a.budgetrefcode) as countrequired_by_budg, " +
			"     " +
			"    sum(ai.countgen) as countgen, " +
			"     " +
			"    (select sum(i.countgen) from ennormvolumeavzitem i, ennormativevolumeavz avz " +
			"     where i.materialrefcode = ai.materialrefcode and i.normativevolumerefcode = avz.code " +
			"       and avz.budgetrefcode = a.budgetrefcode) as countgen_by_budg, " +
			"     " +
			"    (select string_agg('''' || nn || '''', ',') from tempnomenclatures where materialrefcode = ai.materialrefcode) as nn, " +
			"    coalesce(t.cost,0) as cost, " +
			"    coalesce(t.deliverydate,30) as deliverydate, " +
			"   " +
			"    coalesce(( " +
			"    select sum(oi.countfact) from rqorderitem as oi " +
			"		inner join rqorder as o on oi.orderrefcode = o.code " +
			"	where oi.statusrefcode = 1 " +
			"	 and oi.materialcode = ai.materialrefcode " +
			"	 and oi.budgetrefcode = a.budgetrefcode " +
			"	 and o.creationmethodrefcode = 2 " +
			"	 and o.statusrefcode = 2 " +
			"	 and exists (select 1 from rqorderitem2enestimttm as oi2e " +
			"		inner join enestimateitem as es on oi2e.estimateitemcode = es.code " +
			"		inner join enplanwork as pw on es.planrefcode = pw.code " +
			"		inner join enelement as el on pw.elementrefcode = el.code " +
			"		where el.typerefcode in (" + elementTypeCodesString +  "))" +
			"  ),0) as ordered_count_by_budg, " +
			"   " +
			"    coalesce(( " +
			"    select sum(oi2e.countgen) from rqorderitem oi, rqorderitem2enestimttm oi2e, enestimateitem ei, enplanwork pw, enelement as el " +
			"  where oi.orderrefcode in ( " +
			"  select o.code from rqorder o where o.creationmethodrefcode = 2 and o.statusrefcode = 2) " +
			"  and oi.statusrefcode = 1 " +
			"  and oi.materialcode = ai.materialrefcode " +
			"  and oi2e.orderitemcode = oi.code " +
			"  and oi2e.estimateitemcode = ei.code " +
			"  and ei.planrefcode = pw.code " +
			"  and pw.budgetrefcode = a.budgetrefcode " +
			"  and pw.departmentrefcode = a.departmentrefcode " +
			"  and pw.elementrefcode = el.code " +
			"  and el.typerefcode in (" + elementTypeCodesString + ")" +
			"  ),0) as ordered_count_by_budg_and_dep, " +
			"   " +
			"  COALESCE(( " +
			"  select sum(f2e.countgen) from rqfkorderitem2enstmttm f2e, rqfkorderitem fkitem, rqfkorder fkord " +
			"  where f2e.estimateitemcode in ( " +
			"  select e.estimateitemcode from rqorderitem2enestimttm e, enestimateitem ei, enplanwork pw, enelement as el " +
			"  where e.orderitemcode in (select oi.code from rqorderitem oi " +
			"  where oi.orderrefcode in ( " +
			"  select o.code from rqorder o where o.creationmethodrefcode = 2 and o.statusrefcode = 2) " +
			"  and oi.statusrefcode = 1 " +
			"  and oi.materialcode = ai.materialrefcode) " +
			"  and e.estimateitemcode = ei.code " +
			"  and ei.planrefcode = pw.code " +
			"  and pw.budgetrefcode = a.budgetrefcode " +
			"  and pw.elementrefcode = el.code " +
			"  and el.typerefcode in (" + elementTypeCodesString + ")" +
			"  ) " +
			"  and f2e.fkorderitemrefcode = fkitem.code " +
			"  and fkitem.fkorderrefcode = fkord.code " +
			"  and fkord.kindcode = 1 " +
			"  and fkord.statuscode = 3),0) as invoice_count_by_budg, " +
			"   " +
			"  COALESCE(( " +
			"  select sum(f2e.countgen) from rqfkorderitem2enstmttm f2e, rqfkorderitem fkitem, rqfkorder fkord " +
			"  where f2e.estimateitemcode in ( " +
			"  select e.estimateitemcode from rqorderitem2enestimttm e, enestimateitem ei, enplanwork pw, enelement as el " +
			"  where e.orderitemcode in (select oi.code from rqorderitem oi " +
			"  where oi.orderrefcode in ( " +
			"  select o.code from rqorder o where o.creationmethodrefcode = 2 and o.statusrefcode = 2) " +
			"  and oi.statusrefcode = 1 " +
			"  and oi.materialcode = ai.materialrefcode) " +
			"  and e.estimateitemcode = ei.code " +
			"  and ei.planrefcode = pw.code " +
			"  and pw.budgetrefcode = a.budgetrefcode " +
			"  and pw.departmentrefcode = a.departmentrefcode " +
			"  and pw.elementrefcode = el.code " +
			"  and el.typerefcode in (" + elementTypeCodesString + ")" +
			"  ) " +
			"  and f2e.fkorderitemrefcode = fkitem.code " +
			"  and fkitem.fkorderrefcode = fkord.code " +
			"  and fkord.kindcode = 1 " +
			"  and fkord.statuscode = 3),0) as invoice_count_by_budg_and_dep " +
			"  , a.rest_purpose_type_id " +
			"   " +
			"  from ennormvolumeavzitem ai, tkmaterials t, tkmeasurement m, ennormativevolumeavz a " +
			"  where ai.countrequired <> 0 " +
			"	 and a.rest_purpose_type_id in (" + restPurposeTypesIdString + ")" +
			"    and t.code = ai.materialrefcode " +
			"    and m.code = t.measurementcode " +
			"    and a.code = ai.normativevolumerefcode " +
			"    and a.budgetrefcode <> " + ENConsts.ENBUDGET_AGV +
			"   " +
			"  group by a.budgetrefcode, a.departmentrefcode, ai.materialrefcode, t.name, m.name, t.cost, t.deliverydate, a.rest_purpose_type_id " +
			"  order by 1, 2 ";
			
			
		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENNormVolumeAVZItemShort();

				anObject.budgetRefCode = set.getInt(1);
				if (set.wasNull())
					anObject.budgetRefCode = Integer.MIN_VALUE;

				anObject.departmentRefCode = set.getInt(2);
				if (set.wasNull())
					anObject.departmentRefCode = Integer.MIN_VALUE;
				
				anObject.materialNameEtalon = set.getString(3);
				anObject.measurementName = set.getString(4);

				anObject.materialRefCode = set.getInt(5);
				if (set.wasNull())
					anObject.materialRefCode = Integer.MIN_VALUE;

				anObject.countRequired = set.getBigDecimal(6);
				if (anObject.countRequired != null)
					anObject.countRequired = anObject.countRequired.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.countRequiredByBudg = set.getBigDecimal(7);
				if (anObject.countRequiredByBudg != null)
					anObject.countRequiredByBudg = anObject.countRequiredByBudg.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.countGen = set.getBigDecimal(8);
				if (anObject.countGen != null)
					anObject.countGen = anObject.countGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.countGenByBudg = set.getBigDecimal(9);
				if (anObject.countGenByBudg != null)
					anObject.countGenByBudg = anObject.countGenByBudg.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);				
				
				anObject.strNomenclatures = set.getString(10);

				anObject.materialRefCost = set.getBigDecimal(11);
				if (anObject.materialRefCost != null)
					anObject.materialRefCost = anObject.materialRefCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.deliveryTime = set.getInt(12);
				if (set.wasNull())
					anObject.deliveryTime = Integer.MIN_VALUE;

				anObject.orderedCountByBudg = set.getBigDecimal(13);
				if (anObject.orderedCountByBudg != null)
					anObject.orderedCountByBudg = anObject.orderedCountByBudg.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);				

				anObject.orderedCountByBudgAndDep = set.getBigDecimal(14);
				if (anObject.orderedCountByBudgAndDep != null)
					anObject.orderedCountByBudgAndDep = anObject.orderedCountByBudgAndDep.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
				
				anObject.invoiceCountByBudg = set.getBigDecimal(15);
				if (anObject.invoiceCountByBudg != null)
					anObject.invoiceCountByBudg = anObject.invoiceCountByBudg.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
				
				anObject.invoiceCountByBudgAndDep = set.getBigDecimal(16);
				if (anObject.invoiceCountByBudgAndDep != null)
					anObject.invoiceCountByBudgAndDep = anObject.invoiceCountByBudgAndDep.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
				
				anObject.rest_purpose_type_id = set.getInt(17);
				if(set.wasNull()) {
					anObject.rest_purpose_type_id = Integer.MIN_VALUE;
				}
				
				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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

} // end of ENNormVolumeAVZItemDAO
