
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright ? 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBaseCalculationDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBasePartialWriteOffShort;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseShort;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseCalculationFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseOutOfUseFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseCalculationShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseOutOfUseShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBasePartialWriteOffShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseShortList;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for RegulatoryAssetBaseCalculation;
 *
 */

public class RegulatoryAssetBaseCalculationDAO extends RegulatoryAssetBaseCalculationDAOGen {

    public RegulatoryAssetBaseCalculationDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBaseCalculationDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public Date getMaxDate() {
    	return BaseDAOUtils.executeStatementAndReadObject(getConnection(), "SELECT max(period) FROM regulatoryasstbsclcltn"
    			, null, new BaseDAOUtils.DateFromResultSetTransformator(), false);
    }
    
    public RegulatoryAssetBaseCalculationShortList getListOnPeriod(RegulatoryAssetBaseCalculationFilter calculationFilter, Date periodTo, int offset, int quantity) {
    	
    	if(offset < 0) throw new java.lang.IllegalArgumentException("offset is lesser than zero");
    	Date firstDayOfMonth = Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(calculationFilter.getPeriod()));
    	Date firstDayOfMonthTo = Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(periodTo));
    	String sql =  "SELECT  \n " +
    			 "regulatoryassetbase.code \n " +
    			 ", regulatoryassetbase.inventorynumber \n " +
    			 ", regulatoryassetbase.name \n " +
    			 ", regulatoryassetbase.incomedate \n " +
    			 ", regulatoryassetbase.documentnumber \n" +
    			 ", regulatoryassetbase.originalvalue \n " +
    			 ", regulatoryassetbase.usefullife \n " +
    			 ", regulatoryassetbase.initial \n " +
    			 ", regulatoryassetbase.grouprefcode \n " +
    			 ", regulatoryassetbase.fundingsourcerefcode \n " +
    			 ", regulatoryassetbase.writeoffnumber \n " +
    			 ", regulatoryassetbase.writeoffdate \n " +
    			 ", regulatoryassetbase.investition \n" +
    			 ", regulatoryassetbase.investitionprogramname \n" +
    			 ", regulatoryassetbase.investitionprogramyear \n" +
    			 ", regulatoryassetbase.investitionprogramcphr \n" +
    			 ", regulatoryassetbase.connection \n" +
    			 ", regulatoryassetbase.connectionnumber \n" +
    			 ", regulatoryassetbase.connectiondate \n" +
    			 ", regulatoryassetbase.connectioncontragent \n" +
    			 ", regulatoryassetbase.categorycode \n" +
    			 ", regulatoryassetbase.parentrefcode \n" +
    			 ", regulatoryassetbasegrp.number AS group_number \n " +
    			 ", regulatoryassetbasegrp.name AS group_name \n " +
    			 ", regulatorsstbsfndngsrc.name AS funding_source_name \n " +    			 
    			 ", regulatoryasstbsclcltn.code AS period_code \n " +
    			 ", regulatoryasstbsclcltn.period AS period \n " +
    			 ", regulatoryasstbsclcltn.originalvalue AS originalvalue_period \n " +
    			 ", regulatoryasstbsclcltn.depreciation \n " +
    			 ", regulatoryasstbsclcltn.residualvalue \n " +
    			 ", regulatoryasstbsclcltn.writtenoffvalue \n" +
    			 ", regulatoryasstbsclcltn.usefullife AS usefullife_period \n" +
    			 "FROM regulatoryassetbase LEFT JOIN (SELECT DISTINCT ON(assetrefcode) assetrefcode, code, period \n" +
    			 " , originalvalue \n" +
    			 " , depreciation \n" +
    			 " , residualvalue \n" +
    			 " , writtenoffvalue \n" +
    			 " , usefullife FROM ( \n" +
    			 " SELECT \n" +
    			 "  assetrefcode \n" +
    			 "	, last_value(code) OVER period_desc AS code \n" +
    			 "	, ? AS period \n" +
    			 "  , first_value(originalvalue) OVER period_asc AS originalvalue \n" +
    			 "  , sum(depreciation) OVER(PARTITION BY assetrefcode) AS depreciation \n" +
    			 "  , last_value(residualvalue) OVER period_desc AS residualvalue \n" +
    			 "  , last_value(writtenoffvalue) OVER period_desc AS writtenoffvalue \n" +    			 
    			 "  , last_value(usefullife) OVER period_desc AS usefullife \n" +
    			 "	FROM regulatoryasstbsclcltn \n" +
    			 "	WHERE period BETWEEN ? and ? \n" +
    			 " WINDOW period_asc AS (PARTITION BY assetrefcode ORDER BY period ASC) \n" +
    			 " , period_desc AS (PARTITION BY assetrefcode ORDER BY period DESC) \n" +
    			 ") AS calc) AS regulatoryasstbsclcltn ON regulatoryassetbase.code = regulatoryasstbsclcltn.assetrefcode \n " +
    			 " LEFT JOIN regulatoryassetbasegrp ON regulatoryassetbase.grouprefcode = regulatoryassetbasegrp.code \n " +
    			 " LEFT JOIN regulatorsstbsfndngsrc ON regulatoryassetbase.fundingsourcerefcode = regulatorsstbsfndngsrc.code \n"+
    			 " WHERE (regulatoryassetbase.writeoffdate IS NULL OR regulatoryassetbase.writeoffdate >= ?)"
    			 + " AND (regulatoryassetbase.incomedate <= ?)";
    	
    	Map.Entry<String, Vector<Object>> conditionWithParameters = this.getConditionAndParametersByFilter(calculationFilter, true);
    	if(conditionWithParameters.getKey() != null)  sql += " AND " + conditionWithParameters.getKey();
    	
    	sql += " ORDER BY " + ((calculationFilter.orderBySQL != null && calculationFilter.orderBySQL.trim().length() > 0) 
			?  calculationFilter.orderBySQL.trim() : "regulatoryassetbase.inventorynumber ASC")
    			 + " OFFSET ?" + (quantity >= 0 ? " LIMIT ?" : "");
    	Vector<Object> binded = conditionWithParameters.getValue();
    	binded.insertElementAt(Tools.getLastDayOfMonth(firstDayOfMonthTo), 0);   
    	binded.insertElementAt(firstDayOfMonth, 0);
    	binded.insertElementAt(firstDayOfMonthTo, 0);
    	binded.insertElementAt(firstDayOfMonth, 0);
    	binded.insertElementAt(firstDayOfMonth, 0);
    	binded.add(offset);
    	if(quantity >= 0) {
    		binded.add(quantity);
    	}
    	List<RegulatoryAssetBaseCalculationShort> list = BaseDAOUtils.executeStatementAndReadObjects(getConnection(), sql, binded, (set) -> {
    		RegulatoryAssetBaseCalculationShort object = new RegulatoryAssetBaseCalculationShort();
    		object.code = Integer.MIN_VALUE;
    		object.period = set.getDate("period");
    		object.originalValue = set.getBigDecimal("originalvalue_period");
    		object.depreciation = set.getBigDecimal("depreciation");
    		object.residualValue = set.getBigDecimal("residualvalue");
    		object.writtenOffValue = set.getBigDecimal("writtenoffvalue");
    		object.usefulLife = set.getInt("usefullife_period");
    		if(set.wasNull()) object.usefulLife = Integer.MIN_VALUE;
    		object.assetRefWriteOffNumber = set.getString("writeoffnumber");
    		object.assetRefWriteOffDate = set.getDate("writeoffdate");
    		object.assetRefCode = set.getInt("code");
    		object.assetRefInventoryNumber = set.getString("inventoryNumber");
    		object.assetRefName = set.getString("name");
    		object.assetRefIncomeDate = set.getDate("incomedate");
    		object.assetRefDocumentNumber = set.getString("documentnumber");
    		object.assetRefOriginalValue = set.getBigDecimal("originalValue");
    		object.assetRefInitial = set.getBoolean("initial");
    		object.assetRefInvestition = set.getBoolean("investition");
			if (set.wasNull()) object.assetRefInvestition = null;
			object.assetRefInvestitionProgramName = set.getString("investitionprogramname");
			object.assetRefInvestitionProgramYear = set.getInt("investitionprogramyear");
			if (set.wasNull()) object.assetRefInvestitionProgramYear = Integer.MIN_VALUE;
			object.assetRefInvestitionProgramCipher = set.getString("investitionprogramcphr");
			object.assetRefConnection = set.getBoolean("connection");
			if (set.wasNull()) object.assetRefConnection = null;
			object.assetRefConnectionNumber = set.getString("connectionnumber");
			object.assetRefConnectionDate = set.getDate("connectiondate");
			object.assetRefConnectionContragent = set.getString("connectioncontragent");
			object.assetRefCategoryCode = set.getInt("categorycode");
			if (set.wasNull()) object.assetRefCategoryCode = Integer.MIN_VALUE;
			object.assetRefParentRefCode = set.getInt("parentrefcode");
			if(set.wasNull()) object.assetRefParentRefCode = Integer.MIN_VALUE;
			object.assetRefFundingSourceRefCode = set.getInt("fundingsourcerefcode");
			if(set.wasNull()) object.assetRefFundingSourceRefCode = Integer.MIN_VALUE;
			object.assetRefFundingSourceRefName = set.getString("funding_source_name");

    		
    		if(object.originalValue != null) {
        		object.originalValue = object.originalValue.setScale(2, BigDecimal.ROUND_HALF_UP);    			
    		}
    		if(object.depreciation != null) {
        		object.depreciation = object.depreciation.setScale(2, BigDecimal.ROUND_HALF_UP);   			
    		}
    		if(object.residualValue != null) {
        		object.residualValue = object.residualValue.setScale(2, BigDecimal.ROUND_HALF_UP);    			
    		}
    		if(object.assetRefOriginalValue != null) {
        		object.assetRefOriginalValue = object.assetRefOriginalValue.setScale(2, BigDecimal.ROUND_HALF_UP);    			
    		}
    		if(object.writtenOffValue != null) {
    			object.writtenOffValue = object.writtenOffValue.setScale(2, BigDecimal.ROUND_HALF_UP);  
    		}
    		
    		object.assetRefGroupRefCode = set.getInt("groupRefCode");
    		if(set.wasNull()) object.assetRefGroupRefCode = Integer.MIN_VALUE;
    		object.assetRefGroupRefNumber = set.getString("group_number");
    		object.assetRefGroupRefName = set.getString("group_name");
    		object.assetRefUsefulLife = set.getInt("usefullife");
    		if(set.wasNull()) object.assetRefUsefulLife = Integer.MIN_VALUE;
    		return object;
    	}, false);
    	
    	RegulatoryAssetBaseCalculationShortList shortList = new RegulatoryAssetBaseCalculationShortList();
    	shortList.list = new Vector<>(list);
    	shortList.totalCount = shortList.list.size();
    	if(quantity < 0) {
    		RegulatoryAssetBaseCalculationShort summaryValues = new RegulatoryAssetBaseCalculationShort();
    		int overallCount = this.getCountOnDate(Tools.getLastDayOfMonth(firstDayOfMonthTo));
    		if(shortList.totalCount != overallCount) {
    			summaryValues.assetRefName = String.format("Кіль-ть: %d із %d", shortList.totalCount, overallCount);
    		} else {
    			summaryValues.assetRefName = String.format("Кіль-ть: %d", shortList.totalCount);
    		}
    		summaryValues.originalValue = shortList.list.stream().map(RegulatoryAssetBaseCalculationShort::getOriginalValue).filter(e -> e != null)
    				.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
    		summaryValues.depreciation = shortList.list.stream().map(RegulatoryAssetBaseCalculationShort::getDepreciation).filter(e -> e != null)
    				.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
    		summaryValues.residualValue = shortList.list.stream().map(RegulatoryAssetBaseCalculationShort::getResidualValue).filter(e -> e != null)
    				.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
    		summaryValues.writtenOffValue = shortList.list.stream().map(RegulatoryAssetBaseCalculationShort::getWrittenOffValue).filter(e -> e != null)
    				.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
    		summaryValues.assetRefOriginalValue = shortList.list.stream().map(RegulatoryAssetBaseCalculationShort::getAssetRefOriginalValue).filter(e -> e != null)
    				.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
    		shortList.setSummaryValues(summaryValues);
    	} else {
        	shortList.setSummaryValues(this.getSummaryValues(calculationFilter, periodTo));    		
    	}
    	
    	return shortList;
    }
    
    private static RegulatoryAssetBaseCalculation transformShortForCalculation(RegulatoryAssetBaseCalculationShort item) {
		RegulatoryAssetBaseCalculation calculation = new RegulatoryAssetBaseCalculation();
		calculation.assetRef.code = item.assetRefCode;
		calculation.originalValue = item.originalValue;
		calculation.depreciation = item.depreciation;
		calculation.residualValue = item.residualValue;
		calculation.period = item.period;
		calculation.usefulLife = item.usefulLife;
		calculation.writtenOffValue = item.writtenOffValue;
		
		if(item.writtenOffValueInPeriod != null && item.writtenOffValueInPeriod.compareTo(item.originalValue) == 1) {
			throw new SystemException(String.format("\n\nПомилка при розрахунку!\n"
					+ " Сума ліквідації за період %s більша ніж первісна вартість активу з інв. № %s на початок цього періоду (%s > %s)\n\n"
					, new SimpleDateFormat("MM.yyyy").format(calculation.period), item.assetRefInventoryNumber, item.writtenOffValueInPeriod, item.originalValue));
		}
		
		return calculation;
    }
    
    public void calculate(Date period) throws PersistenceException {
    	DateFormat dateFormat = Tools.dateFormatDefault;
    	Date startPeriod = null;
    	try {
        	startPeriod = dateFormat.parse("01.01.2021");
    	} catch(ParseException e) {}
    	if(startPeriod.compareTo(period) == 1) {                                                                          
    		throw new SystemException(String.format("Дата переходу до стимулюючого регулювання більша за дату розрахунку (%s > %s)"
    			, dateFormat.format(startPeriod), dateFormat.format(period)));
    	}
    	Date firstDay = Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(period));
        
    	Date maxPersistedDate = this.getMaxDate();
    	Date calculatedDate = maxPersistedDate == null ? startPeriod : maxPersistedDate;
    	if(maxPersistedDate != null) {
    		if(maxPersistedDate.compareTo(firstDay) >= 0) {                                                                          
    			throw new SystemException(String.format("Дані вже пораховані на період %s"
    				, dateFormat.format(firstDay)));
    		}
    		Calendar calendar = Calendar.getInstance();
    		calendar.setTime(maxPersistedDate);
    		calendar.add(Calendar.MONTH, 1);
    		calculatedDate = calendar.getTime();
    	}
                             
    	List<RegulatoryAssetBaseCalculationShort> calculations = this.getListForCalculations(calculatedDate, Tools.countMonths(calculatedDate, firstDay), null);
    	List<RegulatoryAssetBaseCalculation> objects = calculations.stream().map(RegulatoryAssetBaseCalculationDAO::transformShortForCalculation).collect(Collectors.toList());
    	this.addBatch(objects);                                             
    }
    
    public void recalculateAsset(RegulatoryAssetBase asset) throws PersistenceException {
    	
    	List<Integer> calculationCodes = null;
    	if(asset.code != Integer.MIN_VALUE) calculationCodes = this.removeByAssetCode(asset.code);
    	
    	Date firstDayOfIncomeMonth = Tools.getFirstDayOfMonth(asset.incomeDate);
    	Date firstDayOfLastMonth = Tools.getFirstDayOfMonth((asset.writeOffDate == null) ? this.getMaxDate() : asset.writeOffDate); 
    	
    	List<RegulatoryAssetBaseCalculationShort> calculations = this.getListForCalculations(firstDayOfIncomeMonth, Tools.countMonths(firstDayOfIncomeMonth, firstDayOfLastMonth), asset);
    	List<RegulatoryAssetBaseCalculation> objects = calculations.stream().map(RegulatoryAssetBaseCalculationDAO::transformShortForCalculation).collect(Collectors.toList());
    	this.addBatch(objects, calculationCodes);
    	this.recalculatePercentageForPartialWriteOffs(asset);
    }
    
    public void recalculatePercentageForPartialWriteOffs(RegulatoryAssetBase asset) throws PersistenceException {
    	RegulatoryAssetBasePartialWriteOffDAO dao = new RegulatoryAssetBasePartialWriteOffDAO(this.getConnection(), this.getUserProfile());
    	List<RegulatoryAssetBasePartialWriteOff> list = dao.getListByAsset(asset);
    	for(RegulatoryAssetBasePartialWriteOff writeOff : list) {
    		RegulatoryAssetBaseCalculationShort state = this.getShortObjectOnPeriod(asset, writeOff.writeOffDate);
    		if(state != null) {
    			BigDecimal percentage = new BigDecimal(writeOff.value.doubleValue() / state.originalValue.doubleValue()).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
    			if(percentage.compareTo(writeOff.percentage) != 0) {
    				writeOff.percentage = percentage;
    				dao.save(writeOff);
    			}
    		}
    	}
    }
    
    public List<Integer> removeByAssetCode(int assetCode) {
    	
    	List<Integer> codes = BaseDAOUtils.executeStatementAndReadObjects(getConnection(), "SELECT code::integer FROM regulatoryasstbsclcltn WHERE assetrefcode = ?",Arrays.asList(assetCode)
    			, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    	
    	BaseDAOUtils.executeUpdate(getConnection(), "DELETE FROM regulatoryasstbsclcltn WHERE assetrefcode = ?", Arrays.asList(assetCode), false);
    	
    	return codes;
    }
    
    public List<RegulatoryAssetBaseCalculationShort> getListForCalculations(Date startPeriod, int countMonths, RegulatoryAssetBase asset) throws PersistenceException {
    	List<RegulatoryAssetBaseCalculationShort> result = new ArrayList<RegulatoryAssetBaseCalculationShort>();
    	if(countMonths < 0) {
    		throw new java.lang.IllegalArgumentException();
    	}
    	RegulatoryAssetBaseFilter assetFilter = new RegulatoryAssetBaseFilter();
    	RegulatoryAssetBasePartialWriteOffFilter writeOffFilter = new RegulatoryAssetBasePartialWriteOffFilter();
    	RegulatoryAssetBaseOutOfUseFilter outOfUseFilter = new RegulatoryAssetBaseOutOfUseFilter();
    	if(asset != null) {
    		if(asset.code == Integer.MIN_VALUE) throw new SystemException("code is Integer.MIN_VALUE");
        	assetFilter.code = asset.code;
        	writeOffFilter.assetRef.code = asset.code;
        	outOfUseFilter.assetRef.code = asset.code;
    	}
    	
    	RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getConnection(), getUserProfile());
    	RegulatoryAssetBasePartialWriteOffDAO writeOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getConnection(), getUserProfile());
    	RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getConnection(), getUserProfile());
    	
    	RegulatoryAssetBaseShortList assetList = assetDao.getScrollableFilteredList(assetFilter, 0, -1);
    	RegulatoryAssetBasePartialWriteOffShortList writeOffList = writeOffDao.getScrollableFilteredList(writeOffFilter, 0, -1);
    	RegulatoryAssetBaseOutOfUseShortList outOfUseList = outOfUseDao.getScrollableFilteredList(outOfUseFilter, 0, -1);
    	


    	Set<LocalDate> periods = IntStream.rangeClosed(0, countMonths).boxed().map(i -> Tools.addMonth(startPeriod, i))
    			.map(Tools::dateToLocalDate)
    			.sorted().collect(Collectors.toSet());
    	
    	Map<Integer, RegulatoryAssetBaseShort> assetsByCode = assetList.list.stream().collect(Collectors.toMap(e -> e.code, e -> e));

    	Map<RegulatoryAssetBaseShort, Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>>> writeOffs = groupWriteOffsListByAssetsAndPeriods(writeOffList, assetsByCode);
    	
    	Map<RegulatoryAssetBaseShort, List<LocalDate>> outOfUsePeriods = this.partitionOutOfUseOnPeriodsAndGroupByAssets(outOfUseList, periods, assetsByCode);
    	
    	for(RegulatoryAssetBaseShort assetItem : assetList.list) {
    		RegulatoryAssetBaseCalculationShort initialCalculation = this.initializeCalculation(assetItem, periods.iterator().next(), writeOffs.get(assetItem), outOfUsePeriods.get(assetItem));
    		Set<LocalDate> calculationPeriods = periods.stream()
    				.filter(p -> p.compareTo(initialCalculation.beginOfUse) >= 0)
    				.filter(p -> (initialCalculation.assetWriteOffPeriod != null) ? p.compareTo(initialCalculation.assetWriteOffPeriod) <= 0 : true)
    				.collect(Collectors.toSet());
    		for(LocalDate period : calculationPeriods) {
        		RegulatoryAssetBaseCalculationShort calculation = this.initializeCalculation(assetItem, period, writeOffs.get(assetItem), outOfUsePeriods.get(assetItem));
    			RegulatoryAssetBaseCalculationShort calculated = perform(calculation);
    			if(calculated != null) result.add(calculated);
    		}
    	}
    	
    	return result;
    }
    
    public RegulatoryAssetBaseCalculationShort getShortObjectOnPeriod(RegulatoryAssetBase asset, Date period) throws PersistenceException {
    	if(asset == null || asset.code == Integer.MIN_VALUE || period == null) throw new NullPointerException("Не заполнен один из обязательных параметров!");
    	RegulatoryAssetBaseCalculationFilter filter = new RegulatoryAssetBaseCalculationFilter();
    	filter.assetRef.code = asset.code;
    	filter.period = Tools.getFirstDayOfMonth(period);
    	RegulatoryAssetBaseCalculationShortList list = this.getScrollableFilteredList(filter, 0, -1);
    	if(list.totalCount == 0) {
    		
    		RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(this.getConnection(), this.getUserProfile());
    		RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(this.getConnection(), this.getUserProfile());
    		RegulatoryAssetBasePartialWriteOffDAO writeOffDao = new RegulatoryAssetBasePartialWriteOffDAO(this.getConnection(), this.getUserProfile());
    		
    		RegulatoryAssetBaseShort assetShort = assetDao.getShortObject(asset.code);
    		Map<Integer, RegulatoryAssetBaseShort> assetsByCode = new HashMap<>();
    		assetsByCode.put(assetShort.code, assetShort);
    		
    		RegulatoryAssetBaseOutOfUseShortList outOfUseList = outOfUseDao.getShortListByAsset(asset);
    		RegulatoryAssetBasePartialWriteOffShortList writeOffList = writeOffDao.getShortListByAsset(asset);
    		Map<RegulatoryAssetBaseShort, Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>>> writeOffs = this.groupWriteOffsListByAssetsAndPeriods(writeOffList, assetsByCode);
    		LocalDate incomeDate = Tools.dateToLocalDate(Tools.getFirstDayOfMonth(asset.incomeDate));
    		LocalDate localDate = Tools.dateToLocalDate(filter.period);
    		Set<LocalDate> periods = new HashSet<>();
    		for(LocalDate temp = incomeDate; temp.compareTo(localDate) <= 0;) {
    			periods.add(temp);
    			temp = temp.plusMonths(1);
    		}
    		Map<RegulatoryAssetBaseShort, List<LocalDate>> outOfUses = partitionOutOfUseOnPeriodsAndGroupByAssets(outOfUseList, periods, assetsByCode);
    		RegulatoryAssetBaseCalculationShort calculation = this.initializeCalculation(assetShort, localDate, writeOffs.get(assetShort), outOfUses.get(assetShort));
    		return this.perform(calculation);
    	} else {
    		if(list.totalCount > 1) throw new SystemException("Error in count");
    		return list.get(0);
    	}
    }
    
    private RegulatoryAssetBaseCalculationShort initializeCalculation(RegulatoryAssetBaseShort asset, LocalDate period
    		, Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>> writeOffs, Collection<LocalDate> outOfUsePeriods) {
    	RegulatoryAssetBaseCalculationShort calculation = new RegulatoryAssetBaseCalculationShort();
    	calculation.code = Integer.MIN_VALUE;
    	calculation.period = Tools.localDateToDate(period);
    	calculation.localPeriod = period;
    	calculation.periodQuarterStart = Tools.dateToLocalDate(Tools.getQuarterStartDate(calculation.period));
    	calculation.assetIncomeDatePeriod = Tools.dateToLocalDate(Tools.getFirstDayOfMonth(asset.incomeDate));
    	calculation.assetRefIncomeDate = asset.incomeDate;
    	calculation.assetIncomeDateQuarterStart = Tools.dateToLocalDate(Tools.getQuarterStartDate(asset.incomeDate));
    	calculation.assetRefCode = asset.code;
    	calculation.assetRefOriginalValue = asset.originalValue;
    	calculation.assetRefName = asset.name;
    	calculation.assetRefInventoryNumber = asset.inventoryNumber;
    	calculation.assetRefUsefulLife = asset.usefulLife;
    	calculation.assetRefWriteOffDate = asset.writeOffDate;
    	calculation.assetWriteOffPeriod = (asset.writeOffDate != null) ? Tools.dateToLocalDate(Tools.getFirstDayOfMonth(asset.writeOffDate)) : null; 
    	/*если не задан признак принадлежности к старой РБА, то подразумевается, что актив принадлежит к новой РБА, то есть false*/
    	calculation.assetRefInitial = (asset.initial != null) ? asset.initial : false;
    	calculation.beginOfUse = (calculation.assetRefInitial) ? calculation.assetIncomeDatePeriod : calculation.assetIncomeDateQuarterStart.plusMonths(3);
    	calculation.writtenOffValue = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	calculation.writtenOffValueInPeriod = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	calculation.writeOffs = (writeOffs == null) ? new HashMap<>() : writeOffs;
    	calculation.outOfUsePeriods = (outOfUsePeriods == null) ? new ArrayList<>() : outOfUsePeriods;
    	
    	return calculation;
    }
    
    private BigDecimal getWriteOffSumOnPeriod(Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>> writeOffs, LocalDate start, LocalDate end) {
		BigDecimal writeOffSum = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
		if(writeOffs != null) {
			writeOffSum = writeOffs.entrySet().stream().filter(e -> e.getKey().compareTo(start) >= 0 && e.getKey().compareTo(end) <= 0)
					.map(e -> e.getValue()).flatMap(List::stream).map(e -> e.getValue())
					.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
		}
		
		return writeOffSum;
    }
    
    private RegulatoryAssetBaseCalculationShort perform(RegulatoryAssetBaseCalculationShort calculation) {
    	
		RegulatoryAssetBaseCalculationShort object = calculation;
		if(calculation.localPeriod.compareTo(calculation.beginOfUse) < 0 
				|| (calculation.assetWriteOffPeriod != null && calculation.localPeriod.compareTo(object.assetWriteOffPeriod) > 0)) return null;

		int usePeriods = 0;
		/*если актив был списан (ликвидирован) в расчетный период*/
		boolean writtenOffInPeriod = object.assetWriteOffPeriod != null && object.assetWriteOffPeriod.compareTo(object.localPeriod) == 0;
		
		BigDecimal originalValueStartQuarter = object.assetRefOriginalValue;
		int usefulLifeOnStartQuarter = object.assetRefUsefulLife;
		BigDecimal writtenOffValueOnStartQuarter = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
		
		for(LocalDate temp = LocalDate.from(object.beginOfUse); temp.compareTo(object.periodQuarterStart) < 0;) {
			LocalDate startQuarter = LocalDate.from(temp);
			temp = temp.plusMonths(3);
			LocalDate endQuarter = LocalDate.from(temp).minusDays(1);
			
			/*Расчет срока эксплуатации в квартале: 3 - и минус те месяца когда */
			int usePeriodsInQuarter = 3 - new Long(object.outOfUsePeriods.stream().filter(e -> e.compareTo(startQuarter) >= 0 && e.compareTo(endQuarter) <= 0).count()).intValue();
			if(usePeriodsInQuarter < 0) throw new SystemException("Помилка у розрахунку!"); 
			usePeriods += usePeriodsInQuarter;
			BigDecimal depreciation = this.calculateDepreciation(originalValueStartQuarter, usefulLifeOnStartQuarter, true);
			usefulLifeOnStartQuarter = this.calculateUsefulLife(usefulLifeOnStartQuarter, usePeriodsInQuarter);
			originalValueStartQuarter = originalValueStartQuarter.subtract(depreciation.multiply(new BigDecimal(usePeriodsInQuarter)));
			BigDecimal writeOffSum = this.getWriteOffSumOnPeriod(object.writeOffs, startQuarter, endQuarter);
			writtenOffValueOnStartQuarter = writtenOffValueOnStartQuarter.add(writeOffSum);
			originalValueStartQuarter = originalValueStartQuarter.subtract(writeOffSum);
		}
		int usePeriodsStartQuarter = usePeriods;
		BigDecimal originalValueStartPeriod = originalValueStartQuarter.add(BigDecimal.ZERO);
		for(LocalDate temp = LocalDate.from(object.periodQuarterStart); temp.compareTo(object.localPeriod) < 0;) {
			LocalDate startPeriod = LocalDate.from(temp);
			boolean isInUseInPeriod = !object.outOfUsePeriods.contains(temp) 
					&& (temp.compareTo(object.assetIncomeDatePeriod) > 0 || (temp.compareTo(object.assetIncomeDatePeriod) == 0 && object.assetRefInitial));
			BigDecimal depreciation = this.calculateDepreciation(originalValueStartQuarter, usefulLifeOnStartQuarter, isInUseInPeriod);
			temp = temp.plusMonths(1);
			LocalDate endPeriod = LocalDate.from(temp).minusDays(1);
			BigDecimal writeOffSum = this.getWriteOffSumOnPeriod(object.writeOffs, startPeriod, endPeriod);
			originalValueStartPeriod = originalValueStartPeriod.subtract(depreciation).subtract(writeOffSum);
			if(isInUseInPeriod) usePeriods++;
		}
		
		
		if(object.writeOffs == null) {
			object.writtenOffValue = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
			object.writtenOffValueInPeriod = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
		} else {
			object.writtenOffValueInPeriod = object.writeOffs.getOrDefault(object.localPeriod, new ArrayList<>())
					.stream().map(RegulatoryAssetBasePartialWriteOffShort::getValue).reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
			object.writtenOffValue = object.writeOffs.entrySet().stream()
					.filter(e -> e.getKey().compareTo(object.localPeriod) <= 0)
					.map(e -> e.getValue())
					.flatMap(List::stream)
					.map(e -> e.getValue())
					.reduce(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP), BigDecimal::add);
		}
		
		boolean isInUse = !object.outOfUsePeriods.contains(object.localPeriod);

		object.depreciation = this.calculateDepreciation(originalValueStartQuarter, usefulLifeOnStartQuarter, isInUse);
		object.originalValue = originalValueStartPeriod;
		if(isInUse) {
			usePeriods++;
			/*если актив был списан в расчетный период, то амортизация в этот период должна начислиться за оставшиеся периоды этого квартала включая заданный*/
			if(writtenOffInPeriod) {
				int usePeriodsEndQuarter = 3 - (usePeriods - usePeriodsStartQuarter);
				object.depreciation = object.depreciation.add(this.calculateDepreciation(originalValueStartQuarter, usefulLifeOnStartQuarter, isInUse)
						.multiply(new BigDecimal(usePeriodsEndQuarter)));
			}
		}
		object.usefulLife = this.calculateUsefulLife(object.assetRefUsefulLife, usePeriods);
		object.residualValue = object.originalValue.subtract(object.depreciation).subtract(object.writtenOffValueInPeriod);
		
		Function<BigDecimal, BigDecimal> lessThanZero = (o) -> {return o.compareTo(BigDecimal.ZERO) < 0 ? BigDecimal.ZERO : o.setScale(2, BigDecimal.ROUND_HALF_UP);};
		
		boolean isLessOrEqualThanZero = object.residualValue.compareTo(BigDecimal.ZERO) < 1;
		
		object.originalValue = lessThanZero.apply(object.originalValue);
		object.residualValue = lessThanZero.apply(object.residualValue);
		if(isLessOrEqualThanZero) {
			object.depreciation = object.originalValue.subtract(object.residualValue).subtract(object.writtenOffValueInPeriod).setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		if(writtenOffInPeriod) {
			object.writtenOffValue = object.writtenOffValue.add(object.residualValue);
			object.residualValue = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
			object.usefulLife = 0;
		}
		return object;
    }
    
    
    private Map<RegulatoryAssetBaseShort, List<LocalDate>> partitionOutOfUseOnPeriodsAndGroupByAssets(RegulatoryAssetBaseOutOfUseShortList outOfUseList, Set<LocalDate> periods
    		, Map<Integer, RegulatoryAssetBaseShort> assetsByCode) {
    	Map<RegulatoryAssetBaseShort, List<LocalDate>> outOfUsePeriods = outOfUseList.list
    			.stream().collect(Collectors.groupingBy(e -> assetsByCode.get(e.assetRefCode)
    					, Collector.of(ArrayList<LocalDate>::new
    							, (list, record) -> {
    								List<LocalDate> periodsForOutOfUseRecord = periods
    										.stream()
    										.filter(period -> period.compareTo(Tools.dateToLocalDate(Tools.getQuarterStartDate(record.dateStart))) >= 0 
    											&&  ((record.dateFinish == null) ? true 
    													: period.compareTo( Tools.dateToLocalDate(Tools.clearTimeOfDate(Tools.getLastDayOfMonth(Tools.addMonth(Tools.getQuarterStartDate(record.dateFinish), 2))))) <= 0))
    										.sorted().collect(Collectors.toList());
    									list.addAll(periodsForOutOfUseRecord);
    							}, (a, b) -> a)));
    	return outOfUsePeriods;
    }
    
    private Map<RegulatoryAssetBaseShort, Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>>> groupWriteOffsListByAssetsAndPeriods(RegulatoryAssetBasePartialWriteOffShortList writeOffList
    		, Map<Integer, RegulatoryAssetBaseShort> assetsByCode) {
    	Map<RegulatoryAssetBaseShort, Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>>> writeOffs = writeOffList.list
    			.stream().collect(Collectors
    					.groupingBy(e -> assetsByCode.get(e.assetRefCode)
    							, Collectors.groupingBy(e -> Tools.dateToLocalDate(Tools.getFirstDayOfMonth(e.writeOffDate)))));
    	return writeOffs;
    }
    
    private int calculateUsefulLife(int usefulLife, int subtrahend) {
    	if(subtrahend < 0) throw new IllegalArgumentException("subtrahend cannot be less than zero!");
    	int result = usefulLife - subtrahend;
    	if(result < 0) result = 0;
    	return result;
    }
    
    private BigDecimal calculateDepreciation(BigDecimal originalValue, int usefulLife, boolean isInUse) {
    	if(usefulLife < 0) throw new IllegalArgumentException();
    	if(usefulLife == 0 || !isInUse) {
    		return BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	} else {
    		return originalValue.divide(new BigDecimal(usefulLife), 3, BigDecimal.ROUND_HALF_UP).setScale(2, BigDecimal.ROUND_HALF_UP);
    	}
    }
    
    private void addBatch(List<RegulatoryAssetBaseCalculation> list) throws PersistenceException {
    	this.addBatch(list, null);
    }
    
    private void addBatch(List<RegulatoryAssetBaseCalculation> list, Collection<Integer> codes) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		Iterator<Integer> codeIterator = (codes != null) ? codes.iterator() : new ArrayList<Integer>().iterator();

		selectStr = "INSERT INTO REGULATORYASSTBSCLCLTN (CODE,PERIOD,ORIGINALVALUE,DEPRECIATION,RESIDUALVALUE,ASSETREFCODE, USEFULLIFE, WRITTENOFFVALUE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			for(RegulatoryAssetBaseCalculation anObject : list) {
				if(codeIterator.hasNext()) {
					anObject.code = codeIterator.next();
				} else {
					_collectAutoIncrementFields(anObject,connection);
				}
				if (anObject.code != Integer.MIN_VALUE ) {
					statement.setInt(1, anObject.code);
				} else {
					statement.setNull(1, java.sql.Types.INTEGER);
				}
				if (anObject.period == null) {
					statement.setDate(2, null);
				} else {
					statement.setDate(2, new java.sql.Date(anObject.period.getTime()));
				}
				if (anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}
				statement.setBigDecimal(3, anObject.originalValue);
				if (anObject.depreciation != null) {
					anObject.depreciation = anObject.depreciation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}
				statement.setBigDecimal(4, anObject.depreciation);
				if (anObject.residualValue != null) {
					anObject.residualValue = anObject.residualValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}
				statement.setBigDecimal(5, anObject.residualValue);
				if (anObject.assetRef.code != Integer.MIN_VALUE){
					statement.setInt(6,anObject.assetRef.code);
				} else {
					statement.setNull(6,java.sql.Types.INTEGER);
				}
				if (anObject.usefulLife != Integer.MIN_VALUE){
					statement.setInt(7, anObject.usefulLife);
				} else {
					statement.setNull(7,java.sql.Types.INTEGER);
				}
				if (anObject.writtenOffValue != null) {
					anObject.writtenOffValue = anObject.writtenOffValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}
				statement.setBigDecimal(8, anObject.writtenOffValue);
				
				statement.addBatch();
			}
			statement.executeBatch();
    	
	    } catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%RegulatoryAssetBaseCalculationDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
    }
    
    private Map.Entry<String, Vector<Object>> getConditionAndParametersByFilter(RegulatoryAssetBaseCalculationFilter calculationFilter, boolean calculationNotNecessary) {
    	if(calculationFilter == null || calculationFilter.getPeriod() == null) throw new java.lang.NullPointerException();
    	RegulatoryAssetBaseDAO assetBaseDao = new RegulatoryAssetBaseDAO(this.getConnection(), this.getUserProfile());
    	RegulatoryAssetBasePartialWriteOffDAO writeOffDao = new RegulatoryAssetBasePartialWriteOffDAO(this.getConnection(), this.getUserProfile());
    	
    	String condition = (calculationNotNecessary) ? " (regulatoryasstbsclcltn.period = ? OR regulatoryasstbsclcltn.period IS NULL) " : " regulatoryasstbsclcltn.period = ? ";
    	condition = BaseDAOUtils.addToCondition(assetBaseDao.buildCondition(calculationFilter.getAssetFilter()), condition, true);
    	condition = BaseDAOUtils.addToCondition(assetBaseDao.getConditionByFromToParameters(calculationFilter.getAssetFilter()), condition, true);
    	condition = BaseDAOUtils.addToCondition(this.getConditionByFromToParameters(calculationFilter), condition, true);
    	
    	String writeOffCondition = BaseDAOUtils.addToCondition(writeOffDao.buildCondition(calculationFilter.partialWriteOffFilter), "", true);
    	writeOffCondition = BaseDAOUtils.addToCondition(writeOffDao.getConditionByFromToParameters(calculationFilter.partialWriteOffFilter), writeOffCondition, true);
    	if(writeOffCondition.trim().length() > 0) {
    		writeOffCondition = String.format("EXISTS (SELECT FROM regulatrsstbsprtlwrtff WHERE regulatrsstbsprtlwrtff.assetrefcode = regulatoryassetbase.code AND %s)", writeOffCondition);
    		condition = BaseDAOUtils.addToCondition(writeOffCondition, condition, true);
    	}
    	
    	Vector<Object> parameters = new Vector<>();
    	parameters.add(Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(calculationFilter.getPeriod())));
    	parameters.addAll(assetBaseDao.getParametersByFilter(calculationFilter.getAssetFilter()));
    	parameters.addAll(assetBaseDao.getFromToParametersByFilter(calculationFilter.getAssetFilter()));
    	parameters.addAll(this.getFromToParametersByFilter(calculationFilter));
    	parameters.addAll(writeOffDao.getParametersByFilter(calculationFilter.getPartialWriteOffFilter()));
    	parameters.addAll(writeOffDao.getFromToParametersByFilter(calculationFilter.getPartialWriteOffFilter()));
    	return new AbstractMap.SimpleImmutableEntry<>(condition, parameters);
    }
    
    private RegulatoryAssetBaseCalculationShort getSummaryValues(RegulatoryAssetBaseCalculationFilter calculationFilter, Date periodTo) {
    	Date firstDayOfMonth = Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(calculationFilter.getPeriod()));
    	Date firstDayOfMonthTo = Tools.getFirstDayOfMonth(Tools.clearTimeOfDate(periodTo));
    	final int overallCount = this.getCountOnDate(Tools.getLastDayOfMonth(firstDayOfMonthTo));
    	String sql =  "SELECT \n " +
    			 " count(regulatoryassetbase.code) \n " +
    			 ",sum(coalesce(regulatoryasstbsclcltn.originalvalue, 0)) \n " +
    			 ",sum(coalesce(regulatoryasstbsclcltn.depreciation, 0)) \n " +
    			 ",sum(coalesce(regulatoryasstbsclcltn.residualvalue, 0))  \n " +
    			 ",sum(coalesce(regulatoryasstbsclcltn.writtenoffvalue, 0))  \n " +
    			 ",sum(coalesce(regulatoryassetbase.originalvalue, 0)) \n " +
    			 "FROM regulatoryassetbase LEFT JOIN (SELECT DISTINCT ON(assetrefcode) assetrefcode, code, period \n" +
    			 ", originalvalue \n" +
    			 ", depreciation \n" +
    			 ", residualvalue \n" +
    			 ", writtenoffvalue \n" +
    			 ", usefullife FROM ( \n" +
    			 "	SELECT \n" +
    			 "		assetrefcode \n" +
    			 "		, last_value(code) OVER period_desc AS code \n" +
    			 "		, ? AS period \n" +
    			 "		, first_value(originalvalue) OVER period_asc AS originalvalue \n" +
    			 "		, sum(depreciation) OVER(PARTITION BY assetrefcode) AS depreciation \n" +
    			 "		, last_value(residualvalue) OVER period_desc AS residualvalue \n" +
    			 "		, last_value(writtenoffvalue) OVER period_desc AS writtenoffvalue \n" +
    			 "		, last_value(usefullife) OVER period_desc AS usefullife \n" +
    			 "	FROM regulatoryasstbsclcltn \n " +
    			 "	WHERE period between ? and ? \n " +
    			 " WINDOW period_asc AS (PARTITION BY assetrefcode ORDER BY period ASC) " +
    			 " , period_desc AS (PARTITION BY assetrefcode ORDER BY period DESC) " +
    			 ") AS calc\n " + 
    			 ") AS regulatoryasstbsclcltn ON (regulatoryassetbase.code = regulatoryasstbsclcltn.assetrefcode) \n" +
    			 " WHERE (regulatoryassetbase.writeoffdate IS NULL OR regulatoryassetbase.writeoffdate >= ?) ";
    	
    	Map.Entry<String, Vector<Object>> conditionWithParameters = this.getConditionAndParametersByFilter(calculationFilter, true);
    	if(conditionWithParameters.getKey() != null) sql += " AND " + conditionWithParameters.getKey();
    	Vector<Object> binded = conditionWithParameters.getValue();
    	binded.insertElementAt(firstDayOfMonth, 0);
    	binded.insertElementAt(firstDayOfMonthTo, 0);
    	binded.insertElementAt(firstDayOfMonth, 0);
    	binded.insertElementAt(firstDayOfMonth, 0);
    	
    	return BaseDAOUtils.executeStatementAndReadObject(getConnection(), sql, conditionWithParameters.getValue(), (set) -> {
    		RegulatoryAssetBaseCalculationShort summaryValues = new RegulatoryAssetBaseCalculationShort();
    		int count = set.getInt(1);
    		if(set.wasNull()) count = Integer.MIN_VALUE;
    		if(count != overallCount) {
    			summaryValues.assetRefName = String.format("Кіль-ть: %d із %d", count, overallCount);
    		} else {
    			summaryValues.assetRefName = String.format("Кіль-ть: %d", count);
    		}
        	summaryValues.originalValue = set.getBigDecimal(2);
        	if(!set.wasNull()) summaryValues.originalValue = summaryValues.originalValue.setScale(2, BigDecimal.ROUND_HALF_UP);
        	summaryValues.depreciation = set.getBigDecimal(3);
        	if(!set.wasNull()) summaryValues.depreciation = summaryValues.depreciation.setScale(2, BigDecimal.ROUND_HALF_UP);
        	summaryValues.residualValue = set.getBigDecimal(4);
        	if(!set.wasNull()) summaryValues.residualValue = summaryValues.residualValue.setScale(2, BigDecimal.ROUND_HALF_UP);
        	summaryValues.writtenOffValue = set.getBigDecimal(5);
        	if(!set.wasNull()) summaryValues.writtenOffValue = summaryValues.writtenOffValue.setScale(2, BigDecimal.ROUND_HALF_UP);
        	summaryValues.assetRefOriginalValue = set.getBigDecimal(6);
        	if(!set.wasNull()) summaryValues.assetRefOriginalValue = summaryValues.assetRefOriginalValue.setScale(2, BigDecimal.ROUND_HALF_UP);        	
    		return summaryValues;
    	}, false);

    }
    
    private int getCountOnDate(Date date) {
    	return BaseDAOUtils.executeStatementAndReadObject(getConnection()
    			, "SELECT count(*) FROM regulatoryassetbase WHERE incomedate <= ? AND (writeOffDate >= ? OR writeOffDate IS NULL)"
    			, Arrays.asList(date, date), new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    }

    
    private String getConditionByFromToParameters(RegulatoryAssetBaseCalculationFilter filter) {
    	String condition = "";
    	if(filter == null) return condition;
    	if(filter.getOriginalValueFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBaseCalculation.originalValue_QFielld), condition);
    	if(filter.getOriginalValueTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBaseCalculation.originalValue_QFielld), condition);
    	if(filter.getDepreciationFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBaseCalculation.depreciation_QFielld), condition);
    	if(filter.getDepreciationTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBaseCalculation.depreciation_QFielld), condition);
    	if(filter.getResidualValueFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBaseCalculation.residualValue_QFielld), condition);
    	if(filter.getResidualValueTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBaseCalculation.residualValue_QFielld), condition);
    	if(filter.getWrittenOffValueFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBaseCalculation.writtenOffValue_QFielld), condition);
    	if(filter.getWrittenOffValueTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBaseCalculation.writtenOffValue_QFielld), condition);
    	if(filter.getUsefulLifeFrom() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBaseCalculation.usefulLife_QFielld), condition);
    	if(filter.getUsefulLifeTo() != Integer.MIN_VALUE)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBaseCalculation.usefulLife_QFielld), condition);
    	return condition;    	
    }
    
    private List<? extends Object> getFromToParametersByFilter(RegulatoryAssetBaseCalculationFilter filter) {
    	List<Object> result = new ArrayList<Object>();
    	if(filter != null) {
    		if(filter.getOriginalValueFrom() != null) result.add(filter.getOriginalValueFrom());
    		if(filter.getOriginalValueTo() != null) result.add(filter.getOriginalValueTo());
    		if(filter.getDepreciationFrom() != null) result.add(filter.getDepreciationFrom());
    		if(filter.getDepreciationTo() != null) result.add(filter.getDepreciationTo());
    		if(filter.getResidualValueFrom() != null) result.add(filter.getResidualValueFrom());
    		if(filter.getResidualValueTo() != null) result.add(filter.getResidualValueTo());
    		if(filter.getWrittenOffValueFrom() != null) result.add(filter.getWrittenOffValueFrom());
    		if(filter.getWrittenOffValueTo() != null) result.add(filter.getWrittenOffValueTo());
    		if(filter.getUsefulLifeFrom() != Integer.MIN_VALUE) result.add(filter.getUsefulLifeFrom());
    		if(filter.getUsefulLifeTo() != Integer.MIN_VALUE) result.add(filter.getUsefulLifeTo());
    	}
    	return result;     	
    }
		
    
	private void _collectAutoIncrementFields(RegulatoryAssetBaseCalculation anObject, Connection connection) throws PersistenceException {

			SequenceKey hashKey = new SequenceKey("REGULATORYASSTBSCLCLTN", "CODE");
			Integer nextSeqValue = null;
			SequenceValue sequenceValue;
			synchronized (_sequenceTable) {
				sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
				if (sequenceValue == null) {
					sequenceValue = getNewSequenceValue("REGULATORYASSTBSCLCLTN", "CODE");
					_sequenceTable.put(hashKey, sequenceValue);
				}
				if (!sequenceValue.isNextValueAvailable()) {
					sequenceValue = getNewSequenceValue("REGULATORYASSTBSCLCLTN", "CODE");
					_sequenceTable.put(hashKey, sequenceValue);
				}
			}

			nextSeqValue = sequenceValue.getNextValue();
			if (nextSeqValue == null) {
				throw new PersistenceException(
					"Can't obtain auto increment value from: REGULATORYASSTBSCLCLTN");
			} else {
				anObject.code = nextSeqValue.intValue();
				return;
			}
		}
} // end of RegulatoryAssetBaseCalculationDAO