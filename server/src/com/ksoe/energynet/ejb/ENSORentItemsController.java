
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSORentItems;
 *
 */

import com.ksoe.energynet.valueobject.ENSORentItems;
import com.ksoe.energynet.valueobject.brief.ENSORentItemsShort;
import com.ksoe.energynet.valueobject.filter.ENSORentItemsFilter;
import com.ksoe.energynet.valueobject.lists.ENSORentItemsShortList;


public interface ENSORentItemsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSORentItemsController";

	/* ENSORentItems. Добавить */
	public int add(ENSORentItems aENSORentItems)
			throws java.rmi.RemoteException;

	/* ENSORentItems. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSORentItems. Изменить */
	public void save(ENSORentItems aENSORentItems)
			throws java.rmi.RemoteException;

	/* ENSORentItems. Получить объект */
	public ENSORentItems getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSORentItems. Получить полный список */
	public ENSORentItemsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSORentItems. Получить список по фильтру */
	public ENSORentItemsShortList getFilteredList(
			ENSORentItemsFilter aENSORentItemsFilter)
			throws java.rmi.RemoteException;

	/* ENSORentItems. Получить список для просмотра */
	public ENSORentItemsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORentItems. Получить список для просмотра по фильтру */
	public ENSORentItemsShortList getScrollableFilteredList(
			ENSORentItemsFilter aENSORentItemsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORentItems. Получить список для просмотра по условию */
	public ENSORentItemsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSORentItems. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSORentItemsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSORentItems. Получить объект из списка */
	public ENSORentItemsShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void insertContractToLeaseAgreementAndCallCenter(int fromCodeServicesObject, int toCodeServicesObject)
			throws java.rmi.RemoteException;

}