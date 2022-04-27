
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENNomenclaturesOperative;
import com.ksoe.energynet.valueobject.filter.ENNomenclaturesOperativeFilter;
import com.ksoe.energynet.valueobject.lists.ENNomenclaturesOperativeShortList;

public interface ENNomenclaturesOperativeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENNomenclaturesOperativeController";


  /*ENNomenclaturesOperative. ��������*/
  public int add(ENNomenclaturesOperative aENNomenclaturesOperative) throws java.rmi.RemoteException;

  /*ENNomenclaturesOperative. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENNomenclaturesOperative. ��������*/
  public void save(ENNomenclaturesOperative aENNomenclaturesOperative) throws  java.rmi.RemoteException;

  /*ENNomenclaturesOperative. �������� ������*/
  public ENNomenclaturesOperative getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENNomenclaturesOperative. �������� ������ ������*/
  public ENNomenclaturesOperativeShortList getList() throws  java.rmi.RemoteException;

  /*ENNomenclaturesOperative. �������� ������ �� �������*/
  public ENNomenclaturesOperativeShortList getFilteredList(ENNomenclaturesOperativeFilter aENNomenclaturesOperativeFilter) throws  java.rmi.RemoteException;  
  
  /*ENNomenclaturesOperative. �������� ������ ��� ���������*/
  public ENNomenclaturesOperativeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENNomenclaturesOperative. �������� ������ ��� ��������� �� �������*/
  public ENNomenclaturesOperativeShortList getScrollableFilteredList(ENNomenclaturesOperativeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENNomenclaturesOperative. �������� ������ ��� ��������� �� �������*/
  public ENNomenclaturesOperativeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENNomenclaturesOperative. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENNomenclaturesOperativeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }