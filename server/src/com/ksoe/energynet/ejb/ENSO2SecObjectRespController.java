
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSO2SecObjectResp;
 *
 */

import com.ksoe.energynet.valueobject.ENSO2SecObjectResp;
import com.ksoe.energynet.valueobject.lists.ENSO2SecObjectRespShortList;
import com.ksoe.energynet.valueobject.brief.ENSO2SecObjectRespShort;
import com.ksoe.energynet.valueobject.filter.ENSO2SecObjectRespFilter;


public interface ENSO2SecObjectRespController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSO2SecObjectRespController";

	/* ENSO2SecObjectResp. Добавить */
	public int add(ENSO2SecObjectResp aENSO2SecObjectResp)
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Изменить */
	public void save(ENSO2SecObjectResp aENSO2SecObjectResp)
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить объект */
	public ENSO2SecObjectResp getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить полный список */
	public ENSO2SecObjectRespShortList getList()
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить список по фильтру */
	public ENSO2SecObjectRespShortList getFilteredList(
			ENSO2SecObjectRespFilter aENSO2SecObjectRespFilter)
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить список для просмотра */
	public ENSO2SecObjectRespShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить список для просмотра по фильтру */
	public ENSO2SecObjectRespShortList getScrollableFilteredList(
			ENSO2SecObjectRespFilter aENSO2SecObjectRespFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить список для просмотра по условию */
	public ENSO2SecObjectRespShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSO2SecObjectRespFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSO2SecObjectResp. Получить объект из списка */
	public ENSO2SecObjectRespShort getShortObject(int code)
			throws java.rmi.RemoteException;

}