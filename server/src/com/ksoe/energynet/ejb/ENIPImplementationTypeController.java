
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPImplementationType;
 *
 */

import com.ksoe.energynet.valueobject.ENIPImplementationType;
import com.ksoe.energynet.valueobject.brief.ENIPImplementationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENIPImplementationTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENIPImplementationTypeShortList;


public interface ENIPImplementationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPImplementationTypeController";

	/* ENIPImplementationType. Добавить */
	public int add(ENIPImplementationType aENIPImplementationType)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPImplementationType. Изменить */
	public void save(ENIPImplementationType aENIPImplementationType)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить объект */
	public ENIPImplementationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить полный список */
	public ENIPImplementationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить список по фильтру */
	public ENIPImplementationTypeShortList getFilteredList(
			ENIPImplementationTypeFilter aENIPImplementationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить список для просмотра */
	public ENIPImplementationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить список для просмотра по фильтру */
	public ENIPImplementationTypeShortList getScrollableFilteredList(
			ENIPImplementationTypeFilter aENIPImplementationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить список для просмотра по условию */
	public ENIPImplementationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPImplementationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. Получить объект из списка */
	public ENIPImplementationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}