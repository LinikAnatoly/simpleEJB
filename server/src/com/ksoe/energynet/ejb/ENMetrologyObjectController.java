
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyObject;
import com.ksoe.energynet.valueobject.filter.ENMetrologyObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyObjectShortList;

public interface ENMetrologyObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyObjectController";


  /*ENMetrologyObject. ��������*/
  public int add(ENMetrologyObject aENMetrologyObject) throws java.rmi.RemoteException;

  /*ENMetrologyObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. ��������*/
  public void save(ENMetrologyObject aENMetrologyObject) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. �������� ������*/
  public ENMetrologyObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. �������� ������ ������*/
  public ENMetrologyObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyObject. �������� ������ �� �������*/
  public ENMetrologyObjectShortList getFilteredList(ENMetrologyObjectFilter aENMetrologyObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyObject. �������� ������ ��� ���������*/
  public ENMetrologyObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyObject. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyObjectShortList getScrollableFilteredList(ENMetrologyObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyObject. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }