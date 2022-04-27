
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENPlanWork;

/**
 * EJB Controller interface for ENServicesCost;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.brief.ENServicesCostShort;
import com.ksoe.energynet.valueobject.filter.ENServicesCostFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesCostShortList;


public interface ENServicesCostController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesCostController";

	/* ENServicesCost. Добавить */
	public int add(ENServicesCost aENServicesCost)
			throws java.rmi.RemoteException;

	/* ENServicesCost. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	
	public void remove(int[] anObjectCodes) throws java.rmi.RemoteException;

	/* ENServicesCost. Изменить */
	public void save(ENServicesCost aENServicesCost)
			throws java.rmi.RemoteException;

	/* ENServicesCost. Получить объект */
	public ENServicesCost getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesCost. Получить полный список */
	public ENServicesCostShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesCost. Получить список по фильтру */
	public ENServicesCostShortList getFilteredList(
			ENServicesCostFilter aENServicesCostFilter)
			throws java.rmi.RemoteException;

	/* ENServicesCost. Получить список для просмотра */
	public ENServicesCostShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesCost. Получить список для просмотра по фильтру */
	public ENServicesCostShortList getScrollableFilteredList(
			ENServicesCostFilter aENServicesCostFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesCost. Получить список для просмотра по условию */
	public ENServicesCostShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesCost. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesCostFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesCost. Получить объект из списка */
	public ENServicesCostShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public int add(ENServicesCost servicesCost, BigDecimal distance) throws java.rmi.RemoteException;
	
	public int add(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity) throws java.rmi.RemoteException;
	
	public void save(ENServicesCost servicesCost, BigDecimal distance) throws java.rmi.RemoteException;
	
	public void save(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity) throws java.rmi.RemoteException;
	
	public int generatePlans(ENServicesCost[] servicesCosts, boolean isGenerate)  throws java.rmi.RemoteException;
	
	public int generatePlans(ENServicesCost[] servicesCosts, ENPlanWork planTemplate, boolean isGenerate) throws java.rmi.RemoteException;

}