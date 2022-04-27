
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for AXOrgType;
 *
 */

import com.ksoe.energynet.valueobject.AXOrgType;
import com.ksoe.energynet.valueobject.brief.AXOrgTypeShort;
import com.ksoe.energynet.valueobject.filter.AXOrgTypeFilter;
import com.ksoe.energynet.valueobject.lists.AXOrgTypeShortList;


public interface AXOrgTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/AXOrgTypeController";

	/* AXOrgType. Добавить */
	public int add(AXOrgType aAXOrgType)
			throws java.rmi.RemoteException;

	/* AXOrgType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* AXOrgType. Изменить */
	public void save(AXOrgType aAXOrgType)
			throws java.rmi.RemoteException;

	/* AXOrgType. Получить объект */
	public AXOrgType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* AXOrgType. Получить полный список */
	public AXOrgTypeShortList getList()
			throws java.rmi.RemoteException;

	/* AXOrgType. Получить список по фильтру */
	public AXOrgTypeShortList getFilteredList(
			AXOrgTypeFilter aAXOrgTypeFilter)
			throws java.rmi.RemoteException;

	/* AXOrgType. Получить список для просмотра */
	public AXOrgTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgType. Получить список для просмотра по фильтру */
	public AXOrgTypeShortList getScrollableFilteredList(
			AXOrgTypeFilter aAXOrgTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgType. Получить список для просмотра по условию */
	public AXOrgTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* AXOrgType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			AXOrgTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* AXOrgType. Получить объект из списка */
	public AXOrgTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}