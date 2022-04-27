
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealType;
 *
 */

import com.ksoe.energynet.valueobject.SCSealType;
import com.ksoe.energynet.valueobject.brief.SCSealTypeShort;
import com.ksoe.energynet.valueobject.filter.SCSealTypeFilter;
import com.ksoe.energynet.valueobject.lists.SCSealTypeShortList;


public interface SCSealTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealTypeController";

	/* SCSealType. �������� */
	public int add(SCSealType aSCSealType)
			throws java.rmi.RemoteException;

	/* SCSealType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealType. �������� */
	public void save(SCSealType aSCSealType)
			throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ */
	public SCSealType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ ������ */
	public SCSealTypeShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ �� ������� */
	public SCSealTypeShortList getFilteredList(
			SCSealTypeFilter aSCSealTypeFilter)
			throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ ��� ��������� */
	public SCSealTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ ��� ��������� �� ������� */
	public SCSealTypeShortList getScrollableFilteredList(
			SCSealTypeFilter aSCSealTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ ��� ��������� �� ������� */
	public SCSealTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			SCSealTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealType. �������� ������ �� ������ */
	public SCSealTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}