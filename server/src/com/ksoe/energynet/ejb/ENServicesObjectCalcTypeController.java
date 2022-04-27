
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesObjectCalcType;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectCalcTypeShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectCalcTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectCalcTypeShortList;


public interface ENServicesObjectCalcTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesObjectCalcTypeController";

	/* ENServicesObjectCalcType. �������� */
	public int add(ENServicesObjectCalcType aENServicesObjectCalcType)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� */
	public void save(ENServicesObjectCalcType aENServicesObjectCalcType)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ */
	public ENServicesObjectCalcType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ ������ */
	public ENServicesObjectCalcTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ �� ������� */
	public ENServicesObjectCalcTypeShortList getFilteredList(
			ENServicesObjectCalcTypeFilter aENServicesObjectCalcTypeFilter)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ ��� ��������� */
	public ENServicesObjectCalcTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ ��� ��������� �� ������� */
	public ENServicesObjectCalcTypeShortList getScrollableFilteredList(
			ENServicesObjectCalcTypeFilter aENServicesObjectCalcTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ ��� ��������� �� ������� */
	public ENServicesObjectCalcTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesObjectCalcTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. �������� ������ �� ������ */
	public ENServicesObjectCalcTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}