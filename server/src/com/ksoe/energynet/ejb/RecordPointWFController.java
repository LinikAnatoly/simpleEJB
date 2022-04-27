
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for RecordPointWF;
 *
 */

import com.ksoe.energynet.valueobject.RecordPointWF;
import com.ksoe.energynet.valueobject.brief.RecordPointWFShort;
import com.ksoe.energynet.valueobject.filter.RecordPointWFFilter;
import com.ksoe.energynet.valueobject.lists.RecordPointWFShortList;


public interface RecordPointWFController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/RecordPointWFController";

	/* RecordPointWF. �������� */
	public int add(RecordPointWF aRecordPointWF)
			throws java.rmi.RemoteException;

	/* RecordPointWF. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* RecordPointWF. �������� */
	public void save(RecordPointWF aRecordPointWF)
			throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ */
	public RecordPointWF getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ ������ */
	public RecordPointWFShortList getList()
			throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ �� ������� */
	public RecordPointWFShortList getFilteredList(
			RecordPointWFFilter aRecordPointWFFilter)
			throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ ��� ��������� */
	public RecordPointWFShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ ��� ��������� �� ������� */
	public RecordPointWFShortList getScrollableFilteredList(
			RecordPointWFFilter aRecordPointWFFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ ��� ��������� �� ������� */
	public RecordPointWFShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			RecordPointWFFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* RecordPointWF. �������� ������ �� ������ */
	public RecordPointWFShort getShortObject(int code)
			throws java.rmi.RemoteException;

}