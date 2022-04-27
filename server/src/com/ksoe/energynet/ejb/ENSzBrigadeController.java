
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSzBrigade;
import com.ksoe.energynet.valueobject.filter.ENSzBrigadeFilter;
import com.ksoe.energynet.valueobject.lists.ENSzBrigadeShortList;

public interface ENSzBrigadeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSzBrigadeController";


  /*ENSzBrigade. ��������*/
  public int add(ENSzBrigade aENSzBrigade) throws java.rmi.RemoteException;

  /*ENSzBrigade. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSzBrigade. ��������*/
  public void save(ENSzBrigade aENSzBrigade) throws  java.rmi.RemoteException;

  /*ENSzBrigade. �������� ������*/
  public ENSzBrigade getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSzBrigade. �������� ������ ������*/
  public ENSzBrigadeShortList getList() throws  java.rmi.RemoteException;

  /*ENSzBrigade. �������� ������ �� �������*/
  public ENSzBrigadeShortList getFilteredList(ENSzBrigadeFilter aENSzBrigadeFilter) throws  java.rmi.RemoteException;  
  
  /*ENSzBrigade. �������� ������ ��� ���������*/
  public ENSzBrigadeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSzBrigade. �������� ������ ��� ��������� �� �������*/
  public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigadeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSzBrigade. �������� ������ ��� ��������� �� �������*/
  public ENSzBrigadeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENSzBrigade. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENSzBrigadeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }