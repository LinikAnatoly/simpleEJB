
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDisconnectInitiator;
 *
 */

import com.ksoe.energynet.valueobject.ENDisconnectInitiator;
import com.ksoe.energynet.valueobject.lists.ENDisconnectInitiatorShortList;
import com.ksoe.energynet.valueobject.brief.ENDisconnectInitiatorShort;
import com.ksoe.energynet.valueobject.filter.ENDisconnectInitiatorFilter;


public interface ENDisconnectInitiatorController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDisconnectInitiatorController";

	/* ENDisconnectInitiator. Добавить */
	public int add(ENDisconnectInitiator aENDisconnectInitiator)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Изменить */
	public void save(ENDisconnectInitiator aENDisconnectInitiator)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить объект */
	public ENDisconnectInitiator getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить полный список */
	public ENDisconnectInitiatorShortList getList()
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить список по фильтру */
	public ENDisconnectInitiatorShortList getFilteredList(
			ENDisconnectInitiatorFilter aENDisconnectInitiatorFilter)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить список для просмотра */
	public ENDisconnectInitiatorShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить список для просмотра по фильтру */
	public ENDisconnectInitiatorShortList getScrollableFilteredList(
			ENDisconnectInitiatorFilter aENDisconnectInitiatorFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить список для просмотра по условию */
	public ENDisconnectInitiatorShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDisconnectInitiatorFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. Получить объект из списка */
	public ENDisconnectInitiatorShort getShortObject(int code)
			throws java.rmi.RemoteException;

}