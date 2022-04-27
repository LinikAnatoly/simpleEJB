
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemKindFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemKindShortList;

public interface ENTravelSheetItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemKindController";


  /*ENTravelSheetItemKind. ��������*/
  public int add(ENTravelSheetItemKind aENTravelSheetItemKind) throws java.rmi.RemoteException;

  /*ENTravelSheetItemKind. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemKind. ��������*/
  public void save(ENTravelSheetItemKind aENTravelSheetItemKind) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemKind. �������� ������*/
  public ENTravelSheetItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemKind. �������� ������ ������*/
  public ENTravelSheetItemKindShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItemKind. �������� ������ �� �������*/
  public ENTravelSheetItemKindShortList getFilteredList(ENTravelSheetItemKindFilter aENTravelSheetItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemKind. �������� ������ ��� ���������*/
  public ENTravelSheetItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemKind. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemKindShortList getScrollableFilteredList(ENTravelSheetItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItemKind. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }