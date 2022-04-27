
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOValuesTypeCategory;
 *
 */

import com.ksoe.energynet.valueobject.ENSOValuesTypeCategory;
import com.ksoe.energynet.valueobject.lists.ENSOValuesTypeCategoryShortList;
import com.ksoe.energynet.valueobject.brief.ENSOValuesTypeCategoryShort;
import com.ksoe.energynet.valueobject.filter.ENSOValuesTypeCategoryFilter;


public interface ENSOValuesTypeCategoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOValuesTypeCategoryController";

	/* ENSOValuesTypeCategory. �������� */
	public int add(ENSOValuesTypeCategory aENSOValuesTypeCategory)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� */
	public void save(ENSOValuesTypeCategory aENSOValuesTypeCategory)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ */
	public ENSOValuesTypeCategory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ ������ */
	public ENSOValuesTypeCategoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ �� ������� */
	public ENSOValuesTypeCategoryShortList getFilteredList(
			ENSOValuesTypeCategoryFilter aENSOValuesTypeCategoryFilter)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ ��� ��������� */
	public ENSOValuesTypeCategoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesTypeCategoryShortList getScrollableFilteredList(
			ENSOValuesTypeCategoryFilter aENSOValuesTypeCategoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesTypeCategoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOValuesTypeCategoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. �������� ������ �� ������ */
	public ENSOValuesTypeCategoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}