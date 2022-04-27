
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemTypeShortList;

public interface ENEstimateItemTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemTypeController";


  /*ENEstimateItemType. ��������*/
  public int add(ENEstimateItemType aENEstimateItemType) throws java.rmi.RemoteException;

  /*ENEstimateItemType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. ��������*/
  public void save(ENEstimateItemType aENEstimateItemType) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. �������� ������*/
  public ENEstimateItemType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. �������� ������ ������*/
  public ENEstimateItemTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemType. �������� ������ �� �������*/
  public ENEstimateItemTypeShortList getFilteredList(ENEstimateItemTypeFilter aENEstimateItemTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemType. �������� ������ ��� ���������*/
  public ENEstimateItemTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemType. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemTypeShortList getScrollableFilteredList(ENEstimateItemTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemType. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }