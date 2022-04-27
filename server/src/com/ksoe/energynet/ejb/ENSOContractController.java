
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOContract;
 *
 */

import com.ksoe.energynet.valueobject.ENSOContract;
import com.ksoe.energynet.valueobject.lists.ENSOContractShortList;
import com.ksoe.energynet.valueobject.brief.ENSOContractShort;
import com.ksoe.energynet.valueobject.filter.ENSOContractFilter;


public interface ENSOContractController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOContractController";

	/* ENSOContract. Добавить */
	public int add(ENSOContract aENSOContract)
			throws java.rmi.RemoteException;

	/* ENSOContract. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOContract. Изменить */
	public void save(ENSOContract aENSOContract)
			throws java.rmi.RemoteException;

	/* ENSOContract. Получить объект */
	public ENSOContract getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOContract. Получить полный список */
	public ENSOContractShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOContract. Получить список по фильтру */
	public ENSOContractShortList getFilteredList(
			ENSOContractFilter aENSOContractFilter)
			throws java.rmi.RemoteException;

	/* ENSOContract. Получить список для просмотра */
	public ENSOContractShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOContract. Получить список для просмотра по фильтру */
	public ENSOContractShortList getScrollableFilteredList(
			ENSOContractFilter aENSOContractFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOContract. Получить список для просмотра по условию */
	public ENSOContractShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOContract. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOContractFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOContract. Получить объект из списка */
	public ENSOContractShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/*Добавить договор из ENPlanWork ( поля из фин.кол.: servicesFSideFinId, servicesFSideCnNum) по критериям: 
		  - месячный план
		  - послуги со стороны */
	public void addFinDocIdFromENPlanWork(int servicesConnectionCode, int enServicesConnectionElementCode, 
			int codeEnTechConditionsServices) throws java.rmi.RemoteException;

}