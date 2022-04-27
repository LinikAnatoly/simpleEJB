
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2ENElement;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementShort;
import com.ksoe.energynet.valueobject.filter.ENElement2ENElementFilter;
import com.ksoe.energynet.valueobject.lists.ENElement2ENElementShortList;


public interface ENElement2ENElementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2ENElementController";

	/* ENElement2ENElement. Добавить */
	public int add(ENElement2ENElement aENElement2ENElement)
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENElement2ENElement. Изменить */
	public void save(ENElement2ENElement aENElement2ENElement)
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить объект */
	public ENElement2ENElement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить полный список */
	public ENElement2ENElementShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить список по фильтру */
	public ENElement2ENElementShortList getFilteredList(
			ENElement2ENElementFilter aENElement2ENElementFilter)
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить список для просмотра */
	public ENElement2ENElementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить список для просмотра по фильтру */
	public ENElement2ENElementShortList getScrollableFilteredList(
			ENElement2ENElementFilter aENElement2ENElementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить список для просмотра по условию */
	public ENElement2ENElementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENElement2ENElementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2ENElement. Получить объект из списка */
	public ENElement2ENElementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}