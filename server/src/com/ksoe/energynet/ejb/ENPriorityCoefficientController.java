
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPriorityCoefficient;
 *
 */

import com.ksoe.energynet.valueobject.ENPriorityCoefficient;
import com.ksoe.energynet.valueobject.lists.ENPriorityCoefficientShortList;
import com.ksoe.energynet.valueobject.brief.ENPriorityCoefficientShort;
import com.ksoe.energynet.valueobject.filter.ENPriorityCoefficientFilter;


public interface ENPriorityCoefficientController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPriorityCoefficientController";

	/* ENPriorityCoefficient. �������� */
	public int add(ENPriorityCoefficient aENPriorityCoefficient)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� */
	public void save(ENPriorityCoefficient aENPriorityCoefficient)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ */
	public ENPriorityCoefficient getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ ������ */
	public ENPriorityCoefficientShortList getList()
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ �� ������� */
	public ENPriorityCoefficientShortList getFilteredList(
			ENPriorityCoefficientFilter aENPriorityCoefficientFilter)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ ��� ��������� */
	public ENPriorityCoefficientShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ ��� ��������� �� ������� */
	public ENPriorityCoefficientShortList getScrollableFilteredList(
			ENPriorityCoefficientFilter aENPriorityCoefficientFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ ��� ��������� �� ������� */
	public ENPriorityCoefficientShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPriorityCoefficientFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. �������� ������ �� ������ */
	public ENPriorityCoefficientShort getShortObject(int code)
			throws java.rmi.RemoteException;

}