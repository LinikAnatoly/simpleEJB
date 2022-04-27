
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGeographicDepartment;
 *
 */

import com.ksoe.energynet.valueobject.ENGeographicDepartment;
import com.ksoe.energynet.valueobject.lists.ENGeographicDepartmentShortList;
import com.ksoe.energynet.valueobject.brief.ENGeographicDepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENGeographicDepartmentFilter;


public interface ENGeographicDepartmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGeographicDepartmentController";

	/* ENGeographicDepartment. Добавить */
	public int add(ENGeographicDepartment aENGeographicDepartment)
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Изменить */
	public void save(ENGeographicDepartment aENGeographicDepartment)
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить объект */
	public ENGeographicDepartment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить полный список */
	public ENGeographicDepartmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить список по фильтру */
	public ENGeographicDepartmentShortList getFilteredList(
			ENGeographicDepartmentFilter aENGeographicDepartmentFilter)
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить список для просмотра */
	public ENGeographicDepartmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить список для просмотра по фильтру */
	public ENGeographicDepartmentShortList getScrollableFilteredList(
			ENGeographicDepartmentFilter aENGeographicDepartmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить список для просмотра по условию */
	public ENGeographicDepartmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENGeographicDepartmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGeographicDepartment. Получить объект из списка */
	public ENGeographicDepartmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}