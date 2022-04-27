
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.filter.ENMolStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENMolStatusShortList;

public interface ENMolStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMolStatusController";


  /*ENMolStatus. ��������*/
  public int add(ENMolStatus aENMolStatus) throws java.rmi.RemoteException;

  /*ENMolStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolStatus. ��������*/
  public void save(ENMolStatus aENMolStatus) throws  java.rmi.RemoteException;

  /*ENMolStatus. �������� ������*/
  public ENMolStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolStatus. �������� ������ ������*/
  public ENMolStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENMolStatus. �������� ������ �� �������*/
  public ENMolStatusShortList getFilteredList(ENMolStatusFilter aENMolStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENMolStatus. �������� ������ ��� ���������*/
  public ENMolStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMolStatus. �������� ������ ��� ��������� �� �������*/
  public ENMolStatusShortList getScrollableFilteredList(ENMolStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMolStatus. �������� ������ ��� ��������� �� �������*/
  public ENMolStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMolStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENMolStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }