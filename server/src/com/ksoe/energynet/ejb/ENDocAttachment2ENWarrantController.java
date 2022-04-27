
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment2ENWarrant;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2ENWarrantShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENWarrantShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENWarrantFilter;


public interface ENDocAttachment2ENWarrantController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachment2ENWarrantController";

	/* ENDocAttachment2ENWarrant. �������� */
	public int add(ENDocAttachment object, byte[] aFile, String fileName,
			int warCode) throws java.rmi.RemoteException;

	public int add(ENDocAttachment object, byte[] aFile, String fileName,
			int warCode, int kindCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� */
	public void save(ENDocAttachment2ENWarrant aENDocAttachment2ENWarrant)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ */
	public ENDocAttachment2ENWarrant getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ ������ */
	public ENDocAttachment2ENWarrantShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ �� ������� */
	public ENDocAttachment2ENWarrantShortList getFilteredList(
			ENDocAttachment2ENWarrantFilter aENDocAttachment2ENWarrantFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ ��� ��������� */
	public ENDocAttachment2ENWarrantShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(
			ENDocAttachment2ENWarrantFilter aENDocAttachment2ENWarrantFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ ��� ��������� �� ������� */
	public ENDocAttachment2ENWarrantShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachment2ENWarrantFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENWarrant. �������� ������ �� ������ */
	public ENDocAttachment2ENWarrantShort getShortObject(int code)
			throws java.rmi.RemoteException;

}