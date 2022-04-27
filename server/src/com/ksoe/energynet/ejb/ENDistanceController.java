
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;

public interface ENDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDistanceController";


  /*ENDistance. ��������*/
  public int add(ENDistance aENDistance) throws java.rmi.RemoteException;

  /*ENDistance. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistance. ��������*/
  public void save(ENDistance aENDistance) throws  java.rmi.RemoteException;

  /*ENDistance. �������� ������*/
  public ENDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistance. �������� ������ ������*/
  public ENDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENDistance. �������� ������ �� �������*/
  public ENDistanceShortList getFilteredList(ENDistanceFilter aENDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENDistance. �������� ������ ��� ���������*/
  public ENDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDistance. �������� ������ ��� ��������� �� �������*/
  public ENDistanceShortList getScrollableFilteredList(ENDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDistance. �������� ������ ��� ��������� �� �������*/
  public ENDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }