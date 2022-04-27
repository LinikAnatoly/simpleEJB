
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;

public interface FINMolDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMolDataController";


  /*FINMolData. ��������*/
  public int add(FINMolData aFINMolData) throws java.rmi.RemoteException;

  // ������ ���, SAVE, REMOVE
  public int add(FINMolData object, int parentCode, int parentTypeCode) throws java.rmi.RemoteException;  
  public void save(FINMolData object, int parentCode, int parentTypeCode) throws java.rmi.RemoteException; 
  public void remove(int molDataCode, int parentCode, int parentTypeCode)  throws java.rmi.RemoteException; 
	  

  /*FINMolData. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolData. ��������*/
  public void save(FINMolData aFINMolData) throws  java.rmi.RemoteException;

  /*FINMolData. �������� ������*/
  public FINMolData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolData. �������� ������ ������*/
  public FINMolDataShortList getList() throws  java.rmi.RemoteException;

  /*FINMolData. �������� ������ �� �������*/
  public FINMolDataShortList getFilteredList(FINMolDataFilter aFINMolDataFilter) throws  java.rmi.RemoteException;  
  
  /*FINMolData. �������� ������ ��� ���������*/
  public FINMolDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINMolData. �������� ������ ��� ��������� �� �������*/
  public FINMolDataShortList getScrollableFilteredList(FINMolDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINMolData. �������� ������ ��� ��������� �� �������*/
  public FINMolDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;
  }