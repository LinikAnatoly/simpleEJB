
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FINCurrency;
 *
 */

import com.ksoe.energynet.valueobject.FINCurrency;
import com.ksoe.energynet.valueobject.lists.FINCurrencyShortList;
import com.ksoe.energynet.valueobject.brief.FINCurrencyShort;
import com.ksoe.energynet.valueobject.filter.FINCurrencyFilter;


public interface FINCurrencyController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FINCurrencyController";

	/* FINCurrency. Добавить */
	public int add(FINCurrency aFINCurrency)
			throws java.rmi.RemoteException;

	/* FINCurrency. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FINCurrency. Изменить */
	public void save(FINCurrency aFINCurrency)
			throws java.rmi.RemoteException;

	/* FINCurrency. Получить объект */
	public FINCurrency getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FINCurrency. Получить полный список */
	public FINCurrencyShortList getList()
			throws java.rmi.RemoteException;

	/* FINCurrency. Получить список по фильтру */
	public FINCurrencyShortList getFilteredList(
			FINCurrencyFilter aFINCurrencyFilter)
			throws java.rmi.RemoteException;

	/* FINCurrency. Получить список для просмотра */
	public FINCurrencyShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINCurrency. Получить список для просмотра по фильтру */
	public FINCurrencyShortList getScrollableFilteredList(
			FINCurrencyFilter aFINCurrencyFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINCurrency. Получить список для просмотра по условию */
	public FINCurrencyShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FINCurrency. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			FINCurrencyFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FINCurrency. Получить объект из списка */
	public FINCurrencyShort getShortObject(int code)
			throws java.rmi.RemoteException;

}