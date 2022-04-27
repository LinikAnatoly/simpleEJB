
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSO2SecObject;
 *
 */

import com.ksoe.energynet.valueobject.ENSO2SecObject;
import com.ksoe.energynet.valueobject.lists.ENSO2SecObjectShortList;
import com.ksoe.energynet.valueobject.brief.ENSO2SecObjectShort;
import com.ksoe.energynet.valueobject.filter.ENSO2SecObjectFilter;


public interface ENSO2SecObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSO2SecObjectController";

	/* ENSO2SecObject. �������� */
	public int add(ENSO2SecObject aENSO2SecObject)
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� */
	public void save(ENSO2SecObject aENSO2SecObject)
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ */
	public ENSO2SecObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ ������ */
	public ENSO2SecObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ �� ������� */
	public ENSO2SecObjectShortList getFilteredList(
			ENSO2SecObjectFilter aENSO2SecObjectFilter)
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ ��� ��������� */
	public ENSO2SecObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ ��� ��������� �� ������� */
	public ENSO2SecObjectShortList getScrollableFilteredList(
			ENSO2SecObjectFilter aENSO2SecObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ ��� ��������� �� ������� */
	public ENSO2SecObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSO2SecObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSO2SecObject. �������� ������ �� ������ */
	public ENSO2SecObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}