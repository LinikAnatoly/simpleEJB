
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTCOValues;
 *
 */

import com.ksoe.energynet.valueobject.ENTCOValues;
import com.ksoe.energynet.valueobject.lists.ENTCOValuesShortList;
import com.ksoe.energynet.valueobject.brief.ENTCOValuesShort;
import com.ksoe.energynet.valueobject.filter.ENTCOValuesFilter;


public interface ENTCOValuesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTCOValuesController";

	/* ENTCOValues. Добавить */
	public int add(ENTCOValues aENTCOValues)
			throws java.rmi.RemoteException;

	/* ENTCOValues. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTCOValues. Изменить */
	public void save(ENTCOValues aENTCOValues)
			throws java.rmi.RemoteException;

	/* ENTCOValues. Получить объект */
	public ENTCOValues getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTCOValues. Получить полный список */
	public ENTCOValuesShortList getList()
			throws java.rmi.RemoteException;

	/* ENTCOValues. Получить список по фильтру */
	public ENTCOValuesShortList getFilteredList(
			ENTCOValuesFilter aENTCOValuesFilter)
			throws java.rmi.RemoteException;

	/* ENTCOValues. Получить список для просмотра */
	public ENTCOValuesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValues. Получить список для просмотра по фильтру */
	public ENTCOValuesShortList getScrollableFilteredList(
			ENTCOValuesFilter aENTCOValuesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValues. Получить список для просмотра по условию */
	public ENTCOValuesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTCOValues. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTCOValuesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTCOValues. Получить объект из списка */
	public ENTCOValuesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}