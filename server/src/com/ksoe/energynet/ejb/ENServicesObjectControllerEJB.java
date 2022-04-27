//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.xml.ws.BindingProvider;

import org.datacontract.schemas._2004._07.microsoft_dynamics_integrationframework.AddReplaceUA;

import com.ksoe.authorization.dataminer.ConfigDAO;
import com.ksoe.authorization.dataminer.UserDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.contract.ejb.RecordPointController;
import com.ksoe.contract.ejb.RecordPointControllerHome;
import com.ksoe.contract.valueobject.PersonalServicesInfo;
import com.ksoe.docflow.logic.AttachmentsLogic;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.valueobject.Attachment;
import com.ksoe.docflow.valueobject.DFDocSignerType;
import com.ksoe.energyWorkflow.dataminer.WFPack2ServicesObjectDAO;
import com.ksoe.energyWorkflow.dataminer.WFPackDAO;
import com.ksoe.energyWorkflow.dataminer.WFProcessDAO;
import com.ksoe.energyWorkflow.dataminer.WFProcessMovementDAO;
import com.ksoe.energyWorkflow.ejb.WFPack2ServicesObjectController;
import com.ksoe.energyWorkflow.ejb.WFPack2ServicesObjectControllerHome;
import com.ksoe.energyWorkflow.ejb.WFPackController;
import com.ksoe.energyWorkflow.ejb.WFPackControllerHome;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energyWorkflow.valueobject.DepartmentUtil;
import com.ksoe.energyWorkflow.valueobject.WFBaseProcess;
import com.ksoe.energyWorkflow.valueobject.WFPack;
import com.ksoe.energyWorkflow.valueobject.WFProcess;
import com.ksoe.energyWorkflow.valueobject.WFProcessMovement;
import com.ksoe.energyWorkflow.valueobject.WFProcessStatus;
import com.ksoe.energyWorkflow.valueobject.WFSubsystem;
import com.ksoe.energyWorkflow.valueobject.brief.WFPack2ServicesObjectShort;
import com.ksoe.energyWorkflow.valueobject.filter.WFPack2ServicesObjectFilter;
import com.ksoe.energyWorkflow.valueobject.filter.WFProcessFilter;
import com.ksoe.energyWorkflow.valueobject.filter.WFProcessMovementFilter;
import com.ksoe.energyWorkflow.valueobject.lists.WFPack2ServicesObjectShortList;
import com.ksoe.energyWorkflow.valueobject.lists.WFProcessMovementShortList;
import com.ksoe.energyWorkflow.valueobject.lists.WFProcessShortList;
import com.ksoe.energyWorkflow.valueobject.references.WFDepartmentRef;
import com.ksoe.energyWorkflow.valueobject.references.WFSubsystemRef;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.dataminer.CNRen2ENDepartmentDAO;
import com.ksoe.energynet.dataminer.CNTechTermsDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomServ2ProvDAO;
import com.ksoe.energynet.dataminer.ENActIncomeServicesDAO;
import com.ksoe.energynet.dataminer.ENActIncomeTechConditionsDAO;
import com.ksoe.energynet.dataminer.ENBankingDetailsDAO;
import com.ksoe.energynet.dataminer.ENCalcContractTotalDAO;
import com.ksoe.energynet.dataminer.ENConnectionKindDAO;
import com.ksoe.energynet.dataminer.ENConnectionTariffDAO;
import com.ksoe.energynet.dataminer.ENContragentDAO;
import com.ksoe.energynet.dataminer.ENCottage2TKClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPayment2SODAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.dataminer.ENRentPeriod2ServicesDAO;
import com.ksoe.energynet.dataminer.ENServices2CalcAdditionalItemsDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcByActDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2ProvDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2TechCondtnsServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTimeLineDAO;
import com.ksoe.energynet.dataminer.ENWarrantDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.generated.ENServicesObjectControllerEJBGen;
import com.ksoe.energynet.logic.ActIncomeLogic;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.logic.ContractLogic.AXContractGroup;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.BillingEjbCache;
import com.ksoe.energynet.util.DBConnector;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActIncomServ2Prov;
import com.ksoe.energynet.valueobject.ENActIncomeCreatMetod;
import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENBankingDetails;
import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENConnectionLevel;
import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachmentAction;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElementType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.ENPayment2SOType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.ENRentPeriod2Services;
import com.ksoe.energynet.valueobject.ENRentPeriodStatus;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.brief.ENTechCond2PlanWorkShort;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTechConditionsFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcContractTotalFilter;
import com.ksoe.energynet.valueobject.filter.ENConnectionKindFilter;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffFilter;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.filter.ENCottage2TKClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENRentPeriod2ServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2CalcAdditionalItemsFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcContractTotalShortList;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENServices2CalcAdditionalItemsShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2TechCondtnsServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energynet.valueobject.references.ENServicesContractTypeRef;
import com.ksoe.energypro.ejb.EPRecordPointController;
import com.ksoe.energypro.ejb.EPRecordPointControllerHome;
import com.ksoe.energypro.ejb.EPReportController;
import com.ksoe.energypro.ejb.EPReportControllerHome;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.SpravPartner;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.logic.AXPostingLogic;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.custtransks.CustTransksActions;
import com.ksoe.mdax.services.ledgertransks.LedgerTransksActions;
import com.ksoe.mdax.services.rcontractaddagreeksservice.RContractAddAgreementCreator;
import com.ksoe.mdax.services.rcontractpartnerlinkksservice.RContractPartnerLinkCreator;
import com.ksoe.mdax.services.rcontracttablecreateksservice.ContractCreator;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.mdax.valueobject.lists.AXCustTransShortList;
import com.ksoe.mdax.valueobject.lists.AXLedgerTransShortList;
import com.ksoe.netobjects.dataminer.ENPriconnectionDataDAO;
import com.ksoe.netobjects.valueobject.filter.ENPriconnectionDataFilter;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2EstimateItemStatus;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;
import com.microsoft.schemas.dynamics._2008._01.documents.rcontracttablecreateks.AxdEnumCustVendRContractTypeUA;
import com.microsoft.schemas.dynamics._2008._01.services.RContractAddAgreeKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractAddAgreeKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.RContractPartnerLinkKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractPartnerLinkKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableCreateKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableCreateKSService_Service;


/**
 * EJB Controller for ENServicesObject;
 *
 */


public class ENServicesObjectControllerEJB extends ENServicesObjectControllerEJBGen {

	/**
	 * ��� �������� �������� ��� ����������� ������ � WorkFlow ��� ���������� �������� �� �������������:
	 * 3. ���������� �� ��������� ���� � ���������� ������������� ��������
	 */
	private static final int WF_BASEPROCESS_TO_MOVE = 15;

	/**
	 * ��� ������ �������� �������� ��� ����������� ������ � WorkFlow ��� ���������� �������� �� �������������:
	 * ���������� �� ��������� ���� � ����������
	 */
	private static final int WF_BASEPROCESS_VERSION_TO_MOVE = 14;

	/**
	 * ��� ��������� ��� ����������� ������ � WorkFlow ��� ���������� �������� �� �������������:
	 * 667399 - ����������� ������ ��������� ����������� ��� ���������� ��������� ����
	 */
	private static final int WF_STATE_TO_MOVE = 667399;


	private static final long serialVersionUID = 1L;

	/*ENServicesObject. �������� ������ ��� �������� �� ����� �����*/
    //public int addForShiftLines(ENServicesObject object)
    public int addForShiftLines(ENServicesObject object)
    {

        try
            {

            ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

                int objectCode = Integer.MIN_VALUE;

                object.contractTypeRef.code = ENServicesContractType.SHIFT_LINES;

                object.contractStatusRef.code = ENServicesContractStatus.GOOD;

                if (object.contractNumber == null)
                    object.contractNumber = "" + new Date().getTime();

                if (object.contractDate == null)
                    object.contractDate = new Date();

                if (object.name == null)
                    object.name = getUserProfile().userName + " " + new Date().getTime();

                if ((object.department == null) || (object.department.code == Integer.MIN_VALUE))
                object.department.code = ENConsts.ENDEPARTMENT_CO; //ServicesLogic.DEPARTMENT_CO;

                object.contractNumberServices = "" + objectDAO._collectAutoIncrementNumber();


                object.statusRef.code = ENServicesObjectStatus.GOOD;

                object.actIncomeCreatMetodRef.code = ENActIncomeCreatMetod.MORE_ONE;

                objectCode  = this.add(object);


                return objectCode;
            }
            catch (DatasourceConnectException e) {throw new SystemException("Can't add object",e);}
            catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
            finally
            {
                closeConnection();
            }
    }



	public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity) {
		try {

			/** �������� ����������� */
    		DBConnector dbConnector = new DBConnector();
    		dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			return objectDAO.getContractList(f, fromPosition, quantity);

		} catch (DatasourceConnectException e) {
			throw new SystemException("��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public ENServicesObjectShortList getContractList(ENServicesObjectFilter f, int fromPosition, int quantity,
			boolean useMDaxData, boolean isFromFK, boolean isShowChild) {
		try {

			/** �������� ����������� */
    		DBConnector dbConnector = new DBConnector();
    		dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			return objectDAO.getContractList(f, fromPosition, quantity, useMDaxData, isFromFK, isShowChild);

		} catch (DatasourceConnectException e) {
			throw new SystemException("��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENServicesObject. �������� */
	@Override
	public int add(ENServicesObject servicesObject) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

			return servicesLogic.addServicesObject(servicesObject);

		} catch (DatasourceConnectException e) {

			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENServicesObject%} object.", e);
		} finally {
			closeConnection();
		}
	}



	/* ENServicesObject. ������� */
	@Override
	public void remove(int code) {
		try {

			ServicesLogic soLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			soLogic.removeServicesObject(code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENServicesObject%} object.",
					e);
		} finally {
			closeConnection();
		}
	}


    public void saveForCalculation(ENServicesObject soObject,
            ENTechConditionsServices techConditionsServicesObject,
            ENCalc2ConnectTariff calc2Tariff) {

        try {
            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENCalc2ConnectTariffController.JNDI_NAME);
            ENCalc2ConnectTariffControllerHome calc2TariffHome = (ENCalc2ConnectTariffControllerHome) PortableRemoteObject
                    .narrow(objRef, ENCalc2ConnectTariffControllerHome.class);
            ENCalc2ConnectTariffController calc2TariffController = calc2TariffHome.create();

            calc2TariffController.add(calc2Tariff);


            techConditionsServicesObject.tariffEntryRef.code = calc2Tariff.tariffEntry1Ref.code;
            saveForCalculation(soObject, techConditionsServicesObject);

		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

    public void saveForCalculation(ENServicesObject object, ENTechConditionsServices techConditionsServicesObject) {

        try {
            Context cnt = new InitialContext();
            Object objRef = cnt
                    .lookup(ENTechConditionsServicesController.JNDI_NAME);
            ENTechConditionsServicesControllerHome techCondHome = (ENTechConditionsServicesControllerHome) PortableRemoteObject
                    .narrow(objRef, ENTechConditionsServicesControllerHome.class);
            ENTechConditionsServicesController techCondController = techCondHome
                    .create();

            if (techConditionsServicesObject.finDocID == Integer.MIN_VALUE) {
                techConditionsServicesObject.finDocID = object.finDocID;
                techConditionsServicesObject.finDocCode = object.finDocCode;
                techConditionsServicesObject.finContractDate = object.contractDate;
                techConditionsServicesObject.finContractNumber = object.contractNumber;
                techConditionsServicesObject.finCommentGen = object.commentGen;
                techConditionsServicesObject.partnerCode = object.partnerCode;
                techConditionsServicesObject.partnerName = object.name;
            }

            if (object.warrantRef.code != Integer.MIN_VALUE) {
                techConditionsServicesObject.warrantRef.code = object.warrantRef.code;
            }

            techCondController.save(techConditionsServicesObject);

            /** ��������� ������ ��������� */
            ENContragentDAO contrAgentDAO = new ENContragentDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENContragentFilter contrAgentFilter = new ENContragentFilter();
            contrAgentFilter.techCondServicesRef.code = techConditionsServicesObject.code;
            int agentArr[] = contrAgentDAO.getFilteredCodeArray(contrAgentFilter, 0, -1);
            if (agentArr.length > 0) {
                ENContragent contrAgent = contrAgentDAO.getObject(agentArr[0]);

                if (object.basisType != null) {
                    contrAgent.basisType.code = object.basisType.intValue();
                }

                contrAgent.contragentType.code = object.contragentTypeRef.code;
                contrAgent.contragentName = object.contragentName;
                contrAgent.contragentAddress = object.contragentAddress;
                contrAgent.contragentAddressWork = object.contragentAddressWork;
                contrAgent.contragentPosition = object.contragentPosition;
                contrAgent.contragentOkpo = object.contragentOkpo;
                contrAgent.contragentBankAccount = object.contragentBankAccount;
                contrAgent.contragentBankName = object.contragentBankName;
                contrAgent.contragentBankMfo = object.contragentBankMfo;
                contrAgent.contragentBossName = object.contragentBossName;
                contrAgent.contragentPassport = object.contragentPassport;
                contrAgent.warrantDate = object.warrantDate;
                contrAgent.warrantNumber = object.warrantNumber;
                contrAgent.warrantFIO = object.warrantFIO;

                contrAgentDAO.save(contrAgent);
            }

            saveForCalculation(object, true);


        } catch (NamingException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (RemoteException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (CreateException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e);
        } finally {
			closeConnection();
		}
    }




    public void saveForCalculation(ENServicesObject object) {
    	saveForCalculation(object, false);
    }


	public void saveForCalculation(ENServicesObject object, boolean priconnection) {
		try {

			ServicesLogic servicesLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKClassificationTypeDAO clDAO = new TKClassificationTypeDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			ENServicesObject oldObject = objectDAO.getObject(object.code);


			/** 12.03.2020... ���� ������� �������� � �������� ��.... */
			BigDecimal oldDistance = new BigDecimal(0);
			BigDecimal newDistance = new BigDecimal(0);

			if (oldObject.contractServicesDistance != null) {
				oldDistance = oldObject.contractServicesDistance;
			}

			if (object.contractServicesDistance != null) {
				newDistance = object.contractServicesDistance;
			}

			if (oldObject.contractStatusRef.code == ENServicesContractStatus.GOOD
					&& oldObject.contractTypeRef.code == ENServicesContractType.OTHERS
					&& oldDistance.compareTo(newDistance) != 0) {

				servicesLogic.recalcServicesDistance(object);

				/** ��������� ���������� :) */
				oldObject = objectDAO.getObject(object.code);
				object.modify_time = oldObject.modify_time;
			}


			/** 17.03.2020... +++ ��� ������ ����� �� ������ �������� ��������� � �������... */
			if (oldObject.contractStatusRef.code == ENServicesContractStatus.GOOD
					&& oldObject.contractTypeRef.code == ENServicesContractType.OTHERS
					&& oldObject.contragentTypeRef.code != object.contragentTypeRef.code) {

				servicesLogic.compareBudgetRelation(object);
			}


			/** 21.06.2020... +++ ���-2177 �� 28.05.2020
			 * 	��� �������� �������� ������ �� ������� � ���������� ����������� �� ���� �������� ���, ������ ������� ���� ������� ��������.
			 */
			/*
			PersonalServicesInfo personalServicesInfo = null;

			// ����������� � ��������
			List<TKClassificationType> classificationTypesInServicesObject = clDAO.getClassificationListByServicesObjectCode(object.code, false);

			boolean isParametrization = false;
			for (TKClassificationType classType : classificationTypesInServicesObject) {
				if (classType.replaceCounterKind != null
						&& classType.replaceCounterKind.code == TKClassificationType.PARAMETERIZATION_COUNTER) {
					isParametrization = true;
				}
			}

			if (isParametrization) {
				if (object.contragentTypeRef != null && object.contragentTypeRef.code != Integer.MIN_VALUE
						&& (object.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
	                            object.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT)
						&& object.personalAccountNumber != null && object.personalAccountNumber.length() > 0) {

					ENDepartmentDAO depDAO = new ENDepartmentDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					ENDepartmentFilter depFilter = new ENDepartmentFilter();
					depFilter.conditionSQL = " endepartment.code in  ( "
							+ " select p.departmentrefcode from endepartment2epren p "
							+ "  where p.billingserverip is not null and p.renrefcode = ( "
							+ " select e.renrefcode from enelement e where e.code = ( "
							+ " select rp.elementcode from enrecordpointbyt rp "
							+ "  where rp.accountnumber = '" + object.personalAccountNumber + "'"
							+ " and rp.rpcode = ( select s.personalaccountcode from enservicesobject s "
							+ " where s.code = " + object.code + " ) ) ) ) ";

					int[] depArr = depDAO.getFilteredCodeArray(depFilter, 0, -1);

					if (depArr.length == 0) {
						throw new SystemException("\n\n"+
								"������� � ��������� �������� ��� ��������� �������!");
					}

					personalServicesInfo = getPersonalAccountInfo(object.personalAccountNumber, depArr[0]);
				}

				int numberOfParametrization = 0;
				if (personalServicesInfo != null) {
					if (personalServicesInfo.isParam != null
							&& personalServicesInfo.isParam == true) {
						numberOfParametrization = 1;
					}
				}

				if (classificationTypesInServicesObject != null) {
					for (TKClassificationType type : classificationTypesInServicesObject) {
						if (type != null) {
							if (type.replaceCounterKind.code == TKClassificationType.PARAMETERIZATION_COUNTER) {
								numberOfParametrization += 1;
								break;
							}
						}
					}
				}


				if(numberOfParametrization == 2 && object.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
					throw new SystemException(String.format("\n\n "
							+ "��������� �������� ����������� ������ �� �������� ������� � %s, �� ���� ��� ���� ��������������", object.personalAccountNumber));
				}

				if(numberOfParametrization == 1 && object.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
					// SUPP-90018 ��������� ������ ��� ���. ���
					if (object.contragentTypeRef != null && object.contragentTypeRef.code != Integer.MIN_VALUE
							&& (object.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
		                        object.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT))
					{
						throw new SystemException(String.format("\n\n "
								+ "��������� �������� ������� ������ �� �������� ������� � %s, �� ���� �� �� ���� ��������������", object.personalAccountNumber));
					}
				}
			}
			*/



			/** SUPP-18087... 04.06.2014 +++ ��� ������������� �������������� ������� �� �����... */
			if (!priconnection) {
				// ��������� ���  ����� ���� �� � �������� ������ �� ������� ����������� ��������� ����� � ���� ���������� (��� ����� �����������)
				int[] clArr = clDAO.getClassificationCodesArrayByServicesObjectCode(object.code, true);
				// ���� ���� ������������ � ����������� ������������� ����� � �������� �� �������� ����� ������������
				if (clArr.length > 0 ) {
					// ������ �� ���� �� ���� ������ ������ ���� ���� � ��������� ���� ����� ���������� ���� ���� ����� ��������
					ENTimeLineDAO tlDAO = new ENTimeLineDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					ENTimeLineFilter tlFilter = new ENTimeLineFilter();
					tlFilter.servicesObjectRef.code = object.code;
					ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
					if (tlList.totalCount > 0){
						object.executeWorkDate = tlList.get(0).dateGen;
						object.timeStart = tlList.get(0).timeStart;
						object.timeFinal = tlList.get(0).timeFinal;
					} else {
						throw new SystemException("\n\n"
								+ "�� ��������� ���� / ��� ��������� ���� �� ��������!!!");
					}
					if (object.contractDateServices != null && object.contractDateServices.after(object.executeWorkDate)) {
						throw new SystemException("\n\n"
								+ "���� ��������� ���� �� �������� �� ������� ���� ����� �� ���� ��������!");
					}
				}
			}

			if (object.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n\n"
						+ "�������� ��� �������� �������� ����������!");
			}

			if (object.contractStatusRef.code == ENServicesContractStatus.SIGNED || object.contractStatusRef.code == ENServicesContractStatus.PAID) {
				throw new SystemException("\n\n"
						+ "�������� ������� ��� ������� �������� ����������!");
			}

			object.setDomain_info(null);



			////SUPP-88252 ���� �� ������ ���������� ����� �� �������� ��� ������ ��� ������ ������� � ����������� � ������ �������� ��� �������� ����� ������!
			if(oldObject.isNoPay != object.isNoPay){

				ENPlanWork2ClassificationTypeDAO pl2clDAO = new ENPlanWork2ClassificationTypeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENPlanWork2ClassificationTypeFilter pl2clFilter = new ENPlanWork2ClassificationTypeFilter();
				pl2clFilter.planRef.code = (servicesLogic.getPlanWorkCalculationByElementCode(object.element.code)).code;
				ENPlanWork2ClassificationTypeShortList pl2clList = pl2clDAO.getScrollableFilteredList(pl2clFilter, 0, -1);
				for (int n = 0; n < pl2clList.totalCount; n++) {
					if(pl2clList.get(n).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_PAID ||pl2clList.get(n).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_FREE_WORK){
						throw new SystemException("\n\n"
								+ " ������ �������� \" ��������\\����������� \" �������� �������!!! ���� ����������� ����������� ��� �������� ����������� � ������ �������� �� ����������� � �������� �����������!!! ");
					}
				}

			}

			// 13.11.12 NET-3079
			boolean actTransferNumberChanged = false;
			boolean actTransferDateChanged = false;
			if (object.actTransferNumber == null) {
				if (oldObject.actTransferNumber != null) {
					actTransferNumberChanged = true;
				}
			} else {
				if (oldObject.actTransferNumber == null) {
					actTransferNumberChanged = true;
				} else if (! object.actTransferNumber.equals(oldObject.actTransferNumber)) {
					actTransferNumberChanged = true;
				}
			}
			if (object.actTransferDate == null) {
				if (oldObject.actTransferDate != null) {
					actTransferDateChanged = true;
				}
			} else {
				if (oldObject.actTransferDate == null) {
					actTransferDateChanged = true;
				}  else if (! object.actTransferDate.equals(oldObject.actTransferDate)) {
					actTransferDateChanged = true;
				}
			}


			if (actTransferNumberChanged || actTransferDateChanged) {
				throw new SystemException("\n \n NET-3079 ��� ���� ���� ���������-�������� �������������� ������ \"��������\"" +
					" � ��� \"��� ���������-��������\" �� ������� \"����\"!");
			}


			// NET-745 ��� ���������� �������� ��������� ������������� �� ������ �� ����� ��������
			if (object.department.code != ENConsts.ENDEPARTMENT_CO
					&& object.department.code != ENConsts.ENDEPARTMENT_KSOE) {

				ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.elementRef.code = object.element.code;
				int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

				for (int i = 0; i < planArr.length; i++) {
					ENPlanWork plan = planDAO.getObject(planArr[i]);
					plan.departmentRef.code = object.department.code;
					planDAO.save(plan);
				}
			}



			// 02.09.2019 �������� ��� ����������, ��� ��������� �������� �����������
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				ServicesCalculatorLogic servicesCalculatorLogic =
							new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
				this.save(object);
				servicesCalculatorLogic.evaluateSumsByENServicesCost(object);
				object = this.getObject(object.code);

			}


			if (oldObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
				this.save(object);
				return;
			}

			ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			soLogic.checkEditableServicesObject(oldObject, true);

			if (object.contractServicesDistance == null &&
					(object.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_COMPANY_OBJ &&
					 object.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_CUSTOMER_OBJ &&
					 object.contractKindRef.code != ENServicesContractKind.SUPPLIER_CONTRACT &&
					 object.contractKindRef.code != ENServicesContractKind.INFORMATIONAL_SERVICES &&
					 object.contractKindRef.code != ENServicesContractKind.OTHER_NOT_LICENSED &&
					 object.contractKindRef.code != ENServicesContractKind.REMOVAL_LINE_RM_KB &&
					 object.contractKindRef.code != ENServicesContractKind.SERVICES_LUZOD_ASKOE 
					 ) ) {
				throw new SystemException("���� ������ ... ������ ���� � 0");
			}

			boolean isRecalcContract = false;
			if (oldObject.contractServicesDistance != null) {
				if (object.contractServicesDistance.doubleValue() != oldObject.contractServicesDistance.doubleValue()) {
					isRecalcContract = true;
				}
			} else{
				isRecalcContract = true;
			}

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			ENElement el = new ENElement();
			ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			el = elDAO.getObject(object.element.code);

			if (object.element.renRef != null ){
				if ( object.element.renRef.code != Integer.MIN_VALUE ){
					el.renRef.code = object.element.renRef.code;
				}
			}

			if ( el.renRef.code == Integer.MIN_VALUE){
				el.renRef.code = 0;
			}

			elDAO.save(el);

			objectDAO.save(object);


			if (isRecalcContract &&
					(object.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_COMPANY_OBJ &&
					 object.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_CUSTOMER_OBJ &&
					 object.contractKindRef.code != ENServicesContractKind.SUPPLIER_CONTRACT &&
					 object.contractKindRef.code != ENServicesContractKind.INFORMATIONAL_SERVICES &&
					 object.contractKindRef.code != ENServicesContractKind.OTHER_NOT_LICENSED &&
					 object.contractKindRef.code != ENServicesContractKind.REMOVAL_LINE_RM_KB &&
					 object.contractKindRef.code != ENServicesContractKind.SERVICES_LUZOD_ASKOE )) {
				soLogic.createDistances(object, object.contractServicesDistance);
				object = objectDAO.getObject(object.code);
				object.contractServicesSumma = soLogic.calculateContractByElementCode(oldObject.element.code);
				objectDAO.save(object);
			}

		}
		catch (DatasourceConnectException e) {throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENServicesObject%} object.",e);}
		catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
		finally                              {closeConnection();}
	}


	/** ENServicesObject. �������� */
    @Override
	public void save(ENServicesObject object) {
		try {

			if (object.statusRef != null) {
					if (object.statusRef.code == ENServicesObjectStatus.CLOSED) {
						throw new SystemException("�������� ��� �������� �������� ����������!");
					}
			}


                /**
                *   NET-3971
                *   22.12.2012 +++ �������� ������������
                *   SUPP-4358
                *   11.06.2013 +++ �������� �� 100
                */


                 if (object.contractServicesPower != null
                        && object.warrantRef != null && object.warrantRef.code != Integer.MIN_VALUE) {

                    ENWarrantDAO warrantDAO = new ENWarrantDAO(getUserProfile(),
                            getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                    ENWarrant warrant = warrantDAO.getObject(object.warrantRef.code);

                    /** SUPP-5130... 11.07.2013 +++ ���� �������� � �������� ��������� ��������� �������� � ������������ */
                    if (object.contractServicesPower.doubleValue() > warrant.power) {
                        //if (object.contractServicesPower.doubleValue() <= 100) {
                            throw new SystemException("\n"
                                            + "\n ��������� �� ������� ��������!!!"
                                            + "\n ������ ��������� �������� ��������!!!");
                       //}
                    }
                }


            /* 26.07.2012 +++ ���������� ���������� ������� */
            /* 17.07.2013 +++ � �������������..... */

	    	 if (object.contractKindRef.code != ENServicesContractKind.SALE
	                 && object.contractTypeRef.code != ENServicesContractType.CONNECTION) {
	             if (object.contractStatusRef != null)
	                 if (object.contractStatusRef.code == ENServicesContractStatus.SIGNED ||
	                     object.contractStatusRef.code == ENServicesContractStatus.PAID)
	                 {
	                     throw new SystemException("�������� ������� ��� ������� �������� ����������!");
	                 }
	         }



            object.setDomain_info(null);


            ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;

            ENElement el = new ENElement();
            ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            el = elDAO.getObject(object.element.code);

            if (object.element.renRef != null ){
                    if ( object.element.renRef.code != Integer.MIN_VALUE ){
                        el.renRef.code = object.element.renRef.code;
                }
            }

            if ( el.renRef.code == Integer.MIN_VALUE){
                el.renRef.code = 0;
            }

			elDAO.save(el);

			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENServicesObject%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



    /**
     *  �������� ������� ���������� � ��������
     *
     *  @param - rentPeriod
     *
     *  @return true - ���� ������ ��������
     */
    public boolean checkRentPeriod(ENRentPeriod2Services rentPeriod) {

    	final Date early = rentPeriod.getStartDate();
        final Date late = rentPeriod.getEndDate();

        boolean periodValid = true;
		try {
			ENRentPeriod2ServicesDAO rentPeriodDao = new ENRentPeriod2ServicesDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	        ENRentPeriod2ServicesFilter rentPeriodFilter = new ENRentPeriod2ServicesFilter();
	        rentPeriodFilter.cottageRef.code = rentPeriod.cottageRef.code;
	        rentPeriodFilter.statusRef.code = ENRentPeriodStatus.VALID;

			int rentPeriodArr[] = rentPeriodDao.getFilteredCodeArray(rentPeriodFilter, 0, -1);
			for (int i = 0; i < rentPeriodArr.length; i++) {
				ENRentPeriod2Services existingRentPeriod = rentPeriodDao.getObject(rentPeriodArr[i]);

				/* ����������� ��������� ���������� � ������� ���
				if (! ( ( early.after(existingRentPeriod.getEndDate()) || early.equals(existingRentPeriod.getEndDate()) )
						|| ( late.before(existingRentPeriod.getStartDate()) || late.equals(existingRentPeriod.getStartDate()) ) ) )
				*/

				if (! (  early.after(existingRentPeriod.getEndDate())
						||  late.before(existingRentPeriod.getStartDate()) ) )

				return false;
			}

			return periodValid;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
    }


    /** ������ �� ������������
  	 *  +++ cottageCode, startDate, endDate, tabNumber   */
    public int addForCalculation(ENServicesObject object, int cottageCode,
			Date startDate, Date endDate, String tabNumber, String FIO) {

    	Connection finConn = null;
    	int soCode = Integer.MIN_VALUE;
    	int classificationCode = Integer.MIN_VALUE;
    	try {

    		int netDepartmentCode = ENDepartment.ENDEPARTMENT_KSOE;

        	/** �������� � ����������� ����������� ��� ������ */
        	ENCottage2TKClassificationTypeDAO cottage2ClassificationTypeDao = new ENCottage2TKClassificationTypeDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

    		ENCottage2TKClassificationTypeFilter cottage2ClassificationTypeFilter = new ENCottage2TKClassificationTypeFilter();
    		cottage2ClassificationTypeFilter.cottageRef.code = cottageCode;

    		int c2tArr[] = cottage2ClassificationTypeDao.getFilteredCodeArray(cottage2ClassificationTypeFilter, 0, -1);
    		if (c2tArr.length == 0) {
    			throw new SystemException("\n\n"
    					+ "��� ��������� �� ��������� �����������!");
    		} else {

    			ENCottage2TKClassificationType cottage2ClassificationType = cottage2ClassificationTypeDao.getObject(c2tArr[0]);
    			classificationCode = cottage2ClassificationType.classificationTypeRef.code;
    		}

    		if (classificationCode == Integer.MIN_VALUE) {
    			throw new SystemException("\n\n"
    					+ "��� ��������� �� ��������� �����������!");
    		}


			/** ������ ���������� ������� - ����� */
			ENRentPeriod2Services rentPeriod =  new ENRentPeriod2Services();
			rentPeriod.cottageRef.code = cottageCode;
			rentPeriod.startDate = startDate;
			rentPeriod.endDate = endDate;
			rentPeriod.statusRef.code = ENRentPeriodStatus.VALID;


			/** �������� ���������� ������� */
			if (!checkRentPeriod(rentPeriod)) {
    			throw new SystemException("\n\n"
    					+ "�������� ����� ��� �������� � ����� ���������! \n"
    					+ "������ ��������� �����.");
    		}


    		/** ���-�� ���� - ��� ���-�� ����� */
    		long diff = endDate.getTime() - startDate.getTime();
    		int coundDays = (int) (diff/(1000*60*60*24));

    		Context cnt = new InitialContext();
			Object objRef = cnt.lookup(ENPlanWorkItemController.JNDI_NAME);
			ENPlanWorkItemControllerHome planWorkItemHome = (ENPlanWorkItemControllerHome) PortableRemoteObject
					.narrow(objRef, ENPlanWorkItemControllerHome.class);
			ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();

			ENPlanWork2ClassificationType planWork2ClassificationType = new ENPlanWork2ClassificationType();
			planWork2ClassificationType.classificationTypeRef.code = classificationCode;
			planWork2ClassificationType.countGen = new BigDecimal(coundDays+1);

			planWork2ClassificationType.machineHours = new BigDecimal(0);
			planWork2ClassificationType.isJobsByTime = ENPlanWork2ClassificationType.NOT_JOBSBYTIME;
			planWork2ClassificationType.isVisitClient = ENPlanWork2ClassificationType.NOT_VISITCLIENT;

			BigDecimal distance =  new BigDecimal(0);

			ENServicesObject tempObject = new ENServicesObject();

			tempObject.tabNumber = tabNumber;
			tempObject.timeStart = startDate;
			tempObject.timeFinal = endDate;


			/** ���������� ������ � �������� */
			if (tabNumber != null && !tabNumber.equals("")) {
				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				FINLogic finLogic = new FINLogic(finConn, getUserProfile());


				boolean usesMDAXData = false;
		        mDaxLogic mdLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile() );
		    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile() );
		    	usesMDAXData = netAuth.checkUsesMDAXData();

		    	PersonalServicesInfo personalInfo = null;
		    	/* MDAX-441 ����������� ����� ���������� �� �������  */
		    	if (usesMDAXData) {
		    		personalInfo = mdLogic.getPersonalInfo(tabNumber);
		    	} else {
		    		personalInfo = finLogic.getPersonalInfo(tabNumber);
		    	}



				if (personalInfo != null) {
					tempObject.contragentName = personalInfo.fioLine;
					tempObject.contragentBossName = personalInfo.fioLine;
					tempObject.contragentAddress = personalInfo.addressLine;
					tempObject.contragentPassport = personalInfo.passportLine;
				} else {
					tempObject.contragentName = FIO;
					tempObject.contragentBossName = FIO;
					tempObject.contragentAddress = "";
					tempObject.contragentPassport = "";
				}
			}


			boolean relaxation = true;
			soCode = planWorkItemController
					.addPlanWorkItemsByClassificationTypeForCalculation2(
							planWork2ClassificationType, distance,
							netDepartmentCode, false, tempObject, false,
							Integer.MIN_VALUE, relaxation, null);



			ENRentPeriod2ServicesDAO rentPeriodDao = new ENRentPeriod2ServicesDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			rentPeriod.servicesObjectRef.code = soCode;
			rentPeriodDao.add(rentPeriod);

			return soCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}

		finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}


	/* ENServicesObject. �������� ������ ��� �������� ����������� */
	public int addForCalculation(ENServicesObject servicesObject) {
		try {

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			return servicesLogic.addServicesObjectForCalculation(servicesObject);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add object", e);
		} finally {
			closeConnection();
		}
	}

	public void budgetApproved(int svoCode, int planCode) {
		try {

			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.budgetApproved(svoCode, planCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't budgetApproved ServicesObject.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}


    public void unBudgetApproved(int svoCode) {
        unBudgetApproved(svoCode, false, true);
    }


    public void unBudgetApproved(int svoCode, boolean priconnections, boolean isClient) {
        try {
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }


            if (isClient && priconnections) {
                throw new SystemException("\n NET-4231..."
                        + "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
            }

            if (obj.contractStatusRef.code != ENServicesContractStatus.BUDGETAPPROVED) {
                throw new SystemException("������ �� �� ��� ������, ��� ������� ������������ ���������, code = " + svoCode);
            }

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
            {
            throw new SystemException("�������� ��� �������� �������� ����������!");
            }

            /////
            // 20.08.12 NET-2804
            // ������ ����� � 0 ����������?? ����� ����� � ���� ������ ���������?
            // (��� ����������� ��������� �������� ��������, ��� ��� ����� ������ �� ��������)
            // obj.contractServicesSumma = new BigDecimal(0);
            /////


            /** NET-4235... 28.05.2013 +++ ��� ������ ��������� ������� ������ ���� ��� ��������������� ������ */
            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
                ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
                factCalcFilter.servicesObjectRef.code = obj.code;

                int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
                for (int i = 0; i < factCalcArr.length; i++) {
                    factCalcDAO.remove(factCalcArr[i]);
                }
            }

            /** 01.10.2013 +++ ��� ���������� ������ �����?!?! */
            if (obj.contractKindRef.code == ENServicesContractKind.SALE) {
                ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
                planFilter.elementRef.code = obj.element.code;

                int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
                for (int i = 0; i < planArr.length; i++) {
                    ENPlanWork plan = planDao.getObject(planArr[i]);
                    plan.status.code = ENPlanWorkStatus.GOOD;
                    planDao.save(plan);
                }
            }

            obj.contractStatusRef.code = ENServicesContractStatus.GOOD;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't unBudgetApproved ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int signed(int svoCode) {
        return signed(svoCode, false, true);
    }

    // ���������� �������� - ���������� ��� ��������� �����, ���������� �� "���������"
	public int signed(int svoCode, boolean priconnections, boolean isClient) {
		int newPlanCode = Integer.MIN_VALUE;

		try {
			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			newPlanCode = logic.signed(svoCode, priconnections, isClient);

			return newPlanCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't signed ServicesObject.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}

    public void unSigned(int svoCode) {
        unSigned(svoCode, false, true);
    }


	/**
	 *	������ ���������� ��������...
	 */
    public void unSigned(int svoCode, boolean priconnections, boolean isClient) {
        try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.unSigned(svoCode, priconnections, isClient);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't unSigned ServicesObject.Code = " + svoCode, e);
        } finally {
            closeConnection();
        }
    }


	public void paid(int svoCode) {
		paid(svoCode, false, true);
	}

	public void paid(int svoCode, boolean priconnections, boolean isClient) {
		try {

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.paid(svoCode, priconnections, isClient);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't paid ServicesObject.Code = " + svoCode, e);
        } finally {
            closeConnection();
        }
    }


    public void unPaid(int svoCode) {
        unPaid(svoCode, false, true);
    }

    public void unPaid(int svoCode, boolean priconnections, boolean isClient) {

    	Connection authConn = null;
    	Connection enConn = null;
    	try {

        	authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            ServicesLogic sl = new ServicesLogic(enConn, getUserProfile());
            sl.isCancelableServices(svoCode);

            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (isClient && priconnections) {
                throw new SystemException("\n NET-4231..."
                        + "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
            }

            if (obj.contractStatusRef.code != ENServicesContractStatus.PAID) {
                throw new SystemException("������ �� ��������� �� ����, code = " + svoCode);
            }

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
            {
            throw new SystemException("�������� ��� �������� �������� ����������!");
            }
            PlanWorkLogic pl = new PlanWorkLogic(enConn, getUserProfile());
            /* ���� ���� ������������� ������ � �������� ����� ������� ������� ������ ������� ���� ���� �� � �������� �������
            * � ���� ���������� �� �������� �� ��������� �����������
            * */
            if ( ( sl.isReservedCalculationInContract(svoCode) == true )  &&
                ( obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET ))

            {
                ENPlanWorkDAO planNPWDAO = new ENPlanWorkDAO(getUserProfile(), enConn);
                ENPlanWorkFilter planNPWFilter = new ENPlanWorkFilter();

                ///// 11.10.13 ������� ��������, ���� �� ���� - ���� ����, �� ������ �� �������
                planNPWFilter.conditionSQL = " ENPLANWORK.CODE in ( " +
                " select pw.code from enplanwork pw  , enservicesobject so " +
                " where pw.elementrefcode = so.elementcode " +
                " and pw.kindcode = " + ENPlanWorkKind.FACT +
                " and so.code = " + svoCode +
                " limit 1 ) ";
                int factArr[] = planNPWDAO.getFilteredCodeArray(planNPWFilter,0,-1);

                if (factArr.length == 0)
                {
                /////

                    planNPWFilter = new ENPlanWorkFilter();
                    planNPWFilter.conditionSQL = " ENPLANWORK.CODE in ( " +
                    " select pw.code from enplanwork pw  , enservicesobject so " +
                    " where pw.elementrefcode = so.elementcode " +
                    " and pw.kindcode = " + ENPlanWorkKind.NPW +
                    " and so.code = " + svoCode +
                    " limit 1 ) ";
                    // ENPlanWorkShortList planNPWList = planNPWDAO.getScrollableFilteredList(planNPWFilter,0,-1);
                    int plArr[] = planNPWDAO.getFilteredCodeArray(planNPWFilter,0,-1);
                    if (plArr.length > 0){
                        ENPlanWork plObj = planNPWDAO.getObject(plArr[0]);
                        if  (plObj.status.code != ENPlanWorkStatus.GOOD) {
                            throw new SystemException("��� ����� ������ �������� �������� ���� ������� ���� ��������!");
                        }
                        else
                            // ������ ������� ����
                            pl.openPlan(plObj.code,0);
                    }

                /////
                }
                /////

            }


            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
            {
                obj.contractStatusRef.code = ENServicesContractStatus.SIGNED;
            }
            else if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
            {
                obj.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
            }
            else
            {
                throw new SystemException("\n\nNET-4235 �������� ��� ���������� ��� ��������! ��� ��������: " + svoCode);
            }

            // 21.07.2018 ����������� �� ������ unPrepaid, �.�. �� ������ �� ����� ���������� (��� ����� ���������)
            // net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
            // ���� ��� ����������� �� ������ ����� ��� ������ ������ ������� ����� �� ����������� ��������
            if (sl.isTKCalcKindNew(svoCode)) {

                if (obj.contractKindRef.code == ENServicesContractKind.SERVICES &&
                		obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET) {

                	FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), enConn);
                	fkOrderLogic.autoRemoveAllRereservedCountersForServices(obj, true);
                    fkOrderLogic.autoRemoveFkorderMoveCounterForServices(obj, true);
                }

            }

            //NET-4295 ������ ��������
            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
                if(!sl.isDocFlowLifeCycleStartsWithSigning(obj))
                {
                    sl.deleteServicesObjectInDocFlow(obj);
                }
            }

            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't unPaid ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
     *  ������ �������� ����� �� �������
     */
	public void canceled(int svoCode) {
		try {

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.canceled(svoCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't canceled ServicesObject.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}


	public int closePlanWorkForCalculation(int planCode) {
		try {
			PlanWorkLogic logic = new PlanWorkLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int newPlanCode = logic.closePlan(planCode);

			return newPlanCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public FKProvResult moveToFK(int servicesObjectCode) {
		FKProvResult fkprov = moveToFK(servicesObjectCode, null);
		return fkprov;
	}

	public FKProvResult moveToFK(int servicesObjectCode, Date datePostings) {
		FKProvResult fkprov = moveToFK(servicesObjectCode, null, Integer.MIN_VALUE);
		return fkprov;
	}

	public FKProvResult moveToFK(int servicesObjectCode, int actIncomeServicesCode) {
		FKProvResult fkprov = moveToFK(servicesObjectCode, null, actIncomeServicesCode);
		return fkprov;
	}

	public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode) {
		return moveToFK(servicesObjectCode, datePostings, actIncomeServicesCode, null);
	}

	public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller) {
		return moveToFK(servicesObjectCode, datePostings, actIncomeServicesCode, caller, false);
	}

	public FKProvResult moveToFK(int servicesObjectCode, Date datePostings, int actIncomeServicesCode, Object caller, boolean justForCheck) {
		Connection enConn = null;

		try {

        	long moveToFKStartTime = System.nanoTime();

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            String _messageId = "";
            AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
            AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());

            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
            ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

            ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(enConn, getUserProfile());
            ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServicesCode);


			/*if (actIncomeServicesCode == Integer.MIN_VALUE) {
				if (!getUserProfile().domainInfo.domain.equals("root")) {
					if (!getUserProfile().domainInfo.domain.equals(servicesObject.domain_info)) {
						throw new SystemException("\n\n"
								+ "� ��� ���� ���� �� ���������� ��������� ����� ��������!");
					}
				}
			}*/


			if (actIncomeServicesCode != Integer.MIN_VALUE) {
				if (actIncomeServices.statusRef.code == ENActIncomeStatus.CLOSED) {
					 throw new SystemException("\n\n"
		                		+ "��� ��� ��� ����������!");
				}
			} else {
	            ///// �������� �� ������
	            /// 19.11.12 NET-3079
	            // if (servicesObject.statusRef.code != ENServicesObjectStatus.GOOD)
	            if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED ||
	            		servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED_BY_BUH_SPRAV)
	            ///
	            {
	                throw new SystemException("\n\n"
	                		+ "��� ������ ��� ����������!");
	            }
			}

            /* SUPP-6675... 03.09.2013 +++ ������������� �������� ��� �����.... */
            /* NET-4469... 04.06.2015 +++ ������� � ���������.... */
            if (servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION
            		&& servicesObject.contractTypeRef.code != ENServicesContractType.RELAXATION
            		&& servicesObject.contractTypeRef.code != ENServicesContractType.PROJECT // SUPP-83057 06.06.2019
            		&& actIncomeServicesCode == Integer.MIN_VALUE) {
                // ���� ��� ���. ���� ���� ��. ���� ��������, ��������� ����� ������ ����� ������, �.�. ������ �������� ������ ���� "����������"
                if (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
                    servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET ||
                    servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT ||
                    servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NOREZIDENT)
                {
                    if (/** 27.08.2018... +++ ������ ���� ������ ��������� */
                    	/* servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID  && */
                        servicesObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED // 03.06.2013 ������ ��������� ���� ������ ��������� ��� ��������
                        /** SUPP-12124... +++ ������ �� ��������� ���������� "��� ������-�������� ��������� ��������" ��� ����������... */
                        && servicesObject.contractStatusRef.code != ENServicesContractStatus.ACT_SIGNED)
                    {
                    	// 23.01.2020 SUPP-88865
                    	if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
                            if (servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID)
                            {
                                throw new SystemException("��� ���������� � Գ�. �������� ��� ������ ������� ���� ������ \"������ �������\" ��� \"���������\"!");
                            }
                    	} else {
                    		throw new SystemException("��� ���������� � Գ�. �������� ��� ������ ������� ���� ������ \"������ �������\"!");
                    	}
                    }
                }
                // ���� ��� ��. ���� ������, ��������� �����, �� ��������� ������, �.�. ������ �������� ������ ���� "�����������" (��� "����������")
                else if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                {
                    if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
                    {
                    	ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());

                    	if (servicesLogic.isTKCalcKindNew(servicesObjectCode)) { // SUPP-74472

                            if (servicesObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED &&
                                servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID &&
                                servicesObject.contractStatusRef.code != ENServicesContractStatus.SIGNED)
                            {
                            	throw new SystemException("��� ���������� � Գ�. �������� ��� ������ ������� ���� ������ \"������ �������\", " +
                            			"\"ϳ��������\" ��� \"���������\"!");
                            }

                    	} else {

                            if (servicesObject.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                                    servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID // &&
                                    // servicesObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED
                                    )
                            {
                                throw new SystemException("��� ���������� � Գ�. �������� ��� ������ ������� ���� ������ \"ϳ��������\" ��� \"���������\"!");
                            }

                    	}
                    }
                    else if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
                    {
                        if (servicesObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED &&
                            servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID)
                        {
                            throw new SystemException("��� ���������� � Գ�. �������� ��� ������ ������� ���� ������ \"������ �������\" ��� \"���������\"!");
                        }
                    }
                    else
                    {
                        throw new SystemException("\n\nNET-4235 �������� ��� ���������� ��� ��������! ��� ��������: " + servicesObjectCode);
                    }
                }
                else
                {
                    throw new SystemException("�������� ��� �����������!");
                }
                /////
            }


            ////////////////////////////////////////////////
            // 19.11.12 NET-3079 ���������� �������� �� �������� � ������� ����� ������ ����� ����������
            // ���� ������-�������� ���������� ���������, ���� ����� ��������������
            if (servicesObject.isCustomerMaterials == 1
            		&& servicesObject.statusRef.code != ENServicesObjectStatus.ACT_TRANSFER_CLOSED
            		&& actIncomeServicesCode == Integer.MIN_VALUE)
            {
                throw new SystemException("\n \n NET-3079 ��� ������ �� ������ \"������ � ������������� �������� ���������\"! \n " +
                        "�������� ������� �������� ��� ���������-�������� �������� ���������!");
            }
            ////////////////////////////////////////////////


            FKProvResult result = new FKProvResult();

            Boolean posting_move_mdax = false;

      	    if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_SERVICES_POSTING) ){
      		   posting_move_mdax = true;
      	    }

            /**  NET-4469... 04.06.2015 +++ ������� � ���������....
             *   �������� �� ����� ��������
             */
            /**  ������������� �������� ���������� � ��  */
    		if(posting_move_mdax) {
      	    _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+60);
    		}

            if (servicesObject.contractTypeRef.code == ENServicesContractType.RELAXATION) {

            	boolean relaxation = true;
            	if (datePostings == null) {
                    datePostings = servicesObject.contractDateServices;
                }

				result = createPostings(servicesObject, datePostings,
						servicesObject.contractDateServices, relaxation);

				if (result.partId != Integer.MIN_VALUE) {

					// ������ ���.������ �� "����������� � ��", ������ �� "��������"
					servicesObject.statusRef.code = ENServicesObjectStatus.CLOSED;
                    servicesObject.contractStatusRef.code = ENServicesContractStatus.CLOSED;

					servicesObjectDAO.save(servicesObject);
				}

            } else {

                ENActDAO actDAO = new ENActDAO(enConn, getUserProfile());
                ENActFilter actFilter = new ENActFilter();

                if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {

                    ENServicesObject2TechCondtnsServicesDAO s2tDao = new ENServicesObject2TechCondtnsServicesDAO(getUserProfile(), enConn);
                    ENServicesObject2TechCondtnsServicesFilter s2tFilter = new ENServicesObject2TechCondtnsServicesFilter();
                    s2tFilter.servicesObjectRef.code = servicesObject.code;
                    int tcsCode = Integer.MIN_VALUE;
                    int s2tArr[] = s2tDao.getFilteredCodeArray(s2tFilter, 0, -1);

                    if (s2tArr.length > 0) {
                        tcsCode = s2tDao.getObject(s2tArr[0]).techCondServRef.code;
                    } else {
                        throw new SystemException("\n " +
                                "\n ������� ��� ��������� �������� ��� ���������! ��� ��'����: "
                                        + servicesObject.code);
                    }

                    actFilter.conditionSQL = " code in ( " +
                            " select a.code from enact a where a.code in (" +
                            " select a2pl.actrefcode from enact2enplanwork a2pl " +
                            " where a2pl.plancode in ( " +
                            "  select ct2pl.planrefcode from entechcond2planwork ct2pl " +
                            "   where ct2pl.techconservicesrefcode = " + tcsCode + "))) " +
                            "  or (enact.elementcode = " + servicesObject.element.code + ")";
                    actFilter.orderBySQL = "dategen desc";

                } else if (actIncomeServicesCode != Integer.MIN_VALUE) {

                	actFilter.conditionSQL = " code in ( "
                			+ " select s2a.actrefcode from enactincomserv2enact s2a "
                			+ " where s2a.actincomerefcode = " + actIncomeServicesCode + ")";
                	actFilter.orderBySQL = "dategen desc";

                } else {
                    actFilter.element.code = servicesObject.element.code;
                    actFilter.orderBySQL = "dategen desc";
                }

                int[] actArr = actDAO.getFilteredCodeArray(actFilter,
                        actFilter.conditionSQL, actFilter.orderBySQL, 0, -1, null);

                if (actArr.length == 0 && servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {
                    throw new SystemException("\n\n"
                    		+ "�� �������� ���������� ��� ��� ��'����! ��� ��'����: " + servicesObject.code);
                }


                ENActIncomeTechConditionsDAO actIncomDao = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
                ENActIncomeTechConditions actIncome = null;

                ENAct act1 = null;
                if(actArr.length > 0) {
                    act1 = actDAO.getObject(actArr[0]);
                }

                BigDecimal sumGen = new BigDecimal(0);

                /** SUPP-7343... 25.09.2013 +++ ��� ����� ��������� ���� ���������� (�������� ��������) */
                if (datePostings == null && act1 != null) {
                    datePostings = act1.dateGen;
                }

                /** SUPP-3740... 27.05.2013 +++ ��� ��������� �� �������� "³����� ��������� �� ������" �������� ������ ���� */
                if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION
                        || servicesObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES) {

                    /**
                     *  18.07.2013 +++ ��� ������������� ����� ����� � ��������� ����
                     *  ��������� ������� ���� � �����.....
                     */
                    if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                        ENActIncomeTechConditionsFilter actIncomeFilter = new ENActIncomeTechConditionsFilter();
                        actIncomeFilter.conditionSQL = " techcondservicesrefcod = ( " +
                               " select s2t.techcondservrefcode " +
                               " from enservicesobject2techcondtnsservices s2t " +
                               " where s2t.servicesobjectrefcode = " + servicesObject.code + " ) ";

                        int actIncomeArr[] = actIncomDao.getFilteredCodeArray(actIncomeFilter, 0, -1);

                        if (actIncomeArr.length > 0) {

                            actIncome = actIncomDao.getObject(actIncomeArr[0]);

                            /** SUPP-101012... 24.06.2021 +++ ��� ������������� ���� ���������� == ���� ���������  */
                            datePostings = actIncome.dategen;


                            /** SUPP-9251... */
                            if (actIncome.summaGen == null) {
                                throw new SystemException("\n" +
                                        "\n �� ������� ���� � ������������ ���!!!");
                            }

                            sumGen = actIncome.summaGen.subtract(actIncome.summaVat);

                            /** 01.08.2013 +++ ����� ���� � ������� ������ (����������� �������� � �.�.)
                            if (sumGen.doubleValue() == 0) {
                                throw new SystemException("\n" +
                                        "\n ���� � ������������ ��� ������� 0.00!!! ��� ��������: " + servicesObject.code);
                            } */

                        } else {
                            throw new SystemException("\n" +
                                    "\n �� �������� ����������� ���!!! ��� ��������: " + servicesObject.code);
                        }

                        /** �������� ������� �������� ������ (��������, ���) */
                        ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


                        ENPlanWorkShortList planList = planDao.getListByENServicesObject(servicesObject);
                        for (int i = 0; i < planList.totalCount; i++) {
                            if (planList.get(i).kindCode == ENPlanWorkKind.NPW
                                    || planList.get(i).kindCode == ENPlanWorkKind.CURRENT
                                    || planList.get(i).kindCode == ENPlanWorkKind.FACT) {

                                if (planList.get(i).kindCode == ENPlanWorkKind.FACT
                                        && planList.get(i).statusCode == ENPlanWorkStatus.GOOD) {

                                    ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(
                                            getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                                    ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
                                    a2pFilter.plan.code = planList.get(i).code;

                                    int[] a2pArr = a2pDAO.getFilteredCodeArray(a2pFilter, null, null, 0, -1, null);
                                    if (a2pArr.length == 0) {
                                        throw new SystemException("\n" +
                                                "\n ��������-���� � ����� " + planList.get(i).code + " �� �������� �� ����!");
                                    }

                                } else {
                                    if (planList.get(i).statusCode == ENPlanWorkStatus.GOOD) {
                                        throw new SystemException("\n " +
                                                "\n � ������������ ��� ��� ̳���� ����� �� ����� ��������!!! " +
                                                "\n ��� ��������: " + servicesObject.code);
                                    }
                                }
                            }
                        }
                    }


                    if ((servicesObject.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY)
                            && (sumGen.doubleValue() != 0)) {
                        result = createPostings(servicesObject, datePostings, act1.dateAct);
                    } else {
                        result.partId = Integer.MIN_VALUE;
                    }

                    for (int i=0; i < actArr.length; i++)
                    {
                        ENAct act = actDAO.getObject(actArr[i]);

                        if (act == null) {
                            throw new SystemException("�� �������� ���������� ��� ��� ��'����! ��� ��'����: " + servicesObject.code);
                        }

                        if ((result.partId != Integer.MIN_VALUE)
                                || (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY)
                                || (sumGen.doubleValue() == 0)) {

                            if (act.statusRef.code != ENActStatus.CLOSED) {

                                if (act.statusRef.code != ENActStatus.SIGNATURE) {
                                    throw new SystemException("��� ���������� ������� ��������� ���������� ��� � " + act.numberGen + " �� " +
                                            new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen).toString() +
                                            " � ������ \"�� ��������\"! ��� ����: " + act.code);
                                }

                                Context cnt = new InitialContext();
                                Object objRef = cnt.lookup(ENActController.JNDI_NAME);
                                ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);

                                ENActController actController = actHome.create();
                                actController.close(act.code, 1);

                            }
                        }
                    }

                    if ((result.partId != Integer.MIN_VALUE)
                    		/** ��� ������ ��������� ������ ���. ������ �� "����������� � ��" */
                          || (servicesObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES)
                          || (sumGen.doubleValue() == 0 && !justForCheck)) {

        				// �������� ��� ���������� ����� ��������� ������ � ������, ���� ��� ��������� � ����������
                    	// (�����, � ������ ��������� ��������, �� ������� ������ ������� �� ������ ��� ������� - ��� � ��� �� ����������)
                    	if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION && actIncome != null) {
	        				if (result != null && result.partId > 0) {
	    		                ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());
	    		                actIncomeLogic.validateActIncomeTechCondForMoveInFK(actIncome, caller);
	        				}
                    	}

                        servicesObject.statusRef.code = ENServicesObjectStatus.CLOSED;
                        servicesObject.prevContractStatus = servicesObject.contractStatusRef.code;
                        servicesObject.contractStatusRef.code = ENServicesContractStatus.CLOSED;
                        servicesObjectDAO.save(servicesObject);

                        /** ������ ��������� ���� */
                        if (actIncome != null) {
                            actIncome.statusRef.code = ENActIncomeStatus.CLOSED;
                            actIncomDao.save(actIncome);
                        }
                    }

                    /**  ������������� ���������� � ��  */
      		      	if (posting_move_mdax) {
      		      		axLogic.aifttscommit(_messageId);
      		      	}


          			long moveToFKEndTime = System.nanoTime();
        			long moveToFKTime = (moveToFKEndTime - moveToFKStartTime) / 1000000;

        			System.out.println("############# moveToFKTime = " + moveToFKTime
        					+ " :: " + servicesObject.contractNumberServices);

					//SUPP-93773
					/**
					 *  ҳ���� ��� ���������
                     *  ������� ������� ���� (���������� � ��)
					 *  ���������� �����
					 * */
					if ((servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION)
							&&(servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED)
							&&(servicesObject.contractStatusRef.code == ENServicesContractStatus.CLOSED)) {
						moveWfPack(servicesObjectCode);
					}

					// ����� ������ � justForCheck = true �������������, ��� ���� ������ � ���������,
					// � ������ ��������� ������ ��������� ��������.
					// ���� �� result.partId != Integer.MIN_VALUE, �� ���-�� ����� �� ���
					if (justForCheck) {
						if (result != null && result.partId > 0) {
							throw new SystemException("\n\nSUPP-100352 �� �������� ����������!");
						}
					}

                    return result;

                } else {
                    // � ������ �������� �������� � �������
                    /// ��� ����������� ��������� �� ������ ��������, �������� ������ ��������� ����

                    if (servicesObject.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY )
                    {

                        result = createPostings(servicesObject, datePostings, act1.dateAct, actIncomeServicesCode);

                    }
                    else
                    {
                        result.partId = Integer.MIN_VALUE;
                    }


                    for (int i=0; i < actArr.length; i++)
                    {
                        ENAct act = actDAO.getObject(actArr[i]);

                        if (act == null)
                        {
                            throw new SystemException("�� �������� ���������� ��� ��� ��'����! ��� ��'����: " + servicesObject.code);
                        }

                        /**
                         *  SUPP-6949... 10.09.2013 +++ �� ������������ ��� - ��������� ���� ����� ��������� ��������!!!
                         *  ��� ������������ �������� - �������� ���������� ��������� ����!!!!
                         */
                        if (act.statusRef.code != ENActStatus.CLOSED) {
                            if (act.statusRef.code != ENActStatus.SIGNATURE)
                            {
                                throw new SystemException("��� ���������� ������� ��������� ���������� ��� � " + act.numberGen + " �� " +
                                        new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen).toString() +
                                        " � ������ \"�� ��������\"! ��� ����: " + act.code);
                            }


                            if ((result.partId != Integer.MIN_VALUE) || (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY)  )
                            {
                                // �������� ��� ������
                                boolean isDebug = false;

                                if (!isDebug) {

                                    /**  ����� ���������� � �� ��� ������ �������� ���� */
                                	try {

                                		///// ���� �������� ���������� ���������, �������� ��������� ���
                                		Context cnt = new InitialContext();
                                		Object objRef = cnt.lookup(ENActController.JNDI_NAME);
                                		ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);

                                		ENActController actController = actHome.create();
                                		actController.close(act.code, 1);

                                		/////

									} catch (Exception ex) {

										if (posting_move_mdax) {
											axLogic.aifttsabort(_messageId);
										}

										throw new SystemException(ex.getMessage(), ex);
									}
								}
                            }

                        }

                    }



                    if (servicesObject.actIncomeCreatMetodRef.code == ENActIncomeCreatMetod.SINGLE) {

                    	if ((result.partId != Integer.MIN_VALUE) ||
                                (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY) || // ����������� ��������
                                (servicesObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES) // ������� �� ����� :(
                                )
                        {

                            // ������ ���. ������ �� "����������� � ��"
                            servicesObject.statusRef.code = ENServicesObjectStatus.CLOSED;
                            servicesObjectDAO.save(servicesObject);
                        }

                        // ����� �� ��������� ���� ������
                        ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(getUserProfile(), enConn);
                        ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
                        factCalcFilter.servicesObjectRef.code = servicesObject.code;
                        BigDecimal totalSum = new BigDecimal(0); // ����� � ��� � ��������� ����
                        int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
                        for (int i = 0; i < factCalcArr.length; i++) {
                           ENServicesFactCalc factCalcObj = factCalcDAO.getObject(factCalcArr[i]);
                           if (factCalcObj.totalSum != null)
                           totalSum = totalSum.add(factCalcObj.totalSum);
                        }

                        // ����� ��������� ������
                        ENPayment2SODAO paymentDAO = new ENPayment2SODAO(getUserProfile(), enConn);
                        ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
                        paymentFilter.servicesObjectRef.code = servicesObject.code;
                        paymentFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;
                        BigDecimal totalSumPrepay = new BigDecimal(0); // ����� � ��� �� ����������� ����������� ������� ��������� �������
                        int paymentArr[] = paymentDAO.getFilteredCodeArray(paymentFilter, 0, -1);
                        for (int i = 0; i < paymentArr.length; i++) {
                           ENPayment2SO paymentObj = paymentDAO.getObject(paymentArr[i]);
                           totalSumPrepay = totalSumPrepay.add(paymentObj.sumTotal);
                        }

                        // ��������� ������� � ������ "��������" ���� ����� ���������(� ���) = ����� �� ��������� ����(� ���) � �������� ����������
                        // ��� ( ������� ����������� � �������� �����)
                        // ��� ( ���������� �� ����� � �������� �����)
                        if (
                                (result.partId != Integer.MIN_VALUE &&
                                servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
                                totalSum.doubleValue() > 0 && // ����� �������� ������ 0
                                totalSum.doubleValue() == totalSumPrepay.doubleValue() ) // ����� � ��������� ���� ����� ��� ���������� ����������
                                || (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY && servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT )  // ����������� �������
                                || (servicesObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES && servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) // �������� ��������� �� ����� (
                                )
                        {
                            // �������� ������� ������ �������� (���� ����������� �������� ������ "��������")
                            servicesObject.prevContractStatus = servicesObject.contractStatusRef.code;
                            servicesObject.contractStatusRef.code = ENServicesContractStatus.CLOSED;
                            servicesObjectDAO.save(servicesObject);
                        }
                    }
                }


                /**  ������������� ���������� � ��  */
				if (posting_move_mdax) {
					axLogic.aifttscommit(_messageId);
				}


				long moveToFKEndTime = System.nanoTime();
				long moveToFKTime = (moveToFKEndTime - moveToFKStartTime) / 1000000;

				System.out.println("############# moveToFKTime = " + moveToFKTime
						+ " :: " + servicesObject.contractNumberServices);

				// ����� ������ � justForCheck = true �������������, ��� ���� ������ � ���������,
				// � ������ ��������� ������ ��������� ��������.
				// ���� �� result.partId != Integer.MIN_VALUE, �� ���-�� ����� �� ���
				if (justForCheck) {
					if (result != null && result.partId > 0) {
						throw new SystemException("\n\nSUPP-100352 �� �������� ����������!");
					}
				}

				return result;

			}

            /**  ������������� ���������� � ��  */
			if (posting_move_mdax) {
				axLogic.aifttscommit(_messageId);
			}


			long moveToFKEndTime = System.nanoTime();
			long moveToFKTime = (moveToFKEndTime - moveToFKStartTime) / 1000000;

			System.out.println("############# moveToFKTime = " + moveToFKTime
					+ " :: " + servicesObject.contractNumberServices);


			return result;

		} catch (DatasourceConnectException e) {
			throw new SystemException("������� ��'���� � ��!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
 			closeConnection();
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode) {
		deleteFromFK(servicesObjectCode, actIncomeServicesCode, null);
	}

	public void deleteFromFK(int servicesObjectCode, int actIncomeServicesCode, Object caller) {
		Connection enConn = null;
		Connection docFlowConn = null;

		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
			AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());

			String _messageId = "";

            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
            ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

            ///// �������� �� ������
            if (actIncomeServicesCode == Integer.MIN_VALUE) {
                if (servicesObject.statusRef.code != ENServicesObjectStatus.CLOSED) {
                    throw new SystemException("\n\n"
                    		+ "��� ������ �� �� ����������!");
                }
            }
            /////


            /** 30.07.2013 +++ ��� ������������� ��������� ���� �������� ������������ */
            boolean priconnections = false;
            if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());

            if (!priconnections) {
				ENAct act = servicesLogic.getActForServicesObject(servicesObject);
				if (act != null) {
					ActLogic actLogic = new ActLogic(enConn, getUserProfile());
					int dfDocCode = actLogic.getDFDocCodeForENAct(act.code);
	                if (dfDocCode > 0) {
	                	if (caller == null) {
	                    	throw new SystemException("\n\nNET-4596 ��� ����� ���������� ����� �������� ������� ������� ���������� " + 
	                    			"���'������� ����������� ����!\n" + "��� ����: " + act.code);
	                	}
	                }
				}
            }

            /**
             *  SUPP-6949... 10.09.2013 +++ �� ������������ ��� - ��������� ���� ����� ��������� ��������!!!
             *  ��� ������ �������� �������� ��� �� ����!!!
             *
             */  /*
            if (!priconnections) {
                // ��������� ��� //////////////////////////////////////////////////////////////////////////////////////////////////////

                ENActDAO actDAO = new ENActDAO(enConn, getUserProfile());

                ENActFilter actFilter = new ENActFilter();
                actFilter.element.code = servicesObject.element.code;
                actFilter.orderBySQL = "dategen desc";

                int[] actArr = actDAO.getFilteredCodeArray(actFilter, actFilter.conditionSQL,  actFilter.orderBySQL, 0, -1, null);

            if (actArr.length == 0)
            {
                throw new SystemException("�� �������� ���������� ��� ��� ��'����! ��� ��'����: "+ servicesObject.code);
            }


            for (int i=0; i < actArr.length; i++)
            {
                ENAct act = actDAO.getObject(actArr[i]);
                if (act == null)
                {
                    throw new SystemException("�� �������� ���������� ��� ��� ��'����! ��� ��'����: " + servicesObject.code);
                }

                if (act.statusRef.code != ENActStatus.CLOSED)
                {
                    throw new SystemException("���������� ��� � " + act.numberGen + " �� " +
                            new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen).toString() +
                            " �� ����������! ��� ����: " + act.code);
                }

                // �������� ��� ������
                boolean isDebug = false;

                if (!isDebug)
                {
                    ///// � ������ �������� ���������� ���������� ����
                    Context cnt = new InitialContext();
                    Object objRef = cnt.lookup(ENActController.JNDI_NAME);
                    ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);

                    ENActController actController = actHome.create();
                    actController.unClose(act.code, 0);
                    /////
                }

            }
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            */

            Boolean posting_move_mdax = false;

      	    if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_SERVICES_POSTING) ){
      		   posting_move_mdax = true;
      	    }

            /// ���� ���� ������� �� ��������
			if (posting_move_mdax) {
				_messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);
			}

            // ����� ������ ���������� ���� ������� �������� �� ��������
			if (servicesObject.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
				deletePostings(servicesObjectCode, actIncomeServicesCode);
			}


			if (servicesObject.actIncomeCreatMetodRef.code == ENActIncomeCreatMetod.SINGLE) {

	            // ������ ���. ������ �� "��������"
	            servicesObject.statusRef.code = ENServicesObjectStatus.GOOD;

	            ////////////////////////////////////////////////
	            // 19.11.12 NET-3079 ���� �� �������� ����� ������� "������ � �������������� ���������� ���������",
	            // �� ��� ������ ���������� ����� �������� ���������� ��� � ������ "��������� ��������� ������������"
	            if (servicesObject.isCustomerMaterials == 1)
	            {
	                servicesObject.statusRef.code = ENServicesObjectStatus.ACT_TRANSFER_CLOSED;
	            }
	            ////////////////////////////////////////////////

	            // ��� ������ ���������� ����� ����� ���������� � ����� ������ ���������� ������� (���� ��� �������� �� ����� �������� )
	            // ���� ���� ������������� ������ �� ��������� � ������ (��������� = 5 )
	            // ���� ������ ��������������� ����� �� ��� �������� � ����� �������� �� ����� �� � ������ "������ �������"
	            // ���� �� ���� �������� � ���� � ������������� �����  �� ���� �� ��������������� ������ ���� ����� � ������ "�������� ���������������� ���� "

	            if (servicesObject.contractStatusRef.code == ENServicesContractStatus.CLOSED ) {
	                // ������ ������ �������� �� ��� ������� ��� �� ���������� �����
					if (servicesObject.prevContractStatus == Integer.MIN_VALUE) {
						throw new SystemException("\n\n"
								+ "�� �������� ���������� ������ ��������! ��� ��'����: " + servicesObject.code);
					} else
						servicesObject.contractStatusRef.code = servicesObject.prevContractStatus;
				}


	            servicesObjectDAO.save(servicesObject);

			} else {

				ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(enConn, getUserProfile());
				ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServicesCode);
                actIncomeServices.statusRef.code = ENActIncomeStatus.GOOD;
                actIncomeServicesDao.save(actIncomeServices);
			}


            /** 30.07.2013 +++ ��� ������������� ������ ��������� ���� */
            if (priconnections) {
                ENActIncomeTechConditionsDAO actIncomDao = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);

                ENActIncomeTechConditionsFilter actIncomeFilter = new ENActIncomeTechConditionsFilter();
                actIncomeFilter.conditionSQL = " techcondservicesrefcod = ( " +
                       " select s2t.techcondservrefcode " +
                       " from enservicesobject2techcondtnsservices s2t " +
                       " where s2t.servicesobjectrefcode = " + servicesObject.code + " ) ";

                int actIncomeArr[] = actIncomDao.getFilteredCodeArray(actIncomeFilter, 0, -1);
                if (actIncomeArr.length > 0) {
                    ENActIncomeTechConditions actIncome = actIncomDao.getObject(actIncomeArr[0]);

                    // NET-4596 �������� �������� ���������� �������� � ����������������
            		ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());
                    int dfDocCode = actIncomeLogic.getDFDocCodeForENActIncomeTech(actIncome.code);
                    if (dfDocCode > 0) {
                    	// ������� ������ ��� � ������ "�� ����������"
                    	// (� �������� �� �������� ��� ������ actIncomeLogic.unSiganturedTech)
                        actIncome.statusRef.code = ENActIncomeStatus.SIGNATURE;
                        actIncomDao.save(actIncome);
                    	docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
                    	DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConn, getUserProfile());
                    	docSigningLogic.openDFDocMovementBySignerType(dfDocCode, DFDocSignerType.APPROVED, true, null, null);

                    	// ��� ������ ���������� ������ ���������� ��� � �������� ������ (�.�. ����� �� �������� ����������)
                    	actIncomeLogic.unSiganturedTech(actIncome.code);

                    	// �������� ����������������� ������
                    	servicesLogic.removeENSheetForENActIncomeTechCond(servicesObjectCode);
                    } else {
	                    actIncome.statusRef.code = ENActIncomeStatus.GOOD;
	                    actIncomDao.save(actIncome);
                    }
                }
            }


            // �������� ���������� AX
			if (posting_move_mdax) {
				axLogic.aifttscommit(_messageId);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException("������� ��'���� � ��!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();

			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}

            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}


	public FKProvResult createPostings(ENServicesObject servicesObject,
			Date docDate, Date actDate) {
		return createPostings(servicesObject, docDate, actDate, false, Integer.MIN_VALUE);
	}

	public FKProvResult createPostings(ENServicesObject servicesObject,
			Date docDate, Date actDate, int actIncomeServicesCode) {
		return createPostings(servicesObject, docDate, actDate, false, actIncomeServicesCode);
	}

	public FKProvResult createPostings(ENServicesObject servicesObject,
			Date docDate, Date actDate, boolean relaxation) {
		return createPostings(servicesObject, docDate, actDate, relaxation, Integer.MIN_VALUE);
	}

	public FKProvResult createPostings(ENServicesObject servicesObject,
			Date docDate, Date actDate, boolean relaxation, int actIncomeServicesCode) {
		Connection finConn = null;
		Connection enConn = null;

		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
            AXPostingLogic axpLogic = new AXPostingLogic(finConn, getUserProfile());
            AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());
            ENServicesObject2ProvDAO servicesObject2ProvDAO = new ENServicesObject2ProvDAO(getUserProfile(), enConn);
            ENGeneralContractsDAO genContractDAO = new ENGeneralContractsDAO(getUserProfile(), enConn);
            ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(enConn, getUserProfile());

            boolean priconnections = servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION;
            boolean project = servicesObject.contractTypeRef.code == ENServicesContractType.PROJECT;
            /** ��� ����������� (�����������/�������������) */
            int connectionType = Integer.MIN_VALUE;

            ENServicesObject2ProvFilter servicesObject2ProvFilter = new ENServicesObject2ProvFilter();
            servicesObject2ProvFilter.servicesObjectRef.code = servicesObject.code;
            ENServicesObject2ProvShortList so2pList = servicesObject2ProvDAO.getScrollableFilteredList(servicesObject2ProvFilter, 0, -1);


            /** SUPP-58594... 23.01.2017 +++ ��� ���������� ����� � ��������� � �� */
			if (servicesObject.generalContractRef.code == Integer.MIN_VALUE) {
				ContractLogic cLogic = new ContractLogic(enConn, getUserProfile());
				servicesObject.generalContractRef.code = cLogic
						.addByContractNumber(servicesObject.contractNumber, servicesObject.partnerCode, servicesObject.finDocCode, true, true);
			}

            ENGeneralContractsFilter genContractFilter = new ENGeneralContractsFilter();
            genContractFilter.code = servicesObject.generalContractRef.code;
            ENGeneralContractsShortList genContractList = genContractDAO.getScrollableFilteredList(genContractFilter, 0, -1);


            Boolean posting_move_mdax = false;

        	  if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_SERVICES_POSTING) ){
        		   posting_move_mdax = true;
        	  }

            /* ������ �������� mDAX*/
            String axContractGroupCode = "";

            if (genContractList.totalCount == 0 ) {
            	throw new SystemException(" ����������� ����� �� �������� ��/AX !!! ");
            } else {
            	servicesObject.partnerCode = genContractList.get(0).partnerCode;
            	servicesObject.finDocCode = genContractList.get(0).finDocCode;
            	servicesObject.contractNumber = genContractList.get(0).contractNumber;

            	servicesObject.axPartnerCode = genContractList.get(0).axPartnerCode;
            	servicesObject.axContractCode = genContractList.get(0).axContractCode; // ��� �������� ����� ��� �������� ��
            	servicesObject.axContractNumber = genContractList.get(0).axContractNumber;
            	servicesObject.axContractAccount = genContractList.get(0).axContractAccount; // ��� �������� Custtrans ���. ����� �������� ��

            	axContractGroupCode = genContractList.get(0).axContractGroupCode;

                if(posting_move_mdax && axContractGroupCode.equals("") ){
              	   throw new SystemException(" ������� ����� �������� AX !!! ");
                }

                /*ENServicesObjectFilter contractFilter = new ENServicesObjectFilter();
                contractFilter.axContractCode =servicesObject.axContractCode;
                ENServicesObjectShortList contractList = contractDAO.getContractList(contractFilter, 0, -1); // ��������� ���� ������ �� ��� �������� ���������
                if (contractList.totalCount > 0 ){
              	  axContractGroupCode = contractList.get(0).axContractGroupCode;
                }*/
            }


            if (so2pList.totalCount > 0)
            {
                throw new SystemException("��� ����� �������� ��� � �������� � Գ������! ��� �����: " + so2pList.get(0).partId);
            }




            //ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            //ENServicesObject servicesObject = soDAO.getObject(servicesObjectCode);

            //TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(getUserProfile(), enConn);
            TKClassificationTypeFilter ctFilter = new TKClassificationTypeFilter();
            ctFilter.conditionSQL = " tk.code in (" +
                                    " select ct.code \n" +
                                    " from enservicesobject so, enplanwork p,  \n" +
                                    "      enplanwork2classfctntp p2ct, tkclassificationtype ct \n" +
                                    " where so.code = " + servicesObject.code + " \n" +
                                    "   and p.kindcode = " + ENPlanWorkKind.CALCULATION + " \n" +
                                    "   and p.elementrefcode = so.elementcode \n" +
                                    "   and p2ct.planrefcode = p.code \n" +
                                    "   and p2ct.classificationtyperfcd = ct.code \n" +
                                    "  ) \n" ;
            TKClassificationTypeShortList ctList = ctDAO.getScrollableFilteredList(ctFilter, 0, -1);

            if (ctList.totalCount == 0)
            {
                throw new SystemException("��� ������ �� ������ ������ ����!");
            }

            for (int i = 0; i < ctList.totalCount; i++)
            {
                //if ((ctList.get(i).finWorkTypeFinCode == null) || (ctList.get(i).finWorkTypeFinCode == ""))
                if (ctList.get(i).finWorkTypeCode == Integer.MIN_VALUE)
                {
                    throw new SystemException("��� ������ (������������) \"" + ctList.get(i).kod + "  " + ctList.get(i).name + "\"" +
                                                        "\n �� �������� ��� ���� � ������! ���������� � Գ������ ���������!");
                }

                if ((ctList.get(i).finWorkTypeFinCode == null) || (ctList.get(i).finWorkTypeFinCode.equals("")))
                {
                    throw new SystemException("\n\n "
                    		+ "� �������� ���� ���� � ������ �� ������� ��� ���� ����.\n "
                    		+ "��� � ��������: " + ctList.get(i).finWorkTypeCode
                    		+ (!ctList.get(0).finWorkTypeName.equals("") ?  (" " + ctList.get(0).finWorkTypeName) : "" ) ) ;
                }

                if ((ctList.get(i).finWorkTypeAccount == null) || (ctList.get(i).finWorkTypeAccount.equals("")))
                {
                    throw new SystemException("\n\n "
                    		+ "� �������� ���� ���� � ������ (" + ctList.get(i).finWorkTypeFinCode + ") �� ������� ���. �������. \n"
                    		+ "��� � ��������: " + ctList.get(i).finWorkTypeCode);
                }
            }


            String finWorkTypeFinCode = ctList.get(0).finWorkTypeFinCode;
            String finWorkTypeName = ctList.get(0).finWorkTypeName;

            String axWorkTypeCode = ctList.get(0).axWorkTypeCode;
            String axWorkTypeName = ctList.get(0).axWorkTypeName;


            /** NET-4439... 14.02.2015 +++ ��������� � �������� �������� � 01.01.2015... */
            String A = "0"; // 4-� ���� ��� ����� 7913....
                            // ��� '30', '40', '80', '�0', '�0', '�0' - A == 1
            if (finWorkTypeFinCode.equals("30")
            		|| finWorkTypeFinCode.equals("40")
            		|| finWorkTypeFinCode.equals("80")
            		|| finWorkTypeFinCode.equals("�0")
            		|| finWorkTypeFinCode.equals("�0")
            		|| finWorkTypeFinCode.equals("�0")) {
            	A = "1";
            }

            // ��� �������
            String ax_A = "229000"; // 4-� ���� ��� ����� 7913....
            // ��� '30', '40', '80', '�0', '�0', '�0' - A == 1
			if (axWorkTypeCode.equals("2010035")
				|| axWorkTypeCode.equals("2010033")
				|| axWorkTypeCode.equals("2010030")
				|| axWorkTypeCode.equals("2010008")
				|| axWorkTypeCode.equals("2010020")
				|| axWorkTypeCode.equals("2010023")) {
			ax_A = "229001";
			}




            /** 04.02.2014 +++ ��� ������������� �� ��������� ���� �����... */
            if (!priconnections) {
                for (int i = 1; i < ctList.totalCount; i++)
                {
                    //if (ctList.get(i).finWorkTypeFinCode != finWorkTypeFinCode)
                    if (! ctList.get(i).finWorkTypeFinCode.equals(finWorkTypeFinCode))
                    {
                        throw new SystemException("� ��� ������ �������� ������, �� ����� ��� ���� � ��������! ���������� � Գ������ ���������!");
                    }
                }
            }

            //ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 15.05.13 NET-4235 ��� ����� ��������� ����� �� �������� ����� ���������� �� ������ �������!
            BigDecimal sumGen = new BigDecimal(0);
            BigDecimal vatSum = new BigDecimal(0);
            BigDecimal totalSum = new BigDecimal(0);

            String docNum = "";

            if (priconnections) {

                ENConnectionKindDAO cKindDao = new ENConnectionKindDAO(getUserProfile(), enConn);
                ENConnectionKindFilter cKindFilter = new ENConnectionKindFilter();
                cKindFilter.conditionSQL = " code = (select k.code " +
                        " from enservicesobject2techcondtnsservices s2t, entechconditionsservcs ts, enconnectionkind k " +
                        " where ts.code = s2t.techcondservrefcode " +
                        "   and ts.connectionkindrefcode = k.code " +
                        "   and s2t.servicesobjectrefcode = " + servicesObject.code + ")";

                int cArr[] = cKindDao.getFilteredCodeArray(cKindFilter, 0, -1);
                connectionType = cArr[0];

                if (connectionType == Integer.MIN_VALUE
                        || connectionType == ENConnectionKind.UNDEFINED) {
                    throw new SystemException("\n" +
                            "\n �� ��������� ��� ��������� �� ��������� �= " + servicesObject.contractNumberServices + "!!!");
                }


                /** 15.07.2013 +++ ��� ������������� ����� ����� � ��������� ���� */
                ENActIncomeTechConditionsDAO actIncomDao = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
                ENActIncomeTechConditionsFilter actIncomeFilter = new ENActIncomeTechConditionsFilter();
                actIncomeFilter.conditionSQL = " techcondservicesrefcod = ( " +
                        " select s2t.techcondservrefcode " +
                        " from enservicesobject2techcondtnsservices s2t " +
                        " where s2t.servicesobjectrefcode = " + servicesObject.code + " ) ";

                int actIncomeArr[] = actIncomDao.getFilteredCodeArray(actIncomeFilter, 0, -1);
                if (actIncomeArr.length > 0) {
                    ENActIncomeTechConditions actIncome = actIncomDao.getObject(actIncomeArr[0]);
                    sumGen = actIncome.summaGen.subtract(actIncome.summaVat);
                    vatSum = actIncome.summaVat;
                    totalSum = actIncome.summaGen;

                    /** SUPP-8557... 11.11.2013 +++ ��� ������������� ���� � ����� ����� � ��������� ���� */
                    actDate = actIncome.dategen;
                    docNum = actIncome.numbergen;

                } else {
                    throw new SystemException("\n" +
                            "\n �� �������� ����������� ���!!! ��� ��������: " + servicesObject.code);
                }

            } else if (servicesObject.actIncomeCreatMetodRef.code == ENActIncomeCreatMetod.MORE_ONE) {

            	ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServicesCode);

            	sumGen = actIncomeServices.summaGen.subtract(actIncomeServices.summaVat);
                vatSum = actIncomeServices.summaVat;
                totalSum = actIncomeServices.summaGen;

                actDate = actIncomeServices.dateGen;
                docNum = actIncomeServices.numberGen;

            } else {
                if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
                {
                    ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(getUserProfile(), enConn);
                    ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
                    calcFilter.conditionSQL = " ENCALCCONTRACTTOTAL.code in (" +
                                                " select c.code \n" +
                                                " from enservicesobject so, enplanwork p, encalccontracttotal c \n" +
                                                " where so.code = " + servicesObject.code + " \n" +
                                                "   and p.kindcode = " + ENPlanWorkKind.CALCULATION + " \n" +
                                                "   and p.elementrefcode = so.elementcode \n" +
                                                "   and c.planrefcode = p.code \n" +
                                                " ) \n";
                    ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

                    if (calcList.totalCount == 0)
                    {
                        throw new SystemException("�� �������� ���������� ��� ���������! (��� ��'����: " + servicesObject.code + ")");
                    }

                    if (calcList.totalCount > 1)
                    {
                        throw new SystemException("���������� ��� ��������� ����� ������! (��� ��'����: " + servicesObject.code + ")");
                    }

                    sumGen = calcList.get(0).costWithoutVAT;
                    vatSum = calcList.get(0).costVAT;
                    totalSum = calcList.get(0).totalCost;
                }
                else if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
                {
                    ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(getUserProfile(), enConn);
                    ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
                    factCalcFilter.servicesObjectRef.code = servicesObject.code;
                    ENServicesFactCalcShortList factCalcList = factCalcDAO.getScrollableFilteredList(factCalcFilter, 0, -1);

                    if (factCalcList.totalCount == 0)
                    {
                        throw new SystemException("\n\nNET-4235 �� �������� ��������� ���������� �������! (��� ��������: " + servicesObject.code + ")");
                    }

                    if (factCalcList.totalCount > 1)
                    {
                        throw new SystemException("\n\nNET-4235 ��������� ���������� ������� ����� ������! (��� ��������: " + servicesObject.code + ")");
                    }

                    sumGen = factCalcList.get(0).sumGen;
                    vatSum = factCalcList.get(0).vatSum;
                    totalSum = factCalcList.get(0).totalSum;

                    /** SUPP-20917... +++ ��� ������ ��������� ������� �������� ����������� ������ �������� ������ */
                    if (sumGen == null || vatSum == null || totalSum == null) {
                    	throw new SystemException("\n\n" +
                    			"NET-4235 �� �������� ��������� ���������� �������! (��� ��������: " + servicesObject.code + ")");
                    }
                }
                else
                {
                    throw new SystemException("\n\nNET-4235 �������� ��� ���������� ��� ��������! ��� ��������: " + servicesObject.code);
                }

            }


            /**
             * ��� ������ � ����������� ��������� ������ - ��� �� ����....
             */
            if (servicesObject.actIncomeCreatMetodRef.code == ENActIncomeCreatMetod.SINGLE) {
                // ����� � ������ �������� �������������� ������, ������� �� ������ � �����������
                ENServices2CalcAdditionalItemsDAO s2caiDAO = new ENServices2CalcAdditionalItemsDAO(getUserProfile(), enConn);
                ENServices2CalcAdditionalItemsFilter s2caiFilter = new ENServices2CalcAdditionalItemsFilter();
                s2caiFilter.servicesObjectRef.code = servicesObject.code;
                ENServices2CalcAdditionalItemsShortList s2caiList = s2caiDAO.getScrollableFilteredList(s2caiFilter, 0, -1);
                for (int brr=0;brr<s2caiList.totalCount;brr++) {
                	sumGen = sumGen.add(s2caiList.get(brr).summa);
                	vatSum = vatSum.add(s2caiList.get(brr).summa.multiply(new BigDecimal(0.2)).setScale(2, RoundingMode.HALF_UP));
                	totalSum = totalSum.add(s2caiList.get(brr).summa.multiply(new BigDecimal(1.2)).setScale(2, RoundingMode.HALF_UP)) ;
                }

                // ����� ���� ���������� ����������� ���� �� ������ � �� ����������� ��������
                ENPayment2SODAO paymentDAO = new ENPayment2SODAO(getUserProfile(), enConn);
                ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
                paymentSoFilter.servicesObjectRef.code = servicesObject.code;
                paymentSoFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;
                int[] paymentArr = paymentDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

                BigDecimal summPrepay = new BigDecimal(0); // ����� � ���
                for (int i = 0; i < paymentArr.length; i++) {
                    ENPayment2SO paymentSoObj = paymentDAO.getObject(paymentArr[i]);
                    summPrepay = summPrepay.add(paymentSoObj.sumTotal);
                }


                if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
                    servicesObject.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET &&
                    servicesObject.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY &&
                    summPrepay.doubleValue() == 0) {
                    throw new SystemException("\n SUPP-4100..."
                            + "\n \n ���������� ���������. ��������� ������� ��������� ������(������� \" ������� ������ \") !!!");
                }
            }


            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            //ENCalcContractTotal calc = calcDAO.getObject(calcList.get(0).code);

            /*
                    public FKProvResult createPostings4SideWorksWithoutPayment(String cehCode,            // ��� � ��� ����
                                                            String cehCodePodr,        // ��� � ��� ���� �� �������������
                                                            String finWorkTypeAccount, // �CCC - ���� �� ���� �����
                                                            String contragentFinCode,  // ���� - ��� �����������
                                                            String contractFinCode,    // ����� - ��� ��������
                                                            String finWorkTypeFinCode, // �� - ��� ���� ������
                                                            BigDecimal sumBase,        // ����� ��� ��� (����)
                                                            BigDecimal sumVAT,         // ���
                                                            BigDecimal sumTotal        // ����� ����� � ���
                                                        )    ;
        String V_Prov_Buffer = generateQuery4SideWorksWithoutPayment("000",              // ��� � ��� ����
                                                                    "000",              // ��� � ��� ���� �� �������������
                                                                    "3618",             // �CCC - ���� �� ���� �����
                                                                    "1177",             // ���� - ��� �����������
                                                                    "01014",            // ����� - ��� ��������
                                                                    finWorkTypeFinCode, // �� - ��� ���� ������
                                                                    sumBase,            // ����� ��� ��� (����)
                                                                    sumVAT,             // ���
                                                                    sumTotal            // ����� ����� � ���
                                                                    );
            */

            //ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            //ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
            //ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

            ///------- ���������� ��� ����
            // ������� �������� ���� (����� ����� � ���� �������������)

            ServicesLogic sLogic = new ServicesLogic(enConn, getUserProfile());
            ENBankingDetailsDAO bankingDetailsDao = new ENBankingDetailsDAO(enConn, getUserProfile());
            ENPlanWork currentPlan = sLogic.getPlanWorkCurrentByElementCode(servicesObject.element.code, priconnections);

            if (currentPlan == null)
            {
                throw new SystemException("�� �������� ������� ���� ��� ��'����! ��� ��'����: " + servicesObject.code);
            }

        	/** SUPP-30945... 07.04.2015... ������ �������� �� ������� � ������� �������� (������� �� ������������� ����)...*/
        	boolean replaceCounterServices = sLogic.checkReplaceCounterServices(servicesObject.element.code);



        	/*19.07.2021 SUPP-102098 ��������� � ������ ������������ ��������:
        	 * ������ ����������� ���� �� ������������� �� �����
        	 * ������ ������������� 000*/
            String cehCode = "000";
            String cehCodePodr = "000";

            String V_Prov_Buffer = "";

            AXLedgerTransShortList ledgerTransPostingPackList = null;
            AXCustTransShortList custTransPostingPackList = null;





            /**  NET-4469... 04.06.2015 +++ ������� � ���������....
             *   �������� �� ����� ��������
             */

         // ������� ����� ��������� �� �������� ( SUPP-86871 ���������� ���� �������� � �������������� ������ ������� �� ���� ������� ���������� �� ����� , ������� ���������� � ����� ������ )
            ENPayment2SOShortList p2soList = null;

            BigDecimal sumPrepayGen = new BigDecimal(0);
            BigDecimal sumPrepayVat = new BigDecimal(0);
            BigDecimal sumPrepayTotal = new BigDecimal(0);


            if (/* servicesObject.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT
                    && SUPP-88332 Energy.NET ������ �� ������� �� ���������� ����������� ���� ����� ������� �� ����� ���!!!!!!!!!!!!!!!  */!priconnections && !project) {
        		if ( servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT ){
        			p2soList = sLogic.getSumPrepayByServicesObject(servicesObject.code , ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT +","+ ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT);
        		} else {
        			p2soList = sLogic.getSumPrepayByServicesObject(servicesObject.code ,  ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT+"");
        		}
        		if (p2soList.totalCount>0){
        			if(p2soList.get(0).sumGen!=null){
        				sumPrepayGen = p2soList.get(0).sumGen.setScale(2, RoundingMode.HALF_UP);
        			}
                    if (sumPrepayGen == null ){sumPrepayGen = new BigDecimal(0);}
                    if(p2soList.get(0).sumVat!=null){
                    	sumPrepayVat = p2soList.get(0).sumVat.setScale(2, RoundingMode.HALF_UP);
                    }
                    if (sumPrepayVat == null ){sumPrepayVat = new BigDecimal(0);}
                    if(p2soList.get(0).sumTotal!=null){
                    	sumPrepayTotal = p2soList.get(0).sumTotal.setScale(2, RoundingMode.HALF_UP);
                    }
                    if (sumPrepayTotal == null ){sumPrepayTotal = new BigDecimal(0);}
        		}

        	}


            String userName = getUserNameForFK(servicesObject.code);


            String GG = ""; // ���������� 31_������_������(5-6��)_ � 01.02.2013. (�� ������ ����������� ����� ������������ )
            String X = ""; // 4- � ���� ��.361 : 5- ������ ��� ������ �� �������
                                            // 8- ������� ��� ����� �� �������
                                            // 6- ��� ����� �� �������������
            String HHHH = new String(""); // ��� �������� ����� (��������� ��  ����� )
            String DDDDD = new String(""); // ��� �������� � ������ (��������� ��  ����� )

         // ��������� �������� ��� ��� GG
            ENBankingDetails bankingDetails = bankingDetailsDao.getBankingDetailsByPodr(servicesObject.department.code, false);
            String bankingAccount = bankingDetails == null ? "" : String.valueOf(bankingDetails.bankaccount);
            if (bankingDetails != null) {
                GG = fpLogic.getGGForPosting(bankingDetails.bankaccount);
                // ��������� ��� �������� ����� � ��� �������� � ������
                HHHH = bankingDetails.partnercode;
                DDDDD = bankingDetails.contract;
            }

            if (relaxation) {
				V_Prov_Buffer = fpLogic.generateQuery4ServicesRelaxation(
						cehCode, cehCodePodr, servicesObject.partnerCode,
						servicesObject.finDocCode, finWorkTypeFinCode, sumGen,
						vatSum, totalSum,
						servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
						docDate, actDate, finWorkTypeName);

				if(posting_move_mdax){

					 ledgerTransPostingPackList = axpLogic.getLedgerTrans4ServicesRelaxation(
							cehCode,
							cehCodePodr,
							servicesObject.axPartnerCode,
							servicesObject.axContractCode,
							axWorkTypeCode,
							sumGen,
							vatSum,
							totalSum,
							servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
							docDate,
							actDate,
							axWorkTypeName);

					/* �������� �� ��������(CustTrans) */
					custTransPostingPackList = axpLogic.getCustTrans4ServicesRelaxation(
							cehCode,
							cehCodePodr,
							servicesObject.axPartnerCode,
							servicesObject.axContractCode,
							axWorkTypeCode,
							sumGen,
							vatSum,
							totalSum,
							servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
							docDate,
							actDate,
							axWorkTypeName ,
							axContractGroupCode ,
							servicesObject.axContractAccount

							);


				}

            } else {

            	if (servicesObject.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT
                        && !priconnections && !project) { // ���� �������� �� ������ ������� ��� ���������
                    if (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
                        servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET ||
                        servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT ||
                        servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NOREZIDENT)
                    {
                        V_Prov_Buffer =
                            fpLogic.generateQuery4SideWorksWithPayment(
                                    cehCode,
                                    cehCodePodr,
                                    ctList.get(0).finWorkTypeAccount,
                                    servicesObject.partnerCode,
                                    servicesObject.finDocCode,
                                    finWorkTypeFinCode,
                                    /////
                                    // 15.05.13 NET-4235 ������ ����� �� �������� ����� ���������� �� ������ ������!
                                    /*
                                    calcList.get(0).costWithoutVAT,
                                    calcList.get(0).costVAT,
                                    calcList.get(0).totalCost,
                                    */
                                    sumGen,
                                    vatSum,
                                    totalSum,
                                    /////
                                    servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                    //act.dateGen,
                                    docDate,
                                    actDate,
                                    finWorkTypeName,
                                    A,
                                    replaceCounterServices ,
                                    sumPrepayTotal,
                                    GG,
                                    HHHH,
                                    userName
                                    );


                        if(posting_move_mdax){

       					 ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksWithPayment(
       							cehCode,
                                cehCodePodr,
                                ctList.get(0).finWorkTypeAccount,
                                servicesObject.axPartnerCode,
                                servicesObject.axContractCode,
                                axWorkTypeCode,
                                sumGen,
                                vatSum,
                                totalSum,
                                servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                docDate,
                                actDate,
                                axWorkTypeName,
                                ax_A
                                );

       					/* �������� �� ��������(CustTrans) */
       					custTransPostingPackList = axpLogic.getCustTrans4SideWorksWithPayment(
       							cehCode,
                                cehCodePodr,
                                ctList.get(0).finWorkTypeAccount,
                                servicesObject.axPartnerCode,
                                servicesObject.axContractCode,
                                axWorkTypeCode,
                                sumGen,
                                vatSum,
                                totalSum,
                                servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                docDate,
                                actDate,
                                axWorkTypeName,
                                ax_A ,
                                axContractGroupCode ,
                                servicesObject.axContractAccount

                                );


       				}

                    }
                    else if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                    {
                        V_Prov_Buffer =
                            fpLogic.generateQuery4SideWorksWithoutPayment(
                                    cehCode,
                                    cehCodePodr,
                                    ctList.get(0).finWorkTypeAccount,
                                    servicesObject.partnerCode,
                                    servicesObject.finDocCode,
                                    finWorkTypeFinCode,
                                    /////
                                    // 15.05.13 NET-4235 ������ ����� �� �������� ����� ���������� �� ������ ������!
                                    /*
                                    calcList.get(0).costWithoutVAT,
                                    calcList.get(0).costVAT,
                                    calcList.get(0).totalCost,
                                    */
                                    sumGen,
                                    vatSum,
                                    totalSum,
                                    /////
                                    servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                    //act.dateGen,
                                    docDate,
                                    actDate,
                                    finWorkTypeName,
                                    A ,
                                    sumPrepayTotal,
                                    GG,
                                    HHHH,
                                    userName
                                    );

                        if(posting_move_mdax){

          					 ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksWithoutPayment(
          						   cehCode,
                                   cehCodePodr,
                                   ctList.get(0).finWorkTypeAccount,
                                   servicesObject.axPartnerCode,
                                   servicesObject.axContractCode,
                                   axWorkTypeCode,
                                   sumGen,
                                   vatSum,
                                   totalSum,
                                   servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                   docDate,
                                   actDate,
                                   axWorkTypeName,
                                   ax_A
                                   );

          					/* �������� �� ��������(CustTrans) */
          					custTransPostingPackList = axpLogic.getCustTrans4SideWorksWithoutPayment(
          							cehCode,
                                   cehCodePodr,
                                   ctList.get(0).finWorkTypeAccount,
                                   servicesObject.axPartnerCode,
                                   servicesObject.axContractCode,
                                   axWorkTypeCode,
                                   sumGen,
                                   vatSum,
                                   totalSum,
                                   servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                   docDate,
                                   actDate,
                                   axWorkTypeName,
                                   ax_A ,
                                   axContractGroupCode ,
                                   servicesObject.axContractAccount
                                   );


          				}

                    }
                    else
                    {
                        throw new SystemException("�������� ��� �����������!");
                    }

                  } else // �������� � ������������
                  {

                    String AA = "";  // AA- ��� ����� ������������� = 13 ��� ����� �� ������� = 33
                    String Y = "";   // Y - ������ �� �������� = 9 ������ �� ������������� = 6
                    String BB = "";  // ���������� 2007 643,644,6412(5-6����) ������ �� ������� ��=10 ������ �� ������������� = 17
                    String FF = "";  // ��� ����� ������������� = 11 ��� ����� �� ������� = 13
                    String CCC = ""; // ���������� 2006 79 ��� ����� ������������� = 111 ��� ����� �� ������� = 110
                    String HH = "";  // ��� ���� ������
                    String HH_AX = "";  // ��� ���� ������ mDAX

                    String CCC_AX = ""; // ���������� AX  ����� ������

                    if (priconnections) {
                        AA = new String("13");
                        Y = new String("6");

                        /** SUPP-29904.. ��������� � 01.01.2015... */
                        //BB = new String("17");
                        BB = new String("�0");

                        FF = new String("11");
                        CCC = new String("111");
                        CCC_AX =  new String("12000111"); // spr. 2006 79 name. ��������� ���������� ���.����� � �����(�������������)

                        /** ��� ����������� (�����������/�������������) */
                        if (connectionType == ENConnectionKind.STANDART) {
                            HH = new String("��");
                            HH_AX = new String("2010003"); // poka 3 analit cel
                        } else {
                            HH = new String("��");
                            HH_AX = new String("2010015"); // poka 3 analit cel
                        }

                        finWorkTypeName = "������� � ���������";
                    } else {
                        AA = new String("33");
                        Y = new String("9");
                        BB = new String("10");
                        FF = new String("13");
                        CCC = new String("110");
                        CCC_AX = new String("12000110");//  spr =  2006 79   name = ��������� ���������� ����� � �����
                        HH = ctList.get(0).finWorkTypeAccount;
                        HH_AX = ctList.get(0).finWorkTypeAccount;
                    }

                   // String GG = ""; // ���������� 31_������_������(5-6��)_ � 01.02.2013. (�� ������ ����������� ����� ������������ )
                   // String X = ""; // 4- � ���� ��.361 : 5- ������ ��� ������ �� �������
                                                    // 8- ������� ��� ����� �� �������
                                                    // 6- ��� ����� �� �������������
                   // String HHHH = new String(""); // ��� �������� ����� (��������� ��  ����� )
                  //  String DDDDD = new String(""); // ��� �������� � ������ (��������� ��  ����� )



                    // ��������� �������� ��� ��� GG
                    /*ENBankingDetails*/ bankingDetails = bankingDetailsDao.getBankingDetailsByPodr(servicesObject.department.code, false);
                    /*String */ bankingAccount = bankingDetails == null ? "" : String.valueOf(bankingDetails.bankaccount);
                    if (bankingDetails != null) {
                        GG = fpLogic.getGGForPosting(bankingDetails.bankaccount);
                        // ��������� ��� �������� ����� � ��� �������� � ������
                        HHHH = bankingDetails.partnercode;
                        DDDDD = bankingDetails.contract;
                    }

                    // ��������� �������� ��� ��� X (��������� ���� ����� �� ����������� ����� ����� ������������)
                    /** SUPP-5830... +++ � � 4-� ���� ��.361 : 6- ��� ����� �� ������������� */
                    if (priconnections) {
                        X = "6";
                    } else {
                        X = ctList.get(0).finWorkTypeAccount.substring(3);
                    }

                    /** SUPP-6387... � �������, ������������ ��� ����� ��������� ���������� */
                    if (HHHH == null || HHHH.equals("")) {
                        throw new SystemException("\n SUPP-6387..." +
                                "\n ������� ��� ��������� ����� �������� ��� ��������, ����������� � �������!!!");
                    }

                    if (DDDDD == null || DDDDD.equals("")) {
                        throw new SystemException("\n SUPP-6387..." +
                                "\n ������� ��� ��������� ����� �������� ��� ��������, ����������� � �������!!!");
                    }




                    /*++++ supp-59397 start ������ �� �������������� */
                    if (project) {

                          BigDecimal projAgrSum = servicesObject.projAgreeSumma;
                          if (projAgrSum == null ){projAgrSum = new BigDecimal(0);}

                          BigDecimal topoSum = servicesObject.topographySumma;
                          if (topoSum == null ){topoSum = new BigDecimal(0);}

                    	   BigDecimal sumGenOveral = sumGen.add(projAgrSum).add(topoSum);
                    	   BigDecimal sumVatOveral = vatSum.add(projAgrSum.divide(new BigDecimal(5)).setScale(2,java.math.BigDecimal.ROUND_HALF_UP))
                    			                           .add(topoSum.divide(new BigDecimal(5)).setScale(2,java.math.BigDecimal.ROUND_HALF_UP));
                    	   BigDecimal totalSumOveral = sumGenOveral.add(sumVatOveral);


                            V_Prov_Buffer =   fpLogic.generateQuery4SideProject(
                                    cehCode,
                                    cehCodePodr,
                                    HH,
                                    servicesObject.partnerCode,
                                    servicesObject.finDocCode,
                                    finWorkTypeFinCode,
                                    sumGenOveral,
                                    sumVatOveral,
                                    totalSumOveral,
                                    /////
                                    servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                    docDate,
                                    actDate,
                                    finWorkTypeName,
                                    userName
                                    );

			                            if(posting_move_mdax){
			             					 ledgerTransPostingPackList = axpLogic.getLedgerTrans4Project(
			             							cehCode,
			                                        cehCodePodr,
			                                        HH_AX,
			                                        servicesObject.axPartnerCode,
			                                        servicesObject.axContractCode,
			                                        axWorkTypeCode,
			                                        sumGenOveral,
			                                        sumVatOveral,
			                                        totalSumOveral,
			                                        docNum,
			                                        docDate,
			                                        actDate,
			                                        axWorkTypeName,
			                                        AA,
			                                        X,
			                                        BB,
			                                        FF,
			                                        CCC_AX,
			                                        Y,
			                                        sumPrepayTotal,
			                                        GG
			                                      );

			             					/* �������� �� ��������(CustTrans) */
			             					custTransPostingPackList = axpLogic.getCustTrans4Project(
			             							cehCode,
			                                        cehCodePodr,
			                                        HH,
			                                        servicesObject.axPartnerCode,
			                                        servicesObject.axContractCode,
			                                        axWorkTypeCode,
			                                        sumGenOveral,
			                                        sumVatOveral,
			                                        totalSumOveral,
			                                        docNum,
			                                        docDate,
			                                        actDate,
			                                        axWorkTypeName,
			                                        AA,
			                                        X,
			                                        BB,
			                                        FF,
			                                        CCC_AX,
			                                        Y,
			                                        sumPrepayTotal,
			                                        GG ,
			                                        axContractGroupCode ,
			                                        servicesObject.axContractAccount
			                                      );


			             				}

                    } else
                    /* end ----------- ������ �� �������������� */
                    if (priconnections) {

                    	/** 24.06.2021... ��� ��� energynet  */
                    	// String userName = getUserNameForFK(servicesObject.code);
                    	userName = "energynet";

                        /** ������ �� ������������� */
                            V_Prov_Buffer = fpLogic.generateQuery4Connections(cehCode,
                                    cehCodePodr, HH, servicesObject.partnerCode,
                                    servicesObject.finDocCode, finWorkTypeFinCode,
                                    sumGen, vatSum, totalSum,
                                    //servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                    docNum,
                                    docDate, actDate, finWorkTypeName, AA, X, BB, FF,
                                    CCC, Y, sumPrepayTotal, GG,
                                    userName);

                            if(posting_move_mdax){

             					 ledgerTransPostingPackList = axpLogic.getLedgerTrans4Connections(
             							cehCode,
                                        cehCodePodr,
                                        HH_AX,
                                        servicesObject.axPartnerCode,
                                        servicesObject.axContractCode,
                                        axWorkTypeCode,
                                        sumGen,
                                        vatSum,
                                        totalSum,
                                        docNum,
                                        docDate,
                                        actDate,
                                        axWorkTypeName,
                                        AA,
                                        X,
                                        BB,
                                        FF,
                                        CCC_AX,
                                        Y,
                                        sumPrepayTotal,
                                        GG
                                      );

             					/* �������� �� ��������(CustTrans) */
             					custTransPostingPackList = axpLogic.getCustTrans4Connections(
             							cehCode,
                                        cehCodePodr,
                                        HH,
                                        servicesObject.axPartnerCode,
                                        servicesObject.axContractCode,
                                        axWorkTypeCode,
                                        sumGen,
                                        vatSum,
                                        totalSum,
                                        docNum,
                                        docDate,
                                        actDate,
                                        axWorkTypeName,
                                        AA,
                                        X,
                                        BB,
                                        FF,
                                        CCC_AX,
                                        Y,
                                        sumPrepayTotal,
                                        GG ,
                                        axContractGroupCode ,
                                        servicesObject.axContractAccount
                                      );


             				}

                    } else {


                    	if (replaceCounterServices) {

                    		AA = "15";
                    		finWorkTypeFinCode = "��";
                    		X = "8";
                    		FF = "11";
                    		Y = "9";
                        }


                    	/* 1 ������� �������� (����� ������ ����� ����� � ��������� ���� )*/
                        if (totalSum.doubleValue() == sumPrepayTotal.doubleValue() ) {
                        V_Prov_Buffer =
                              fpLogic.generateQuery4SideWorksAvansEqualsActReceipt(
                                      cehCode,
                                      cehCodePodr,
                                      HH,
                                      servicesObject.partnerCode,
                                      servicesObject.finDocCode,
                                      finWorkTypeFinCode,
                                      sumGen,
                                      vatSum,
                                      totalSum,
                                      /////
                                      servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                      //act.dateGen,
                                      docDate,
                                      actDate,
                                      finWorkTypeName ,
                                      AA ,
                                      X ,
                                      BB,
                                      FF,
                                      CCC,
                                      Y,
                                      sumPrepayTotal,
                                      A,
                                      userName
                                      );

	                        if(posting_move_mdax){

	                        	ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksAvansEqualsActReceipt(
	                                            cehCode,
	                                            cehCodePodr,
	                                            HH,
	                                            servicesObject.axPartnerCode,
	                                            servicesObject.axContractCode ,
	                                            axWorkTypeCode,
	                                            sumGen,
	                                            vatSum,
	                                            totalSum,
	                                            /////
	                                            servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
	                                            docDate,
	                                            actDate,
	                                            axWorkTypeName ,
	                                            AA ,
	                                            X ,
	                                            BB,
	                                            FF,
	                                            CCC_AX,
	                                            Y,
	                                            sumPrepayTotal,
	                                            ax_A
	                                            );

	                        	custTransPostingPackList = axpLogic.getCustTrans4SideWorksAvansEqualsActReceipt(
                                        cehCode,
                                        cehCodePodr,
                                        HH,
                                        servicesObject.axPartnerCode,
                                        servicesObject.axContractCode,
                                        axWorkTypeCode,
                                        sumGen,
                                        vatSum,
                                        totalSum,
                                        /////
                                        servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
                                        docDate,
                                        actDate,
                                        axWorkTypeName ,
                                        AA ,
                                        X ,
                                        BB,
                                        FF,
                                        CCC_AX,
                                        Y,
                                        sumPrepayTotal,
                                        ax_A,
                                        axContractGroupCode ,
                                        servicesObject.axContractAccount
                                        );
                        }

                        }
                        /*2 ������� �������� (����� ������ ������ ����� � ��������� ���� )*/
                        else if (totalSum.doubleValue() > sumPrepayTotal.doubleValue() && sumPrepayTotal.doubleValue() > 0 ) {
                            V_Prov_Buffer =
                                 fpLogic.generateQuery4SideWorksAvansLowerActReceipt(
                                         cehCode,
                                         cehCodePodr,
                                         HH,
                                         servicesObject.partnerCode,
                                         servicesObject.finDocCode,
                                         finWorkTypeFinCode,
                                         sumGen,
                                         vatSum,
                                         totalSum,
                                         /////
                                         servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                         //act.dateGen,
                                         docDate,
                                         actDate,
                                         finWorkTypeName ,
                                         AA ,
                                         X ,
                                         BB,
                                         FF,
                                         CCC,
                                         Y,
                                         sumPrepayTotal,
                                         A,
                                         userName
                                         );

                            if(posting_move_mdax){
	                        	ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksAvansLowerActReceipt(
	                                            cehCode,
	                                            cehCodePodr,
	                                            HH,
	                                            servicesObject.axPartnerCode,
	                                            servicesObject.axContractCode ,
	                                            axWorkTypeCode,
	                                            sumGen,
	                                            vatSum,
	                                            totalSum,
	                                            /////
	                                            servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
	                                            docDate,
	                                            actDate,
	                                            axWorkTypeName ,
	                                            AA ,
	                                            X ,
	                                            BB,
	                                            FF,
	                                            CCC_AX,
	                                            Y,
	                                            sumPrepayTotal,
	                                            ax_A
	                                            );

	                        	custTransPostingPackList = axpLogic.getCustTrans4SideWorksAvansLowerActReceipt(
                                        cehCode,
                                        cehCodePodr,
                                        HH,
                                        servicesObject.axPartnerCode,
                                        servicesObject.axContractCode,
                                        axWorkTypeCode,
                                        sumGen,
                                        vatSum,
                                        totalSum,
                                        /////
                                        servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
                                        docDate,
                                        actDate,
                                        axWorkTypeName ,
                                        AA ,
                                        X ,
                                        BB,
                                        FF,
                                        CCC_AX,
                                        Y,
                                        sumPrepayTotal,
                                        ax_A,
                                        axContractGroupCode,
                                        servicesObject.axContractAccount
                                        );
                        }

                        }
                        /*3 ������� �������� (����� ������ ������ ����� � ��������� ���� )*/

                        else if (totalSum.doubleValue() < sumPrepayTotal.doubleValue() ) {
                            if (GG.equals("")){
                                throw new SystemException("������� ��� ��������� 5-6 �� ��� !");
                            }
                            V_Prov_Buffer =
                                 fpLogic.generateQuery4SideWorksAvansOverActReceipt(
                                         cehCode,
                                         cehCodePodr,
                                         HH,
                                         servicesObject.partnerCode,
                                         servicesObject.finDocCode,
                                         finWorkTypeFinCode,
                                         sumGen,
                                         vatSum,
                                         totalSum,
                                         /////
                                         servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                         //act.dateGen,
                                         docDate,
                                         actDate,
                                         finWorkTypeName ,
                                         AA ,
                                         X ,
                                         BB,
                                         FF,
                                         CCC,
                                         Y,
                                         sumPrepayTotal,
                                         GG,
                                         HHHH,
                                         DDDDD,
                                         A,
                                         userName
                                         );
                            if(posting_move_mdax){
			                        	ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksAvansOverActReceipt(
		                                         cehCode,
		                                         cehCodePodr,
		                                         HH,
		                                         servicesObject.axPartnerCode,
		                                         servicesObject.axContractCode,
		                                         axWorkTypeCode,
		                                         sumGen,
		                                         vatSum,
		                                         totalSum,
		                                         /////
		                                         servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
		                                         docDate,
		                                         actDate,
		                                         axWorkTypeName ,
		                                         AA ,
		                                         X ,
		                                         BB,
		                                         FF,
		                                         CCC_AX,
		                                         Y,
		                                         sumPrepayTotal,
		                                         GG,
		                                         HHHH,
		                                         DDDDD,
		                                         ax_A ,
		                                         bankingAccount
		                                         );

			                        	custTransPostingPackList = axpLogic.getCustTrans4SideWorksAvansOverActReceipt(
			                        			cehCode,
		                                         cehCodePodr,
		                                         HH,
		                                         servicesObject.axPartnerCode,
		                                         servicesObject.axContractCode,
		                                         axWorkTypeCode,
		                                         sumGen,
		                                         vatSum,
		                                         totalSum,
		                                         /////
		                                         servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
		                                         docDate,
		                                         actDate,
		                                         axWorkTypeName ,
		                                         AA ,
		                                         X ,
		                                         BB,
		                                         FF,
		                                         CCC_AX,
		                                         Y,
		                                         sumPrepayTotal,
		                                         GG,
		                                         HHHH,
		                                         DDDDD,
		                                         ax_A ,
		                                         axContractGroupCode ,
		                                         servicesObject.axContractAccount
		                                         );
		                        }

                        }
                        /*4 ������� �������� (��������� ������ �� ������� ��� ������(������) )*/
                        else if ( sumPrepayTotal.doubleValue() == 0 ){
                            V_Prov_Buffer =
                                 fpLogic.generateQuery4SideWorksWithoutAvans(
                                         cehCode,
                                         cehCodePodr,
                                         HH,
                                         servicesObject.partnerCode,
                                         servicesObject.finDocCode,
                                         finWorkTypeFinCode,
                                         sumGen,
                                         vatSum,
                                         totalSum,
                                         /////
                                         servicesObject.contractNumberServices + "/" + servicesObject.contractNumber,
                                         //act.dateGen,
                                         docDate,
                                         actDate,
                                         finWorkTypeName ,
                                         AA ,
                                         X ,
                                         BB,
                                         FF,
                                         CCC,
                                         Y,
                                         sumPrepayTotal,
                                         GG,
                                         A,
                                         userName
                                         );


			                            if(posting_move_mdax){
			                        	ledgerTransPostingPackList = axpLogic.getLedgerTrans4SideWorksWithoutAvans(
			                                    cehCode,
			                                    cehCodePodr,
			                                    HH,
			                                    servicesObject.axPartnerCode,
			                                    servicesObject.axContractCode,
			                                    axWorkTypeCode,
			                                    sumGen,
			                                    vatSum,
			                                    totalSum,
			                                    /////
			                                    servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
			                                    docDate,
			                                    actDate,
			                                    axWorkTypeName ,
			                                    AA ,
			                                    X ,
			                                    BB,
			                                    FF,
			                                    CCC_AX,
			                                    Y,
			                                    sumPrepayTotal,
			                                    GG,
			                                    ax_A
			                                    );

			                       	custTransPostingPackList = axpLogic.getCustTrans4SideWorksWithoutAvans(
			                       			cehCode,
		                                    cehCodePodr,
		                                    HH,
		                                    servicesObject.axPartnerCode,
		                                    servicesObject.axContractCode,
		                                    axWorkTypeCode,
		                                    sumGen,
		                                    vatSum,
		                                    totalSum,
		                                    /////
		                                    servicesObject.contractNumberServices + "/" + servicesObject.axContractNumber,
		                                    docDate,
		                                    actDate,
		                                    axWorkTypeName ,
		                                    AA ,
		                                    X ,
		                                    BB,
		                                    FF,
		                                    CCC_AX,
		                                    Y,
		                                    sumPrepayTotal,
		                                    GG,
		                                    ax_A,
		                                    axContractGroupCode ,
		                                    servicesObject.axContractAccount
		                                    );
			                            }

                        }
                    }
                 }
            }




            FKProvResult provResult = new FKProvResult();
            /*
            provResult = fpLogic.createPostings4SideWorksWithoutPayment(cehCode, //"000",
                                                                        cehCodePodr, //"000",
                                                                            ctList.get(0).finWorkTypeAccount,
                                                                            servicesObject.partnerCode,
                                                                            servicesObject.finDocCode,
                                                                            finWorkTypeFinCode,
                                                                        calcList.get(0).costWithoutVAT,
                                                                        calcList.get(0).costVAT,
                                                                        calcList.get(0).totalCost);
            */

            /*
            provResult = fpLogic.createPostings(
                    fpLogic.generateQuery4SideWorksWithoutPayment(
                            cehCode, //"000",
                            cehCodePodr, //"000",
                            ctList.get(0).finWorkTypeAccount,
                            servicesObject.partnerCode,
                            servicesObject.finDocCode,
                            finWorkTypeFinCode,
                            calcList.get(0).costWithoutVAT,
                            calcList.get(0).costVAT,
                            calcList.get(0).totalCost,
                            servicesObject.contractNumber,
                            //act.dateGen,
                            servicesObject.contractDateServices, // ����� ����� ���� ����
                            finWorkTypeName
                            )
                      );
              */

            if (V_Prov_Buffer != "")
            {
                provResult = fpLogic.createPostings(V_Prov_Buffer);
            }
            else
            {
                throw new SystemException("�� ��������� ������ ��������!");
            }

            String retVouchermDAX = "";



            if (posting_move_mdax){

            	/**  ������������� �������� ���������� � ��  */
	    		/*_messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);*/

            	retVouchermDAX = axpLogic.movePostingToAX(ledgerTransPostingPackList , custTransPostingPackList);

            }


			if (provResult.partId > Integer.MIN_VALUE || !retVouchermDAX.equals("")) {

				if (servicesObject.actIncomeCreatMetodRef.code == ENActIncomeCreatMetod.MORE_ONE) {

					ENActIncomServ2ProvDAO actIncomServ2ProvDao = new ENActIncomServ2ProvDAO(enConn, getUserProfile());

					ENActIncomServ2Prov actIncomServ2Prov = new ENActIncomServ2Prov();
					actIncomServ2Prov.actIncomeRef.code = actIncomeServicesCode;
					actIncomServ2Prov.partId = provResult.partId;

					actIncomServ2Prov.datePosting = docDate;
					actIncomServ2Prov.voucher = retVouchermDAX;

					String badprovstring = " �� - ��� ������ ";
					if (provResult.badProvList.totalCount > 0) {
						badprovstring = "  ������ �� :  ";
						for (int b = 0; b < provResult.badProvList.totalCount; b++) {
							badprovstring = badprovstring
	                				+  " ����� ������ = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
	                				+  "\n ����������  = " + provResult.badProvList.get(b).primechan
	                				+    "\n  bal_ceh " + provResult.badProvList.get(b).bal_ceh
	                				+    "  bal_kau " + provResult.badProvList.get(b).bal_kau
	                				+    "  bal_sch " + provResult.badProvList.get(b).bal_sch
	                				+    "  bal_sub_sch " + provResult.badProvList.get(b).bal_sub_sch
	                				+    "\n  kor_ceh " + provResult.badProvList.get(b).kor_ceh
	                				+    "  kor_kau " + provResult.badProvList.get(b).kor_kau
	                				+    "  kor_sch " + provResult.badProvList.get(b).kor_sch
	                				+    "  kor_sub_sch " + provResult.badProvList.get(b).kor_sub_sch;
						}

						throw new SystemException(badprovstring);
					}

					actIncomServ2ProvDao.add(actIncomServ2Prov);


	                ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServicesCode);
	                actIncomeServices.statusRef.code = ENActIncomeStatus.CLOSED;
	                actIncomeServicesDao.save(actIncomeServices);

				} else {
					ENServicesObject2Prov servicesObject2Prov = new ENServicesObject2Prov();
					servicesObject2Prov.servicesObjectRef.code = servicesObject.code;
					servicesObject2Prov.partId = provResult.partId;

	                /** SUPP-7343... 25.09.2013 +++ ��� ����� ��������� ���� ���������� (�������� ��������) */
					servicesObject2Prov.datePosting = docDate;
					servicesObject2Prov.voucher = retVouchermDAX;

					String badprovstring = " �� - ��� ������ ";
					if (provResult.badProvList.totalCount > 0) {
						badprovstring = "  ������ �� :  ";
						for (int b = 0; b < provResult.badProvList.totalCount; b++) {
							badprovstring = badprovstring
	                				+  " ����� ������ = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
	                				+  "\n ����������  = " + provResult.badProvList.get(b).primechan
	                				+    "\n  bal_ceh " + provResult.badProvList.get(b).bal_ceh
	                				+    "  bal_kau " + provResult.badProvList.get(b).bal_kau
	                				+    "  bal_sch " + provResult.badProvList.get(b).bal_sch
	                				+    "  bal_sub_sch " + provResult.badProvList.get(b).bal_sub_sch
	                				+    "\n  kor_ceh " + provResult.badProvList.get(b).kor_ceh
	                				+    "  kor_kau " + provResult.badProvList.get(b).kor_kau
	                				+    "  kor_sch " + provResult.badProvList.get(b).kor_sch
	                				+    "  kor_sub_sch " + provResult.badProvList.get(b).kor_sub_sch;
						}

						throw new SystemException(badprovstring);
					}

					System.out.print("\n \n \n hernya partid badprovstring =  " + provResult.partId + " error provResult = " + badprovstring);

					servicesObject2ProvDAO.add(servicesObject2Prov);
				}
			}

			return provResult;

		} catch (DatasourceConnectException e) {
			throw new SystemException("�� ������� �������� ��������! ���� ��'���� � Գ�������!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}

			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


	public void deletePostings(int servicesObjectCode, int actIncomeServicesCode) {
		Connection finConn = null;
		Connection enConn = null;

		try {

			ENServicesObject2ProvDAO servicesObject2ProvDAO = new ENServicesObject2ProvDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActIncomServ2ProvDAO actIncomServ2ProvDao = new ENActIncomServ2ProvDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


			if (actIncomeServicesCode != Integer.MIN_VALUE) {

				ENActIncomServ2ProvFilter actIncomServ2ProvFilter = new ENActIncomServ2ProvFilter();
				actIncomServ2ProvFilter.actIncomeRef.code = actIncomeServicesCode;
				ENActIncomServ2ProvShortList actIncomServ2ProvShortList = actIncomServ2ProvDao.getScrollableFilteredList(actIncomServ2ProvFilter, 0, -1);

				if (actIncomServ2ProvShortList.totalCount != 0) {
					if (actIncomServ2ProvShortList.totalCount > 1) {
						throw new SystemException("\n\n"
								+ "�������� ������� (" + actIncomServ2ProvShortList.totalCount + ") ����� �������� ��� ����� ����!");
					}

					finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
					enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
					FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

					int partId = actIncomServ2ProvShortList.get(0).partId;
					String voucher = actIncomServ2ProvShortList.get(0).voucher;

					if (partId == Integer.MIN_VALUE) {
						throw new SystemException("\n\n"
								+ "�� ������� ��� ����� ��������!");
					}

					actIncomServ2ProvDao.remove(actIncomServ2ProvShortList.get(0).code);

					fpLogic.deleteProv(partId, getUserProfile().userName);

					if (voucher != null) {
						if (!voucher.equals("")) {

							LedgerTransksActions ltAct = new LedgerTransksActions(enConn, getUserProfile());
							ltAct.deletePostingToAX(voucher);

							CustTransksActions ctAct = new CustTransksActions(enConn, getUserProfile());
							ctAct.deletePostingToAX(voucher);
						}
					}
				}

			} else {

				ENServicesObject2ProvFilter servicesObject2ProvFilter = new ENServicesObject2ProvFilter();
				servicesObject2ProvFilter.servicesObjectRef.code = servicesObjectCode;
				ENServicesObject2ProvShortList so2pList = servicesObject2ProvDAO.getScrollableFilteredList(servicesObject2ProvFilter, 0, -1);

				if (so2pList.totalCount != 0) {
	                /* SUPP-4375 13.06.2013
	                * ������ �������� �� ���������� ��������
	                * */

	                //throw new SystemException("���� �������� ��� ���������!");

					if (so2pList.totalCount > 1) {
						throw new SystemException("\n\n"
								+ "�������� ������� (" + so2pList.totalCount + ") ����� �������� ��� ����� ��������!");
					}

					finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
					enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
					FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

		            /*
		            for (int i = 0; i < so2pList.totalCount; i++)
		            {
		                int partId = so2pList.get(i).partId;
		                if (partId == Integer.MIN_VALUE)
		                {
		                    throw new SystemException("�� ������� ��� ����� ��������!");
		                }
		                fpLogic.deleteProv(partId);

		                servicesObject2ProvDAO.remove(so2pList.get(i).code);
		            }
		            */

					int partId = so2pList.get(0).partId;
					String voucher = so2pList.get(0).voucher;

					if (partId == Integer.MIN_VALUE) {
						throw new SystemException("\n\n"
								+ "�� ������� ��� ����� ��������!");
					}

					servicesObject2ProvDAO.remove(so2pList.get(0).code);

					String userName = getUserNameForFK(servicesObjectCode);

					fpLogic.deleteProv(partId, userName);

					if (voucher != null) {
						if (!voucher.equals("")) {

							LedgerTransksActions ltAct = new LedgerTransksActions(enConn, getUserProfile());
							ltAct.deletePostingToAX(voucher);

							CustTransksActions ctAct = new CustTransksActions(enConn, getUserProfile());
							ctAct.deletePostingToAX(voucher);
						}
					}
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException("\n\n"
					+ "�� ������� �������� ��������! ���� ��'���� � Գ�������!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();

			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


    public FKProvObjectShortList getPostingsList(int servicesObjectCode)
    {
        FKProvObjectShortList result = new FKProvObjectShortList();

        Connection finConn = null;

        try
        {
            ENServicesObject2ProvFilter servicesObject2ProvFilter = new ENServicesObject2ProvFilter();
            servicesObject2ProvFilter.servicesObjectRef.code = servicesObjectCode;
            ENServicesObject2ProvDAO servicesObject2ProvDAO = new ENServicesObject2ProvDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObject2ProvShortList so2pList = servicesObject2ProvDAO.getScrollableFilteredList(servicesObject2ProvFilter, 0, -1);

            if (so2pList.totalCount == 0)
            {
                return result;
            }

            if (so2pList.totalCount > 1)
            {
                throw new SystemException("�������� ������� (" + so2pList.totalCount + ") ����� �������� ��� ����� ��������!");
            }

            //enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            int partId = so2pList.get(0).partId;
            if (partId == Integer.MIN_VALUE)
            {
                throw new SystemException("³������ ��� ����� �������� ��� ����� ��������!");
            }

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
            return fpLogic.getProvListFromFin(partId);
        }
        catch (DatasourceConnectException e) {throw new SystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

            closeConnection();
        }
    }




  public ENServicesObjectControllerEJB() {}


    /* ENServicesObject. �������� ������ ��� �������� � ������� ������� */
    public int addForSale(ENServicesObject object) {
        try {
            ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            int objectCode = Integer.MIN_VALUE;

            object.contractKindRef.code = ENServicesContractKind.SALE;
            object.contractTypeRef.code = ENServicesContractType.SALE;
            object.contractStatusRef.code = ENServicesContractStatus.GOOD;

            if (object.contractNumber == null)
                object.contractNumber = "" + new Date().getTime();

            if (object.contractDate == null)
                object.contractDate = new Date();

            if (object.name == null)
                object.name = getUserProfile().userName + " " + new Date().getTime();

            object.contractNumberServices = "" + objectDAO._collectAutoIncrementNumber();

            object.statusRef.code = ENServicesObjectStatus.GOOD;
            objectCode = this.add(object);

            new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).addForSale(object);

            return objectCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't add object", e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void saveForSale(ENServicesObject object) {
        try {

            if (object.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException(
                        "�������� ��� �������� �������� ����������!");
            }

            /*
            if (object.contractStatusRef.code == ENServicesContractStatus.SIGNED
                    || object.contractStatusRef.code == ENServicesContractStatus.PAID) {
                throw new SystemException(
                        "�������� ������� ��� ������� �������� ����������!");
            }
            */

            object.contractTypeRef.code = ENServicesContractType.SALE;
            object.setDomain_info(null);

            ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENServicesObject oldObject = objectDAO.getObject(object.code);

            // //////////////////
            // NET-745 ��� ���������� �������� ��������� ������������� �� ������
            // �� ����� ��������
            if (object.department.code != ENConsts.ENDEPARTMENT_CO
                    && object.department.code != ENConsts.ENDEPARTMENT_KSOE) {
                ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(),
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
                planFilter.elementRef.code = object.element.code;
                int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
                for (int i = 0; i < planArr.length; i++) {
                    ENPlanWork plan = planDAO.getObject(planArr[i]);
                    plan.departmentRef.code = object.department.code;
                    plan.renRef.code = object.element.renRef.code;
                    planDAO.save(plan);
                }
            }
            // //////////////////

            if (oldObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
                this.save(object);
                return;
            }

            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;

            ENElement el = new ENElement();
            ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            el = elDAO.getObject(object.element.code);
            el.renRef.code = object.element.renRef.code;

            if (el.renRef.code == Integer.MIN_VALUE) {
                el.renRef.code = 0;
            }

            elDAO.save(el);

            objectDAO.save(object);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENServicesObject%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }

    }

    //��������� ������� ������
	public void updateContractStatus(int servObjCode, int contractStatusCode) {
		try {
			ENServicesObjectDAO soDao = new ENServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			soDao.updateContractStatus(servObjCode, contractStatusCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't updateContractStatus " + servObjCode, e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public void updateActTransfer(int servicesObjectCode, RQFKOrder fkOrder, boolean isPersist) {
		try {
			if(servicesObjectCode == Integer.MIN_VALUE || fkOrder == null) {
				throw new java.lang.NullPointerException("�� ������� ���� �� ����''������� ���������");
			}

			if(!isPersist && fkOrder.code == Integer.MIN_VALUE) {
				throw new SystemException("������������ ����� ��������� ��� ��������� ���� ���������-�������� �������� ���������");
			}

			RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObject2RQFKOrderDAO sofoDao = new ENServicesObject2RQFKOrderDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			FINMaterialsDAO finMatDao = new FINMaterialsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENMOL2PlanWorkDAO mol2PlanDao = new ENMOL2PlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderItem2ENEstimateItemDAO fiesDao = new RQFKOrderItem2ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderItemDAO fkOrderItemDao = new RQFKOrderItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQOrgDAO fOrgDao = new RQOrgDAO(getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
			RQOrgDAO orgDao = new RQOrgDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			FKLogic2 fkLogic2 = new FKLogic2(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			RQFKOrder old = null;

			// ����������� �������� ������������ ��� ����� ������-�������� ���������� ���������
			final int ADDITION = 1, UPDATE = 2, DELETE = 3, CHANGE_STATUS = 4;
			int action = Integer.MIN_VALUE;

			if(isPersist) {
				if(fkOrder.code == Integer.MIN_VALUE) {
					action = ADDITION;
				} else {
					old = fkOrderDao.getObjectNOSEGR(fkOrder.code);
					if(old.status.code != fkOrder.status.code) {
						action = CHANGE_STATUS;
					} else {
						action = UPDATE;
					}
				}
			} else {
				old = fkOrderDao.getObjectNOSEGR(fkOrder.code);
				action = DELETE;
			}

			// ���������� ��������
			switch(action) {
			case ADDITION:
				if(fkOrder.numberDoc == null || fkOrder.dateGen == null) {
					throw new SystemException("�� ����� ����''����� ���������!");
				}

				BigDecimal id = fkLogic2.getPartnerId(servicesObject.partnerCode);
				if(id == null) {
					throw new SystemException(String.format("�� ������� ���������� �������� � ����� %s", servicesObject.partnerCode));
				}

				RQOrg org = fOrgDao.getObjectFromFK(id.intValue());
				if(org == null) {
					throw new SystemException(String.format("�� �������� ���������� � ����� %s", servicesObject.partnerCode));
				}
				org.code = orgDao.add(org);

				fkOrder.accountingTypeRef.code = TKAccountingType.TMC;
				fkOrder.kind.code = RQFKOrderKind.PRIHOD_POSTAVKA;
				fkOrder.status.code = RQFKOrderStatus.GOOD;
				fkOrder.domain_info = getUserProfile().domainInfo.domain;
				fkOrder.userGen = getUserProfile().userName;
				fkOrder.department.code = servicesObject.department.code;
				fkOrder.datePosting = fkOrder.dateGen;
				fkOrder.ndsPercent = 0;
				//fkOrder.molInCode = servicesObject.partnerCode;
				//fkOrder.molInName = servicesObject.name;
				fkOrder.molOutCode = null;
				fkOrder.org = org;

				Set<Integer> finMaterialCodes = finMatDao.getCodesOfCustomerMaterials(servicesObject);
				if(finMaterialCodes.size() == 0) {
					throw new SystemException(String.format("���� �������� ��������� ��� ��������� � ��� �%s!"
							, fkOrder.numberDoc));
				}

				BigDecimal sum = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);

				Set<FINMaterials> finMaterials = new HashSet<>();
				Hashtable<Integer,Integer> finMaterialsCode2TKMaterialsCode = new Hashtable<>();
				for(Integer code : finMaterialCodes) {
					FINMaterials finMat = finMatDao.getObject(code);

					ENEstimateItem estimate = estimateDao.getObject(finMat.estimateItemRef.code);

					RQFKOrderItem2ENEstimateItemFilter fiesFilter = new RQFKOrderItem2ENEstimateItemFilter();
					fiesFilter.estimateItem.code = estimate.code;

					if(estimate.statusRef.code == ENEstimateItemStatus.UNUSED && fiesDao.count(fiesFilter) == 0) {
						finMaterials.add(finMat);
						finMaterialsCode2TKMaterialsCode.put(finMat.code, estimate.materialRef.code);
						sum = sum.add(finMat.cost);
						ENMOL2PlanWork mol2Plan = mol2PlanDao.getObjectByPlanCode(estimate.planRef.code);
						if(mol2Plan != null) {
							if(fkOrder.molOutCode == null) {
								fkOrder.molOutCode = mol2Plan.molCode;
								fkOrder.molOutName = mol2Plan.molName;
							} else {
								if(!fkOrder.molOutCode.equals(mol2Plan.molCode)) {
									throw new SystemException(String.format("��������� ��������� ��� ��� ���������� �������� �� \"%s\" �� \"%s\""
											, fkOrder.molOutCode, mol2Plan.molCode));
								}
							}
						}
					}
				}

				if(fkOrder.molOutCode == null) {
					throw new SystemException("��������� ��������� ��� ��� ���������� ��������");
				}

				fkOrder.sumWithoutNds = sum;
				fkOrder.sumNds = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);

				fkOrderLogic.createRQFKOrder(fkOrder);
				sofoDao.createLink(servicesObject.code, fkOrder.code);

				for(FINMaterials finMat : finMaterials) {
					int fkItemCode = fkOrderLogic.getRQFKItem(fkOrder.code, finMaterialsCode2TKMaterialsCode.get(finMat.code), finMat);
					if(fkItemCode != Integer.MIN_VALUE) {
						RQFKOrderItem2ENEstimateItem fies = new RQFKOrderItem2ENEstimateItem();
						fies.countGen = finMat.quantity;
						fies.sumWithoutNds = finMat.cost;
						fies.fkOrderItemRef.code = fkItemCode;
						fies.estimateItem.code = finMat.estimateItemRef.code;
						fies.statusRef.code = RQFKOrderItem2EstimateItemStatus.IN_INVOICE;
						fiesDao.add(fies);

						RQFKOrderItem fkOrderItem = fkOrderItemDao.getObject(fkItemCode);
						if(fkOrderItem.finDocID == Integer.MIN_VALUE) {
							fkOrderItem.finDocID = servicesObject.finDocID;
							fkOrderItem.contractNumber = servicesObject.contractNumber;
							fkOrderItem.contractDate = servicesObject.contractDate;
							fkOrderItem.finDocCode = servicesObject.finDocCode;
							fkOrderItemDao.save(fkOrderItem, false);
						}

					} else {
						throw new SystemException(String.format("������� ��� ��������� ������ ������ ��� ������������ %s", finMat.nn));
					}
				}

				fkOrderLogic.createdPrihod(fkOrder.code, false);

				//fkOrderObject.org = org;

				break;
			case UPDATE:
				fkOrderDao.checkFKOrderInStatuses(old, true, RQFKOrderStatus.GOOD);
				old.numberDoc = fkOrder.numberDoc;
				old.dateGen = fkOrder.dateGen;
				fkOrderDao.save(old);
				break;
			case DELETE:
				fkOrderDao.checkFKOrderInStatuses(old, true, RQFKOrderStatus.GOOD);
				sofoDao.removeLink(servicesObjectCode, fkOrder.code);
				fkOrderLogic.removeCreatedPrihodWithStrings(old);
				break;
			case CHANGE_STATUS:
				fkOrderDao.checkFKOrderInStatuses(old, true, RQFKOrderStatus.GOOD, RQFKOrderStatus.CREATED);
				if(old.status.code == RQFKOrderStatus.GOOD) {
					fkOrderLogic.createdPrihod(old.code, false);
				} else {
					fkOrderLogic.unCreatedPrihod(old.code, false);
				}
				break;
			default:
				throw new SystemException("������� ��� ������� ���� ���������-�������� �������� ���������");
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}

	}

    /**
    *  ����� ��� ���������� ������ � ���� ���� ������-�������� ���������� ��������� ��� �������� �� ������� �� �������
    *  @param servicesObjectCode - ��� �������� �� ������� �� ������� (ENServicesObject)
    *  @param actTransferNumber - ����� ���� ������-��������
    *  @param actTransferDate - ���� ���� ������-��������
    */
    public void updateActTransfer(int servicesObjectCode, String actTransferNumber, Date actTransferDate)
    {
        try
        {
            if (servicesObjectCode == Integer.MIN_VALUE)
            {
                throw new SystemException("\n \n NET-3079 �������� ��� �������� � ������ �� �������!");
            }

            if (actTransferNumber == null)
            {
                throw new SystemException("\n \n NET-3079 �� ������ ����� ���� ���������-��������! ��� ��������: " + servicesObjectCode);
            }

            if (actTransferNumber.trim().equals(""))
            {
                throw new SystemException("\n \n NET-3079 �� ������ ����� ���� ���������-��������! ��� ��������: " + servicesObjectCode);
            }

            if (actTransferDate == null)
            {
                throw new SystemException("\n \n NET-3079 �� ������ ���� ���� ���������-��������! ��� ��������: " + servicesObjectCode);
            }

            ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENServicesObject object = objectDAO.getObject(servicesObjectCode);

            if (object.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED)
            {
                throw new SystemException("\n \n NET-3079 �������� ��������� ��� �������������! " +
                        "��� ���� ���� ���������-�������� �������� �������� ���. ������ \"��������\"!");
            }

            if (object.statusRef.code == ENServicesObjectStatus.CLOSED)
            {
                throw new SystemException("\n \n NET-3079 �������� ��� �������� �������� ����������!");
            }

            if (object.isCustomerMaterials != 1)
            {
                throw new SystemException("\n \n NET-3079 ������ ��� ������ �� ������� ������� ���� ������ " +
                        "\"������ � ������������� �������� ���������\"!");

            }

            objectDAO.updateActTransfer(servicesObjectCode, actTransferNumber, actTransferDate);
        }
        catch (DatasourceConnectException e)
        {
            throw new SystemException(
                    "Can't updateActTransfer for {%com.ksoe.energynet.valueobject.ENServicesObject%} object.",
                    e);
        }
        catch (PersistenceException e)
        {
            throw new SystemException(e.getMessage(), e);
        }
        finally
        {
            closeConnection();
        }

    }


    private void moveOrUnmoveActTransferToFK(RQFKOrder fkOrder) {
    	try {
    		if(fkOrder == null || fkOrder.code == Integer.MIN_VALUE) {
    			throw new java.lang.NullPointerException("�� ������� �����!");
    		}
    		RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    		FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

    		RQFKOrder fkOrderOld = fkOrderDao.getObjectNOSEGR(fkOrder.code);

    		fkOrderDao.checkFKOrderInStatuses(fkOrderOld, true, RQFKOrderStatus.IN_FK, RQFKOrderStatus.CREATED);

    		if(fkOrderOld.status.code == RQFKOrderStatus.CREATED) {
        		fkOrderLogic.movePrihodToFK(fkOrderOld.code, 0, false);
    		} else {
    			fkOrderLogic.unMovePrihodToFK_10(fkOrderOld.code);
    			fkOrderOld.status.code = RQFKOrderStatus.CREATED;
    			fkOrderDao.save(fkOrderOld);
    		}
    	} catch (DatasourceConnectException e) {
    		throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {

    	}
    }

    public void moveActTransferToFK(RQFKOrder fkOrder) {
    	this.moveOrUnmoveActTransferToFK(fkOrder);
    }


   /**
    *  ����� ��� ���������� ���� ������-�������� ���������� ��������� � ������������
    *  @param servicesObjectCode - ��� �������� �� ������� �� ������� (ENServicesObject)
    */
    public void moveActTransferToFK(int servicesObjectCode)
    {
        Connection finConn = null;
        Connection enConn = null;

        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
            ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

            if (servicesObject.isCustomerMaterials != 1)
            {
                throw new SystemException("\n \n NET-3079 �� ������� ���� ������ \"������ � ������������� �������� ���������\"!");
            }

            if (servicesObject.statusRef.code != ENServicesObjectStatus.GOOD)
            {
                throw new SystemException("\n \n NET-3079 ������ ������� ���� �������������� ������ \"��������\"!");
            }

            if (servicesObject.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                servicesObject.contractStatusRef.code != ENServicesContractStatus.PAID)
            {
                throw new SystemException("\n \n NET-3079 ������ ������� ���� ������ \"ϳ��������\" ��� \"���������\"!");
            }

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            FINLogic finLogic = new FINLogic(finConn, getUserProfile());
            finLogic.createDOCFromCustomerMaterials(servicesObjectCode);

            // �������� ���. ������ �������� �� "�������� ��������� �������������"
            servicesObject.statusRef.code = ENServicesObjectStatus.ACT_TRANSFER_CLOSED;
            servicesObjectDAO.save(servicesObject);

        }
        catch (DatasourceConnectException e) {throw new SystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }

            closeConnection();
        }

    }


    public void unMoveActTransferToFK(RQFKOrder fkOrder) {
    	this.moveOrUnmoveActTransferToFK(fkOrder);
    }

    /**
        *  ����� ��� ������ ���������� ���� ������-�������� ���������� ��������� � ������������
        *  @param servicesObjectCode - ��� �������� �� ������� �� ������� (ENServicesObject)
        */
        public void unMoveActTransferToFK(int servicesObjectCode)
        {
            Connection finConn = null;
            Connection enConn = null;

            try
            {
                enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

                ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
                ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

                if (servicesObject.isCustomerMaterials != 1)
                {
                    throw new SystemException("\n \n NET-3079 �� ������� ���� ������ \"������ � ������������� �������� ���������\"!");
                }

                if (servicesObject.statusRef.code != ENServicesObjectStatus.ACT_TRANSFER_CLOSED)
                {
                    throw new SystemException("\n \n NET-3079 ������ ������� ���� �������������� ������ \"�������� ��������� �������������\"!");
                }

                finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

                FINLogic finLogic = new FINLogic(finConn, getUserProfile());
                finLogic.removeDOCFromCustomerMaterials(servicesObjectCode);

                // �������� ���. ������ �������� ������� �� "��������"
                servicesObject.statusRef.code = ENServicesObjectStatus.GOOD;
                servicesObjectDAO.save(servicesObject);

            }
            catch (DatasourceConnectException e) {throw new SystemException("��� ����� � �� ���.��������� ...",e);}
            catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
            finally                              {
                try {
                    if (finConn != null && ! finConn.isClosed()) {
                        finConn.close();
                        finConn = null;
                    }
                } catch (SQLException e) {
                }
                try {
                    if (enConn != null && ! enConn.isClosed()) {
                        enConn.close();
                        enConn = null;
                    }
                } catch (SQLException e) {
                }
            }

            closeConnection();
        }


    /**
    * NET-4159
    * ����� ��� �������� ���������� ��������� � ������� (����������) ���
    * �������, � ������� ����������� �������� �������� ���������
    * @param servicesObjectCode - ��� �������� �� ������� �� ������� (ENServicesObject)
    *
    */
    public void checkGiveCounters(int servicesObjectCode) {

        try {
            ServicesLogic logic = new ServicesLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            logic.checkGiveCounters(servicesObjectCode);

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        	closeConnection();
        }
    }

    /**
    * NET-4159 ���������� ���� ������-�������� ��������� ��� ����� ����������
    *
    * @param svoCode - ��� ��������
    */
    public void actSigned(int svoCode) {

        try {
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractStatusRef.code != ENServicesContractStatus.PAID) {
                throw new SystemException(
                        "\n" +
                        "\n ��� ������� ���������� ����� ���� ������ ������� �� ���������!!!");
            }

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException(
                        "\n" +
                        "\n �������� ��� �������� �������� ����������!");
            }

            /**
            * NET-4159 �������� ������������ ��������� ��� ����� ����������
            */
            checkGiveCounters(svoCode);

            obj.contractStatusRef.code = ENServicesContractStatus.ACT_SIGNED;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't actSigned ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
    * NET-4159 ������ ���������� ���� ������-�������� ��������� ��� ����� ����������
    *
    * @param svoCode - ��� ��������
    */
    public void actUnSigned(int svoCode) {

        try {
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractStatusRef.code != ENServicesContractStatus.ACT_SIGNED) {
                throw new SystemException(
                        "\n" +
                        "\n ��� ������� �� ���������!!!");
            }

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException(
                        "\n" +
                        "\n �������� ��� �������� �������� ����������!");
            }

            obj.contractStatusRef.code = ENServicesContractStatus.PAID;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't actUnSigned ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
     *  13.04.2013 +++ �������������� �������� �������� � �������������
     *  � ������������� ����������� � �������� ������
     *
     *  @param cnPack - ����� �� EnergyWorkFlow
     *  @distance - ����� ���������� � ��
     *
     */

	public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance) {
		return addServicesObjectByCnPack(pack, distance, true, false, false);
	}

	public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance,
			boolean isNewPack) {
		return addServicesObjectByCnPack(pack, distance, true, false, false);
	}

	public int addServicesObjectByCnPack(CNPack pack, BigDecimal distance,
			boolean isNewPack, boolean addTU, boolean fromSite) {
		try {

			EWFConnection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
			ENConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            int soCode = Integer.MIN_VALUE;
            int techCondObjCode = Integer.MIN_VALUE;

            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(ENConnection, getUserProfile());
            CNLogic cnLogic = new CNLogic(EWFConnection, getUserProfile());


			if (isNewPack) {
				pack.code = cnLogic.addPackCN(pack, fromSite);
			} else {

				ENServicesObjectFilter servObjFilter = new ENServicesObjectFilter();
            	servObjFilter.conditionSQL = " enservicesobject.cnpackcode = " + pack.code
            			+ " and enservicesobject.cnsubsystemtyperefcode = " + pack.subsystemRef.code;

            	int servObjCodeArr[] = soDAO.getFilteredCodeArray(servObjFilter, 0, -1);
                if (servObjCodeArr.length >= 1) {
                  int servObjCode = Integer.MIN_VALUE;

					for (int i = 0; i < servObjCodeArr.length; i++) {
						servObjCode = servObjCodeArr[i];

						if (servObjCode != Integer.MIN_VALUE) {
							ENServicesObject servObjObject = soDAO.getObject(servObjCode);
							techCondObjCode = servObjObject.techConObjects.code;
							if (techCondObjCode != Integer.MIN_VALUE) {
								break;
							}
						}
					}
				}
			}

            CNRen2ENDepartmentDAO cn2dDao = new CNRen2ENDepartmentDAO(ENConnection, getUserProfile());

            int codeRem = cn2dDao.getDepartmentCode(pack.id_ren);
            if (codeRem == Integer.MIN_VALUE) {
                throw new SystemException(
                        "\n" +
                        "\n ������� ��� ��������� ��������!!! ��� �������� � EnergyWorkFlow = " + pack.id_ren);
            }

            DepartmentLogic dLogic = new DepartmentLogic(ENConnection, getUserProfile());
            int categoryRen = dLogic.getCategoryRen(codeRem);

            if (distance == null) {
                throw new SystemException(
                        "\n" +
                        "\n �� ������� �������� �������!!!");
            }

            if (pack.power == null) {
                throw new SystemException(
                        "\n" +
                        "\n �� ������� ���������!!!");
            }

            /** ��� �������� ����� 5 ��� - ��� */
            /** 29.07.2013 +++ ���, ��� ������ 16 */
            if (pack.power.doubleValue() > 16
                    /** 19.04.2013 +++ ��� �������� ������ ��������� ������� ���� - �� ��� */
                    || pack.isSea == 1 || pack.over5 == 1) {
                codeRem = ENConsts.ENDEPARTMENT_KSOE;
            }


            try {
                Context cnt = new InitialContext();
                Object objRef = cnt.lookup(ENPlanWorkItemController.JNDI_NAME);
                ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject
                        .narrow(objRef, ENPlanWorkItemControllerHome.class);
                ENPlanWorkItemController pwiController = pwiHome.create();

                ENPlanWork2ClassificationType classification = new ENPlanWork2ClassificationType();
                classification.machineHours = new BigDecimal(0);
                classification.isPrintOnKmOrMH = 0;
                classification.codeVirtualBrigade = 0;

                //classification.classificationTypeRef.code = getClassificationTypeCode(pack.power, pack.reliability_class, pack.startState);
                classification.classificationTypeRef.code = getClassificationTypeCodeByCodeRem(pack.power, categoryRen);

                classification.countGen = new BigDecimal(1);

                int planWork2ClsCode = pwiController.addPlanWorkItemsByClassificationTypeForCalculation2(
                        classification, distance, codeRem, true, addTU);

                ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
                soFilter.conditionSQL = " enservicesobject.code in (" +
                        " select o.code from enservicesobject o " +
                        " where o.elementcode = ( " +
                        " select pl.elementrefcode from enplanwork pl where pl.code = ( " +
                        " select s.planrefcode from enplanwork2classfctntp s where s.code = " + planWork2ClsCode + " ) ) )";

                int soCodeArr[] = soDAO.getFilteredCodeArray(soFilter, 0, -1);
                if (soCodeArr.length == 1) {
                    soCode = soCodeArr[0];
                } else {
                    throw new SystemException("\n"
                            + "\n ������� ��� ��������� ��������!!!");
                }



                /** ������������ ������� �� ������ */
                ENServicesObject soObject = soDAO.getObject(soCode);
                soObject.cnPackCode = pack.packCode;
                soObject.cnSubsystemTypeRef.code = pack.subsystemRef.code;
                soObject.contragentName = pack.name;
                soObject.contragentAddressWork = pack.address;
                soObject.contractServicesPower = pack.power;
                soObject.contragentTypeRef.code = pack.status;
                if (techCondObjCode != Integer.MIN_VALUE)
                  {soObject.techConObjects.code = techCondObjCode;}

                //PRIC-579. ����� � 482 �� 24.07.2013 �.
                //��� ������������� ���� � ��������� ���������������� �� ����������� �����
                //�.4.1. ����������� ���������� �������� ������ �� ������� ��� ���������� �� ������������
                //��������� � ������� EnergyNet � �������� ��Ȫ������ �� �� ���� 01.08.2010, � 14.03.2011 �.
                //��������� EnergyWorkFlow
                if (soObject.contragentTypeRef.code == 0)
                  {throw new SystemException("\n"
                          + "\n PRIC-579. ������� ��� ��������� �������� �����:"
                          + "\n �������� ����������, ��� �, ��� �����-����������");}

                soDAO.save(soObject);

                if (!addTU) {
                    /** ������� ���� ������� �� �����������(�� ���������) ������������� */
                    Context cntx = new InitialContext();
                    Object tcServices = cntx.lookup(ENTechConditionsServicesController.JNDI_NAME);
                    ENTechConditionsServicesControllerHome tcServicesHome = (ENTechConditionsServicesControllerHome) PortableRemoteObject
                            .narrow(tcServices, ENTechConditionsServicesControllerHome.class);
                    ENTechConditionsServicesController tcServicesController = tcServicesHome.create();

                    tcServicesController.addTechConditionsServicesByCNPack(soCode, pack);
                }

            } catch (NamingException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException(e.getMessage(), e);
            }

            return soCode;
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int copyTerminatedServiceObjectByCNPack(int packID, int subsystemID) {

        Connection cnConnection = null;

        try {

            if (cnConnection == null || cnConnection.isClosed()) {
                cnConnection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
            }

            CNPackDAO cnDAO = new CNPackDAO(cnConnection, getUserProfile());
            CNPack pack = cnDAO.getObjectByCodeAndSubsystem(packID, subsystemID);

            int soCodeTerminated = Integer.MIN_VALUE;
            int soCodeNew = Integer.MIN_VALUE;

            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL =  " enservicesobject.code in (" +
              " select so.code from enservicesobject so " +
              " where so.cnsubsystemtyperefcode = " + subsystemID +
              " and so.cnpackcode = " + packID +
              " and so.contractstatusrefcode not in ( " +
              ENServicesContractStatus.TERMINATED + ", " +
              ENServicesContractStatus.CANCELED + ", " +
              ENServicesContractStatus.CLOSED + "))";

            //������� ���� ����� ��������� � �������������
            soFilter.contractTypeRef = new ENServicesContractTypeRef();
            soFilter.contractTypeRef.code = ENServicesContractType.CONNECTION;

            int soCodeArr[] = soDAO.getFilteredCodeArray(soFilter, 0, -1);

            if (soCodeArr.length == 1) {
                soCodeTerminated = soCodeArr[0];
            }
            else if (soCodeArr.length == 0) {
                //���� ��������� � ������������� ��� - ���� ����� ��������� � ���������� ��
                soFilter.contractTypeRef.code = ENServicesContractType.TY;
                int soCodeArrayTY[] = soDAO.getFilteredCodeArray(soFilter, 0, -1);
                if (soCodeArrayTY.length == 1) {
                soCodeTerminated = soCodeArrayTY[0];
                }
                else if (soCodeArrayTY.length == 0) {
                    throw new SystemException("\n"
                            + "\n �� �������� ������� ��������,"
                            + "\n ���'������� � ����� �������!!!");
                }
                else {
                    throw new SystemException("\n"
                            + "\n �������� ������� ����������� ��������,"
                            + "\n ���'������ � ����� �������!!!");
                }
            }
            else {
                throw new SystemException("\n"
                        + "\n �������� ������� ����������� ��������,"
                        + "\n ���'������ � ����� �������!!!");
            }

            /*ENServicesObjectShortList soList = soDAO.getScrollableFilteredList(soFilter, 0, -1);
            ENServicesObjectShort soShort;
            if (soList.totalCount == 1) {
              soShort = soList.get(0);
              soCodeTerminated = soShort.code;
            } else {
                throw new SystemException("\n"
                        + "\n �������� ������� ����������� ��������,"
                        + "\n ���'������ � ����� �������!!!");
            }*/

            ENServicesObject soObjOld = soDAO.getObject(soCodeTerminated);
            ENServicesObject soObjTerminated = soDAO.getObject(soCodeTerminated);
            ENServicesObject soObjNew = soObjTerminated;

            if (soObjTerminated.contractTypeRef.code == ENServicesContractType.CONNECTION &&
                soObjTerminated.statusRef.code == ENServicesObjectStatus.GOOD)
            {//����������� �������� ����� �� ������� � �������������
                soObjTerminated.contractStatusRef.code = ENServicesContractStatus.TERMINATED;
                soDAO.save(soObjTerminated);
            }

            soObjNew.code = Integer.MIN_VALUE;
            try {
                //�������� � �������������� ������ �������� ����� �� ������� � �������������

                soObjNew.contractNumberServices = "" + soDAO._collectAutoIncrementNumber();

                soObjNew.contractDateServices = new Date();

                /** ������� ����� �������� � �� */
                soObjNew.contractNumber = "" + new Date().getTime();
                soObjNew.contractDate = new Date();
                soObjNew.commentGen = "";
                soObjNew.name = getUserProfile().userName + " " + new Date().getTime();
                soObjNew.finDocCode = null;
                soObjNew.finDocID = Integer.MIN_VALUE;
                soObjNew.partnerCode = null;
                soObjNew.partnerId = Integer.MIN_VALUE;

                //�������� ��� �������� �� �������������
                soObjNew.contractTypeRef.code = ENServicesContractType.CONNECTION;

                soCodeNew = this.add(soObjNew);
                ENServicesObject soObjNewSave = this.getObject(soCodeNew);

                //�������� ������ �� ����� ����������
                soObjNewSave.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;

                this.save(soObjNewSave);

                //������������ �������� ���������� � ������ �������� ����� �� ������� � �������������
                ENServicesObject2TechCondtnsServicesFilter so2tcsFilter =
                new ENServicesObject2TechCondtnsServicesFilter();
                so2tcsFilter.servicesObjectRef.code = soObjOld.code;
                ENServicesObject2TechCondtnsServicesDAO so2tcsDAO = new ENServicesObject2TechCondtnsServicesDAO(
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                int so2tcsCodeArr[] = so2tcsDAO.getFilteredCodeArray(so2tcsFilter, 0, -1);
                if (so2tcsCodeArr.length > 0)
                {
                    ENServicesObject2TechCondtnsServices so2tcsObj = so2tcsDAO.getObject(so2tcsCodeArr[0]);
                    so2tcsObj.servicesObjectRef.code = soCodeNew;
                    so2tcsDAO.save(so2tcsObj);

                    /** �������� ������� �� */
                    ENTechConditionsServicesDAO techConditionsServicesDao = new ENTechConditionsServicesDAO(
                    		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                    ENTechConditionsServices techConditionsServicesObject = techConditionsServicesDao.getObject(so2tcsObj.techCondServRef.code);

                    techConditionsServicesObject.finDocID = Integer.MIN_VALUE;
                    techConditionsServicesObject.finDocCode = null;
                    techConditionsServicesObject.finContractDate = null;
                    techConditionsServicesObject.finContractNumber = null;
                    techConditionsServicesObject.finCommentGen = null;
                    techConditionsServicesObject.partnerCode = null;
                    techConditionsServicesObject.partnerName = null;

                    techConditionsServicesDao.save(techConditionsServicesObject);
                }
                else
                {
                    /** ������� ���� ������� �� �����������(�� ���������) ������������� */

                    Context cntx = new InitialContext();
                    Object tcServices = cntx.lookup(ENTechConditionsServicesController.JNDI_NAME);
                    ENTechConditionsServicesControllerHome tcServicesHome = (ENTechConditionsServicesControllerHome) PortableRemoteObject
                            .narrow(tcServices, ENTechConditionsServicesControllerHome.class);
                    ENTechConditionsServicesController tcServicesController = tcServicesHome.create();

                    CNTechTermsDAO techTermsDAO = new CNTechTermsDAO(
                            getConnection(AuthorizationJNDINames.CN_DATASOURCE), getUserProfile());
                    CNTechTerms techTerms = techTermsDAO.getObjectByPackAndSubsystemID(packID, subsystemID);

                    //SUPP-11597. ��������� ������ �������� �� ����� ������ � ���������� EnergyWorkFlow
                    //� ����� ������������ ���������� ������ � ������� net.entechconditionsservcs
                    //��� ��� ������� net.enservicesobject, ��� ���� contracttyperefcode = 1,
                    //��� ������������� �������� "��" � ������� ����� ����� net.enservicescontracttype,
                    //� �������, ����� �������� ���������� ���� reg_num_cn_contract ���������� pack
                    //������ ��� �� ���������
                    if (pack.reg_num_cn_contract == null)
                      {pack.reg_num_cn_contract = "pack_" + pack.packCode +
                        "subsystem_" + pack.subsystemRef.code;}
                    else if (pack.reg_num_cn_contract.equals(""))
                      {pack.reg_num_cn_contract = "pack_" + pack.packCode +
                        "subsystem_" + pack.subsystemRef.code;}

                    if (techTerms != null)
                      {tcServicesController.addTechConditionsServicesByCNPack(soCodeNew, pack, techTerms);}
                    else
                      {tcServicesController.addTechConditionsServicesByCNPack(soCodeNew, pack);}
                }

                //������������ ������ � ��������� �������������
                ENPlanWorkFilter pwFilter = new ENPlanWorkFilter();
                pwFilter.elementRef.code = soObjOld.element.code;

                ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                int pwCodeArr[] = pwDAO.getFilteredCodeArray(pwFilter, 0, -1);

                if (pwCodeArr.length > 0)
                {
                for (int i = 0; i < pwCodeArr.length; i++)
                  {
                    //��������� ���� �� ����� ��������� ������ ������ �� �������
                    ENPlanWork plan = pwDAO.getObject(pwCodeArr[i]);
                    plan.elementRef.code = soObjNew.element.code;

                    /*
                    //����������� ����������� ������� ������� - �� 29.07.2013
                    pw2ctFilter.conditionSQL =
                    " enplanwork2classfctntp.planrefcode = " + pwCodeArr[i] +
                    " and enplanwork2classfctntp.classificationtyperfcd in (" +
                    " 500002279, 500002280, 500002281, 500002282, 500002279, " +
                    " 500002280, 500002281, 500002282, 500002263, 500002265, " +
                    " 500002269, 500002273, 500002274, 500002275, 500002276, " +
                    " 500002278)";

                    pw2ctList = pw2ctDAO.getScrollableFilteredList(pw2ctFilter, 0, -1);
                    if (pw2ctList.list.size() > 0) //���� ���� ��������� �������� ����������� ������� �������
                      {//������ ����� ���������� -  ����� � kind 5, 6
                        if (plan.kind.code == ENPlanWorkKind.CALCULATION ||
                            plan.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
                          {
                            //plan.status.code = ENPlanWorkStatus.CANCELED_;
                            estimatePlanDepartmentCode = plan.departmentRef.code;
                          }
                        else if (plan.kind.code == ENPlanWorkKind.CURRENT)
                          {monthPlanDepartmentCode = plan.departmentRef.code;}
                      }
                    else if (!isExistNewClassification) //���� ����������� �����, ������������ �������� ����������� ������ �������
                      {
                    	pw2ctFilter.conditionSQL = " enplanwork2classfctntp.planrefcode = " + pwCodeArr[i]
                    			+ " and enplanwork2classfctntp.classificationtyperfcd in ( "
                    			+ TKClassificationType.PREPARED_TU_STRING + ")";

                        pw2ctList = pw2ctDAO.getScrollableFilteredList(pw2ctFilter, 0, -1);
                        if (pw2ctList.list.size() > 0) //���� ���� ��������� �������� ����������� ������ ������� -
                        {isExistNewClassification = true;} //����������� ������� ����� � ���������
                      }
                    */

                    pwDAO.save(plan);
                  }
                }


                /*  SUPP-27279... 15.12.2014 +++ ������������� ������ �� ���������....
                 *  ��� ������ � ��� ����������� �� ����� �������, ��� ������������� ������� ����, ��� �� ����!!!!!
                 *
                if (!isExistNewClassification) //���� ����������� �����, ������������ �������� ����������� ������ �������
                  {
                    //������������ ���, ����������� � �������� ����� �����, ��� �� �������������

                    if (pack.over5 == 1)
                    {pack.startState = CNPack.STATE_WINDOWS_OPERATOR_HOE;}
                    else
                    {pack.startState = CNPack.STATE_WINDOWS_OPERATOR_RES;}

                    CNRen2ENDepartmentDAO cn2dDao = new CNRen2ENDepartmentDAO(
                            getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    int codeRem = cn2dDao.getDepartmentCode(pack.id_ren);
                    if (codeRem == Integer.MIN_VALUE) {
                        throw new SystemException(
                                "\n" +
                                "\n ������� ��� ��������� ��������!!! ��� �������� � EnergyWorkFlow = " + pack.id_ren);
                    }

                    if (distance == null) {
                        throw new SystemException(
                                "\n" +
                                "\n �� ������� �������� �������!!!");
                    }

                    if (pack.power == null) {
                        throw new SystemException(
                                "\n" +
                                "\n �� ������� ���������!!!");
                    }

                    try {
                        Context cntxt = new InitialContext();
                        Object objRef = cntxt.lookup(ENPlanWorkItemController.JNDI_NAME);
                        ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject
                                .narrow(objRef, ENPlanWorkItemControllerHome.class);
                        ENPlanWorkItemController pwiController = pwiHome.create();

                        ENPlanWork2ClassificationType classification = new ENPlanWork2ClassificationType();
                        classification.machineHours = new BigDecimal(0);
                        classification.isPrintOnKmOrMH = 0;
                        classification.codeVirtualBrigade = 0;

                        DepartmentLogic dLogic = new DepartmentLogic(
                                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        int categoryRen = dLogic.getCategoryRen(codeRem);
                        classification.classificationTypeRef.code = getClassificationTypeCodeByCodeRem(pack.power, categoryRen);

                        classification.countGen = new BigDecimal(1);

                        int planWork2ClsCode = pwiController.addPlanWorkItemsByClassificationTypeForCalculation(classification, distance, true, soCodeNew);
                        ENServicesObject soObjSecondSave = this.getObject(soCodeNew);

                        //��������������� ������������� � ������
                        ENPlanWorkFilter pwNewFilter = new ENPlanWorkFilter();
                        pwNewFilter.elementRef.code = soObjSecondSave.element.code;
                        int pwNewCodeArr[] = pwDAO.getFilteredCodeArray(pwNewFilter, 0, -1);
                        if (pwNewCodeArr.length > 0)
                          {
                            for (int i = 0; i < pwNewCodeArr.length; i++)
                            {
                                ENPlanWork planNew = pwDAO.getObject(pwNewCodeArr[i]);
                                if (planNew.kind.code == ENPlanWorkKind.CALCULATION ||
                                    planNew.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
                                {planNew.departmentRef.code = estimatePlanDepartmentCode;}
                                else if (planNew.kind.code == ENPlanWorkKind.CURRENT)
                                {planNew.departmentRef.code = monthPlanDepartmentCode;}
                                pwDAO.save(planNew);
                            }
                          }

                        //������� ��������� ������� ��������
                        soObjSecondSave.contractStatusRef.code = ENServicesContractStatus.GOOD;
                        this.save(soObjSecondSave);

                        //����������� �����
                        ENPlanWork2ClassificationTypeDAO planWork2ClsDAO = new ENPlanWork2ClassificationTypeDAO(
                          getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

                        ENPlanWork2ClassificationType planWork2ClsObj = planWork2ClsDAO.getObject(planWork2ClsCode);

                        budgetApproved(soCodeNew, planWork2ClsObj.planRef.code);
                        signed(soCodeNew, true, false);




                    } catch (NamingException e) {
                        throw new SystemException(e.getMessage(), e);
                    } catch (RemoteException e) {
                        throw new SystemException(e.getMessage(), e);
                    } catch (CreateException e) {
                        throw new SystemException(e.getMessage(), e);
                    }
                  }
                  */


                //������������ �����
                ENActFilter actFilter = new ENActFilter();
                actFilter.element.code = soObjOld.element.code;

                ENActDAO actDAO = new ENActDAO(
                getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                int actCodeArr[] = actDAO.getFilteredCodeArray(actFilter, 0, -1);

                if (actCodeArr.length > 0)
                {
                for (int m = 0; m < actCodeArr.length; m++)
                    {
                    ENAct act = actDAO.getObject(actCodeArr[m]);
                    act.element.code = soObjNew.element.code;
                    actDAO.save(act);
                    }
                }

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (NamingException e) {
                throw new SystemException(e.getMessage(), e);
            }

            return soCodeNew;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (SQLException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
            try {
                if (cnConnection != null && !cnConnection.isClosed()) {
                    cnConnection.close();
                }
            } catch (SQLException e) {
                throw new SystemException(e.getMessage(), e);
            }
        }
    }


	public int copyTechTermsPrepareServiceObjectByCNPack(int packID, int subsystemID) {
		throw new SystemException("\n\n"
				+ "������� ��� ��������� �������� ���䳿 ���� ������.\n"
				+ "��� ������: " + packID);
	}

    /**
     *  �������� �������� ����� �� ������� � ��������� ����������� �������
     *  �� ���� ��������� �������� �������������
     *
     *  @param packID - ��� ������
     *  @param subsystemID - ��� ����������
     *  @param soCodeOld - ��� ��������
     *  @param distance - ����������
     *
     *  @return soCodeNew - ��� ���������� ��������
     */
	public int copyTechTermsPrepareServiceObjectByCNPack(int packID,
			int subsystemID, int soCodeOld, BigDecimal distance) {

		Connection cnConnection = null;
		Connection netConnection = null;
		int soCodeNew = Integer.MIN_VALUE;
		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENServicesObjectDAO soDao = new ENServicesObjectDAO(netConnection, getUserProfile());
			ServicesLogic servicesLogic = new ServicesLogic(netConnection, getUserProfile());
			ENActDAO actDao = new ENActDAO(netConnection, getUserProfile());
            ENPlanWorkDAO planDao = new ENPlanWorkDAO(netConnection, getUserProfile());

            //����������� � �� EnergyWorkFlow � ��������� ������
            if (cnConnection == null || cnConnection.isClosed()) {
                cnConnection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
            }

            CNPackDAO cnDao = new CNPackDAO(cnConnection, getUserProfile());

            ENServicesObject soObjOld = soDao.getObject(soCodeOld);

            ENActFilter actFilter = new ENActFilter();
			actFilter.element.code = soObjOld.element.code;

			int actCodeArr[] = actDao.getFilteredCodeArray(actFilter, 0, -1);
			// if (actCodeArr.length > 0) {
				if (soObjOld.contractStatusRef.code > ENServicesContractStatus.BUDGETAPPROVED) {
					throw new SystemException("\n\n "
							+ "�������� ������ ������� ���� ������ \"�������� ������������\"!");
				}
			// }


			/** 15.08.2017... +++ ������ ��� ���������, �� ������� ��� �� ��������� ��� �������������!!! */
			int connectionKind = servicesLogic.getConnectionKind(soCodeOld);
			if (connectionKind != ENConnectionKind.UNDEFINED) {
				throw new SystemException("\n\n "
						+ "��� �������� ��� ��������� ��� ���������!\n"
						+ "�������� �������� ���������!");
			}


            CNPack pack = cnDao.getObjectByCodeAndSubsystem(packID, subsystemID);

            //�������� ������ �������� ����� �� �������
            boolean addTU = true;
            soCodeNew = addServicesObjectByCnPack(pack, distance, false, addTU, false);

            ENServicesObject soObjNew = soDao.getObject(soCodeNew);
            BigDecimal contractServicesSummaNew = soObjNew.contractServicesSumma;

            //�������� ������ ������������� �������� �������������
            //������ �������� ����� �� �������
            soObjNew.contragentAddress = soObjOld.contragentAddress; //����� ���������
            soObjNew.contragentAddressWork = soObjOld.contragentAddressWork; //������� �����
            soObjNew.contragentPhoneNumber = soObjOld.contragentPhoneNumber; //������ ���������
            soObjNew.contragentObjectWork = soObjOld.contragentObjectWork; //������, ��� ����������� ������
            soObjNew.contragentPassport = soObjOld.contragentPassport; //����������� ������ ���������
            soObjNew.contragentOkpo = soObjOld.contragentOkpo; //���� ���������
            soObjNew.contragentBossName = soObjOld.contragentBossName; //������������ ���������
            soObjNew.contragentPosition = soObjOld.contragentPosition; //��������� ���������
            soObjNew.basisType = soObjOld.basisType; //��������, �� ��������� �������� �������� ��������
            soObjNew.warrantFIO = soObjOld.warrantFIO; //��� ����������� ���� ���������
            soObjNew.warrantNumber = soObjOld.warrantNumber; //����� ������������ ���������
            soObjNew.warrantDate = soObjOld.warrantDate; //���� ������������ ���������
            soObjNew.contragentBankName = soObjOld.contragentBankName; //�������� ����� ���������
            soObjNew.contragentBankAccount = soObjOld.contragentBankAccount; //��������� ���� ���������
            soObjNew.contragentBankMfo = soObjOld.contragentBankMfo; //��� ����� ���������
            soObjNew.executorPhoneNumber = soObjOld.executorPhoneNumber; //����� �������� �����������
            soObjNew.warrantRef.code = soObjOld.warrantRef.code; //������������
            soObjNew.baseStation = soObjOld.baseStation; //������� �������
            soObjNew.commentGen = soObjOld.commentGen; //�����������
            soObjNew.contragentTypeRef.code = soObjOld.contragentTypeRef.code; //��� �����������
            soObjNew.contractDateServices = new Date();

            soObjNew.finDocCode = soObjOld.finDocCode;

            if (soObjOld.finDocID != Integer.MIN_VALUE) {
            	soObjNew.finDocID = soObjOld.finDocID;
            }

            soObjNew.partnerCode = soObjOld.partnerCode;
            soObjNew.partnerId = soObjOld.partnerId;
            soObjNew.contractNumber = soObjOld.contractNumber;

            if (soObjOld.generalContractRef.code != Integer.MIN_VALUE) {
            	soObjNew.generalContractRef.code = soObjOld.generalContractRef.code;
            }


            soObjNew.contractTypeRef.code = ENServicesContractType.TY;
            boolean saveTU = true;
            int contractStatus = Integer.MIN_VALUE;
            Date planDateStart = null;
            Date planDateFinal = null;

            /**  ��� �����, ����� �����������, ��������� �� ����� �������....
             *   ������ ����������� �� ���������
             */
            ENPlanWorkFilter calculationOldFilter = new ENPlanWorkFilter();
            calculationOldFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjOld.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";
            int calculationOldArr[] = planDao.getFilteredCodeArray(calculationOldFilter, 0, -1);

            ENPlanWorkFilter calculationNewFilter = new ENPlanWorkFilter();
            calculationNewFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjNew.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";
            int calculationNewArr[] = planDao.getFilteredCodeArray(calculationNewFilter, 0, -1);



            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjOld.element.code
            		+ " and enplanwork.kindcode not in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";

            int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
            for (int p = 0; p < planArr.length; p++) {

            	ENPlanWork plan = planDao.getObject(planArr[p]);
            	plan.elementRef.code = soObjNew.element.code;

            	planDao.save(plan);

            	contractStatus =  ENServicesContractStatus.SIGNED;

            	if (plan.kind.code == ENPlanWorkKind.CURRENT) {
                	planDateStart = plan.dateStart;
                	planDateFinal = plan.dateFinal;
            	}
            }


            ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();
            planCalcFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjNew.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";

            int planCalcArr[] = planDao.getFilteredCodeArray(planCalcFilter, 0, -1);
            for (int c = 0; c < planCalcArr.length; c++) {
            	ENPlanWork planCalc = planDao.getObject(planCalcArr[c]);

            	planCalc.status.code = ENPlanWorkStatus.LOCKED;

            	if (planDateStart != null) {
            		planCalc.dateStart = planDateStart;
            	}

            	if (planDateFinal != null) {
            		planCalc.dateFinal = planDateFinal;
            	}

            	planDao.save(planCalc);
            }



            for (int o = 0; o < calculationOldArr.length; o++) {

            	ENPlanWork plan = planDao.getObject(calculationOldArr[o]);
            	plan.elementRef.code = soObjNew.element.code;

            	planDao.save(plan);
            }

            for (int n = 0; n < calculationNewArr.length; n++) {

            	ENPlanWork plan = planDao.getObject(calculationNewArr[n]);
            	plan.elementRef.code = soObjOld.element.code;

            	planDao.save(plan);
            }


            /** ������� ����� */
            for (int a = 0; a < actCodeArr.length; a++) {

            	ENAct act = actDao.getObject(actCodeArr[a]);
            	act.element.code = soObjNew.element.code;

            	actDao.save(act);
            }


            /** ������ �������� >>> ����� �� �������
             *  ���� ���� �����, ������� ������ ���� ��������
             */
            if (contractStatus != Integer.MIN_VALUE) {
            	soObjNew.contractStatusRef.code = contractStatus;
            } else {
                soObjNew.contractStatusRef.code = soObjOld.contractStatusRef.code;
            }


            /** ���������� �������� ��� ��������� ���������� �� �������� */
			if (soObjNew.contractServicesDistance != null && soObjNew.contractServicesDistance.doubleValue() > 0) {

				/** SUPP-63202... 22.06.2017... +++ ���������� ��� ������ �����������... */
				for (int p = 0; p < calculationOldArr.length; p++) {
					ENPlanWork plan = planDao.getObject(calculationOldArr[p]);
					servicesLogic.createDistances(soObjNew, soObjNew.contractServicesDistance, plan.kind.code, plan.code);
					contractServicesSummaNew = new ServicesCalculatorLogic(netConnection, getUserProfile()).calculateServices(calculationOldArr[p]);
				}
			}

			/** �������� ����� �� �������� */
			soObjNew.contractServicesSumma = contractServicesSummaNew;
            soDao.save(soObjNew, saveTU);


            /** ������ ������� ������ */
            soObjOld.contractStatusRef.code = ENServicesContractStatus.CLOSED;
            soDao.save(soObjOld, saveTU);


            return soCodeNew;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			try {
				if (cnConnection != null && !cnConnection.isClosed()) {
					cnConnection.close();
				}

				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
				}

			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}

			closeConnection();
		}
	}



    /**
     * NET-4231 ���������� �������� �� �������������
     *
     * @param �ode - ��� ��������
     */
    public void signedPriconnections(int code) {

    	Connection authConn = null;
    	Connection enConn = null;
    	try {
        	authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());

            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            ENServicesObject obj = objDAO.getObject(code);


            /** 03.08.2016 +++ �������� �� ���������� �� */
            if (obj.contractTypeRef.code == ENServicesContractType.TY) {
            	throw new SystemException("\n "
            			+ "\n �������� �� ��������� �� �� ����������� �� �������� �� ���������!!!");
            }


            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException(
                        "�������� ��� �������� �������� ����������!");
            }

            if (obj.contractStatusRef.code == ENServicesContractStatus.SIGNED) {
                throw new SystemException("������� ��� ���������!");
            }

            if (obj.finDocID == Integer.MIN_VALUE) {
                throw new SystemException(
                        "�� ������� ������ � Գ�. ��������!");
            }

            ENTechConditionsObjects tco = soLogic.getTechCoditionByServicesObjectCode(obj.code);
			{
				if (tco.dateGen == null) {
					throw new SystemException("��������, ���� �����, ���� �������� ���� ��� ��������!");
				}
			}

            /** 17.05.2013 +++ �������� ������� ��������� ����������� */
            ENServicesObject2TechCondtnsServicesFilter so2tcsFilter = new ENServicesObject2TechCondtnsServicesFilter();
            so2tcsFilter.servicesObjectRef.code = code;
            ENServicesObject2TechCondtnsServicesDAO so2tcsDAO = new ENServicesObject2TechCondtnsServicesDAO(enConn, getUserProfile());
            int so2tcsCodeArr[] = so2tcsDAO.getFilteredCodeArray(so2tcsFilter, 0, -1);
            if (so2tcsCodeArr.length > 0) {
                ENServicesObject2TechCondtnsServices so2tcs = so2tcsDAO.getObject(so2tcsCodeArr[0]);
                ENTechConditionsServicesDAO tosDao = new ENTechConditionsServicesDAO(enConn, getUserProfile());
                ENTechConditionsServices tos = tosDao.getObject(so2tcs.techCondServRef.code);

                /** 20.05.2013 +++ ������������� ������������� ��� ����� � ������
                 *  ��������� ������������� ������������ �������������� ��������� */
                if (tos.connectionKindRef.code != ENConnectionKind.NO_STANDART &&
                		// SUPP-77614 ��� �������������� ������������� "��� ����" ���� ���� �� ����� ���������,
                		// �.�. �� ������ ������ ���� �� ������������ �������� ������� ���������
                		tos.connectionKindRef.code != ENConnectionKind.READY_MADE) {

                    if (tos.connectionKindRef.code == ENConnectionKind.UNDEFINED
                            || tos.connectionKindRef.code == ENConnectionKind.GENERAL_CONNECTION) {
                        throw new SystemException("\n"
                                 + "\n �� ��������� ��� ���������!!!");
                    } else {
                        if (tos.connectionKindRef.code == ENConnectionKind.STANDART) {
                            if (tos.tariffEntryRef.code == Integer.MIN_VALUE) {
                                throw new SystemException("\n"
                                        + "\n �� ��������� ������� ����������!!!");
                            }
                        } else {
                            ENPriconnectionDataDAO dataDAO = new ENPriconnectionDataDAO(enConn, getUserProfile());

                            ENPriconnectionDataFilter dataFilter = new ENPriconnectionDataFilter();
                            dataFilter.techCondServRef.code = tos.code;
                            int dataArr[] = dataDAO.getFilteredCodeArray(dataFilter, 0, -1);
                            if (dataArr.length == 0) {
                                throw new SystemException("\n"
                                        + "\n �� ��������� ������� ����������!!!");
                            }
                        }
                    }
                }


            } else {
                throw new SystemException("\n"
                        + "\n ������� ��� ������� ���� ��������!!!");
            }


            // NET-4295 ���� ���������� - ��. ���� ������, �� ����� ���������� � DocFlow �����������
            // ��� ����������
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

                if(soLogic.isDocFlowLifeCycleStartsWithSigning(obj))
                {
                    obj.dfPackCode = soLogic.createDocFlowPack(obj);

                       // NET-4560 - ������ ��������� ���� ���������� �����
    					soLogic.calculationBoundaryDateWork(obj);
    					// !!���������� EnServicesObject �.� ��� ������� ��������
    					// ���� ����������� ������
    					obj = objDAO.getObject(obj.code);

                }
            }

            obj.contractStatusRef.code = ENServicesContractStatus.SIGNED;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't signedPriconnections ServicesObject.Code = " + code, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /**
     * NET-4231 ������ ���������� �������� �� �������������
     *
     * @param �ode - ��� ��������
     */
    public void unSignedPriconnections(int code) {

    	Connection authConn = null;
    	Connection enConn = null;
    	try {
        	authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ENServicesObject obj = objDAO.getObject(code);

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException(
                        "�������� ��� �������� �������� ����������!");
            }

            obj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;

            //NET-4295 ������ ��������
            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
                if(soLogic.isDocFlowLifeCycleStartsWithSigning(obj))
                {
                    soLogic.deleteServicesObjectInDocFlow(obj);
                }
            }

            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't unSign ENServicesObject.Code = " + code, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /*���������� �������� ����� �� ������� EnergyNet � ������������� �� ���� ������ � ���������� EnergyWorkFlow*/
    public int completeServicesObjectByCnPack(int packID, int ssID) {


        try {
            ENServicesObjectDAO soObjDAO = new ENServicesObjectDAO(getConnection(
                    AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
            soFilter.conditionSQL =
                " ENSERVICESOBJECT.CNPACKCODE = " + packID +
                " AND ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE = " + ssID +
                " AND ENSERVICESOBJECT.CONTRACTSTATUSREFCODE <> " + ENServicesContractStatus.TERMINATED;

            int soCodes[] = soObjDAO.getFilteredCodeArray(soFilter, 0, 1);

            if (soCodes.length > 0)
              {
                ENActDAO actObjDAO = new ENActDAO(getConnection(
                        AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                ENActFilter actFilter = new ENActFilter();
                actFilter.conditionSQL =
                    " enact.elementcode in (select so.elementcode from enservicesobject so " +
                    "    where so.cnpackcode = " + packID +
                    "    and so.cnsubsystemtyperefcode = " + ssID + ")" +
                    " and enact.statusrefcode <> " + ENActStatus.CLOSED;

                int actCodes[] = actObjDAO.getFilteredCodeArray(actFilter, 0, -1);
                ENServicesObject soObj = soObjDAO.getObject(soCodes[0]);

                if (actCodes.length == 0)
                  {return 100 * soObj.statusRef.code + soObj.contractStatusRef.code;}
                else
                  {return 1000 + 100 * soObj.statusRef.code + soObj.contractStatusRef.code;} //���� �� ���������� � ������������ ����
               }
            else return -1; //�� ������ ��������������� ������ EnergyWorkFlow ������� � ������������� � EnergyNet

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't completePriconnections packID = " + packID + " ssID = " + ssID, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
     * ������� �������� �� ������� �� ������� � ������ "������ ���������"
     */
	public int finishWorks(int objCode) {
		return finishWorks(objCode, false);
	}


    /** SUPP-12236...
     *  ������ ���������� ������ ��� ��������� ������� ��������
     *  ����� ��� ����������� ����
     */
    public int finishWorks(int objCode, boolean notFinishWorks) {
    	return finishWorks(objCode, notFinishWorks, false, true);
    }


    /**
     * ������� �������� �� ������� �� ������� � ������ "������ ���������"
     *
     * @param forceRecalcServicesFact - �������� ��� ������� ����������� ������ ��� ����������� ����
     * @param validateProfitability - �������� ��� �������� ��������������
     */
    public int finishWorks(int objCode, boolean forcedRecalcServicesFact,
  		  boolean validateProfitability) {
    	return finishWorks(objCode, false, forcedRecalcServicesFact, validateProfitability);
    }


	public int finishWorks(int objCode, boolean notFinishWorks, boolean forcedRecalcServicesFact,
			boolean validateProfitability) {
		try {

			/** �������� ����������� */
			DBConnector dbConnector = new DBConnector();
			dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        	ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	servicesLogic.finishWorks(objCode, notFinishWorks, forcedRecalcServicesFact, validateProfitability);

        	return objCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't finishWorks ServicesObject.code = " + objCode, e);
		} finally {
			closeConnection();
		}
	}

	public void finishWorksForServicesObjectInFK(int objCode) {
		try {
			/** �������� ����������� */
			DBConnector dbConnector = new DBConnector();
			dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.finishWorksForServicesObjectInFK(objCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't finishWorksForServicesObjectInFK ServicesObject.code = " + objCode, e);
		} finally {
			closeConnection();
		}
	}

/*
    public void unFinishWorks(int objCode)
    {
        unFinishWorks(objCode, false, true);
    }

    public void unFinishWorks(int objCode, boolean priconnections, boolean isClient)
    {
        throw new SystemException("\n\nNET-4235 ��� ����� �������� ������ \"������ �������\" �� ���������������! ��� ��������: " + objCode);
    }
*/


	/**
	 *  ������� �������� � ������ "�������� ��������������� ����"
	 *
	 */
    public void prepaid(int svoCode) {
        prepaid(svoCode, false, true);
    }

	public void prepaid(int svoCode, boolean priconnections, boolean isClient) {
		try {

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.prepaid(svoCode, priconnections, isClient);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't prepaid ServicesObject.Code = " + svoCode, e);
		} finally {
			closeConnection();
		}
	}


    public void unPrepaid(int svoCode) {
        unPrepaid(svoCode, false, true);
    }

    public void unPrepaid(int svoCode, boolean priconnections, boolean isClient) {

    	Connection authConn = null;
    	Connection enConn = null;
    	try {
        	authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (isClient && priconnections) {
                throw new SystemException("\n NET-4231..."
                        + "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
            }

            if (obj.contractStatusRef.code != ENServicesContractStatus.PREPAID) {
                throw new SystemException("������ �� ��������� �� ����, code = " + svoCode);
            }

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
            {
            throw new SystemException("�������� ��� �������� �������� ����������!");
            }

            if (obj.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT)
            {
                throw new SystemException("\n\nNET-4235 ��� ����� �������� ����� ������� \"�������� ��������� �������\" �� ���������������! ��� ��������: " + svoCode);
            }

            ServicesLogic sl = new ServicesLogic(enConn, getUserProfile());

            sl.isCancelableServices(svoCode);

            // net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
            // ���� ��� ����������� �� ������ ����� ��� ������ ������ ������� ����� �� ����������� ��������
            if (obj.contractKindRef.code == ENServicesContractKind.SERVICES && obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET) {

            	FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), enConn);
            	fkOrderLogic.autoRemoveAllRereservedCountersForServices(obj);
                fkOrderLogic.autoRemoveFkorderMoveCounterForServices(obj);
            }

            PlanWorkLogic pl = new PlanWorkLogic(enConn, getUserProfile());
            /* ���� ���� ������������� ������ � �������� ����� ������� ������� ������ ������� ���� ���� �� � �������� �������
            * � ���� ���������� �� �������� �� ��������� �����������
            * */
            ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());
            if ( ( soLogic.isReservedCalculationInContract(svoCode) == true )  &&
                ( obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET ))

            {
                ENPlanWorkDAO planNPWDAO = new ENPlanWorkDAO(getUserProfile(), enConn);
                ENPlanWorkFilter planNPWFilter = new ENPlanWorkFilter();
                planNPWFilter.conditionSQL = " ENPLANWORK.CODE in ( " +
                " select pw.code from enplanwork pw  , enservicesobject so " +
                " where pw.elementrefcode = so.elementcode " +
                " and pw.kindcode = " + ENPlanWorkKind.NPW +
                " and so.code = " + svoCode +
                " limit 1 ) ";
                // ENPlanWorkShortList planNPWList = planNPWDAO.getScrollableFilteredList(planNPWFilter,0,-1);
                int plArr[] = planNPWDAO.getFilteredCodeArray(planNPWFilter,0,-1);
                if (plArr.length > 0){
                    ENPlanWork plObj = planNPWDAO.getObject(plArr[0]);
                    if  (plObj.status.code != ENPlanWorkStatus.GOOD) {
                        throw new SystemException("��� ����� ������ �������� �������� ���� ������� ���� ��������!");
                    }
                    else
                        // ������ ������� ����
                        pl.openPlan(plObj.code,0);
                }

            }

            //NET-4295 ������ ��������
            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
                if(!soLogic.isDocFlowLifeCycleStartsWithSigning(obj))
                {
                	soLogic.deleteServicesObjectInDocFlow(obj);
                }
            }


            obj.contractStatusRef.code = ENServicesContractStatus.SIGNED;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't unPrepaid ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
     *  �������� ����������� �������� �� �������������
     *  @param - soCodes[]
     *
     */

    public int addSolidaryConnections(int soCodes[]) {
        try {
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            /** �������� ������� ��������� */
            for (int i = 0; i < soCodes.length; i++) {
                ENServicesObject sObject = soDAO.getObject(soCodes[i]);
                if (sObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
                    throw new SystemException(
                            "\n" +
                            "\n �������� ��� �������� �������� ����������!");
                }
            }

            return 0;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        	closeConnection();
        }
    }


    public void terminate(int svoCode) {
        terminate(svoCode, false, true);
    }

    public void terminate(int svoCode, boolean priconnections, boolean isClient) {

    	Connection authConn = null;
    	Connection enConn = null;
    	try {
        	authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());
            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (isClient && priconnections) {
                throw new SystemException("\n NET-4231..."
                        + "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
            }

            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
                soLogic.cancelServicesObjectInDocFlow(obj, false);
            }

            obj.contractStatusRef.code = ENServicesContractStatus.TERMINATED;
            objDAO.save(obj);

        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't terminate ServicesObject.Code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /**
     *
     * ������� �������� � ������ "³����� ��������� �� ������"
     * @param objCode - ��� ��������
     *
     */
	public void disclaimerCustomerServices(int objCode) {
		try {

			ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			soLogic.disclaimerCustomerServices(objCode);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't disclaimerCustomerServices ServicesObject.code = " + objCode, e);
        } finally {
            closeConnection();
        }
    }


    public void closeContract(int svoCode) {
        try {
            ENServicesObjectDAO soObjDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject soObj = soObjDAO.getObject(svoCode);


            // ����� �� ��������� ���� ������
            ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
            factCalcFilter.servicesObjectRef.code = soObj.code;
            BigDecimal totalSum = new BigDecimal(0); // ����� � ��� � ��������� ����
            int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
            for (int i = 0; i < factCalcArr.length; i++) {
               ENServicesFactCalc factCalcObj = factCalcDAO.getObject(factCalcArr[i]);
               totalSum = totalSum.add(factCalcObj.totalSum);
            }

            // ���� �������� ��� ��������������� ����� ����� ����� �������� ������ �� �� ENServicesFactCalc
            if (soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
            {
                ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
                calcFilter.conditionSQL = " ENCALCCONTRACTTOTAL.code in (" +
                                            " select c.code \n" +
                                            " from enservicesobject so, enplanwork p, encalccontracttotal c \n" +
                                            " where so.code = " + soObj.code + " \n" +
                                            "   and p.kindcode = " + ENPlanWorkKind.CALCULATION + " \n" +
                                            "   and p.elementrefcode = so.elementcode \n" +
                                            "   and c.planrefcode = p.code \n" +
                                            " ) \n";
                ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

                if (calcList.totalCount == 0)
                {
                    throw new SystemException("�� �������� ���������� ��� ���������! (��� ��'����: " + soObj.code + ")");
                }

                if (calcList.totalCount > 1)
                {
                    throw new SystemException("���������� ��� ��������� ����� ������! (��� ��'����: " + soObj.code + ")");
                }

                totalSum = calcList.get(0).totalCost;
            }

           // ����� ����������� ����� �� �������� (���������� + ��������� ������������� - �������� ) ������
            ENPayment2SODAO paymentDAO = new ENPayment2SODAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
            paymentFilter.servicesObjectRef.code = soObj.code;
           // paymentFilter.orderBySQL = " ENPAYMENT2SOTYPE.CODE ";

            BigDecimal totalSumPay = new BigDecimal(0); // ����� � ��� �� ����������� ����������� ������� ��������� �������
            int paymentArr[] = paymentDAO.getFilteredCodeArray(paymentFilter, 0, -1);
            for (int i = 0; i < paymentArr.length; i++) {
               ENPayment2SO paymentObj = paymentDAO.getObject(paymentArr[i]);
               // ���������� � ��������� ������������ ������� , �������� ����� �������
               if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT ||
                paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT   ) {
                   totalSumPay = totalSumPay.add(paymentObj.sumTotal); }
               else if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_RETURN_PAY ){
                totalSumPay = totalSumPay.subtract(paymentObj.sumTotal);
               }
            }

            int partId = Integer.MIN_VALUE;
            // ��������� ������������ �� �������� �� ��������
            ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2ProvFilter so2provFilter = new ENServicesObject2ProvFilter();
            so2provFilter.servicesObjectRef.code = soObj.code;
            int[] so2provArr = so2provDAO.getFilteredCodeArray(so2provFilter, 0, -1);
            if (so2provArr.length > 0 ) {
                ENServicesObject2Prov so2provObj =  so2provDAO.getObject(so2provArr[0]);
                partId = so2provObj.partId;
            }

            // ��������� ������� � ������ "��������" ���� ����� ���������(� ���) >= ����� �� ��������� ����(� ���) � �������� ����������
            // ��� ( ������� ����������� � �������� �����)
            // ��� ( ���������� �� ����� � �������� �����)


            if ((
                    (partId != Integer.MIN_VALUE &&
                    soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
                    totalSum.doubleValue() > 0 && // ����� �������� ������ 0
                    totalSum.doubleValue() == totalSumPay.doubleValue() ) // ����� � ��������� ���� ����� ���� ��� ��������
                    || (soObj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT )  // ����������� �������
                    || (soObj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) // �������� ��������� �� ����� (
                )
                ||
                // SUPP-4588 ����� ��� ��������  ����� ������� �� ������� ������������ ������� � ������ "��������"
                 // ���� �������� ��� ��������������� ����� � ����� ����� >= ����� �� ��������� ���� (� ���) � �������� ����������
                 // ��� ������� ���������� � �������� ��� ��������������� �����
                 // ��� ���������� ��  ����� � �������� ��� ��������������� �����
                (
                        (partId != Integer.MIN_VALUE &&
                        soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION &&
                        totalSum.doubleValue() > 0 && // ����� �������� ������ 0
                        totalSumPay.doubleValue() >= totalSum.doubleValue()   ) // ������ ������ ��� ����� ����� ��������� ����
                        || (soObj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION )  // ����������� �������
                        || (soObj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION) // �������� ��������� �� ����� (
                    )
                )

            {
                // �������� ������� ������ �������� (���� ����������� �������� ������ "��������")
                soObj.prevContractStatus = soObj.contractStatusRef.code;
                soObj.contractStatusRef.code = ENServicesContractStatus.CLOSED;
                soObjDAO.save(soObj);
            }
            else {
                if (partId == Integer.MIN_VALUE) {
                    throw new SystemException("\n"
                            + "\n �� �������� �� ���� ������� ��������!");
                }


                if (totalSum.doubleValue() != totalSumPay.doubleValue() && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
                    throw new SystemException("\n"
                            + "\n ���� ��������� ���� "+ totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP) +" �� ������� ��� ����� �� �������� "  + totalSumPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP) + "!");
                }

                if (totalSum.doubleValue() != totalSumPay.doubleValue() && soObj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION) {
                    throw new SystemException("\n"
                            + "\n ���� ����� " + totalSumPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP) + " ���." + " ������� ���� ������, ��� ����������  ��� ��������� ���� "  + totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP) + " ���.!");
                }
            }

        }
        catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't closeContract ServicesObject.code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void unCloseContract(int svoCode) {
        try {

            ENServicesObjectDAO soObjDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject soObj = soObjDAO.getObject(svoCode);

            ServicesLogic sl = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            sl.isCancelableServices(svoCode);

            soObj.contractStatusRef.code = soObj.prevContractStatus;
            soObj.prevContractStatus = Integer.MIN_VALUE; // ������� ���������� ��� �������
            soObjDAO.save(soObj);
        }
        catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't closeContract ServicesObject.code = " + svoCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    private java.sql.Connection ENConnection = null;
    private java.sql.Connection EWFConnection = null;


    /**
     * ����������� ������������� �����
     *
     * @param power              - ��������
     * @param categoryRen        - ��������� ���
     * @return  classificationTypeCode - ��� �������������
     */
    private int getClassificationTypeCodeByCodeRem(BigDecimal power, int categoryRen) {

        int classificationTypeCode = Integer.MIN_VALUE;

        if (power.doubleValue() <= 16) {
            switch (categoryRen) {
            case (1): {
                classificationTypeCode = 2140013207; //2140012135;//2140011339; //2140010289; //2140010094;/*2140009882;*/ /*2140009327;*/  /*2140008637;*/ /*2140006382;*/ /*1040004738;*/ /*500004738;*/
                break;
            }
            case (2): {
                classificationTypeCode = 2140013208; //2140012136; //2140011340; //2140010290; //2140010095;/*2140009883;*/ /*2140009328;*/  /*2140008735;*/  /*2140006383;*/ /*1040004743;*/ /*500004743;*/
                break;
            }
            case (3): {
                classificationTypeCode = 2140013209; //2140012137; //2140011341; //2140010291; //2140010096;/*2140009884;*/ /*2140009329;*/  /*2140008736;*/  /*2140006384;*/ /*1040004744;*/ /*500004744;*/
                break;
            }
            case (4): {
                classificationTypeCode = 2140013210;  //2140012138; //2140011342;//2140010292; //2140010097;/*2140009885;*/ /*2140009330;*/  /*2140008737;*/  /*2140006385;*/ /*1040004745;*/ /*500004745;*/
                break;
            }
            }
        } else if (power.doubleValue() > 16 && power.doubleValue() <= 50) {
            switch (categoryRen) {
            case (1): {
                classificationTypeCode = 2140013212; //2140012139; //2140011343;//2140010305; //2140010099; /*2140009886;*/ /*2140009865;*/ /*2140009331;*/  /*2140008638;*/  /*2140006387;*/ /*1040004739;*/ /*500004739*/
                break;
            }
            case (2): {
                classificationTypeCode = 2140013213; //2140012140; //2140011344;//2140010306; //2140010100;/*2140009887;*/ /*2140009332;*/  /*2140008738;*/  /*2140006388;*/ /*1040004746;*/ /*500004746*/
                break;
            }
            case (3): {
                classificationTypeCode = 2140013214; //2140012141; //2140011345; //2140010307; //2140010101; /*2140009888;*/ /*2140009333;*/  /*2140008739;*/  /*2140006389;*/ /*1040004747;*/ /*500004747*/
                break;
            }
            case (4): {
                classificationTypeCode = 2140013215; //2140012142; //2140011346; //2140010308; //2140010102;/*2140009889;*/ /*2140009334;*/  /*2140008740;*/  /*2140006390;*/ /*1040004748;*/ /*500004748*/
                break;
            }
            }
        } else if (power.doubleValue() > 50) {
            switch (categoryRen) {
            case (1): {
                classificationTypeCode = 2140013217; //2140012143;//2140011347;//2140010301; //2140010104;/*2140009890;*/ /*2140009335;*/  /*2140008639;*/  /*2140006392;*/ /*1040004740;*/ /*500004740*/
                break;
            }
            case (2): {
                classificationTypeCode = 2140013218; //2140012144;//2140011348; //2140010302; //2140010105; /*2140009891;*/ /*2140009336;*/  /*2140008741;*/  /*2140006393;*/ /*1040004749;*/ /*500004749*/
                break;
            }
            case (3): {
                classificationTypeCode = 2140013219; //2140012145;//2140011349; //2140010303; //2140010106;/*2140009892;*/ /*2140009337;*/  /*2140008742;*/  /*2140006394;*/ /*1040004750;*/ /*500004750*/
                break;
            }
            case (4): {
                classificationTypeCode = 2140013220; //2140012146; //2140011350;//2140010304; //2140010107;/*2140009893;*/ /*2140009338;*/  /*2140008743;*/  /*2140006395;*/ /*1040004751;*/ /*500004751*/
                break;
            }
            }
        } else {
            throw new SystemException("\n"
                    + "\n ������� ��� ��������� �������� ���!!!");
        }

        return classificationTypeCode;
    }


    /**
     *  �������� ���� ���������� �� ���� ��������
     *
     *  @param soCodes - ��� ��������
     *  @return datePostings - ���� ����������
     */
    public Date getDatePostingsByServicesCode(int soCodes) {
        Date datePostings = null;
        try {
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            datePostings = soDAO.getDatePostingsByServicesCode(soCodes);

            return datePostings;

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        	closeConnection();
        }
    }


    /**
     *  ������ ������� "������ ���������"
     *
     *  @param objCode - ��� �������� (��� ENSerivcesObject)
     */
    public void undoFinishWorks(int objCode)
    {
        Connection enConn = null;
        Connection authConn = null;

        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(enConn, getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());

            ENServicesObject obj = objDAO.getObject(objCode);

            soLogic.isCancelableServices(objCode);

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
            {
                throw new SystemException("\n\nNET-4235 �������� ��� �������� �������� ����������!");
            }

            /* 19.07.2018 ��������� ���� ������ ��� ���� ���������
            if (obj.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT)
            {
                throw new SystemException("\n\nNET-4235 ��� ����� �������� ������ \"������ �������\" �� ���������������! ��� ��������: " + objCode);
            }
            */

            if (obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED)
            {
                throw new SystemException("\n\nNET-4235 ������ ������� ���� ������ \"������ �������\"!");
            }


            /** 10.12.2013 +++ �� ���� �������� ������ "������ ���������" ���� ���� ����������� ����... */
            ENActDAO actDAO = new ENActDAO(enConn, getUserProfile());
            ENActFilter actFilter = new ENActFilter();

            actFilter.element.code = obj.element.code;
            actFilter.orderBySQL = "dategen desc";

            int[] actArr = actDAO.getFilteredCodeArray(actFilter,
                    actFilter.conditionSQL, actFilter.orderBySQL, 0, -1, null);
            for (int a = 0; a < actArr.length; a++) {
                ENAct act = actDAO.getObject(actArr[a]);
                if (act.statusRef.code == ENActStatus.CLOSED) {
                    throw new SystemException("\n\n"
                            + "��� ���� ������� ������� ���������� ����!!!");
                }
            }


            ///// ������� ������ � �������� �� �����
            ENServicesFactCalcByActDAO fcaDAO = new ENServicesFactCalcByActDAO(enConn, getUserProfile());
            ENServicesFactCalcByActFilter fcaFilter = new ENServicesFactCalcByActFilter();
            fcaFilter.servicesObjectRef.code = obj.code;

            int[] fcaArr = fcaDAO.getFilteredCodeArray(fcaFilter, 0, -1);

            for (int i = 0; i < fcaArr.length; i++)
            {
                fcaDAO.remove(fcaArr[i]);
            }
            /////

            ///// ���� ���� ������, �� ���������� � ������ "�������� ��������� �������", ����� - � "ϳ��������"
            ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(enConn, getUserProfile());

            ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
            paymentSoFilter.servicesObjectRef.code = obj.code;

            int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

            if (paymentArr.length > 0)
            {
            	if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
            		obj.contractStatusRef.code = ENServicesContractStatus.PREPAID;
            	} else {
            		obj.contractStatusRef.code = ENServicesContractStatus.PAID;
            	}
            }
            else
            {
                obj.contractStatusRef.code = ENServicesContractStatus.SIGNED;
            }
            /////

            // ���� ��� ���� �������� ���������� � �������, �� �� ������, �������� "������ �������"
            ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

            	/* 11.11.2014 +++ �� ��������� ��� ������....
                if (obj.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
                        && obj.personalAccountCode != Integer.MIN_VALUE
                        && obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {

                    boolean workConnections = soLogic.checkWorks(obj.code);

                    if (workConnections) {
                        throw new SystemException("��������� ������� \"������ �������\" ��� ��������  � " +
                                obj.contractNumberServices +
                                " ��� ���� ���������� ����� ����� ��������");
                    }
                }
                */

                /*������ ������ ��������� � DocFlow*/
                soLogic.undoFinishServicesObjectInDocFlow(obj);
            }

			objDAO.save(obj);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't undoFinishWorks ServicesObject.code = " + objCode, e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}


	public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber, int departmentCode) {
		return getPersonalAccountInfo(personalAccountNumber, departmentCode, true);
	}

	public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber, int departmentCode,
			boolean isByt) {
		return getPersonalAccountInfo(personalAccountNumber, null, departmentCode, isByt);
	}

    /**
     *  �������� ������ � ������� ����� �� �������� (���)
     *
     *  @param personalAccountNumber - ������� ����
     *  @param departmentCode - ��� �������������
     *  @param isByt - true ��� ����� ����
     *
     *  @return personalAccountInfo
     */

	public PersonalServicesInfo getPersonalAccountInfo(String personalAccountNumber, String recordPointUid,
			int departmentCode, boolean isByt) {
        PersonalServicesInfo info = null;

        try {
            DepartmentLogic depLogic = new DepartmentLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            BillingServerData serverData = depLogic.getServerDataByDepartmentCode(departmentCode);

            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
            	throw new SystemException("\n \n"
                        + "������� ��� ��������� ��� ��� ��������� �������!!!");
            }

            String jndi = null;
            String ejbHome = null;

            // ��� �������� - ����������� ��������, ��� ����� - ����������
            if(isByt) {
                jndi = "ksoe/contract/RecordPointController";
                ejbHome = "com.ksoe.contract.ejb.RecordPointControllerHome";
            } else {
                jndi = "ksoe/energypro/EPRecordPointController";
                ejbHome = "com.ksoe.energypro.ejb.EPRecordPointControllerHome";
            }
            
            try {
                if(isByt) {
                	RecordPointControllerHome ejbRecordPointHome = (RecordPointControllerHome) BillingEjbCache.getHome(jndi, ejbHome,
                    		serverData.billingServerIp, serverData.billingServerJnpPort);
                    RecordPointController rpController = ejbRecordPointHome.create();

                    info = rpController.getPersonalAccountInfo(personalAccountNumber, recordPointUid, serverData.epRenCode);
                } else {
                	EPRecordPointControllerHome ejbEPRecordPointHome = (EPRecordPointControllerHome)BillingEjbCache.getHome(jndi, ejbHome,
                    		serverData.billingServerIp, serverData.billingServerJnpPort);
                    EPRecordPointController rpController = ejbEPRecordPointHome.create();

                    info = rpController.getPersonalAccountInfo(personalAccountNumber, recordPointUid, serverData.epRenCode);
                }

                if (info == null) {
                	throw new SystemException("\n \n" +
                            " �� �������� �������� ������� " + personalAccountNumber + " � ��������� �������!!!!");
                }

                return info;

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException("\n \n" + "��� ����� � ���������...");
            } catch (NamingException ne) {
                throw new SystemException("\n \n" + "��� ����� � ���������...");
            }
        } catch (DatasourceConnectException de) {
            throw new SystemException(de.getMessage(), de);
        } finally {
        	closeConnection();
        }
    }

	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt) {
		return generatePassportForRecordPoint(renCode, eic, employee, isByt, false);
	}

	public String generatePassportForRecordPoint(int renCode, String eic, int employee, boolean isByt, boolean isWithSignature) {

		if (renCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\n�� ������� ��� ���!");
		}

		if (eic == null || eic.equals("")) {
			throw new SystemException("\n\n�� ������� EIC-��� ��� ���������� ��������!");
		}

        try {
            DepartmentLogic depLogic = new DepartmentLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            BillingServerData serverData = depLogic.getServerDataByRenCode(renCode);

            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
            	throw new SystemException("\n \n"
                        + "������� ��� ��������� ��� ��� ��������� �������!!!");
            }

            String jndi = null;
            String ejbHome = null;

            if(isByt)
            {
                jndi = "ksoe/contract/RecordPointController";
                ejbHome = "com.ksoe.contract.ejb.RecordPointControllerHome";
            }
            else
            {
                jndi = "ksoe/energypro/EPReportController";
                ejbHome = "com.ksoe.energypro.ejb.EPReportControllerHome";
            }

            RecordPointControllerHome ejbRecordPointHome; // ���
            EPReportControllerHome ejbEPReportHome; // ����

            try {
                if(isByt)
                {
                    ejbRecordPointHome = (RecordPointControllerHome) BillingEjbCache.getHome(jndi, ejbHome,
                    		serverData.billingServerIp, serverData.billingServerJnpPort);
                    RecordPointController rpController = ejbRecordPointHome.create();

                    return rpController.generatePassport(eic, employee, isWithSignature);
                }
                else
                {
                    ejbEPReportHome = (EPReportControllerHome)BillingEjbCache.getHome(jndi, ejbHome,
                    		serverData.billingServerIp, serverData.billingServerJnpPort);
                    EPReportController rpController = ejbEPReportHome.create();

                    return rpController.generatePassport(eic, employee);
                }

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException("\n \n" + "��� ����� � ���������...");
            } catch (NamingException ne) {
                throw new SystemException("\n \n" + "��� ����� � ���������...");
            }
        } catch (DatasourceConnectException de) {
            throw new SystemException(de.getMessage(), de);
        } finally {
        	closeConnection();
        }
	}

	public boolean checkWorks(int code) {
		try {
			ServicesLogic soLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			boolean workConnections = soLogic.checkWorks(code);

			return workConnections;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}


    /**
     * @param  ENServicesObject
     * ����� ��� ����� �������� ��� �� ������
     * */
    public void changeContractFin(ENServicesObject soObj) {
        try {
            ENServicesObjectDAO soObjDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            if (soObj.code == Integer.MIN_VALUE)
            {
            	throw new SystemException("\n"
            			+ "������� ��� ��������� �������� �� ������� !!! ");
            }

            // ��������� ������������ �� �������� �� ��������
            ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2ProvFilter so2provFilter = new ENServicesObject2ProvFilter();
            so2provFilter.servicesObjectRef.code = soObj.code;
            int[] so2provArr = so2provDAO.getFilteredCodeArray(so2provFilter, 0, -1);
            if (so2provArr.length > 0 ) {

            	throw new SystemException("\n"
            			+ "��������� ������ ������, ��� ���� ������� �������� !!! ");
            }

			ENServicesObject soObjNew = soObjDAO.getObject(soObj.code);

			soObjNew.contractNumber = soObj.contractNumber;
			soObjNew.contractDate = soObj.contractDate;
			soObjNew.name = soObj.name;
			soObjNew.partnerCode = soObj.partnerCode;
			soObjNew.finDocCode = soObj.finDocCode;
			soObjNew.finDocID = soObj.finDocID;
			soObjNew.commentGen = soObj.commentGen;


            soObjDAO.save(soObjNew);


        }
        catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't closeContract ServicesObject.code = " + soObj.code, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



    /* ������� �������� � ������ "���������� ������� ����������"*/
    public void changeBuhStatusToClosedByBuh(int servicesObjectCode)  {
    	try {
    		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject soObj = soDAO.getObject(servicesObjectCode);

            if (soObj.code == Integer.MIN_VALUE || soObj == null)
            {
            	throw new SystemException("������� ��� ��������� �������� �� ������� !!! ");
            }

            if (soObj.statusRef.code != ENServicesObjectStatus.GOOD) {
            	throw new SystemException("������ ��� ����������!");
            }

            soObj.statusRef.code = ENServicesObjectStatus.CLOSED_BY_BUH_SPRAV;
            soDAO.save(soObj);

    	} catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't changeBuhStatusToClosedByBuh ServicesObject.code = " + servicesObjectCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }

    }


	/* ENServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENServicesObjectShortList getEasyShortList(
			ENServicesObjectFilter filterObject, int fromPosition, int quantity) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getEasyShortList(filterObject, fromPosition, quantity, null);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENServicesObject%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENServicesObject. �������� ������ �� ������ */
	public ENServicesObjectShort getShortObject(int code) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getShortObject(code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENServicesObject%} ShortObject.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 *
	 * SUPP-45999 ��������, ��� ����� ������� ��� ���������� ��� ��������� �������� � ��
	 *
	 * @param object ������ ��������
	 * @return true - ����������, false - ���
	 */
	public boolean checkPartnersCode(ENServicesObject object) {
        try {
        	FKLogic2 logic = new FKLogic2(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
            return logic.checkPartnersCode(object.finDocID, object.partnerCode);
        }
        catch (DatasourceConnectException e) {throw new SystemException("��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",e);}
        finally                              {closeConnection();}
	}

    /**
     *
     * ���������� ���� ��������� �� ����������� �������������� �������� �� ��
     *
     * @param agreeId ���������� ������������� ��������
     * @return ���� � ����������
     */
	public SpravPartner[] getListOfPartnersForAgree(ENServicesObject object, int offSet, int limit) {
        try {
        	FKLogic2 logic = new FKLogic2(
        			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
            List<SpravPartner> list =  logic.getListOfPartnersByAgreeId(object.finDocID, offSet, limit);
            return list.toArray(new SpravPartner[list.size()]);
        }
        catch (DatasourceConnectException e) {throw new SystemException("��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",e);}
        finally                              {closeConnection();}
	}

	/**
	 *
	 * ��������������� ��� �������� �� ���. ��������� (��� �������, ��� �� �������� ���� �������)
	 *
	 * @param object ������ ��������
	 */
	public void refreshPartnerInfo(ENServicesObject object) {
        try {
        	ENServicesObjectDAO dao = new ENServicesObjectDAO(
        			getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	FKLogic2 logic = new FKLogic2(
        			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
            List<SpravPartner> partner = logic.getListOfPartnersByAgreeId(object.finDocID, 0, -1);
            if(partner.size() == 1) {
            	ENServicesObject oldObject = dao.getObject(object.code);
            	oldObject.name = partner.get(0).getName();
            	oldObject.partnerCode = partner.get(0).getCode();
            	dao.save(oldObject);
            } else {
            	throw new SystemException(String.format("������� � ������� ��������: %d", partner.size()));
            }
        }
        catch (DatasourceConnectException e) {throw new SystemException("��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",e);}
        catch (PersistenceException e) {
        	throw new SystemException(e);
		}
        finally                              {closeConnection();}
	}

	public boolean isContainsKSU(int soCode) {
		try {
			return new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).isContainsKSU(soCode);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}

	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode) {
		try {
			return new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).isGiveCounterOnBalanceByServicesObjectCode(soCode);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}

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
	public void changeLinkBetweenServices(ENElement2ENElement element2element) {
		try {
			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.changeLinkBetweenServices(element2element);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			this.closeConnection();
		}
	}


	/*public void refreshPartnerInServicesObject(ENServicesObject object) {

	}*/

	public void updatePersonalAccount(int servicesObjectCode, int personalAccountCode, String personalAccountNumber,
			String eic, String personalAccountUid) {
		try {

			if(personalAccountCode == Integer.MIN_VALUE
					|| personalAccountCode == 0
					|| personalAccountNumber == null || personalAccountNumber.trim().length() == 0) {
				throw new SystemException("�� ������� �������� �������");
			}

			ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TechConditionsLogic techCondLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTechCond2PlanWorkDAO techCond2PlanWorkDao = new ENTechCond2PlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElementDAO elementDao = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENRecordPointBytDAO bytDao = new ENRecordPointBytDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENRecordPointPromDAO promDao = new ENRecordPointPromDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENServicesObject so = servicesObjectDAO.getObject(servicesObjectCode);

			int techCondCode = techCondLogic.getTechCodeBySoCode(so.code);

			boolean isChanged = so.personalAccountCode != Integer.MIN_VALUE && so.personalAccountCode != 0
					&& !(personalAccountCode == so.personalAccountCode && Tools.equals(so.personalAccountNumber, personalAccountNumber));

			if(isChanged) {
				if(techCondCode != Integer.MIN_VALUE) {
					ENTechCond2PlanWorkFilter techCondPlanFilter = new ENTechCond2PlanWorkFilter();
					techCondPlanFilter.techConServicesRef.code = techCondCode;
					ENTechCond2PlanWorkShortList techCondPlanList = techCond2PlanWorkDao.getScrollableFilteredList(techCondPlanFilter, 0, -1);
					for(ENTechCond2PlanWorkShort techCondPlanItem : techCondPlanList.list) {
						ENPlanWork plan = planDao.getObjectNOSEGR(techCondPlanItem.planRefCode);
						ENElement element = elementDao.getObject(plan.elementRef.code, false);
						if(element.typeRef.code == ENElementType.TY_BYT) {
							ENRecordPointByt rp = bytDao.getObjectByElementCode(element.code, false);
							if(rp != null && !Tools.equals(rp.accountNumber, personalAccountNumber)) {
								throw new SystemException(String.format("��������� ������ �������� ������� � %s �� %s ��� �������� � %s,\n"
										+ "��� �� ��� � ���� �� ���. ����� %d, ���'������ � ��� ���������, �� �������� ������� %s!"
										, so.personalAccountNumber, personalAccountNumber
										, so.contractNumberServices, plan.code, rp.accountNumber));
							}
						} else if(element.typeRef.code == ENElementType.TY_PROM) {
							ENRecordPointProm rp = promDao.getObjectByElementCode(element.code, false);
							if(rp != null && !Tools.equals(rp.accountNumber, personalAccountNumber)) {
								throw new SystemException(String.format("��������� ������ �������� ������� � %s �� %s ��� �������� � %s,\n"
										+ "��� �� ��� � ���� �� ���. ����� %d, ���'������ � ��� ���������, �� �������� ������� %s!"
										, so.personalAccountNumber, personalAccountNumber
										, so.contractNumberServices, plan.code, rp.accountNumber));
							}
						}
					}
				}

				/* � ������ �������� ��� ������.
				 * ��-������, �� ������� ������� ��������� ���. ����� �� �������� �� ������, �.�. ��� �� ����������� �����, ����� ��� �� ������ ��������.
				 * � ��-������, ���� �������� �� ������������ ���. ����� ����������� ��� �����, ����� ���� ������� �������
				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.elementRef.code = so.element.code;
				ENPlanWorkShortList planList = planDao.getFilteredList(planFilter);
				for(ENPlanWorkShort plan : planList.list) {
					planLogic.checkPlanInWorkOrderByt(plan.code, null);
				}
				*/
			}

			servicesObjectDAO.updatePersonalAccount(servicesObjectCode, personalAccountCode, personalAccountNumber, eic, personalAccountUid);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't updatePersonalAccount {%com.ksoe.energynet.valueobject.ENServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 *   �������� ������ � �������� � ������������� - ����� �� ������������� ���������
	 *
	 *   @param address - �����
	 *   @param bank - ����
	 *   @param bankAccount - ����� ����� ����
	 *   @param customerType - ��� ��������  0 - ����, 1 - �����
	 *   @param renId - ��� ����
	 *   @param subsystemId - ������ 26 ��� �������������
	 *   @param name - ��� �������
	 *   @param mfo - ���
	 *   @param okpo - ����
	 *   @param contragentPassport - ������� ��� �������
	 *   @param phone - �������
	 *   @param power - ����������
	 *   @param voltage - ������������ �������
	 *
	 *   @param connectionPowerPlaces - ̳��� ������������ ��������� �ᒺ��� ���������
	 *   @param connectionPowerPoint - ����� ��������� (���� ��������� ��������� �ᒺ��� ���������)
     *   @param attachments - �������� � �������� �� �������������
	 *   @param postAddress - �������� �����
	 *	 @param customerEmail - email
	 *
	 *   @return packId - ��� ������
	 */
	public int addConnectionPackFromSite(String address, String bank,
                                         String bankAccount, int customerType, int renId, int subsystemId,
                                         String name, String mfo, String okpo, String contragentPassport, String phone,
                                         double power, double voltage, String connectionPowerPlaces, String connectionPowerPoint,
                                         Attachment[] attachments, String postAddress, String customerEmail) {

		int packId = Integer.MIN_VALUE;
		int soCode = Integer.MIN_VALUE;

		try {
			// �����
			WFSubsystemRef subsystemRef = new WFSubsystemRef();
			subsystemRef.setCode(WFSubsystem.CONNECTION);
			WFDepartmentRef departmentRef = new WFDepartmentRef();
			departmentRef.setCode(DepartmentUtil.getWFDepartmentCode(renId));

			WFPack pack = new WFPack();
			pack.setSubsystem(subsystemRef);
			pack.setDepartment(departmentRef);
			pack.setFromSite(WFPack.FROM_SITE_YES);
			pack.setName(name);
			pack.setCustomerName(name);
			pack.setCustomerPhone(phone);
			pack.setDateRegistration(new Date());
			pack.setCustomerAddress(address);
			pack.setPower(new BigDecimal(power));
			pack.setCustomerEmail(customerEmail);


			/** ������� ����� */
			ENServicesObject servicesObject = new ENServicesObject();
			servicesObject.customerEmail = customerEmail;
			servicesObject.contragentBankName = bank;
			servicesObject.contragentAddressWork = address;
			servicesObject.contragentBankAccount = bankAccount;
			servicesObject.contragentBankMfo = mfo;
			servicesObject.contragentOkpo = okpo;
			servicesObject.contragentPassport = contragentPassport;
			servicesObject.contragentPhoneNumber = phone;
			servicesObject.createdFromSite = ENConsts.CREATED_FROM_SITE_YES;
			servicesObject.tension_point = new BigDecimal(voltage);
			servicesObject.contragentTypeRef.code = customerType;
			servicesObject.customerMailingAddress = postAddress;
			if (postAddress != null && postAddress.trim().length() > 5) {
				servicesObject.postCode = postAddress.trim().substring(postAddress.trim().length() - 5);
			}

			Context cnt = new InitialContext();
			Object objRef = cnt.lookup(WFPackController.JNDI_NAME);
			WFPackControllerHome packHome = (WFPackControllerHome) PortableRemoteObject
					.narrow(objRef, WFPackControllerHome.class);
			WFPackController packController = packHome.create();

			packId = packController.addPack(pack, WFBaseProcess.CONNECTION_HOE, servicesObject);


			objRef = cnt.lookup(WFPack2ServicesObjectController.JNDI_NAME);
			WFPack2ServicesObjectControllerHome pack2servicesObjectHome = (WFPack2ServicesObjectControllerHome) PortableRemoteObject
					.narrow(objRef, WFPack2ServicesObjectControllerHome.class);

			WFPack2ServicesObjectController pack2ServicesObjectController = pack2servicesObjectHome.create();
			WFPack2ServicesObjectFilter pack2ServicesObjectFilter = new WFPack2ServicesObjectFilter();
			pack2ServicesObjectFilter.pack.code = packId;
			WFPack2ServicesObjectShortList pack2ServicesObjectShortList = pack2ServicesObjectController.getFilteredList(pack2ServicesObjectFilter);

			if (pack2ServicesObjectShortList.size() != 1) {
				throw new SystemException("������� ������ ����� ������ WFPack2ServicesObject");
			}

			WFPack2ServicesObjectShort pack2ServicesObject = pack2ServicesObjectShortList.get(0);
			soCode = pack2ServicesObject.soCode;

			servicesObject = getObject(soCode);

			/**  ����� ������������� �� ���.�������....  */
			ENTechConditionsObjectsDAO enTechConditionsObjectsDao = new ENTechConditionsObjectsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENTechConditionsObjects enTechConditionsObjects = enTechConditionsObjectsDao.getObject(servicesObject.techConObjects.code);

			enTechConditionsObjects.connectionPowerPlaces = connectionPowerPlaces;
			enTechConditionsObjects.connectionPowerPoint = connectionPowerPoint;

			enTechConditionsObjectsDao.save(enTechConditionsObjects);

			objRef = cnt.lookup(ENDocAttachment2ENServicesObjectController.JNDI_NAME);
			ENDocAttachment2ENServicesObjectControllerHome doc2soHome = (ENDocAttachment2ENServicesObjectControllerHome) PortableRemoteObject
					.narrow(objRef, ENDocAttachment2ENServicesObjectControllerHome.class);
			ENDocAttachment2ENServicesObjectController doc2soController = doc2soHome.create();

			WorkFlowLogic wfLogic = new WorkFlowLogic(getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE), getUserProfile());

			int idDoc = wfLogic.getDocIdForCreateAttachmentLinkToSiteForConnection(packId);

			for (Attachment attachment : attachments) {
				ENDocAttachment da = new ENDocAttachment();
				da.commentGen = attachment.getFileDescription();
				da.typeRef.code = attachment.getDocTypeCode();
				int endocattcode = doc2soController.add(da, attachment.getFile(), attachment.getFileName(), soCode, Integer.MIN_VALUE, true);

				ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(
						getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				da = daDAO.getObject(endocattcode);

				wfLogic.createAttachmentLinkToSiteForConnection(attachment.getGroup(), idDoc, packId, da.fileLink, attachment.getDocTypeCode());
			}

			return packId;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

	}


	/* �������� �������� ��� ��������� ������� */
	public void autoCreateFkOrderMoveCounterForServices(String kod_inv , String contractnumberservices ) {
		try {

		FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENServicesObjectFilter soFil = new ENServicesObjectFilter();
		soFil.contractNumberServices = contractnumberservices;
		int[] soArr = soDAO.getFilteredCodeArray(soFil, 0, -1);

		if(soArr.length == 0){
			throw new SystemException(" !!! ����������� ����� ��������///  param_in = " + contractnumberservices );
		}
		ENServicesObject soObj = soDAO.getObject(soArr[0]);

		fkOrderLogic.autoCreateFkOrderMoveCounterForServices(kod_inv,	soObj.code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't autoCreateFkOrderMoveCounterForServices ",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(
					"Can't autoCreateFkOrderMoveCounterForServices ",
					e);
			}
		finally {
			closeConnection();
		}
	}


	/**
	 *  ���������� �������� ��� ������ EnergyWorkFlow - ����� �� ������������� ���������
	 *
	 *  @param packId - ��� WFPack
	 *  @param attachments - �������� � �������� �������������
	 *
	 */
	public void saveFiles2ConnectionPack(int packId, Attachment[] attachments) {

		try {

			WorkFlowLogic wfLogic = new WorkFlowLogic(getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE), getUserProfile());

			// ���������� �������� � ������������ ����� ������ �� ������ ��������
			 if (wfLogic.checkPackWaitState(packId)!=Integer.MIN_VALUE) {
				Context context = new InitialContext();
				Object objRef = context.lookup(WFPack2ServicesObjectController.JNDI_NAME);
				WFPack2ServicesObjectControllerHome pack2servicesObjectHome = (WFPack2ServicesObjectControllerHome) PortableRemoteObject
						.narrow(objRef, WFPack2ServicesObjectControllerHome.class);
				WFPack2ServicesObjectController pack2ServicesObjectController = pack2servicesObjectHome.create();
				WFPack2ServicesObjectFilter pack2ServicesObjectFilter = new WFPack2ServicesObjectFilter();
				pack2ServicesObjectFilter.pack.code = packId;
				WFPack2ServicesObjectShortList pack2ServicesObjectShortList = pack2ServicesObjectController.getFilteredList(pack2ServicesObjectFilter);

				if (pack2ServicesObjectShortList.size() != 1) {
					throw new SystemException("������� ������ ����� ������ WFPack2ServicesObject");
				}

				WFPack2ServicesObjectShort pack2ServicesObject = pack2ServicesObjectShortList.get(0);
				int servicesObjectCode = pack2ServicesObject.soCode;

				context = new InitialContext();
				objRef = context.lookup(ENDocAttachment2ENServicesObjectController.JNDI_NAME);
				ENDocAttachment2ENServicesObjectControllerHome doc2soHome = (ENDocAttachment2ENServicesObjectControllerHome) PortableRemoteObject
						.narrow(objRef, ENDocAttachment2ENServicesObjectControllerHome.class);
				ENDocAttachment2ENServicesObjectController doc2soController = doc2soHome.create();

				int idDoc = wfLogic.getDocIdForCreateAttachmentLinkToSiteForConnection(packId);

				for (Attachment attachment : attachments) {
					ENDocAttachment da = new ENDocAttachment();
					da.typeRef.code = attachment.getDocTypeCode();
					da.commentGen = attachment.getFileDescription();
					int endocattcode = doc2soController.add(da, attachment.getFile(), attachment.getFileName(), servicesObjectCode, Integer.MIN_VALUE, true);

					ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(
							getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					da = daDAO.getObject(endocattcode);
	            	Connection dfConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
					AttachmentsLogic attLogic = new AttachmentsLogic(dfConn, getUserProfile());
	            	int actionCode = attLogic.getForSiteAttachmentType(attachment.getDocTypeCode());
	            	if (actionCode != Integer.MIN_VALUE) {
	            		if (actionCode == ENDocAttachmentAction.IS_FOR_SITE_CUSTOMER) {
	    					wfLogic.createAttachmentLinkToSiteForConnection(attachment.getDocTypeCode() + 100, idDoc, packId, da.fileLink, attachment.getDocTypeCode());
	            		}
	            	}	else {
	            		wfLogic.createAttachmentLinkToSiteForConnection(attachment.getGroup(), idDoc, packId, da.fileLink, attachment.getDocTypeCode());
	            	}

				}

				wfLogic.switchConnectionPackState(packId);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 * ��������� �� �� ���� ��� ������ ��������
	 *
	 * @param divId - ��� �������������
	 *
	 * @return ��� ��������
	 */
	public String getAgreeCode(int divId) {
		try {

			ContractLogic contractLogic = new ContractLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return contractLogic.getAgreeCode(divId);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't getAgreeCode", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * �������� �������� � �� � AX
	 */
	public int addAgree(FINContracts finContract) {

		return addAgree(finContract, Integer.MIN_VALUE);

	}

	/**
	 * �������� �������� � �� � AX
	 */
	public int addAgree(FINContracts finContract, int partner_rschet_id) {

		AXTransactionsLogic axLogic = null;
		String _messageId = "";

		try {

			if (finContract.supervisoryDate != null ||
					(finContract.supervisoryNumber != null && ! finContract.supervisoryNumber.equals(""))) {

				String note1 = "��������� ����";

				if (finContract.supervisoryNumber != null && ! finContract.supervisoryNumber.equals("")) {
					note1 = note1 + " � " + finContract.supervisoryNumber;
				}

				if (finContract.supervisoryDate != null) {
					note1 = note1 + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(finContract.supervisoryDate);
				}

				finContract.note1 = note1;
			}




			ContractLogic contractLogic = new ContractLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			int agree_id = contractLogic.addAgree(finContract);

			// ����� �������� �������� �������� ��� ����� ���������������
			contractLogic.updateAgreeRespCenter(agree_id);

			if (finContract.org != null && finContract.org.id != Integer.MIN_VALUE) {
				contractLogic.addAgreePartnerLink(agree_id, finContract.org.id, "U", partner_rschet_id);
			}

			///////////////////////////////////////////////////////////////////////////////////////////////
	        boolean isCustomer;

	        if (finContract.io_flag.equals("S")) {

	        	isCustomer = true;

	        } else if (finContract.io_flag.equals("B")) {

	        	isCustomer = false;

	        } else {

	        	throw new SystemException("\n\nMDAX-441 �� ������ ����������� �������� (�������/�������)!");

	        }

			finContract.org = contractLogic.fillRQOrgCodes(finContract.org, isCustomer);



			/////
	        //int axContractGroup = contractLogic.getAXContractGroup(finContract.agree_group_id);
			AXContractGroup axContractGroup = contractLogic.getAXContractGroup(finContract.agree_group_id);

	        if (axContractGroup == null) {
	        	throw new SystemException("\n\nMDAX-441 � AX �� ������� ������ ���������, ��������������� ������ �� �� � ����� " +
	        			finContract.agree_group_id);
	        }

	        String rContractCode = "" + axContractGroup.ax_id;

	        AxdEnumCustVendRContractTypeUA rContractType = AxdEnumCustVendRContractTypeUA.UNDEFINED;

	        // ��� ������������� ��� �������� ������������� ��������
	        if (axContractGroup.is_priconnection == 1) {
	        	rContractType = AxdEnumCustVendRContractTypeUA.ENERGY_SUPPLY;
	        } else {
	        	rContractType = contractLogic.getAXContractType(finContract.gk_kategory);
	        }
			/////

			axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			String usr = axLogic.getUserSecurity().domainUserName;
			String pwd = axLogic.getUserSecurity().userPass;

			// ��������� ���������� � AX
			_messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);

			// ���� ���� ������ �� ������������ �������, �.�. ��� ���. ����������, �� � AX ������ ����������
			// �� �������� ������� ��������� - ���������� ������ ������ �������
			//*****************************************************************************************************************
			if (finContract.parent_id != Integer.MIN_VALUE) {

				ENServicesObjectShort mainAgreement = contractLogic.getMainAgreementForFinContract(finContract);

				if (mainAgreement == null) {
					throw new SystemException("\n\n�� ������� ���������� ������������ ������� ��� �������� �� ��!");
				}

		        // ������ ������������� ����� ���. �������� ��� ���.����.: NULL-��� �������������/0-����������/1-���������
		    	AddReplaceUA contractAmountReplace;

		    	if (finContract.summ_changemode == 0) {

		        	contractAmountReplace = AddReplaceUA.ADD;

		        } else if (finContract.summ_changemode == 1) {

		        	contractAmountReplace = AddReplaceUA.REPLACE;

		        } else {

		        	throw new SystemException("\n\nMDAX-441 �������� ������ ������������� ����� ���. �������� (���������/��������)!");

		        }

		        RContractAddAgreeKSService_Service rContractAddAgreeService = new RContractAddAgreeKSService_Service();
		        RContractAddAgreeKSService rContractAddAgreeProxy = rContractAddAgreeService.getBasicHttpBindingRContractAddAgreeKSService();
		        ((BindingProvider) rContractAddAgreeProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
		        ((BindingProvider) rContractAddAgreeProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

		        RContractAddAgreementCreator contractAddAgreementCreator = new RContractAddAgreementCreator(rContractAddAgreeProxy);

		    	contractAddAgreementCreator.addAdditionalAgreement(finContract, mainAgreement, rContractCode, isCustomer, contractAmountReplace);

		        // ��������� ���������� � AX
		        axLogic.aifttscommit(_messageId);

				return agree_id;
			}
			//*****************************************************************************************************************

	        String hrmOrgId = contractLogic.getHrmOrgIdByTabNumber(finContract.tabn_otvlico);

			///////
	        RContractTableCreateKSService_Service rContractTableService = new RContractTableCreateKSService_Service();
	        RContractTableCreateKSService rContractTableProxy = rContractTableService.getBasicHttpBindingRContractTableCreateKSService();
	        ((BindingProvider) rContractTableProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
	        ((BindingProvider) rContractTableProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

	        ContractCreator contractCreator = new ContractCreator(rContractTableProxy);

	        // ��������� �������
	        String id = "";
			try {
				id = contractCreator.addAgree(finContract, rContractCode, rContractType, isCustomer,
						axContractGroup.is_request, hrmOrgId);
			} catch (Exception e) {

				// ���������� ���������� � AX
				axLogic.aifttsabort(_messageId);

				throw new SystemException(e.getMessage(), e);
			}

	        if (id == null || id.equals("")) {
	        	// ���������� ���������� � AX
	        	axLogic.aifttsabort(_messageId);

	        	throw new SystemException("\n\nMDAX-441 ������� ��� �������� �������� � AX!");
	        }


	        // ��������� ���������� � AX
	        axLogic.aifttscommit(_messageId);

			return agree_id;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't addAgree", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding) {
		this.bindCounterToServicesObject(invNumber, so, ignorePrice, isBinding, null);
	}

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
	 * @param molCode - ���� �������� ��� ��� �� ������� ������������ ������� (�������� {@code null})
	 */
	public void bindCounterToServicesObject(String invNumber, ENServicesObject so, boolean ignorePrice, boolean isBinding, String molCode) {

		Connection enConn = null;
		Connection finConn = null;

		try {

			UserProfile userProfile = getUserProfile();
			enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			if(invNumber == null || invNumber.length() == 0) {
				throw new java.lang.IllegalArgumentException("�� ������� ����������� �����");
			}

			SCCounterDAO dao = new SCCounterDAO(enConn, userProfile);
		    com.ksoe.energynet.logic.SCLogic logic = new com.ksoe.energynet.logic.SCLogic(enConn, finConn, userProfile);

		    // ��������, ��� ��� ��� ����������� �����-������� � ����������� ���������
		    // ��� ����� ��������
	        SCCounterFilter cFilter = new SCCounterFilter();
	        cFilter.kindRef.code = SCCounterKind.FOR_FACT;

	        cFilter.conditionSQL =  "exists (select cc.code from  " +
	        " sccounter as cc inner join enestimateitem as e on cc.estimateitemrefcode = e.code " +
	        " inner join enplanwork as pw on e.planrefcode = pw.code " +
	        " where " +
	        " cc.code = SCCOUNTER.CODE " +
	        " and pw.elementrefcode = ? " +
	        " and cc.statusrefcode <> ? " +
	        ((isBinding) ? "" : " and cc.invnumber = ? ") +
	        " and e.kindrefcode <> ?)" ;

	        Vector<Object> vecCFilter = new Vector<>();
	        vecCFilter.add(so.element.code);
	        vecCFilter.add(SCCounterStatus.CANCELED);
	        if(!isBinding) {
		        vecCFilter.add(invNumber);
	        }
	        vecCFilter.add(ENEstimateItemKind.UNMOUNT);

	        long count = dao.count(cFilter, vecCFilter);

	        if(count > 0) {
	        	if(isBinding) {
		        	throw new SystemException(String.format("��� �������� � %s ��� ������������ "
		        			+ "�������� � �����-�������!", so.contractNumberServices));
	        	} else {
		        	throw new SystemException(String.format("˳������� � ���. � %s ��� ������������ � �����-�������!", invNumber));
	        	}
	        }

			if(isBinding) {
				FKOrderLogic fklogic = new FKOrderLogic(userProfile, enConn);
				fklogic.autoCreateFkOrderMoveCounterForServices(invNumber, so.code, ignorePrice, molCode);
			} else {
			    ServicesLogic sLogic = new ServicesLogic(enConn, userProfile);
			    SCCounterShortList reReservedList = sLogic.getAllRereservedCountersForServices(so);
			    for(SCCounterShort counter : reReservedList.list) {
			        if(counter.invNumber.equals(invNumber)) {
			            SCCounter obj = dao.getObject(counter.code);
			            logic.removeRereservedCounter(obj);
			            return;
			        }
			    }

				ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();
				counterFilter.invNumber = invNumber;
				ENMetrologyCounterShortList counterList = logic.getCountersListFromScanCounter(counterFilter, 0, -1);
				if (counterList.totalCount != 1) {
					throw new SystemException("������� � �������");
				}
				if (counterList.get(0).phasity == Integer.MIN_VALUE) {
					throw new SystemException(
							String.format("� ��������� � %s �� ����������� �������", counterList.get(0).invNumber));
				}
				if (counterList.get(0).phasity != 1 && counterList.get(0).phasity != 3) {
					throw new SystemException(String.format("������� ������� � ��������� ���. � %s: %d ",
						counterList.get(0).invNumber, counterList.get(0).phasity));
				}
				Integer newEstimateItemCode = null;
				if(counterList.get(0).phasity == 1) {
					newEstimateItemCode = ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1;
				} else {
					newEstimateItemCode = ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3;
				}

				int oldEstimateItemCode = sLogic.getENEstimateItemCodeCounterByServicesObjectAndKindPlan(so.element.code, ENPlanWorkKind.CURRENT);
				if(oldEstimateItemCode == Integer.MIN_VALUE) {
					throw new SystemException("����������� �������� ��� �������� � " + so.contractNumberServices);
				}

				RQFKOrderItem2ENEstimateItemDAO fiesDao = new RQFKOrderItem2ENEstimateItemDAO(enConn, userProfile);
				RQFKOrderItem2ENEstimateItemFilter fiesFilter = new RQFKOrderItem2ENEstimateItemFilter();
				fiesFilter.estimateItem.code = oldEstimateItemCode;

				int[] codes = fiesDao.getFilteredCodeArray(fiesFilter, 0, -1);
				boolean isDeleted = false;
				if(codes.length == 1) {
					RQFKOrderItem2ENEstimateItem obj = fiesDao.getObject(codes[0]);

					RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(enConn, userProfile);
					Vector<Integer> vec = new Vector<>();
					vec.add(obj.fkOrderItemRef.code);
					RQFKOrderFilter fkOrderFilter = new RQFKOrderFilter();
					fkOrderFilter.conditionSQL = " exists (select 1 from rqfkorderitem as fi1 where fi1.fkorderrefcode = RQFKORDER.CODE and fi1.code = ?)";
					int[] fkOrderCodes = fkOrderDao.getFilteredCodeArray(fkOrderFilter, fkOrderFilter.conditionSQL, "", 0, -1, vec);
					RQFKOrder fkOrder = fkOrderDao.getObject(fkOrderCodes[0]);

					if(!fkOrder.molInCode.substring(0,2).equals(fkOrder.molOutCode.substring(0,2))
						&& fkOrder.isMaterialsSent != 1
					&& fkOrder.status.code != RQFKOrderStatus.COUNTER_IN_SC) {
						if(fkOrder.status.code == RQFKOrderStatus.CREATED) {
							fkOrder.status.code = RQFKOrderStatus.GOOD;
							fkOrderDao.save(fkOrder);
							fkOrder = fkOrderDao.getObject(fkOrder.code);
						}
						FKOrderLogic fkLogic = new FKOrderLogic(getUserProfile(), enConn);
						fkLogic.removeFKOrderWithStrings(fkOrder, false);
						isDeleted = true;
					}
				}
				if(Arrays.asList(ENMetrologyCounter.MOVED_LOCK, ENMetrologyCounter.SERVICES_COUNTERS_LOCK).contains(counterList.get(0).lockCode)) {
					logic.lockCounterInSC_(counterList.get(0).scCode, null, null, (-1) * counterList.get(0).lockCode);
				}
				if(counterList.get(0).enestimateItemCode != Integer.MIN_VALUE) {
					logic.updateCounterEstimateCode(counterList.get(0).scCode, Integer.MIN_VALUE);
				}

				if(isDeleted) {
					return;
				}

				for(int code : codes) {
					RQFKOrderItem2ENEstimateItem obj = fiesDao.getObject(code);
					if(obj.scCounterRef.code != Integer.MIN_VALUE) {
						SCCounter counter = dao.getObject(obj.scCounterRef.code);
						if(!counter.invNumber.equals(invNumber)) {
							/*SUPP-97588*/ continue;
						}
						counter.estimateItemRef.code = newEstimateItemCode;
						dao.save(counter);
					}
					obj.estimateItem.code = newEstimateItemCode;
					fiesDao.save(obj);
				}

			}
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

		}
	}

	/**
	 * �������� ������ �������� � ��������� � �� � AX
	 */
	public void addAgreePartnerLink(int agree_id, int partner_id, String partner_status, int partner_rschet_id) {
		try {

			if (partner_status == null || partner_status.equals("")) {
				throw new SystemException("\n\n�� ������� ��� ����������� (�볺��/������������)!");
			}

	        boolean isCustomer;

	        if (partner_status.equals("C")) {
	        	isCustomer = true;
	        } else if (partner_status.equals("S")) {
	        	isCustomer = false;
	        } else {
	        	throw new SystemException("\n\n�� ��������� ��� ����������� (\"" + partner_status + "\")!");
	        }

	        ContractLogic contractLogic = new ContractLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

	        String rContractPartnerCode = contractLogic.getAXOrgCode(partner_id, isCustomer);
	        String rContractAccount = contractLogic.getAXContractCode(agree_id);

			contractLogic.addAgreePartnerLink(agree_id, partner_id, partner_status, partner_rschet_id);

			/////
			AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			String usr = axLogic.getUserSecurity().domainUserName;
			String pwd = axLogic.getUserSecurity().userPass;

			// ��������� ���������� � AX
			String _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);

	        RContractPartnerLinkKSService_Service rContractPartnerLinkService = new RContractPartnerLinkKSService_Service();
	        RContractPartnerLinkKSService rContractPartnerLinkProxy = rContractPartnerLinkService.getBasicHttpBindingRContractPartnerLinkKSService();
	        ((BindingProvider) rContractPartnerLinkProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
	        ((BindingProvider) rContractPartnerLinkProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

	        RContractPartnerLinkCreator contractPartnerLinkCreator = new RContractPartnerLinkCreator(rContractPartnerLinkProxy);

	        contractPartnerLinkCreator.addContractPartnerLink(rContractPartnerCode, rContractAccount);

	        // ��������� ���������� � AX
	        axLogic.aifttscommit(_messageId);
			/////

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't addAgreePartnerLink", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void updateCounterZonesType(ENServicesObject object)
	{
		Connection enConn = null;
		Connection finConn = null;
		try {
			enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			ENServicesObjectDAO dao = new ENServicesObjectDAO(enConn, getUserProfile());
			com.ksoe.energynet.logic.SCLogic logic = new com.ksoe.energynet.logic.SCLogic(enConn, finConn, getUserProfile());
			ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());
			int estimateCode = servicesLogic.getENEstimateItemCodeCounterByServicesObjectAndKindPlan(object.element.code, ENPlanWorkKind.CALCULATION, true);
			//SUPP-68556 �������� �� �������
			if(estimateCode != Integer.MIN_VALUE) {
				SCCounterShortList counterList = logic.getCounterForServicesObject(object.code, true);
				if(counterList.totalCount > 0) {
					throw new SystemException(String.format("��� ������� � %s �� %s ����'���� �������� ��� � %s.\n"
							+ "���� ������� ��� ���������.\n"
							+ "��� ����, ��� ������ ������� ��� ��������� ���'����� ��������.\n"
							+ "��� ����� ��������� � ����������� ������."
							, object.contractNumberServices
							, new SimpleDateFormat("dd.MM.yyyy").format(object.contractDateServices)
							, counterList.get(0).invNumber));
				}
			}

			dao.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}



	/**
	 *   ����������� ��������� ������������ ������������� - ����� �� ������������� ���������
	 *
	 *   @param powerNew - ���������, �� ������������
	 *   @param powerCurrent - ������� ���������
	 *
	 *   @param powerReliabilityCategory - �������� �������� �����������������
	 *   @param connectionPowerPoint - ������ ������� � ����� ���������
	 *   @param connectionPhasity - ��� ������� ���������
	 *
	 *
	 *   @return connectionsCost - ��������� �������������
	 */
	public BigDecimal getConnectionsCost(BigDecimal powerNew, BigDecimal powerCurrent, int powerReliabilityCategory,
			int connectionPowerPoint, int connectionPhasity) {
		try {
			ENConnectionTariffDAO connectionTariffDao = new ENConnectionTariffDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			BigDecimal connectionsCost = new BigDecimal(0);

			System.out.println("################# getConnectionsCost... "
					+ "powerNew = " + powerNew + " :: powerCurrent = " + powerCurrent
					+ " :: powerReliabilityCategory = " + powerReliabilityCategory + " :: connectionPowerPoint = " + connectionPowerPoint
					+ " :: connectionPhasity = " + connectionPhasity);

			if (powerNew == null) {
				return connectionsCost;
			}

			if (powerCurrent == null) {
				return connectionsCost;
			}

			double power = 0;
			double difference = powerNew.doubleValue() - powerCurrent.doubleValue();
			if (difference > 0) {
				power = difference;
			} else {
				power = powerNew.doubleValue();
			}

			/** ������ ������ �� 160 ���.... */
			if (power > 160) {
				return connectionsCost;
			}

			int connectionLevel = ENConnectionLevel.ENCONNECTIONLEVEL_FIRST;

			if (power > 16 && power <= 50) {
				connectionLevel = ENConnectionLevel.ENCONNECTIONLEVEL_SECOND;
			}

			if (power > 50 && power <= 160) {
				connectionLevel = ENConnectionLevel.ENCONNECTIONLEVEL_THIRD;
			}



			ENConnectionTariffFilter connectionTariffFilter = new ENConnectionTariffFilter();
			connectionTariffFilter.levelRef.code = connectionLevel;
			connectionTariffFilter.categoryRef.code = powerReliabilityCategory;
			connectionTariffFilter.powerPointRef.code = connectionPowerPoint;
			connectionTariffFilter.phasityRef.code = connectionPhasity;

			ENConnectionTariffShortList tariffShortList = connectionTariffDao
					.getScrollableFilteredList(connectionTariffFilter, null, null, 0, -1, null, new Date());

			if (tariffShortList.totalCount > 0) {

				System.out.println("################# getConnectionsCost... power = " + power);
				System.out.println("################# getConnectionsCost... tariff = " + tariffShortList.get(0).value);

				connectionsCost = ((tariffShortList.get(0).value.multiply(new BigDecimal(power)))
						.multiply(new BigDecimal(1.2))).multiply(new BigDecimal(1000)).setScale(2, BigDecimal.ROUND_HALF_UP);

				System.out.println("################# getConnectionsCost... connectionsCost = " + connectionsCost);
			}

			return connectionsCost;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 * 	�������� �������������� ����� � ������ ��� ��������� ������� �� ���������� ���...
	 *
	 *  @param elementCode
	 *  @return isServicesProject
	 */
	public boolean checkServicesProject(int elementCode) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return servicesLogic.checkServicesProject(elementCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}




	/**
	 *   ���������� ����� ������������� �� ���.�������� �� �������� � ������������� - ����� �� ������������� ���������
	 *
	 *   @param idpack - ��� ������ CN
	 *   @param connectionPowerPlaces - ̳��� ������������ ��������� �ᒺ��� ���������
	 *   @param connectionPowerPoint - ����� ��������� (���� ��������� ��������� �ᒺ��� ���������)
	 */
	public void updateConnectionPackMapData(int idpack, String connectionPowerPlaces, String connectionPowerPoint) {
		try {

			/**  ����� ��������...
			 *   ������ ���� ������ ���� �������...
			 */
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENServicesObjectFilter servicesObjectFilter = new ENServicesObjectFilter();
			servicesObjectFilter.cnPackCode = idpack;
			servicesObjectFilter.cnSubsystemTypeRef.code = CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER;
			servicesObjectFilter.contractTypeRef.code = ENServicesContractType.CONNECTION;
			servicesObjectFilter.contractKindRef.code = ENServicesContractKind.SERVICES;
			servicesObjectFilter.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;

			int soArr[] = servicesObjectDao.getFilteredCodeArray(servicesObjectFilter, 0, -1);

			if (soArr.length == 1) {

				ENServicesObject servicesObject = servicesObjectDao.getObject(soArr[0]);

				/**  ����� ������������� �� ���.�������....  */
		    	ENTechConditionsObjectsDAO enTechConditionsObjectsDao = new ENTechConditionsObjectsDAO(
					        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    	ENTechConditionsObjects enTechConditionsObjects = enTechConditionsObjectsDao.getObject(servicesObject.techConObjects.code);

		    	enTechConditionsObjects.connectionPowerPlaces = connectionPowerPlaces;
		    	enTechConditionsObjects.connectionPowerPoint = connectionPowerPoint;

		    	enTechConditionsObjectsDao.save(enTechConditionsObjects);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * ����������� �������� � DocFlow (������� - ���� ����� ������ ���� ������, �� �� �����-���� �������� �� ��������)
	 * @param servicesObjectCode - ��� ��������
	 *
	 * @return ��� ������ � DocFlow
	 */
	public int registerInDocFlow(int servicesObjectCode) {

		try {

			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENServicesObject obj = servicesObjectDAO.getObject(servicesObjectCode);

			if (obj.dfPackCode != Integer.MIN_VALUE) {
				return obj.dfPackCode;
			}

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int dfPackCode = Integer.MIN_VALUE;

			// ��� ��������� � ������� "�������" ��� "������ ���������" ������� ������� ����� � DocFlow
			if (obj.contractStatusRef.code == ENServicesContractStatus.PAID ||
				obj.contractStatusRef.code == ENServicesContractStatus.COMPLETED) {

				// ������� �����
				obj.dfPackCode = servicesLogic.createDocFlowPack(obj);
				servicesObjectDAO.save(obj);

				// ������������ ������
				obj = servicesObjectDAO.getObject(obj.code);

				// NET-4560 - ������ ��������� ���� ���������� �����
				servicesLogic.calculationBoundaryDateWork(obj);

				dfPackCode = obj.dfPackCode;

			}

			// ��� ��������� � ������� "������ ���������" ����� �������� ����� ������� ����� � DocFlow
			if (obj.contractStatusRef.code == ENServicesContractStatus.COMPLETED) {
				servicesLogic.finishServicesObjectInDocFlow(obj);
			}

			return dfPackCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't registerInDocFlow! ServicesObject.code = " + servicesObjectCode, e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void linkWithRQFKOrder(int servicesObjectCode, int fkOrderCode, boolean isLink) {
		try {

			if(servicesObjectCode == Integer.MIN_VALUE
					|| fkOrderCode == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException();
			}

			RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			ENServicesObject2RQFKOrderDAO linkDao = new ENServicesObject2RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());

			RQFKOrder fkOrder = fkOrderDao.getObject(fkOrderCode);
			ENServicesObject servicesObject = servicesObjectDao.getObject(servicesObjectCode);

			// 18.12.2018 ���� ��� ���� ����� ����� �������������� ������ ��� ������� ����� �� ������� �
			// ��������� �� ������ �����
			if(!(fkOrder.kind.code == RQFKOrderKind.SERVICES_FROM_SIDE
					&& servicesObject.contractTypeRef.code == ENServicesContractType.SHIFT_LINES)) {
				throw new SystemException("�������� ��� ������ �� ��������");
			}

			ENServicesObject2RQFKOrderFilter link = new ENServicesObject2RQFKOrderFilter();
			link.fkOrderRef.code = fkOrderCode;
			link.servicesObjectRef.code = servicesObjectCode;
			int[] linkCodes = linkDao.getFilteredCodeArray(link, 0, -1);
			if(isLink) {
				if(linkCodes.length > 0) {
					throw new SystemException(String.format("����� � %s �� %s �� ������ � %s ��� ��'���� �� �����!"
							, fkOrder.numberDoc, Tools.dateFormatDefault.format(fkOrder.dateGen)
							, servicesObject.contractNumberServices));
				}
				linkDao.add(link);
			} else {
				if(linkCodes.length == 0) {
					throw new SystemException(String.format("����� � %s �� %s �� ������ � %s �� ��'���� �� �����!"
							, fkOrder.numberDoc, Tools.dateFormatDefault.format(fkOrder.dateGen)
							, servicesObject.contractNumberServices));
				} else {
					if(linkCodes.length > 1) throw new SystemException(String.format("������� � ������� ��� ������ � %s �� %s �� �������� � %s"
							, fkOrder.numberDoc, Tools.dateFormatDefault.format(fkOrder.dateGen)
							, servicesObject.contractNumberServices));
					linkDao.remove(linkCodes[0]);
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {

		}
	}


	/**
	 *	��������� ������ ������������ ��������� ����
	 *
	 *	@param soCode
	 *	@param creatMetodCode
	 */
	public void changeActIncomeCreatMetod(int soCode, int creatMetodCode) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			servicesLogic.changeActIncomeCreatMetod(soCode, creatMetodCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/* �������� ��� ������������� */
    public void changeConnectionKind(int servicesObjectCode, int connectionKindCode)  {
    	try {
    		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject soObj = soDAO.getObject(servicesObjectCode);

            if (soObj.code == Integer.MIN_VALUE || soObj == null)
            {
            	throw new SystemException("������� ��� ��������� �������� �� ������� !!! ");
            }

            if (soObj.statusRef.code != ENServicesObjectStatus.GOOD) {
            	throw new SystemException("������ ��� ����������!");
            }

            ENServicesObject2TechCondtnsServicesDAO so2tecDAO = new ENServicesObject2TechCondtnsServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTechConditionsServicesDAO tcDAO = new ENTechConditionsServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2TechCondtnsServicesFilter so2tecFilter = new ENServicesObject2TechCondtnsServicesFilter();
            so2tecFilter.servicesObjectRef.code = soObj.code;
            ENServicesObject2TechCondtnsServicesShortList so2tecList = so2tecDAO.getScrollableFilteredList(so2tecFilter, 0, -1);
            ENTechConditionsServices tcObj = tcDAO.getObject(so2tecList.get(0).techCondServRefCode);
            tcObj.connectionKindRef.code = connectionKindCode;
            tcDAO.save(tcObj);

    	} catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't changeConnectionKind ServicesObject.code = " + servicesObjectCode, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }

    }

	/**
	 *  ���������� ��� ������������� (�����������/�� �����������) �� ���� ��������
	 *
	 *  @param soCode - ��� ��������
	 *  @return connectionKind - ��� �������������
	 */
    public int getConnectionKind(int soCode) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.getConnectionKind(soCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

    /**
     *  �������� �������� ����� �� ������� � ��������� ����������� �������
     *  �� ���� ��������� �������� �������������
     *
     *  @param soCodeOld - ��� ��������
     *  @param distance - ����������
     *
     *  @return soCodeNew - ��� ���������� ��������
     */
	public int copyTechTermsPrepareServiceObject(int soCodeOld, BigDecimal distance)
	{

		Connection wfConnection = null;
		Connection netConnection = null;

		int soCodeNew = Integer.MIN_VALUE;
		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			wfConnection = getRemoteConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);

			ENServicesObjectDAO soDao = new ENServicesObjectDAO(netConnection, getUserProfile());
			ServicesLogic servicesLogic = new ServicesLogic(netConnection, getUserProfile());
			ENActDAO actDao = new ENActDAO(netConnection, getUserProfile());
            ENPlanWorkDAO planDao = new ENPlanWorkDAO(netConnection, getUserProfile());
            WorkFlowLogic wfLogic = new WorkFlowLogic(wfConnection, getUserProfile());


            WFPack wPack = wfLogic.getWFPackByENServicesObjectCode(soCodeOld);

            ENServicesObject soObjOld = soDao.getObject(soCodeOld);

            ENActFilter actFilter = new ENActFilter();
			actFilter.element.code = soObjOld.element.code;

			int actCodeArr[] = actDao.getFilteredCodeArray(actFilter, 0, -1);
			// if (actCodeArr.length > 0) {
				if (soObjOld.contractStatusRef.code > ENServicesContractStatus.BUDGETAPPROVED) {
					throw new SystemException("\n\n "
							+ "�������� ������ ������� ���� ������ \"�������� ������������\"!");
				}
			// }


			/** 15.08.2017... +++ ������ ��� ���������, �� ������� ��� �� ��������� ��� �������������!!! */
			int connectionKind = servicesLogic.getConnectionKind(soCodeOld);
			if (connectionKind != ENConnectionKind.UNDEFINED) {
				throw new SystemException("\n\n "
						+ "��� �������� ��� ��������� ��� ���������!\n"
						+ "�������� �������� ���������!");
			}

            ENServicesObject soObjNew = new ENServicesObject();

            //�������� ������ ������������� �������� �������������
            //������ �������� ����� �� �������
            soObjNew.contractServicesDistance = distance;
            soObjNew.contractServicesPower = soObjOld.contractServicesPower;
            soObjNew.contragentAddress = soObjOld.contragentAddress; //����� ���������
            soObjNew.contragentAddressWork = soObjOld.contragentAddressWork; //������� �����
            soObjNew.contragentPhoneNumber = soObjOld.contragentPhoneNumber; //������ ���������
            soObjNew.contragentObjectWork = soObjOld.contragentObjectWork; //������, ��� ����������� ������
            soObjNew.contragentPassport = soObjOld.contragentPassport; //����������� ������ ���������
            soObjNew.contragentOkpo = soObjOld.contragentOkpo; //���� ���������
            soObjNew.contragentBossName = soObjOld.contragentBossName; //������������ ���������
            soObjNew.contragentPosition = soObjOld.contragentPosition; //��������� ���������
            soObjNew.basisType = soObjOld.basisType; //��������, �� ��������� �������� �������� ��������
            soObjNew.warrantFIO = soObjOld.warrantFIO; //��� ����������� ���� ���������
            soObjNew.warrantNumber = soObjOld.warrantNumber; //����� ������������ ���������
            soObjNew.warrantDate = soObjOld.warrantDate; //���� ������������ ���������
            soObjNew.contragentBankName = soObjOld.contragentBankName; //�������� ����� ���������
            soObjNew.contragentBankAccount = soObjOld.contragentBankAccount; //��������� ���� ���������
            soObjNew.contragentBankMfo = soObjOld.contragentBankMfo; //��� ����� ���������
            soObjNew.executorPhoneNumber = soObjOld.executorPhoneNumber; //����� �������� �����������
            soObjNew.warrantRef.code = soObjOld.warrantRef.code; //������������
            soObjNew.baseStation = soObjOld.baseStation; //������� �������
            soObjNew.commentGen = soObjOld.commentGen; //�����������
            soObjNew.regionalType = soObjOld.regionalType;
            soObjNew.tension_point = soObjOld.tension_point;
            soObjNew.personalAccountCode = soObjOld.personalAccountCode;
            soObjNew.personalAccountNumber = soObjOld.personalAccountNumber;
            soObjNew.personalAccountUid = soObjOld.personalAccountUid;
            soObjNew.customerMailingAddress = soObjOld.customerMailingAddress;
            soObjNew.powerGeneration = soObjOld.powerGeneration;
            soObjNew.warrantRef.code = soObjOld.warrantRef.code;
            soObjNew.postCode = soObjOld.postCode;
            soObjNew.contragentTypeRef.code = soObjOld.contragentTypeRef.code; //��� �����������
            soObjNew.contractDateServices = new Date();

            soObjNew.finDocCode = soObjOld.finDocCode;

            if (soObjOld.finDocID != Integer.MIN_VALUE) {
            	soObjNew.finDocID = soObjOld.finDocID;
            }

            soObjNew.partnerCode = soObjOld.partnerCode;
            soObjNew.partnerId = soObjOld.partnerId;
            soObjNew.contractNumber = soObjOld.contractNumber;
            soObjNew.contractDate = soObjOld.contractDate;

            /// ���� ����� ����������� ���������� startProcessCode
            int startProcessCode = 52;
            soCodeNew = wfLogic.addServicesObjectByPack(wPack, soObjNew, startProcessCode, true);

            soObjNew = soDao.getObject(soCodeNew);

            if (soObjOld.generalContractRef.code != Integer.MIN_VALUE) {
            	soObjNew.generalContractRef.code = soObjOld.generalContractRef.code;
            }
            soObjNew.contractTypeRef.code = ENServicesContractType.TY;

            BigDecimal contractServicesSummaNew = soObjNew.contractServicesSumma;

            boolean saveTU = true;
            int contractStatus = Integer.MIN_VALUE;
            Date planDateStart = null;
            Date planDateFinal = null;

            /**  ��� �����, ����� �����������, ��������� �� ����� �������....
             *   ������ ����������� �� ���������
             */
            ENPlanWorkFilter calculationOldFilter = new ENPlanWorkFilter();
            calculationOldFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjOld.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";
            int calculationOldArr[] = planDao.getFilteredCodeArray(calculationOldFilter, 0, -1);

            ENPlanWorkFilter calculationNewFilter = new ENPlanWorkFilter();
            calculationNewFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjNew.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";
            int calculationNewArr[] = planDao.getFilteredCodeArray(calculationNewFilter, 0, -1);


            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjOld.element.code
            		+ " and enplanwork.kindcode not in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";

            int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
            for (int p = 0; p < planArr.length; p++) {

            	ENPlanWork plan = planDao.getObject(planArr[p]);
            	plan.elementRef.code = soObjNew.element.code;

            	planDao.save(plan);

            	contractStatus =  ENServicesContractStatus.BUDGETAPPROVED;

            	if (plan.kind.code == ENPlanWorkKind.CURRENT) {
                	planDateStart = plan.dateStart;
                	planDateFinal = plan.dateFinal;
            	}
            }


            ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();
            planCalcFilter.conditionSQL = " enplanwork.elementrefcode = " + soObjNew.element.code
            		+ " and enplanwork.kindcode in ( " + ENPlanWorkKind.CALCULATION + ", " + ENPlanWorkKind.CALCULATION_SINGLE + ") ";

            int planCalcArr[] = planDao.getFilteredCodeArray(planCalcFilter, 0, -1);
            for (int c = 0; c < planCalcArr.length; c++) {
            	ENPlanWork planCalc = planDao.getObject(planCalcArr[c]);

            	planCalc.status.code = ENPlanWorkStatus.LOCKED;

            	if (planDateStart != null) {
            		planCalc.dateStart = planDateStart;
            	}

            	if (planDateFinal != null) {
            		planCalc.dateFinal = planDateFinal;
            	}

            	planDao.save(planCalc);
            }


            for (int o = 0; o < calculationOldArr.length; o++) {

            	ENPlanWork plan = planDao.getObject(calculationOldArr[o]);
            	plan.elementRef.code = soObjNew.element.code;

            	planDao.save(plan);
            }

            for (int n = 0; n < calculationNewArr.length; n++) {

            	ENPlanWork plan = planDao.getObject(calculationNewArr[n]);
            	plan.elementRef.code = soObjOld.element.code;

            	planDao.save(plan);
            }

            /** ������� ����� */
            for (int a = 0; a < actCodeArr.length; a++) {

            	ENAct act = actDao.getObject(actCodeArr[a]);
            	act.element.code = soObjNew.element.code;

            	actDao.save(act);
            }

            /** ������ �������� >>> ����� �� �������
             *  ���� ���� �����, ������� ������ ���� ��������
             */
            if (contractStatus != Integer.MIN_VALUE) {
            	soObjNew.contractStatusRef.code = contractStatus;
            } else {
                soObjNew.contractStatusRef.code = soObjOld.contractStatusRef.code;
            }

            /** ���������� �������� ��� ��������� ���������� �� �������� */
			if (soObjNew.contractServicesDistance != null && soObjNew.contractServicesDistance.doubleValue() > 0) {

				/** SUPP-63202... 22.06.2017... +++ ���������� ��� ������ �����������... */
				for (int p = 0; p < calculationOldArr.length; p++) {
					ENPlanWork plan = planDao.getObject(calculationOldArr[p]);
					servicesLogic.createDistances(soObjNew, soObjNew.contractServicesDistance, plan.kind.code, plan.code);
					contractServicesSummaNew = new ServicesCalculatorLogic(netConnection, getUserProfile()).calculateServices(calculationOldArr[p]);
				}
			}

			/** �������� ����� �� �������� */
			soObjNew.contractServicesSumma = contractServicesSummaNew;
            soDao.save(soObjNew, saveTU);


            /** ������ ������� ������ */
            soObjOld.contractStatusRef.code = ENServicesContractStatus.CLOSED;
            soDao.save(soObjOld, saveTU);

            return soCodeNew;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			try {
				if (wfConnection != null && !wfConnection.isClosed()) {
					wfConnection.close();
				}

				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
				}

			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}

			closeConnection();
		}
	}

	public void updateRecordPointByt(ENRecordPointBytShort recordPointByt) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.updateRecordPointByt(recordPointByt);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void updateRecordPointProm(ENRecordPointPromShort recordPointProm) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.updateRecordPointProm(recordPointProm);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 *
	 * update ���� isRealized (CallCenter ->  table CCtower2jlc)
	 * CCtower2jlc - ������ ������������ ���������� ������� � �����
	 *
	 * @param contractnumberservices 		- ����� �������� �����  (������� ������)
	 * @param isRealized  					- 0 - �� �����������, 1 - �����������
	 */
	public void updateIsRealizedCCtower2jlc(int servicesObjectCode, int isRealized){
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.updateIsRealizedCCtower2jlc(servicesObjectCode, isRealized);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* �������� ����� ������������� */
    public void changeAddress(ENServicesObject object)  {
    	try {
    		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    		ENServicesObject newObj = soDAO.getObject(object.code);
    		newObj.customerMailingAddress = object.customerMailingAddress;

            soDAO.save(newObj);

    	} catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't changeAddress ServicesObject.code = " + object.code, e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }

    }

    public void recalcENSheets4SODaysCount(int servicesObjectCode) {
		try {
	        ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        servicesLogic.recalcENSheets4SODaysCount(servicesObjectCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't recalcENSheets4SODaysCount!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

    public int getServicesObjectCodeForSupplier(int supplierCode) {
		try {
	        PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        return planLogic.getServicesObjectCodeForSupplier(supplierCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't getServicesObjectCodeForSupplier!", e);
		} finally {
			closeConnection();
		}
	}

    /**
     * ������ ������ � ������� �� ������ �� ���������
     *
     * @param soElementCalculationCode      -  ��� �������: ������� �� �������
     * @param soElementConnectionCode       -  ��� �������: ���������
     * @return
     * @throws SystemException
     */
    public int addBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) {
        try {
            ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            return servicesLogic.addBindSOCalculationToSOConnection(soElementCalculationCode,soElementConnectionCode);
        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't addBindSOCalculationToSOConnection!", e);
        } finally {
            closeConnection();
        }
    }

    /**
     * �������� ������ � ������� �� ������ �� ���������
     *
     * @param soElementCalculationCode   -   ���
     * @param soElementConnectionCode   -   ���
     */
    public void removeBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode){
        try {
            ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            servicesLogic.removeBindSOCalculationToSOConnection(soElementCalculationCode, soElementConnectionCode);
        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't removeBindSOCalculationToSOConnection!", e);
        } finally {
            closeConnection();
        }
    }

    public int getLandSheetDelayForServicesObject(int servicesObjectCode) {
        try {
            ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            return servicesLogic.getLandSheetDelayForServicesObject(servicesObjectCode);
        } catch (DatasourceConnectException e) {
            throw new SystemException("Can't getLandSheetDelayForServicesObject!", e);
        } finally {
            closeConnection();
        }
    }

    public void checkMoveToFK(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		Connection enConn = null;

		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
			ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());

				int actIncomeCode = actIncomeLogic.getENActIncomeTechConditionsCodeByENServicesObjectCode(servicesObjectCode, false);
				if (actIncomeCode <= 0) {
					return;
				}

				if (! actIncomeLogic.isActIncomeTechConditionsReadyForSigning(actIncomeCode)) {
					return;
				}
			} else {
				ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());
				ENAct act = servicesLogic.getActForServicesObject(servicesObject);
				if (act != null) {
					if (! servicesLogic.checkIfStandardServicesObjectByAct(act)) {
						return;
					}
					ActLogic actLogic = new ActLogic(enConn, getUserProfile());
					int dfDocCode = actLogic.getDFDocCodeForENAct(act.code);
					if (dfDocCode <= 0) {
						return;
					}
				} else {
					return;
				}
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}

		FKProvResult provResult = null;

		try {
			provResult = moveToFK(servicesObjectCode, null, Integer.MIN_VALUE, this);
		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		}

		if (provResult == null || (provResult.partId <= 0 && provResult.badProvList != null)) {
			throw new SystemException("SUPP-100352-PROV_ERROR");
		}

		throw new SystemException("SUPP-100352-PROV_OK");
    }

    public FKProvResult moveToFKCheckOnly(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

    	return moveToFK(servicesObjectCode, null, Integer.MIN_VALUE, this, true);
    }

    private String getUserNameForFK(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		Connection enConn = null;

		try {
			UserProfile userProfile = getUserProfile();
			String userName = userProfile.userName;

			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(userProfile, enConn);
			ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);

			int dfDocCode = Integer.MIN_VALUE;

			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, userProfile);
				dfDocCode = actIncomeLogic.getDFDocCodeForENServicesObject(servicesObjectCode, false);
			} else {
				ServicesLogic servicesLogic = new ServicesLogic(enConn, userProfile);
				ENAct act = servicesLogic.getActForServicesObject(servicesObject);
				if (act != null) {
					ActLogic actLogic = new ActLogic(enConn, userProfile);
					dfDocCode = actLogic.getDFDocCodeForENAct(act.code);
				}
			}

			// ��� ���������� ����� � ������� ��� ����� ��������� �������� � �� ��� ������ "energynet"
			if (dfDocCode > 0) {
				userName = "energynet";
			}

			return userName;
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
    }

	private void moveWfPack(int servicesObjectCode) {
		try {
			Connection wfConnection;
			wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WFPack2ServicesObjectDAO p2soDAO = new WFPack2ServicesObjectDAO(wfConnection, getUserProfile());
			WFPack2ServicesObjectShort wfPack2SOShort = null;
			WFPackDAO packDAO = new WFPackDAO(wfConnection, getUserProfile());

			WFProcessMovementDAO processMovementDAO = new WFProcessMovementDAO(wfConnection, getUserProfile());
			WFProcessMovementFilter processMovementFilter = new WFProcessMovementFilter();
			WFProcessMovementShortList processMovementShortList = null;
			WFProcessMovement processMovementNew = null;

			WFProcessDAO processDAO = new WFProcessDAO(wfConnection, getUserProfile());
			WFPack wfPack = null;
			WFProcessShortList processShortList = null;
			WFProcess wfProcessNew = null;
			WFProcessFilter wfProcessFilter = new WFProcessFilter();

			WFPack2ServicesObjectFilter wfPack2SOFilter = new WFPack2ServicesObjectFilter();
			wfPack2SOFilter.soCode= servicesObjectCode;
			WFPack2ServicesObjectShortList wfPack2SOShortList = p2soDAO.getScrollableFilteredList(wfPack2SOFilter,0,-1);

			UserDAO uDAO = new UserDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE));
			int userCode = uDAO.getUserCodeByAlias(getUserProfile().userAlias);

			int packCode = Integer.MIN_VALUE;
			int processCode = Integer.MIN_VALUE;

			if (wfPack2SOShortList.size() > 0) {
				wfPack2SOShort = wfPack2SOShortList.get(0);
				packCode = wfPack2SOShort.packCode;
				wfPack = packDAO.getObject(packCode);
			}

			if(wfPack != null){
				wfProcessFilter.conditionSQL = " WFPACK.CODE = " +packCode+"\n" +
						"		 and WFPROCESSSTATUS.CODE not in("+WFProcessStatus.COMPLETED+", "+WFProcessStatus.ARCHIVE+")";
				processShortList =  processDAO.getScrollableFilteredList(wfProcessFilter,0,-1);
				if(processShortList.size() > 0){
					for (int i=0; i<processShortList.size(); i++){
						//��������� �������
						WFProcess wfProcessNoCompleted = processDAO.getObject(processShortList.get(i).code);
						wfProcessNoCompleted.finaldate = new Date();
						wfProcessNoCompleted.dateEdit = new Date();
						wfProcessNoCompleted.userGen = getUserProfile().userName;
						wfProcessNoCompleted.processStatus.code = WFProcessStatus.COMPLETED;
						processDAO.save(wfProcessNoCompleted);
					}
				}

				processMovementFilter.pack.code = packCode;
				processMovementFilter.isCompleted = WFProcessMovement.NOT_COMPLETED;
				processMovementShortList = processMovementDAO.getScrollableFilteredList(processMovementFilter,0,-1);
				if (processMovementShortList.size() > 0){
					for (int i=0; i<processMovementShortList.size(); i++) {
						//��������� �������� ��������
						WFProcessMovement wfProcessMovementNoCompleted = processMovementDAO.getObject(processMovementShortList.get(i).code);
						wfProcessMovementNoCompleted.finaldate = new Date();
						wfProcessMovementNoCompleted.dateEdit = new Date();
						wfProcessMovementNoCompleted.userGen = getUserProfile().userName;
						wfProcessMovementNoCompleted.isCompleted = WFProcessMovement.IS_COMPLETED;		//������� ���������� (1 - ���������)
						processMovementDAO.save(wfProcessMovementNoCompleted);
					}
				}

				//�������� ����� ������
				wfProcessNew = new WFProcess();
				wfProcessNew.startdate = new Date();
				wfProcessNew.dateEdit = new Date();
				wfProcessNew.userGen = getUserProfile().userName;
				wfProcessNew.pack.code = packCode;
				wfProcessNew.baseProcess.code = WF_BASEPROCESS_TO_MOVE;
				wfProcessNew.baseProcessVersion.code = WF_BASEPROCESS_VERSION_TO_MOVE;
				wfProcessNew.processStatus.code = WFProcessStatus.IN_WORK;

				processCode = processDAO.add(wfProcessNew);

				//��������� ��������
				processMovementNew = new WFProcessMovement();
				processMovementNew.startdate = new Date();
				processMovementNew.isCompleted = WFProcessMovement.NOT_COMPLETED;
				processMovementNew.dateEdit = new Date();
				processMovementNew.userGen = getUserProfile().userName;
				processMovementNew.process.code = processCode;
				processMovementNew.pack.code = packCode;
				processMovementNew.state.code = WF_STATE_TO_MOVE;
				processMovementNew.baseProcess.code = WF_BASEPROCESS_TO_MOVE;
				processMovementNew.baseProcessVersion.code = WF_BASEPROCESS_VERSION_TO_MOVE;
				processMovementNew.userCode = userCode;
				processMovementNew.isLast = WFProcessMovement.IS_LAST;				//������� ���������� �������� ��� ������

				processMovementDAO.add(processMovementNew);

			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

} // end of EJB Controller for ENServicesObject
