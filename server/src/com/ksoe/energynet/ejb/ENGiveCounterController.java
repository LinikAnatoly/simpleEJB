
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;

public interface ENGiveCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENGiveCounterController";


  /*ENGiveCounter. ��������*/
  public int add(ENGiveCounter aENGiveCounter) throws java.rmi.RemoteException;

  /*ENGiveCounter. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENGiveCounter. ��������*/
  public void save(ENGiveCounter aENGiveCounter) throws  java.rmi.RemoteException;

  /*ENGiveCounter. �������� ������*/
  public ENGiveCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENGiveCounter. �������� ������ ������*/
  public ENGiveCounterShortList getList() throws  java.rmi.RemoteException;

  /*ENGiveCounter. �������� ������ �� �������*/
  public ENGiveCounterShortList getFilteredList(ENGiveCounterFilter aENGiveCounterFilter) throws  java.rmi.RemoteException;  
  
  /*ENGiveCounter. �������� ������ ��� ���������*/
  public ENGiveCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENGiveCounter. �������� ������ ��� ��������� �� �������*/
  public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENGiveCounter. �������� ������ ��� ��������� �� �������*/
  public ENGiveCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENGiveCounter. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENGiveCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }