//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderShortList;

public interface ENWorkOrderController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderController";

	/* ENWorkOrder. Добавить */
	public int add(ENWorkOrder aENWorkOrder) throws java.rmi.RemoteException;

	/* ENWorkOrder. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrder. Изменить */
	public void save(ENWorkOrder aENWorkOrder) throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить объект */
	public ENWorkOrder getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить полный список */
	public ENWorkOrderShortList getList() throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить список по фильтру */
	public ENWorkOrderShortList getFilteredList(
			ENWorkOrderFilter aENWorkOrderFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить список для просмотра */
	public ENWorkOrderShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить список для просмотра по фильтру */
	public ENWorkOrderShortList getScrollableFilteredList(
			ENWorkOrderFilter aEPActFilter, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить список для просмотра по условию */
	public ENWorkOrderShortList getScrollableListByCondition(String aCondition,
			int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

}