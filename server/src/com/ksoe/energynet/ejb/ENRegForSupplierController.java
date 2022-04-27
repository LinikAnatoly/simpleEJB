
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplier;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplier;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierFilter;


public interface ENRegForSupplierController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierController";

	/* ENRegForSupplier. �������� */
	public int add(ENRegForSupplier aENRegForSupplier)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� */
	public void save(ENRegForSupplier aENRegForSupplier)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ */
	public ENRegForSupplier getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ ������ */
	public ENRegForSupplierShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ �� ������� */
	public ENRegForSupplierShortList getFilteredList(
			ENRegForSupplierFilter aENRegForSupplierFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ ��� ��������� */
	public ENRegForSupplierShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierShortList getScrollableFilteredList(
			ENRegForSupplierFilter aENRegForSupplierFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ ��� ��������� �� ������� */
	public ENRegForSupplierShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplier. �������� ������ �� ������ */
	public ENRegForSupplierShort getShortObject(int code)
			throws java.rmi.RemoteException;

	public void generateRegItems(int regCode) throws java.rmi.RemoteException;
	public void removeRegItems(int regCode) throws java.rmi.RemoteException;
}