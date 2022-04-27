
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInventarizationStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInventarizationStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationStatusShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationStatusShortList;


public interface ENFuelInventarizationStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInventarizationStatusController";

	/* ENFuelInventarizationStatus. �������� */
	public int add(ENFuelInventarizationStatus aENFuelInventarizationStatus)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� */
	public void save(ENFuelInventarizationStatus aENFuelInventarizationStatus)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ */
	public ENFuelInventarizationStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ ������ */
	public ENFuelInventarizationStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ �� ������� */
	public ENFuelInventarizationStatusShortList getFilteredList(
			ENFuelInventarizationStatusFilter aENFuelInventarizationStatusFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ ��� ��������� */
	public ENFuelInventarizationStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ ��� ��������� �� ������� */
	public ENFuelInventarizationStatusShortList getScrollableFilteredList(
			ENFuelInventarizationStatusFilter aENFuelInventarizationStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ ��� ��������� �� ������� */
	public ENFuelInventarizationStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInventarizationStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationStatus. �������� ������ �� ������ */
	public ENFuelInventarizationStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}