
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInspectionSheetItem;
 *
 */

import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetItemShortList;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetItemFilter;


public interface ENInspectionSheetItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInspectionSheetItemController";

	/* ENInspectionSheetItem. �������� */
	public int add(ENInspectionSheetItem aENInspectionSheetItem)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� */
	public void save(ENInspectionSheetItem aENInspectionSheetItem)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ */
	public ENInspectionSheetItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ ������ */
	public ENInspectionSheetItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ �� ������� */
	public ENInspectionSheetItemShortList getFilteredList(
			ENInspectionSheetItemFilter aENInspectionSheetItemFilter)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ ��� ��������� */
	public ENInspectionSheetItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetItemShortList getScrollableFilteredList(
			ENInspectionSheetItemFilter aENInspectionSheetItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInspectionSheetItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetItem. �������� ������ �� ������ */
	public ENInspectionSheetItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}