
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for EPRen2FINExecutor;
 *
 */

import com.ksoe.energynet.valueobject.EPRen2FINExecutor;
import com.ksoe.energynet.valueobject.brief.EPRen2FINExecutorShort;
import com.ksoe.energynet.valueobject.filter.EPRen2FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.EPRen2FINExecutorShortList;


public interface EPRen2FINExecutorController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/EPRen2FINExecutorController";

	/* EPRen2FINExecutor. �������� */
	public int add(EPRen2FINExecutor aEPRen2FINExecutor)
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� */
	public void save(EPRen2FINExecutor aEPRen2FINExecutor)
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ */
	public EPRen2FINExecutor getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ ������ */
	public EPRen2FINExecutorShortList getList()
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ �� ������� */
	public EPRen2FINExecutorShortList getFilteredList(
			EPRen2FINExecutorFilter aEPRen2FINExecutorFilter)
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ ��� ��������� */
	public EPRen2FINExecutorShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ ��� ��������� �� ������� */
	public EPRen2FINExecutorShortList getScrollableFilteredList(
			EPRen2FINExecutorFilter aEPRen2FINExecutorFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ ��� ��������� �� ������� */
	public EPRen2FINExecutorShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			EPRen2FINExecutorFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* EPRen2FINExecutor. �������� ������ �� ������ */
	public EPRen2FINExecutorShort getShortObject(int code)
			throws java.rmi.RemoteException;

}