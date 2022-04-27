
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMol2Department;
import com.ksoe.energynet.valueobject.filter.ENMol2DepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENMol2DepartmentShortList;

public interface ENMol2DepartmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMol2DepartmentController";


  /*ENMol2Department. ��������*/
  public int add(ENMol2Department aENMol2Department) throws java.rmi.RemoteException;

  /*ENMol2Department. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMol2Department. ��������*/
  public void save(ENMol2Department aENMol2Department) throws  java.rmi.RemoteException;

  /*ENMol2Department. �������� ������*/
  public ENMol2Department getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMol2Department. �������� ������ ������*/
  public ENMol2DepartmentShortList getList() throws  java.rmi.RemoteException;

  /*ENMol2Department. �������� ������ �� �������*/
  public ENMol2DepartmentShortList getFilteredList(ENMol2DepartmentFilter aENMol2DepartmentFilter) throws  java.rmi.RemoteException;  
  
  /*ENMol2Department. �������� ������ ��� ���������*/
  public ENMol2DepartmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMol2Department. �������� ������ ��� ��������� �� �������*/
  public ENMol2DepartmentShortList getScrollableFilteredList(ENMol2DepartmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMol2Department. �������� ������ ��� ��������� �� �������*/
  public ENMol2DepartmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMol2Department. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENMol2DepartmentFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }