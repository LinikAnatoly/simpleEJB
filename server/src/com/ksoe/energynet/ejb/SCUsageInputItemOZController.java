
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZShortList;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;

public interface SCUsageInputItemOZController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZController";


  /*SCUsageInputItemOZ. ��������*/
  public int add(SCUsageInputItemOZ aSCUsageInputItemOZ) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZ. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ. ��������*/
  public void save(SCUsageInputItemOZ aSCUsageInputItemOZ) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ. �������� ������*/
  public SCUsageInputItemOZ getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ. �������� ������ ������*/
  public SCUsageInputItemOZShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ. �������� ������ �� �������*/
  public SCUsageInputItemOZShortList getFilteredList(SCUsageInputItemOZFilter aSCUsageInputItemOZFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ. �������� ������ ��� ���������*/
  public SCUsageInputItemOZShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZ. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputItemOZShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZ. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public FKProvObjectShortList getPostingsList(int servicesObjectCode) throws java.rmi.RemoteException;
  }