//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment2ENElement;
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENElement;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2ENElementShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENElementShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENElementFilter;


public interface ENDocAttachment2ENElementController extends javax.ejb.EJBObject {
    String JNDI_NAME = "ksoe/energynet/ENDocAttachment2ENElementController";

    /* ENDocAttachment2ENElement. �������� */
	int add(ENDocAttachment2ENElement aENDocAttachment2ENElement)
            throws java.rmi.RemoteException;

    int add(ENDocAttachment object, byte[] aFile, String fileName, int elementCode)
			throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. ������� */
	void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� */
	void save(ENDocAttachment2ENElement aENDocAttachment2ENElement)
            throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ */
	ENDocAttachment2ENElement getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ ������ */
	ENDocAttachment2ENElementShortList getList()
            throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ �� ������� */
	ENDocAttachment2ENElementShortList getFilteredList(
			ENDocAttachment2ENElementFilter aENDocAttachment2ENElementFilter)
            throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ ��� ��������� */
	ENDocAttachment2ENElementShortList getScrollableList(int aFromPosition,
														 int aQuantity) throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ ��� ��������� �� ������� */
	ENDocAttachment2ENElementShortList getScrollableFilteredList(
			ENDocAttachment2ENElementFilter aENDocAttachment2ENElementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ ��� ��������� �� ������� */
	ENDocAttachment2ENElementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ ��-����� �� ������� */
	int[] getScrollableFilteredCodeArray(
			ENDocAttachment2ENElementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

    /* ENDocAttachment2ENElement. �������� ������ �� ������ */
	ENDocAttachment2ENElementShort getShortObject(int code)
            throws java.rmi.RemoteException;

}