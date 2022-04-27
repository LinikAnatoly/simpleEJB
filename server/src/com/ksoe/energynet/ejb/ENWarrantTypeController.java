
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWarrantType;
 *
 */

import com.ksoe.energynet.valueobject.ENWarrantType;
import com.ksoe.energynet.valueobject.lists.ENWarrantTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENWarrantTypeShort;
import com.ksoe.energynet.valueobject.filter.ENWarrantTypeFilter;


public interface ENWarrantTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWarrantTypeController";

	/* ENWarrantType. Добавить */
	public int add(ENWarrantType aENWarrantType)
			throws java.rmi.RemoteException;

	/* ENWarrantType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWarrantType. Изменить */
	public void save(ENWarrantType aENWarrantType)
			throws java.rmi.RemoteException;

	/* ENWarrantType. Получить объект */
	public ENWarrantType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWarrantType. Получить полный список */
	public ENWarrantTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENWarrantType. Получить список по фильтру */
	public ENWarrantTypeShortList getFilteredList(
			ENWarrantTypeFilter aENWarrantTypeFilter)
			throws java.rmi.RemoteException;

	/* ENWarrantType. Получить список для просмотра */
	public ENWarrantTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrantType. Получить список для просмотра по фильтру */
	public ENWarrantTypeShortList getScrollableFilteredList(
			ENWarrantTypeFilter aENWarrantTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrantType. Получить список для просмотра по условию */
	public ENWarrantTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWarrantType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWarrantTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWarrantType. Получить объект из списка */
	public ENWarrantTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}