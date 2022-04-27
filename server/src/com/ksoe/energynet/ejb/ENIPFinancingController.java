
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPFinancing;
 *
 */

import com.ksoe.energynet.valueobject.ENIPFinancing;
import com.ksoe.energynet.valueobject.brief.ENIPFinancingShort;
import com.ksoe.energynet.valueobject.filter.ENIPFinancingFilter;
import com.ksoe.energynet.valueobject.lists.ENIPFinancingShortList;


public interface ENIPFinancingController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPFinancingController";

	/* ENIPFinancing. Добавить */
	public int add(ENIPFinancing aENIPFinancing)
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPFinancing. Изменить */
	public void save(ENIPFinancing aENIPFinancing)
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить объект */
	public ENIPFinancing getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить полный список */
	public ENIPFinancingShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить список по фильтру */
	public ENIPFinancingShortList getFilteredList(
			ENIPFinancingFilter aENIPFinancingFilter)
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить список для просмотра */
	public ENIPFinancingShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить список для просмотра по фильтру */
	public ENIPFinancingShortList getScrollableFilteredList(
			ENIPFinancingFilter aENIPFinancingFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить список для просмотра по условию */
	public ENIPFinancingShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPFinancingFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPFinancing. Получить объект из списка */
	public ENIPFinancingShort getShortObject(int code)
			throws java.rmi.RemoteException;

}