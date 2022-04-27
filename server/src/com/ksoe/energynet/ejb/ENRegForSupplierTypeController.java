
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierType;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierType;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierTypeShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierTypeFilter;


public interface ENRegForSupplierTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierTypeController";

	/* ENRegForSupplierType. �������� */
	public int add(ENRegForSupplierType aENRegForSupplierType)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� */
	public void save(ENRegForSupplierType aENRegForSupplierType)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ */
	public ENRegForSupplierType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ ������ */
	public ENRegForSupplierTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ �� ������� */
	public ENRegForSupplierTypeShortList getFilteredList(
			ENRegForSupplierTypeFilter aENRegForSupplierTypeFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ ��� ��������� */
	public ENRegForSupplierTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierTypeShortList getScrollableFilteredList(
			ENRegForSupplierTypeFilter aENRegForSupplierTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierType. �������� ������ �� ������ */
	public ENRegForSupplierTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}