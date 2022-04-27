
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem2ENIPItem;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ENIPItemShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ENIPItemShortList;


public interface ENIPItem2ENIPItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItem2ENIPItemController";

	/* ENIPItem2ENIPItem. �������� */
	public int add(ENIPItem2ENIPItem aENIPItem2ENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� */
	public void save(ENIPItem2ENIPItem aENIPItem2ENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ */
	public ENIPItem2ENIPItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ ������ */
	public ENIPItem2ENIPItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ �� ������� */
	public ENIPItem2ENIPItemShortList getFilteredList(
			ENIPItem2ENIPItemFilter aENIPItem2ENIPItemFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ ��� ��������� */
	public ENIPItem2ENIPItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ ��� ��������� �� ������� */
	public ENIPItem2ENIPItemShortList getScrollableFilteredList(
			ENIPItem2ENIPItemFilter aENIPItem2ENIPItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ ��� ��������� �� ������� */
	public ENIPItem2ENIPItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPItem2ENIPItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. �������� ������ �� ������ */
	public ENIPItem2ENIPItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}