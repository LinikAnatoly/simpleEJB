
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for AXOrgId2FKOrgId;
 *
 */

import com.ksoe.energynet.valueobject.AXOrgId2FKOrgId;
import com.ksoe.energynet.valueobject.brief.AXOrgId2FKOrgIdShort;
import com.ksoe.energynet.valueobject.filter.AXOrgId2FKOrgIdFilter;
import com.ksoe.energynet.valueobject.lists.AXOrgId2FKOrgIdShortList;


public interface AXOrgId2FKOrgIdController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/AXOrgId2FKOrgIdController";

	/* AXOrgId2FKOrgId. �������� */
	public int add(AXOrgId2FKOrgId aAXOrgId2FKOrgId)
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� */
	public void save(AXOrgId2FKOrgId aAXOrgId2FKOrgId)
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ */
	public AXOrgId2FKOrgId getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ ������ */
	public AXOrgId2FKOrgIdShortList getList()
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ �� ������� */
	public AXOrgId2FKOrgIdShortList getFilteredList(
			AXOrgId2FKOrgIdFilter aAXOrgId2FKOrgIdFilter)
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ ��� ��������� */
	public AXOrgId2FKOrgIdShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ ��� ��������� �� ������� */
	public AXOrgId2FKOrgIdShortList getScrollableFilteredList(
			AXOrgId2FKOrgIdFilter aAXOrgId2FKOrgIdFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ ��� ��������� �� ������� */
	public AXOrgId2FKOrgIdShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			AXOrgId2FKOrgIdFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* AXOrgId2FKOrgId. �������� ������ �� ������ */
	public AXOrgId2FKOrgIdShort getShortObject(int code)
			throws java.rmi.RemoteException;

}