package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;

import com.ksoe.energynet.dataminer.ENAccumulatorsDAO;
import com.ksoe.energynet.dataminer.ENAccumulatorsDistanceDAO;
import com.ksoe.energynet.dataminer.ENAccumulatorsHistoryDAO;
import com.ksoe.energynet.dataminer.ENAutoTiresDAO;
import com.ksoe.energynet.dataminer.ENAutoTiresDistanceDAO;
import com.ksoe.energynet.dataminer.ENAutoTiresHistoryDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.valueobject.ENAccumulatorStatus;
import com.ksoe.energynet.valueobject.ENAccumulators;
import com.ksoe.energynet.valueobject.ENAccumulatorsDistance;
import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.ENAutoTiresHistory;
import com.ksoe.energynet.valueobject.ENTiresInstallPlaces;
import com.ksoe.energynet.valueobject.ENTiresInstallStatus;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

public class AutoTiresLogic extends LogicModule {

	public AutoTiresLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	public void addDistance(ENTravelSheet travelSheet)
			throws PersistenceException {

		double dist = 0;

		/* для БКУ пробег из факта */
		if (travelSheet.transportReal.transportmark.transporttype.code == ENConsts.BKU || 
				travelSheet.transportReal.transportmark.transporttype.code == ENConsts.TRAKTOR) {
			ENTravelSheetItemDAO iDao = new ENTravelSheetItemDAO(connection, userProfile);
			ENTravelSheetItemShortList iList = iDao.getListForFact(travelSheet.code);

			if (iList.totalCount > 0) {
				for (int i = 0; i < iList.totalCount; i++) {
					dist = new BigDecimal(dist).add(iList.get(i).sumDistances).doubleValue();
				}
			}

		} else {
			dist = (travelSheet.speedometerFinal.subtract(travelSheet.speedometerStart)).doubleValue();
		}

		ENAutoTiresDAO tDAO = new ENAutoTiresDAO(connection, userProfile);
		ENAutoTiresHistoryDAO thDAO = new ENAutoTiresHistoryDAO(connection, userProfile);
		ENAutoTiresDistanceDAO tdDAO = new ENAutoTiresDistanceDAO(connection, userProfile);

		ENAutoTiresHistoryFilter thFilter = new ENAutoTiresHistoryFilter();
		thFilter.transportRealRef.code = travelSheet.transportReal.code;
		thFilter.conditionSQL = " enautotires.installstatusrefcode = " + ENTiresInstallStatus.YES
			+ " and enautotireshistory.installplacesrefcode <> " + ENTiresInstallPlaces.ZAPAS
			+ " and enautotireshistory.uninstalldate is null";

		ENAutoTiresHistoryShortList thList = thDAO.getScrollableFilteredList(thFilter, 0, -1);

		if (thList.totalCount > 0) {
			for (int i = 0; i < thList.totalCount; i++) {
				if (travelSheet.dateFinal.compareTo(thList.get(i).installDate)>=0) {
					ENAutoTires tires = tDAO.getObject(thList.get(i).tiresRefCode);
					tires.distanceAll = tires.distanceAll.add(new BigDecimal(dist));
					tDAO.save(tires);

					ENAutoTiresHistory tH = thDAO.getObject(thList.get(i).code);
					tH.distance = tH.distance.add(new BigDecimal(dist));
					thDAO.save(tH);

					ENAutoTiresDistance tDistance = new ENAutoTiresDistance();
					tDistance.recordDistance = new BigDecimal(dist);
					tDistance.recordtDate = travelSheet.dateFinal;
					tDistance.tiresRef.code = thList.get(i).tiresRefCode;
					tDistance.transportRealRef.code = travelSheet.transportReal.code;
					tDistance.travelSheetRef.code = travelSheet.code;
					tdDAO.add(tDistance);
				}
			}
		}
	}

	public void undoDistance(ENTravelSheet travelSheet)
			throws PersistenceException {

		double dist = 0;

		/* для БКУ пробег из факта */
		if (travelSheet.transportReal.transportmark.transporttype.code == ENConsts.BKU || 
				travelSheet.transportReal.transportmark.transporttype.code == ENConsts.TRAKTOR)  {
			ENTravelSheetItemDAO iDao = new ENTravelSheetItemDAO(connection, userProfile);
			ENTravelSheetItemShortList iList = iDao.getListForFact(travelSheet.code);

			if (iList.totalCount > 0) {
				for (int i = 0; i < iList.totalCount; i++) {
					dist = new BigDecimal(dist).add(iList.get(i).sumDistances).doubleValue();
				}
			}

		} else {
			dist = (travelSheet.speedometerFinal.subtract(travelSheet.speedometerStart)).doubleValue();
		}

		ENAutoTiresDAO tDAO = new ENAutoTiresDAO(connection, userProfile);
		ENAutoTiresDistanceDAO tdDAO = new ENAutoTiresDistanceDAO(connection, userProfile);

		ENAutoTiresDistanceFilter tdFilter = new ENAutoTiresDistanceFilter();
		tdFilter.travelSheetRef.code = travelSheet.code;

		ENAutoTiresDistanceShortList tdList = tdDAO.getScrollableFilteredList(tdFilter, 0, -1);

		if (tdList.totalCount > 0) {
			for (int i = 0; i < tdList.totalCount; i++) {
				ENAutoTires tires = tDAO.getObject(tdList.get(i).tiresRefCode);
				tires.distanceAll = tires.distanceAll.subtract(tdList.get(i).recordDistance);
				tDAO.save(tires);

				tdDAO.remove(tdList.get(i).code);
			}
		}

		ENAutoTiresHistoryDAO thDAO = new ENAutoTiresHistoryDAO(connection, userProfile);

		ENAutoTiresHistoryFilter thFilter = new ENAutoTiresHistoryFilter();
		thFilter.transportRealRef.code = travelSheet.transportReal.code;
		thFilter.conditionSQL = " enautotires.installstatusrefcode = " + ENTiresInstallStatus.YES
			+ " and enautotireshistory.installplacesrefcode <> " + ENTiresInstallPlaces.ZAPAS
			+ " and enautotireshistory.uninstalldate is null";

		ENAutoTiresHistoryShortList thList = thDAO.getScrollableFilteredList(thFilter, 0, -1);
		if (thList.totalCount > 0) {
			for (int r = 0; r < thList.totalCount; r++) {
				if (travelSheet.dateFinal.compareTo(thList.get(r).installDate)>=0) {
					ENAutoTiresHistory tH = thDAO.getObject(thList.get(r).code);
					tH.distance = tH.distance.subtract(new BigDecimal(dist));
					thDAO.save(tH);
				}
			}
		}
	}

	public void addDistanceAc(ENTravelSheet travelSheet)
			throws PersistenceException {

		double dist = 0;

		/* м/час для аккумуляторов из факта */
		ENTravelSheetItemDAO iDao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemShortList iList = iDao.getListForFact(travelSheet.code);

		if (iList.totalCount > 0) {
			for (int i = 0; i < iList.totalCount; i++) {
				dist = new BigDecimal(dist).add(iList.get(i).sumMachineHours).doubleValue();
			}
		}

		ENAccumulatorsDAO aDAO = new ENAccumulatorsDAO(connection, userProfile);
		ENAccumulatorsHistoryDAO ahDAO = new ENAccumulatorsHistoryDAO(connection, userProfile);
		ENAccumulatorsDistanceDAO adDAO = new ENAccumulatorsDistanceDAO(connection, userProfile);

		ENAccumulatorsHistoryFilter ahFilter = new ENAccumulatorsHistoryFilter();
		ahFilter.transportRealRef.code = travelSheet.transportReal.code;
		ahFilter.conditionSQL = " enaccumulators.installstatusrefcode = " + ENAccumulatorStatus.YES
				+ " and enaccumulatorshistory.uninstalldate is null";

		ENAccumulatorsHistoryShortList ahList = ahDAO.getScrollableFilteredList(ahFilter, 0, -1);

		if (ahList.totalCount > 0) {
			for (int i = 0; i < ahList.totalCount; i++) {
				if (travelSheet.dateFinal.compareTo(ahList.get(i).installDate) >= 0) {
					ENAccumulators acc = aDAO.getObject(ahList.get(i).accumulatorsRefCode);
					acc.mileageAll = acc.mileageAll.add(new BigDecimal(dist));
					aDAO.save(acc);

					ENAccumulatorsHistory acH = ahDAO.getObject(ahList.get(i).code);
					acH.distance = acH.distance.add(new BigDecimal(dist));
					ahDAO.save(acH);

					ENAccumulatorsDistance aDistance = new ENAccumulatorsDistance();
					aDistance.recordDistance = new BigDecimal(dist);
					aDistance.recordtDate = travelSheet.dateFinal;
					aDistance.accumulatorsRef.code = ahList.get(i).accumulatorsRefCode;
					aDistance.transportRealRef.code = travelSheet.transportReal.code;
					aDistance.travelSheetRef.code = travelSheet.code;
					adDAO.add(aDistance);
				}
			}
		}
	}

	public void undoDistanceAc(ENTravelSheet travelSheet)
			throws PersistenceException {

		double dist = 0;

		/* м/час для аккумуляторов из факта */
		ENTravelSheetItemDAO iDao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemShortList iList = iDao.getListForFact(travelSheet.code);

		if (iList.totalCount > 0) {
			for (int i = 0; i < iList.totalCount; i++) {
				dist = new BigDecimal(dist).add(iList.get(i).sumMachineHours).doubleValue();
			}
		}

		ENAccumulatorsDAO aDAO = new ENAccumulatorsDAO(connection, userProfile);
		ENAccumulatorsDistanceDAO adDAO = new ENAccumulatorsDistanceDAO(connection, userProfile);

		ENAccumulatorsDistanceFilter adFilter = new ENAccumulatorsDistanceFilter();
		adFilter.travelSheetRef.code = travelSheet.code;

		ENAccumulatorsDistanceShortList adList = adDAO.getScrollableFilteredList(adFilter, 0, -1);

		if (adList.totalCount > 0) {
			for (int i = 0; i < adList.totalCount; i++) {
				ENAccumulators acm = aDAO.getObject(adList.get(i).accumulatorsRefCode);
				acm.mileageAll = acm.mileageAll.subtract(adList.get(i).recordDistance);
				aDAO.save(acm);

				adDAO.remove(adList.get(i).code);
			}
		}

		ENAccumulatorsHistoryDAO ahDAO = new ENAccumulatorsHistoryDAO(connection, userProfile);

		ENAccumulatorsHistoryFilter ahFilter = new ENAccumulatorsHistoryFilter();
		ahFilter.transportRealRef.code = travelSheet.transportReal.code;
		ahFilter.conditionSQL = " enaccumulators.installstatusrefcode = " + ENAccumulatorStatus.YES
				+ " and enaccumulatorshistory.uninstalldate is null";

		ENAccumulatorsHistoryShortList ahList = ahDAO.getScrollableFilteredList(ahFilter, 0, -1);
		if (ahList.totalCount > 0) {
			for (int r = 0; r < ahList.totalCount; r++) {
				if (travelSheet.dateFinal.compareTo(ahList.get(r).installDate) >= 0) {
					ENAccumulatorsHistory aH = ahDAO.getObject(ahList.get(r).code);
					aH.distance = aH.distance.subtract(new BigDecimal(dist));
					ahDAO.save(aH);
				}
			}
		}
	}

}
