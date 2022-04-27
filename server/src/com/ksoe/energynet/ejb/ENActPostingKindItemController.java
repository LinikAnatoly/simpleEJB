
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingKindItem;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingKindItem;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindItemShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingKindItemShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindItemFilter;


public interface ENActPostingKindItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingKindItemController";

	/* ENActPostingKindItem. Добавить */
	public int add(ENActPostingKindItem aENActPostingKindItem)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Изменить */
	public void save(ENActPostingKindItem aENActPostingKindItem)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить объект */
	public ENActPostingKindItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить полный список */
	public ENActPostingKindItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить список по фильтру */
	public ENActPostingKindItemShortList getFilteredList(
			ENActPostingKindItemFilter aENActPostingKindItemFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить список для просмотра */
	public ENActPostingKindItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить список для просмотра по фильтру */
	public ENActPostingKindItemShortList getScrollableFilteredList(
			ENActPostingKindItemFilter aENActPostingKindItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить список для просмотра по условию */
	public ENActPostingKindItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingKindItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. Получить объект из списка */
	public ENActPostingKindItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}