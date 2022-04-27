
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2OSTable;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2OSTable;
import com.ksoe.energynet.valueobject.brief.ENAct2OSTableShort;
import com.ksoe.energynet.valueobject.filter.ENAct2OSTableFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2OSTableShortList;


public interface ENAct2OSTableController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2OSTableController";

	/* ENAct2OSTable. Добавить */
	public int add(ENAct2OSTable aENAct2OSTable)
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2OSTable. Изменить */
	public void save(ENAct2OSTable aENAct2OSTable)
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить объект */
	public ENAct2OSTable getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить полный список */
	public ENAct2OSTableShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить список по фильтру */
	public ENAct2OSTableShortList getFilteredList(
			ENAct2OSTableFilter aENAct2OSTableFilter)
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить список для просмотра */
	public ENAct2OSTableShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить список для просмотра по фильтру */
	public ENAct2OSTableShortList getScrollableFilteredList(
			ENAct2OSTableFilter aENAct2OSTableFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить список для просмотра по условию */
	public ENAct2OSTableShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2OSTableFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2OSTable. Получить объект из списка */
	public ENAct2OSTableShort getShortObject(int code)
			throws java.rmi.RemoteException;

}