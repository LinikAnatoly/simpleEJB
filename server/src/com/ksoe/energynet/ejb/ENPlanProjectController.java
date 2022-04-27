
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanProject;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanProject;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectFilter;


public interface ENPlanProjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanProjectController";

	/* ENPlanProject. Добавить */
	public int add(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;
	
	

	/* ENPlanProject. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanProject. Изменить */
	public void save(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;

	/* ENPlanProject. Получить объект */
	public ENPlanProject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanProject. Получить полный список */
	public ENPlanProjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanProject. Получить список по фильтру */
	public ENPlanProjectShortList getFilteredList(
			ENPlanProjectFilter aENPlanProjectFilter)
			throws java.rmi.RemoteException;

	/* ENPlanProject. Получить список для просмотра */
	public ENPlanProjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProject. Получить список для просмотра по фильтру */
	public ENPlanProjectShortList getScrollableFilteredList(
			ENPlanProjectFilter aENPlanProjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanProject. Получить список для просмотра по условию */
	public ENPlanProjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanProject. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPlanProjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanProject. Получить объект из списка */
	public ENPlanProjectShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENPlanProject. генерация тегов для проекта работ */
	public int generateenplanprojecttemplate(ENPlanProject aENPlanProject)
			throws java.rmi.RemoteException;
	
	public String generatecipher(ENPlanProject aENPlanProject) throws java.rmi.RemoteException;
	public String generateprojectname(ENPlanProject object ) throws java.rmi.RemoteException;

}