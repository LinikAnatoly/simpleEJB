
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.filter.ENTransportDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportDepartmentShortList;

public interface ENTransportDepartmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportDepartmentController";


  /*ENTransportDepartment. ��������*/
  public int add(ENTransportDepartment aENTransportDepartment) throws java.rmi.RemoteException;

  /*ENTransportDepartment. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. ��������*/
  public void save(ENTransportDepartment aENTransportDepartment) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. �������� ������*/
  public ENTransportDepartment getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. �������� ������ ������*/
  public ENTransportDepartmentShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportDepartment. �������� ������ �� �������*/
  public ENTransportDepartmentShortList getFilteredList(ENTransportDepartmentFilter aENTransportDepartmentFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportDepartment. �������� ������ ��� ���������*/
  public ENTransportDepartmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportDepartment. �������� ������ ��� ��������� �� �������*/
  public ENTransportDepartmentShortList getScrollableFilteredList(ENTransportDepartmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportDepartment. �������� ������ ��� ��������� �� �������*/
  public ENTransportDepartmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportDepartment. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportDepartmentFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }