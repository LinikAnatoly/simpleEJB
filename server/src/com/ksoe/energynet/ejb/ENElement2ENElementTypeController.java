
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2ENElementType;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2ENElementType;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementTypeShort;
import com.ksoe.energynet.valueobject.filter.ENElement2ENElementTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENElement2ENElementTypeShortList;


public interface ENElement2ENElementTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2ENElementTypeController";

	/* ENElement2ENElementType. �������� */
	public int add(ENElement2ENElementType aENElement2ENElementType)
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� */
	public void save(ENElement2ENElementType aENElement2ENElementType)
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ */
	public ENElement2ENElementType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ ������ */
	public ENElement2ENElementTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ �� ������� */
	public ENElement2ENElementTypeShortList getFilteredList(
			ENElement2ENElementTypeFilter aENElement2ENElementTypeFilter)
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ ��� ��������� */
	public ENElement2ENElementTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ ��� ��������� �� ������� */
	public ENElement2ENElementTypeShortList getScrollableFilteredList(
			ENElement2ENElementTypeFilter aENElement2ENElementTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ ��� ��������� �� ������� */
	public ENElement2ENElementTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENElement2ENElementTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2ENElementType. �������� ������ �� ������ */
	public ENElement2ENElementTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}