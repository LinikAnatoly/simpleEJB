
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBankingDetails;
 *
 */

import com.ksoe.energynet.valueobject.ENBankingDetails;
import com.ksoe.energynet.valueobject.brief.ENBankingDetailsShort;
import com.ksoe.energynet.valueobject.filter.ENBankingDetailsFilter;
import com.ksoe.energynet.valueobject.lists.ENBankingDetailsShortList;


public interface ENBankingDetailsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBankingDetailsController";

	/* ENBankingDetails. Добавить */
	public int add(ENBankingDetails aENBankingDetails)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBankingDetails. Изменить */
	public void save(ENBankingDetails aENBankingDetails)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить объект */
	public ENBankingDetails getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить полный список */
	public ENBankingDetailsShortList getList()
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить список по фильтру */
	public ENBankingDetailsShortList getFilteredList(
			ENBankingDetailsFilter aENBankingDetailsFilter)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить список для просмотра */
	public ENBankingDetailsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить список для просмотра по фильтру */
	public ENBankingDetailsShortList getScrollableFilteredList(
			ENBankingDetailsFilter aENBankingDetailsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить список для просмотра по условию */
	public ENBankingDetailsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBankingDetailsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. Получить объект из списка */
	public ENBankingDetailsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}