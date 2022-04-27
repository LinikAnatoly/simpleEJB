
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderBytType;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytTypeShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytTypeShortList;


public interface ENWorkOrderBytTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytTypeController";

	/* ENWorkOrderBytType. �������� */
	public int add(ENWorkOrderBytType aENWorkOrderBytType)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� */
	public void save(ENWorkOrderBytType aENWorkOrderBytType)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ */
	public ENWorkOrderBytType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ ������ */
	public ENWorkOrderBytTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ �� ������� */
	public ENWorkOrderBytTypeShortList getFilteredList(
			ENWorkOrderBytTypeFilter aENWorkOrderBytTypeFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ ��� ��������� */
	public ENWorkOrderBytTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytTypeShortList getScrollableFilteredList(
			ENWorkOrderBytTypeFilter aENWorkOrderBytTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytType. �������� ������ �� ������ */
	public ENWorkOrderBytTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}