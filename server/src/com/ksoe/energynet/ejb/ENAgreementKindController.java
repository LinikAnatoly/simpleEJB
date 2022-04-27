
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAgreementKind;
 *
 */

import com.ksoe.energynet.valueobject.ENAgreementKind;
import com.ksoe.energynet.valueobject.lists.ENAgreementKindShortList;
import com.ksoe.energynet.valueobject.brief.ENAgreementKindShort;
import com.ksoe.energynet.valueobject.filter.ENAgreementKindFilter;


public interface ENAgreementKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAgreementKindController";

	/* ENAgreementKind. �������� */
	public int add(ENAgreementKind aENAgreementKind)
			throws java.rmi.RemoteException;

	/* ENAgreementKind. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� */
	public void save(ENAgreementKind aENAgreementKind)
			throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ */
	public ENAgreementKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ ������ */
	public ENAgreementKindShortList getList()
			throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ �� ������� */
	public ENAgreementKindShortList getFilteredList(
			ENAgreementKindFilter aENAgreementKindFilter)
			throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ ��� ��������� */
	public ENAgreementKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ ��� ��������� �� ������� */
	public ENAgreementKindShortList getScrollableFilteredList(
			ENAgreementKindFilter aENAgreementKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ ��� ��������� �� ������� */
	public ENAgreementKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAgreementKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAgreementKind. �������� ������ �� ������ */
	public ENAgreementKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}