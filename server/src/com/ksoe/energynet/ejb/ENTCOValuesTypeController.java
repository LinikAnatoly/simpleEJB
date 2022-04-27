
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTCOValuesType;
 *
 */

import com.ksoe.energynet.valueobject.ENTCOValuesType;
import com.ksoe.energynet.valueobject.lists.ENTCOValuesTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENTCOValuesTypeShort;
import com.ksoe.energynet.valueobject.filter.ENTCOValuesTypeFilter;


public interface ENTCOValuesTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTCOValuesTypeController";

	/* ENTCOValuesType. Добавить */
	public int add(ENTCOValuesType aENTCOValuesType)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTCOValuesType. Изменить */
	public void save(ENTCOValuesType aENTCOValuesType)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить объект */
	public ENTCOValuesType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить полный список */
	public ENTCOValuesTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить список по фильтру */
	public ENTCOValuesTypeShortList getFilteredList(
			ENTCOValuesTypeFilter aENTCOValuesTypeFilter)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить список для просмотра */
	public ENTCOValuesTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить список для просмотра по фильтру */
	public ENTCOValuesTypeShortList getScrollableFilteredList(
			ENTCOValuesTypeFilter aENTCOValuesTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить список для просмотра по условию */
	public ENTCOValuesTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTCOValuesTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. Получить объект из списка */
	public ENTCOValuesTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}