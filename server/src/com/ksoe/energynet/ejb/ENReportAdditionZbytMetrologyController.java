
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENReportAdditionZbytMetrology;
 *
 */

import com.ksoe.energynet.valueobject.ENReportAdditionZbytMetrology;
import com.ksoe.energynet.valueobject.brief.ENReportAdditionZbytMetrologyShort;
import com.ksoe.energynet.valueobject.filter.ENReportAdditionZbytMetrologyFilter;
import com.ksoe.energynet.valueobject.lists.ENReportAdditionZbytMetrologyShortList;


public interface ENReportAdditionZbytMetrologyController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENReportAdditionZbytMetrologyController";

	/* ENReportAdditionZbytMetrology. �������� */
	public int add(ENReportAdditionZbytMetrology aENReportAdditionZbytMetrology)
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� */
	public void save(ENReportAdditionZbytMetrology aENReportAdditionZbytMetrology)
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ */
	public ENReportAdditionZbytMetrology getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ ������ */
	public ENReportAdditionZbytMetrologyShortList getList()
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ �� ������� */
	public ENReportAdditionZbytMetrologyShortList getFilteredList(
			ENReportAdditionZbytMetrologyFilter aENReportAdditionZbytMetrologyFilter)
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ ��� ��������� */
	public ENReportAdditionZbytMetrologyShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ ��� ��������� �� ������� */
	public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(
			ENReportAdditionZbytMetrologyFilter aENReportAdditionZbytMetrologyFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ ��� ��������� �� ������� */
	public ENReportAdditionZbytMetrologyShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENReportAdditionZbytMetrologyFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENReportAdditionZbytMetrology. �������� ������ �� ������ */
	public ENReportAdditionZbytMetrologyShort getShortObject(int code)
			throws java.rmi.RemoteException;

}