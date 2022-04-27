
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;

public interface ENTravelSheetItemDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemDistanceController";


  /*ENTravelSheetItemDistance. ��������*/
  public int add(ENTravelSheetItemDistance aENTravelSheetItemDistance) throws java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. ��������*/
  public void save(ENTravelSheetItemDistance aENTravelSheetItemDistance) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. �������� ������*/
  public ENTravelSheetItemDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. �������� ������ ������*/
  public ENTravelSheetItemDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. �������� ������ �� �������*/
  public ENTravelSheetItemDistanceShortList getFilteredList(ENTravelSheetItemDistanceFilter aENTravelSheetItemDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance. �������� ������ ��� ���������*/
  public ENTravelSheetItemDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItemDistance. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ENTravelSheetItemDistance. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTravelSheetItemDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  public BigDecimal getAggregateSumOfKoefs(int code) throws java.rmi.RemoteException;
  
  }