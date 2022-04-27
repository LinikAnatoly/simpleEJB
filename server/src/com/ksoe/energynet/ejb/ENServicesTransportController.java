
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesTransport;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.lists.ENServicesTransportShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesTransportShort;
import com.ksoe.energynet.valueobject.filter.ENServicesTransportFilter;


public interface ENServicesTransportController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesTransportController";

	/* ENServicesTransport. �������� */
	public int add(ENServicesTransport aENServicesTransport)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� */
	public void save(ENServicesTransport aENServicesTransport)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ */
	public ENServicesTransport getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ ������ */
	public ENServicesTransportShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ �� ������� */
	public ENServicesTransportShortList getFilteredList(
			ENServicesTransportFilter aENServicesTransportFilter)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ ��� ��������� */
	public ENServicesTransportShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ ��� ��������� �� ������� */
	public ENServicesTransportShortList getScrollableFilteredList(
			ENServicesTransportFilter aENServicesTransportFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ ��� ��������� �� ������� */
	public ENServicesTransportShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesTransportFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesTransport. �������� ������ �� ������ */
	public ENServicesTransportShort getShortObject(int code)
			throws java.rmi.RemoteException;

}