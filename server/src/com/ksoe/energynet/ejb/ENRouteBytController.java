
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;

public interface ENRouteBytController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRouteBytController";


  /*ENRouteByt. ��������*/
  public int add(ENRouteByt aENRouteByt) throws java.rmi.RemoteException;

  /*ENRouteByt. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteByt. ��������*/
  public void save(ENRouteByt aENRouteByt) throws  java.rmi.RemoteException;

  /*ENRouteByt. �������� ������*/
  public ENRouteByt getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteByt. �������� ������ ������*/
  public ENRouteBytShortList getList() throws  java.rmi.RemoteException;

  /*ENRouteByt. �������� ������ �� �������*/
  public ENRouteBytShortList getFilteredList(ENRouteBytFilter aENRouteBytFilter) throws  java.rmi.RemoteException;  
  
  /*ENRouteByt. �������� ������ ��� ���������*/
  public ENRouteBytShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRouteByt. �������� ������ ��� ��������� �� �������*/
  public ENRouteBytShortList getScrollableFilteredList(ENRouteBytFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRouteByt. �������� ������ ��� ��������� �� �������*/
  public ENRouteBytShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENRouteByt. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENRouteBytFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }