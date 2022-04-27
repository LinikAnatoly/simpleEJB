
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.filter.SCCounterStatusFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterStatusShortList;

public interface SCCounterStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterStatusController";


  /*SCCounterStatus. ��������*/
  public int add(SCCounterStatus aSCCounterStatus) throws java.rmi.RemoteException;

  /*SCCounterStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterStatus. ��������*/
  public void save(SCCounterStatus aSCCounterStatus) throws  java.rmi.RemoteException;

  /*SCCounterStatus. �������� ������*/
  public SCCounterStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterStatus. �������� ������ ������*/
  public SCCounterStatusShortList getList() throws  java.rmi.RemoteException;

  /*SCCounterStatus. �������� ������ �� �������*/
  public SCCounterStatusShortList getFilteredList(SCCounterStatusFilter aSCCounterStatusFilter) throws  java.rmi.RemoteException;  
  
  /*SCCounterStatus. �������� ������ ��� ���������*/
  public SCCounterStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCCounterStatus. �������� ������ ��� ��������� �� �������*/
  public SCCounterStatusShortList getScrollableFilteredList(SCCounterStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCCounterStatus. �������� ������ ��� ��������� �� �������*/
  public SCCounterStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounterStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCCounterStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }