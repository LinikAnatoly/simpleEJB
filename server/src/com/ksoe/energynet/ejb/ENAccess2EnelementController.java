
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAccess2Enelement;
 *
 */

import com.ksoe.energynet.valueobject.ENAccess2Enelement;
import com.ksoe.energynet.valueobject.brief.ENAccess2EnelementShort;
import com.ksoe.energynet.valueobject.filter.ENAccess2EnelementFilter;
import com.ksoe.energynet.valueobject.lists.ENAccess2EnelementShortList;


public interface ENAccess2EnelementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAccess2EnelementController";

	/* ENAccess2Enelement. �������� */
	public int add(ENAccess2Enelement aENAccess2Enelement)
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� */
	public void save(ENAccess2Enelement aENAccess2Enelement)
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ */
	public ENAccess2Enelement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ ������ */
	public ENAccess2EnelementShortList getList()
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ �� ������� */
	public ENAccess2EnelementShortList getFilteredList(
			ENAccess2EnelementFilter aENAccess2EnelementFilter)
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ ��� ��������� */
	public ENAccess2EnelementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ ��� ��������� �� ������� */
	public ENAccess2EnelementShortList getScrollableFilteredList(
			ENAccess2EnelementFilter aENAccess2EnelementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ ��� ��������� �� ������� */
	public ENAccess2EnelementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAccess2EnelementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAccess2Enelement. �������� ������ �� ������ */
	public ENAccess2EnelementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}