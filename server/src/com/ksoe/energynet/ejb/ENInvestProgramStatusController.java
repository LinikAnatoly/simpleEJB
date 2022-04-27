
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestProgramStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestProgramStatus;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramStatusShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramStatusShortList;


public interface ENInvestProgramStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramStatusController";

	/* ENInvestProgramStatus. �������� */
	public int add(ENInvestProgramStatus aENInvestProgramStatus)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� */
	public void save(ENInvestProgramStatus aENInvestProgramStatus)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ */
	public ENInvestProgramStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ ������ */
	public ENInvestProgramStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ �� ������� */
	public ENInvestProgramStatusShortList getFilteredList(
			ENInvestProgramStatusFilter aENInvestProgramStatusFilter)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ ��� ��������� */
	public ENInvestProgramStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ ��� ��������� �� ������� */
	public ENInvestProgramStatusShortList getScrollableFilteredList(
			ENInvestProgramStatusFilter aENInvestProgramStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ ��� ��������� �� ������� */
	public ENInvestProgramStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInvestProgramStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestProgramStatus. �������� ������ �� ������ */
	public ENInvestProgramStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}