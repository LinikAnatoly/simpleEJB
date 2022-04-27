
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

import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkTypeShortList;

public interface ENPlanWorkTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkTypeController";


  /*ENPlanWorkType. ��������*/
  public int add(ENPlanWorkType aENPlanWorkType) throws java.rmi.RemoteException;

  /*ENPlanWorkType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkType. ��������*/
  public void save(ENPlanWorkType aENPlanWorkType) throws  java.rmi.RemoteException;

  /*ENPlanWorkType. �������� ������*/
  public ENPlanWorkType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkType. �������� ������ ������*/
  public ENPlanWorkTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkType. �������� ������ �� �������*/
  public ENPlanWorkTypeShortList getFilteredList(ENPlanWorkTypeFilter aENPlanWorkTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkType. �������� ������ ��� ���������*/
  public ENPlanWorkTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkTypeShortList getScrollableFilteredList(ENPlanWorkTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }