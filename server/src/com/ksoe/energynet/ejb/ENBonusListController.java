
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusList;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.brief.ENBonusListShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListShortList;


public interface ENBonusListController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListController";

	/* ENBonusList. Добавить */
	public int add(ENBonusList aENBonusList)
			throws java.rmi.RemoteException;

	/* ENBonusList. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusList. Изменить */
	public void save(ENBonusList aENBonusList)
			throws java.rmi.RemoteException;

	/* ENBonusList. Получить объект */
	public ENBonusList getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusList. Получить полный список */
	public ENBonusListShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusList. Получить список по фильтру */
	public ENBonusListShortList getFilteredList(
			ENBonusListFilter aENBonusListFilter)
			throws java.rmi.RemoteException;

	/* ENBonusList. Получить список для просмотра */
	public ENBonusListShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusList. Получить список для просмотра по фильтру */
	public ENBonusListShortList getScrollableFilteredList(
			ENBonusListFilter aENBonusListFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusList. Получить список для просмотра по условию */
	public ENBonusListShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusList. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusList. Получить объект из списка */
	public ENBonusListShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENBonusList. утвердить  */
	public void approve(int objectCode)
			throws java.rmi.RemoteException;

	/* ENBonusList. отменить утверждение   */
	public void unapprove(int objectCode)
			throws java.rmi.RemoteException;
}