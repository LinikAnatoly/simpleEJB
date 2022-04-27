
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDestinationOrder;
import com.ksoe.energynet.valueobject.filter.ENDestinationOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENDestinationOrderShortList;

public interface ENDestinationOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDestinationOrderController";


  /*ENDestinationOrder. ��������*/
  public int add(ENDestinationOrder aENDestinationOrder) throws java.rmi.RemoteException;

  /*ENDestinationOrder. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. ��������*/
  public void save(ENDestinationOrder aENDestinationOrder) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. �������� ������*/
  public ENDestinationOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. �������� ������ ������*/
  public ENDestinationOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENDestinationOrder. �������� ������ �� �������*/
  public ENDestinationOrderShortList getFilteredList(ENDestinationOrderFilter aENDestinationOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENDestinationOrder. �������� ������ ��� ���������*/
  public ENDestinationOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDestinationOrder. �������� ������ ��� ��������� �� �������*/
  public ENDestinationOrderShortList getScrollableFilteredList(ENDestinationOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDestinationOrder. �������� ������ ��� ��������� �� �������*/
  public ENDestinationOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENDestinationOrder. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENDestinationOrderFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }