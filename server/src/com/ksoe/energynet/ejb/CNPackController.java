
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;

public interface CNPackController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNPackController";


  /*CNPack. ��������*/
  public int add(CNPack aCNPack) throws java.rmi.RemoteException;

  /*CNPack. ���������� ������ EnergyWorkFlow � ������ ���������*/
  public int addPackCN(CNPack pack) throws java.rmi.RemoteException;

  /*CNPack. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack. ��������*/
  public void save(CNPack aCNPack) throws  java.rmi.RemoteException;

  /*CNPack. �������� ����� EnergyWorkFlow*/
  public int savePackCN(CNPack pack) throws java.rmi.RemoteException;

  /*CNPack. �������� ������*/
  public CNPack getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack. �������� ������ �� ����� ������ � ����������*/
  public CNPack getObjectByCodeAndSubsystem(int uid, int ssID) throws java.rmi.RemoteException;

  /*CNPack. �������� ������ ������*/
  public CNPackShortList getList() throws  java.rmi.RemoteException;

  /*CNPack. �������� ������ �� �������*/
  public CNPackShortList getFilteredList(CNPackFilter aCNPackFilter) throws  java.rmi.RemoteException;

  /*CNPack. �������� ������ ��� ���������*/
  public CNPackShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNPack. �������� ������ ��� ��������� �� �������*/
  public CNPackShortList getScrollableFilteredList(CNPackFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNPack. �������� ������ ��� ��������� �� �������*/
  public CNPackShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*CNPack. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(CNPackFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(������ ��������� � EnergyWorkflow). �������� ������ �� ������� ��� ��������� */
  public CNPackShortList getCNPackList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(EnergyWorkflow). �������� ������ ������� ���������
   * ������������� �� � ����� 01.08.2010, � 14.03.2011 �� ������� � �������� ����������� */
  public CNPackShortList getCNPackCurStateList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(EnergyWorkflow). �������� ������
   * �������� �������������� ������������ ������������ � �������� ��������
   * �� ������� � �������� ����������� */
  public CNPackShortList getSPL_PP_PackCurStateList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public void completeTask(int id_pack, int id_movement, int[] states, int id_pack_status, int id_user, String note, String client_ip)
		  throws java.rmi.RemoteException;
  
  public void sendPackToArchive(int id_pack, int id_movement, int id_user, String note, String client_ip) throws java.rmi.RemoteException;
  
  public void deleteDSTPack(int id_pack, int id_pack_status, int id_old_pack_status, int id_user, String action) throws java.rmi.RemoteException;
  
  /*��������� EIC ��� DFDocSupplyEE��������� EIC ��� DFDocSupplyEE*/
  public void updateEICDFDocSupplyEE(int cnDSTPackCode, String eic) throws java.rmi.RemoteException;
  }