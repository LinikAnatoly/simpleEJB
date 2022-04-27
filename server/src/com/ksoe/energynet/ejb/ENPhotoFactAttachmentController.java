
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPhotoFactAttachment;
 *
 */

import com.ksoe.energynet.valueobject.ENPhotoFactAttachment;
import com.ksoe.energynet.valueobject.lists.ENPhotoFactAttachmentShortList;
import com.ksoe.energynet.valueobject.brief.ENPhotoFactAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENPhotoFactAttachmentFilter;


public interface ENPhotoFactAttachmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPhotoFactAttachmentController";

	/* ENPhotoFactAttachment. �������� */
	public int add(ENPhotoFactAttachment aENPhotoFactAttachment)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� */
	public void save(ENPhotoFactAttachment aENPhotoFactAttachment)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ */
	public ENPhotoFactAttachment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ ������ */
	public ENPhotoFactAttachmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ �� ������� */
	public ENPhotoFactAttachmentShortList getFilteredList(
			ENPhotoFactAttachmentFilter aENPhotoFactAttachmentFilter)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ ��� ��������� */
	public ENPhotoFactAttachmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ ��� ��������� �� ������� */
	public ENPhotoFactAttachmentShortList getScrollableFilteredList(
			ENPhotoFactAttachmentFilter aENPhotoFactAttachmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ ��� ��������� �� ������� */
	public ENPhotoFactAttachmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPhotoFactAttachmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. �������� ������ �� ������ */
	public ENPhotoFactAttachmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}