
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesContractStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.brief.ENServicesContractStatusShort;
import com.ksoe.energynet.valueobject.filter.ENServicesContractStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesContractStatusShortList;


public interface ENServicesContractStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesContractStatusController";

	/* ENServicesContractStatus. Добавить */
	public int add(ENServicesContractStatus aENServicesContractStatus)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Изменить */
	public void save(ENServicesContractStatus aENServicesContractStatus)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить объект */
	public ENServicesContractStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить полный список */
	public ENServicesContractStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить список по фильтру */
	public ENServicesContractStatusShortList getFilteredList(
			ENServicesContractStatusFilter aENServicesContractStatusFilter)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить список для просмотра */
	public ENServicesContractStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить список для просмотра по фильтру */
	public ENServicesContractStatusShortList getScrollableFilteredList(
			ENServicesContractStatusFilter aENServicesContractStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить список для просмотра по условию */
	public ENServicesContractStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesContractStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. Получить объект из списка */
	public ENServicesContractStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}