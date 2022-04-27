
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTravelSheetFuel2FINMaterials;
 *
 */

import com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuel2FINMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuel2FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuel2FINMaterialsShortList;


public interface ENTravelSheetFuel2FINMaterialsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuel2FINMaterialsController";

	/* ENTravelSheetFuel2FINMaterials. �������� */
	public int add(ENTravelSheetFuel2FINMaterials aENTravelSheetFuel2FINMaterials)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� */
	public void save(ENTravelSheetFuel2FINMaterials aENTravelSheetFuel2FINMaterials)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ */
	public ENTravelSheetFuel2FINMaterials getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ ������ */
	public ENTravelSheetFuel2FINMaterialsShortList getList()
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ �� ������� */
	public ENTravelSheetFuel2FINMaterialsShortList getFilteredList(
			ENTravelSheetFuel2FINMaterialsFilter aENTravelSheetFuel2FINMaterialsFilter)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ ��� ��������� */
	public ENTravelSheetFuel2FINMaterialsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(
			ENTravelSheetFuel2FINMaterialsFilter aENTravelSheetFuel2FINMaterialsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ ��� ��������� �� ������� */
	public ENTravelSheetFuel2FINMaterialsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTravelSheetFuel2FINMaterialsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuel2FINMaterials. �������� ������ �� ������ */
	public ENTravelSheetFuel2FINMaterialsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}