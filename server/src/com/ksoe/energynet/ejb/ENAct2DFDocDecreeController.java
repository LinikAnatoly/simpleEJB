
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2DFDocDecree;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2DFDocDecree;
import com.ksoe.energynet.valueobject.lists.ENAct2DFDocDecreeShortList;
import com.ksoe.energynet.valueobject.brief.ENAct2DFDocDecreeShort;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;


public interface ENAct2DFDocDecreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2DFDocDecreeController";

	/* ENAct2DFDocDecree. �������� */
	public int add(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� */
	public void save(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ */
	public ENAct2DFDocDecree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ ������ */
	public ENAct2DFDocDecreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ �� ������� */
	public ENAct2DFDocDecreeShortList getFilteredList(
			ENAct2DFDocDecreeFilter aENAct2DFDocDecreeFilter)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ ��� ��������� */
	public ENAct2DFDocDecreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ ��� ��������� �� ������� */
	public ENAct2DFDocDecreeShortList getScrollableFilteredList(
			ENAct2DFDocDecreeFilter aENAct2DFDocDecreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ ��� ��������� �� ������� */
	public ENAct2DFDocDecreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAct2DFDocDecreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. �������� ������ �� ������ */
	public ENAct2DFDocDecreeShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENAct2DFDocDecree. �������� ������������� � ������� �� ����������� �� �����*/
	public int addWithSetting(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;
	
	/* ENAct2DFDocDecree. �������  */
	public void removeByObj(ENAct2DFDocDecree aENAct2DFDocDecree) throws java.rmi.RemoteException;

}