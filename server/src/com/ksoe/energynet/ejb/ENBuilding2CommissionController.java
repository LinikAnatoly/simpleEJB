
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding2Commission;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding2Commission;
import com.ksoe.energynet.valueobject.lists.ENBuilding2CommissionShortList;
import com.ksoe.energynet.valueobject.brief.ENBuilding2CommissionShort;
import com.ksoe.energynet.valueobject.filter.ENBuilding2CommissionFilter;


public interface ENBuilding2CommissionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuilding2CommissionController";

	/* ENBuilding2Commission. Добавить */
	public int add(ENBuilding2Commission aENBuilding2Commission)
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Изменить */
	public void save(ENBuilding2Commission aENBuilding2Commission)
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить объект */
	public ENBuilding2Commission getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить полный список */
	public ENBuilding2CommissionShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить список по фильтру */
	public ENBuilding2CommissionShortList getFilteredList(
			ENBuilding2CommissionFilter aENBuilding2CommissionFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить список для просмотра */
	public ENBuilding2CommissionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить список для просмотра по фильтру */
	public ENBuilding2CommissionShortList getScrollableFilteredList(
			ENBuilding2CommissionFilter aENBuilding2CommissionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить список для просмотра по условию */
	public ENBuilding2CommissionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuilding2CommissionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding2Commission. Получить объект из списка */
	public ENBuilding2CommissionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}