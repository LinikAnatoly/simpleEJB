//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderShortList;

public interface ENWorkOrderController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderController";

	/* ENWorkOrder. �������� */
	public int add(ENWorkOrder aENWorkOrder) throws java.rmi.RemoteException;

	/* ENWorkOrder. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� */
	public void save(ENWorkOrder aENWorkOrder) throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ */
	public ENWorkOrder getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ ������ */
	public ENWorkOrderShortList getList() throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ �� ������� */
	public ENWorkOrderShortList getFilteredList(
			ENWorkOrderFilter aENWorkOrderFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ ��� ��������� */
	public ENWorkOrderShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderShortList getScrollableFilteredList(
			ENWorkOrderFilter aEPActFilter, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderShortList getScrollableListByCondition(String aCondition,
			int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

}