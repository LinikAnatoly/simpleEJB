
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDamageRecoveryStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENDamageRecoveryStatus;
import com.ksoe.energynet.valueobject.brief.ENDamageRecoveryStatusShort;
import com.ksoe.energynet.valueobject.filter.ENDamageRecoveryStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENDamageRecoveryStatusShortList;


public interface ENDamageRecoveryStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDamageRecoveryStatusController";

	/* ENDamageRecoveryStatus. �������� */
	public int add(ENDamageRecoveryStatus aENDamageRecoveryStatus)
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� */
	public void save(ENDamageRecoveryStatus aENDamageRecoveryStatus)
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ */
	public ENDamageRecoveryStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ ������ */
	public ENDamageRecoveryStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ �� ������� */
	public ENDamageRecoveryStatusShortList getFilteredList(
			ENDamageRecoveryStatusFilter aENDamageRecoveryStatusFilter)
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ ��� ��������� */
	public ENDamageRecoveryStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ ��� ��������� �� ������� */
	public ENDamageRecoveryStatusShortList getScrollableFilteredList(
			ENDamageRecoveryStatusFilter aENDamageRecoveryStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ ��� ��������� �� ������� */
	public ENDamageRecoveryStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDamageRecoveryStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDamageRecoveryStatus. �������� ������ �� ������ */
	public ENDamageRecoveryStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}