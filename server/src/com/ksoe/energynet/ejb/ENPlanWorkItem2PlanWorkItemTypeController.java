
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkItem2PlanWorkItemType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2PlanWorkItemTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2PlanWorkItemTypeShortList;

public interface ENPlanWorkItem2PlanWorkItemTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkItem2PlanWorkItemTypeController";


  /*ENPlanWorkItem2PlanWorkItemType. ��������*/
  public int add(ENPlanWorkItem2PlanWorkItemType aENPlanWorkItem2PlanWorkItemType) throws java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItemType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItemType. ��������*/
  public void save(ENPlanWorkItem2PlanWorkItemType aENPlanWorkItem2PlanWorkItemType) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItemType. �������� ������*/
  public ENPlanWorkItem2PlanWorkItemType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItemType. �������� ������ ������*/
  public ENPlanWorkItem2PlanWorkItemTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItemType. �������� ������ �� �������*/
  public ENPlanWorkItem2PlanWorkItemTypeShortList getFilteredList(ENPlanWorkItem2PlanWorkItemTypeFilter aENPlanWorkItem2PlanWorkItemTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2PlanWorkItemType. �������� ������ ��� ���������*/
  public ENPlanWorkItem2PlanWorkItemTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2PlanWorkItemType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkItem2PlanWorkItemTypeShortList getScrollableFilteredList(ENPlanWorkItem2PlanWorkItemTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkItem2PlanWorkItemType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkItem2PlanWorkItemTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkItem2PlanWorkItemType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkItem2PlanWorkItemTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }