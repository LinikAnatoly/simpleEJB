
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFuelDistributionSheet;
 *
 */

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetDAO;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENFuelDistributionSheetControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ManningTableLogic;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetDepartmentInfo;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENFuelDistributionSheetControllerEJB extends
		ENFuelDistributionSheetControllerEJBGen {

	public ENFuelDistributionSheetControllerEJB() {
	}
	
	public int add(ENFuelDistributionSheet object) {
		try {
			ENFuelDistributionSheetDAO objectDAO = new ENFuelDistributionSheetDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENFuelDistributionSheetItemDAO fuelDistrItemDao = new ENFuelDistributionSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDepartmentDAO departmentDao = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ManningTableLogic manningLogic = new ManningTableLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TravelSheetFuelLogic travelSheetFuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKMaterialsDAO materialDao = new TKMaterialsDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKFuelTypeDAO fuelTypeDao = new TKFuelTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			DepartmentLogic depLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			if (object.fuelTypeRef == null){
				throw new EnergyproSystemException("Не вказано тип палива!!!");
			} else 
				if (object.fuelTypeRef.code == Integer.MIN_VALUE){
					throw new EnergyproSystemException("Не вказано тип палива!!!");
				}
			
			ENFuelDistributionSheetFilter sheetDistFilter = new ENFuelDistributionSheetFilter();
			sheetDistFilter.monthGen = object.monthGen;
			sheetDistFilter.yearGen = object.yearGen;					
			sheetDistFilter.fuelTypeRef.code = object.fuelTypeRef.code;
					
			int[] sheetDistArr = objectDAO.getFilteredCodeArray(sheetDistFilter, 0, -1);
			
			if (sheetDistArr.length > 0 ) {
				throw new EnergyproSystemException("Запис по місяцю, року та типу палива вже заведена раніше!!!");
			}
			
			
			object.totalSum = new BigDecimal(0);
			object.sum1 = new BigDecimal(0);
			object.sum2 = new BigDecimal(0);
			object.sum3 = new BigDecimal(0);
			object.sum4 = new BigDecimal(0);
			object.sum5 = new BigDecimal(0);
			object.sum6 = new BigDecimal(0);
			object.sum7 = new BigDecimal(0);
			
			object.sum1dec1 = new BigDecimal(0);
			object.sum2dec1 = new BigDecimal(0);
			object.sum3dec1 = new BigDecimal(0);
			object.sum4dec1 = new BigDecimal(0);
			object.sum5dec1 = new BigDecimal(0);
			object.sum6dec1 = new BigDecimal(0);
			object.sum7dec1 = new BigDecimal(0);	
			object.sum1dec2 = new BigDecimal(0);
			object.sum2dec2 = new BigDecimal(0);
			object.sum3dec2 = new BigDecimal(0);
			object.sum4dec2 = new BigDecimal(0);
			object.sum5dec2 = new BigDecimal(0);
			object.sum6dec2 = new BigDecimal(0);
			object.sum7dec2 = new BigDecimal(0);				
			object.sum1dec3 = new BigDecimal(0);
			object.sum2dec3 = new BigDecimal(0);
			object.sum3dec3 = new BigDecimal(0);
			object.sum4dec3 = new BigDecimal(0);
			object.sum5dec3 = new BigDecimal(0);
			object.sum6dec3 = new BigDecimal(0);			
			object.sum7dec3 = new BigDecimal(0);				
			
		    object.code = objectDAO.add(object);
		    
		    // заполним строки 
		    
		    
		    List<ENFuelDistributionSheetDepartmentInfo> depList = depLogic.getListOfDepartmentInfoForENFuelDistributionSheet();
		    for(int i = 0; i < depList.size(); i++) {
		    
		    	for(byte j = 1; j <= 3; j++) {		    		
		    	
		    	ENFuelDistributionSheetItem item = new ENFuelDistributionSheetItem();
		    	item.code = Integer.MIN_VALUE;
		    	item.decadeNumber = j;
		    	item.countGen = new BigDecimal(0);
		    	item.count1 = new BigDecimal(0);
		    	item.count2 = new BigDecimal(0);
		    	item.count3 = new BigDecimal(0);
		    	item.count4 = new BigDecimal(0);
		    	item.count5 = new BigDecimal(0);
		    	item.count6 = new BigDecimal(0);
		    	item.count7 = new BigDecimal(0);		    	
		    	item.isConfirmed = ENFuelDistributionSheetItem.NOT_CONFIRMED;
		    	item.departmentRef.code = depList.get(i).code;
		    	item.fuelDistributionRef.code =  object.code ; 
		    	fuelDistrItemDao.add(item);
		       }
		    }
		    
			objectDAO.save(object);
			
			return object.code;
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENFuelDistribution%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

	}
	
	/**
	 * 
	 * Разнесение строк ведомости
	 * 
	 * @param object ведомость по топливу
	 * @param typeActivity вид деятельности для расчета
	 * @param decadesArray декады для расчета
	 * @return
	 */
	public ENFuelDistributionSheet recalcApprovedPmmByTypeActivity(ENFuelDistributionSheet object , int typeActivity, int[] decadesToCalculate) {
		try {
			ENFuelDistributionSheetDAO fuelDistDAO = new ENFuelDistributionSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENFuelDistributionSheetItemDAO fuelDistrItemDAO = new ENFuelDistributionSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			DepartmentLogic depLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TravelSheetFuelLogic travShLog = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKFuelTypeDAO ftDAO = new TKFuelTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKMaterialsDAO matDAO = new TKMaterialsDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			c.set(Calendar.YEAR, object.yearGen);
			c.set(Calendar.DATE, 1);
			c.set(Calendar.MONTH, object.monthGen - 1);
			c.add(Calendar.MONTH, -1);
			
			int yearForOVB = c.get(Calendar.YEAR);
			int monthForOVB = c.get(Calendar.MONTH) + 1;
			
			ENFuelDistributionSheet oldObject = fuelDistDAO.getObject(object.code);
			
			Vector<Integer> vecDecadesToCalculate = new Vector<Integer>();
			for(int i = 0; i < decadesToCalculate.length; i++) {
				vecDecadesToCalculate.add(decadesToCalculate[i]);
			}
			
			// Формирование вектора декад, которые можно пересчитывать
			Vector<Integer> decades = new Vector<Integer>();
			Date currentDate = new Date(System.currentTimeMillis());
			for(int i = 1; i < 4; i++) {
				Date lastDateOfDecade = Tools.getLastDateOfDecade(object.yearGen, object.monthGen, i);
				if(!lastDateOfDecade.before(currentDate) && vecDecadesToCalculate.contains(i)) {
					decades.add(i);
				}
			}
			
			if(decades.size() == 0) {
				throw new EnergyproSystemException("Немає декад, що можна перерахувати!");
			}
			
			// Сравнение сум подекадно (можно ли их изменять)
			if(!decades.contains(1)) {
				if(object.sum1dec1.compareTo(oldObject.sum1dec1) != 0
						|| object.sum2dec1.compareTo(oldObject.sum2dec1) != 0
						|| object.sum3dec1.compareTo(oldObject.sum3dec1) != 0
						|| object.sum4dec1.compareTo(oldObject.sum4dec1) != 0
						|| object.sum5dec1.compareTo(oldObject.sum5dec1) != 0
						|| object.sum6dec1.compareTo(oldObject.sum6dec1) != 0
						|| object.sum7dec1.compareTo(oldObject.sum7dec1) != 0) {
					if(!vecDecadesToCalculate.contains(1)) {
						throw new EnergyproSystemException("Неможливо змінити суми для першої декади, т.к. вона " +
								" не обрана для розрахунку");				
					} else {					
						throw new EnergyproSystemException("Неможливо змінити суми для першої декади, т.к. поточна дата вже більше (" +
							new SimpleDateFormat("dd.mm.yyyy").format(currentDate));
					}
				}
			}
			if(!decades.contains(2)) {
				if(object.sum1dec2.compareTo(oldObject.sum1dec2) != 0
						|| object.sum2dec2.compareTo(oldObject.sum2dec2) != 0
						|| object.sum3dec2.compareTo(oldObject.sum3dec2) != 0
						|| object.sum4dec2.compareTo(oldObject.sum4dec2) != 0
						|| object.sum5dec2.compareTo(oldObject.sum5dec2) != 0
						|| object.sum6dec2.compareTo(oldObject.sum6dec2) != 0
						|| object.sum7dec1.compareTo(oldObject.sum7dec2) != 0) {
					if(!vecDecadesToCalculate.contains(1)) {
						throw new EnergyproSystemException("Неможливо змінити суми для другої декади, т.к. вона " +
								" не обрана для розрахунку");				
					} else {					
						throw new EnergyproSystemException("Неможливо змінити суми для другої декади, т.к. поточна дата вже більше (" +
							new SimpleDateFormat("dd.mm.yyyy").format(currentDate));
					}
				}
			}
			if(!decades.contains(3)) {
				if(object.sum1dec3.compareTo(oldObject.sum1dec3) != 0
						|| object.sum2dec3.compareTo(oldObject.sum2dec3) != 0
						|| object.sum3dec3.compareTo(oldObject.sum3dec3) != 0
						|| object.sum4dec3.compareTo(oldObject.sum4dec3) != 0
						|| object.sum5dec3.compareTo(oldObject.sum5dec3) != 0
						|| object.sum6dec3.compareTo(oldObject.sum6dec3) != 0
						|| object.sum7dec3.compareTo(oldObject.sum7dec3) != 0) {
					if(!vecDecadesToCalculate.contains(1)) {
						throw new EnergyproSystemException("Неможливо змінити суми для третьої декади, т.к. вона " +
								" не обрана для розрахунку");				
					} else {					
						throw new EnergyproSystemException("Неможливо змінити суми для третьої декади, т.к. поточна дата вже більше (" +
							new SimpleDateFormat("dd.mm.yyyy").format(currentDate));
					}
				}
			}
			
			Hashtable<String, ENFuelDistributionSheetItem> depCodeAndDecade2Item = new Hashtable<String, ENFuelDistributionSheetItem>();
			// цена с НДС для соответствующего типа топлива (бензин 95= цена 95 бензина, бензин 92= цена 92 бензина, дп = цена дизтоплива)
			TKFuelType ftObj = ftDAO.getObject(object.fuelTypeRef.code);
            TKMaterials matObj =  matDAO.getObject(ftObj.materialRef.code);
            BigDecimal priceWithNDS = matObj.cost.multiply(new BigDecimal(1.2)).setScale(3, BigDecimal.ROUND_HALF_UP);
			
			ENFuelDistributionSheetItemFilter fuelDistrItemFilter = new ENFuelDistributionSheetItemFilter();
			fuelDistrItemFilter.fuelDistributionRef.code = object.code;
			
			ENFuelDistributionSheetItemShortList fuelDistrItemList = fuelDistrItemDAO.getScrollableFilteredList(fuelDistrItemFilter,0,-1);
			
		    Hashtable<Integer, ENFuelDistributionSheetDepartmentInfo> depList = depLogic.getHashtableOfDepartmentInfoForENFuelDistributionSheet();

			BigDecimal[] totalQtyDecs = {new BigDecimal(0), new BigDecimal(0), new BigDecimal(0)};
						
			switch(typeActivity) {
			case ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES:
				totalQtyDecs[0] = object.sum1dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum1dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum1dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK:
				totalQtyDecs[0] = object.sum2dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum2dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum2dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP:
				totalQtyDecs[0] = object.sum3dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum3dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum3dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER:
				totalQtyDecs[0] = object.sum4dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum4dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum4dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU:
				totalQtyDecs[0] = object.sum5dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum5dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum5dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR:
				totalQtyDecs[0] = object.sum6dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum6dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum6dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;
			case ENConsts.ENFUELDISTRIBUTIONSHEET_OVB:
				totalQtyDecs[0] = object.sum7dec1.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[1] = object.sum7dec2.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				totalQtyDecs[2] = object.sum7dec3.divide(priceWithNDS, 2, BigDecimal.ROUND_HALF_UP);
				break;	
			}
			
			BigDecimal[] totalCountFuelNeededDecs = {new BigDecimal(0), new BigDecimal(0), new BigDecimal(0)};
			
			Hashtable<Integer, BigDecimal> items2CountNeeded = new Hashtable<Integer, BigDecimal>();
			
			for(int i = 0; i < fuelDistrItemList.size(); i++) {
					if(!decades.contains(fuelDistrItemList.get(i).decadeNumber)) {
						// Если декаду этой строки рассчитывать нельзя, то пропускаем строку идем дальше по циклу
						continue;
					}
					BigDecimal tempCount = null;
					if(fuelDistrItemList.get(i).isConfirmed != ENFuelDistributionSheetItem.CONFIRMED) {
						switch(typeActivity) {
						case ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES:
							// tempCount = travShLog.getCountPMMFromNPWByServices(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/).setScale(2, BigDecimal.ROUND_HALF_UP);
							tempCount = travShLog.getCountPMMNpzPlan(fuelDistrItemList.get(i).departmentRefCode, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/, ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES ).setScale(2, BigDecimal.ROUND_HALF_UP);
							break;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK:	
							//tempCount = travShLog.getCountPMMFromNPWByGeneralWork(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/).setScale(2, BigDecimal.ROUND_HALF_UP);
							tempCount = travShLog.getCountPMMNpzPlan(fuelDistrItemList.get(i).departmentRefCode, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/, ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK ).setScale(2, BigDecimal.ROUND_HALF_UP);
							break;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP:	
							//tempCount = travShLog.getCountPMMFromNPWByVKBIP(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/).setScale(2, BigDecimal.ROUND_HALF_UP);
							tempCount = travShLog.getCountPMMNpzPlan(fuelDistrItemList.get(i).departmentRefCode, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/, ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP ).setScale(2, BigDecimal.ROUND_HALF_UP);
							break;	
							
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER:	
							//tempCount = travShLog.getCountPMMFromNPWByVKBOther(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/).setScale(2, BigDecimal.ROUND_HALF_UP);
							tempCount = travShLog.getCountPMMNpzPlan(fuelDistrItemList.get(i).departmentRefCode, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/, ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER ).setScale(2, BigDecimal.ROUND_HALF_UP);
							break;	
							
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU:	
							//tempCount = travShLog.getCountPMMFromNPWByVRTU(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/).setScale(2, BigDecimal.ROUND_HALF_UP);
							tempCount = travShLog.getCountPMMNpzPlan(fuelDistrItemList.get(i).departmentRefCode, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber/*decade*/, object.monthGen/*month*/, object.yearGen /*year*/, ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU ).setScale(2, BigDecimal.ROUND_HALF_UP);
							break;	
						case ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR:
							// разделял на типы топлива boolean isDiesel = (object.fuelTypeRef.code == TKFuelType.DT ? true : false);
							
							int budgetRefCode = Integer.MIN_VALUE;
							switch(fuelDistrItemList.get(i).departmentRefCode) {
							case 73:
								budgetRefCode = 75000006;
								break;
							case 675:
								budgetRefCode = 75000018;
								break;
							case 775:
								budgetRefCode = 50000007;
								break;
							case 70:
								budgetRefCode = 75000023;
								break;
							case 91:
								budgetRefCode = 75000005;
								break;
							case 79:
								budgetRefCode = 75000012;								
								break;
							case 71:
								budgetRefCode = 75000014;
								break;
							case 3:
								budgetRefCode = -1;
								break;
							}
							
							int depCode = Integer.MIN_VALUE;							
							if(fuelDistrItemList.get(i).departmentRefCode == 73
									|| fuelDistrItemList.get(i).departmentRefCode == 675
									|| fuelDistrItemList.get(i).departmentRefCode == 775
									|| fuelDistrItemList.get(i).departmentRefCode == 70
									|| fuelDistrItemList.get(i).departmentRefCode == 91
									|| fuelDistrItemList.get(i).departmentRefCode == 79
									|| fuelDistrItemList.get(i).departmentRefCode == 71) {
								depCode = 3;
							} else {
								depCode = fuelDistrItemList.get(i).departmentRefCode;
							}

							
							
							tempCount = travShLog.getCountAVRFuelFromNormativeVolumes(/*isDiesel*/object.fuelTypeRef.code, depList.get(depCode).departmentCodesDown, budgetRefCode).divide(new BigDecimal(3), 2, BigDecimal.ROUND_HALF_UP);
							break;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_OVB:							
							tempCount = travShLog.getCountPMMByOVB(depList.get(fuelDistrItemList.get(i).departmentRefCode).departmentCodesDown, object.fuelTypeRef.code, fuelDistrItemList.get(i).decadeNumber, monthForOVB, yearForOVB).setScale(2, BigDecimal.ROUND_HALF_UP);
						}						
					} else {
						// Если количество утвержденное, то записывается, то количество, что есть на строке
						switch(typeActivity) {
						case ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES:
							tempCount = fuelDistrItemList.get(i).count1;
							break;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK:	
							tempCount = fuelDistrItemList.get(i).count2;
							break;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP:	
							tempCount = fuelDistrItemList.get(i).count3;
							break;	
							
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER:	
							tempCount = fuelDistrItemList.get(i).count4;
							break;	
						case ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU:	
							tempCount = fuelDistrItemList.get(i).count5;
							break;	
						case ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR:
							tempCount = fuelDistrItemList.get(i).count6;
						case ENConsts.ENFUELDISTRIBUTIONSHEET_OVB:
							tempCount = fuelDistrItemList.get(i).count7;							
							break;	
						}
					}
					

					totalCountFuelNeededDecs[fuelDistrItemList.get(i).decadeNumber - 1] = totalCountFuelNeededDecs[fuelDistrItemList.get(i).decadeNumber - 1].add(tempCount);
					items2CountNeeded.put(fuelDistrItemList.get(i).code, tempCount);
			}
			
			// Для АВР если стоимость не стоит - значит идем от обратного - берется та сумма что в нормативах указана
			if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR) {
				if(object.sum6.compareTo(new BigDecimal(0)) == 0) {
					BigDecimal totalCount = new BigDecimal(0);
					for(int i = 0; i < totalCountFuelNeededDecs.length; i++) {
						totalCount = totalCount.add(totalCountFuelNeededDecs[i]);
					}
					object.sum6 = totalCount.multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					totalQtyDecs[0] = totalCountFuelNeededDecs[0];
					totalQtyDecs[1] = totalCountFuelNeededDecs[1];
					totalQtyDecs[2] = totalCountFuelNeededDecs[2];
					object.sum6dec1 = totalQtyDecs[0].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					object.sum6dec2 = totalQtyDecs[1].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					object.sum6dec3 = totalQtyDecs[2].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					

				}
			}
			
			// Для ОВБ - также
			if(typeActivity == ENConsts.ENFUELDISTRIBUTIONSHEET_OVB) {
				if(object.sum7.compareTo(new BigDecimal(0)) == 0) {
					BigDecimal totalCount = new BigDecimal(0);
					for(int i = 0; i < totalCountFuelNeededDecs.length; i++) {
						totalCount = totalCount.add(totalCountFuelNeededDecs[i]);
					}
					object.sum7 = totalCount.multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					totalQtyDecs[0] = totalCountFuelNeededDecs[0];
					totalQtyDecs[1] = totalCountFuelNeededDecs[1];
					totalQtyDecs[2] = totalCountFuelNeededDecs[2];
					object.sum7dec1 = totalQtyDecs[0].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					object.sum7dec2 = totalQtyDecs[1].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					object.sum7dec3 = totalQtyDecs[2].multiply(priceWithNDS).setScale(2, BigDecimal.ROUND_HALF_UP);
					

				}
			}
			
			// Коэффициенты по декадам
			
			// Разнесенные колва по декадам
			BigDecimal[] totalQtiesDistributed = {new BigDecimal(0), new BigDecimal(0), new BigDecimal(0)};
			
			for(int i = 0; i < fuelDistrItemList.size(); i++) {
					if(!decades.contains(fuelDistrItemList.get(i).decadeNumber)) {
						// Если декаду этой строки рассчитывать нельзя, то пропускаем строку идем дальше по циклу
						continue;
					}
					BigDecimal koef = null;
					BigDecimal tempCount = null;
					if(fuelDistrItemList.get(i).isConfirmed == ENFuelDistributionSheetItem.CONFIRMED) {
						// Если строка утвержденная, то записывается то количество ,что у нее уже есть
						tempCount = items2CountNeeded.get(fuelDistrItemList.get(i).code);
					} else {
						if(totalCountFuelNeededDecs[fuelDistrItemList.get(i).decadeNumber - 1].compareTo(new BigDecimal(0)) != 0) {
							koef = items2CountNeeded.get(fuelDistrItemList.get(i).code).divide(totalCountFuelNeededDecs[fuelDistrItemList.get(i).decadeNumber - 1], 18, BigDecimal.ROUND_HALF_UP);						
						} else {
							koef = new BigDecimal(0);
						}
						tempCount = totalQtyDecs[fuelDistrItemList.get(i).decadeNumber - 1].multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
					}

					items2CountNeeded.put(fuelDistrItemList.get(i).code, tempCount);
					totalQtiesDistributed[fuelDistrItemList.get(i).decadeNumber - 1] = totalQtiesDistributed[fuelDistrItemList.get(i).decadeNumber - 1].add(tempCount);
			}
			
			for(int z = 0; z < 3; z++) {
				if(!decades.contains((z+1))) {
					continue;
				}
				BigDecimal delta = totalQtyDecs[z].subtract(totalQtiesDistributed[z]);
				if(delta.compareTo(new BigDecimal(0)) != 0) {
					for(int i = 0; i < fuelDistrItemList.size(); i++) {
						if(!decades.contains(fuelDistrItemList.get(i).decadeNumber)
								|| fuelDistrItemList.get(i).isConfirmed == ENFuelDistributionSheetItem.CONFIRMED) {
							// Если декаду этой строки рассчитывать нельзя, то пропускаем строку идем дальше по циклу
							// + если строка уже утвержденная
							continue;
						}
						if(delta.compareTo(new BigDecimal(0)) == 0) {
							break;
						}
						if(fuelDistrItemList.get(i).decadeNumber == (z + 1)){
							BigDecimal tempCount = items2CountNeeded.get(fuelDistrItemList.get(i).code);
							if(tempCount.compareTo(delta.abs()) == 1) {
								tempCount = tempCount.add(delta);
								delta = new BigDecimal(0);
								items2CountNeeded.put(fuelDistrItemList.get(i).code, tempCount);
							}
						}
					}
				}
			}
			
			Enumeration<Integer> itemCodes = items2CountNeeded.keys();
			while(itemCodes.hasMoreElements()) {
				int code = itemCodes.nextElement();
				ENFuelDistributionSheetItem item = fuelDistrItemDAO.getObject(code);
				
				if(!decades.contains(item.decadeNumber)) {
					// Если декаду этой строки рассчитывать нельзя, то пропускаем строку идем дальше по циклу
					continue;
				}
				
				switch(typeActivity) {
				case ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES:
					item.count1 = items2CountNeeded.get(code);
					break;
				
				case ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK:
					item.count2 = items2CountNeeded.get(code);
					break;
				
				case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP:
					item.count3 = items2CountNeeded.get(code);
					break;	
					
				case ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER:
					item.count4 = items2CountNeeded.get(code);
					break;	
					
				case ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU:
					item.count5 = items2CountNeeded.get(code);
					break;		
					
				case ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR:
					item.count6 = items2CountNeeded.get(code);
					break;	
				case ENConsts.ENFUELDISTRIBUTIONSHEET_OVB:
					item.count7 = items2CountNeeded.get(code);
					break;						
					
					
				}
				fuelDistrItemDAO.save(item);
			}
			
			object.totalSum = object.sum1.add(object.sum2).add(object.sum3).add(object.sum4).add(object.sum5).add(object.sum6).add(object.sum7);
			fuelDistDAO.save(object);
			ENFuelDistributionSheet fuelDistrSheetObj = fuelDistDAO.getObject(object.code);
			
			
			return fuelDistrSheetObj;
			
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		}
		finally {
			
		}
	}

	
	
	/* ENFuelDistributionSheet. Удалить */
	public void remove(int code) {
		try {
			ENFuelDistributionSheetDAO objectDAO = new ENFuelDistributionSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENFuelDistributionSheetItemDAO objectItemDAO = new ENFuelDistributionSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENFuelDistributionSheetItemFilter objectItemFilter = new ENFuelDistributionSheetItemFilter();
			objectItemFilter.fuelDistributionRef.code = code;
			

			int[] objectItemArr = objectItemDAO.getFilteredCodeArray(objectItemFilter, 0, -1);
			
			for(int i = 0; i < objectItemArr.length; i++) {
				objectItemDAO.remove(objectItemArr[i]);
			}
			
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelDistributionSheet%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	

	
} // end of EJB Controller for ENFuelDistributionSheet