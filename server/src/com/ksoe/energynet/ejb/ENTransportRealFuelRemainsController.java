
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRealFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTransportRealFuelRemainsFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRealFuelRemainsShortList;

public interface ENTransportRealFuelRemainsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRealFuelRemainsController";


  /*ENTransportRealFuelRemains. ��������*/
  public int add(ENTransportRealFuelRemains aENTransportRealFuelRemains) throws java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. ��������*/
  public void save(ENTransportRealFuelRemains aENTransportRealFuelRemains) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. �������� ������*/
  public ENTransportRealFuelRemains getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. �������� ������ ������*/
  public ENTransportRealFuelRemainsShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. �������� ������ �� �������*/
  public ENTransportRealFuelRemainsShortList getFilteredList(ENTransportRealFuelRemainsFilter aENTransportRealFuelRemainsFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRealFuelRemains. �������� ������ ��� ���������*/
  public ENTransportRealFuelRemainsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRealFuelRemains. �������� ������ ��� ��������� �� �������*/
  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemainsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRealFuelRemains. �������� ������ ��� ��������� �� �������*/
  public ENTransportRealFuelRemainsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRealFuelRemains. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportRealFuelRemainsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }