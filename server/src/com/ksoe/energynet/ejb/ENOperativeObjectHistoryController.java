
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOperativeObjectHistory;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectHistoryShortList;

public interface ENOperativeObjectHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOperativeObjectHistoryController";


  /*ENOperativeObjectHistory. ��������*/
  public int add(ENOperativeObjectHistory aENOperativeObjectHistory) throws java.rmi.RemoteException;

  /*ENOperativeObjectHistory. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. ��������*/
  public void save(ENOperativeObjectHistory aENOperativeObjectHistory) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. �������� ������*/
  public ENOperativeObjectHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. �������� ������ ������*/
  public ENOperativeObjectHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. �������� ������ �� �������*/
  public ENOperativeObjectHistoryShortList getFilteredList(ENOperativeObjectHistoryFilter aENOperativeObjectHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObjectHistory. �������� ������ ��� ���������*/
  public ENOperativeObjectHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObjectHistory. �������� ������ ��� ��������� �� �������*/
  public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOperativeObjectHistory. �������� ������ ��� ��������� �� �������*/
  public ENOperativeObjectHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENOperativeObjectHistory. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENOperativeObjectHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }