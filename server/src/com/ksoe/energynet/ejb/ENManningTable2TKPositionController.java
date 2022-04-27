
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENManningTable2TKPosition;
import com.ksoe.energynet.valueobject.filter.ENManningTable2TKPositionFilter;
import com.ksoe.energynet.valueobject.lists.ENManningTable2TKPositionShortList;

public interface ENManningTable2TKPositionController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENManningTable2TKPositionController";


  /*ENManningTable2TKPosition. ��������*/
  public int add(ENManningTable2TKPosition aENManningTable2TKPosition) throws java.rmi.RemoteException;

  /*ENManningTable2TKPosition. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable2TKPosition. ��������*/
  public void save(ENManningTable2TKPosition aENManningTable2TKPosition) throws  java.rmi.RemoteException;

  /*ENManningTable2TKPosition. �������� ������*/
  public ENManningTable2TKPosition getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable2TKPosition. �������� ������ ������*/
  public ENManningTable2TKPositionShortList getList() throws  java.rmi.RemoteException;

  /*ENManningTable2TKPosition. �������� ������ �� �������*/
  public ENManningTable2TKPositionShortList getFilteredList(ENManningTable2TKPositionFilter aENManningTable2TKPositionFilter) throws  java.rmi.RemoteException;  
  
  /*ENManningTable2TKPosition. �������� ������ ��� ���������*/
  public ENManningTable2TKPositionShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENManningTable2TKPosition. �������� ������ ��� ��������� �� �������*/
  public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPositionFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENManningTable2TKPosition. �������� ������ ��� ��������� �� �������*/
  public ENManningTable2TKPositionShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }