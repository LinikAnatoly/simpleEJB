
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGeneralContracts;
 *
 */

import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;


public interface ENGeneralContractsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGeneralContractsController";

	/* ENGeneralContracts. Добавить */
	public int add(ENGeneralContracts aENGeneralContracts)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGeneralContracts. Изменить */
	public void save(ENGeneralContracts aENGeneralContracts)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить объект */
	public ENGeneralContracts getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить полный список */
	public ENGeneralContractsShortList getList()
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить список по фильтру */
	public ENGeneralContractsShortList getFilteredList(
			ENGeneralContractsFilter aENGeneralContractsFilter)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить список для просмотра */
	public ENGeneralContractsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить список для просмотра по фильтру */
	public ENGeneralContractsShortList getScrollableFilteredList(
			ENGeneralContractsFilter aENGeneralContractsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить список для просмотра по условию */
	public ENGeneralContractsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENGeneralContractsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. Получить объект из списка */
	public ENGeneralContractsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}