
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanProjectTemplate;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanProjectTemplate;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectTemplateShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectTemplateShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectTemplateFilter;


public interface ENPlanProjectTemplateController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanProjectTemplateController";

	/* ENPlanProjectTemplate. Добавить */
	public int add(ENPlanProjectTemplate aENPlanProjectTemplate)
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Изменить */
	public void save(ENPlanProjectTemplate aENPlanProjectTemplate)
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить объект */
	public ENPlanProjectTemplate getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить полный список */
	public ENPlanProjectTemplateShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить список по фильтру */
	public ENPlanProjectTemplateShortList getFilteredList(
			ENPlanProjectTemplateFilter aENPlanProjectTemplateFilter)
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить список для просмотра */
	public ENPlanProjectTemplateShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить список для просмотра по фильтру */
	public ENPlanProjectTemplateShortList getScrollableFilteredList(
			ENPlanProjectTemplateFilter aENPlanProjectTemplateFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить список для просмотра по условию */
	public ENPlanProjectTemplateShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanProjectTemplateFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanProjectTemplate. Получить объект из списка */
	public ENPlanProjectTemplateShort getShortObject(int code)
			throws java.rmi.RemoteException;

}