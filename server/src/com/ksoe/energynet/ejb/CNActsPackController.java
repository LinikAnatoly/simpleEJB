
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNActsPack;
 *
 */

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.docflow.valueobject.DFPack;
import com.ksoe.energynet.valueobject.CNActsPack;
import com.ksoe.energynet.valueobject.brief.CNActsPackShort;
import com.ksoe.energynet.valueobject.filter.CNActsPackFilter;
import com.ksoe.energynet.valueobject.lists.CNActsPackShortList;


public interface CNActsPackController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNActsPackController";

	/* CNActsPack. �������� */
	public int add(CNActsPack aCNActsPack)
			throws java.rmi.RemoteException;

	/* CNActsPack. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNActsPack. �������� */
	public void save(CNActsPack aCNActsPack)
			throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ */
	public CNActsPack getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ ������ */
	public CNActsPackShortList getList()
			throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ �� ������� */
	public CNActsPackShortList getFilteredList(
			CNActsPackFilter aCNActsPackFilter)
			throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ ��� ��������� */
	public CNActsPackShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ ��� ��������� �� ������� */
	public CNActsPackShortList getScrollableFilteredList(
			CNActsPackFilter aCNActsPackFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ ��� ��������� �� ������� */
	public CNActsPackShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			CNActsPackFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNActsPack. �������� ������ �� ������ */
	public CNActsPackShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	public int createPack(DFPack pack, int eprenCode) throws java.rmi.RemoteException;
	
	public int getRegisterServiceStage(int idPack) throws java.rmi.RemoteException;
	
	public String getRegisterServiceStageName(int idPack) throws java.rmi.RemoteException;
	
    public void switchMovementForActs(int packCode, int nextState) throws java.rmi.RemoteException;
	
    public void savePack(DFPack pack,Date actDate,BigDecimal actSum)  throws java.rmi.RemoteException;
}