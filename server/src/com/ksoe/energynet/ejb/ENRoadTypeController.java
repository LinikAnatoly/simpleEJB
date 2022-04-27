
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.filter.ENRoadTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENRoadTypeShortList;

public interface ENRoadTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRoadTypeController";


  /*ENRoadType. ��������*/
  public int add(ENRoadType aENRoadType) throws java.rmi.RemoteException;

  /*ENRoadType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadType. ��������*/
  public void save(ENRoadType aENRoadType) throws  java.rmi.RemoteException;

  /*ENRoadType. �������� ������*/
  public ENRoadType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadType. �������� ������ ������*/
  public ENRoadTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENRoadType. �������� ������ �� �������*/
  public ENRoadTypeShortList getFilteredList(ENRoadTypeFilter aENRoadTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENRoadType. �������� ������ ��� ���������*/
  public ENRoadTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRoadType. �������� ������ ��� ��������� �� �������*/
  public ENRoadTypeShortList getScrollableFilteredList(ENRoadTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRoadType. �������� ������ ��� ��������� �� �������*/
  public ENRoadTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }