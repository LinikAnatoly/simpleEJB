
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemShortList;

public interface SCUsageInputItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemController";


  /*SCUsageInputItem. ��������*/
  public int add(SCUsageInputItem aSCUsageInputItem) throws java.rmi.RemoteException;

  /*SCUsageInputItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItem. ��������*/
  public void save(SCUsageInputItem aSCUsageInputItem) throws  java.rmi.RemoteException;

  /*SCUsageInputItem. �������� ������*/
  public SCUsageInputItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItem. �������� ������ ������*/
  public SCUsageInputItemShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItem. �������� ������ �� �������*/
  public SCUsageInputItemShortList getFilteredList(SCUsageInputItemFilter aSCUsageInputItemFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItem. �������� ������ ��� ���������*/
  public SCUsageInputItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItem. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItem. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItem. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }