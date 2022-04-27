
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAccumulatorStatus;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorStatusShortList;

public interface ENAccumulatorStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAccumulatorStatusController";


  /*ENAccumulatorStatus. ��������*/
  public int add(ENAccumulatorStatus aENAccumulatorStatus) throws java.rmi.RemoteException;

  /*ENAccumulatorStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorStatus. ��������*/
  public void save(ENAccumulatorStatus aENAccumulatorStatus) throws  java.rmi.RemoteException;

  /*ENAccumulatorStatus. �������� ������*/
  public ENAccumulatorStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorStatus. �������� ������ ������*/
  public ENAccumulatorStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENAccumulatorStatus. �������� ������ �� �������*/
  public ENAccumulatorStatusShortList getFilteredList(ENAccumulatorStatusFilter aENAccumulatorStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorStatus. �������� ������ ��� ���������*/
  public ENAccumulatorStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorStatus. �������� ������ ��� ��������� �� �������*/
  public ENAccumulatorStatusShortList getScrollableFilteredList(ENAccumulatorStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAccumulatorStatus. �������� ������ ��� ��������� �� �������*/
  public ENAccumulatorStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAccumulatorStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENAccumulatorStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }