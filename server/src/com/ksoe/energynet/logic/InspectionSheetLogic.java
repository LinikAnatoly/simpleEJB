package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ksoe.energynet.dataminer.ENInspectionSheetDAO;
import com.ksoe.energynet.dataminer.ENInspectionSheetItemDAO;
import com.ksoe.energynet.ejb.ENInspectionSheetControllerEJB.EquipmentKind;
import com.ksoe.energynet.ejb.ENInspectionSheetControllerEJB.InspectionKind;
import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.energynet.valueobject.ENInspectionSheetStatus;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.netobjects.dataminer.ENSubst150CellDAO;
import com.ksoe.netobjects.dataminer.ENSubstation150DAO;
import com.ksoe.netobjects.valueobject.ENSubst150Cell;
import com.ksoe.netobjects.valueobject.ENSubstation150;
import com.ksoe.netobjects.valueobject.ENVoltageClass;
import com.ksoe.netobjects.valueobject.filter.ENSubst150CellFilter;
import com.ksoe.netobjects.valueobject.filter.ENSubstation150Filter;
import com.ksoe.techcard.dataminer.TKDefects2InspectItemDAO;
import com.ksoe.techcard.valueobject.filter.TKDefects2InspectItemFilter;
import com.ksoe.techcard.valueobject.lists.TKDefects2InspectItemShortList;

public class InspectionSheetLogic extends LogicModule {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	public InspectionSheetLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}



	/**
	 * формирование листа осмотра (общий метод для низкой стороны и для ПЛ 35-150 кВ)
	 *
	 * @param ENInspectionSheet
	 * @param equipmentKind
	 *
	 * @return inspectionSheetCode
	 */
	public int makeSheetGeneral(ENInspectionSheet inspectionSheet, int equipmentKind) {
		if (equipmentKind <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий вид обладнання!");
		}

		int inspectionSheetCode = Integer.MIN_VALUE;

		try {

			ENInspectionSheetDAO inspectionSheetDao = new ENInspectionSheetDAO(connection, userProfile);
			ENInspectionSheetItemDAO inspectionSheetItemDao = new ENInspectionSheetItemDAO(connection, userProfile);
			TKDefects2InspectItemDAO defects2InspectItemDao = new TKDefects2InspectItemDAO(connection, userProfile);
			ElementLogic elementLogic = new ElementLogic(connection, userProfile);

			inspectionSheet.userGen = userProfile.userName;
			inspectionSheet.dateEdit = new Date();

			inspectionSheet.statusRef.code = ENInspectionSheetStatus.DRAFT;
			inspectionSheet.equipmentKind = equipmentKind;


			if (inspectionSheet.inspectionKind != InspectionKind.PLANED
					&& inspectionSheet.inspectionKind != InspectionKind.POST_ACCIDENT
					&& inspectionSheet.inspectionKind != InspectionKind.NO_PLANED) {
				throw new SystemException("\n\n"
						+ "Вид огляду повинен бути плановий, післяаварійний або позаплановий!!!");
			}


			String[] eName = elementLogic.getNameByCode(inspectionSheet.elementRef.code);
			inspectionSheet.objectName = eName[0];
			inspectionSheet.objectInvNumber = eName[1];


			inspectionSheetCode = inspectionSheetDao.add(inspectionSheet);



	        TKDefects2InspectItemFilter defectsItemFilter = new TKDefects2InspectItemFilter();
	        defectsItemFilter.defects2InspectRef.code = inspectionSheet.defects2InspectRef.code;

	        TKDefects2InspectItemShortList defectsItemList = defects2InspectItemDao.getScrollableFilteredList(defectsItemFilter, 0, -1);

	        for (int i = 0; i < defectsItemList.totalCount; i++) {
	        	ENInspectionSheetItem inspectionSheetItem = new ENInspectionSheetItem();

	        	inspectionSheetItem.defectCode = defectsItemList.get(i).classificationTypeRefKod;
	        	inspectionSheetItem.defectName = defectsItemList.get(i).classificationTypeRefName;
	        	inspectionSheetItem.isDetecting = ENInspectionSheetItem.ISDETECTING_NO;
	        	inspectionSheetItem.userGen = userProfile.userName;
	        	inspectionSheetItem.dateEdit = new Date();
	        	inspectionSheetItem.sheetRef.code = inspectionSheetCode;
	        	inspectionSheetItem.classificationTypeRef.code = defectsItemList.get(i).classificationTypeRefCode;

	        	inspectionSheetItem.coefficientKi = defectsItemList.get(i).coefficientKi;
	        	inspectionSheetItem.pointsPi = defectsItemList.get(i).pointsPi;
	        	inspectionSheetItem.weightXi = defectsItemList.get(i).weightXi;


	        	inspectionSheetItemDao.add(inspectionSheetItem);
	        }


			return inspectionSheetCode;

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



	/**
	 * формирование листа осмотра по высокой стороне
	 *
	 * @param ENInspectionSheet
	 * @return inspectionSheetCode
	 */
	public int makeSheetHighSide(ENInspectionSheet inspectionSheet) {

		int inspectionSheetCode = Integer.MIN_VALUE;
		int cellCode = Integer.MIN_VALUE;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {

			ENInspectionSheetDAO inspectionSheetDao = new ENInspectionSheetDAO(connection, userProfile);
			ENInspectionSheetItemDAO inspectionSheetItemDao = new ENInspectionSheetItemDAO(connection, userProfile);
			TKDefects2InspectItemDAO defects2InspectItemDao = new TKDefects2InspectItemDAO(connection, userProfile);
			ENSubst150CellDAO subst150CellDao = new ENSubst150CellDAO(connection, userProfile);
			ENSubstation150DAO substation150Dao = new ENSubstation150DAO(connection, userProfile);
			ElementLogic elementLogic = new ElementLogic(connection, userProfile);


			ENSubst150CellFilter subst150CellFilter = new ENSubst150CellFilter();
			subst150CellFilter.element.code = inspectionSheet.elementRef.code;

			ENSubst150Cell subst150Cell = new ENSubst150Cell();
			int[] cArr = subst150CellDao.getFilteredCodeArray(subst150CellFilter, 0, -1);
			if (cArr.length == 1) {
				subst150Cell = subst150CellDao.getObject(cArr[0]);
				cellCode = subst150Cell.code;
			} else {
				return Integer.MIN_VALUE;
			}


			ENSubstation150Filter substation150Filter = new ENSubstation150Filter();
			substation150Filter.code = subst150Cell.substationRef.code;


			int[] sArr = substation150Dao.getFilteredCodeArray(substation150Filter, 0, -1);
			if (sArr.length > 0) {
				ENSubstation150 substation150 = substation150Dao.getObject(sArr[0]);

				String[] eName = elementLogic.getNameByCode(substation150.element.code);
				inspectionSheet.objectName = eName[0];
				inspectionSheet.objectInvNumber = eName[1];
			}


			/**  определение шаблонов по номиналу  */
			String voltageClassCondition = "";

			/** Ячейки 150 кВ */
			if (subst150Cell.voltageClassRef.code == ENVoltageClass.KB150) {
				voltageClassCondition = " and d.voltageclassrefcode = " + ENVoltageClass.KB150;
			}

			/** Ячейки 35 кВ */
			if (subst150Cell.voltageClassRef.code == ENVoltageClass.KB35) {
				voltageClassCondition = " and d.voltageclassrefcode = " + ENVoltageClass.KB35;
			}

			/** Ячейки 6-10 кВ */
			if (subst150Cell.voltageClassRef.code == ENVoltageClass.KB10) {
				voltageClassCondition = " and d.voltageclassrefcode = " + ENVoltageClass.KB10;
			}

			/** Ячейки 6-10 кВ */
			if (subst150Cell.voltageClassRef.code == ENVoltageClass.KB6) {
				voltageClassCondition = " and d.voltageclassrefcode = " + ENVoltageClass.KB6;
			}


			String sql = "select * from ( " +
					" select w.* " +
					" , ( select d.code from tkdefects2inspection d where d.elementtyperefcode = w.elementTypeCode " + voltageClassCondition + " ) as templateCode " +
					" , ( select et.name from enelementtype et where et.code = w.elementTypeCode ) " +

					" from ( " +

					" select tb.name, tb.elementcode, el.typerefcode as elementTypeCode " +
					" from ensubst150controlcable tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150currenttrans tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150dgk tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150discharger tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150disconnector tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150pulloutelmnt tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150rza tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150separator tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150shortcircutr tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150switch tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150tiresection tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150tn tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" union all " +
					" select tb.name, tb.elementcode, el.typerefcode " +
					" from ensubst150tvp tb, enelement el " +
					" where tb.cellrefcode = " + cellCode +
					" and el.code = tb.elementcode " +

					" ) w order by 3 ) d where d.templateCode is not null";


			List<SheetData> result = new ArrayList<>();

			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			for (int i = 0; resultSet.next(); i++) {
				SheetData sheetData = new SheetData();

				sheetData.elementName = resultSet.getString(1);
				sheetData.elementCode = resultSet.getInt(2);
				sheetData.elementTypeCode = resultSet.getInt(3);
				sheetData.templateCode = resultSet.getInt(4);
				sheetData.elementTypeName = resultSet.getString(5);

				result.add(sheetData);
			}


			for (int i = 0; i < result.size(); i++) {

				int groupCode = Integer.MIN_VALUE;
				int defectsTemplateCode = result.get(i).templateCode;

				if (inspectionSheetCode == Integer.MIN_VALUE) {

					inspectionSheet.userGen = userProfile.userName;
					inspectionSheet.dateEdit = new Date();
					inspectionSheet.dateGen = new Date();

					inspectionSheet.statusRef.code = ENInspectionSheetStatus.DRAFT;
					inspectionSheet.equipmentKind = EquipmentKind.HIGH_VOLTAGE;
					inspectionSheet.defects2InspectRef.code = defectsTemplateCode;
					inspectionSheet.name = "Лист огляду - " + subst150Cell.name;

					inspectionSheetCode = inspectionSheetDao.add(inspectionSheet);
				}


				TKDefects2InspectItemFilter defectsItemFilter = new TKDefects2InspectItemFilter();
		        defectsItemFilter.defects2InspectRef.code = defectsTemplateCode;

		        TKDefects2InspectItemShortList defectsItemList = defects2InspectItemDao.getScrollableFilteredList(defectsItemFilter, 0, -1);

		        for (int d = 0; d < defectsItemList.totalCount; d++) {

		        	if (groupCode == Integer.MIN_VALUE) {

		        		ENInspectionSheetItem inspectionSheetItem = new ENInspectionSheetItem();

			        	inspectionSheetItem.defectCode = defectsItemList.get(d).classificationTypeRefKod;
			        	inspectionSheetItem.defectName = result.get(i).elementTypeName + " - " + result.get(i).elementName;
			        	inspectionSheetItem.isDetecting = ENInspectionSheetItem.ISDETECTING_NO;
			        	inspectionSheetItem.userGen = userProfile.userName;
			        	inspectionSheetItem.dateEdit = new Date();
			        	inspectionSheetItem.sheetRef.code = inspectionSheetCode;
			        	inspectionSheetItem.classificationTypeRef.code = defectsItemList.get(d).classificationTypeRefCode;

			        	inspectionSheetItemDao.add(inspectionSheetItem);

		        		groupCode = defectsItemList.get(d).classificationTypeRefCode;
		        	}


		        	ENInspectionSheetItem inspectionSheetItem = new ENInspectionSheetItem();

		        	inspectionSheetItem.defectCode = defectsItemList.get(d).classificationTypeRefKod;
		        	inspectionSheetItem.defectName = defectsItemList.get(d).classificationTypeRefName;
		        	inspectionSheetItem.isDetecting = ENInspectionSheetItem.ISDETECTING_NO;
		        	inspectionSheetItem.userGen = userProfile.userName;
		        	inspectionSheetItem.dateEdit = new Date();
		        	inspectionSheetItem.sheetRef.code = inspectionSheetCode;
		        	inspectionSheetItem.classificationTypeRef.code = defectsItemList.get(d).classificationTypeRefCode;

		        	inspectionSheetItem.coefficientKi = defectsItemList.get(d).coefficientKi;
		        	inspectionSheetItem.pointsPi = defectsItemList.get(d).pointsPi;
		        	inspectionSheetItem.weightXi = defectsItemList.get(d).weightXi;
		        	inspectionSheetItem.elementRef.code = result.get(i).elementCode;


		        	inspectionSheetItemDao.add(inspectionSheetItem);
		        }

			}



			return inspectionSheetCode;

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}

	public int getVoltageClassCodeByVoltageNominalCode(int voltageNominalCode) {
		if (voltageNominalCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код номіналу напруги!");
		}

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		String selectStr = "select vn.voltageclasscode4 from epvoltagenominal vn where vn.code = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, voltageNominalCode);

			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}

		return Integer.MIN_VALUE;
	}


	public class SheetData {

		public String elementName = "";
		public int elementCode = Integer.MIN_VALUE;
		public int elementTypeCode = Integer.MIN_VALUE;
		public int templateCode = Integer.MIN_VALUE;
		public String elementTypeName = "";

	}


}