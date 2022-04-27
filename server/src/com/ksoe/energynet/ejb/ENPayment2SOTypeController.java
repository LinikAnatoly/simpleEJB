
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPayment2SOType;
 *
 */

import com.ksoe.energynet.valueobject.ENPayment2SOType;
import com.ksoe.energynet.valueobject.brief.ENPayment2SOTypeShort;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOTypeShortList;


public interface ENPayment2SOTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPayment2SOTypeController";

	/* ENPayment2SOType. �������� */
	public int add(ENPayment2SOType aENPayment2SOType)
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� */
	public void save(ENPayment2SOType aENPayment2SOType)
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ */
	public ENPayment2SOType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ ������ */
	public ENPayment2SOTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ �� ������� */
	public ENPayment2SOTypeShortList getFilteredList(
			ENPayment2SOTypeFilter aENPayment2SOTypeFilter)
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ ��� ��������� */
	public ENPayment2SOTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ ��� ��������� �� ������� */
	public ENPayment2SOTypeShortList getScrollableFilteredList(
			ENPayment2SOTypeFilter aENPayment2SOTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ ��� ��������� �� ������� */
	public ENPayment2SOTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPayment2SOTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPayment2SOType. �������� ������ �� ������ */
	public ENPayment2SOTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}