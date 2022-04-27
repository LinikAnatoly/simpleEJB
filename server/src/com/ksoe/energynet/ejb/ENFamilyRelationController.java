
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFamilyRelation;
 *
 */

import com.ksoe.energynet.valueobject.ENFamilyRelation;
import com.ksoe.energynet.valueobject.brief.ENFamilyRelationShort;
import com.ksoe.energynet.valueobject.filter.ENFamilyRelationFilter;
import com.ksoe.energynet.valueobject.lists.ENFamilyRelationShortList;


public interface ENFamilyRelationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFamilyRelationController";

	/* ENFamilyRelation. �������� */
	public int add(ENFamilyRelation aENFamilyRelation)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� */
	public void save(ENFamilyRelation aENFamilyRelation)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ */
	public ENFamilyRelation getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ ������ */
	public ENFamilyRelationShortList getList()
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ �� ������� */
	public ENFamilyRelationShortList getFilteredList(
			ENFamilyRelationFilter aENFamilyRelationFilter)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ ��� ��������� */
	public ENFamilyRelationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ ��� ��������� �� ������� */
	public ENFamilyRelationShortList getScrollableFilteredList(
			ENFamilyRelationFilter aENFamilyRelationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ ��� ��������� �� ������� */
	public ENFamilyRelationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFamilyRelationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. �������� ������ �� ������ */
	public ENFamilyRelationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}