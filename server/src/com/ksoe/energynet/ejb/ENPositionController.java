
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPosition;
import com.ksoe.energynet.valueobject.filter.ENPositionFilter;
import com.ksoe.energynet.valueobject.lists.ENPositionShortList;

public interface ENPositionController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPositionController";


  /*ENPosition. ��������*/
  public int add(ENPosition aENPosition) throws java.rmi.RemoteException;

  /*ENPosition. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPosition. ��������*/
  public void save(ENPosition aENPosition) throws  java.rmi.RemoteException;

  /*ENPosition. �������� ������*/
  public ENPosition getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPosition. �������� ������ ������*/
  public ENPositionShortList getList() throws  java.rmi.RemoteException;

  /*ENPosition. �������� ������ �� �������*/
  public ENPositionShortList getFilteredList(ENPositionFilter aENPositionFilter) throws  java.rmi.RemoteException;  
  
  /*ENPosition. �������� ������ ��� ���������*/
  public ENPositionShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPosition. �������� ������ ��� ��������� �� �������*/
  public ENPositionShortList getScrollableFilteredList(ENPositionFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPosition. �������� ������ ��� ��������� �� �������*/
  public ENPositionShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }