
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSettleType;
 *
 */

import com.ksoe.energynet.valueobject.ENSettleType;
import com.ksoe.energynet.valueobject.lists.ENSettleTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENSettleTypeShort;
import com.ksoe.energynet.valueobject.filter.ENSettleTypeFilter;


public interface ENSettleTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSettleTypeController";

	/* ENSettleType. Добавить */
	public int add(ENSettleType aENSettleType)
			throws java.rmi.RemoteException;

	/* ENSettleType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSettleType. Изменить */
	public void save(ENSettleType aENSettleType)
			throws java.rmi.RemoteException;

	/* ENSettleType. Получить объект */
	public ENSettleType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSettleType. Получить полный список */
	public ENSettleTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSettleType. Получить список по фильтру */
	public ENSettleTypeShortList getFilteredList(
			ENSettleTypeFilter aENSettleTypeFilter)
			throws java.rmi.RemoteException;

	/* ENSettleType. Получить список для просмотра */
	public ENSettleTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettleType. Получить список для просмотра по фильтру */
	public ENSettleTypeShortList getScrollableFilteredList(
			ENSettleTypeFilter aENSettleTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettleType. Получить список для просмотра по условию */
	public ENSettleTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSettleType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSettleTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSettleType. Получить объект из списка */
	public ENSettleTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}