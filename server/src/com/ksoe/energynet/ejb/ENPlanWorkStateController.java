
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkStateFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkStateShortList;

public interface ENPlanWorkStateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkStateController";


  /*ENPlanWorkState. ��������*/
  public int add(ENPlanWorkState aENPlanWorkState) throws java.rmi.RemoteException;

  /*ENPlanWorkState. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. ��������*/
  public void save(ENPlanWorkState aENPlanWorkState) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. �������� ������*/
  public ENPlanWorkState getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. �������� ������ ������*/
  public ENPlanWorkStateShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkState. �������� ������ �� �������*/
  public ENPlanWorkStateShortList getFilteredList(ENPlanWorkStateFilter aENPlanWorkStateFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkState. �������� ������ ��� ���������*/
  public ENPlanWorkStateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkState. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkStateShortList getScrollableFilteredList(ENPlanWorkStateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkState. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkStateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }