
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;

public interface ENReconstrModernOZ2ENactController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModernOZ2ENactController";


  /*ENReconstrModernOZ2ENact. ��������*/
  public int add(ENReconstrModernOZ2ENact aENReconstrModernOZ2ENact) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. ��������*/
  public void save(ENReconstrModernOZ2ENact aENReconstrModernOZ2ENact) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. �������� ������*/
  public ENReconstrModernOZ2ENact getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. �������� ������ ������*/
  public ENReconstrModernOZ2ENactShortList getList() throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. �������� ������ �� �������*/
  public ENReconstrModernOZ2ENactShortList getFilteredList(ENReconstrModernOZ2ENactFilter aENReconstrModernOZ2ENactFilter) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ2ENact. �������� ������ ��� ���������*/
  public ENReconstrModernOZ2ENactShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ2ENact. �������� ������ ��� ��������� �� �������*/
  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENactFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENReconstrModernOZ2ENact. �������� ������ ��� ��������� �� �������*/
  public ENReconstrModernOZ2ENactShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENReconstrModernOZ2ENact. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENReconstrModernOZ2ENactFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ2ENact. �������� ������ ��� ��������� �� ������� ��� ������������ ������������ */
  public ENReconstrModernOZ2ENactShortList getScrollableFilteredListForRM(ENReconstrModernOZ2ENactFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;
  
  /*ENReconstrModernOZ2ENact. ������ �������� ����� ��� �� ����� �������� ���� � ���� ��*/
  public void updateIsCalculationDate(int actCode, int ozCode , int isCalculationDate) throws  java.rmi.RemoteException;
  }