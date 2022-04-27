
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActFailure;
 *
 */

import com.ksoe.energynet.valueobject.ENActFailure;
import com.ksoe.energynet.valueobject.brief.ENActFailureShort;
import com.ksoe.energynet.valueobject.filter.ENActFailureFilter;
import com.ksoe.energynet.valueobject.lists.ENActFailureShortList;


public interface ENActFailureController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActFailureController";

	/* ENActFailure. �������� */
	public int add(ENActFailure aENActFailure)
			throws java.rmi.RemoteException;

	/* ENActFailure. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActFailure. �������� */
	public void save(ENActFailure aENActFailure)
			throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ */
	public ENActFailure getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ ������ */
	public ENActFailureShortList getList()
			throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ �� ������� */
	public ENActFailureShortList getFilteredList(
			ENActFailureFilter aENActFailureFilter)
			throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ ��� ��������� */
	public ENActFailureShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ ��� ��������� �� ������� */
	public ENActFailureShortList getScrollableFilteredList(
			ENActFailureFilter aENActFailureFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ ��� ��������� �� ������� */
	public ENActFailureShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActFailureFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActFailure. �������� ������ �� ������ */
	public ENActFailureShort getShortObject(int code)
			throws java.rmi.RemoteException;

}