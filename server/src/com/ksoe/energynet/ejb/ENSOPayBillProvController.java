
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOPayBillProv;
 *
 */

import java.util.Date;

import com.ksoe.energynet.valueobject.ENSOPayBillProv;
import com.ksoe.energynet.valueobject.brief.ENSOPayBillProvShort;
import com.ksoe.energynet.valueobject.filter.ENSOPayBillProvFilter;
import com.ksoe.energynet.valueobject.lists.ENSOPayBillProvShortList;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;


public interface ENSOPayBillProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOPayBillProvController";

	/* ENSOPayBillProv. Добавить */
	public int add(ENSOPayBillProv aENSOPayBillProv)
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Изменить */
	public void save(ENSOPayBillProv aENSOPayBillProv)
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить объект */
	public ENSOPayBillProv getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить полный список */
	public ENSOPayBillProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить список по фильтру */
	public ENSOPayBillProvShortList getFilteredList(
			ENSOPayBillProvFilter aENSOPayBillProvFilter)
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить список для просмотра */
	public ENSOPayBillProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить список для просмотра по фильтру */
	public ENSOPayBillProvShortList getScrollableFilteredList(
			ENSOPayBillProvFilter aENSOPayBillProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить список для просмотра по условию */
	public ENSOPayBillProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOPayBillProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOPayBillProv. Получить объект из списка */
	public ENSOPayBillProvShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public FKProvObjectShortList getPostings4BillList(int soPayBillProvCode) 
	        throws java.rmi.RemoteException;
	
	public Date getDatePostings4BillByPayBillProvCode(int soPayBillProvCode)
			throws java.rmi.RemoteException;
	
	public FKProvResult moveToFK(ENSOPayBillProv soPayBillProv) 
			throws java.rmi.RemoteException;
	
	public FKProvResult moveToFK(ENSOPayBillProv soPayBillProv, Date postingDate)
			throws java.rmi.RemoteException;  
	
	public void deleteFromFK(int soPayBillProvCode)
			throws java.rmi.RemoteException;  

}