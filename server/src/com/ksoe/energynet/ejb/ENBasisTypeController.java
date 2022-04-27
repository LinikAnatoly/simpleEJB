
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBasisType;
import com.ksoe.energynet.valueobject.filter.ENBasisTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENBasisTypeShortList;

public interface ENBasisTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBasisTypeController";


  /*ENBasisType. ��������*/
  public int add(ENBasisType aENBasisType) throws java.rmi.RemoteException;

  /*ENBasisType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBasisType. ��������*/
  public void save(ENBasisType aENBasisType) throws  java.rmi.RemoteException;

  /*ENBasisType. �������� ������*/
  public ENBasisType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBasisType. �������� ������ ������*/
  public ENBasisTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENBasisType. �������� ������ �� �������*/
  public ENBasisTypeShortList getFilteredList(ENBasisTypeFilter aENBasisTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENBasisType. �������� ������ ��� ���������*/
  public ENBasisTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBasisType. �������� ������ ��� ��������� �� �������*/
  public ENBasisTypeShortList getScrollableFilteredList(ENBasisTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBasisType. �������� ������ ��� ��������� �� �������*/
  public ENBasisTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENBasisType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENBasisTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }