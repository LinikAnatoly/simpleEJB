
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.ENAutoTiresInstallInfo;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresShortList;

public interface ENAutoTiresController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAutoTiresController";


  /*ENAutoTires. ��������*/
  public int add(ENAutoTires aENAutoTires) throws java.rmi.RemoteException;

  /*ENAutoTires. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTires. ��������*/
  public void save(ENAutoTires aENAutoTires) throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������*/
  public ENAutoTires getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������ ������*/
  public ENAutoTiresShortList getList() throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������ �� �������*/
  public ENAutoTiresShortList getFilteredList(ENAutoTiresFilter aENAutoTiresFilter) throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������ ��� ���������*/
  public ENAutoTiresShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������ ��� ��������� �� �������*/
  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTiresFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAutoTires. �������� ������ ��� ��������� �� �������*/
  public ENAutoTiresShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAutoTires. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENAutoTiresFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENAutoTires. ���������� �� ���������*/
  public ENAutoTiresInstallInfo getInstallInfo(int tiresCode) throws java.rmi.RemoteException;

}