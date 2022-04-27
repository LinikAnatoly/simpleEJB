
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSettleType;
 *
 */

import com.ksoe.energynet.valueobject.ENSettleType;
import com.ksoe.energynet.valueobject.lists.ENSettleTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENSettleTypeShort;
import com.ksoe.energynet.valueobject.filter.ENSettleTypeFilter;


public interface ENSettleTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSettleTypeController";

	/* ENSettleType. �������� */
	public int add(ENSettleType aENSettleType)
			throws java.rmi.RemoteException;

	/* ENSettleType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSettleType. �������� */
	public void save(ENSettleType aENSettleType)
			throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ */
	public ENSettleType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ ������ */
	public ENSettleTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ �� ������� */
	public ENSettleTypeShortList getFilteredList(
			ENSettleTypeFilter aENSettleTypeFilter)
			throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ ��� ��������� */
	public ENSettleTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ ��� ��������� �� ������� */
	public ENSettleTypeShortList getScrollableFilteredList(
			ENSettleTypeFilter aENSettleTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ ��� ��������� �� ������� */
	public ENSettleTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSettleTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSettleType. �������� ������ �� ������ */
	public ENSettleTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}