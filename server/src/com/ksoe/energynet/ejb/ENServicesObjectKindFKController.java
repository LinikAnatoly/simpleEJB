
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesObjectKindFK;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesObjectKindFK;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectKindFKShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectKindFKShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectKindFKFilter;


public interface ENServicesObjectKindFKController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesObjectKindFKController";

	/* ENServicesObjectKindFK. �������� */
	public int add(ENServicesObjectKindFK aENServicesObjectKindFK)
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� */
	public void save(ENServicesObjectKindFK aENServicesObjectKindFK)
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ */
	public ENServicesObjectKindFK getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ ������ */
	public ENServicesObjectKindFKShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ �� ������� */
	public ENServicesObjectKindFKShortList getFilteredList(
			ENServicesObjectKindFKFilter aENServicesObjectKindFKFilter)
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ ��� ��������� */
	public ENServicesObjectKindFKShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ ��� ��������� �� ������� */
	public ENServicesObjectKindFKShortList getScrollableFilteredList(
			ENServicesObjectKindFKFilter aENServicesObjectKindFKFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ ��� ��������� �� ������� */
	public ENServicesObjectKindFKShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesObjectKindFKFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesObjectKindFK. �������� ������ �� ������ */
	public ENServicesObjectKindFKShort getShortObject(int code)
			throws java.rmi.RemoteException;

}