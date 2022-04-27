
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInspectionSheetStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENInspectionSheetStatus;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetStatusShort;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetStatusFilter;


public interface ENInspectionSheetStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInspectionSheetStatusController";

	/* ENInspectionSheetStatus. Добавить */
	public int add(ENInspectionSheetStatus aENInspectionSheetStatus)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Изменить */
	public void save(ENInspectionSheetStatus aENInspectionSheetStatus)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить объект */
	public ENInspectionSheetStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить полный список */
	public ENInspectionSheetStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить список по фильтру */
	public ENInspectionSheetStatusShortList getFilteredList(
			ENInspectionSheetStatusFilter aENInspectionSheetStatusFilter)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить список для просмотра */
	public ENInspectionSheetStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить список для просмотра по фильтру */
	public ENInspectionSheetStatusShortList getScrollableFilteredList(
			ENInspectionSheetStatusFilter aENInspectionSheetStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить список для просмотра по условию */
	public ENInspectionSheetStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInspectionSheetStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. Получить объект из списка */
	public ENInspectionSheetStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}