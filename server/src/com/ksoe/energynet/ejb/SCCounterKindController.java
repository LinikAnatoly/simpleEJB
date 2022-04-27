
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.filter.SCCounterKindFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterKindShortList;

public interface SCCounterKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterKindController";


  /*SCCounterKind. ��������*/
  public int add(SCCounterKind aSCCounterKind) throws java.rmi.RemoteException;

  /*SCCounterKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterKind. ��������*/
  public void save(SCCounterKind aSCCounterKind) throws  java.rmi.RemoteException;

  /*SCCounterKind. �������� ������*/
  public SCCounterKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterKind. �������� ������ ������*/
  public SCCounterKindShortList getList() throws  java.rmi.RemoteException;

  /*SCCounterKind. �������� ������ �� �������*/
  public SCCounterKindShortList getFilteredList(SCCounterKindFilter aSCCounterKindFilter) throws  java.rmi.RemoteException;  
  
  /*SCCounterKind. �������� ������ ��� ���������*/
  public SCCounterKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCCounterKind. �������� ������ ��� ��������� �� �������*/
  public SCCounterKindShortList getScrollableFilteredList(SCCounterKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCCounterKind. �������� ������ ��� ��������� �� �������*/
  public SCCounterKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounterKind. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCCounterKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }