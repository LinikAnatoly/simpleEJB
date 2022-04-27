
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWarrant4Department;
 *
 */

import com.ksoe.energynet.valueobject.ENWarrant4Department;
import com.ksoe.energynet.valueobject.lists.ENWarrant4DepartmentShortList;
import com.ksoe.energynet.valueobject.brief.ENWarrant4DepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENWarrant4DepartmentFilter;


public interface ENWarrant4DepartmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWarrant4DepartmentController";

	/* ENWarrant4Department. �������� */
	public int add(ENWarrant4Department aENWarrant4Department)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� */
	public void save(ENWarrant4Department aENWarrant4Department)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ */
	public ENWarrant4Department getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ ������ */
	public ENWarrant4DepartmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ �� ������� */
	public ENWarrant4DepartmentShortList getFilteredList(
			ENWarrant4DepartmentFilter aENWarrant4DepartmentFilter)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ ��� ��������� */
	public ENWarrant4DepartmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ ��� ��������� �� ������� */
	public ENWarrant4DepartmentShortList getScrollableFilteredList(
			ENWarrant4DepartmentFilter aENWarrant4DepartmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ ��� ��������� �� ������� */
	public ENWarrant4DepartmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENWarrant4DepartmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. �������� ������ �� ������ */
	public ENWarrant4DepartmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}