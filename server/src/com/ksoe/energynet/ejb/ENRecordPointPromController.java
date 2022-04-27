
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;

public interface ENRecordPointPromController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRecordPointPromController";


  /*ENRecordPointProm. ��������*/
  public int add(ENRecordPointProm aENRecordPointProm) throws java.rmi.RemoteException;

  /*ENRecordPointProm. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRecordPointProm. ��������*/
  public void save(ENRecordPointProm aENRecordPointProm) throws  java.rmi.RemoteException;

  /*ENRecordPointProm. �������� ������*/
  public ENRecordPointProm getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRecordPointProm. �������� ������ ������*/
  public ENRecordPointPromShortList getList() throws  java.rmi.RemoteException;

  /*ENRecordPointProm. �������� ������ �� �������*/
  public ENRecordPointPromShortList getFilteredList(ENRecordPointPromFilter aENRecordPointPromFilter) throws  java.rmi.RemoteException;  
  
  /*ENRecordPointProm. �������� ������ ��� ���������*/
  public ENRecordPointPromShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRecordPointProm. �������� ������ ��� ��������� �� �������*/
  public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointPromFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRecordPointProm. �������� ������ ��� ��������� �� �������*/
  public ENRecordPointPromShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int [] getNextTaxinvoiceInfo(Date date, String department) throws java.rmi.RemoteException;
  
  public void deleteTaxInvoiceInTrade(int tradeTaxIncoiceCode) throws java.rmi.RemoteException;
  
  public void unlockTaxInvoiceMonthGeneration(int epRenCode) throws java.rmi.RemoteException;
  
  public void lockTaxInvoiceMonthGeneration(int epRenCode) throws java.rmi.RemoteException;
  
  public void startTaxInvoiceMonthGeneration(int epRenCode) throws java.rmi.RemoteException;
  
  public String getPersonalAccountUidByCode(int code, int departmentCode) throws java.rmi.RemoteException;
  
  }