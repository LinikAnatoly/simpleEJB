
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelDistributionSheet;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetShort;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetShortList;


public interface ENFuelDistributionSheetController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelDistributionSheetController";

	/* ENFuelDistributionSheet. Добавить */
	public int add(ENFuelDistributionSheet aENFuelDistributionSheet)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Изменить */
	public void save(ENFuelDistributionSheet aENFuelDistributionSheet)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить объект */
	public ENFuelDistributionSheet getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить полный список */
	public ENFuelDistributionSheetShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить список по фильтру */
	public ENFuelDistributionSheetShortList getFilteredList(
			ENFuelDistributionSheetFilter aENFuelDistributionSheetFilter)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить список для просмотра */
	public ENFuelDistributionSheetShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить список для просмотра по фильтру */
	public ENFuelDistributionSheetShortList getScrollableFilteredList(
			ENFuelDistributionSheetFilter aENFuelDistributionSheetFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить список для просмотра по условию */
	public ENFuelDistributionSheetShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelDistributionSheetFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. Получить объект из списка */
	public ENFuelDistributionSheetShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/*разнесение пмм в литрах по подразделениям в зависимости от утвержденной суммы (по видам деятельности)*/
	public ENFuelDistributionSheet recalcApprovedPmmByTypeActivity(ENFuelDistributionSheet object , int typeActivity, int[] decadesToCalculate)throws java.rmi.RemoteException;
	
	
}