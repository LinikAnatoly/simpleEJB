
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServFromSideStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENServFromSideStatus;
import com.ksoe.energynet.valueobject.lists.ENServFromSideStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENServFromSideStatusShort;
import com.ksoe.energynet.valueobject.filter.ENServFromSideStatusFilter;


public interface ENServFromSideStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServFromSideStatusController";

	/* ENServFromSideStatus. �������� */
	public int add(ENServFromSideStatus aENServFromSideStatus)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� */
	public void save(ENServFromSideStatus aENServFromSideStatus)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ */
	public ENServFromSideStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ ������ */
	public ENServFromSideStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ �� ������� */
	public ENServFromSideStatusShortList getFilteredList(
			ENServFromSideStatusFilter aENServFromSideStatusFilter)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ ��� ��������� */
	public ENServFromSideStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ ��� ��������� �� ������� */
	public ENServFromSideStatusShortList getScrollableFilteredList(
			ENServFromSideStatusFilter aENServFromSideStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ ��� ��������� �� ������� */
	public ENServFromSideStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServFromSideStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServFromSideStatus. �������� ������ �� ������ */
	public ENServFromSideStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}