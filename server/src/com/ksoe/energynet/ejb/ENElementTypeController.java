
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Fri Sep 18 11:06:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.filter.ENElementTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENElementTypeShortList;

public interface ENElementTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENElementTypeController";


  /*ENElementType. ��������*/
  public int add(ENElementType aENElementType) throws java.rmi.RemoteException;

  /*ENElementType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENElementType. ��������*/
  public void save(ENElementType aENElementType) throws  java.rmi.RemoteException;

  /*ENElementType. �������� ������*/
  public ENElementType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENElementType. �������� ������ ������*/
  public ENElementTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENElementType. �������� ������ �� �������*/
  public ENElementTypeShortList getFilteredList(ENElementTypeFilter aENElementTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENElementType. �������� ������ ��� ���������*/
  public ENElementTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENElementType. �������� ������ ��� ��������� �� �������*/
  public ENElementTypeShortList getScrollableFilteredList(ENElementTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENElementType. �������� ������ ��� ��������� �� �������*/
  public ENElementTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }