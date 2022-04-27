
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentAction;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentAction;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentActionShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentActionShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentActionFilter;


public interface ENDocAttachmentActionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentActionController";

	/* ENDocAttachmentAction. �������� */
	public int add(ENDocAttachmentAction aENDocAttachmentAction)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� */
	public void save(ENDocAttachmentAction aENDocAttachmentAction)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ */
	public ENDocAttachmentAction getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ ������ */
	public ENDocAttachmentActionShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ �� ������� */
	public ENDocAttachmentActionShortList getFilteredList(
			ENDocAttachmentActionFilter aENDocAttachmentActionFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ ��� ��������� */
	public ENDocAttachmentActionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentActionShortList getScrollableFilteredList(
			ENDocAttachmentActionFilter aENDocAttachmentActionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachmentActionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentActionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. �������� ������ �� ������ */
	public ENDocAttachmentActionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}