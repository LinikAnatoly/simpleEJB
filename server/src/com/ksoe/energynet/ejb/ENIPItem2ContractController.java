
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem2Contract;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ContractShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ContractFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ContractShortList;


public interface ENIPItem2ContractController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItem2ContractController";

	/* ENIPItem2Contract. Добавить */
	public int add(ENIPItem2Contract aENIPItem2Contract)
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Изменить */
	public void save(ENIPItem2Contract aENIPItem2Contract)
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить объект */
	public ENIPItem2Contract getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить полный список */
	public ENIPItem2ContractShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить список по фильтру */
	public ENIPItem2ContractShortList getFilteredList(
			ENIPItem2ContractFilter aENIPItem2ContractFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить список для просмотра */
	public ENIPItem2ContractShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить список для просмотра по фильтру */
	public ENIPItem2ContractShortList getScrollableFilteredList(
			ENIPItem2ContractFilter aENIPItem2ContractFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить список для просмотра по условию */
	public ENIPItem2ContractShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItem2ContractFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem2Contract. Получить объект из списка */
	public ENIPItem2ContractShort getShortObject(int code)
			throws java.rmi.RemoteException;

}