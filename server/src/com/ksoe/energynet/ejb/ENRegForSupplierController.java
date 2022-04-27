
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplier;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplier;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierFilter;


public interface ENRegForSupplierController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierController";

	/* ENRegForSupplier. Добавить */
	public int add(ENRegForSupplier aENRegForSupplier)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplier. Изменить */
	public void save(ENRegForSupplier aENRegForSupplier)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить объект */
	public ENRegForSupplier getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить полный список */
	public ENRegForSupplierShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить список по фильтру */
	public ENRegForSupplierShortList getFilteredList(
			ENRegForSupplierFilter aENRegForSupplierFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить список для просмотра */
	public ENRegForSupplierShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить список для просмотра по фильтру */
	public ENRegForSupplierShortList getScrollableFilteredList(
			ENRegForSupplierFilter aENRegForSupplierFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить список для просмотра по условию */
	public ENRegForSupplierShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. Получить объект из списка */
	public ENRegForSupplierShort getShortObject(int code)
			throws java.rmi.RemoteException;

	public void generateRegItems(int regCode) throws java.rmi.RemoteException;
	public void removeRegItems(int regCode) throws java.rmi.RemoteException;
}