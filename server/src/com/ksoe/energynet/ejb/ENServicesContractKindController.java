
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.filter.ENServicesContractKindFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesContractKindShortList;

public interface ENServicesContractKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesContractKindController";


  /*ENServicesContractKind. ��������*/
  public int add(ENServicesContractKind aENServicesContractKind) throws java.rmi.RemoteException;

  /*ENServicesContractKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. ��������*/
  public void save(ENServicesContractKind aENServicesContractKind) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������*/
  public ENServicesContractKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������ ������*/
  public ENServicesContractKindShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������ �� �������*/
  public ENServicesContractKindShortList getFilteredList(ENServicesContractKindFilter aENServicesContractKindFilter) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������ ��� ���������*/
  public ENServicesContractKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������ ��� ��������� �� �������*/
  public ENServicesContractKindShortList getScrollableFilteredList(ENServicesContractKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. �������� ������ ��� ��������� �� �������*/
  public ENServicesContractKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENServicesContractKind. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENServicesContractKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }