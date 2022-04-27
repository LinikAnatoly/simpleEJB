
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNAttachment;
 *
 */

import java.util.Date;

import com.ksoe.energynet.valueobject.CNAttachment;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.lists.CNAttachmentShortList;
import com.ksoe.energynet.valueobject.brief.CNAttachmentShort;
import com.ksoe.energynet.valueobject.filter.CNAttachmentFilter;


public interface CNAttachmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNAttachmentController";

	/* CNAttachment. �������� */
	public int add(CNAttachment aCNAttachment)
			throws java.rmi.RemoteException;

	/* CNAttachment. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNAttachment. �������� */
	public void save(CNAttachment aCNAttachment)
			throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ */
	public CNAttachment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ ������ */
	public CNAttachmentShortList getList()
			throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ �� ������� */
	public CNAttachmentShortList getFilteredList(
			CNAttachmentFilter aCNAttachmentFilter)
			throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ ��� ��������� */
	public CNAttachmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ ��� ��������� �� ������� */
	public CNAttachmentShortList getScrollableFilteredList(
			CNAttachmentFilter aCNAttachmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ ��� ��������� �� ������� */
	public CNAttachmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			CNAttachmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNAttachment. �������� ������ �� ������ */
	public CNAttachmentShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void convertAtt(int code) throws java.rmi.RemoteException;
	
	public void convertAtt(int id, String prefix) throws java.rmi.RemoteException;
	
	public void transliterateAtt(int code) throws java.rmi.RemoteException;
	
	/* CNAttachment. ������� */
	public void removeCN(String cnSubSystem, int id, int codeENDoccAttachment)throws java.rmi.RemoteException;
	
	/* CNAttachment. �������� */
	public void addDocAttachments(String cnSubSystem, String attachDocName, int idPack,
			int idMovement, int idUser, ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate)
			throws java.rmi.RemoteException;

}