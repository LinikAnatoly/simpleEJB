package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetItemDAO;
import com.ksoe.energynet.dataminer.ENNormVolumeAVZItemDAO;
import com.ksoe.energynet.dataminer.ENNormativeVolumeAVZDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportRealFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuel2FINMaterialsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistanceDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportRealFuelRemains;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelType;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENTransport2ENEstimateShort;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelRemainsShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENNormVolumeAVZItemFilter;
import com.ksoe.energynet.valueobject.filter.ENNormativeVolumeAVZFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRealFuelRemainsFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuel2FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.ENNormVolumeAVZItemShortList;
import com.ksoe.energynet.valueobject.lists.ENNormativeVolumeAVZShortList;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRealFuelRemainsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuel2FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelRemainsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.valueobject.FINDocType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.FINDoc2FKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.ejb.RQFKOrderController;
import com.ksoe.rqorder.ejb.RQFKOrderControllerHome;
import com.ksoe.rqorder.ejb.RQFKOrderItemController;
import com.ksoe.rqorder.ejb.RQFKOrderItemControllerHome;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.filter.FINDoc2FKOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.FINDoc2FKOrderShortList;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItem2ENEstimateItemShortList;
import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKFuelCalcType;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKTransportClassification;
import com.ksoe.techcard.valueobject.TKTransportRealHistory;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.filter.TKFuelTypeFilter;
import com.ksoe.techcard.valueobject.lists.TKFuelTypeShortList;

public class TravelSheetFuelLogic extends LogicModule{

	/**
	 * Статический класс, где объявлены константы значения поля hasStarter (есть ли у транспорта пусковой двигатель или нет)
	 * @author kreshchishinma
	 *
	 */
	public static class TKTransportRealHasStarter
	{
		/** Пусковой двигатель есть */
		public static final int YES = 1;
		/** Пускового двигателя нет */
		public static final int NO = 0;
	}

	/**
	 *
	 * Класс с информацией про результаты расчета топлива
	 *
	 * @author KreschishinMA
	 *
	 */
	public class FuelConsumingCalculationResults {
		/** код строки транспорта на плане*/
		public int transportItemCode = Integer.MIN_VALUE;
		/** Суммарно потреблено*/
		public BigDecimal totalValue = null;
		/** рассчитаное кол-во потребленного топлива по километражу   */
		public BigDecimal byDistance = null;
		/** рассчитаное кол-во потребленного топлива по машиночасам */
		public BigDecimal byTime = null;
		/** По времени движения (для трактора) */
		public BigDecimal byTime2 = null;
		/**Расчитанный температурный коэффициент*/
		public BigDecimal temperatureKoef = null;
		/**Расход расчитанный для времени прогрева*/
		public BigDecimal heatingTimeConsumption = null;

		@Override
		public String toString() {
			return String.format("FuelConsumingCalculationResults: transportItemCode = %d \n " +
					"totalValue = %f \n " +
					"byDistance = %f \n " +
					"byTime = %f \n " +
					"byTime2 = %f \n " +
					"temperatureKoef = %f \n" +
					"heatingTimeConsumption = %f"
					, transportItemCode
					, totalValue
					, byDistance
					, byTime
					, byTime2
					, temperatureKoef
					, heatingTimeConsumption);
		}

	}
	
	public ENTravelSheetFuelRemains getFuelRemainsByTravelSheet(int travelSheetCode, int fuelTypeCode, int travelSheetFuelTypeCode, boolean isThirdParty) throws PersistenceException {
		ENTravelSheetFuelRemains out = null;
		ENTravelSheetFuelRemainsDAO dao = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		ENTravelSheetFuelRemainsFilter f = new ENTravelSheetFuelRemainsFilter();
		f.travelSheetRef.code = travelSheetCode;
		f.fuelTypeRef.code = fuelTypeCode;
		f.travelSheetFuelTypeRef.code = travelSheetFuelTypeCode;
		f.conditionSQL = String.format("coalesce(%s, false) = ?", ENTravelSheetFuelRemains.isThirdParty_QFielld);
		int[] arr = dao.getFilteredCodeArray(f, 0, -1, new Vector<>(Arrays.asList(isThirdParty)));
		if (arr.length > 0) {
			out = dao.getObject(arr[0]);
		}
		return out;
	}

	/**
	 *
	 * Сума топлива для подразделения нормативно утвержденного для АВР
	 *
	 * @param isDiesel топливо: true - дизтопливо, false - бензин
	 * @param departmentCode код подразделения
	 * @return
	 * @throws PersistenceException
	 */
	public BigDecimal getCountAVRFuelFromNormativeVolumes(/*boolean isDiesel*/ int fuelTypeRefcode, String departmentCodes, int budgetRefCode) throws PersistenceException {

		BigDecimal out = new BigDecimal(0);

		TKFuelTypeDAO fuelTypeDao = new TKFuelTypeDAO(connection, userProfile);

		TKFuelTypeFilter fuelTypeFilter = new TKFuelTypeFilter();
		if(fuelTypeRefcode == TKFuelType.DT) {
			fuelTypeFilter.conditionSQL = " code in (" + TKFuelType.DT + ")";
		} else if (fuelTypeRefcode == TKFuelType.A92) {
			fuelTypeFilter.conditionSQL = " code in (" + TKFuelType.A80 + ", " + TKFuelType.A92 +  ")";
		} else if (fuelTypeRefcode == TKFuelType.A95) {
			fuelTypeFilter.conditionSQL = " code in (" + TKFuelType.A95 + ")";
		}

		TKFuelTypeShortList fuelTypeList = fuelTypeDao.getScrollableFilteredList(fuelTypeFilter, 0, -1);

		String matCondition = "";
		for(int i = 0; i < fuelTypeList.totalCount; i++) {
			if(matCondition.length() > 0) {
				matCondition = matCondition + ", " + fuelTypeList.get(i).materialRefCode;
			} else {
				matCondition = "" + fuelTypeList.get(i).materialRefCode;
			}
		}

		ENNormativeVolumeAVZDAO normAvzDao = new ENNormativeVolumeAVZDAO(connection, userProfile);
		ENNormVolumeAVZItemDAO normAvzItemDao = new ENNormVolumeAVZItemDAO(connection, userProfile);

		ENNormativeVolumeAVZFilter normVolumeAVZ = new ENNormativeVolumeAVZFilter();
		normVolumeAVZ.conditionSQL = ENNormativeVolumeAVZ.departmentRef_QFielld + " IN (" + departmentCodes + ")";
		if(budgetRefCode != Integer.MIN_VALUE) {
			normVolumeAVZ.budgetRef.code = budgetRefCode;
		}

		ENNormativeVolumeAVZShortList avzVolumesList = normAvzDao.getScrollableFilteredList(normVolumeAVZ, 0, -1);
		for(int i = 0; i < avzVolumesList.totalCount; i++) {
			ENNormVolumeAVZItemFilter avzItemFilter = new ENNormVolumeAVZItemFilter();
			avzItemFilter.normativeVolumeRef.code = avzVolumesList.get(i).code;
			avzItemFilter.conditionSQL = ENNormVolumeAVZItem.materialRef_QFielld + " IN (" + matCondition + ")";

			ENNormVolumeAVZItemShortList itemList = normAvzItemDao.getScrollableFilteredList(avzItemFilter, 0, -1);
			for(int j = 0; j < itemList.totalCount; j++) {
				out = out.add(itemList.get(j).countRequired);
			}
		}

		return out;
	}

	/**
	 *
	 * Сумма израсходованного топлива по декаде месяца (по планам)
	 *
	 * @param month месяц
	 * @param year год
	 * @param decade декада (1-3)
	 * @param managementRefCode код дирекции
	 * @param departmentCode  код подразделения
	 * @return суммарное кол-во в литрах израсходованного топлива за период
	 * @throws PersistenceException
	 */
	public BigDecimal getCountPMMFromNPW3(int month, int year, int decade, int managementRefCode, int departmentCode, int tkFuelType) throws PersistenceException {
		return getCountPMMFromNPW(month, year, decade, managementRefCode, departmentCode, tkFuelType, false);
	}

	/**
	 *
	 * Сумма израсходованного топлива по декаде месяца (по факту)
	 *
	 * @param month месяц
	 * @param year год
	 * @param decade декада (1-3)
	 * @param managementRefCode код дирекции
	 * @param departmentCode  код подразделения
	 * @return суммарное кол-во в литрах израсходованного топлива за период
	 * @throws PersistenceException
	 */
	public BigDecimal getCountPMMFromNPWFact3(int month, int year, int decade, int managementRefCode, int departmentCode, int tkFuelType) throws PersistenceException {
		return getCountPMMFromNPW(month, year, decade, managementRefCode, departmentCode, tkFuelType, true);
	}

	/**
	 *
	 * Сумма израсходованного топлива по декаде месяца
	 *
	 * @param month месяц
	 * @param year год
	 * @param decade декада (1-3)
	 * @param managementRefCode код дирекции
	 * @param departmentCode  код подразделения
	 * @param isFact факт или план
	 * @return суммарное кол-во в литрах израсходованного топлива за период
	 * @throws PersistenceException
	 */
	private BigDecimal getCountPMMFromNPW(int month, int year, int decade, int managementRefCode, int departmentCode, int tkFuelType, boolean isFact) throws PersistenceException {
		try {
			String functionName = null;
			if(isFact) {
				functionName = "get_count_pmm_from_npw_fact3";

			} else {
				functionName = "get_count_pmm_from_npw3";
			}
			BigDecimal out = null;
			String sql = " select coalesce(( select * from " + functionName + "( " +
                "? " +
                ", ? " +
                ", ? " +
                ", ? " +
                ", ? " +
                ", ? " +
                ")" +
                "),0) as count_npz_plan_benz_dek1";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, decade);
			statement.setInt(2, month);
			statement.setInt(3, year);
			statement.setString(4, String.valueOf(managementRefCode));
			statement.setString(5, String.valueOf(departmentCode));
			statement.setInt(6, tkFuelType);

			ResultSet  resultSet =  statement.executeQuery();

			if(resultSet.next()) {
				out = resultSet.getBigDecimal(1);
			}

			return out;
		} catch (SQLException e) {
			throw new PersistenceException("Could not getCountPMMFromNPW", e);
		}
	}




	public ENTravelSheetFuel getFuelInTravelSheet(int travelSheetCode, int fuelTypeCode, int travelSheetFuelTypeCode, boolean isThirdParty) throws PersistenceException
	{
		ENTravelSheetFuel fuel = new ENTravelSheetFuel();
		fuel.countGen = new BigDecimal(0);
		fuel.fuelType.code = fuelTypeCode;
		fuel.travelSheetFuelTypeRef.code = travelSheetFuelTypeCode;
		ENTravelSheetFuelDAO dao = new ENTravelSheetFuelDAO(connection, userProfile);
		ENTravelSheetFuelFilter f = new ENTravelSheetFuelFilter();
		f.travelSheetRef.code = travelSheetCode;
		f.fuelType.code = fuelTypeCode;
		f.travelSheetFuelTypeRef.code = travelSheetFuelTypeCode;
		f.conditionSQL = String.format("coalesce(%s, false) = ?", ENTravelSheetFuel.isThirdParty_QFielld);
		
		ENTravelSheetFuelShortList list = dao.getScrollableFilteredList(f, 0, -1, new Vector<>(Arrays.asList(isThirdParty)));
		for (int i = 0; i < list.totalCount; i++){
			fuel.countGen = fuel.countGen.add(list.get(i).countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		return fuel;
	}


	public boolean checkWritingOffByEstimateCode(int estimateItemCode, boolean isException) throws PersistenceException
	{
		boolean out = false;

		/////
		ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection, userProfile);
		ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
		t2eFilter.estimateRef.code = estimateItemCode;
		ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);
		if (t2eList.totalCount == 0){
			throw new EnergyproSystemException("t2eList.totalCount == 0");
		}

		PlanWorkLogic pLogic = new PlanWorkLogic(connection, userProfile);
		TransportLogic tLogic = new TransportLogic(connection, userProfile);

		int pCode = pLogic.getPlanCodeByTransport(t2eList.get(0).transportRefCode);
		ENPlanWork plan = pLogic.getPlanByCode(pCode);

		ENTransportItem tr = new ENTransportItemDAO(connection, userProfile).getObject(t2eList.get(0).transportRefCode);

		if ( ! tLogic.checkTransportItemInTravelSheet(tr.transportReal.code, plan.dateStart, false))
		{
			return out;
		}
		////


		// типа топлива
		ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
		ENEstimateItem est = estDAO.getObject(estimateItemCode);
		TKFuelTypeDAO ftDAO = new TKFuelTypeDAO(connection, userProfile);
		TKFuelTypeFilter ftFilter = new TKFuelTypeFilter();
		ftFilter.materialRef.code = est.materialRef.code;
		int[] ftArr = ftDAO.getFilteredCodeArray(ftFilter, null, null, 0, -1, null);
		if ( ftArr.length != 1){
			throw new EnergyproSystemException("Помилка у кількості типів палива для ENEstimateItem ...");
		}
		int fuelTypeCode = ftArr[0];


		// найдем код трансп. листа ...
		ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();
		tsiFilter.conditionSQL = "code in (select ti2t.travelsheetitemrefcode from entransport2enestimate t2e , entravlshttm2trnsprttm ti2t " +
			" where t2e.transportrefcode = ti2t.transportitemrefcode and t2e.estimaterefcode = " + est.code + ")";
		ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemShortList tsiList = tsiDAO.getScrollableFilteredList(tsiFilter, 0, -1);
		if (tsiList.totalCount == 0){
			throw new EnergyproSystemException("Подорожній лист не знайдено для ПММ ... (" + est.code + ")");
		}
		int travelSheetCode = tsiList.get(0).travelSheetRefCode;

		out = checkWritingOff(travelSheetCode, fuelTypeCode, 1, false);
		if (out){
			if (isException){
				throw new EnergyproSystemException("Кількість, що списується, перевищує кількість, вказану у подорожньому листі");
			}
		}

		return out;

	}


	// checkMode = 0 - проверка на ТОЧНОЕ схождение спсанного и мат-лов из ФК
	// checkMode = 1 в ФК не больше чем в оборотке
	public boolean checkWritingOff(int travelSheetCode, int fuelTypeCode, int checkMode, boolean isException) throws PersistenceException
	{
		boolean out = false;

		// выберем кол-во в резерве для этого тр. листа ...
		FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
		FINMaterialsFilter finFilter = new FINMaterialsFilter();
		finFilter.statusRef.code = FINMaterialsStatus.GOOD;
		finFilter.conditionSQL = "finmaterials.estimateitemrefcode in ("+
		" select t2e.estimaterefcode from entransport2enestimate t2e, entravlshttm2trnsprttm ti2t, entravelsheetitem ti " +
		" where t2e.transportrefcode = ti2t.transportitemrefcode and ti2t.travelsheetitemrefcode = ti.code " +
		" and ti.travelsheetrefcode = " + travelSheetCode + ") ";

		FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);

		BigDecimal count_ = new BigDecimal(0);
		BigDecimal sum_ = new BigDecimal(0);

		for (int i = 0; i < finList.totalCount; i++){
			count_ = count_.add( finList.get(i).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
			sum_ = sum_.add(finList.get(i).cost).setScale(2, BigDecimal.ROUND_HALF_UP);
		}

		// пересчитаем остатки
		ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);

		ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
		remFilter.travelSheetRef.code = travelSheetCode;
		remFilter.fuelTypeRef.code = fuelTypeCode;

		int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1);

		if (remArr.length > 1){
			throw new EnergyproSystemException("Помилка у залишку ПММ для Подорожнього листа ... "); //("Залишок ПММ для Подорожнього листа не знайдено ...");
		}


		 ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[0]);

		 if ( checkMode == 0) //точное совпадение
		 {
			 if ( rem.countGenOut.doubleValue() != count_.doubleValue() ){
				 if (isException){
					 throw new EnergyproSystemException("Кількість у залишках не спивпадає з кількістю у подорожньому листі");
				 }
				 out = true;
			 }
		 }
		 else
		 if ( checkMode == 1) // не больше
		 {
			 if ( rem.countGenOut.doubleValue() > count_.doubleValue() ){
				 if (isException){
					 throw new EnergyproSystemException("Кількість у залишках більша за кількістю у подорожньому листі");
				 }
				 out = true;
			 }
		 }
		 else
			 throw new EnergyproSystemException("error in checkMode , value = " + checkMode);



		return out;
	}


	public void deleteTravelSheetRemainder(int travelSheetCode) throws PersistenceException
	{
		ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
		remFilter.travelSheetRef.code = travelSheetCode;
		//remFilter.fuelTypeRef.code = fuelTypeCode;
		ENTravelSheetFuelRemainsShortList remList = remDAO.getScrollableFilteredList(remFilter, 0, -1);
		for (int i=0; i < remList.totalCount; i++){

			if (remList.get(i).countGenIn.doubleValue() != 0){
				throw new EnergyproSystemException("Спочатку видаліть Отримання ПММ ..." + remList.get(i).fuelTypeRefName);
			}

			if (remList.get(i).countGenOut.doubleValue() != 0){
				throw new EnergyproSystemException("Спочатку видаліть Списання ПММ ..." + remList.get(i).fuelTypeRefName);
			}

			remDAO.remove(remList.get(i).code);
		}
	}

	public void deleteTransportRealRemainder(int transportRealCode) throws PersistenceException
	{
		ENTransportRealFuelRemainsDAO remDAO = new ENTransportRealFuelRemainsDAO(connection, userProfile);
		ENTransportRealFuelRemainsFilter remFilter = new ENTransportRealFuelRemainsFilter();
		remFilter.realTransport.code = transportRealCode;
		//remFilter.fuelTypeRef.code = fuelTypeCode;
		ENTransportRealFuelRemainsShortList remList = remDAO.getScrollableFilteredList(remFilter, 0, -1);
		for (int i=0; i < remList.totalCount; i++){

			if (remList.get(i).countGenIn.doubleValue() != 0){
				throw new EnergyproSystemException("Спочатку видаліть Отримання ПММ ...");
			}

			if (remList.get(i).countGenOut.doubleValue() != 0){
				throw new EnergyproSystemException("Спочатку видаліть Списання ПММ ...");
			}

			remDAO.remove(remList.get(i).code);
		}
	}



	public Date getFirstDate(Date dateIn)
	{
	      Calendar calendar = Calendar.getInstance();
	      calendar.setTime(dateIn);
	      calendar.set(Calendar.HOUR_OF_DAY, 0);
	      calendar.set(Calendar.MINUTE, 0);
	      calendar.set(Calendar.SECOND, 0);
	      calendar.set(Calendar.MILLISECOND, 0);
	      //calendar.set(Calendar.MONTH, dateIn.getMonth());
	      //calendar.set(Calendar.YEAR, dateIn.getYear());
	      calendar.set(Calendar.DATE, 1);
	      return calendar.getTime();
	}

	public Date getLastDate(Date dateIn)
	{
	      Calendar calendar = Calendar.getInstance();
	      calendar.setTime(dateIn);
	      calendar.set(Calendar.HOUR_OF_DAY, 0);
	      calendar.set(Calendar.MINUTE, 0);
	      calendar.set(Calendar.SECOND, 0);
	      calendar.set(Calendar.MILLISECOND, 0);
	      //calendar.set(Calendar.MONTH, dateIn.getMonth());
	      //calendar.set(Calendar.YEAR, dateIn.getYear());
	      calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
	      return calendar.getTime();
	}




	public void removeGSMEstimateItems(int travelSheetCode) throws PersistenceException
	{
		ENTransportItemFilter tFilter = new ENTransportItemFilter();
		tFilter.conditionSQL = " code in "+
				"(select t2e.transportrefcode from entransport2enestimate t2e, entravlshttm2trnsprttm ti2t, entravelsheetitem ti " +
				" where t2e.transportrefcode = ti2t.transportitemrefcode and ti2t.travelsheetitemrefcode = ti.code " +
				" and ti.travelsheetrefcode = " + travelSheetCode +
				" and ti.kindrefcode = " + ENTravelSheetItemKind.FACT + ") ";

		ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
		TransportLogic tLogic = new TransportLogic(connection, userProfile);

		int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
		//int materialCode = Integer.MIN_VALUE;
		for (int i=0; i < tArr.length; i++){
			tLogic.removeGSMByTransportItemCode(tArr[i]);
		}

		//updateRemainderCountOutByTravelSheetCode(travelSheetCode);

		ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		//ENTransportRealFuelRemainsDAO trRemDAO = new ENTransportRealFuelRemainsDAO(connection, userProfile);

		ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
		remFilter.travelSheetRef.code = travelSheetCode;
		int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1);
		//int trCode = Integer.MIN_VALUE;
		//Date trDate = new Date(0); // типа сходу на левую дату ...
		//BigDecimal outCount = new BigDecimal(0);
		for (int i=0; i < remArr.length; i++){

			ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
			//outCount = rem.countGenOut;
			rem.countGenOut = rem.sumGenOut = rem.priceGenOut = new BigDecimal(0);
			rem.countGenFinal = rem.countGenStart.add(rem.countGenIn).setScale(2, BigDecimal.ROUND_HALF_UP);
			remDAO.save(rem);

			/*
			trCode = rem.realTransport.code;
			trDate = rem.dateGen;

			ENTransportRealFuelRemainsFilter trRemFilter = new ENTransportRealFuelRemainsFilter();
			trRemFilter.realTransport.code = trCode;
			trRemFilter.fuelTypeRef.code = rem.fuelTypeRef.code;
			trRemFilter.dateStart = getFirstDate(trDate);
			trRemFilter.dateFinal = getLastDate(trDate);
			int[] trRemArr = trRemDAO.getFilteredCodeArray(trRemFilter, 0, -1);
			for (int j=0; j < trRemArr.length; j++){
				ENTransportRealFuelRemains trRem = trRemDAO.getObject(trRemArr[j]);
				trRem.countGenOut = trRem.countGenOut.subtract(outCount).setScale(2, BigDecimal.ROUND_HALF_UP);
				trRem.sumGenOut = trRem.priceGenOut = new BigDecimal(0);
				trRem.countGenFinal = trRem.countGenStart.add(trRem.countGenIn).setScale(2, BigDecimal.ROUND_HALF_UP)
										.subtract(outCount).setScale(2, BigDecimal.ROUND_HALF_UP);
				trRem.sumGenFinal = trRem.priceGenFinal = new BigDecimal(0);
				trRemDAO.save(trRem);
			}
			*/
		}

		//if (trCode == Integer.MIN_VALUE){
		//	throw new EnergyproSystemException("Залишок не знайдено для ПЛ ...");
		//}



	}

	public void updateRemainderCountIn(int travelSheetCode, int fuelTypeCode, int travelSheetFuelTypeCode, boolean isThirdParty) throws PersistenceException
	{

		TravelSheetLogic logic = new TravelSheetLogic(connection, userProfile);

		ENTravelSheet tr = new ENTravelSheetDAO(connection, userProfile).getObject(travelSheetCode);
		ENTravelSheet prevTr = logic.getPrevSheet(tr);
		boolean isPrevClosed = false;

		if (prevTr == null)
		{
			//throw new EnergyproSystemException("Не знайдено залишків ....");
			isPrevClosed = true;
		}
		else
		{
		if ((prevTr.statusRef.code == ENTravelSheetStatus.CLOSED) || (prevTr.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM))
			isPrevClosed = true;
		else
			isPrevClosed = false;
		}

		if ( ! isPrevClosed ) return;

		ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);

		ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
		remFilter.travelSheetRef.code = travelSheetCode;
		remFilter.fuelTypeRef.code = fuelTypeCode;
		remFilter.travelSheetFuelTypeRef.code = travelSheetFuelTypeCode;
		remFilter.conditionSQL = String.format("coalesce(%s, false) = ?", ENTravelSheetFuelRemains.isThirdParty_QFielld);

		int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1, new Vector<>(Arrays.asList(isThirdParty)));

		if (remArr.length > 1){
			throw new EnergyproSystemException("Помилка у залишку ПММ для Подорожнього листа ... "); //("Залишок ПММ для Подорожнього листа не знайдено ...");
		}

		ENTravelSheetFuel fuel = getFuelInTravelSheet(travelSheetCode, fuelTypeCode, travelSheetFuelTypeCode, isThirdParty);
		ENTravelSheetFuelRemains rem = new ENTravelSheetFuelRemains();

		if (remArr.length == 0){
			// создаем остатки ...
			//throw new EnergyproSystemException("Залишок не знайдено для ПЛ № " + tr.numberGen);
			/* по хорошему надо бы брать из предыдущего остатки ...*/
			if (prevTr != null)
				rem = getFuelRemainsByTravelSheet(prevTr.code, fuelTypeCode, travelSheetFuelTypeCode, isThirdParty);
			else
				rem = null;

			if (rem == null){
				rem = new ENTravelSheetFuelRemains();
				rem.dateGen = tr.dateStart;
				rem.travelSheetRef.code = tr.code;
				rem.realTransport.code = tr.transportReal.code;

				rem.countGenStart = rem.priceGenStart = rem.sumGenStart = new BigDecimal(0);
				rem.countGenOut = rem.priceGenOut = rem.sumGenOut = new BigDecimal(0);

				rem.countGenIn = rem.countGenFinal = fuel.countGen;
				rem.sumGenIn = rem.sumGenFinal = rem.priceGenIn = rem.priceGenFinal = new BigDecimal(0);

				rem.fuelTypeRef.code = fuel.fuelType.code;

				rem.travelSheetFuelTypeRef.code = fuel.travelSheetFuelTypeRef.code;
				rem.isThirdParty = isThirdParty;

				remDAO.add(rem);
			}

			/*
			rem = new ENTravelSheetFuelRemains();
			rem.dateGen = ts.dateStart;
			rem.travelSheetRef.code = ts.code;
			rem.realTransport.code = ts.transportReal.code;
			rem.countGenStart = rem.countGenOut = rem.sumGenStart = rem.sumGenOut = rem.priceGenStart = rem.priceGenOut = new BigDecimal(0);

			rem.countGenIn = rem.countGenFinal = fuel.countGen;
			rem.sumGenIn = rem.sumGenFinal = rem.priceGenIn = rem.priceGenFinal = new BigDecimal(0);

			rem.fuelTypeRef.code = fuel.fuelType.code;
			remDAO.add(rem);
			*/
		}
		else
		if (remArr.length == 1){
			// пересчитаем остатки ...

			rem = remDAO.getObject(remArr[0]);

			// по идее могут вынести выдачу , которая сгенерила строку .. потом вынесли
			// в итого строка остатков с 0 ... наверно пусть будет ..

			rem.countGenIn = fuel.countGen;
			rem.countGenFinal = rem.countGenStart.add(rem.countGenIn).setScale(2,BigDecimal.ROUND_HALF_UP).subtract(rem.countGenOut).setScale(2, BigDecimal.ROUND_HALF_UP);

			remDAO.save(rem);
		}
		else{
			throw new EnergyproSystemException("......");
		}

/*
		// общие остатки на машину ...
		ENTransportRealFuelRemainsFilter trRemFilter = new ENTransportRealFuelRemainsFilter();
		trRemFilter.realTransport.code = rem.realTransport.code;
		trRemFilter.fuelTypeRef.code = rem.fuelTypeRef.code;
		trRemFilter.dateStart = getFirstDate(rem.dateGen);
		trRemFilter.dateFinal = getLastDate(rem.dateGen);
		int[] trRemArr = trRemDAO.getFilteredCodeArray(trRemFilter, 0, -1);
		if (trRemArr.length > 1){
			throw new EnergyproSystemException("Помилка у залишку ПММ для Автомобіля ...");
		}

		if (trRemArr.length == 0){
			// содадим остаток
			// AS 03/02/2011 - + перекинуть остаток из предыдущего
			//.. по идее это остаток на путевом листе на начало ...
			ENTransportRealFuelRemains trRem = new ENTransportRealFuelRemains();
			trRem.dateStart = getFirstDate( ts.dateStart );
			trRem.dateFinal = getLastDate( ts.dateStart ) ;

			trRem.realTransport.code = ts.transportReal.code;
			// остатки на начало МЕСЯЦА совпадают с отстаками по ПЛ
			trRem.countGenStart = rem.countGenStart;
			trRem.sumGenStart = rem.sumGenStart;
			trRem.priceGenStart = rem.priceGenStart;

			// списание совпадает со списанием на ПЛ
			trRem.countGenOut = rem.countGenOut;
			trRem.sumGenOut =  rem.sumGenOut;
			trRem.priceGenOut = rem.priceGenOut; //new BigDecimal(0);

			// выдача совпадает с выдачей на ПЛ
			trRem.countGenIn = fuel.countGen;
			trRem.countGenFinal = fuel.countGen;

			trRem.sumGenIn = trRem.sumGenFinal = trRem.priceGenIn = trRem.priceGenFinal = new BigDecimal(0);

			trRem.fuelTypeRef.code = fuel.fuelType.code;
			trRemDAO.add(trRem);

		}
		else
    	if (trRemArr.length == 1){
			// обновим ...
    		ENTransportRealFuelRemains trRem = trRemDAO.getObject(trRemArr[0]);
    		trRem.countGenFinal = rem.countGenFinal;
    		trRem.countGenIn = trRem.countGenFinal.add(trRem.countGenOut).setScale(2, BigDecimal.ROUND_HALF_UP).subtract(trRem.countGenStart).setScale(2, BigDecimal.ROUND_HALF_UP);
    		trRemDAO.save(trRem);
    	}
    	else{
    		throw new EnergyproSystemException("....");
    	}
		*/

		//ENTravelSheetFuelRemains rem = remDAO.getObject()
	}


	public void updateNextRemainder(ENTravelSheet tr, ENTravelSheet nextTravelSheet) throws PersistenceException
	{

		ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);

		if (nextTravelSheet == null) return;


		//TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(connection, userProfile);

		ENTravelSheetFuelRemainsFilter remFilter1 = new ENTravelSheetFuelRemainsFilter();
		remFilter1.travelSheetRef.code = nextTravelSheet.code;
		//int[] nArr = remDAO.getFilteredCodeArray(remFilter1, 0, -1);
		ENTravelSheetFuelRemainsShortList nextRemList = remDAO.getScrollableFilteredList(remFilter1, 0, -1);
		// а вдруг не сходяться !! БАГ ... надо проверять и ПЕРЕСЧИТЫВАТЬ
		//if (nArr.length == 0 ) return;
		for(ENTravelSheetFuelRemainsShort nextRem : nextRemList.list) {
			ENTravelSheetFuelRemains prevRem = getFuelRemainsByTravelSheet(tr.code, nextRem.fuelTypeRefCode, nextRem.travelSheetFuelTypeRefCode, nextRem.checkIsThirdParty());
			if (prevRem == null) {
				// на текущем остаток на нач ДОЛЖЕН быть 0 !!!
				if (nextRem.countGenStart.doubleValue() != 0){
					// а остатки НА АВТО!!! ???? типа первоначальный!!! остаток
					ENTransportRealFuelRemainsDAO trrDAO = new ENTransportRealFuelRemainsDAO(connection, userProfile);
					ENTransportRealFuelRemainsFilter trrFilter = new ENTransportRealFuelRemainsFilter();
					trrFilter.realTransport.code = tr.transportReal.code;
					trrFilter.fuelTypeRef.code = nextRem.fuelTypeRefCode;
					trrFilter.travelSheetFuelTypeRef.code = nextRem.travelSheetFuelTypeRefCode;
					trrFilter.conditionSQL = ENTransportRealFuelRemains.dateStart_QFielld +
						" = (select min(qq.datestart) from entransportrealfulrmns qq where qq.realtransportcode = "+ tr.transportReal.code +")";
					ENTransportRealFuelRemainsShortList trrList = trrDAO.getScrollableFilteredList(trrFilter, 0, -1);
					boolean isErr = false;
					if (trrList.totalCount == 0) isErr = true;
					if (trrList.totalCount > 1) throw new EnergyproSystemException("Помилка у кількості залишків для Реального транспорту (" + trrList.totalCount + ")");
					if (trrList.get(0).countGenStart.compareTo(nextRem.countGenStart) != 0) isErr = true;
					if ( isErr )
						throw new EnergyproSystemException("Не співпадає залишок на початок у ПЛ № " + nextTravelSheet.numberGen + " й кінець у ПЛ № " + tr.numberGen + "(выдсутны данні з попереднього залишку)");
				}
			}
			if ((nextTravelSheet.statusRef.code != ENTravelSheetStatus.PLAN
					&& nextTravelSheet.statusRef.code != ENTravelSheetStatus.GOOD)
				&& prevRem.countGenFinal.compareTo(nextRem.countGenStart) != 0) {
				throw new EnergyproSystemException(
						"Не співпадає залишок на початок у ПЛ № "
								+ nextTravelSheet.numberGen + " ("
								+ nextRem.countGenStart + " л.)"
								+ " й кінець у ПЛ № " + tr.numberGen + " (" + prevRem.countGenFinal + "л.)");
			}
		}


		//if (nextRemList.totalCount == 0) return ;

		ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
		remFilter.travelSheetRef.code = tr.code;
		int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1);
		for (int i=0; i < remArr.length; i++) {
			ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
			ENTravelSheetFuelRemains remNext = new ENTravelSheetFuelRemains();

			ENTravelSheetFuelRemains remains = getFuelRemainsByTravelSheet(nextTravelSheet.code, rem.fuelTypeRef.code, rem.travelSheetFuelTypeRef.code, rem.checkIsThirdParty());
			if(remains != null) {
				remDAO.remove(remains.code);
			}

			remNext.travelSheetRef.code = nextTravelSheet.code;
			remNext.dateGen = nextTravelSheet.dateStart;
			remNext.fuelTypeRef.code = rem.fuelTypeRef.code;
			remNext.realTransport.code = nextTravelSheet.transportReal.code;
			remNext.travelSheetFuelTypeRef.code = rem.travelSheetFuelTypeRef.code;

			remNext.countGenStart = remNext.countGenFinal = rem.countGenFinal;
			remNext.priceGenStart = remNext.priceGenFinal = rem.priceGenFinal;
			remNext.sumGenStart = remNext.sumGenFinal = rem.sumGenFinal;

			remNext.countGenIn = remNext.countGenOut = new BigDecimal(0);
			remNext.sumGenIn = remNext.sumGenOut = new BigDecimal(0);
			remNext.priceGenIn = remNext.priceGenOut = new BigDecimal(0);
			remNext.isThirdParty = rem.isThirdParty;

			remDAO.add(remNext);
			updateRemainderCountIn(nextTravelSheet.code, remNext.fuelTypeRef.code, remNext.travelSheetFuelTypeRef.code, remNext.checkIsThirdParty());
		}
		updateRemainderOUT(nextTravelSheet.code);
	}


	// !!! такое же в validateWritingOff4unClose
	// них себе ВАЛИДЕЙТ .. ОН выносит данные от старых расчетов ....
	public boolean validateWritingOff4Close(int travelSheetCode) throws PersistenceException
	{
		//boolean out = true;
		ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
		FINMaterialsDAO fmDAO = new FINMaterialsDAO(connection, userProfile);

		ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection, userProfile);

		ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
		eFilter.kindRef.code = ENEstimateItemKind.GSM;
		eFilter.conditionSQL = " code in "+
				"(select t2e.estimaterefcode from entransport2enestimate t2e, entravlshttm2trnsprttm ti2t, entravelsheetitem ti " +
				" where t2e.transportrefcode = ti2t.transportitemrefcode and ti2t.travelsheetitemrefcode = ti.code " +
				" and ti.travelsheetrefcode = " + travelSheetCode +
				" and ti.kindrefcode = " + ENTravelSheetItemKind.FACT + ") ";

		int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);


		for (int i=0; i < eArr.length; i++){
			ENEstimateItem estimateItem = eDAO.getObject(eArr[i]);
			// еще есть с работой на борту ... главнее ТО что в ПУТЕВОМ !!!
			// с работ еще болтаеться то что считалось из плановых ФАКТОВ ... а мы не выносили ;( ...
			// в удалении проверит финматериалы ...
			if (
					( estimateItem.countFact.doubleValue() > 0.001 )
					&& (estimateItem.planItemRef.code == Integer.MIN_VALUE) // без работ - из ПЛ
			)
			{
				FINMaterialsFilter fmFilter = new FINMaterialsFilter();
				fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
				fmFilter.estimateItemRef.code = eArr[i];
				//int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, 1);
				//if (fmArr.length == 0) return false;
				FINMaterialsShortList fmList = fmDAO.getScrollableFilteredList(fmFilter, 0, -1);
				if (fmList.totalCount == 0) return false;
				BigDecimal fmCount = new BigDecimal(0);
				for (int nn=0; nn < fmList.totalCount; nn++){
					fmCount = fmCount.add(fmList.get(nn).quantity);
				}
				fmCount = fmCount.setScale(2, BigDecimal.ROUND_HALF_UP);
				if (fmCount.doubleValue() != estimateItem.countFact.doubleValue()) return false;
			}
			else{
				ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
				t2eFilter.estimateRef.code = estimateItem.code;
				int[] t2eArr = t2eDAO.getFilteredCodeArray(t2eFilter, null, null, 0, -1, null);
				for (int qq = 0; qq < t2eArr.length; qq++ ){
					t2eDAO.remove(t2eArr[qq]);
				}
				eDAO.remove(estimateItem.code);
			}
		}
		return true;
	}


	  public BigDecimal generateGSMEstimateByTravelSheet(int travelSheetCode) throws PersistenceException
	  {
			BigDecimal out = new BigDecimal(0);

		  	ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
			f.travelSheetRef.code = travelSheetCode;
			f.kindRef.code = ENTravelSheetItemKind.FACT;
			ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
			int[] arr = dao.getFilteredCodeArray(f, 0, -1);
			for (int i=0; i < arr.length; i++){
				out = out.add(this.generateGSMEstimateByTravelSheetItem(arr[i])).setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			// обновить остатки ... !!! по всему сразу бы !!!
			// тормоза - передавать бы код ПЛАНА !!!
			// !!! обновляеться в generateGSMEstimateByTravelSheetItem
			//updateRemainderCountOutByTravelSheetCode(travelSheetCode, materialCode);

			return out;
	  }

	  /**
	   *
	   * Кол-во неразнесенных транспортных маршрутов
	   *
	   * @param planCode код плана
	   * @return Кол-во неразнесенных транспортных маршрутов
	   * @throws PersistenceException
	   */
	  private int getCountOfUnhandledTransportRoutes(int planCode) throws PersistenceException
	  {
		  ENTransportRouteDAO routeDao = new ENTransportRouteDAO(connection, userProfile);
		  ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
		  routeFilter.planRef.code = planCode;
		  routeFilter.conditionSQL = ENTransportRoute.speedometerFinal_QFielld + " is null";
		  int[] routeCodes = routeDao.getFilteredCodeArray(routeFilter, 0, -1);
		  return routeCodes.length;

	  }

	  public BigDecimal generateGSMEstimateByTravelSheetItem(int travelSheetItemCode) throws PersistenceException {
		  try {
			  BigDecimal out = new BigDecimal(0);
			  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
			  ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
			  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);
			  GlobusLogic globusLogic = new GlobusLogic(getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE), userProfile);
			  TransportLogic trLogic = new TransportLogic(connection, userProfile);
			  
			  ENTravelSheetItemDAO trItemDAO = new ENTravelSheetItemDAO(connection, userProfile);
			  ENTravelSheetDAO trDAO = new ENTravelSheetDAO(connection, userProfile);

			  ENTravelSheetItem trItem = trItemDAO.getObject(travelSheetItemCode);

			  ENTravelSheet tr = trDAO.getObject(trItem.travelSheetRef.code);
			  boolean isGPS = trLogic.isGPS(tr.transportReal.code, tr.dateFinal);

			  TKTransportRealHistory trh = trLogic.getHistory(tr.transportReal.code, tr.dateFinal);

			  // так считаем ТОЛЬКО для фактов ... гдето бы раньше дергать !!!
			  if ( tr.statusRef.code != ENTravelSheetStatus.FACT ) return out;

			  TransportLogic tLogic = new TransportLogic(connection, userProfile);

			  // NET-4013 Корректировка коэффициента расчета топлива в зависимости от введенной температуры
			  BigDecimal temperatureKoef = tLogic.getTemperatureCoeff(tr.transportReal.transportdepartmentRef.code, Tools.clearTimeOfDate(trItem.timeFinal));

			  ENTransportItemFilter tFilter = new ENTransportItemFilter();
			  tFilter.planRef.code = trItem.planRef.code;
			  tFilter.transportReal.code = tr.transportReal.code;
			  tFilter.conditionSQL = " code in (select qq.transportitemrefcode from entravlshttm2trnsprttm qq, entransportitem tr, enplanworkitem pi " +
			  " where qq.transportitemrefcode = tr.code and tr.planitemrefcode = pi.code " +
			  " and pi.countgen <> 0 and qq.travelsheetitemrefcode = " + travelSheetItemCode +" )";

			  //int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
			  ENTransportItemShortList tList = tDAO.getScrollableFilteredList(tFilter, 0, -1);

			  if (trItem.speedometerStart == null){
				  throw new EnergyproSystemException("Немає початкових показників спідометра на маршруті ... " + trItem.travelTo);
			  }

			  if (trItem.speedometerFinal == null){
				  throw new EnergyproSystemException("Немає кінцевих показників спідометра на маршруті ... " + trItem.travelTo);
			  }

			  if (tr.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER){
				  if (trItem.fuelCounterStart == null){
					  throw new EnergyproSystemException("Немає початкових показників лічільника палива на маршруті ... " + trItem.travelTo);
				  }

				  if (trItem.fuelCounterFinal == null){
					  throw new EnergyproSystemException("Немає кінцевих показників лічільника палива на маршруті ... " + trItem.travelTo);
				  }
			  }

			  // Объект истории автотранспорта
			  TKTransportRealHistory historyObj = trLogic.getHistory(tr.transportReal.code, trItem.timeFinal);


			  BigDecimal val = new BigDecimal(0);
			  BigDecimal byTime = new BigDecimal(0);
			  BigDecimal byTime2 = new BigDecimal(0);

			  BigDecimal byDistance = new BigDecimal(0);
			  BigDecimal heatingTimeRashod = new BigDecimal(0);
			  int tCode = Integer.MIN_VALUE;

			  if (historyObj.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER){
				  //расчет по счетчику топлива ...
				  val = trItem.fuelCounterFinal.subtract(trItem.fuelCounterStart).setScale(1, BigDecimal.ROUND_HALF_UP);
			  } else if (historyObj.fuelCalcTypeRef.code == TKFuelCalcType.BY_FUEL_LEVEL_SENSOR) {
				  if(!isGPS) {
					throw new EnergyproSystemException(
							"Неможливо примінити розрахунковий метод для датчика палива, якщо у автотранспорту інв. № "
									+ tr.transportReal.invNumber + " не встановлений GPS-регістратор на дату "
									+ new SimpleDateFormat("dd.MM.yyyy").format(trItem.timeFinal));
				  }

				  BigDecimal rashodProbeg = getNormRashodByGlobus(tr, false);
				  BigDecimal rashodWork = getNormRashodByGlobus(tr, true);

				  byDistance = trItem.speedometerFinal.subtract(trItem.speedometerStart).setScale(3, BigDecimal.ROUND_HALF_UP);
				  
				  for (int z=0; z < tList.totalCount; z++) {
					  if ( tList.get(z).distance.doubleValue() > 0 ){
						  tCode = tList.get(z).code;
					  }
					  if (tList.get(z).tktransportTypeCode != TKTransportType.BRIGADE) {
						  byTime = byTime.add(tList.get(z).countWorkFact).setScale(2, BigDecimal.ROUND_HALF_UP);
					  }
				  }

				  BigDecimal byTimeGlobusOveral = globusLogic.getMachineHoursStop(historyObj.reg_id, tr.timeStart, tr.timeFinal);

				  if (byTime.compareTo(byTimeGlobusOveral) == 1) {
					  byTime = byTimeGlobusOveral;
				  }

				  if (tr.typeRef.code == ENTravelSheetType.TRAKTOR) {
					  byTime2 = globusLogic.getMachineHoursMove(historyObj.reg_id, trItem.timeStart, trItem.timeFinal);
				  }

				  byDistance = byDistance.multiply(rashodProbeg).divide(new BigDecimal(100),1, BigDecimal.ROUND_HALF_UP);
				  byTime = byTime.multiply(rashodWork).setScale(1, BigDecimal.ROUND_HALF_UP);
				  byTime2 = byTime2.multiply(rashodProbeg).setScale(1, BigDecimal.ROUND_HALF_UP);

				  val = byTime.add(byDistance).add(heatingTimeRashod).setScale(2, BigDecimal.ROUND_HALF_UP).add(byTime2).setScale(2, BigDecimal.ROUND_HALF_UP);

				  BigDecimal normativeFuelConsuming = getConsumedFuelByNormativeCalculation(tr, trItem, tList).totalValue;

				  int routeCount = getCountOfUnhandledTransportRoutes(trItem.planRef.code);

				  // Если кол-во неразнесенных маршрутов для грузоперевозок больше 0, то
				  // не проверяется разница с нормативным расчетом, т.к. необходимо сначала разнести маршруты
				  if(routeCount == 0) {
					  BigDecimal difference = normativeFuelConsuming.subtract(val).abs();
					  if(difference.compareTo(new BigDecimal(0)) > 0) {
						  BigDecimal percentage = new BigDecimal(0);
						  if(normativeFuelConsuming.compareTo(new BigDecimal(0)) > 0) {
							  percentage = difference.divide(normativeFuelConsuming, 2, BigDecimal.ROUND_HALF_UP);
						  } else {
							  percentage = difference.divide(val, 2, BigDecimal.ROUND_HALF_UP);
						  }

						 System.out.print("difference = " + difference);
						 System.out.print("normativeFuelConsuming = " + normativeFuelConsuming);
						 System.out.print("percentage = " + percentage);

//						  if(percentage.compareTo(new BigDecimal(0.5)) > 0) {
//							  throw new EnergyproSystemException("Витрати за датчиком палива відрізняються більше ніж на 50% від витрат за нормативним розрахунком");
//						  }
					  }
				  }

			  }else {
				  // расчет понормам ...
				  FuelConsumingCalculationResults fuelConsumingCalculationResults = getConsumedFuelByNormativeCalculation(tr, trItem, tList);
				  tCode = fuelConsumingCalculationResults.transportItemCode;
				  byDistance = fuelConsumingCalculationResults.byDistance;
				  val = fuelConsumingCalculationResults.totalValue;
				  byTime = fuelConsumingCalculationResults.byTime;
				  byTime2 = fuelConsumingCalculationResults.byTime2;
				  temperatureKoef = fuelConsumingCalculationResults.temperatureKoef;
				  heatingTimeRashod = fuelConsumingCalculationResults.heatingTimeConsumption;
			  } // типа расчет по нормам ...

			  out = out.add(val).setScale(1, BigDecimal.ROUND_HALF_UP);

			  // а обнулить пред. расход???
			  //if (val.doubleValue() <= 0.009) return;

			  if (tCode == Integer.MIN_VALUE)
			  {
				if ((tList.totalCount == 0) && (val.doubleValue() > 0.009))
				{
					throw new EnergyproSystemException("Транспорт не знайдено для прив_язки ПММ ..");
				}
				else
				{
					tCode = tList.get(0).code;
				}
			  }

			  // вынесем расчитанный ранее ГСМ ...
			  for(ENTransportItemShort transportItem : tList.list) {
				  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
				  t2Filter.transportRef.code = transportItem.code;
				  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);
				  for (ENTransport2ENEstimateShort t2e : t2eList.list) {
					  t2DAO.remove(t2e.code);
					  eDAO.remove(t2e.estimateRefCode);
				  }
			  }
			  
			  val = this.subtractThirdPartyFuel(travelSheetItemCode, val);

			  //////////////////////////////////////////////////////
			  if (val.doubleValue() > 0.009){
					Collection<ENTravelSheetFuel> fArr = getFuelMaterialByTravelSheet(tr, val, /*SUPP-3605*/ENTravelSheetFuelType.MAIN, false);
					for(ENTravelSheetFuel fuel : fArr) {
						int eCode = Integer.MIN_VALUE;
						ENEstimateItem ee = new ENEstimateItem();
						ee.kindRef.code = ENEstimateItemKind.GSM;
						ee.planRef.code = trItem.planRef.code;
						// пока БЕЗ РАБОТ ... ee.planItemRef.code = t.planItemRef.code;
						ee.countGen = fuel.countGen; //val; //new BigDecimal(0);
						ee.materialRef.code = tLogic.getMaterialByFuelType(fuel.fuelType.code) ;
						ee.typeRef.code = ENEstimateItemType.AUTO;
						ee.countFact = fuel.countGen;
						ee.cost = new BigDecimal(0);
						ee.userGen = userProfile.userName;
						ee.dateEdit = new Date();
						if (tr.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER){
							ee.commentGen = "ПЛ № "+ tr.numberGen +", " + tr.transportReal.name + ", гос.ном: " + tr.transportReal.gosNumber + ", витрати по лічільнику палива : " + val;
						} else {
							String s = "";
							if (byTime2.doubleValue() != 0 ) s = ", (з відстані): " + byTime2 + " л";
							if (heatingTimeRashod.doubleValue() > 0) s = s + ", (з прогріву машини): " + heatingTimeRashod + " л";
							ee.commentGen = "ПЛ № "+ tr.numberGen +", " + tr.transportReal.name + ", гос.ном: " + tr.transportReal.gosNumber + ", витрати : (з маш/г): " + byTime.toString() + " л "+ s +", (з пробігу): " + byDistance + " л, коєф.=" + temperatureKoef;
						}
						ee.statusRef.code = ENEstimateItemStatus.PRESENT;

						eCode = eDAO.add(ee);
						
						ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						t2.transportRef.code = tCode;
						t2.estimateRef.code = eCode;
						t2DAO.add(t2);
					}
			  }

			  /*SUPP-3605 Для автотранспорта с пусковым двигателем дополнительно насчитывается 3% от рассчитанного кол-ва потребленного топлива*/
			  if(val.doubleValue() > 0.009 && trh.hasStarter == TKTransportRealHasStarter.YES) {
				  BigDecimal starterVal = val.multiply(ENConsts.PERCENT_OF_FUEL_FOR_STARTER.divide(new BigDecimal(100))).setScale(1, BigDecimal.ROUND_HALF_UP);

				  Collection<ENTravelSheetFuel> fArr = getFuelMaterialByTravelSheet(tr, starterVal, ENTravelSheetFuelType.FOR_STARTER, false);
				  for (ENTravelSheetFuel f : fArr) { 
						int eCode = Integer.MIN_VALUE;
						ENEstimateItem ee = new ENEstimateItem();
						ee.kindRef.code = ENEstimateItemKind.GSM;
						ee.planRef.code = trItem.planRef.code;
						ee.countGen = f.countGen;
						ee.materialRef.code = tLogic.getMaterialByFuelType(f.fuelType.code) ;
						ee.typeRef.code = ENEstimateItemType.AUTO;
						ee.countFact = f.countGen;
						ee.cost = new BigDecimal(0);
						ee.userGen = userProfile.userName;
						ee.dateEdit = new Date();
						ee.commentGen = "Для пускового двигуна";
						ee.statusRef.code = ENEstimateItemStatus.PRESENT;

						eCode = eDAO.add(ee);

						ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						t2.transportRef.code = tCode;
						t2.estimateRef.code = eCode;
						t2DAO.add(t2);
					}
			  }

			  ///// NET-4440 Сохраняем историю ГСМ по плану
			  PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
			  planLogic.generatePlanFuelHistory(trItem.planRef.code);
			  /////

			return out;


		  }
		  catch(DatasourceConnectException e){throw new EnergyproSystemException(e.getMessage());}
	  }

	  /**
	   *
	   * Нормативный расчет топлива. Возвращает величины потраченного топлива, расчитанные по нормативам из справочника транспорта
	   *
	   * @param tr путевой лист
	   * @param trItem строка путевого листа
	   * @param tList связанные транспорт итемы с этой строкой путевого, если <b>null</b>, то вытянется внутри функции
	   * @return FuelConsumingCalculationResults информацию про потраченное топливо с расчитанными велечинами
	   * @throws PersistenceException
	   * @throws DatasourceConnectException
	   */
	  public FuelConsumingCalculationResults getConsumedFuelByNormativeCalculation(ENTravelSheet tr, ENTravelSheetItem trItem, ENTransportItemShortList tList) throws PersistenceException, DatasourceConnectException {
		  // расчет понормам ...
		  int tCode = Integer.MIN_VALUE;
		  BigDecimal heatingTimeRashod = new BigDecimal(0);
		  TransportLogic tLogic = new TransportLogic(connection, userProfile);
		  BigDecimal temperatureKoef = tLogic.getTemperatureCoeff(tr.transportReal.transportdepartmentRef.code, Tools.clearTimeOfDate(trItem.timeFinal));

		  BigDecimal byTime = new BigDecimal(0);
		  BigDecimal byTime2 = new BigDecimal(0);
		  BigDecimal byDistance = new BigDecimal(0);
		  BigDecimal out = new BigDecimal(0);

		  TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(connection, userProfile);
		  //	Коэффициент для расчета топлива по транспорту
		  BigDecimal transportKoef = transportRealDAO.getAggregateSumKoefs(tr.transportReal.code);

		  ENTravelSheetItemDistanceDAO tsidDAO = new ENTravelSheetItemDistanceDAO(connection, userProfile);
		  PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		  TransportRouteLogic routeLogic = new TransportRouteLogic(connection, userProfile);
		  GlobusLogic globusLogic = new GlobusLogic(getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE), userProfile);
		  ENTravelSheetItemDistanceDAO trItemDistanceDAO = new ENTravelSheetItemDistanceDAO(connection, userProfile);
		  TransportLogic trLogic = new TransportLogic(connection, userProfile);
		  
		  if(tList == null) {
			  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
			  ENTransportItemFilter tFilter = new ENTransportItemFilter();
			  tFilter.planRef.code = trItem.planRef.code;
			  tFilter.transportReal.code = tr.transportReal.code;
			  tFilter.conditionSQL = " code in (select qq.transportitemrefcode from entravlshttm2trnsprttm qq, entransportitem tr, enplanworkitem pi " +
			  " where qq.transportitemrefcode = tr.code and tr.planitemrefcode = pi.code " +
			  " and pi.countgen <> 0 and qq.travelsheetitemrefcode = " + trItem.code +" )";

			  tList = tDAO.getScrollableFilteredList(tFilter, 0, -1);

		  }



		  // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
		  // тянем дату гдето раньше !!! тормоза ...
		  ENPlanWork plan = planLogic.getPlanByCode(trItem.planRef.code);

		  TKTransportRealHistory historyObj = trLogic.getHistory(tr.transportReal.code, plan.dateFinal);

		  // чтобы не расчитывали ГСМ в Плане, который закрыт БЕЗ Акта (без материалов)
		  if ((plan.kind.code == ENPlanWorkKind.FACT) && (plan.status.code == ENPlanWorkStatus.LOCKED)){
			  throw new EnergyproSystemException("Завдання-Факт вже затверджено ...");
		  }

		  boolean isGPS = trLogic.isGPS(tr.transportReal.code, tr.dateFinal);
		  // NET-3728 По приказу Главы Правления №632 от 22.11.2012 добавим для всех машин с GPS-трекером 2% сверху коэфициента расчета топлива
		  if (isGPS) {
			  transportKoef = transportKoef.add(new BigDecimal(0.02)).setScale(2, BigDecimal.ROUND_HALF_UP);
		  }

		  // Получение всех дистанций с коэффициентами для строки путевого листа
		  ENTravelSheetItemDistanceFilter tsidFilter = new ENTravelSheetItemDistanceFilter();
		  tsidFilter.travelSheetItemRef.code = trItem.code;
		  ENTravelSheetItemDistanceShortList tsidList = tsidDAO.getScrollableFilteredList(tsidFilter, 0, -1);

		  BigDecimal winterCoeff = tLogic.calcWinterCoeff(plan.dateStart);

		  boolean isPresentRouteInPlan = false ;
		  isPresentRouteInPlan = routeLogic.isPresentRouteInPlan( tList.get(0).code);
		  if (isPresentRouteInPlan && tr.transportReal.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO){ // если класификация транспорта "грузовой автомобиль"
			  byDistance = routeLogic.calculateFuelDistanceByRouteForAVTO_CARGO(tr,trItem );
		  } else {
			  if (isPresentRouteInPlan && tr.transportReal.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN){ // если класификация транспорта "авто кран"
				  byDistance =  routeLogic.calculateFuelDistanceByRouteForAVTO_KRAN(tr,trItem );
			  } else {
				  // расчет по старому
				  byDistance = trItem.speedometerFinal.subtract(trItem.speedometerStart).setScale(3, BigDecimal.ROUND_HALF_UP);
				  byDistance = byDistance.divide(new BigDecimal(100), 3, BigDecimal.ROUND_HALF_UP);
				  if (byDistance.doubleValue() > 0){
					  if (tr.transportReal.rashodProbeg == null){
						  throw new EnergyproSystemException("Расход на расстояния не найден ...");
					  }

					  //SUPP-27932
					  /*if((byDistance.compareTo(new BigDecimal(0.005)) < 0)) {
						  throw new EnergyproSystemException("Неможливо поставити кілометраж меньше ніж 0.5 км " + byDistance);
					  }*/

					  // Вычитание дистанций указанных с коэффициентами расчета топлива
					  for(int i = 0; i < tsidList.totalCount; i++)
						  byDistance = byDistance.subtract(tsidList.get(i).distance.divide(new BigDecimal(100), 3, BigDecimal.ROUND_HALF_UP));


					  //	Скорректированный расход на пробег исходя из коэффициента
					  BigDecimal rashodProbegKoef = tr.transportReal.rashodProbeg.multiply(transportKoef.add(temperatureKoef)).setScale(2, BigDecimal.ROUND_HALF_UP);

					  byDistance = byDistance.multiply(rashodProbegKoef).setScale(1, BigDecimal.ROUND_HALF_UP);
					  byDistance = byDistance.multiply(winterCoeff).setScale(1, BigDecimal.ROUND_HALF_UP);

					  // Расчет топлива по коэффициентам из дистанций
					  BigDecimal[] fuelCountedByKoef = new BigDecimal[tsidList.totalCount];
					  for(int i=0; i < tsidList.totalCount; i++)
					  {
						  BigDecimal koef = tsidDAO.getAggregateSumOfKoefs(tsidList.get(i).code, transportKoef.add(temperatureKoef));
						  BigDecimal rashodWorkWithKoef = tr.transportReal.rashodProbeg.multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
						  fuelCountedByKoef[i] = tsidList.get(i).distance.divide(new BigDecimal(100), 3, BigDecimal.ROUND_HALF_UP);
						  fuelCountedByKoef[i] = fuelCountedByKoef[i].multiply(rashodWorkWithKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
						  byDistance = byDistance.add(fuelCountedByKoef[i]);
					  }
				  }
			  }
		  }


		  byTime2 = new BigDecimal(0) ;

		  for (int z=0; z < tList.totalCount; z++) {
			  if ( tList.get(z).distance.doubleValue() > 0 ){
				  tCode = tList.get(z).code;
			  }
			  if (tList.get(z).tktransportTypeCode != TKTransportType.BRIGADE) {
				  byTime = byTime.add(tList.get(z).countWorkFact).setScale(2, BigDecimal.ROUND_HALF_UP);
			  }

			  // для тракторов - расстояние из плана/факта
			  // если спидометр = 0- типа нету спидометра  ...
			  if (
				  (tr.typeRef.code == ENTravelSheetType.TRAKTOR )
				  && (tr.speedometerStart.doubleValue() == 0)
				  && ( tList.get(z).distance.doubleValue() > 0 )
				  && (!isGPS)
			  ) {
				  BigDecimal[] dist = tLogic.getDistancesByTransport(tList.get(z).code, true); //if ( isDeliveryTimes ) dFilter.conditionSQL = " endistance.typerefcode <> " + ENDistanceType.DISTANCE_OTHER;
				  // АС спецом не плюсовал ..  пусть береться с последнего .. вообщето запретить заводить несколько Тракторов и раастояний
				  // придеться плюсовать .. может быть несколько ОДНИХ И ТЕХ ЖЕ тракторов .. и растояние только на одном ...
				  if (dist != null)
					  byTime2 = byTime2.add(tLogic.calcTimeByDistaces(dist[0], dist[1], dist[2], planLogic.isWinterMonth(plan.dateStart), true )).setScale(1, BigDecimal.ROUND_HALF_UP); // типа НЕ ЗИМА
			  }

		  }

		  if (tr.typeRef.code == ENTravelSheetType.TRAKTOR && isGPS) {
			  /*NET-2962 Если у трактора есть GPS, то тогда время движения берется оттуда*/

			  byTime2 = globusLogic.getMachineHoursMove(historyObj.reg_id, trItem.timeStart, trItem.timeFinal);
		  }

		  if ((byTime.doubleValue() > 0)) {
			  if (tr.transportReal.rashodWork == null){
				  throw new EnergyproSystemException("Расход на машиночасы не найден ...");
			  }

			  // Вычитание машиночасов указанных в дистанциях с коэффициентами расчета топлива
			  for(int i = 0; i < tsidList.totalCount; i++) {
				  byTime = byTime.subtract(tsidList.get(i).sumMachineHours);
			  }

			  //	Скорректированный расход на работу исходя из коэффициента
			  BigDecimal rashodWorkKoef = tr.transportReal.rashodWork.multiply(transportKoef.add(temperatureKoef)).setScale(2, BigDecimal.ROUND_HALF_UP);

			  byTime = byTime.multiply(rashodWorkKoef).setScale(1, BigDecimal.ROUND_HALF_UP);

			  // Расчет топлива по коэффициентам из дистанций
			  BigDecimal[] fuelCountedByKoef = new BigDecimal[tsidList.totalCount];
			  for(int i=0; i < tsidList.totalCount; i++) {
				  BigDecimal koef = tsidDAO.getAggregateSumOfKoefs(tsidList.get(i).code, transportKoef.add(temperatureKoef));
				  BigDecimal rashodWorkWithKoef = tr.transportReal.rashodWork.multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
				  fuelCountedByKoef[i] = tsidList.get(i).sumMachineHours;
				  fuelCountedByKoef[i] = fuelCountedByKoef[i].multiply(rashodWorkWithKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
				  byTime = byTime.add(fuelCountedByKoef[i]);
			  }
		  }

		  if (byTime2.doubleValue() > 0) {
			  if (tr.transportReal.rashodProbeg == null){
				  throw new EnergyproSystemException("Расход на пробег не найден ...");
			  }

			  // Проверка -- совпадает ли дистанция общая для трактора с введенными с коэффициентами
			  BigDecimal sumDistancesWithKoefs = trItemDistanceDAO.getSumDistancesByTravelSheetItemCode(trItem.code).divide(new BigDecimal(100),3, BigDecimal.ROUND_HALF_UP);
			  if(byTime2.compareTo(sumDistancesWithKoefs) == -1) {
				  throw new EnergyproSystemException("Сумарна дистанція на рядку подорожнього листа ("+byTime2+" м/ч) " + " меньша за суму дистанцій ("+sumDistancesWithKoefs+" м/ч)");
			  }

			  // Вычитание пробега трактора по машиночасам
			  for(int i = 0; i < tsidList.totalCount; i++) {
				  byTime2 = byTime2.subtract(tsidList.get(i).distance.divide(new BigDecimal(100),3, BigDecimal.ROUND_HALF_UP));
			  }

			  //	Скорректированный расход на работу исходя из коэффициента
			  BigDecimal rashodProbegKoef = tr.transportReal.rashodProbeg.multiply(transportKoef.add(temperatureKoef)).setScale(2, BigDecimal.ROUND_HALF_UP);

			  // для тракторов из расстояния ...
			  byTime2 = byTime2.multiply(rashodProbegKoef).setScale(1, BigDecimal.ROUND_HALF_UP);

			  // Расчет топлива по коэффициентам из дистанций
			  BigDecimal[] fuelCountedByKoef = new BigDecimal[tsidList.totalCount];
			  for(int i=0; i < tsidList.totalCount; i++) {
				  BigDecimal koef = tsidDAO.getAggregateSumOfKoefs(tsidList.get(i).code, transportKoef.add(temperatureKoef));
				  BigDecimal rashodProbegWithKoef = tr.transportReal.rashodProbeg.multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
				  fuelCountedByKoef[i] = tsidList.get(i).distance.divide(new BigDecimal(100), 3, BigDecimal.ROUND_HALF_UP);
				  fuelCountedByKoef[i] = fuelCountedByKoef[i].multiply(rashodProbegWithKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
				  byTime2 = byTime2.add(fuelCountedByKoef[i]);
			  }

		  }

		  /*Досчитывание n% за каждый час прогрева */
		  if(trItem.heatingTime != null){
			  	if (tr.transportReal.rashodProbeg == null){
				  throw new EnergyproSystemException("Расход на пробег не найден ...");
			  	}
				heatingTimeRashod = tr.transportReal.rashodProbeg.multiply(trItem.heatingTime.multiply(ENConsts.HEATING_TIME_FUEL_RATE_PERCENT.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)));
				heatingTimeRashod = heatingTimeRashod.setScale(1, BigDecimal.ROUND_HALF_UP);
				out = out.add(heatingTimeRashod);
		  }

		  // если класификация транспорта "грузовой автомобиль" или "авто кран"
		  if (isPresentRouteInPlan
				  && (tr.transportReal.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO
				  || tr.transportReal.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN)){
			  out = byTime.add(byDistance).add(heatingTimeRashod).setScale(2, BigDecimal.ROUND_HALF_UP);
		  } else {
			  out = byTime.add(byDistance).add(heatingTimeRashod).setScale(2, BigDecimal.ROUND_HALF_UP).add(byTime2).setScale(2, BigDecimal.ROUND_HALF_UP) ;
		  }

		  FuelConsumingCalculationResults results = new FuelConsumingCalculationResults();
		  results.transportItemCode = tCode;
		  results.totalValue = out;
		  results.byDistance = byDistance;
		  results.byTime = byTime;
		  results.byTime2 = byTime2;
		  results.heatingTimeConsumption = heatingTimeRashod;
		  results.temperatureKoef = temperatureKoef;


		  return results;
	  }

	  public ENTravelSheetFuel[] getFuelByTravelSheetItem(int travelSheetItem) throws PersistenceException {
  	  	ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
  	  	return eDAO.getFuelsByTravelSheetItem(travelSheetItem);
	  }

	  public BigDecimal subtractThirdPartyFuel(int travelSheetItemCode, BigDecimal quantity) throws PersistenceException {
		  ENTravelSheetItemDAO itemDao = new ENTravelSheetItemDAO(connection, userProfile);
		  ENTravelSheetDAO travelSheetDao = new ENTravelSheetDAO(connection, userProfile);
		  ENTravelSheetFuelRemainsDAO fuelRemainsDao = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		  
		  ENTravelSheetItem item = itemDao.getObject(travelSheetItemCode);
		  ENTravelSheet sheet = travelSheetDao.getObject(item.travelSheetRef.code);
		  BigDecimal leftOver = quantity.setScale(2, RoundingMode.HALF_UP);
		  
		  Collection<ENTravelSheetFuel> thirdPartyFuel = this.getFuelMaterialByTravelSheet(sheet, quantity, /*SUPP-3605*/ENTravelSheetFuelType.MAIN, true);
		  for(ENTravelSheetFuel fuel : thirdPartyFuel) {
			  BigDecimal quantityToSubtract = leftOver.compareTo(fuel.countGen) >= 0 ? fuel.countGen : leftOver;
			  leftOver = leftOver.subtract(quantityToSubtract);
			  if(quantityToSubtract.compareTo(BigDecimal.ZERO) > 0) {
				  ENTravelSheetFuelRemainsFilter fuelRemainsFilter = new ENTravelSheetFuelRemainsFilter();
				  fuelRemainsFilter.travelSheetRef.code = sheet.code;
				  fuelRemainsFilter.travelSheetFuelTypeRef.code = ENTravelSheetFuelType.MAIN;
				  fuelRemainsFilter.conditionSQL = String.format("coalesce(%s, false) = ?", ENTravelSheetFuelRemains.isThirdParty_QFielld);
				  int[] fuelRemainsCodes = fuelRemainsDao.getFilteredCodeArray(fuelRemainsFilter, 0, -1, new Vector<>(Arrays.asList(true)));
				  if(fuelRemainsCodes.length != 1) {
					  throw new SystemException("Помилка у кількості залишків!");
				  }
				  ENTravelSheetFuelRemains remains = fuelRemainsDao.getObject(fuelRemainsCodes[0]);
				  remains.countGenOut = remains.countGenOut.add(quantityToSubtract);
				  remains.countGenFinal = remains.countGenFinal.subtract(quantityToSubtract);
				  if(remains.countGenFinal.compareTo(BigDecimal.ZERO) < 0) {
					  throw new SystemException("Помилка значення залишку палива: " + remains.countGenFinal);
				  }
				  fuelRemainsDao.save(remains);
			  }
		  }
		  return leftOver;
	  }

	  public Collection<ENTravelSheetFuel> getFuelMaterialByTravelSheet(ENTravelSheet ts, BigDecimal countGen, int travelSheetFuelTypeCode, boolean isThirdParty) throws PersistenceException {
		  Map<Integer, ENTravelSheetFuel> fuelsMap = new HashMap<>();

		  // определим что выдали ..
		  BigDecimal countRem = countGen.setScale(2, RoundingMode.HALF_UP);
		  
		  if(travelSheetFuelTypeCode != ENTravelSheetFuelType.MAIN && isThirdParty) {
			  throw new java.lang.IllegalArgumentException("Неправильно задані параметри!");
		  }
		  

		  // если выдачи не хватило - тянем остатки ....
		  ENTravelSheetFuelRemainsDAO fuelRemDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		  ENTravelSheetFuelRemainsFilter fuelRemFilter = new ENTravelSheetFuelRemainsFilter();
		  fuelRemFilter.travelSheetRef.code = ts.code;
		  fuelRemFilter.travelSheetFuelTypeRef.code = travelSheetFuelTypeCode;
		  // 0-вые тоже пропустим ... для геенерации ПММ генерить 0-вые строки ...
		  fuelRemFilter.conditionSQL =  String.format(" %s <> 0 AND coalesce(%s, ?) = ?", ENTravelSheetFuelRemains.countGenFinal_QFielld
				  , ENTravelSheetFuelRemains.isThirdParty_QFielld);
		  fuelRemFilter.orderBySQL = ENTravelSheetFuelRemains.fuelTypeRef_QFielld + " desc"; // типа более дорогое топливо ... SUPP-11436 ставим desc для списания остатков начиная с БЕНЗИНА А-80
		  ENTravelSheetFuelRemainsShortList fuelRemList = fuelRemDAO.getScrollableFilteredList(fuelRemFilter, 0, -1, new Vector<>(Arrays.asList(false, isThirdParty)));
		  
		  for(ENTravelSheetFuelRemainsShort fuelRem : fuelRemList.list) {
			  BigDecimal quantity = countRem.compareTo(fuelRem.countGenFinal) >= 0 ? fuelRem.countGenFinal : countRem.setScale(2, RoundingMode.HALF_UP);
			  countRem = countRem.subtract(quantity).setScale(2, BigDecimal.ROUND_HALF_UP);
			  if(fuelsMap.containsKey(fuelRem.fuelTypeRefCode)) {
				  ENTravelSheetFuel f = fuelsMap.get(fuelRem.fuelTypeRefCode);
				  f.countGen = f.countGen.add(quantity).setScale(2, BigDecimal.ROUND_HALF_UP);
			  } else {
				  ENTravelSheetFuel f = new ENTravelSheetFuel();
				  f.countGen = quantity;
				  f.fuelType.code = fuelRem.fuelTypeRefCode;
				  f.travelSheetFuelTypeRef.code = fuelRem.travelSheetFuelTypeRefCode;
				  fuelsMap.put(fuelRem.fuelTypeRefCode, f);
			  }
		  }

		  // а вот и остаток , которого НЕБЫЛО ;) ..
		  // списуют больше чем есть ....
		  if (countRem.doubleValue() > 0 && !isThirdParty) {
			  if(travelSheetFuelTypeCode != ENTravelSheetFuelType.FOR_STARTER)
				  throw new EnergyproSystemException("Списання більше ніж залишок на " + countRem + " л");
			  else
				  throw new EnergyproSystemException("Для пускового двигуна: списання більше ніж залишок на " + countRem + " л");
		  }
		  return fuelsMap.values();
	  }

	  public void updateRemainderOUT(int travelSheetCode) throws PersistenceException {
			ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
			ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
			TransportLogic trLogic = new TransportLogic(connection, userProfile);
			TravelSheetLogic tsLogic = new TravelSheetLogic(connection, userProfile);
			ENTravelSheetItem2TransportItemDAO tvtiDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
			ENTransport2ENEstimateDAO tresDAO = new ENTransport2ENEstimateDAO(connection, userProfile);

			ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
			remFilter.travelSheetRef.code = travelSheetCode;
			remFilter.conditionSQL = String.format("coalesce(%s, false) = ?", ENTravelSheetFuelRemains.isThirdParty_QFielld);

			int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1, new Vector<>(Arrays.asList(false)));

			// Коды эстимейтов по коду путевого
			int[] travelSheetItemCodes = tsLogic.getTravelSheetItemCodesByTravelListCode(travelSheetCode, ENTravelSheetItemKind.FACT);
			String strTravelSheetItemCodes = "null";
			if(travelSheetItemCodes != null && travelSheetItemCodes.length != 0)
				strTravelSheetItemCodes = Tools.intArrayToStr(travelSheetItemCodes, ",");

			ENTravelSheetItem2TransportItemFilter tvtiFilter = new ENTravelSheetItem2TransportItemFilter();
			tvtiFilter.conditionSQL = ENTravelSheetItem2TransportItemFilter.travelSheetItemRef_QFielld + " IN (" + strTravelSheetItemCodes + ")";
			ENTravelSheetItem2TransportItemShortList tvtiList = tvtiDAO.getScrollableFilteredList(tvtiFilter, 0, -1);
			String strTransportItemCodes = "null";
			if(tvtiList.totalCount > 0) {
				int[] transportItemCodes = new int[tvtiList.totalCount];
				for(int i = 0; i < tvtiList.totalCount; i++) {
					transportItemCodes[i] = tvtiList.get(i).transportItemRefCode;
				}
				strTransportItemCodes = Tools.intArrayToStr(transportItemCodes, ",");
			}
			ENTransport2ENEstimateFilter tresFilter = new ENTransport2ENEstimateFilter();
			tresFilter.conditionSQL = ENTransport2ENEstimateFilter.transportRef_QFielld + " IN (" + strTransportItemCodes + ")";
			ENTransport2ENEstimateShortList tresList = tresDAO.getScrollableFilteredList(tresFilter, 0, -1);
			String strEstimateItemCodes = "null";
			if(tresList.totalCount > 0) {
				int[] estimateItemCodes = new int[tresList.totalCount];
				for(int i = 0; i < tresList.totalCount; i++) {
					estimateItemCodes[i] = tresList.get(i).estimateRefCode;
				}
				strEstimateItemCodes = Tools.intArrayToStr(estimateItemCodes, ",");
			}
			// Конец -  Коды эстимейтов по коду путевого
			
			for (int i = 0; i < remArr.length; i++) {
				ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
				int matCode = trLogic.getMaterialByFuelType(rem.fuelTypeRef.code);
				ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
				eFilter.kindRef.code = ENEstimateItemKind.GSM;
				eFilter.materialRef.code = matCode;
				eFilter.conditionSQL = ENEstimateItemFilter.code_QFielld + " IN (" + strEstimateItemCodes + ")";
				ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
				BigDecimal countOut = new BigDecimal(0);
				//int materialCode = Integer.MIN_VALUE;
				for (int j=0; j < eList.totalCount; j++) {
					countOut = countOut.add(eList.get(j).countFact);
					//materialCode = eList.get(i).materialRefCode;
				}
				rem.countGenOut = countOut;
				rem.countGenFinal = rem.countGenStart.add(rem.countGenIn).setScale(2,BigDecimal.ROUND_HALF_UP).subtract(rem.countGenOut).setScale(2, BigDecimal.ROUND_HALF_UP);
				if (rem.countGenFinal.doubleValue() < 0) {
					throw new EnergyproSystemException("Списання більше ніж залишок на " + Math.abs(rem.countGenFinal.doubleValue()));
				}
				remDAO.save(rem);
			}
	  }

	public TravelSheetFuelLogic(Connection connection, UserProfile userProfile)
	{
	   super(connection, userProfile);
	}


/////////////////////////////////////////////////////////////////////////
	  ///// HLAM
/////////////////////////////////////////////////////////////////////

	  public ENTransportRealFuelRemains getLastTransportRealFuelRemains_double_no_use(int transportRealCode, int fuelTypeCode) throws PersistenceException
	  {
		  ENTransportRealFuelRemainsDAO dao = new ENTransportRealFuelRemainsDAO(connection, userProfile);
		  ENTransportRealFuelRemains out = new ENTransportRealFuelRemains();

		  ENTransportRealFuelRemainsFilter f = new ENTransportRealFuelRemainsFilter();
		  f.realTransport.code = transportRealCode;
		  f.fuelTypeRef.code = fuelTypeCode;
		  f.orderBySQL = ENTransportRealFuelRemains.dateStart_QFielld + " desc";
		  int[] arr = dao.getFilteredCodeArray(f, 0, 1);
		  if (arr.length == 0){
			  return null;
		  }
		  else{
			  out = dao.getObject(arr[0]);
		  }
		  return out;
	  }

		public void checkCountPMM(ENFuelDistributionSheetItem object , int typeActivity ,  BigDecimal diff) throws PersistenceException
		{

			ENFuelDistributionSheetItemDAO fuelDistrItemDao = new ENFuelDistributionSheetItemDAO(connection, userProfile);

			ENFuelDistributionSheetItemShortList fuelDistrItemList =  fuelDistrItemDao.getFreePMM(object.fuelDistributionRef.code);

			for (int i=0; i < fuelDistrItemList.totalCount; i++){

				// находим строку с соответствующей декадой и проверим на превышение diff(на сколько увеличили)
				if (fuelDistrItemList.get(i).decadeNumber == object.decadeNumber){

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES ){
						if(fuelDistrItemList.get(i).count1.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для послуг на сторону , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count1 + " л. ");
					  }
					}

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK ){
						if(fuelDistrItemList.get(i).count2.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для загальних робіт , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count2 + " л. ");
					  }
					}

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP ){
						if(fuelDistrItemList.get(i).count3.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для ВКБ ІП , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count3 + " л. ");
					  }
					}

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER ){
						if(fuelDistrItemList.get(i).count4.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для ВКБ (інше) , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count4 + " л. ");
					  }
					}

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU ){
						if(fuelDistrItemList.get(i).count5.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для ВРТУВД , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count5 + " л. ");
					  }
					}

					if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR ){
						if(fuelDistrItemList.get(i).count6.compareTo(diff) == -1) {
						throw new PersistenceException("\n Доступна кількість палива для АВР , для " + fuelDistrItemList.get(i).decadeNumber + " декади, становить  " + fuelDistrItemList.get(i).count6 + " л. ");
					  }
					}


				}

			}
		}


		/**
		 * кол-во пмм по АВЗ
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByAVR(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;

			try {
				BigDecimal out = new BigDecimal(0);
				String sql = "  /* авр - план  */ \n" +
						" select round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.typerefcode = 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011) \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"   union all \n" +
						"   select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.typerefcode = 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011) \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"   ) as q \n" +
						"   ),0)::numeric,2) \n" +
						"  \n" ;


				statement = connection.prepareStatement(sql);
				resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByAVR", e);
			}
			finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}

		/**
		 * кол-во пмм по общепроизводственным работам (ПР + КР + ТО + енергосбыт + прочее )
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 *
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByGeneralWork(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;

			try {



				BigDecimal out = new BigDecimal(0);
				String sql1 =
						" select coalesce( "  +

						" /* Текущий ремонт - план */ \n" +
						" round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"      enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode = 5 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
        				"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  union all \n" +
						"  select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode = 5 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
        				"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"   ) as q \n" +
						"  ),0)::numeric,2) \n" +
						"  + " ;

				String sql2 = "   /* Капитальный ремонт - план */ \n" +
						" round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"      enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode = 1 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
        				"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  union all \n" +
						"  select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"    and pw.staterefcode = 1 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
        				"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"   ) as q \n" +
						"  ),0)::numeric,2) \n" +
						"  + " ;

				String sql3 = " /* ТО - план */ \n" +
						" round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode = 3 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
        				"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +

						"   union all \n" +
						"   select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode = 3 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +
						"   ) as q \n" +
						"   ),0)::numeric,2) \n" +
						"  + " ;

				String sql4 = " /* Энергосбыт - план */ \n" +
						" round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and  pw.staterefcode <> 7 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = 240000001 \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +
						"   union all \n" +
						"   select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"    and pw.staterefcode <> 7 \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and pw.budgetrefcode = 240000001 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
                        "   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
                        "   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
        				"                ei.materialrefcode in (500000120,500002447)  \n" +
        				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
        				"                ei.materialrefcode in (75000844) \n" +
        				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
        				"                ei.materialrefcode in (75000843) \n" +
        				"                when  "+fueltype+" = 0 then   \n" +
        				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
        				"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +
						"   ) as q \n" +
						"   ),0)::numeric,2) \n" +
						"  + " ;

				String sql5 = " /* Прочее - план */  \n" +
						" round(coalesce((select  sum(q.countfact)  from ( \n" +
						" select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode not in (1, 3, 5, 7) \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
						"                ei.materialrefcode in (75000844) \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +
						"   union all \n" +
						"   select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.staterefcode not in (1, 3, 5, 7) \n" +
						"   and pw.typerefcode <> 2 \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode not in (240000001, 75000009, 75000011,500000040) \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
						"                ei.materialrefcode in (75000844) \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end   \n" +
						"   ) as q \n" +
						"   ),0)::numeric,2) \n" +
						" + " ;

			String sql6 = " /* одг - план */  \n" +
					" round(coalesce((select  sum(q.countfact)  from ( \n" +
					" select  ei.countfact \n" +
					" from enplanwork pw, enestimateitem ei, \n" +
					"      entransport2enestimate t2e, entransportitem t, \n" +
					"           enworkorder2enplanwork wo2pw \n" +
					" where pw.code = ei.planrefcode \n" +
					"   and pw.typerefcode <> 2 \n" +
					"   and ei.kindrefcode = 2 \n" +
					"   and pw.kindcode = 3 \n" +
					"   and wo2pw.plancode = pw.code \n" +
					"   and pw.budgetrefcode = 500000040 \n" +
					"   and ei.code = t2e.estimaterefcode \n" +
					"   and t2e.transportrefcode = t.code \n" +
					"   and t.transportrealcode is not null \n" +
					"   and ei.countfact > 0 \n" +
					"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
					"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
					"                ei.materialrefcode in (500000120,500002447)  \n" +
					"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
					"                ei.materialrefcode in (75000844) \n" +
					"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
					"                ei.materialrefcode in (75000843) \n" +
					"                when  "+fueltype+" = 0 then   \n" +
					"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
					"           end  \n" +
					"   and case when "+decade+" = 1 then   \n" +
					"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                when "+decade+" = 2 then   \n" +
					"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
					"                when "+decade+" = 3 then   \n" +
					"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
					"                when "+decade+" = 0 then   \n" +
					"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
					"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
					"        end   \n" +
					"   union all \n" +
					"   select  ei.countfact \n" +
					" from enplanwork pw, enestimateitem ei, \n" +
					"           enworkorder2enplanwork wo2pw \n" +
					" where pw.code = ei.planrefcode \n" +
					"   and pw.typerefcode <> 2 \n" +
					"   and ei.kindrefcode = 1 \n" +
					"   and pw.kindcode = 3 \n" +
					"   and wo2pw.plancode = pw.code \n" +
					"   and pw.budgetrefcode = 500000040 \n" +
					"   and wo2pw.plancode = pw.code \n" +
					"   and ei.countfact > 0 \n" +
					"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
					"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
					"                ei.materialrefcode in (500000120,500002447)  \n" +
					"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
					"                ei.materialrefcode in (75000844) \n" +
					"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
					"                ei.materialrefcode in (75000843) \n" +
					"                when  "+fueltype+" = 0 then   \n" +
					"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
					"           end  \n" +
					"   and case when "+decade+" = 1 then   \n" +
					"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                when "+decade+" = 2 then   \n" +
					"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
					"                when "+decade+" = 3 then   \n" +
					"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
					"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
					"                when "+decade+" = 0 then   \n" +
					"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
					"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
					"        end   \n" +
					"   ) as q \n" +
					"   ),0)::numeric,2) \n" +
					"  ,0)  " ;





				 statement = connection.prepareStatement(sql1 + sql2 + sql3 + sql4 + sql5 + sql6);
				 resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByGeneralWork", e);
			} finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}

		/**
		 * кол-во пмм по услугам на сторону
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 *
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByServices(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			try {

				BigDecimal out = new BigDecimal(0);

				/*String sql = " select round(coalesce((select  sum(ei.countfact) \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"      entransport2enestimate t2e, entransportitem t, \n" +
				"      enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and pw.staterefcode = 7 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.kindrefcode = 2 \n" +
				"   and ei.code = t2e.estimaterefcode \n" +
				"   and t2e.transportrefcode = t.code \n" +
				"   and t.transportrealcode is not null \n" +
				"   and pw.budgetrefcode not in (75000009, 75000011) \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				" ),0)::numeric,2) \n" ;*/


				String sql = " /* Услуги - план*/ \n" +
				" select  round(coalesce(( \n" +
				" select sum(countfact) from \n" +
				" (select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"      entransport2enestimate t2e, entransportitem t, \n" +
				"      enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and pw.staterefcode = 7 \n" +
				"   and pw.typerefcode <> 2 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.kindrefcode = 2 \n" +
				"   and ei.code = t2e.estimaterefcode \n" +
				"   and t2e.transportrefcode = t.code \n" +
				"   and t.transportrealcode is not null \n" +
				"   and pw.budgetrefcode not in (75000009, 75000011,500000040) \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"  \n" +
				"   union all \n" +
				"  \n" +
				"    select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"           enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and pw.staterefcode = 7 \n" +
				"   and pw.typerefcode <> 2 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.kindrefcode = 1 \n" +
				"   and pw.budgetrefcode not in (75000009, 75000011,500000040) \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"   ) as q \n" +
				"   ),0)::numeric,2) \n" +
				"  \n" ;




				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet  resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByServices", e);
			}
		}



		/**
		 * кол-во пмм по ВКБ ИП
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 *
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByVKBIP(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;
			try {

				BigDecimal out = new BigDecimal(0);
				/*String sql = " select  coalesce(sum(ei.countfact),0) \n" +
						" from enplanwork pw, enestimateitem ei,  \n" +
						"     entransport2enestimate t2e, entransportitem t, \n" +
						"          enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.typerefcode = "+ENPlanWorkType.INVEST +" \n" +
						"   and ei.kindrefcode = "+ENEstimateItemKind.GSM+" \n" +
						"   and pw.kindcode = "+ENPlanWorkKind.NPW+" \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = "+ENConsts.ENBUDGET_OKS+" \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  \n" ;*/

				String sql = " /* ИП ВКБ - план */ \n" +
				" select round(coalesce(( \n" +
				" select sum(countfact) from \n" +
				" (select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"      entransport2enestimate t2e, entransportitem t, \n" +
				"           enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and pw.typerefcode = 5 \n" +
				"   and ei.kindrefcode = 2 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and pw.budgetrefcode = 75000009 \n" +
				"   and ei.code = t2e.estimaterefcode \n" +
				"   and t2e.transportrefcode = t.code \n" +
				"   and t.transportrealcode is not null \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"  \n" +
				"   union all \n" +
				"  \n" +
				"   select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"           enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and pw.typerefcode = 5 \n" +
				"   and ei.kindrefcode = 1 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and pw.budgetrefcode = 75000009 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"   ) as q \n" +
				"   ),0)::numeric,2) \n" +
				"  \n" ;


				statement = connection.prepareStatement(sql);
				resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByVKBIP", e);
			}
			finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}

		/**
		 * кол-во пмм по ВКБ Прочее
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByVKBOther(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;

			try {

				BigDecimal out = new BigDecimal(0);
				/*String sql = " select  coalesce(sum(ei.countfact),0) \n" +
						" from enplanwork pw, enestimateitem ei,  \n" +
						"     entransport2enestimate t2e, entransportitem t, \n" +
						"          enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.typerefcode <> "+ENPlanWorkType.INVEST +" \n" +
						"   and ei.kindrefcode = "+ENEstimateItemKind.GSM+" \n" +
						"   and pw.kindcode = "+ENPlanWorkKind.NPW+" \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = "+ENConsts.ENBUDGET_OKS+" \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  \n" ;*/
				String sql = " /* прочее ВКБ - план */ \n" +
						" select round(coalesce(( \n" +
						" select sum(countfact) from \n" +
						" (select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"      entransport2enestimate t2e, entransportitem t, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and pw.typerefcode not in (2, 5) \n" +
						"   and ei.kindrefcode = 2 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = 75000009 \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
						"                ei.materialrefcode in (75000844) \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  \n" +
						"   union all \n" +
						"  \n" +
						"   select  ei.countfact \n" +
						" from enplanwork pw, enestimateitem ei, \n" +
						"           enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"  and pw.typerefcode not in (2, 5) \n" +
						"   and ei.kindrefcode = 1 \n" +
						"   and pw.kindcode = 3 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = 75000009 \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
						"                ei.materialrefcode in (75000844) \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"   ) as q \n" +
						"   ),0)::numeric,2) \n" +
						"  \n" ;


				 statement = connection.prepareStatement(sql);
				 resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByVKBOther", e);
			}
			finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}

		/**
		 * кол-во пмм по ВРТУВД
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMFromNPWByVRTU(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;

			try {
				BigDecimal out = new BigDecimal(0);
				/*String sql = " select  coalesce(sum(ei.countfact),0) \n" +
						" from enplanwork pw, enestimateitem ei,  \n" +
						"     entransport2enestimate t2e, entransportitem t, \n" +
						"          enworkorder2enplanwork wo2pw \n" +
						" where pw.code = ei.planrefcode \n" +
						"   and ei.kindrefcode = "+ENEstimateItemKind.GSM+" \n" +
						"   and pw.kindcode = "+ENPlanWorkKind.NPW+" \n" +
						"   and wo2pw.plancode = pw.code \n" +
						"   and pw.budgetrefcode = "+ ENConsts.ENBUDGET_VRTU +" \n" +
						"   and ei.code = t2e.estimaterefcode \n" +
						"   and t2e.transportrefcode = t.code \n" +
						"   and t.transportrealcode is not null \n" +
						"   and ei.countfact > 0 \n" +
						"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
						"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
						"                ei.materialrefcode in (75000844,500000120,500002447)  \n" +
						"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
						"                ei.materialrefcode in (75000843) \n" +
						"                when  "+fueltype+" = 0 then   \n" +
						"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
						"           end  \n" +
						"   and case when "+decade+" = 1 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                when "+decade+" = 2 then   \n" +
						"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
						"                when "+decade+" = 3 then   \n" +
						"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
						"                when "+decade+" = 0 then   \n" +
						"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
						"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
						"        end                          \n" +
						"  \n" ;*/

				String sql = " /* ВРТУВД - план*/ \n" +
				" select round(coalesce(( \n" +
				" select sum(countfact) from \n" +
				" (select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"      entransport2enestimate t2e, entransportitem t, \n" +
				"           enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and ei.kindrefcode = 2 \n" +
				"   and pw.typerefcode <> 2 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and pw.budgetrefcode = 75000011 \n" +
				"   and ei.code = t2e.estimaterefcode \n" +
				"   and t2e.transportrefcode = t.code \n" +
				"   and t.transportrealcode is not null \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"   union all \n" +
				"   select  ei.countfact \n" +
				" from enplanwork pw, enestimateitem ei, \n" +
				"           enworkorder2enplanwork wo2pw \n" +
				" where pw.code = ei.planrefcode \n" +
				"   and ei.kindrefcode = 1 \n" +
				"   and pw.typerefcode <> 2 \n" +
				"   and pw.kindcode = 3 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and pw.budgetrefcode = 75000011 \n" +
				"   and wo2pw.plancode = pw.code \n" +
				"   and ei.countfact > 0 \n" +
				"   and pw.departmentrefcode  in  ("+departmentCodes+") \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                ei.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                ei.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                ei.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                ei.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				"   and case when "+decade+" = 1 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                pw.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                pw.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                pw.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" +
				"   ) as q \n" +
				"   ),0)::numeric,2) \n" +
				"  \n" ;


				statement = connection.prepareStatement(sql);
				resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMFromNPWByVRTU", e);
			}
			finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}


		/**
		 * кол-во пмм по ОВБ
		 * кол-во пмм по подразделению по типу топлива по декаде из задания план для ведомости выдачи топлива
		 * @param departmentCodes коды подразделений через запятую .
		 * @param fueltype тип топлива
		 * @param decade декада (1-3)
		 * @param month месяц
		 * @param year год
		 * @return суммарное кол-во в литрах запланированого топлива на декаду по ОВБ
		 * @throws PersistenceException
		 */
		public BigDecimal getCountPMMByOVB(String departmentCodes ,int fueltype ,int decade , int month , int year ) throws PersistenceException {
			PreparedStatement statement = null;
			ResultSet  resultSet =  null;

			try {
				BigDecimal out = new BigDecimal(0);
				String sql = " select coalesce(sum(eni.countfact),0)  \n" +
				"  from  \n" +
				" entravelsheet ts  , tktransportreal treal , entravelsheetitem travi , entravlshttm2trnsprttm ,  entransport2enestimate t2e \n" +
				" , enestimateitem eni ,  tkfueltype ,  \n" +
				" ( Select  q.transportrealrefcode , q.datestart , q.datefinal , q.transportdepartmntrfcd , q.finmolcode \n" +
				"  from tktransportrealhistory q  \n" +
				"  where  coalesce(q.isovb,0) = 1 ) as tranhis  \n" +
				"   \n" +
				"  where ts.transportrealcode = tranhis.transportrealrefcode \n" +
				"  and ts.code = travi.travelsheetrefcode \n" +
				"  and travi.kindrefcode = 2 \n" +
				"  and treal.code = ts.transportrealcode \n" +
				"  and tranhis.transportdepartmntrfcd in ( \n" +
				"             select distinct d.transportdepartmentcod from entransportdep2dep d \n" +
				"             where d.departmentcode in ("+departmentCodes+") \n" +
				"             ) \n" +
				"  \n" +
				" and travi.code = entravlshttm2trnsprttm.travelsheetitemrefcode  \n" +
				"  and t2e.transportrefcode = entravlshttm2trnsprttm.transportitemrefcode           \n" +
				"  and t2e.estimaterefcode = eni.code \n" +
				"  and eni.kindrefcode = 2    \n" +
				"  and tkfueltype.materialrefcode = eni.materialrefcode  \n" +
				"  \n" +
				"   and case when "+fueltype+ " = "+TKFuelType.A92 +" then  \n" +
				"                eni.materialrefcode in (500000120,500002447)  \n" +
				"                when  "+fueltype+" = "+TKFuelType.A95 +" then   \n" +
				"                eni.materialrefcode in (75000844) \n" +
				"                when  "+fueltype+" = "+TKFuelType.DT +" then   \n" +
				"                eni.materialrefcode in (75000843) \n" +
				"                when  "+fueltype+" = 0 then   \n" +
				"                eni.materialrefcode in (75000843,75000844,500000120,500002447) \n" +
				"           end  \n" +
				" and ts.datestart between tranhis.datestart and coalesce( tranhis.datefinal, case when "+decade+" = 1 then to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )  \n" +
                " when "+decade + "= 2 then to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
                " when "+decade + "= 3 then last_day(to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )) \n" +
                " end  ) " +
                "   and case when "+decade+" = 1 then   \n" +
				"                ts.datestart between to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '10'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                when "+decade+" = 2 then   \n" +
				"                ts.datestart between to_date( '11'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and to_date( '20'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' )                 \n" +
				"                when "+decade+" = 3 then   \n" +
				"                ts.datestart between to_date( '21'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"||','||"+year+" ,'dd.mm.yyyy' ) ) \n" +
				"                when "+decade+" = 0 then   \n" +
				"                ts.datestart between to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) \n" +
				"                                and last_day( to_date( '01'||','||"+month+"::integer||','||"+year+"::integer ,'dd.mm.yyyy' ) )  \n" +
				"        end                          \n" ;



				statement = connection.prepareStatement(sql);
				resultSet =  statement.executeQuery();

				if(resultSet.next()) {
					out = resultSet.getBigDecimal(1);
				}

				return out;
			} catch (SQLException e) {
				throw new PersistenceException("Could not getCountPMMByOVB", e);
			}
			finally {
				try {
	                if(resultSet != null) {
	                    resultSet.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            try {
	                if(statement != null) {
	                    statement.close();
	                }
	            } catch (SQLException e1) {

	                e1.printStackTrace();
	            }
			}
		}


	public int createRQFKOrderForTravelSheetFuel(ENTravelSheetFuel fuel) throws PersistenceException {
		if(fuel.checkIsThirdParty()) return Integer.MIN_VALUE;
		try
		{
	        Context context = new InitialContext();

	        Object fkOrderRef = context.lookup(RQFKOrderController.JNDI_NAME);
	        RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject
	                .narrow(fkOrderRef, RQFKOrderControllerHome.class);
	        RQFKOrderController fkOrderController = fkOrderHome.create();

	        Object fkOrderItemRef = context.lookup(RQFKOrderItemController.JNDI_NAME);
	        RQFKOrderItemControllerHome fkOrderItemHome = (RQFKOrderItemControllerHome) PortableRemoteObject
	                .narrow(fkOrderItemRef, RQFKOrderItemControllerHome.class);
	        RQFKOrderItemController fkOrderItemController = fkOrderItemHome.create();

	        ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(connection, userProfile);
	        ENTravelSheet travelSheet = travelSheetDAO.getObject(fuel.travelSheetRef.code);

	        if (travelSheet == null)
	        {
	        	throw new EnergyproSystemException("\n\nNET-4414 Не знайдено подорожній лист з кодом " + fuel.travelSheetRef.code + " !");
	        }

	        // Если в путевом уже была выдача, то ордер на резервирование ГСМ уже должен быть создан -
	        // в этом случае нужно его найти, иначе - создать
	        ENTravelSheetFuelFilter fuelFilter = new ENTravelSheetFuelFilter();
	        fuelFilter.travelSheetRef.code = fuel.travelSheetRef.code;
	        fuelFilter.conditionSQL = "ENTRAVELSHEETFUEL.CODE <> " + fuel.code;
	        ENTravelSheetFuelDAO fuelDAO = new ENTravelSheetFuelDAO(connection, userProfile);

	        ENTravelSheetFuelShortList fuelList = fuelDAO.getScrollableFilteredList(fuelFilter, 0, -1);

	        int fkOrderCode = Integer.MIN_VALUE;
	        int fkOrderItemCode = Integer.MIN_VALUE;

	        ENTravelSheetFuel2FINMaterialsDAO fuel2finMaterialsDAO = new ENTravelSheetFuel2FINMaterialsDAO(connection, userProfile);
	        RQFKOrderItem2ENEstimateItemDAO oi2eiDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);

	        // На всякий случай поищем по всем выдачам
	        for (int i = 0; i < fuelList.totalCount; i++)
	        {
	        	ENTravelSheetFuel2FINMaterialsFilter fuel2finMaterialsFilter = new ENTravelSheetFuel2FINMaterialsFilter();
	        	fuel2finMaterialsFilter.travelSheetFuelRef.code = fuelList.get(i).code;
	        	ENTravelSheetFuel2FINMaterialsShortList fuel2finMaterialsList = fuel2finMaterialsDAO.getScrollableFilteredList(fuel2finMaterialsFilter, 0, -1);

	        	for (int j = 0; j < fuel2finMaterialsList.totalCount; j++)
	        	{
		        	RQFKOrderItem2ENEstimateItemFilter oi2eiFilter = new RQFKOrderItem2ENEstimateItemFilter();
		        	oi2eiFilter.finMaterialsRef.code = fuel2finMaterialsList.get(j).finMaterialsRefCode;

		        	RQFKOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFilter, 0, -1);

		        	if (oi2eiList.totalCount > 0)
		        	{
		        		fkOrderItemCode = oi2eiList.get(0).fkOrderItemRefCode;
		        		break;
		        	}
	        	}
	        }

	        if (fkOrderItemCode != Integer.MIN_VALUE)
	        {
	        	RQFKOrderItemDAO fkOrderItemDAO = new RQFKOrderItemDAO(connection, userProfile);
	        	RQFKOrderItem fkOrderItem = fkOrderItemDAO.getObject(fkOrderItemCode);

	        	if (fkOrderItem == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено строку ордера з кодом " + fkOrderItemCode + " !");
	        	}

	        	if (fkOrderItem.fkOrderRef.code == Integer.MIN_VALUE)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не вдалося визначити код ордера для строки з кодом " + fkOrderItemCode + " !");
	        	}

	        	fkOrderCode = fkOrderItem.fkOrderRef.code;
	        }

	        String molCode = "";
	        int finDocCode = Integer.MIN_VALUE;

	        RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(connection, userProfile);
            FINDoc2FKOrderDAO d2oDAO = new FINDoc2FKOrderDAO(connection, userProfile);

            RQFKOrder fkOrder = null;

	        // Создаем ордер
	        if (fkOrderCode == Integer.MIN_VALUE)
	        {
	  		    TransportLogic trLogic = new TransportLogic(connection, userProfile);
	        	TKTransportRealHistory history = trLogic.getHistory(travelSheet.transportReal.code, travelSheet.dateStart);

	        	if (history == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено історію для транспорту (№ подорожнього листа: " + travelSheet.numberGen + ") !");
	        	}

	        	if (history.finMolCode == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не задана МВО для транспорту (№ подорожнього листа: " + travelSheet.numberGen + ") !");
	        	}

	        	if (history.finMolCode.equals(""))
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не задана МВО для транспорту (№ подорожнього листа: " + travelSheet.numberGen + ") !");
	        	}

	        	if (history.gosNumber == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не заданий держ. № для транспорту (№ подорожнього листа: " + travelSheet.numberGen + ") !");
	        	}

	        	if (history.gosNumber.equals(""))
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не заданий держ. № для транспорту (№ подорожнього листа: " + travelSheet.numberGen + ") !");
	        	}

		        fkOrder = new RQFKOrder();

		        fkOrder.kind.code = RQFKOrderKind.FUEL_RESERVE;
		        fkOrder.status.code = RQFKOrderStatus.GOOD;
		        fkOrder.accountingTypeRef.code = TKAccountingType.TMC;
		        fkOrder.molInCode = history.finMolCode;
		        fkOrder.molInName = history.finMolName;
		        fkOrder.molOutCode = history.finMolCode;
		        fkOrder.molOutName = history.finMolName;
		        fkOrder.department.code = travelSheet.department.code;
		        // Номер ордера будет совпадать с номером путевого
		        fkOrder.numberDoc = travelSheet.numberGen;
		        fkOrder.dateGen = travelSheet.dateStart;
		        fkOrder.datePosting = travelSheet.dateStart;
		        fkOrder.commentGen = "Автоматичний ордер для резервування ПММ (держ. № " + history.gosNumber + ", ПЛ № " + travelSheet.numberGen + ")";

		        // В поле via_who документа ФК будем передавать инв. № машины
		        String via_who = "инв.№ " + history.invNumber;

		        //fkOrderCode = fkOrderController.add(fkOrder);
		        fkOrderController.addFuelReserve(fkOrder, via_who);

		        fkOrderCode = fkOrder.code;

		        if (fkOrderCode == Integer.MIN_VALUE)
		        {
		        	throw new EnergyproSystemException("\n\nNET-4414 Помилка при складанні ордеру для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " !");
		        }
	        }
	        else
	        {
	        	fkOrder = fkOrderDAO.getObject(fkOrderCode);
	        }

	        if (fkOrderCode == Integer.MIN_VALUE)
	        {
	        	throw new EnergyproSystemException("\n\nNET-4414 Помилка при складанні ордеру для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " !");
	        }

        	if (fkOrder == null)
        	{
        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено ордер з кодом " + fkOrderCode + " !");
        	}

        	molCode = fkOrder.molInCode;

            FINDoc2FKOrderFilter d2oFilter = new FINDoc2FKOrderFilter();
            d2oFilter.fkOrderRef.code = fkOrderCode;
            d2oFilter.finDocTypeRef.code = FINDocType.MOVE_295;
            FINDoc2FKOrderShortList d2oList = d2oDAO.getScrollableFilteredList(d2oFilter, 0, -1);

	        if (d2oList.totalCount == 0)
	        {
	        	throw new EnergyproSystemException("\n\nNET-4414 Не знайдено документ у ФК для автоматичного ордеру з кодом " + fkOrderCode + " !");
	        }

	        finDocCode = d2oList.get(0).finDocCode;

        	if (molCode == null)
        	{
        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено код МВО для ПЛ № " + travelSheet.numberGen + " !");
        	}

        	if (molCode.equals(""))
        	{
        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено код МВО для ПЛ № " + travelSheet.numberGen + " !");
        	}

        	if (finDocCode == Integer.MIN_VALUE)
        	{
        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено документ у ФК для автоматичного ордеру з кодом " + fkOrderCode + " !");
        	}

	        FINLogic finLogic = new FINLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
	        FINMaterialsList finList = finLogic.getMaterialsListForTravelSheetFuel(fuel, molCode, travelSheet.dateStart, finDocCode);

	        BigDecimal quantity = fuel.countGen;

	        BigDecimal totalFKQuantity = new BigDecimal(0);

	        for (int i = 0; i < finList.totalCount; i++)
	        {
	        	totalFKQuantity = totalFKQuantity.add(finList.get(i).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
	        }

	        if (quantity.compareTo(totalFKQuantity) > 0)
	        {
	        	throw new EnergyproSystemException("\n\nNET-4414 На підзвіті " + molCode + " немає достатньої кількості ПММ для видачі!");
	        }

	        /////
	        // Перед вкидыванием строк в ордер нужно перевести его в статус "Черновой"
	        // (если он уже был создан при предыдущей выдаче, то он будет проведенным)
	        fkOrder = fkOrderDAO.getObject(fkOrderCode);
	        fkOrder.status.code = RQFKOrderStatus.GOOD;
	        fkOrderDAO.save(fkOrder);
	        /////

	        for (int i = 0; i < finList.totalCount; i++)
	        {
	        	FINMaterials finMaterial = finList.get(i);
	        	finMaterial.estimateItemRef.code = RQConsts.ESTIMATE_WITH_SYSTEM_MATERIALS_FOR_FUEL;

	        	int finMaterialCode = Integer.MIN_VALUE;

	        	// Если кол-ва в текущей строке остатков хватает, то берем все необходимое кол-во
	        	if (finMaterial.quantity.compareTo(quantity) >= 0)
	        	{
	        		finMaterial.quantity = quantity;

		        	// Добавляем строку в ордер
		        	finMaterialCode = fkOrderItemController.addFuelReserve(finMaterial, fkOrderCode);

			        if (finMaterialCode == Integer.MIN_VALUE)
			        {
			        	// 17.11.14 Если не нашли остатка по текущей партии на конец времен, переходим к следующей строке
			        	// throw new EnergyproSystemException("\n\nNET-4414 Помилка при додаванні строки в ордер для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " ! ");
			        	continue;
			        }

	        		quantity = new BigDecimal(0);
	        		//finMaterialCode = fkOrderItemController.addFuelReserve(finMaterial, fkOrderCode);
	        		//break;
	        	}
	        	else // иначе забираем то, что есть, и переходим к следующей строке остатков
	        	{
		        	// Добавляем строку в ордер
		        	finMaterialCode = fkOrderItemController.addFuelReserve(finMaterial, fkOrderCode);

			        if (finMaterialCode == Integer.MIN_VALUE)
			        {
			        	// 17.11.14 Если не нашли остатка по текущей партии на конец времен, переходим к следующей строке
			        	// throw new EnergyproSystemException("\n\nNET-4414 Помилка при додаванні строки в ордер для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " ! ");
			        	continue;
			        }

	        		quantity = quantity.subtract(finMaterial.quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
	        		//finMaterialCode = fkOrderItemController.addFuelReserve(finMaterial, fkOrderCode);
	        	}



		        ///////////////////////////////////////////////////////////////////
	            // Теперь нужно добавленный финматериал закинуть в связку с выдачей
	        	ENTravelSheetFuel2FINMaterials fuel2finMaterials = new ENTravelSheetFuel2FINMaterials();
	        	fuel2finMaterials.travelSheetFuelRef.code = fuel.code;
	        	fuel2finMaterials.finMaterialsRef.code = finMaterialCode;
	        	fuel2finMaterialsDAO.add(fuel2finMaterials);
	        	///////////////////////////////////////////////////////////////////

	        	if (quantity.compareTo(new BigDecimal(0)) == 0)
	        	{
	        		break;
	        	}
	        }

	        /// проверим наличие строк в ордере
	        RQFKOrderItemFilter ordItemFilter = new RQFKOrderItemFilter();
	        ordItemFilter.fkOrderRef.code = fkOrderCode;
	        RQFKOrderItemDAO ordItemDAO = new RQFKOrderItemDAO(connection, userProfile);
	        int[] arr = ordItemDAO.getFilteredCodeArray(ordItemFilter, 0, -1);
	        if (arr.length == 0)
	        {
	        	throw new SystemException("\n\nNET-4414 На підзвіті " + molCode + " немає достатньої кількості ПММ для видачі!");
	        }

	        /// проверим количество уже в привязанных
    		ENTravelSheetFuel2FINMaterialsDAO fuel2finDAO = new ENTravelSheetFuel2FINMaterialsDAO(connection, userProfile);
        	ENTravelSheetFuel2FINMaterialsFilter fuel2finFilter = new ENTravelSheetFuel2FINMaterialsFilter();
            fuel2finFilter.travelSheetFuelRef.code = fuel.code;
        	ENTravelSheetFuel2FINMaterialsShortList fuel2finList = fuel2finDAO.getScrollableFilteredList(fuel2finFilter, 0, -1);

        	BigDecimal q = new BigDecimal(0.0);

        	if (fuel2finList.totalCount > 0)
        	{
        	 for (int x=0;x<fuel2finList.totalCount;x++)
            	 {
            		 FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
            		 FINMaterials fin = finDAO.getObject(fuel2finList.get(x).finMaterialsRefCode);
            		 q = q.add(fin.quantity);
            	 }
        	 }

        	if (q.compareTo(fuel.countGen) != 0)
        	{
        		throw new SystemException("\n\nNET-4414 На підзвіті " + molCode + " немає достатньої кількості ПММ для видачі!");
        	}



	        /////
	        // Переводим ордер в статус "Проведенный"
	        fkOrder = fkOrderDAO.getObject(fkOrderCode);
	        fkOrder.status.code = RQFKOrderStatus.IN_FK;
	        fkOrderDAO.save(fkOrder);
	        /////

	        return fkOrderCode;


        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
	}

	public void removeRQFKOrderForTravelSheetFuel(ENTravelSheetFuel fuel) throws PersistenceException
	{
		try
		{
	        Context context = new InitialContext();

	        Object fkOrderRef = context.lookup(RQFKOrderController.JNDI_NAME);
	        RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject
	                .narrow(fkOrderRef, RQFKOrderControllerHome.class);
	        RQFKOrderController fkOrderController = fkOrderHome.create();

	        Object fkOrderItemRef = context.lookup(RQFKOrderItemController.JNDI_NAME);
	        RQFKOrderItemControllerHome fkOrderItemHome = (RQFKOrderItemControllerHome) PortableRemoteObject
	                .narrow(fkOrderItemRef, RQFKOrderItemControllerHome.class);
	        RQFKOrderItemController fkOrderItemController = fkOrderItemHome.create();

	        int fkOrderCode = Integer.MIN_VALUE;
	        int fkOrderItemCode = Integer.MIN_VALUE;
	        RQFKOrder fkOrder = null;

	        ENTravelSheetFuel2FINMaterialsDAO fuel2finMaterialsDAO = new ENTravelSheetFuel2FINMaterialsDAO(connection, userProfile);

        	ENTravelSheetFuel2FINMaterialsFilter fuel2finMaterialsFilter = new ENTravelSheetFuel2FINMaterialsFilter();
        	fuel2finMaterialsFilter.travelSheetFuelRef.code = fuel.code;
        	ENTravelSheetFuel2FINMaterialsShortList fuel2finMaterialsList = fuel2finMaterialsDAO.getScrollableFilteredList(fuel2finMaterialsFilter, 0, -1);

	        RQFKOrderItemDAO fkOrderItemDAO = new RQFKOrderItemDAO(connection, userProfile);
	        RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(connection, userProfile);

	        RQFKOrderItem2ENEstimateItemDAO oi2eiDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);

        	for (int i = 0; i < fuel2finMaterialsList.totalCount; i++)
        	{
	        	RQFKOrderItem2ENEstimateItemFilter oi2eiFilter = new RQFKOrderItem2ENEstimateItemFilter();
	        	oi2eiFilter.finMaterialsRef.code = fuel2finMaterialsList.get(i).finMaterialsRefCode;

	        	RQFKOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFilter, 0, -1);

	        	if (oi2eiList.totalCount == 0)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Помилка при видаленні строки з ордеру для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " ! (1)");
	        	}

	        	if (oi2eiList.totalCount > 1)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Помилка при видаленні строки з ордеру для видачі ПММ для подорожнього листа з кодом " + fuel.travelSheetRef.code + " ! (2)");
	        	}

	        	fkOrderItemCode = oi2eiList.get(0).fkOrderItemRefCode;

	        	RQFKOrderItem fkOrderItem = fkOrderItemDAO.getObject(fkOrderItemCode);

	        	if (fkOrderItem == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено строку ордера з кодом " + fkOrderItemCode + " !");
	        	}

	        	fkOrderCode = fkOrderItem.fkOrderRef.code;

	        	if (fkOrderCode == Integer.MIN_VALUE)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не вдалося визначити код ордера для строки з кодом " + fkOrderItemCode + " !");
	        	}

		        /////
		        // Перед удалением строки из ордера нужно перевести его в статус "Черновой"
		        fkOrder = fkOrderDAO.getObject(fkOrderCode);

	        	if (fkOrder == null)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4414 Не знайдено ордер з кодом " + fkOrderCode + " !");
	        	}

		        if (fkOrder.status.code != RQFKOrderStatus.GOOD)
		        {
		        	fkOrder.status.code = RQFKOrderStatus.GOOD;
		        	fkOrderDAO.save(fkOrder);
		        }
		        /////

		        // Удаляем связку
		        fuel2finMaterialsDAO.remove(fuel2finMaterialsList.get(i).code);

		        // Удаляем строку из ордера
		        fkOrderItemController.removeFuelReserve(fuel2finMaterialsList.get(i).finMaterialsRefCode, fkOrderCode);
	        }

        	if (fuel2finMaterialsList.totalCount > 0)
        	{
		        /////
		        // Смотрим, остались ли еще строки в ордере. Если остались - переводим его обратно в статус "Проведенный", иначе удаляем
		        RQFKOrderItemFilter fkOrderItemFilter = new RQFKOrderItemFilter();
		        fkOrderItemFilter.fkOrderRef.code = fkOrderCode;
		        int[] fkOrderItemArr = fkOrderItemDAO.getFilteredCodeArray(fkOrderItemFilter, 0, -1);

		        if (fkOrderItemArr.length > 0)
		        {
			        fkOrder = fkOrderDAO.getObject(fkOrderCode);
			        fkOrder.status.code = RQFKOrderStatus.IN_FK;
			        fkOrderDAO.save(fkOrder);
		        }
		        else
		        {
		        	fkOrderController.removeFuelReserve(fkOrderCode);
		        }
		        /////
        	}


        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }

	}


	/**

	 * @param departmentCode код подразделений со структуры по выдачем топлива .
	 * @param fueltype тип топлива
	 * @param decade декада (1-3)
	 * @param month месяц
	 * @param year год
	 * @param calcType тип расчета (для услуг, общие работы, вкб ип, вкб остальное, вртувд)
	 * @return суммарное кол-во в литрах запланированого топлива на декаду по услугам на сторону
	 * @throws PersistenceException
	 */
	public BigDecimal getCountPMMNpzPlan(int departmentCode ,int fueltype ,int decade , int month , int year , int calcType ) throws PersistenceException {
		PreparedStatement statement = null;
		ResultSet  resultSet =  null;
		try {

			BigDecimal out = new BigDecimal(0);

			String pDateStart = "."+month+"."+year;
			String pDateFinal = "."+month+"."+year;

			if (decade==1){
				pDateStart = "to_date('"+"1"+pDateStart+"','dd.MM.yyyy')";
				pDateFinal = "to_date('"+"10"+pDateFinal+"','dd.MM.yyyy')";
			} else
			  if (decade==2){
				 pDateStart = "to_date('"+"11"+pDateStart+"','dd.MM.yyyy')";
				 pDateFinal = "to_date('"+"20"+pDateFinal+"','dd.MM.yyyy')";
			} else
				if (decade==3){
					pDateStart = "to_date('"+"21"+pDateStart+"','dd.MM.yyyy')";
					pDateFinal = "last_day(to_date('"+"1"+pDateFinal+"','dd.MM.yyyy'))";
				}

		   String pFuelCodes = "";
		   if(fueltype == 75000000 ) {
			   pFuelCodes = "75000844";
		   } else
			   if(fueltype == 75000001 ) {
				   pFuelCodes = "500000120,500002447";
			   }  else
				   if(fueltype == 75000003 ) {
					   pFuelCodes = "75000843";
				   }



			String sql = " select  round(services_plan::numeric,2) as services_plan, /*1*/ \n" +
					"         round(current_repair_plan::numeric,2) as current_repair_plan, /*2*/ \n" +
					"         round(capital_repair_plan::numeric,2) as capital_repair_plan, /*3*/ \n" +
					"         round(maintenance_plan::numeric,2) as maintenance_plan, /*4*/ \n" +
					"         round(sbyt_plan::numeric,2) as sbyt_plan, /*5*/ \n" +
					"         round(other_plan::numeric,2) as other_plan, /*6*/ \n" +
					"         round(cap_build_ip_plan::numeric,2) as cap_build_ip_plan, /*7*/ \n" +
					"         round(cap_build_other_plan::numeric,2) as cap_build_other_plan, /*8*/ \n" +
					"         round(vrtu_plan::numeric,2) as vrtu_plan, /*9*/ \n" +
					"         round(avr_plan::numeric,2) as avr_plan, /*10*/ \n" +
					"         round(odg_plan::numeric,2) as odg_plan, /*11*/ \n" +
					"         depname, \n" +
					"         depcode, \n" +
					"         decode, \n" +
					"         ord \n" +
					" from ( \n" +
					" select depname, depcode , ord, transport_department,  mol_codes, \n" +
					" case when ord not in (0,-3) then null else dep_4_limit end as decode, \n" +
					" sum(services_plan) as services_plan,	 \n" +
					"         sum(current_repair_plan) as current_repair_plan,	 \n" +
					"         sum(capital_repair_plan) as capital_repair_plan,	 \n" +
					"         sum(maintenance_plan) as maintenance_plan,	 \n" +
					"         sum(sbyt_plan) as sbyt_plan,	 \n" +
					"         sum(other_plan) as other_plan,	 \n" +
					"         sum(cap_build_ip_plan) as cap_build_ip_plan,	 \n" +
					"         sum(cap_build_other_plan) as cap_build_other_plan,	 \n" +
					"         sum(vrtu_plan) as vrtu_plan,	 \n" +
					"         sum(avr_plan) as avr_plan,  \n" +
					"         sum(odg_plan) as odg_plan \n" +
					"  \n" +
					"  from \n" +
					"  \n" +
					" ( \n" +
					" select \n" +
					" case when transport_department = 10000 then \n" +
					"      case when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(70),','))::double precision)  then   'Апарат управління (СІЗПВ)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(71),','))::double precision)  then   'Апарат управління (СДТУ)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(73),','))::double precision)  then   'Апарат управління (СПС)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(79),','))::double precision)  then   'Апарат управління (СРЗА)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(91),','))::double precision)  then   'Апарат управління (СВЕМ)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(482),','))::double precision)  then  'Апарат управління (ХМВЕ)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(675),','))::double precision)  then  'Апарат управління (РБС)' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(775),','))::double precision)  then  'Апарат управління (СКЕМ)' \n" +
					"      else 'Апарат управління (ІНШЕ)' end \n" +
					" else (select name from endepartment d where d.code = q./*transport_department*/departmentrefcode/*SUPP-97016*/) end depname  , \n" +
					"  \n" +
					" case when transport_department = 10000 then \n" +
					"      case when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(70),','))::double precision)  then   70 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(71),','))::double precision)  then   71 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(73),','))::double precision)  then   73 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(79),','))::double precision)  then   79 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(91),','))::double precision)  then   91 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(482),','))::double precision)  then  482 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(675),','))::double precision)  then  675 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(775),','))::double precision)  then  775 \n" +
					"      else 3 end \n" +
					" else  (select d.code from endepartment d where d.code = q./*transport_department*/departmentrefcode/*SUPP-97016*/) end depcode  , \n" +
					"  \n" +
					" case when transport_department = 10000 then \n" +
					"      case when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(70),','))::double precision)  then   -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(71),','))::double precision)  then   -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(73),','))::double precision)  then   -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(79),','))::double precision)  then   -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(91),','))::double precision)  then   -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(482),','))::double precision)  then  -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(675),','))::double precision)  then  -2 \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(775),','))::double precision)  then  -2 \n" +
					"      else -2 end \n" +
					" else 0 end ord , \n" +
					"  \n" +
					"    case when q.staterefcode = 7 and q.typerefcode <> 2 and q.budgetrefcode not in (75000009, 75000011,500000040) then 'services' \n" +
					"         when q.staterefcode = 5 and q.typerefcode <> 2 and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) then 'current_repair' \n" +
					"         when q.staterefcode in (1,2) and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) and q.typerefcode <> 2 then 'capital_repair' \n" +
					"         when q.staterefcode = 3 and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) and  q.typerefcode <> 2 then 'maintenance' \n" +
					"         when q.staterefcode <> 7 and q.typerefcode <> 2 and q.budgetrefcode = 240000001 then 'sbyt' \n" +
					"         when q.staterefcode not in (1, 3, 5, 7, 2) and q.typerefcode <> 2  and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) then 'other' \n" +
					"         when q.typerefcode = 5 and q.budgetrefcode = 75000009 then 'cap_build_ip' \n" +
					"         when q.typerefcode not in (2, 5) and q.budgetrefcode = 75000009  then 'cap_build_other' \n" +
					"         when q.typerefcode <> 2 and q.budgetrefcode = 75000011 then 'vrtu' \n" +
					"         when q.typerefcode = 2  and q.budgetrefcode <> 500000040  then 'avr' \n" +
					"         when q.budgetrefcode = 500000040  then 'odg' \n" +
					"    else null \n" +
					"    end as report_column , \n" +
					"         case when q.kindcode = 3 and q.staterefcode = 7 and q.typerefcode <> 2 and q.budgetrefcode not in (75000009, 75000011,500000040) then countfact  \n" +
					" else 0 end as services_plan, \n" +
					"         case when q.kindcode = 3 and q.staterefcode = 5 and q.typerefcode <> 2 and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) then  \n" +
					" countfact else 0  end as current_repair_plan, \n" +
					"         case when q.kindcode = 3 and q.staterefcode in (1,2) and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) and q.typerefcode <> 2  \n" +
					" then countfact else 0 end as capital_repair_plan, \n" +
					"         case when q.kindcode = 3 and q.staterefcode = 3 and q.budgetrefcode not in (240000001, 75000009, 75000011,500000040) and  q.typerefcode <> 2 then  \n" +
					" countfact else 0 end  as maintenance_plan, \n" +
					"         case when q.kindcode = 3 and q.staterefcode <> 7 and q.typerefcode <> 2 and q.budgetrefcode = 240000001 then countfact else 0 end  as sbyt_plan, \n" +
					"         case when q.kindcode = 3 and q.staterefcode not in (1, 3, 5, 7, 2) and q.typerefcode <> 2  and q.budgetrefcode not in (240000001, 75000009,  \n" +
					" 75000011,500000040) then countfact else 0 end as other_plan, \n" +
					"         case when q.kindcode = 3 and q.typerefcode = 5 and q.budgetrefcode = 75000009 then countfact else 0 end as cap_build_ip_plan, \n" +
					"         case when q.kindcode = 3 and q.typerefcode not in (2, 5) and q.budgetrefcode = 75000009  then countfact else 0 end as cap_build_other_plan, \n" +
					"         case when q.kindcode = 3 and q.typerefcode <> 2 and q.budgetrefcode = 75000011 then countfact else 0 end as vrtu_plan, \n" +
					"         case when q.kindcode = 3 and q.typerefcode = 2  and q.budgetrefcode <> 500000040  then countfact else 0 end as avr_plan, \n" +
					"         case when q.kindcode = 3 and q.budgetrefcode = 500000040  then countfact else 0 end as odg_plan, \n" +
					"  \n" +
					"         transport_department, \n" +
					"  \n" ;
					String sql1 = "         case when transport_department = 10000 then \n" +
					"         case when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(70),','))::double precision)  then   '70' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(71),','))::double precision)  then   '71' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(73),','))::double precision)  then   '73' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(79),','))::double precision)  then   '79' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(91),','))::double precision)  then   '91' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(482),','))::double precision)  then  '482' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(675),','))::double precision)  then  '675' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown(775),','))::double precision)  then  '775' \n" +
					"           when departmentrefcode in (select array2items(string_to_array(getdepartmentcodesdown4pmm(3),','))::double precision)  then  '3' \n" +
					"           when departmentrefcode = 500000019 then '3' \n" +
					"           else '3' \n" +
					"           end \n" +
					"           else '' || transport_department || ''  end as dep_4_limit, \n" +
					"           materialrefcode, \n" +
					"  \n" +
					"            ( select string_agg(s.molkod,',') from enspravmol s \n" +
					"    where s.departmentcode in \n" +
					"   (select d.departmentcode from entransportdep2dep d where d.transportdepartmentcod = q.transport_department)  ) as mol_codes \n" +
					"  \n" +
					"  from \n" +
					"  \n" +
					" (select  pw.code as plan_code, \n" +
					" case when ei.kindrefcode = 1 and pw.kindcode = 4 then \n" +
					" (select sum(quantity) from finmaterials f where f.estimateitemrefcode = ei.code and f.statusrefcode = 1) \n" +
					" else ei.countfact end as countfact, \n" +
					" pw.kindcode as kindcode, \n" +
					"         pw.staterefcode as staterefcode, pw.typerefcode as typerefcode, pw.budgetrefcode as budgetrefcode, ei.materialrefcode, \n" +
					"   case when ei.kindrefcode = 2 then \n" +
					"   ( \n" +
					"   select treal.transportdepartmntrfcd \n" +
					"      from tktransportreal treal \n" +
					"     where treal.code = t.transportrealcode \n" +
					"   ) \n" +
					"   else \n" +
					"   ( \n" +
					"     select tdep.transportdepartmentcod \n" +
					"      from entransportdep2dep tdep \n" +
					"     where tdep.departmentcode = pw.departmentrefcode \n" +
					"   ) end \n" +
					"     as transport_department, \n" +
					"     pw.departmentrefcode  \n" +
					"     \n" +
					"  \n" +
					" from enplanwork pw,  enworkorder2enplanwork wo2pw, \n" +
					"      enestimateitem ei left join entransport2enestimate t2e on (ei.code = t2e.estimaterefcode) \n" +
					"                        left join entransportitem t on (t2e.transportrefcode = t.code) \n" +
					"                        left join entravlshttm2trnsprttm t2t on (t2t.transportitemrefcode = t.code) \n" +
					"                        left join enplanworkitem on (ei.planitemrefcode = enplanworkitem.code  ) \n" +
					" where pw.code = ei.planrefcode \n" +
					"   and pw.datestart between  " + pDateStart + " and " + pDateFinal + " \n" +
					"   and pw.kindcode in (3) \n" +
					"   and wo2pw.plancode = pw.code \n" +
					"   and ei.materialrefcode in (select array2items(string_to_array('"+pFuelCodes+"',','))::double precision) \n" +
					"   and ei.countfact > 0 \n" +
					"   and ((ei.kindrefcode = 1  and enplanworkitem.countgen > 0) or \n" +
					"   (ei.kindrefcode = 2 and t.transportrealcode is not null and t2t.code is not null and pw.kindcode = 4) \n" +
					"   or \n" +
					"   (ei.kindrefcode = 2 and t.transportrealcode is not null and pw.kindcode = 3 and enplanworkitem.countgen > 0) ) \n" +
					"  \n" +
					" ) as q \n" +
					"  \n" +
					"  \n" +
					" ) as base_q \n" +
					"  \n" +
					" group by  depname,depcode , ord, transport_department, dep_4_limit,  \n" +
					"            materialrefcode, mol_codes \n" +
					" order by ord, depname, transport_department \n" +
					"  \n" +
					" ) as q_p \n" +
					"  \n" +
					" where q_p.depcode =  " + departmentCode +
					"  \n" ;




			statement = connection.prepareStatement(sql + sql1);
			resultSet =  statement.executeQuery();

			if(resultSet.next()) {
				if (calcType == ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES ){
				out =  resultSet.getBigDecimal(1);
				}

				if (calcType == ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK ){
				out =  resultSet.getBigDecimal(2).add(resultSet.getBigDecimal(2)).add(resultSet.getBigDecimal(3)).add(resultSet.getBigDecimal(4)).add(resultSet.getBigDecimal(11)).add(resultSet.getBigDecimal(6));
				}
				if (calcType == ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP ){
				out =  resultSet.getBigDecimal(7)  ;
				}
				if (calcType == ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER ){
				out =   resultSet.getBigDecimal(8);
				}
				if (calcType == ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU ){
				out = resultSet.getBigDecimal(9);
				}

			}

			return out;
		} catch (SQLException e) {
			throw new PersistenceException("Could not getCountPMMNpzPlan", e);
		}
		finally {
			try {
                if(resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(statement != null) {
                    statement.close();
                }
            } catch (SQLException e1) {

                e1.printStackTrace();
            }
		}
	}

	/**
	 *
	 * Получить норму расхода для расчета потраченного топлива по данным из "СКТ Глобус"
	 *
	 * @param travelSheet путевой лист для получения нормы расход
	 * @param isMachineHours норма расхода для машиночасов (true) или километража (false)
	 * @return норма расхода на машиночасы (1 машиночас) или для пробега (на 100 км)
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public BigDecimal getNormRashodByGlobus(ENTravelSheet travelSheet, boolean isMachineHours) throws PersistenceException, DatasourceConnectException {

		ENTravelSheetFuelRemainsDAO fuelRemnsDao = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		GlobusLogic globusLogic = new GlobusLogic(getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE), userProfile);
		TravelSheetLogic travelSheetLogic = new TravelSheetLogic(connection, userProfile);

		BigDecimal sumMachineHoursGlobus = globusLogic.getMachineHoursStop(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
		BigDecimal distance = null;

		boolean isTraktor = (travelSheet.typeRef.code == ENTravelSheetType.TRAKTOR);

		if(!isTraktor) {
			distance = globusLogic.getDistance(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
		} else {
			distance = globusLogic.getMachineHoursMove(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
		}

		BigDecimal fuelLevel = globusLogic.getFuelLevel(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal, false);
		BigDecimal sumCountIn = new BigDecimal(0);
		BigDecimal sumCountStart = new BigDecimal(0);

		ENTravelSheetFuelRemainsFilter fuelRemainsFilter = new ENTravelSheetFuelRemainsFilter();
		fuelRemainsFilter.travelSheetRef.code = travelSheet.code;
		fuelRemainsFilter.travelSheetFuelTypeRef.code = ENTravelSheetFuelType.MAIN;

		int[] fuelRemainsCodes = fuelRemnsDao.getFilteredCodeArray(fuelRemainsFilter, 0, -1);

		for(int i = 0; i < fuelRemainsCodes.length; i++) {
			ENTravelSheetFuelRemains fuelRemains = fuelRemnsDao.getObject(fuelRemainsCodes[i]);
			sumCountIn = sumCountIn.add(fuelRemains.countGenIn);
			sumCountStart = sumCountStart.add(fuelRemains.countGenStart);
		}

		BigDecimal sumTotalSpent = sumCountStart.add(sumCountIn).subtract(fuelLevel);

		if(sumTotalSpent.compareTo(new BigDecimal(0)) < 0) {
			throw new EnergyproSystemException(String.format("Помилка - кількість порахованих витрат за датчиком палива менша ніж 0 (%f + %f - %f = %f л.) ",sumCountStart, sumCountIn,fuelLevel, sumTotalSpent));
		}

		BigDecimal sumMachineHoursItems = travelSheetLogic.getMachineHours(travelSheet.code, ENTravelSheetItemKind.FACT, Integer.MIN_VALUE);

		BigDecimal normRashod = null;

		BigDecimal machineHours = null;
		boolean isGlobusLess = false;
		if(sumMachineHoursItems.compareTo(sumMachineHoursGlobus) == 1) {
			machineHours = sumMachineHoursGlobus;
			isGlobusLess = true;
		} else {
			machineHours = sumMachineHoursItems;
		}

		if(sumMachineHoursItems.compareTo(new BigDecimal(0)) == 1) {
			BigDecimal machineHoursProportion = null;
			BigDecimal kilometrageProportion = null;

			if(isGlobusLess) {
				machineHoursProportion = globusLogic.getMachineHoursProportion(travelSheet);
			} else {
				BigDecimal overallMachineHours = globusLogic.getMachineHoursAll(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
				machineHoursProportion = sumMachineHoursItems.divide(overallMachineHours, 2, BigDecimal.ROUND_HALF_UP);
			}
			kilometrageProportion = new BigDecimal(1).subtract(machineHoursProportion);

			if(isMachineHours) {
				sumTotalSpent = sumTotalSpent.multiply(machineHoursProportion).setScale(2, BigDecimal.ROUND_HALF_UP);
				normRashod = sumTotalSpent.divide(machineHours, 2, BigDecimal.ROUND_HALF_UP);
			} else {
				sumTotalSpent = sumTotalSpent.multiply(kilometrageProportion).setScale(2, BigDecimal.ROUND_HALF_UP);
				if(!(distance != null && (distance.compareTo(new BigDecimal(0)) != 0))) {
					throw new EnergyproSystemException(String.format("Відсутні дані по пройденій відстані у СКТ \"Глобус\": %f", distance));
				}
				if(isTraktor) {
					normRashod = sumTotalSpent.divide(distance, 2, BigDecimal.ROUND_HALF_UP);
				} else {
					normRashod = (sumTotalSpent.multiply(new BigDecimal(100))).divide(distance, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
		} else {
			if(isMachineHours) {
				normRashod = new BigDecimal(0);
			} else {
				if(isTraktor) {
					normRashod = sumTotalSpent.divide(distance, 2, BigDecimal.ROUND_HALF_UP);
				} else {
					if(!(distance != null && (distance.compareTo(new BigDecimal(0)) != 0))) {
						throw new EnergyproSystemException(String.format("Відсутні дані по пройденій відстані у СКТ \"Глобус\": %f", distance));
					}
					normRashod = (sumTotalSpent.multiply(new BigDecimal(100))).divide(distance, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
		}

		return normRashod;
	}

	/**
	 *
	 * Корректировка остатков путевого листа после расчета последней строки
	 * для машин на которых установлен датчик топлива.
	 *
	 * @param travelSheet путевой лист
	 * @param travelSheetItem последняя рассчитуемая строка
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public void travelSheetFuelRemainsCorrectionWithGlobus(ENTravelSheet travelSheet, ENTravelSheetItem travelSheetItem) throws PersistenceException, DatasourceConnectException {

		ENTravelSheetFuelRemainsDAO fuelRemnsDao = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
		ENEstimateItemDAO estimateItemDao = new ENEstimateItemDAO(connection, userProfile);
		TKFuelTypeDAO fuelTypeDao = new TKFuelTypeDAO(connection, userProfile);
		GlobusLogic globusLogic = new GlobusLogic(getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE), userProfile);
		TransportLogic trLogic = new TransportLogic(connection, userProfile);
		    
		// Если не все маршруты разнесены, то выход
		if(getCountOfUnhandledTransportRoutes(travelSheetItem.planRef.code) > 0) {
			return;
		}

		int fuelCode = Integer.MIN_VALUE;
		Vector<ENTravelSheetFuelRemains> vecFuelRemains = new Vector<ENTravelSheetFuelRemains>();

		BigDecimal fuelLevelFinal = globusLogic.getFuelLevel(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal, false);
		TKTransportRealHistory history = trLogic.getHistory(travelSheet.transportReal.code, travelSheetItem.timeStart);

		ENTravelSheetFuelRemainsFilter fuelRemainsFilter = new ENTravelSheetFuelRemainsFilter();
		fuelRemainsFilter.travelSheetRef.code = travelSheet.code;
		fuelRemainsFilter.travelSheetFuelTypeRef.code = ENTravelSheetFuelType.MAIN;
		int[] fuelRemainsCodes = fuelRemnsDao.getFilteredCodeArray(fuelRemainsFilter, 0, -1);
		BigDecimal sumCountFinal = new BigDecimal(0);
		for(int i = 0; i < fuelRemainsCodes.length; i++) {
			ENTravelSheetFuelRemains fuelRemains = fuelRemnsDao.getObject(fuelRemainsCodes[i]);
			vecFuelRemains.add(fuelRemains);
			sumCountFinal = sumCountFinal.add(fuelRemains.countGenFinal);
			fuelCode = fuelRemains.fuelTypeRef.code;
		}

		Vector<ENEstimateItem> generatedEstimates = null;
		if(history.hasStarter == TKTransportRealHasStarter.YES) {
			generatedEstimates = getGeneratedEstimateItemsByTravelSheetItemCode(travelSheetItem.code, fuelCode);
		} else {
			generatedEstimates = getGeneratedEstimateItemsByTravelSheetItemCode(travelSheetItem.code, Integer.MIN_VALUE);
		}

		if(generatedEstimates == null || generatedEstimates.size() == 0) {
			throw new EnergyproSystemException("Помилка у кількості ПММ для списання");
		}


		if(fuelLevelFinal.compareTo(sumCountFinal) == 0) {
			// если остатки из глобуса равны остаткам по путевому, то ничего не делается
			return;
		} else {
			if(fuelLevelFinal.compareTo(sumCountFinal) > 0) {
				// если остаток из глобуса, больше чем остаток по путевому
				throw new EnergyproSystemException(String.format("Залишок у глобусі (%s л.) більше ніж залишок у подорожньому листі (%s л.)", fuelLevelFinal, sumCountFinal));
			} else if(fuelLevelFinal.compareTo(sumCountFinal) < 0) {
				BigDecimal _delta = sumCountFinal.subtract(fuelLevelFinal);
				if(fuelRemainsCodes.length == 1) {
					ENEstimateItem estimate = generatedEstimates.get(0);
					estimate.countGen = estimate.countGen.add(_delta);
					estimate.countFact = estimate.countFact.add(_delta);
					estimate.commentGen += String.format(" коригування з даними із СКТ \"Глобус\" (%s л.)", _delta);
					estimateItemDao.save(estimate);
				} else {
					while(_delta.compareTo(new BigDecimal(0)) == 1) {
						for(ENTravelSheetFuelRemains fuelRemains : vecFuelRemains) {
							TKFuelType fuelType = fuelTypeDao.getObject(fuelRemains.fuelTypeRef.code);
							if(fuelRemains.countGenFinal.compareTo(_delta) >= 0) {
								// Если один из остатков по путевому больше разницы, то к расходу добавляется разница
								for(ENEstimateItem estimate : generatedEstimates) {
									if(estimate.materialRef.code == fuelType.materialRef.code) {
										generatedEstimates.remove(generatedEstimates.indexOf(estimate));
										vecFuelRemains.remove(vecFuelRemains.indexOf(fuelRemains));
										estimate.countFact = estimate.countFact.add(_delta);
										estimate.countGen = estimate.countGen.add(_delta);
										estimate.commentGen += String.format(" коригування з даними із СКТ \"Глобус\" (%s л.)", _delta);
										_delta = new BigDecimal(0);
										estimateItemDao.save(estimate);
										break;
									}
								}
								break;
							} else {
								// Если один из остатков по путевому меньше разницы, то к расходу добавляется этот остаток
								for(ENEstimateItem estimate : generatedEstimates) {
									if(estimate.materialRef.code == fuelType.materialRef.code) {
										generatedEstimates.remove(generatedEstimates.indexOf(estimate));
										vecFuelRemains.remove(vecFuelRemains.indexOf(fuelRemains));
										estimate.countFact = estimate.countFact.add(fuelRemains.countGenFinal);
										estimate.countGen = estimate.countGen.add(fuelRemains.countGenFinal);
										estimate.commentGen += String.format(" коригування з даними із СКТ \"Глобус\" (%s л.)", fuelRemains.countGenFinal);
										_delta = _delta.subtract(fuelRemains.countGenFinal);
										estimateItemDao.save(estimate);
										break;
									}
								}
							}
						}
					}
				}

			}
		}

		this.updateRemainderOUT(travelSheet.code);
	}

	/**
	 *
	 * Получить массив эстимейтов для списания топлива, которые сгенерировались по строке путевого
	 *
	 * @param travelSheetItemCode код строки путевого
	 * @param fuelTypeCode код топлива или Integer.MIN_VALUE
	 * @return массив эстимейтов
	 * @throws PersistenceException
	 */
	public Vector<ENEstimateItem> getGeneratedEstimateItemsByTravelSheetItemCode(int travelSheetItemCode, int fuelTypeCode) throws PersistenceException {
		Vector<ENEstimateItem> vec = new Vector<ENEstimateItem>();
		ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
		ENTransport2ENEstimateDAO transport2EstimateDao = new ENTransport2ENEstimateDAO(connection, userProfile);
		ENTravelSheetItem2TransportItemDAO travelSheetItem2TransportItemDao = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);

		ENTravelSheetItem2TransportItemFilter travelSheetItem2TransportItemFilter = new ENTravelSheetItem2TransportItemFilter();
		travelSheetItem2TransportItemFilter.travelSheetItemRef.code = travelSheetItemCode;

		ENTravelSheetItem2TransportItemShortList travelSheetItem2TransportItemList =  travelSheetItem2TransportItemDao.getScrollableFilteredList(travelSheetItem2TransportItemFilter, 0, -1);

		String strCodes = "";

		if(travelSheetItem2TransportItemList.totalCount != 0) {
			for(int i = 0; i < travelSheetItem2TransportItemList.totalCount; i++) {
				strCodes += ((strCodes.length() == 0) ? "" : ", ") + travelSheetItem2TransportItemList.get(i).transportItemRefCode;
			}
			ENTransport2ENEstimateFilter transport2EstimateFilter = new ENTransport2ENEstimateFilter();
			transport2EstimateFilter.conditionSQL = ENTransport2ENEstimate.transportRef_QFielld + " IN (" + strCodes + ")";
			ENTransport2ENEstimateShortList transport2EstimateList = transport2EstimateDao.getScrollableFilteredList(transport2EstimateFilter, 0, -1);
			strCodes = "";
			if(transport2EstimateList.totalCount != 0) {
				for(int i = 0; i < transport2EstimateList.totalCount; i++) {
					strCodes += ((strCodes.length() == 0) ? "" : ", ") + transport2EstimateList.get(i).estimateRefCode;
				}

				ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
				if(fuelTypeCode != Integer.MIN_VALUE) {
					TKFuelTypeDAO fuelTypeDao = new TKFuelTypeDAO(connection, userProfile);
					TKFuelType fuelType = fuelTypeDao.getObject(fuelTypeCode);
					estimateItemFilter.materialRef.code = fuelType.materialRef.code;
				}

				estimateItemFilter.conditionSQL = ENEstimateItem.code_QFielld + " IN (" + strCodes + ")";
				int[] estimateCodes = estimateDao.getFilteredCodeArray(estimateItemFilter, 0, -1);
				for(int estimateCode : estimateCodes) {
					ENEstimateItem estimate = estimateDao.getObject(estimateCode);
					vec.add(estimate);
				}
			}
		}

		return vec;
	}



}
