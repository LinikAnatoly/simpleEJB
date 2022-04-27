
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTransportRealRepair;
 *
 */

import com.ksoe.energynet.valueobject.ENTransportRealRepair;
import com.ksoe.energynet.valueobject.lists.ENTransportRealRepairShortList;
import com.ksoe.energynet.valueobject.brief.ENTransportRealRepairShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRealRepairFilter;


public interface ENTransportRealRepairController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTransportRealRepairController";

	/* ENTransportRealRepair. Добавить */
	public int add(ENTransportRealRepair aENTransportRealRepair)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Изменить */
	public void save(ENTransportRealRepair aENTransportRealRepair)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить объект */
	public ENTransportRealRepair getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить полный список */
	public ENTransportRealRepairShortList getList()
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить список по фильтру */
	public ENTransportRealRepairShortList getFilteredList(
			ENTransportRealRepairFilter aENTransportRealRepairFilter)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить список для просмотра */
	public ENTransportRealRepairShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить список для просмотра по фильтру */
	public ENTransportRealRepairShortList getScrollableFilteredList(
			ENTransportRealRepairFilter aENTransportRealRepairFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить список для просмотра по условию */
	public ENTransportRealRepairShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTransportRealRepairFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTransportRealRepair. Получить объект из списка */
	public ENTransportRealRepairShort getShortObject(int code)
			throws java.rmi.RemoteException;

}