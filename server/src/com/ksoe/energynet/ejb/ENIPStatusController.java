
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENIPStatus;
import com.ksoe.energynet.valueobject.brief.ENIPStatusShort;
import com.ksoe.energynet.valueobject.filter.ENIPStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENIPStatusShortList;


public interface ENIPStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPStatusController";

	/* ENIPStatus. �������� */
	public int add(ENIPStatus aENIPStatus)
			throws java.rmi.RemoteException;

	/* ENIPStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPStatus. �������� */
	public void save(ENIPStatus aENIPStatus)
			throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ */
	public ENIPStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ ������ */
	public ENIPStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ �� ������� */
	public ENIPStatusShortList getFilteredList(
			ENIPStatusFilter aENIPStatusFilter)
			throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ ��� ��������� */
	public ENIPStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ ��� ��������� �� ������� */
	public ENIPStatusShortList getScrollableFilteredList(
			ENIPStatusFilter aENIPStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ ��� ��������� �� ������� */
	public ENIPStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPStatus. �������� ������ �� ������ */
	public ENIPStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}