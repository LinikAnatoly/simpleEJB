
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelRemainsShortList;

public interface ENTravelSheetFuelRemainsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelRemainsController";


  /*ENTravelSheetFuelRemains. ��������*/
  public int add(ENTravelSheetFuelRemains aENTravelSheetFuelRemains) throws java.rmi.RemoteException;

  /*ENTravelSheetFuelRemains. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuelRemains. ��������*/
  public void save(ENTravelSheetFuelRemains aENTravelSheetFuelRemains) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuelRemains. �������� ������*/
  public ENTravelSheetFuelRemains getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuelRemains. �������� ������ ������*/
  public ENTravelSheetFuelRemainsShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetFuelRemains. �������� ������ �� �������*/
  public ENTravelSheetFuelRemainsShortList getFilteredList(ENTravelSheetFuelRemainsFilter aENTravelSheetFuelRemainsFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetFuelRemains. �������� ������ ��� ���������*/
  public ENTravelSheetFuelRemainsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetFuelRemains. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemainsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetFuelRemains. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetFuelRemainsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTravelSheetFuelRemains. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTravelSheetFuelRemainsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }