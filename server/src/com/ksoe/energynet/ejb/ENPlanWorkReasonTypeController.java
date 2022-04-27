
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkReasonType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkReasonTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkReasonTypeShortList;

public interface ENPlanWorkReasonTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkReasonTypeController";


  /*ENPlanWorkReasonType. ��������*/
  public int add(ENPlanWorkReasonType aENPlanWorkReasonType) throws java.rmi.RemoteException;

  /*ENPlanWorkReasonType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. ��������*/
  public void save(ENPlanWorkReasonType aENPlanWorkReasonType) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. �������� ������*/
  public ENPlanWorkReasonType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. �������� ������ ������*/
  public ENPlanWorkReasonTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. �������� ������ �� �������*/
  public ENPlanWorkReasonTypeShortList getFilteredList(ENPlanWorkReasonTypeFilter aENPlanWorkReasonTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReasonType. �������� ������ ��� ���������*/
  public ENPlanWorkReasonTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReasonType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkReasonTypeShortList getScrollableFilteredList(ENPlanWorkReasonTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkReasonType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkReasonTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkReasonType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkReasonTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }