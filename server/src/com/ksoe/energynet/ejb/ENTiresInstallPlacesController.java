
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTiresInstallPlaces;
import com.ksoe.energynet.valueobject.filter.ENTiresInstallPlacesFilter;
import com.ksoe.energynet.valueobject.lists.ENTiresInstallPlacesShortList;

public interface ENTiresInstallPlacesController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTiresInstallPlacesController";


  /*ENTiresInstallPlaces. ��������*/
  public int add(ENTiresInstallPlaces aENTiresInstallPlaces) throws java.rmi.RemoteException;

  /*ENTiresInstallPlaces. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallPlaces. ��������*/
  public void save(ENTiresInstallPlaces aENTiresInstallPlaces) throws  java.rmi.RemoteException;

  /*ENTiresInstallPlaces. �������� ������*/
  public ENTiresInstallPlaces getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallPlaces. �������� ������ ������*/
  public ENTiresInstallPlacesShortList getList() throws  java.rmi.RemoteException;

  /*ENTiresInstallPlaces. �������� ������ �� �������*/
  public ENTiresInstallPlacesShortList getFilteredList(ENTiresInstallPlacesFilter aENTiresInstallPlacesFilter) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallPlaces. �������� ������ ��� ���������*/
  public ENTiresInstallPlacesShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallPlaces. �������� ������ ��� ��������� �� �������*/
  public ENTiresInstallPlacesShortList getScrollableFilteredList(ENTiresInstallPlacesFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTiresInstallPlaces. �������� ������ ��� ��������� �� �������*/
  public ENTiresInstallPlacesShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTiresInstallPlaces. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTiresInstallPlacesFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }