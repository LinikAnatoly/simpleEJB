
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.valueobject.ENConnectionTariff;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;

public interface ENConnectionTariffController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENConnectionTariffController";


  /*ENConnectionTariff. ��������*/
  public int add(ENConnectionTariff aENConnectionTariff) throws java.rmi.RemoteException;

  /*ENConnectionTariff. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. ��������*/
  public void save(ENConnectionTariff aENConnectionTariff) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������*/
  public ENConnectionTariff getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ ������*/
  public ENConnectionTariffShortList getList() throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ �� �������*/
  public ENConnectionTariffShortList getFilteredList(ENConnectionTariffFilter aENConnectionTariffFilter) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ ��� ���������*/
  public ENConnectionTariffShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ ��� ��������� �� �������*/
  public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariffFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ ��� ��������� �� �������*/
  public ENConnectionTariffShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*ENConnectionTariff. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENConnectionTariffFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* ENConnectionTariff. �������� ������ */
  public ENConnectionTariffShort getShortObject(int code) throws java.rmi.RemoteException;
  public ENConnectionTariffShort getShortObject(int code, Date dateTY) throws java.rmi.RemoteException;

  public ENConnectionTariffShortList getScrollableFilteredList(
          ENConnectionTariff aFilterObject, int fromPosition, int quantity, Date dateTY) throws java.rmi.RemoteException;

  /* ENConnectionTariff. �������� ������ ��� ��������� �� ������� */
    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects, Date dateTY) throws java.rmi.RemoteException;

}