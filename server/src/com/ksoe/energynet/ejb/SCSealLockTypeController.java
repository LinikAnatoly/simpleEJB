
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealLockType;
 *
 */

import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.brief.SCSealLockTypeShort;
import com.ksoe.energynet.valueobject.filter.SCSealLockTypeFilter;
import com.ksoe.energynet.valueobject.lists.SCSealLockTypeShortList;


public interface SCSealLockTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealLockTypeController";

	/* SCSealLockType. �������� */
	public int add(SCSealLockType aSCSealLockType)
			throws java.rmi.RemoteException;

	/* SCSealLockType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealLockType. �������� */
	public void save(SCSealLockType aSCSealLockType)
			throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ */
	public SCSealLockType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ ������ */
	public SCSealLockTypeShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ �� ������� */
	public SCSealLockTypeShortList getFilteredList(
			SCSealLockTypeFilter aSCSealLockTypeFilter)
			throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ ��� ��������� */
	public SCSealLockTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ ��� ��������� �� ������� */
	public SCSealLockTypeShortList getScrollableFilteredList(
			SCSealLockTypeFilter aSCSealLockTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ ��� ��������� �� ������� */
	public SCSealLockTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			SCSealLockTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealLockType. �������� ������ �� ������ */
	public SCSealLockTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}