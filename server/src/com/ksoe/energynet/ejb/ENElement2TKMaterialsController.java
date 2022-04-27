
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2TKMaterials;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2TKMaterials;
import com.ksoe.energynet.valueobject.brief.ENElement2TKMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENElement2TKMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENElement2TKMaterialsShortList;


public interface ENElement2TKMaterialsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2TKMaterialsController";

	/* ENElement2TKMaterials. Добавить */
	public int add(ENElement2TKMaterials aENElement2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Изменить */
	public void save(ENElement2TKMaterials aENElement2TKMaterials)
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить объект */
	public ENElement2TKMaterials getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить полный список */
	public ENElement2TKMaterialsShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить список по фильтру */
	public ENElement2TKMaterialsShortList getFilteredList(
			ENElement2TKMaterialsFilter aENElement2TKMaterialsFilter)
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить список для просмотра */
	public ENElement2TKMaterialsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить список для просмотра по фильтру */
	public ENElement2TKMaterialsShortList getScrollableFilteredList(
			ENElement2TKMaterialsFilter aENElement2TKMaterialsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить список для просмотра по условию */
	public ENElement2TKMaterialsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENElement2TKMaterialsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2TKMaterials. Получить объект из списка */
	public ENElement2TKMaterialsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}