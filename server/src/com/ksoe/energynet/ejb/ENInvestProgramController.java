
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestProgram;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestProgram;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramShortList;


public interface ENInvestProgramController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramController";

	/* ENInvestProgram. Добавить */
	public int add(ENInvestProgram aENInvestProgram)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestProgram. Изменить */
	public void save(ENInvestProgram aENInvestProgram)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить объект */
	public ENInvestProgram getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить полный список */
	public ENInvestProgramShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить список по фильтру */
	public ENInvestProgramShortList getFilteredList(
			ENInvestProgramFilter aENInvestProgramFilter)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить список для просмотра */
	public ENInvestProgramShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить список для просмотра по фильтру */
	public ENInvestProgramShortList getScrollableFilteredList(
			ENInvestProgramFilter aENInvestProgramFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить список для просмотра по условию */
	public ENInvestProgramShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInvestProgramFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestProgram. Получить объект из списка */
	public ENInvestProgramShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* ENInvestProgram. Перевод Инвестпрограммы в статус "Финансирование завершено" */
	public void setFinancingCompleted(int code) throws java.rmi.RemoteException;
	
	// public void fillItems(int investProgramCode) throws java.rmi.RemoteException;
}