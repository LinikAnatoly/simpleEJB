
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesTransport;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.lists.ENServicesTransportShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesTransportShort;
import com.ksoe.energynet.valueobject.filter.ENServicesTransportFilter;


public interface ENServicesTransportController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesTransportController";

	/* ENServicesTransport. Добавить */
	public int add(ENServicesTransport aENServicesTransport)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesTransport. Изменить */
	public void save(ENServicesTransport aENServicesTransport)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить объект */
	public ENServicesTransport getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить полный список */
	public ENServicesTransportShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить список по фильтру */
	public ENServicesTransportShortList getFilteredList(
			ENServicesTransportFilter aENServicesTransportFilter)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить список для просмотра */
	public ENServicesTransportShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить список для просмотра по фильтру */
	public ENServicesTransportShortList getScrollableFilteredList(
			ENServicesTransportFilter aENServicesTransportFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить список для просмотра по условию */
	public ENServicesTransportShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesTransportFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. Получить объект из списка */
	public ENServicesTransportShort getShortObject(int code)
			throws java.rmi.RemoteException;

}