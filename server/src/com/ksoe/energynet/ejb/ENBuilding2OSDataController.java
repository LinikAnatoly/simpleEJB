
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding2OSData;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding2OSData;
import com.ksoe.energynet.valueobject.lists.ENBuilding2OSDataShortList;
import com.ksoe.energynet.valueobject.brief.ENBuilding2OSDataShort;
import com.ksoe.energynet.valueobject.filter.ENBuilding2OSDataFilter;


public interface ENBuilding2OSDataController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuilding2OSDataController";

	/* ENBuilding2OSData. �������� */
	public int add(ENBuilding2OSData aENBuilding2OSData)
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� */
	public void save(ENBuilding2OSData aENBuilding2OSData)
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ */
	public ENBuilding2OSData getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ ������ */
	public ENBuilding2OSDataShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ �� ������� */
	public ENBuilding2OSDataShortList getFilteredList(
			ENBuilding2OSDataFilter aENBuilding2OSDataFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ ��� ��������� */
	public ENBuilding2OSDataShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ ��� ��������� �� ������� */
	public ENBuilding2OSDataShortList getScrollableFilteredList(
			ENBuilding2OSDataFilter aENBuilding2OSDataFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ ��� ��������� �� ������� */
	public ENBuilding2OSDataShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBuilding2OSDataFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding2OSData. �������� ������ �� ������ */
	public ENBuilding2OSDataShort getShortObject(int code)
			throws java.rmi.RemoteException;

}