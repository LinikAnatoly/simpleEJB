
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOtherObject;
import com.ksoe.energynet.valueobject.filter.ENOtherObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENOtherObjectShortList;

public interface ENOtherObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOtherObjectController";


  /*ENOtherObject. ��������*/
  public int add(ENOtherObject aENOtherObject) throws java.rmi.RemoteException;

  /*ENOtherObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObject. ��������*/
  public void save(ENOtherObject aENOtherObject) throws  java.rmi.RemoteException;

  /*ENOtherObject. �������� ������*/
  public ENOtherObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObject. �������� ������ ������*/
  public ENOtherObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENOtherObject. �������� ������ �� �������*/
  public ENOtherObjectShortList getFilteredList(ENOtherObjectFilter aENOtherObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENOtherObject. �������� ������ ��� ���������*/
  public ENOtherObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOtherObject. �������� ������ ��� ��������� �� �������*/
  public ENOtherObjectShortList getScrollableFilteredList(ENOtherObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOtherObject. �������� ������ ��� ��������� �� �������*/
  public ENOtherObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }