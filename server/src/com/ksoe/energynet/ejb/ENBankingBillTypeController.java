
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBankingBillType;
 *
 */

import com.ksoe.energynet.valueobject.ENBankingBillType;
import com.ksoe.energynet.valueobject.brief.ENBankingBillTypeShort;
import com.ksoe.energynet.valueobject.filter.ENBankingBillTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENBankingBillTypeShortList;


public interface ENBankingBillTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBankingBillTypeController";

	/* ENBankingBillType. Добавить */
	public int add(ENBankingBillType aENBankingBillType)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBankingBillType. Изменить */
	public void save(ENBankingBillType aENBankingBillType)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить объект */
	public ENBankingBillType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить полный список */
	public ENBankingBillTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить список по фильтру */
	public ENBankingBillTypeShortList getFilteredList(
			ENBankingBillTypeFilter aENBankingBillTypeFilter)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить список для просмотра */
	public ENBankingBillTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить список для просмотра по фильтру */
	public ENBankingBillTypeShortList getScrollableFilteredList(
			ENBankingBillTypeFilter aENBankingBillTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить список для просмотра по условию */
	public ENBankingBillTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBankingBillTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. Получить объект из списка */
	public ENBankingBillTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}