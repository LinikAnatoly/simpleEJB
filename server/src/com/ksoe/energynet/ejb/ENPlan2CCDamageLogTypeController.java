
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlan2CCDamageLogType;
 *
 */

import com.ksoe.energynet.valueobject.ENPlan2CCDamageLogType;
import com.ksoe.energynet.valueobject.brief.ENPlan2CCDamageLogTypeShort;
import com.ksoe.energynet.valueobject.filter.ENPlan2CCDamageLogTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlan2CCDamageLogTypeShortList;


public interface ENPlan2CCDamageLogTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlan2CCDamageLogTypeController";

	/* ENPlan2CCDamageLogType. Добавить */
	public int add(ENPlan2CCDamageLogType aENPlan2CCDamageLogType)
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Изменить */
	public void save(ENPlan2CCDamageLogType aENPlan2CCDamageLogType)
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить объект */
	public ENPlan2CCDamageLogType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить полный список */
	public ENPlan2CCDamageLogTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить список по фильтру */
	public ENPlan2CCDamageLogTypeShortList getFilteredList(
			ENPlan2CCDamageLogTypeFilter aENPlan2CCDamageLogTypeFilter)
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить список для просмотра */
	public ENPlan2CCDamageLogTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить список для просмотра по фильтру */
	public ENPlan2CCDamageLogTypeShortList getScrollableFilteredList(
			ENPlan2CCDamageLogTypeFilter aENPlan2CCDamageLogTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить список для просмотра по условию */
	public ENPlan2CCDamageLogTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlan2CCDamageLogTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlan2CCDamageLogType. Получить объект из списка */
	public ENPlan2CCDamageLogTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}