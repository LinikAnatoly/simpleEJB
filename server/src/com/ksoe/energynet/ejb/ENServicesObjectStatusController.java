
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectStatusShortList;

public interface ENServicesObjectStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesObjectStatusController";


  /*ENServicesObjectStatus. ��������*/
  public int add(ENServicesObjectStatus aENServicesObjectStatus) throws java.rmi.RemoteException;

  /*ENServicesObjectStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObjectStatus. ��������*/
  public void save(ENServicesObjectStatus aENServicesObjectStatus) throws  java.rmi.RemoteException;

  /*ENServicesObjectStatus. �������� ������*/
  public ENServicesObjectStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObjectStatus. �������� ������ ������*/
  public ENServicesObjectStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesObjectStatus. �������� ������ �� �������*/
  public ENServicesObjectStatusShortList getFilteredList(ENServicesObjectStatusFilter aENServicesObjectStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENServicesObjectStatus. �������� ������ ��� ���������*/
  public ENServicesObjectStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENServicesObjectStatus. �������� ������ ��� ��������� �� �������*/
  public ENServicesObjectStatusShortList getScrollableFilteredList(ENServicesObjectStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENServicesObjectStatus. �������� ������ ��� ��������� �� �������*/
  public ENServicesObjectStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENServicesObjectStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENServicesObjectStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }