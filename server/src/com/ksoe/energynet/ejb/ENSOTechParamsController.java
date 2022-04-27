
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOTechParams;
 *
 */

import com.ksoe.energynet.valueobject.ENSOTechParams;
import com.ksoe.energynet.valueobject.lists.ENSOTechParamsShortList;
import com.ksoe.energynet.valueobject.brief.ENSOTechParamsShort;
import com.ksoe.energynet.valueobject.filter.ENSOTechParamsFilter;

import java.math.BigDecimal;


public interface ENSOTechParamsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOTechParamsController";

	/* ENSOTechParams. Добавить */
	public int add(ENSOTechParams aENSOTechParams)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOTechParams. Изменить */
	public void save(ENSOTechParams aENSOTechParams)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить объект */
	public ENSOTechParams getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить полный список */
	public ENSOTechParamsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить список по фильтру */
	public ENSOTechParamsShortList getFilteredList(
			ENSOTechParamsFilter aENSOTechParamsFilter)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить список для просмотра */
	public ENSOTechParamsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить список для просмотра по фильтру */
	public ENSOTechParamsShortList getScrollableFilteredList(
			ENSOTechParamsFilter aENSOTechParamsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить список для просмотра по условию */
	public ENSOTechParamsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOTechParamsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOTechParams. Получить объект из списка */
	public ENSOTechParamsShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* ENSOTechParams. Расчет стоимости и тарифа по техническим реквизитам*/
	public void calcTarif(ENSOTechParams object)  			
	throws java.rmi.RemoteException;

	/* ENSOTechParams. Расчёт стоимости подключения */
	public BigDecimal getConnectionCost(int connectionKind, int departmentCode, int categoryRefCode,
										int levelRefCode, int powerPointRefCode, int phasityRefCode,
										int installationTypeRefCode, int lineTypeRefCode,
										int locationTypeRefCode, BigDecimal tyServicesPower,
										int closestDistance, int closestDistance2)
	throws java.rmi.RemoteException;
	
}