
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Wed Oct 07 14:18:06 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectReasonShortList;

public interface ENPlanCorrectReasonController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanCorrectReasonController";


  /*ENPlanCorrectReason. ��������*/
  public int add(ENPlanCorrectReason aENPlanCorrectReason) throws java.rmi.RemoteException;

  /*ENPlanCorrectReason. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanCorrectReason. ��������*/
  public void save(ENPlanCorrectReason aENPlanCorrectReason) throws  java.rmi.RemoteException;

  /*ENPlanCorrectReason. �������� ������*/
  public ENPlanCorrectReason getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanCorrectReason. �������� ������ ������*/
  public ENPlanCorrectReasonShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanCorrectReason. �������� ������ �� �������*/
  public ENPlanCorrectReasonShortList getFilteredList(ENPlanCorrectReasonFilter aENPlanCorrectReasonFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanCorrectReason. �������� ������ ��� ���������*/
  public ENPlanCorrectReasonShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanCorrectReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanCorrectReasonShortList getScrollableFilteredList(ENPlanCorrectReasonFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanCorrectReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanCorrectReasonShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }