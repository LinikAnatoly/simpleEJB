
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENNecessityBuilding;
 *
 */

import com.ksoe.energynet.valueobject.ENNecessityBuilding;
import com.ksoe.energynet.valueobject.lists.ENNecessityBuildingShortList;
import com.ksoe.energynet.valueobject.brief.ENNecessityBuildingShort;
import com.ksoe.energynet.valueobject.filter.ENNecessityBuildingFilter;


public interface ENNecessityBuildingController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENNecessityBuildingController";

	/* ENNecessityBuilding. Добавить */
	public int add(ENNecessityBuilding aENNecessityBuilding)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Изменить */
	public void save(ENNecessityBuilding aENNecessityBuilding)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить объект */
	public ENNecessityBuilding getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить полный список */
	public ENNecessityBuildingShortList getList()
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить список по фильтру */
	public ENNecessityBuildingShortList getFilteredList(
			ENNecessityBuildingFilter aENNecessityBuildingFilter)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить список для просмотра */
	public ENNecessityBuildingShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить список для просмотра по фильтру */
	public ENNecessityBuildingShortList getScrollableFilteredList(
			ENNecessityBuildingFilter aENNecessityBuildingFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить список для просмотра по условию */
	public ENNecessityBuildingShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENNecessityBuildingFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENNecessityBuilding. Получить объект из списка */
	public ENNecessityBuildingShort getShortObject(int code)
			throws java.rmi.RemoteException;

}