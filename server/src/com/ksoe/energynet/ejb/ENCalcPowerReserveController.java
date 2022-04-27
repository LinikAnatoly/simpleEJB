
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCalcPowerReserve;
 *
 */

import com.ksoe.energynet.valueobject.ENCalcPowerReserve;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveShortList;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveShort;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveFilter;


public interface ENCalcPowerReserveController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCalcPowerReserveController";

	/* ENCalcPowerReserve. Добавить */
	public int add(ENCalcPowerReserve aENCalcPowerReserve)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Изменить */
	public void save(ENCalcPowerReserve aENCalcPowerReserve)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить объект */
	public ENCalcPowerReserve getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить полный список */
	public ENCalcPowerReserveShortList getList()
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить список по фильтру */
	public ENCalcPowerReserveShortList getFilteredList(
			ENCalcPowerReserveFilter aENCalcPowerReserveFilter)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить список для просмотра */
	public ENCalcPowerReserveShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить список для просмотра по фильтру */
	public ENCalcPowerReserveShortList getScrollableFilteredList(
			ENCalcPowerReserveFilter aENCalcPowerReserveFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить список для просмотра по условию */
	public ENCalcPowerReserveShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCalcPowerReserveFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserve. Получить объект из списка */
	public ENCalcPowerReserveShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void generatePowerReserve(ENCalcPowerReserve object) 
			throws java.rmi.RemoteException;     

}