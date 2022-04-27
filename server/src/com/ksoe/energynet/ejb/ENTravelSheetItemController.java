
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;

public interface ENTravelSheetItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemController";


  /*ENTravelSheetItem. ��������*/
  public int add(ENTravelSheetItem aENTravelSheetItem) throws java.rmi.RemoteException;

  /*ENTravelSheetItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;
  
  /*ENTravelSheetItem. ������� ��� ������������ ������*/
  public void removeForTransportOrder(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem. ��������*/
  public void save(ENTravelSheetItem aENTravelSheetItem) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem. �������� ������*/
  public ENTravelSheetItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItem. �������� ������ ������*/
  public ENTravelSheetItemShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItem. �������� ������ �� �������*/
  public ENTravelSheetItemShortList getFilteredList(ENTravelSheetItemFilter aENTravelSheetItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItem. �������� ������ ��� ���������*/
  public ENTravelSheetItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItem. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItem. �������� ������ ��� ��������� �� �������*/
  public ENTravelSheetItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public void removeByTransportCodes(int itemCode, int[] transportItemCodes)  throws java.rmi.RemoteException;
  
  public void save4transportRoute(ENTravelSheetItem aENTravelSheetItem) 
		  throws  java.rmi.RemoteException;
  
  public ENTravelSheetItemShortList getListForFact(int travelSheetCode) throws  java.rmi.RemoteException;
  
  public ENTravelSheetItemShort getGlobusData(ENTravelSheetItem obj) throws java.rmi.RemoteException;
  
  public void setOrder(int travelSheetCode)  throws java.rmi.RemoteException;
  public void changeOrder(int travelSheetItemCode, int travelOrder) throws java.rmi.RemoteException;
  public ENTravelSheetItem getContiguosItem(int travelSheetItemCode, int travelOrder) throws java.rmi.RemoteException;
  }