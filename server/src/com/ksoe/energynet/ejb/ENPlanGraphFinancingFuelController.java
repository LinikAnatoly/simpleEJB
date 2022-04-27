
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanGraphFinancingFuel;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelShort;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelShortList;


public interface ENPlanGraphFinancingFuelController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanGraphFinancingFuelController";

	/* ENPlanGraphFinancingFuel. Добавить */
	public int add(ENPlanGraphFinancingFuel aENPlanGraphFinancingFuel)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Изменить */
	public void save(ENPlanGraphFinancingFuel aENPlanGraphFinancingFuel)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить объект */
	public ENPlanGraphFinancingFuel getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить полный список */
	public ENPlanGraphFinancingFuelShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить список по фильтру */
	public ENPlanGraphFinancingFuelShortList getFilteredList(
			ENPlanGraphFinancingFuelFilter aENPlanGraphFinancingFuelFilter)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить список для просмотра */
	public ENPlanGraphFinancingFuelShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить список для просмотра по фильтру */
	public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(
			ENPlanGraphFinancingFuelFilter aENPlanGraphFinancingFuelFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить список для просмотра по условию */
	public ENPlanGraphFinancingFuelShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanGraphFinancingFuelFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. Получить объект из списка */
	public ENPlanGraphFinancingFuelShort getShortObject(int code)
			throws java.rmi.RemoteException;

}