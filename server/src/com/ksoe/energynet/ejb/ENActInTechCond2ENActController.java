
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActInTechCond2ENAct;
import com.ksoe.energynet.valueobject.filter.ENActInTechCond2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActInTechCond2ENActShortList;

public interface ENActInTechCond2ENActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActInTechCond2ENActController";


  /*ENActInTechCond2ENAct. ��������*/
  public int add(ENActInTechCond2ENAct aENActInTechCond2ENAct) throws java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. ��������*/
  public void save(ENActInTechCond2ENAct aENActInTechCond2ENAct) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. �������� ������*/
  public ENActInTechCond2ENAct getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. �������� ������ ������*/
  public ENActInTechCond2ENActShortList getList() throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. �������� ������ �� �������*/
  public ENActInTechCond2ENActShortList getFilteredList(ENActInTechCond2ENActFilter aENActInTechCond2ENActFilter) throws  java.rmi.RemoteException;  
  
  /*ENActInTechCond2ENAct. �������� ������ ��� ���������*/
  public ENActInTechCond2ENActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActInTechCond2ENAct. �������� ������ ��� ��������� �� �������*/
  public ENActInTechCond2ENActShortList getScrollableFilteredList(ENActInTechCond2ENActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActInTechCond2ENAct. �������� ������ ��� ��������� �� �������*/
  public ENActInTechCond2ENActShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActInTechCond2ENAct. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENActInTechCond2ENActFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }