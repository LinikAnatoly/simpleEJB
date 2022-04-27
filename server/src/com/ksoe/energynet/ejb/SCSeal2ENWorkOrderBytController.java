
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSeal2ENWorkOrderByt;
 *
 */

import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.lists.SCSeal2ENWorkOrderBytShortList;


public interface SCSeal2ENWorkOrderBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSeal2ENWorkOrderBytController";

	/* SCSeal2ENWorkOrderByt. Добавить */
	public int add(SCSeal2ENWorkOrderByt aSCSeal2ENWorkOrderByt)
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Изменить */
	public void save(SCSeal2ENWorkOrderByt aSCSeal2ENWorkOrderByt)
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить объект */
	public SCSeal2ENWorkOrderByt getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить полный список */
	public SCSeal2ENWorkOrderBytShortList getList()
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить список по фильтру */
	public SCSeal2ENWorkOrderBytShortList getFilteredList(
			SCSeal2ENWorkOrderBytFilter aSCSeal2ENWorkOrderBytFilter)
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить список для просмотра */
	public SCSeal2ENWorkOrderBytShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить список для просмотра по фильтру */
	public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(
			SCSeal2ENWorkOrderBytFilter aSCSeal2ENWorkOrderBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить список для просмотра по условию */
	public SCSeal2ENWorkOrderBytShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSeal2ENWorkOrderBytFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSeal2ENWorkOrderByt. Получить объект из списка */
	public SCSeal2ENWorkOrderBytShort getShortObject(int code)
			throws java.rmi.RemoteException;

	public SCSeal2ENWorkOrderBytShortList getSealsListForWorkOrderByt(int workOrderBytCode) throws java.rmi.RemoteException;
	public SCSeal2ENWorkOrderBytShortList getWorkOrderBytItemsForSealsBinding(int workOrderBytCode, int accountingTypeCode) 
			throws java.rmi.RemoteException;
	
	public void moveSealToUnused(int scSeal2ENWorkOrderBytCode) throws java.rmi.RemoteException;
	public void moveSealToSpoiled(int scSeal2ENWorkOrderBytCode) throws java.rmi.RemoteException;
	public void rebindSeal(int scSeal2ENWorkOrderBytCode, String estimateItemCodes) throws java.rmi.RemoteException;
	public void rebindSealForRaid(int scSeal2ENWorkOrderBytCode, String estimateItemCodes, String accountNumber, String customerName)
			throws java.rmi.RemoteException;
}