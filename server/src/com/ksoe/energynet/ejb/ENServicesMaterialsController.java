
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesMaterials;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.lists.ENServicesMaterialsShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENServicesMaterialsFilter;


public interface ENServicesMaterialsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesMaterialsController";

	/* ENServicesMaterials. �������� */
	public int add(ENServicesMaterials aENServicesMaterials)
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� */
	public void save(ENServicesMaterials aENServicesMaterials)
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ */
	public ENServicesMaterials getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ ������ */
	public ENServicesMaterialsShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ �� ������� */
	public ENServicesMaterialsShortList getFilteredList(
			ENServicesMaterialsFilter aENServicesMaterialsFilter)
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ ��� ��������� */
	public ENServicesMaterialsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ ��� ��������� �� ������� */
	public ENServicesMaterialsShortList getScrollableFilteredList(
			ENServicesMaterialsFilter aENServicesMaterialsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ ��� ��������� �� ������� */
	public ENServicesMaterialsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesMaterialsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesMaterials. �������� ������ �� ������ */
	public ENServicesMaterialsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}