
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusListItemStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusListItemStatus;
import com.ksoe.energynet.valueobject.brief.ENBonusListItemStatusShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListItemStatusShortList;


public interface ENBonusListItemStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListItemStatusController";

	/* ENBonusListItemStatus. Добавить */
	public int add(ENBonusListItemStatus aENBonusListItemStatus)
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Изменить */
	public void save(ENBonusListItemStatus aENBonusListItemStatus)
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить объект */
	public ENBonusListItemStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить полный список */
	public ENBonusListItemStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить список по фильтру */
	public ENBonusListItemStatusShortList getFilteredList(
			ENBonusListItemStatusFilter aENBonusListItemStatusFilter)
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить список для просмотра */
	public ENBonusListItemStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить список для просмотра по фильтру */
	public ENBonusListItemStatusShortList getScrollableFilteredList(
			ENBonusListItemStatusFilter aENBonusListItemStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить список для просмотра по условию */
	public ENBonusListItemStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListItemStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusListItemStatus. Получить объект из списка */
	public ENBonusListItemStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}