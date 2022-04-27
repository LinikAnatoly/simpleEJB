
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOValues;
 *
 */

import com.ksoe.energynet.valueobject.ENSOValues;
import com.ksoe.energynet.valueobject.lists.ENSOValuesShortList;
import com.ksoe.energynet.valueobject.brief.ENSOValuesShort;
import com.ksoe.energynet.valueobject.filter.ENSOValuesFilter;


public interface ENSOValuesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOValuesController";

	/* ENSOValues. �������� */
	public int add(ENSOValues aENSOValues)
			throws java.rmi.RemoteException;

	/* ENSOValues. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOValues. �������� */
	public void save(ENSOValues aENSOValues)
			throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ */
	public ENSOValues getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ ������ */
	public ENSOValuesShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ �� ������� */
	public ENSOValuesShortList getFilteredList(
			ENSOValuesFilter aENSOValuesFilter)
			throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ ��� ��������� */
	public ENSOValuesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesShortList getScrollableFilteredList(
			ENSOValuesFilter aENSOValuesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOValuesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOValues. �������� ������ �� ������ */
	public ENSOValuesShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public ENSOValues getENSOValueForServicesObject(int servicesObjectCode, int soValuesTypeCode) 
			throws java.rmi.RemoteException;

}