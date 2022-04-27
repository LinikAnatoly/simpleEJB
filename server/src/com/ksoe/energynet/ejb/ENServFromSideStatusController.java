
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServFromSideStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENServFromSideStatus;
import com.ksoe.energynet.valueobject.lists.ENServFromSideStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENServFromSideStatusShort;
import com.ksoe.energynet.valueobject.filter.ENServFromSideStatusFilter;


public interface ENServFromSideStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServFromSideStatusController";

	/* ENServFromSideStatus. Добавить */
	public int add(ENServFromSideStatus aENServFromSideStatus)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Изменить */
	public void save(ENServFromSideStatus aENServFromSideStatus)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить объект */
	public ENServFromSideStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить полный список */
	public ENServFromSideStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить список по фильтру */
	public ENServFromSideStatusShortList getFilteredList(
			ENServFromSideStatusFilter aENServFromSideStatusFilter)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить список для просмотра */
	public ENServFromSideStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить список для просмотра по фильтру */
	public ENServFromSideStatusShortList getScrollableFilteredList(
			ENServFromSideStatusFilter aENServFromSideStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить список для просмотра по условию */
	public ENServFromSideStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServFromSideStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. Получить объект из списка */
	public ENServFromSideStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}