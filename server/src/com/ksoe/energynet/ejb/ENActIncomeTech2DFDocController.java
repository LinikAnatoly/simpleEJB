
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomeTech2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeTech2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENActIncomeTech2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomeTech2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTech2DFDocFilter;


public interface ENActIncomeTech2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeTech2DFDocController";

	/* ENActIncomeTech2DFDoc. �������� */
	public int add(ENActIncomeTech2DFDoc aENActIncomeTech2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� */
	public void save(ENActIncomeTech2DFDoc aENActIncomeTech2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ */
	public ENActIncomeTech2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ ������ */
	public ENActIncomeTech2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ �� ������� */
	public ENActIncomeTech2DFDocShortList getFilteredList(
			ENActIncomeTech2DFDocFilter aENActIncomeTech2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ ��� ��������� */
	public ENActIncomeTech2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeTech2DFDocShortList getScrollableFilteredList(
			ENActIncomeTech2DFDocFilter aENActIncomeTech2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeTech2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeTech2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeTech2DFDoc. �������� ������ �� ������ */
	public ENActIncomeTech2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}