
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.filter.ENContractFilter;
import com.ksoe.energynet.valueobject.lists.ENContractShortList;

public interface ENContractController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENContractController";


  /*ENContract. ��������*/
  public int add(ENContract aENContract) throws java.rmi.RemoteException;

  /*ENContract. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContract. ��������*/
  public void save(ENContract aENContract) throws  java.rmi.RemoteException;

  /*ENContract. �������� ������*/
  public ENContract getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContract. �������� ������ ������*/
  public ENContractShortList getList() throws  java.rmi.RemoteException;

  /*ENContract. �������� ������ �� �������*/
  public ENContractShortList getFilteredList(ENContractFilter aENContractFilter) throws  java.rmi.RemoteException;  
  
  /*ENContract. �������� ������ ��� ���������*/
  public ENContractShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENContract. �������� ������ ��� ��������� �� �������*/
  public ENContractShortList getScrollableFilteredList(ENContractFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENContract. �������� ������ ��� ��������� �� �������*/
  public ENContractShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }