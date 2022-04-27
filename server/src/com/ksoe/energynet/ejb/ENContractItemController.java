
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENContractItem;
import com.ksoe.energynet.valueobject.filter.ENContractItemFilter;
import com.ksoe.energynet.valueobject.lists.ENContractItemShortList;

public interface ENContractItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENContractItemController";


  /*ENContractItem. ��������*/
  public int add(ENContractItem aENContractItem) throws java.rmi.RemoteException;

  /*ENContractItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContractItem. ��������*/
  public void save(ENContractItem aENContractItem) throws  java.rmi.RemoteException;

  /*ENContractItem. �������� ������*/
  public ENContractItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContractItem. �������� ������ ������*/
  public ENContractItemShortList getList() throws  java.rmi.RemoteException;

  /*ENContractItem. �������� ������ �� �������*/
  public ENContractItemShortList getFilteredList(ENContractItemFilter aENContractItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENContractItem. �������� ������ ��� ���������*/
  public ENContractItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENContractItem. �������� ������ ��� ��������� �� �������*/
  public ENContractItemShortList getScrollableFilteredList(ENContractItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENContractItem. �������� ������ ��� ��������� �� �������*/
  public ENContractItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }