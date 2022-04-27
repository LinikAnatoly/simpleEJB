
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMolFuelMotion;
 *
 */

import com.ksoe.energynet.valueobject.ENMolFuelMotion;
import com.ksoe.energynet.valueobject.brief.ENMolFuelMotionShort;
import com.ksoe.energynet.valueobject.filter.ENMolFuelMotionFilter;
import com.ksoe.energynet.valueobject.lists.ENMolFuelMotionShortList;


public interface ENMolFuelMotionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMolFuelMotionController";

	/* ENMolFuelMotion. �������� */
	public int add(ENMolFuelMotion aENMolFuelMotion)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� */
	public void save(ENMolFuelMotion aENMolFuelMotion)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ */
	public ENMolFuelMotion getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ ������ */
	public ENMolFuelMotionShortList getList()
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ �� ������� */
	public ENMolFuelMotionShortList getFilteredList(
			ENMolFuelMotionFilter aENMolFuelMotionFilter)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ ��� ��������� */
	public ENMolFuelMotionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ ��� ��������� �� ������� */
	public ENMolFuelMotionShortList getScrollableFilteredList(
			ENMolFuelMotionFilter aENMolFuelMotionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ ��� ��������� �� ������� */
	public ENMolFuelMotionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENMolFuelMotionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. �������� ������ �� ������ */
	public ENMolFuelMotionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}