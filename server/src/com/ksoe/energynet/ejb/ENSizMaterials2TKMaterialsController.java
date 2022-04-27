
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSizMaterials2TKMaterials;
 *
 */

import com.ksoe.energynet.valueobject.ENSizMaterials2TKMaterials;
import com.ksoe.energynet.valueobject.lists.ENSizMaterials2TKMaterialsShortList;
import com.ksoe.energynet.valueobject.brief.ENSizMaterials2TKMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENSizMaterials2TKMaterialsFilter;


public interface ENSizMaterials2TKMaterialsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSizMaterials2TKMaterialsController";

	/* ENSizMaterials2TKMaterials. �������� */
	public int add(ENSizMaterials2TKMaterials aENSizMaterials2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� */
	public void save(ENSizMaterials2TKMaterials aENSizMaterials2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ */
	public ENSizMaterials2TKMaterials getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ ������ */
	public ENSizMaterials2TKMaterialsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ �� ������� */
	public ENSizMaterials2TKMaterialsShortList getFilteredList(
			ENSizMaterials2TKMaterialsFilter aENSizMaterials2TKMaterialsFilter)
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ ��� ��������� */
	public ENSizMaterials2TKMaterialsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ ��� ��������� �� ������� */
	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(
			ENSizMaterials2TKMaterialsFilter aENSizMaterials2TKMaterialsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ ��� ��������� �� ������� */
	public ENSizMaterials2TKMaterialsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSizMaterials2TKMaterialsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSizMaterials2TKMaterials. �������� ������ �� ������ */
	public ENSizMaterials2TKMaterialsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}