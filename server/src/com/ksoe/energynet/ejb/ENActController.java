
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.brief.ENActShort;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;

public interface ENActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActController";


  /*ENAct. Добавить*/
  public int add(ENAct aENAct) throws java.rmi.RemoteException;
  public int add(ENAct object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENAct. Удалить*/
  public void remove(int anObjectCode, int isClient) throws  java.rmi.RemoteException;

  /*ENAct. Изменить*/
  public void save(ENAct aENAct) throws java.rmi.RemoteException;
  public void save(ENAct object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  public void saveDFDocSigners(ENAct object) throws java.rmi.RemoteException;
  public void saveDFDocSigners(ENAct object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENAct. Получить объект*/
  public ENAct getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct. Получить полный список*/
  public ENActShortList getList() throws  java.rmi.RemoteException;

  /*ENAct. Получить список по фильтру*/
  public ENActShortList getFilteredList(ENActFilter aENActFilter) throws  java.rmi.RemoteException;

  /*ENAct. Получить список для просмотра*/
  public ENActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAct. Получить список для просмотра по фильтру*/
  public ENActShortList getScrollableFilteredList(ENActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAct. Получить список для просмотра по условию*/
  public ENActShortList getScrollableListByCondition(String aCondition, int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /* ENAct. Получить список ПК-кодов по фильтру */
  public int[] getScrollableFilteredCodeArray(ENActFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* ENAct. Получить объект из списка */
  public ENActShort getShortObject(int code) throws java.rmi.RemoteException;

  /* проведение акта !!! ПЕРЕКолбас в ФинКол*/
  public void close(int act, int isClient, boolean withUseAxTransaction) throws java.rmi.RemoteException;
  public void close(int code, int isClient, boolean isBeginAxTransaction, Object caller) throws java.rmi.RemoteException;
  public void close(int act, int isClient) throws java.rmi.RemoteException;
  public void close(int code, int isClient, Object caller) throws java.rmi.RemoteException;

  public void closeZKU(int code, int isClient) throws java.rmi.RemoteException;

  // отмена ПРОВЕДЕНИЯ акта в 300
  public void unClose(int code, int isClient) throws java.rmi.RemoteException;
  public void unCloseByEcp(int code, int isClient) throws java.rmi.RemoteException;

  public void unCloseZKU(int code, int isClient) throws java.rmi.RemoteException;


  /** перевод акта в статус "На підписанні"
   *
   * @param actCode - код акта
   * @param isSignatured - указание для перевода акта в статус "На підписанні"
   */
  public void fillActData(int actCode, boolean isSignatured) throws java.rmi.RemoteException;
  public void fillActData(int code) throws java.rmi.RemoteException;


  public ENActShortList getActs4Recalc(int actCode)   throws java.rmi.RemoteException;

  public ENPlanWorkShortList getRelatedWorkOrders(int actCode) throws java.rmi.RemoteException;

  public void signatured(int actCode) throws java.rmi.RemoteException;
  public void signatured(int actCode, boolean checkDocCode) throws java.rmi.RemoteException;

  public void unSignatured(int actCode) throws java.rmi.RemoteException;

  /** отмена подписания акта
   *  @param deleteUsageInput - указание для удаления дока по счетчикам
   */
  public void unSignatured(int actCode, boolean deleteUsageInput) throws java.rmi.RemoteException;


  public ENPlan2HumenShortList getRelatedWorkOrdersByTabNumber(int actCode, String tabNumber)  throws java.rmi.RemoteException;

  public int getCountProvByActCode(int actCode)  throws java.rmi.RemoteException;

  public void unSignaturedServicesFS(int actCode)  throws java.rmi.RemoteException;

  /* 21.09.2012 +++ изменение даты проведения акта */
  public void changeDateMove(ENAct aENAct) throws  java.rmi.RemoteException;

  public void moveToReversed(int actCode) throws  java.rmi.RemoteException;

  public int createActForRecyclableMaterials(ENAct act) throws java.rmi.RemoteException;
  public void removeActForRecyclableMaterials(int actCode) throws java.rmi.RemoteException;
  public int createActForRecyclableMaterials(ENAct act, boolean isActEmptyException) throws java.rmi.RemoteException;
  
  public FKProvObjectShortList getPostingsList(int servicesObjectCode, boolean isMaterials) throws java.rmi.RemoteException;
  
  /**
   * 
   * Проставление или снятие признака "Проверено в бухгалтерии"
   * 
   * @param actCode код расходного акта ордера {@link ENAct}
   * @param isChecked true - проставление признака, false - снятие признака 
   */
  public void checkOrUncheckByAccountant(int actCode, boolean isChecked) throws java.rmi.RemoteException;

  public EPReportRequestEx[] getReportsListForENAct(ENAct act) throws java.rmi.RemoteException;

 }