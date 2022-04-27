
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPriorityCoefficient;
 *
 */

import com.ksoe.energynet.valueobject.ENPriorityCoefficient;
import com.ksoe.energynet.valueobject.lists.ENPriorityCoefficientShortList;
import com.ksoe.energynet.valueobject.brief.ENPriorityCoefficientShort;
import com.ksoe.energynet.valueobject.filter.ENPriorityCoefficientFilter;


public interface ENPriorityCoefficientController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPriorityCoefficientController";

	/* ENPriorityCoefficient. Добавить */
	public int add(ENPriorityCoefficient aENPriorityCoefficient)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Изменить */
	public void save(ENPriorityCoefficient aENPriorityCoefficient)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить объект */
	public ENPriorityCoefficient getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить полный список */
	public ENPriorityCoefficientShortList getList()
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить список по фильтру */
	public ENPriorityCoefficientShortList getFilteredList(
			ENPriorityCoefficientFilter aENPriorityCoefficientFilter)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить список для просмотра */
	public ENPriorityCoefficientShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить список для просмотра по фильтру */
	public ENPriorityCoefficientShortList getScrollableFilteredList(
			ENPriorityCoefficientFilter aENPriorityCoefficientFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить список для просмотра по условию */
	public ENPriorityCoefficientShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPriorityCoefficientFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPriorityCoefficient. Получить объект из списка */
	public ENPriorityCoefficientShort getShortObject(int code)
			throws java.rmi.RemoteException;

}