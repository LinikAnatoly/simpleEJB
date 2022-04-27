
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRouteBytDetail;
import com.ksoe.energynet.valueobject.filter.ENRouteBytDetailFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytDetailShortList;

public interface ENRouteBytDetailController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRouteBytDetailController";


  /*ENRouteBytDetail. ��������*/
  public int add(ENRouteBytDetail aENRouteBytDetail) throws java.rmi.RemoteException;

  /*ENRouteBytDetail. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. ��������*/
  public void save(ENRouteBytDetail aENRouteBytDetail) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. �������� ������*/
  public ENRouteBytDetail getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. �������� ������ ������*/
  public ENRouteBytDetailShortList getList() throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. �������� ������ �� �������*/
  public ENRouteBytDetailShortList getFilteredList(ENRouteBytDetailFilter aENRouteBytDetailFilter) throws  java.rmi.RemoteException;  
  
  /*ENRouteBytDetail. �������� ������ ��� ���������*/
  public ENRouteBytDetailShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRouteBytDetail. �������� ������ ��� ��������� �� �������*/
  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetailFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRouteBytDetail. �������� ������ ��� ��������� �� �������*/
  public ENRouteBytDetailShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENRouteBytDetail. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENRouteBytDetailFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }