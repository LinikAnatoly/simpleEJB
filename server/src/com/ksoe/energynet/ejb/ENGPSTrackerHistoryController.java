
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGPSTrackerHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerHistoryShortList;
import com.ksoe.energynet.valueobject.brief.ENGPSTrackerHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerHistoryFilter;


public interface ENGPSTrackerHistoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGPSTrackerHistoryController";

	/* ENGPSTrackerHistory. Добавить */
	public int add(ENGPSTrackerHistory aENGPSTrackerHistory)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Изменить */
	public void save(ENGPSTrackerHistory aENGPSTrackerHistory)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить объект */
	public ENGPSTrackerHistory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить полный список */
	public ENGPSTrackerHistoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить список по фильтру */
	public ENGPSTrackerHistoryShortList getFilteredList(
			ENGPSTrackerHistoryFilter aENGPSTrackerHistoryFilter)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить список для просмотра */
	public ENGPSTrackerHistoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить список для просмотра по фильтру */
	public ENGPSTrackerHistoryShortList getScrollableFilteredList(
			ENGPSTrackerHistoryFilter aENGPSTrackerHistoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить список для просмотра по условию */
	public ENGPSTrackerHistoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENGPSTrackerHistoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. Получить объект из списка */
	public ENGPSTrackerHistoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}