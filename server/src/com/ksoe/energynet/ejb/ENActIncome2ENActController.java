
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActIncome2ENAct;
import com.ksoe.energynet.valueobject.filter.ENActIncome2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ENActShortList;

public interface ENActIncome2ENActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActIncome2ENActController";


  /*ENActIncome2ENAct. ��������*/
  public int add(ENActIncome2ENAct aENActIncome2ENAct) throws java.rmi.RemoteException;

  /*ENActIncome2ENAct. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncome2ENAct. ��������*/
  public void save(ENActIncome2ENAct aENActIncome2ENAct) throws  java.rmi.RemoteException;

  /*ENActIncome2ENAct. �������� ������*/
  public ENActIncome2ENAct getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncome2ENAct. �������� ������ ������*/
  public ENActIncome2ENActShortList getList() throws  java.rmi.RemoteException;

  /*ENActIncome2ENAct. �������� ������ �� �������*/
  public ENActIncome2ENActShortList getFilteredList(ENActIncome2ENActFilter aENActIncome2ENActFilter) throws  java.rmi.RemoteException;  
  
  /*ENActIncome2ENAct. �������� ������ ��� ���������*/
  public ENActIncome2ENActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActIncome2ENAct. �������� ������ ��� ��������� �� �������*/
  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActIncome2ENAct. �������� ������ ��� ��������� �� �������*/
  public ENActIncome2ENActShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActIncome2ENAct. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENActIncome2ENActFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }