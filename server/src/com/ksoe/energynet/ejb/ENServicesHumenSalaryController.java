
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesHumenSalary;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesHumenSalary;
import com.ksoe.energynet.valueobject.lists.ENServicesHumenSalaryShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesHumenSalaryShort;
import com.ksoe.energynet.valueobject.filter.ENServicesHumenSalaryFilter;


public interface ENServicesHumenSalaryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesHumenSalaryController";

	/* ENServicesHumenSalary. �������� */
	public int add(ENServicesHumenSalary aENServicesHumenSalary)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� */
	public void save(ENServicesHumenSalary aENServicesHumenSalary)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ */
	public ENServicesHumenSalary getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ ������ */
	public ENServicesHumenSalaryShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ �� ������� */
	public ENServicesHumenSalaryShortList getFilteredList(
			ENServicesHumenSalaryFilter aENServicesHumenSalaryFilter)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ ��� ��������� */
	public ENServicesHumenSalaryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ ��� ��������� �� ������� */
	public ENServicesHumenSalaryShortList getScrollableFilteredList(
			ENServicesHumenSalaryFilter aENServicesHumenSalaryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ ��� ��������� �� ������� */
	public ENServicesHumenSalaryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesHumenSalaryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesHumenSalary. �������� ������ �� ������ */
	public ENServicesHumenSalaryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}