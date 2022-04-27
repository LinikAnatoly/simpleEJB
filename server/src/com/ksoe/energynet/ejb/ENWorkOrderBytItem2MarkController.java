
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderBytItem2Mark;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItem2MarkShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItem2MarkFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItem2MarkShortList;


public interface ENWorkOrderBytItem2MarkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytItem2MarkController";

	/* ENWorkOrderBytItem2Mark. Добавить */
	public int add(ENWorkOrderBytItem2Mark aENWorkOrderBytItem2Mark)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Изменить */
	public void save(ENWorkOrderBytItem2Mark aENWorkOrderBytItem2Mark)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить объект */
	public ENWorkOrderBytItem2Mark getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить полный список */
	public ENWorkOrderBytItem2MarkShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить список по фильтру */
	public ENWorkOrderBytItem2MarkShortList getFilteredList(
			ENWorkOrderBytItem2MarkFilter aENWorkOrderBytItem2MarkFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить список для просмотра */
	public ENWorkOrderBytItem2MarkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить список для просмотра по фильтру */
	public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(
			ENWorkOrderBytItem2MarkFilter aENWorkOrderBytItem2MarkFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить список для просмотра по условию */
	public ENWorkOrderBytItem2MarkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytItem2MarkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem2Mark. Получить объект из списка */
	public ENWorkOrderBytItem2MarkShort getShortObject(int code)
			throws java.rmi.RemoteException;

}