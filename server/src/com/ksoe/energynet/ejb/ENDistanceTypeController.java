
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.filter.ENDistanceTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceTypeShortList;

public interface ENDistanceTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDistanceTypeController";


  /*ENDistanceType. ��������*/
  public int add(ENDistanceType aENDistanceType) throws java.rmi.RemoteException;

  /*ENDistanceType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistanceType. ��������*/
  public void save(ENDistanceType aENDistanceType) throws  java.rmi.RemoteException;

  /*ENDistanceType. �������� ������*/
  public ENDistanceType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistanceType. �������� ������ ������*/
  public ENDistanceTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENDistanceType. �������� ������ �� �������*/
  public ENDistanceTypeShortList getFilteredList(ENDistanceTypeFilter aENDistanceTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENDistanceType. �������� ������ ��� ���������*/
  public ENDistanceTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDistanceType. �������� ������ ��� ��������� �� �������*/
  public ENDistanceTypeShortList getScrollableFilteredList(ENDistanceTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDistanceType. �������� ������ ��� ��������� �� �������*/
  public ENDistanceTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }