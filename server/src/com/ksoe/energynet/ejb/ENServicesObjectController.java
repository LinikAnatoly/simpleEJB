

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.contract.valueobject.PersonalServicesInfo;
import com.ksoe.docflow.valueobject.Attachment;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElementType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.SpravPartner;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.rqorder.valueobject.RQFKOrder;

public interface ENServicesObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesObjectController";


  /*ENServicesObject. Добавить*/
  public int add(ENServicesObject aENServicesObject) throws java.rmi.RemoteException;

  /*ENServicesObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject. Изменить*/
  public void save(ENServicesObject aENServicesObject) throws  java.rmi.RemoteException;

  /*ENServicesObject. Получить объект*/
  public ENServicesObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject. Получить полный список*/
  public ENServicesObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesObject. Получить список по фильтру*/
  public ENServicesObjectShortList getFilteredList(ENServicesObjectFilter aENServicesObjectFilter) throws  java.rmi.RemoteException;

  /*ENServicesObject. Получить список для просмотра*/
  public ENServicesObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesObject. Получить список для просмотра по фильтру*/
  public ENServicesObjectShortList getScrollableFilteredList(ENServicesObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /* ENServicesObject. Получить объект из списка */
  public ENServicesObjectShort getShortObject(int code) throws java.rmi.RemoteException;

  public ENServicesObjectShortList getEasyShortList(
		  ENServicesObjectFilter aFilter, int aFromPosition,
		  int aQuantity) throws java.rmi.RemoteException;

  /*ENServicesObject. Получить список для просмотра по условию*/
  public ENServicesObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*EENServicesObject. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENServicesObjectFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity)  throws java.rmi.RemoteException;

  public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity, boolean useMDaxData, boolean isFromFK, boolean isShowChild) throws java.rmi.RemoteException;

  /*ENServicesObject. Добавить объект для создания калькуляции*/
  //public int addForCalculation(ENServicesObject object, Integer planCode) throws java.rmi.RemoteException;
  public int addForCalculation(ENServicesObject object) throws java.rmi.RemoteException;

  	/** Услуга на оздоровление
  	 *  +++ cottageCode, startDate, endDate, tabNumber, FIO   */
	public int addForCalculation(ENServicesObject object, int cottageCode,
			Date startDate, Date endDate, String tabNumber, String FIO) throws java.rmi.RemoteException;


  public void budgetApproved(int svoCode, int planCode) throws  java.rmi.RemoteException;
  public void unBudgetApproved(int svoCode) throws  java.rmi.RemoteException;
  public void unBudgetApproved(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;

  public int signed(int svoCode) throws  java.rmi.RemoteException;
  public int signed(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public void unSigned(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public void unSigned(int svoCode) throws  java.rmi.RemoteException;

  public void paid(int svoCode) throws  java.rmi.RemoteException;
  public void paid(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public void unPaid(int svoCode) throws  java.rmi.RemoteException;
  public void unPaid(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;

  public void prepaid(int svoCode) throws java.rmi.RemoteException;
  public void prepaid(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public void unPrepaid(int svoCode) throws java.rmi.RemoteException;
  public void unPrepaid(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;

  /*Перевод договора по услугам на сторону в статус "Работы выполнены"*/
  //public int finishWorks(int objCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public int finishWorks(int objCode) throws java.rmi.RemoteException;

  /** SUPP-12236...
   *  расчет фактически затрат без изменения статуса договора
   *  вызов при подписаниии акта
   */
  public int finishWorks(int objCode, boolean notFinishWorks) throws java.rmi.RemoteException;

  /**
   * Перевод договора по услугам на сторону в статус "Работы выполнены"
   *
   * @param forceRecalcServicesFact - указание для расчета фактических затрат при проведенном акте
   * @param validateProfitability - указание для проверки рентабельности
   */
  public int finishWorks(int objCode, boolean forcedRecalcServicesFact,
		  boolean validateProfitability) throws java.rmi.RemoteException;

  /**
   * Перевод договора по услугам на сторону в статус "Работы выполнены"
   *
   * @param notFinishWorks - указание для перевода договора по услугам на сторону в статус "Работы выполнены"
   * @param forceRecalcServicesFact - указание для расчета фактических затрат при проведенном акте
   * @param validateProfitability - указание для проверки рентабельности
   */
  public int finishWorks(int objCode, boolean notFinishWorks,
  		boolean forcedRecalcServicesFact, boolean validateProfitability) throws java.rmi.RemoteException;

  public void finishWorksForServicesObjectInFK(int objCode) throws java.rmi.RemoteException;

  /*Отмена перевода договора по услугам на сторону в статус "Работы выполнены"*/
  //public void unFinishWorks(int objCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  //public void unFinishWorks(int objCode) throws java.rmi.RemoteException;
  public void undoFinishWorks(int objCode) throws java.rmi.RemoteException;

  /* Разрыв договора */
  public void terminate(int svoCode) throws java.rmi.RemoteException;
  public void terminate(int svoCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;

  public void canceled(int svoCode) throws  java.rmi.RemoteException;

  public void saveForCalculation(ENServicesObject object) throws java.rmi.RemoteException;
  public void saveForCalculation(ENServicesObject object, ENTechConditionsServices techConditionsServicesObject) throws java.rmi.RemoteException;
  public void saveForCalculation(ENServicesObject object,
        ENTechConditionsServices techConditionsServicesObject,
        ENCalc2ConnectTariff calc2Tariff) throws java.rmi.RemoteException;

  public int closePlanWorkForCalculation(int planCode) throws java.rmi.RemoteException;

  public FKProvResult createPostings(ENServicesObject servicesObject, Date docDate, Date actDate) throws java.rmi.RemoteException;
  public void deletePostings(int servicesObjectCode, int actIncomeServicesCode) throws java.rmi.RemoteException;
  public FKProvObjectShortList getPostingsList(int servicesObjectCode) throws java.rmi.RemoteException;

  public FKProvResult moveToFK(int servicesObjectCode) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, int actIncomeServicesCode) throws java.rmi.RemoteException;
  /** SUPP-7343... 25.09.2013 +++ для услуг добавлена дата проведения (передачи проводок) */
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller, 
		  boolean justForCheck) throws java.rmi.RemoteException;

  public void checkMoveToFK(int servicesObjectCode) throws java.rmi.RemoteException;
  public FKProvResult moveToFKCheckOnly(int servicesObjectCode) throws java.rmi.RemoteException;

  /** SUPP-7343... 25.09.2013 +++ получить дату проведения по коду договора */
  public Date getDatePostingsByServicesCode(int servicesObjectCode) throws java.rmi.RemoteException;

  public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode) throws java.rmi.RemoteException;
  public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode, Object caller) throws java.rmi.RemoteException;

  /* ENServicesObject. Добавить объект для договора о продаже товаров */
  public int addForSale(ENServicesObject object) throws java.rmi.RemoteException;
  public void saveForSale(ENServicesObject object) throws java.rmi.RemoteException;

  //Изменение статуса услуги
  public void updateContractStatus(int servObjCode, int contractStatusCode) throws java.rmi.RemoteException;

  public void updateActTransfer(int servicesObjectCode, String actTransferNumber, Date actTransferDate) throws java.rmi.RemoteException;
  public void moveActTransferToFK(int servicesObjectCode) throws java.rmi.RemoteException;
  public void unMoveActTransferToFK(int servicesObjectCode) throws java.rmi.RemoteException;

  public void updateActTransfer(int servicesObjectCode, RQFKOrder fkOrder, boolean isPersist) throws java.rmi.RemoteException;
  public void moveActTransferToFK(RQFKOrder fkOrder) throws java.rmi.RemoteException;
  public void unMoveActTransferToFK(RQFKOrder fkOrder) throws java.rmi.RemoteException;

  /*  Метод для проверки количества счетчиков в Услугах (метрология)
    при работах, в которых обязательна передача счетчика абонентом */
  public void checkGiveCounters(int servicesObjectCode) throws java.rmi.RemoteException;

  /* подписание акта приема-передачи счетчиков для работ Метрологии */
  public void actSigned(int svoCode) throws  java.rmi.RemoteException;
  /* отмена подписания акта приема-передачи счетчиков для работ Метрологии */
  public void actUnSigned(int svoCode) throws  java.rmi.RemoteException;

  /* создание договора о Присоединении по пакету из EnergyWorkFlow */
  public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance) throws java.rmi.RemoteException;

  /* создание договора о Присоединении по пакету из EnergyWorkFlow с указанием, создавать ли новый пакет */
  public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance, boolean isNewPack) throws java.rmi.RemoteException;

  /* подписание/отмена подписания договора на присоединение */
  public void signedPriconnections(int code) throws java.rmi.RemoteException;
  public void unSignedPriconnections(int code) throws java.rmi.RemoteException;

  /*Завершение договора услуг на сторону EnergyNet о Присоединении по коду пакета и подсистемы EnergyWorkFlow*/
  public int completeServicesObjectByCnPack(int packID, int ssID) throws java.rmi.RemoteException;

  /*Копирование разорванного договора услуг на сторону о Присоединении при движении пакета
   *EnergyWorkFlow подсистем ПРИСОЕДИНЕНИЕ*/
  public int copyTerminatedServiceObjectByCNPack(int packID, int subsystemID)  throws java.rmi.RemoteException;

  //Создание договора услуг на сторону о Подотовке Технических Условий
  // на базе закрытого договора Присоединения
  public int copyTechTermsPrepareServiceObjectByCNPack(int packID, int subsystemID)  throws java.rmi.RemoteException;

  public int copyTechTermsPrepareServiceObjectByCNPack(int packID,
		  int subsystemID, int soCodeOld, BigDecimal distance) throws java.rmi.RemoteException;

  public int copyTechTermsPrepareServiceObject(int soCodeOld, BigDecimal distance) throws java.rmi.RemoteException;

  /* создание солидарного договора на присоединение */
  public int addSolidaryConnections(int soCodes[]) throws java.rmi.RemoteException;

  /* перевод договора в статус "Відмова замовника від послуг" */
  public void disclaimerCustomerServices(int code) throws java.rmi.RemoteException;

  /* перевод договора в статус "Закрытый"*/
  public void closeContract(int svoCode) throws java.rmi.RemoteException;
  /* Отмена перевода договора в статус "Закрытый"*/
  public void unCloseContract(int svoCode) throws java.rmi.RemoteException;

  /* Перевод договора в статус "Проведеный согласо бухсправке"*/
  public void changeBuhStatusToClosedByBuh(int servicesObjectCode) throws java.rmi.RemoteException;

  /** Получить данные о лицевом счете из биллинга */
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber,
          int departmentCode) throws java.rmi.RemoteException;
  /** Получить данные о лицевом счете из биллинга */
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber,
          int departmentCode, boolean isByt) throws java.rmi.RemoteException;
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber, String recordPointUid,
		  int departmentCode, boolean isByt) throws java.rmi.RemoteException;

  public boolean checkWorks(int code) throws java.rmi.RemoteException;

  /*Метод для смены договора фин на услуге*/
  public void changeContractFin(ENServicesObject soObj) throws java.rmi.RemoteException;

	/**
	 *
	 * SUPP-45999 Проверка, что такой партнер еще существует для заданного договора в ФК
	 *
	 * @param object объект договора
	 * @return true - существует, false - нет
	 */
  public boolean checkPartnersCode(ENServicesObject object) throws java.rmi.RemoteException;
  /**
   *
   * Возвращает всех партнеров по уникальному идентификатору договора из ФК
   *
   * @param agreeId уникальный идентификатор договора
   * @return лист с партнерами
   */
	public SpravPartner[] getListOfPartnersForAgree(ENServicesObject object, int offSet, int limit) throws java.rmi.RemoteException;
	/**
	 *
	 * Переподтягивает код партнера из фин. коллекции (при условии, что на договоре один партнер)
	 *
	 * @param object объект договора
	 */
	public void refreshPartnerInfo(ENServicesObject object) throws java.rmi.RemoteException;

	public boolean isContainsKSU(int soCode) throws java.rmi.RemoteException;
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode) throws java.rmi.RemoteException;

	public void updatePersonalAccount(int servicesObjectCode, int personalAccountCode, String personalAccountNumber,
			String eic, String personalAccountUid) throws java.rmi.RemoteException;

	/**
	 *
	 * 	Изменение связки между двумя сущностями {@code ENServicesObject}
	 *
	 *	Если связка посылается с кодом равным {@code Integer.MIN_VALUE} то она будет добавлена
	 *	в противном случае заменена, если {@code elementOutRef.code} равен {@code Integer.MIN_VALUE}, то связка будет удалена
	 *
	 *
	 * @param element2element объект с кодами элементов двух {@code ENServicesObject} и типом {@link ENElement2ENElementType}
	 */
	public void changeLinkBetweenServices(ENElement2ENElement element2element) throws java.rmi.RemoteException;

	/**
	 *  ENServicesObject. Добавить объект для договора на вынос линий
	 * @param object
	 * @return code
	 */

    //public int addForShiftLines(ENServicesObject object)
    public int addForShiftLines(ENServicesObject object) throws java.rmi.RemoteException;


	/**
	 *   создание пакета и договора о присоединении - вызов из персонального кабинента
	 *
	 *   @return packId - код пакета
	 */
	public int addConnectionPackFromSite(String address, String bank,
			String bankaccount, int customertype, int id_ren, int id_subsystem,
			String name, String mfo, String okpo, String contragentPassport, String phone,
			double power, double u, String connectionPowerPlaces, String connectionPowerPoint,
            Attachment[] attachments, String postAddress, String customerEmail) throws java.rmi.RemoteException;


	/**
	 *	Определение стоимости стандартного присоединения - вызов из персонального кабинента
	 *
	 */
	public BigDecimal getConnectionsCost(BigDecimal powerNew, BigDecimal powerCurrent, int powerReliabilityCategory,
			int connectionPowerPoint, int connectionPhasity) throws java.rmi.RemoteException;


	/* привязка счетчика под указанный договор */
	public void autoCreateFkOrderMoveCounterForServices(String kod_inv , String contractnumberservices ) throws java.rmi.RemoteException;

	/** сохранение вложения для пакета EnergyWorkFlow - вызов из персонального кабинента */
	public void saveFiles2ConnectionPack(int packId, Attachment[] attachments) throws java.rmi.RemoteException;

	/** Получение из ФК кода для нового договора */
	public String getAgreeCode(int divId) throws java.rmi.RemoteException;

	/** Создание договора в ФК и AX */
	public int addAgree(FINContracts finContract) throws java.rmi.RemoteException;
	public int addAgree(FINContracts finContract, int partner_rschet_id) throws java.rmi.RemoteException;
	/** Создание связки договора с партнером в ФК */
	public void addAgreePartnerLink(int agree_id, int partner_id, String partner_status, int partner_rschet_id) throws java.rmi.RemoteException;

	/**
	 *
	 * Привязать/отвязать счетчик от договора
	 *
	 * @param invNumber инв. № счетчика
	 * @param servicesObject договор к/от которому/го необходимо привязать/отвязать
	 * @param ignorePrice - привязка счетчика по цене - {@code true} - можно привязать любой счетчик вне зависимости от цены
	 * {@code false} - нельзя привязывать более дорогие счетчики чем необходимы под планы
	 * {@code false} иначе
	 * @param isBinding {@code true} - привязка, {@code false} - отвязка
	 * @param molCode - явно заданный код МОЛ на который перемещается счетчик (возможно {@code null}
	 */
	void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding, String molCode) throws java.rmi.RemoteException;
	void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding) throws java.rmi.RemoteException;
	
	public void updateCounterZonesType(ENServicesObject object) throws java.rmi.RemoteException;



	/**
	 * 	Проверка принадлежности плана к услуге для договоров подряда на выполнение ПКД...
	 *
	 *  @param elementCode
	 *  @return isServicesProject
	 */
	public boolean checkServicesProject(int elementCode) throws java.rmi.RemoteException;


	/**
	 *   Сохранение точки присоединения на Тех.условиях по договору о присоединении - вызов из персонального кабинента
	 *
	 *   @param idpack - код пакета CN
	 *   @param connectionPowerPlaces - Місце забезпечення потужності об’єкта Замовника
	 *   @param connectionPowerPoint - Точка приєднання (межа балансової належності об’єкта Замовника)
	 */
	public void updateConnectionPackMapData(int idpack, String connectionPowerPlaces, String connectionPowerPoint)
			throws java.rmi.RemoteException;


	public int registerInDocFlow(int servicesObjectCode) throws java.rmi.RemoteException;


	/** Изменение метода формирования доходного акта */
	public void changeActIncomeCreatMetod(int soCode, int creatMetodCode) throws java.rmi.RemoteException;

	public void linkWithRQFKOrder(int servicesObjectCode, int fkOrderCode, boolean isLink) throws java.rmi.RemoteException;

	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt) throws java.rmi.RemoteException;
	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt, boolean isWithSignature)
			throws java.rmi.RemoteException;

	  /* изменение типа присоединения */
	public void changeConnectionKind(int servicesObjectCode, int connectionKindCode) throws java.rmi.RemoteException;
    public void changeAddress(ENServicesObject object)  throws java.rmi.RemoteException;

	public int getConnectionKind(int soCode) throws java.rmi.RemoteException;

	public void updateRecordPointByt(ENRecordPointBytShort recordPointByt) throws java.rmi.RemoteException;
	public void updateRecordPointProm(ENRecordPointPromShort recordPointProm) throws java.rmi.RemoteException;

	/**
	 *
	 * update поля isRealized (CallCenter ->  table CCtower2jlc)
	 * CCtower2jlc - Связка контрагентов совмесного подвеса и опоры
	 *
	 * @param contractnumberservices 		- Номер договора услуг  (Договор оренди)
	 * @param isRealized  					- 0 - не реализовано, 1 - реализовано
	 */
	public void updateIsRealizedCCtower2jlc(int servicesObjectCode, int isRealized) throws java.rmi.RemoteException;

	public void recalcENSheets4SODaysCount(int servicesObjectCode) throws java.rmi.RemoteException;

	public int getServicesObjectCodeForSupplier(int supplierCode) throws java.rmi.RemoteException;

	public int addBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) throws java.rmi.RemoteException;
	public void removeBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) throws java.rmi.RemoteException;

	public int getLandSheetDelayForServicesObject(int servicesObjectCode) throws java.rmi.RemoteException;

}
