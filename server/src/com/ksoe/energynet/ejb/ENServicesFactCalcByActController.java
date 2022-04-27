
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesFactCalcByAct;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcByActShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcByActShortList;


public interface ENServicesFactCalcByActController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesFactCalcByActController";

	/* ENServicesFactCalcByAct. Добавить */
	public int add(ENServicesFactCalcByAct aENServicesFactCalcByAct)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Изменить */
	public void save(ENServicesFactCalcByAct aENServicesFactCalcByAct)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить объект */
	public ENServicesFactCalcByAct getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить полный список */
	public ENServicesFactCalcByActShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить список по фильтру */
	public ENServicesFactCalcByActShortList getFilteredList(
			ENServicesFactCalcByActFilter aENServicesFactCalcByActFilter)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить список для просмотра */
	public ENServicesFactCalcByActShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить список для просмотра по фильтру */
	public ENServicesFactCalcByActShortList getScrollableFilteredList(
			ENServicesFactCalcByActFilter aENServicesFactCalcByActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить список для просмотра по условию */
	public ENServicesFactCalcByActShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesFactCalcByActFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. Получить объект из списка */
	public ENServicesFactCalcByActShort getShortObject(int code)
			throws java.rmi.RemoteException;

}