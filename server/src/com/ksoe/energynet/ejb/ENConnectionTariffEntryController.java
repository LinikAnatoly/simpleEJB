
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENConnectionTariffEntry;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffEntryFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffEntryShortList;

public interface ENConnectionTariffEntryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENConnectionTariffEntryController";


  /*ENConnectionTariffEntry. ��������*/
  public int add(ENConnectionTariffEntry aENConnectionTariffEntry) throws java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. ��������*/
  public void save(ENConnectionTariffEntry aENConnectionTariffEntry) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������*/
  public ENConnectionTariffEntry getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������ ������*/
  public ENConnectionTariffEntryShortList getList() throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������ �� �������*/
  public ENConnectionTariffEntryShortList getFilteredList(ENConnectionTariffEntryFilter aENConnectionTariffEntryFilter) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������ ��� ���������*/
  public ENConnectionTariffEntryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������ ��� ��������� �� �������*/
  public ENConnectionTariffEntryShortList getScrollableFilteredList(ENConnectionTariffEntryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENConnectionTariffEntry. �������� ������ ��� ��������� �� �������*/
  public ENConnectionTariffEntryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENConnectionTariffEntry. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENConnectionTariffEntryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }