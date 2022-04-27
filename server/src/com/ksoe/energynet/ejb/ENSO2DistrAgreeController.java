
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSO2DistrAgree;
 *
 */

import com.ksoe.energynet.valueobject.ENSO2DistrAgree;
import com.ksoe.energynet.valueobject.lists.ENSO2DistrAgreeShortList;
import com.ksoe.energynet.valueobject.brief.ENSO2DistrAgreeShort;
import com.ksoe.energynet.valueobject.filter.ENSO2DistrAgreeFilter;


public interface ENSO2DistrAgreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSO2DistrAgreeController";

	/* ENSO2DistrAgree. �������� */
	public int add(ENSO2DistrAgree aENSO2DistrAgree)
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� */
	public void save(ENSO2DistrAgree aENSO2DistrAgree)
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ */
	public ENSO2DistrAgree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ ������ */
	public ENSO2DistrAgreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ �� ������� */
	public ENSO2DistrAgreeShortList getFilteredList(
			ENSO2DistrAgreeFilter aENSO2DistrAgreeFilter)
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ ��� ��������� */
	public ENSO2DistrAgreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ ��� ��������� �� ������� */
	public ENSO2DistrAgreeShortList getScrollableFilteredList(
			ENSO2DistrAgreeFilter aENSO2DistrAgreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ ��� ��������� �� ������� */
	public ENSO2DistrAgreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSO2DistrAgreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSO2DistrAgree. �������� ������ �� ������ */
	public ENSO2DistrAgreeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}