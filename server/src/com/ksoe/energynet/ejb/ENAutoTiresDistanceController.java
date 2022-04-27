
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresDistanceShortList;

public interface ENAutoTiresDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAutoTiresDistanceController";


  /*ENAutoTiresDistance. ��������*/
  public int add(ENAutoTiresDistance aENAutoTiresDistance) throws java.rmi.RemoteException;

  /*ENAutoTiresDistance. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. ��������*/
  public void save(ENAutoTiresDistance aENAutoTiresDistance) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. �������� ������*/
  public ENAutoTiresDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. �������� ������ ������*/
  public ENAutoTiresDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. �������� ������ �� �������*/
  public ENAutoTiresDistanceShortList getFilteredList(ENAutoTiresDistanceFilter aENAutoTiresDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresDistance. �������� ������ ��� ���������*/
  public ENAutoTiresDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresDistance. �������� ������ ��� ��������� �� �������*/
  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAutoTiresDistance. �������� ������ ��� ��������� �� �������*/
  public ENAutoTiresDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAutoTiresDistance. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENAutoTiresDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }