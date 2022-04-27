
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesObject2FKInfo;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesObject2FKInfo;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2FKInfoShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2FKInfoShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2FKInfoFilter;


public interface ENServicesObject2FKInfoController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesObject2FKInfoController";

	/* ENServicesObject2FKInfo. �������� */
	public int add(ENServicesObject2FKInfo aENServicesObject2FKInfo)
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� */
	public void save(ENServicesObject2FKInfo aENServicesObject2FKInfo)
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ */
	public ENServicesObject2FKInfo getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ ������ */
	public ENServicesObject2FKInfoShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ �� ������� */
	public ENServicesObject2FKInfoShortList getFilteredList(
			ENServicesObject2FKInfoFilter aENServicesObject2FKInfoFilter)
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ ��� ��������� */
	public ENServicesObject2FKInfoShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ ��� ��������� �� ������� */
	public ENServicesObject2FKInfoShortList getScrollableFilteredList(
			ENServicesObject2FKInfoFilter aENServicesObject2FKInfoFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ ��� ��������� �� ������� */
	public ENServicesObject2FKInfoShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesObject2FKInfoFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesObject2FKInfo. �������� ������ �� ������ */
	public ENServicesObject2FKInfoShort getShortObject(int code)
			throws java.rmi.RemoteException;

}