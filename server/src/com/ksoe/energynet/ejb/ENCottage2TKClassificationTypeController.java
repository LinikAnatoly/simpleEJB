
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCottage2TKClassificationType;
 *
 */

import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;
import com.ksoe.energynet.valueobject.brief.ENCottage2TKClassificationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENCottage2TKClassificationTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENCottage2TKClassificationTypeShortList;


public interface ENCottage2TKClassificationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCottage2TKClassificationTypeController";

	/* ENCottage2TKClassificationType. �������� */
	public int add(ENCottage2TKClassificationType aENCottage2TKClassificationType)
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� */
	public void save(ENCottage2TKClassificationType aENCottage2TKClassificationType)
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ */
	public ENCottage2TKClassificationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ ������ */
	public ENCottage2TKClassificationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ �� ������� */
	public ENCottage2TKClassificationTypeShortList getFilteredList(
			ENCottage2TKClassificationTypeFilter aENCottage2TKClassificationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ ��� ��������� */
	public ENCottage2TKClassificationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ ��� ��������� �� ������� */
	public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(
			ENCottage2TKClassificationTypeFilter aENCottage2TKClassificationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ ��� ��������� �� ������� */
	public ENCottage2TKClassificationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCottage2TKClassificationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCottage2TKClassificationType. �������� ������ �� ������ */
	public ENCottage2TKClassificationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}