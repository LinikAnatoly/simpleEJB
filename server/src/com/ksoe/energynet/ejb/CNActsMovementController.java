
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNActsMovement;
 *
 */

import com.ksoe.energynet.valueobject.CNActsMovement;
import com.ksoe.energynet.valueobject.brief.CNActsMovementShort;
import com.ksoe.energynet.valueobject.filter.CNActsMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNActsMovementShortList;


public interface CNActsMovementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNActsMovementController";

	/* CNActsMovement. Добавить */
	public int add(CNActsMovement aCNActsMovement)
			throws java.rmi.RemoteException;

	/* CNActsMovement. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNActsMovement. Изменить */
	public void save(CNActsMovement aCNActsMovement)
			throws java.rmi.RemoteException;

	/* CNActsMovement. Получить объект */
	public CNActsMovement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNActsMovement. Получить полный список */
	public CNActsMovementShortList getList()
			throws java.rmi.RemoteException;

	/* CNActsMovement. Получить список по фильтру */
	public CNActsMovementShortList getFilteredList(
			CNActsMovementFilter aCNActsMovementFilter)
			throws java.rmi.RemoteException;

	/* CNActsMovement. Получить список для просмотра */
	public CNActsMovementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsMovement. Получить список для просмотра по фильтру */
	public CNActsMovementShortList getScrollableFilteredList(
			CNActsMovementFilter aCNActsMovementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsMovement. Получить список для просмотра по условию */
	public CNActsMovementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNActsMovement. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			CNActsMovementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNActsMovement. Получить объект из списка */
	public CNActsMovementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}