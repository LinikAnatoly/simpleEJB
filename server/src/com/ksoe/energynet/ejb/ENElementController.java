
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

import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.energynet.valueobject.filter.ENElementFilter;
import com.ksoe.energynet.valueobject.lists.ENElementShortList;

public interface ENElementController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENElementController";


  /*ENElement. ��������*/
  public int add(ENElement aENElement) throws java.rmi.RemoteException;

  /*ENElement. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENElement. ��������*/
  public void save(ENElement aENElement) throws  java.rmi.RemoteException;

  /*ENElement. �������� ������*/
  public ENElement getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENElement. �������� ������ ������*/
  public ENElementShortList getList() throws  java.rmi.RemoteException;

  /*ENElement. �������� ������ �� �������*/
  public ENElementShortList getFilteredList(ENElementFilter aENElementFilter) throws  java.rmi.RemoteException;  
  
  /*ENElement. �������� ������ ��� ���������*/
  public ENElementShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENElement. �������� ������ ��� ��������� �� �������*/
  public ENElementShortList getScrollableFilteredList(ENElementFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENElement. �������� ������ ��� ��������� �� �������*/
  public ENElementShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public ENElementShort getShortObject(int code) throws java.rmi.RemoteException;
  
  }