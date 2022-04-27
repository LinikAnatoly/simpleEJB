
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealStatus;
 *
 */

import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.SCSealStatusShort;
import com.ksoe.energynet.valueobject.filter.SCSealStatusFilter;
import com.ksoe.energynet.valueobject.lists.SCSealStatusShortList;


public interface SCSealStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealStatusController";

	/* SCSealStatus. �������� */
	public int add(SCSealStatus aSCSealStatus)
			throws java.rmi.RemoteException;

	/* SCSealStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealStatus. �������� */
	public void save(SCSealStatus aSCSealStatus)
			throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ */
	public SCSealStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ ������ */
	public SCSealStatusShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ �� ������� */
	public SCSealStatusShortList getFilteredList(
			SCSealStatusFilter aSCSealStatusFilter)
			throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ ��� ��������� */
	public SCSealStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ ��� ��������� �� ������� */
	public SCSealStatusShortList getScrollableFilteredList(
			SCSealStatusFilter aSCSealStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ ��� ��������� �� ������� */
	public SCSealStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			SCSealStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealStatus. �������� ������ �� ������ */
	public SCSealStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}