
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;

public interface ENHumenItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENHumenItemController";


  /*ENHumenItem. ��������*/
  public int add(ENHumenItem aENHumenItem) throws java.rmi.RemoteException;

  /*ENHumenItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;
  public void remove(int anObjectCode, boolean isFromWorkOrderByt) throws  java.rmi.RemoteException;
  
  /*ENHumenItem. ��������*/
  public void save(ENHumenItem aENHumenItem) throws  java.rmi.RemoteException;
  public void save(ENHumenItem object, boolean isFromWorkOrderByt) throws java.rmi.RemoteException;

  /*ENHumenItem. �������� ������*/
  public ENHumenItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItem. �������� ������ ������*/
  public ENHumenItemShortList getList() throws  java.rmi.RemoteException;

  /*ENHumenItem. �������� ������ �� �������*/
  public ENHumenItemShortList getFilteredList(ENHumenItemFilter aENHumenItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENHumenItem. �������� ������ ��� ���������*/
  public ENHumenItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENHumenItem. �������� ������ ��� ��������� �� �������*/
  public ENHumenItemShortList getScrollableFilteredList(ENHumenItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENHumenItem. �������� ������ ��� ��������� �� �������*/
  public ENHumenItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }