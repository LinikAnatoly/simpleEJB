
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCUsageInput2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.SCUsageInput2DFDoc;
import com.ksoe.energynet.valueobject.lists.SCUsageInput2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.SCUsageInput2DFDocShort;
import com.ksoe.energynet.valueobject.filter.SCUsageInput2DFDocFilter;


public interface SCUsageInput2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCUsageInput2DFDocController";

	/* SCUsageInput2DFDoc. Добавить */
	public int add(SCUsageInput2DFDoc aSCUsageInput2DFDoc)
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Изменить */
	public void save(SCUsageInput2DFDoc aSCUsageInput2DFDoc)
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить объект */
	public SCUsageInput2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить полный список */
	public SCUsageInput2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить список по фильтру */
	public SCUsageInput2DFDocShortList getFilteredList(
			SCUsageInput2DFDocFilter aSCUsageInput2DFDocFilter)
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить список для просмотра */
	public SCUsageInput2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить список для просмотра по фильтру */
	public SCUsageInput2DFDocShortList getScrollableFilteredList(
			SCUsageInput2DFDocFilter aSCUsageInput2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить список для просмотра по условию */
	public SCUsageInput2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCUsageInput2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCUsageInput2DFDoc. Получить объект из списка */
	public SCUsageInput2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}