
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITFeatureType;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureTypeShortList;

public interface ENSITFeatureTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITFeatureTypeController";


  /*ENSITFeatureType. ��������*/
  public int add(ENSITFeatureType aENSITFeatureType) throws java.rmi.RemoteException;

  /*ENSITFeatureType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureType. ��������*/
  public void save(ENSITFeatureType aENSITFeatureType) throws  java.rmi.RemoteException;

  /*ENSITFeatureType. �������� ������*/
  public ENSITFeatureType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureType. �������� ������ ������*/
  public ENSITFeatureTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENSITFeatureType. �������� ������ �� �������*/
  public ENSITFeatureTypeShortList getFilteredList(ENSITFeatureTypeFilter aENSITFeatureTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureType. �������� ������ ��� ���������*/
  public ENSITFeatureTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureType. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureTypeShortList getScrollableFilteredList(ENSITFeatureTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITFeatureType. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }