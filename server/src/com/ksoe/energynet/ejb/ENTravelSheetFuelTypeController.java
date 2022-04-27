
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTravelSheetFuelType;
 *
 */

import com.ksoe.energynet.valueobject.ENTravelSheetFuelType;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelTypeShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelTypeShortList;


public interface ENTravelSheetFuelTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelTypeController";

	/* ENTravelSheetFuelType. �������� */
	public int add(ENTravelSheetFuelType aENTravelSheetFuelType)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� */
	public void save(ENTravelSheetFuelType aENTravelSheetFuelType)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ */
	public ENTravelSheetFuelType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ ������ */
	public ENTravelSheetFuelTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ �� ������� */
	public ENTravelSheetFuelTypeShortList getFilteredList(
			ENTravelSheetFuelTypeFilter aENTravelSheetFuelTypeFilter)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ ��� ��������� */
	public ENTravelSheetFuelTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuelTypeShortList getScrollableFilteredList(
			ENTravelSheetFuelTypeFilter aENTravelSheetFuelTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuelTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTravelSheetFuelTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. �������� ������ �� ������ */
	public ENTravelSheetFuelTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}