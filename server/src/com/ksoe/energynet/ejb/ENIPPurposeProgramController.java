
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPPurposeProgram;
 *
 */

import com.ksoe.energynet.valueobject.ENIPPurposeProgram;
import com.ksoe.energynet.valueobject.brief.ENIPPurposeProgramShort;
import com.ksoe.energynet.valueobject.filter.ENIPPurposeProgramFilter;
import com.ksoe.energynet.valueobject.lists.ENIPPurposeProgramShortList;


public interface ENIPPurposeProgramController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPPurposeProgramController";

	/* ENIPPurposeProgram. �������� */
	public int add(ENIPPurposeProgram aENIPPurposeProgram)
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� */
	public void save(ENIPPurposeProgram aENIPPurposeProgram)
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ */
	public ENIPPurposeProgram getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ ������ */
	public ENIPPurposeProgramShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ �� ������� */
	public ENIPPurposeProgramShortList getFilteredList(
			ENIPPurposeProgramFilter aENIPPurposeProgramFilter)
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ ��� ��������� */
	public ENIPPurposeProgramShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ ��� ��������� �� ������� */
	public ENIPPurposeProgramShortList getScrollableFilteredList(
			ENIPPurposeProgramFilter aENIPPurposeProgramFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ ��� ��������� �� ������� */
	public ENIPPurposeProgramShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPPurposeProgramFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPPurposeProgram. �������� ������ �� ������ */
	public ENIPPurposeProgramShort getShortObject(int code)
			throws java.rmi.RemoteException;

}