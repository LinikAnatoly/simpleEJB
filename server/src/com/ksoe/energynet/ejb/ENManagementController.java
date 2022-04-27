
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENManagement;
import com.ksoe.energynet.valueobject.filter.ENManagementFilter;
import com.ksoe.energynet.valueobject.lists.ENManagementShortList;

public interface ENManagementController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENManagementController";


  /*ENManagement. ��������*/
  public int add(ENManagement aENManagement) throws java.rmi.RemoteException;

  /*ENManagement. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManagement. ��������*/
  public void save(ENManagement aENManagement) throws  java.rmi.RemoteException;

  /*ENManagement. �������� ������*/
  public ENManagement getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManagement. �������� ������ ������*/
  public ENManagementShortList getList() throws  java.rmi.RemoteException;

  /*ENManagement. �������� ������ �� �������*/
  public ENManagementShortList getFilteredList(ENManagementFilter aENManagementFilter) throws  java.rmi.RemoteException;  
  
  /*ENManagement. �������� ������ ��� ���������*/
  public ENManagementShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENManagement. �������� ������ ��� ��������� �� �������*/
  public ENManagementShortList getScrollableFilteredList(ENManagementFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENManagement. �������� ������ ��� ��������� �� �������*/
  public ENManagementShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENManagement. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENManagementFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }