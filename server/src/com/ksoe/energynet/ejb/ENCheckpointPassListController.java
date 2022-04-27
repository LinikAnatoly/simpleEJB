
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointPassList;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListShortList;


public interface ENCheckpointPassListController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointPassListController";

	/* ENCheckpointPassList. Добавить */
	public int add(ENCheckpointPassList aENCheckpointPassList)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Изменить */
	public void save(ENCheckpointPassList aENCheckpointPassList)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить объект */
	public ENCheckpointPassList getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить полный список */
	public ENCheckpointPassListShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить список по фильтру */
	public ENCheckpointPassListShortList getFilteredList(
			ENCheckpointPassListFilter aENCheckpointPassListFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить список для просмотра */
	public ENCheckpointPassListShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить список для просмотра по фильтру */
	public ENCheckpointPassListShortList getScrollableFilteredList(
			ENCheckpointPassListFilter aENCheckpointPassListFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить список для просмотра по условию */
	public ENCheckpointPassListShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointPassListFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. Получить объект из списка */
	public ENCheckpointPassListShort getShortObject(int code)
			throws java.rmi.RemoteException;

}