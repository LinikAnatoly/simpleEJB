
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierStatus;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierStatusShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierStatusFilter;


public interface ENRegForSupplierStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierStatusController";

	/* ENRegForSupplierStatus. �������� */
	public int add(ENRegForSupplierStatus aENRegForSupplierStatus)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� */
	public void save(ENRegForSupplierStatus aENRegForSupplierStatus)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ */
	public ENRegForSupplierStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ ������ */
	public ENRegForSupplierStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ �� ������� */
	public ENRegForSupplierStatusShortList getFilteredList(
			ENRegForSupplierStatusFilter aENRegForSupplierStatusFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ ��� ��������� */
	public ENRegForSupplierStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierStatusShortList getScrollableFilteredList(
			ENRegForSupplierStatusFilter aENRegForSupplierStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierStatus. �������� ������ �� ������ */
	public ENRegForSupplierStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}