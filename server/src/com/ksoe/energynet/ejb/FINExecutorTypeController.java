
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINExecutorType;
import com.ksoe.energynet.valueobject.filter.FINExecutorTypeFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutorTypeShortList;

public interface FINExecutorTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINExecutorTypeController";


  /*FINExecutorType. ��������*/
  public int add(FINExecutorType aFINExecutorType) throws java.rmi.RemoteException;

  /*FINExecutorType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutorType. ��������*/
  public void save(FINExecutorType aFINExecutorType) throws  java.rmi.RemoteException;

  /*FINExecutorType. �������� ������*/
  public FINExecutorType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutorType. �������� ������ ������*/
  public FINExecutorTypeShortList getList() throws  java.rmi.RemoteException;

  /*FINExecutorType. �������� ������ �� �������*/
  public FINExecutorTypeShortList getFilteredList(FINExecutorTypeFilter aFINExecutorTypeFilter) throws  java.rmi.RemoteException;  
  
  /*FINExecutorType. �������� ������ ��� ���������*/
  public FINExecutorTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINExecutorType. �������� ������ ��� ��������� �� �������*/
  public FINExecutorTypeShortList getScrollableFilteredList(FINExecutorTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINExecutorType. �������� ������ ��� ��������� �� �������*/
  public FINExecutorTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINExecutorType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(FINExecutorTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }