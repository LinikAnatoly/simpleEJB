
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2SCUsageInput;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2SCUsageInput;
import com.ksoe.energynet.valueobject.brief.ENAct2SCUsageInputShort;
import com.ksoe.energynet.valueobject.filter.ENAct2SCUsageInputFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2SCUsageInputShortList;


public interface ENAct2SCUsageInputController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2SCUsageInputController";

	/* ENAct2SCUsageInput. Добавить */
	public int add(ENAct2SCUsageInput aENAct2SCUsageInput)
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Изменить */
	public void save(ENAct2SCUsageInput aENAct2SCUsageInput)
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить объект */
	public ENAct2SCUsageInput getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить полный список */
	public ENAct2SCUsageInputShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить список по фильтру */
	public ENAct2SCUsageInputShortList getFilteredList(
			ENAct2SCUsageInputFilter aENAct2SCUsageInputFilter)
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить список для просмотра */
	public ENAct2SCUsageInputShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить список для просмотра по фильтру */
	public ENAct2SCUsageInputShortList getScrollableFilteredList(
			ENAct2SCUsageInputFilter aENAct2SCUsageInputFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить список для просмотра по условию */
	public ENAct2SCUsageInputShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2SCUsageInputFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2SCUsageInput. Получить объект из списка */
	public ENAct2SCUsageInputShort getShortObject(int code)
			throws java.rmi.RemoteException;

}