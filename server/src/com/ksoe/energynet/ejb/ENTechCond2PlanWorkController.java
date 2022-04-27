
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;

public interface ENTechCond2PlanWorkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechCond2PlanWorkController";


  /*ENTechCond2PlanWork. ��������*/
  public int add(ENTechCond2PlanWork aENTechCond2PlanWork) throws java.rmi.RemoteException;

  /*ENTechCond2PlanWork. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCond2PlanWork. ��������*/
  public void save(ENTechCond2PlanWork aENTechCond2PlanWork) throws  java.rmi.RemoteException;

  /*ENTechCond2PlanWork. �������� ������*/
  public ENTechCond2PlanWork getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCond2PlanWork. �������� ������ ������*/
  public ENTechCond2PlanWorkShortList getList() throws  java.rmi.RemoteException;

  /*ENTechCond2PlanWork. �������� ������ �� �������*/
  public ENTechCond2PlanWorkShortList getFilteredList(ENTechCond2PlanWorkFilter aENTechCond2PlanWorkFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechCond2PlanWork. �������� ������ ��� ���������*/
  public ENTechCond2PlanWorkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechCond2PlanWork. �������� ������ ��� ��������� �� �������*/
  public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWorkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechCond2PlanWork. �������� ������ ��� ��������� �� �������*/
  public ENTechCond2PlanWorkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechCond2PlanWork. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechCond2PlanWorkFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }