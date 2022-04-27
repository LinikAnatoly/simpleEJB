
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInspectionSheet;
 *
 */

import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetShortList;


public interface ENInspectionSheetController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInspectionSheetController";

	/* ENInspectionSheet. Добавить */
	public int add(ENInspectionSheet aENInspectionSheet)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInspectionSheet. Изменить */
	public void save(ENInspectionSheet aENInspectionSheet)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить объект */
	public ENInspectionSheet getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить полный список */
	public ENInspectionSheetShortList getList()
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить список по фильтру */
	public ENInspectionSheetShortList getFilteredList(
			ENInspectionSheetFilter aENInspectionSheetFilter)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить список для просмотра */
	public ENInspectionSheetShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить список для просмотра по фильтру */
	public ENInspectionSheetShortList getScrollableFilteredList(
			ENInspectionSheetFilter aENInspectionSheetFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить список для просмотра по условию */
	public ENInspectionSheetShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENInspectionSheetFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. Получить объект из списка */
	public ENInspectionSheetShort getShortObject(int code)
			throws java.rmi.RemoteException;


	/** ENInspectionSheet. Отправить на подписание. */
	public void sendToSigning(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Возврат в черновой. */
	public void unSigning(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Подписать. */
	public void signed(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Отмена подписания. */
	public void unSigned(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Создание плана на основании листа осмотра. */
	public int createPlanFromInspectionSheet(int inspectionSheetCode, ENPlanWork plan) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Копировать лист осмотра. */
	public int copySheet(int sheetCode) throws java.rmi.RemoteException;

	/** ENInspectionSheet. Получить код класса напряжения по коду номинала напряжения. */
	public int getVoltageClassCodeByVoltageNominalCode(int voltageNominalCode) throws java.rmi.RemoteException;
}