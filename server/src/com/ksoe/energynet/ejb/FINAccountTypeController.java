
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FINAccountType;
 *
 */

import com.ksoe.energynet.valueobject.FINAccountType;
import com.ksoe.energynet.valueobject.lists.FINAccountTypeShortList;
import com.ksoe.energynet.valueobject.brief.FINAccountTypeShort;
import com.ksoe.energynet.valueobject.filter.FINAccountTypeFilter;


public interface FINAccountTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FINAccountTypeController";

	/* FINAccountType. Добавить */
	public int add(FINAccountType aFINAccountType)
			throws java.rmi.RemoteException;

	/* FINAccountType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FINAccountType. Изменить */
	public void save(FINAccountType aFINAccountType)
			throws java.rmi.RemoteException;

	/* FINAccountType. Получить объект */
	public FINAccountType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FINAccountType. Получить полный список */
	public FINAccountTypeShortList getList()
			throws java.rmi.RemoteException;

	/* FINAccountType. Получить список по фильтру */
	public FINAccountTypeShortList getFilteredList(
			FINAccountTypeFilter aFINAccountTypeFilter)
			throws java.rmi.RemoteException;

	/* FINAccountType. Получить список для просмотра */
	public FINAccountTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINAccountType. Получить список для просмотра по фильтру */
	public FINAccountTypeShortList getScrollableFilteredList(
			FINAccountTypeFilter aFINAccountTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINAccountType. Получить список для просмотра по условию */
	public FINAccountTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FINAccountType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			FINAccountTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FINAccountType. Получить объект из списка */
	public FINAccountTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}