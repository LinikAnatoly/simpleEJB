
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanWork2ActFailure;
 *
 */

import com.ksoe.energynet.valueobject.ENActFailure;
import com.ksoe.energynet.valueobject.ENPlanWork2ActFailure;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ActFailureShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ActFailureFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ActFailureShortList;


public interface ENPlanWork2ActFailureController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2ActFailureController";

	/* ENPlanWork2ActFailure. �������� */
	public int add(ENPlanWork2ActFailure aENPlanWork2ActFailure)
			throws java.rmi.RemoteException;
	
	/* ENPlanWork2ActFailure. �������� */
	public int add(ENPlanWork2ActFailure aENPlanWork2ActFailure, ENActFailure aENActFailure)
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� */
	public void save(ENPlanWork2ActFailure aENPlanWork2ActFailure)
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� */
	public void save(ENPlanWork2ActFailure aENPlanWork2ActFailure, ENActFailure aENActFailure)
			throws java.rmi.RemoteException;
	
	/* ENPlanWork2ActFailure. �������� ������ */
	public ENPlanWork2ActFailure getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ ������ */
	public ENPlanWork2ActFailureShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ �� ������� */
	public ENPlanWork2ActFailureShortList getFilteredList(
			ENPlanWork2ActFailureFilter aENPlanWork2ActFailureFilter)
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ ��� ��������� */
	public ENPlanWork2ActFailureShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2ActFailureShortList getScrollableFilteredList(
			ENPlanWork2ActFailureFilter aENPlanWork2ActFailureFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2ActFailureShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanWork2ActFailureFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanWork2ActFailure. �������� ������ �� ������ */
	public ENPlanWork2ActFailureShort getShortObject(int code)
			throws java.rmi.RemoteException;

}