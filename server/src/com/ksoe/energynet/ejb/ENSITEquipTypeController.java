
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITEquipType;
import com.ksoe.energynet.valueobject.filter.ENSITEquipTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipTypeShortList;

public interface ENSITEquipTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITEquipTypeController";


  /*ENSITEquipType. ��������*/
  public int add(ENSITEquipType aENSITEquipType) throws java.rmi.RemoteException;

  /*ENSITEquipType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipType. ��������*/
  public void save(ENSITEquipType aENSITEquipType) throws  java.rmi.RemoteException;

  /*ENSITEquipType. �������� ������*/
  public ENSITEquipType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipType. �������� ������ ������*/
  public ENSITEquipTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENSITEquipType. �������� ������ �� �������*/
  public ENSITEquipTypeShortList getFilteredList(ENSITEquipTypeFilter aENSITEquipTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipType. �������� ������ ��� ���������*/
  public ENSITEquipTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipType. �������� ������ ��� ��������� �� �������*/
  public ENSITEquipTypeShortList getScrollableFilteredList(ENSITEquipTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITEquipType. �������� ������ ��� ��������� �� �������*/
  public ENSITEquipTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }