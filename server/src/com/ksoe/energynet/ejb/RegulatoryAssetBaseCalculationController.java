
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.valueobject.RegulatoryAssetBase;

/**
 * EJB Controller interface for RegulatoryAssetBaseCalculation;
 *
 */

import com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseFundingSource;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseGroup;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseCalculationShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseFundingSourceShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseGroupShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseOutOfUseShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBasePartialWriteOffShortList;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseCalculationFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFundingSourceFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseGroupFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseOutOfUseFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseSynchronizationData;


public interface RegulatoryAssetBaseCalculationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/RegulatoryAssetBaseCalculationController";

	/* RegulatoryAssetBaseCalculation. Добавить */
	public int add(RegulatoryAssetBaseCalculation aRegulatoryAssetBaseCalculation)
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Изменить */
	public void save(RegulatoryAssetBaseCalculation aRegulatoryAssetBaseCalculation)
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить объект */
	public RegulatoryAssetBaseCalculation getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить полный список */
	public RegulatoryAssetBaseCalculationShortList getList()
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить список по фильтру */
	public RegulatoryAssetBaseCalculationShortList getFilteredList(
			RegulatoryAssetBaseCalculationFilter aRegulatoryAssetBaseCalculationFilter)
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить список для просмотра */
	public RegulatoryAssetBaseCalculationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить список для просмотра по фильтру */
	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(
			RegulatoryAssetBaseCalculationFilter aRegulatoryAssetBaseCalculationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить список для просмотра по условию */
	public RegulatoryAssetBaseCalculationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			RegulatoryAssetBaseCalculationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* RegulatoryAssetBaseCalculation. Получить объект из списка */
	public RegulatoryAssetBaseCalculationShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	RegulatoryAssetBaseCalculationShortList  getListOnPeriod(RegulatoryAssetBaseCalculationFilter calculationFilter, Date periodTo, int offset, int quantity) throws java.rmi.RemoteException;
	RegulatoryAssetBaseGroupShortList getScrollableFilteredListOfGroups(RegulatoryAssetBaseGroupFilter filter, int offset, int quantity) throws java.rmi.RemoteException;
	RegulatoryAssetBaseFundingSourceShortList getScrollableFilteredListOfFundingSources(RegulatoryAssetBaseFundingSourceFilter filter, int offset, int quantity) throws java.rmi.RemoteException;
	
	RegulatoryAssetBaseGroup getGroup(int code) throws java.rmi.RemoteException;
	RegulatoryAssetBaseFundingSource getFundingSource(int code) throws java.rmi.RemoteException;
	
	long setFilter(RegulatoryAssetBaseCalculationFilter filter) throws java.rmi.RemoteException;
	RegulatoryAssetBaseCalculationFilter getFilter(long id) throws java.rmi.RemoteException;
	
	RegulatoryAssetBaseCalculationShort getShortObjectOnPeriod(RegulatoryAssetBase asset, Date period) throws java.rmi.RemoteException;
	
	void calculate(Date period) throws java.rmi.RemoteException;
	
	RegulatoryAssetBase getAsset(int code) throws java.rmi.RemoteException;
	int addAsset(RegulatoryAssetBase object) throws java.rmi.RemoteException;
	void saveAsset(RegulatoryAssetBase object) throws java.rmi.RemoteException;
	void removeAsset(int code) throws java.rmi.RemoteException;
	
	RegulatoryAssetBaseOutOfUse getOutOfUse(int code) throws java.rmi.RemoteException;
	RegulatoryAssetBaseOutOfUseShortList getListOfOutOfUse(RegulatoryAssetBaseOutOfUseFilter filter, int offset, int quantity) throws java.rmi.RemoteException;
	int addOutOfUse(RegulatoryAssetBaseOutOfUse object) throws java.rmi.RemoteException;
	void saveOutOfUse(RegulatoryAssetBaseOutOfUse object) throws java.rmi.RemoteException;
	void removeOutOfUse(int code) throws java.rmi.RemoteException;
	
	RegulatoryAssetBasePartialWriteOff getPartialWriteOff(int code) throws java.rmi.RemoteException;
	RegulatoryAssetBasePartialWriteOffShortList getListOfPartialWriteOff(RegulatoryAssetBasePartialWriteOffFilter filter, int offset, int quantity) throws java.rmi.RemoteException;
	int addPartialWriteOff(RegulatoryAssetBasePartialWriteOff object) throws java.rmi.RemoteException;
	void savePartialWriteOff(RegulatoryAssetBasePartialWriteOff object) throws java.rmi.RemoteException;
	void removePartialWriteOff(int code) throws java.rmi.RemoteException;
	
	void dummyProcessSingle(RegulatoryAssetBase object) throws java.rmi.RemoteException;
	void dummyProcessBatch(Vector<RegulatoryAssetBase> objects) throws java.rmi.RemoteException;
	
	RegulatoryAssetBaseSynchronizationData getDataForSynchronization(Date from, Date to) throws java.rmi.RemoteException;
	void synchronize(RegulatoryAssetBaseSynchronizationData data) throws java.rmi.RemoteException;

}