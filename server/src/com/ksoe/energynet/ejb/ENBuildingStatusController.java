
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuildingStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENBuildingStatus;
import com.ksoe.energynet.valueobject.lists.ENBuildingStatusShortList;
import com.ksoe.energynet.valueobject.brief.ENBuildingStatusShort;
import com.ksoe.energynet.valueobject.filter.ENBuildingStatusFilter;


public interface ENBuildingStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuildingStatusController";

	/* ENBuildingStatus. Добавить */
	public int add(ENBuildingStatus aENBuildingStatus)
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuildingStatus. Изменить */
	public void save(ENBuildingStatus aENBuildingStatus)
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить объект */
	public ENBuildingStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить полный список */
	public ENBuildingStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить список по фильтру */
	public ENBuildingStatusShortList getFilteredList(
			ENBuildingStatusFilter aENBuildingStatusFilter)
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить список для просмотра */
	public ENBuildingStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить список для просмотра по фильтру */
	public ENBuildingStatusShortList getScrollableFilteredList(
			ENBuildingStatusFilter aENBuildingStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить список для просмотра по условию */
	public ENBuildingStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuildingStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuildingStatus. Получить объект из списка */
	public ENBuildingStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}