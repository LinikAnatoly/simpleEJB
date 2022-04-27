
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.filter.FINChargeTypeFilter;
import com.ksoe.energynet.valueobject.lists.FINChargeTypeShortList;

public interface FINChargeTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINChargeTypeController";


  /*FINChargeType. ��������*/
  public int add(FINChargeType aFINChargeType) throws java.rmi.RemoteException;

  /*FINChargeType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeType. ��������*/
  public void save(FINChargeType aFINChargeType) throws  java.rmi.RemoteException;

  /*FINChargeType. �������� ������*/
  public FINChargeType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeType. �������� ������ ������*/
  public FINChargeTypeShortList getList() throws  java.rmi.RemoteException;

  /*FINChargeType. �������� ������ �� �������*/
  public FINChargeTypeShortList getFilteredList(FINChargeTypeFilter aFINChargeTypeFilter) throws  java.rmi.RemoteException;  
  
  /*FINChargeType. �������� ������ ��� ���������*/
  public FINChargeTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINChargeType. �������� ������ ��� ��������� �� �������*/
  public FINChargeTypeShortList getScrollableFilteredList(FINChargeTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINChargeType. �������� ������ ��� ��������� �� �������*/
  public FINChargeTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINChargeType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(FINChargeTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }