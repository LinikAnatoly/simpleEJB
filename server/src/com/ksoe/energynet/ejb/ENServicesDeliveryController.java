
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesDelivery;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesDelivery;
import com.ksoe.energynet.valueobject.lists.ENServicesDeliveryShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesDeliveryShort;
import com.ksoe.energynet.valueobject.filter.ENServicesDeliveryFilter;


public interface ENServicesDeliveryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesDeliveryController";

	/* ENServicesDelivery. Добавить */
	public int add(ENServicesDelivery aENServicesDelivery)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesDelivery. Изменить */
	public void save(ENServicesDelivery aENServicesDelivery)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить объект */
	public ENServicesDelivery getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить полный список */
	public ENServicesDeliveryShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить список по фильтру */
	public ENServicesDeliveryShortList getFilteredList(
			ENServicesDeliveryFilter aENServicesDeliveryFilter)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить список для просмотра */
	public ENServicesDeliveryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить список для просмотра по фильтру */
	public ENServicesDeliveryShortList getScrollableFilteredList(
			ENServicesDeliveryFilter aENServicesDeliveryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить список для просмотра по условию */
	public ENServicesDeliveryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesDeliveryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. Получить объект из списка */
	public ENServicesDeliveryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}