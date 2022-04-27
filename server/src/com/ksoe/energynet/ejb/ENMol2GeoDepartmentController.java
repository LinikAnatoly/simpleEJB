
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMol2GeoDepartment;
 *
 */

import com.ksoe.energynet.valueobject.ENMol2GeoDepartment;
import com.ksoe.energynet.valueobject.lists.ENMol2GeoDepartmentShortList;
import com.ksoe.energynet.valueobject.brief.ENMol2GeoDepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENMol2GeoDepartmentFilter;


public interface ENMol2GeoDepartmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMol2GeoDepartmentController";

	/* ENMol2GeoDepartment. Добавить */
	public int add(ENMol2GeoDepartment aENMol2GeoDepartment)
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Изменить */
	public void save(ENMol2GeoDepartment aENMol2GeoDepartment)
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить объект */
	public ENMol2GeoDepartment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить полный список */
	public ENMol2GeoDepartmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить список по фильтру */
	public ENMol2GeoDepartmentShortList getFilteredList(
			ENMol2GeoDepartmentFilter aENMol2GeoDepartmentFilter)
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить список для просмотра */
	public ENMol2GeoDepartmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить список для просмотра по фильтру */
	public ENMol2GeoDepartmentShortList getScrollableFilteredList(
			ENMol2GeoDepartmentFilter aENMol2GeoDepartmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить список для просмотра по условию */
	public ENMol2GeoDepartmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENMol2GeoDepartmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMol2GeoDepartment. Получить объект из списка */
	public ENMol2GeoDepartmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}