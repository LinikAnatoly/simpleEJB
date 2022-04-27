
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlan2WorkOrderEntry;
 *
 */

import com.ksoe.energynet.valueobject.ENPlan2WorkOrderEntry;
import com.ksoe.energynet.valueobject.lists.ENPlan2WorkOrderEntryShortList;
import com.ksoe.energynet.valueobject.brief.ENPlan2WorkOrderEntryShort;
import com.ksoe.energynet.valueobject.filter.ENPlan2WorkOrderEntryFilter;


public interface ENPlan2WorkOrderEntryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlan2WorkOrderEntryController";

	/* ENPlan2WorkOrderEntry. �������� */
	public int add(ENPlan2WorkOrderEntry aENPlan2WorkOrderEntry)
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� */
	public void save(ENPlan2WorkOrderEntry aENPlan2WorkOrderEntry)
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ */
	public ENPlan2WorkOrderEntry getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ ������ */
	public ENPlan2WorkOrderEntryShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ �� ������� */
	public ENPlan2WorkOrderEntryShortList getFilteredList(
			ENPlan2WorkOrderEntryFilter aENPlan2WorkOrderEntryFilter)
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ ��� ��������� */
	public ENPlan2WorkOrderEntryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ ��� ��������� �� ������� */
	public ENPlan2WorkOrderEntryShortList getScrollableFilteredList(
			ENPlan2WorkOrderEntryFilter aENPlan2WorkOrderEntryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ ��� ��������� �� ������� */
	public ENPlan2WorkOrderEntryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlan2WorkOrderEntryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlan2WorkOrderEntry. �������� ������ �� ������ */
	public ENPlan2WorkOrderEntryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}