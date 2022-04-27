
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENCfoData;
import com.ksoe.energynet.valueobject.filter.ENCfoDataFilter;
import com.ksoe.energynet.valueobject.lists.ENCfoDataShortList;

public interface ENCfoDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENCfoDataController";


  /*ENCfoData. ��������*/
  public int add(ENCfoData aENCfoData) throws java.rmi.RemoteException;

  /*ENCfoData. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENCfoData. ��������*/
  public void save(ENCfoData aENCfoData) throws  java.rmi.RemoteException;

  /*ENCfoData. �������� ������*/
  public ENCfoData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENCfoData. �������� ������ ������*/
  public ENCfoDataShortList getList() throws  java.rmi.RemoteException;

  /*ENCfoData. �������� ������ �� �������*/
  public ENCfoDataShortList getFilteredList(ENCfoDataFilter aENCfoDataFilter) throws  java.rmi.RemoteException;  
  
  /*ENCfoData. �������� ������ ��� ���������*/
  public ENCfoDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENCfoData. �������� ������ ��� ��������� �� �������*/
  public ENCfoDataShortList getScrollableFilteredList(ENCfoDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENCfoData. �������� ������ ��� ��������� �� �������*/
  public ENCfoDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }