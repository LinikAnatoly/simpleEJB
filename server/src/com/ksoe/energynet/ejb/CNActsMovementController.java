
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNActsMovement;
 *
 */

import com.ksoe.energynet.valueobject.CNActsMovement;
import com.ksoe.energynet.valueobject.brief.CNActsMovementShort;
import com.ksoe.energynet.valueobject.filter.CNActsMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNActsMovementShortList;


public interface CNActsMovementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNActsMovementController";

	/* CNActsMovement. �������� */
	public int add(CNActsMovement aCNActsMovement)
			throws java.rmi.RemoteException;

	/* CNActsMovement. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNActsMovement. �������� */
	public void save(CNActsMovement aCNActsMovement)
			throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ */
	public CNActsMovement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ ������ */
	public CNActsMovementShortList getList()
			throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ �� ������� */
	public CNActsMovementShortList getFilteredList(
			CNActsMovementFilter aCNActsMovementFilter)
			throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ ��� ��������� */
	public CNActsMovementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ ��� ��������� �� ������� */
	public CNActsMovementShortList getScrollableFilteredList(
			CNActsMovementFilter aCNActsMovementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ ��� ��������� �� ������� */
	public CNActsMovementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			CNActsMovementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNActsMovement. �������� ������ �� ������ */
	public CNActsMovementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}