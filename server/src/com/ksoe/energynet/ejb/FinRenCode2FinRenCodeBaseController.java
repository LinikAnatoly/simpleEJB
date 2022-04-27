
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FinRenCode2FinRenCodeBase;
 *
 */

import com.ksoe.energynet.valueobject.FinRenCode2FinRenCodeBase;
import com.ksoe.energynet.valueobject.brief.FinRenCode2FinRenCodeBaseShort;
import com.ksoe.energynet.valueobject.filter.FinRenCode2FinRenCodeBaseFilter;
import com.ksoe.energynet.valueobject.lists.FinRenCode2FinRenCodeBaseShortList;


public interface FinRenCode2FinRenCodeBaseController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FinRenCode2FinRenCodeBaseController";

	/* FinRenCode2FinRenCodeBase. Добавить */
	public int add(FinRenCode2FinRenCodeBase aFinRenCode2FinRenCodeBase)
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Изменить */
	public void save(FinRenCode2FinRenCodeBase aFinRenCode2FinRenCodeBase)
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить объект */
	public FinRenCode2FinRenCodeBase getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить полный список */
	public FinRenCode2FinRenCodeBaseShortList getList()
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить список по фильтру */
	public FinRenCode2FinRenCodeBaseShortList getFilteredList(
			FinRenCode2FinRenCodeBaseFilter aFinRenCode2FinRenCodeBaseFilter)
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить список для просмотра */
	public FinRenCode2FinRenCodeBaseShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить список для просмотра по фильтру */
	public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(
			FinRenCode2FinRenCodeBaseFilter aFinRenCode2FinRenCodeBaseFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить список для просмотра по условию */
	public FinRenCode2FinRenCodeBaseShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			FinRenCode2FinRenCodeBaseFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FinRenCode2FinRenCodeBase. Получить объект из списка */
	public FinRenCode2FinRenCodeBaseShort getShortObject(int code)
			throws java.rmi.RemoteException;

}