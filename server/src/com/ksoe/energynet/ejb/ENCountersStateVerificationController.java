
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCountersStateVerification;
 *
 */

import com.ksoe.energynet.valueobject.ENCountersStateVerification;
import com.ksoe.energynet.valueobject.lists.ENCountersStateVerificationShortList;
import com.ksoe.energynet.valueobject.brief.ENCountersStateVerificationShort;
import com.ksoe.energynet.valueobject.filter.ENCountersStateVerificationFilter;


public interface ENCountersStateVerificationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCountersStateVerificationController";

	/* ENCountersStateVerification. Добавить */
	public int add(ENCountersStateVerification aENCountersStateVerification)
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Изменить */
	public void save(ENCountersStateVerification aENCountersStateVerification)
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить объект */
	public ENCountersStateVerification getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить полный список */
	public ENCountersStateVerificationShortList getList()
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить список по фильтру */
	public ENCountersStateVerificationShortList getFilteredList(
			ENCountersStateVerificationFilter aENCountersStateVerificationFilter)
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить список для просмотра */
	public ENCountersStateVerificationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить список для просмотра по фильтру */
	public ENCountersStateVerificationShortList getScrollableFilteredList(
			ENCountersStateVerificationFilter aENCountersStateVerificationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить список для просмотра по условию */
	public ENCountersStateVerificationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCountersStateVerificationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCountersStateVerification. Получить объект из списка */
	public ENCountersStateVerificationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}