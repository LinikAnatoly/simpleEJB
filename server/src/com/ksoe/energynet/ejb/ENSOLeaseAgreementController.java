
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOLeaseAgreement;
 *
 */

import com.ksoe.energynet.valueobject.ENSOLeaseAgreement;
import com.ksoe.energynet.valueobject.lists.ENSOLeaseAgreementShortList;
import com.ksoe.energynet.valueobject.brief.ENSOLeaseAgreementShort;
import com.ksoe.energynet.valueobject.filter.ENSOLeaseAgreementFilter;


public interface ENSOLeaseAgreementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOLeaseAgreementController";

	/* ENSOLeaseAgreement. Добавить */
	public int add(ENSOLeaseAgreement aENSOLeaseAgreement)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Изменить */
	public void save(ENSOLeaseAgreement aENSOLeaseAgreement)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить объект */
	public ENSOLeaseAgreement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить полный список */
	public ENSOLeaseAgreementShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить список по фильтру */
	public ENSOLeaseAgreementShortList getFilteredList(
			ENSOLeaseAgreementFilter aENSOLeaseAgreementFilter)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить список для просмотра */
	public ENSOLeaseAgreementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить список для просмотра по фильтру */
	public ENSOLeaseAgreementShortList getScrollableFilteredList(
			ENSOLeaseAgreementFilter aENSOLeaseAgreementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить список для просмотра по условию */
	public ENSOLeaseAgreementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOLeaseAgreementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. Получить объект из списка */
	public ENSOLeaseAgreementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}