
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderBytType;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytTypeShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytTypeShortList;


public interface ENWorkOrderBytTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytTypeController";

	/* ENWorkOrderBytType. Добавить */
	public int add(ENWorkOrderBytType aENWorkOrderBytType)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Изменить */
	public void save(ENWorkOrderBytType aENWorkOrderBytType)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить объект */
	public ENWorkOrderBytType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить полный список */
	public ENWorkOrderBytTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить список по фильтру */
	public ENWorkOrderBytTypeShortList getFilteredList(
			ENWorkOrderBytTypeFilter aENWorkOrderBytTypeFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить список для просмотра */
	public ENWorkOrderBytTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить список для просмотра по фильтру */
	public ENWorkOrderBytTypeShortList getScrollableFilteredList(
			ENWorkOrderBytTypeFilter aENWorkOrderBytTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить список для просмотра по условию */
	public ENWorkOrderBytTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. Получить объект из списка */
	public ENWorkOrderBytTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}