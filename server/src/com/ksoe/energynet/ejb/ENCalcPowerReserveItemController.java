
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCalcPowerReserveItem;
 *
 */

import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveItemShortList;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveItemShort;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveItemFilter;


public interface ENCalcPowerReserveItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCalcPowerReserveItemController";

	/* ENCalcPowerReserveItem. Добавить */
	public int add(ENCalcPowerReserveItem aENCalcPowerReserveItem)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Изменить */
	public void save(ENCalcPowerReserveItem aENCalcPowerReserveItem)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить объект */
	public ENCalcPowerReserveItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить полный список */
	public ENCalcPowerReserveItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить список по фильтру */
	public ENCalcPowerReserveItemShortList getFilteredList(
			ENCalcPowerReserveItemFilter aENCalcPowerReserveItemFilter)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить список для просмотра */
	public ENCalcPowerReserveItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить список для просмотра по фильтру */
	public ENCalcPowerReserveItemShortList getScrollableFilteredList(
			ENCalcPowerReserveItemFilter aENCalcPowerReserveItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить список для просмотра по условию */
	public ENCalcPowerReserveItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCalcPowerReserveItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. Получить объект из списка */
	public ENCalcPowerReserveItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}