
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetStatusShortList;

public interface ENTravelSheetStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetStatusController";


  /*ENTravelSheetStatus. ��������*/
  public int add(ENTravelSheetStatus aENTravelSheetStatus) throws java.rmi.RemoteException;

  /*ENTravelSheetStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. ��������*/
  public void save(ENTravelSheetStatus aENTravelSheetStatus) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. �������� ������*/
  public ENTravelSheetStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. �������� ������ ������*/
  public ENTravelSheetStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. �������� ������ �� �������*/
  public ENTravelSheetStatusShortList getFilteredList(ENTravelSheetStatusFilter aENTravelSheetStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetStatus. �������� ������ ��� ���������*/
  public ENTravelSheetStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetStatus. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetStatusShortList getScrollableFilteredList(ENTravelSheetStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetStatus. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }