
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActFailure;
 *
 */

import com.ksoe.energynet.valueobject.ENActFailure;
import com.ksoe.energynet.valueobject.brief.ENActFailureShort;
import com.ksoe.energynet.valueobject.filter.ENActFailureFilter;
import com.ksoe.energynet.valueobject.lists.ENActFailureShortList;


public interface ENActFailureController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActFailureController";

	/* ENActFailure. Добавить */
	public int add(ENActFailure aENActFailure)
			throws java.rmi.RemoteException;

	/* ENActFailure. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActFailure. Изменить */
	public void save(ENActFailure aENActFailure)
			throws java.rmi.RemoteException;

	/* ENActFailure. Получить объект */
	public ENActFailure getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActFailure. Получить полный список */
	public ENActFailureShortList getList()
			throws java.rmi.RemoteException;

	/* ENActFailure. Получить список по фильтру */
	public ENActFailureShortList getFilteredList(
			ENActFailureFilter aENActFailureFilter)
			throws java.rmi.RemoteException;

	/* ENActFailure. Получить список для просмотра */
	public ENActFailureShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailure. Получить список для просмотра по фильтру */
	public ENActFailureShortList getScrollableFilteredList(
			ENActFailureFilter aENActFailureFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActFailure. Получить список для просмотра по условию */
	public ENActFailureShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActFailure. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActFailureFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActFailure. Получить объект из списка */
	public ENActFailureShort getShortObject(int code)
			throws java.rmi.RemoteException;

}