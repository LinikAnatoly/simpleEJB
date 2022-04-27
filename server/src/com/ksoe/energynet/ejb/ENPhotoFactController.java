
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPhotoFact;
 *
 */

import com.ksoe.energynet.valueobject.ENPhotoFact;
import com.ksoe.energynet.valueobject.lists.ENPhotoFactShortList;
import com.ksoe.energynet.valueobject.brief.ENPhotoFactShort;
import com.ksoe.energynet.valueobject.filter.ENPhotoFactFilter;


public interface ENPhotoFactController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPhotoFactController";

	/* ENPhotoFact. Добавить */
	public int add(ENPhotoFact aENPhotoFact)
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPhotoFact. Изменить */
	public void save(ENPhotoFact aENPhotoFact)
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить объект */
	public ENPhotoFact getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить полный список */
	public ENPhotoFactShortList getList()
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить список по фильтру */
	public ENPhotoFactShortList getFilteredList(
			ENPhotoFactFilter aENPhotoFactFilter)
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить список для просмотра */
	public ENPhotoFactShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить список для просмотра по фильтру */
	public ENPhotoFactShortList getScrollableFilteredList(
			ENPhotoFactFilter aENPhotoFactFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить список для просмотра по условию */
	public ENPhotoFactShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPhotoFactFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPhotoFact. Получить объект из списка */
	public ENPhotoFactShort getShortObject(int code)
			throws java.rmi.RemoteException;

}