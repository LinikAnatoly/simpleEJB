
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.filter.ENCustomerServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENCustomerServicesShortList;


public interface ENCustomerServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCustomerServicesController";


	/* ENCustomerServices. Получить полный список */
	public ENCustomerServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENCustomerServices. Получить список по фильтру */
	public ENCustomerServicesShortList getFilteredList(
			ENCustomerServicesFilter aENCustomerServicesFilter)
			throws java.rmi.RemoteException;

	/* ENCustomerServices. Получить список для просмотра */
	public ENCustomerServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCustomerServices. Получить список для просмотра по фильтру */
	public ENCustomerServicesShortList getScrollableFilteredList(
			ENCustomerServicesFilter aENCustomerServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCustomerServices. Получить список для просмотра по условию */
	public ENCustomerServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCustomerServices. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCustomerServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;


}