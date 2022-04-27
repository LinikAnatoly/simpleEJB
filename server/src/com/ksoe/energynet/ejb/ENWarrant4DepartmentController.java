
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWarrant4Department;
 *
 */

import com.ksoe.energynet.valueobject.ENWarrant4Department;
import com.ksoe.energynet.valueobject.lists.ENWarrant4DepartmentShortList;
import com.ksoe.energynet.valueobject.brief.ENWarrant4DepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENWarrant4DepartmentFilter;


public interface ENWarrant4DepartmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWarrant4DepartmentController";

	/* ENWarrant4Department. Добавить */
	public int add(ENWarrant4Department aENWarrant4Department)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWarrant4Department. Изменить */
	public void save(ENWarrant4Department aENWarrant4Department)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить объект */
	public ENWarrant4Department getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить полный список */
	public ENWarrant4DepartmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить список по фильтру */
	public ENWarrant4DepartmentShortList getFilteredList(
			ENWarrant4DepartmentFilter aENWarrant4DepartmentFilter)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить список для просмотра */
	public ENWarrant4DepartmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить список для просмотра по фильтру */
	public ENWarrant4DepartmentShortList getScrollableFilteredList(
			ENWarrant4DepartmentFilter aENWarrant4DepartmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить список для просмотра по условию */
	public ENWarrant4DepartmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWarrant4DepartmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWarrant4Department. Получить объект из списка */
	public ENWarrant4DepartmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}