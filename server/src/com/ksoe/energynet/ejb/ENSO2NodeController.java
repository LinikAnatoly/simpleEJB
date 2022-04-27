
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSO2Node;
 *
 */

import com.ksoe.energynet.valueobject.ENSO2Node;
import com.ksoe.energynet.valueobject.lists.ENSO2NodeShortList;
import com.ksoe.energynet.valueobject.brief.ENSO2NodeShort;
import com.ksoe.energynet.valueobject.filter.ENSO2NodeFilter;


public interface ENSO2NodeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSO2NodeController";

	/* ENSO2Node. �������� */
	public int add(ENSO2Node aENSO2Node)
			throws java.rmi.RemoteException;

	/* ENSO2Node. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSO2Node. �������� */
	public void save(ENSO2Node aENSO2Node)
			throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ */
	public ENSO2Node getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ ������ */
	public ENSO2NodeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ �� ������� */
	public ENSO2NodeShortList getFilteredList(
			ENSO2NodeFilter aENSO2NodeFilter)
			throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ ��� ��������� */
	public ENSO2NodeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ ��� ��������� �� ������� */
	public ENSO2NodeShortList getScrollableFilteredList(
			ENSO2NodeFilter aENSO2NodeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ ��� ��������� �� ������� */
	public ENSO2NodeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSO2NodeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSO2Node. �������� ������ �� ������ */
	public ENSO2NodeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}