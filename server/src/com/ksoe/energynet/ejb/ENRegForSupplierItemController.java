
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierItem;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierItem;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierItemShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierItemShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierItemFilter;


public interface ENRegForSupplierItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierItemController";

	/* ENRegForSupplierItem. �������� */
	public int add(ENRegForSupplierItem aENRegForSupplierItem)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� */
	public void save(ENRegForSupplierItem aENRegForSupplierItem)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ */
	public ENRegForSupplierItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ ������ */
	public ENRegForSupplierItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ �� ������� */
	public ENRegForSupplierItemShortList getFilteredList(
			ENRegForSupplierItemFilter aENRegForSupplierItemFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ ��� ��������� */
	public ENRegForSupplierItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierItemShortList getScrollableFilteredList(
			ENRegForSupplierItemFilter aENRegForSupplierItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. �������� ������ �� ������ */
	public ENRegForSupplierItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}