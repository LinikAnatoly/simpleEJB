
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.filter.ENHumenItemKindFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemKindShortList;

public interface ENHumenItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENHumenItemKindController";


  /*ENHumenItemKind. ��������*/
  public int add(ENHumenItemKind aENHumenItemKind) throws java.rmi.RemoteException;

  /*ENHumenItemKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. ��������*/
  public void save(ENHumenItemKind aENHumenItemKind) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. �������� ������*/
  public ENHumenItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. �������� ������ ������*/
  public ENHumenItemKindShortList getList() throws  java.rmi.RemoteException;

  /*ENHumenItemKind. �������� ������ �� �������*/
  public ENHumenItemKindShortList getFilteredList(ENHumenItemKindFilter aENHumenItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENHumenItemKind. �������� ������ ��� ���������*/
  public ENHumenItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENHumenItemKind. �������� ������ ��� ��������� �� �������*/
  public ENHumenItemKindShortList getScrollableFilteredList(ENHumenItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENHumenItemKind. �������� ������ ��� ��������� �� �������*/
  public ENHumenItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }