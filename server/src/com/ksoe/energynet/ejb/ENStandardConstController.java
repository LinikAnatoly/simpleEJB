
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.filter.ENStandardConstFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstShortList;

public interface ENStandardConstController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENStandardConstController";


  /*ENStandardConst. ��������*/
  public int add(ENStandardConst aENStandardConst) throws java.rmi.RemoteException;

  /*ENStandardConst. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConst. ��������*/
  public void save(ENStandardConst aENStandardConst) throws  java.rmi.RemoteException;

  /*ENStandardConst. �������� ������*/
  public ENStandardConst getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConst. �������� ������ ������*/
  public ENStandardConstShortList getList() throws  java.rmi.RemoteException;

  /*ENStandardConst. �������� ������ �� �������*/
  public ENStandardConstShortList getFilteredList(ENStandardConstFilter aENStandardConstFilter) throws  java.rmi.RemoteException;  
  
  /*ENStandardConst. �������� ������ ��� ���������*/
  public ENStandardConstShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENStandardConst. �������� ������ ��� ��������� �� �������*/
  public ENStandardConstShortList getScrollableFilteredList(ENStandardConstFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENStandardConst. �������� ������ ��� ��������� �� �������*/
  public ENStandardConstShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENStandardConst. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENStandardConstFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }