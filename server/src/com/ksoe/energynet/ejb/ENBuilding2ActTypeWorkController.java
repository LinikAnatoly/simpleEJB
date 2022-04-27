
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding2ActTypeWork;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding2ActTypeWork;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ActTypeWorkShortList;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ActTypeWorkShort;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ActTypeWorkFilter;


public interface ENBuilding2ActTypeWorkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuilding2ActTypeWorkController";

	/* ENBuilding2ActTypeWork. Добавить */
	public int add(ENBuilding2ActTypeWork aENBuilding2ActTypeWork)
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Изменить */
	public void save(ENBuilding2ActTypeWork aENBuilding2ActTypeWork)
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить объект */
	public ENBuilding2ActTypeWork getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить полный список */
	public ENBuilding2ActTypeWorkShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить список по фильтру */
	public ENBuilding2ActTypeWorkShortList getFilteredList(
			ENBuilding2ActTypeWorkFilter aENBuilding2ActTypeWorkFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить список для просмотра */
	public ENBuilding2ActTypeWorkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить список для просмотра по фильтру */
	public ENBuilding2ActTypeWorkShortList getScrollableFilteredList(
			ENBuilding2ActTypeWorkFilter aENBuilding2ActTypeWorkFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить список для просмотра по условию */
	public ENBuilding2ActTypeWorkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuilding2ActTypeWorkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding2ActTypeWork. Получить объект из списка */
	public ENBuilding2ActTypeWorkShort getShortObject(int code)
			throws java.rmi.RemoteException;

}