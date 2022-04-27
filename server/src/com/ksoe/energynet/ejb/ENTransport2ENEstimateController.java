
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;

public interface ENTransport2ENEstimateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransport2ENEstimateController";


  /*ENTransport2ENEstimate. ��������*/
  public int add(ENTransport2ENEstimate aENTransport2ENEstimate) throws java.rmi.RemoteException;

  /*ENTransport2ENEstimate. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransport2ENEstimate. ��������*/
  public void save(ENTransport2ENEstimate aENTransport2ENEstimate) throws  java.rmi.RemoteException;

  /*ENTransport2ENEstimate. �������� ������*/
  public ENTransport2ENEstimate getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransport2ENEstimate. �������� ������ ������*/
  public ENTransport2ENEstimateShortList getList() throws  java.rmi.RemoteException;

  /*ENTransport2ENEstimate. �������� ������ �� �������*/
  public ENTransport2ENEstimateShortList getFilteredList(ENTransport2ENEstimateFilter aENTransport2ENEstimateFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransport2ENEstimate. �������� ������ ��� ���������*/
  public ENTransport2ENEstimateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransport2ENEstimate. �������� ������ ��� ��������� �� �������*/
  public ENTransport2ENEstimateShortList getScrollableFilteredList(ENTransport2ENEstimateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransport2ENEstimate. �������� ������ ��� ��������� �� �������*/
  public ENTransport2ENEstimateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }