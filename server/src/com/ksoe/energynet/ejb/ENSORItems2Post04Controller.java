
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSORItems2Post04;
 *
 */

import com.ksoe.energynet.valueobject.ENSORItems2Post04;
import com.ksoe.energynet.valueobject.brief.ENSORItems2Post04Short;
import com.ksoe.energynet.valueobject.filter.ENSORItems2Post04Filter;
import com.ksoe.energynet.valueobject.lists.ENSORItems2Post04ShortList;


public interface ENSORItems2Post04Controller extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSORItems2Post04Controller";

	/* ENSORItems2Post04. Добавить */
	public int add(ENSORItems2Post04 aENSORItems2Post04)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Изменить */
	public void save(ENSORItems2Post04 aENSORItems2Post04)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить объект */
	public ENSORItems2Post04 getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить полный список */
	public ENSORItems2Post04ShortList getList()
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить список по фильтру */
	public ENSORItems2Post04ShortList getFilteredList(
			ENSORItems2Post04Filter aENSORItems2Post04Filter)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить список для просмотра */
	public ENSORItems2Post04ShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить список для просмотра по фильтру */
	public ENSORItems2Post04ShortList getScrollableFilteredList(
			ENSORItems2Post04Filter aENSORItems2Post04Filter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить список для просмотра по условию */
	public ENSORItems2Post04ShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSORItems2Post04Filter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post04. Получить объект из списка */
	public ENSORItems2Post04Short getShortObject(int code)
			throws java.rmi.RemoteException;

}