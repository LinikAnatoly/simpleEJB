
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENManningTable;
import com.ksoe.energynet.valueobject.filter.ENManningTableFilter;
import com.ksoe.energynet.valueobject.lists.ENManningTableShortList;

public interface ENManningTableController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENManningTableController";


  /*ENManningTable. ��������*/
  public int add(ENManningTable aENManningTable) throws java.rmi.RemoteException;

  /*ENManningTable. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable. ��������*/
  public void save(ENManningTable aENManningTable) throws  java.rmi.RemoteException;

  /*ENManningTable. �������� ������*/
  public ENManningTable getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable. �������� ������ ������*/
  public ENManningTableShortList getList() throws  java.rmi.RemoteException;

  /*ENManningTable. �������� ������ �� �������*/
  public ENManningTableShortList getFilteredList(ENManningTableFilter aENManningTableFilter) throws  java.rmi.RemoteException;  
  
  /*ENManningTable. �������� ������ ��� ���������*/
  public ENManningTableShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENManningTable. �������� ������ ��� ��������� �� �������*/
  public ENManningTableShortList getScrollableFilteredList(ENManningTableFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENManningTable. �������� ������ ��� ��������� �� �������*/
  public ENManningTableShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }