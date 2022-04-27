
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITEquipState;
import com.ksoe.energynet.valueobject.filter.ENSITEquipStateFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipStateShortList;

public interface ENSITEquipStateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITEquipStateController";


  /*ENSITEquipState. ��������*/
  public int add(ENSITEquipState aENSITEquipState) throws java.rmi.RemoteException;

  /*ENSITEquipState. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipState. ��������*/
  public void save(ENSITEquipState aENSITEquipState) throws  java.rmi.RemoteException;

  /*ENSITEquipState. �������� ������*/
  public ENSITEquipState getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipState. �������� ������ ������*/
  public ENSITEquipStateShortList getList() throws  java.rmi.RemoteException;

  /*ENSITEquipState. �������� ������ �� �������*/
  public ENSITEquipStateShortList getFilteredList(ENSITEquipStateFilter aENSITEquipStateFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipState. �������� ������ ��� ���������*/
  public ENSITEquipStateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipState. �������� ������ ��� ��������� �� �������*/
  public ENSITEquipStateShortList getScrollableFilteredList(ENSITEquipStateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITEquipState. �������� ������ ��� ��������� �� �������*/
  public ENSITEquipStateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }