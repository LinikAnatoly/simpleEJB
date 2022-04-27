
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItemStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItemStatus;
import com.ksoe.energynet.valueobject.brief.ENIPItemStatusShort;
import com.ksoe.energynet.valueobject.filter.ENIPItemStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItemStatusShortList;


public interface ENIPItemStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItemStatusController";

	/* ENIPItemStatus. �������� */
	public int add(ENIPItemStatus aENIPItemStatus)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� */
	public void save(ENIPItemStatus aENIPItemStatus)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ */
	public ENIPItemStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ ������ */
	public ENIPItemStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ �� ������� */
	public ENIPItemStatusShortList getFilteredList(
			ENIPItemStatusFilter aENIPItemStatusFilter)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ ��� ��������� */
	public ENIPItemStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ ��� ��������� �� ������� */
	public ENIPItemStatusShortList getScrollableFilteredList(
			ENIPItemStatusFilter aENIPItemStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ ��� ��������� �� ������� */
	public ENIPItemStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPItemStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. �������� ������ �� ������ */
	public ENIPItemStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}