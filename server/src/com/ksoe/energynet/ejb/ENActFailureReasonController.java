
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActFailureReason;
 *
 */

import com.ksoe.energynet.valueobject.ENActFailureReason;
import com.ksoe.energynet.valueobject.brief.ENActFailureReasonShort;
import com.ksoe.energynet.valueobject.filter.ENActFailureReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENActFailureReasonShortList;


public interface ENActFailureReasonController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActFailureReasonController";

	/* ENActFailureReason. �������� */
	public int add(ENActFailureReason aENActFailureReason)
			throws java.rmi.RemoteException;

	/* ENActFailureReason. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� */
	public void save(ENActFailureReason aENActFailureReason)
			throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ */
	public ENActFailureReason getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ ������ */
	public ENActFailureReasonShortList getList()
			throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ �� ������� */
	public ENActFailureReasonShortList getFilteredList(
			ENActFailureReasonFilter aENActFailureReasonFilter)
			throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ ��� ��������� */
	public ENActFailureReasonShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ ��� ��������� �� ������� */
	public ENActFailureReasonShortList getScrollableFilteredList(
			ENActFailureReasonFilter aENActFailureReasonFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ ��� ��������� �� ������� */
	public ENActFailureReasonShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActFailureReasonFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActFailureReason. �������� ������ �� ������ */
	public ENActFailureReasonShort getShortObject(int code)
			throws java.rmi.RemoteException;

}