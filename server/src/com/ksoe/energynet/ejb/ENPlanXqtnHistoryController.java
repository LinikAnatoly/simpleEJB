
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanXqtnHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanXqtnHistory;
import com.ksoe.energynet.valueobject.lists.ENPlanXqtnHistoryShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanXqtnHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENPlanXqtnHistoryFilter;


public interface ENPlanXqtnHistoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanXqtnHistoryController";

	/* ENPlanXqtnHistory. Добавить */
	public int add(ENPlanXqtnHistory aENPlanXqtnHistory)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Изменить */
	public void save(ENPlanXqtnHistory aENPlanXqtnHistory)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить объект */
	public ENPlanXqtnHistory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить полный список */
	public ENPlanXqtnHistoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить список по фильтру */
	public ENPlanXqtnHistoryShortList getFilteredList(
			ENPlanXqtnHistoryFilter aENPlanXqtnHistoryFilter)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить список для просмотра */
	public ENPlanXqtnHistoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить список для просмотра по фильтру */
	public ENPlanXqtnHistoryShortList getScrollableFilteredList(
			ENPlanXqtnHistoryFilter aENPlanXqtnHistoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить список для просмотра по условию */
	public ENPlanXqtnHistoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanXqtnHistoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. Получить объект из списка */
	public ENPlanXqtnHistoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}