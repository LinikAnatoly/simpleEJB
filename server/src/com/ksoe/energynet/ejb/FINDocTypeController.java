
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.filter.FINDocTypeFilter;
import com.ksoe.energynet.valueobject.lists.FINDocTypeShortList;

public interface FINDocTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINDocTypeController";


  /*FINDocType. ��������*/
  public int add(FINDocType aFINDocType) throws java.rmi.RemoteException;

  /*FINDocType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDocType. ��������*/
  public void save(FINDocType aFINDocType) throws  java.rmi.RemoteException;

  /*FINDocType. �������� ������*/
  public FINDocType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDocType. �������� ������ ������*/
  public FINDocTypeShortList getList() throws  java.rmi.RemoteException;

  /*FINDocType. �������� ������ �� �������*/
  public FINDocTypeShortList getFilteredList(FINDocTypeFilter aFINDocTypeFilter) throws  java.rmi.RemoteException;  
  
  /*FINDocType. �������� ������ ��� ���������*/
  public FINDocTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINDocType. �������� ������ ��� ��������� �� �������*/
  public FINDocTypeShortList getScrollableFilteredList(FINDocTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINDocType. �������� ������ ��� ��������� �� �������*/
  public FINDocTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }