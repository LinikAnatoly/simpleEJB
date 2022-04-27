
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.rmi.RemoteException;

import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemWriteOffShortList;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.valueobject.filter.RQOrderFilter;

public interface ENEstimateItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemController";


  /*ENEstimateItem. Добавить*/
  public int add(ENEstimateItem aENEstimateItem) throws java.rmi.RemoteException;

  /*ENEstimateItem. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Изменить*/
  public void save(ENEstimateItem aENEstimateItem) throws  java.rmi.RemoteException;
  public void save(ENEstimateItem object, String account) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить объект*/
  public ENEstimateItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить полный список*/
  public ENEstimateItemShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить список по фильтру*/
  public ENEstimateItemShortList getFilteredList(ENEstimateItemFilter aENEstimateItemFilter) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить список для просмотра*/
  public ENEstimateItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить список для просмотра по фильтру*/
  public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENEstimateItem. Получить список для просмотра по условию*/
  public ENEstimateItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;


  public int addBySRS(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addBySVES(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addBySPS(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addByByt(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addByProm(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;

  public void saveBySRS(ENEstimateItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveBySVES(ENEstimateItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveBySPS(ENEstimateItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveByByt(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public void saveByProm(ENEstimateItem aENPlanWorkItem) throws java.rmi.RemoteException;

  public void removeBySRS(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeBySVES(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeBySPS(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeByByt(int anObjectCode) throws java.rmi.RemoteException;
  public void removeByProm(int anObjectCode) throws java.rmi.RemoteException;


  public ENEstimateItemShortList getDetailedEstimateList(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter)  throws java.rmi.RemoteException;

  public ENEstimateItemShortList getForBillInvoiceList(ENEstimateItemFilter eiFilter, boolean isBill, int billType) throws java.rmi.RemoteException;

  public int changeStatus(int estimateItemCode, int statusCode) throws RemoteException;

  public ENEstimateItem getEstimateFromCurrentPlanByEstimateCode(int estimateCode)  throws RemoteException;

  public String getEstimateCodesFromCurrentPlan(int estimateCode) throws RemoteException;
  
  public ENEstimateItem getParentByMovedType(int estimateCode, int movedType)   throws RemoteException;

  public int addInClosedPlan(ENEstimateItem object) throws RemoteException;


  public int addUnmount(ENEstimateItem object, 
		  int nomenclatureCode, String nn,
		  int isCreateObject, String account) throws RemoteException;

  public int addUnmount(ENEstimateItem object, 
		  int nomenclatureCode, String nn,
		  int isCreateObject, int finMaterialParentCode, String account) throws java.rmi.RemoteException;

  public int addUnmount(ENEstimateItem object, 
		  int nomenclatureCode, String nn,
		  int isCreateObject, int finMaterialParentCode, String account, boolean writingTransformers) throws java.rmi.RemoteException;

  public void removeUnmount(int estimateItemCode) throws RemoteException;
  public void saveUnmount(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws RemoteException;


  public void saveUnmountForWriteOff(ENEstimateItem object, int nomenclatureCode, String nn, int dismountFromEstimate, String account) throws RemoteException;
  public int addUnmountForWriteOff(ENEstimateItem object, int nomenclatureCode, String nn, int isCreateObject , int dismountFromEstimate, String account) throws RemoteException;
  public void removeProduced(int estimateItemCode) throws RemoteException;
  public void saveProduced(ENEstimateItem object, int nomenclatureCode, String nn, String account, String divCode4Order, String divName4Order) throws RemoteException;
  public int addProduced(ENEstimateItem object, int nomenclatureCode, String nn, String account, String divCode4Order, String divName4Order) throws RemoteException;

  public void removeProduced4Services(int estimateItemCode) throws RemoteException;
  public void saveProduced4Services(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws RemoteException;
  public int addProduced4Services(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws RemoteException;

  public void removeRefinement(int estimateItemCode) throws RemoteException;
  public void saveRefinement(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws RemoteException;
  public void saveRefinement(ENEstimateItem object, int nomenclatureCode, String nn, String account, String molCode) throws RemoteException;
  public int addRefinement(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws RemoteException;
  public int addRefinement(ENEstimateItem object, int nomenclatureCode, String nn, String account, String molCode) throws RemoteException;
  
  public void save4Refinement(ENEstimateItem object, int isMain4Refinement) throws RemoteException;
  public int add4Refinement(ENEstimateItem object) throws RemoteException;

  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOff(String str)  throws java.rmi.RemoteException;

  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffSubstation(String str)  throws java.rmi.RemoteException;

  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffBrigade(String str)  throws java.rmi.RemoteException;

  public int addForWriteOffFromEstimateList(int codePlan, ENEstimateItemShort[] oldEstimateList)throws java.rmi.RemoteException;
  /*ENEstimateItem. Удалить сформированые материалы на плане для списания*/
  public void removeForWriteOff(int anObjectCode) throws  java.rmi.RemoteException;
  //public String getEstimateStateInfo(int estimateCode)   throws RemoteException;


  public int addUnmountForWriteOff_MBP_MNMA(ENEstimateItem object, int nomenclatureCode, String nn, int isCreateObject, int finMaterialParentCode, String account) throws java.rmi.RemoteException;
  public void saveUnmountForWriteOff_MBP_MNMA(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws java.rmi.RemoteException;
  public void removeUnmountForWriteOff_MBP_MNMA(int estimateItemCode) throws java.rmi.RemoteException;

  public void removeUnmountCountersWriteOff(int estimateItemCode) throws RemoteException;
  public int  addUnmountCountersWriteOff(ENEstimateItem object, int nomenclatureCode, String nn, int isCreateObject, String account) throws RemoteException;

  /* 01.03.2012 +++ изменить обнулённое кол-во */
  public void changeCountFact(ENEstimateItem aENEstimateItem) throws  java.rmi.RemoteException;

  public int addTires(ENEstimateItem object, UserProfile aUserProfile) throws RemoteException;

  /* ENEstimateItem. Список материалов и позиций расходной накладной */
	public ENEstimateItemShortList getEstimateByTransportRouteList(
			ENEstimateItemFilter aEPActFilter, String anCondition,
			String anOrderBy, int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

  /**
   *  16.06.2012 +++
   *  ENEstimateItem. Список материалов для передачи счетчиков Метрологии под плановые замены
   *  обычный лист (getDetailedEstimateList) страшно тормозит на PostgreSQL 9
   *
   */
	public ENEstimateItemShortList getDetailedEstimateBySCCountersList(
			ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter)
			throws java.rmi.RemoteException;

	public int[] getFilteredCodeArray(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

	public int addCustomerMaterial(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws java.rmi.RemoteException;
	public void saveCustomerMaterial(ENEstimateItem object, int nomenclatureCode, String nn, String account) throws java.rmi.RemoteException;
	public void removeCustomerMaterial(int estimateItemCode) throws java.rmi.RemoteException;

	public ENEstimateItemShortList getShortListForOSExpl(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

    public ENEstimateItemShortList getDetailedEstimateListForTender(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter, RQOrderFilter orderFilter,
		    boolean includePlanned, boolean includeOrdered, boolean includePresent) throws java.rmi.RemoteException;

    // SUPP-8470 привязка остатков под материалы плана
    public int bindingMaterialsFromRem(int enplanworkCode , java.util.Date orderDate) throws RemoteException;
    // SUPP-8470 отмена привязки остатков под материалы плана
    public void UnBindingMaterialsFromRem(int enplanworkCode , String enestimateitemCodes) throws RemoteException;

    //SUPP-13857 отдельный лист для выбора естимейтов с заявок в счет
    public ENEstimateItemShortList getForBillInvoiceListForGenerateItem(ENEstimateItemFilter eiFilter, boolean isBill, int billType) throws java.rmi.RemoteException;
    
    // net-4445 возвращает естимейт с мес плана для перемещений парам счетчиков с кладовщика рес на мастера счет 1533
    public int getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(ENMetrologyCounter sc ,String molOutCode) throws java.rmi.RemoteException;
    
    //добавление естимейтов в спецификацию к проекту договора
    public void estimateWithoutContractAdd2SpecificationExecute(ENEstimateItemShort[] eiList) throws java.rmi.RemoteException;
    
    // Видалити прив`язку вибраних строк матеріалів із проекту договора
    public void estimate2ProjectAgreeUnlink(ENEstimateItemShort[] eiList) throws java.rmi.RemoteException;
  
 // перечень естимейтов с учетом  связки естимейта к договорам enestimateitem2contrct
    public ENEstimateItemShortList getDetailedEstimate2ContractList(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter)  throws java.rmi.RemoteException;
    
   // связка естимейтов без договоров к договорам encontract 
    public void estimateWithoutContractLink2Contract(ENEstimateItemShort[] eiList , int enContractItemCode) throws java.rmi.RemoteException;
    
    //  Відмінити прив`язку вибраних строк матеріалів з планів від договору
    public void estimateWithContractUnLink2Contract(ENEstimateItemShort[] eiList) throws java.rmi.RemoteException;
    
    //   добавление выбранных естимейтов в план закупок
    public void estimateAdd2Planpurchase(ENEstimateItemShort[] eiList , int  planPurchaseCode) throws java.rmi.RemoteException;
    
    //  Списання ЗЗ персоналу ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано   
   public void writeOffZZOnlyEnergyNETBySizObject(ENEstimateItem  eiObject , String finMolCode) throws java.rmi.RemoteException;
   
   //  Списання ЗЗ бригады ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано   
   public void writeOffZZOnlyEnergyNETByBrigadeObject(ENEstimateItem  eiObject , String finMolCode) throws java.rmi.RemoteException;
   
   // Списання ЗЗ подстанции ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано   
   public void writeOffZZOnlyEnergyNETBySubstation150Object(ENEstimateItem  eiObject , String finMolCode) throws java.rmi.RemoteException;

   // преобразование незаказанных материалов на годовых и месячных планах
   public void transformEstimate(int estimateItemCode, ENEstimateItem newEstimate) throws java.rmi.RemoteException;
    
}