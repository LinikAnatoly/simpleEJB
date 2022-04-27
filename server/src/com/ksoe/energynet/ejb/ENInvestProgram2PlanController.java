
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestProgram2Plan;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestProgram2Plan;
import com.ksoe.energynet.valueobject.brief.ENInvestProgram2PlanShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgram2PlanFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgram2PlanShortList;


public interface ENInvestProgram2PlanController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgram2PlanController";

	/* ENInvestProgram2Plan. �������� */
	public int add(ENInvestProgram2Plan aENInvestProgram2Plan)
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� */
	public void save(ENInvestProgram2Plan aENInvestProgram2Plan)
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ */
	public ENInvestProgram2Plan getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ ������ */
	public ENInvestProgram2PlanShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ �� ������� */
	public ENInvestProgram2PlanShortList getFilteredList(
			ENInvestProgram2PlanFilter aENInvestProgram2PlanFilter)
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ ��� ��������� */
	public ENInvestProgram2PlanShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ ��� ��������� �� ������� */
	public ENInvestProgram2PlanShortList getScrollableFilteredList(
			ENInvestProgram2PlanFilter aENInvestProgram2PlanFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ ��� ��������� �� ������� */
	public ENInvestProgram2PlanShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInvestProgram2PlanFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestProgram2Plan. �������� ������ �� ������ */
	public ENInvestProgram2PlanShort getShortObject(int code)
			throws java.rmi.RemoteException;

}