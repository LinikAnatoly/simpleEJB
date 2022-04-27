
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTransferDate2ServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENTransferDate2ServicesObject;
import com.ksoe.energynet.valueobject.brief.ENTransferDate2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENTransferDate2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENTransferDate2ServicesObjectShortList;


public interface ENTransferDate2ServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTransferDate2ServicesObjectController";

	/* ENTransferDate2ServicesObject. Добавить */
	public int add(ENTransferDate2ServicesObject aENTransferDate2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Изменить */
	public void save(ENTransferDate2ServicesObject aENTransferDate2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить объект */
	public ENTransferDate2ServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить полный список */
	public ENTransferDate2ServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить список по фильтру */
	public ENTransferDate2ServicesObjectShortList getFilteredList(
			ENTransferDate2ServicesObjectFilter aENTransferDate2ServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить список для просмотра */
	public ENTransferDate2ServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить список для просмотра по фильтру */
	public ENTransferDate2ServicesObjectShortList getScrollableFilteredList(
			ENTransferDate2ServicesObjectFilter aENTransferDate2ServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить список для просмотра по условию */
	public ENTransferDate2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTransferDate2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTransferDate2ServicesObject. Получить объект из списка */
	public ENTransferDate2ServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}