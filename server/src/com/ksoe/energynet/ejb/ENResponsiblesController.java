
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENResponsibles;
import com.ksoe.energynet.valueobject.filter.ENResponsiblesFilter;
import com.ksoe.energynet.valueobject.lists.ENResponsiblesShortList;

public interface ENResponsiblesController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENResponsiblesController";


  /*ENResponsibles. ��������*/
  public int add(ENResponsibles aENResponsibles) throws java.rmi.RemoteException;

  /*ENResponsibles. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles. ��������*/
  public void save(ENResponsibles aENResponsibles) throws  java.rmi.RemoteException;

  /*ENResponsibles. �������� ������*/
  public ENResponsibles getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles. �������� ������ ������*/
  public ENResponsiblesShortList getList() throws  java.rmi.RemoteException;

  /*ENResponsibles. �������� ������ �� �������*/
  public ENResponsiblesShortList getFilteredList(ENResponsiblesFilter aENResponsiblesFilter) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles. �������� ������ ��� ���������*/
  public ENResponsiblesShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENResponsiblesShortList getScrollableFilteredList(ENResponsiblesFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENResponsiblesShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENResponsibles. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENResponsiblesFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }