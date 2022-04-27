
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInvResultType;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInvResultType;
import com.ksoe.energynet.valueobject.brief.ENFuelInvResultTypeShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInvResultTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultTypeShortList;


public interface ENFuelInvResultTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInvResultTypeController";

	/* ENFuelInvResultType. Добавить */
	public int add(ENFuelInvResultType aENFuelInvResultType)
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Изменить */
	public void save(ENFuelInvResultType aENFuelInvResultType)
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить объект */
	public ENFuelInvResultType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить полный список */
	public ENFuelInvResultTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить список по фильтру */
	public ENFuelInvResultTypeShortList getFilteredList(
			ENFuelInvResultTypeFilter aENFuelInvResultTypeFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить список для просмотра */
	public ENFuelInvResultTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить список для просмотра по фильтру */
	public ENFuelInvResultTypeShortList getScrollableFilteredList(
			ENFuelInvResultTypeFilter aENFuelInvResultTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить список для просмотра по условию */
	public ENFuelInvResultTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInvResultTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInvResultType. Получить объект из списка */
	public ENFuelInvResultTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}