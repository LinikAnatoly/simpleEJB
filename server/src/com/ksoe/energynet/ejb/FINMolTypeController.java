
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.filter.FINMolTypeFilter;
import com.ksoe.energynet.valueobject.lists.FINMolTypeShortList;

public interface FINMolTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMolTypeController";


  /*FINMolType. ��������*/
  public int add(FINMolType aFINMolType) throws java.rmi.RemoteException;

  /*FINMolType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolType. ��������*/
  public void save(FINMolType aFINMolType) throws  java.rmi.RemoteException;

  /*FINMolType. �������� ������*/
  public FINMolType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolType. �������� ������ ������*/
  public FINMolTypeShortList getList() throws  java.rmi.RemoteException;

  /*FINMolType. �������� ������ �� �������*/
  public FINMolTypeShortList getFilteredList(FINMolTypeFilter aFINMolTypeFilter) throws  java.rmi.RemoteException;  
  
  /*FINMolType. �������� ������ ��� ���������*/
  public FINMolTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINMolType. �������� ������ ��� ��������� �� �������*/
  public FINMolTypeShortList getScrollableFilteredList(FINMolTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINMolType. �������� ������ ��� ��������� �� �������*/
  public FINMolTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }