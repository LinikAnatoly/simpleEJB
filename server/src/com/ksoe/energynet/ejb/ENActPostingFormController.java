
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingForm;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingForm;
import com.ksoe.energynet.valueobject.lists.ENActPostingFormShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingFormShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingFormFilter;


public interface ENActPostingFormController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingFormController";

	/* ENActPostingForm. Добавить */
	public int add(ENActPostingForm aENActPostingForm)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingForm. Изменить */
	public void save(ENActPostingForm aENActPostingForm)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить объект */
	public ENActPostingForm getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить полный список */
	public ENActPostingFormShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить список по фильтру */
	public ENActPostingFormShortList getFilteredList(
			ENActPostingFormFilter aENActPostingFormFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить список для просмотра */
	public ENActPostingFormShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить список для просмотра по фильтру */
	public ENActPostingFormShortList getScrollableFilteredList(
			ENActPostingFormFilter aENActPostingFormFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить список для просмотра по условию */
	public ENActPostingFormShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingFormFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingForm. Получить объект из списка */
	public ENActPostingFormShort getShortObject(int code)
			throws java.rmi.RemoteException;

}