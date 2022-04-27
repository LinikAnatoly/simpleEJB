
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesDelivery;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesDelivery;
import com.ksoe.energynet.valueobject.lists.ENServicesDeliveryShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesDeliveryShort;
import com.ksoe.energynet.valueobject.filter.ENServicesDeliveryFilter;


public interface ENServicesDeliveryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesDeliveryController";

	/* ENServicesDelivery. �������� */
	public int add(ENServicesDelivery aENServicesDelivery)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� */
	public void save(ENServicesDelivery aENServicesDelivery)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ */
	public ENServicesDelivery getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ ������ */
	public ENServicesDeliveryShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ �� ������� */
	public ENServicesDeliveryShortList getFilteredList(
			ENServicesDeliveryFilter aENServicesDeliveryFilter)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ ��� ��������� */
	public ENServicesDeliveryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ ��� ��������� �� ������� */
	public ENServicesDeliveryShortList getScrollableFilteredList(
			ENServicesDeliveryFilter aENServicesDeliveryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ ��� ��������� �� ������� */
	public ENServicesDeliveryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesDeliveryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesDelivery. �������� ������ �� ������ */
	public ENServicesDeliveryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}