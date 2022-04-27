
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestProgramItem;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestProgramItem;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramItemShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramItemFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramItemShortList;


public interface ENInvestProgramItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramItemController";

	/* ENInvestProgramItem. Добавить */
	public int add(ENInvestProgramItem aENInvestProgramItem)
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Изменить */
	public void save(ENInvestProgramItem aENInvestProgramItem)
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить объект */
	public ENInvestProgramItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить полный список */
	public ENInvestProgramItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить список по фильтру */
	public ENInvestProgramItemShortList getFilteredList(
			ENInvestProgramItemFilter aENInvestProgramItemFilter)
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить список для просмотра */
	public ENInvestProgramItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить список для просмотра по фильтру */
	public ENInvestProgramItemShortList getScrollableFilteredList(
			ENInvestProgramItemFilter aENInvestProgramItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить список для просмотра по условию */
	public ENInvestProgramItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInvestProgramItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestProgramItem. Получить объект из списка */
	public ENInvestProgramItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

	// public ENInvestProgramItemShortList getMaterialsFromPlans(int investProgramCode) throws java.rmi.RemoteException;
}