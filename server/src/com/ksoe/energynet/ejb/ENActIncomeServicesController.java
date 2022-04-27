
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;

/**
 * EJB Controller interface for ENActIncomeServices;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServicesShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeServicesShortList;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;


public interface ENActIncomeServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeServicesController";

	/* ENActIncomeServices. Добавить */
	public int add(ENActIncomeServices aENActIncomeServices)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeServices. Изменить */
	public void save(ENActIncomeServices aENActIncomeServices)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить объект */
	public ENActIncomeServices getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить полный список */
	public ENActIncomeServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить список по фильтру */
	public ENActIncomeServicesShortList getFilteredList(
			ENActIncomeServicesFilter aENActIncomeServicesFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить список для просмотра */
	public ENActIncomeServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить список для просмотра по фильтру */
	public ENActIncomeServicesShortList getScrollableFilteredList(
			ENActIncomeServicesFilter aENActIncomeServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить список для просмотра по условию */
	public ENActIncomeServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. Получить объект из списка */
	public ENActIncomeServicesShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/** ENActIncomeServices. Получить дату проведения по коду доходного акта */
	public Date getDatePostingsByActIncomeServicesCode(int actIncomeServicesCode) throws java.rmi.RemoteException;


	/** Получить список проводок по доходному акту */
	public FKProvObjectShortList getPostingsList(int actIncomeServicesCode) throws java.rmi.RemoteException;

	/** Отвязать расходный акт от доходного и пересчитать суммы */
	public void removeActFromActIncomeServices(int actCode) throws java.rmi.RemoteException;
}