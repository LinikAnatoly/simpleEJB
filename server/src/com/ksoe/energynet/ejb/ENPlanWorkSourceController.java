
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkSourceFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkSourceShortList;

public interface ENPlanWorkSourceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkSourceController";


  /*ENPlanWorkSource. ��������*/
  public int add(ENPlanWorkSource aENPlanWorkSource) throws java.rmi.RemoteException;

  /*ENPlanWorkSource. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. ��������*/
  public void save(ENPlanWorkSource aENPlanWorkSource) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. �������� ������*/
  public ENPlanWorkSource getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. �������� ������ ������*/
  public ENPlanWorkSourceShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. �������� ������ �� �������*/
  public ENPlanWorkSourceShortList getFilteredList(ENPlanWorkSourceFilter aENPlanWorkSourceFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkSource. �������� ������ ��� ���������*/
  public ENPlanWorkSourceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkSource. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkSourceShortList getScrollableFilteredList(ENPlanWorkSourceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkSource. �������� ������ ��� ��������� �� �������*/
  public ENPlanWorkSourceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkSource. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkSourceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }