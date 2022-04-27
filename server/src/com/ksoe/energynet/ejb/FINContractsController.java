
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.filter.FINContractsFilter;
import com.ksoe.energynet.valueobject.lists.FINContractsShortList;

public interface FINContractsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINContractsController";


  /*FINContracts. ��������*/
  public int add(FINContracts aFINContracts) throws java.rmi.RemoteException;

  /*FINContracts. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINContracts. ��������*/
  public void save(FINContracts aFINContracts) throws  java.rmi.RemoteException;

  /*FINContracts. �������� ������*/
  public FINContracts getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINContracts. �������� ������ ������*/
  public FINContractsShortList getList() throws  java.rmi.RemoteException;

  /*FINContracts. �������� ������ �� �������*/
  public FINContractsShortList getFilteredList(FINContractsFilter aFINContractsFilter) throws  java.rmi.RemoteException;  
  
  /*FINContracts. �������� ������ ��� ���������*/
  public FINContractsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINContracts. �������� ������ ��� ��������� �� �������*/
  public FINContractsShortList getScrollableFilteredList(FINContractsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINContracts. �������� ������ ��� ��������� �� �������*/
  public FINContractsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*FINContracts. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(FINContractsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  /*FINContracts. �������� ������ �� �� �� id*/
  public FINContracts getObjectFromFK(int id) throws java.rmi.RemoteException; 

  }