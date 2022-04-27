
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOBill;
 *
 */

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENSOBill;
import com.ksoe.energynet.valueobject.brief.ENSOBillShort;
import com.ksoe.energynet.valueobject.filter.ENSOBillFilter;
import com.ksoe.energynet.valueobject.lists.ENSOBillShortList;


public interface ENSOBillController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOBillController";

	/* ENSOBill. Добавить */
	public int add(ENSOBill aENSOBill)
			throws java.rmi.RemoteException;

	/* ENSOBill. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOBill. Изменить */
	public void save(ENSOBill aENSOBill)
			throws java.rmi.RemoteException;

	/* ENSOBill. Получить объект */
	public ENSOBill getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOBill. Получить полный список */
	public ENSOBillShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOBill. Получить список по фильтру */
	public ENSOBillShortList getFilteredList(
			ENSOBillFilter aENSOBillFilter)
			throws java.rmi.RemoteException;

	/* ENSOBill. Получить список для просмотра */
	public ENSOBillShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOBill. Получить список для просмотра по фильтру */
	public ENSOBillShortList getScrollableFilteredList(
			ENSOBillFilter aENSOBillFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOBill. Получить список для просмотра по условию */
	public ENSOBillShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOBill. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOBillFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOBill. Получить объект из списка */
	public ENSOBillShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public BigDecimal getSumByActs(ENSOBill obj) throws java.rmi.RemoteException;
		
	

}