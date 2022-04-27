
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.filter.CNSubsystemTypeFilter;
import com.ksoe.energynet.valueobject.lists.CNSubsystemTypeShortList;

public interface CNSubsystemTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNSubsystemTypeController";


  /*CNSubsystemType. ��������*/
  public int add(CNSubsystemType aCNSubsystemType) throws java.rmi.RemoteException;

  /*CNSubsystemType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNSubsystemType. ��������*/
  public void save(CNSubsystemType aCNSubsystemType) throws  java.rmi.RemoteException;

  /*CNSubsystemType. �������� ������*/
  public CNSubsystemType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNSubsystemType. �������� ������ ������*/
  public CNSubsystemTypeShortList getList() throws  java.rmi.RemoteException;

  /*CNSubsystemType. �������� ������ �� �������*/
  public CNSubsystemTypeShortList getFilteredList(CNSubsystemTypeFilter aCNSubsystemTypeFilter) throws  java.rmi.RemoteException;  
  
  /*CNSubsystemType. �������� ������ ��� ���������*/
  public CNSubsystemTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*CNSubsystemType. �������� ������ ��� ��������� �� �������*/
  public CNSubsystemTypeShortList getScrollableFilteredList(CNSubsystemTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*CNSubsystemType. �������� ������ ��� ��������� �� �������*/
  public CNSubsystemTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }