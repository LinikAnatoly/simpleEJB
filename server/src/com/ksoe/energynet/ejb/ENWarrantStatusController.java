
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWarrantStatus;
import com.ksoe.energynet.valueobject.filter.ENWarrantStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENWarrantStatusShortList;

public interface ENWarrantStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENWarrantStatusController";


  /*ENWarrantStatus. ��������*/
  public int add(ENWarrantStatus aENWarrantStatus) throws java.rmi.RemoteException;

  /*ENWarrantStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWarrantStatus. ��������*/
  public void save(ENWarrantStatus aENWarrantStatus) throws  java.rmi.RemoteException;

  /*ENWarrantStatus. �������� ������*/
  public ENWarrantStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWarrantStatus. �������� ������ ������*/
  public ENWarrantStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENWarrantStatus. �������� ������ �� �������*/
  public ENWarrantStatusShortList getFilteredList(ENWarrantStatusFilter aENWarrantStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENWarrantStatus. �������� ������ ��� ���������*/
  public ENWarrantStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENWarrantStatus. �������� ������ ��� ��������� �� �������*/
  public ENWarrantStatusShortList getScrollableFilteredList(ENWarrantStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENWarrantStatus. �������� ������ ��� ��������� �� �������*/
  public ENWarrantStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENWarrantStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENWarrantStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }