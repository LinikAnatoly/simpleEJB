
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionInstallationType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionInstallationType;
import com.ksoe.energynet.valueobject.lists.ENConnectionInstallationTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionInstallationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionInstallationTypeFilter;


public interface ENConnectionInstallationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionInstallationTypeController";

	/* ENConnectionInstallationType. Добавить */
	public int add(ENConnectionInstallationType aENConnectionInstallationType)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Изменить */
	public void save(ENConnectionInstallationType aENConnectionInstallationType)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить объект */
	public ENConnectionInstallationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить полный список */
	public ENConnectionInstallationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить список по фильтру */
	public ENConnectionInstallationTypeShortList getFilteredList(
			ENConnectionInstallationTypeFilter aENConnectionInstallationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить список для просмотра */
	public ENConnectionInstallationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить список для просмотра по фильтру */
	public ENConnectionInstallationTypeShortList getScrollableFilteredList(
			ENConnectionInstallationTypeFilter aENConnectionInstallationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить список для просмотра по условию */
	public ENConnectionInstallationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionInstallationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionInstallationType. Получить объект из списка */
	public ENConnectionInstallationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}