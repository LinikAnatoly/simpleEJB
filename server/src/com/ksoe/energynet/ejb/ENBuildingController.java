
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.lists.ENBuildingShortList;
import com.ksoe.energynet.valueobject.brief.ENBuildingShort;
import com.ksoe.energynet.valueobject.filter.ENBuildingFilter;


public interface ENBuildingController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuildingController";

	/* ENBuilding. �������� */
	public int add(ENBuilding aENBuilding)
			throws java.rmi.RemoteException;

	/* ENBuilding. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding. �������� */
	public void save(ENBuilding aENBuilding)
			throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ */
	public ENBuilding getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ ������ */
	public ENBuildingShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ �� ������� */
	public ENBuildingShortList getFilteredList(
			ENBuildingFilter aENBuildingFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ ��� ��������� */
	public ENBuildingShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ ��� ��������� �� ������� */
	public ENBuildingShortList getScrollableFilteredList(
			ENBuildingFilter aENBuildingFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ ��� ��������� �� ������� */
	public ENBuildingShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBuildingFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding. �������� ������ �� ������ */
	public ENBuildingShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	/*�������*/
	  public void createOZ(int ozCode)  throws java.rmi.RemoteException;
	  /*������� ���������*/
	  public void unCreateOZ(int ozCode)  throws java.rmi.RemoteException;
	  /*�������� �������� � ������ ������*/
	  public void moveToOS(int ozCode)  throws java.rmi.RemoteException; 
	  /*������� ���������� ��������� � �������� ������ */
	  public void unMoveToOS(int ozCode)  throws java.rmi.RemoteException;

}