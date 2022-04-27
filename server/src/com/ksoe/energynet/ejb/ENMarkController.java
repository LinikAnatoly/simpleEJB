
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMark;
import com.ksoe.energynet.valueobject.filter.ENMarkFilter;
import com.ksoe.energynet.valueobject.lists.ENMarkShortList;

public interface ENMarkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMarkController";


  /*ENMark. ��������*/
  public int add(ENMark aENMark) throws java.rmi.RemoteException;

  /*ENMark. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMark. ��������*/
  public void save(ENMark aENMark) throws  java.rmi.RemoteException;

  /*ENMark. �������� ������*/
  public ENMark getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMark. �������� ������ ������*/
  public ENMarkShortList getList() throws  java.rmi.RemoteException;

  /*ENMark. �������� ������ �� �������*/
  public ENMarkShortList getFilteredList(ENMarkFilter aENMarkFilter) throws  java.rmi.RemoteException;  
  
  /*ENMark. �������� ������ ��� ���������*/
  public ENMarkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMark. �������� ������ ��� ��������� �� �������*/
  public ENMarkShortList getScrollableFilteredList(ENMarkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMark. �������� ������ ��� ��������� �� �������*/
  public ENMarkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }