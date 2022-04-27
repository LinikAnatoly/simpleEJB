
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
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

	/* ENInspectionSheetStatus. �������� */
	public int add(ENInspectionSheetStatus aENInspectionSheetStatus)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� */
	public void save(ENInspectionSheetStatus aENInspectionSheetStatus)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ */
	public ENInspectionSheetStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ ������ */
	public ENInspectionSheetStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ �� ������� */
	public ENInspectionSheetStatusShortList getFilteredList(
			ENInspectionSheetStatusFilter aENInspectionSheetStatusFilter)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ ��� ��������� */
	public ENInspectionSheetStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetStatusShortList getScrollableFilteredList(
			ENInspectionSheetStatusFilter aENInspectionSheetStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInspectionSheetStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInspectionSheetStatus. �������� ������ �� ������ */
	public ENInspectionSheetStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}