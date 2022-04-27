
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSheets4SOItemsTemplate;
 *
 */

import com.ksoe.energynet.valueobject.ENSheets4SOItemsTemplate;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOItemsTemplateShortList;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOItemsTemplateShort;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOItemsTemplateFilter;


public interface ENSheets4SOItemsTemplateController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSheets4SOItemsTemplateController";

	/* ENSheets4SOItemsTemplate. �������� */
	public int add(ENSheets4SOItemsTemplate aENSheets4SOItemsTemplate)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� */
	public void save(ENSheets4SOItemsTemplate aENSheets4SOItemsTemplate)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ */
	public ENSheets4SOItemsTemplate getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ ������ */
	public ENSheets4SOItemsTemplateShortList getList()
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ �� ������� */
	public ENSheets4SOItemsTemplateShortList getFilteredList(
			ENSheets4SOItemsTemplateFilter aENSheets4SOItemsTemplateFilter)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ ��� ��������� */
	public ENSheets4SOItemsTemplateShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ ��� ��������� �� ������� */
	public ENSheets4SOItemsTemplateShortList getScrollableFilteredList(
			ENSheets4SOItemsTemplateFilter aENSheets4SOItemsTemplateFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ ��� ��������� �� ������� */
	public ENSheets4SOItemsTemplateShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSheets4SOItemsTemplateFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItemsTemplate. �������� ������ �� ������ */
	public ENSheets4SOItemsTemplateShort getShortObject(int code)
			throws java.rmi.RemoteException;

}