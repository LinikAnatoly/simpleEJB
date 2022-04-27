
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistanceShortList;

public interface ENTransportRouteDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRouteDistanceController";


  /*ENTransportRouteDistance. ��������*/
  public int add(ENTransportRouteDistance aENTransportRouteDistance) throws java.rmi.RemoteException;

  /*ENTransportRouteDistance. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance. ��������*/
  public void save(ENTransportRouteDistance aENTransportRouteDistance) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance. �������� ������*/
  public ENTransportRouteDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance. �������� ������ ������*/
  public ENTransportRouteDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance. �������� ������ �� �������*/
  public ENTransportRouteDistanceShortList getFilteredList(ENTransportRouteDistanceFilter aENTransportRouteDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRouteDistance. �������� ������ ��� ���������*/
  public ENTransportRouteDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRouteDistance. �������� ������ ��� ��������� �� �������*/
  public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRouteDistance. �������� ������ ��� ��������� �� �������*/
  public ENTransportRouteDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRouteDistance. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportRouteDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public BigDecimal getAggregateSumOfKoefs(int code) throws java.rmi.RemoteException;
  }