
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENResponsibles2FINContracts;
import com.ksoe.energynet.valueobject.filter.ENResponsibles2FINContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENResponsibles2FINContractsShortList;

public interface ENResponsibles2FINContractsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENResponsibles2FINContractsController";


  /*ENResponsibles2FINContracts. ��������*/
  public int add(ENResponsibles2FINContracts aENResponsibles2FINContracts) throws java.rmi.RemoteException;

  /*ENResponsibles2FINContracts. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles2FINContracts. ��������*/
  public void save(ENResponsibles2FINContracts aENResponsibles2FINContracts) throws  java.rmi.RemoteException;

  /*ENResponsibles2FINContracts. �������� ������*/
  public ENResponsibles2FINContracts getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles2FINContracts. �������� ������ ������*/
  public ENResponsibles2FINContractsShortList getList() throws  java.rmi.RemoteException;

  /*ENResponsibles2FINContracts. �������� ������ �� �������*/
  public ENResponsibles2FINContractsShortList getFilteredList(ENResponsibles2FINContractsFilter aENResponsibles2FINContractsFilter) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles2FINContracts. �������� ������ ��� ���������*/
  public ENResponsibles2FINContractsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles2FINContracts. �������� ������ ��� ��������� �� �������*/
  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContractsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENResponsibles2FINContracts. �������� ������ ��� ��������� �� �������*/
  public ENResponsibles2FINContractsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENResponsibles2FINContracts. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENResponsibles2FINContractsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }