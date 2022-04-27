
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuildingCommissionType;
 *
 */

import com.ksoe.energynet.valueobject.ENBuildingCommissionType;
import com.ksoe.energynet.valueobject.lists.ENBuildingCommissionTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENBuildingCommissionTypeShort;
import com.ksoe.energynet.valueobject.filter.ENBuildingCommissionTypeFilter;


public interface ENBuildingCommissionTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuildingCommissionTypeController";

	/* ENBuildingCommissionType. �������� */
	public int add(ENBuildingCommissionType aENBuildingCommissionType)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� */
	public void save(ENBuildingCommissionType aENBuildingCommissionType)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ */
	public ENBuildingCommissionType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ ������ */
	public ENBuildingCommissionTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ �� ������� */
	public ENBuildingCommissionTypeShortList getFilteredList(
			ENBuildingCommissionTypeFilter aENBuildingCommissionTypeFilter)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ ��� ��������� */
	public ENBuildingCommissionTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ ��� ��������� �� ������� */
	public ENBuildingCommissionTypeShortList getScrollableFilteredList(
			ENBuildingCommissionTypeFilter aENBuildingCommissionTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ ��� ��������� �� ������� */
	public ENBuildingCommissionTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBuildingCommissionTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. �������� ������ �� ������ */
	public ENBuildingCommissionTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}