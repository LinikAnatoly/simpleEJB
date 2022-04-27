
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActProj2OZ2;
 *
 */

import com.ksoe.energynet.valueobject.ENActProj2OZ2;
import com.ksoe.energynet.valueobject.brief.ENActProj2OZ2Short;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2Filter;
import com.ksoe.energynet.valueobject.lists.ENActProj2OZ2ShortList;


public interface ENActProj2OZ2Controller extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActProj2OZ2Controller";

	/* ENActProj2OZ2. �������� */
	public int add(ENActProj2OZ2 aENActProj2OZ2)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� */
	public void save(ENActProj2OZ2 aENActProj2OZ2)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ */
	public ENActProj2OZ2 getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ ������ */
	public ENActProj2OZ2ShortList getList()
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ �� ������� */
	public ENActProj2OZ2ShortList getFilteredList(
			ENActProj2OZ2Filter aENActProj2OZ2Filter)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ ��� ��������� */
	public ENActProj2OZ2ShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ ��� ��������� �� ������� */
	public ENActProj2OZ2ShortList getScrollableFilteredList(
			ENActProj2OZ2Filter aENActProj2OZ2Filter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ ��� ��������� �� ������� */
	public ENActProj2OZ2ShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActProj2OZ2Filter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2. �������� ������ �� ������ */
	public ENActProj2OZ2Short getShortObject(int code)
			throws java.rmi.RemoteException;

}