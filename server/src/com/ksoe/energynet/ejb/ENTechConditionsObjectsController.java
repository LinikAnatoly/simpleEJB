
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;

public interface ENTechConditionsObjectsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsObjectsController";

	/* ENTechConditionsObjects. �������� */
	public int add(ENTechConditionsObjects aENTechConditionsObjects) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� */
	public void save(ENTechConditionsObjects aENTechConditionsObjects) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ */
	public ENTechConditionsObjects getObject(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ ������ */
	public ENTechConditionsObjectsShortList getList() throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ �� ������� */
	public ENTechConditionsObjectsShortList getFilteredList(
			ENTechConditionsObjectsFilter aENTechConditionsObjectsFilter) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ ��� ��������� */
	public ENTechConditionsObjectsShortList getScrollableList(int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ ��� ��������� �� ������� */
	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjectsFilter aEPActFilter,
			int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ ��� ��������� �� ������� */
	public ENTechConditionsObjectsShortList getScrollableListByCondition(String aCondition, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(ENTechConditionsObjectsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. ��������� ������������� */
	public void generateIdentNumber(int code) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. ������ ������������� */
	public void resetIdentNumber(int code) throws java.rmi.RemoteException;


    /**
     * �������� ������ ���.������� ��� �����
     *
     * @param ENTechConditionsObjectsFilter
     * @return ENTechConditionsObjectsShortList
     */
	public ENTechConditionsObjectsShortList getPublicListTechConditions(ENTechConditionsObjectsFilter filterObject) throws java.rmi.RemoteException;


}