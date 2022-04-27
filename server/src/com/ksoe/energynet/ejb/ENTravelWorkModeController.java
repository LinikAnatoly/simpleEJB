
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelWorkMode;
import com.ksoe.energynet.valueobject.filter.ENTravelWorkModeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelWorkModeShortList;

public interface ENTravelWorkModeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelWorkModeController";


  /*ENTravelWorkMode. ��������*/
  public int add(ENTravelWorkMode aENTravelWorkMode) throws java.rmi.RemoteException;

  /*ENTravelWorkMode. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. ��������*/
  public void save(ENTravelWorkMode aENTravelWorkMode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. �������� ������*/
  public ENTravelWorkMode getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. �������� ������ ������*/
  public ENTravelWorkModeShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. �������� ������ �� �������*/
  public ENTravelWorkModeShortList getFilteredList(ENTravelWorkModeFilter aENTravelWorkModeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelWorkMode. �������� ������ ��� ���������*/
  public ENTravelWorkModeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelWorkMode. �������� ������ ��� ��������� �� �������*/
  public ENTravelWorkModeShortList getScrollableFilteredList(ENTravelWorkModeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelWorkMode. �������� ������ ��� ��������� �� �������*/
  public ENTravelWorkModeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }