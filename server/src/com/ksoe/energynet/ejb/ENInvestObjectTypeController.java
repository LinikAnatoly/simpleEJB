
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestObjectType;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestObjectType;
import com.ksoe.energynet.valueobject.brief.ENInvestObjectTypeShort;
import com.ksoe.energynet.valueobject.filter.ENInvestObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestObjectTypeShortList;


public interface ENInvestObjectTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestObjectTypeController";

	/* ENInvestObjectType. Добавить */
	public int add(ENInvestObjectType aENInvestObjectType)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestObjectType. Изменить */
	public void save(ENInvestObjectType aENInvestObjectType)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить объект */
	public ENInvestObjectType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить полный список */
	public ENInvestObjectTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить список по фильтру */
	public ENInvestObjectTypeShortList getFilteredList(
			ENInvestObjectTypeFilter aENInvestObjectTypeFilter)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить список для просмотра */
	public ENInvestObjectTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить список для просмотра по фильтру */
	public ENInvestObjectTypeShortList getScrollableFilteredList(
			ENInvestObjectTypeFilter aENInvestObjectTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить список для просмотра по условию */
	public ENInvestObjectTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInvestObjectTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. Получить объект из списка */
	public ENInvestObjectTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}