
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPWI2Element;
 *
 */

import com.ksoe.energynet.valueobject.ENPWI2Element;
import com.ksoe.energynet.valueobject.brief.ENPWI2ElementShort;
import com.ksoe.energynet.valueobject.filter.ENPWI2ElementFilter;
import com.ksoe.energynet.valueobject.lists.ENPWI2ElementShortList;


public interface ENPWI2ElementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPWI2ElementController";

	/* ENPWI2Element. �������� */
	public int add(ENPWI2Element aENPWI2Element)
			throws java.rmi.RemoteException;

	/* ENPWI2Element. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� */
	public void save(ENPWI2Element aENPWI2Element)
			throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ */
	public ENPWI2Element getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ ������ */
	public ENPWI2ElementShortList getList()
			throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ �� ������� */
	public ENPWI2ElementShortList getFilteredList(
			ENPWI2ElementFilter aENPWI2ElementFilter)
			throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ ��� ��������� */
	public ENPWI2ElementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ ��� ��������� �� ������� */
	public ENPWI2ElementShortList getScrollableFilteredList(
			ENPWI2ElementFilter aENPWI2ElementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ ��� ��������� �� ������� */
	public ENPWI2ElementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPWI2ElementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPWI2Element. �������� ������ �� ������ */
	public ENPWI2ElementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}