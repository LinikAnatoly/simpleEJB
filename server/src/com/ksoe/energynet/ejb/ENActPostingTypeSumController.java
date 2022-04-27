
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingTypeSum;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingTypeSum;
import com.ksoe.energynet.valueobject.lists.ENActPostingTypeSumShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingTypeSumShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingTypeSumFilter;


public interface ENActPostingTypeSumController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingTypeSumController";

	/* ENActPostingTypeSum. �������� */
	public int add(ENActPostingTypeSum aENActPostingTypeSum)
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� */
	public void save(ENActPostingTypeSum aENActPostingTypeSum)
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ */
	public ENActPostingTypeSum getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ ������ */
	public ENActPostingTypeSumShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ �� ������� */
	public ENActPostingTypeSumShortList getFilteredList(
			ENActPostingTypeSumFilter aENActPostingTypeSumFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ ��� ��������� */
	public ENActPostingTypeSumShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ ��� ��������� �� ������� */
	public ENActPostingTypeSumShortList getScrollableFilteredList(
			ENActPostingTypeSumFilter aENActPostingTypeSumFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ ��� ��������� �� ������� */
	public ENActPostingTypeSumShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingTypeSumFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingTypeSum. �������� ������ �� ������ */
	public ENActPostingTypeSumShort getShortObject(int code)
			throws java.rmi.RemoteException;

}