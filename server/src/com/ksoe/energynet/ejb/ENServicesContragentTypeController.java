
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesContragentType;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.lists.ENServicesContragentTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENServicesContragentTypeShort;
import com.ksoe.energynet.valueobject.filter.ENServicesContragentTypeFilter;


public interface ENServicesContragentTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesContragentTypeController";

	/* ENServicesContragentType. Добавить */
	public int add(ENServicesContragentType aENServicesContragentType)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesContragentType. Изменить */
	public void save(ENServicesContragentType aENServicesContragentType)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить объект */
	public ENServicesContragentType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить полный список */
	public ENServicesContragentTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить список по фильтру */
	public ENServicesContragentTypeShortList getFilteredList(
			ENServicesContragentTypeFilter aENServicesContragentTypeFilter)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить список для просмотра */
	public ENServicesContragentTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить список для просмотра по фильтру */
	public ENServicesContragentTypeShortList getScrollableFilteredList(
			ENServicesContragentTypeFilter aENServicesContragentTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить список для просмотра по условию */
	public ENServicesContragentTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesContragentTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesContragentType. Получить объект из списка */
	public ENServicesContragentTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}