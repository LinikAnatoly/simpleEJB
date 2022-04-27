
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetTypeShortList;

public interface ENTravelSheetTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetTypeController";


  /*ENTravelSheetType. ��������*/
  public int add(ENTravelSheetType aENTravelSheetType) throws java.rmi.RemoteException;

  /*ENTravelSheetType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. ��������*/
  public void save(ENTravelSheetType aENTravelSheetType) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. �������� ������*/
  public ENTravelSheetType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. �������� ������ ������*/
  public ENTravelSheetTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetType. �������� ������ �� �������*/
  public ENTravelSheetTypeShortList getFilteredList(ENTravelSheetTypeFilter aENTravelSheetTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetType. �������� ������ ��� ���������*/
  public ENTravelSheetTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetType. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetTypeShortList getScrollableFilteredList(ENTravelSheetTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetType. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }