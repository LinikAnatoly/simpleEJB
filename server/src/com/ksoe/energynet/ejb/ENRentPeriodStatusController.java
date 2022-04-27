
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRentPeriodStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENRentPeriodStatus;
import com.ksoe.energynet.valueobject.brief.ENRentPeriodStatusShort;
import com.ksoe.energynet.valueobject.filter.ENRentPeriodStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENRentPeriodStatusShortList;


public interface ENRentPeriodStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRentPeriodStatusController";

	/* ENRentPeriodStatus. �������� */
	public int add(ENRentPeriodStatus aENRentPeriodStatus)
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� */
	public void save(ENRentPeriodStatus aENRentPeriodStatus)
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ */
	public ENRentPeriodStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ ������ */
	public ENRentPeriodStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ �� ������� */
	public ENRentPeriodStatusShortList getFilteredList(
			ENRentPeriodStatusFilter aENRentPeriodStatusFilter)
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ ��� ��������� */
	public ENRentPeriodStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ ��� ��������� �� ������� */
	public ENRentPeriodStatusShortList getScrollableFilteredList(
			ENRentPeriodStatusFilter aENRentPeriodStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ ��� ��������� �� ������� */
	public ENRentPeriodStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRentPeriodStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRentPeriodStatus. �������� ������ �� ������ */
	public ENRentPeriodStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}