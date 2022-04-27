
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWork2PlanWorkReason;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2PlanWorkReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2PlanWorkReasonShortList;

public interface ENPlanWork2PlanWorkReasonController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2PlanWorkReasonController";


  /*ENPlanWork2PlanWorkReason. ��������*/
  public int add(ENPlanWork2PlanWorkReason aENPlanWork2PlanWorkReason) throws java.rmi.RemoteException;

  /*ENPlanWork2PlanWorkReason. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2PlanWorkReason. ��������*/
  public void save(ENPlanWork2PlanWorkReason aENPlanWork2PlanWorkReason) throws  java.rmi.RemoteException;

  /*ENPlanWork2PlanWorkReason. �������� ������*/
  public ENPlanWork2PlanWorkReason getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2PlanWorkReason. �������� ������ ������*/
  public ENPlanWork2PlanWorkReasonShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWork2PlanWorkReason. �������� ������ �� �������*/
  public ENPlanWork2PlanWorkReasonShortList getFilteredList(ENPlanWork2PlanWorkReasonFilter aENPlanWork2PlanWorkReasonFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2PlanWorkReason. �������� ������ ��� ���������*/
  public ENPlanWork2PlanWorkReasonShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2PlanWorkReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanWork2PlanWorkReasonShortList getScrollableFilteredList(ENPlanWork2PlanWorkReasonFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWork2PlanWorkReason. �������� ������ ��� ��������� �� �������*/
  public ENPlanWork2PlanWorkReasonShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWork2PlanWorkReason. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENPlanWork2PlanWorkReasonFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }