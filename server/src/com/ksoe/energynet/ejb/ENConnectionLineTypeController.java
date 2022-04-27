
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionLineType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionLineType;
import com.ksoe.energynet.valueobject.lists.ENConnectionLineTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionLineTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionLineTypeFilter;


public interface ENConnectionLineTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionLineTypeController";

	/* ENConnectionLineType. �������� */
	public int add(ENConnectionLineType aENConnectionLineType)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� */
	public void save(ENConnectionLineType aENConnectionLineType)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ */
	public ENConnectionLineType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ ������ */
	public ENConnectionLineTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ �� ������� */
	public ENConnectionLineTypeShortList getFilteredList(
			ENConnectionLineTypeFilter aENConnectionLineTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ ��� ��������� */
	public ENConnectionLineTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionLineTypeShortList getScrollableFilteredList(
			ENConnectionLineTypeFilter aENConnectionLineTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionLineTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionLineTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. �������� ������ �� ������ */
	public ENConnectionLineTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}