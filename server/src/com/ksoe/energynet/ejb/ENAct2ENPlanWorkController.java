
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;

public interface ENAct2ENPlanWorkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAct2ENPlanWorkController";


  /*ENAct2ENPlanWork. ��������*/
  public int add(ENAct2ENPlanWork aENAct2ENPlanWork, int isClient) throws java.rmi.RemoteException;
  public int add(ENAct2ENPlanWork aENAct2ENPlanWork, int isClient, boolean isFromBilling) throws java.rmi.RemoteException;

  /*ENAct2ENPlanWork. �������*/
  public void remove(int anObjectCode, int isClient) throws java.rmi.RemoteException;
  public void remove(int anObjectCode, int isClient, boolean isFromBilling) throws java.rmi.RemoteException;
  
  /*ENAct2ENPlanWork. ��������*/
  public void save(ENAct2ENPlanWork aENAct2ENPlanWork) throws  java.rmi.RemoteException;

  /*ENAct2ENPlanWork. �������� ������*/
  public ENAct2ENPlanWork getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2ENPlanWork. �������� ������ ������*/
  public ENAct2ENPlanWorkShortList getList() throws  java.rmi.RemoteException;

  /*ENAct2ENPlanWork. �������� ������ �� �������*/
  public ENAct2ENPlanWorkShortList getFilteredList(ENAct2ENPlanWorkFilter aENAct2ENPlanWorkFilter) throws  java.rmi.RemoteException;  
  
  /*ENAct2ENPlanWork. �������� ������ ��� ���������*/
  public ENAct2ENPlanWorkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAct2ENPlanWork. �������� ������ ��� ��������� �� �������*/
  public ENAct2ENPlanWorkShortList getScrollableFilteredList(ENAct2ENPlanWorkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAct2ENPlanWork. �������� ������ ��� ��������� �� �������*/
  public ENAct2ENPlanWorkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public void changeActType(int actCode, int actType) throws java.rmi.RemoteException;
 }