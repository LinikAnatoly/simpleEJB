
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanProject;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanProject;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectFilter;


public interface ENPlanProjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanProjectController";

	/* ENPlanProject. �������� */
	public int add(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;
	
	

	/* ENPlanProject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanProject. �������� */
	public void save(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ */
	public ENPlanProject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ ������ */
	public ENPlanProjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ �� ������� */
	public ENPlanProjectShortList getFilteredList(
			ENPlanProjectFilter aENPlanProjectFilter)
			throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ ��� ��������� */
	public ENPlanProjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ ��� ��������� �� ������� */
	public ENPlanProjectShortList getScrollableFilteredList(
			ENPlanProjectFilter aENPlanProjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ ��� ��������� �� ������� */
	public ENPlanProjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanProjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanProject. �������� ������ �� ������ */
	public ENPlanProjectShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENPlanProject. ��������� ����� ��� ������� ����� */
	public int generateenplanprojecttemplate(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;
	
	public String generatecipher(ENPlanProject aENPlanProject) throws java.rmi.RemoteException;
	public String generateprojectname(ENPlanProject object ) throws java.rmi.RemoteException;

}