
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkKindFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkKindShortList;

public interface ENPlanWorkKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkKindController";


  /*ENPlanWorkKind. ��������*/
  public int add(ENPlanWorkKind aENPlanWorkKind) throws java.rmi.RemoteException;

  /*ENPlanWorkKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. ��������*/
  public void save(ENPlanWorkKind aENPlanWorkKind) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. �������� ������*/
  public ENPlanWorkKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. �������� ������ ������*/
  public ENPlanWorkKindShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. �������� ������ �� �������*/
  public ENPlanWorkKindShortList getFilteredList(ENPlanWorkKindFilter aENPlanWorkKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkKind. �������� ������ ��� ���������*/
  public ENPlanWorkKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkKind. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkKindShortList getScrollableFilteredList(ENPlanWorkKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkKind. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }