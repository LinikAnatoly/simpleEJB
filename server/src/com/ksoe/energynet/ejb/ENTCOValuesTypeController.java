
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTCOValuesType;
 *
 */

import com.ksoe.energynet.valueobject.ENTCOValuesType;
import com.ksoe.energynet.valueobject.lists.ENTCOValuesTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENTCOValuesTypeShort;
import com.ksoe.energynet.valueobject.filter.ENTCOValuesTypeFilter;


public interface ENTCOValuesTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTCOValuesTypeController";

	/* ENTCOValuesType. �������� */
	public int add(ENTCOValuesType aENTCOValuesType)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� */
	public void save(ENTCOValuesType aENTCOValuesType)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ */
	public ENTCOValuesType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ ������ */
	public ENTCOValuesTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ �� ������� */
	public ENTCOValuesTypeShortList getFilteredList(
			ENTCOValuesTypeFilter aENTCOValuesTypeFilter)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ ��� ��������� */
	public ENTCOValuesTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ ��� ��������� �� ������� */
	public ENTCOValuesTypeShortList getScrollableFilteredList(
			ENTCOValuesTypeFilter aENTCOValuesTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ ��� ��������� �� ������� */
	public ENTCOValuesTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTCOValuesTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTCOValuesType. �������� ������ �� ������ */
	public ENTCOValuesTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}