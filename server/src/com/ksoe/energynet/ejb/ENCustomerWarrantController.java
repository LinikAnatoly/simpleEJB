
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCustomerWarrant;
 *
 */

import com.ksoe.energynet.valueobject.ENCustomerWarrant;
import com.ksoe.energynet.valueobject.lists.ENCustomerWarrantShortList;
import com.ksoe.energynet.valueobject.brief.ENCustomerWarrantShort;
import com.ksoe.energynet.valueobject.filter.ENCustomerWarrantFilter;


public interface ENCustomerWarrantController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCustomerWarrantController";

	/* ENCustomerWarrant. Добавить */
	public int add(ENCustomerWarrant aENCustomerWarrant)
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Изменить */
	public void save(ENCustomerWarrant aENCustomerWarrant)
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить объект */
	public ENCustomerWarrant getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить полный список */
	public ENCustomerWarrantShortList getList()
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить список по фильтру */
	public ENCustomerWarrantShortList getFilteredList(
			ENCustomerWarrantFilter aENCustomerWarrantFilter)
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить список для просмотра */
	public ENCustomerWarrantShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить список для просмотра по фильтру */
	public ENCustomerWarrantShortList getScrollableFilteredList(
			ENCustomerWarrantFilter aENCustomerWarrantFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить список для просмотра по условию */
	public ENCustomerWarrantShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCustomerWarrantFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCustomerWarrant. Получить объект из списка */
	public ENCustomerWarrantShort getShortObject(int code)
			throws java.rmi.RemoteException;

}