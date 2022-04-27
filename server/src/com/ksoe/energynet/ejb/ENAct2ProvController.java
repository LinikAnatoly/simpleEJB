
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2Prov;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.valueobject.brief.ENAct2ProvShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;


public interface ENAct2ProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2ProvController";

	/* ENAct2Prov. �������� */
	public int add(ENAct2Prov aENAct2Prov)
			throws java.rmi.RemoteException;

	/* ENAct2Prov. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2Prov. �v������� */
	public void save(ENAct2Prov aENAct2Prov)
			throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ */
	public ENAct2Prov getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ ������ */
	public ENAct2ProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ �� ������� */
	public ENAct2ProvShortList getFilteredList(
			ENAct2ProvFilter aENAct2ProvFilter)
			throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ ��� ��������� */
	public ENAct2ProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ ��� ��������� �� ������� */
	public ENAct2ProvShortList getScrollableFilteredList(
			ENAct2ProvFilter aENAct2ProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ ��� ��������� �� ������� */
	public ENAct2ProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAct2ProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2Prov. �������� ������ �� ������ */
	public ENAct2ProvShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	/* ENAct2Prov. �v������� ������ �������� ��������*/
	public void savePostingInfo(ENAct2Prov aENAct2Prov)
			throws java.rmi.RemoteException;

}