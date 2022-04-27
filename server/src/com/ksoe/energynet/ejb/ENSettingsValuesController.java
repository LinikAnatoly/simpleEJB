
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;
/**
 * EJB Controller interface for ENSettingsValues;
 *
 */
import com.ksoe.energynet.valueobject.brief.ENSettingsValuesShort;
import com.ksoe.energynet.valueobject.filter.ENSettingsValuesFilter;
import com.ksoe.energynet.valueobject.lists.ENSettingsValuesShortList;
import com.ksoe.energynet.valueobject.ENSettingsValues;


public interface ENSettingsValuesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSettingsValuesController";

	/* ENSettingsValues. Добавить */
	public int add(ENSettingsValues aENSettingsValues)
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSettingsValues. Изменить */
	public void save(ENSettingsValues aENSettingsValues)
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить объект */
	public ENSettingsValues getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить полный список */
	public ENSettingsValuesShortList getList()
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить список по фильтру */
	public ENSettingsValuesShortList getFilteredList(
			ENSettingsValuesFilter aENSettingsValuesFilter)
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить список для просмотра */
	public ENSettingsValuesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить список для просмотра по фильтру */
	public ENSettingsValuesShortList getScrollableFilteredList(
			ENSettingsValuesFilter aENSettingsValuesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить список для просмотра по условию */
	public ENSettingsValuesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSettingsValuesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSettingsValues. Получить объект из списка */
	public ENSettingsValuesShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/*Достать значение настройки по ключу */
	public String getValue(String key) throws java.rmi.RemoteException;
	
	/*Достать значение настройки по ключу */
	public String getValue(String key, Date date) throws java.rmi.RemoteException;

}