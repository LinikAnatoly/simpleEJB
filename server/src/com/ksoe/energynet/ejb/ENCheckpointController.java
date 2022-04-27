
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpoint;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpoint;
import com.ksoe.energynet.valueobject.brief.ENCheckpointShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointShortList;


public interface ENCheckpointController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointController";

	/* ENCheckpoint. Добавить */
	public int add(ENCheckpoint aENCheckpoint)
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpoint. Изменить */
	public void save(ENCheckpoint aENCheckpoint)
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить объект */
	public ENCheckpoint getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить полный список */
	public ENCheckpointShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить список по фильтру */
	public ENCheckpointShortList getFilteredList(
			ENCheckpointFilter aENCheckpointFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить список для просмотра */
	public ENCheckpointShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить список для просмотра по фильтру */
	public ENCheckpointShortList getScrollableFilteredList(
			ENCheckpointFilter aENCheckpointFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить список для просмотра по условию */
	public ENCheckpointShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpoint. Получить объект из списка */
	public ENCheckpointShort getShortObject(int code)
			throws java.rmi.RemoteException;

}