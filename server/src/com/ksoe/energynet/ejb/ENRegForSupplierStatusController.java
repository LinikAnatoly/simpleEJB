
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierStatus;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierStatusShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierStatusFilter;


public interface ENRegForSupplierStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierStatusController";

	/* ENRegForSupplierStatus. Добавить */
	public int add(ENRegForSupplierStatus aENRegForSupplierStatus)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Изменить */
	public void save(ENRegForSupplierStatus aENRegForSupplierStatus)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить объект */
	public ENRegForSupplierStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить полный список */
	public ENRegForSupplierStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить список по фильтру */
	public ENRegForSupplierStatusShortList getFilteredList(
			ENRegForSupplierStatusFilter aENRegForSupplierStatusFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить список для просмотра */
	public ENRegForSupplierStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить список для просмотра по фильтру */
	public ENRegForSupplierStatusShortList getScrollableFilteredList(
			ENRegForSupplierStatusFilter aENRegForSupplierStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить список для просмотра по условию */
	public ENRegForSupplierStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. Получить объект из списка */
	public ENRegForSupplierStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}