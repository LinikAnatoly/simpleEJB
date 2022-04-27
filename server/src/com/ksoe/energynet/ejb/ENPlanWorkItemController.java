
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
import java.util.Date;
import com.ksoe.energynet.valueobject.DSFstWorkRequest;
import com.ksoe.energynet.valueobject.DSFstWorkResponse;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemForClosePlanShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;

public interface ENPlanWorkItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkItemController";


  /*ENPlanWorkItem. Добавить*/
  public int add(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;

  /*ENPlanWorkItem. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /* ENPlanWorkItem. Изменить */
	public void save(ENPlanWorkItem aENPlanWorkItem)
			throws java.rmi.RemoteException;

	public void save(ENPlanWorkItem object, boolean isForAutoPlanOwnProduction)
			throws java.rmi.RemoteException;

	public void save(ENPlanWorkItem object, boolean isForAutoPlanOwnProduction,
			boolean checkMonthPlan) throws java.rmi.RemoteException;


  /*ENPlanWorkItem. Получить объект*/
  public ENPlanWorkItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Получить полный список*/
  public ENPlanWorkItemShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Получить список по фильтру*/
  public ENPlanWorkItemShortList getFilteredList(ENPlanWorkItemFilter aENPlanWorkItemFilter) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Получить список для просмотра*/
  public ENPlanWorkItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Получить список для просмотра по фильтру*/
  public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Получить список для просмотра по условию*/
  public ENPlanWorkItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int addBySRS(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addBySVES(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addBySPS(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addByByt(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public int addByProm(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;

  public void saveBySRS(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveBySVES(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveBySPS(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveByByt(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;
  public void saveByProm(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;

  public void removeBySRS(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeBySVES(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeBySPS(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeByByt(int anObjectCode) throws  java.rmi.RemoteException;
  public void removeByProm(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem. Добавить для работ на сторону*/
  public int addForCalculation(ENPlanWorkItem object, BigDecimal distance) throws java.rmi.RemoteException;

  public int addForCalculation(ENPlanWorkItem object, BigDecimal distance,
          int planKindCode, boolean priconnections, int soCode, TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) throws java.rmi.RemoteException;

  public void saveForCalculation(ENPlanWorkItem object, BigDecimal distance) throws java.rmi.RemoteException;
  public void saveForCalculation(ENPlanWorkItem object, BigDecimal distance, boolean priconnections) throws java.rmi.RemoteException;
  public void saveForCalculationSilent(ENPlanWorkItem object, BigDecimal distance) throws java.rmi.RemoteException;

  public void removeForCalculation(int code) throws java.rmi.RemoteException;

  public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object, BigDecimal distance  ) throws java.rmi.RemoteException;

  public int addPlanWorkItemsByClassificationTypeForCalculation(
          ENPlanWork2ClassificationType object, BigDecimal distance, boolean priconnections, int soCode) throws java.rmi.RemoteException;

  public int addPlanWorkItemsByClassificationTypeForCalculation(
          ENPlanWork2ClassificationType object, BigDecimal distance, boolean priconnections, int soCode, TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) throws java.rmi.RemoteException;

  public int addPlanWorkItemsByClassificationTypeForCalculation(
          ENPlanWork2ClassificationType object, BigDecimal distance, int planKindCode, boolean priconnections, int soCode, TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) throws java.rmi.RemoteException;

  public void savePlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object, BigDecimal distance  ) throws java.rmi.RemoteException;
  public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(ENPlanWork2ClassificationType object, BigDecimal distance , BigDecimal machinehours  ) throws java.rmi.RemoteException;
  public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed(ENPlanWork2ClassificationType object, BigDecimal distance , BigDecimal machinehours ) throws java.rmi.RemoteException;
  public void removePlanWorkItemsByClassificationTypeForCalculation(int plan2classificationTypeCode) throws java.rmi.RemoteException;

  /* для нелицензированных работ + (выборочные операции) */
  public int addPlanByListOperationsNotLicensed(
        ENPlanWork2ClassificationType object, BigDecimal distance,
        BigDecimal machinehours, String condition) throws java.rmi.RemoteException;

  public int addByServicesFromSideObject(ENPlanWorkItem aENPlanWorkItem) throws java.rmi.RemoteException;
  public void removeByServicesFromSideObject(int anObjectCode) throws  java.rmi.RemoteException;

  /* Для лецензированых работ под новый механизм с учетом класификаций для которых резервируется время выполнения*/
  public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object, BigDecimal distance , int codeRem  ) throws java.rmi.RemoteException; // ВЕРСИЯ С ПОДРАЗДЕЛЕНИЕМ
  public void savePlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object, BigDecimal distance , int codeRem ) throws java.rmi.RemoteException; //ВЕРСИЯ С ПОДРАЗДЕЛЕНИЕМ
  /* для нелицензированных работ + (выборочные операции) ВЕРСИЯ С ПОДРАЗДЕЛЕНИЕМ*/
  public int addPlanByListOperationsNotLicensed2(ENPlanWork2ClassificationType object, BigDecimal distance, BigDecimal machinehours, String condition , int codeRem) throws java.rmi.RemoteException;

  /*версия с подразделениями*/
  public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(ENPlanWork2ClassificationType object, BigDecimal distance , BigDecimal machinehours  , int codeRem ) throws java.rmi.RemoteException;
  
  public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
          ENPlanWork2ClassificationType object, BigDecimal distance,
          BigDecimal machinehours, int codeRem, boolean priconnections, Date customPlanDate) throws java.rmi.RemoteException;
  
  /*версия с подразделениями */
  public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(ENPlanWork2ClassificationType object, BigDecimal distance , BigDecimal machinehours , int codeRem ) throws java.rmi.RemoteException;


  /* добавление работ из классификации для планов на договора по ТУ */
  public void addPlanWorkItemsByClassificationTypeForTechConditions(int classificationTypeCode, BigDecimal countGen, int planCode) throws java.rmi.RemoteException;
  public void addPlanWorkItemsByClassificationTypeForTechConditions(int classificationTypeCode, BigDecimal countGen, int planCode, 
		  boolean isForSupplier) throws java.rmi.RemoteException;
  
  public void changeWork(int planItemCode, int techCardCode) throws java.rmi.RemoteException;

    /**
    *
    *   !!!!!!!! Хитрая замена работы в плане !!!!!!!!
    *   !!!!!!!! материалы переносятся на новую работу !!!!!!!!
    *   !!!!!!!! стара работа обнуляется !!!!!!
    *
    */

    public int changePlanWorkItem(ENPlanWorkItem object) throws java.rmi.RemoteException;
    public void saveByChange(ENPlanWorkItem aENPlanWorkItem) throws  java.rmi.RemoteException;

    public int addForAVR(ENPlanWork object, ENPlanWorkItem[] planItems,
            String masterCode, String masterName, String mechanicCode, String mechanicName) throws java.rmi.RemoteException;


	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, Date customPlanDate) throws java.rmi.RemoteException;

    public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices) throws java.rmi.RemoteException;

	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType) throws java.rmi.RemoteException;

	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType, boolean relaxation, Date customPlanDate) throws java.rmi.RemoteException;

    public int addPlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections)
            throws java.rmi.RemoteException;

    public int addPlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections, boolean addTU)
            throws java.rmi.RemoteException;


    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem, boolean priconnections)
            throws java.rmi.RemoteException;

    public int addPlanByListOperationsNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition, int codeRem,
            boolean priconnections)
            throws java.rmi.RemoteException;

    public void savePlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections)
            throws java.rmi.RemoteException;

    public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem, boolean priconnections)
            throws java.rmi.RemoteException;

    public int addPlanWorkItemsByClassificationForPriconnection(int tcsCode,
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections)
            throws java.rmi.RemoteException;

    public void removePlanWorkItemsByClassificationTypeForConnection(
            int plan2classificationTypeCode) throws java.rmi.RemoteException;

    public void savePlanWorkItemsByClassificationTypeForConnection(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            boolean priconnections) throws java.rmi.RemoteException;

    /*ENPlanWorkItem. Добавить для АВР*/
    public int add(ENPlanWorkItem aENPlanWorkItem, boolean isFromAVRInterface) throws java.rmi.RemoteException;
    /*ENPlanWorkItem. Добавить для работ по подключению/отключению по реестрам Поставщиков*/
    public int add(ENPlanWorkItem object, boolean isFromAVRInterface, boolean isForSupplier) throws java.rmi.RemoteException;
    
    public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
            int planStateCode, String comment, ENPlanWorkItem[] planItems,
            int netObjectCode) throws java.rmi.RemoteException;
    public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
    		int planStateCode, String comment, ENPlanWorkItem[] planItems, int netObjectCode, FINExecutor finExecutorObj,
            String masterMolCode, String masterMolName,
            String mechanicMolCode, String mechanicMolName,
            Date dateStart, Date dateFinal, int planReasonCode, int enDepCode, int enBudgCode, int enRespCode) throws java.rmi.RemoteException;


    public int addForWorkOrderBytFromCallCenter(int ccDamageLogCode, int elementCode, int renCode, int planTypeCode,
    		String comment, ENPlanWorkItem[] planItems, FINExecutor finExecutor, int enDepCode, int edBudgCode, int enRespCode) throws java.rmi.RemoteException;


	public void savePlanWorkItemsByClassificationTypeForRent(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem)
			throws java.rmi.RemoteException;

	public int addPlanWorkItemsByClassificationTypeForRent(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem, Date customPlanDate)
			throws java.rmi.RemoteException;

	public void savePlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem)
			throws java.rmi.RemoteException;

	public int addPlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem, Date customPlanDate)
			throws java.rmi.RemoteException;
	
	public void savePlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationType object, int codeRem)
			throws java.rmi.RemoteException;

	public int addPlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationType object,  int codeRem, Date customPlanDate)
			throws java.rmi.RemoteException;


	/** Список работ с допустимым кол-вом для создания наряд-задания... */
	public ENPlanWorkItemForClosePlanShortList getPlanWorkItemForClosePlanList(int planCode)
			throws java.rmi.RemoteException;
	
	public void moveWorkToAbstractPlan(int planItemCode)   			
			throws java.rmi.RemoteException;
	
	
	public void moveWorkFromAbstractPlan(int planItemCode)   			
			throws java.rmi.RemoteException;
	
	public void moveTransportToSelectedWork(int planItemFromCode,int planItemToCode) 
			throws java.rmi.RemoteException;
	
	public DSFstWorkResponse submitFstWork(DSFstWorkRequest request) throws java.rmi.RemoteException;
	public void annulateFstWork(int planCode, Date date) throws java.rmi.RemoteException;

}