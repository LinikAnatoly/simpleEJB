
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITFeature;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureShortList;

public interface ENSITFeatureController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITFeatureController";


  /*ENSITFeature. ��������*/
  public int add(ENSITFeature aENSITFeature) throws java.rmi.RemoteException;

  /*ENSITFeature. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeature. ��������*/
  public void save(ENSITFeature aENSITFeature) throws  java.rmi.RemoteException;

  /*ENSITFeature. �������� ������*/
  public ENSITFeature getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeature. �������� ������ ������*/
  public ENSITFeatureShortList getList() throws  java.rmi.RemoteException;

  /*ENSITFeature. �������� ������ �� �������*/
  public ENSITFeatureShortList getFilteredList(ENSITFeatureFilter aENSITFeatureFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITFeature. �������� ������ ��� ���������*/
  public ENSITFeatureShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITFeature. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeatureFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITFeature. �������� ������ ��� ��������� �� �������*/
  public ENSITFeatureShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }