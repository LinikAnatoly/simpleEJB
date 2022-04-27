
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemKindFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemKindShortList;

public interface ENEstimateItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemKindController";


  /*ENEstimateItemKind. ��������*/
  public int add(ENEstimateItemKind aENEstimateItemKind) throws java.rmi.RemoteException;

  /*ENEstimateItemKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. ��������*/
  public void save(ENEstimateItemKind aENEstimateItemKind) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. �������� ������*/
  public ENEstimateItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. �������� ������ ������*/
  public ENEstimateItemKindShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. �������� ������ �� �������*/
  public ENEstimateItemKindShortList getFilteredList(ENEstimateItemKindFilter aENEstimateItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemKind. �������� ������ ��� ���������*/
  public ENEstimateItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemKind. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemKindShortList getScrollableFilteredList(ENEstimateItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemKind. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }