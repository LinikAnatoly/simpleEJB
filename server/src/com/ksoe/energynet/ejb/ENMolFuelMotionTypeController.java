
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMolFuelMotionType;
 *
 */

import com.ksoe.energynet.valueobject.ENMolFuelMotionType;
import com.ksoe.energynet.valueobject.brief.ENMolFuelMotionTypeShort;
import com.ksoe.energynet.valueobject.filter.ENMolFuelMotionTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMolFuelMotionTypeShortList;


public interface ENMolFuelMotionTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMolFuelMotionTypeController";

	/* ENMolFuelMotionType. Добавить */
	public int add(ENMolFuelMotionType aENMolFuelMotionType)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Изменить */
	public void save(ENMolFuelMotionType aENMolFuelMotionType)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить объект */
	public ENMolFuelMotionType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить полный список */
	public ENMolFuelMotionTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить список по фильтру */
	public ENMolFuelMotionTypeShortList getFilteredList(
			ENMolFuelMotionTypeFilter aENMolFuelMotionTypeFilter)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить список для просмотра */
	public ENMolFuelMotionTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить список для просмотра по фильтру */
	public ENMolFuelMotionTypeShortList getScrollableFilteredList(
			ENMolFuelMotionTypeFilter aENMolFuelMotionTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить список для просмотра по условию */
	public ENMolFuelMotionTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENMolFuelMotionTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotionType. Получить объект из списка */
	public ENMolFuelMotionTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}