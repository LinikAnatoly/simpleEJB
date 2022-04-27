
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCoefficientQualityStandards;
 *
 */

import com.ksoe.energynet.valueobject.ENCoefficientQualityStandards;
import com.ksoe.energynet.valueobject.lists.ENCoefficientQualityStandardsShortList;
import com.ksoe.energynet.valueobject.brief.ENCoefficientQualityStandardsShort;
import com.ksoe.energynet.valueobject.filter.ENCoefficientQualityStandardsFilter;


public interface ENCoefficientQualityStandardsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCoefficientQualityStandardsController";

	/* ENCoefficientQualityStandards. Добавить */
	public int add(ENCoefficientQualityStandards aENCoefficientQualityStandards)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Изменить */
	public void save(ENCoefficientQualityStandards aENCoefficientQualityStandards)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить объект */
	public ENCoefficientQualityStandards getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить полный список */
	public ENCoefficientQualityStandardsShortList getList()
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить список по фильтру */
	public ENCoefficientQualityStandardsShortList getFilteredList(
			ENCoefficientQualityStandardsFilter aENCoefficientQualityStandardsFilter)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить список для просмотра */
	public ENCoefficientQualityStandardsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить список для просмотра по фильтру */
	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(
			ENCoefficientQualityStandardsFilter aENCoefficientQualityStandardsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить список для просмотра по условию */
	public ENCoefficientQualityStandardsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCoefficientQualityStandardsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. Получить объект из списка */
	public ENCoefficientQualityStandardsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}