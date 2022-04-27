
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemStatusShortList;

public interface ENEstimateItemStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemStatusController";


  /*ENEstimateItemStatus. ��������*/
  public int add(ENEstimateItemStatus aENEstimateItemStatus) throws java.rmi.RemoteException;

  /*ENEstimateItemStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatus. ��������*/
  public void save(ENEstimateItemStatus aENEstimateItemStatus) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatus. �������� ������*/
  public ENEstimateItemStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatus. �������� ������ ������*/
  public ENEstimateItemStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemStatus. �������� ������ �� �������*/
  public ENEstimateItemStatusShortList getFilteredList(ENEstimateItemStatusFilter aENEstimateItemStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemStatus. �������� ������ ��� ���������*/
  public ENEstimateItemStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemStatus. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemStatusShortList getScrollableFilteredList(ENEstimateItemStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemStatus. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }