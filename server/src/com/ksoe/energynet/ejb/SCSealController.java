
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSeal;
 *
 */

import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.brief.SCSealShort;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.SCSealShortList;


public interface SCSealController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealController";

	/* SCSeal. Добавить */
	public int add(SCSeal aSCSeal)
			throws java.rmi.RemoteException;

	/* SCSeal. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSeal. Изменить */
	public void save(SCSeal aSCSeal)
			throws java.rmi.RemoteException;

	/* SCSeal. Получить объект */
	public SCSeal getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSeal. Получить полный список */
	public SCSealShortList getList()
			throws java.rmi.RemoteException;

	/* SCSeal. Получить список по фильтру */
	public SCSealShortList getFilteredList(
			SCSealFilter aSCSealFilter)
			throws java.rmi.RemoteException;

	/* SCSeal. Получить список для просмотра */
	public SCSealShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal. Получить список для просмотра по фильтру */
	public SCSealShortList getScrollableFilteredList(
			SCSealFilter aSCSealFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal. Получить список для просмотра по условию */
	public SCSealShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSeal. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSealFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSeal. Получить объект из списка */
	public SCSealShort getShortObject(int code)
			throws java.rmi.RemoteException;

	public void installSeal(int sealCode, int factCode) throws java.rmi.RemoteException;
	public int uninstallSeal(int scCode, int factCode) throws java.rmi.RemoteException;
	
	public void cancelSealInstallation(int sealCode, int factCode) throws java.rmi.RemoteException;
	public void cancelSealUninstallation(int sealCode, int factCode) throws java.rmi.RemoteException;
}