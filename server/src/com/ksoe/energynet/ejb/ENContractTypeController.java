
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENContractType;
 *
 */

import com.ksoe.energynet.valueobject.ENContractType;
import com.ksoe.energynet.valueobject.brief.ENContractTypeShort;
import com.ksoe.energynet.valueobject.filter.ENContractTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENContractTypeShortList;


public interface ENContractTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENContractTypeController";

	/* ENContractType. Добавить */
	public int add(ENContractType aENContractType)
			throws java.rmi.RemoteException;

	/* ENContractType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENContractType. Изменить */
	public void save(ENContractType aENContractType)
			throws java.rmi.RemoteException;

	/* ENContractType. Получить объект */
	public ENContractType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENContractType. Получить полный список */
	public ENContractTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENContractType. Получить список по фильтру */
	public ENContractTypeShortList getFilteredList(
			ENContractTypeFilter aENContractTypeFilter)
			throws java.rmi.RemoteException;

	/* ENContractType. Получить список для просмотра */
	public ENContractTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENContractType. Получить список для просмотра по фильтру */
	public ENContractTypeShortList getScrollableFilteredList(
			ENContractTypeFilter aENContractTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENContractType. Получить список для просмотра по условию */
	public ENContractTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENContractType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENContractTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENContractType. Получить объект из списка */
	public ENContractTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}