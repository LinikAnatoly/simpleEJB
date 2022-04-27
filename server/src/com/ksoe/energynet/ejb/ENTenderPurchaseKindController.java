
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTenderPurchaseKind;
 *
 */

import com.ksoe.energynet.valueobject.ENTenderPurchaseKind;
import com.ksoe.energynet.valueobject.brief.ENTenderPurchaseKindShort;
import com.ksoe.energynet.valueobject.filter.ENTenderPurchaseKindFilter;
import com.ksoe.energynet.valueobject.lists.ENTenderPurchaseKindShortList;


public interface ENTenderPurchaseKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTenderPurchaseKindController";

	/* ENTenderPurchaseKind. �������� */
	public int add(ENTenderPurchaseKind aENTenderPurchaseKind)
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� */
	public void save(ENTenderPurchaseKind aENTenderPurchaseKind)
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ */
	public ENTenderPurchaseKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ ������ */
	public ENTenderPurchaseKindShortList getList()
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ �� ������� */
	public ENTenderPurchaseKindShortList getFilteredList(
			ENTenderPurchaseKindFilter aENTenderPurchaseKindFilter)
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ ��� ��������� */
	public ENTenderPurchaseKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ ��� ��������� �� ������� */
	public ENTenderPurchaseKindShortList getScrollableFilteredList(
			ENTenderPurchaseKindFilter aENTenderPurchaseKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ ��� ��������� �� ������� */
	public ENTenderPurchaseKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTenderPurchaseKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTenderPurchaseKind. �������� ������ �� ������ */
	public ENTenderPurchaseKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}