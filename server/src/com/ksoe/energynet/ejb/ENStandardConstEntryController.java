
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENStandardConstEntry;
import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstEntryShortList;

public interface ENStandardConstEntryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENStandardConstEntryController";


  /*ENStandardConstEntry. ��������*/
  public int add(ENStandardConstEntry aENStandardConstEntry) throws java.rmi.RemoteException;

  /*ENStandardConstEntry. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. ��������*/
  public void save(ENStandardConstEntry aENStandardConstEntry) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. �������� ������*/
  public ENStandardConstEntry getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. �������� ������ ������*/
  public ENStandardConstEntryShortList getList() throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. �������� ������ �� �������*/
  public ENStandardConstEntryShortList getFilteredList(ENStandardConstEntryFilter aENStandardConstEntryFilter) throws  java.rmi.RemoteException;  
  
  /*ENStandardConstEntry. �������� ������ ��� ���������*/
  public ENStandardConstEntryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENStandardConstEntry. �������� ������ ��� ��������� �� �������*/
  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENStandardConstEntry. �������� ������ ��� ��������� �� �������*/
  public ENStandardConstEntryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENStandardConstEntry. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENStandardConstEntryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }