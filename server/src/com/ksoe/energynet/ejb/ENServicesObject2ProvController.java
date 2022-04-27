
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesObject2Prov;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2ProvShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2ProvFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2ProvShortList;


public interface ENServicesObject2ProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesObject2ProvController";

	/* ENServicesObject2Prov. �������� */
	public int add(ENServicesObject2Prov aENServicesObject2Prov)
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� */
	public void save(ENServicesObject2Prov aENServicesObject2Prov)
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ */
	public ENServicesObject2Prov getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ ������ */
	public ENServicesObject2ProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ �� ������� */
	public ENServicesObject2ProvShortList getFilteredList(
			ENServicesObject2ProvFilter aENServicesObject2ProvFilter)
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ ��� ��������� */
	public ENServicesObject2ProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ ��� ��������� �� ������� */
	public ENServicesObject2ProvShortList getScrollableFilteredList(
			ENServicesObject2ProvFilter aENServicesObject2ProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ ��� ��������� �� ������� */
	public ENServicesObject2ProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesObject2ProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesObject2Prov. �������� ������ �� ������ */
	public ENServicesObject2ProvShort getShortObject(int code)
			throws java.rmi.RemoteException;

}