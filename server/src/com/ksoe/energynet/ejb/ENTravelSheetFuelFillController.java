
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTravelSheetFuelFill;
 *
 */

import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelFillShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFillFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelFillShortList;


public interface ENTravelSheetFuelFillController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelFillController";

	/* ENTravelSheetFuelFill. �������� */
	public int add(ENTravelSheetFuelFill aENTravelSheetFuelFill)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� */
	public void save(ENTravelSheetFuelFill aENTravelSheetFuelFill)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ */
	public ENTravelSheetFuelFill getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ ������ */
	public ENTravelSheetFuelFillShortList getList()
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ �� ������� */
	public ENTravelSheetFuelFillShortList getFilteredList(
			ENTravelSheetFuelFillFilter aENTravelSheetFuelFillFilter)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ ��� ��������� */
	public ENTravelSheetFuelFillShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuelFillShortList getScrollableFilteredList(
			ENTravelSheetFuelFillFilter aENTravelSheetFuelFillFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuelFillShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTravelSheetFuelFillFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. �������� ������ �� ������ */
	public ENTravelSheetFuelFillShort getShortObject(int code)
			throws java.rmi.RemoteException;

}