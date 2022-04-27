
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2FinShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;

public interface FINMaterialsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMaterialsController";


  /*FINMaterials. Добавить*/
  public int add(FINMaterials aFINMaterials) throws java.rmi.RemoteException;

  /*FINMaterials. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMaterials. Изменить*/
  public void save(FINMaterials aFINMaterials) throws  java.rmi.RemoteException;

  /*FINMaterials. Получить объект*/
  public FINMaterials getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMaterials. Получить полный список*/
  public FINMaterialsShortList getList() throws  java.rmi.RemoteException;

  /*FINMaterials. Получить список по фильтру*/
  public FINMaterialsShortList getFilteredList(FINMaterialsFilter aFINMaterialsFilter) throws  java.rmi.RemoteException;

  /*FINMaterials. Получить список для просмотра*/
  public FINMaterialsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINMaterials. Получить список для просмотра по фильтру*/
  public FINMaterialsShortList getScrollableFilteredList(FINMaterialsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINMaterials. Получить список для просмотра по условию*/
  public FINMaterialsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public FINMaterialsList getMaterialsList(FINMaterialsFilter aFilter, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode) throws java.rmi.RemoteException;
  public Date getOpenPeriodDate()  throws java.rmi.RemoteException;
  public FINMaterialsList getMaterialsList(int planCode, FINMaterialsFilter aFilterObject, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode) throws java.rmi.RemoteException;
  public FINMaterialsList getMaterialsListWithAvar(FINMaterialsFilter aFilter, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode) throws java.rmi.RemoteException;

  public FINMaterialsShortList getGroupedFilteredList(FINMaterialsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  public int addMaterials(FINMaterials obj)  throws  java.rmi.RemoteException;
  public int addMaterials(FINMaterials object, boolean isException) throws java.rmi.RemoteException;

  public int addGsm(FINMaterials obj) throws  java.rmi.RemoteException;

  public int add_(FINMaterials object)  throws  java.rmi.RemoteException;
  public int add_(FINMaterials object, boolean isException) throws java.rmi.RemoteException;

  public void remove_(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeMaterials(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeGsm(int anObjectCode) throws  java.rmi.RemoteException;

  public FINMaterialsShortList getFilteredPartyList(int estimateItemCode)  throws  java.rmi.RemoteException;

  public FINMaterialsShortList getListForTranzit2Operative(Date dateStart, Date dateFinish, int budgetCode, int departmentCode, String condition) throws  java.rmi.RemoteException;

  public FINMaterialsShortList getFilteredPartyListWriteOff(int estimateItemCode, String codeMol) throws java.rmi.RemoteException;

  public void setExtraCargo(String NN,BigDecimal newExtraCargo)  throws java.rmi.RemoteException;

  public BigDecimal getExtraCargo(String NN)  throws java.rmi.RemoteException;

  /*FINMaterials. Получить расширенный лист для привязки материалов*/
  //public ENEstimateItem2FinShortList getENEstimateItem2FinShortList(int planCode, String MOLCode, Date docDate, int finDocCode) throws java.rmi.RemoteException;
  public ENEstimateItem2FinShortList getENEstimateItem2FinShortList(int planCode, FINMaterialsFilter finFilter, String MOLCode,
			String balansNumberCondition, String materialCondition, Date docDate, int finDocCode) throws java.rmi.RemoteException;
  /*FINMaterials. Массовое резервирование материалов */
  public void batchAddMaterials(FINMaterials[] finList) throws java.rmi.RemoteException;

  public ENEstimateItem2FinShortList getShortListWithFinMaterialsForFact(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /**
   *
   * Установка зоны для массива FINMaterials'ов.
   *
   * Используется для установки зоны изготовленным материалам.
   *
   * @param objects массив объектов FINMaterials
   * @param storageZoneCode код зоны хранения
   */
  public void setStorageZone(FINMaterials[] objects, int storageZoneCode) throws java.rmi.RemoteException;
}