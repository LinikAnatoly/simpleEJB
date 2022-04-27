
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDepartment2Org;
 *
 */

import com.ksoe.energynet.valueobject.ENDepartment2Org;
import com.ksoe.energynet.valueobject.lists.ENDepartment2OrgShortList;
import com.ksoe.energynet.valueobject.brief.ENDepartment2OrgShort;
import com.ksoe.energynet.valueobject.filter.ENDepartment2OrgFilter;


public interface ENDepartment2OrgController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDepartment2OrgController";

	/* ENDepartment2Org. �������� */
	public int add(ENDepartment2Org aENDepartment2Org)
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� */
	public void save(ENDepartment2Org aENDepartment2Org)
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ */
	public ENDepartment2Org getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ ������ */
	public ENDepartment2OrgShortList getList()
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ �� ������� */
	public ENDepartment2OrgShortList getFilteredList(
			ENDepartment2OrgFilter aENDepartment2OrgFilter)
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ ��� ��������� */
	public ENDepartment2OrgShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ ��� ��������� �� ������� */
	public ENDepartment2OrgShortList getScrollableFilteredList(
			ENDepartment2OrgFilter aENDepartment2OrgFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ ��� ��������� �� ������� */
	public ENDepartment2OrgShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDepartment2OrgFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDepartment2Org. �������� ������ �� ������ */
	public ENDepartment2OrgShort getShortObject(int code)
			throws java.rmi.RemoteException;

}