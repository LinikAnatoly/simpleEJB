
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGeoDep2ENDepartment;
 *
 */

import com.ksoe.energynet.valueobject.ENGeoDep2ENDepartment;
import com.ksoe.energynet.valueobject.lists.ENGeoDep2ENDepartmentShortList;
import com.ksoe.energynet.valueobject.brief.ENGeoDep2ENDepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENGeoDep2ENDepartmentFilter;


public interface ENGeoDep2ENDepartmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGeoDep2ENDepartmentController";

	/* ENGeoDep2ENDepartment. �������� */
	public int add(ENGeoDep2ENDepartment aENGeoDep2ENDepartment)
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� */
	public void save(ENGeoDep2ENDepartment aENGeoDep2ENDepartment)
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ */
	public ENGeoDep2ENDepartment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ ������ */
	public ENGeoDep2ENDepartmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ �� ������� */
	public ENGeoDep2ENDepartmentShortList getFilteredList(
			ENGeoDep2ENDepartmentFilter aENGeoDep2ENDepartmentFilter)
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ ��� ��������� */
	public ENGeoDep2ENDepartmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ ��� ��������� �� ������� */
	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(
			ENGeoDep2ENDepartmentFilter aENGeoDep2ENDepartmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ ��� ��������� �� ������� */
	public ENGeoDep2ENDepartmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENGeoDep2ENDepartmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGeoDep2ENDepartment. �������� ������ �� ������ */
	public ENGeoDep2ENDepartmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}