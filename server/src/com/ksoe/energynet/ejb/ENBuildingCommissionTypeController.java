
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuildingCommissionType;
 *
 */

import com.ksoe.energynet.valueobject.ENBuildingCommissionType;
import com.ksoe.energynet.valueobject.lists.ENBuildingCommissionTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENBuildingCommissionTypeShort;
import com.ksoe.energynet.valueobject.filter.ENBuildingCommissionTypeFilter;


public interface ENBuildingCommissionTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuildingCommissionTypeController";

	/* ENBuildingCommissionType. Добавить */
	public int add(ENBuildingCommissionType aENBuildingCommissionType)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Изменить */
	public void save(ENBuildingCommissionType aENBuildingCommissionType)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить объект */
	public ENBuildingCommissionType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить полный список */
	public ENBuildingCommissionTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить список по фильтру */
	public ENBuildingCommissionTypeShortList getFilteredList(
			ENBuildingCommissionTypeFilter aENBuildingCommissionTypeFilter)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить список для просмотра */
	public ENBuildingCommissionTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить список для просмотра по фильтру */
	public ENBuildingCommissionTypeShortList getScrollableFilteredList(
			ENBuildingCommissionTypeFilter aENBuildingCommissionTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить список для просмотра по условию */
	public ENBuildingCommissionTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuildingCommissionTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuildingCommissionType. Получить объект из списка */
	public ENBuildingCommissionTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}