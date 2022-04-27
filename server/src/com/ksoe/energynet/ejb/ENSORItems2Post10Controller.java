
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSORItems2Post10;
 *
 */

import com.ksoe.energynet.valueobject.ENSORItems2Post10;
import com.ksoe.energynet.valueobject.brief.ENSORItems2Post10Short;
import com.ksoe.energynet.valueobject.filter.ENSORItems2Post10Filter;
import com.ksoe.energynet.valueobject.lists.ENSORItems2Post10ShortList;


public interface ENSORItems2Post10Controller extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSORItems2Post10Controller";

	/* ENSORItems2Post10. �������� */
	public int add(ENSORItems2Post10 aENSORItems2Post10)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� */
	public void save(ENSORItems2Post10 aENSORItems2Post10)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ */
	public ENSORItems2Post10 getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ ������ */
	public ENSORItems2Post10ShortList getList()
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ �� ������� */
	public ENSORItems2Post10ShortList getFilteredList(
			ENSORItems2Post10Filter aENSORItems2Post10Filter)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ ��� ��������� */
	public ENSORItems2Post10ShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ ��� ��������� �� ������� */
	public ENSORItems2Post10ShortList getScrollableFilteredList(
			ENSORItems2Post10Filter aENSORItems2Post10Filter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ ��� ��������� �� ������� */
	public ENSORItems2Post10ShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSORItems2Post10Filter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSORItems2Post10. �������� ������ �� ������ */
	public ENSORItems2Post10Short getShortObject(int code)
			throws java.rmi.RemoteException;

}