
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointEventType;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointEventType;
import com.ksoe.energynet.valueobject.brief.ENCheckpointEventTypeShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointEventTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointEventTypeShortList;


public interface ENCheckpointEventTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointEventTypeController";

	/* ENCheckpointEventType. Добавить */
	public int add(ENCheckpointEventType aENCheckpointEventType)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Изменить */
	public void save(ENCheckpointEventType aENCheckpointEventType)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить объект */
	public ENCheckpointEventType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить полный список */
	public ENCheckpointEventTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить список по фильтру */
	public ENCheckpointEventTypeShortList getFilteredList(
			ENCheckpointEventTypeFilter aENCheckpointEventTypeFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить список для просмотра */
	public ENCheckpointEventTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить список для просмотра по фильтру */
	public ENCheckpointEventTypeShortList getScrollableFilteredList(
			ENCheckpointEventTypeFilter aENCheckpointEventTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить список для просмотра по условию */
	public ENCheckpointEventTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointEventTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. Получить объект из списка */
	public ENCheckpointEventTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}