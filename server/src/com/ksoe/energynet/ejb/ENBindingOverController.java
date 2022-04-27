
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBindingOver;
import com.ksoe.energynet.valueobject.filter.ENBindingOverFilter;
import com.ksoe.energynet.valueobject.lists.ENBindingOverShortList;

public interface ENBindingOverController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBindingOverController";


  /*ENBindingOver. ��������*/
  public int add(ENBindingOver aENBindingOver) throws java.rmi.RemoteException;

  /*ENBindingOver. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBindingOver. ��������*/
  public void save(ENBindingOver aENBindingOver) throws  java.rmi.RemoteException;

  /*ENBindingOver. �������� ������*/
  public ENBindingOver getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBindingOver. �������� ������ ������*/
  public ENBindingOverShortList getList() throws  java.rmi.RemoteException;

  /*ENBindingOver. �������� ������ �� �������*/
  public ENBindingOverShortList getFilteredList(ENBindingOverFilter aENBindingOverFilter) throws  java.rmi.RemoteException;  
  
  /*ENBindingOver. �������� ������ ��� ���������*/
  public ENBindingOverShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBindingOver. �������� ������ ��� ��������� �� �������*/
  public ENBindingOverShortList getScrollableFilteredList(ENBindingOverFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBindingOver. �������� ������ ��� ��������� �� �������*/
  public ENBindingOverShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }