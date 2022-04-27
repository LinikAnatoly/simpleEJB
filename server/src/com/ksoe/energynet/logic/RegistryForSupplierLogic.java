package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.datahub.dataminer.DHDisconnectionDAO;
import com.ksoe.datahub.valueobject.DHDisconnection;
import com.ksoe.datahub.valueobject.DHDisconnectionStatus;
import com.ksoe.datahub.valueobject.filter.DHDisconnectionFilter;
import com.ksoe.docflow.valueobject.DFServicesRegStatus;
import com.ksoe.energynet.dataminer.ENRegForSupplierDAO;
import com.ksoe.energynet.dataminer.ENRegForSupplierItemDAO;
import com.ksoe.energynet.valueobject.ENRegForSupplier;
import com.ksoe.energynet.valueobject.ENRegForSupplierItem;
import com.ksoe.energynet.valueobject.ENRegForSupplierStatus;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierItemFilter;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class RegistryForSupplierLogic extends LogicModule {

	public RegistryForSupplierLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}
	
	public boolean isInRegistry(int dhDisconnectionCode) throws PersistenceException {
		ENRegForSupplierItemDAO regItemsDAO = new ENRegForSupplierItemDAO(userProfile, connection);
		
		ENRegForSupplierItemFilter regItemsFilter = new ENRegForSupplierItemFilter();
		regItemsFilter.dhDisconnectionCode = dhDisconnectionCode;
		
		int[] regItemsArr = regItemsDAO.getFilteredCodeArray(regItemsFilter, 0, -1);
		
		return (regItemsArr.length > 0);
	}
	
	public int[] getDHDisconnectionCodesForRegistry(ENRegForSupplier reg) throws PersistenceException {
		Connection dataHubConnection = null;		

		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);
			DHDisconnectionDAO dhDisconnectionDAO = new DHDisconnectionDAO(userProfile, dataHubConnection);

			DHDisconnectionFilter dhDisconnectionFilter = new DHDisconnectionFilter();
			dhDisconnectionFilter.statuscode = DHDisconnectionStatus.COMPLETED; 
			if (reg.typeRef != null && reg.typeRef.code != Integer.MIN_VALUE) {
				dhDisconnectionFilter.worktypecode = reg.typeRef.code; 
			}
			dhDisconnectionFilter.conditionSQL = "datecomplete between '" + new SimpleDateFormat("dd.MM.yyyy").format(reg.dateFrom) +
					                                            "' and '" + new SimpleDateFormat("dd.MM.yyyy").format(reg.dateTo) + "'" +
					                             " and dhdisconnection.calccode is not null" +  
	                                             " and dhdisconnection.registrycode in " + 
					                             "     (select dr.code from dhdisconnectionregistr dr where suppliercode = " + reg.supplierCode + ")";

			//return dhDisconnectionDAO.getScrollableFilteredList(dhDisconnectionFilter, 0, -1);			
			return dhDisconnectionDAO.getFilteredCodeArray(dhDisconnectionFilter, 0, -1);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}		
	}
		
	public ENRegForSupplierItem generateRegItemForDHDisconnection(int regCode, DHDisconnection dhDisconnection) {
		if (dhDisconnection == null) {
			throw new SystemException("\n\nNET-4576 Не заданий об'єкт строки реєстру з DataHub (DHDisconnection)!");
		}
		
		if (dhDisconnection.code == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 Не заданий код строки реєстру з DataHub (DHDisconnection)!");
		}
		
		if (dhDisconnection.calcsum == null) {
			throw new SystemException("\n\nNET-4576 У DataHub не задано вартість робіт для строки (DHDisconnection) з кодом " + 
					                  dhDisconnection.code + " !");			
		}
		
		if (dhDisconnection.calcsumvat == null) {
			throw new SystemException("\n\nNET-4576 У DataHub не задано вартість робіт (ПДВ) для строки (DHDisconnection) з кодом " + 
		                              dhDisconnection.code + " !");			
		}
		
		ENRegForSupplierItem regItem = new ENRegForSupplierItem();

		/////////////////////////////////////
		regItem.recordpointEic = dhDisconnection.recordpointeic; 
		//regItem.customerUid = dhDisconnection.customerUid; 
		regItem.datePlanned = dhDisconnection.dategen;
		regItem.dateComplete = dhDisconnection.datecomplete;
		regItem.description = dhDisconnection.description; 		
		regItem.calcNumber = dhDisconnection.calcnumber; 
		regItem.calcName = dhDisconnection.calcname; 
		regItem.costWithoutVAT = dhDisconnection.calcsum.subtract(dhDisconnection.calcsumvat).setScale(2, BigDecimal.ROUND_HALF_UP); 
		regItem.costVAT = dhDisconnection.calcsumvat; 
		regItem.costWithVAT = dhDisconnection.calcsum; 
		regItem.dhDisconnectionCode = dhDisconnection.code;
		//regItem.commentGen = ""; 
		regItem.registryRef.code = regCode;
		regItem.registryTypeRef.code = dhDisconnection.worktypecode;
		regItem.initiatorRef.code = dhDisconnection.typecode;
		regItem.planRef.code = dhDisconnection.npzcode;
		regItem.factRef.code = dhDisconnection.factcode;
		regItem.classificationTypeRef.code = dhDisconnection.calccode;
		/////////////////////////////////////
		
		return regItem;
	}
	
    /**
     *  Формирование строк реестра подключений/отключений для компенсации Поставщиками
     *
     *  @param regCode - код реестра
     *
     *  @throws PersistenceException
     */
	public void generateRegItems(int regCode) throws PersistenceException {
		if (regCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4576 Не задано код реєстра!");
		}

		ENRegForSupplierDAO regDAO = new ENRegForSupplierDAO(userProfile, connection);
		ENRegForSupplier reg = regDAO.getObject(regCode);

		if (reg.statusRef.code != ENRegForSupplierStatus.DRAFT)
		{
			throw new SystemException("\n\nNET-4576 Для формування позицій реєстр повинен мати статус \"Чорновий\" !");
		}
		
		//DHDisconnectionShortList dhDisconnectionList = getDHDisconnectionListForRegistry(reg);
		int[] dhDisconnectionsArr = getDHDisconnectionCodesForRegistry(reg);

		if (dhDisconnectionsArr.length == 0)
		{
			throw new SystemException("\n\nNET-4576 За обраний період не знайдено жодної послуги!");
		}		

		ENRegForSupplierItemDAO regItemsDAO = new ENRegForSupplierItemDAO(userProfile, connection);

		int itemsCount = 0;
		
		Connection dataHubConnection = null;
		
		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);
			DHDisconnectionDAO dhDisconnectionDAO = new DHDisconnectionDAO(userProfile, dataHubConnection);
			
			for (int i = 0; i < dhDisconnectionsArr.length; i++)
			{
				// Если данное отключение (подключение) уже включено в реестр, пропускаем его
				if (isInRegistry(dhDisconnectionsArr[i])) {
					continue;
				}
				
				itemsCount++;
				
				//DHDisconnectionShort dhDisconnectionShort = dhDisconnectionList.get(i);
				DHDisconnection dhDisconnection = dhDisconnectionDAO.getObject(dhDisconnectionsArr[i]);

				if (dhDisconnection == null) {
					throw new SystemException("\n\nNET-4576 Не знайдено об'єкт строки реєстру з DataHub (DHDisconnection) з кодом " + 
							                  dhDisconnectionsArr[i] + " !");
				}

				ENRegForSupplierItem regItem = generateRegItemForDHDisconnection(regCode, dhDisconnection);
				
				regItemsDAO.add(regItem);
			}			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}
		
		if (itemsCount == 0)
		{
			throw new SystemException("\n\nNET-4576 Усі послуги за обраний період вже включені в попередні реєстри!");
		}
		
		reg.statusRef.code = DFServicesRegStatus.CREATED;
		regDAO.save(reg);
	}

    /**
     *  Удаление строк реестра реестра подключений/отключений для компенсации Поставщиками
     *
     *  @param regCode - код реестра
     *
     *  @throws PersistenceException
     */
	public void removeRegItems(int regCode) throws PersistenceException {
		if (regCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4576 Не задано код реєстра!");
		}

		ENRegForSupplierDAO regDAO = new ENRegForSupplierDAO(userProfile, connection);
		ENRegForSupplier reg = regDAO.getObject(regCode);

		if (reg.statusRef.code != ENRegForSupplierStatus.CREATED)
		{
			throw new SystemException("\n\nNET-4576 Для видалення позицій реєстр повинен мати статус \"Складений\" !");
		}

		ENRegForSupplierItemDAO regItemsDAO = new ENRegForSupplierItemDAO(userProfile, connection);
		ENRegForSupplierItemFilter regItemsFilter = new ENRegForSupplierItemFilter();
		regItemsFilter.registryRef.code = regCode;

		int regItemsArr[] = regItemsDAO.getFilteredCodeArray(regItemsFilter, 0, -1);

		for (int i = 0; i < regItemsArr.length; i++)
		{
			regItemsDAO.remove(regItemsArr[i]);
		}

		reg.statusRef.code = ENRegForSupplierStatus.DRAFT;
		regDAO.save(reg);
	}
	
}
