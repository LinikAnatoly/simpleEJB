
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMolFuelMotion;
 *
 */

import com.ksoe.energynet.valueobject.ENMolFuelMotion;
import com.ksoe.energynet.valueobject.brief.ENMolFuelMotionShort;
import com.ksoe.energynet.valueobject.filter.ENMolFuelMotionFilter;
import com.ksoe.energynet.valueobject.lists.ENMolFuelMotionShortList;


public interface ENMolFuelMotionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMolFuelMotionController";

	/* ENMolFuelMotion. Добавить */
	public int add(ENMolFuelMotion aENMolFuelMotion)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Изменить */
	public void save(ENMolFuelMotion aENMolFuelMotion)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить объект */
	public ENMolFuelMotion getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить полный список */
	public ENMolFuelMotionShortList getList()
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить список по фильтру */
	public ENMolFuelMotionShortList getFilteredList(
			ENMolFuelMotionFilter aENMolFuelMotionFilter)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить список для просмотра */
	public ENMolFuelMotionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить список для просмотра по фильтру */
	public ENMolFuelMotionShortList getScrollableFilteredList(
			ENMolFuelMotionFilter aENMolFuelMotionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить список для просмотра по условию */
	public ENMolFuelMotionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENMolFuelMotionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMolFuelMotion. Получить объект из списка */
	public ENMolFuelMotionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}