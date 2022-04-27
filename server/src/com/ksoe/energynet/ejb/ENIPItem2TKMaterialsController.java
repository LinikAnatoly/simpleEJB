
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem2TKMaterials;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem2TKMaterials;
import com.ksoe.energynet.valueobject.lists.ENIPItem2TKMaterialsShortList;
import com.ksoe.energynet.valueobject.brief.ENIPItem2TKMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2TKMaterialsFilter;


public interface ENIPItem2TKMaterialsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItem2TKMaterialsController";

	/* ENIPItem2TKMaterials. Добавить */
	public int add(ENIPItem2TKMaterials aENIPItem2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Изменить */
	public void save(ENIPItem2TKMaterials aENIPItem2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить объект */
	public ENIPItem2TKMaterials getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить полный список */
	public ENIPItem2TKMaterialsShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить список по фильтру */
	public ENIPItem2TKMaterialsShortList getFilteredList(
			ENIPItem2TKMaterialsFilter aENIPItem2TKMaterialsFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить список для просмотра */
	public ENIPItem2TKMaterialsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить список для просмотра по фильтру */
	public ENIPItem2TKMaterialsShortList getScrollableFilteredList(
			ENIPItem2TKMaterialsFilter aENIPItem2TKMaterialsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить список для просмотра по условию */
	public ENIPItem2TKMaterialsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItem2TKMaterialsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem2TKMaterials. Получить объект из списка */
	public ENIPItem2TKMaterialsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}