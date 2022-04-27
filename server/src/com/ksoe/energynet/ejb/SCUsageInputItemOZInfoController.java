
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZInfoShortList;

public interface SCUsageInputItemOZInfoController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZInfoController";


  /*SCUsageInputItemOZInfo. ��������*/
  public int add(SCUsageInputItemOZInfo aSCUsageInputItemOZInfo) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. ��������*/
  public void save(SCUsageInputItemOZInfo aSCUsageInputItemOZInfo) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. �������� ������*/
  public SCUsageInputItemOZInfo getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. �������� ������ ������*/
  public SCUsageInputItemOZInfoShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. �������� ������ �� �������*/
  public SCUsageInputItemOZInfoShortList getFilteredList(SCUsageInputItemOZInfoFilter aSCUsageInputItemOZInfoFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZInfo. �������� ������ ��� ���������*/
  public SCUsageInputItemOZInfoShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZInfo. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfoFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZInfo. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZInfoShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZInfo. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZInfoFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }