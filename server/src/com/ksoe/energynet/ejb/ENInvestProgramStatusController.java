
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestProgramStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestProgramStatus;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramStatusShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramStatusShortList;


public interface ENInvestProgramStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramStatusController";

	/* ENInvestProgramStatus. Добавить */
	public int add(ENInvestProgramStatus aENInvestProgramStatus)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Изменить */
	public void save(ENInvestProgramStatus aENInvestProgramStatus)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить объект */
	public ENInvestProgramStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить полный список */
	public ENInvestProgramStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить список по фильтру */
	public ENInvestProgramStatusShortList getFilteredList(
			ENInvestProgramStatusFilter aENInvestProgramStatusFilter)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить список для просмотра */
	public ENInvestProgramStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить список для просмотра по фильтру */
	public ENInvestProgramStatusShortList getScrollableFilteredList(
			ENInvestProgramStatusFilter aENInvestProgramStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить список для просмотра по условию */
	public ENInvestProgramStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInvestProgramStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. Получить объект из списка */
	public ENInvestProgramStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}