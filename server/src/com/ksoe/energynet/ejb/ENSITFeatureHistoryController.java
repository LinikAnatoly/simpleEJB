
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITFeatureHistory;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureHistoryShortList;

public interface ENSITFeatureHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITFeatureHistoryController";


  /*ENSITFeatureHistory. ��������*/
  public int add(ENSITFeatureHistory aENSITFeatureHistory) throws java.rmi.RemoteException;

  /*ENSITFeatureHistory. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. ��������*/
  public void save(ENSITFeatureHistory aENSITFeatureHistory) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. �������� ������*/
  public ENSITFeatureHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. �������� ������ ������*/
  public ENSITFeatureHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. �������� ������ �� �������*/
  public ENSITFeatureHistoryShortList getFilteredList(ENSITFeatureHistoryFilter aENSITFeatureHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureHistory. �������� ������ ��� ���������*/
  public ENSITFeatureHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureHistory. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureHistoryShortList getScrollableFilteredList(ENSITFeatureHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITFeatureHistory. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }