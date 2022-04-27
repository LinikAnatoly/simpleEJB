
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionInstallationType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionInstallationType;
import com.ksoe.energynet.valueobject.lists.ENConnectionInstallationTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionInstallationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionInstallationTypeFilter;


public interface ENConnectionInstallationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionInstallationTypeController";

	/* ENConnectionInstallationType. �������� */
	public int add(ENConnectionInstallationType aENConnectionInstallationType)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� */
	public void save(ENConnectionInstallationType aENConnectionInstallationType)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ */
	public ENConnectionInstallationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ ������ */
	public ENConnectionInstallationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ �� ������� */
	public ENConnectionInstallationTypeShortList getFilteredList(
			ENConnectionInstallationTypeFilter aENConnectionInstallationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ ��� ��������� */
	public ENConnectionInstallationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionInstallationTypeShortList getScrollableFilteredList(
			ENConnectionInstallationTypeFilter aENConnectionInstallationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionInstallationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionInstallationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. �������� ������ �� ������ */
	public ENConnectionInstallationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}