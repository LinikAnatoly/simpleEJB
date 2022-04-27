
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINMol;
import com.ksoe.energynet.valueobject.filter.FINMolFilter;
import com.ksoe.energynet.valueobject.lists.FINMolShortList;

public interface FINMolController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMolController";


  /*FINMol. ��������*/
  public int add(FINMol aFINMol) throws java.rmi.RemoteException;

  /*FINMol. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMol. ��������*/
  public void save(FINMol aFINMol) throws  java.rmi.RemoteException;

  /*FINMol. �������� ������*/
  public FINMol getObject(String uid) throws  java.rmi.RemoteException;

  /*FINMol. �������� ������ ������*/
  public FINMolShortList getList() throws  java.rmi.RemoteException;

  /*FINMol. �������� ������ �� �������*/
  public FINMolShortList getFilteredList(FINMolFilter aFINMolFilter) throws  java.rmi.RemoteException;  
  
  /*FINMol. �������� ������ ��� ���������*/
  public FINMolShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINMol. �������� ������ ��� ��������� �� �������*/
  public FINMolShortList getScrollableFilteredList(FINMolFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINMol. �������� ������ ��� ��������� �� �������*/
  public FINMolShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }