
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesContragentType;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.lists.ENServicesContragentTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesContragentTypeShort;
import com.ksoe.energynet.valueobject.filter.ENServicesContragentTypeFilter;


public interface ENServicesContragentTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesContragentTypeController";

	/* ENServicesContragentType. �������� */
	public int add(ENServicesContragentType aENServicesContragentType)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� */
	public void save(ENServicesContragentType aENServicesContragentType)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ */
	public ENServicesContragentType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ ������ */
	public ENServicesContragentTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ �� ������� */
	public ENServicesContragentTypeShortList getFilteredList(
			ENServicesContragentTypeFilter aENServicesContragentTypeFilter)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ ��� ��������� */
	public ENServicesContragentTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ ��� ��������� �� ������� */
	public ENServicesContragentTypeShortList getScrollableFilteredList(
			ENServicesContragentTypeFilter aENServicesContragentTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ ��� ��������� �� ������� */
	public ENServicesContragentTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesContragentTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. �������� ������ �� ������ */
	public ENServicesContragentTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}