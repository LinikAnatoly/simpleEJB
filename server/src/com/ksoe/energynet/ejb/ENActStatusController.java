
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.filter.ENActStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENActStatusShortList;

public interface ENActStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActStatusController";


  /*ENActStatus. ��������*/
  public int add(ENActStatus aENActStatus) throws java.rmi.RemoteException;

  /*ENActStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActStatus. ��������*/
  public void save(ENActStatus aENActStatus) throws  java.rmi.RemoteException;

  /*ENActStatus. �������� ������*/
  public ENActStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActStatus. �������� ������ ������*/
  public ENActStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENActStatus. �������� ������ �� �������*/
  public ENActStatusShortList getFilteredList(ENActStatusFilter aENActStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENActStatus. �������� ������ ��� ���������*/
  public ENActStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActStatus. �������� ������ ��� ��������� �� �������*/
  public ENActStatusShortList getScrollableFilteredList(ENActStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActStatus. �������� ������ ��� ��������� �� �������*/
  public ENActStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }