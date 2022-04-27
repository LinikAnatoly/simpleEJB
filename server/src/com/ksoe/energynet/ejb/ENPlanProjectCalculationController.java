
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanProjectCalculation;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanProjectCalculation;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectCalculationShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectCalculationShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectCalculationFilter;


public interface ENPlanProjectCalculationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanProjectCalculationController";

	/* ENPlanProjectCalculation. Добавить */
	public int add(ENPlanProjectCalculation aENPlanProjectCalculation)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Изменить */
	public void save(ENPlanProjectCalculation aENPlanProjectCalculation)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить объект */
	public ENPlanProjectCalculation getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить полный список */
	public ENPlanProjectCalculationShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить список по фильтру */
	public ENPlanProjectCalculationShortList getFilteredList(
			ENPlanProjectCalculationFilter aENPlanProjectCalculationFilter)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить список для просмотра */
	public ENPlanProjectCalculationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить список для просмотра по фильтру */
	public ENPlanProjectCalculationShortList getScrollableFilteredList(
			ENPlanProjectCalculationFilter aENPlanProjectCalculationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить список для просмотра по условию */
	public ENPlanProjectCalculationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanProjectCalculationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanProjectCalculation. Получить объект из списка */
	public ENPlanProjectCalculationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}