
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPayment2SO;
 *
 */

import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.brief.ENPayment2SOShort;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;


public interface ENPayment2SOController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPayment2SOController";

	/* ENPayment2SO. Добавить */
	public int add(ENPayment2SO aENPayment2SO)
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPayment2SO. Изменить */
	public void save(ENPayment2SO aENPayment2SO)
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить объект */
	public ENPayment2SO getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить полный список */
	public ENPayment2SOShortList getList()
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить список по фильтру */
	public ENPayment2SOShortList getFilteredList(
			ENPayment2SOFilter aENPayment2SOFilter)
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить список для просмотра */
	public ENPayment2SOShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить список для просмотра по фильтру */
	public ENPayment2SOShortList getScrollableFilteredList(
			ENPayment2SOFilter aENPayment2SOFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить список для просмотра по условию */
	public ENPayment2SOShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPayment2SOFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPayment2SO. Получить объект из списка */
	public ENPayment2SOShort getShortObject(int code)
			throws java.rmi.RemoteException;

}