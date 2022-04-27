
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTimeLine;
import com.ksoe.energynet.valueobject.brief.ENTimeLineShort;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;

public interface ENTimeLineController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTimeLineController";


  /*ENTimeLine. ��������*/
  public int add(ENTimeLine aENTimeLine) throws java.rmi.RemoteException;

  /*ENTimeLine. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTimeLine. ��������*/
  public void save(ENTimeLine aENTimeLine) throws  java.rmi.RemoteException;

  /*ENTimeLine. �������� ������*/
  public ENTimeLine getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTimeLine. �������� ������ ������*/
  public ENTimeLineShortList getList() throws  java.rmi.RemoteException;

  /*ENTimeLine. �������� ������ �� �������*/
  public ENTimeLineShortList getFilteredList(ENTimeLineFilter aENTimeLineFilter) throws  java.rmi.RemoteException;  
  
  /*ENTimeLine. �������� ������ ��� ���������*/
  public ENTimeLineShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTimeLine. �������� ������ ��� ��������� �� �������*/
  public ENTimeLineShortList getScrollableFilteredList(ENTimeLineFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTimeLine. �������� ������ ��� ��������� �� ������� (��� ������������)*/
  public ENTimeLineShortList getScrollableFilteredListForPlanning(ENTimeLineFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  /*ENTimeLine. �������� ������ ��� ��������� �� �������*/
  public ENTimeLineShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*ENTimeLine. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTimeLineFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public int addTimeLine(ENServicesObject servicesObject, ENTimeLineShort[] timeLineList)  throws java.rmi.RemoteException;
  
  public void removeTimeLine(ENServicesObject servicesObject)  throws java.rmi.RemoteException;
}