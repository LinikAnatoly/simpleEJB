
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;

public interface FINDoc2MolDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINDoc2MolDataController";


  /*FINDoc2MolData. ��������*/
  public int add(FINDoc2MolData aFINDoc2MolData) throws java.rmi.RemoteException;

  /*FINDoc2MolData. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2MolData. ��������*/
  public void save(FINDoc2MolData aFINDoc2MolData) throws  java.rmi.RemoteException;

  /*FINDoc2MolData. �������� ������*/
  public FINDoc2MolData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2MolData. �������� ������ ������*/
  public FINDoc2MolDataShortList getList() throws  java.rmi.RemoteException;

  /*FINDoc2MolData. �������� ������ �� �������*/
  public FINDoc2MolDataShortList getFilteredList(FINDoc2MolDataFilter aFINDoc2MolDataFilter) throws  java.rmi.RemoteException;  
  
  /*FINDoc2MolData. �������� ������ ��� ���������*/
  public FINDoc2MolDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINDoc2MolData. �������� ������ ��� ��������� �� �������*/
  public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINDoc2MolData. �������� ������ ��� ��������� �� �������*/
  public FINDoc2MolDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }