
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderByt;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;


public interface ENWorkOrderBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytController";

	/* ENWorkOrderByt. Добавить */
	public int add(ENWorkOrderByt aENWorkOrderByt)
			throws java.rmi.RemoteException;
	/* ENWorkOrderByt. Добавить из биллинга (для рейдовых бригад) */
	public int addForRaid(ENWorkOrderByt object) 
			throws java.rmi.RemoteException;
	/* ENWorkOrderByt. Добавить из биллинга (для снятия контролей) */
	public int addForControl(ENWorkOrderByt object)	
			throws java.rmi.RemoteException;
	
	/* ENWorkOrderByt. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	public void remove(int anObjectCode, boolean isFromBilling) throws java.rmi.RemoteException;
	/* ENWorkOrderByt. Удалить из биллинга (для рейдовых бригад) */
	public void removeForRaid(int code) throws java.rmi.RemoteException;
	/* ENWorkOrderByt. Удалить из биллинга (для снятия контролей) */
	public void removeForControl(int code) throws java.rmi.RemoteException;	
	/* ENWorkOrderByt. Удалить кривое сменное задание для рейдовой бригады */
	public void removeBadRaid(int code) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Изменить */
	public void save(ENWorkOrderByt aENWorkOrderByt)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить объект */
	public ENWorkOrderByt getObject(int anObjectCode) throws java.rmi.RemoteException;
	public ENWorkOrderByt getObjectForRaid(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить полный список */
	public ENWorkOrderBytShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить список по фильтру */
	public ENWorkOrderBytShortList getFilteredList(
			ENWorkOrderBytFilter aENWorkOrderBytFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить список для просмотра */
	public ENWorkOrderBytShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить список для просмотра по фильтру */
	public ENWorkOrderBytShortList getScrollableFilteredList(
			ENWorkOrderBytFilter aENWorkOrderBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;
	public ENWorkOrderBytShortList getScrollableFilteredListForRaid(
			ENWorkOrderBytFilter aENWorkOrderBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить список для просмотра по условию */
	public ENWorkOrderBytShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. Получить объект из списка */
	public ENWorkOrderBytShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode) throws java.rmi.RemoteException;
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans) 
			throws java.rmi.RemoteException;
	public void addSealsForRaid(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
			throws java.rmi.RemoteException;
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode) throws java.rmi.RemoteException;
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans) 
			throws java.rmi.RemoteException;
	public void addSealsForRaidByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
			throws java.rmi.RemoteException;
	public void removeSeals(int workOrderBytCode, int[] sealCodes) throws java.rmi.RemoteException;
	public void removeSealsByFact(int workOrderBytCode, int[] sealCodes) throws java.rmi.RemoteException;
	
	public void makeFormed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeFormed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeApproved(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeApproved(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeCompleted(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeCompleted(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeClosed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeClosed(int workOrderBytCode) throws java.rmi.RemoteException;
	
	public boolean checkWorkOrderBytForStatus(int workOrderBytCode, int statusCode, boolean isException) throws java.rmi.RemoteException;	
	public boolean checkWorkOrderBytForStatus(ENWorkOrderByt workOrderByt, int statusCode, boolean isException) throws java.rmi.RemoteException;

}