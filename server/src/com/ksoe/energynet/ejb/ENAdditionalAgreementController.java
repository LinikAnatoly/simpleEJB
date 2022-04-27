
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAdditionalAgreement;
 *
 */

import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.lists.ENAdditionalAgreementShortList;
import com.ksoe.energynet.valueobject.brief.ENAdditionalAgreementShort;
import com.ksoe.energynet.valueobject.filter.ENAdditionalAgreementFilter;


public interface ENAdditionalAgreementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAdditionalAgreementController";

	/* ENAdditionalAgreement. Добавить */
	public int add(ENAdditionalAgreement aENAdditionalAgreement)
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Изменить */
	public void save(ENAdditionalAgreement aENAdditionalAgreement)
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить объект */
	public ENAdditionalAgreement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить полный список */
	public ENAdditionalAgreementShortList getList()
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить список по фильтру */
	public ENAdditionalAgreementShortList getFilteredList(
			ENAdditionalAgreementFilter aENAdditionalAgreementFilter)
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить список для просмотра */
	public ENAdditionalAgreementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить список для просмотра по фильтру */
	public ENAdditionalAgreementShortList getScrollableFilteredList(
			ENAdditionalAgreementFilter aENAdditionalAgreementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить список для просмотра по условию */
	public ENAdditionalAgreementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAdditionalAgreementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAdditionalAgreement. Получить объект из списка */
	public ENAdditionalAgreementShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void signOrUnsign(ENAdditionalAgreement object, boolean isSign) throws java.rmi.RemoteException;

}