
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENNecessityBuilding;
 *
 */

import com.ksoe.energynet.valueobject.ENNecessityBuilding;
import com.ksoe.energynet.valueobject.lists.ENNecessityBuildingShortList;
import com.ksoe.energynet.valueobject.brief.ENNecessityBuildingShort;
import com.ksoe.energynet.valueobject.filter.ENNecessityBuildingFilter;


public interface ENNecessityBuildingController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENNecessityBuildingController";

	/* ENNecessityBuilding. �������� */
	public int add(ENNecessityBuilding aENNecessityBuilding)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� */
	public void save(ENNecessityBuilding aENNecessityBuilding)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ */
	public ENNecessityBuilding getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ ������ */
	public ENNecessityBuildingShortList getList()
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ �� ������� */
	public ENNecessityBuildingShortList getFilteredList(
			ENNecessityBuildingFilter aENNecessityBuildingFilter)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ ��� ��������� */
	public ENNecessityBuildingShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ ��� ��������� �� ������� */
	public ENNecessityBuildingShortList getScrollableFilteredList(
			ENNecessityBuildingFilter aENNecessityBuildingFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ ��� ��������� �� ������� */
	public ENNecessityBuildingShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENNecessityBuildingFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. �������� ������ �� ������ */
	public ENNecessityBuildingShort getShortObject(int code)
			throws java.rmi.RemoteException;

}