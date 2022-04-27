
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelCardHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelCardHistory;
import com.ksoe.energynet.valueobject.lists.ENFuelCardHistoryShortList;
import com.ksoe.energynet.valueobject.brief.ENFuelCardHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENFuelCardHistoryFilter;


public interface ENFuelCardHistoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelCardHistoryController";

	/* ENFuelCardHistory. Добавить */
	public int add(ENFuelCardHistory aENFuelCardHistory)
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Изменить */
	public void save(ENFuelCardHistory aENFuelCardHistory)
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить объект */
	public ENFuelCardHistory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить полный список */
	public ENFuelCardHistoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить список по фильтру */
	public ENFuelCardHistoryShortList getFilteredList(
			ENFuelCardHistoryFilter aENFuelCardHistoryFilter)
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить список для просмотра */
	public ENFuelCardHistoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить список для просмотра по фильтру */
	public ENFuelCardHistoryShortList getScrollableFilteredList(
			ENFuelCardHistoryFilter aENFuelCardHistoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить список для просмотра по условию */
	public ENFuelCardHistoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelCardHistoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelCardHistory. Получить объект из списка */
	public ENFuelCardHistoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}