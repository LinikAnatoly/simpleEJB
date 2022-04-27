
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDelayServices;
 *
 */

import com.ksoe.energynet.valueobject.ENDelayServices;
import com.ksoe.energynet.valueobject.brief.ENDelayServicesShort;
import com.ksoe.energynet.valueobject.filter.ENDelayServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENDelayServicesShortList;


public interface ENDelayServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDelayServicesController";

	/* ENDelayServices. Добавить */
	public int add(ENDelayServices aENDelayServices)
			throws java.rmi.RemoteException;

	/* ENDelayServices. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDelayServices. Изменить */
	public void save(ENDelayServices aENDelayServices)
			throws java.rmi.RemoteException;

	/* ENDelayServices. Получить объект */
	public ENDelayServices getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDelayServices. Получить полный список */
	public ENDelayServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENDelayServices. Получить список по фильтру */
	public ENDelayServicesShortList getFilteredList(
			ENDelayServicesFilter aENDelayServicesFilter)
			throws java.rmi.RemoteException;

	/* ENDelayServices. Получить список для просмотра */
	public ENDelayServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDelayServices. Получить список для просмотра по фильтру */
	public ENDelayServicesShortList getScrollableFilteredList(
			ENDelayServicesFilter aENDelayServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDelayServices. Получить список для просмотра по условию */
	public ENDelayServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDelayServices. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDelayServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDelayServices. Получить объект из списка */
	public ENDelayServicesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}