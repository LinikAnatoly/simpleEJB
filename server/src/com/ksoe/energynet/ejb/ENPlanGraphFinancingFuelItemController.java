
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanGraphFinancingFuelItem;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelItemShort;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelItemFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelItemShortList;


public interface ENPlanGraphFinancingFuelItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanGraphFinancingFuelItemController";

	/* ENPlanGraphFinancingFuelItem. Добавить */
	public int add(ENPlanGraphFinancingFuelItem aENPlanGraphFinancingFuelItem)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Изменить */
	public void save(ENPlanGraphFinancingFuelItem aENPlanGraphFinancingFuelItem)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить объект */
	public ENPlanGraphFinancingFuelItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить полный список */
	public ENPlanGraphFinancingFuelItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить список по фильтру */
	public ENPlanGraphFinancingFuelItemShortList getFilteredList(
			ENPlanGraphFinancingFuelItemFilter aENPlanGraphFinancingFuelItemFilter)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить список для просмотра */
	public ENPlanGraphFinancingFuelItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить список для просмотра по фильтру */
	public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(
			ENPlanGraphFinancingFuelItemFilter aENPlanGraphFinancingFuelItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить список для просмотра по условию */
	public ENPlanGraphFinancingFuelItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanGraphFinancingFuelItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. Получить объект из списка */
	public ENPlanGraphFinancingFuelItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}