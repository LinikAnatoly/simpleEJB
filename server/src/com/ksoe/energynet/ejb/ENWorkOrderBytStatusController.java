
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderBytStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytStatusShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytStatusShortList;


public interface ENWorkOrderBytStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytStatusController";

	/* ENWorkOrderBytStatus. �������� */
	public int add(ENWorkOrderBytStatus aENWorkOrderBytStatus)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� */
	public void save(ENWorkOrderBytStatus aENWorkOrderBytStatus)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ */
	public ENWorkOrderBytStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ ������ */
	public ENWorkOrderBytStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ �� ������� */
	public ENWorkOrderBytStatusShortList getFilteredList(
			ENWorkOrderBytStatusFilter aENWorkOrderBytStatusFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ ��� ��������� */
	public ENWorkOrderBytStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytStatusShortList getScrollableFilteredList(
			ENWorkOrderBytStatusFilter aENWorkOrderBytStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytStatus. �������� ������ �� ������ */
	public ENWorkOrderBytStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}