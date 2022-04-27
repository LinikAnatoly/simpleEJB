
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Thu Oct 08 13:57:38 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDepartmentType;
import com.ksoe.energynet.valueobject.filter.ENDepartmentTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentTypeShortList;

public interface ENDepartmentTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDepartmentTypeController";


  /*ENDepartmentType. ��������*/
  public int add(ENDepartmentType aENDepartmentType) throws java.rmi.RemoteException;

  /*ENDepartmentType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartmentType. ��������*/
  public void save(ENDepartmentType aENDepartmentType) throws  java.rmi.RemoteException;

  /*ENDepartmentType. �������� ������*/
  public ENDepartmentType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartmentType. �������� ������ ������*/
  public ENDepartmentTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENDepartmentType. �������� ������ �� �������*/
  public ENDepartmentTypeShortList getFilteredList(ENDepartmentTypeFilter aENDepartmentTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENDepartmentType. �������� ������ ��� ���������*/
  public ENDepartmentTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDepartmentType. �������� ������ ��� ��������� �� �������*/
  public ENDepartmentTypeShortList getScrollableFilteredList(ENDepartmentTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDepartmentType. �������� ������ ��� ��������� �� �������*/
  public ENDepartmentTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }