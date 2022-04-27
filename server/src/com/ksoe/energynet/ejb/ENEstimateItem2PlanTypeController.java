
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimateItem2PlanType;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimateItem2PlanType;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2PlanTypeShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2PlanTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2PlanTypeShortList;


public interface ENEstimateItem2PlanTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItem2PlanTypeController";

	/* ENEstimateItem2PlanType. Добавить */
	public int add(ENEstimateItem2PlanType aENEstimateItem2PlanType)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Изменить */
	public void save(ENEstimateItem2PlanType aENEstimateItem2PlanType)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить объект */
	public ENEstimateItem2PlanType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить полный список */
	public ENEstimateItem2PlanTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить список по фильтру */
	public ENEstimateItem2PlanTypeShortList getFilteredList(
			ENEstimateItem2PlanTypeFilter aENEstimateItem2PlanTypeFilter)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить список для просмотра */
	public ENEstimateItem2PlanTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить список для просмотра по фильтру */
	public ENEstimateItem2PlanTypeShortList getScrollableFilteredList(
			ENEstimateItem2PlanTypeFilter aENEstimateItem2PlanTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить список для просмотра по условию */
	public ENEstimateItem2PlanTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENEstimateItem2PlanTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2PlanType. Получить объект из списка */
	public ENEstimateItem2PlanTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}