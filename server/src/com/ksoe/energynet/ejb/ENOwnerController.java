
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Wed Sep 30 10:10:53 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOwner;
import com.ksoe.energynet.valueobject.filter.ENOwnerFilter;
import com.ksoe.energynet.valueobject.lists.ENOwnerShortList;

public interface ENOwnerController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOwnerController";


  /*ENOwner. ��������*/
  public int add(ENOwner aENOwner) throws java.rmi.RemoteException;

  /*ENOwner. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOwner. ��������*/
  public void save(ENOwner aENOwner) throws  java.rmi.RemoteException;

  /*ENOwner. �������� ������*/
  public ENOwner getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOwner. �������� ������ ������*/
  public ENOwnerShortList getList() throws  java.rmi.RemoteException;

  /*ENOwner. �������� ������ �� �������*/
  public ENOwnerShortList getFilteredList(ENOwnerFilter aENOwnerFilter) throws  java.rmi.RemoteException;  
  
  /*ENOwner. �������� ������ ��� ���������*/
  public ENOwnerShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOwner. �������� ������ ��� ��������� �� �������*/
  public ENOwnerShortList getScrollableFilteredList(ENOwnerFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOwner. �������� ������ ��� ��������� �� �������*/
  public ENOwnerShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }