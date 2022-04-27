
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesContractStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.brief.ENServicesContractStatusShort;
import com.ksoe.energynet.valueobject.filter.ENServicesContractStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesContractStatusShortList;


public interface ENServicesContractStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesContractStatusController";

	/* ENServicesContractStatus. �������� */
	public int add(ENServicesContractStatus aENServicesContractStatus)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� */
	public void save(ENServicesContractStatus aENServicesContractStatus)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ */
	public ENServicesContractStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ ������ */
	public ENServicesContractStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ �� ������� */
	public ENServicesContractStatusShortList getFilteredList(
			ENServicesContractStatusFilter aENServicesContractStatusFilter)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ ��� ��������� */
	public ENServicesContractStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ ��� ��������� �� ������� */
	public ENServicesContractStatusShortList getScrollableFilteredList(
			ENServicesContractStatusFilter aENServicesContractStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ ��� ��������� �� ������� */
	public ENServicesContractStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesContractStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesContractStatus. �������� ������ �� ������ */
	public ENServicesContractStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}