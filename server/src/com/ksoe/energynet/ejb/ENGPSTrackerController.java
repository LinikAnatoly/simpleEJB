
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGPSTracker;
 *
 */

import java.util.Date;

import com.ksoe.energynet.valueobject.ENGPSTracker;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerShortList;
import com.ksoe.energynet.valueobject.brief.ENGPSTrackerShort;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerFilter;


public interface ENGPSTrackerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGPSTrackerController";

	/* ENGPSTracker. �������� */
	public int add(ENGPSTracker aENGPSTracker)
			throws java.rmi.RemoteException;

	/* ENGPSTracker. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� */
	public void save(ENGPSTracker aENGPSTracker)
			throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ */
	public ENGPSTracker getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ ������ */
	public ENGPSTrackerShortList getList()
			throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ �� ������� */
	public ENGPSTrackerShortList getFilteredList(
			ENGPSTrackerFilter aENGPSTrackerFilter)
			throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ ��� ��������� */
	public ENGPSTrackerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ ��� ��������� �� ������� */
	public ENGPSTrackerShortList getScrollableFilteredList(
			ENGPSTrackerFilter aENGPSTrackerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ ��� ��������� �� ������� */
	public ENGPSTrackerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENGPSTrackerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGPSTracker. �������� ������ �� ������ */
	public ENGPSTrackerShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENGPSTracker. ���������� �� ������������ �������� */
	public void installGPS(int gpsTrackerCode, int transportRealCode, Date date)  throws java.rmi.RemoteException;
	
	/* ENGPSTracker. ����� � ������������� �������� */
	public void unInstallGPS(int gpsTrackerCode, Date date) throws java.rmi.RemoteException;
}