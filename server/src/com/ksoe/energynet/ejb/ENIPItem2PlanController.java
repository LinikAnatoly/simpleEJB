
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem2Plan;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem2Plan;
import com.ksoe.energynet.valueobject.brief.ENIPItem2PlanShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2PlanFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2PlanShortList;


public interface ENIPItem2PlanController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItem2PlanController";

	/* ENIPItem2Plan. Добавить */
	public int add(ENIPItem2Plan aENIPItem2Plan)
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Изменить */
	public void save(ENIPItem2Plan aENIPItem2Plan)
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить объект */
	public ENIPItem2Plan getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить полный список */
	public ENIPItem2PlanShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить список по фильтру */
	public ENIPItem2PlanShortList getFilteredList(
			ENIPItem2PlanFilter aENIPItem2PlanFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить список для просмотра */
	public ENIPItem2PlanShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить список для просмотра по фильтру */
	public ENIPItem2PlanShortList getScrollableFilteredList(
			ENIPItem2PlanFilter aENIPItem2PlanFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить список для просмотра по условию */
	public ENIPItem2PlanShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItem2PlanFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem2Plan. Получить объект из списка */
	public ENIPItem2PlanShort getShortObject(int code)
			throws java.rmi.RemoteException;


	/* ENIPItem2Plan. создание связки пункта ИП с планом который только что создан */
	public int addWithNewPlan(ENIPItem2Plan aENIPItem2Plan)
			throws java.rmi.RemoteException;

}