
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyDevice;
import com.ksoe.energynet.valueobject.filter.ENMetrologyDeviceFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyDeviceShortList;

public interface ENMetrologyDeviceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyDeviceController";


  /*ENMetrologyDevice. ��������*/
  public int add(ENMetrologyDevice aENMetrologyDevice) throws java.rmi.RemoteException;

  /*ENMetrologyDevice. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDevice. ��������*/
  public void save(ENMetrologyDevice aENMetrologyDevice) throws  java.rmi.RemoteException;

  /*ENMetrologyDevice. �������� ������*/
  public ENMetrologyDevice getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDevice. �������� ������ ������*/
  public ENMetrologyDeviceShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyDevice. �������� ������ �� �������*/
  public ENMetrologyDeviceShortList getFilteredList(ENMetrologyDeviceFilter aENMetrologyDeviceFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDevice. �������� ������ ��� ���������*/
  public ENMetrologyDeviceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDevice. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyDeviceShortList getScrollableFilteredList(ENMetrologyDeviceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyDevice. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyDeviceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }