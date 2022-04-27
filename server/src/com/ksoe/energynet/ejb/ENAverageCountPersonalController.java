
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAverageCountPersonal;
import com.ksoe.energynet.valueobject.filter.ENAverageCountPersonalFilter;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;

public interface ENAverageCountPersonalController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAverageCountPersonalController";


  /*ENAverageCountPersonal. ��������*/
  public int add(ENAverageCountPersonal aENAverageCountPersonal) throws java.rmi.RemoteException;

  /*ENAverageCountPersonal. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. ��������*/
  public void save(ENAverageCountPersonal aENAverageCountPersonal) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. �������� ������*/
  public ENAverageCountPersonal getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. �������� ������ ������*/
  public ENAverageCountPersonalShortList getList() throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. �������� ������ �� �������*/
  public ENAverageCountPersonalShortList getFilteredList(ENAverageCountPersonalFilter aENAverageCountPersonalFilter) throws  java.rmi.RemoteException;  
  
  /*ENAverageCountPersonal. �������� ������ ��� ���������*/
  public ENAverageCountPersonalShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAverageCountPersonal. �������� ������ ��� ��������� �� �������*/
  public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonalFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAverageCountPersonal. �������� ������ ��� ��������� �� �������*/
  public ENAverageCountPersonalShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAverageCountPersonal. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENAverageCountPersonalFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENAverageCountPersonal. ������ ������ */
  public int calculateAverageCountPersonal(ENAverageCountPersonal aENAverageCountPersonal) throws java.rmi.RemoteException;

  /* �������� ���������� �������� �� ������� ����������� ��������� */
  public ENAverageCountPersonalShortList getListCalculatedPeriod() throws  java.rmi.RemoteException; 

  
  }