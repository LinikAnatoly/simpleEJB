
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInventarization;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationShortList;


public interface ENFuelInventarizationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInventarizationController";

	/* ENFuelInventarization. Добавить */
	public int add(ENFuelInventarization aENFuelInventarization)
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInventarization. Изменить */
	public void save(ENFuelInventarization aENFuelInventarization)
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить объект */
	public ENFuelInventarization getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить полный список */
	public ENFuelInventarizationShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить список по фильтру */
	public ENFuelInventarizationShortList getFilteredList(
			ENFuelInventarizationFilter aENFuelInventarizationFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить список для просмотра */
	public ENFuelInventarizationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить список для просмотра по фильтру */
	public ENFuelInventarizationShortList getScrollableFilteredList(
			ENFuelInventarizationFilter aENFuelInventarizationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить список для просмотра по условию */
	public ENFuelInventarizationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInventarizationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInventarization. Получить объект из списка */
	public ENFuelInventarizationShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void generateInventarizationItems(ENFuelInventarization object)
			throws java.rmi.RemoteException;
	
	public void removeInventarizationItems(int inventarizationCode)
			throws java.rmi.RemoteException;
	
	public void reserveItems(int inventarizationCode) 
	       throws java.rmi.RemoteException;
	
	public void removeReserveItems(int inventarizationCode)
           throws java.rmi.RemoteException;
	
	public void closeInventarization(int inventarizationCode)
		       throws java.rmi.RemoteException;
	
	public void cancelCloseInventarization(int inventarizationCode)
	       throws java.rmi.RemoteException;
	
}