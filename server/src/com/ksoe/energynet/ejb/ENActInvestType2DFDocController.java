
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActInvestType2DFDoc;
 *
 */

import com.ksoe.energynet.valueobject.ENActInvestType2DFDoc;
import com.ksoe.energynet.valueobject.lists.ENActInvestType2DFDocShortList;
import com.ksoe.energynet.valueobject.brief.ENActInvestType2DFDocShort;
import com.ksoe.energynet.valueobject.filter.ENActInvestType2DFDocFilter;


public interface ENActInvestType2DFDocController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActInvestType2DFDocController";

	/* ENActInvestType2DFDoc. �������� */
	public int add(ENActInvestType2DFDoc aENActInvestType2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� */
	public void save(ENActInvestType2DFDoc aENActInvestType2DFDoc)
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ */
	public ENActInvestType2DFDoc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ ������ */
	public ENActInvestType2DFDocShortList getList()
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ �� ������� */
	public ENActInvestType2DFDocShortList getFilteredList(
			ENActInvestType2DFDocFilter aENActInvestType2DFDocFilter)
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ ��� ��������� */
	public ENActInvestType2DFDocShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ ��� ��������� �� ������� */
	public ENActInvestType2DFDocShortList getScrollableFilteredList(
			ENActInvestType2DFDocFilter aENActInvestType2DFDocFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ ��� ��������� �� ������� */
	public ENActInvestType2DFDocShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActInvestType2DFDocFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActInvestType2DFDoc. �������� ������ �� ������ */
	public ENActInvestType2DFDocShort getShortObject(int code)
			throws java.rmi.RemoteException;

}