
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingKind;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingKind;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingKindShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindFilter;


public interface ENActPostingKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingKindController";

	/* ENActPostingKind. Добавить */
	public int add(ENActPostingKind aENActPostingKind)
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingKind. Изменить */
	public void save(ENActPostingKind aENActPostingKind)
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить объект */
	public ENActPostingKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить полный список */
	public ENActPostingKindShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить список по фильтру */
	public ENActPostingKindShortList getFilteredList(
			ENActPostingKindFilter aENActPostingKindFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить список для просмотра */
	public ENActPostingKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить список для просмотра по фильтру */
	public ENActPostingKindShortList getScrollableFilteredList(
			ENActPostingKindFilter aENActPostingKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить список для просмотра по условию */
	public ENActPostingKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingKind. Получить объект из списка */
	public ENActPostingKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}