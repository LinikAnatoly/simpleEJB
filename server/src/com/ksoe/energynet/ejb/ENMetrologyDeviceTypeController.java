
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyDeviceType;
import com.ksoe.energynet.valueobject.filter.ENMetrologyDeviceTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyDeviceTypeShortList;

public interface ENMetrologyDeviceTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyDeviceTypeController";


  /*ENMetrologyDeviceType. ��������*/
  public int add(ENMetrologyDeviceType aENMetrologyDeviceType) throws java.rmi.RemoteException;

  /*ENMetrologyDeviceType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. ��������*/
  public void save(ENMetrologyDeviceType aENMetrologyDeviceType) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. �������� ������*/
  public ENMetrologyDeviceType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. �������� ������ ������*/
  public ENMetrologyDeviceTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. �������� ������ �� �������*/
  public ENMetrologyDeviceTypeShortList getFilteredList(ENMetrologyDeviceTypeFilter aENMetrologyDeviceTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDeviceType. �������� ������ ��� ���������*/
  public ENMetrologyDeviceTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDeviceType. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyDeviceTypeShortList getScrollableFilteredList(ENMetrologyDeviceTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyDeviceType. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyDeviceTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }