
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding2ENact;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding2ENact;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ENactShortList;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ENactShort;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ENactFilter;


public interface ENBuilding2ENactController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuilding2ENactController";

	/* ENBuilding2ENact. Добавить */
	public int add(ENBuilding2ENact aENBuilding2ENact)
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Изменить */
	public void save(ENBuilding2ENact aENBuilding2ENact)
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить объект */
	public ENBuilding2ENact getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить полный список */
	public ENBuilding2ENactShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить список по фильтру */
	public ENBuilding2ENactShortList getFilteredList(
			ENBuilding2ENactFilter aENBuilding2ENactFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить список для просмотра */
	public ENBuilding2ENactShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить список для просмотра по фильтру */
	public ENBuilding2ENactShortList getScrollableFilteredList(
			ENBuilding2ENactFilter aENBuilding2ENactFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить список для просмотра по условию */
	public ENBuilding2ENactShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuilding2ENactFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding2ENact. Получить объект из списка */
	public ENBuilding2ENactShort getShortObject(int code)
			throws java.rmi.RemoteException;

}