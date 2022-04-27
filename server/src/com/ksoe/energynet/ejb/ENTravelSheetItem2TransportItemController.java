
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;

public interface ENTravelSheetItem2TransportItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItem2TransportItemController";


  /*ENTravelSheetItem2TransportItem. ��������*/
  public int add(ENTravelSheetItem2TransportItem aENTravelSheetItem2TransportItem) throws java.rmi.RemoteException;

  /*ENTravelSheetItem2TransportItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem2TransportItem. ��������*/
  public void save(ENTravelSheetItem2TransportItem aENTravelSheetItem2TransportItem) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem2TransportItem. �������� ������*/
  public ENTravelSheetItem2TransportItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem2TransportItem. �������� ������ ������*/
  public ENTravelSheetItem2TransportItemShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItem2TransportItem. �������� ������ �� �������*/
  public ENTravelSheetItem2TransportItemShortList getFilteredList(ENTravelSheetItem2TransportItemFilter aENTravelSheetItem2TransportItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItem2TransportItem. �������� ������ ��� ���������*/
  public ENTravelSheetItem2TransportItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItem2TransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItem2TransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItem2TransportItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }