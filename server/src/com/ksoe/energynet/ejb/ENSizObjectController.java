
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSizObject;
 *
 */

import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.brief.ENSizObjectShort;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENSizObjectShortList;


public interface ENSizObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSizObjectController";

	/* ENSizObject. Добавить */
	public int add(ENSizObject aENSizObject)
			throws java.rmi.RemoteException;

	/* ENSizObject. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSizObject. Изменить */
	public void save(ENSizObject aENSizObject)
			throws java.rmi.RemoteException;

	/* ENSizObject. Получить объект */
	public ENSizObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSizObject. Получить полный список */
	public ENSizObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENSizObject. Получить список по фильтру */
	public ENSizObjectShortList getFilteredList(
			ENSizObjectFilter aENSizObjectFilter)
			throws java.rmi.RemoteException;

	/* ENSizObject. Получить список для просмотра */
	public ENSizObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizObject. Получить список для просмотра по фильтру */
	public ENSizObjectShortList getScrollableFilteredList(
			ENSizObjectFilter aENSizObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizObject. Получить список для просмотра по условию */
	public ENSizObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSizObject. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSizObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSizObject. Получить объект из списка */
	public ENSizObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;


	/**  обновление должности и подразделения по штатному  */
	public void updateStaffPosition(int soCode, String tabNumber) throws java.rmi.RemoteException;

}