
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionLocationType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionLocationType;
import com.ksoe.energynet.valueobject.lists.ENConnectionLocationTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionLocationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionLocationTypeFilter;


public interface ENConnectionLocationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionLocationTypeController";

	/* ENConnectionLocationType. Добавить */
	public int add(ENConnectionLocationType aENConnectionLocationType)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Изменить */
	public void save(ENConnectionLocationType aENConnectionLocationType)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить объект */
	public ENConnectionLocationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить полный список */
	public ENConnectionLocationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить список по фильтру */
	public ENConnectionLocationTypeShortList getFilteredList(
			ENConnectionLocationTypeFilter aENConnectionLocationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить список для просмотра */
	public ENConnectionLocationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить список для просмотра по фильтру */
	public ENConnectionLocationTypeShortList getScrollableFilteredList(
			ENConnectionLocationTypeFilter aENConnectionLocationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить список для просмотра по условию */
	public ENConnectionLocationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionLocationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. Получить объект из списка */
	public ENConnectionLocationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}