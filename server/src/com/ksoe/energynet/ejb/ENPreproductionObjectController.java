
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPreproductionObject;
import com.ksoe.energynet.valueobject.filter.ENPreproductionObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPreproductionObjectShortList;

public interface ENPreproductionObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPreproductionObjectController";


  /*ENPreproductionObject. ��������*/
  public int add(ENPreproductionObject aENPreproductionObject) throws java.rmi.RemoteException;

  /*ENPreproductionObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. ��������*/
  public void save(ENPreproductionObject aENPreproductionObject) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. �������� ������*/
  public ENPreproductionObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. �������� ������ ������*/
  public ENPreproductionObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENPreproductionObject. �������� ������ �� �������*/
  public ENPreproductionObjectShortList getFilteredList(ENPreproductionObjectFilter aENPreproductionObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENPreproductionObject. �������� ������ ��� ���������*/
  public ENPreproductionObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPreproductionObject. �������� ������ ��� ��������� �� �������*/
  public ENPreproductionObjectShortList getScrollableFilteredList(ENPreproductionObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPreproductionObject. �������� ������ ��� ��������� �� �������*/
  public ENPreproductionObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }