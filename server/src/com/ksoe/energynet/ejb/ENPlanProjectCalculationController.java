
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanProjectCalculation;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanProjectCalculation;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectCalculationShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectCalculationShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectCalculationFilter;


public interface ENPlanProjectCalculationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanProjectCalculationController";

	/* ENPlanProjectCalculation. �������� */
	public int add(ENPlanProjectCalculation aENPlanProjectCalculation)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� */
	public void save(ENPlanProjectCalculation aENPlanProjectCalculation)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ */
	public ENPlanProjectCalculation getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ ������ */
	public ENPlanProjectCalculationShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ �� ������� */
	public ENPlanProjectCalculationShortList getFilteredList(
			ENPlanProjectCalculationFilter aENPlanProjectCalculationFilter)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ ��� ��������� */
	public ENPlanProjectCalculationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ ��� ��������� �� ������� */
	public ENPlanProjectCalculationShortList getScrollableFilteredList(
			ENPlanProjectCalculationFilter aENPlanProjectCalculationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ ��� ��������� �� ������� */
	public ENPlanProjectCalculationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanProjectCalculationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. �������� ������ �� ������ */
	public ENPlanProjectCalculationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}