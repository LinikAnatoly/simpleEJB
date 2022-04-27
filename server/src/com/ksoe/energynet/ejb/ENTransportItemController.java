
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;

public interface ENTransportItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportItemController";


  /*ENTransportItem. ��������*/
  public int add(ENTransportItem aENTransportItem) throws java.rmi.RemoteException;

  /*ENTransportItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportItem. ��������*/
  public void save(ENTransportItem aENTransportItem) throws  java.rmi.RemoteException;
  
  /*ENTransportItem. �������� ��� ������������ ������*/
  public void saveForTransportOrder(ENTransportItem aENTransportItem) throws  java.rmi.RemoteException;

  /*ENTransportItem. �������� ������*/
  public ENTransportItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportItem. �������� ������ ������*/
  public ENTransportItemShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportItem. �������� ������ �� �������*/
  public ENTransportItemShortList getFilteredList(ENTransportItemFilter aENTransportItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportItem. �������� ������ ��� ���������*/
  public ENTransportItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTransportItemShortList getScrollableFilteredList(ENTransportItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTransportItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int[] getScrollableFilteredCodeArray(ENTransportItemFilter filterObject, int fromPosition, int quantity)  throws java.rmi.RemoteException;  
  
  public ENTransportItemShortList getListForTravelSheetItem(ENTransportItemFilter aNTransportItemFilter) throws  java.rmi.RemoteException;
  
  public ENTransportItemShortList getListDetailedForTravelSheetItem(ENTransportItemFilter filterObject) throws  java.rmi.RemoteException;
 
  public ENTransportItemShortList getListDetailedForTransportOrder(ENTransportItemFilter filterObject) throws  java.rmi.RemoteException;
  
  public void saveTimeFact(int transportItemCode, java.math.BigDecimal countFact)  throws  java.rmi.RemoteException;
  
  public void TEMP_GENERATE_GSM(int i) throws  java.rmi.RemoteException;
  public ENTransportItemShortList getListForDistances(int planCode) throws java.rmi.RemoteException;
  public void addDistanceForTransport(int transportItemCode, java.math.BigDecimal distance, int amountOfJourneys) throws java.rmi.RemoteException;
  public void removeDistanceForTransport(int transportItemCode) throws java.rmi.RemoteException;
  
  public void updateTransportDepartment(int transportItemCode, int transportDepartmentCode) throws java.rmi.RemoteException;
  
  }