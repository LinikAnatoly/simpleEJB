
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINChargeHistory;
import com.ksoe.energynet.valueobject.filter.FINChargeHistoryFilter;
import com.ksoe.energynet.valueobject.lists.FINChargeHistoryShortList;

public interface FINChargeHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINChargeHistoryController";


  /*FINChargeHistory. ��������*/
  public int add(FINChargeHistory aFINChargeHistory) throws java.rmi.RemoteException;

  /*FINChargeHistory. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeHistory. ��������*/
  public void save(FINChargeHistory aFINChargeHistory) throws  java.rmi.RemoteException;

  /*FINChargeHistory. �������� ������*/
  public FINChargeHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeHistory. �������� ������ ������*/
  public FINChargeHistoryShortList getList() throws  java.rmi.RemoteException;

  /*FINChargeHistory. �������� ������ �� �������*/
  public FINChargeHistoryShortList getFilteredList(FINChargeHistoryFilter aFINChargeHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*FINChargeHistory. �������� ������ ��� ���������*/
  public FINChargeHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINChargeHistory. �������� ������ ��� ��������� �� �������*/
  public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINChargeHistory. �������� ������ ��� ��������� �� �������*/
  public FINChargeHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINChargeHistory. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(FINChargeHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }