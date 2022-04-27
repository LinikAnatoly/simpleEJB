
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSOValuesDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENSOValues;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENSOValuesTypeCategory;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENSOValuesShort;
import com.ksoe.energynet.valueobject.filter.ENSOValuesFilter;
import com.ksoe.energynet.valueobject.lists.ENSOValuesShortList;

/**
 * DAO Object for ENSOValues;
 *
 */

public class ENSOValuesDAO extends ENSOValuesDAOGen {

    public ENSOValuesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOValuesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Получить объект дополнительных реквизитов {@link ENSOValues}<br><br>
     * 
     * Получить объект дополнительных реквизитов по коду договора и коду типа дополнительных реквизитов 
     * 
     * @param servicesObjectCode код объекта договора {@link ENServicesObject}
     * @param soValuesTypeCode код типа дополнительного реквизита {@link com.ksoe.energynet.valueobject.ENSOValuesType}
     * @return объект дополнительных реквизитов {@link ENSOValues}
     * @throws PersistenceException
     */
    public ENSOValues getObject(int servicesObjectCode, int soValuesTypeCode) throws PersistenceException {
    	ENServicesObject servicesObject = new ENServicesObject();
    	servicesObject.code = servicesObjectCode;
    	return this.getObject(servicesObject, soValuesTypeCode);
    }
    
    /**
     * 
     * Получить объект дополнительных реквизитов {@link ENSOValues}<br><br>
     * 
     * Получить объект дополнительных реквизитов по договору и коду типа дополнительных реквизитов 
     * 
     * @param servicesObject объект договора {@link ENServicesObject}
     * @param soValuesTypeCode код типа дополнительного реквизита {@link com.ksoe.energynet.valueobject.ENSOValuesType}
     * @return объект дополнительных реквизитов {@link ENSOValues}
     * @throws PersistenceException
     */
    public ENSOValues getObject(ENServicesObject servicesObject, int soValuesTypeCode) throws PersistenceException {
    	if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий договір");
    	}
    	if(soValuesTypeCode == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий тип додаткового реквізиту");
    	}
    	ENSOValuesFilter filter = new ENSOValuesFilter();
    	filter.servicesobject.code = servicesObject.code;
    	filter.soValuesType.code = soValuesTypeCode;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	if(codes.length == 0) {
        	return null;   		
    	} else {
    		if(codes.length > 1) {
    			throw new SystemException(String.format("Помилка у кількості записів додаткових реквізитів для договору з кодом %d та типу \n"
    					+ " додаткових реквізитів з кодом %d", servicesObject.code, soValuesTypeCode));
    		}
    		return this.getObject(codes[0]);
    	}
    }
    
    public ENSOValuesShortList getScrollableFilteredList(ENSOValuesFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
    	if(aFilterObject != null && aFilterObject.soValuesTypes != null && aFilterObject.soValuesTypes.length > 0) {
        	Vector<Object> params = new Vector<Object>();
        	if(aBindObjects != null) {
        		params.addAll(aBindObjects);
        	}
        	for(Integer soValuesType : aFilterObject.soValuesTypes) params.add(soValuesType);
        	if(aFilterObject.conditionSQL == null) aFilterObject.conditionSQL = "";
        	aFilterObject.conditionSQL = BaseDAOUtils.addToCondition(String.format("%s in (%s)"
        			, ENSOValues.soValuesType_QFielld
        			, Tools.repeatSymbol("?", ",", aFilterObject.soValuesTypes.length)), aFilterObject.conditionSQL);
        	
        	return super.getScrollableFilteredList(aFilterObject, fromPosition, quantity, params);   		
    	} else {
    		return super.getScrollableFilteredList(aFilterObject, fromPosition, quantity, aBindObjects); 
    	}

    }
    
    /**
     * 
     * Возвращает хэш-таблицу {@link HashMap} с датами доп. реквизитов для стандартного присоединения по договору.
     * 
     * Ключом хэш-таблицы является тип доп. реквизита
     * Значением является дата этого доп. реквизита или {@code null} при отсутствии.
     * 
     * @param servicesObject объект договора {@link ENServicesObject}
     * @return {@link HashMap} где ключ это тип доп. реквизита, а значение - его дата
     * @throws PersistenceException 
     */
    public HashMap<Integer, Date> getActualDatesOfTermsForStandardConnection(ENServicesObject servicesObject) throws PersistenceException {
    	HashMap<Integer, Date> hashMap = new HashMap<Integer, Date>();
    	ENSOValuesFilter filter = new ENSOValuesFilter();
    	filter.servicesobject.code = servicesObject.code;
    	filter.soValuesTypes = new int[ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION.size()];
    	for(int i = 0; i < ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION.size(); i++) {
    		filter.soValuesTypes[i] = ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION.get(i);
    	}
    	HashMap<Integer, Date> hash = new HashMap<Integer, Date>();
    	ENSOValuesShortList list = this.getScrollableFilteredList(filter, 0, -1, null);
    	for(ENSOValuesShort values : list.list) {
    		if(values.dateVal == null) {
    			throw new java.lang.NullPointerException("Для цього доп. реквізиту повинна була бути заповнена дата!");
    		}
    		hash.put(values.soValuesTypeCode, values.dateVal);
    	}
    	for(int typeCode : ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION) {
    		hashMap.put(typeCode, hash.get(typeCode));
    	}
    	
    	return hashMap;
    }
    
    public final ENSOValues createEmptySOValuesForServicesObject(ENServicesObject servicesObject, int typeCode) {
    	if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий договір додаткового реквізиту!");
    	}
    	if(typeCode == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий тип додаткового реквізиту!");
    	}
    	ENSOValues value = new ENSOValues();
    	value.dateEdit = new Date();
    	value.userGen = this.getUserProfile().userName;
    	value.soValuesType.code = typeCode;
    	value.servicesobject.code = servicesObject.code;
    	return value;
    }
    
	public ENSOValuesShortList getScrollableFilteredList(ENSOValues aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSOValuesShortList result = new ENSOValuesShortList();
		ENSOValuesShort anObject;
		result.list = new Vector<ENSOValuesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOVALUES.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSOVALUES.CODE"+
			",ENSOVALUES.DATEVAL"+
			",ENSOVALUES.STRVAL"+
			",ENSOVALUES.USERGEN"+
			",ENSOVALUES.DATEEDIT"+
			", ENSERVICESOBJECT.CODE " +
			", ENSERVICESOBJECT.CONTRACTNUMBER " +
			", ENSERVICESOBJECT.CONTRACTDATE " +
			", ENSERVICESOBJECT.NAME " +
			", ENSERVICESOBJECT.PARTNERCODE " +
			", ENSERVICESOBJECT.FINDOCCODE " +
			", ENSERVICESOBJECT.FINDOCID " +
			", ENSERVICESOBJECT.COMMENTGEN " +
			", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
			", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
			", ENSERVICESOBJECT.CONTRAGENTNAME " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
			", ENSERVICESOBJECT.CONTRAGENTOKPO " +
			", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
			", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
			", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
			", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
			", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
			", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
			", ENSERVICESOBJECT.USERGEN " +
			", ENSERVICESOBJECT.DATEEDIT " +
			", ENSERVICESOBJECT.WARRANTDATE " +
			", ENSERVICESOBJECT.WARRANTNUMBER " +
			", ENSERVICESOBJECT.WARRANTFIO " +
			", ENSERVICESOBJECT.REGIONALTYPE " +
			", ENSERVICESOBJECT.BASISTYPE " +
			", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
			", ENSERVICESOBJECT.EXECUTEWORKDATE " +
			", ENSERVICESOBJECT.TIMESTART " +
			", ENSERVICESOBJECT.TIMEFINAL " +
			", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
			", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
			", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
			", ENSERVICESOBJECT.ISNOPAY " +
			", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
			", ENSERVICESOBJECT.PAYDATE " +
			", ENSERVICESOBJECT.FINPAYFORMCODE " +
			", ENSERVICESOBJECT.FINPAYFORMNAME " +
			", ENSERVICESOBJECT.PARTNERID " +
			", ENSERVICESOBJECT.PAYDETAIL " +
			", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
			", ENSERVICESOBJECT.ACTTRANSFERDATE " +
			", ENSERVICESOBJECT.RESPOSIBLE " +
			", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
			", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
			", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
			", ENSERVICESOBJECT.RECONNECTIONTU " +
			", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
			", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
			", ENSERVICESOBJECT.TABNUMBER " +
			", ENSERVICESOBJECT.CITIESLIST " +
			", ENSERVICESOBJECT.LINELENGTH " +
			", ENSERVICESOBJECT.PROJECTCODE " +
			", ENSERVICESOBJECT.CNPACKCODE " +
			", ENSERVICESOBJECT.DFPACKCODE " +
			", ENSERVICESOBJECT.COUNTERSZONETYPE " +
			", ENSERVICESOBJECT.AXPARTNERCODE " +
			", ENSERVICESOBJECT.AXPARTNERNAME " +
			", ENSERVICESOBJECT.AXCONTRACTNUMBER " +
			", ENSERVICESOBJECT.AXCONTRACTDATE " +
			", ENSERVICESOBJECT.AXCONTRACTCODE " +
			", ENSERVICESOBJECT.AXCONTRACTID " +
			", ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN " +
			", ENSERVICESOBJECT.PROJAGREESUMMA " +
			", ENSERVICESOBJECT.TOPOGRAPHYSUMMA " +
			", ENSERVICESOBJECT.CREATEDFROMSITE " +
			", ENSERVICESOBJECT.TERM " +
			", ENSERVICESOBJECT.REGULATION " +
			", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
			", ENSERVICESOBJECT.COUNTDAYDELAY " +
			", ENSERVICESOBJECT.FACTDATEWORK " +
			", ENSERVICESOBJECT.CODEEIC " +
			", ENSOVALUESTYPE.CODE " +
			", ENSOVALUESTYPE.NAME " +
			", ENSOVALUESTYPE.SORTFIELD " +
			", ENSOVALUESTYPE.USERGEN " +
			", ENSOVALUESTYPE.DATEEDIT " +
			", ENSOVALUESTYPECATEGORY.CODE " +
			", ENSOVALUESTYPECATEGORY.NAME " +
		" FROM ENSOVALUES " +
			" INNER JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSOVALUES.SERVICESOBJECTCODE "+
			" INNER JOIN ENSOVALUESTYPE on ENSOVALUESTYPE.CODE = ENSOVALUES.SOVALUESTYPECODE " +
			" LEFT JOIN ENSOVALUESTYPECATEGORY on ENSOVALUESTYPE.CATEGORYREFCODE = ENSOVALUESTYPECATEGORY.CODE " +
		"";

		// Не будем отображать доп. реквизиты, типы которых относятся к категории "Скрытые" 
		whereStr = " coalesce(ENSOVALUESTYPECATEGORY.CODE, 0) <> " + ENSOValuesTypeCategory.HIDDEN;

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
				anObject = new ENSOValuesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateVal = set.getTimestamp(2);
				anObject.strVal = set.getString(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);

				anObject.servicesobjectCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(7);
				anObject.servicesobjectContractDate = set.getDate(8);
				anObject.servicesobjectName = set.getString(9);
				anObject.servicesobjectPartnerCode = set.getString(10);
				anObject.servicesobjectFinDocCode = set.getString(11);
				anObject.servicesobjectFinDocID = set.getInt(12);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(13);
				anObject.servicesobjectContractNumberServices = set.getString(14);
				anObject.servicesobjectContractDateServices = set.getDate(15);
				anObject.servicesobjectContragentName = set.getString(16);
				anObject.servicesobjectContragentAddress = set.getString(17);
				anObject.servicesobjectContragentAddressWork = set.getString(18);
				anObject.servicesobjectContragentOkpo = set.getString(19);
				anObject.servicesobjectContragentBankAccount = set.getString(20);
				anObject.servicesobjectContragentBankName = set.getString(21);
				anObject.servicesobjectContragentBankMfo = set.getString(22);
				anObject.servicesobjectContragentBossName = set.getString(23);
				anObject.servicesobjectContragentPassport = set.getString(24);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(25);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(26);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(27);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(28);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(29);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(30);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(31);
				anObject.servicesobjectDateEdit = set.getDate(32);
				anObject.servicesobjectWarrantDate = set.getDate(33);
				anObject.servicesobjectWarrantNumber = set.getString(34);
				anObject.servicesobjectWarrantFIO = set.getString(35);
				anObject.servicesobjectRegionalType = set.getInt(36);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(37);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(38);
				anObject.servicesobjectExecuteWorkDate = set.getDate(39);
				anObject.servicesobjectTimeStart = set.getTimestamp(40);
				anObject.servicesobjectTimeFinal = set.getTimestamp(41);
				anObject.servicesobjectContragentPhoneNumber = set.getString(42);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(43);
				anObject.servicesobjectContragentObjectWork = set.getString(44);
				anObject.servicesobjectIsNoPay = set.getInt(45);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(47);
				anObject.servicesobjectFinPayFormCode = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(49);
				anObject.servicesobjectPartnerId = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(51);
				anObject.servicesobjectActTransferNumber = set.getString(52);
				anObject.servicesobjectActTransferDate = set.getDate(53);
				anObject.servicesobjectResposible = set.getString(54);
				anObject.servicesobjectResposiblePosition = set.getString(55);
				anObject.servicesobjectResposibleTabNumber = set.getString(56);
				anObject.servicesobjectPrevContractStatus = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(58);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(60);
				anObject.servicesobjectTabNumber = set.getString(61);
				anObject.servicesobjectCitiesList = set.getString(62);
				anObject.servicesobjectLineLength = set.getBigDecimal(63);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(64);
				anObject.servicesobjectCnPackCode = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(68);
				anObject.servicesobjectAxPartnerName = set.getString(69);
				anObject.servicesobjectAxContractNumber = set.getString(70);
				anObject.servicesobjectAxContractDate = set.getDate(71);
				anObject.servicesobjectAxContractCode = set.getString(72);
				anObject.servicesobjectAxContractId = set.getString(73);
				anObject.servicesobjectAxContractCommentGen = set.getString(74);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(75);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(76);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(78);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(80);
				anObject.servicesobjectCountDayDelay = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(82);
				anObject.servicesobjectCodeEIC = set.getString(83);
				anObject.soValuesTypeCode = set.getInt(84);
				if(set.wasNull()) {
					anObject.soValuesTypeCode = Integer.MIN_VALUE;
				}
				anObject.soValuesTypeName = set.getString(85);
				anObject.soValuesTypeSortField = set.getInt(86);
				if(set.wasNull()) {
					anObject.soValuesTypeSortField = Integer.MIN_VALUE;
				}
				anObject.soValuesTypeUserGen = set.getString(87);
				anObject.soValuesTypeDateEdit = set.getTimestamp(88);
				
				anObject.typeCategoryRefCode = set.getInt(89);
				anObject.typeCategoryRefName = set.getString(90);

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
	

} // end of ENSOValuesDAO
