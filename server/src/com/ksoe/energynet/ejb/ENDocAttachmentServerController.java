
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentServer;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentServer;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentServerShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentServerShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentServerFilter;


public interface ENDocAttachmentServerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentServerController";

	/* ENDocAttachmentServer. �������� */
	public int add(ENDocAttachmentServer aENDocAttachmentServer)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� */
	public void save(ENDocAttachmentServer aENDocAttachmentServer)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ */
	public ENDocAttachmentServer getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ ������ */
	public ENDocAttachmentServerShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ �� ������� */
	public ENDocAttachmentServerShortList getFilteredList(
			ENDocAttachmentServerFilter aENDocAttachmentServerFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ ��� ��������� */
	public ENDocAttachmentServerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentServerShortList getScrollableFilteredList(
			ENDocAttachmentServerFilter aENDocAttachmentServerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentServerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentServerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. �������� ������ �� ������ */
	public ENDocAttachmentServerShort getShortObject(int code)
			throws java.rmi.RemoteException;

}