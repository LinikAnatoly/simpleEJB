
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIP;
 *
 */

import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.brief.ENIPShort;
import com.ksoe.energynet.valueobject.filter.ENIPFilter;
import com.ksoe.energynet.valueobject.lists.ENIPShortList;


public interface ENIPController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPController";

	/* ENIP. Добавить */
	public int add(ENIP aENIP)
			throws java.rmi.RemoteException;

	/* ENIP. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIP. Изменить */
	public void save(ENIP aENIP)
			throws java.rmi.RemoteException;

	/* ENIP. Получить объект */
	public ENIP getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIP. Получить полный список */
	public ENIPShortList getList()
			throws java.rmi.RemoteException;

	/* ENIP. Получить список по фильтру */
	public ENIPShortList getFilteredList(
			ENIPFilter aENIPFilter)
			throws java.rmi.RemoteException;

	/* ENIP. Получить список для просмотра */
	public ENIPShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIP. Получить список для просмотра по фильтру */
	public ENIPShortList getScrollableFilteredList(
			ENIPFilter aENIPFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIP. Получить список для просмотра по условию */
	public ENIPShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIP. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIP. Получить объект из списка */
	public ENIPShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public int сopyNewVersionIP(int code) throws java.rmi.RemoteException;
	
	public void create(int code) throws java.rmi.RemoteException;
	public void undoCreate(int code) throws java.rmi.RemoteException;
	public void approve(int code) throws java.rmi.RemoteException;
	public void undoApprove(int code) throws java.rmi.RemoteException;
	
	//test
	public void test_admin(int code) throws java.rmi.RemoteException;

}