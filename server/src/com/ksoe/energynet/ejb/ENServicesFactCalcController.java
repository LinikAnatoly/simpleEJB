
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesFactCalc;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcShortList;


public interface ENServicesFactCalcController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesFactCalcController";

	/* ENServicesFactCalc. Добавить */
	public int add(ENServicesFactCalc aENServicesFactCalc)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Изменить */
	public void save(ENServicesFactCalc aENServicesFactCalc)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить объект */
	public ENServicesFactCalc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить полный список */
	public ENServicesFactCalcShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить список по фильтру */
	public ENServicesFactCalcShortList getFilteredList(
			ENServicesFactCalcFilter aENServicesFactCalcFilter)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить список для просмотра */
	public ENServicesFactCalcShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить список для просмотра по фильтру */
	public ENServicesFactCalcShortList getScrollableFilteredList(
			ENServicesFactCalcFilter aENServicesFactCalcFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить список для просмотра по условию */
	public ENServicesFactCalcShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesFactCalcFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. Получить объект из списка */
	public ENServicesFactCalcShort getShortObject(int code)
			throws java.rmi.RemoteException;

}