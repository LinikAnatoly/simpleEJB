
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQTransportInvoiceFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRoute2RQTransportInvoiceShortList;

public interface ENTransportRoute2RQTransportInvoiceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRoute2RQTransportInvoiceController";


  /*ENTransportRoute2RQTransportInvoice. ��������*/
  public int add(ENTransportRoute2RQTransportInvoice aENTransportRoute2RQTransportInvoice) throws java.rmi.RemoteException;

  /*ENTransportRoute2RQTransportInvoice. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQTransportInvoice. ��������*/
  public void save(ENTransportRoute2RQTransportInvoice aENTransportRoute2RQTransportInvoice) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQTransportInvoice. �������� ������*/
  public ENTransportRoute2RQTransportInvoice getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQTransportInvoice. �������� ������ ������*/
  public ENTransportRoute2RQTransportInvoiceShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQTransportInvoice. �������� ������ �� �������*/
  public ENTransportRoute2RQTransportInvoiceShortList getFilteredList(ENTransportRoute2RQTransportInvoiceFilter aENTransportRoute2RQTransportInvoiceFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRoute2RQTransportInvoice. �������� ������ ��� ���������*/
  public ENTransportRoute2RQTransportInvoiceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRoute2RQTransportInvoice. �������� ������ ��� ��������� �� �������*/
  public ENTransportRoute2RQTransportInvoiceShortList getScrollableFilteredList(ENTransportRoute2RQTransportInvoiceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRoute2RQTransportInvoice. �������� ������ ��� ��������� �� �������*/
  public ENTransportRoute2RQTransportInvoiceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRoute2RQTransportInvoice. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportRoute2RQTransportInvoiceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }