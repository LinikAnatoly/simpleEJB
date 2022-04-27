
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2RQFKOrder;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2RQFKOrder;
import com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderShort;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderShortList;


public interface ENAct2RQFKOrderController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2RQFKOrderController";

	/* ENAct2RQFKOrder. Добавить */
	public int add(ENAct2RQFKOrder aENAct2RQFKOrder)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Изменить */
	public void save(ENAct2RQFKOrder aENAct2RQFKOrder)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить объект */
	public ENAct2RQFKOrder getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить полный список */
	public ENAct2RQFKOrderShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить список по фильтру */
	public ENAct2RQFKOrderShortList getFilteredList(
			ENAct2RQFKOrderFilter aENAct2RQFKOrderFilter)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить список для просмотра */
	public ENAct2RQFKOrderShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить список для просмотра по фильтру */
	public ENAct2RQFKOrderShortList getScrollableFilteredList(
			ENAct2RQFKOrderFilter aENAct2RQFKOrderFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить список для просмотра по условию */
	public ENAct2RQFKOrderShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2RQFKOrderFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrder. Получить объект из списка */
	public ENAct2RQFKOrderShort getShortObject(int code)
			throws java.rmi.RemoteException;

}