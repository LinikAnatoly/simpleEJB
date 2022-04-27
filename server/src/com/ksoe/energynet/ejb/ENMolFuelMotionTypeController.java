
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMolFuelMotionType;
 *
 */

import com.ksoe.energynet.valueobject.ENMolFuelMotionType;
import com.ksoe.energynet.valueobject.brief.ENMolFuelMotionTypeShort;
import com.ksoe.energynet.valueobject.filter.ENMolFuelMotionTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMolFuelMotionTypeShortList;


public interface ENMolFuelMotionTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMolFuelMotionTypeController";

	/* ENMolFuelMotionType. �������� */
	public int add(ENMolFuelMotionType aENMolFuelMotionType)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� */
	public void save(ENMolFuelMotionType aENMolFuelMotionType)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ */
	public ENMolFuelMotionType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ ������ */
	public ENMolFuelMotionTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ �� ������� */
	public ENMolFuelMotionTypeShortList getFilteredList(
			ENMolFuelMotionTypeFilter aENMolFuelMotionTypeFilter)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ ��� ��������� */
	public ENMolFuelMotionTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ ��� ��������� �� ������� */
	public ENMolFuelMotionTypeShortList getScrollableFilteredList(
			ENMolFuelMotionTypeFilter aENMolFuelMotionTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ ��� ��������� �� ������� */
	public ENMolFuelMotionTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENMolFuelMotionTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. �������� ������ �� ������ */
	public ENMolFuelMotionTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}