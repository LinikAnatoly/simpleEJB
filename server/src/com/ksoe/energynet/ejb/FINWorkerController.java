
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;

public interface FINWorkerController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINWorkerController";


  /*FINWorker. ��������*/
  public int add(FINWorker aFINWorker) throws java.rmi.RemoteException;

  /*FINWorker. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINWorker. ��������*/
  public void save(FINWorker aFINWorker) throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������*/
  public FINWorker getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������ ������*/
  public FINWorkerShortList getList() throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������ �� �������*/
  public FINWorkerShortList getFilteredList(FINWorkerFilter aFINWorkerFilter) throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������ ��� ���������*/
  public FINWorkerShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������ ��� ��������� �� �������*/
  public FINWorkerShortList getScrollableFilteredList(FINWorkerFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINWorker. �������� ������ ��� ��������� �� �������*/
  public FINWorkerShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /* �������� ������ ���������� � �� ... */
  public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dataGet)  throws java.rmi.RemoteException;

  public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject, int fromPosition, int quantity, boolean isShowCEO) throws java.rmi.RemoteException;
  public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dataGet, boolean isShowCEO)  throws java.rmi.RemoteException;

  public FINWorkerShortList getFINWorkerListWithWorkLoad(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dateGet, boolean isShowCEO) throws java.rmi.RemoteException;

  /* FINWorker. ������ ��� ������ ������������� ��� �� ���������� �� �� */
  public FINWorkerShortList getFINWorkerByTechCondResponsibleList(FINWorkerFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public FINWorkerShortList getFINWorkerByTechCondResponsibleList(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dataGet) throws java.rmi.RemoteException;
  
  
  public FINWorkerShortList getWorkerListForReport(FINWorkerFilter filterObject, int fromPosition, int quantity, boolean isShowCEO) throws java.rmi.RemoteException;
  public FINWorkerShortList getFINWorkerListForENWarrant(FINWorkerFilter filterObject) throws java.rmi.RemoteException;

}