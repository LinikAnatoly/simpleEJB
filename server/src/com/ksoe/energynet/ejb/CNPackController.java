
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;

public interface CNPackController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNPackController";


  /*CNPack. Добавить*/
  public int add(CNPack aCNPack) throws java.rmi.RemoteException;

  /*CNPack. Добавление пакета EnergyWorkFlow с первым движением*/
  public int addPackCN(CNPack pack) throws java.rmi.RemoteException;

  /*CNPack. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack. Изменить*/
  public void save(CNPack aCNPack) throws  java.rmi.RemoteException;

  /*CNPack. Изменить пакет EnergyWorkFlow*/
  public int savePackCN(CNPack pack) throws java.rmi.RemoteException;

  /*CNPack. Получить объект*/
  public CNPack getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack. Получить объект по кодам пакета и подсистемы*/
  public CNPack getObjectByCodeAndSubsystem(int uid, int ssID) throws java.rmi.RemoteException;

  /*CNPack. Получить полный список*/
  public CNPackShortList getList() throws  java.rmi.RemoteException;

  /*CNPack. Получить список по фильтру*/
  public CNPackShortList getFilteredList(CNPackFilter aCNPackFilter) throws  java.rmi.RemoteException;

  /*CNPack. Получить список для просмотра*/
  public CNPackShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNPack. Получить список для просмотра по фильтру*/
  public CNPackShortList getScrollableFilteredList(CNPackFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNPack. Получить список для просмотра по условию*/
  public CNPackShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*CNPack. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(CNPackFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(Пакети документів з EnergyWorkflow). Получить список по фильтру для просмотра */
  public CNPackShortList getCNPackList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(EnergyWorkflow). Получить список пакетов подсистем
   * ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 по фильтру с текущими состояниями */
  public CNPackShortList getCNPackCurStateList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* CNPack(EnergyWorkflow). Получить пакеты
   * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО И БЫТОВОГО СЕКТОРОВ
   * по фильтру с текущими состояниями */
  public CNPackShortList getSPL_PP_PackCurStateList(CNPackFilter f, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public void completeTask(int id_pack, int id_movement, int[] states, int id_pack_status, int id_user, String note, String client_ip)
		  throws java.rmi.RemoteException;
  
  public void sendPackToArchive(int id_pack, int id_movement, int id_user, String note, String client_ip) throws java.rmi.RemoteException;
  
  public void deleteDSTPack(int id_pack, int id_pack_status, int id_old_pack_status, int id_user, String action) throws java.rmi.RemoteException;
  
  /*Обновляем EIC для DFDocSupplyEEОбновляем EIC для DFDocSupplyEE*/
  public void updateEICDFDocSupplyEE(int cnDSTPackCode, String eic) throws java.rmi.RemoteException;
  }