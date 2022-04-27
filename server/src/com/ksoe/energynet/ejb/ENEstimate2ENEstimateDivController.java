
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimate2ENEstimateDiv;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv;
import com.ksoe.energynet.valueobject.brief.ENEstimate2ENEstimateDivShort;
import com.ksoe.energynet.valueobject.filter.ENEstimate2ENEstimateDivFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimate2ENEstimateDivShortList;


public interface ENEstimate2ENEstimateDivController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENEstimate2ENEstimateDivController";

	/* ENEstimate2ENEstimateDiv. Добавить */
	public int add(ENEstimate2ENEstimateDiv aENEstimate2ENEstimateDiv)
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Изменить */
	public void save(ENEstimate2ENEstimateDiv aENEstimate2ENEstimateDiv)
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить объект */
	public ENEstimate2ENEstimateDiv getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить полный список */
	public ENEstimate2ENEstimateDivShortList getList()
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить список по фильтру */
	public ENEstimate2ENEstimateDivShortList getFilteredList(
			ENEstimate2ENEstimateDivFilter aENEstimate2ENEstimateDivFilter)
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить список для просмотра */
	public ENEstimate2ENEstimateDivShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить список для просмотра по фильтру */
	public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(
			ENEstimate2ENEstimateDivFilter aENEstimate2ENEstimateDivFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить список для просмотра по условию */
	public ENEstimate2ENEstimateDivShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENEstimate2ENEstimateDivFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENEstimate2ENEstimateDiv. Получить объект из списка */
	public ENEstimate2ENEstimateDivShort getShortObject(int code)
			throws java.rmi.RemoteException;

}