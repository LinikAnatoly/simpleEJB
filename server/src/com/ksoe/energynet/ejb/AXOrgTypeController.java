
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for AXOrgType;
 *
 */

import com.ksoe.energynet.valueobject.AXOrgType;
import com.ksoe.energynet.valueobject.brief.AXOrgTypeShort;
import com.ksoe.energynet.valueobject.filter.AXOrgTypeFilter;
import com.ksoe.energynet.valueobject.lists.AXOrgTypeShortList;


public interface AXOrgTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/AXOrgTypeController";

	/* AXOrgType. �������� */
	public int add(AXOrgType aAXOrgType)
			throws java.rmi.RemoteException;

	/* AXOrgType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* AXOrgType. �������� */
	public void save(AXOrgType aAXOrgType)
			throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ */
	public AXOrgType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ ������ */
	public AXOrgTypeShortList getList()
			throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ �� ������� */
	public AXOrgTypeShortList getFilteredList(
			AXOrgTypeFilter aAXOrgTypeFilter)
			throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ ��� ��������� */
	public AXOrgTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ ��� ��������� �� ������� */
	public AXOrgTypeShortList getScrollableFilteredList(
			AXOrgTypeFilter aAXOrgTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ ��� ��������� �� ������� */
	public AXOrgTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			AXOrgTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* AXOrgType. �������� ������ �� ������ */
	public AXOrgTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}