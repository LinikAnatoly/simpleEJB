
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionTariffType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionTariffType;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffTypeFilter;


public interface ENConnectionTariffTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionTariffTypeController";

	/* ENConnectionTariffType. �������� */
	public int add(ENConnectionTariffType aENConnectionTariffType)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� */
	public void save(ENConnectionTariffType aENConnectionTariffType)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ */
	public ENConnectionTariffType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ ������ */
	public ENConnectionTariffTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ �� ������� */
	public ENConnectionTariffTypeShortList getFilteredList(
			ENConnectionTariffTypeFilter aENConnectionTariffTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ ��� ��������� */
	public ENConnectionTariffTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionTariffTypeShortList getScrollableFilteredList(
			ENConnectionTariffTypeFilter aENConnectionTariffTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionTariffTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionTariffTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. �������� ������ �� ������ */
	public ENConnectionTariffTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}