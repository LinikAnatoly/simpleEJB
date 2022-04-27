
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusListItem;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.brief.ENBonusListItemShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListItemShortList;


public interface ENBonusListItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListItemController";

	/* ENBonusListItem. Добавить */
	public int add(ENBonusListItem aENBonusListItem)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusListItem. Изменить */
	public void save(ENBonusListItem aENBonusListItem)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить объект */
	public ENBonusListItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить полный список */
	public ENBonusListItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить список по фильтру */
	public ENBonusListItemShortList getFilteredList(
			ENBonusListItemFilter aENBonusListItemFilter)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить список для просмотра */
	public ENBonusListItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить список для просмотра по фильтру */
	public ENBonusListItemShortList getScrollableFilteredList(
			ENBonusListItemFilter aENBonusListItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить список для просмотра по условию */
	public ENBonusListItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. Получить объект из списка */
	public ENBonusListItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* ставит признак того что строка ведомости не действительна*/
	public void SetBonusItemInvalid(ENBonusListItem aENBonusListItem)throws java.rmi.RemoteException;
	/* убирает признак того что строка ведомости не действительна*/
	public void UnSetBonusItemInvalid(ENBonusListItem aENBonusListItem)throws java.rmi.RemoteException;
	
}