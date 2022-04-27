
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;

public interface ENMetrologyCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyCounterController";


  /*ENMetrologyCounter. ��������*/
  public int add(ENMetrologyCounter aENMetrologyCounter) throws java.rmi.RemoteException;

  /*ENMetrologyCounter. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. ��������*/
  public void save(ENMetrologyCounter aENMetrologyCounter) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. �������� ������*/
  public ENMetrologyCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. �������� ������ ������*/
  public ENMetrologyCounterShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. �������� ������ �� �������*/
  public ENMetrologyCounterShortList getFilteredList(ENMetrologyCounterFilter aENMetrologyCounterFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyCounter. �������� ������ ��� ���������*/
  public ENMetrologyCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyCounter. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyCounter. �������� ������ ��� ��������� �� �������*/
  public ENMetrologyCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  // ���� ������ ��������� �� �����������"�� ....
  public ENMetrologyCounterShortList getCountersList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /**
   * 
   * ������� ��������� �� ������������� � �������� �������
   * 
   * ��-�� ����, ��� � oracle ������ � ������� ���������� � 1�� ������, �� ����� ������ � ���������� fromPosition = 0
   * � fromPosition = 1 ������ ���������� ���������.
   * 
   * @param filterObject ������ ������� {@link ENMetrologyCounterFilter}
   * @param fromPosition � ����� ������� ��������
   * @param quantity ���������� ������� ��� -1 ���� ����� ������� ���
   * @param accountingTypeCode ��� ���� ����� {@link com.ksoe.techcard.valueobject.TKAccountingType}
   * @return ���� �������� {@link ENMetrologyCounterShortList}
   * @throws java.rmi.RemoteException
   */
  public ENMetrologyCounterShortList getCountersList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity, int accountingTypeCode) throws java.rmi.RemoteException;
  
  //���� ������ ������������ ��������� �� DISTINCT �� �����������"�� ....
  public ENMetrologyCounterShortList getCountersListDistinctName(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  public ENMetrologyCounterShortList getSealsList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  public ENMetrologyCounterShortList getSealsList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity, boolean showAll) throws java.rmi.RemoteException;

  public boolean isAccountForParametrization(String account) throws java.rmi.RemoteException;
  public String getStringAccountsForParametrization() throws java.rmi.RemoteException;
  
}