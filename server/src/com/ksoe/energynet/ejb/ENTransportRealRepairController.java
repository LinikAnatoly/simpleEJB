
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTransportRealRepair;
 *
 */

import com.ksoe.energynet.valueobject.ENTransportRealRepair;
import com.ksoe.energynet.valueobject.lists.ENTransportRealRepairShortList;
import com.ksoe.energynet.valueobject.brief.ENTransportRealRepairShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRealRepairFilter;


public interface ENTransportRealRepairController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTransportRealRepairController";

	/* ENTransportRealRepair. �������� */
	public int add(ENTransportRealRepair aENTransportRealRepair)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� */
	public void save(ENTransportRealRepair aENTransportRealRepair)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ */
	public ENTransportRealRepair getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ ������ */
	public ENTransportRealRepairShortList getList()
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ �� ������� */
	public ENTransportRealRepairShortList getFilteredList(
			ENTransportRealRepairFilter aENTransportRealRepairFilter)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ ��� ��������� */
	public ENTransportRealRepairShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ ��� ��������� �� ������� */
	public ENTransportRealRepairShortList getScrollableFilteredList(
			ENTransportRealRepairFilter aENTransportRealRepairFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ ��� ��������� �� ������� */
	public ENTransportRealRepairShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTransportRealRepairFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. �������� ������ �� ������ */
	public ENTransportRealRepairShort getShortObject(int code)
			throws java.rmi.RemoteException;

}