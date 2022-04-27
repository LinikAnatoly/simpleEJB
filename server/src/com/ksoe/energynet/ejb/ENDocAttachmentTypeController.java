
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentType;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentType;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentTypeShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentTypeFilter;


public interface ENDocAttachmentTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentTypeController";

	/* ENDocAttachmentType. �������� */
	public int add(ENDocAttachmentType aENDocAttachmentType)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� */
	public void save(ENDocAttachmentType aENDocAttachmentType)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ */
	public ENDocAttachmentType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ ������ */
	public ENDocAttachmentTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ �� ������� */
	public ENDocAttachmentTypeShortList getFilteredList(
			ENDocAttachmentTypeFilter aENDocAttachmentTypeFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ ��� ��������� */
	public ENDocAttachmentTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentTypeShortList getScrollableFilteredList(
			ENDocAttachmentTypeFilter aENDocAttachmentTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. �������� ������ �� ������ */
	public ENDocAttachmentTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}