
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2SCCounterShortList;

public interface SCUsageInputItemOZ2SCCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZ2SCCounterController";


  /*SCUsageInputItemOZ2SCCounter. ��������*/
  public int add(SCUsageInputItemOZ2SCCounter aSCUsageInputItemOZ2SCCounter) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. ��������*/
  public void save(SCUsageInputItemOZ2SCCounter aSCUsageInputItemOZ2SCCounter) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. �������� ������*/
  public SCUsageInputItemOZ2SCCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. �������� ������ ������*/
  public SCUsageInputItemOZ2SCCounterShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. �������� ������ �� �������*/
  public SCUsageInputItemOZ2SCCounterShortList getFilteredList(SCUsageInputItemOZ2SCCounterFilter aSCUsageInputItemOZ2SCCounterFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2SCCounter. �������� ������ ��� ���������*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2SCCounter. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZ2SCCounter. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZ2SCCounter. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZ2SCCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }