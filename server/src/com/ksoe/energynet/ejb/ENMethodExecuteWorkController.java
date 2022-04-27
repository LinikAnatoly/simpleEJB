
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMethodExecuteWork;
 *
 */

import com.ksoe.energynet.valueobject.ENMethodExecuteWork;
import com.ksoe.energynet.valueobject.brief.ENMethodExecuteWorkShort;
import com.ksoe.energynet.valueobject.filter.ENMethodExecuteWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMethodExecuteWorkShortList;


public interface ENMethodExecuteWorkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMethodExecuteWorkController";

	/* ENMethodExecuteWork. Добавить */
	public int add(ENMethodExecuteWork aENMethodExecuteWork)
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Изменить */
	public void save(ENMethodExecuteWork aENMethodExecuteWork)
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить объект */
	public ENMethodExecuteWork getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить полный список */
	public ENMethodExecuteWorkShortList getList()
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить список по фильтру */
	public ENMethodExecuteWorkShortList getFilteredList(
			ENMethodExecuteWorkFilter aENMethodExecuteWorkFilter)
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить список для просмотра */
	public ENMethodExecuteWorkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить список для просмотра по фильтру */
	public ENMethodExecuteWorkShortList getScrollableFilteredList(
			ENMethodExecuteWorkFilter aENMethodExecuteWorkFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить список для просмотра по условию */
	public ENMethodExecuteWorkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENMethodExecuteWorkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMethodExecuteWork. Получить объект из списка */
	public ENMethodExecuteWorkShort getShortObject(int code)
			throws java.rmi.RemoteException;

}