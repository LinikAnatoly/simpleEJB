
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomeTech2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeTech2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENActIncomeTech2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomeTech2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTech2DFDocFilter;


public interface ENActIncomeTech2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeTech2DFDocController";

	/* ENActIncomeTech2DFDoc. Добавить */
	public int add(ENActIncomeTech2DFDoc aENActIncomeTech2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Изменить */
	public void save(ENActIncomeTech2DFDoc aENActIncomeTech2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить объект */
	public ENActIncomeTech2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить полный список */
	public ENActIncomeTech2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить список по фильтру */
	public ENActIncomeTech2DFDocShortList getFilteredList(
			ENActIncomeTech2DFDocFilter aENActIncomeTech2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить список для просмотра */
	public ENActIncomeTech2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить список для просмотра по фильтру */
	public ENActIncomeTech2DFDocShortList getScrollableFilteredList(
			ENActIncomeTech2DFDocFilter aENActIncomeTech2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить список для просмотра по условию */
	public ENActIncomeTech2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeTech2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. Получить объект из списка */
	public ENActIncomeTech2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}