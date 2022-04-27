
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOtherObjectType;
import com.ksoe.energynet.valueobject.filter.ENOtherObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENOtherObjectTypeShortList;

public interface ENOtherObjectTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOtherObjectTypeController";


  /*ENOtherObjectType. ��������*/
  public int add(ENOtherObjectType aENOtherObjectType) throws java.rmi.RemoteException;

  /*ENOtherObjectType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. ��������*/
  public void save(ENOtherObjectType aENOtherObjectType) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. �������� ������*/
  public ENOtherObjectType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. �������� ������ ������*/
  public ENOtherObjectTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENOtherObjectType. �������� ������ �� �������*/
  public ENOtherObjectTypeShortList getFilteredList(ENOtherObjectTypeFilter aENOtherObjectTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENOtherObjectType. �������� ������ ��� ���������*/
  public ENOtherObjectTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOtherObjectType. �������� ������ ��� ��������� �� �������*/
  public ENOtherObjectTypeShortList getScrollableFilteredList(ENOtherObjectTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOtherObjectType. �������� ������ ��� ��������� �� �������*/
  public ENOtherObjectTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }