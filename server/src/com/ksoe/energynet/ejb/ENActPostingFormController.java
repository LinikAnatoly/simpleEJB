
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingForm;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingForm;
import com.ksoe.energynet.valueobject.lists.ENActPostingFormShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingFormShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingFormFilter;


public interface ENActPostingFormController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingFormController";

	/* ENActPostingForm. �������� */
	public int add(ENActPostingForm aENActPostingForm)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� */
	public void save(ENActPostingForm aENActPostingForm)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ */
	public ENActPostingForm getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ ������ */
	public ENActPostingFormShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ �� ������� */
	public ENActPostingFormShortList getFilteredList(
			ENActPostingFormFilter aENActPostingFormFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ ��� ��������� */
	public ENActPostingFormShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ ��� ��������� �� ������� */
	public ENActPostingFormShortList getScrollableFilteredList(
			ENActPostingFormFilter aENActPostingFormFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ ��� ��������� �� ������� */
	public ENActPostingFormShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingFormFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. �������� ������ �� ������ */
	public ENActPostingFormShort getShortObject(int code)
			throws java.rmi.RemoteException;

}