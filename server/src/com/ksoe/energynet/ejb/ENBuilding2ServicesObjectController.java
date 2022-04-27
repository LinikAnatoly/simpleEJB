
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding2ServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding2ServicesObject;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ServicesObjectShortList;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ServicesObjectFilter;


public interface ENBuilding2ServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuilding2ServicesObjectController";

	/* ENBuilding2ServicesObject. �������� */
	public int add(ENBuilding2ServicesObject aENBuilding2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� */
	public void save(ENBuilding2ServicesObject aENBuilding2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ */
	public ENBuilding2ServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ ������ */
	public ENBuilding2ServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ �� ������� */
	public ENBuilding2ServicesObjectShortList getFilteredList(
			ENBuilding2ServicesObjectFilter aENBuilding2ServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ ��� ��������� */
	public ENBuilding2ServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(
			ENBuilding2ServicesObjectFilter aENBuilding2ServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENBuilding2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBuilding2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding2ServicesObject. �������� ������ �� ������ */
	public ENBuilding2ServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}