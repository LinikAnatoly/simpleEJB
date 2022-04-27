

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
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


  /*ENServicesObject. ��������*/
  public int add(ENServicesObject aENServicesObject) throws java.rmi.RemoteException;

  /*ENServicesObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject. ��������*/
  public void save(ENServicesObject aENServicesObject) throws  java.rmi.RemoteException;

  /*ENServicesObject. �������� ������*/
  public ENServicesObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ ������*/
  public ENServicesObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ �� �������*/
  public ENServicesObjectShortList getFilteredList(ENServicesObjectFilter aENServicesObjectFilter) throws  java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ ��� ���������*/
  public ENServicesObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ ��� ��������� �� �������*/
  public ENServicesObjectShortList getScrollableFilteredList(ENServicesObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /* ENServicesObject. �������� ������ �� ������ */
  public ENServicesObjectShort getShortObject(int code) throws java.rmi.RemoteException;

  public ENServicesObjectShortList getEasyShortList(
		  ENServicesObjectFilter aFilter, int aFromPosition,
		  int aQuantity) throws java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ ��� ��������� �� �������*/
  public ENServicesObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*EENServicesObject. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENServicesObjectFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity)  throws java.rmi.RemoteException;

  public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity, boolean useMDaxData, boolean isFromFK, boolean isShowChild) throws java.rmi.RemoteException;

  /*ENServicesObject. �������� ������ ��� �������� �����������*/
  //public int addForCalculation(ENServicesObject object, Integer planCode) throws java.rmi.RemoteException;
  public int addForCalculation(ENServicesObject object) throws java.rmi.RemoteException;

  	/** ������ �� ������������
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

  /*������� �������� �� ������� �� ������� � ������ "������ ���������"*/
  //public int finishWorks(int objCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  public int finishWorks(int objCode) throws java.rmi.RemoteException;

  /** SUPP-12236...
   *  ������ ���������� ������ ��� ��������� ������� ��������
   *  ����� ��� ����������� ����
   */
  public int finishWorks(int objCode, boolean notFinishWorks) throws java.rmi.RemoteException;

  /**
   * ������� �������� �� ������� �� ������� � ������ "������ ���������"
   *
   * @param forceRecalcServicesFact - �������� ��� ������� ����������� ������ ��� ����������� ����
   * @param validateProfitability - �������� ��� �������� ��������������
   */
  public int finishWorks(int objCode, boolean forcedRecalcServicesFact,
		  boolean validateProfitability) throws java.rmi.RemoteException;

  /**
   * ������� �������� �� ������� �� ������� � ������ "������ ���������"
   *
   * @param notFinishWorks - �������� ��� �������� �������� �� ������� �� ������� � ������ "������ ���������"
   * @param forceRecalcServicesFact - �������� ��� ������� ����������� ������ ��� ����������� ����
   * @param validateProfitability - �������� ��� �������� ��������������
   */
  public int finishWorks(int objCode, boolean notFinishWorks,
  		boolean forcedRecalcServicesFact, boolean validateProfitability) throws java.rmi.RemoteException;

  public void finishWorksForServicesObjectInFK(int objCode) throws java.rmi.RemoteException;

  /*������ �������� �������� �� ������� �� ������� � ������ "������ ���������"*/
  //public void unFinishWorks(int objCode, boolean priconnections, boolean isClient) throws java.rmi.RemoteException;
  //public void unFinishWorks(int objCode) throws java.rmi.RemoteException;
  public void undoFinishWorks(int objCode) throws java.rmi.RemoteException;

  /* ������ �������� */
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
  /** SUPP-7343... 25.09.2013 +++ ��� ����� ��������� ���� ���������� (�������� ��������) */
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller) throws java.rmi.RemoteException;
  public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller, 
		  boolean justForCheck) throws java.rmi.RemoteException;

  public void checkMoveToFK(int servicesObjectCode) throws java.rmi.RemoteException;
  public FKProvResult moveToFKCheckOnly(int servicesObjectCode) throws java.rmi.RemoteException;

  /** SUPP-7343... 25.09.2013 +++ �������� ���� ���������� �� ���� �������� */
  public Date getDatePostingsByServicesCode(int servicesObjectCode) throws java.rmi.RemoteException;

  public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode) throws java.rmi.RemoteException;
  public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode, Object caller) throws java.rmi.RemoteException;

  /* ENServicesObject. �������� ������ ��� �������� � ������� ������� */
  public int addForSale(ENServicesObject object) throws java.rmi.RemoteException;
  public void saveForSale(ENServicesObject object) throws java.rmi.RemoteException;

  //��������� ������� ������
  public void updateContractStatus(int servObjCode, int contractStatusCode) throws java.rmi.RemoteException;

  public void updateActTransfer(int servicesObjectCode, String actTransferNumber, Date actTransferDate) throws java.rmi.RemoteException;
  public void moveActTransferToFK(int servicesObjectCode) throws java.rmi.RemoteException;
  public void unMoveActTransferToFK(int servicesObjectCode) throws java.rmi.RemoteException;

  public void updateActTransfer(int servicesObjectCode, RQFKOrder fkOrder, boolean isPersist) throws java.rmi.RemoteException;
  public void moveActTransferToFK(RQFKOrder fkOrder) throws java.rmi.RemoteException;
  public void unMoveActTransferToFK(RQFKOrder fkOrder) throws java.rmi.RemoteException;

  /*  ����� ��� �������� ���������� ��������� � ������� (����������)
    ��� �������, � ������� ����������� �������� �������� ��������� */
  public void checkGiveCounters(int servicesObjectCode) throws java.rmi.RemoteException;

  /* ���������� ���� ������-�������� ��������� ��� ����� ���������� */
  public void actSigned(int svoCode) throws  java.rmi.RemoteException;
  /* ������ ���������� ���� ������-�������� ��������� ��� ����� ���������� */
  public void actUnSigned(int svoCode) throws  java.rmi.RemoteException;

  /* �������� �������� � ������������� �� ������ �� EnergyWorkFlow */
  public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance) throws java.rmi.RemoteException;

  /* �������� �������� � ������������� �� ������ �� EnergyWorkFlow � ���������, ��������� �� ����� ����� */
  public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance, boolean isNewPack) throws java.rmi.RemoteException;

  /* ����������/������ ���������� �������� �� ������������� */
  public void signedPriconnections(int code) throws java.rmi.RemoteException;
  public void unSignedPriconnections(int code) throws java.rmi.RemoteException;

  /*���������� �������� ����� �� ������� EnergyNet � ������������� �� ���� ������ � ���������� EnergyWorkFlow*/
  public int completeServicesObjectByCnPack(int packID, int ssID) throws java.rmi.RemoteException;

  /*����������� ������������ �������� ����� �� ������� � ������������� ��� �������� ������
   *EnergyWorkFlow ��������� �������������*/
  public int copyTerminatedServiceObjectByCNPack(int packID, int subsystemID)  throws java.rmi.RemoteException;

  //�������� �������� ����� �� ������� � ��������� ����������� �������
  // �� ���� ��������� �������� �������������
  public int copyTechTermsPrepareServiceObjectByCNPack(int packID, int subsystemID)  throws java.rmi.RemoteException;

  public int copyTechTermsPrepareServiceObjectByCNPack(int packID,
		  int subsystemID, int soCodeOld, BigDecimal distance) throws java.rmi.RemoteException;

  public int copyTechTermsPrepareServiceObject(int soCodeOld, BigDecimal distance) throws java.rmi.RemoteException;

  /* �������� ����������� �������� �� ������������� */
  public int addSolidaryConnections(int soCodes[]) throws java.rmi.RemoteException;

  /* ������� �������� � ������ "³����� ��������� �� ������" */
  public void disclaimerCustomerServices(int code) throws java.rmi.RemoteException;

  /* ������� �������� � ������ "��������"*/
  public void closeContract(int svoCode) throws java.rmi.RemoteException;
  /* ������ �������� �������� � ������ "��������"*/
  public void unCloseContract(int svoCode) throws java.rmi.RemoteException;

  /* ������� �������� � ������ "���������� ������� ����������"*/
  public void changeBuhStatusToClosedByBuh(int servicesObjectCode) throws java.rmi.RemoteException;

  /** �������� ������ � ������� ����� �� �������� */
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber,
          int departmentCode) throws java.rmi.RemoteException;
  /** �������� ������ � ������� ����� �� �������� */
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber,
          int departmentCode, boolean isByt) throws java.rmi.RemoteException;
  public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber, String recordPointUid,
		  int departmentCode, boolean isByt) throws java.rmi.RemoteException;

  public boolean checkWorks(int code) throws java.rmi.RemoteException;

  /*����� ��� ����� �������� ��� �� ������*/
  public void changeContractFin(ENServicesObject soObj) throws java.rmi.RemoteException;

	/**
	 *
	 * SUPP-45999 ��������, ��� ����� ������� ��� ���������� ��� ��������� �������� � ��
	 *
	 * @param object ������ ��������
	 * @return true - ����������, false - ���
	 */
  public boolean checkPartnersCode(ENServicesObject object) throws java.rmi.RemoteException;
  /**
   *
   * ���������� ���� ��������� �� ����������� �������������� �������� �� ��
   *
   * @param agreeId ���������� ������������� ��������
   * @return ���� � ����������
   */
	public SpravPartner[] getListOfPartnersForAgree(ENServicesObject object, int offSet, int limit) throws java.rmi.RemoteException;
	/**
	 *
	 * ��������������� ��� �������� �� ���. ��������� (��� �������, ��� �� �������� ���� �������)
	 *
	 * @param object ������ ��������
	 */
	public void refreshPartnerInfo(ENServicesObject object) throws java.rmi.RemoteException;

	public boolean isContainsKSU(int soCode) throws java.rmi.RemoteException;
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode) throws java.rmi.RemoteException;

	public void updatePersonalAccount(int servicesObjectCode, int personalAccountCode, String personalAccountNumber,
			String eic, String personalAccountUid) throws java.rmi.RemoteException;

	/**
	 *
	 * 	��������� ������ ����� ����� ���������� {@code ENServicesObject}
	 *
	 *	���� ������ ���������� � ����� ������ {@code Integer.MIN_VALUE} �� ��� ����� ���������
	 *	� ��������� ������ ��������, ���� {@code elementOutRef.code} ����� {@code Integer.MIN_VALUE}, �� ������ ����� �������
	 *
	 *
	 * @param element2element ������ � ������ ��������� ���� {@code ENServicesObject} � ����� {@link ENElement2ENElementType}
	 */
	public void changeLinkBetweenServices(ENElement2ENElement element2element) throws java.rmi.RemoteException;

	/**
	 *  ENServicesObject. �������� ������ ��� �������� �� ����� �����
	 * @param object
	 * @return code
	 */

    //public int addForShiftLines(ENServicesObject object)
    public int addForShiftLines(ENServicesObject object) throws java.rmi.RemoteException;


	/**
	 *   �������� ������ � �������� � ������������� - ����� �� ������������� ���������
	 *
	 *   @return packId - ��� ������
	 */
	public int addConnectionPackFromSite(String address, String bank,
			String bankaccount, int customertype, int id_ren, int id_subsystem,
			String name, String mfo, String okpo, String contragentPassport, String phone,
			double power, double u, String connectionPowerPlaces, String connectionPowerPoint,
            Attachment[] attachments, String postAddress, String customerEmail) throws java.rmi.RemoteException;


	/**
	 *	����������� ��������� ������������ ������������� - ����� �� ������������� ���������
	 *
	 */
	public BigDecimal getConnectionsCost(BigDecimal powerNew, BigDecimal powerCurrent, int powerReliabilityCategory,
			int connectionPowerPoint, int connectionPhasity) throws java.rmi.RemoteException;


	/* �������� �������� ��� ��������� ������� */
	public void autoCreateFkOrderMoveCounterForServices(String kod_inv , String contractnumberservices ) throws java.rmi.RemoteException;

	/** ���������� �������� ��� ������ EnergyWorkFlow - ����� �� ������������� ��������� */
	public void saveFiles2ConnectionPack(int packId, Attachment[] attachments) throws java.rmi.RemoteException;

	/** ��������� �� �� ���� ��� ������ �������� */
	public String getAgreeCode(int divId) throws java.rmi.RemoteException;

	/** �������� �������� � �� � AX */
	public int addAgree(FINContracts finContract) throws java.rmi.RemoteException;
	public int addAgree(FINContracts finContract, int partner_rschet_id) throws java.rmi.RemoteException;
	/** �������� ������ �������� � ��������� � �� */
	public void addAgreePartnerLink(int agree_id, int partner_id, String partner_status, int partner_rschet_id) throws java.rmi.RemoteException;

	/**
	 *
	 * ���������/�������� ������� �� ��������
	 *
	 * @param invNumber ���. � ��������
	 * @param servicesObject ������� �/�� ��������/�� ���������� ���������/��������
	 * @param ignorePrice - �������� �������� �� ���� - {@code true} - ����� ��������� ����� ������� ��� ����������� �� ����
	 * {@code false} - ������ ����������� ����� ������� �������� ��� ���������� ��� �����
	 * {@code false} �����
	 * @param isBinding {@code true} - ��������, {@code false} - �������
	 * @param molCode - ���� �������� ��� ��� �� ������� ������������ ������� (�������� {@code null}
	 */
	void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding, String molCode) throws java.rmi.RemoteException;
	void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding) throws java.rmi.RemoteException;
	
	public void updateCounterZonesType(ENServicesObject object) throws java.rmi.RemoteException;



	/**
	 * 	�������� �������������� ����� � ������ ��� ��������� ������� �� ���������� ���...
	 *
	 *  @param elementCode
	 *  @return isServicesProject
	 */
	public boolean checkServicesProject(int elementCode) throws java.rmi.RemoteException;


	/**
	 *   ���������� ����� ������������� �� ���.�������� �� �������� � ������������� - ����� �� ������������� ���������
	 *
	 *   @param idpack - ��� ������ CN
	 *   @param connectionPowerPlaces - ̳��� ������������ ��������� �ᒺ��� ���������
	 *   @param connectionPowerPoint - ����� ��������� (���� ��������� ��������� �ᒺ��� ���������)
	 */
	public void updateConnectionPackMapData(int idpack, String connectionPowerPlaces, String connectionPowerPoint)
			throws java.rmi.RemoteException;


	public int registerInDocFlow(int servicesObjectCode) throws java.rmi.RemoteException;


	/** ��������� ������ ������������ ��������� ���� */
	public void changeActIncomeCreatMetod(int soCode, int creatMetodCode) throws java.rmi.RemoteException;

	public void linkWithRQFKOrder(int servicesObjectCode, int fkOrderCode, boolean isLink) throws java.rmi.RemoteException;

	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt) throws java.rmi.RemoteException;
	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt, boolean isWithSignature)
			throws java.rmi.RemoteException;

	  /* ��������� ���� ������������� */
	public void changeConnectionKind(int servicesObjectCode, int connectionKindCode) throws java.rmi.RemoteException;
    public void changeAddress(ENServicesObject object)  throws java.rmi.RemoteException;

	public int getConnectionKind(int soCode) throws java.rmi.RemoteException;

	public void updateRecordPointByt(ENRecordPointBytShort recordPointByt) throws java.rmi.RemoteException;
	public void updateRecordPointProm(ENRecordPointPromShort recordPointProm) throws java.rmi.RemoteException;

	/**
	 *
	 * update ���� isRealized (CallCenter ->  table CCtower2jlc)
	 * CCtower2jlc - ������ ������������ ���������� ������� � �����
	 *
	 * @param contractnumberservices 		- ����� �������� �����  (������� ������)
	 * @param isRealized  					- 0 - �� �����������, 1 - �����������
	 */
	public void updateIsRealizedCCtower2jlc(int servicesObjectCode, int isRealized) throws java.rmi.RemoteException;

	public void recalcENSheets4SODaysCount(int servicesObjectCode) throws java.rmi.RemoteException;

	public int getServicesObjectCodeForSupplier(int supplierCode) throws java.rmi.RemoteException;

	public int addBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) throws java.rmi.RemoteException;
	public void removeBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) throws java.rmi.RemoteException;

	public int getLandSheetDelayForServicesObject(int servicesObjectCode) throws java.rmi.RemoteException;

}
