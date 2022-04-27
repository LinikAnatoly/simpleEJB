
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENLandSheetsDelays;
 *
 */

import com.ksoe.energynet.valueobject.ENLandSheetsDelays;
import com.ksoe.energynet.valueobject.lists.ENLandSheetsDelaysShortList;
import com.ksoe.energynet.valueobject.brief.ENLandSheetsDelaysShort;
import com.ksoe.energynet.valueobject.filter.ENLandSheetsDelaysFilter;


public interface ENLandSheetsDelaysController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENLandSheetsDelaysController";

	/* ENLandSheetsDelays. �������� */
	public int add(ENLandSheetsDelays aENLandSheetsDelays)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� */
	public void save(ENLandSheetsDelays aENLandSheetsDelays)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ */
	public ENLandSheetsDelays getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ ������ */
	public ENLandSheetsDelaysShortList getList()
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ �� ������� */
	public ENLandSheetsDelaysShortList getFilteredList(
			ENLandSheetsDelaysFilter aENLandSheetsDelaysFilter)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ ��� ��������� */
	public ENLandSheetsDelaysShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ ��� ��������� �� ������� */
	public ENLandSheetsDelaysShortList getScrollableFilteredList(
			ENLandSheetsDelaysFilter aENLandSheetsDelaysFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ ��� ��������� �� ������� */
	public ENLandSheetsDelaysShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENLandSheetsDelaysFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. �������� ������ �� ������ */
	public ENLandSheetsDelaysShort getShortObject(int code)
			throws java.rmi.RemoteException;

}