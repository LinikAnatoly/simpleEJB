
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENConnectionPhasity;
import com.ksoe.energynet.valueobject.filter.ENConnectionPhasityFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionPhasityShortList;

public interface ENConnectionPhasityController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENConnectionPhasityController";


  /*ENConnectionPhasity. ��������*/
  public int add(ENConnectionPhasity aENConnectionPhasity) throws java.rmi.RemoteException;

  /*ENConnectionPhasity. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionPhasity. ��������*/
  public void save(ENConnectionPhasity aENConnectionPhasity) throws  java.rmi.RemoteException;

  /*ENConnectionPhasity. �������� ������*/
  public ENConnectionPhasity getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionPhasity. �������� ������ ������*/
  public ENConnectionPhasityShortList getList() throws  java.rmi.RemoteException;

  /*ENConnectionPhasity. �������� ������ �� �������*/
  public ENConnectionPhasityShortList getFilteredList(ENConnectionPhasityFilter aENConnectionPhasityFilter) throws  java.rmi.RemoteException;  
  
  /*ENConnectionPhasity. �������� ������ ��� ���������*/
  public ENConnectionPhasityShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENConnectionPhasity. �������� ������ ��� ��������� �� �������*/
  public ENConnectionPhasityShortList getScrollableFilteredList(ENConnectionPhasityFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENConnectionPhasity. �������� ������ ��� ��������� �� �������*/
  public ENConnectionPhasityShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENConnectionPhasity. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENConnectionPhasityFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }