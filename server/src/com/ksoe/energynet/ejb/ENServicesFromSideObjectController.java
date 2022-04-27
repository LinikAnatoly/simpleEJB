
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesFromSideObject;
import com.ksoe.energynet.valueobject.brief.ENServicesFromSideObjectShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFromSideObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFromSideObjectShortList;

public interface ENServicesFromSideObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesFromSideObjectController";


  /*ENServicesFromSideObject. ��������*/
  public int add(ENServicesFromSideObject aENServicesFromSideObject) throws java.rmi.RemoteException;

  /*ENServicesFromSideObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesFromSideObject. ��������*/
  public void save(ENServicesFromSideObject aENServicesFromSideObject) throws  java.rmi.RemoteException;

  /*ENServicesFromSideObject. �������� ������*/
  public ENServicesFromSideObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesFromSideObject. �������� ������ ������*/
  public ENServicesFromSideObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesFromSideObject. �������� ������ �� �������*/
  public ENServicesFromSideObjectShortList getFilteredList(ENServicesFromSideObjectFilter aENServicesFromSideObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENServicesFromSideObject. �������� ������ ��� ���������*/
  public ENServicesFromSideObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENServicesFromSideObject. �������� ������ ��� ��������� �� �������*/
  public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENServicesFromSideObject. �������� ������ ��� ��������� �� �������*/
  public ENServicesFromSideObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENServicesFromSideObject. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENServicesFromSideObjectFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  public int signed(int svoCode ) throws java.rmi.RemoteException;
  public int unSigned(int svoCode ) throws java.rmi.RemoteException;
  
  public int pay(int svoCode ) throws java.rmi.RemoteException;
  public int unPay(int svoCode ) throws java.rmi.RemoteException;
  
  public int workExecuted(int svoCode ) throws java.rmi.RemoteException;
  public int workUnExecuted(int svoCode ) throws java.rmi.RemoteException;
  
  public int workCompleted(int svoCode ) throws java.rmi.RemoteException;
  public int workUnCompleted(int svoCode ) throws java.rmi.RemoteException;

  public ENServicesFromSideObjectShort getShortObjectWithBillAndPaySum(int code) throws java.rmi.RemoteException;

  }