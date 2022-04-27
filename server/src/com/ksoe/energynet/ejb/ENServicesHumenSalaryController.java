
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesHumenSalary;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesHumenSalary;
import com.ksoe.energynet.valueobject.lists.ENServicesHumenSalaryShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesHumenSalaryShort;
import com.ksoe.energynet.valueobject.filter.ENServicesHumenSalaryFilter;


public interface ENServicesHumenSalaryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesHumenSalaryController";

	/* ENServicesHumenSalary. Добавить */
	public int add(ENServicesHumenSalary aENServicesHumenSalary)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Изменить */
	public void save(ENServicesHumenSalary aENServicesHumenSalary)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить объект */
	public ENServicesHumenSalary getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить полный список */
	public ENServicesHumenSalaryShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить список по фильтру */
	public ENServicesHumenSalaryShortList getFilteredList(
			ENServicesHumenSalaryFilter aENServicesHumenSalaryFilter)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить список для просмотра */
	public ENServicesHumenSalaryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить список для просмотра по фильтру */
	public ENServicesHumenSalaryShortList getScrollableFilteredList(
			ENServicesHumenSalaryFilter aENServicesHumenSalaryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить список для просмотра по условию */
	public ENServicesHumenSalaryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesHumenSalaryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. Получить объект из списка */
	public ENServicesHumenSalaryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}