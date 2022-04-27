
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENAct2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENAct2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocFilter;


public interface ENAct2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2DFDocController";

	/* ENAct2DFDoc. Добавить */
	public int add(ENAct2DFDoc aENAct2DFDoc)
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Изменить */
	public void save(ENAct2DFDoc aENAct2DFDoc)
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить объект */
	public ENAct2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить полный список */
	public ENAct2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить список по фильтру */
	public ENAct2DFDocShortList getFilteredList(
			ENAct2DFDocFilter aENAct2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить список для просмотра */
	public ENAct2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить список для просмотра по фильтру */
	public ENAct2DFDocShortList getScrollableFilteredList(
			ENAct2DFDocFilter aENAct2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить список для просмотра по условию */
	public ENAct2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2DFDoc. Получить объект из списка */
	public ENAct2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}