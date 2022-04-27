
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCottage;
 *
 */

import com.ksoe.energynet.valueobject.ENCottage;
import com.ksoe.energynet.valueobject.brief.ENCottageShort;
import com.ksoe.energynet.valueobject.filter.ENCottageFilter;
import com.ksoe.energynet.valueobject.lists.ENCottageShortList;


public interface ENCottageController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCottageController";

	/* ENCottage. Добавить */
	public int add(ENCottage aENCottage)
			throws java.rmi.RemoteException;

	/* ENCottage. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCottage. Изменить */
	public void save(ENCottage aENCottage)
			throws java.rmi.RemoteException;

	/* ENCottage. Получить объект */
	public ENCottage getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCottage. Получить полный список */
	public ENCottageShortList getList()
			throws java.rmi.RemoteException;

	/* ENCottage. Получить список по фильтру */
	public ENCottageShortList getFilteredList(
			ENCottageFilter aENCottageFilter)
			throws java.rmi.RemoteException;

	/* ENCottage. Получить список для просмотра */
	public ENCottageShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCottage. Получить список для просмотра по фильтру */
	public ENCottageShortList getScrollableFilteredList(
			ENCottageFilter aENCottageFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCottage. Получить список для просмотра по условию */
	public ENCottageShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCottage. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCottageFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCottage. Получить объект из списка */
	public ENCottageShort getShortObject(int code)
			throws java.rmi.RemoteException;

}