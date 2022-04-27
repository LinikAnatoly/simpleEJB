
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServices2CalcAdditionalItems;
 *
 */

import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;
import com.ksoe.energynet.valueobject.lists.ENServices2CalcAdditionalItemsShortList;
import com.ksoe.energynet.valueobject.brief.ENServices2CalcAdditionalItemsShort;
import com.ksoe.energynet.valueobject.filter.ENServices2CalcAdditionalItemsFilter;


public interface ENServices2CalcAdditionalItemsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServices2CalcAdditionalItemsController";

	/* ENServices2CalcAdditionalItems. Добавить */
	public int add(ENServices2CalcAdditionalItems aENServices2CalcAdditionalItems)
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Изменить */
	public void save(ENServices2CalcAdditionalItems aENServices2CalcAdditionalItems)
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить объект */
	public ENServices2CalcAdditionalItems getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить полный список */
	public ENServices2CalcAdditionalItemsShortList getList()
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить список по фильтру */
	public ENServices2CalcAdditionalItemsShortList getFilteredList(
			ENServices2CalcAdditionalItemsFilter aENServices2CalcAdditionalItemsFilter)
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить список для просмотра */
	public ENServices2CalcAdditionalItemsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить список для просмотра по фильтру */
	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(
			ENServices2CalcAdditionalItemsFilter aENServices2CalcAdditionalItemsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить список для просмотра по условию */
	public ENServices2CalcAdditionalItemsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServices2CalcAdditionalItemsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServices2CalcAdditionalItems. Получить объект из списка */
	public ENServices2CalcAdditionalItemsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}