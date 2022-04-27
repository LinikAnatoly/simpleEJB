
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierType;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierType;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierTypeShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierTypeFilter;


public interface ENRegForSupplierTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierTypeController";

	/* ENRegForSupplierType. Добавить */
	public int add(ENRegForSupplierType aENRegForSupplierType)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Изменить */
	public void save(ENRegForSupplierType aENRegForSupplierType)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить объект */
	public ENRegForSupplierType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить полный список */
	public ENRegForSupplierTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить список по фильтру */
	public ENRegForSupplierTypeShortList getFilteredList(
			ENRegForSupplierTypeFilter aENRegForSupplierTypeFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить список для просмотра */
	public ENRegForSupplierTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить список для просмотра по фильтру */
	public ENRegForSupplierTypeShortList getScrollableFilteredList(
			ENRegForSupplierTypeFilter aENRegForSupplierTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить список для просмотра по условию */
	public ENRegForSupplierTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. Получить объект из списка */
	public ENRegForSupplierTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}