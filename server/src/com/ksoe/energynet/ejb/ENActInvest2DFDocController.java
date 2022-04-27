
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActInvest2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENActInvest2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENActInvest2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENActInvest2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENActInvest2DFDocFilter;


public interface ENActInvest2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActInvest2DFDocController";

	/* ENActInvest2DFDoc. Добавить */
	public int add(ENActInvest2DFDoc aENActInvest2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Изменить */
	public void save(ENActInvest2DFDoc aENActInvest2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить объект */
	public ENActInvest2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить полный список */
	public ENActInvest2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить список по фильтру */
	public ENActInvest2DFDocShortList getFilteredList(
			ENActInvest2DFDocFilter aENActInvest2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить список для просмотра */
	public ENActInvest2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить список для просмотра по фильтру */
	public ENActInvest2DFDocShortList getScrollableFilteredList(
			ENActInvest2DFDocFilter aENActInvest2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить список для просмотра по условию */
	public ENActInvest2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActInvest2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActInvest2DFDoc. Получить объект из списка */
	public ENActInvest2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}