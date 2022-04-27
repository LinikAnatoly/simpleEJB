
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSizObject;
 *
 */

import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.brief.ENSizObjectShort;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENSizObjectShortList;


public interface ENSizObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSizObjectController";

	/* ENSizObject. �������� */
	public int add(ENSizObject aENSizObject)
			throws java.rmi.RemoteException;

	/* ENSizObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSizObject. �������� */
	public void save(ENSizObject aENSizObject)
			throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ */
	public ENSizObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ ������ */
	public ENSizObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ �� ������� */
	public ENSizObjectShortList getFilteredList(
			ENSizObjectFilter aENSizObjectFilter)
			throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ ��� ��������� */
	public ENSizObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ ��� ��������� �� ������� */
	public ENSizObjectShortList getScrollableFilteredList(
			ENSizObjectFilter aENSizObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ ��� ��������� �� ������� */
	public ENSizObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSizObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSizObject. �������� ������ �� ������ */
	public ENSizObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;


	/**  ���������� ��������� � ������������� �� ��������  */
	public void updateStaffPosition(int soCode, String tabNumber) throws java.rmi.RemoteException;

}