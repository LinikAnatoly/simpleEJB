
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsHistoryShortList;

public interface ENAccumulatorsHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAccumulatorsHistoryController";


  /*ENAccumulatorsHistory. ��������*/
  public int add(ENAccumulatorsHistory aENAccumulatorsHistory) throws java.rmi.RemoteException;

  /*ENAccumulatorsHistory. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. ��������*/
  public void save(ENAccumulatorsHistory aENAccumulatorsHistory) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. �������� ������*/
  public ENAccumulatorsHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. �������� ������ ������*/
  public ENAccumulatorsHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. �������� ������ �� �������*/
  public ENAccumulatorsHistoryShortList getFilteredList(ENAccumulatorsHistoryFilter aENAccumulatorsHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsHistory. �������� ������ ��� ���������*/
  public ENAccumulatorsHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsHistory. �������� ������ ��� ��������� �� �������*/
  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAccumulatorsHistory. �������� ������ ��� ��������� �� �������*/
  public ENAccumulatorsHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAccumulatorsHistory. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENAccumulatorsHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }