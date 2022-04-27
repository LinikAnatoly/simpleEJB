
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINExecutor2Plan;
import com.ksoe.energynet.valueobject.filter.FINExecutor2PlanFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutor2PlanShortList;

public interface FINExecutor2PlanController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINExecutor2PlanController";


  /*FINExecutor2Plan. ��������*/
  public int add(FINExecutor2Plan aFINExecutor2Plan) throws java.rmi.RemoteException;

  /*FINExecutor2Plan. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutor2Plan. ��������*/
  public void save(FINExecutor2Plan aFINExecutor2Plan) throws  java.rmi.RemoteException;

  /*FINExecutor2Plan. �������� ������*/
  public FINExecutor2Plan getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutor2Plan. �������� ������ ������*/
  public FINExecutor2PlanShortList getList() throws  java.rmi.RemoteException;

  /*FINExecutor2Plan. �������� ������ �� �������*/
  public FINExecutor2PlanShortList getFilteredList(FINExecutor2PlanFilter aFINExecutor2PlanFilter) throws  java.rmi.RemoteException;  
  
  /*FINExecutor2Plan. �������� ������ ��� ���������*/
  public FINExecutor2PlanShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINExecutor2Plan. �������� ������ ��� ��������� �� �������*/
  public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2PlanFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINExecutor2Plan. �������� ������ ��� ��������� �� �������*/
  public FINExecutor2PlanShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINExecutor2Plan. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(FINExecutor2PlanFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }