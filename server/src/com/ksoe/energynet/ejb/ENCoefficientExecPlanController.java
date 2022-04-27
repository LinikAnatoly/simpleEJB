
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCoefficientExecPlan;
 *
 */

import com.ksoe.energynet.valueobject.ENCoefficientExecPlan;
import com.ksoe.energynet.valueobject.brief.ENCoefficientExecPlanShort;
import com.ksoe.energynet.valueobject.filter.ENCoefficientExecPlanFilter;
import com.ksoe.energynet.valueobject.lists.ENCoefficientExecPlanShortList;


public interface ENCoefficientExecPlanController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCoefficientExecPlanController";

	/* ENCoefficientExecPlan. Добавить */
	public int add(ENCoefficientExecPlan aENCoefficientExecPlan)
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Изменить */
	public void save(ENCoefficientExecPlan aENCoefficientExecPlan)
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить объект */
	public ENCoefficientExecPlan getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить полный список */
	public ENCoefficientExecPlanShortList getList()
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить список по фильтру */
	public ENCoefficientExecPlanShortList getFilteredList(
			ENCoefficientExecPlanFilter aENCoefficientExecPlanFilter)
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить список для просмотра */
	public ENCoefficientExecPlanShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить список для просмотра по фильтру */
	public ENCoefficientExecPlanShortList getScrollableFilteredList(
			ENCoefficientExecPlanFilter aENCoefficientExecPlanFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить список для просмотра по условию */
	public ENCoefficientExecPlanShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCoefficientExecPlanFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCoefficientExecPlan. Получить объект из списка */
	public ENCoefficientExecPlanShort getShortObject(int code)
			throws java.rmi.RemoteException;

}