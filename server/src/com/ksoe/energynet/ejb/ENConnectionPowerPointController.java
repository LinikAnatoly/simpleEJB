
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionPowerPoint;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionPowerPoint;
import com.ksoe.energynet.valueobject.lists.ENConnectionPowerPointShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionPowerPointShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionPowerPointFilter;


public interface ENConnectionPowerPointController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionPowerPointController";

	/* ENConnectionPowerPoint. �������� */
	public int add(ENConnectionPowerPoint aENConnectionPowerPoint)
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� */
	public void save(ENConnectionPowerPoint aENConnectionPowerPoint)
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ */
	public ENConnectionPowerPoint getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ ������ */
	public ENConnectionPowerPointShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ �� ������� */
	public ENConnectionPowerPointShortList getFilteredList(
			ENConnectionPowerPointFilter aENConnectionPowerPointFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ ��� ��������� */
	public ENConnectionPowerPointShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ ��� ��������� �� ������� */
	public ENConnectionPowerPointShortList getScrollableFilteredList(
			ENConnectionPowerPointFilter aENConnectionPowerPointFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ ��� ��������� �� ������� */
	public ENConnectionPowerPointShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionPowerPointFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionPowerPoint. �������� ������ �� ������ */
	public ENConnectionPowerPointShort getShortObject(int code)
			throws java.rmi.RemoteException;

}