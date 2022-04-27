
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionCityType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionCityType;
import com.ksoe.energynet.valueobject.lists.ENConnectionCityTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionCityTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionCityTypeFilter;


public interface ENConnectionCityTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionCityTypeController";

	/* ENConnectionCityType. Добавить */
	public int add(ENConnectionCityType aENConnectionCityType)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionCityType. Изменить */
	public void save(ENConnectionCityType aENConnectionCityType)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить объект */
	public ENConnectionCityType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить полный список */
	public ENConnectionCityTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить список по фильтру */
	public ENConnectionCityTypeShortList getFilteredList(
			ENConnectionCityTypeFilter aENConnectionCityTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить список для просмотра */
	public ENConnectionCityTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить список для просмотра по фильтру */
	public ENConnectionCityTypeShortList getScrollableFilteredList(
			ENConnectionCityTypeFilter aENConnectionCityTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить список для просмотра по условию */
	public ENConnectionCityTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionCityTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. Получить объект из списка */
	public ENConnectionCityTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}