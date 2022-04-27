
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointPassListItem;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListItemShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListItemFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListItemShortList;


public interface ENCheckpointPassListItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointPassListItemController";

	/* ENCheckpointPassListItem. Добавить */
// SUPP-25511 возможность инсертить сразу выезд и въезд	public int add(ENCheckpointPassListItem aENCheckpointPassListItem)
//			throws java.rmi.RemoteException;
	public int add(ENCheckpointPassListItemShort[] aENCheckpointPassListItem)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Изменить */
	public void save(ENCheckpointPassListItem aENCheckpointPassListItem)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить объект */
	public ENCheckpointPassListItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить полный список */
	public ENCheckpointPassListItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить список по фильтру */
	public ENCheckpointPassListItemShortList getFilteredList(
			ENCheckpointPassListItemFilter aENCheckpointPassListItemFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить список для просмотра */
	public ENCheckpointPassListItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить список для просмотра по фильтру */
	public ENCheckpointPassListItemShortList getScrollableFilteredList(
			ENCheckpointPassListItemFilter aENCheckpointPassListItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить список для просмотра по условию */
	public ENCheckpointPassListItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointPassListItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. Получить объект из списка */
	public ENCheckpointPassListItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void addRideIn( ENCheckpointPassListItem object) throws java.rmi.RemoteException;
	public void addRideOut( ENCheckpointPassListItem object) throws java.rmi.RemoteException;

}