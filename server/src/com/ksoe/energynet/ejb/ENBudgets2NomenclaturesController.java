
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBudgets2Nomenclatures;
 *
 */

import com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures;
import com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort;
import com.ksoe.energynet.valueobject.filter.ENBudgets2NomenclaturesFilter;
import com.ksoe.energynet.valueobject.lists.ENBudgets2NomenclaturesShortList;


public interface ENBudgets2NomenclaturesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBudgets2NomenclaturesController";

	/* ENBudgets2Nomenclatures. �������� */
	public int add(ENBudgets2Nomenclatures aENBudgets2Nomenclatures)
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� */
	public void save(ENBudgets2Nomenclatures aENBudgets2Nomenclatures)
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ */
	public ENBudgets2Nomenclatures getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ ������ */
	public ENBudgets2NomenclaturesShortList getList()
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ �� ������� */
	public ENBudgets2NomenclaturesShortList getFilteredList(
			ENBudgets2NomenclaturesFilter aENBudgets2NomenclaturesFilter)
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ ��� ��������� */
	public ENBudgets2NomenclaturesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ ��� ��������� �� ������� */
	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(
			ENBudgets2NomenclaturesFilter aENBudgets2NomenclaturesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ ��� ��������� �� ������� */
	public ENBudgets2NomenclaturesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBudgets2NomenclaturesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBudgets2Nomenclatures. �������� ������ �� ������ */
	public ENBudgets2NomenclaturesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}