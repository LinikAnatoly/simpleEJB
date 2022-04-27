
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.brief.ENIPItemShort;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;


public interface ENIPItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItemController";

	/* ENIPItem. �������� */
	public int add(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem. �������� */
	public void save(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ */
	public ENIPItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ ������ */
	public ENIPItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ �� ������� */
	public ENIPItemShortList getFilteredList(
			ENIPItemFilter aENIPItemFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ ��� ��������� */
	public ENIPItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ ��� ��������� �� ������� */
	public ENIPItemShortList getScrollableFilteredList(
			ENIPItemFilter aENIPItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ ��� ��������� �� ������� */
	public ENIPItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem. �������� ������ �� ������ */
	public ENIPItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	/* ENIPItem. �������� ����� ��� ��������������*/
	public void saveSumInside(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	
	/* ENIPItem. �������� ���������� �� ������ */
	public void saveinfoTenders(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;
}