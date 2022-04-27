
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSealNames;
 *
 */

import com.ksoe.energynet.valueobject.ENSealNames;
import com.ksoe.energynet.valueobject.brief.ENSealNamesShort;
import com.ksoe.energynet.valueobject.filter.ENSealNamesFilter;
import com.ksoe.energynet.valueobject.lists.ENSealNamesShortList;


public interface ENSealNamesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSealNamesController";

	/* ENSealNames. Добавить */
	public int add(ENSealNames aENSealNames)
			throws java.rmi.RemoteException;

	/* ENSealNames. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSealNames. Изменить */
	public void save(ENSealNames aENSealNames)
			throws java.rmi.RemoteException;

	/* ENSealNames. Получить объект */
	public ENSealNames getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSealNames. Получить полный список */
	public ENSealNamesShortList getList()
			throws java.rmi.RemoteException;

	/* ENSealNames. Получить список по фильтру */
	public ENSealNamesShortList getFilteredList(
			ENSealNamesFilter aENSealNamesFilter)
			throws java.rmi.RemoteException;

	/* ENSealNames. Получить список для просмотра */
	public ENSealNamesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealNames. Получить список для просмотра по фильтру */
	public ENSealNamesShortList getScrollableFilteredList(
			ENSealNamesFilter aENSealNamesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealNames. Получить список для просмотра по условию */
	public ENSealNamesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSealNames. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSealNamesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSealNames. Получить объект из списка */
	public ENSealNamesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}