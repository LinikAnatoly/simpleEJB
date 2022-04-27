
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;

public interface ENRecordPointBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRecordPointBytController";

	/* ENRecordPointByt. �������� */
	public int add(ENRecordPointByt aENRecordPointByt) throws java.rmi.RemoteException;

	/* ENRecordPointByt. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� */
	public void save(ENRecordPointByt aENRecordPointByt) throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ */
	public ENRecordPointByt getObject(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ ������ */
	public ENRecordPointBytShortList getList() throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ �� ������� */
	public ENRecordPointBytShortList getFilteredList(ENRecordPointBytFilter aENRecordPointBytFilter)
			throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ ��� ��������� */
	public ENRecordPointBytShortList getScrollableList(int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ ��� ��������� �� ������� */
	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointBytFilter aEPActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRecordPointByt. �������� ������ ��� ��������� �� ������� */
	public ENRecordPointBytShortList getScrollableListByCondition(String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	public ENRecordPointByt getObjectNoSegr(int code) throws java.rmi.RemoteException;

	/** ENRecordPointByt. �������� ������� ENRecordPointByt... */
	public boolean checkRecordPointByt(int elementCode) throws java.rmi.RemoteException;
	
	public String getPersonalAccountUidByCode(int code, int departmentCode) throws java.rmi.RemoteException;

}