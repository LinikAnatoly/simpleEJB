
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTiresInstallStatus;
import com.ksoe.energynet.valueobject.filter.ENTiresInstallStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTiresInstallStatusShortList;

public interface ENTiresInstallStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTiresInstallStatusController";


  /*ENTiresInstallStatus. ��������*/
  public int add(ENTiresInstallStatus aENTiresInstallStatus) throws java.rmi.RemoteException;

  /*ENTiresInstallStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. ��������*/
  public void save(ENTiresInstallStatus aENTiresInstallStatus) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. �������� ������*/
  public ENTiresInstallStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. �������� ������ ������*/
  public ENTiresInstallStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. �������� ������ �� �������*/
  public ENTiresInstallStatusShortList getFilteredList(ENTiresInstallStatusFilter aENTiresInstallStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallStatus. �������� ������ ��� ���������*/
  public ENTiresInstallStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallStatus. �������� ������ ��� ��������� �� �������*/
  public ENTiresInstallStatusShortList getScrollableFilteredList(ENTiresInstallStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTiresInstallStatus. �������� ������ ��� ��������� �� �������*/
  public ENTiresInstallStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTiresInstallStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTiresInstallStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }