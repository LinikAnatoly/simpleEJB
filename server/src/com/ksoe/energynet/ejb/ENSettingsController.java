
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSettings;
 *
 */

import com.ksoe.energynet.valueobject.ENSettings;
import com.ksoe.energynet.valueobject.brief.ENSettingsShort;
import com.ksoe.energynet.valueobject.filter.ENSettingsFilter;
import com.ksoe.energynet.valueobject.lists.ENSettingsShortList;


public interface ENSettingsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSettingsController";

	/* ENSettings. �������� */
	public int add(ENSettings aENSettings)
			throws java.rmi.RemoteException;

	/* ENSettings. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSettings. �������� */
	public void save(ENSettings aENSettings)
			throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ */
	public ENSettings getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ ������ */
	public ENSettingsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ �� ������� */
	public ENSettingsShortList getFilteredList(
			ENSettingsFilter aENSettingsFilter)
			throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ ��� ��������� */
	public ENSettingsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ ��� ��������� �� ������� */
	public ENSettingsShortList getScrollableFilteredList(
			ENSettingsFilter aENSettingsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ ��� ��������� �� ������� */
	public ENSettingsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSettingsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSettings. �������� ������ �� ������ */
	public ENSettingsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}