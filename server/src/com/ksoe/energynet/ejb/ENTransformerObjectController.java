
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransformerObject;
import com.ksoe.energynet.valueobject.filter.ENTransformerObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENTransformerObjectShortList;

public interface ENTransformerObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransformerObjectController";


  /*ENTransformerObject. ��������*/
  public int add(ENTransformerObject aENTransformerObject) throws java.rmi.RemoteException;

  /*ENTransformerObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransformerObject. ��������*/
  public void save(ENTransformerObject aENTransformerObject) throws  java.rmi.RemoteException;

  /*ENTransformerObject. �������� ������*/
  public ENTransformerObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransformerObject. �������� ������ ������*/
  public ENTransformerObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENTransformerObject. �������� ������ �� �������*/
  public ENTransformerObjectShortList getFilteredList(ENTransformerObjectFilter aENTransformerObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransformerObject. �������� ������ ��� ���������*/
  public ENTransformerObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransformerObject. �������� ������ ��� ��������� �� �������*/
  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransformerObject. �������� ������ ��� ��������� �� �������*/
  public ENTransformerObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }