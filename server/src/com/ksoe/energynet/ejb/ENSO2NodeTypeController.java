
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSO2NodeType;
 *
 */

import com.ksoe.energynet.valueobject.ENSO2NodeType;
import com.ksoe.energynet.valueobject.lists.ENSO2NodeTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENSO2NodeTypeShort;
import com.ksoe.energynet.valueobject.filter.ENSO2NodeTypeFilter;


public interface ENSO2NodeTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSO2NodeTypeController";

	/* ENSO2NodeType. �������� */
	public int add(ENSO2NodeType aENSO2NodeType)
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� */
	public void save(ENSO2NodeType aENSO2NodeType)
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ */
	public ENSO2NodeType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ ������ */
	public ENSO2NodeTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ �� ������� */
	public ENSO2NodeTypeShortList getFilteredList(
			ENSO2NodeTypeFilter aENSO2NodeTypeFilter)
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ ��� ��������� */
	public ENSO2NodeTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ ��� ��������� �� ������� */
	public ENSO2NodeTypeShortList getScrollableFilteredList(
			ENSO2NodeTypeFilter aENSO2NodeTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ ��� ��������� �� ������� */
	public ENSO2NodeTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSO2NodeTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSO2NodeType. �������� ������ �� ������ */
	public ENSO2NodeTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}