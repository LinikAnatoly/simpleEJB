package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENElementTypeDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistanceDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.ENTravelSheetItemController;
import com.ksoe.energynet.ejb.ENTravelSheetItemControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENElementTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelRemainsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.valueobject.TKFuelCalcType;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.brief.TKFuelTypeShort;

public class TravelSheetLogic extends LogicModule{

	public ENTravelSheet getTravelSheetByEstimateItemCode(int estimateItemCode) throws PersistenceException
	{
		ENTravelSheet out = null;

		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);
		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.conditionSQL = "entravelsheet.code in (select t.code from entravelsheet t, entravelsheetitem ti, entravlshttm2trnsprttm t2t " +
						" , entransport2enestimate t2e where " +
						"t.code = ti.travelsheetrefcode and ti.code = t2t.travelsheetitemrefcode "+
						" and t2t.transportitemrefcode = t2e.transportrefcode "+
						" and t2e.estimaterefcode = "+ estimateItemCode +")";
		int[] arr = dao.getFilteredCodeArray(f, 0, -1, false);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}
		return out;
	}

	/**
	 *
	 * Получает строку путевого листа по коду эстимейта
	 *
	 * @param estimateItemCode код эстимейта
	 * @return строку путевого или null если таковая не найдена
	 * @throws PersistenceException
	 */
	public ENTravelSheetItem getTravelSheetItemByEstimateItemCode(int estimateItemCode) throws PersistenceException
	{
		ENTravelSheetItem out = null;

		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
		f.conditionSQL = " EXISTS (select t2e.code from entransport2enestimate as t2e "
				+ " inner join entravlshttm2trnsprttm as t2t on t2t.transportitemrefcode = t2e.transportrefcode "
				+ " where t2t.travelsheetitemrefcode = "
				+ ENTravelSheetItem.code_QFielld
				+ " and t2e.estimaterefcode = " + estimateItemCode + ")";
		int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}
		return out;
	}
	
	public ENTravelSheet getPrevSheet(ENTravelSheet travelSheet) throws PersistenceException
	{
		ENTravelSheet out = null;

		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);

		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.transportReal.code = travelSheet.transportReal.code;

		//Vector v = new Vector();
		//v.add(travelSheet.timeStart);

		f.conditionSQL = " timefinal <= " +
			" to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(travelSheet.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss') \n";

		if (travelSheet.code > Integer.MIN_VALUE)
			f.conditionSQL = f.conditionSQL + " and code <> " + travelSheet.code;

		//f.orderBySQL = ENTravelSheet.dateFinal_QFielld + " desc, cast(to_char("+ ENTravelSheet.timeFinal_QFielld +", 'HHMI') as integer) desc" ;
		f.orderBySQL = ENTravelSheet.timeFinal_QFielld + " desc";
		int[] arr = dao.getFilteredCodeArray(f, f.conditionSQL, f.orderBySQL, 0, 1, null);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}

		return out;
	}


	public ENTravelSheet updateNextSheet(ENTravelSheet travelSheet) throws PersistenceException
	{

		ENTravelSheet nextTravelSheet = getNextSheet(travelSheet);
		if (nextTravelSheet == null) return null;

		// лучше сверим сходу ...
		//if ((nextTravelSheet.statusRef.code == ENTravelSheetStatus.GOOD ) || (nextTravelSheet.statusRef.code == ENTravelSheetStatus.PLAN))

			boolean isEdit = false;
			if (nextTravelSheet.speedometerStart == null){
				nextTravelSheet.speedometerStart = travelSheet.speedometerFinal;
				isEdit = true;
			}
			else{
				if (nextTravelSheet.speedometerStart.doubleValue() != travelSheet.speedometerFinal.doubleValue()){
					// 22.11.2011 NET-969 Для тракторов обнулять показания спидометра
					// Пропускаем эту проверку (в переходный период она давала бы ложные сработки)
					if (travelSheet.typeRef.code != ENTravelSheetType.TRAKTOR){
						throw new EnergyproSystemException("Не співпадають кінцеві показники спидометра у ПЛ № "+ travelSheet.numberGen +" з початковими у ПЛ № " + nextTravelSheet.numberGen);
					}
				}
			}

			if (nextTravelSheet.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER ){
				if (nextTravelSheet.fuelCounterStart == null)
				{
					if ( travelSheet.fuelCounterFinal == null && travelSheet.statusRef.code > ENTravelSheetStatus.PLAN) 
						 throw new EnergyproSystemException("Кінцеві показники лічільника палива не знайдено у ПЛ № " + travelSheet.numberGen);

					nextTravelSheet.fuelCounterStart = travelSheet.fuelCounterFinal;
					isEdit = true;
				}
				else
				if (nextTravelSheet.fuelCounterStart.doubleValue() != travelSheet.fuelCounterFinal.doubleValue()){
					throw new EnergyproSystemException("Не співпадають кінцеві показники лічільника пального у ПЛ № "+ travelSheet.numberGen +" з початковими у ПЛ № " + nextTravelSheet.numberGen);
				}
			}

			if (isEdit){
				ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);
				dao.save(nextTravelSheet);
			}

			// ОСТАТОК на следующий  креатится ..
			// там же выдача в созданный остаток !!!
			//fuelLogic.updateNextRemainder(travelSheet, nextTravelSheet);
			return nextTravelSheet;
	}

	public ENTravelSheet getNextSheet(ENTravelSheet travelSheet) throws PersistenceException
	{
		ENTravelSheet out = null;

		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);

		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.transportReal.code = travelSheet.transportReal.code;

		//Vector v = new Vector();
		//v.add(travelSheet.timeFinal);

		f.conditionSQL = " timestart >=  " +
			" to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(travelSheet.timeFinal).toString() + "','dd.mm.yyyy hh24:mi:ss') \n";

		if (travelSheet.code > Integer.MIN_VALUE)
			f.conditionSQL = f.conditionSQL + " and code <> " + travelSheet.code;

		//f.orderBySQL = ENTravelSheet.dateStart_QFielld + ", cast(to_char("+ ENTravelSheet.timeStart_QFielld +", 'HHMI') as integer)" ;
		f.orderBySQL = ENTravelSheet.timeFinal_QFielld;

		int[] arr = dao.getFilteredCodeArray(f, f.conditionSQL, f.orderBySQL, 0, 1, null);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}

		return out;
	}


	public ENTravelSheet getLastSheet(ENTravelSheet travelSheet) throws PersistenceException
	{
		ENTravelSheet out = null;

		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);

		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.transportReal.code = travelSheet.transportReal.code;


		if (travelSheet.code > Integer.MIN_VALUE)
			f.conditionSQL = " code <> " + travelSheet.code;

		//f.orderBySQL = ENTravelSheet.dateStart_QFielld + " desc, cast(to_char("+ ENTravelSheet.timeStart_QFielld +", 'HHMI') as integer) desc" ;
		f.orderBySQL = ENTravelSheet.timeFinal_QFielld + " desc";

		int[] arr = dao.getFilteredCodeArray(f, 0, 1);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}

		return out;
	}

	/**
	 *
	 * Ищет последний путевой в период между двумя датами
	 *
	 * Период не ограничивается по дате, если в параметре был послан <b>null</b>
	 *
	 * @param transportRealCode код транспорта из <b>TKTransportReal</b>
	 * @param timeStart   дата начала периода
	 * @param timeFinal   дата конца периода
	 * @return Последний путевой лист для транспорта с кодом transportRealCode ENTravelSheet
	 * @throws PersistenceException
	 */
	public ENTravelSheet getLastSheet(int transportRealCode, Date timeStart, Date timeFinal) throws PersistenceException
	{
		ENTravelSheet out = null;

		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);

		String conditionSQL = "";

		if(timeStart != null)
			conditionSQL = conditionSQL + "ENTRAVELSHEET.TIMEFINAL >= to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(timeStart).toString()+"','dd.mm.yyyy hh24:mi:ss') ";

		if(timeFinal != null)
		{
			Calendar dd = Calendar.getInstance();
			dd.setTime(timeFinal);
			dd.set(Calendar.HOUR, 23);
			dd.set(Calendar.MINUTE, 59);
			dd.set(Calendar.SECOND, 0);

			if(conditionSQL.length() != 0)
				conditionSQL = conditionSQL + " AND ENTRAVELSHEET.TIMEFINAL <= to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(dd.getTime()).toString()+"', 'dd.mm.yyyy hh24:mi:ss')";
			else
				conditionSQL = " ENTRAVELSHEET.TIMEFINAL <= to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(dd.getTime()).toString()+"' ";
		}

		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.transportReal.code = transportRealCode;
		f.conditionSQL = conditionSQL;

		//f.orderBySQL = ENTravelSheet.dateStart_QFielld + " desc, cast(to_char("+ ENTravelSheet.timeStart_QFielld +", 'HHMI') as integer) desc" ;
		f.orderBySQL = ENTravelSheet.timeFinal_QFielld + " desc";

		int[] arr = dao.getFilteredCodeArray(f, 0, 1);
		if (arr.length > 0){
			out = dao.getObject(arr[0]);
		}

		return out;
	}

	public void checkUniqueSheet(ENTravelSheet travelSheet) throws PersistenceException
	{
		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);

		ENTravelSheetFilter f = new ENTravelSheetFilter();
		f.transportReal.code = travelSheet.transportReal.code;

		/*/ горбатое ...
		f.dateStart = travelSheet.dateStart;
		// типа уникальный с датой конца ...
		f.dateFinal = travelSheet.dateFinal;
		if (travelSheet.code != Integer.MIN_VALUE){
			f.conditionSQL = " entravelsheet.code <> " + travelSheet.code;
		}

		ENTravelSheetShortList l = dao.getScrollableFilteredList(f, 0, -1);

		// конец горбатого ;)*/

		// ПРИМЕР еще бы время как то подкрутить ...
		//f.conditionSQL = "(('09.04.2011 19:00' BETWEEN t.timestart and t.timefinal and '09.04.2011 19:00' <> t.timefinal)" +
		//				 "or ('10.04.2011 07:00' BETWEEN t.timestart and t.timefinal and '10.04.2011 07:00' <> t.timestart))";

		//* полугорбатое ...
		String timeStart = new SimpleDateFormat("dd.MM.yyyy HH:mm").format(travelSheet.timeStart);
		String timeFinal = new SimpleDateFormat("dd.MM.yyyy HH:mm").format(travelSheet.timeFinal);

		f.conditionSQL = "(('"+ timeStart +"' BETWEEN entravelsheet.timestart and entravelsheet.timefinal and '"+ timeStart +"' <> entravelsheet.timefinal) " +
						 " or ('"+ timeFinal +"' BETWEEN entravelsheet.timestart and entravelsheet.timefinal and '"+ timeFinal +"' <> entravelsheet.timestart))";

		//Vector v = new Vector();
		//v.add(travelSheet.timeStart);
		//v.add(travelSheet.timeStart);
		//v.add(travelSheet.timeFinal);
		//v.add(travelSheet.timeFinal);


		if (travelSheet.code != Integer.MIN_VALUE){
			f.conditionSQL = f.conditionSQL + " and entravelsheet.code <> " + travelSheet.code;
		}

		ENTravelSheetShortList l = dao.getScrollableFilteredList(f, 0, -1);

		//конец полугорбатого ...
		//*/





		if ( l.totalCount > 0 ){
			throw new EnergyproSystemException("На цю дату для цього транспорту ( "+ l.get(0).transportRealGosNumber+" ) вже є подорожній лист з номером " + l.get(0).numberGen);
		}
	}

	public void changeStatusTravelSheet(int travelSheetCode) throws PersistenceException
	{
		ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(connection, userProfile);
    	ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
    	f.travelSheetRef.code = travelSheetCode;
    	int[] arr = itemDAO.getFilteredCodeArray(f, 0, -1);
    	if (arr.length == 0){
    		ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
    		ENTravelSheet ts = tsDAO.getObject(travelSheetCode);
    		ts.statusRef.code = ENTravelSheetStatus.GOOD;
    		ts.dateEdit = new Date();
    		ts.userGen = userProfile.userName;
    		tsDAO.save(ts);
    	}
	}

	public boolean chkTimes(Date startTime, Date finalTime, boolean isException)
	{
		boolean out = true;
		if (( startTime != null) && (finalTime != null)){
			if (startTime.after(finalTime)){
				if (isException){
					throw new EnergyproSystemException("Дата/Час початку не повинен переищувати дату/час закінчення ...");
				}
				out = false;
			}
		}
		return out;
	}
	
	public boolean chkTravelSheetItemsTimes(Date travelItemStartTime, Date travelItemFinalTime, Date travelSheetStartTime, Date travelSheetFinalTime, boolean isException)
	{
		boolean out = true;
		if (( travelItemStartTime != null) && (travelItemFinalTime != null) && (travelSheetStartTime != null) && (travelSheetFinalTime != null)){
			if (travelItemStartTime.after(travelItemFinalTime)){
				if (isException){
					throw new EnergyproSystemException("Дата/Час початку не повинен переищувати дату/час закінчення");
				}
				out = false;
			} else
			if (travelSheetStartTime.after(travelItemStartTime)) {
				if (isException){
					throw new EnergyproSystemException("Дата/Час початку строки подорожнього листа не повинен переищувати дату/час початку подорожнього листа");
				}
				out = false;
			} else 
			if (travelItemFinalTime.after(travelSheetFinalTime)) {
				if (isException){
					throw new EnergyproSystemException("Дата/Час закінчення строки подорожнього листа не повинен переищувати дату/час закінчення подорожнього листа");
				}
				out = false;
			}
		}
		return out;
	}

	public boolean chkSpeedometer(BigDecimal startVal, BigDecimal finalVal, String deviceType, boolean isException)
	{
		startVal = startVal.setScale(3, BigDecimal.ROUND_HALF_UP);
		finalVal = finalVal.setScale(3, BigDecimal.ROUND_HALF_UP);

		boolean out = true;
		if ( finalVal.doubleValue() < startVal.doubleValue()){
			if ( isException ) {
				throw new EnergyproSystemException("Показники " + deviceType + " при виїзді повінні бути меньші, за показники при поверненні ?? ", userProfile);
			}
			out = false;
		}
		return out;
	}

	public boolean chkDistance(BigDecimal startVal, BigDecimal finalVal, BigDecimal distance, boolean isException){
		boolean out = true;
		startVal = startVal.setScale(3, BigDecimal.ROUND_HALF_UP);
		finalVal = finalVal.setScale(3, BigDecimal.ROUND_HALF_UP);
		distance = distance.setScale(3, BigDecimal.ROUND_HALF_UP);

		BigDecimal q = finalVal.subtract(startVal).setScale(3, BigDecimal.ROUND_HALF_UP);
		if ( q.doubleValue() != distance.doubleValue() ){
			if ( isException ){
				throw new EnergyproSystemException("Показники спидометра і відстані не співпадають !!!", userProfile);
			}
			out = false;
		}
		return out;

	}

	public BigDecimal getDistance(int travelSheetCode, int itemKind) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
		f.travelSheetRef.code = travelSheetCode;
		f.kindRef.code = itemKind;
		ENTravelSheetItemShortList l = dao.getScrollableFilteredList(f, 0, -1);
		for (int i=0; i < l.totalCount; i++){
			out = out.add(l.get(i).sumDistances).setScale(3, BigDecimal.ROUND_HALF_UP);
		}
		return out;
	}

	/**
	 *
	 * Возвращает сумму машиночасов по строкам путевого листа
	 *
	 * @param travelSheetCode код путевого листа
	 * @param itemKind вид строки путевого маршрута (фактический, плановый...)
	 * @param itemStatus статус строки путевого листа (черновая, посчитанная и утвержденная)
	 * @return <b>BigDecimal</b> - сумму машиночасов по строкам
	 * @throws PersistenceException
	 */
	public BigDecimal getMachineHours(int travelSheetCode, int itemKind, int itemStatus) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
		f.kindRef.code = itemKind;
		f.statusRef.code = itemStatus;

		f.travelSheetRef.code = travelSheetCode;
		ENTravelSheetItemShortList l = dao.getScrollableFilteredList(f, 0, -1);
		for (int i=0; i < l.totalCount; i++){
			BigDecimal temp = (l.get(i).sumMachineHours == null) ? new BigDecimal(0) : l.get(i).sumMachineHours;
			out = out.add(temp).setScale(3, BigDecimal.ROUND_HALF_UP);
		}
		return out;
	}

	/**
	 *
	 * Возвращает кол-во часов поездки расчитанные по времени отправления и прибытия путевого листа
	 *
	 * @param object путевой лист
	 * @return <b>BigDecimal</b> - количество часов
	 * @throws PersistenceException
	 */
	public BigDecimal getHoursInTravel(ENTravelSheet object) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		out = Tools.getHoursBetweenTwoDates(object.timeStart, object.timeFinal);
		return out;
	}

	/**
	 *
	 * Удаление строки путевого листа
	 *
	 * @param itemCode код строки
	 * @throws PersistenceException
	 */
	public void removeItem(int itemCode) throws PersistenceException
	{
		removeItem(itemCode, true);
	}

	/**
	 *
	 * Удаление строки путевого листа
	 *
	 * @param itemCode код строки
	 * @param needToRemove - необходимо ли удалять саму строку - если true - то удаляется, в другом случае - ставится статус - Удаленная
	 * @throws PersistenceException
	 */
	public void removeItem(int itemCode, boolean needToRemove) throws PersistenceException
	{
	      ENTravelSheetItemDAO objectDAO = new ENTravelSheetItemDAO(connection, userProfile);
	      ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(connection, userProfile);
	      TransportLogic tLogic = new TransportLogic(connection, userProfile);
	      ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);

		     ///

	      // проверять будем СНАРУЖИ ... или не давать такое делать СНАРУЖИ !!!!
	      /*
	      ENTravelSheetItem item = objectDAO.getObject(itemCode);
	      if (item.statusRef.code == ENTravelSheetItemStatus.CLOSED){
	    	  throw new EnergyproSystemException("Строка затверджена ...");
	      }
	      */
	      ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
	      ENTravelSheetItem2TransportItemFilter t2tFilter = new ENTravelSheetItem2TransportItemFilter();
	      t2tFilter.travelSheetItemRef.code = itemCode;
	      ENTravelSheetItem2TransportItemShortList l = t2tDAO.getScrollableFilteredList(t2tFilter, 0, -1);
	      for (int i=0; i < l.totalCount; i++){
	    	  // а если там расчитан ГСМ и т.д.????
	    	  clearENTransportItem(l.get(i).transportItemRefCode);
	    	  t2tDAO.remove(l.get(i).code);
	      }

	      /*Удаляли */

	      // по идее такое сделать при ОТМЕНЕ плана/факта ВСЕГО путевого ЛИСТА !!!
	      /*
	      if (item.parentItemRef.code != Integer.MIN_VALUE){
	    	  ENTravelSheetItem parentItem = objectDAO.getObject(item.parentItemRef.code);
	    	  parentItem.statusRef.code = ENTravelSheetItemStatus.GOOD;
	    	  objectDAO.save(parentItem);
	      }
	      */

		  // пересоберем совместную доставку на ФАКТЕ
		  //tLogic.makeDeliveryTimeForFact(planPlanCode, factPlanCode, travelSheet.transportReal.code );

	      /*Удаление всех дистанций*/
			ENTravelSheetItemDistanceFilter itemDistanceFilter = new ENTravelSheetItemDistanceFilter();
			itemDistanceFilter.travelSheetItemRef.code = itemCode;
			int[] itemDistancesCode = itemDistanceDAO.getFilteredCodeArray(itemDistanceFilter, 0, -1);
			for(int i = 0; i < itemDistancesCode.length; i++)
				itemDistanceDAO.remove(itemDistancesCode[i]);


	      ENTravelSheetItem tsi = objectDAO.getObject(itemCode);

	      new PlanWorkLogic(connection, userProfile).processDeliveryTimesByPlanCode(tsi.planRef.code);

	      if(needToRemove)
	    	  objectDAO.remove(itemCode);
	      else
	      {
	    	// NET-4333 Не удаление, а сохранение строки путевого листа
	    	tsi.statusRef.code = ENTravelSheetItemStatus.DELETED;

	      	// Выдернем номер наряд-задания, что бы знать какой он был до удаления
	      	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
	      	ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
	      	planFilter.code = tsi.planRef.code;
	      	ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter, 0, -1);

	      	// на всякий случай запишем когда и кто удалил наряд из ПЛ

	      	tsi.commentGen = ((tsi.commentGen != null)?tsi.commentGen + "\n" :"") + "Удален из ПЛ: " +
	      			         new SimpleDateFormat("dd.MM.yyyy ' в ' HH:mm:ss").format(new Date())  + ". \n"  +
	      	                 "Номер наряда: " + planList.get(0).workOrderNumber + ". \n" +
	      			         "Пользователь: " + userProfile.userName + ".";

	      	tsi.planRef.code = Integer.MIN_VALUE;

	      	objectDAO.save(tsi);
	      }
	}

	public void clearENTransportItem(int transportCode) throws PersistenceException
	{
	  ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);
	  FINWorkerDAO wDAO = new FINWorkerDAO(connection, userProfile);

  	  ENTransportItem t = transportDAO.getObject(transportCode);

	  t.transportReal.code = Integer.MIN_VALUE;
	  t.numberList = null;
	  int workerCode = t.finWorker.code;
	  t.finWorker.code = Integer.MIN_VALUE;
	  transportDAO.save(t);

	  if (workerCode != Integer.MIN_VALUE){
		  wDAO.remove(workerCode);
	  }

	  TransportLogic trLogic = new TransportLogic(connection, userProfile);
	  trLogic.removeGSMByTransportItemCode(t.code);

	}

	public void recalcTravelSheet(int travelSheetCode, int travelSheetStatusCode) throws PersistenceException
	{
		ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
		f.travelSheetRef.code = travelSheetCode;
		// по идее в других случаях будет ТОЛЬКО ПЛАН
		if (travelSheetStatusCode != ENTravelSheetStatus.PLAN){
			f.kindRef.code = ENTravelSheetItemKind.FACT;
		}

		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
		int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		for (int i=0; i < arr.length; i++){
			this.recalcItems(arr[i]);
		}
	}

	public void recalcItems(int travelSheetItemCode) throws PersistenceException
	{
		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
		ENTravelSheetItem2TransportItemFilter t2tFilter = new ENTravelSheetItem2TransportItemFilter();

		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);

		t2tFilter.travelSheetItemRef.code = travelSheetItemCode;

    	String trCodes = "";
    	//int[] transportItemCodes = tsiDAO.getFilteredCodeArray()
    	ENTravelSheetItem2TransportItemShortList t2tList = t2tDAO.getScrollableFilteredList(t2tFilter, 0, -1);

    	for (int i = 0; i < t2tList.totalCount; i++){
    		//ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
    		if (trCodes.length() == 0){
    			trCodes = "" + t2tList.get(i).transportItemRefCode ;
    		}
    		else{
    			trCodes = trCodes + ", " + t2tList.get(i).transportItemRefCode;
    		}
    	}

    	if (trCodes.length() == 0){
    		// на строке НЕТ транспортИтемОВ ... вынести ее ??
    		//dao.remove(travelSheetItemCode);
    		return;
    	}

    	ENTransportItemFilter f = new ENTransportItemFilter();
    	f.conditionSQL = "code in (" + trCodes + ")";
    	ENTransportItemShortList trList = trDAO.getScrollableFilteredList(f, 0, -1);

		BigDecimal sumDistance = new BigDecimal(0);
		BigDecimal sumTime = new BigDecimal(0);

		for (int j = 0; j < trList.totalCount; j++){
			sumDistance = sumDistance.add(trList.get(j).distance).setScale(3, BigDecimal.ROUND_HALF_UP);
			// считаем ТОЛЬКО м/ч ... бля бригадных - ЗАБОРТ .. пока заборт ...
			if (trList.get(j).tktransportTypeCode != TKTransportType.BRIGADE)
				sumTime = sumTime.add(trList.get(j).countWorkFact).setScale(2, BigDecimal.ROUND_HALF_UP);
		}


		ENTravelSheetItem item = dao.getObject(travelSheetItemCode);
		item.sumDistances = sumDistance;
		item.sumMachineHours = sumTime;
		dao.save(item);


	}

	public ENTravelSheet getTravelSheetByCode(int travelSheetCode) throws PersistenceException
	{
		ENTravelSheet out = null;
		ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);
		out = dao.getObject(travelSheetCode);
		return out;
	}

	/**
	 * Возвращает массив кодов строк путевого листа, или пустой массив
	 * 
	 * @param travelSheetCode код путевого
	 * @param itemKind вид строки (факт, план), если Integer.MIN_Value, то не учитывается
	 * @return
	 * @throws PersistenceException
	 */
	public int[] getTravelSheetItemCodesByTravelListCode(int travelSheetCode, int itemKind) throws PersistenceException
	{
		return getTravelSheetItemCodesByTravelListCode(travelSheetCode, itemKind, Integer.MIN_VALUE);
	}
	
	/**
	 * Возвращает массив кодов строк путевого листа, или пустой массив
	 * 
	 * @param travelSheetCode код путевого
	 * @param itemKind вид строки (факт, план), если Integer.MIN_VALUE, то не учитывается
	 * @param statusCode статус строки, если Integer.MIN_VALUE, то без разницы
	 * @return
	 * @throws PersistenceException
	 */
	public int[] getTravelSheetItemCodesByTravelListCode(int travelSheetCode, int itemKind, int statusCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(0);
		ENTravelSheetItemDAO dao = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
		if(itemKind != Integer.MIN_VALUE) {
			f.kindRef.code = itemKind;
		}
		if(statusCode != Integer.MIN_VALUE) {
			f.statusRef.code = statusCode;
		}
		f.travelSheetRef.code = travelSheetCode;
		int[] itemCodes = dao.getFilteredCodeArray(f, 0, -1);

		return itemCodes;
	}


	public void closeTravelItemsFactCreatedByDeliveryOrder(int travelSheetCode) throws PersistenceException, DatasourceConnectException, NamingException, RemoteException, CreateException
	{
		ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(connection,userProfile);
		ENTravelSheetDAO sheetDAO = new ENTravelSheetDAO(connection, userProfile);
		ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
		ENTravelSheet sheet = sheetDAO.getObject(travelSheetCode);

		 Context context = new InitialContext();
	        Object objRef = null;

		   objRef = context.lookup(ENTravelSheetItemController.JNDI_NAME);
	        ENTravelSheetItemControllerHome travelSheetItemHome = (ENTravelSheetItemControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetItemControllerHome.class);
	        ENTravelSheetItemController travelSheetItemController = travelSheetItemHome.create();

		itemFilter.travelSheetRef.code = travelSheetCode;
		itemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
		itemFilter.statusRef.code = ENTravelSheetItemStatus.GOOD;
		itemFilter.commentGen = "сумісна доставка";

        ENTravelSheetItemShortList travelItemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

		if (travelItemList.totalCount > 0)
		 {
			for (int g = 0; g < travelItemList.totalCount; g++)
			{
				ENTravelSheetItem item = itemDAO.getObject(travelItemList.get(g).code);
				item.speedometerStart = sheet.speedometerStart;
				item.speedometerFinal = sheet.speedometerStart;
				item.sumDistances = new BigDecimal(0);
				item.fuelCounterStart = sheet.fuelCounterStart;
				item.fuelCounterFinal = sheet.fuelCounterStart;
				item.timeStart = sheet.timeStart;
				item.timeFinal = sheet.timeStart;
				item.travelFrom = "---";
				travelSheetItemController.save(item);
			}
		 }
    }

	public void addItems(ENTravelSheet travelSheet, ENTransportItemShort[] tList, int parentTransportItemCode) throws PersistenceException, DatasourceConnectException {
		ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(connection, userProfile);
		ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
		ENTransportItem2TransportItemDAO tr2trDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);
		FINWorkerDAO workerDAO = new FINWorkerDAO(connection, userProfile);
		ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);
		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		TransportLogic tLogic = new TransportLogic(connection, userProfile);

		/*
		 * Проверка - входящие строки должны либо входить в заявку либо не
		 * входить. Чтобы строки путевых листов не смешивались
		 */
		TransportOrderLogic toLogic = new TransportOrderLogic(connection, userProfile);
		toLogic.checkTravelSheet(tList, travelSheet.code);

		int planCode = Integer.MIN_VALUE;

		// НПЗ на фактическом ТЛе ..
		/**/
		if (travelSheet.statusRef.code == ENTravelSheetStatus.FACT) {
			for (int i = 0; i < tList.length; i++) {
				if (planCode != tList[i].planRefCode) {
					planCode = tList[i].planRefCode;

					int newPlanCode = planCode;

					ENPlanWork plan_ = planLogic.getPlanByCode(planCode);
					if ((plan_.kind.code == ENPlanWorkKind.NPW) && (plan_.status.code == ENPlanWorkStatus.GOOD)) {
						// 26.11.2014 newPlanCode =
						// planLogic.closePlan(planCode);
						// перебьем у всех остальных код НПЗ .. на тока
						// сформированный факт ..
						for (int j = 0; j < tList.length; j++) {
							if (tList[j].planRefCode == planCode) {
								tList[j].planRefCode = newPlanCode;
								// а на ФАКТЕ код ТРАНСПОРТИТЕМА уже ДРУГОЙ !!!!
								// ;)
								ENTransportItem2TransportItemFilter tr2trFilter = new ENTransportItem2TransportItemFilter();
								tr2trFilter.inRef.code = tList[j].code;
								ENTransportItem2TransportItemShortList tr2trList = tr2trDAO
										.getScrollableFilteredList(tr2trFilter, 0, -1);
								if (tr2trList.totalCount != 1) {
									throw new EnergyproSystemException(
											"Помилка у кількості транспорту при переході з НПЗ у ФАКТ, кіл-ть = "
													+ tr2trList.totalCount);
								}
								tList[j].code = tr2trList.get(0).outRefCode;
							}
						}
						// пересоберем совместную доставку на ФАКТЕ
						tLogic.makeDeliveryTimeForFact(planCode, newPlanCode, travelSheet.transportReal.code);

						planCode = newPlanCode;
					}
				}
			}
		}
		/**/

		for (int i = 0; i < tList.length; i++) {

			ENTransportItemFilter transportFilter = new ENTransportItemFilter();
			transportFilter.planRef.code = tList[i].planRefCode;
			transportFilter.transport.code = tList[i].transportCode;
			transportFilter.tktransportType.code = tList[i].tktransportTypeCode;
			// могут заежжать и чисто КОДЫ ТранспортИтемов
			transportFilter.code = tList[i].code;
			// !!! похожее условие в
			// ENTransportItemDAO.getListForTravelSheetItem !!!
			transportFilter.conditionSQL =
			// "entransportitem.numberlist is null "+
			// " entransportitem.countfact > 0 " +
			" entransportitem.code in " + "( "
					+ " select entransportitem.code from entransportitem left join entravlshttm2trnsprttm "
					+ " on (entravlshttm2trnsprttm.transportitemrefcode = entransportitem.code) where "
					+ " entransportitem.planitemrefcode in " + " (select pi1.code from enplanworkitem pi1 "
					+ " where pi1.planrefcode = " + tList[i].planRefCode + " and pi1.countgen<>0) and "
					+ " entravlshttm2trnsprttm.transportitemrefcode is null " + " ) ";

			transportFilter.orderBySQL = "entransportitem.planitemrefcode";

			ENTransportItemShortList trList = transportDAO.getScrollableFilteredList(transportFilter, 0, -1);
			planCode = Integer.MIN_VALUE;
			ENTravelSheetItem item = new ENTravelSheetItem();
			for (int j = 0; j < trList.totalCount; j++) {
				if (planCode != trList.get(j).planRefCode) {
					planCode = trList.get(j).planRefCode;
					ENPlanWork plan = planDAO.getObject(planCode);
					ENTravelSheetItemFilter travelItemFilter = new ENTravelSheetItemFilter();
					travelItemFilter.travelSheetRef.code = travelSheet.code;
					travelItemFilter.planRef.code = planCode;
					if (travelSheet.statusRef.code == ENTravelSheetStatus.PLAN) {
						travelItemFilter.kindRef.code = ENTravelSheetItemKind.PLAN;
						// пофиг план-факт ... закрываем ПЛАН не зависимо от
						// Этапа ПЛ ...
						/*
						 * 26.11.2014 if ((plan.kind.code == ENPlanWorkKind.NPW)
						 * && (plan.status.code == ENPlanWorkStatus.GOOD)) {
						 * planLogic.closePlan(planCode); }
						 */
					} else if (travelSheet.statusRef.code == ENTravelSheetStatus.FACT) {
						travelItemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
						// вынести то что наформировалось в ДО включения в ФАКТ
						tLogic.removeGSMByTransportItemCode(trList.get(j).code);
					} else {
						throw new EnergyproSystemException("Error on travelItemKind ....");
					}

					// Транспортная заявка
					ENTransportOrder tor = toLogic.getTransportOrderByTransportItemCode(trList.get(j).code);

					int[] itemCodes = itemDAO.getFilteredCodeArray(travelItemFilter, 0, -1);
					if (itemCodes.length == 0) {
						item = new ENTravelSheetItem();
						item.travelSheetRef.code = travelSheet.code;
						item.planRef.code = planCode;
						item.statusRef.code = ENTravelSheetItemStatus.GOOD;
						item.kindRef.code = travelItemFilter.kindRef.code;
						// для Перевозок - примечание ...
						if (plan.typeRef.code == ENPlanWorkType.TRUCKING) {
							item.travelTo = plan.commentGen;
						} else {
							item.travelTo = trList.get(j).elementName + " (инв.№" + trList.get(j).elementInvNumber
									+ " )";
						}

						item.sumDistances = item.sumMachineHours = new BigDecimal(0);
						if (parentTransportItemCode != Integer.MIN_VALUE) {
							item.commentGen = "сумісна доставка";
						}

						if (tor != null) {
							item.timeStart = tor.timeStart;
							item.timeFinal = tor.timeFinal;
						}

						itemDAO.add(item);
					} else {
						if (itemCodes.length == 1) {
							item = itemDAO.getObject(itemCodes[0]);
						}

					}
				}

				// привязываем только ИСПОЛЬЗУЕМЫЙ норм. транспорт ... !!! а
				// совм. доставка?
				if ((parentTransportItemCode != Integer.MIN_VALUE) || (trList.get(j).countWorkFact.doubleValue() > 0)
						|| (trList.get(j).distance.doubleValue() > 0)) {
					///// 29.08.11 Проверим, чтобы такой записи еще не было в
					///// таблице, а то при совместных доставках
					///// в некоторых случаях ругается на
					///// entravlshttm2trnsprttm_idx_uniq
					ENTravelSheetItem2TransportItemFilter t2tFilter = new ENTravelSheetItem2TransportItemFilter();
					t2tFilter.transportItemRef.code = trList.get(j).code;
					t2tFilter.travelSheetItemRef.code = item.code;
					int t2tArr[] = t2tDAO.getFilteredCodeArray(t2tFilter, 0, -1);

					if (t2tArr.length == 0) {
						ENTravelSheetItem2TransportItem t2t = new ENTravelSheetItem2TransportItem();
						t2t.transportItemRef.code = trList.get(j).code;
						t2t.travelSheetItemRef.code = item.code;
						t2tDAO.add(t2t);
						// сохранить АВТО и ВОРКЕРА в транспорте ...
						ENTransportItem tr = transportDAO.getObject(trList.get(j).code);
						tr.transportReal.code = travelSheet.transportReal.code;
						tr.trailerTransportReal.code = travelSheet.trailer1.code;

						// перекинем из НОРМАТИВНОГО в СКОРИГОВАНый ;)
						// ... кроме тех что небыло в Нормативах + если больше
						// чем в нормативах ...
						if (tr.countWorkGen.doubleValue() != 0) {
							if (tr.countWorkGen.doubleValue() < tr.countWorkFact.doubleValue()) {
								tr.commentGen = (tr.commentGen == null ? " " : tr.commentGen) + " скор."
										+ tr.countWorkFact;
								tr.countWorkFact = tr.countWorkGen;
							}
						}

						// тут же (на ТР) есть уже финворкер ... мож его
						// подюзать?? .. или вынести того что занесли РУКАМИ ...
						FINWorker w = travelSheet.finWorker;
						int fWorker = Integer.MIN_VALUE;
						if (tr.finWorker != null) {
							fWorker = tr.finWorker.code;
						}
						tr.finWorker.code = workerDAO.add(w);
						tr.numberList = travelSheet.numberGen;
						// типа командировка .. вычислили при добавлении ПЛ
						transportDAO.save(tr);

						if (fWorker != Integer.MIN_VALUE) {
							workerDAO.remove(fWorker);
						}

						// + расчитаем ПММ ...
						// TransportLogic tLogic = new
						// TransportLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE),getUserProfile());
						// tLogic.generateGSMEstimate(tr.code);
					}
					/////
				}

				// типа свместная доставка !!! может быть как в ИНе .. так и в
				// АУТе
				// пока только для ПЛАНОВ
				if (travelSheet.statusRef.code == ENTravelSheetStatus.PLAN) {
					int childTransportCode = tLogic.getDeliveryOrderTransportOutCode(trList.get(j).code);
					if (childTransportCode != Integer.MIN_VALUE) {
						if (!tLogic.checkTransportItemInTravelSheetBySheetCode(travelSheet.code, childTransportCode,
								false)) {
							ENTransportItem cTransport = transportDAO.getObject(childTransportCode);
							ENTransportItemShort[] cList = new ENTransportItemShort[1];
							cList[0] = new ENTransportItemShort();
							cList[0].planRefCode = cTransport.planRef.code;
							cList[0].transportCode = cTransport.transport.code;
							cList[0].tktransportTypeCode = cTransport.tktransportType.code;
							addItems(travelSheet, cList, trList.get(j).code);
						}
					}
					int parentTransportCode = tLogic.getDeliveryOrderTransportInCode(trList.get(j).code);
					if (parentTransportCode != Integer.MIN_VALUE) {
						if (!tLogic.checkTransportItemInTravelSheetBySheetCode(travelSheet.code, parentTransportCode,
								false)) {
							ENTransportItem cTransport = transportDAO.getObject(parentTransportCode);
							ENTransportItemShort[] cList = new ENTransportItemShort[1];
							cList[0] = new ENTransportItemShort();
							cList[0].planRefCode = cTransport.planRef.code;
							cList[0].transportCode = cTransport.transport.code;
							cList[0].tktransportTypeCode = cTransport.tktransportType.code;
							addItems(travelSheet, cList, trList.get(j).code);
						}
					}
				}
			}

		} // пока список тр-та

	}
	
	  /**
	   *
	   * Возвращает предыдущую (по времени) строку путевого листа для указанной строки
	   *
	   * @param tsiObj строка путевого листа
	   */
	  public ENTravelSheetItem getPrevTravelSheetItem(ENTravelSheetItem tsiObj) throws PersistenceException
	  {
		  /*Ф-ция возвращает предыдущую строку путевого листа строке tsiObj*/
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
		  ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(connection, userProfile);

		  ENTravelSheet tsObj = tsDAO.getObject(tsiObj.travelSheetRef.code);
		  ENTravelSheetItem tsiPrevObj = null;

		  ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();


		  String condition = " select \n" +
		  " 	entravelsheetitem.code  \n" +
		  " from  \n" +
		  " 	entravelsheetitem,  \n" +
		  " 	entravelsheet  \n" +
		  " where \n" +
		  " entravelsheetitem.travelsheetrefcode = entravelsheet.code \n" +
		  " and entravelsheet.transportrealcode = " + tsObj.transportReal.code + " \n" +
		  " and entravelsheetitem.kindrefcode = " + tsiObj.kindRef.code +
		  " and entravelsheetitem.timestart =  \n" +
		  " 	(select  \n" +
		  "     	max(entravelsheetitem.timestart)  \n" +
		  "     from entravelsheetitem, entravelsheet  \n" +
		  "     where entravelsheetitem.travelsheetrefcode = entravelsheet.code  \n" +
		  "     and entravelsheet.transportrealcode = " + tsObj.transportReal.code + " \n" +
		  "     and entravelsheetitem.kindrefcode = " + tsiObj.kindRef.code +
		  "     and to_timestamp(to_char(entravelsheetitem.timestart, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss')  \n" +
		  "     < to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(tsiObj.timeStart).toString() + " + ','dd.mm.yyyy hh24:mi:ss')) \n";
		  tsiFilter.conditionSQL = "ENTRAVELSHEETITEM.CODE IN ("+condition+")";

		  ENTravelSheetItemShortList tsiList = tsiDAO.getScrollableFilteredList(tsiFilter, 0, -1);

		  if(tsiList.totalCount > 1)
		  {
			  throw new EnergyproSystemException("Помилка у кількості минулих строк подорожнього листа");
		  }

		  for(int i = 0; i < tsiList.totalCount; i ++)
		  {
			  tsiPrevObj = tsiDAO.getObject(tsiList.get(i).code);
		  }

		  return tsiPrevObj;
	  }

	  /**
	   *
	   * Возвращает следующую (по времени) строку путевого листа для указанной строки
	   *
	   * @param tsiObj строка путевого листа
	   */
	  public ENTravelSheetItem getNextTravelSheetItem(ENTravelSheetItem tsiObj) throws PersistenceException
	  {
		  /*Ф-ция возвращает следующую строку путевого листа строке */
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
		  ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(connection, userProfile);

		  ENTravelSheet tsObj = tsDAO.getObject(tsiObj.travelSheetRef.code);

		  ENTravelSheetItem tsiNextObj = null;

		  ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();

		  String condition = " select \n" +
		  " 	entravelsheetitem.code  \n" +
		  " from  \n" +
		  " 	entravelsheetitem,  \n" +
		  " 	entravelsheet  \n" +
		  " where \n" +
		  " entravelsheetitem.travelsheetrefcode = entravelsheet.code \n" +
		  " and entravelsheet.transportrealcode = " + tsObj.transportReal.code + " \n" +
		  " and entravelsheetitem.timestart =  \n" +
		  " 	(select  \n" +
		  "     	min(entravelsheetitem.timefinal)  \n" +
		  "     from entravelsheetitem, entravelsheet  \n" +
		  "     where entravelsheetitem.travelsheetrefcode = entravelsheet.code  \n" +
		  "     and entravelsheet.transportrealcode = " + tsObj.transportReal.code + " \n" +
		  "     and entravelsheetitem.kindrefcode = " + tsiObj.kindRef.code +
		  "     and to_timestamp(to_char(entravelsheetitem.timefinal, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss')  \n" +
		  "     > to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(tsiObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss')) \n";
		  tsiFilter.conditionSQL = "ENTRAVELSHEETITEM.CODE IN ("+condition+")";
		  ENTravelSheetItemShortList tsiList = tsiDAO.getScrollableFilteredList(tsiFilter, 0, -1);


		  if(tsiList.totalCount > 1)
		  {
			  throw new EnergyproSystemException("Помилка у кількості наступних строк подорожніх листів");
		  }

		  for(int i = 0; i < tsiList.totalCount; i ++)
		  {
			  tsiNextObj = tsiDAO.getObject(tsiList.get(i).code);
		  }


		  return tsiNextObj;
	  }

	// NET-2365 - персчитаем дистансы на задание факт в зависимости от километража на путевом .
	// (Километры по путовому) минус (сумма км по расстояниям на факте ) делим на
	// количество расстояний на факте . Полученное значение прибавляем или отнимаем к
	// каждой строке расстояния по этой машине.
	// пока тренируемся на работах на сторону
public void recalcDistanceByTravelsheetKm(ENTravelSheetItem tsiObj) throws PersistenceException
	  {
		ENTravelSheetDAO trvDAO = new ENTravelSheetDAO(connection, userProfile);
		ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);
		ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
		ENTravelSheet trvObj = trvDAO.getObject(tsiObj.travelSheetRef.code);
		TransportLogic trLogic = new TransportLogic(connection, userProfile);
		ENElementTypeDAO eltypeDAO = new ENElementTypeDAO(connection, userProfile);
		ENElementTypeFilter eltypeFilter = new ENElementTypeFilter();
		/// наверное нужно включать для всех
		eltypeFilter.conditionSQL = " ENELEMENTTYPE.CODE = ( select el.typerefcode from enplanwork p  , enelement el " +
									" where p.code = " + tsiObj.planRef.code  +
									" and p.elementrefcode = el.code " +
									" limit 1 )";
							//		" and el.typerefcode = " + ENElementType.SERVICES_OBJECT + " Limit 1  ) ";
		int eltypeArr[] = eltypeDAO.getFilteredCodeArray(eltypeFilter, eltypeFilter.conditionSQL, null, 0, -1, null);


// если строка путевого фактичного и (ПОКА УСЛУГИ НА СТОРОНУ )
if (tsiObj.kindRef.code == ENTravelSheetItemKind.FACT && eltypeArr.length != 0 ) {
  if (trvObj != null){
  	if (trvObj.typeRef.code ==  ENTravelSheetType.LEGKOVOY
  		|| trvObj.typeRef.code ==  ENTravelSheetType.AVTOBUS_GRUZOVOY
  		|| trvObj.typeRef.code ==  ENTravelSheetType.AVTOBUS_LEGKOVOY
  		|| trvObj.typeRef.code ==  ENTravelSheetType.GRUZOVOY
  		|| trvObj.typeRef.code ==  ENTravelSheetType.GRUZOVOY_VISHKA
  		|| trvObj.typeRef.code ==  ENTravelSheetType.KRAN) {
        // расстояние указаное на строке путевого
  		BigDecimal distanceInTravelsheetItem = new BigDecimal(0);
  		//
  		// выберем транспорт итемы на плане по реальной машине из путевого у которого хоть одно значение дистанса
  		ENTransportItemFilter tiFilter = new ENTransportItemFilter();
  		tiFilter.transportReal.code = trvObj.transportReal.code;
  		tiFilter.planRef.code = tsiObj.planRef.code;
  		tiFilter.conditionSQL = " entransportitem.code  in (select d.transportitemrefcode  from endistance d where d.transportitemrefcode = entransportitem.code )   ";
  		ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);


  		BigDecimal sumDistancesTravelsheetItem = new BigDecimal(0);
  		BigDecimal sumDistancesEntransportitem = new BigDecimal(0);
  		BigDecimal sumDifferenceDistances = new BigDecimal(0);
  		BigDecimal diffKm = new BigDecimal(0);
			sumDistancesTravelsheetItem = ((tsiObj.speedometerFinal != null)?tsiObj.speedometerFinal:new BigDecimal(0))
              .subtract(((tsiObj.speedometerStart != null)?tsiObj.speedometerStart:new BigDecimal(0)));
			// выходим если расстояния нет или оно минусовое

  		if (tiList.totalCount != 0 )  {
  		 // определим дистансы для транспорт итема в цикле
  			for (int i=0; i < tiList.totalCount; i++){
  				if (sumDistancesTravelsheetItem.doubleValue() == 0.0 || sumDistancesTravelsheetItem == null) break;
  				ENDistanceFilter distFilter = new ENDistanceFilter();
  				distFilter.transportItemRef.code = tiList.get(0).code;
  				ENDistanceShortList distList = distDAO.getScrollableFilteredList(distFilter, 0, -1);


  				BigDecimal[] dist = trLogic.getDistancesByTransport(tiList.get(0).code, true);

  				// NET-3384 тут выбивает nullPointerException, поэтому будет осуществляться выход из цикла
  				// для транспорта без расстояний (или с нулевыми)
  				if(dist == null)
  					continue;

  				sumDistancesEntransportitem = dist[0].add(dist[1]).add(dist[2]);

  				sumDifferenceDistances = sumDistancesTravelsheetItem.subtract(sumDistancesEntransportitem);

  				BigDecimal sumDistNotLastRecort = new BigDecimal(0);

  				for (int j=0; j < distList.totalCount; j++){
  					ENDistance distObj = distDAO.getObject(distList.get(j).code);
  				if (j < distList.totalCount - 1) { // для не последних записей расстояний под транспортитемы

	  				BigDecimal  koefByDistancePlan = new  BigDecimal(0); // коефициент для текущего расстояния от сумарного расстояния на транспорт итеме

	  				koefByDistancePlan = distObj.distance.divide(sumDistancesEntransportitem,2, BigDecimal.ROUND_HALF_UP);

	  				BigDecimal distProportion = sumDifferenceDistances.multiply(koefByDistancePlan).setScale(2, BigDecimal.ROUND_HALF_UP);

	  				distObj.distance = distObj.distance.add(distProportion).setScale(2, BigDecimal.ROUND_HALF_UP);
	  				sumDistNotLastRecort = sumDistNotLastRecort.add(distObj.distance).setScale(2, BigDecimal.ROUND_HALF_UP);
	  				distDAO.save(distObj);

	  				} else
	  				{ // если последняя запись тогда в нее ложим разницу (расстояние на строке путевого - расстояния посчитаные для предыдущих строк)
	  				distObj.distance = sumDistancesTravelsheetItem.subtract(sumDistNotLastRecort).setScale(2, BigDecimal.ROUND_HALF_UP);
	  				distDAO.save(distObj);
	  				}
  				}
  			}
  		}

	}
   }

   //пересчитаем время на доставку для планов и по хуменам.
    new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(tsiObj.planRef.code);
    new HumenLogic(connection, userProfile).createDeliveryTime(tsiObj.planRef.code);
  }

}


/////
public void roundingFuelToTenth(int travelSheetCode) throws PersistenceException
{
	ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
	ENTravelSheet ts = tsDAO.getObject(travelSheetCode);
//	ENTravelSheet tsNext = getNextSheet(ts);
	
	if (ts.statusRef.code != ENTravelSheetStatus.FACT){
		throw new SystemException("Путевой должен быть в статусе \"Формирование фактов\"!");
	}
		
//	if (tsNext != null) 
//	{
//		if (tsNext.statusRef.code != ENTravelSheetStatus.PLAN && tsNext.statusRef.code != ENTravelSheetStatus.GOOD) 
//		{
//		ENTravelSheetFuelRemainsDAO tsNextFrDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
//	    ENTravelSheetFuelRemainsFilter tsNextFrFilter = new ENTravelSheetFuelRemainsFilter();
//		tsNextFrFilter.travelSheetRef.code = tsNext.code;
//			
//		ENTravelSheetFuelRemainsShortList tsNextFrList = tsNextFrDAO.getScrollableFilteredList(tsNextFrFilter, 0, -1);
//		
//		if (tsNextFrList.totalCount > 0) {
//			throw new SystemException("Уже есть следующий ПЛ " + tsNext.numberGen + " со сформированными остатками!");
//			}
//	    }
//	}
	
    ENTravelSheetFuelRemainsDAO tsfrDAO = new ENTravelSheetFuelRemainsDAO(connection, userProfile);
	ENTravelSheetFuelRemainsFilter tsfrFilter = new ENTravelSheetFuelRemainsFilter();
	tsfrFilter.travelSheetRef.code = ts.code;
	tsfrFilter.conditionSQL = " (entravelsheetfuelremns.countgenout <> 0)";
	
	ENTravelSheetFuelRemainsShortList tsfrList = tsfrDAO.getScrollableFilteredList(tsfrFilter, 0, -1);

	if(tsfrList.totalCount == 0)
	{
		return;
	}
	
	if (tsfrList.totalCount > 0) {

	for (int i=0;i<tsfrList.totalCount;i++) {
	
	   ENTravelSheetFuelRemains tsfr = tsfrDAO.getObject(tsfrList.get(i).code);
	   
	   BigDecimal countFinal = new BigDecimal(0);
	   BigDecimal roundedCountFinal = new BigDecimal(0);
	   BigDecimal diff = new BigDecimal(0);
		
	   countFinal = tsfr.countGenFinal;
	   roundedCountFinal = (tsfr.countGenFinal).setScale(1, RoundingMode.HALF_UP);
		
	   diff = countFinal.subtract(roundedCountFinal);
		
	   System.out.println("countFinal = " + countFinal);
	   System.out.println("roundedCountFinal = " + roundedCountFinal);
	   System.out.println("diff = " + diff);
	   
	   if (diff.compareTo(new BigDecimal(0)) == 0) continue;
		
	   TKFuelTypeDAO ftDAO = new TKFuelTypeDAO(connection, userProfile);
	   TKFuelType ft = ftDAO.getObject(tsfr.fuelTypeRef.code);

       ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
       ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
       
       ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection,userProfile);  
       ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
       t2eFilter.conditionSQL = "entransport2enestimate.code in ( " +
                               " select t2e.code " +
                               " from entravelsheetitem i, " + 
                               " entravlshttm2trnsprttm i2t, " + 
                               " entransport2enestimate t2e, " + 
                               " enestimateitem ei" +
                               " where i.travelsheetrefcode = " + ts.code +  /*500290368*/
                               " and i.kindrefcode = 2 " + 
                               " and i.code = i2t.travelsheetitemrefcode " + 
                               " and t2e.transportrefcode = i2t.transportitemrefcode" +  
                               " and ei.countfact >= 0.1" + 
                               " and ei.materialrefcode = " + ft.materialRef.code + 
                               " and ei.code = t2e.estimaterefcode)";
       ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);
      
       if (t2eList.totalCount == 0) {
       	throw new SystemException("Не найден расход по путевому № " + ts.numberGen);
       }
       
       String eiCodes = "";
       for (int f=0;f<t2eList.totalCount;f++)
       {
    	   if (f+1 == t2eList.totalCount) {
    		   eiCodes = eiCodes + t2eList.get(f).estimateRefCode;
    	   }
    	   else 
    	   {
    		   eiCodes = eiCodes + t2eList.get(f).estimateRefCode + ",";
    	   }
       }
       
        eiFilter.conditionSQL = " enestimateitem.code in (" + eiCodes + ")"; 
        ENEstimateItemShortList eiList = eiDAO.getScrollableFilteredList(eiFilter, 0, -1);

        // будем брать любой из эстимэйтов, все равно нет приоритета, лишь бы округлить остаток на конец
        ENEstimateItem ei = eiDAO.getObject(eiList.get(0).code);

        	ei.countFact = ei.countFact.add(diff);
        	tsfr.countGenOut = tsfr.countGenOut.add(diff);
        	tsfr.countGenFinal = tsfr.countGenFinal.subtract(diff);
        
 	   System.out.println("ei.countFact  = " + ei.countFact);
 	   System.out.println("tsfr.countGenOut = " + tsfr.countGenOut);
 	   System.out.println("tsfr.countGenFinal = " + tsfr.countGenFinal);
 	   
        eiDAO.save(ei);
        tsfrDAO.save(tsfr);
	   }
	}
}

/////

	  public TravelSheetLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }
}
