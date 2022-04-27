
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOContract;
 *
 */

import com.ksoe.energynet.valueobject.ENSOContract;
import com.ksoe.energynet.valueobject.lists.ENSOContractShortList;
import com.ksoe.energynet.valueobject.brief.ENSOContractShort;
import com.ksoe.energynet.valueobject.filter.ENSOContractFilter;


public interface ENSOContractController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOContractController";

	/* ENSOContract. �������� */
	public int add(ENSOContract aENSOContract)
			throws java.rmi.RemoteException;

	/* ENSOContract. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOContract. �������� */
	public void save(ENSOContract aENSOContract)
			throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ */
	public ENSOContract getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ ������ */
	public ENSOContractShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ �� ������� */
	public ENSOContractShortList getFilteredList(
			ENSOContractFilter aENSOContractFilter)
			throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ ��� ��������� */
	public ENSOContractShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ ��� ��������� �� ������� */
	public ENSOContractShortList getScrollableFilteredList(
			ENSOContractFilter aENSOContractFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ ��� ��������� �� ������� */
	public ENSOContractShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOContractFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOContract. �������� ������ �� ������ */
	public ENSOContractShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/*�������� ������� �� ENPlanWork ( ���� �� ���.���.: servicesFSideFinId, servicesFSideCnNum) �� ���������: 
		  - �������� ����
		  - ������� �� ������� */
	public void addFinDocIdFromENPlanWork(int servicesConnectionCode, int enServicesConnectionElementCode, 
			int codeEnTechConditionsServices) throws java.rmi.RemoteException;

}