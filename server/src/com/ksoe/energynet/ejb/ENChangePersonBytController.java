
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENChangePersonByt;
 *
 */

import com.ksoe.energynet.valueobject.ENChangePersonByt;
import com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort;
import com.ksoe.energynet.valueobject.filter.ENChangePersonBytFilter;
import com.ksoe.energynet.valueobject.lists.ENChangePersonBytShortList;


public interface ENChangePersonBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENChangePersonBytController";

	/* ENChangePersonByt. �������� */
	public int add(ENChangePersonByt aENChangePersonByt)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� */
	public void save(ENChangePersonByt aENChangePersonByt)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ */
	public ENChangePersonByt getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ ������ */
	public ENChangePersonBytShortList getList()
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ �� ������� */
	public ENChangePersonBytShortList getFilteredList(
			ENChangePersonBytFilter aENChangePersonBytFilter)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ ��� ��������� */
	public ENChangePersonBytShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ ��� ��������� �� ������� */
	public ENChangePersonBytShortList getScrollableFilteredList(
			ENChangePersonBytFilter aENChangePersonBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ ��� ��������� �� ������� */
	public ENChangePersonBytShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENChangePersonBytFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. �������� ������ �� ������ */
	public ENChangePersonBytShort getShortObject(int code)
			throws java.rmi.RemoteException;

}