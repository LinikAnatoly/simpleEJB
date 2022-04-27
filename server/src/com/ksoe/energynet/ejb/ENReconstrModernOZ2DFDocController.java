
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENReconstrModernOZ2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENReconstrModernOZ2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZ2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2DFDocFilter;


public interface ENReconstrModernOZ2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModernOZ2DFDocController";

	/* ENReconstrModernOZ2DFDoc. Добавить */
	public int add(ENReconstrModernOZ2DFDoc aENReconstrModernOZ2DFDoc)
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Изменить */
	public void save(ENReconstrModernOZ2DFDoc aENReconstrModernOZ2DFDoc)
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить объект */
	public ENReconstrModernOZ2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить полный список */
	public ENReconstrModernOZ2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить список по фильтру */
	public ENReconstrModernOZ2DFDocShortList getFilteredList(
			ENReconstrModernOZ2DFDocFilter aENReconstrModernOZ2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить список для просмотра */
	public ENReconstrModernOZ2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить список для просмотра по фильтру */
	public ENReconstrModernOZ2DFDocShortList getScrollableFilteredList(
			ENReconstrModernOZ2DFDocFilter aENReconstrModernOZ2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить список для просмотра по условию */
	public ENReconstrModernOZ2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENReconstrModernOZ2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENReconstrModernOZ2DFDoc. Получить объект из списка */
	public ENReconstrModernOZ2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}