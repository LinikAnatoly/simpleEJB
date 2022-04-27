
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENInvestProgramGroups;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramGroupsFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramGroupsShortList;

public interface ENInvestProgramGroupsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramGroupsController";


  /*ENInvestProgramGroups. ��������*/
  public int add(ENInvestProgramGroups aENInvestProgramGroups) throws java.rmi.RemoteException;

  /*ENInvestProgramGroups. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. ��������*/
  public void save(ENInvestProgramGroups aENInvestProgramGroups) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. �������� ������*/
  public ENInvestProgramGroups getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. �������� ������ ������*/
  public ENInvestProgramGroupsShortList getList() throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. �������� ������ �� �������*/
  public ENInvestProgramGroupsShortList getFilteredList(ENInvestProgramGroupsFilter aENInvestProgramGroupsFilter) throws  java.rmi.RemoteException;  
  
  /*ENInvestProgramGroups. �������� ������ ��� ���������*/
  public ENInvestProgramGroupsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENInvestProgramGroups. �������� ������ ��� ��������� �� �������*/
  public ENInvestProgramGroupsShortList getScrollableFilteredList(ENInvestProgramGroupsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENInvestProgramGroups. �������� ������ ��� ��������� �� �������*/
  public ENInvestProgramGroupsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENInvestProgramGroups. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENInvestProgramGroupsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }