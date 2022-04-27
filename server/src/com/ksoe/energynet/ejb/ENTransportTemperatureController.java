
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportTemperature;
import com.ksoe.energynet.valueobject.filter.ENTransportTemperatureFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportTemperatureShortList;

public interface ENTransportTemperatureController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportTemperatureController";


  /*ENTransportTemperature. ��������*/
  public int add(ENTransportTemperature aENTransportTemperature) throws java.rmi.RemoteException;

  /*ENTransportTemperature. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. ��������*/
  public void save(ENTransportTemperature aENTransportTemperature) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. �������� ������*/
  public ENTransportTemperature getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. �������� ������ ������*/
  public ENTransportTemperatureShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportTemperature. �������� ������ �� �������*/
  public ENTransportTemperatureShortList getFilteredList(ENTransportTemperatureFilter aENTransportTemperatureFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportTemperature. �������� ������ ��� ���������*/
  public ENTransportTemperatureShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportTemperature. �������� ������ ��� ��������� �� �������*/
  public ENTransportTemperatureShortList getScrollableFilteredList(ENTransportTemperatureFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportTemperature. �������� ������ ��� ��������� �� �������*/
  public ENTransportTemperatureShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportTemperature. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportTemperatureFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }