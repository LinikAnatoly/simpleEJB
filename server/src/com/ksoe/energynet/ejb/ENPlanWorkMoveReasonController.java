
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Mon Oct 05 15:21:12 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkMoveReason;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkMoveReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkMoveReasonShortList;

public interface ENPlanWorkMoveReasonController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkMoveReasonController";


  /*ENPlanWorkMoveReason. ��������*/
  public int add(ENPlanWorkMoveReason aENPlanWorkMoveReason) throws java.rmi.RemoteException;

  /*ENPlanWorkMoveReason. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveReason. ��������*/
  public void save(ENPlanWorkMoveReason aENPlanWorkMoveReason) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveReason. �������� ������*/
  public ENPlanWorkMoveReason getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveReason. �������� ������ ������*/
  public ENPlanWorkMoveReasonShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveReason. �������� ������ �� �������*/
  public ENPlanWorkMoveReasonShortList getFilteredList(ENPlanWorkMoveReasonFilter aENPlanWorkMoveReasonFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkMoveReason. �������� ������ ��� ���������*/
  public ENPlanWorkMoveReasonShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkMoveReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkMoveReasonShortList getScrollableFilteredList(ENPlanWorkMoveReasonFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkMoveReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkMoveReasonShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }