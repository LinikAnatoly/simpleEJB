
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSigner;
 *
 */

import com.ksoe.energynet.valueobject.ENSigner;
import com.ksoe.energynet.valueobject.lists.ENSignerShortList;
import com.ksoe.energynet.valueobject.brief.ENSignerShort;
import com.ksoe.energynet.valueobject.filter.ENSignerFilter;


public interface ENSignerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSignerController";

	/* ENSigner. Добавить */
	public int add(ENSigner aENSigner)
			throws java.rmi.RemoteException;

	/* ENSigner. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSigner. Изменить */
	public void save(ENSigner aENSigner)
			throws java.rmi.RemoteException;

	/* ENSigner. Получить объект */
	public ENSigner getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSigner. Получить полный список */
	public ENSignerShortList getList()
			throws java.rmi.RemoteException;

	/* ENSigner. Получить список по фильтру */
	public ENSignerShortList getFilteredList(
			ENSignerFilter aENSignerFilter)
			throws java.rmi.RemoteException;

	/* ENSigner. Получить список для просмотра */
	public ENSignerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSigner. Получить список для просмотра по фильтру */
	public ENSignerShortList getScrollableFilteredList(
			ENSignerFilter aENSignerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSigner. Получить список для просмотра по условию */
	public ENSignerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSigner. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSignerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSigner. Получить объект из списка */
	public ENSignerShort getShortObject(int code)
			throws java.rmi.RemoteException;

}