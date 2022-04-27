
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelShortList;

public interface ENTravelSheetFuelController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelController";


  /*ENTravelSheetFuel. ��������*/
  public int add(ENTravelSheetFuel aENTravelSheetFuel) throws java.rmi.RemoteException;

  /*ENTravelSheetFuel. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuel. ��������*/
  public void save(ENTravelSheetFuel aENTravelSheetFuel) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuel. �������� ������*/
  public ENTravelSheetFuel getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetFuel. �������� ������ ������*/
  public ENTravelSheetFuelShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetFuel. �������� ������ �� �������*/
  public ENTravelSheetFuelShortList getFilteredList(ENTravelSheetFuelFilter aENTravelSheetFuelFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetFuel. �������� ������ ��� ���������*/
  public ENTravelSheetFuelShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetFuel. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuelFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetFuel. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetFuelShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTravelSheetFuel. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTravelSheetFuelFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENTravelSheetFuel. reloadFuel*/
  public void reloadFuel(int travelsheetfuelcode) throws  java.rmi.RemoteException;
  
  }