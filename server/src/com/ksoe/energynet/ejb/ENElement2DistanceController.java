
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2Distance;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2Distance;
import com.ksoe.energynet.valueobject.lists.ENElement2DistanceShortList;
import com.ksoe.energynet.valueobject.brief.ENElement2DistanceShort;
import com.ksoe.energynet.valueobject.filter.ENElement2DistanceFilter;


public interface ENElement2DistanceController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2DistanceController";

	/* ENElement2Distance. �������� */
	public int add(ENElement2Distance aENElement2Distance)
			throws java.rmi.RemoteException;

	/* ENElement2Distance. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� */
	public void save(ENElement2Distance aENElement2Distance)
			throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ */
	public ENElement2Distance getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ ������ */
	public ENElement2DistanceShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ �� ������� */
	public ENElement2DistanceShortList getFilteredList(
			ENElement2DistanceFilter aENElement2DistanceFilter)
			throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ ��� ��������� */
	public ENElement2DistanceShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ ��� ��������� �� ������� */
	public ENElement2DistanceShortList getScrollableFilteredList(
			ENElement2DistanceFilter aENElement2DistanceFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ ��� ��������� �� ������� */
	public ENElement2DistanceShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENElement2DistanceFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2Distance. �������� ������ �� ������ */
	public ENElement2DistanceShort getShortObject(int code)
			throws java.rmi.RemoteException;

}