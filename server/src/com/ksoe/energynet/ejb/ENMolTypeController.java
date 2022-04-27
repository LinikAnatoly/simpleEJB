
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.filter.ENMolTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMolTypeShortList;

public interface ENMolTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMolTypeController";


  /*ENMolType. ��������*/
  public int add(ENMolType aENMolType) throws java.rmi.RemoteException;

  /*ENMolType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolType. ��������*/
  public void save(ENMolType aENMolType) throws  java.rmi.RemoteException;

  /*ENMolType. �������� ������*/
  public ENMolType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolType. �������� ������ ������*/
  public ENMolTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENMolType. �������� ������ �� �������*/
  public ENMolTypeShortList getFilteredList(ENMolTypeFilter aENMolTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENMolType. �������� ������ ��� ���������*/
  public ENMolTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMolType. �������� ������ ��� ��������� �� �������*/
  public ENMolTypeShortList getScrollableFilteredList(ENMolTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMolType. �������� ������ ��� ��������� �� �������*/
  public ENMolTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMolType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENMolTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }