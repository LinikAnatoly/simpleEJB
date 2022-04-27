
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomeCreatMetod;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeCreatMetod;
import com.ksoe.energynet.valueobject.lists.ENActIncomeCreatMetodShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomeCreatMetodShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeCreatMetodFilter;


public interface ENActIncomeCreatMetodController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeCreatMetodController";

	/* ENActIncomeCreatMetod. Добавить */
	public int add(ENActIncomeCreatMetod aENActIncomeCreatMetod)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Изменить */
	public void save(ENActIncomeCreatMetod aENActIncomeCreatMetod)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить объект */
	public ENActIncomeCreatMetod getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить полный список */
	public ENActIncomeCreatMetodShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить список по фильтру */
	public ENActIncomeCreatMetodShortList getFilteredList(
			ENActIncomeCreatMetodFilter aENActIncomeCreatMetodFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить список для просмотра */
	public ENActIncomeCreatMetodShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить список для просмотра по фильтру */
	public ENActIncomeCreatMetodShortList getScrollableFilteredList(
			ENActIncomeCreatMetodFilter aENActIncomeCreatMetodFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить список для просмотра по условию */
	public ENActIncomeCreatMetodShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeCreatMetodFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. Получить объект из списка */
	public ENActIncomeCreatMetodShort getShortObject(int code)
			throws java.rmi.RemoteException;

}