
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;

/**
 * EJB Controller interface for ENActIncomeServices;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServicesShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeServicesShortList;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;


public interface ENActIncomeServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeServicesController";

	/* ENActIncomeServices. �������� */
	public int add(ENActIncomeServices aENActIncomeServices)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� */
	public void save(ENActIncomeServices aENActIncomeServices)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ */
	public ENActIncomeServices getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ ������ */
	public ENActIncomeServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ �� ������� */
	public ENActIncomeServicesShortList getFilteredList(
			ENActIncomeServicesFilter aENActIncomeServicesFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ ��� ��������� */
	public ENActIncomeServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeServicesShortList getScrollableFilteredList(
			ENActIncomeServicesFilter aENActIncomeServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeServices. �������� ������ �� ������ */
	public ENActIncomeServicesShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/** ENActIncomeServices. �������� ���� ���������� �� ���� ��������� ���� */
	public Date getDatePostingsByActIncomeServicesCode(int actIncomeServicesCode) throws java.rmi.RemoteException;


	/** �������� ������ �������� �� ��������� ���� */
	public FKProvObjectShortList getPostingsList(int actIncomeServicesCode) throws java.rmi.RemoteException;

	/** �������� ��������� ��� �� ��������� � ����������� ����� */
	public void removeActFromActIncomeServices(int actCode) throws java.rmi.RemoteException;
}