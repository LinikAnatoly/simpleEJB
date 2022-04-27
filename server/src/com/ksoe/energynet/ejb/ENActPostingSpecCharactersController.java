
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingSpecCharacters;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingSpecCharacters;
import com.ksoe.energynet.valueobject.lists.ENActPostingSpecCharactersShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingSpecCharactersShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingSpecCharactersFilter;


public interface ENActPostingSpecCharactersController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingSpecCharactersController";

	/* ENActPostingSpecCharacters. �������� */
	public int add(ENActPostingSpecCharacters aENActPostingSpecCharacters)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� */
	public void save(ENActPostingSpecCharacters aENActPostingSpecCharacters)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ */
	public ENActPostingSpecCharacters getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ ������ */
	public ENActPostingSpecCharactersShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ �� ������� */
	public ENActPostingSpecCharactersShortList getFilteredList(
			ENActPostingSpecCharactersFilter aENActPostingSpecCharactersFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ ��� ��������� */
	public ENActPostingSpecCharactersShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ ��� ��������� �� ������� */
	public ENActPostingSpecCharactersShortList getScrollableFilteredList(
			ENActPostingSpecCharactersFilter aENActPostingSpecCharactersFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ ��� ��������� �� ������� */
	public ENActPostingSpecCharactersShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingSpecCharactersFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. �������� ������ �� ������ */
	public ENActPostingSpecCharactersShort getShortObject(int code)
			throws java.rmi.RemoteException;

}