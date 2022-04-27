
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAttachment2ServicesKind;
 *
 */

import com.ksoe.energynet.valueobject.ENAttachment2ServicesKind;
import com.ksoe.energynet.valueobject.brief.ENAttachment2ServicesKindShort;
import com.ksoe.energynet.valueobject.filter.ENAttachment2ServicesKindFilter;
import com.ksoe.energynet.valueobject.lists.ENAttachment2ServicesKindShortList;


public interface ENAttachment2ServicesKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAttachment2ServicesKindController";

	/* ENAttachment2ServicesKind. �������� */
	public int add(ENAttachment2ServicesKind aENAttachment2ServicesKind)
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� */
	public void save(ENAttachment2ServicesKind aENAttachment2ServicesKind)
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ */
	public ENAttachment2ServicesKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ ������ */
	public ENAttachment2ServicesKindShortList getList()
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ �� ������� */
	public ENAttachment2ServicesKindShortList getFilteredList(
			ENAttachment2ServicesKindFilter aENAttachment2ServicesKindFilter)
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ ��� ��������� */
	public ENAttachment2ServicesKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ ��� ��������� �� ������� */
	public ENAttachment2ServicesKindShortList getScrollableFilteredList(
			ENAttachment2ServicesKindFilter aENAttachment2ServicesKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ ��� ��������� �� ������� */
	public ENAttachment2ServicesKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAttachment2ServicesKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAttachment2ServicesKind. �������� ������ �� ������ */
	public ENAttachment2ServicesKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}