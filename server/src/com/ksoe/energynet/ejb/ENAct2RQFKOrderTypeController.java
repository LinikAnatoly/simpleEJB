
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2RQFKOrderType;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2RQFKOrderType;
import com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderTypeShort;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderTypeShortList;


public interface ENAct2RQFKOrderTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2RQFKOrderTypeController";

	/* ENAct2RQFKOrderType. Добавить */
	public int add(ENAct2RQFKOrderType aENAct2RQFKOrderType)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Изменить */
	public void save(ENAct2RQFKOrderType aENAct2RQFKOrderType)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить объект */
	public ENAct2RQFKOrderType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить полный список */
	public ENAct2RQFKOrderTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить список по фильтру */
	public ENAct2RQFKOrderTypeShortList getFilteredList(
			ENAct2RQFKOrderTypeFilter aENAct2RQFKOrderTypeFilter)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить список для просмотра */
	public ENAct2RQFKOrderTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить список для просмотра по фильтру */
	public ENAct2RQFKOrderTypeShortList getScrollableFilteredList(
			ENAct2RQFKOrderTypeFilter aENAct2RQFKOrderTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить список для просмотра по условию */
	public ENAct2RQFKOrderTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2RQFKOrderTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. Получить объект из списка */
	public ENAct2RQFKOrderTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}