
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOProj2SOConn;
 *
 */

import com.ksoe.energynet.valueobject.ENSOProj2SOConn;
import com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort;
import com.ksoe.energynet.valueobject.filter.ENSOProj2SOConnFilter;
import com.ksoe.energynet.valueobject.lists.ENSOProj2SOConnShortList;


public interface ENSOProj2SOConnController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOProj2SOConnController";

	/* ENSOProj2SOConn. �������� */
	public int add(ENSOProj2SOConn aENSOProj2SOConn)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� */
	public void save(ENSOProj2SOConn aENSOProj2SOConn)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ */
	public ENSOProj2SOConn getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ ������ */
	public ENSOProj2SOConnShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ �� ������� */
	public ENSOProj2SOConnShortList getFilteredList(
			ENSOProj2SOConnFilter aENSOProj2SOConnFilter)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ ��� ��������� */
	public ENSOProj2SOConnShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ ��� ��������� �� ������� */
	public ENSOProj2SOConnShortList getScrollableFilteredList(
			ENSOProj2SOConnFilter aENSOProj2SOConnFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ ��� ��������� �� ������� */
	public ENSOProj2SOConnShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOProj2SOConnFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. �������� ������ �� ������ */
	public ENSOProj2SOConnShort getShortObject(int code)
			throws java.rmi.RemoteException;

}