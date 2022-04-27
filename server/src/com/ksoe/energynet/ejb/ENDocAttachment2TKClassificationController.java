
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment2TKClassification;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2TKClassification;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2TKClassificationShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2TKClassificationShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2TKClassificationFilter;


public interface ENDocAttachment2TKClassificationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachment2TKClassificationController";

	/* ENDocAttachment2TKClassification. �������� */
	public int add(ENDocAttachment2TKClassification aENDocAttachment2TKClassification) throws java.rmi.RemoteException;
	public int add(ENDocAttachment object, byte[] aFile, String fileName, int tkClassificationTypeCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� */
	public void save(ENDocAttachment2TKClassification aENDocAttachment2TKClassification)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ */
	public ENDocAttachment2TKClassification getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ ������ */
	public ENDocAttachment2TKClassificationShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ �� ������� */
	public ENDocAttachment2TKClassificationShortList getFilteredList(
			ENDocAttachment2TKClassificationFilter aENDocAttachment2TKClassificationFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ ��� ��������� */
	public ENDocAttachment2TKClassificationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachment2TKClassificationShortList getScrollableFilteredList(
			ENDocAttachment2TKClassificationFilter aENDocAttachment2TKClassificationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachment2TKClassificationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachment2TKClassificationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKClassification. �������� ������ �� ������ */
	public ENDocAttachment2TKClassificationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}