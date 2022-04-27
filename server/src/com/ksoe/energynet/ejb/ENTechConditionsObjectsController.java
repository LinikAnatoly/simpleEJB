
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;

public interface ENTechConditionsObjectsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsObjectsController";

	/* ENTechConditionsObjects. Добавить */
	public int add(ENTechConditionsObjects aENTechConditionsObjects) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Изменить */
	public void save(ENTechConditionsObjects aENTechConditionsObjects) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить объект */
	public ENTechConditionsObjects getObject(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить полный список */
	public ENTechConditionsObjectsShortList getList() throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить список по фильтру */
	public ENTechConditionsObjectsShortList getFilteredList(
			ENTechConditionsObjectsFilter aENTechConditionsObjectsFilter) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить список для просмотра */
	public ENTechConditionsObjectsShortList getScrollableList(int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить список для просмотра по фильтру */
	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjectsFilter aEPActFilter,
			int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить список для просмотра по условию */
	public ENTechConditionsObjectsShortList getScrollableListByCondition(String aCondition, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(ENTechConditionsObjectsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. Сгенерить идентификатор */
	public void generateIdentNumber(int code) throws java.rmi.RemoteException;

	/* ENTechConditionsObjects. убрать идентификатор */
	public void resetIdentNumber(int code) throws java.rmi.RemoteException;


    /**
     * Получить список Тех.Условий для сайта
     *
     * @param ENTechConditionsObjectsFilter
     * @return ENTechConditionsObjectsShortList
     */
	public ENTechConditionsObjectsShortList getPublicListTechConditions(ENTechConditionsObjectsFilter filterObject) throws java.rmi.RemoteException;


}