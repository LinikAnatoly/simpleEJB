package com.ksoe.energynet.logic;


import static com.ksoe.energynet.valueobject.ENElement2ENElementType.SERVICES_OBJECT_BIND_CALCULATION_TO_CONNECTION;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map.Entry;
import java.util.Vector;
import java.util.concurrent.TimeUnit;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.dataminer.ConfigDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.callcenter.dataminer.CCRecordPointDAO;
import com.ksoe.callcenter.dataminer.CCTower2JLCDAO;
import com.ksoe.callcenter.valueobject.filter.CCRecordPointFilter;
import com.ksoe.callcenter.valueobject.filter.CCTower2JLCFilter;
import com.ksoe.callcenter.valueobject.lists.CCRecordPointShortList;
import com.ksoe.callcenter.valueobject.lists.CCTower2JLCShortList;
import com.ksoe.contract.ejb.RecordPointHistoryController;
import com.ksoe.contract.ejb.RecordPointHistoryControllerHome;
import com.ksoe.contract.valueobject.DisconnectionReason;
import com.ksoe.contract.valueobject.IsWorking;
import com.ksoe.contract.valueobject.RecordPointHistoryRequest;
import com.ksoe.docflow.dataminer.DFDoc2ENServicesObjectDAO;
import com.ksoe.docflow.dataminer.DFDocAttachmentDAO;
import com.ksoe.docflow.dataminer.DFDocDAO;
import com.ksoe.docflow.dataminer.DFDocMovementDAO;
import com.ksoe.docflow.dataminer.DFDocOutboxDAO;
import com.ksoe.docflow.dataminer.DFDocServicesConsumerDAO;
import com.ksoe.docflow.dataminer.DFDocServicesConsumerKindDAO;
import com.ksoe.docflow.dataminer.DFPackDAO;
import com.ksoe.docflow.dataminer.DFServicesListDAO;
import com.ksoe.docflow.ejb.DFDocAttachmentController;
import com.ksoe.docflow.ejb.DFDocAttachmentControllerHome;
import com.ksoe.docflow.ejb.DFDocMovementController;
import com.ksoe.docflow.ejb.DFDocMovementControllerHome;
import com.ksoe.docflow.ejb.DFDocOutboxController;
import com.ksoe.docflow.ejb.DFDocOutboxControllerHome;
import com.ksoe.docflow.logic.AttachmentsLogic;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.logic.DocFlowLogic.ApplicationStatus;
import com.ksoe.docflow.logic.ServicesConsumerLogic;
import com.ksoe.docflow.logic.SiteLogic;
import com.ksoe.docflow.valueobject.DFConsumerType;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDoc2ENServicesObject;
import com.ksoe.docflow.valueobject.DFDocAttachment;
import com.ksoe.docflow.valueobject.DFDocDecree;
import com.ksoe.docflow.valueobject.DFDocForm;
import com.ksoe.docflow.valueobject.DFDocKind;
import com.ksoe.docflow.valueobject.DFDocMovement;
import com.ksoe.docflow.valueobject.DFDocOutbox;
import com.ksoe.docflow.valueobject.DFDocServicesConsumer;
import com.ksoe.docflow.valueobject.DFDocServicesConsumerKind;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.docflow.valueobject.DFDocSupplyEE;
import com.ksoe.docflow.valueobject.DFDocType;
import com.ksoe.docflow.valueobject.DFInfoSources;
import com.ksoe.docflow.valueobject.DFJobStatus;
import com.ksoe.docflow.valueobject.DFMovement;
import com.ksoe.docflow.valueobject.DFPack;
import com.ksoe.docflow.valueobject.DFPackType;
import com.ksoe.docflow.valueobject.DFServicesList;
import com.ksoe.docflow.valueobject.filter.DFDoc2ENServicesObjectFilter;
import com.ksoe.docflow.valueobject.filter.DFDocAttachmentFilter;
import com.ksoe.docflow.valueobject.filter.DFDocMovementFilter;
import com.ksoe.docflow.valueobject.filter.DFDocOutboxFilter;
import com.ksoe.docflow.valueobject.filter.DFDocServicesConsumerFilter;
import com.ksoe.docflow.valueobject.lists.DFDocOutboxShortList;
import com.ksoe.energyWorkflow.dataminer.WFPack2DFDocDAO;
import com.ksoe.energyWorkflow.dataminer.WFPackDAO;
import com.ksoe.energyWorkflow.ejb.WFPack2DFDocController;
import com.ksoe.energyWorkflow.ejb.WFPack2DFDocControllerHome;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energyWorkflow.valueobject.WFPack;
import com.ksoe.energyWorkflow.valueobject.WFPack2DFDoc;
import com.ksoe.energyWorkflow.valueobject.WFPackStatus;
import com.ksoe.energyWorkflow.valueobject.filter.WFPack2DFDocFilter;
import com.ksoe.energyWorkflow.valueobject.filter.WFPackFilter;
import com.ksoe.energyWorkflow.valueobject.lists.WFPack2DFDocShortList;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENAct2SCUsageInputDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENAdditionalAgreementDAO;
import com.ksoe.energynet.dataminer.ENCalcContractTotalDAO;
import com.ksoe.energynet.dataminer.ENCalcCostDAO;
import com.ksoe.energynet.dataminer.ENCalcHumenDeliveryDAO;
import com.ksoe.energynet.dataminer.ENCalcHumenSalaryDAO;
import com.ksoe.energynet.dataminer.ENCalcMaterialsUsageDAO;
import com.ksoe.energynet.dataminer.ENCalcTotalCostDAO;
import com.ksoe.energynet.dataminer.ENCalcTransportUsageDAO;
import com.ksoe.energynet.dataminer.ENCalcTransportUsageHourDAO;
import com.ksoe.energynet.dataminer.ENConnectionKindDAO;
import com.ksoe.energynet.dataminer.ENConnectionTariffDAO;
import com.ksoe.energynet.dataminer.ENConnectionTariffEntryDAO;
import com.ksoe.energynet.dataminer.ENDelayServicesDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimePlanDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENDocAttachment2ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENElement2ENElementDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENFamilySize2ServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENGiveCounterDAO;
import com.ksoe.energynet.dataminer.ENLandSheetsDelaysDAO;
import com.ksoe.energynet.dataminer.ENPayment2SODAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.dataminer.ENRentPeriod2ServicesDAO;
import com.ksoe.energynet.dataminer.ENSOBillDAO;
import com.ksoe.energynet.dataminer.ENSOProj2SOConnDAO;
import com.ksoe.energynet.dataminer.ENSOValuesDAO;
import com.ksoe.energynet.dataminer.ENSOValuesTypeDAO;
import com.ksoe.energynet.dataminer.ENServices2CalcAdditionalItemsDAO;
import com.ksoe.energynet.dataminer.ENServicesContractKindDAO;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcByActDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENSheets4SODAO;
import com.ksoe.energynet.dataminer.ENSheets4SOItemsDAO;
import com.ksoe.energynet.dataminer.ENSheets4SOTypeDAO;
import com.ksoe.energynet.dataminer.ENSignerDAO;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.dataminer.ENTechAgreement2ServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTimeLineDAO;
import com.ksoe.energynet.dataminer.ENTransportDep2DepDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENWarrantDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.RecordPointWFDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.ENActController;
import com.ksoe.energynet.ejb.ENActControllerHome;
import com.ksoe.energynet.ejb.ENDocAttachment2ENServicesObjectController;
import com.ksoe.energynet.ejb.ENDocAttachment2ENServicesObjectControllerHome;
import com.ksoe.energynet.ejb.ENReportController;
import com.ksoe.energynet.ejb.ENReportControllerHome;
import com.ksoe.energynet.ejb.ENServicesObjectController;
import com.ksoe.energynet.ejb.ENServicesObjectControllerHome;
import com.ksoe.energynet.ejb.ENTransportOrderController;
import com.ksoe.energynet.ejb.ENTransportOrderControllerHome;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkController;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.FINMolDataController;
import com.ksoe.energynet.ejb.FINMolDataControllerHome;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.logic.ENConsts.DisconnectionInitiator;
import com.ksoe.energynet.util.BillingEjbCache;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENCalcTotalCost;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENConnectionPhasity;
import com.ksoe.energynet.valueobject.ENConnectionTariff;
import com.ksoe.energynet.valueobject.ENConnectionTariffEntry;
import com.ksoe.energynet.valueobject.ENDelayServices;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElementType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.ENPayment2SOType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.ENSOValues;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2RQFKOrder;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENSheets4SO;
import com.ksoe.energynet.valueobject.ENSheets4SOItems;
import com.ksoe.energynet.valueobject.ENSheets4SOType;
import com.ksoe.energynet.valueobject.ENSigner;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.ENTechAgr2SOKind;
import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTimeLine;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.RecordPointWF;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENActShort;
import com.ksoe.energynet.valueobject.brief.ENGiveCounterShort;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENPayment2SOShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.brief.ENSOBillShort;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOShort;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcContractTotalFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcCostFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenDeliveryFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenSalaryFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcMaterialsUsageFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTotalCostFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageHourFilter;
import com.ksoe.energynet.valueobject.filter.ENConnectionKindFilter;
import com.ksoe.energynet.valueobject.filter.ENDelayServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENElement2ENElementFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENFamilySize2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENLandSheetsDelaysFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.filter.ENRentPeriod2ServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENSOProj2SOConnFilter;
import com.ksoe.energynet.valueobject.filter.ENSOValuesFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2CalcAdditionalItemsFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOFilter;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOItemsFilter;
import com.ksoe.energynet.valueobject.filter.ENSignerFilter;
import com.ksoe.energynet.valueobject.filter.ENTechAgreement2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2DepFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.RecordPointWFFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcContractTotalShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcTotalCostShortList;
import com.ksoe.energynet.valueobject.lists.ENDelayServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimePlanShortList;
import com.ksoe.energynet.valueobject.lists.ENElement2ENElementShortList;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENLandSheetsDelaysShortList;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENSOBillShortList;
import com.ksoe.energynet.valueobject.lists.ENSOValuesShortList;
import com.ksoe.energynet.valueobject.lists.ENServices2CalcAdditionalItemsShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcByActShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2RQFKOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOShortList;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2DepShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQApCost2Item2ServicesDAO;
import com.ksoe.rqorder.dataminer.RQApprovedCostDAO;
import com.ksoe.rqorder.dataminer.RQFKOrder2PlanFactDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.dataminer.SCInvoiceDAO;
import com.ksoe.rqorder.dataminer.SCOrderDAO;
import com.ksoe.rqorder.ejb.RQApCost2Item2ServicesController;
import com.ksoe.rqorder.ejb.RQApCost2Item2ServicesControllerHome;
import com.ksoe.rqorder.ejb.RQFKOrderController;
import com.ksoe.rqorder.ejb.RQFKOrderControllerHome;
import com.ksoe.rqorder.ejb.RQOrderController;
import com.ksoe.rqorder.ejb.RQOrderControllerHome;
import com.ksoe.rqorder.logic.ApprovedCostLogic;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQApCost2Item2Services;
import com.ksoe.rqorder.valueobject.RQApprovedCostStatus;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrder2PlanFact;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2EstimateItemStatus;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQOrderItemStatus;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.SCInvoice;
import com.ksoe.rqorder.valueobject.SCOrder;
import com.ksoe.rqorder.valueobject.brief.RQApprovedCostShort;
import com.ksoe.rqorder.valueobject.brief.RQFKOrderShort;
import com.ksoe.rqorder.valueobject.filter.RQApCost2Item2ServicesFilter;
import com.ksoe.rqorder.valueobject.filter.RQApprovedCostFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrder2PlanFactFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQApprovedCostShortList;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderShortList;
import com.ksoe.techcard.dataminer.TKCalcCostDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterials2TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKCalcKind;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKClassificationTypeParamsOnDate;
import com.ksoe.techcard.valueobject.TKElementType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKReplaceCounterKind;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.TKVirtualBrigade;
import com.ksoe.techcard.valueobject.brief.TKClassificationTypeShort;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterials2TKMaterialsFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterialsFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;
import com.ksoe.techcard.valueobject.lists.TKMaterials2TKMaterialsShortList;

public class ServicesLogic extends LogicModule {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;
	// ��������� � ENConsts
    //public static final int DEPARTMENT_CO = 3; // ������� ����������

	public ServicesLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}


	private Connection docFlowConnection = null;
	private Connection callcenterConnection = null;

	private Connection getDocFlowConnection() throws DatasourceConnectException {
		try {
			if (docFlowConnection != null && !docFlowConnection.isClosed()) {
				return docFlowConnection;
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			docFlowConnection = dataSource.getConnection();

			return docFlowConnection;

		} catch (NamingException e) {
			throw new DatasourceConnectException(AuthorizationJNDINames.DOCFLOW_DATASOURCE, e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(AuthorizationJNDINames.DOCFLOW_DATASOURCE, e);
		}
	}

	public void closeDocFlowConnection() {
		try {
			if (docFlowConnection != null && !docFlowConnection.isClosed()) {
				docFlowConnection.close();
				docFlowConnection = null;
			}
		} catch (SQLException e) {
		}
	}

	private Connection getCallcenterConnection() throws DatasourceConnectException {
		try {
			if (callcenterConnection != null && !callcenterConnection.isClosed()) {
				return callcenterConnection;
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(AuthorizationJNDINames.CALLCENTER_DATASOURCE);
			callcenterConnection = dataSource.getConnection();

			return callcenterConnection;

		} catch (NamingException e) {
			throw new DatasourceConnectException(AuthorizationJNDINames.CALLCENTER_DATASOURCE, e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(AuthorizationJNDINames.CALLCENTER_DATASOURCE, e);
		}
	}

	public void closeCallCenterConnection() {
		try {
			if (callcenterConnection != null && !callcenterConnection.isClosed()) {
				callcenterConnection.close();
				callcenterConnection = null;
			}
		} catch (SQLException e) {
		}
	}


    public BigDecimal calculateContractByElementCode(int elementCode) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(elementCode);
        return new ServicesCalculatorLogic(connection, userProfile).calculateServices(plan.code);
    }

    public BigDecimal calculateContractByServicesObjectCode(int soCode) throws PersistenceException
    {
        ENServicesObjectDAO dao = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObject obj = dao.getObject(soCode);
        ENPlanWork plan = getPlanWorkCalculationByElementCode(obj.element.code);
        return new ServicesCalculatorLogic(connection, userProfile).calculateServices(plan.code);
    }


    public ENPlanWork getPlanWorkCalculationByElementCode(int elementCode) throws PersistenceException
    {
        /*
        ENPlanWork out = new ENPlanWork();

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = elementCode;
        planFilter.kind.code = ENPlanWorkKind.CALCULATION;
        int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
        if (planArr.length != 1){
            throw new SystemException("������� � ������� �����-��������� ... " );
        }

        out = planDAO.getObject(planArr[0]);

        return out;
        */

        return getPlanWorkCalculationByElementCode(elementCode, ENPlanWorkKind.CALCULATION);
    }


    public ENPlanWork getPlanWorkCalculationByElementCode(int elementCode, int planKindCode, int planStatus)
            throws PersistenceException {
        ENPlanWork out = new ENPlanWork();

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = elementCode;
        planFilter.kind.code = planKindCode;
        planFilter.status.code = planStatus;
        int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
        if (planArr.length != 1){
            throw new SystemException("������� � ������� �����-��������� ... " );
        }

        out = planDAO.getObject(planArr[0]);

        return out;
    }


    public ENPlanWork getPlanWorkCalculationByElementCode(int elementCode, int planKindCode) throws PersistenceException
    {
        ENPlanWork out = new ENPlanWork();

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = elementCode;
        planFilter.kind.code = planKindCode;
        int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
        if (planArr.length != 1 ){
            throw new SystemException("������� � ������� �����-��������� ... " );
        }

        out = planDAO.getObjectNoRefNoSegr(planArr[0]);

        return out;
    }

    public ENPlanWork getPlanWorkCurrentByElementCode(int elementCode) throws PersistenceException {
        return getPlanWorkCurrentByElementCode(elementCode, false);
    }

    public ENPlanWork getPlanWorkCurrentByElementCode(int elementCode, boolean priconnections) throws PersistenceException
    {
        ENPlanWork out = new ENPlanWork();

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();

        /** SUPP-8557... 11.11.2013 +++ ��� ������������� ���� � ����� ���� "������������� � ������������" */
        if (priconnections) {
            //planFilter.elementRef.code = elementCode;
            planFilter.kind.code = ENPlanWorkKind.CURRENT;
            planFilter.stateRef.code = ENPlanWorkState.RECONSTRUCTION_MODERNIZATION;

            planFilter.conditionSQL = " enplanwork.code in (select et.planrefcode from entechcond2planwork et " +
                    " where et.techconservicesrefcode = (select st.techcondservrefcode from enservicesobject2techcondtnsservices st " +
                    " where st.servicesobjectrefcode = (select s.code from enservicesobject s " +
                    " where s.elementcode = " + elementCode + ")))";
            planFilter.orderBySQL = " ENPLANWORK.datestart desc ";

        } else {
            planFilter.elementRef.code = elementCode;
            planFilter.kind.code = ENPlanWorkKind.CURRENT;
        }

        int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

/** SUPP-20235 2014-07-18 ����� ������� � ������������ (��������, ��������) ���� ������ �������� ������� ��
  * ����������� ���� �� ���������� ���������:
  * 1.���� ���� ��� �������������/������������ - ����� ���
  * 2.���� ���� �������������/������������ ���, ��������� ���� �� ��� ������������� - ����� ���
/** SUPP-21767 2014-08-22 �������� ��� ���� ��� ����, ������� �������� � ������� ����������� ����
  * 3.���� ��� ���� ������������� ��������� ��� ���� ������������ ������������ - ����� ��� (��� ���� ������� ��
  * �������-����, �.�. ����� �� ��� ������ ��������� ������ � ��������� ������ ����...)
  * 4.���� ������ ���-���������� ������ (����������� �������, ��� �� ����� ������ ��� � ����� ������ ������)*/

        /**
         * SUPP-45793 ��� ����� ��� ������ - ��������� ��� ���� - ������ �� �������
         */

        if (priconnections) {
            if (planArr.length == 0) {
                planFilter.stateRef.code = ENPlanWorkState.CAPITAL_BUILDER;
                planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

                /** 12.12.2016 +++ �������������� */
                if (planArr.length == 0) {
                    planFilter.kind.code = ENPlanWorkKind.FACT;
                    planFilter.stateRef.code = ENPlanWorkState.DESIGNING;
                    planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

	                if (planArr.length == 0) {
	                    planFilter.kind.code = ENPlanWorkKind.FACT;
	                    planFilter.stateRef.code = ENPlanWorkState.TO;
	                    planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
	                   if (planArr.length == 0) {
	                	   planFilter.kind.code = ENPlanWorkKind.FACT;
	                	   planFilter.stateRef.code = ENPlanWorkState.WORK_IN_OUT;
	                	   planFilter.elementRef.code = elementCode;
	                	   planFilter.conditionSQL = "";
	                	   planArr = planDAO.getFilteredCodeArray(planFilter, 0, 1);
	                	   if(planArr.length == 0) {
	                    	   throw new SystemException("\n" +
	                                   "������� ���������� ��������!" +
	                        		   "\n ��������� ��������� <���> ��� ������� ��������." +
	                                   "\n ���� ���� � �������������/�����������, ��� ����������� ����������." +
	                        		   "\n ��������� �� ���������� ��.");
	                	   }
	                   }
	                }
	            }
	        }
         }

        if (!priconnections) {
            if (planArr.length != 1) {
                throw new SystemException("\n" +
                        "������� � ������� ������� ����� ... " );
            }
        }

        out = planDAO.getObject(planArr[0]);

        return out;
    }


    public ENAct getActByElementCode(int elementCode)
            throws PersistenceException {
        Connection connect = null;
        ENAct out = new ENAct();

        try {
            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ENActDAO actDAO = new ENActDAO(connect, userProfile);

            ENActFilter actFilter = new ENActFilter();
            actFilter.element.code = elementCode;

            int[] actArr = actDAO.getFilteredCodeArray(actFilter, actFilter.conditionSQL, null, 0, -1, null);
            /*
            * if (actArr.length != 1){ throw new
            * SystemException("������� � ������� ���� ... " ); }
            */
            if (actArr.length == 0) {
                throw new SystemException(
                        "�� ��� ��'��� �� �� ��������� ���������� ���!");
            }

            if (actArr.length > 1) {
                throw new SystemException(
                        "�� ����� ��'��� �������� �����, �� ���� ���������� ���!");
            }

            out = actDAO.getObject(actArr[0]);

            return out;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
    }

    public ENAct getActForServicesObject(ENServicesObject servicesObject) {
    	if (servicesObject == null || servicesObject.element == null || servicesObject.element.code <= 0) {
    		throw new IllegalArgumentException("\n\n�� ������� ������ ������ �� �������!");
    	}

        try {
            ENActDAO actDAO = new ENActDAO(connection, userProfile);

            ENActFilter actFilter = new ENActFilter();
            actFilter.element.code = servicesObject.element.code;
            actFilter.orderBySQL = "dategen desc";

            int[] actArr = actDAO.getFilteredCodeArrayNoSegr(actFilter, 0, -1);
            if (actArr.length > 0) {
            	return actDAO.getObjectNOSEGR(actArr[0]);
            }

            return null;
        } catch (PersistenceException e) {
        	throw new SystemException(e.getMessage(), e);
		}
    }

    public void createDistancesByPlanCode(int planCode)
            throws PersistenceException {
        Connection connect = null;
        try {
            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ENPlanWorkShort pShort = new ENPlanWorkDAO(connect, userProfile).getShortObject(planCode);
            ENServicesObject so = getServicesObjectByElementCode(pShort.elementRefCode);
            createDistances(so, so.contractServicesDistance, pShort.kindCode, pShort.code);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
    }

    public void updateMachineHoursByPlanItemCode(int planCode , BigDecimal machinehours) throws PersistenceException {

        ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter trFilter = new ENTransportItemFilter();
        trFilter.planItemRef.code = planCode ;
        int[] trArr = trDAO.getFilteredCodeArray(trFilter, trFilter.conditionSQL, null, 0, -1, null);
        for (int i=0; i < trArr.length; i++){


            ENTransportItem transp = trDAO.getObject(trArr[i]);

            transp.countWorkFact = machinehours;
            trDAO.save(transp);

        }
    }


    public void createDistances(ENServicesObject servicesObject, BigDecimal distance) throws PersistenceException
    {
        createDistances(servicesObject, distance, ENPlanWorkKind.CALCULATION, Integer.MIN_VALUE);
    }

	public void createDistances(ENServicesObject servicesObject, BigDecimal distance, int planKindCode, int planCode) throws PersistenceException {
		/*
		 * ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
		 * ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		 * planFilter.elementRef.code = servicesObject.element.code;
		 * planFilter.kind.code = ENPlanWorkKind.CALCULATION; int[] planArr =
		 * planDAO.getFilteredCodeArray(planFilter, 0, -1); if (planArr.length
		 * != 1){ throw new SystemException(
		 * "������� � ������� ����� ��� ����������� � " +
		 * servicesObject.contractNumberServices); }
		 *
		 * //ENPlanWork plan = planDAO.getObject(planArr[0]);
		 */
		ENPlanWork plan;

		if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			plan = planDAO.getObjectNoRefNoSegr(planCode);
		} else {
			plan = getPlanWorkCalculationByElementCode(servicesObject.element.code, planKindCode);
		}

		TransportLogic trLogic = new TransportLogic(connection, userProfile);

		BigDecimal distTO = distance.divide(new BigDecimal(2), 3, BigDecimal.ROUND_HALF_UP);
		BigDecimal distFROM = distance.subtract(distTO).setScale(3, BigDecimal.ROUND_HALF_UP);

		ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);

		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter trFilter = new ENTransportItemFilter();
		trFilter.planRef.code = plan.code;
		int[] trArr = trDAO.getFilteredCodeArray(trFilter, trFilter.conditionSQL, null, 0, -1, null);

		/////////////
		int isNotLicensedActivity = getIsNotLicensedActivity(plan.code);
		/*
		 * int isNotLicensedActivity = 0;
		 *
		 * ENPlanWork2ClassificationTypeDAO dao = new
		 * ENPlanWork2ClassificationTypeDAO(connection, userProfile);
		 * ENPlanWork2ClassificationTypeFilter p2ctFilter = new
		 * ENPlanWork2ClassificationTypeFilter(); p2ctFilter.planRef.code =
		 * plan.code;
		 *
		 * ENPlanWork2ClassificationTypeShortList p2ctList =
		 * dao.getScrollableFilteredList(p2ctFilter, 0, -1);
		 *
		 * if (p2ctList.totalCount > 0) { //isNotLicensedActivity =
		 * getIsNotLicensedActivity(p2ctList.get(0).classificationTypeRefCode);
		 * TKClassificationTypeDAO ctDAO = new
		 * TKClassificationTypeDAO(connection, userProfile);
		 * TKClassificationType ctObj =
		 * ctDAO.getObject(p2ctList.get(0).classificationTypeRefCode);
		 *
		 * isNotLicensedActivity = (ctObj.isnotlicensedactivity ==
		 * Integer.MIN_VALUE ? 0 : ctObj.isnotlicensedactivity); }
		 */
		//////////////

		/*
		 * NET-2396 NET-2397 NET-2399 NET-2401 ��������� �������� �� �����������
		 * ������ ������ �������� (����� � ����������� ��������������� 1.1.01)
		 * ���������� ����� 0,4-35�»(����� � ����������� ��������������� 1.1.02
		 * ) ���������� ����� 0.4-20�» (����� � ����������� ���������������
		 * 1.1.03) ���������� ����� 35-150�» (����� � �����������
		 * ��������������� 1.1.04) ���� ��������� ����� �������� �������
		 * ����������� ���������
		 */

		String strCodeIzol = "";
		String strKL04_35 = "";
		String strVL04_20 = "";
		String strVL35_150 = "";
		String strBuilding = "";
		String strSzdtu = "";
		boolean isCodeIzol = false;
		boolean isKL04_35 = false;
		boolean isVL04_20 = false;
		boolean isVL35_150 = false;
		boolean isBuilding = false;
		boolean isSzdtu = false;

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		// �������� ���� ����������� ������������ ����� ��� ������ ��������
		strCodeIzol = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED));


		// �������� ���� ����������� ������������ ����� ��� ��������� �����
		// 0,4-35��
		strKL04_35 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV));

		// �������� ���� ����������� ������������ ����� ��� ��������� �����
		// 0.4-20��
		strVL04_20 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV));

		// �������� ���� ����������� ������������ ����� ��� ��������� �����
		// 35-150��
		strVL35_150 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV));

		strBuilding = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_BUILDING));

		strSzdtu = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SZDTU));

		// ��������� � ���� ������ ��������� ����������� � ��������� (������ ��
		// ������ ��� ��� ��� 04-34 ��� ������� ����� 04-20 ��� ������� �����
		// 35-150)
		ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
		ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
		ENPlanWork2ClassificationTypeShortList p2cList = null;
		// ���� ��� �� ��������
		p2cFilter.planRef.code = plan.code;
		// p2cFilter.classificationTypeRef.code =
		// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_SLUJBA_ISOLATED;
		p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strCodeIzol + " )  "
				+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
				+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
		p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
		if (p2cList.totalCount > 0) {
			isCodeIzol = true;
		}
		// ���� ��� ��� ����� 04-35
		if (!isCodeIzol) {
			p2cFilter.planRef.code = plan.code;
			// p2cFilter.classificationTypeRef.code =
			// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_KL04_35KV;
			p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strKL04_35 + " )  "
					+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
					+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
			p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			if (p2cList.totalCount > 0) {
				isKL04_35 = true;
			}
		}
		// ���� ��� ��������� ����� 04-20
		if (!isCodeIzol && !isKL04_35) {
			p2cFilter.planRef.code = plan.code;
			// p2cFilter.classificationTypeRef.code =
			// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL04_20KV;
			p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strVL04_20 + " )  "
					+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
					+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
			p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			if (p2cList.totalCount > 0) {
				isVL04_20 = true;
			}
		}

		// ���� ��� ��������� ����� 35-150
		if (!isCodeIzol && !isKL04_35 && !isVL04_20) {
			p2cFilter.planRef.code = plan.code;
			// p2cFilter.classificationTypeRef.code =
			// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL35_150KV;
			p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strVL35_150 + " )  "
					+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
					+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
			p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			if (p2cList.totalCount > 0) {
				isVL35_150 = true;
			}
		}

		// ���� ��� ��������� ����� 35-150
		if (!isCodeIzol && !isKL04_35 && !isVL04_20 && !isVL35_150) {
			p2cFilter.planRef.code = plan.code;
			// p2cFilter.classificationTypeRef.code =
			// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL35_150KV;
			p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strBuilding + " )  "
					+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
					+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
			p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			if (p2cList.totalCount > 0) {
				isBuilding = true;
			}
		}

		// ���� ��� �����
		if (!isCodeIzol && !isKL04_35 && !isVL04_20 && !isVL35_150 && !isBuilding) {
			p2cFilter.planRef.code = plan.code;
			// p2cFilter.classificationTypeRef.code =
			// TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL35_150KV;
			p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strSzdtu + " )  "
					+ " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c "
					+ "                                    where p2c.planrefcode = " + plan.code + " ) ";
			p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			if (p2cList.totalCount > 0) {
				isSzdtu = true;
			}
		}

		// ���� ������ ������ ��������
		if (isCodeIzol) {
			createDistancesIzol(servicesObject, plan, distance);
		} else if (isKL04_35 || isVL04_20 || isVL35_150 || isBuilding) {
			/*���� ������ �� ��� ������ ��� ������ �� ���� ������ � �� ������������� */
			createDistancesKlVl(servicesObject, plan, distance);
		} else if(isSzdtu) {
			/*���� ������ �����*/
			createDistancesKlVl(servicesObject, plan, distance, true);
	    } else {
			for (int i = 0; i < trArr.length; i++) {
				// ��� ����������� �� �����. ������� (�� ����, ����� ����������
				// !!) ���������� ���������� ������ �� 1-� ������

				int transportCode = trArr[i];

				if (isNotLicensedActivity == TKConsts.ISNOTLICENSEDACTIVITY_SERVICE_OTHERS) {
					if (i > 0)
						break;
				}

				if(isNotLicensedActivity == TKConsts.ISNOTLICENSEDACTIVITY_SERVICE_OTHERS) {
					// 08.04.2019 ��������� ������ ��-�� ������� ��� �������������� ����� �� �������������
					// �������� ��������� - ���������, �� �� ���� � ��������� ��� � ������ - ���� ���������
					// ��� ������ �� ���������� ��������� �����������, �� ��������� ����� ������������ �� �� ��� ����������, ���
					// � ���������. ������� ���, �����, ���� ���� ��������� � ���������, �� ������ ��, � �� ������ ����������.
					ENTransportItemFilter filter = new ENTransportItemFilter();
					filter.planRef.code = plan.code;
					filter.conditionSQL = "exists (select 1 from tktechcard as tc1 inner join enplanworkitem as pi1 on tc1.code = pi1.kartarefcode " +
					" where coalesce(tc1.middlesallaryway,?) > ? and pi1.code = ENTRANSPORTITEM.PLANITEMREFCODE)";
					Vector<BigDecimal> binded = new Vector<>(Arrays.asList(BigDecimal.ZERO, BigDecimal.ZERO));
					int[] transportWithDelivery = trDAO.getFilteredCodeArray(filter, 0, -1, binded);
					if(transportWithDelivery.length > 0) {
						// 08.04.2019 ����� ����������� ��������� ���� ������� ����� ���� � ��������� ���������, ���� ������� ���������, ��
						// ��������� ���������������� �� ����� ��������� ����� ��������� ���������
						if(transportWithDelivery.length == 1) {
							transportCode = transportWithDelivery[0];
						}
					}
				}

				ENDistanceFilter distFilter = new ENDistanceFilter();
				distFilter.transportItemRef.code = transportCode;
				int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
				for (int j = 0; j < distArr.length; j++) {
					distDAO.remove(distArr[j]);
				}

				ENDistance dist = new ENDistance();
				dist.transportItemRef.code = transportCode;
				dist.distance = distTO;
				dist.roadType.code = ENRoadType.HIGHWAY;
				dist.typeRef.code = ENDistanceType.DISTANCE_TO;
				distDAO.add(dist);

				dist = new ENDistance();
				dist.transportItemRef.code = transportCode;
				dist.distance = distFROM;
				dist.roadType.code = ENRoadType.HIGHWAY;
				dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
				distDAO.add(dist);

			}


		}


		// � ��� ��� ���-�� �����? ;))
		// ���� ���� - ��������� generateGSMEstimate4Calculation - �� ������� ��
		// ���� ��������� ��-�� ...
		// trLogic.generateGSMEstimate4Calculation(trArr[i], plan.dateStart );

		trLogic.createDeliveryTimeForPlan(plan.code);

	}



    public ENServicesObject getServicesObjectByPlanCode(int planCode) throws PersistenceException
    {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObjectNoRefNoSegr(planCode);
        return getServicesObjectByElementCode(plan.elementRef.code);
    }


    /**
     *
     * ���������� ������ ����� �� ������� {@link ENServicesObject} �� ���� �������� {@link ENElement}
     *
     * ������ ������ ���� ������� �� �������� ��������� ����� �� �������
     *
     * @param elementCode ��� ��������
     * @return ������ �������� ����� �� ������� {@link ENServicesObject}
     * @throws PersistenceException
     */
    public ENServicesObject getServicesObjectByElementCode(int elementCode) throws PersistenceException {
    	return getServicesObjectByElementCode(elementCode, true);
    }

    /**
     *
     * ���������� ������ ����� �� ������� {@link ENServicesObject} �� ���� �������� {@link ENElement}
     *
     * @param elementCode ��� ��������
     * @param isThrowExceptionIfNotExists ���� {@code true}, �� ������ ���������� ���� ������� �� ������ � ���������,
     * � ��������� ������ ��������� {@code null}
     * @return ������ �������� ����� �� ������� {@link ENServicesObject}
     * @throws PersistenceException
     */
    public ENServicesObject getServicesObjectByElementCode(int elementCode, boolean isThrowExceptionIfNotExists) throws PersistenceException {
        if (elementCode == Integer.MIN_VALUE) {
            throw new SystemException("ElementCode is NULL!!!");
        }

        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObjectFilter f = new ENServicesObjectFilter();
        f.element.code = elementCode;

        //int[] arr = objDAO.getFilteredCodeArray(f, 0, -1);
        int[] arr = objDAO.getFilteredCodeArrayNOSEGR(f, 0, -1);

        if (arr.length != 1)
        {
        	if(arr.length == 0) {
        		if(isThrowExceptionIfNotExists) {
        			throw new SystemException("Element count != 0 (ENServicesObject)");
        		} else {
        			return null;
        		}
        	} else {
                throw new SystemException("Element count != 1 (ENServicesObject)");
        	}
        }

        return objDAO.getObjectNoSegr(arr[0]);
    }

    public ENServicesObject getServicesObjectForSupplierByActCode(int actCode, boolean isThrowExceptionIfNotExists) throws PersistenceException {
        if (actCode == Integer.MIN_VALUE) {
            throw new SystemException("\n\nNET-4576 �� ������� ��� ����!");
        }

        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObjectFilter f = new ENServicesObjectFilter();
        f.conditionSQL = " code in " +
        		" (select so.code " +
        		"  from " +
        		"     enservicesobject as so, " +
        		"     enservices2plan as s2p, enact2enplanwork as a2p " +
        		"  where " +
        		"     s2p.servicesobjectrefcode = so.code " +
        		"     and s2p.planrefcode = a2p.plancode " +
        		"     and a2p.actrefcode = " + actCode + ")";

        //int[] arr = objDAO.getFilteredCodeArray(f, 0, -1);
        int[] arr = objDAO.getFilteredCodeArrayNOSEGR(f, 0, -1);

        if (arr.length != 1) {
        	if(arr.length == 0) {
        		if(isThrowExceptionIfNotExists) {
        			throw new SystemException("Element count == 0 (ENServicesObject)");
        		} else {
        			return null;
        		}
        	} else {
                throw new SystemException("Element count != 1 (ENServicesObject)");
        	}
        }

        return objDAO.getObjectNoSegr(arr[0]);
    }

    public boolean isActForServicesObjectSupplierContract(int actCode) throws PersistenceException{
    	ENServicesObject servicesObject = getServicesObjectForSupplierByActCode(actCode, false);

    	if (servicesObject == null) {
    		//throw new SystemException("\n\nNET-4576 �� �������� ������ ��� ���� � ����� " + actCode + " !");
    		return false;
    	}

    	return (servicesObject.contractKindRef.code == ENServicesContractKind.SUPPLIER_CONTRACT);
    }

    public int addForCalculation(ENServicesObject object, int planKindCode) throws PersistenceException {
    return addForCalculation(object, planKindCode, null); }


    public int addForCalculation(ENServicesObject object, int planKindCode, Date customPlanDate ) throws PersistenceException
    {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

          /* ������������ ����
          statuscode
          elementrefcode
          renrefcode
          kindcode
          staterefcode
          formrefcode
          sourcerefcode
          */

        ENPlanWork plan = new ENPlanWork();
        plan.elementRef.code = object.element.code;
        plan.renRef.code = object.element.renRef.code;
        plan.status.code = ENPlanWorkStatus.GOOD;
        //plan.kind.code = ENPlanWorkKind.CALCULATION;
        plan.kind.code = planKindCode;
        plan.typeRef.code = ENPlanWorkType.WORK_IN_OUT;
        plan.stateRef.code = ENPlanWorkState.WORK_IN_OUT;
        plan.formRef.code = ENPlanWorkForm.NOPLANNED;
        plan.sourceRef.code = ENPlanWorkSource.MANUAL;
        plan.departmentRef.code = ENConsts.ENDEPARTMENT_KSOE;

          Calendar c = Calendar.getInstance();
          if (customPlanDate == null) {
        	  c.setTime(new Date());
          }
          else {
        	  c.setTime(customPlanDate);
          }

          plan.yearGen = c.get(Calendar.YEAR);
          plan.monthGen = c.get(Calendar.MONTH) + 1;

          c.set(Calendar.HOUR_OF_DAY, 0);
          c.set(Calendar.MINUTE, 0);
          c.set(Calendar.SECOND, 0);
          c.set(Calendar.MILLISECOND, 0);

         // plan.dateStart = planLogic.getFirstDate(new Date());
          plan.dateStart = c.getTime();
          plan.dateFinal = planLogic.getLastDate(new Date());

        return planDAO.add(plan);
    }

    public boolean checkEditableCalculationByServicesObject(ENServicesObject obj, boolean isException) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(obj.element.code);
        return checkEditableCalculation(obj, plan, isException);
    }

    public boolean checkEditableCalculation(int planCode, boolean isException) throws PersistenceException
    {
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);
        return checkEditableCalculation(obj, isException);
    }

    public boolean checkEditableCalculation(ENPlanWork plan, boolean isException) throws PersistenceException {
        return checkEditableCalculation(plan, isException, false);
    }

    public boolean checkEditableCalculation(ENPlanWork plan, boolean isException, boolean priconnections) throws PersistenceException
    {
        if (!priconnections) {
            ENServicesObject obj = getServicesObjectByElementCode(plan.elementRef.code);
            return checkEditableCalculation(obj, plan, isException);
        }
        return true;
    }

    public boolean checkEditableCalculation(ENServicesObject obj, ENPlanWork plan, boolean isException) throws PersistenceException
    {
        boolean out = true;

        if (plan.status.code != ENPlanWorkStatus.GOOD)
        {
            if (isException)
            {
                throw new SystemException("���������� ������� ����� ������ ���������!");
            }
            return false;
        }


        if (obj.contractStatusRef.code != ENServicesContractStatus.GOOD)
        {
        	if (obj.contractKindRef.code == ENServicesContractKind.SUPPLIER_CONTRACT &&
        		obj.contractStatusRef.code == ENServicesContractStatus.SIGNED) {
        		return true;
        	}

            if (isException)
            {
                throw new SystemException("���������� ������� ����� ������ ���������!");
            }
            return false;
        }

        return out;
    }

    public boolean checkEditableServicesObject(ENServicesObject obj, boolean isException) throws PersistenceException
    {
        boolean out = true;

        if (obj.contractStatusRef.code != ENServicesContractStatus.GOOD && obj.contractStatusRef.code != ENServicesContractStatus.BUDGETAPPROVED)
        {
            if (isException)
            {
                throw new SystemException("��� �������� ���������� �� �����!");
            }
            return false;
        }

        return out;
    }


    public void createDistancesByPlanItemCodeNotLicensed(int planworkitem, BigDecimal distance) throws PersistenceException
    {

        BigDecimal distTO = distance.divide(new BigDecimal(2), 3, BigDecimal.ROUND_HALF_UP);
        BigDecimal distFROM = distance.subtract(distTO).setScale(3, BigDecimal.ROUND_HALF_UP);

        ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);

        ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter trFilter = new ENTransportItemFilter();

        trFilter.planItemRef.code = planworkitem;

        int[] trArr = trDAO.getFilteredCodeArray(trFilter, trFilter.conditionSQL, null, 0, -1, null);
        for (int i=0; i < trArr.length; i++){

            ENDistanceFilter distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = trArr[i];
            int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);


        }


        // trLogic.createDeliveryTimeForPlan(plan.code);

    }

    public void checkFinWorkTypes(ENPlanWork2ClassificationType object) throws PersistenceException {
        checkFinWorkTypes(object, false);
    }

    public void checkFinWorkTypes(ENPlanWork2ClassificationType object, boolean priconnections) throws PersistenceException
    {
        ///////
        // ���������, ����� �� ��������� � ����������� ������������� ��� �������� � ���� ����� �� �����
        TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
        TKClassificationTypeShort ctObjShort = ctDAO.getShortObject(object.classificationTypeRef.code);

        if (ctObjShort.finWorkTypeCode == Integer.MIN_VALUE)
        {
            throw new SystemException("��� ������ (������������) \"" + ctObjShort.kod + "  " + ctObjShort.name + "\"" +
                                                "\n �� �������� ��� ���� � ������! \n ��������� � ���������� ����������!");
        }

        if ((ctObjShort.finWorkTypeFinCode == null) || (ctObjShort.finWorkTypeFinCode == ""))
        {
            throw new SystemException("� �������� ���� ���� � ������ �� ������� ��� ����. ��� � ��������: " + ctObjShort.finWorkTypeCode);
        }

        if ((ctObjShort.finWorkTypeAccount == null) || (ctObjShort.finWorkTypeAccount == ""))
        {
            throw new SystemException("� �������� ���� ���� � ������ (" + ctObjShort.finWorkTypeFinCode + ") �� ������� ���. �������. ��� � ��������: " + ctObjShort.finWorkTypeCode);
        }
        ///////

        if (!priconnections) {
            ////////////////////////////////////////////////////////////////
            // �������� �� ���������� ����� ����� �� �����
            if (object.planRef.code != Integer.MIN_VALUE)
            {
                ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);

                //TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
                TKClassificationType ctObj = ctDAO.getObject(object.classificationTypeRef.code);

                String finWorkTypeFinCode = (ctObj.finWorkType.finCode == null ? "" : ctObj.finWorkType.finCode);

                ENPlanWork2ClassificationTypeFilter p2ctFilter = new ENPlanWork2ClassificationTypeFilter();
                p2ctFilter.planRef.code = object.planRef.code;
                ENPlanWork2ClassificationTypeShortList p2ctList = dao.getScrollableFilteredList(p2ctFilter, 0, -1);
                for (int i = 0; i < p2ctList.totalCount; i++)
                {
                    TKClassificationType ctObj1 = ctDAO.getObject(p2ctList.get(i).classificationTypeRefCode);
                    String finWorkTypeFinCode1 = (ctObj1.finWorkType.finCode == null ? "" : ctObj1.finWorkType.finCode);

                    if (! finWorkTypeFinCode1.equals(finWorkTypeFinCode))
                    {
                                throw new SystemException("���������� �������� � ������ ������, �� ����� ��� ���� � ��������: \n" +
                                        ctObj.kod  + ": " + (ctObj.finWorkType.name == null ? "(�������)" : ctObj.finWorkType.name) + " \n" +
                                        ctObj1.kod + ": " + (ctObj1.finWorkType.name == null ? "(�������)" : ctObj1.finWorkType.name) + " !");
                    }
                }
            }
               ////////////////////////////////////////////////////////////////
        }

    }

    /*
    public int getIsNotLicensedActivity(ENServicesObject obj) throws PersistenceException
    {
        int result = 0;

        ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);

        ENPlanWork2ClassificationTypeFilter p2ctFilter = new ENPlanWork2ClassificationTypeFilter();
        ENPlanWork plan = getPlanWorkCalculationByElementCode(obj.element.code);
        //p2ctFilter.planRef.code = getPlanWorkCalculationByElementCode(obj.element.code).code;
        if (plan.code == Integer.MIN_VALUE)
        {
            return result;
        }
        p2ctFilter.planRef.code = plan.code;

        ENPlanWork2ClassificationTypeShortList p2ctList = dao.getScrollableFilteredList(p2ctFilter, 0, -1);

        if (p2ctList.totalCount > 0)
        {
            TKClassificationType ctObj = ctDAO.getObject(p2ctList.get(0).classificationTypeRefCode);
            return (ctObj.isnotlicensedactivity == Integer.MIN_VALUE ? 0 : ctObj.isnotlicensedactivity);
        }

        return result;
    }
      */


    public int getIsNotLicensedActivity(int planCode)
            throws PersistenceException {
        int result = 0;
        Connection connect = null;
        try {
            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connect, userProfile);
            ENPlanWork2ClassificationTypeFilter p2ctFilter = new ENPlanWork2ClassificationTypeFilter();
            if (planCode == Integer.MIN_VALUE) {
                return result;
            }
            p2ctFilter.planRef.code = planCode;

            ENPlanWork2ClassificationTypeShortList p2ctList = dao.getScrollableFilteredList(p2ctFilter, 0, -1);
            if (p2ctList.totalCount > 0) {
                TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connect, userProfile);
                TKClassificationType ctObj = ctDAO.getObject(p2ctList.get(0).classificationTypeRefCode);
                return (ctObj.isnotlicensedactivity == Integer.MIN_VALUE ? 0 : ctObj.isnotlicensedactivity);
            }

            return result;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
    }


        protected java.sql.Connection getNEWConnection(String dataSourceName) throws DatasourceConnectException
        {
            java.sql.Connection    _connection = null;
            try {

                InitialContext initialContext = new InitialContext();
                DataSource dataSource = (DataSource) initialContext
                        .lookup(dataSourceName);
                _connection = dataSource.getConnection();

                return _connection;
            } catch (NamingException e) {
                //System.out.print("error");
                throw new DatasourceConnectException(dataSourceName, e);
            } catch (SQLException e) {
                //System.out.print("error");
                throw new DatasourceConnectException(dataSourceName, e);
            }
        }

        public void recalculateCalculations(ENPlanWork2ClassificationType object) throws PersistenceException {
            recalculateCalculations(object, false);
        }

        public void recalculateCalculations(ENPlanWork2ClassificationType object, boolean priconnections) throws PersistenceException
            {
            // ������� ��� ����� ��� ��������� � ��������� ���������� �� �������
              // ��� ��������� �� ����������
            Connection connect = null;
            try {
            int planCalcSingle = Integer.MIN_VALUE;
            int planCalc = Integer.MIN_VALUE;

            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            // ��� ����� ���������� ���������
            ENPlanWorkDAO planCalcSingleDAO = new ENPlanWorkDAO(connect, userProfile);
            ENPlanWorkFilter planCalcSingleFilter = new ENPlanWorkFilter();

            if (priconnections) {
              /*
                planCalcSingleFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION_SINGLE +
                        " and statuscode = " + ENPlanWorkStatus.GOOD;
               */

                planCalcSingleFilter.conditionSQL = " code = (" +
                        " select p2.code" +
                        "  from enplanwork p1, enplanwork p2, enplanwork2classfctntp ct1, enplanwork2classfctntp ct2 " +
                        " where p1.code = ct1.planrefcode " +
                        " and ct1.classificationtyperfcd = ct2.classificationtyperfcd " +
                        " and p2.code = ct2.planrefcode " +
                        " and p1.elementrefcode = p2.elementrefcode " +
                        " and p2.kindcode = " + ENPlanWorkKind.CALCULATION_SINGLE +
                        " and p2.statuscode = " + ENPlanWorkStatus.GOOD +
                        " and p1.code = " + object.planRef.code + ")";


            } else {
                planCalcSingleFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION_SINGLE;
            }

            //ENPlanWorkShortList planCalcSingleList = planCalcSingleDAO.getScrollableFilteredList(planCalcSingleFilter, 0, -1);

            int planCalcSingleList[] =  planCalcSingleDAO.getFilteredCodeArray(planCalcSingleFilter, 0, -1);

            // �������� ���� ��� ���������� ��������� �� ����� � ������������� ������
            if (planCalcSingleList.length == 0 ) {
                return;
            }
            planCalcSingle = planCalcSingleList[0];
            // ��� ����� ���������

            ENPlanWorkDAO planCalcDAO = new ENPlanWorkDAO(connect, userProfile);
            ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();

            if (priconnections) {
                /*
                planCalcFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION +
                        " and statuscode = " + ENPlanWorkStatus.GOOD;

                */

                planCalcFilter.conditionSQL = " code = " + object.planRef.code;

            } else {
                planCalcFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION;
            }

            //ENPlanWorkShortList planCalcList = planCalcDAO.getScrollableFilteredList(planCalcFilter, 0, -1);

            int planCalcList[] = planCalcDAO.getFilteredCodeArray(planCalcFilter, 0, -1);
            planCalc = planCalcList[0];

            ServicesCalculatorLogic scLogic = new ServicesCalculatorLogic(connect, userProfile);
            // ������������� ������ �������� ��� ���������
            scLogic.reCalculateCalcHumenSalary(planCalcSingle , planCalc );
            // ������������� ������ ���������� ��� ���������

            //  scLogic.recalculateMaterials(planCalcSingle , planCalc );  NET-4212

            // encalccost �������� ������� ��������� ���������� ���� (������) (������������� ������� ����� �����������)
            scLogic.recalculateCost(planCalcSingle, planCalc, priconnections);
            // encalcTotalcost �������� ��������� �����
            scLogic.recalculateTotalCost(planCalcSingle, planCalc, priconnections);
            // ������������� ��������� ����� �� �������� ��� ����� �������� ���������
            scLogic.calculateContractCost(planCalcSingle, priconnections);
            // ������������� ��������� ����� �� �������� ��� ����� ��������
            scLogic.calculateContractCost(planCalc, priconnections);

            ENServicesObject soObj = getServicesObjectByPlanCode(planCalc);

            // ������� ����� �� �������� �� ������ �������
            ENCalcContractTotalDAO calcContractTotalDAO = new  ENCalcContractTotalDAO(connect, userProfile);
            ENCalcContractTotalFilter calcContractTotalFilter = new ENCalcContractTotalFilter();

            if (priconnections) {
                calcContractTotalFilter.conditionSQL =
                        " planrefcode in (select pl.code from enplanwork pl " +
                        " where pl.kindcode = " + ENPlanWorkKind.CALCULATION +
                        " and pl.elementrefcode = " + soObj.element.code + ")";
            } else {
                calcContractTotalFilter.planRef.code = planCalc;
            }

            ENCalcContractTotalShortList calcContractTotalList = calcContractTotalDAO.getScrollableFilteredList(calcContractTotalFilter, 0, -1);

            if (calcContractTotalList.totalCount > 0 ) {
                if (priconnections) {
                    BigDecimal totalCost = new BigDecimal(0);
                    for (int i = 0; i < calcContractTotalList.totalCount; i++) {
                        totalCost = totalCost.add(calcContractTotalList.get(i).costWithoutVAT);
                    }
                    soObj.contractServicesSumma = totalCost;

                } else {
                    soObj.contractServicesSumma = calcContractTotalList.get(0).costWithoutVAT;
                }

                ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connect, userProfile);
                servicesObjectDAO.save(soObj);
            }


            // �� ���� ��������� �������� ������ �� ������ � ������������� cost b totalcost
            // ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
            // ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
            // p2cFilter.planRef.code = planCalc;
            // ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);

            // for (int i=0; i < p2cList.totalCount; i++){

                // scLogic.calculateCost(p2cList.get(i).planRefCode, p2cList.get(i).classificationTypeRefCode , p2cList.get(i).code);
                //  scLogic.calculateTotalCost(p2cList.get(i).planRefCode, p2cList.get(i).classificationTypeRefCode , p2cList.get(i).code);
            // }



                } catch (DatasourceConnectException e) {
                    throw new SystemException(e.getMessage(),e);
                } finally {
                    try {
                        if ((connect != null) && !connect.isClosed())
                            connect.close();
                    } catch (SQLException e) {
                    }
                }

            }

        public void recalcTimeLineForServicesObject(int servicesObjectCode) throws PersistenceException
            {
            Connection connect = null;
            int START_LUNCH_HOUR = 12;
            int START_LUNCH_MINUTE = 12;

            int FINAL_LUNCH_HOUR = 13;
            int FINAL_LUNCH_MINUTE = 0;

            try {


            BigDecimal sumTime = new BigDecimal(0);

            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


            // �������� ����� ���������� �����
            ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connect, userProfile);
            ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
            piFilter.conditionSQL = " ENPLANWORKITEM.COUNTGEN <> 0  and ENPLANWORK.CODE in (  select p.code from enservicesobject so , enplanwork p " +
                                        " where so.elementcode = p.elementrefcode " +
                                        "   and p.kindcode = " + ENPlanWorkKind.CALCULATION +
                                        "  and so.code = " +  servicesObjectCode + " ) "  ;
            ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(piFilter,0,-1);

                for (int i = 0; i < piList.totalCount; i++){
                    sumTime = sumTime.add(piList.get(i).timeGen);
            }
            // ������� ����� �������� � ���� �����
            BigDecimal  timeDelivery1Way = new BigDecimal(0);
            ENDeliveryTimePlanDAO dplDAO = new ENDeliveryTimePlanDAO(connect, userProfile);
            ENDeliveryTimePlanFilter dplFilter = new ENDeliveryTimePlanFilter();
            dplFilter.conditionSQL = " ENPLANWORK.CODE in (  select p.code from enservicesobject so , enplanwork p " +
                                    "  where so.elementcode = p.elementrefcode " +
                                    "   and p.kindcode = " + ENPlanWorkKind.CALCULATION +
                                    "   and so.code = " +  servicesObjectCode + " ) "  ;
              ENDeliveryTimePlanShortList dplList = dplDAO.getScrollableFilteredList(dplFilter,0,-1);
              if (dplList.totalCount > 0) {
              timeDelivery1Way = dplList.get(0).deliveryTimePlan.divide(new BigDecimal(2),2);
              }

            // ������ ������� ����������� ��� ���������� ����� �� ��������  timestart
            ENTimeLineDAO tlDAO = new ENTimeLineDAO(connect, userProfile);
            ENTimeLineFilter tlFilter = new ENTimeLineFilter();
            tlFilter.servicesObjectRef.code = servicesObjectCode;
            ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
            if (tlList.totalCount > 0 ){

                // ��������� �����
                Calendar cLunch  = Calendar.getInstance();
                cLunch.setTime(tlList.get(0).dateGen); // ���� ����� �� ���� ���� ��� ������� �������
                cLunch.set(Calendar.HOUR,START_LUNCH_HOUR);
                cLunch.set(Calendar.MINUTE,START_LUNCH_MINUTE);
                cLunch.set(Calendar.SECOND,0);
                cLunch.set(Calendar.MILLISECOND,0);

                long startLunch_Value = cLunch.getTime().getTime();

                cLunch  = Calendar.getInstance();
                cLunch.setTime(tlList.get(0).dateGen); // ���� ����� �� ���� ���� ��� ������� �������
                cLunch.set(Calendar.HOUR,FINAL_LUNCH_HOUR);
                cLunch.set(Calendar.MINUTE,FINAL_LUNCH_MINUTE);
                cLunch.set(Calendar.SECOND,0);
                cLunch.set(Calendar.MILLISECOND,0);

                long finalLunch_Value = cLunch.getTime().getTime();


                int timeHour = sumTime.intValue(); // ������������ ���������� ����� ����
                int timeMinute = new Double( (sumTime.doubleValue() - sumTime.intValue()) * 60 ).intValue(); // ������������ ���������� ����� ������
                // �������� ���� ������  ��������� ���������� ����������� � ���������
                Calendar c = Calendar.getInstance();
                c.setTime(tlList.get(0).timeStart);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                long tempTimeStart_Value = c.getTime().getTime();
                // �������� ���� �� ������� ����������� ������������ � ���������
                c = Calendar.getInstance();
                c.setTime(tlList.get(0).timeMoveToObject);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                long tempTimeMoveToObject_Value = c.getTime().getTime();
                //
                c = Calendar.getInstance();
                c.setTime(tlList.get(0).timeStart);
                c.add(Calendar.HOUR , timeHour);
                c.add(Calendar.MINUTE , timeMinute);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                  // �������� ���� ��������� ��������� ���������� ����������� � ���������
                Date tempTimeFinal_Date = c.getTime();
                long tempTimeFinal_Value = c.getTime().getTime();





                // ������ ���� ���� ������ �� ���� �� �������� ��� ��������� � ����� �������� �� �������� ���� ���������� �����.
                ENTimeLineFilter tlOtherFilter = new ENTimeLineFilter();
                tlOtherFilter.dateGen = tlList.get(0).dateGen;
                tlOtherFilter.conditionSQL = " ENSERVICESOBJECT.CODE <> " + servicesObjectCode +
                    " and ENTIMELINE.VIRTUALBRIGADEREFCODE in " +
                    " ( select tl2.virtualbrigaderefcode from entimeline tl2 where tl2.servicesobjectrefcode = " + servicesObjectCode + " )";
                ENTimeLineShortList tlOtherList = tlDAO.getScrollableFilteredList(tlOtherFilter,0,-1);


//                 ���� �������� ���������� �� ������� "��"  ��������� � �������� ����� ��� ����������� ����� ����� �� ��������� ����� ������� �� ����� ����
                /* if ( (tempTimeFinal_Value > startLunch_Value ) && ( tempTimeFinal_Value < finalLunch_Value ) ) {
                    tempTimeFinal_Value = finalLunch_Value +
                                            (tempTimeFinal_Value - tempTimeStart_Value ) - // ������������ ���������� �����
                                            (startLunch_Value - tempTimeStart_Value)  ;
                    tempTimeFinal_Date.setTime(tempTimeFinal_Value);
                }
                // ���� �������� ���������� �� ������� ������� �� ������� ���������� ������� �� � ������� �����
                if ((tempTimeFinal_Value  > finalLunch_Value) && (tempTimeStart_Value < startLunch_Value )) {
                    tempTimeFinal_Date.setTime(tempTimeFinal_Value + (finalLunch_Value - startLunch_Value));
                } */

                if ((tempTimeFinal_Value > startLunch_Value ) && ( tempTimeStart_Value < startLunch_Value )) {
                            tempTimeFinal_Value = finalLunch_Value +
                              (tempTimeFinal_Value - tempTimeStart_Value ) - // ������������ ���������� �����
                              (startLunch_Value - tempTimeStart_Value)  ;
                        tempTimeFinal_Date.setTime(tempTimeFinal_Value);
                }

                int timeHourDelivery1Way = timeDelivery1Way.intValue(); // ����� �������� ����
                  int timeMinuteDelivery1Way = new Double( (timeDelivery1Way.doubleValue() - timeDelivery1Way.intValue()) * 60 ).intValue(); // ����� �������� ������
                  c = Calendar.getInstance();
                  // � ������� ��������� ��������� ���������� ����������� � ��������� �������� ���-�� ����� ��� ����������� �� ������� ����������� �������� �� ����
                c.setTime(tempTimeFinal_Date);
                c.add(Calendar.HOUR , timeHourDelivery1Way);
                c.add(Calendar.MINUTE , timeMinuteDelivery1Way);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                  // �������� ���� ����������� ����������� �� ���������
                Date tempTimeMoveOfObject_Date = c.getTime();
                long tempTimeMoveOfObject_Value = c.getTime().getTime();

                for (int ii = 0; ii < tlOtherList.totalCount; ii++){
                    // ��������� ������ � ����� ���������� ����� ����� �� �������� � ���� ����
                    Calendar cOther  = Calendar.getInstance();
                    cOther.setTime(tlOtherList.get(ii).timeMoveToObject);
                    cOther.set(Calendar.SECOND,0);
                    cOther.set(Calendar.MILLISECOND,0);

                    long startOtherTimeLine = cOther.getTime().getTime();

                    cOther  = Calendar.getInstance();
                    cOther.setTime(tlOtherList.get(ii).timeMoveOfObject);
                    cOther.set(Calendar.SECOND,0);
                    cOther.set(Calendar.MILLISECOND,0);
                    long finalOtherTimeLine = cOther.getTime().getTime();





                    // �������� ��� �� �� �������� �� �������� ���� ����
                    // ���� ����� timeLine �������� �������� ����� �� ������ ������� timeLine �� ��������
                    if ( (tempTimeMoveOfObject_Value > startOtherTimeLine) && (tempTimeMoveOfObject_Value < finalOtherTimeLine)){
                        throw new SystemException("������� � ����������� ���� ��� ��������� �������� . � ��� ��� ������� ����� �� ������ ��`���." );
                        }
                    // ���� ����� timeline �������� �������� �������� ������ ��� timeline �� �������� ��������
                    // � ���� ������ ���������� �������� �� �������� �������� ������ ��� ��� ������� ��������
                    if ( (tempTimeMoveOfObject_Value >= finalOtherTimeLine) && ( tempTimeMoveToObject_Value < startOtherTimeLine )){
                        throw new SystemException("������� � ����������� ���� ��� ��������� �������� . � ��� ��� ������� ����� �� ������ ��`���." );
                        }



                }
                // ��������� �� ����������� ���� �� ���������� ������ ������ ����� ����� ��������� ����� �� ������� � ����� ����������� � TimeLine
                ENTimeLineFilter tlupdFilter = new ENTimeLineFilter();
                tlupdFilter.servicesObjectRef.code = servicesObjectCode;
                ENTimeLineShortList tlupdList = tlDAO.getScrollableFilteredList(tlupdFilter,0,-1);
                ENTimeLine tlObj;
                for (int u = 0; u < tlupdList.totalCount; u++){
                    tlObj = tlDAO.getObject(tlupdList.get(u).code);
                    tlObj.timeFinal = tempTimeFinal_Date;
                    tlObj.timeMoveOfObject = tempTimeMoveOfObject_Date;
                    tlDAO.save(tlObj);

                }
                // ��������  ���� ���������� , �������� � �  �������� �� �� �������������
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connect, userProfile);
                ENServicesObject soObj ;
                soObj =  soDAO.getObject(servicesObjectCode);
                soObj.executeWorkDate = tlList.get(0).dateGen; // ���� ���������� �����
                soObj.timeStart = tlList.get(0).timeStart; // ����� ������ ���������� �� �������
                soObj.timeFinal = tempTimeFinal_Date; // ����� ����� ��������� ������� ���������� �� �������
                soDAO.save(soObj);
            }






                } catch (DatasourceConnectException e) {
                    throw new SystemException(e.getMessage(),e);
                } finally {
                    try {
                        if ((connect != null) && !connect.isClosed())
                            connect.close();
                    } catch (SQLException e) {
                    }
                }

            }


//         �������� ���� �� � ������ ENPlanWork2ClassificationType ������ ������������� �� ������� ��� �������
            public boolean isReservedCalculationInContract(int svoCode) throws PersistenceException{
                boolean out = false;

                ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
                ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2cltFilter.conditionSQL = " ENPLANWORK2CLASSFCTNTP.PLANREFCODE in ( " +
                    " select pw.code from enplanwork pw  , enservicesobject so " +
                    " where pw.elementrefcode = so.elementcode " +
                    " and pw.kindcode = " + ENPlanWorkKind.CALCULATION +
                    " and so.code = " + svoCode +
                    " limit 1 ) ";
                pw2cltFilter.isJobsByTime = 1;
                int[] pw2cltArr = pw2cltDAO.getFilteredCodeArray(pw2cltFilter, 0, -1);

                    if ( pw2cltArr.length > 0  ){
                        out = true;
                    }

                return out;
            }

  public int createWorkOrderToPlanServices(int planCode) throws PersistenceException, RemoteException, CreateException{


    int wo2PlanCode = Integer.MIN_VALUE;
        ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plObj = plDAO.getObject(planCode);

        PlanWorkLogic pllogic = new PlanWorkLogic(connection, userProfile);
        TKVirtualBrigade vbObj = pllogic.getTKVirtualBrigade(planCode);
        ENWorkOrder2ENPlanWork wo2pObj = new  ENWorkOrder2ENPlanWork();
        wo2pObj.code = Integer.MIN_VALUE;
        wo2pObj.plan.code =  plObj.code;
        wo2pObj.workOrder.code = Integer.MIN_VALUE;
        wo2pObj.workOrder.department.code = plObj.departmentRef.code;
        wo2pObj.workOrder.dateGen = plObj.dateStart;
        wo2pObj.workOrder.finMolCode = vbObj.molMasterCode;
        wo2pObj.workOrder.finMolName = vbObj.molMasterName;

        Context context;
        try {
            context = new InitialContext();

        Object objWoRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);
        ENWorkOrder2ENPlanWorkControllerHome woHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject.narrow(objWoRef, ENWorkOrder2ENPlanWorkControllerHome.class);
        ENWorkOrder2ENPlanWorkController wo2PlanController = woHome.create();

        wo2PlanCode = wo2PlanController.add(wo2pObj);
        } catch (NamingException e) {
            throw new SystemException(e.getMessage(),e);
        }
        return wo2PlanCode;


        }

  public int createFinMolToPlanServices(int planCode) throws PersistenceException, RemoteException, CreateException{
        PlanWorkLogic pllogic = new PlanWorkLogic(connection, userProfile);
        TKVirtualBrigade vbObj = pllogic.getTKVirtualBrigade(planCode);

        ENWorkOrder2ENPlanWorkDAO wo2pDAO = new  ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
        ENWorkOrder2ENPlanWorkFilter wo2pFilter = new ENWorkOrder2ENPlanWorkFilter();
        wo2pFilter.plan.code = planCode;
        int wo2pArr[] = wo2pDAO.getFilteredCodeArray(wo2pFilter,null,null,0,-1,null);
        FINMolData fmObj = null;
        ENWorkOrder2ENPlanWork wo2pObj  = null;
        if (wo2pArr.length > 0){
        wo2pObj = wo2pDAO.getObject(wo2pArr[0]);
        fmObj = new FINMolData();
        fmObj.code = Integer.MIN_VALUE;
        fmObj.finMolCode = vbObj.molMasterCode;
        fmObj.finMolName = vbObj.molMasterName;
        fmObj.molTypeRef.code = FINMolType.MASTER;
        fmObj.workOrder.code = wo2pObj.workOrder.code;

        }


        Context context;
        try {
            context = new InitialContext();

      Object objFmRef = context.lookup(FINMolDataController.JNDI_NAME);
      FINMolDataControllerHome fmHome = (FINMolDataControllerHome) PortableRemoteObject.narrow(objFmRef, FINMolDataControllerHome.class);
      FINMolDataController fmd = fmHome.create();

        if (wo2pObj != null ) {
        	fmd.add(fmObj,wo2pObj.workOrder.code , FINMolType.MASTER);
        }
        } catch (NamingException e) {
            throw new SystemException(e.getMessage(),e);
        }
        return planCode;


        }


    public int addForSale(ENServicesObject object)
            throws PersistenceException {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

        /**
        * ������������ ����
        * statuscode
        * elementrefcode
        * renrefcode
        * kindcode
        * staterefcode
        * formrefcode
        * sourcerefcode
        */

        ENPlanWork plan = new ENPlanWork();
        plan.elementRef.code = object.element.code;
        plan.renRef.code = object.element.renRef.code;
        plan.status.code = ENPlanWorkStatus.GOOD;
        plan.kind.code = ENPlanWorkKind.SALE_SPECIFICATION;
        plan.typeRef.code = ENPlanWorkType.SALE_PRODUCTS;
        plan.stateRef.code = ENPlanWorkState.SALE_PRODUCTS;
        plan.formRef.code = ENPlanWorkForm.NOPLANNED;
        plan.sourceRef.code = ENPlanWorkSource.MANUAL;
        plan.departmentRef.code = object.department.code;


        /** SUPP-69112... +++ ���� ����� ����� � ��������... */
        if (object.contractDateServices != null) {

        	Date date = object.contractDateServices;
        	Calendar cal = Calendar.getInstance();
        	cal.setTime(date);
        	int year = cal.get(Calendar.YEAR);
        	int month = cal.get(Calendar.MONTH) + 1;

        	plan.yearGen = year;
        	plan.monthGen = month;

            plan.dateStart = object.contractDateServices;
            plan.dateFinal = object.contractDateServices;

        } else {
            Calendar c = Calendar.getInstance();
            c.setTime(new Date());

            plan.yearGen = c.get(Calendar.YEAR);
            plan.monthGen = c.get(Calendar.MONTH) + 1;

            plan.dateStart = planLogic.getFirstDate(new Date());
            plan.dateFinal = planLogic.getLastDate(new Date());
        }


        return planDAO.add(plan);
    }


  public int getETLabWithMaxMiddleSalaryByServiceContractCode(int serviceObjectCode , ENPlanWork plan ) throws PersistenceException
  {

      ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
      ENTransportItemFilter tiFilter = new ENTransportItemFilter();
               tiFilter.conditionSQL = " ENTRANSPORTITEM.CODE = (select max(z.code) as work4calc from " +
      " ( " +
      " select ti.code, max(tk.middlesallaryway) " +
      " from entransportitem ti, enplanworkitem pwi, tktechcard tk, enservicesobject se, " +
      "     enplanwork p " +
      " where ti.planrefcode = p.code " +
      " and se.elementcode = p.elementrefcode " +
      " and p.kindcode = " + plan.kind.code +
      " and se.code = " + serviceObjectCode +
      " and pwi.code = ti.planitemrefcode " +
      " and tk.code = pwi.kartarefcode " +
      " and ti.transportcode = " + ENConsts.ENSERVICES_OBJECT_ETL_LABORATORY +
      " and tk.middlesallaryway is not null " +
      " group by  ti.code) as z ) ";
               ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);
             //  if (tiList.totalCount > 1)
    //  {throw new SystemException("������ ������ ��������� ������!");}
               if (tiList.totalCount == 0){
               return 0;
               }
               else
               {
                return tiDAO.getObject(tiList.get(0).code).code;
               }
           }


  public int getAutoBrigadeWithMaxMiddleSalaryByServiceContractCode(int serviceObjectCode , ENPlanWork plan ) throws PersistenceException
  {

      ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
      ENTransportItemFilter tiFilter = new ENTransportItemFilter();

      tiFilter.conditionSQL = "  ENTRANSPORTITEM.CODE = (select max(z.code) as work4calc from " +
      " ( " +
      " select ti.code, max(tk.middlesallaryway) " +
      " from entransportitem ti, enplanworkitem pwi, tktechcard tk, enservicesobject se, " +
      "     enplanwork p " +
      " where ti.planrefcode = p.code " +
      " and se.elementcode = p.elementrefcode " +
      " and p.kindcode = " + plan.kind.code +
      " and se.code = " + serviceObjectCode +
      " and pwi.code = ti.planitemrefcode " +
      " and tk.code = pwi.kartarefcode " +
      " and ti.transportcode in ( select t.code from tktransport t where t.transporttypecode = 1  ) " +
      " and tk.middlesallaryway is not null " +
      " group by  ti.code) as z ) ";
               ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);
             //  if (tiList.totalCount > 1)
    //  {throw new SystemException("������ ������ ��������� ������!");}
               if (tiList.totalCount == 0){
               return 0;
               }
               else
               {
                return tiDAO.getObject(tiList.get(0).code).code;
               }
           }



	public String getStringCodesClassificationtypeDown(String tkclassificationtypeCodes) throws PersistenceException {

		String outStr = "";
		outStr = getStringCodesClassificationtypeDown(tkclassificationtypeCodes, outStr);

		return outStr;
	}

	public String getStringCodesClassificationtypeDown(String tkclassificationtypeCodes, String codesIn)
			throws PersistenceException {

		String codes = "";
		Connection connect = null;

		try {
			connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			TKClassificationTypeFilter clssFilter = new TKClassificationTypeFilter();
			clssFilter.conditionSQL = " TK.PARENTREFCODE in (" + tkclassificationtypeCodes + ")";

			TKClassificationTypeDAO clssDAO = new TKClassificationTypeDAO(connect, userProfile);
			TKClassificationTypeShortList clssList = clssDAO.getScrollableFilteredList(clssFilter, 0, -1);

			if (clssList.totalCount > 0) {
				for (int i = 0; i < clssList.totalCount; i++) {
					if (codes.length() == 0)
						codes = getStringCodesClassificationtypeDown("" + clssList.get(i).code, codesIn);
					else
						codes = codes + ", " + getStringCodesClassificationtypeDown("" + clssList.get(i).code, codesIn);
				}
			}

			if (codes.length() == 0)
				codes = "" + tkclassificationtypeCodes;
			else
				codes += ", " + tkclassificationtypeCodes;

			return codesIn + codes;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if ((connect != null) && !connect.isClosed())
					connect.close();
			} catch (SQLException e) {
			}
		}
	}



  // �������� ���� ����������� ������������ ����� ��� ������ ��������
  public String getStringCodesClassificationtypeDown(int tkclassificationtypeCode) throws PersistenceException
    {
        String outStr = "";
        outStr = getStringCodesClassificationtypeDown(tkclassificationtypeCode,outStr);
        return outStr;
    }

    public String getStringCodesClassificationtypeDown(int tkclassificationtypeCode, String codesIn) throws PersistenceException
    {
        String codes = "";
        Connection connect = null;
        try {
        connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        TKClassificationTypeFilter clssFilter = new TKClassificationTypeFilter();
        clssFilter.parentRef.code = tkclassificationtypeCode;
        TKClassificationTypeDAO clssDAO = new TKClassificationTypeDAO(connect, userProfile);
        TKClassificationTypeShortList clssList = clssDAO.getScrollableFilteredList(clssFilter,0,-1);

        if (clssList.totalCount > 0){
            for (int i=0; i < clssList.totalCount; i++){
                if (codes.length() == 0 )
                    codes = getStringCodesClassificationtypeDown( clssList.get(i).code , codesIn);
                else
                    codes = codes + ", " + getStringCodesClassificationtypeDown( clssList.get(i).code , codesIn);
            }
        }
        if (codes.length() == 0 )
            codes = "" + tkclassificationtypeCode;
        else
            codes += ", " + tkclassificationtypeCode;

        return codesIn + codes;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e); }

    }

    public void createDistancesIzol(ENServicesObject servicesObject, ENPlanWork plan , BigDecimal distance) throws PersistenceException
    {
        ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);
        // ���� �� � ������������ ��� ���� ���� �� ������ ��������� ���� � ��� ����������� � ������� ����������� ������������ �������� ������� �� � ������
        BigDecimal distTO = distance.divide(new BigDecimal(2), 3, BigDecimal.ROUND_HALF_UP);
        BigDecimal distFROM = distance.subtract(distTO).setScale(3, BigDecimal.ROUND_HALF_UP);
        ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter trFilter = new ENTransportItemFilter();
        int enTransportItemETL = 0;
        enTransportItemETL =     getETLabWithMaxMiddleSalaryByServiceContractCode(servicesObject.code , plan);


        ENDistanceFilter distFilter = new ENDistanceFilter();
        distFilter.conditionSQL = " ENDISTANCE.TRANSPORTITEMREFCODE in (  select ti.code from entransportitem ti "  +
                                    " where ti.planrefcode = " + plan.code  +  "   )";
        int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
        for (int j=0; j < distArr.length; j++){
            distDAO.remove(distArr[j]);
        }

        // ��������� ���� � ��� ���������� ������ ������ ��� ���� ��������
        if (enTransportItemETL != 0) {

            distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = enTransportItemETL;
            distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemETL;
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemETL;
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

        }

        // ���� ��� ��� ����� ��������� ������������� � ��������� ���� � � ������������ �� � ������ � ������� �����������

        if (enTransportItemETL == 0){
        int enTransportItemBrigade = 0;
            enTransportItemBrigade =     getAutoBrigadeWithMaxMiddleSalaryByServiceContractCode(servicesObject.code , plan);
            if (enTransportItemBrigade != 0) {

            distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = enTransportItemBrigade;
            distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemBrigade;
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemBrigade;
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

        }

        }

        // ��������� �������� ��� ��������� ������ �������� ��������� ���� �������������� �� ������������ ���������� � ������� � ��� ����� ��������� �����

            trDAO = new ENTransportItemDAO(connection, userProfile);
        trFilter = new ENTransportItemFilter();
        trFilter.conditionSQL = " ENTRANSPORTITEM.CODE in ( select min(ti.code) as entransportitemcode  from entransportitem ti   , tktransport t " +
                                    "    where ti.planrefcode = " + plan.code +
                                  " and ti.transportcode = t.code " +
                                  " and t.transporttypecode <>  1 " +
                                  " group by ti.transportcode  , t.name )";
        int[] trArr = trDAO.getFilteredCodeArray(trFilter, trFilter.conditionSQL, null, 0, -1, null);

        for (int i=0; i < trArr.length; i++){

            distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = trArr[i];
            distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

              }


    }

    public void createDistancesKlVl(ENServicesObject servicesObject, ENPlanWork plan , BigDecimal distance) throws PersistenceException
    {
    	this.createDistancesKlVl(servicesObject, plan, distance, false);
    }

    public void createDistancesKlVl(ENServicesObject servicesObject, ENPlanWork plan , BigDecimal distance, boolean isNeededMechanisation) throws PersistenceException
    {
        ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);
        // ���� �� � ������������ ��� ���� ���� �� ������ ��������� ���� � ��� ����������� � ������� ����������� ������������ �������� ������� �� � ������
        BigDecimal distTO = distance.divide(new BigDecimal(2), 3, BigDecimal.ROUND_HALF_UP);
        BigDecimal distFROM = distance.subtract(distTO).setScale(3, BigDecimal.ROUND_HALF_UP);
        ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter trFilter = new ENTransportItemFilter();


        ENDistanceFilter distFilter = new ENDistanceFilter();
        distFilter.conditionSQL = " ENDISTANCE.TRANSPORTITEMREFCODE in (  select ti.code from entransportitem ti "  +
                                    " where ti.planrefcode = " + plan.code  +  "   )";
        int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
        for (int j=0; j < distArr.length; j++){
            distDAO.remove(distArr[j]);
        }



        // ��������� ������������� � ��������� ���� � � ������������ �� � ������ � ������� �����������

        int enTransportItemBrigade = 0;
            enTransportItemBrigade =     getAutoBrigadeWithMaxMiddleSalaryByServiceContractCode(servicesObject.code , plan);
           if (enTransportItemBrigade != 0) {

            distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = enTransportItemBrigade;
            distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemBrigade;
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = enTransportItemBrigade;
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

        }

        Vector<Integer> tkTransportTypeCodesNotIncluded = new Vector<>();
        tkTransportTypeCodesNotIncluded.add(TKTransportType.BRIGADE);
        if(!isNeededMechanisation) {
            tkTransportTypeCodesNotIncluded.add(TKTransportType.MECHANIZM);
        }

        // ��������� �������� ��� ��������� ������ �������� ��������� ���� �������������� �� ������������ ���������� � ������� � ��� ����� ��������� �����
         //  NET-4215 - �� ��������� �������� �� ����� ���������� � ����� "������ ����������"
        trDAO = new ENTransportItemDAO(connection, userProfile);
        trFilter = new ENTransportItemFilter();

        trFilter.conditionSQL = String.format(" ENTRANSPORTITEM.CODE in ( select min(ti.code) as entransportitemcode  from entransportitem ti   , tktransport t " +
                                    "    where ti.planrefcode = " + plan.code +
                                 " and ti.transportcode = t.code " +
                                 " and t.transporttypecode not in (%s) " +
                                 " group by ti.transportcode  , t.name )", Tools.repeatSymbol("?", ",", tkTransportTypeCodesNotIncluded.size()));
        int[] trArr = trDAO.getFilteredCodeArray(trFilter, 0, -1, tkTransportTypeCodesNotIncluded);

        for (int i=0; i < trArr.length; i++){

            distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = trArr[i];
            distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }

            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

             }


    }

   /**
    * NET-4159
    * ����� ��� �������� ���������� ��������� � ������� (����������) ���
    * �������, � ������� ����������� �������� �������� ���������
    * @param servicesObjectCode - ��� �������� �� ������� �� ������� (ENServicesObject)
    *
    */
    public void checkGiveCounters(int servicesObjectCode) {
    	// SUPP-90074 ��-�� ����������� ����������� ����� ������� ��������
    	return;
    	/*
        try {
            ENPlanWork2ClassificationTypeDAO plan2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);

            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
            ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);
            ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

            ENPlanWork2ClassificationTypeFilter plan2clFilter = new ENPlanWork2ClassificationTypeFilter();
            plan2clFilter.planRef.code = plan.code;
            plan2clFilter.conditionSQL = " tkclassificationtype.code in (select t.code " +
                " from tkclassificationtype t where t.isgivecounter in (?, ?))";

            Vector<Object> bindedObjects = new Vector<Object>();
            bindedObjects.add(ENGiveCounter.IS_GIVE);
            bindedObjects.add(ENGiveCounter.IS_GIVE_TO_BALANCE);

            ENPlanWork2ClassificationTypeShortList plan2clList = plan2clDAO.getScrollableFilteredList(plan2clFilter, 0, -1, bindedObjects);
            if (plan2clList.totalCount > 0) {
                for (int i = 0; i < plan2clList.totalCount; i++) {

                    ENGiveCounterFilter cFilter = new ENGiveCounterFilter();
                    cFilter.servicesObjectRef.code = servicesObject.code;
                    cFilter.plan2ClTypeRef.code = plan2clList.get(i).code;

                    ENGiveCounterDAO giveDAO = new ENGiveCounterDAO(connection, userProfile);
                    int giveCounterArr[] = giveDAO.getFilteredCodeArray(cFilter, 0, -1);

                    if (giveCounterArr.length != plan2clList.get(i).countGen.intValue()) {

                        throw new SystemException("\n "
                                + "\n ʳ������ ��������� " + giveCounterArr.length + " �� ���������� "
                                + "\n �� ������� ������� ���� " + plan2clList.get(i).countGen.intValue() + "!!!"
                                + "\n ������������ - " + plan2clList.get(i).classificationTypeRefName);
                    }
                }
            }
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        }
        */
    }


    /**
     * NET-4235
     * ����� ��� ������� ��������� ���������� �������������� ���������� � ������� �� ������� �� ���� ����
     * @param actCode - ��� ���� ����������� �����
     * @return ��������� ���������� �������������� ����������, ���.
     */
    public BigDecimal getMaterialsCostByAct(int actCode) throws PersistenceException
    {
        String sql =
        		"select sum(cost) from (" +
        	//" select sum(cost) from ( " +
        	" Select coalesce(sum(finmat.cost), 0) as cost \n" +
            "   From \n" +
            "          enestimateitem estimate \n" +
            "        , finmaterials finmat \n" +
            "        , enact2enplanwork ena2 \n" +
            "        , enplanworkitem pwi \n" +
            "        , tktechcard tkd \n" +
            "        , tkclassificationtype tkcls \n" +
            " where \n" +
            " ena2.actrefcode = ? \n" +
            "   and ena2.plancode = estimate.planrefcode \n" +
            "   and finmat.estimateitemrefcode = estimate.code \n" +
            "   and finmat.statusrefcode = 1 \n" +
            "   and estimate.kindrefcode = 1 \n" +
            "   and finmat.cost <> 0 \n" +
            "   and pwi.planrefcode = ena2.plancode \n" +
            "   and pwi.kartarefcode = tkd.code \n" +
            "   and pwi.code = estimate.planitemrefcode \n" +
            //" --  and tkd.classificationtypecode = $P{calculationcode} \n" +
            "   /*���� costworkcontractor �� ������, ������ ������ ��������� - �� �������� � ��������� ���*/ \n" +
            "   and tkcls.code = tkd.classificationtypecode \n" +
            "   and (tkcls.costworkscontractor is null \n" +
            "   or tkcls.costworkscontractor = 0) " +

            "union all "+
            " "+
            "Select coalesce(sum(ss.cost),0) "+
            "  From "+
            "         enestimateitem estimate "+
            "       , scseal ss "+
            "       , enact2enplanwork ena2 "+
            "       , enplanworkitem pwi "+
            "       , tktechcard tkd "+
            "       , tkclassificationtype tkcls "+
            "where "+
            "ena2.actrefcode = ? "+
            "  and ena2.plancode = estimate.planrefcode "+
            "  and ss.estimateitemrefcode = estimate.code "+
            "  and ss.statusrefcode in (1,3) "+
            "  and estimate.kindrefcode = 1 "+
            "  and pwi.planrefcode = ena2.plancode "+
            "  and pwi.kartarefcode = tkd.code "+
            "  and pwi.code = estimate.planitemrefcode "+
            "  /*���� costworkcontractor �� ������, ������ ������ ��������� - �� �������� � ��������� ���*/ "+
            "  and tkcls.code = tkd.classificationtypecode "+
            "  and (tkcls.costworkscontractor is null "+
            "  or tkcls.costworkscontractor = 0)) as query";
;

        	/*
			" union all " +

			" select coalesce(sum(s.costold), 0) as cost " +
			"   from sccounter s, enestimateitem es, enact2enplanwork ena2 " +
            "  where s.estimateitemrefcode = es.code " +
            "    and es.countfact <> 0 " +
            "    and es.kindrefcode = " + ENEstimateItemKind.MATERIALS +
            "    and ena2.plancode = es.planrefcode " +
            "    and ena2.actrefcode = ?) s ";
            */


        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try
        {
            BigDecimal result = new BigDecimal(0);

            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);
            statement.setInt(2, actCode);
            // statement.setInt(2, actCode);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                result = resultSet.getBigDecimal(1);
                if (result == null)
                {
                    //throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������ �������� ��� ���� � ����� " + actCode);
                    result = new BigDecimal(0);
                }

                result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            result = result.add(getCostWithoutParametrization(actCode));

            result = result.setScale(2, BigDecimal.ROUND_HALF_UP);

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | materialsCost: " + result);
            ///

            return result;
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }

    }


    /**
     * ���������� ��������� �������� ��� ��������� ��������� ��������������
     *
     * SUPP-57045 �� ������� ��������� �������� ���� �� ����������� �� �������� (��������� �� ����� 1534)
     * SUPP-67287 �� ������� ��������� �������� ���� �� ����������� �� ��������
     * � ����� �� ��������� ��������� �������� (��������� �� ����� 1522)
     *
     * @param actCode - ��� ����
     */
    private BigDecimal getCostWithoutParametrization(int actCode) {
    	Connection scConn = null;
    	Connection netConn = null;
    	BigDecimal counterCost = new BigDecimal(0);
    	try {

			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			scConn = getConnection(AuthorizationJNDINames.SCANCOUNTERS_DATASOURCE);

			SCCounterDAO scDao = new SCCounterDAO(netConn, userProfile);
			SCCounterFilter scFilter = new SCCounterFilter();
			scFilter.conditionSQL = " sccounter.code in ( " +
					" select s.code " +
					"   from sccounter s, enestimateitem es, enact2enplanwork ena2 " +
		            "  where s.estimateitemrefcode = es.code " +
		            "    and es.countfact <> 0 " +
		            "    and es.kindrefcode = " + ENEstimateItemKind.MATERIALS +
		            "    and ena2.plancode = es.planrefcode " +
		            "    and ena2.actrefcode = " + actCode + ")";


			SCCounterShortList scList = scDao.getScrollableFilteredList(scFilter, 0, -1);

			com.ksoe.energynet.logic.SCLogic scLogic = new com.ksoe.energynet.logic.SCLogic(netConn, scConn, userProfile);

			for (SCCounterShort counter : scList.list) {
				 if (counter.invNumber != null && counter.account != null && !counter.invNumber.equals("") && !scLogic.isCustomerCounterAccount(counter.account)) {
					 scConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
					 SCCounterDAO finDao = new SCCounterDAO(scConn, userProfile);
					 counterCost = counterCost.add(finDao.getCostWithoutParametrization(counter.invNumber));
				 }
			}

			System.out.println("######### counterCost = " + counterCost);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (scConn != null && !scConn.isClosed()) {
					scConn.close();
					scConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
			}
		}
		return counterCost;
	}


	/**
     * NET-4235
     * ����� ��� ������� ��������� ����������� ������������ ������ � ������� �� ������� �� ���� ����
     * @param actCode - ��� ���� ����������� �����
     * @return ��������� ����������� ������������ ������, ���.
     */
    public BigDecimal getTransportCostByAct(int actCode) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0);

        BigDecimal fuelCost = new BigDecimal(0);
        BigDecimal salary = new BigDecimal(0);
        BigDecimal transportCost = new BigDecimal(0);

        ////////////////////////////////////////////////////////////////////////////////////////
        // 1 - ��������� ���
        String sql =
            "   Select coalesce(sum(finmat.cost), 0) as cost \n" +
            "   From \n" +
            "          enestimateitem estimate \n" +
            "        , finmaterials finmat \n" +
            "        , enact2enplanwork ena2 \n" +
            "        , enplanworkitem pwi \n" +
            "        , tktechcard tkd \n" +
            "        , tkclassificationtype tkcls \n" +
            "        , entransportitem transport \n" +
            "        , entransport2enestimate t2e \n" +
            " where \n" +
            " ena2.actrefcode = ? \n" +
            "   and ena2.plancode = estimate.planrefcode \n" +
            "   and finmat.estimateitemrefcode = estimate.code \n" +
            "   and finmat.statusrefcode = 1 \n" +
            "   and estimate.kindrefcode = 2 \n" +
            "   and finmat.cost <> 0 \n" +
            "   and pwi.planrefcode = ena2.plancode \n" +
            "   and pwi.kartarefcode = tkd.code \n" +
            "   and pwi.code = transport.planitemrefcode \n" +
            //"   --and tkd.classificationtypecode = $P{calculationcode} \n" +
            "   and transport.code = t2e.transportrefcode \n" +
            "   and t2e.estimaterefcode = estimate.code \n" +
            "   /*���� costworkcontractor �� ������, ������ ������ ��������� - �� �������� � ��������� ���*/ \n" +
            "   and tkcls.code = tkd.classificationtypecode \n" +
            "   and (tkcls.costworkscontractor is null \n" +
            "   or tkcls.costworkscontractor = 0)";

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try
        {
            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                fuelCost = resultSet.getBigDecimal(1);
                if (fuelCost == null)
                {
                    //throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������������ ������ (1) ��� ���� � ����� " + actCode);
                    fuelCost = new BigDecimal(0);
                }

                fuelCost = fuelCost.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | 1 - fuelCost: " + fuelCost);
            ///
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
        ////////////////////////////////////////////////////////////////////////////////////////


        ////////////////////////////////////////////////////////////////////////////////////////
        // 2 - �������� ��������� � ������ ���
        /*
        sql =
            " Select \n" +
            "     coalesce(cast(sum(p2h.paysworkbonus) as numeric), 0) as payswork  \n" +
            " from \n" +
            "     enact2enplanwork a2p, \n" +
            "     enplanwork pw, \n" +
            "     enplanworkitem pwi, \n" +
            "     enplanworkitem2humen p2h, \n" +
            "     tktechcard as tc, \n" +
            "   tkclassificationtype as tkcls \n" +
            " where  a2p.actrefcode = ? \n" +
            "    and a2p.plancode = pw.code \n" +
            "    and pw.code = pwi.planrefcode \n" +
            "    and pwi.countgen <> 0 \n" +
            "    and pwi.code = p2h.plaitemrefcode \n" +
            "    and tc.code = pwi.kartarefcode \n" +
            //"   -- and tc.classificationtypecode = $P{calculationcode} \n" +
            "    and (tkcls.costworkscontractor is null \n" +
            "    or tkcls.costworkscontractor = 0) \n" +
            "    and tkcls.code = tc.classificationtypecode \n" +
            "    and p2h.humenkindrefcode = " + ENHumenItemKind.DRIVER;
        */

        // 22.05.13 � ������ ���!!!
        sql =
            " select coalesce(sum(coalesce(paysworkbonus, 0) * (1 + chargepercent / 100)), 0)  \n" +
            " from   \n" +
            " ( \n" +
            " Select  \n" +
            "   (coalesce(p2h.paysworkbonus,0) + coalesce(p2h.paysworksurcharge,0) + coalesce(p2h.paysworkpremium,0) "
            + " + coalesce(p2h.paysworkadditional,0) )  as paysworkbonus,    \n" +
            "    \n" +
            "      (select fww.chargepercent from finworker fww  \n" +
            "           where fww.code in (  \n" +
            "                             select max(fw.code) from enact2enplanwork a2p1 , entransportitem ti , finworker fw  \n" +
            "                              where a2p1.actrefcode = a2p.actrefcode  \n" +
            "                                and cast(fw.tabnumber as varchar) =  p2h.tabnumber  \n" +
            "                                and a2p1.plancode = ti.planrefcode  \n" +
            "                                and ti.finworkercode = fw.code   \n" +
            "                             )  \n" +
            "          ) as chargepercent        \n" +
            " from  \n" +
            "   enact2enplanwork a2p,  \n" +
            "   enplanwork pw,  \n" +
            "   enplanworkitem pwi,  \n" +
            "   enplanworkitem2humen p2h,  \n" +
            "   tktechcard as tc,  \n" +
            "  tkclassificationtype as tkcls  \n" +
            " where  a2p.actrefcode = ?  \n" +
            "   and a2p.plancode = pw.code  \n" +
            "   and pw.code = pwi.planrefcode  \n" +
            "   and pwi.countgen <> 0  \n" +
            "   and pwi.code = p2h.plaitemrefcode  \n" +
            "   and tc.code = pwi.kartarefcode  \n" +
            "   and (tkcls.costworkscontractor is null  \n" +
            "   or tkcls.costworkscontractor = 0)  \n" +
            "   and tkcls.code = tc.classificationtypecode  \n" +
            "   and p2h.humenkindrefcode = 2 \n" +
            " ) q ";


        statement = null;
        resultSet = null;

        try
        {
            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                salary = resultSet.getBigDecimal(1);
                if (salary == null)
                {
                    //throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������������ ������ (2) ��� ���� � ����� " + actCode);
                    salary = new BigDecimal(0);
                }

                salary = salary.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | 2 - driverSalary: " + salary);
            ///
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
        ////////////////////////////////////////////////////////////////////////////////////////


        ////////////////////////////////////////////////////////////////////////////////////////
        // 3 - ������� �� ������������� ����������
        /*
        sql =
            " SELECT \n" +
            "   coalesce(sum(en2tr.payswork), 0) as transportcost \n" +
            " FROM \n" +
            "   enact2transport en2tr , entransportitem ti, enact2enplanwork a2pw, tktransportreal treal, \n" +
            "   enplanworkitem pwi \n" +
            "   where en2tr.actrefcode = ? \n" +
            //" --  and en2tr.classificationtyperfcd = $P{calculationcode}  \n" +
            "   and ti.planrefcode =  a2pw.plancode \n" +
            "   and a2pw.actrefcode = en2tr.actrefcode \n" +
            "   and en2tr.invnumber = treal.invnumber \n" +
            "   and treal.code = ti.transportrealcode \n" +
            "   and a2pw.plancode = pwi.planrefcode \n" +
            "   and ti.planitemrefcode = pwi.code";
        */

        sql =
            " SELECT  \n" +
            "   coalesce(sum(q.transportcost)) as transportcost  \n" +
            " FROM \n" +
            " ( \n" +
            "  SELECT en2tr.code, coalesce(en2tr.payswork, 0) as transportcost  \n" +
            "    FROM  \n" +
            "      enact2transport en2tr , entransportitem ti, enact2enplanwork a2pw, tktransportreal treal,  \n" +
            "      enplanworkitem pwi  \n" +
            "   WHERE  \n" +
            "      en2tr.actrefcode = ? \n" +
            "      and ti.planrefcode =  a2pw.plancode  \n" +
            "      and a2pw.actrefcode = en2tr.actrefcode  \n" +
            "      and en2tr.invnumber = treal.invnumber  \n" +
            "      and treal.code = ti.transportrealcode  \n" +
            "      and a2pw.plancode = pwi.planrefcode  \n" +
            "      and ti.planitemrefcode = pwi.code  \n" +
            "  GROUP BY en2tr.code \n" +
            "  ) q ";


        statement = null;
        resultSet = null;

        try
        {
            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                transportCost = resultSet.getBigDecimal(1);
                if (transportCost == null)
                {
                    //throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������������ ������ (3) ��� ���� � ����� " + actCode);
                    transportCost = new BigDecimal(0);
                }

                transportCost = transportCost.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | 3 - transportCost: " + transportCost);
            ///
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
        ////////////////////////////////////////////////////////////////////////////////////////

        result = fuelCost.add(salary).add(transportCost).setScale(2, BigDecimal.ROUND_HALF_UP);

        /// DEBUG
        System.out.println("ActCode = " + actCode + " | transportCost (total): " + result);
        ///

        return result;
    }


    /**
     * NET-4235
     * ����� ��� ������� ��������� ���������� ������������ � ������ (� ������ ���!) � ������� �� ������� �� ���� ����
     * @param actCode - ��� ���� ����������� �����
     * @return ��������� ���������� ������������ � ������ � ������ ���, ���.
     */
    public BigDecimal getDeliveryCostByAct(int actCode) throws PersistenceException
    {
        String sql =
            " select coalesce(sum(coalesce(costdelivery, 0) * (1 + chargepercent / 100)), 0) \n" +
            "   from  \n" +
            " ( \n" +
            " Select   \n" +
            "   p2h.costdelivery, \n" +
            "    \n" +
            "     (select fww.chargepercent from finworker fww \n" +
            "          where fww.code in ( \n" +
            "                            select max(fw.code) from enact2enplanwork a2p1 , enhumenitem hum , finworker fw \n" +
            "                             where a2p1.actrefcode = a2p.actrefcode \n" +
            "                               and cast(fw.tabnumber as varchar) =  p2h.tabnumber \n" +
            "                               and a2p1.plancode = hum.planrefcode \n" +
            "                               and hum.finworkercode = fw.code  \n" +
            "                            ) \n" +
            "         ) as chargepercent     \n" +
            " from  \n" +
            "   enact2enplanwork a2p,  \n" +
            "   enplanwork pw,  \n" +
            "   enplanworkitem pwi,  \n" +
            "   enplanworkitem2humen p2h,  \n" +
            "   tktechcard as tc,  \n" +
            "  tkclassificationtype as tkcls  \n" +
            " where  a2p.actrefcode = ? \n" +
            "   and a2p.plancode = pw.code  \n" +
            "   and pw.code = pwi.planrefcode  \n" +
            "   and pwi.countgen <> 0  \n" +
            "   and pwi.code = p2h.plaitemrefcode  \n" +
            "   and tc.code = pwi.kartarefcode  \n" +
            //" -- and tc.classificationtypecode = $P{calculationcode}  \n" +
            "   and (tkcls.costworkscontractor is null  \n" +
            "   or tkcls.costworkscontractor = 0)  \n" +
            "   and tkcls.code = tc.classificationtypecode  \n" +
            "   and p2h.humenkindrefcode = " + ENHumenItemKind.ELTEH +
            " ) q ";


        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try
        {
            BigDecimal result = new BigDecimal(0);

            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                result = resultSet.getBigDecimal(1);
                if (result == null)
                {
                    //throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������� ����������� ���������� � ����� ��� ���� � ����� " + actCode);
                    result = new BigDecimal(0);
                }

                result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | deliveryCost: " + result);
            ///

            return result;
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
    }


    /**
     * NET-4235
     * ����� ��� ��������� ��������������� ��������� �� �������� � ������� �� ������� �� ���� ��������
     * @param elementCode - ��� ��������
     * @return ��������������� ���������, ���.
     */
    public BigDecimal getCalculationCostByElementCode(int elementCode) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(elementCode);

        if (plan == null)
        {
            throw new SystemException("\n\nNET-4235 �� �������� ����-�������� ��� elementCode = " + elementCode);
        }

        String sql =
            " select coalesce(sum(ctc.calculationcost), 0) \n" +
            " from encalctotalcost ctc \n" +
            " where ctc.planrefcode = ?";

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try
        {
            BigDecimal result = new BigDecimal(0);

            statement = connection.prepareStatement(sql);

            statement.setInt(1, plan.code);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                result = resultSet.getBigDecimal(1);
                if (result == null)
                {
                    throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ������������� ������� ��� elementCode = " + elementCode);
                    //result = new BigDecimal(0);
                }

                result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ElementCode = " + elementCode + " | calculationCost: " + result);
            ///

            return result;
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
    }

    /**
     * NET-4235
     * ����� ��� ������� ����������� ������ �� ���� ��� ����� �� �������
     *
     * @param actCode - ��� ����
     * @param unsign - ����� �� �������� ���������� ���� �������������
     *                ( = true, ���� ��� ��� ��������� � ������ "�� ��������" ������������� � recalcServicesFactCalc)
     * @param isSignatured - �������� ��� �������� ���� � ������ "�� ��������"
     */
	public void recalcServicesFactCalcByAct(int actCode, boolean unsign,
			boolean isSignatured) throws PersistenceException {

        ENActDAO actDAO = new ENActDAO(connection, userProfile);
        ENAct act = actDAO.getObject(actCode);


        if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT)
        {
            throw new SystemException("\n\nNET-4235 ��� �� � ����� ��������� ���� �� �������� �� �������! ��� ����: " + actCode);
        }


        /** ��� ����� �� ���������� ���������� ���� ��������� ��� ������������ ��
         *  ��� ����������� ���� ������� ������ ������
         */
        boolean deleteUsageInput = true;

        ENAct2SCUsageInputDAO act2ozDao = new ENAct2SCUsageInputDAO(userProfile, connection);
		ENAct2SCUsageInputFilter act2ozFilter = new ENAct2SCUsageInputFilter();
		act2ozFilter.actRef.code = actCode;

		int act2ozArr[] = act2ozDao.getFilteredCodeArray(act2ozFilter, 0, -1);
		if (act2ozArr.length > 0) {
			deleteUsageInput = false;
		}


        ENServicesObject servicesObject = getServicesObjectByElementCode(act.element.code);
        ENServicesFactCalcByActDAO factCalcByActDAO = new ENServicesFactCalcByActDAO(connection, userProfile);

        ENServicesFactCalcByAct factCalcByAct = new ENServicesFactCalcByAct();
        double contractServicesDistance = 0;

        // ������� ������ ������
        if (act.statusRef.code != ENActStatus.CLOSED) {
            ENServicesFactCalcByActFilter factCalcByActFilter = new ENServicesFactCalcByActFilter();
            factCalcByActFilter.actRef.code = actCode;
            int[] factCalcByActArr = factCalcByActDAO.getFilteredCodeArray(factCalcByActFilter, 0, -1);
            for (int i = 0; i < factCalcByActArr.length; i++)
            {
                factCalcByActDAO.remove(factCalcByActArr[i]);
            }

            // ������� ����� ������
            factCalcByAct.actRef.code = actCode;
            factCalcByAct.servicesObjectRef.code = servicesObject.code;

            factCalcByAct.materialsCost = getMaterialsCostByAct(actCode);
            factCalcByAct.transportCost = getTransportCostByAct(actCode);

        } else {

            factCalcByAct.deliveryCost = getDeliveryCostByAct(act.code);

            if (servicesObject.contractServicesDistance != null) {
                contractServicesDistance = servicesObject.contractServicesDistance.doubleValue();
            }

            if (factCalcByAct.deliveryCost.doubleValue() == 0 && contractServicesDistance > 0) {
                throw new SystemException("\n\nNET-4235 ��������� ������������ ��� �������� ���������, ���� �� " +
                        "���������� ��� ��� ����� ��'���� ��� ����������! " +
                        "�������� �������� ��� � ������ \"��������\"!" +
                        "\n��� ����: " + act.code);
            }

            // ???!!! return;
        }


        /**  ��� ������ ������� "������ ���������" - ��������� ������ ����������� ������ � �������� ��� ����� ���� ��������� � ����...  */
        if (act.statusRef.code == ENActStatus.SIGNATURE
        		&& factCalcByAct.deliveryCost != null) {

            // ������� ����� ������
            factCalcByAct.actRef.code = actCode;
            factCalcByAct.servicesObjectRef.code = servicesObject.code;

            factCalcByAct.materialsCost = getMaterialsCostByAct(actCode);
            factCalcByAct.transportCost = getTransportCostByAct(actCode);

        } else {

        	///////////////////////////////////////////////////////////////////////////
            // 22.05.13 �������� �.�. ���� ������������ ������� �������, �� �� �������� ���� ����������,
            // ������������� ����� ��������, ������ �� ���������� �� �������� � ������� �������� 30 ��/�

    		if (servicesObject.contractServicesDistance != null) {
    			contractServicesDistance = servicesObject.contractServicesDistance.doubleValue();
    		}

    		double transportCost = 0;
    		if (factCalcByAct.transportCost != null) {
    			transportCost = factCalcByAct.transportCost.doubleValue();
    		}

            if (transportCost == 0 && contractServicesDistance > 0)
            {
                ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
                TransportLogic transportLogic = new TransportLogic(connection, userProfile);
                HumenLogic humenLogic = new HumenLogic(connection, userProfile);

                try
                {
                    Context cnt = new InitialContext();
                    Object objRef = cnt.lookup(ENActController.JNDI_NAME);
                    ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
                    ENActController actController = actHome.create();

                    if (act.statusRef.code == ENActStatus.CLOSED)
                    {
                        throw new SystemException("\n\nNET-4235 ��������� ������������ ��� �������� ���������, ���� �� " +
                                "���������� ��� ��� ����� ��'���� ��� ����������! " +
                                "�������� �������� ��� � ������ \"��������\"!" +
                                "\n��� ����: " + act.code);
                    }

                    if (act.statusRef.code == ENActStatus.SIGNATURE)
                    {
                        // ���� ��� �� ����������, �������� ����������
                        // (�� ������ � ��� ������, ���� ��� ��� �������� ������������� ���� �� � recalcServicesFactCalc)
                        if (unsign)
                        {
                        	// ����� ������� ���������� ���� �������� �����������
                        	ActLogic actLogic = new ActLogic(connection, userProfile);
                        	DFDocSigner[] dfDocSigners = actLogic.getDFDocSigners(act);

                            // �������� ����������
                        	actController.unSignatured(act.code, deleteUsageInput);
                        	// ���������� ���
                        	act = actDAO.getObject(act.code);

                        	// ���� �� ���� ���� ����������, ������ �� ������� � ������������ ���
                        	if (dfDocSigners != null && dfDocSigners.length > 0) {
                        		actController.saveDFDocSigners(act, dfDocSigners);
                        		// ���������� ���, ����� ���-������ ����� �� �������� Optimistic locking
                        		act = actDAO.getObject(act.code);
                        	}
                        }
                        else
                        {
                            throw new SystemException("\n\nNET-4235 ��������� ������������ ��� �������� ���������, ���� �� " +
                                    "���������� ��� ��� ����� ��'���� ����������� �� ��������! " +
                                    "�������� �������� ��� � ������ \"��������\"!" +
                                    "\n��� ����: " + act.code);
                        }
                    }
                    else if (act.statusRef.code != ENActStatus.GOOD)
                    {
                        throw new SystemException("\n\nNET-4235 ������������� ������ ���� (" + act.statusRef.code + ")! ��� ����: " + act.code);
                    }


                    ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
                    planFilter.elementRef.code = servicesObject.element.code;
                    planFilter.kind.code = ENPlanWorkKind.FACT;
                    planFilter.conditionSQL = "code in (select ap.plancode from enact2enplanwork ap where ap.actrefcode = " + actCode + ")";
                    int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

                    for (int i = 0; i < planArr.length; i++)
                    {
                        transportLogic.createDeliveryTimeForPlan(planArr[i], true);
                        humenLogic.createDeliveryTime(planArr[i]);
                    }

                    //if (act.statusRef.code == ENActStatus.GOOD)
                    //{
                        // ������������� ��� � ��������� ��� � ������ "�� ����������"                    	
                        actController.fillActData(act.code, isSignatured);
                    //}
                }
                catch (NamingException e) {throw new SystemException(e.getMessage(),e);}
                catch (RemoteException e) {throw new SystemException(e.getMessage(),e);}
                catch (CreateException e) {throw new SystemException(e.getMessage(),e);} 
            }

            ///////////////////////////////////////////////////////////////////////////

        }


        factCalcByAct.deliveryCost = getDeliveryCostByAct(actCode);

        factCalcByActDAO.add(factCalcByAct);
    }


    /**
     * NET-4235
     * ����� ��� ������� ����������� ������ �� �������� �� ������� �� �������
     *
     * @param servicesObject - ������� �� ������� �� ������� (������)
     * @param forceRecalcServicesFact - �������� ��� ������� ����������� ������ ��� ����������� ����
     * @param notFinishWorks - �������� ��� ��������� ������� ��������
     *
     * @return ����� �� �������� ��� ���
     */
	public BigDecimal recalcServicesFactCalc(ENServicesObject servicesObject,
			boolean forcedRecalcServicesFact, boolean notFinishWorks) throws PersistenceException {

		ENActDAO actDAO = new ENActDAO(connection, userProfile);
		TKClassificationTypeDAO classificationDao = new TKClassificationTypeDAO(connection, userProfile);

		ENActFilter actFilter = new ENActFilter();
		actFilter.element.code = servicesObject.element.code;
		// actFilter.orderBySQL = "dategen desc";

		int[] actArr = actDAO.getFilteredCodeArray(actFilter,
				actFilter.conditionSQL, actFilter.orderBySQL, 0, -1, null);

		if (actArr.length == 0) {
			throw new SystemException(
					"\n\nNET-4235 �� �������� ���������� ��� ��� ��'����! ��� ��'����: "
							+ servicesObject.code);
		}


		try {
			Context cnt = new InitialContext();
			Object objRef = cnt.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
			ENActController actController = actHome.create();

			boolean unsign = false;

			/** �������� ��� �������� ���� � ������ "�� �������" */
			boolean isSignatured = true;
			if (notFinishWorks) {
				isSignatured = false;
			}

			//////////
			// 19.07.2018 ��� ��������� � �������� �� ��������� ������ �� �������������, ������ ������ ������� �����
			if (servicesObject.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT) {

				// ��������� �������� ���� � ������ "�� ����������"
				for (int i = 0; i < actArr.length; i++) {
					ENAct act = actDAO.getObject(actArr[i]);

					if (act == null) {
						throw new SystemException(
								"\n\nNET-4235 �� �������� ���������� ��� ��� ��'����! ��� ��'����: "
										+ servicesObject.code);
					}

					if (act.statusRef.code == ENActStatus.GOOD) {
						// ���� ��� ��� �� �� ����������, ������������� ��� � ��������� �� ���������� (������������� ����������� ����� ���������)
	                    actController.fillActData(act.code, isSignatured);
						unsign = true;
					}
				}

				return servicesObject.contractServicesSumma;
			}
			//////////

			for (int i = 0; i < actArr.length; i++) {
				ENAct act = actDAO.getObject(actArr[i]);

				if (!forcedRecalcServicesFact) {
					if (act == null) {
						throw new SystemException(
								"\n\nNET-4235 �� �������� ���������� ��� ��� ��'����! ��� ��'����: "
										+ servicesObject.code);
					}

					if (act.statusRef.code == ENActStatus.GOOD) {
						// ���� ��� ��� �� �� ����������, ������������� ��� � ��������� �� ���������� (������������� ����������� ����� ���������)
	                    actController.fillActData(act.code, isSignatured);
						unsign = true;

					} else if (act.statusRef.code == ENActStatus.SIGNATURE) {
						unsign = true;

					} else {
						///// 17.06.13 ���� �� ����� ������������� ���, ���� �� ��� ��������
	                    // ���� ��� �� ����������, ������� �������� ����������, � ����� ������������� ���
	                    // actController.unSignatured(act.code);
	                    // actController.fillActData(act.code);
	                    /////
	                    unsign = false;
	                }

					/**  28.03.2018... +++ ���� ��� ��������, ��� ���� ��� ������ ���� ������ ����������� ������.... */
					if (act.statusRef.code == ENActStatus.CLOSED) {
						recalcServicesOnlyFactCalcByAct(act.code);
					} else {
						// �������� ������ ����������� ������ �� ����
						recalcServicesFactCalcByAct(act.code, unsign, isSignatured);
					}

				} else {
					recalcServicesOnlyFactCalcByAct(act.code);
				}
			}

		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}



        ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);

        ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
        factCalcFilter.servicesObjectRef.code = servicesObject.code;
        int[] factCalcArr = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);

          if (factCalcArr.length == 0)
          {
              throw new SystemException("\n\nNET-4235 �� �������� ��������� ���������� �������! (��� ��������: " + servicesObject.code + ")");
          }

          if (factCalcArr.length > 1)
          {
              throw new SystemException("\n\nNET-4235 ��������� ���������� ������� ����� ������! (��� ��������: " + servicesObject.code + ")");
          }

        /*
        // ������� ������ ������
        for (int i = 0; i < factCalcArr.length; i++)
        {
            factCalcDAO.remove(factCalcArr[i]);
        }
        */

        // ENServicesFactCalc factCalc = new ENServicesFactCalc();
          // factCalc.servicesObjectRef.code = servicesObject.code;

          ENServicesFactCalc factCalc = factCalcDAO.getObject(factCalcArr[0]);

        factCalc.materialsCost = new BigDecimal(0);
        factCalc.transportCost = new BigDecimal(0);
        factCalc.deliveryCost  = new BigDecimal(0);

        List<TKClassificationType> classifications = classificationDao.getClassificationListByServicesObjectCode(servicesObject.code, null);
        HashSet<Integer> classificationCalculationMethods = new HashSet<>();
        for(TKClassificationType classification : classifications) {
        	TKClassificationTypeParamsOnDate params = classificationDao.getLastParamsOnDate(servicesObject.contractDateServices, classification);
        	if(params != null && params.calcKindRef.code != Integer.MIN_VALUE) {
        		classificationCalculationMethods.add(params.calcKindRef.code);
        	} else {
        		classificationCalculationMethods.add(null);
        	}
        }

        // SUPP-90336 ���� ���� ������� ������ ���� �������� �������, ������� ��������� ����� ��� ����� ���������� � ����������
        // ����� � ���������� ������ �� ����� ���������� ��������� � ���������
        boolean isCalcWithoutTransportAndMaterials = (classificationCalculationMethods.size() == 1
        		&& classificationCalculationMethods.contains(TKCalcKind.NEW));


        ENServicesFactCalcByActDAO factCalcByActDAO = new ENServicesFactCalcByActDAO(connection, userProfile);


        if(!isCalcWithoutTransportAndMaterials) {
            ENServicesFactCalcByActFilter factCalcByActFilter = new ENServicesFactCalcByActFilter();
            factCalcByActFilter.servicesObjectRef.code = servicesObject.code;
            ENServicesFactCalcByActShortList factCalcByActList = factCalcByActDAO.getScrollableFilteredList(factCalcByActFilter, 0, -1);
            for (int i = 0; i < factCalcByActList.totalCount; i++)
            {
                factCalc.materialsCost = factCalc.materialsCost.add(factCalcByActList.get(i).materialsCost); // setScale ???
                factCalc.transportCost = factCalc.transportCost.add(factCalcByActList.get(i).transportCost); // setScale ???
                factCalc.deliveryCost  = factCalc.deliveryCost.add(factCalcByActList.get(i).deliveryCost); // setScale ???
            }
        }


        factCalc.materialsCost = factCalc.materialsCost.setScale(2, BigDecimal.ROUND_HALF_UP);
        factCalc.transportCost = factCalc.transportCost.setScale(2, BigDecimal.ROUND_HALF_UP);
        factCalc.deliveryCost  = factCalc.deliveryCost.setScale(2, BigDecimal.ROUND_HALF_UP);

        factCalc.calcCost = getCalculationCostByElementCode(servicesObject.element.code);

        factCalc.sumGen = factCalc.calcCost.add(factCalc.materialsCost).add(factCalc.transportCost).add(factCalc.deliveryCost);
        factCalc.sumGen = factCalc.sumGen.setScale(2, BigDecimal.ROUND_HALF_UP);

        factCalc.vatSum = factCalc.sumGen.multiply(ENConsts.VAT_PERCENT).setScale(2, BigDecimal.ROUND_HALF_UP);

        factCalc.totalSum = factCalc.sumGen.add(factCalc.vatSum);
        factCalc.totalSum = factCalc.totalSum.setScale(2, BigDecimal.ROUND_HALF_UP);

        ///// ������������ ���������� � ������ �����
        ///// SUPP-4100 ��������� �� ����� factCalc.totalSumPrepay(��� �������� ���������� ���������� ����� ������� ������ �������� ��������  )
        ///// � ����� ����� � ����� ���������� ������� ���������� ������ ��������  ������� ����������� ������ �� ��������
        ENPayment2SODAO paymentDAO = new ENPayment2SODAO(connection, userProfile);
        ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
        paymentFilter.servicesObjectRef.code = servicesObject.code;
        paymentFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;

        BigDecimal paymentFactWithNds = new BigDecimal(0);

        int[] paymentArr = paymentDAO.getFilteredCodeArray(paymentFilter, 0, -1);

        for (int i = 0; i < paymentArr.length; i++) {
            ENPayment2SO paymentObj = paymentDAO.getObject(paymentArr[i]);
            if (paymentObj.sumTotal != null) {
                paymentFactWithNds = paymentFactWithNds.add(paymentObj.sumTotal);
            }
        }


          if (factCalc.totalSum.doubleValue() > paymentFactWithNds.doubleValue() /*  SUPP-4100 factCalc.totalSumPrepay.doubleValue()*/ )
          {
            factCalc.totalSumRest = factCalc.totalSum.subtract(paymentFactWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);
            factCalc.sumRest = factCalc.totalSumRest.divide(new BigDecimal(1 + ENConsts.VAT_PERCENT.doubleValue()), 2, BigDecimal.ROUND_HALF_UP);
            factCalc.vatSumRest = factCalc.totalSumRest.subtract(factCalc.sumRest).setScale(2, BigDecimal.ROUND_HALF_UP);
          }
          else
          {
            factCalc.totalSumRest = new BigDecimal(0);
            factCalc.sumRest = new BigDecimal(0);
            factCalc.vatSumRest = new BigDecimal(0);
          }
        /////

          // ��������� ��� ������������� ������
            factCalcDAO.save(factCalc);

        /// DEBUG
        System.out.println("ServicesObject = " + servicesObject.code + " | sumGen: " + factCalc.sumGen);
        System.out.println("ServicesObject = " + servicesObject.code + " | vatSum: " + factCalc.vatSum);
        System.out.println("ServicesObject = " + servicesObject.code + " | totalSum: " + factCalc.totalSum);

        System.out.println("ServicesObject = " + servicesObject.code + " | sumRest: " + factCalc.sumRest);
        System.out.println("ServicesObject = " + servicesObject.code + " | vatSumRest: " + factCalc.vatSumRest);
        System.out.println("ServicesObject = " + servicesObject.code + " | totalSumRest: " + factCalc.totalSumRest);
        ///

        return factCalc.sumGen;
    }


    /**
     * NET-4235
     * ����� ��� ������� ���� ��� ��������������� ������ �� ������� �� �������
     * @param servicesObject - ������� �� ������� �� ������� (������)
     */
    public void calcForPrepayment(ENServicesObject servicesObject) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

        if (plan == null)
        {
            throw new SystemException("\n\nNET-4235 �� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
        }

        if (plan.code == Integer.MIN_VALUE)
        {
            throw new SystemException("\n\nNET-4235 �� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
        }

        ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(connection, userProfile);

        ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
        calcFilter.planRef.code = plan.code;
        ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

          if (calcList.totalCount == 0)
          {
            throw new SystemException("\n\nNET-4235 �� �������� ���������� �� ���������� ��� ��������! ��� ��������: " + servicesObject.code);
          }

          if (calcList.totalCount > 1)
          {
            throw new SystemException("\n\nNET-4235 �������� ������� ���������� �� ���������� ��� ��������! ��� ��������: " + servicesObject.code);
          }

          ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);

        ENServicesFactCalc factCalc = new ENServicesFactCalc();
          factCalc.servicesObjectRef.code = servicesObject.code;

          factCalc.sumCalc = calcList.get(0).costWithoutVAT;
          factCalc.vatSumCalc = calcList.get(0).costVAT;
          factCalc.totalSumCalc = calcList.get(0).totalCost;

        /// DEBUG
        System.out.println("ServicesObject = " + servicesObject.code + " | sumCalc: " + factCalc.sumCalc);
        System.out.println("ServicesObject = " + servicesObject.code + " | vatSumCalc: " + factCalc.vatSumCalc);
        System.out.println("ServicesObject = " + servicesObject.code + " | totalSumCalc: " + factCalc.totalSumCalc);
        ///

          ///// ������������ ����� ��������������� ������ (��� ����������� - 0)
          if (servicesObject.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET)
          {
            factCalc.percentPrepay = ENConsts.SERVICES_PREPAYMENT_PERCENT;
            factCalc.totalSumPrepay = factCalc.totalSumCalc.multiply(factCalc.percentPrepay.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP);
            factCalc.sumPrepay = factCalc.totalSumPrepay.divide(new BigDecimal(1 + ENConsts.VAT_PERCENT.doubleValue()), 2, BigDecimal.ROUND_HALF_UP);
            factCalc.vatSumPrepay = factCalc.totalSumPrepay.subtract(factCalc.sumPrepay).setScale(2, BigDecimal.ROUND_HALF_UP);
          }
          else
          {
            factCalc.percentPrepay = new BigDecimal(0);
            factCalc.totalSumPrepay = new BigDecimal(0);
            factCalc.sumPrepay = new BigDecimal(0);
            factCalc.vatSumPrepay = new BigDecimal(0);
          }
          /////

        /// DEBUG
        System.out.println("ServicesObject = " + servicesObject.code + " | percentPrepay: " + factCalc.percentPrepay);
        System.out.println("ServicesObject = " + servicesObject.code + " | sumPrepay: " + factCalc.sumPrepay);
        System.out.println("ServicesObject = " + servicesObject.code + " | vatSumPrepay: " + factCalc.vatSumPrepay);
        System.out.println("ServicesObject = " + servicesObject.code + " | totalSumPrepay: " + factCalc.totalSumPrepay);
        ///

          factCalcDAO.add(factCalc);
    }

    /**
        * NET-4235
        * ����� ��� ������� ���� ��� ��������������� ������ �� ������� �� �������
        * @param servicesObject - ������� �� ������� �� ������� (������)
        */
    /** 28 ��� 2013 ������ ��� ����� �� ����������� (��� ������������� ������ ����� ) ������� 100 % ����� � ������
    * ������������ �������, ������� �� ��������� � �������� ���������� � ����� �� ��� 70 % ����������  **/
    /* SUPP-4444 100% ����� ����� ���� � �� ���������  */
        public void calcForPrepayment2(ENServicesObject servicesObject) throws PersistenceException
        {
            ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

            if (plan == null)
            {
                throw new SystemException("\n\nNET-4235 �� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
            }

            if (plan.code == Integer.MIN_VALUE)
            {
                throw new SystemException("\n\nNET-4235 �� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
            }

            ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(connection, userProfile);

            ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
            calcFilter.planRef.code = plan.code;
            ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

            if (calcList.totalCount == 0)
            {
                throw new SystemException("\n\nNET-4235 �� �������� ���������� �� ���������� ��� ��������! ��� ��������: " + servicesObject.code);
            }

            if (calcList.totalCount > 1)
            {
                throw new SystemException("\n\nNET-4235 �������� ������� ���������� �� ���������� ��� ��������! ��� ��������: " + servicesObject.code);
            }

            ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);
            ENCalcTotalCostDAO calcTotalCostDAO = new ENCalcTotalCostDAO(connection, userProfile);
            ENCalcTotalCostFilter calcTotalCostFilter = new ENCalcTotalCostFilter();
            calcTotalCostFilter.planRef.code = plan.code;

            BigDecimal calculationcost = new BigDecimal(0);
            BigDecimal materialexpenses = new BigDecimal(0);
            BigDecimal transportexpenses = new BigDecimal(0);
            BigDecimal deliverycost = new BigDecimal(0);


            // �� ���� ������������ � �������� ��������� ����� �������� ��������������� ��������� ������ , ������������ ������� ������ , ������� �� ������������� ���������� ������ , �������� ������
            ENCalcTotalCostShortList calcTotalCostList = calcTotalCostDAO.getScrollableFilteredList(calcTotalCostFilter, 0, -1);
            for (int i = 0; i < calcTotalCostList.totalCount; i++)
              {
                calculationcost = calculationcost.add(calcTotalCostList.get(i).calculationCost);
                materialexpenses = materialexpenses.add(calcTotalCostList.get(i).materialExpenses);
                transportexpenses = transportexpenses.add(calcTotalCostList.get(i).transportExpenses);
                deliverycost = deliverycost.add(calcTotalCostList.get(i).deliveryCost);


              }
            calculationcost = calculationcost.setScale(2, BigDecimal.ROUND_HALF_UP);
            materialexpenses = materialexpenses.setScale(2, BigDecimal.ROUND_HALF_UP);
            transportexpenses = transportexpenses.setScale(2, BigDecimal.ROUND_HALF_UP);
            deliverycost = deliverycost.setScale(2, BigDecimal.ROUND_HALF_UP);

            ENServicesFactCalc factCalc = new ENServicesFactCalc();
            factCalc.servicesObjectRef.code = servicesObject.code;

            factCalc.sumCalc = calcList.get(0).costWithoutVAT;
            factCalc.vatSumCalc = calcList.get(0).costVAT;
            factCalc.totalSumCalc = calcList.get(0).totalCost;

            /// DEBUG
            System.out.println("ServicesObject = " + servicesObject.code + " | sumCalc: " + factCalc.sumCalc);
            System.out.println("ServicesObject = " + servicesObject.code + " | vatSumCalc: " + factCalc.vatSumCalc);
            System.out.println("ServicesObject = " + servicesObject.code + " | totalSumCalc: " + factCalc.totalSumCalc);
            ///

            ///// ������������ ����� ��������������� ������ (��� ����������� - 0)
            if (servicesObject.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET)
            {
                factCalc.percentPrepay = ENConsts.SERVICES_PREPAYMENT_PERCENT;
                // factCalc.totalSumPrepay = factCalc.totalSumCalc.multiply(factCalc.percentPrepay.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP);
                // factCalc.sumPrepay = factCalc.totalSumPrepay.divide(new BigDecimal(1 + ENConsts.VAT_PERCENT.doubleValue()), 2, BigDecimal.ROUND_HALF_UP);
                // factCalc.vatSumPrepay = factCalc.totalSumPrepay.subtract(factCalc.sumPrepay).setScale(2, BigDecimal.ROUND_HALF_UP);
                //
                factCalc.sumPrepay = (((transportexpenses).add(deliverycost)).multiply(factCalc.percentPrepay.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP))).add(calculationcost).add(materialexpenses).setScale(2, BigDecimal.ROUND_HALF_UP);
                factCalc.vatSumPrepay = factCalc.sumPrepay.multiply(ENConsts.VAT_PERCENT).setScale(2, BigDecimal.ROUND_HALF_UP);
                factCalc.totalSumPrepay = factCalc.vatSumPrepay.add(factCalc.sumPrepay).setScale(2, BigDecimal.ROUND_HALF_UP);
            }
            else
            {
                factCalc.percentPrepay = new BigDecimal(0);
                factCalc.totalSumPrepay = new BigDecimal(0);
                factCalc.sumPrepay = new BigDecimal(0);
                factCalc.vatSumPrepay = new BigDecimal(0);
            }
            /////

            /// DEBUG
            System.out.println("ServicesObject = " + servicesObject.code + " | percentPrepay: " + factCalc.percentPrepay);
            System.out.println("ServicesObject = " + servicesObject.code + " | sumPrepay: " + factCalc.sumPrepay);
            System.out.println("ServicesObject = " + servicesObject.code + " | vatSumPrepay: " + factCalc.vatSumPrepay);
            System.out.println("ServicesObject = " + servicesObject.code + " | totalSumPrepay: " + factCalc.totalSumPrepay);
            ///

            factCalcDAO.add(factCalc);
        }

        /*���������� �������� ��������� ������� �� �������� � �� ���� ������� */
        public ENPayment2SOShortList getSumPrepayByServicesObject(int servicesobjectcode  , String paymenttypecode )
            {
            ENPayment2SOShortList result = new ENPayment2SOShortList();

                String sql =
                    " select  sum(p.sumgen) , sum(p.sumvat) , sum(p.sumtotal) from enpayment2so p " +
                    " where p.servicesobjectrefcode = " + servicesobjectcode +
                    " and p.paymenttyperefcode in ( " + paymenttypecode + ")";

                PreparedStatement statement = null ;
                ResultSet set = null ;
                try
                {
                    statement = connection.prepareStatement(sql);

                    set = statement.executeQuery();

                    while ( set.next() )
                    {
                        ENPayment2SOShort obj = new ENPayment2SOShort();

                        obj.sumGen = set.getBigDecimal(1);
                        obj.sumVat = set.getBigDecimal(2);
                        obj.sumTotal = set.getBigDecimal(3);


                        result.list.add(obj);
                        result.totalCount++;
                    }

                    return result;
                }
                catch(SQLException e)
                {
                    System.out.println(e.getMessage()+"\nstatement - " + sql);
                    throw new SystemException(e);
                }
                finally
                {
                try {if (set != null) set.close();}             catch (SQLException e) {}
                try {if (statement != null) statement.close();} catch (SQLException e) {}
                statement = null;
                }
            }

        /* �������� ��� �� � �������� ��� ����������� ���� ��� ������ ��� ������ ��� ������ � ������� - ���� iswithoutprecost */
        public void checkClassificationTypePreCost(ENPlanWork2ClassificationType object) throws PersistenceException
            {

                TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
                TKClassificationTypeShort ctObjShort = ctDAO.getShortObject(object.classificationTypeRef.code);

                ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
                ENPlanWork2ClassificationTypeFilter p2clFilter = new ENPlanWork2ClassificationTypeFilter();
                p2clFilter.planRef.code = object.planRef.code;
                int[] p2clArr = p2clDAO.getFilteredCodeArray(p2clFilter, 0, -1);

                // ��������� ���� ��� ���� ��� ��� �� �������
                if (p2clArr.length > 0 && object.planRef.code != Integer.MIN_VALUE) {
                // ��������� ���� �� � ������ ����� � ����������� ����� ����������� � ������� ������ �������� ���� iswithoutprecost(� ��������������� ��������� ��� ���)
                    // �� ��������� �� ��������� ����� ���� �� ����������� ������� ������ �����������
                    p2clFilter.planRef.code = object.planRef.code;
                    if (ctObjShort.isWithoutPreCost == Integer.MIN_VALUE ) {
                    p2clFilter.conditionSQL = " TKCLASSIFICATIONTYPE.iswithoutprecost = 1  ";}
                    if (ctObjShort.isWithoutPreCost == 0 ) {
                        p2clFilter.conditionSQL = " TKCLASSIFICATIONTYPE.iswithoutprecost = 1  ";}
                    if (ctObjShort.isWithoutPreCost == 1 ) {
                        p2clFilter.conditionSQL = " ( (TKCLASSIFICATIONTYPE.iswithoutprecost = 0) or (TKCLASSIFICATIONTYPE.iswithoutprecost is null) ) ";}
                    ENPlanWork2ClassificationTypeShortList p2clShort = p2clDAO.getScrollableFilteredList(p2clFilter, 0, -1);
                    if (p2clShort.totalCount > 0){
                        throw new SystemException("\n\n �������� \"����������� ��� ��������������� �����\" �� ���������� � ������������ �� �� ��������, �� �� ��� ������ � �������!!!");
                    }

                }

            }



   /** SUPP-4515 ����� 3.1 - ��������� true ���� ���� � �������� ����� 0 �� � ��� ���� � ��������� ������������� ������������� ���������� � ����� ����� "������ ������� �� �� ������" */
   /** 3.1. ������ ��������� ������  ��� �������� �������� � ���������, ������� ��� 0 ��, ���� � ������� � ����-� ���� ������:
    *   ��� ������������ ������ - � ��������
    *   ��� ���� (������) - � �������� � ��������� ������� ���. ������ � ����� ����� � ���. ������.
    */
	public boolean checkNeedInputKilometers(int planCode)
			throws PersistenceException, DatasourceConnectException {

		Connection connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

		boolean result = false;
		BigDecimal distance = new BigDecimal(0);

		String sql =
                /** SUPP-5518... 24.07.2013 +++ �� ��������� - �� ������ �� ����� ������.... */
                // " select coalesce(qqq.distance,0) from ( " +
            	/*
                " select sum(coalesce(qqq.distance,0)) from ( " +
                " Select tkd.middlesallaryway  " +
                " , sum(coalesce(dist.distance,0)) as distance " +
                " from enplanworkitem pi  , tktechcard tkd  , entransportitem ti  left join endistance dist on ti.code = dist.transportitemrefcode " +
                " where pi.planrefcode = " + planCode +
                " and pi.kartarefcode = tkd.code " +
                " and pi.code = ti.planitemrefcode " +
                " and COALESCE( tkd.middlesallaryway,0) <> 0  " +
            " Group by tkd.middlesallaryway " +
            " ) as qqq "; */

            //" where coalesce(qqq.distance,0) = 0" ;

            		" select qq.distance from ( " +
            		"		Select sum(coalesce(tkd.middlesallaryway,0)) as middlesallaryway, " +

            		"		(select sum(coalesce(dist.distance,0)) as distance " +
            		"		from enplanworkitem pi, tktechcard tkd, entransportitem ti " +
            		"			left join endistance dist on ti.code = dist.transportitemrefcode " +
            		"		where pi.planrefcode = " + planCode +
            		"		and pi.kartarefcode = tkd.code " +
            		"		and pi.code = ti.planitemrefcode) as distance " +

            		"		from enplanworkitem pi, tktechcard tkd, entransportitem ti " +
            		"			left join endistance dist on ti.code = dist.transportitemrefcode " +
            		"		where pi.planrefcode = " + planCode +
            		"		and pi.kartarefcode = tkd.code " +
            		"		and pi.code = ti.planitemrefcode " +
            		"		and COALESCE(tkd.middlesallaryway,0) <> 0 " +
            		"		Group by tkd.middlesallaryway) qq " +
            		"		where qq.middlesallaryway > 0 ";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			statement = connect.prepareStatement(sql);
			resultSet = statement.executeQuery();

			// ���� � ������� ������ � ������� ������������ � ��� ���� ������ �� ��������� ����
			while (resultSet.next()) {
				/**
				 * SUPP-5518... 24.07.2013 +++ �� ��������� �� ������ �� ����� ������....
				 */
				distance = resultSet.getBigDecimal(1);
				if (distance == null) {
					result = false;
				} else {
					if (distance.doubleValue() == 0) {
						result = true;
					}
				}
			}

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			try {
				if ((connect != null) && !connect.isClosed())
					connect.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}


    public int addForCalculationByPriconnection(
            ENTechConditionsServices object, int planKindCode, int codeRem)
            throws PersistenceException {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
        ENTechCond2PlanWorkDAO tc2planDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);

        /*
        * ������������ ����
        * statuscode
        * elementrefcode
        * renrefcode
        * kindcode
        * staterefcode
        * formrefcode
        * sourcerefcode
        */

        ENPlanWork plan = new ENPlanWork();
        plan.elementRef.code = object.element.code;
        plan.renRef.code = object.element.renRef.code;
        plan.status.code = ENPlanWorkStatus.GOOD;
        plan.kind.code = planKindCode;
        plan.typeRef.code = ENPlanWorkType.WORK_IN_OUT;
        plan.stateRef.code = ENPlanWorkState.WORK_IN_OUT;
        plan.formRef.code = ENPlanWorkForm.NOPLANNED;
        plan.sourceRef.code = ENPlanWorkSource.MANUAL;
        plan.departmentRef.code = codeRem;

        Calendar c = Calendar.getInstance();
        c.setTime(new Date());

        plan.yearGen = c.get(Calendar.YEAR);
        plan.monthGen = c.get(Calendar.MONTH) + 1;

        plan.dateStart = planLogic.getFirstDate(new Date());
        plan.dateFinal = planLogic.getLastDate(new Date());

        int planCode = planDAO.add(plan);

        /** ����� ����� � ��������� */
        /// �������� �� ��������� ����� � ��������� ���������
        ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
        ENTechCond2PlanWorkFilter tc2planFilter = new ENTechCond2PlanWorkFilter();
        tc2planFilter.planRef.code = planCode;
        int[] tc2plArr = tc2planDAO.getFilteredCodeArray(tc2planFilter,0,-1);
        if (tc2plArr.length > 0) {
			ENTechCond2PlanWork tc2pl = tc2planDAO.getObject(tc2plArr[0]);
			throw new SystemException("��� ���� ��� ��������������� � ������� - " +
					soDAO.getObjectByTechConditionsServices(techCondDao.getObject(tc2pl.techConServicesRef.code)).contractNumberServices);
        }
        ///

        ENTechCond2PlanWork tc2plan = new ENTechCond2PlanWork();
        tc2plan.planRef.code = planCode;
        tc2plan.techConServicesRef.code = object.code;
        tc2planDAO.add(tc2plan);

        return planCode;
    }

    public void createDistancesByPlanCodeByPriconnection(int planCode, BigDecimal distance)
            throws PersistenceException {
        Connection connect = null;
        try {
            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ENPlanWork plan = new ENPlanWorkDAO(connect, userProfile).getObject(planCode);
            ENTechConditionsServices tcsObject = getObjectByElementCode(plan.elementRef.code);
            createDistancesByPriconnection(tcsObject, distance, plan.kind.code, plan.code);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(),e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
    }

    public ENTechConditionsServices getObjectByElementCode(int elementCode)
            throws PersistenceException {
        if (elementCode == Integer.MIN_VALUE) {
            throw new SystemException("ElementCode is NULL!!!");
        }

        ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(connection, userProfile);
        ENTechConditionsServicesFilter f = new ENTechConditionsServicesFilter();
        f.element.code = elementCode;
        int[] arr = objDAO.getFilteredCodeArray(f, 0, -1);
        if (arr.length != 1) {
            throw new SystemException(
                    "Element count != 1 (ENTechConditionsServices)");
        }

        return objDAO.getObject(arr[0]);
    }

    public void createDistancesByPriconnection(ENTechConditionsServices tcsObject,
            BigDecimal distance, int planKindCode, int planCode) throws PersistenceException
    {
        ENPlanWork plan;

        ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        plan = planDAO.getObject(planCode);

        TransportLogic trLogic = new TransportLogic(connection, userProfile);

        BigDecimal distTO = distance.divide(new BigDecimal(2), 3, BigDecimal.ROUND_HALF_UP);
        BigDecimal distFROM = distance.subtract(distTO).setScale(3, BigDecimal.ROUND_HALF_UP);

        ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);

        ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter trFilter = new ENTransportItemFilter();
        trFilter.planRef.code = plan.code;
        int[] trArr = trDAO.getFilteredCodeArray(trFilter, trFilter.conditionSQL, null, 0, -1, null);


        /////////////
        int isNotLicensedActivity = getIsNotLicensedActivity(plan.code);
        //////////////

        /* NET-2396 NET-2397 NET-2399 NET-2401 ��������� �������� �� �����������
        ������ ������ �������� (����� � ����������� ��������������� 1.1.01)
        ���������� ����� 0,4-35�»(����� � ����������� ��������������� 1.1.02 )
        ���������� ����� 0.4-20�» (����� � ����������� ��������������� 1.1.03)
        ���������� ����� 35-150�» (����� � ����������� ��������������� 1.1.04)
        ���� ��������� ����� �������� ������� ����������� ���������
        */

        String strCodeIzol = "";
        String strKL04_35 = "";
        String strVL04_20 = "";
        String strVL35_150 = "";
        boolean isCodeIzol = false;
        boolean isKL04_35 = false;
        boolean isVL04_20 = false;

        // �������� ���� ����������� ������������ ����� ��� ������ ��������
        strCodeIzol = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED));
        // �������� ���� ����������� ������������ ����� ��� ��������� ����� 0,4-35��
        strKL04_35 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV));
        // �������� ���� ����������� ������������ ����� ��� ��������� ����� 0.4-20��
        strVL04_20 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV));
        // �������� ���� ����������� ������������ ����� ��� ��������� ����� 35-150��
        strVL35_150 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV));

        // ��������� � ���� ������ ��������� ����������� � ��������� (������ �� ������ ��� ��� ��� 04-34 ��� ������� ����� 04-20 ��� ������� ����� 35-150)
           ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
           ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
           ENPlanWork2ClassificationTypeShortList p2cList = null;
           // ���� ��� �� ��������
           p2cFilter.planRef.code = plan.code;
           // p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_SLUJBA_ISOLATED;
           p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strCodeIzol +" )  " +
                                    " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                    "                                    where p2c.planrefcode = " + plan.code + " ) ";
           p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
           if (p2cList.totalCount >0 ){
            isCodeIzol = true;
           }
           // ���� ��� ��� ����� 04-35
           if (!isCodeIzol){
            p2cFilter.planRef.code = plan.code;
              // p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_KL04_35KV;
               p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strKL04_35 +" )  "  +
                                        " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                        "                                    where p2c.planrefcode = " + plan.code + " ) ";
               p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
               if (p2cList.totalCount >0 ){
                isKL04_35 = true;
               }
           }
        // ���� ��� ��������� ����� 04-20
           if (!isCodeIzol && !isKL04_35){
            p2cFilter.planRef.code = plan.code;
             //  p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL04_20KV;
               p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strVL04_20 +" )  " +
                                        " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                        "                                    where p2c.planrefcode = " + plan.code + " ) ";
               p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
               if (p2cList.totalCount >0 ){
                isVL04_20 = true;
               }
           }

           // ���� ��� ��������� ����� 35-150
           if (!isCodeIzol && !isKL04_35 && !isVL04_20){
            p2cFilter.planRef.code = plan.code;
              // p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL35_150KV;
               p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strVL35_150 +" )  " +
                                        " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                        "                                    where p2c.planrefcode = " + plan.code + " ) ";
               p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
           }


          for (int i=0; i < trArr.length; i++){
            // ��� ����������� �� �����. ������� (�� ����, ����� ���������� !!) ���������� ���������� ������ �� 1-� ������

            if (isNotLicensedActivity == 2)
            {
                if (i > 0) break;
            }


            ENDistanceFilter distFilter = new ENDistanceFilter();
            distFilter.transportItemRef.code = trArr[i];
            int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, distFilter.conditionSQL, null, 0, -1, null);
            for (int j=0; j < distArr.length; j++){
                distDAO.remove(distArr[j]);
            }


            ENDistance dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distTO;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_TO;
            distDAO.add(dist);

            dist = new ENDistance();
            dist.transportItemRef.code = trArr[i];
            dist.distance = distFROM;
            dist.roadType.code = ENRoadType.HIGHWAY;
            dist.typeRef.code = ENDistanceType.DISTANCE_FROM;
            distDAO.add(dist);

              }

        trLogic.createDeliveryTimeForPlan(plan.code);
    }

    /**
     * SUPP-8502 SUPP-8757
     * ����� ��� ������� ����� ���������� ����
     * @param actCode - ��� ����
     * @return ����� ���������� ����
     */
    public BigDecimal getSumByActServicesOut(int actCode  , boolean forProfitability ) throws PersistenceException
    {
        String sql =
            " select coalesce(getsumbyactservicesout(?,?)::numeric(15, 2), 0)";

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try
        {
            BigDecimal result = new BigDecimal(0);

            statement = connection.prepareStatement(sql);

            statement.setInt(1, actCode);
            statement.setBoolean(2, forProfitability);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                result = resultSet.getBigDecimal(1);
                if (result == null)
                {
                    throw new SystemException("\n\nSUPP-8502 ������� �� ��� ���������� ���� ����������� ���� (��� ����: " + actCode + ")!");
                    //result = new BigDecimal(0);
                }

                result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            /// DEBUG
            System.out.println("ActCode = " + actCode + " | getSumByActServicesOut: " + result);
            ///

            return result;
        }
        catch (SQLException e)
        {
            throw new PersistenceException(e.getMessage());
        }
        finally
        {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
    }

    /**
     * SUPP-8502 SUPP-8757
     * ����� ��� ������� ����� ��������� ����� �� ��������
     * @param servicesObject - ������� �� ������� �� ������� (������)
     * @return ����� ��������� ����� �� ��������
     * @throws PersistenceException
     */
    public BigDecimal getSumExpensesForServicesObject(ENServicesObject servicesObject) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0);

        ENActDAO actDAO = new ENActDAO(connection, userProfile);

        ENActFilter actFilter = new ENActFilter();
        actFilter.element.code = servicesObject.element.code;

        int[] actArr = actDAO.getFilteredCodeArray(actFilter, actFilter.conditionSQL,  actFilter.orderBySQL, 0, -1, null);

        if (actArr.length == 0)
        {
            throw new SystemException("\n\nSUPP-8502 �� �������� ���������� ��� ��� ��'����! ��� ��'����: " + servicesObject.code);
        }

        for (int i=0; i < actArr.length; i++)
        {
            result = result.add(getSumByActServicesOut(actArr[i] , true ));
        }

        result = result.setScale(2, BigDecimal.ROUND_HALF_UP);

        return result;
    }



    /**
     * ������ �������� ����� ��� �������� �������������� ( �������� ��� ��� ����� ����������� ������ �� , ��� ���� ��� ��������� �������������� �������� �� � ���� ����� ���������� )
     *
     * SUPP-84181 19.07.2019 ��� ������������ ����� �/� �������� �������������� ���� �������� � � ����� ����� ��-�������.
     *
     * */

    public BigDecimal getSumProfitsForServicesObject(ENServicesObject servicesObject) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0);


        ENCalcTotalCostDAO calctotCstDAO = new ENCalcTotalCostDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeDAO pwctDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        TKClassificationTypeDAO cltDAO = new TKClassificationTypeDAO(connection, userProfile);

        ENCalcTotalCostFilter calctotCstFil = new ENCalcTotalCostFilter();
        calctotCstFil.conditionSQL = " ENCALCTOTALCOST.planrefcode in (select pp.code " +
        		" 	from enplanwork pp " +
        		"  where pp.kindcode =  " + ENPlanWorkKind.CALCULATION +
        		" and pp.elementrefcode = "+ servicesObject.element.code +" ) " ;

        int[] calcTotCstArr = calctotCstDAO.getFilteredCodeArray(calctotCstFil, 0, -1);

        if (calcTotCstArr.length == 0)
        {
            throw new SystemException("\n\nSUPP-8502 �� �������� ���������� �� �������� " + servicesObject.contractNumberServices);
        }

        for (int i=0; i < calcTotCstArr.length; i++) {
        	ENCalcTotalCost calcTotCstObject = calctotCstDAO.getObject(calcTotCstArr[i]);
        	ENPlanWork2ClassificationType pwct = pwctDao.getObject(calcTotCstObject.plan2CTypeRef.code);

            // esli ustanoffka mnogotariff
            TKClassificationTypeFilter cltFil = new TKClassificationTypeFilter();
            cltFil.conditionSQL = " tk.code =  (select p2c.classificationtyperfcd from enplanwork2classfctntp p2c where p2c.code = "+calcTotCstObject.plan2CTypeRef.code+" )  ";
            int[] clTypeArr = cltDAO.getFilteredCodeArray(cltFil, 0, -1);

            boolean REPLACE_COUNTER = false;
            boolean isTransportServices = false;

            for (int r=0; r < clTypeArr.length; r++) {
                TKClassificationType cltObj = cltDAO.getObject(clTypeArr[r]);
                if (cltObj.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER ){
                	REPLACE_COUNTER = true;
                }
                isTransportServices = cltObj.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT;
            }

            // SUPP-84181 ��� ���������� ������� ����������� �/� �������� �.�.
            // ��� ����� �� ���������� �� ����������� ��������������� ���������
            // �� ������ ��� ��� ����� ������� �����, ���� �� ����� �� �������
            // ��� ��������� �� �����������
            if(pwct.calcKindRef.code != TKCalcKind.NEW) {
            	result = result.add(calcTotCstObject.costWithoutVAT);
            } else {
            	if(isTransportServices) {
                	ServicesCalculatorLogic calculatorLogic = new ServicesCalculatorLogic(connection, userProfile);
                    result = result.add(calculatorLogic.getCalculatedOverallSalaryDriver(servicesObject));
            	} else {
            		result = result.add(calcTotCstObject.calculationCost);
            	}
            }

            if(REPLACE_COUNTER && pwct.calcKindRef.code == TKCalcKind.NEW){
                result = result.add(calcTotCstObject.materialExpenses);
            }
        }

        result = result.setScale(2, BigDecimal.ROUND_HALF_UP);

        return result;
    }


    /**
     * SUPP-8502 SUPP-8757
     * ����� ��� �������� �������������� �� ��������
     * @param servicesObject - ������� �� ������� �� ������� (������)
     * @throws PersistenceException
     */
    public void validateProfitability(ENServicesObject servicesObject) throws PersistenceException
    {
        AuthLogic authLogic = new AuthLogic(connection, userProfile);


        /**  SUPP-14532... 01.04.2014 +++ �������� �������������� ��� ������ ���������...
         *   ����� �������������, ������� � �.�.. +++ ��� ������������ �����....
         */

        /** SUPP-97236... 13.01.2021... ��� ������� ������ ��������... */
        boolean checkVerify = false;

        if (servicesObject != null
                && servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION) {

            if (servicesObject.contractTypeRef.code == ENServicesContractType.TY
                    || servicesObject.contractTypeRef.code == ENServicesContractType.OTHERS
                    || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_ACCESS
                    || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_AGREE
                    || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU
                    || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU_MODIFY) {


            	checkVerify = true;
            }
        }

        if (!checkVerify) {
        	return;
        }



        /** SUPP-42754... 17.12.2015 +++ �� ��������� ����������� ��������... */
        if (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
        	return;
        }

        boolean isLicensed = this.isLicensed(servicesObject);


        // ������� � ������� �� ����� dontValidateProfitability
        // ������ ��������� ������� � ������ "������ �������" ���������� �� �������� ��������������
        boolean dontValidateProfitability = (authLogic.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "dontValidateProfitability"));
        if (dontValidateProfitability) {
            return;
         }


        // BigDecimal profits  = servicesObject.contractServicesSumma.setScale(2, BigDecimal.ROUND_HALF_UP); // �����
        BigDecimal profits  = getSumProfitsForServicesObject(servicesObject); // ����� 25.04.2019//

        // ����� � ������ �������� �������������� ������, ������� �� ������ � �����������
        ENServices2CalcAdditionalItemsDAO s2caiDAO = new ENServices2CalcAdditionalItemsDAO(connection, userProfile);
        ENServices2CalcAdditionalItemsFilter s2caiFilter = new ENServices2CalcAdditionalItemsFilter();
        s2caiFilter.servicesObjectRef.code = servicesObject.code;
        ENServices2CalcAdditionalItemsShortList s2caiList = s2caiDAO.getScrollableFilteredList(s2caiFilter, 0, -1);
        for (int brr=0;brr<s2caiList.totalCount;brr++) {
        	System.out.println(
                    "\n\n���� ���������� ������ "+ brr + ": " + s2caiList.get(brr).summa);
        	profits = profits.add(s2caiList.get(brr).summa);
        }

        BigDecimal expenses = getSumExpensesForServicesObject(servicesObject); // ������


        if (expenses.doubleValue() == 0)
        {
            throw new SystemException("\n\nSUPP-8502 ������� �� ��������� ������ (���� = 0)! ��� ��������: " + servicesObject.code);
        }

        /*
            ������� ��� ������� �������� ��������������:
            ((���� �� ������������ ���� (��� ���) - �������� ���� ���������� ����) / �������� ���� ���������� ����) * 100%

            �.�.:
            ((profits - expenses) / expenses) * 100%
        */

        // ������� ��������������
        // double profitability = ((profits.doubleValue() - expenses.doubleValue()) / expenses.doubleValue()) * 100;
        BigDecimal profitability = new BigDecimal(((profits.doubleValue() - expenses.doubleValue()) / expenses.doubleValue()) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);


        if (userProfile.userName.toUpperCase().equals("energynet".toUpperCase())) {
        	System.out.println(
                    "\n\n��� ��� ��������� ��������: " +
                    "\n\n���� ��������: " + profits + "\n���� �������: " + expenses +
                    "\n\n³������ ������������� = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
                    " = " + profitability + "%" +
                    "\n\n�������� ����������� ��������� ����������� ����!");
        }


        // DEBUG!!!!!!!!!
          if (userProfile.userName.toUpperCase().equals("energynet".toUpperCase())
        	|| servicesObject.code == 1017117363 // ������� ����� ������� ��� �������� , ����������� � ��� ��� ���
        	|| servicesObject.code == 1017117371 // ������� ����� ������� ��� �������� , ����������� � ��� ��� ���
        	) {
              profitability = new BigDecimal(5);
          }

	       // SUPP-35436 - ��� ������ <-5 � >10 � ��� �������� �������� �� ������ 0
	       // ������� �������������� �� �������� ������ ���� � �������� -5 - +10%
	       if (isLicensed)
	       {
		        ///// 06.10.15 SUPP-39812 ������������� �������������� ��� ������ �� ��������!
		    	//if (profitability.doubleValue() < -5 || profitability.doubleValue() > 10)
		    	// if (profitability.doubleValue() < 0 || profitability.doubleValue() > 10)
		    	if (profitability.doubleValue() < 0 || profitability.doubleValue() > 15)  // SUPP-74403
		        {
		            //throw new SystemException("\n\nSUPP-8757 ������������� �� ��������� ������� ���� � ����� -5 - +10% !" +
		    		throw new SystemException("\n\nSUPP-39812 ������������� �� ��������� ������� ���� � ����� 0 - +15% !" +
		                    "\n\n��� ��� ��������� ��������: " +
		                    "\n\n���� ��������: " + profits + "\n���� �������: " + expenses +
		                    "\n\n³������ ������������� = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
		                    " = " + profitability + "%" +
		                    "\n\n�������� ����������� ��������� ����������� ����!");
		        }
	       }
	       else
	       {
	    	   if (/*profitability.doubleValue() < 0 ||(profitability.doubleValue() > 30*/
	    			   profitability.doubleValue() < 0 ||(profitability.doubleValue() > 40 /*SUPP-74403*/
	    			   &&
	    	    		  (servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_ACCESS
	                      || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_AGREE
	                      || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU
	                      || servicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU_MODIFY))){
	    		   throw new SystemException("\n\nSUPP-35436 ������������� �� ��������� ������� ���� �� ����� 0% !" +
	                       new String ( (servicesObject.contractTypeRef.code == ENServicesContractType.OKSN ? " ��� ����� 40%" : "") ) +
	                       "\n\n��� ��� ��������� ��������: " +
	                       "\n\n���� ��������: " + profits + "\n���� �������: " + expenses +
	                       "\n\n³������ ������������� = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
	                       " = " + profitability + "%" +
	                       "\n\n�������� ����������� ��������� ����������� ����!");
	    	   }
	       }

    }

    /**
     * ����� ��� ����������� ���� ����� (������������/��������������)
     * @param servicesObject - ������� �� ������� �� ������� (������)
     * @return true - ���� ������������ ������, false - ���� ��������������
     * @throws PersistenceException
     */
    public boolean isLicensed(ENServicesObject servicesObject) throws PersistenceException
    {
    	ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
    	TKCalcCostDAO calcCostDao = new TKCalcCostDAO(connection, userProfile);
        TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);

    	ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    	servicesObjectRef.code = servicesObject.code;

    	int[] servicesCostCodes = servicesCostDao.getCodesbyENServicesObjectRef(servicesObjectRef);

    	if(servicesCostCodes.length > 0) {
    		ENServicesCost servicesCost = servicesCostDao.getObject(servicesCostCodes[0]);
    		TKCalcCost calcCost = calcCostDao.getObject(servicesCost.tkCalcCostRef.code);
    		TKClassificationType classificationType = ctDAO.getObject(calcCost.classificationTypeRef.code);
    		return classificationType.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;
    	}

        ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

        if (plan == null)
        {
            throw new SystemException("�� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
        }

        if (plan.code == Integer.MIN_VALUE)
        {
            throw new SystemException("�� �������� �������� ��� ��������! ��� ��������: " + servicesObject.code);
        }

        ENPlanWork2ClassificationTypeFilter p2ctFilter = new ENPlanWork2ClassificationTypeFilter();
        p2ctFilter.planRef.code = plan.code;

        ENPlanWork2ClassificationTypeDAO p2ctDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeShortList p2ctList = p2ctDAO.getScrollableFilteredList(p2ctFilter, 0, -1);

        if (p2ctList.totalCount == 0)
        {
            throw new SystemException("� ������� ���� ����� �����������! ��� ��������: " + servicesObject.code);
        }

        TKClassificationType ctObj = ctDAO.getObject(p2ctList.get(0).classificationTypeRefCode);

        if (ctObj == null)
        {
            throw new SystemException("�� �������� ����������� ��� ��������! ��� ��������: " + servicesObject.code);
        }

        if (ctObj.code == Integer.MIN_VALUE)
        {
            throw new SystemException("�� �������� ����������� � ����� " + ctObj.code + " !");
        }

        // ���� 0 (���, ��������, Integer.MIN_VALUE) - ������ ������������, ���� > 0 - ��������������
        return (ctObj.isnotlicensedactivity <= 0);
    }


    public void recalculateCalculationsConnections(
            ENPlanWork2ClassificationType object, boolean priconnections)
            throws PersistenceException {

        Connection connect = null;
        try {

            int planCalcSingle = Integer.MIN_VALUE;
            int planCalc = Integer.MIN_VALUE;

            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            // ��� ����� ���������� ���������
            ENPlanWorkDAO planCalcSingleDAO = new ENPlanWorkDAO(connect, userProfile);
            ENPlanWorkFilter planCalcSingleFilter = new ENPlanWorkFilter();

            if (priconnections) {
                planCalcSingleFilter.conditionSQL = " code = (" +
                        " select p2.code" +
                        "  from enplanwork p1, enplanwork p2, enplanwork2classfctntp ct1, enplanwork2classfctntp ct2 " +
                        " where p1.code = ct1.planrefcode " +
                        " and ct1.classificationtyperfcd = ct2.classificationtyperfcd " +
                        " and p2.code = ct2.planrefcode " +
                        " and p1.elementrefcode = p2.elementrefcode " +
                        " and p2.kindcode = " + ENPlanWorkKind.CALCULATION_SINGLE +
                        " and p1.code = " + object.planRef.code + ")";


            } else {
                planCalcSingleFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION_SINGLE;
            }

            //ENPlanWorkShortList planCalcSingleList = planCalcSingleDAO.getScrollableFilteredList(planCalcSingleFilter, 0, -1);

            int planCalcSingleList[] =  planCalcSingleDAO.getFilteredCodeArray(planCalcSingleFilter, 0, -1);

            // �������� ���� ��� ���������� ��������� �� ����� � ������������� ������
            if (planCalcSingleList.length == 0 ) {
                return;
            }
            planCalcSingle = planCalcSingleList[0];
            // ��� ����� ���������

            ENPlanWorkDAO planCalcDAO = new ENPlanWorkDAO(connect, userProfile);
            ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();

            if (priconnections) {
                planCalcFilter.conditionSQL = " code = " + object.planRef.code;
            } else {
                planCalcFilter.conditionSQL =  " elementrefcode = ( select el.code from enelement el, enplanwork pw " +
                        "  where el.code = pw.elementrefcode " +
                        "    and pw.code = " + object.planRef.code +
                        " limit 1 ) "  +
                        " and kindcode = " + ENPlanWorkKind.CALCULATION;
            }

            int planCalcList[] = planCalcDAO.getFilteredCodeArray(planCalcFilter, 0, -1);
            planCalc = planCalcList[0];

            ServicesCalculatorLogic scLogic = new ServicesCalculatorLogic(connect, userProfile);
            // ������������� ������ �������� ��� ���������
            scLogic.reCalculateCalcHumenSalary(planCalcSingle , planCalc );
            // ������������� ������ ���������� ��� ���������

            // encalccost �������� ������� ��������� ���������� ���� (������) (������������� ������� ����� �����������)
            scLogic.recalculateCost(planCalcSingle , planCalc );
            // encalcTotalcost �������� ��������� �����
            scLogic.recalculateTotalCost(planCalcSingle , planCalc );
            // ������������� ��������� ����� �� �������� ��� ����� �������� ���������
            scLogic.calculateContractCost(planCalcSingle, priconnections);
            // ������������� ��������� ����� �� �������� ��� ����� ��������
            scLogic.calculateContractCost(planCalc, priconnections);

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
    }

    /**
     * ����� ��� �������� ������������ ��������� ��� �������� �� ������� �� �������
     * @param delayServicesObject - �������� ��� �������� �� ������� �� ������� (������)
     * @return true - ���� ��� ��, false - ���� ��� :)
     * @throws PersistenceException
     */
  public boolean isValidDelay(ENDelayServices delay)
    {

    // ��� �� ��� ������ ���� �������� :)
    return false;
    }

  /**
   *
   * ���������� ������� ����� � ������� ���������������� DocFlow.
   *
   * ������� ������ ��� ������������ ������ ���������� � DocFlow,
   * � ����� ������� ��� � dfPackCode ������� object, ���.
   * �� ������� � ���. � ���� net ������ ���������� �� �����.
   *
   * �-��� �������� ������ ��� ����� � �������������, ��� ���� ���������
   * ����� ���������� ����� �� ��� � ��� ������ Integer.MIN_VALUE
   *
   * @param object ������ �������� �����
   * @return int ��� ������������ ������ ���������� � DocFlow
   */
  public int addServicesObjectToDocFlow(ENServicesObject object, int servicesDocFlowCode)
  {
    try
    {
        if(object == null)
            throw new SystemException("�� ������� ��'��� ������");

        // ���� �������, �� ����� �� ���������
        if(object.contractKindRef.code == Integer.MIN_VALUE)
            throw new SystemException("Error in contractKindRef.code");
        else
        {
            if(object.contractKindRef.code != ENServicesContractKind.SERVICES)
                return Integer.MIN_VALUE;
        }

            // �������� ����
            if (object.contractTypeRef.code == Integer.MIN_VALUE) throw new SystemException("Error in contractTypeRef.code");
            /** 17.04.2018... +++ ������������ ������ ������� ������.... ������������� �������������� CN-��...  */
            // if ((object.contractTypeRef.code != ENServicesContractType.CONNECTION) && (object.contractTypeRef.code != ENServicesContractType.OTHERS))

			if (object.contractTypeRef.code != ENServicesContractType.OTHERS)
				return Integer.MIN_VALUE;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
            // ��������� ���������


            int servicesListCode = Integer.MIN_VALUE;
            int servicesList2Code = Integer.MIN_VALUE;

            if (servicesDocFlowCode == Integer.MIN_VALUE)
            {
                // ������� ����������� ���������
                if(object.element.code == Integer.MIN_VALUE) throw new SystemException("error in object.element.code");
                ENPlanWork planCalc = getPlanWorkCalculationByElementCode(object.element.code);
                ENPlanWork2ClassificationTypeDAO pla2siDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
                ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
                pla2siFilter.planRef.code = planCalc.code;
                ENPlanWork2ClassificationTypeShortList pla2siList = pla2siDao.getScrollableFilteredList(pla2siFilter, 0, -1);

                String classCodesStr = "";
                if(pla2siList.totalCount == 0) throw new SystemException("������� � ������� �����������");
                for(int i = 0; i < pla2siList.totalCount; i++)
                {
                    if(classCodesStr.length() == 0)
                        classCodesStr = pla2siList.get(i).classificationTypeRefCode + "";
                    else
                        classCodesStr = classCodesStr + ", " + pla2siList.get(i).classificationTypeRefCode + "";
                }

                TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(connection, userProfile);
                TKClassificationTypeFilter classFilter = new TKClassificationTypeFilter();
                classFilter.conditionSQL = " tk.code in (" + classCodesStr + ")";

                TKClassificationTypeShortList classList = classDao.getScrollableFilteredList(classFilter, 0, -1);

                if(classList.totalCount == 0) throw new SystemException("������� � ������� �����������");

                // ���������� ���� ����� �� ������� ����������������
                servicesListCode = classList.get(0).servicesListCode;
                servicesList2Code = classList.get(0).servicesList2Code;
                //if(servicesListCode == Integer.MIN_VALUE) throw new SystemException("�������: �� ����������� � " + classList.get(0).kod + " �� ������������ ��� ������� � ������� �������������");

                /** SUPP-30095.... */
                // if(servicesListCode == Integer.MIN_VALUE) return Integer.MIN_VALUE;
                if (servicesList2Code == Integer.MIN_VALUE
                		|| servicesList2Code == 0) {
                	 throw new SystemException("\n\n"
                	 		+ "�������: �� ����������� �� ������������ ��� ������� � ������� �������������!!!\n "
                	 		+ "��������� � ³��� �������� �� ������������� ������������� ���������� �� ���������� �.�. (���. 12-84)!!!");
                }

                if(classList.totalCount > 1)
                {
                    for(int i = 1; i < classList.totalCount; i++)
                    {
                        if(classList.get(i).servicesList2Code != servicesList2Code && classList.get(i).servicesList2Code != Integer.MIN_VALUE)
                        {
                            if(classList.get(i).servicesList2Code != Integer.MIN_VALUE)
                                // throw new SystemException("�������: ��� ������ � ������� ������������� ��� ����� ����������� � " + classList.get(0).kod + " ����������� �� ��� ������� ��� ����������� � " + classList.get(i).kod);

                                /** SUPP-11965 +++ � ���������� ���� ��������� ��� �� ������, ����� ����������� �����������!!! */
                                throw new SystemException("\n" +
                                        "\n ���������� ��������������� � ������ ������� ����������� � ������ ������ ������!!!" +
                                        "\n K�� ������� ��� ����������� � " + classList.get(0).kod + " : " + classList.get(0).servicesList2Number +
                                        "\n K�� ������� ��� ����������� � " + classList.get(i).kod + " : " + classList.get(i).servicesList2Number +
                                        "\n ��������� � ³��� �������� �� ������������� ������������� ���������� �� ���������� �.�. (���. 12-84)!!!");
                            else
                            	throw new SystemException("�������: �� ����������� � " + classList.get(i).kod + " �� ������������ ��� ������� � ������� �������������");

                        }
                    }
                }
            }
            else
            {
                servicesListCode = servicesDocFlowCode;
                servicesList2Code = servicesDocFlowCode;
            }


        // ����������� ������� DFPack � DFMovement ��� �������� � DocFlow
        DFPack pack = new DFPack();
        DFMovement movement = new DFMovement();


        //���� �����������
        //if(object.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET || object.contractTypeRef.code == ENServicesContractType.CONNECTION)
        if(isDocFlowLifeCycleStartsWithSigning(object) || object.contractTypeRef.code == ENServicesContractType.CONNECTION)
        {
            // ��� ��������� ����������� � �������� - ���� ����������� �������� ���� ��������
            pack.dateRegistration = object.contractDateServices;
            movement.stateName = "������ ��������";
        }
        else
        {
            // ��� ��������� - ��� ���� ������ ������
            ENPayment2SODAO paymentDao = new ENPayment2SODAO(connection, userProfile);
            ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
            paymentFilter.servicesObjectRef.code = object.code;
            paymentFilter.orderBySQL = ENPayment2SO.dateGen_QFielld + " ASC";

            ENPayment2SOShortList paymentList = paymentDao.getScrollableFilteredList(paymentFilter, 0, -1);

            if(paymentList.totalCount == 0) throw new SystemException("�� �������� ����� ������");

            /**
             * 	SUPP-25137... 03.11.2014 +++ �������� ��������� (���������) -
             *  ������ S1_3, S1_4_1 � S1_4_2 �������������� ����� ��������....
             */
            if (servicesListCode == DFServicesList.S1_3
            		|| servicesListCode == DFServicesList.S1_4_1
            		|| servicesListCode == DFServicesList.S1_4_2
                    // + �� ������ ��������
            		|| servicesList2Code == DFServicesList.S3_NEW) {

            	pack.dateRegistration = paymentList.get(0).dateEdit;
            } else {
            	pack.dateRegistration = paymentList.get(0).dateGen;
            }


            movement.stateName = "������� ����������";
        }


        pack.organizationName = object.contragentName;
        pack.customerName = object.contragentName;
        pack.customerAddress = object.contragentAddress;
        pack.customerPhone = object.contragentPhoneNumber;
        pack.description = object.commentGen;
        // ���� �� ����������� ���� S-�� �� 2-�� ��������, ������ ��, ����� - S-�� �� 1-��
        if (servicesList2Code != Integer.MIN_VALUE) {
        	pack.servicesListRef.code = servicesList2Code;
        } else {
        	pack.servicesListRef.code = servicesListCode;
        }
        pack.infoSourcesRef.code = DFInfoSources.EN;
        pack.departmentRef.code = docFlowLogic.getDFDepartmentCodeByENDepartmentCode(object.department.code, true);
        pack.typeRef.code = DFPackType.SERVICES;
        pack.contractNumber = object.contractNumberServices;
        pack.name = object.contragentName;

        String personalAccountNumber = null;

        if (object.reconnectionTU == 0) {
        	personalAccountNumber = "�����";
        }

        if (object.personalAccountNumber != null) {
        	personalAccountNumber = object.personalAccountNumber;
		}

        pack.personalAccountNumber = personalAccountNumber;
        pack.eic = object.codeEIC;

        movement.dateStart = pack.dateRegistration;

        // ���� ��� ��� dfPackCode - �� ������ �� ���� - �� ���� ��������� ����� ����������
        /** SUPP-35156... 12.06.2015 +++ � ����� ������? �������� - ����� ���� ��� � �����....
            if(object.dfPackCode != Integer.MIN_VALUE) throw new SystemException("������� ��� ��� ������� ���� ��� � ������� ����������������");
         */
        if(object.dfPackCode != Integer.MIN_VALUE)
        	return object.dfPackCode;


        int docFlowCode = docFlowLogic.registerServiceStart(pack, movement);
        object.dfPackCode = docFlowCode;



        /** ������ ��������� ���� ���������� �� �������� */


        return docFlowCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeDocFlowConnection();
		}
	}


  /**
   *
   * ���������� ������� ����� � ������� ���������������� DocFlow.
   *
   * ������� ������ ��� ������������ ������ ���������� � DocFlow
   *
   * �-��� �������� ������ ��� ����� � �������������, ��� ���� ���������
   * ����� ���������� ����� �� ���.
   *
   * @param servicesObjectCode ��� ������� �������� �����
   * @return int ��� ������������ ������ ���������� � DocFlow
   */
  public int addServicesObjectToDocFlow(int servicesObjectCode, int servicesListCode)
  {
    try
    {
        ENServicesObjectDAO servicesDao = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObject object = servicesDao.getObject(servicesObjectCode);
        int docFlowCode = addServicesObjectToDocFlow(object, servicesListCode);
        object = null;
        return docFlowCode;
    }
    catch (PersistenceException e) {
        throw new SystemException(e);
    }
  }

  public boolean checkWorks(int soCode) {

	  return checkWorks(soCode, true);

  }

  /**
   * �������� �������������� ����������� � ������� �� �����������
   *
   * @param soCode - ��� ��������
   * @return boolean workConnections
   */
    public boolean checkWorks(int soCode, boolean useServicesListCode) {
        boolean workConnections = false;
        try {
            TKClassificationTypeDAO clDAO = new TKClassificationTypeDAO(userProfile, connection);

            TKClassificationTypeFilter clFilter = new TKClassificationTypeFilter();
            clFilter.conditionSQL = "tk.code in (select p2c.classificationtyperfcd from "
                    + " enservicesobject so, enplanwork p, enplanwork2classfctntp p2c "
                    + " where so.code = " + soCode
                    + " and so.elementcode = p.elementrefcode "
                    + " and p.kindcode =  "  + ENPlanWorkKind.CALCULATION
                    + " and p.code = p2c.planrefcode)";

            int clArr[] = clDAO.getFilteredCodeArray(clFilter, clFilter.conditionSQL, null, 0, -1, null);

            if (clArr.length > 0) {
                for (int j = 0; j < clArr.length; j++) {

                	/* ����������� �� �������� �� ������������ ������ �����
                	if (useServicesListCode) {

                		TKClassificationType ctObj = clDAO.getObject(clArr[j]);

                		if (ctObj.servicesListCode == DFServicesList.S1_3 ||
                			ctObj.servicesListCode == DFServicesList.S1_4_1 ||
                			ctObj.servicesListCode == DFServicesList.S1_4_2) {

                			return true;

                		}

                	} else {

                        int workConnection[] = TKClassificationType.CONNECTIONS;
                        for (int i = 0; i < workConnection.length; i++) {
                            if (workConnection[i] == clArr[j]) {
                                return workConnections = true;
                            }
                        }

                	}
                	*/
            		TKClassificationType ctObj = clDAO.getObject(clArr[j]);
            		if (ctObj.servicesList2Code == DFServicesList.S3_NEW) {
                		return true;
                	}

                }
            }

        } catch (PersistenceException e) {
            throw new SystemException(e);
        }

        return workConnections;
    }

    /**
     *
     * ��������� ��� ������ ������ �� ��������
     *
     * ��� ������ �� �������� <b>object</b> ������������ � Integer.MIN_VALUE ���� setDfPackCodeToNull = true
     *
     * @param object ������ ��������
     */
    public void cancelServicesObjectInDocFlow(ENServicesObject object, boolean setDfPackCodeToNull)
    {
        try
        {
            if(object == null)
                throw new SystemException("�� ������� ��'��� ������");

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowLogic.cancelPack(object.dfPackCode);

            if(setDfPackCodeToNull)
                object.dfPackCode = Integer.MIN_VALUE;

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
     * ��������� ��� �������� ������ �� ������� ��������������� �� ��������
     *
     * ��� ������ �� �������� <b>object</b> ������������ � Integer.MIN_VALUE.
     * ������� �� �����������
     *
     * @param object ������ ��������
     */
    public void deleteServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("�� ������� ��'��� ������");

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            docFlowLogic.deletePack(object.dfPackCode);

            object.dfPackCode = Integer.MIN_VALUE;
            object.term = Integer.MIN_VALUE;
            object.boundaryDateWork = null;
            object.regulation = Integer.MIN_VALUE;
            object.factDateWork = null;

		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeDocFlowConnection();
		}
	}



    /**
     *
     * ��������� ���������� ���������� ����� �� �������� � ������� �������������� DocFlow
     *
     * @param object ������ ��������
     */
    public void finishServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("�� ������� ��'��� ������");

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            DFMovement movement = new DFMovement();


            movement.stateName = "������ ������� �� ��������� � " + object.contractNumberServices;
            movement.packRef.code = object.dfPackCode;
            movement.dateStart = getFactMaxDate(object);
            movement.dateFinish = getFactMaxDate(object);


            String personalAccountNumber = null;

            if (object.reconnectionTU == 0) {
            	personalAccountNumber = "�����";
            }

            if (object.personalAccountNumber != null ) {
            	personalAccountNumber = object.personalAccountNumber;
    		}


            docFlowLogic.registerServiceFinish(movement, true, /** isException */ false, personalAccountNumber);

		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeDocFlowConnection();
		}
	}


    /**
     *
     * ������������ ������ �� ����� ���������� �� �������� <b>obj</b> ���������� ��� ����������
     *
     * @param obj ������ ENServicesObject - ������� �� EnergyNet
     * @return <b>true</b> ���� ����� ���������� �� �������� ������ ������� �
     * ������� ���������������� ��� ����������, <b>false</b> � ��������� ������
     */
    public boolean isDocFlowLifeCycleStartsWithSigning(ENServicesObject obj)
    {
        boolean result = true;

        // ��� ��������� �� ���������, ����������� �
        // ����������� ����������� � ������� ���������������� DocFlow
        // ��� ���������� ����� ����������� ��� ������

        if(obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
                && obj.contractTypeRef.code != ENServicesContractType.CONNECTION
                && obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY)
        {
            result = false;
        }

        return result;
    }

    /**
    *
    * ���������� ������������ ���� �����-������� ��� �������� <b>so</b>
    *
    * @param so
    * @return
    * @throws SystemException ���� �� ������� ������-������
    */
    public Date getFactMaxDate(ENServicesObject so) throws PersistenceException
    {
        if(so == null)
            throw new IllegalArgumentException("so must be not null");
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        TechConditionsLogic techConLogic = new TechConditionsLogic(connection, userProfile);

        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.kind.code = ENPlanWorkKind.FACT;
        planFilter.elementRef.code = so.element.code;
        planFilter.conditionSQL = ENPlanWork.status_QFielld + " NOT IN (" + ENPlanWorkStatus.OLDER + ", " + ENPlanWorkStatus.CANCELED_ + ")";
        ENPlanWorkShortList list = planDao.getScrollableFilteredList(planFilter, 0, -1);

        if(list.totalCount == 0) throw new SystemException("�� �������� �����");


        Date maxDate = list.get(0).dateFinal;

        for(int i = 0; i < list.size(); i++)
        {
            if(maxDate.compareTo(list.get(i).dateFinal) < 0)
                maxDate = list.get(i).dateFinal;
        }


        // �������� �� ���. ��������
        int techCondCode = techConLogic.getTechCodeBySoCode(so.code);
        if(techCondCode != Integer.MIN_VALUE)
        {
            planFilter = new ENPlanWorkFilter();
            planFilter.kind.code = ENPlanWorkKind.FACT;
            planFilter.conditionSQL = " EXISTS (select topl.code from entechcond2planwork as topl " +
                                            " where " +
                                            " topl.techconservicesrefcode = " + techCondCode + " " +
                                            " and topl.planrefcode = " + ENPlanWork.code_QFielld + ") AND " + ENPlanWork.status_QFielld + " NOT IN (" + ENPlanWorkStatus.OLDER + ", " + ENPlanWorkStatus.CANCELED_ + ")";

            list = planDao.getScrollableFilteredList(planFilter, 0, -1);

            for(int i = 0; i < list.size(); i++)
            {
                if(maxDate.compareTo(list.get(i).dateFinal) < 0)
                    maxDate = list.get(i).dateFinal;
            }

        }

        return maxDate;


    }

    /**
     *
     * ��������� ������ ���������� ���������� ����� �� �������� � ������� �������������� DocFlow
     *
     * @param object ������ ��������
     */
    public void undoFinishServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("�� ������� ��'��� ������");

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            DFMovement movement = new DFMovement();


            movement.stateName = "³���� ������� \"������ �������\" �� ��������� � " + object.contractNumberServices;
            movement.packRef.code = object.dfPackCode;
            movement.dateStart = getFactMaxDate(object);
            movement.dateFinish = getFactMaxDate(object);

            docFlowLogic.undoRegisterServiceFinish(movement);

		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			closeDocFlowConnection();
		}
	}


    public int addServicesDelay(ENDelayServices object)
    {
		try
		{
			if (object.servicesObjectRef == null)
			{
				throw new SystemException("\n\n��� ������ �� ������� �� ������� �� �������!");
			}

			if (object.servicesObjectRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\n��� ������ �� ������� �� ������� �� �������!");
			}

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			ENDelayServicesDAO dlDAO = new ENDelayServicesDAO(connection, userProfile);

			ENServicesObject soObj = soDAO.getObjectNoSegr(object.servicesObjectRef.code);

			// ��������� �� ��������� �������� �������� � ��� ����������
			ENDelayServicesFilter dlFilter = new ENDelayServicesFilter();
			dlFilter.servicesObjectRef.code = soObj.code;
			dlFilter.conditionSQL = "  ( '"+ new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart)  +"' between endelayservices.datestart and endelayservices.datefinal \n " +
								    "  or \n " +
								    "   '"+ new SimpleDateFormat("dd.MM.yyyy").format(object.dateFinal)  +"' between endelayservices.datestart and endelayservices.datefinal \n " +
								    "  ) ";
			int[] dlArr = dlDAO.getFilteredCodeArray(dlFilter, 0, -1);
			if (dlArr.length > 0 ){
				throw new SystemException("\n\n ������ �������� ������������ � ��� ��������� ��������� �� �������� !");
			}

			if (soObj.dfPackCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4315 ��� ������ �� ����� �� DocFlow! ���������� ������ ������ � ��������!");
			}

			//  NET-4560 ������ ������� ������ � �������� ����� ��������� ���� ��������� ����� �� ������ *
			if ( soObj.boundaryDateWork.compareTo( object.dateStart ) < 0 ){
				throw new SystemException("\n\n NET-4560 ���������� ������� ������ � �������� ����� ��������� ���� ��������� ����� �� ������ !");
			}

			docFlowConnection = getDocFlowConnection();
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

			object.calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(object.dateStart, object.dateFinal);
			object.workDaysCount = dfLogic.getWorkDaysBetweenDates(object.dateStart, object.dateFinal);

			ENDelayServicesDAO objectDAO = new ENDelayServicesDAO(connection, userProfile);

			int objectCode = objectDAO.add(object);

			///// ��������� ������ � �������� � DocFlow
			DFMovement movementDelay = new DFMovement();
			movementDelay.packRef.code = soObj.dfPackCode;
			movementDelay.dateStart = object.dateStart;
			movementDelay.dateFinish = object.dateFinal;
			movementDelay.stateName = "�������� ������� ������� � ���� ��������� �� ����� ���";

			DFMovement movement = new DFMovement();
			movement.packRef.code = soObj.dfPackCode;
			movement.dateStart = movementDelay.dateFinish;
			movement.stateName = "����������� ���� �� ��������";

			dfLogic.registerServiceDelay(movementDelay, movement, object.calendarDaysCount, object.workDaysCount);
			/////

			// NET-4560 -- ������ ��������� ���� ���������� ����� �� ������� �� ������� �� ������ ����������� "������� ������(S)"
			this.calculationBoundaryDateWorkAtDelays(soObj);


			/** ���� ������ ������� � ������� � ����� - ������� ���������� �� ������ � �����.. */
			int servicesConsumerCode = getServicesConsumerCode(soObj.code);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				ENServicesObject sObject = soDAO.getObjectNoSegr(soObj.code);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

			    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
			    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

					BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
							.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));

					dfLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);
				}


				/** ��������� ���� ���������� */
				DFDocDAO docDao = new DFDocDAO(docFlowConnection, userProfile);
				DFDoc doc = docDao.getObject(servicesConsumer.doc.code);

				doc.dateEndWork = sObject.boundaryDateWork;
				docDao.save(doc);
			}


			return objectCode;
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);

		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally {
			closeDocFlowConnection();
		}
	}


    public void removeServicesDelay(int code)
    {
		try
		{
	        ENDelayServicesDAO objectDAO = new ENDelayServicesDAO(connection, userProfile);

			ENDelayServices object = objectDAO.getObject(code);

			if (object.servicesObjectRef == null)
			{
				throw new SystemException("\n\n��� ������ �� ������� �� ������� �� �������!");
			}

			if (object.servicesObjectRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\n��� ������ �� ������� �� ������� �� �������!");
			}

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject soObj = soDAO.getObjectNoSegr(object.servicesObjectRef.code);

			if (soObj.dfPackCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4315 ��� ������ �� ����� �� DocFlow! ���������� ������� ������ � ��������!");
			}

			objectDAO.remove(code);

			///// ��������� ������ �� ������ �������� � DocFlow
			docFlowConnection = getDocFlowConnection();
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

	        // ����� ��������� ������ � dfmovement � ������ ������ � ���������, ������������ � ����� ������ ��� ���������� ��������� �� ������
	        DFMovement lastMovement = dfLogic.getLastMovement(soObj.dfPackCode);

			DFMovement movementDelay = new DFMovement();
			movementDelay.packRef.code = soObj.dfPackCode;
			movementDelay.dateStart = lastMovement.dateStart;
			movementDelay.dateFinish = lastMovement.dateStart;
			movementDelay.stateName = "��������� �������� ������� �������";

			DFMovement movement = new DFMovement();
			movement.packRef.code = soObj.dfPackCode;
			movement.dateStart = movementDelay.dateFinish;
			movement.stateName = "����������� ���� �� ��������";

			dfLogic.undoRegisterServiceDelay(movementDelay, movement, object.calendarDaysCount, object.workDaysCount);
			/////

			// NET-4560 -- ������ ��������� ���� ���������� ����� �� ������� �� ������� �� ������ ����������� "������� ������(S)"
			this.calculationBoundaryDateWorkAtDelays(soObj  );


			/** ���� ������ ������� � ������� � ����� - ������� ���������� �� ������ � �����.. */
			int servicesConsumerCode = getServicesConsumerCode(soObj.code);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				ENServicesObject sObject = soDAO.getObjectNoSegr(soObj.code);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

			    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
			    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

					BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
							.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));

					dfLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);
				}


				/** ��������� ���� ���������� */
				DFDocDAO docDao = new DFDocDAO(docFlowConnection, userProfile);
				DFDoc doc = docDao.getObject(servicesConsumer.doc.code);

				doc.dateEndWork = sObject.boundaryDateWork;
				docDao.save(doc);
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


    /**
     *  ��� ������� ����� �������� � ���������� ������ ������ �������� �� ���������� � ��������� �������� � DocFlow...
     *
     *  @param soCode - ��� ��������
     * 	@param finishWorks - ������� ���������� ����� �� ��������
     * 	@param calcTypeByCalculation - ���� ������� � ��������� "������ ��������� �������� �����������" - true
     *
     *  @return - true (���� ���� �����)
     */

	public boolean updateDocMovementStatusByServicesConsumer(int soCode, boolean finishWorks) {
		return updateDocMovementStatusByServicesConsumer(soCode, finishWorks, false);
	}

	public boolean updateDocMovementStatusByServicesConsumer(int soCode, boolean finishWorks,
			boolean calcTypeByCalculation) {
		try {
			docFlowConnection = getDocFlowConnection();

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			DFDoc2ENServicesObjectDAO doc2soDao = new DFDoc2ENServicesObjectDAO(docFlowConnection, userProfile);
			DFDocMovementDAO docMovementDao = new DFDocMovementDAO(docFlowConnection, userProfile);
			DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

			DFDoc2ENServicesObjectFilter doc2soFilter = new DFDoc2ENServicesObjectFilter();
			doc2soFilter.servicesObjectCode = soCode;

			/** ���� ���� ����� ��������� � ��������� �� ������ */
			int doc2soArr[] = doc2soDao.getFilteredCodeArray(doc2soFilter, 0, -1);
			if (doc2soArr.length > 0) {

				ENServicesObject soObj = soDAO.getObjectNoSegr(soCode);

				DFDoc2ENServicesObject doc2so = doc2soDao.getObject(doc2soArr[0]);

				/** ��������� �������� �� ��������� */
				DFDocMovementFilter docMovementFilter = new DFDocMovementFilter();
				docMovementFilter.docRef.code = doc2so.docRef.code;
				docMovementFilter.isLast = DFDocMovement.LAST;

				int docMovementArr[] = docMovementDao.getFilteredCodeArray(docMovementFilter, 0, -1);

				if (docMovementArr.length == 1) {
					DFDocMovement docMovement = docMovementDao.getObject(docMovementArr[0]);

					if (finishWorks) {
						docMovement.resolution = "��������� �������� �� ������� �" + soObj.contractNumberServices + " � EnergyNet.";
						docMovement.isCompleted = DFDocMovement.COMPLETED;
						docMovement.jobStatusRef.code = DFJobStatus.COMPLETED;
					} else {
						docMovement.resolution = "³���� �������� �� ������� �" + soObj.contractNumberServices + " � EnergyNet.";
						docMovement.isCompleted = DFDocMovement.COMPLETED;
						docMovement.jobStatusRef.code = DFJobStatus.DENIED;
					}


		            Context cnt = new InitialContext();
		            Object objRef = cnt.lookup(DFDocMovementController.JNDI_NAME);
		            DFDocMovementControllerHome docMovementHome = (DFDocMovementControllerHome) PortableRemoteObject
		                    .narrow(objRef, DFDocMovementControllerHome.class);
		            DFDocMovementController docMovementController = docMovementHome.create();


		            if (finishWorks) {
		            	docMovementController.save(docMovement, true);

		            	if (calcTypeByCalculation) {
		            		doc2so.endDate = new Date();
		            	} else {
		            		doc2so.endDate = getFactMaxDate(soObj);
		            	}


		            	if (doc2so.paymentDate == null) {
		            		doc2so.paymentDate = soObj.contractDateServices;
		            	}

		            	boolean usesMDAXData = false;
		                AuthLogic netAuth = new AuthLogic(connection, userProfile);
		            	usesMDAXData = netAuth.checkUsesMDAXData();

		            	if (usesMDAXData == true) {
		            		mDaxLogic mdLogic = new mDaxLogic(connection, userProfile );
		            		BigDecimal[] wDaysHoursArr = { new BigDecimal(0), new BigDecimal(0) };
		            		wDaysHoursArr = mdLogic.getWorkingTimePlan( doc2so.paymentDate , doc2so.endDate , AXConsts.BASICGRAPHICID );
		            		doc2so.workDays = wDaysHoursArr[0].intValue();

		            	} else {
		            	  doc2so.workDays = docFlowLogic.getWorkDaysBetweenDates(doc2so.paymentDate, doc2so.endDate);
		            	}
		            	doc2soDao.save(doc2so);

		            } else {
		            	docMovementController.save(docMovement);
		            }


		            /**
		             *   docMovementController.save(docMovement);
		             *   �������� ���������� ENServicesObject, ������� ������� ������...
		             */
		            soObj = soDAO.getObject(soCode);


		            if (!finishWorks) {
						soObj.contractStatusRef.code = ENServicesContractStatus.CANCELED;
						soDAO.save(soObj);

						// ������� ����������� ��������
						removeForCounters(soObj.code, true);
		            }

					return true;

				} else {
					throw new SystemException("\n\n[DOCFLOW] " +
							" ������� ��� ��������� ��������� ����� ���������!!!");
				}

			} else {
				return false;
			}

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
		} finally {
        	closeDocFlowConnection();
        }
	}


    /**
     *  ��� ������� ����� �������� � ���������� ����������� ���� ������ �� ��������...
     *
     *  @param soCode - ��� ��������
     *  @parem paymentDate - ���� ������
     *
     */
	public void setPaymentDateByServicesConsumer(int soCode, Date paymentDate) {
		try {
			docFlowConnection = getDocFlowConnection();

			DFDoc2ENServicesObjectDAO doc2soDao = new DFDoc2ENServicesObjectDAO(docFlowConnection, userProfile);
			DFDoc2ENServicesObjectFilter doc2soFilter = new DFDoc2ENServicesObjectFilter();
			doc2soFilter.servicesObjectCode = soCode;

			/** ���� ���� ����� ��������� � ��������� �� ������ */
			int doc2soArr[] = doc2soDao.getFilteredCodeArray(doc2soFilter, 0, -1);
			if (doc2soArr.length > 0) {

				DFDoc2ENServicesObject doc2so = doc2soDao.getObject(doc2soArr[0]);

				if (doc2so.paymentDate == null) {
					doc2so.paymentDate = paymentDate;
					doc2soDao.save(doc2so);
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	public void recalcServicesOnlyFactCalcByAct(int actCode)
			throws PersistenceException {

		ENActDAO actDAO = new ENActDAO(connection, userProfile);
		ENAct act = actDAO.getObject(actCode);

		if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
			throw new SystemException(
					"\n\nNET-4235 ��� �� � ����� ��������� ���� �� �������� �� �������! ��� ����: "
							+ actCode);
		}

		ENServicesObject servicesObject = getServicesObjectByElementCode(act.element.code);

		ENServicesFactCalcByActDAO factCalcByActDAO = new ENServicesFactCalcByActDAO(connection, userProfile);

		ENServicesFactCalcByAct factCalcByAct;

		ENServicesFactCalcByActFilter factCalcByActFilter = new ENServicesFactCalcByActFilter();
		factCalcByActFilter.actRef.code = actCode;

		int[] factCalcByActArr = factCalcByActDAO.getFilteredCodeArray(factCalcByActFilter, 0, -1);
        for (int i = 0; i < factCalcByActArr.length; i++) {
        	factCalcByActDAO.remove(factCalcByActArr[i]);
        }

		// ������� ����� ������
		factCalcByAct = new ENServicesFactCalcByAct();
		factCalcByAct.actRef.code = actCode;
		factCalcByAct.servicesObjectRef.code = servicesObject.code;

		factCalcByAct.materialsCost = getMaterialsCostByAct(actCode);
		factCalcByAct.transportCost = getTransportCostByAct(actCode);

		double contractServicesDistance = 0;
        if (servicesObject.contractServicesDistance != null)
        {
            contractServicesDistance = servicesObject.contractServicesDistance.doubleValue();
        }


        /**
         *  01.02.2016... +++ ���� �� ����� ���� ������� �������� ������ ��� contractServicesDistance > 0
         *  � createDeliveryTime ���������� �������� �� ������� "�� ����������� ��������"
         */

        // if (factCalcByAct.transportCost.doubleValue() == 0
		//		&& contractServicesDistance > 0) {
        //
        if (contractServicesDistance > 0) {

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			TransportLogic transportLogic = new TransportLogic(connection, userProfile);
			HumenLogic humenLogic = new HumenLogic(connection, userProfile);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.elementRef.code = servicesObject.element.code;
			planFilter.kind.code = ENPlanWorkKind.FACT;
			planFilter.conditionSQL = "code in (select ap.plancode from enact2enplanwork ap where ap.actrefcode = "
					+ actCode + ")";
			int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

			for (int i = 0; i < planArr.length; i++) {
				if (factCalcByAct.transportCost.doubleValue() == 0) {
					transportLogic.createDeliveryTimeForPlan(planArr[i], true, false, false);
				} else {
					transportLogic.createDeliveryTimeForPlan(planArr[i], false, false, true);
				}

				humenLogic.createDeliveryTime(planArr[i]);
			}
		}

		factCalcByAct.deliveryCost = getDeliveryCostByAct(actCode);
		factCalcByAct.transportCost = getTransportCostByAct(actCode);

		factCalcByActDAO.add(factCalcByAct);
	}


	public void isCancelableServices(int svoCode) throws PersistenceException {

		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject so = soDAO.getObjectNoSegr(svoCode);

		if (so.contractTypeRef.code != ENServicesContractType.TY
				&& so.contractTypeRef.code != ENServicesContractType.OTHERS) {
			return;
		}

		TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
		TKClassificationTypeFilter ctFilter = new TKClassificationTypeFilter();

	    ctFilter.conditionSQL = " tk.code in (select distinct ct.code " +
	                            " from enplanwork2classfctntp p2c, tkclassificationtype ct, " +
	                            " enplanwork pw, enservicesobject so " +
	                            " where p2c.classificationtyperfcd = ct.code " +
	                            " and pw.code = p2c.planrefcode " +
	                            " and pw.elementrefcode = so.elementcode " +
	                            " and pw.kindcode = 5 " +
	                            " and so.code = " +  svoCode  + " " +
	                            " limit 1) ";

	    TKClassificationTypeShortList ctList = ctDAO.getScrollableFilteredList(ctFilter, 0, -1);

	    if (ctList.totalCount == 0) {
	    	throw new SystemException("�� �������� ����������� ��� �������� � ����� " + svoCode);
	    }

	    /* �� ������� ������, � ���� ��� ��������... ))
	    boolean isLicensedActivity = false;

	    if (ctList.get(0).isnotlicensedactivity == 0) isLicensedActivity = true;
	    if (ctList.get(0).isnotlicensedactivity > 0) isLicensedActivity = false;

		if (isLicensedActivity) {
			AuthLogic authLogic = new AuthLogic(connection, userProfile);
			if (!authLogic.checkPermissionSilent(
					"ksoe/energynet/ENServicesObjectController", "cancelServices")) {
				throw new SystemException("\n\n"
						+ "� ��� ���� ���� �� ���������� ����� �������! \n"
						+ "����������� �� �������������� �� ���������.");
			}
		}
		*/
	}


	/**
	 * �������� ������� � �������� ����� �� ������ ��������
	 * ��� �������� �� ������������� ����
	 *
	 * @param soElementCode - ��� �������� ��������
	 */
	public boolean checkReplaceCounterServices(int soElementCode) {
		boolean out = false;
		try {
			ENPlanWork2ClassificationTypeDAO clDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENPlanWork2ClassificationTypeFilter clFilter = new ENPlanWork2ClassificationTypeFilter();

			clFilter.conditionSQL = " code in (select tcl.code "
					+ " from enplanwork2classfctntp tcl, tkclassificationtype t "
					+ " where tcl.classificationtyperfcd = t.code "
					+ "  and t.replacecounterkindcode = " + TKReplaceCounterKind.REPLACE_COUNTER
					+ "  and tcl.planrefcode in ("
					+ " select p.code from enplanwork p where p.elementrefcode = " + soElementCode
					+ "  and p.kindcode = " + ENPlanWorkKind.CALCULATION + " ) ) ";

			int clArr[] = clDao.getFilteredCodeArray(clFilter, 0, -1);
			if (clArr.length > 0) {
				out = true;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return out;
    }


	/**
	 * �������� ������� � �������� ����� �� �������������� ��������
	 *
	 *
	 * @param soElementCode - ��� �������� ��������
	 */
	public boolean checkParameterizationCounterServices(int soElementCode) {
		boolean out = false;
		try {
			ENPlanWork2ClassificationTypeDAO clDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENPlanWork2ClassificationTypeFilter clFilter = new ENPlanWork2ClassificationTypeFilter();

			clFilter.conditionSQL = " code in (select tcl.code "
					+ " from enplanwork2classfctntp tcl, tkclassificationtype t "
					+ " where tcl.classificationtyperfcd = t.code "
					+ "  and t.replacecounterkindcode = " + TKReplaceCounterKind.PARAMETERIZATION_COUNTER
					+ "  and tcl.planrefcode in ("
					+ " select p.code from enplanwork p where p.elementrefcode = " + soElementCode
					+ "  and p.kindcode = " + ENPlanWorkKind.CALCULATION + " ) ) ";

			int clArr[] = clDao.getFilteredCodeArray(clFilter, 0, -1);
			if (clArr.length > 0) {
				out = true;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return out;
    }


	/**
	 * ���������� ��� ��������� �� ���� � ������������ ���������
	 * @param actCode - ��� ����
	 */
	public int getOZCodeByAct(int actCode) {
		int ozCode = Integer.MIN_VALUE;
		try {
			ENAct2SCUsageInputDAO ozDao = new ENAct2SCUsageInputDAO(connection, userProfile);
			ENAct2SCUsageInputFilter ozFilter = new ENAct2SCUsageInputFilter();

			ozFilter.actRef.code = actCode;
			int ozArr[] = ozDao.getFilteredCodeArray(ozFilter, 0, -1);
			if (ozArr.length > 0) {
				ozCode = ozDao.getObject(ozArr[0]).scUsageInputRef.code;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return ozCode;
    }


	/***
	 * ������� ��� ������ ����������� �������� ��� ����� �� ������� , ������������� ����
	 *
	 * */
	// NET-4443-y - ��� ����� �� ������� ���� ��������� ����������� �� ��������� / ������ �������������� ������� ����� �����
	// ���� �� �������� ����� ������� �� ����� ��� ������ �� �������� ��� ��� ������������������� ��� ���� ���� �� �������, ��
	// ������ � �������������� �������������� ������� �� ��������� � ��������
	// ���� ������ � �������� ����� ����� �������� ��� ��� �������� ��� �������� (�������� ������� � ostable � ������� ��� �������� SERVICES_COUNTERS_LOCK )

	public ENMetrologyCounterShort getParametrizedCounterForServiceObject(TKClassificationType clTypeObj,
			int countersZoneType, int departmentCode) {

		try {
			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
			DepartmentLogic depLogic = new DepartmentLogic(connection, userProfile);
			ENMetrologyCounterShort counterShort = null;

			if (countersZoneType == Integer.MIN_VALUE) {
				throw new SystemException(" \n NET-4443 - �� ������� ������� ��������� !!! ");
			}

			// ������� ���� ��� ������������ ����������� ����� �� ������� � ������� ��������������� ��������
			if (clTypeObj.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER) {

				TKMaterials2TKMaterialsShortList m2mList = getTKMaterials2TKMaterialsShortListByTkClassificationTypeCode(clTypeObj.code, false);

				if (m2mList.totalCount == 0) {
					throw new SystemException("\n\n"
							+ "NET-4443 - �� �������� ��'������ ��������� ��� ������ � ��������!");
				}


	    		ENMetrologyCounterShort scShort = null;
	    		int renCode = depLogic.getFINDepartment2Department(departmentCode, false);

        		// ���� �� �������� ��������� ���� �������
	    		if(renCode != Integer.MIN_VALUE) {
		    		for(TKMaterials2TKMaterialsShort item : m2mList.list) {
						int phasity = (item.tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_1FService) ? 1
								: (item.tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_3FService) ? 3 : 0;
						scShort = scLogic.getParametrizedCounter(String.valueOf(renCode) + "%", phasity,
								countersZoneType, item.tkmaterialsOutRefCode, new BigDecimal(0));
						if(scShort != null) break;
		    		}
	    		}
	    		if(scShort == null) {
		    		for(TKMaterials2TKMaterialsShort item : m2mList.list) {
						int phasity = (item.tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_1FService) ? 1
								: (item.tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_3FService) ? 3 : 0;
						scShort = scLogic.getParametrizedCounter(
								RQConsts.SCCOUNTER_PARAMETERIZED_MULTIFUNCTIONAL_MOL_OUT, phasity, countersZoneType,
								item.tkmaterialsOutRefCode, new BigDecimal(0));
						if(scShort != null) break;
		    		}
	    		}
				if (scShort != null) {
					System.out.print(" Find counter from rest, kod_inv = " + scShort.invNumber);
					counterShort = scShort;
    			}
			}

			return counterShort;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 * ���������� ��������� ������ � ������������ ���������� �������� ��� ����������� ���� ��������� � �����������
	 *
	 * */
	public RQApprovedCostShort getApprovedCost(int tkClassificationTypeCode)
	   {
		   RQApprovedCostShort apCostShort = null;
		   //TKMaterialsDAO tmDAO = new TKMaterialsDAO(connection, userProfile);
		   //TKMaterials2TKMaterialsDAO m2mDAO = new TKMaterials2TKMaterialsDAO(connection, userProfile);
		   //RQApprovedCostDAO apCostDAO = new RQApprovedCostDAO(connection, userProfile);

		try {
			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			TKMaterials2TKMaterialsShortList m2mList = getTKMaterials2TKMaterialsShortListByTkClassificationTypeCode(tkClassificationTypeCode, false);

	   		if (m2mList.totalCount == 0 )
	   		{
				 throw new SystemException("\n\nNET-4443 - �� �������� ��'������ ��������� ��� ������ � �������!");
			}

			// ���� �� �������� ��������� ���� ������
			for (int g=0; g<m2mList.totalCount; g++){


				int phasity = (m2mList.get(g).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_1FService)  ? 1 :
					          (m2mList.get(g).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_3FService) ? 3 :
			                   0 ;

				apCostShort = scLogic.getApprovedCost(phasity,  m2mList.get(g).tkmaterialsOutRefCode);
				if (apCostShort != null ) {

					BigDecimal freeDif 	= apCostShort.countGen.subtract(apCostShort.countFact);
					if (freeDif.compareTo(new BigDecimal(0)) > 0  ){
						break; // ����� �� �����
					}
					else
					{
						apCostShort = null;
					}
				}

			}

			return apCostShort;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public RQApprovedCostShortList getFreeApprovedCostList(int materialCode) {
		Connection netConn = null;
		try {

			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			RQApprovedCostDAO apCostDAO = new RQApprovedCostDAO(netConn, userProfile);

			RQApprovedCostFilter apCostFilter = new RQApprovedCostFilter();
			apCostFilter.conditionSQL =
				" RQAPPROVEDCOST.rqorderitemrefcode in " +
				" ( " +
				"   select oi.code " +
				"   from rqorderitem oi " +
				"   where oi.materialcode = " + materialCode +
				"     and oi.statusrefcode = " + RQOrderItemStatus.GOOD +
				" ) " +
				" and RQAPPROVEDCOST.countfact < RQAPPROVEDCOST.countgen ";

			return apCostDAO.getScrollableFilteredList(apCostFilter, 0, -1);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public int generateAutoOrderByCountersServices(
			int tkClassificationTypeCode, int counterZoneType) {
		int orderCode = Integer.MIN_VALUE;
		try {

			TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
			TKClassificationTypeShort ctObjShort = ctDAO.getShortObject(tkClassificationTypeCode);

			TKMaterials2TKMaterialsShortList m2mList = getTKMaterials2TKMaterialsShortListByTkClassificationTypeCode(tkClassificationTypeCode, true);

	   		if (m2mList.totalCount == 0 ) {
	   			throw new SystemException("\n\nNET-4443 - ��� ������ (������������) \"" + ctObjShort.kod + "  " + ctObjShort.name + ". \n"
	   					+ "�� �������� ��'������ ��������� ��� ������������� ��������� ������!"
	   			 		+ "��������� � ���������.");
	   		}

	   		 // 18.09.15 ��� ������ ���?? � ��� ���� m2mList � ��� ���������� � rqorderController.addCountersServices,
	   		 // ������� ��� ������ ��������� �������� ��������� ��� m2mList.get(i), � ������ ��� ������ ����, ��� ���
	   		 // �� ����� �� �� 0-�� �������� (m2mList.get(0))
	   		 /*
			 int phasity = (m2mList.get(0).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_1FService)  ? 1 :
		                   (m2mList.get(0).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_3FService) ? 3 :
                           0 ;
	   		 */

			Context context = new InitialContext();
			context = new InitialContext();
	        Object rqorder = context.lookup(RQOrderController.JNDI_NAME);
	        RQOrderControllerHome rqorderHome = (RQOrderControllerHome) PortableRemoteObject
	                .narrow(rqorder, RQOrderControllerHome.class);
	        RQOrderController rqorderController = rqorderHome.create();

	        orderCode = rqorderController.addCountersServices(
	        		//phasity,
	        		m2mList,
	        		counterZoneType);

		   }
		      catch (NamingException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (RemoteException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (CreateException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			}

		 return orderCode;
	}

	/**
	 * �������� ������ �� ������� ���������
	 *
	 * @param m2mList - ���� �� �������� ����������
	 *
	 * @return ��� ��������� ������
	 */
	public int generateAutoOrderByCountersServices(TKMaterials2TKMaterialsShortList m2mList)
	{
		int orderCode = Integer.MIN_VALUE;

		try
		{
			// ���� ���� ������, ������ �� ������
			if (m2mList.totalCount == 0)
	   		{
				//throw new SystemException("\n\nNET-4506 �� �������� ��'������ ��������� ��� ������������� ��������� ������!");
				return Integer.MIN_VALUE;
			}

			Context context = new InitialContext();
			context = new InitialContext();
	        Object rqorder = context.lookup(RQOrderController.JNDI_NAME);
	        RQOrderControllerHome rqorderHome = (RQOrderControllerHome) PortableRemoteObject
	                .narrow(rqorder, RQOrderControllerHome.class);
	        RQOrderController rqorderController = rqorderHome.create();

	        orderCode = rqorderController.addCountersServices(m2mList, Integer.MIN_VALUE);
		}
	    catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return orderCode;
	}

	public int generateAutoOrderByCountersServices()
	{
    	Connection scConn = null;
    	Connection netConn = null;

		try
		{
			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			scConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);


			TKMaterials2TKMaterialsDAO m2mDAO = new TKMaterials2TKMaterialsDAO(netConn, userProfile);
			SCLogic scLogic = new SCLogic(netConn, scConn, userProfile);


			TKMaterials2TKMaterialsFilter m2mFilter = new TKMaterials2TKMaterialsFilter();

			m2mFilter.conditionSQL =
					"tkmaterialsinrefcode in (" +
						TKConsts.TKMATERIALS_COUNTER_1FService + ", " +
						TKConsts.TKMATERIALS_COUNTER_3FService +
					") and count2order > 0";

			TKMaterials2TKMaterialsShortList m2mList = m2mDAO.getScrollableFilteredList(m2mFilter, 0, -1);

			TKMaterials2TKMaterialsShortList m2mListForOrder = new TKMaterials2TKMaterialsShortList();
			m2mListForOrder.totalCount = 0;
			m2mListForOrder.list = new Vector<>();

			for (int i = 0; i < m2mList.totalCount; i++)
			{
				int materialCode = m2mList.get(i).tkmaterialsOutRefCode;

				// 1. �������� ���-�� ��������� � ��������
				ENMetrologyCounterShortList countersRest = scLogic.getCounters(materialCode);

				int countersRestCount = countersRest.totalCount;

				// ���� � �������� ���������� ���������, ��������� � ���������� ���������
				if (countersRestCount >= m2mList.get(i).count2Order.intValue())
				{
					continue;
				}

				// 2. �������� ���-�� ��������� � ������� (��, ������� ��� �� ������ ��� ��������)
				RQApprovedCostShortList apCostList = getFreeApprovedCostList(materialCode);

				int countersOrderedCount = 0;

				for (int j = 0; j < apCostList.totalCount; j++)
				{
					int dif = apCostList.get(j).countGen.subtract(apCostList.get(j).countFact).setScale(0).intValue();

					if (dif > 0)
					{
						countersOrderedCount += dif;
					}
				}

				// ���� ���-�� �������� � �������� + ���-�� � ������� (��� �� ��������) ����������,
				// ��������� � ���������� ���������
				if (countersRestCount + countersOrderedCount >= m2mList.get(i).count2Order.intValue())
				{
					continue;
				}

				int count2order = m2mList.get(i).count2Order.intValue() - (countersRestCount + countersOrderedCount);

				// � ���� if ��, �� ����, �� �������, �� �� ������ ������ ��������
				if (count2order <= 0)
				{
					continue;
				}

				m2mList.get(i).count2Order = new BigDecimal(count2order);

				m2mListForOrder.list.add(m2mList.get(i));
				m2mListForOrder.totalCount++;
			}

			// 3. ������� ������
			return generateAutoOrderByCountersServices(m2mListForOrder);
		}
		catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (scConn != null && !scConn.isClosed()) {
					scConn.close();
					scConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


	/**
	 *  �������� ��������� ���������� ��� ����������� � ������������� ���������
	 */
	public TKMaterials2TKMaterialsShortList getTKMaterials2TKMaterialsShortListByTkClassificationTypeCode(
			int tkClassificationTypeCode, boolean isForOrder) {

		try {
			TKMaterialsDAO tmDAO = new TKMaterialsDAO(connection, userProfile);
			TKMaterials2TKMaterialsDAO m2mDAO = new TKMaterials2TKMaterialsDAO(connection, userProfile);
			TKMaterials2TKMaterialsShortList m2mList = new TKMaterials2TKMaterialsShortList();

			TKMaterialsFilter tmFilter = new TKMaterialsFilter();
			tmFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;
			tmFilter.conditionSQL = " TKMATERIALS.CODE in ( select m.code    \n" +
					" from tkclassificationtype clt , tktechcard tkd , tkelement2techcard tl2tkd , tkelement tkl , tkmaterials m \n" +
					" where clt.code = " + tkClassificationTypeCode + " \n" +
					" and clt.code = tkd.classificationtypecode  \n" +
					" and tkd.code = tl2tkd.techkartcode  \n" +
					" and tl2tkd.elementcode = tkl.code  \n" +
					" and tkl.elementtypecode = " + TKElementType.TKMATHERIALS + " \n" +
					" and tkl.code = m.elementcode  \n" +
					" and m.accountingtyperefcode = " + TKAccountingType.COUNTERS + " \n" +
					" and m.code in ("+TKConsts.TKMATERIALS_COUNTER_1FService+", "+TKConsts.TKMATERIALS_COUNTER_3FService+") \n" +
					" ) \n" ;

				int[] tmArr = tmDAO.getFilteredCodeArray(tmFilter, 0, -1);
				if (tmArr.length == 0)
					throw new SystemException("\n NET-4443 - �� ����������� ������� ���� �������˲������� ����������ֲ����  !!! ");

				TKMaterials2TKMaterialsFilter m2mFilter = new TKMaterials2TKMaterialsFilter();

	    		m2mFilter.tkmaterialsInRef.code = tmArr[0]; // ����������� ����������� �������
	    		m2mFilter.conditionSQL = " tkmaterials2tkmaterils.tkmaterialsoutrefcode in ( select m2cl.materialrefcode \n " +
	    								" from tkclassificationtype clt , tkmaterls2tkclssfctntp m2cl , tkmaterials2tkmaterils m2m \n " +
	    								" where clt.code = m2cl.classificationtyperfcd \n "  +
	    								" and m2cl.materialrefcode = m2m.tkmaterialsoutrefcode \n " +
	    				 				" and clt.code =  " + tkClassificationTypeCode + " ) " +
	    								(isForOrder ? " and coalesce(tkmaterials2tkmaterils.count2order, 0) > 0" : "");

	    		m2mList = m2mDAO.getScrollableFilteredList(m2mFilter, 0, -1);

	    		/*
	    		if(m2mList.totalCount == 0 ){
	    			 throw new SystemException(" \n NET-4443 - ϳ� ����������� ��� �������� � ������ �� ������ ��������� ��� ������������ !!! ");
	    		}
	    		*/

	    		return m2mList;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void addApprovedCostItem(RQApprovedCostShort approvedCostShort, int servicesObjectCode, int counterZoneType)
	{
		try
		{
			RQApCost2Item2Services approvedCostItem = new RQApCost2Item2Services();

			approvedCostItem.statusRef.code = RQApprovedCostStatus.DRAFT;
			approvedCostItem.approvedCostRef.code = approvedCostShort.code;
			approvedCostItem.rqOrderItemRef.code = approvedCostShort.rqOrderItemRefCode;
			approvedCostItem.servicesObjectRef.code = servicesObjectCode;

			approvedCostItem.counterZoneType = counterZoneType;

			Context context = new InitialContext();
            Object approvedCostItemRef = context.lookup(RQApCost2Item2ServicesController.JNDI_NAME);
            RQApCost2Item2ServicesControllerHome approvedCostItemHome = (RQApCost2Item2ServicesControllerHome) PortableRemoteObject
                    .narrow(approvedCostItemRef, RQApCost2Item2ServicesControllerHome.class);
            RQApCost2Item2ServicesController approvedCostItemController = approvedCostItemHome.create();

            approvedCostItemController.add(approvedCostItem);
        } catch (NamingException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (RemoteException e) {
            throw new SystemException(e.getMessage(),e);
        } catch (CreateException e) {
            throw new SystemException(e.getMessage(),e);
        }
	}

	public void removeApprovedCostItem(int servicesObjectCode)
	{
		try
		{
			RQApCost2Item2ServicesFilter approvedCostItemFilter = new RQApCost2Item2ServicesFilter();
			approvedCostItemFilter.servicesObjectRef.code = servicesObjectCode;

			RQApCost2Item2ServicesDAO approvedCostItemDAO = new RQApCost2Item2ServicesDAO(connection, userProfile);

			int[] approvedCostItemArr = approvedCostItemDAO.getFilteredCodeArray(approvedCostItemFilter, 0, -1);

			if (approvedCostItemArr.length > 0) {
				ApprovedCostLogic approvedCostLogic = new ApprovedCostLogic(userProfile, connection);
				for (int i = 0; i < approvedCostItemArr.length; i++) {
					approvedCostLogic.removeApprovedCostItem(approvedCostItemArr[i]);
				}
			}

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        }
	}

	public void removeForCounters(int servicesObjectCode) {

		removeForCounters(servicesObjectCode, false);

	}

	/**
	 *
	 * @param servicesObjectCode
	 * @param isCancel - ���� = true, �� ��� ������ ��������� �, ���� �������� �� �������, �� �������� �� ������
	 *
	 */
	public void removeForCounters(int servicesObjectCode, boolean isCancel)
	{
		// ���������� ������� �� ������ �� ������� ���������
		removeApprovedCostItem(servicesObjectCode);
		// �������� �������������� �������� ��� ������� � �������������
		undoReserveCounterForServicesObject(servicesObjectCode);
		//SUPP-47167 ������ ������������������� ���������
		this.cancelRereservedCounters(servicesObjectCode, isCancel);
	}

	public void reserveCounterForServicesObject(ENMetrologyCounterShort counter, ENServicesObject servicesObject, int planKindCode)
	{

		try {

			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			// ����� �������
			scLogic.lockCounterInSC_(counter.scCode, "� ���." + servicesObject.contractNumberServices, servicesObject.contractDateServices, ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
			// ����������� ������� �� ������� ��� ������� (��� ����� ���������)
			scLogic.updateCounterEstimateCode(counter.scCode,
					getENEstimateItemCodeCounterByServicesObjectAndKindPlan(servicesObject.element.code,planKindCode));

			// ������� ������ � ������������ ����� ���� �� �������� ����� ������� � ���� ����� (���. ����)

			if(counter.rqorderitemcode > 0) {

				/**  NET-4467... +++ ��������� � Connection...
				 *   �������� �� ������������� �������, ����� (16.05.2015) ���������...
				 *   �������� ������������� � DS ?!?!?!?
				 */

				RQApprovedCostDAO appDAO = new RQApprovedCostDAO(connection, userProfile);
				RQApprovedCostFilter appFilter = new RQApprovedCostFilter();
				appFilter.rqOrderItemRef.code = counter.rqorderitemcode;
				RQApprovedCostShortList appList = appDAO.getScrollableFilteredList(appFilter, 0, -1);

				if (appList.totalCount>1 || appList.totalCount==0) {
					throw new SystemException("\n\n NET-4443 \n ������� ��� ����������� ���������!!!");
				} else
				if (appList.totalCount==1) {
					if (appList.get(0).countFact.compareTo(appList.get(0).countGen) < 0)
					{
						addApprovedCostItem(appList.get(0), servicesObject.code, servicesObject.countersZoneType);
					}
				}
			}
		}

		catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void undoReserveCounterForServicesObject(int servicesObjectCode)
	{
		try
		{
			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject servicesObject = servicesObjectDAO.getObjectNoSegr(servicesObjectCode);

			boolean replaceCounter = checkReplaceCounterServices(servicesObject.element.code);

			if (! replaceCounter)
			{
				return;
			}

			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
			SCCounterShortList scCounterList = scLogic.getCounterForServicesObject(servicesObjectCode);

			if (scCounterList.totalCount > 0)
			{
				ENMetrologyCounterFilter counterFilter = new ENMetrologyCounterFilter();
				counterFilter.invNumber = scCounterList.get(0).invNumber;

				ENMetrologyCounterShort counter = scLogic.getCounterFromScanCounters(counterFilter, true);

				if (counter != null)
				{
					// ���� ������� �������, �������� ���
					if (counter.lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK)
					{
						scLogic.lockCounterInSC_(counter.scCode, servicesObject.contractNumberServices, servicesObject.contractDateServices, (-1) * ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
					}

					// ������ ��� ��������� ��� ���� ����� � ScanCounters (���� ���, � �-��� show_ <> "Y") �� ���. ������
					ENMetrologyCounterShortList counterList = scLogic.getCountersListFromScanCounterShowAll(counterFilter, 0, -1);

					for (int i = 0; i < counterList.totalCount; i++)
					{
						scLogic.updateCounterEstimateCode(counterList.get(i).scCode, Integer.MIN_VALUE);
					}
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 *
	 * ��������� ������������������ �������� ��� �������
	 *
	 * ������ �������� �������� ���������� � ������������ ��������� ����� � �������� ��������
	 * � ��������� ����� ��� ��� ������������ ������. ���� ������� �� �������, �� ����������
	 * ��������� {@link ServicesLogic#addApprovedCostItem(RQApprovedCostShort, int, int)}
	 * ��� ��������� ���� ������ � ������.
	 *
	 * @param servicesObjectCode ��� ������ �� ������� {@link ENServicesObject}
	 */
	public void remakeCounterReservationForServicesObject(int servicesObjectCode) {
		try {
			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
			TKClassificationTypeDAO clsDao = new TKClassificationTypeDAO(connection, userProfile);

			ENServicesObject servicesObject = servicesObjectDAO.getObjectNoSegr(servicesObjectCode);
			if(!this.checkReplaceCounterServices(servicesObject.element.code)) return;
			SCCounterShortList scCounterList = scLogic.getCounterForServicesObject(servicesObjectCode);

			if (scCounterList.totalCount > 0) {
				System.out.println("remakeCounterReservationForServicesObject START servicesObjectCode = " + servicesObjectCode);
				this.undoReserveCounterForServicesObject(servicesObjectCode);
				this.cancelRereservedCounters(servicesObject);
				TKClassificationType classificationType = null;
				List<TKClassificationType> classificationTypes = clsDao.getClassificationListByServicesObjectCode(servicesObjectCode, null);
				if(classificationTypes.size() > 0) {
					for(TKClassificationType classificationTypeItem : classificationTypes) {
						if(classificationTypeItem.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER
								&& classificationTypeItem.isGiveCounter <= 0) {
							classificationType = classificationTypeItem;
							break;
						}
					}
					if(classificationType != null) {
						ENMetrologyCounterShort counter = this.getParametrizedCounterForServiceObject(classificationType
								, servicesObject.countersZoneType, servicesObject.department.code);
						if(counter != null) {
							System.out.println("remakeCounterReservationForServicesObject servicesObjectCode = " + servicesObjectCode
									+ " found counter with inventory number =  " + counter.invNumber);
							this.reserveCounterForServicesObject(counter, servicesObject, ENPlanWorkKind.CALCULATION);
						} else {
							RQApprovedCostShort counterFromApprovedCost = this.getApprovedCost(classificationType.code);
		            		if (counterFromApprovedCost.code == Integer.MIN_VALUE) {
		            			throw new SystemException("\n\nNET-4455 ������� ������ ����������� ������� ���������!");
		            		}
		            		this.addApprovedCostItem(counterFromApprovedCost, servicesObject.code, servicesObject.countersZoneType);
							System.out.println("remakeCounterReservationForServicesObject servicesObjectCode = " + servicesObjectCode
									+ " added into approved cost");
						}
					}
				}
				System.out.println("remakeCounterReservationForServicesObject FINISH servicesObjectCode = " + servicesObjectCode);
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch(Throwable e) {
			System.out.println("remakeCounterReservationForServicesObject servicesObjectCode = " + servicesObjectCode
					+ " ERROR " + e.getClass() + ": " + e.getMessage());
			e.printStackTrace();
			throw e;
		} finally {

		}
	}

	public int getENEstimateItemCodeCounterByServicesObjectAndKindPlan(int soElementCode, int planKindCode) {

		return getENEstimateItemCodeCounterByServicesObjectAndKindPlan(soElementCode, planKindCode, false);

	}

	/**
	 *
	 * @param soElementCode
	 * @param planKindCode
	 * @param isCancel - ���� = true, �� ��� ������ ��������� �, ���� �������� �� �������, �� �������� �� ������
	 *
	 * @return
	 */
	public int getENEstimateItemCodeCounterByServicesObjectAndKindPlan(int soElementCode, int planKindCode, boolean isCancel) {
		int eiCode = Integer.MIN_VALUE;
		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);

		ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
		eiFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
		eiFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;
		eiFilter.conditionSQL = " enestimateitem.countfact >0 and  enestimateitem.planrefcode in (select pw.code from enplanwork pw where pw.elementrefcode = "+ soElementCode +" and pw.kindcode = "+planKindCode+")";

		try {
			int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
			if (eiArr.length > 1 ){
				throw new SystemException(" \n\n NET-4443 \n �� ������� �������� ����� ������ ���������!!! ");
			} else
			if (eiArr.length == 0 ){
				if (! isCancel) {
					throw new SystemException(" \n\n NET-4443 \n �� ������� �� �������� ������� ���������!!! ");
				} else {
					return Integer.MIN_VALUE;
				}
			}

			eiCode = eiArr[0];
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return eiCode;
	}

	/**
	 * ����� ��������� ������ � sccounter � ����� "��� �������� �������" �� �������� �� ������ �� �������
	 * (������ ��� ��������� �� ��������� ������������� ���������)
	 *
	 * @param servicesObject - ������� (������ ���� ENServicesObject)
	 * @param workOrderBytCode - ��� �������� �������
	 *
	 * @return ��� ����������� ������ � sccounter
	 */
	public int createSCCounterForWorkOrderBytItem(ENServicesObject servicesObject, int workOrderBytCode)
	{
    	if (servicesObject == null)
    	{
    		throw new SystemException("\n\nSUPP-33009 �� ������� ������ � ������ �� �������!");
    	}

    	if (servicesObject.code == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nSUPP-33009 �� ������� ������ � ������ �� �������!");
    	}

    	if (workOrderBytCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nSUPP-33009 �� ������� ��� ������� ��������!");
    	}

    	try
    	{
			/////
			// ��������, ���� � ������� ������� ��� ���� ������ �� ��������� �������� � ����������� ���������,
			// �� ������ ������ ��� �������� � �� ����� ������ ��������� - ��������� ������ �������� �������
			// �� ����� �������� ����� ��������� �� ���� �������
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);

			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = workOrderBytCode;
			workOrderBytItemFilter.servicesObjectRef.code = servicesObject.code;

			ENWorkOrderBytItemShortList workOrderBytItemList = workOrderBytItemDAO.getScrollableFilteredList(workOrderBytItemFilter, 0, -1);

			for (int i = 0; i < workOrderBytItemList.totalCount; i++)
			{
				if (workOrderBytItemList.get(i).scCounterRefCode != Integer.MIN_VALUE)
				{
					return workOrderBytItemList.get(i).scCounterRefCode;
				}
			}
			/////

    		boolean replaceCounter = checkReplaceCounterServices(servicesObject.element.code);

    		if (replaceCounter)
    		{
    			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
    			SCCounterShortList scCounterList = scLogic.getCounterForServicesObject(servicesObject.code);

    			if (scCounterList.totalCount > 0)
    			{
    				SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

    				SCCounter scCounter = new SCCounter();

    		        scCounter.scCode = scCounterList.get(0).scCode;
    		        scCounter.invNumber = scCounterList.get(0).invNumber;
    		        scCounter.name = scCounterList.get(0).name;
    		        scCounter.buildNumber = scCounterList.get(0).buildNumber;
    		        scCounter.molCode = scCounterList.get(0).molCode;
    		        scCounter.account = scCounterList.get(0).account;

    		        scCounter.kindRef.code = SCCounterKind.FOR_WORKORDERBYT;
    		        scCounter.statusRef.code = SCCounterStatus.GOOD;

    		        return scCounterDAO.add(scCounter);
    			}
    		}
    	}
    	catch (PersistenceException e)
    	{
    		throw new SystemException(e.getMessage(), e);
    	} catch (DatasourceConnectException e) {
    		throw new SystemException(e.getMessage(), e);
		}

		return Integer.MIN_VALUE;
	}

	/**
	 * ����� ������� ������ �� sccounter � ����� "��� �������� �������"
	 *
	 * @param scCounterCode - ��� ������ � sccounter
	 */
	public void removeSCCounterForWorkOrderBytItem(int scCounterCode)
	{
    	if (scCounterCode == Integer.MIN_VALUE)
    	{
    		// throw new SystemException("\n\nSUPP-33009 �� ������� ��� ���������!");
    		return;
    	}
	    try
	    {
	    	ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);
			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.scCounterRef.code = scCounterCode;

			int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			// ���� �� ������� ��� ���� ������ � ������� ������� �������, �� �� ������� ���
			if (workOrderBytItemArr.length > 0)
			{
				return;
			}

			SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

			SCCounter scCounter = scCounterDAO.getObject(scCounterCode);

			if (scCounter == null)
	    	{
	    		throw new SystemException("\n\nSUPP-33009 �� �������� �������� � ����� " + scCounterCode + " !");
	    	}

			// �������� �� ������ ������ ��� ������ (kind)
			if (scCounter.kindRef.code != SCCounterKind.FOR_WORKORDERBYT)
	    	{
	    		throw new SystemException("\n\nSUPP-33009 ˳������� (sccounter) � ����� " + scCounterCode +
	    				" �� ����������� ��� (kind): " + scCounter.kindRef.code + " !");
	    	}

			scCounterDAO.remove(scCounterCode);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}


	/* ENServicesObject. ������� */
	public void removeServicesObject(int code) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject object = objectDAO.getObject(code);

			if (object.statusRef != null)
				if (object.statusRef.code == ENServicesObjectStatus.CLOSED) {
					throw new SystemException(
							"�������� ��� �������� �������� ����������!");
				}

			if (object.contractStatusRef != null)
				if (object.contractStatusRef.code == ENServicesContractStatus.SIGNED
						|| object.contractStatusRef.code == ENServicesContractStatus.PAID) {
					throw new SystemException(
							"�������� ������� ��� ������� �������� ����������!");
				}


			/**
			 *  NET-4406... 29.09.2014 +++ ����������� ��������� ������� ������������ �� ������....
			 *  ���� ������� ������ � ����������, ������ ������ �������� �� ���������� � ��������� �������� � DocFlow...
			 *
			 */

			if (updateDocMovementStatusByServicesConsumer(object.code, false)) {
				return;
			}



			/** 03.09.2020... +++ ������� ���� ���������� ���� ���� �����... */
			/** 15.04.2020... +++
			 *  ���� ������� �� ��������� �������������� ��������, ������� ��� �� ������ �� ������� ���������
			 */
			removeForCounters(code, true);



			// ������� �� ���� ������� ��� ����� ��������
			ENPlanWorkDAO planEstimateDAO = new ENPlanWorkDAO(connection, userProfile);

			ENPlanWorkFilter planEstimateFilter = new ENPlanWorkFilter();
			planEstimateFilter.elementRef.code = object.element.code;
			// planEstimateFilter.kind.code = ENPlanWorkKind.CALCULATION;
			// �� �������� ������� ���� �������� � ���� �������� ���������
			int[] planEstimateArr = planEstimateDAO.getFilteredCodeArray(planEstimateFilter, 0, -1);
			int codePlanEstimate = Integer.MIN_VALUE;
			ENPlanWork planEstimate;

			for (int i = 0; i < planEstimateArr.length; i++) {
				planEstimate = planEstimateDAO.getObject(planEstimateArr[i]);
				codePlanEstimate = planEstimate.code;

				if (planEstimate.status.code != ENPlanWorkStatus.GOOD) {
					throw new SystemException("\n\n" +
							"�������� ������� ���� ��������!");
				} else {

					// �������� �������� ����� ��� �������������� ��������� , � ������ ������ ��������� � ������ �������� ������������
					// �������� ������� �� ������� encalcmaterialsusage
                    ENCalcMaterialsUsageDAO matdao = new ENCalcMaterialsUsageDAO(connection, userProfile);

                    ENCalcMaterialsUsageFilter matFilter = new ENCalcMaterialsUsageFilter();
                    matFilter.planRef.code = codePlanEstimate;

					int imatArr[] = matdao.getFilteredCodeArray(matFilter, 0, -1);
					for (int imat = 0; imat < imatArr.length; imat++) {
						matdao.remove(imatArr[imat]);
					}

                    // �������� ������� �� ������� encalccontracttotal
                    ENCalcContractTotalDAO cctdao = new ENCalcContractTotalDAO(connection, userProfile);

                    ENCalcContractTotalFilter cctFilter = new ENCalcContractTotalFilter();
                    cctFilter.planRef.code = codePlanEstimate;

                    int icctArr[] = cctdao.getFilteredCodeArray(cctFilter, 0, -1);
                    for (int icct = 0; icct < icctArr.length; icct++) {
                        cctdao.remove(icctArr[icct]);
                    }

                    // ��������  ������� �� ������� encalctransportusagehr
                    ENCalcTransportUsageHourDAO tuhdao = new ENCalcTransportUsageHourDAO(connection, userProfile);

                    ENCalcTransportUsageHourFilter tuhFilter = new ENCalcTransportUsageHourFilter();
                    tuhFilter.planRef.code = codePlanEstimate;

                    int ituhArr[] = tuhdao.getFilteredCodeArray(tuhFilter, 0, -1);
                    for (int ituh = 0; ituh < ituhArr.length; ituh++) {
                        tuhdao.remove(ituhArr[ituh]);
                    }

                    // ��������  ������� �� ������� encalctotalcost
                    ENCalcTotalCostDAO costTotaldao = new ENCalcTotalCostDAO(connection, userProfile);

                    ENCalcTotalCostFilter costTotalFilter = new ENCalcTotalCostFilter();
                    costTotalFilter.planRef.code = codePlanEstimate;

                    int icosttArr[] = costTotaldao.getFilteredCodeArray(costTotalFilter, 0, -1);
                    for (int icostt = 0; icostt < icosttArr.length; icostt++) {
                        costTotaldao.remove(icosttArr[icostt]);
                    }

                    // ��������  ������� �� ������� encalccost
                    ENCalcCostDAO costdao = new ENCalcCostDAO(connection, userProfile);

                    ENCalcCostFilter costFilter = new ENCalcCostFilter();
                    costFilter.planRef.code = codePlanEstimate;

                    int icostArr[] = costdao.getFilteredCodeArray(costFilter, 0, -1);
                    for (int icost = 0; icost < icostArr.length; icost++) {
                        costdao.remove(icostArr[icost]);
                    }

                    // ��������  ������� �� ������� encalchumendelivery
                    ENCalcHumenDeliveryDAO hddao = new ENCalcHumenDeliveryDAO(connection, userProfile);

                    ENCalcHumenDeliveryFilter hdFilter = new ENCalcHumenDeliveryFilter();
                    hdFilter.planRef.code = codePlanEstimate;

                    int ihdArr[] = hddao.getFilteredCodeArray(hdFilter, 0, -1);
                    for (int ihd = 0; ihd < ihdArr.length; ihd++) {
                        hddao.remove(ihdArr[ihd]);
                    }

                    // ��������  ������� �� ������� encalchumensalary
                    ENCalcHumenSalaryDAO hdao = new ENCalcHumenSalaryDAO(connection, userProfile);

                    ENCalcHumenSalaryFilter hFilter = new ENCalcHumenSalaryFilter();
                    hFilter.planRef.code = codePlanEstimate;

                    int ihArr[] = hdao.getFilteredCodeArray(hFilter, 0, -1);
                    for (int ih = 0; ih < ihArr.length; ih++) {
                        hdao.remove(ihArr[ih]);
                    }

                    // �������� ������� �� ������� encalctransportusage
                    ENCalcTransportUsageDAO cTrdao = new ENCalcTransportUsageDAO(connection, userProfile);

                    ENCalcTransportUsageFilter cTrFilter = new ENCalcTransportUsageFilter();
                    cTrFilter.planRef.code = codePlanEstimate;

                    int itArr[] = cTrdao.getFilteredCodeArray(cTrFilter, 0, -1);
                    for (int it = 0; it < itArr.length; it++) {
                        cTrdao.remove(itArr[it]);
                    }

                    // �������� � ������ ����� � ������������
                    ENPlanWork2ClassificationTypeDAO p2cldao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);

                    ENPlanWork2ClassificationTypeFilter p2clFilter = new ENPlanWork2ClassificationTypeFilter();
                    p2clFilter.planRef.code = codePlanEstimate;

                    int p2clArr[] = p2cldao.getFilteredCodeArray(p2clFilter, 0, -1);
                    for (int ic = 0; ic < p2clArr.length; ic++) {

                    	ENCalcHumenSalaryDAO hsDao = new ENCalcHumenSalaryDAO(connection, userProfile);

                    	ENCalcHumenSalaryFilter hsFilter = new ENCalcHumenSalaryFilter();
                    	hsFilter.plan2CTypeRef.code = p2clArr[ic];

                    	int hsArr[] = hsDao.getFilteredCodeArray(hsFilter, 0, -1);
                    	for (int hs = 0; hs < hsArr.length; hs++) {
                    		hsDao.remove(hsArr[hs]);
                    	}

                    	/** ����� ���������, ������� ���������� � ������������� � �������� */
                    	ENGiveCounterDAO giveCounterDao = new ENGiveCounterDAO(connection, userProfile);
                    	ENGiveCounterFilter giveCounterFilter = new ENGiveCounterFilter();
                    	giveCounterFilter.plan2ClTypeRef.code = p2clArr[ic];

                    	int gcArr[] = giveCounterDao.getFilteredCodeArray(giveCounterFilter, 0, -1);
                    	for (int g = 0; g < gcArr.length; g++) {
                    		giveCounterDao.remove(gcArr[g]);
                    	}


                        p2cldao.remove(p2clArr[ic]);
                    }

                    PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
                    pl.deletePlan(codePlanEstimate);
				}
			}

			// �������� � ������� �� ������� ENTimeLine
			ENTimeLineDAO timeLineDao = new ENTimeLineDAO(connection, userProfile);

			ENTimeLineFilter timeLineFilter = new ENTimeLineFilter();
			timeLineFilter.servicesObjectRef.code = code;

			int timeLineArr[] = timeLineDao.getFilteredCodeArray(timeLineFilter, 0, -1);
			for (int tl = 0; tl < timeLineArr.length; tl++) {
				timeLineDao.remove(timeLineArr[tl]);
			}

			// �������� � ������� �� ������� ENServicesFactCalc
			ENServicesFactCalcDAO factCalcDao = new ENServicesFactCalcDAO(connection, userProfile);

			ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
			factCalcFilter.servicesObjectRef.code = code;

			int factCalcArr[] = factCalcDao.getFilteredCodeArray(factCalcFilter, 0, -1);
			for (int fc = 0; fc < factCalcArr.length; fc++) {
				factCalcDao.remove(factCalcArr[fc]);
			}


			/** ������ ���������� ������� - ����� */
			ENRentPeriod2ServicesDAO rentPeriodDao = new ENRentPeriod2ServicesDAO(connection, userProfile);
			ENRentPeriod2ServicesFilter rentPeriodFilter =  new ENRentPeriod2ServicesFilter();
			rentPeriodFilter.servicesObjectRef.code = code;

			int rentPeriodArr[] = rentPeriodDao.getFilteredCodeArray(rentPeriodFilter, 0, -1);
			for (int rp = 0; rp < rentPeriodArr.length; rp++) {
				rentPeriodDao.remove(rentPeriodArr[rp]);
			}

			/** ������ ����� ��� �������� (�������) */
			ENFamilySize2ServicesObjectDAO familyDao = new ENFamilySize2ServicesObjectDAO(connection, userProfile);
			ENFamilySize2ServicesObjectFilter familyFilter = new ENFamilySize2ServicesObjectFilter();
			familyFilter.servicesObjectRef.code = code;

			int familyArr[] = familyDao.getFilteredCodeArray(familyFilter, 0, -1);
			for (int f = 0; f < familyArr.length; f++) {
				familyDao.remove(familyArr[f]);
			}


			ENSOProj2SOConnDAO proj2connDAO = new ENSOProj2SOConnDAO(connection, userProfile);
			ENSOProj2SOConnFilter proj2connFilter = new ENSOProj2SOConnFilter();
			proj2connFilter.SOProjRef.code = code;
			int proj2connArr[] = proj2connDAO.getFilteredCodeArray(proj2connFilter, 0, -1);
			for (int prrr=0;prrr<proj2connArr.length;prrr++)
			{
				proj2connDAO.remove(proj2connArr[prrr]);
			}


			/** �������������� ������ � �������� */
			ENServices2CalcAdditionalItemsDAO calcAdditionalItemsDao = new ENServices2CalcAdditionalItemsDAO(connection, userProfile);
			ENServices2CalcAdditionalItemsFilter calcAdditionalItemsFilter = new ENServices2CalcAdditionalItemsFilter();
			calcAdditionalItemsFilter.servicesObjectRef.code = code;

			int caArr[] = calcAdditionalItemsDao.getFilteredCodeArray(calcAdditionalItemsFilter, 0, -1);
			for (int c = 0; c < caArr.length; c++) {
				calcAdditionalItemsDao.remove(caArr[c]);
			}

			/** �������� � �������� */
			ENDocAttachment2ENServicesObjectDAO attachment2enServicesObjectDao = new ENDocAttachment2ENServicesObjectDAO(connection, userProfile);
			ENDocAttachment2ENServicesObjectFilter attachment2enServicesObjectFilter = new ENDocAttachment2ENServicesObjectFilter();
			attachment2enServicesObjectFilter.servicesObjectRef.code = code;

			int attArr[] = attachment2enServicesObjectDao.getFilteredCodeArray(attachment2enServicesObjectFilter, 0, -1);
			for (int t = 0; t < attArr.length; t++) {
				attachment2enServicesObjectDao.remove(attArr[t]);
			}



			// ������ ������ ��������
			objectDAO.remove(code);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	/**
	 *  ���������� ��� ������������� (�����������/�� �����������) �� ���� ��������
	 *
	 *  @param soCode - ��� ��������
	 *  @return connectionKind - ��� �������������
	 */
	public int getConnectionKind(int soCode) {
		int connectionKind = Integer.MIN_VALUE;

		try {
			ENConnectionKindDAO ckDao = new ENConnectionKindDAO(connection, userProfile);

			ENConnectionKindFilter ckFilter = new ENConnectionKindFilter();
			ckFilter.conditionSQL = " code = (select k.code from enservicesobject2techcondtnsservices s2t, entechconditionsservcs ts, enconnectionkind k  "
					+ " where ts.code = s2t.techcondservrefcode and ts.connectionkindrefcode = k.code  "
					+ " and s2t.servicesobjectrefcode = " + soCode + ")";


			int ckArr[] = ckDao.getFilteredCodeArray(ckFilter, 0, -1);

			if (ckArr.length > 0) {

				connectionKind = ckArr[0];
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return connectionKind;
	}

	/**
	 *
	 * ���� �� � �������� ����������� � ������� �������� ������������ ������
	 *
	 * @param soCode ��� ��������
	 * @return true - ����, false - �����
	 * @throws PersistenceException
	 */
	public boolean isContainsKSU(int soCode) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isContainsKSUByServicesObjectCode(soCode);
	}

	/**
	 *
	 * ���� �� � �������� �����������, ��� ������� �������� ���� ������� �� ������ ���������
	 *
	 * @param soCode - ��� ��������
	 *
	 * @return true - ����, false - �����
	 * @throws PersistenceException
	 */
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isGiveCounterOnBalanceByServicesObjectCode(soCode);
	}

	/**
	 *
	 * ���� �� � �������� �����������, ��� ������� �������� ���� �������
	 *
	 * @param soCode - ��� ��������
	 * @param giveCounterType - ��� �������� �������� (�� ������/�� ��������)
	 *
	 * @return true - ����, false - �����
	 * @throws PersistenceException
	 */
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode, int giveCounterType) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isGiveCounterOnBalanceByServicesObjectCode(soCode, giveCounterType);
	}


	/**
	 *
	 * �������� ��������� ������� ��� ������������ ��������� �� ��������� �� ������ �����������
	 *
	 * @param so �������
	 * @throws PersistenceException
	 */
	public void makeIncomeFKOrdersForGivenCounters(ENServicesObject so) throws PersistenceException {

		if(so.contractDateServices == null) {
			throw new SystemException("�� ������ ���� ��� ��������!");
		}

		ENGiveCounterDAO counterDao = new ENGiveCounterDAO(connection, userProfile);
		RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(connection, userProfile);
		ENServicesObject2RQFKOrderDAO so2foDao = new ENServicesObject2RQFKOrderDAO(connection, userProfile);
		FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
		ENPlanWorkDAO planDao = new ENPlanWorkDAO(userProfile, connection);
		SCInvoiceDAO invoiceDao = new SCInvoiceDAO(connection, userProfile);
		SCOrderDAO orderDao = new SCOrderDAO(connection, userProfile);
		com.ksoe.rqorder.logic.SCLogic scLogic = new com.ksoe.rqorder.logic.SCLogic(connection, userProfile);
		ENPlanWork2ClassificationTypeDAO plan2ClassificationTypeDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
		TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);


		Hashtable<String, RQFKOrder> orders = new Hashtable<>();
		Hashtable<Integer, RQFKOrderItem> orderItems = new Hashtable<>();
		Hashtable<Integer, RQFKOrder> item2FKOrder = new Hashtable<>();
		/*���� ��������� ��� ������� �� ���� ����������� ������ */
		Vector<Integer> giveCounterCodesNotNeeded = new Vector<>();

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
		int codeFinalConsumer = settingsLogic.getIntValue(ENSettingsKeysConsts.RQORG_FINAL_CONSUMER_CODE, so.contractDateServices);
		
		/*SUPP-104499*/
		if(so.finDocID == Integer.MIN_VALUE) {
			throw new SystemException(String.format("\n\n��� �������� � %s �� %s �� ������� ������ � Գ������� ��������.\n��������� ������� �� ������� \"�������\" �� ������ ������!\n\n"
					, so.contractNumberServices, Tools.dateFormatDefault.format(so.contractDateServices)));
		}

		RQOrgDAO orgDao = new RQOrgDAO(connection, userProfile);

		RQOrg org = orgDao.getObject(codeFinalConsumer);

		String assetsIncomeAccount = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_ASSETS_INCOME, so.contractDateServices);
		String incomeKodIst = settingsLogic.getValue(ENSettingsKeysConsts.COUNTERS_KOD_IST_INCOME_FROM_CONSUMER, so.contractDateServices);
		String assetsIncomeKodIst = settingsLogic.getValue(ENSettingsKeysConsts.COUNTERS_KOD_IST_ASSETS_INCOME, so.contractDateServices);

		ENGiveCounterFilter counterFilter = new ENGiveCounterFilter();
		counterFilter.servicesObjectRef.code = so.code;

		ENGiveCounterShortList countersList = counterDao.getScrollableFilteredList(counterFilter, 0, -1);
		if(countersList.totalCount == 0) {
			throw new SystemException("�� �������� ��������� ��� ���������� ������������ ������");
		}

		for(ENGiveCounterShort shortCounter : countersList.getList()) {
			BigDecimal vat = (shortCounter.vat == null ? new BigDecimal(0) : shortCounter.vat);
			if(shortCounter.cost == null) {
				throw new SystemException(String.format("��� ��������� � ���������� ������� %s �� ������ �������", shortCounter.serialNumber));
			}
			if(shortCounter.molCode == null) {
				throw new SystemException(String.format("��� ��������� � ���������� ������� %s �� ������ ��� ��� ��������������", shortCounter.serialNumber));
			}

			/*��������, ��� �����������, � ������� �������� ������������ ������� �� �������� ������������ ��� ������ �������� ������� ���
			 * ������������ �� ������ (����� ��������� ���� �� �������� ���� ��������� ����������� � ������� ����������)*/
			if(shortCounter.plan2ClTypeRefCode != Integer.MIN_VALUE) {
				ENPlanWork2ClassificationType plan2ClassificationType = plan2ClassificationTypeDao.getObject(shortCounter.plan2ClTypeRefCode);
				TKClassificationType classificationType = classificationTypeDao.getObject(plan2ClassificationType.classificationTypeRef.code);
				if(classificationType.isGiveCounter != ENGiveCounter.IS_GIVE_TO_BALANCE) {
					giveCounterCodesNotNeeded.add(shortCounter.code);
					continue;
				}

			}

			RQFKOrder fkOrderObject = null;
			if(!orders.contains(shortCounter.molCode)) {
				fkOrderObject = new RQFKOrder();
				fkOrderObject.code = Integer.MIN_VALUE;
				fkOrderObject.numberDoc = so.contractNumberServices;
				fkOrderObject.dateGen = so.contractDateServices;
				fkOrderObject.userGen = userProfile.userName;
				fkOrderObject.domain_info = userProfile.domainInfo.domain;
				fkOrderObject.kind.code = RQFKOrderKind.PRIHOD_POSTAVKA;
				fkOrderObject.status.code = RQFKOrderStatus.GOOD;
				fkOrderObject.molOutCode = shortCounter.molCode;
				fkOrderObject.molOutName = shortCounter.molName;
				fkOrderObject.department.code = so.department.code;
				fkOrderObject.datePosting = so.contractDateServices;
				fkOrderObject.sumWithoutNds = shortCounter.cost;
				fkOrderObject.sumNds = vat;
				fkOrderObject.accountingTypeRef.code = TKAccountingType.COUNTERS;
				fkOrderObject.org = org;
				fkOrderObject.ndsPercent = 0;
				fkOrderObject.code = fkOrderLogic.createRQFKOrder(fkOrderObject);
				/*������*/
				ENServicesObject2RQFKOrder so2fo = new ENServicesObject2RQFKOrder();
				so2fo.servicesObjectRef.code = so.code;
				so2fo.fkOrderRef.code = fkOrderObject.code;
				so2foDao.add(so2fo);

				orders.put(shortCounter.molCode, fkOrderObject);

			} else {
				fkOrderObject = orders.get(shortCounter.molCode);
				fkOrderObject.sumWithoutNds = fkOrderObject.sumWithoutNds.add(shortCounter.cost);
				fkOrderObject.sumNds = fkOrderObject.sumNds.add(vat);
				fkOrderDao.save(fkOrderObject);
				orders.put(shortCounter.molCode, fkOrderObject);

			}
		}

		for(ENGiveCounterShort shortCounter : countersList.getList()) {
			if(giveCounterCodesNotNeeded.contains(shortCounter.code)) {
				continue;
			}
			RQFKOrder order = orders.get(shortCounter.molCode);
			ENGiveCounter counter = counterDao.getObject(shortCounter.code);
			RQFKOrderItem item = this.addGiveCounterToIncomeFKOrder(so, order, counter);
			orderItems.put(counter.code, item);
			item2FKOrder.put(item.code, order);
		}

		Enumeration<RQFKOrderItem> enumOrderItems = orderItems.elements();
		while(enumOrderItems.hasMoreElements()) {
			RQFKOrderItem item = enumOrderItems.nextElement();
			RQFKOrder fkOrder = item2FKOrder.get(item.code);
			String kodIst = incomeKodIst;
			if(item.nomenclatureBalSch.equals(assetsIncomeAccount)) {
				kodIst = assetsIncomeKodIst;
			}
			scLogic.makeSCInvoiceFromPrihodFKOrderItem(fkOrder, item, item.nomenclatureBalSch, kodIst);
		}

		// ����������� ������������� (��������) �� ����� �� ����������
		ENPlanWork plan = planDao.getObjectNOSEGR(0);
		int departmentCodeOld = plan.departmentRef.code;
		plan.departmentRef.code = ENConsts.ENDEPARTMENT_METROLOGY;
		planDao.save(plan);

		RQFKOrderController fkOrderController = null;
		try {
			Context context = new InitialContext();
			Object objRef = context.lookup(RQFKOrderController.JNDI_NAME);
			RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject.narrow(objRef, RQFKOrderControllerHome.class);
			fkOrderController = fkOrderHome.create();
		} catch(Exception exc) {
			throw new SystemException(exc);
		}



		Enumeration<RQFKOrder> enumOrders = orders.elements();
		while(enumOrders.hasMoreElements()) {
			RQFKOrder fkOrder = enumOrders.nextElement();

			try {
				fkOrderController.createdPrihod(fkOrder.code);
			} catch (RemoteException e) {
				throw new SystemException(e);
			}
		}

		plan.departmentRef.code = departmentCodeOld;
		planDao.save(plan);

		// ������ ���������� �������� ��������� ����������� ���������
		for(ENGiveCounterShort shortCounter : countersList.getList()) {
			if(giveCounterCodesNotNeeded.contains(shortCounter.code)) {
				continue;
			}
			RQFKOrderItem fkOrderItem = orderItems.get(shortCounter.code);
			int[] invoiceCodes = invoiceDao.getCodesByFKOrderItem(fkOrderItem);
			if(invoiceCodes.length != 1) {
				throw new SystemException(String.format("������� � ������� ��������� ����˳�������� ��� ������ %s: %d", fkOrderItem.nomenclatureName, invoiceCodes.length));
			}
			SCInvoice invoice = invoiceDao.getObject(invoiceCodes[0]);
			int[] scOrderCodes = orderDao.getCodesBySCInvoice(invoice);
			if(scOrderCodes.length != 1) {
				throw new SystemException(String.format("������� � ������� ���������� ����˳�������� ��� ������ %s: %d", fkOrderItem.nomenclatureName, scOrderCodes.length));
			}

			SCOrder scOrder = orderDao.getObject(scOrderCodes[0]);
			int scOrderSCCode = scOrder.scCode;

			if(shortCounter.dateBuild == null) {
				throw new SystemException(String.format("��� ��������� �� ������� ������� %s �� ������� ���� �����������", shortCounter.serialNumber));
			}

			Calendar cal = Calendar.getInstance();
			cal.setTime(shortCounter.dateBuild);
			int year = cal.get(Calendar.YEAR);
			scLogic.addDraftCounterToRQFKOrder(scOrderSCCode, year, shortCounter.serialNumber, shortCounter.counterType);
		}
	}

	private void recalculateSumForFKOrderItem(RQFKOrderItem item) {
		item.sumWithoutNds = item.priceWithoutNds.multiply(item.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
		item.sumNds = item.priceNds.multiply(item.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
		item.sumGen = item.priceWithNds.multiply(item.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
	}
	private void recalculateWeightForFKOrderItem(RQFKOrderItem item) {
		item.weight = item.countGen.multiply((item.material.weight == null ? new BigDecimal(0) : item.material.weight)).setScale(6, BigDecimal.ROUND_HALF_UP);
	}

	private RQFKOrderItem addGiveCounterToIncomeFKOrder(ENServicesObject so, RQFKOrder fkOrder, ENGiveCounter counter) throws PersistenceException {
		RQFKOrderItemDAO fkOrderItemDao = new RQFKOrderItemDAO(connection, userProfile);
		RQFKOrderItem2ENEstimateItemDAO oiesDao = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
		TKMaterialsDAO matDao = new TKMaterialsDAO(connection, userProfile);
		ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		ENEstimateItem estimate = null;

		if(counter.phasity == 1) {
			estimate = estimateDao.getObject(ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1);
		} else if(counter.phasity == 3) {
			estimate = estimateDao.getObject(ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3);
		} else {
			throw new SystemException(String.format("������� ������� ��� ��������� � ������� ������� %s", counter.serialNumber));
		}

		/*������� ����������� ��������*/
		BigDecimal assetsMinimalPrice = settingsLogic.getBigDecimalValue(ENSettingsKeysConsts.ASSETS_MINIMAL_COST
				, fkOrder.dateGen).setScale(2, BigDecimal.ROUND_HALF_UP);
		String accountForAssetsIncome = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_ASSETS_INCOME, fkOrder.dateGen);
		String accountCustomerIncome = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_COUNTERS_INCOME_FROM_CUSTOMERS, fkOrder.dateGen);

		TKMaterials material = matDao.getObject(estimate.materialRef.code);


		RQFKOrderItemFilter fkOrderItemFilter = new RQFKOrderItemFilter();
		fkOrderItemFilter.fkOrderRef.code = fkOrder.code;
		fkOrderItemFilter.nomenclatureName = counter.counterType;
		fkOrderItemFilter.priceWithoutNds = counter.cost;
		fkOrderItemFilter.priceNds = (counter.vat == null ? new BigDecimal(0) : counter.vat);
		fkOrderItemFilter.priceWithNds = counter.cost.add((counter.vat == null ? new BigDecimal(0) : counter.vat));
		int[] fkOrderItemCodes = fkOrderItemDao.getFilteredCodeArray(fkOrderItemFilter, 0, -1);

		RQFKOrderItem item = null;

		if(fkOrderItemCodes.length > 1) {
			throw new SystemException(String.format("������� � ������� ����� ������������ ������ %d", fkOrderItemCodes.length));
		} else {
			if(fkOrderItemCodes.length == 1) {
				item = fkOrderItemDao.getObject(fkOrderItemCodes[0]);
				item.countGen = item.countGen.add(new BigDecimal(1));
				recalculateSumForFKOrderItem(item);
				recalculateWeightForFKOrderItem(item);
				fkOrderItemDao.save(item);
			} else {
				item = new RQFKOrderItem();
				item.code = Integer.MIN_VALUE;
				item.finCode = Integer.MIN_VALUE;
				item.nomenclatureCode = Integer.MIN_VALUE;
				item.nomenclatureNum = "��� ������������";
				/* SUPP-66105 ������������ ���� ���� ��������� �������� ������ ��� ����� ����������� ���������
				 * ��������� ��������, �� ����������� �� ���� ������� �������� �������, � ���� ������, �� �� ����
				 * ������� ��������� �� ������������ */
				if(counter.cost.compareTo(assetsMinimalPrice) >= 0) {
					item.nomenclatureBalSch = accountForAssetsIncome;
				} else {
					item.nomenclatureBalSch = accountCustomerIncome;
				}

				item.nomenclatureName = counter.counterType;
				item.nomenclatureUnitCode = 796;
				item.nomenclatureUnitName = "��";
				item.contractNumber = so.contractNumber;
				item.contractDate = so.contractDate;
				item.finDocCode = so.finDocCode;
				item.finDocID = so.finDocID;
				item.materialNameTxt = null;
				item.measurementNameTxt = null;
				item.countGen = new BigDecimal(1);
				item.priceWithoutNds = counter.cost;
				item.priceNds = (counter.vat == null ? new BigDecimal(0) : counter.vat);
				item.priceWithNds = counter.cost.add((counter.vat == null ? new BigDecimal(0) : counter.vat));
				item.fkOrderRef.code = fkOrder.code;
				item.fundingType = 1;
				item.material = material;
				recalculateSumForFKOrderItem(item);
				recalculateWeightForFKOrderItem(item);
				item.code = fkOrderItemDao.add(item);
			}

			RQFKOrderItem2ENEstimateItem oies = new RQFKOrderItem2ENEstimateItem();
			oies.countGen = new BigDecimal(1);
			oies.sumWithoutNds = counter.cost;
			oies.fkOrderItemRef.code = item.code;
			oies.estimateItem.code = estimate.code;
			oies.statusRef.code = RQFKOrderItem2EstimateItemStatus.IN_INVOICE;
			oiesDao.add(oies);
		}

		return item;
	}

	/**
	 *
	 * �������� ��������� ������� � ���������� �������� ��������� � ���������
	 *
	 * @param so
	 *            ������� ����� �� �������
	 * @throws PersistenceException
	 */
	public void undoMakeIncomeFKOrdersForGivenCounters(ENServicesObject so) throws PersistenceException {
		ENServicesObject2RQFKOrderDAO so2foDao = new ENServicesObject2RQFKOrderDAO(connection, userProfile);
		FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
		RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(connection, userProfile);
		ENServicesObject2RQFKOrderShortList list = so2foDao.getENServicesObject2RQFKOrderShortListByServicesObject(so);
		for (ENServicesObject2RQFKOrderShort shortSofo : list.getList()) {
			RQFKOrder fkOrder = fkOrderDao.getObject(shortSofo.fkOrderRefCode);
			so2foDao.remove(shortSofo.code);
			fkOrderLogic.removeCreatedPrihodWithStrings(fkOrder, true);
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
			if(element2element == null || element2element.elementInRef.code == Integer.MIN_VALUE) {
				throw new SystemException("��'��� ������");
			}

			ENElement2ENElementDAO dao = new ENElement2ENElementDAO(connection, userProfile);
			if(element2element.code != Integer.MIN_VALUE) {
				/*���� ����� ������� ������ ��� ������ �� ��������� ������ ���� �� ������ � ���� ��,
				 * ������������ � ������*/
				int[] types = new int[4];
				types[0] = ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU;
				types[1] = ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU;
				types[2] = ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU;
				types[3] = ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU;
				dao.checkType(element2element, types, true);
				dao.remove(element2element.code);
				element2element.code = Integer.MIN_VALUE;
			}

			/*�������� ������ ���������� �� �������� - ������ ���� 0, ���� ������ �� ������*/
			ENElement2ENElementFilter filter = new ENElement2ENElementFilter();
			filter.elementInRef.code = element2element.elementInRef.code;

		    filter.conditionSQL = " enelement2enelement.typerefcode in (" + ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU + ")";

			long count = dao.count(filter);
			if(count > 0) {
				throw new SystemException(String.format("������� � ������� ��� �������� "));
			}

			ENServicesObject servicesObjectIn = this.getServicesObjectByElementCode(element2element.elementInRef.code);

			if(servicesObjectIn == null) {
				throw new SystemException(String.format("�� �������� ��'��� ������ �� ������� ��� ��������  � ����� %d", element2element.elementInRef.code));
			}

			/*���� �� ����� out, �� ��� ����� ����������� ��� �������� ������ */
			if(element2element.elementOutRef.code == Integer.MIN_VALUE) {
				return;
			}

			ENServicesObject servicesObjectOut = this.getServicesObjectByElementCode(element2element.elementOutRef.code);
			if(servicesObjectOut == null) {
				throw new SystemException(String.format("�� �������� ��'��� ������ �� ������� ��� ��������  � ����� %d", element2element.elementOutRef.code));
			}


			element2element.typeRef.code = Integer.MIN_VALUE;

			/*������ �������� ������ ������� - ��*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_ACCESS
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU;
			}

			/*������ �������� ������ ���������� - ��*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_AGREE
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU;
			}

			/*������ �������� ������ ������������ - ��*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_WORK
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU;
			}

			/*������ �������� ������ �������� ��� �� �� - ��*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_TU_MODIFY
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU;
			}

			if(element2element.typeRef.code == Integer.MIN_VALUE) {
				ENServicesContractKindDAO kindDao = new ENServicesContractKindDAO(connection, userProfile);
				ENServicesContractKind inKind = kindDao.getObject(servicesObjectIn.contractKindRef.code);
				ENServicesContractKind outKind = kindDao.getObject(servicesObjectOut.contractKindRef.code);
				throw new SystemException(String.format("��������� ��������� ��� �''����� ��� �������� ���� \"%s\" �� \"%s\""
						, inKind.name, outKind.name));
			}

			dao.add(element2element);

		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {

		}
	}

	public void cancelRereservedCounters(int code) {

		cancelRereservedCounters(code, false);

	}

	/**
	 *
	 * ������������ ������� "���������" ���� ������������������� ��������� ��� �������
	 *
	 * @param code ��� �������� @link ENServicesObject}
	 * @param isCancel - ���� = true, �� ��� ������ ��������� �, ���� �������� �� �������, �� �������� �� ������
	 *
	 * @throws PersistenceException
	 */
	public void cancelRereservedCounters(int code, boolean isCancel) {
		try {
			ENServicesObjectDAO dao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject obj = dao.getObject(code);
			this.cancelRereservedCounters(obj, isCancel);
		} catch(PersistenceException e) {
			throw new SystemException(e);
		}
	}

	public void cancelRereservedCounters(ENServicesObject so) throws PersistenceException {

		cancelRereservedCounters(so, false);

	}

	/**
	 *
	 * ������������ ������� "���������" ���� ������������������� ��������� ��� �������
	 *
	 * @param so ������� {@link ENServicesObject}
	 * @param isCancel - ���� = true, �� ��� ������ ��������� �, ���� �������� �� �������, �� �������� �� ������
	 *
	 * @throws PersistenceException
	 */
	public void cancelRereservedCounters(ENServicesObject so, boolean isCancel) throws PersistenceException {
		SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
		SCCounterShortList list = this.getAllRereservedCountersForServices(so, isCancel);
		for(SCCounterShort counterShort : list.list) {
			SCCounter counter = counterDao.getObject(counterShort.code);
			counter.statusRef.code = SCCounterStatus.CANCELED;
			counterDao.save(counter);
		}
	}

	public SCCounterShortList getAllRereservedCountersForServices(ENServicesObject so) throws PersistenceException {

		return getAllRereservedCountersForServices(so, false);

	}

	/**
	 *
	 * ��� ������������������� �������� ��� �������
	 *
	 * @param so ������� {@link ENServicesObject}
	 * @param isCancel - ���� = true, �� ��� ������ ��������� �, ���� �������� �� �������, �� �������� �� ������
	 *
	 * @return {@link SCCounterShortList} ������ ������������������� ���������
	 *
	 * @throws PersistenceException
	 */
	public SCCounterShortList getAllRereservedCountersForServices(ENServicesObject so, boolean isCancel) throws PersistenceException {
		SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
		int codeCounterEstimateByCalculationPlan = this.getENEstimateItemCodeCounterByServicesObjectAndKindPlan(so.element.code, ENPlanWorkKind.CALCULATION, isCancel);
		if(codeCounterEstimateByCalculationPlan != Integer.MIN_VALUE) {
			SCCounterFilter counterFilter = new SCCounterFilter();
	    	counterFilter.statusRef.code = SCCounterStatus.GOOD;
	    	counterFilter.kindRef.code = SCCounterKind.FOR_SERVICES_RERESERVING;
	    	counterFilter.estimateItemRef.code = codeCounterEstimateByCalculationPlan;
	    	return counterDao.getScrollableFilteredList(counterFilter, 0, -1);
		} else {
			SCCounterShortList list = new SCCounterShortList();
			list.totalCount = 0;
			list.list = new Vector<>();
			return list;
		}
	}



    /**
     *  ��� ������� ����� �������� � ���������� ����������� �������������� ������ �� ��������...
     *
     *  @param soCode - ��� ��������
     *
     */
	public void setServicesConsumerInfo(int soCode) {
		try {
			docFlowConnection = getDocFlowConnection();

			DFDoc2ENServicesObjectDAO doc2soDao = new DFDoc2ENServicesObjectDAO(docFlowConnection, userProfile);
			DFDoc2ENServicesObjectFilter doc2soFilter = new DFDoc2ENServicesObjectFilter();
			doc2soFilter.servicesObjectCode = soCode;

			/** ���� ���� ����� ��������� � ��������� �� ������ */
			int doc2soArr[] = doc2soDao.getFilteredCodeArray(doc2soFilter, 0, -1);
			if (doc2soArr.length > 0) {

				ServicesConsumerInfo info = getServicesConsumerInfo(soCode);

				if (info != null) {
					DFDoc2ENServicesObject doc2so = doc2soDao.getObject(doc2soArr[0]);

					doc2so.contragentaddress = info.contragentaddress;
					doc2so.contractnumberservices = info.contractnumberservices;
					doc2so.contractdateservices = info.contractdateservices;
					doc2so.classificationnumber = info.classificationnumber;
					doc2so.classificationname = info.classificationname;
					doc2so.paySum = info.paySum;
					doc2so.executeworkdate = info.executeworkdate;
					doc2so.statusname = info.statusname;


					doc2soDao.save(doc2so);
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	public ServicesConsumerInfo getServicesConsumerInfo(int soCode)
            throws PersistenceException, DatasourceConnectException {

        PreparedStatement statement = null;
        ServicesConsumerInfo info = null;

        try {
            String selectStr = "select coalesce(s.contragentaddress,'---') as contragentaddress, s.contractnumberservices, s.contractdateservices, "
            		+ " ct.kod as classificationnumber, ct.name as classificationname, "
            		+ " (select sum(ps.sumtotal) from enpayment2so ps where ps.servicesobjectrefcode = s.code) as paysum, "
            		+ " s.executeworkdate, t.name as statusname "
            		+ " from enservicesobject s, enplanwork2classfctntp cl, enplanwork pl, tkclassificationtype ct, enservicescontractstts t "
            		+ " where s.contractstatusrefcode = t.code "
            		+ " and ct.code = cl.classificationtyperfcd "
            		+ " and pl.elementrefcode = s.elementcode "
            		+ " and pl.code = cl.planrefcode "
            		+ " and pl.kindcode = " + ENPlanWorkKind.CALCULATION
            		+ " and s.code = " + soCode;

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                info = new ServicesConsumerInfo();

				info.contragentaddress = resultSet.getString(1);
				info.contractnumberservices = resultSet.getString(2);
				info.contractdateservices = resultSet.getDate(3);
				info.classificationnumber = resultSet.getString(4);
				info.classificationname = resultSet.getString(5);
				info.paySum = resultSet.getBigDecimal(6);
				info.executeworkdate = resultSet.getDate(7);
				info.statusname = resultSet.getString(8);

            }

            resultSet.close();

            return info;

        } catch (SQLException e) {
            throw new PersistenceException("Can't get getServicesConsumerInfo", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }


	public class ServicesConsumerInfo {
		public String contragentaddress;
		public String contractnumberservices;
		public Date contractdateservices;
		public String classificationnumber;
		public String classificationname;
		public BigDecimal paySum;
		public Date executeworkdate;
		public String statusname;
	}



	public ENServicesObject getSOByElementCode(int elementCode)
			throws PersistenceException {

		if (elementCode == Integer.MIN_VALUE) {
			throw new SystemException("ElementCode is NULL!!!");
		}

		ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObjectFilter f = new ENServicesObjectFilter();
		f.element.code = elementCode;

		int[] arr = objDAO.getFilteredCodeArray(f, 0, -1);
		if (arr.length != 1) {
			throw new SystemException(
					"Element count != 1 (ENServicesObject)");
		}

		return objDAO.getObject(arr[0]);
	}



	/**
	 * 	�������� �������������� ����� � ������ ��� ��������� ������� �� ���������� ���...
	 *
	 *  @param elementCode
	 *  @return isServicesProject
	 */
	public boolean checkServicesProject(int elementCode) {

		boolean isServicesProject = false;
		try {
			ENPlanWorkDAO enPlanWorkDao = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkFilter plWorkFilter = new ENPlanWorkFilter();

			plWorkFilter.conditionSQL = "enplanwork.code in (select pl.code "
					+ " from entechagrmnt2srvcsbjct ts, enservicesfromsidebjct sfs, enplanwork pl "
					+ " where ts.servicesfromsiderefcod = sfs.code "
					+ " and ts.techagrkindrefcode = " + ENTechAgr2SOKind.ENTECHAGRKIND_PKD
					+ " and (sfs.elementcode = pl.elementrefcode or pl.servicesfsidefinid = ts.findocid) "
					+ " and pl.elementrefcode = " + elementCode + ")";

			int plArr[] = enPlanWorkDao.getFilteredCodeArray(plWorkFilter, 0, -1);

			if (plArr.length > 0) {
				isServicesProject = true;
			}

			return isServicesProject;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 * 	���������� ��������� �� �������� ������� �� ���������� ���...
	 *
	 * 	@param agreement2soCode - ��� ������ ��������
	 */
	public void recalcServicesProject(int agreement2soCode) {
		try {
			BigDecimal agreementCost = new BigDecimal(0);

			ENTechAgreement2ServicesObjectDAO agreement2soDao = new ENTechAgreement2ServicesObjectDAO(connection, userProfile);
			ENEstimateItemDAO estimateItemDao = new ENEstimateItemDAO(connection, userProfile);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL = " enestimateitem.code in ( "
					+ " select ei.code from enestimateitem ei, enplanwork pl "
					+ " where pl.code = ei.planrefcode "
					+ " and pl.code in (select distinct pl.code "
					+ "   from entechagrmnt2srvcsbjct ts, enservicesfromsidebjct sfs, enplanwork pl "
					+ "  where ts.servicesfromsiderefcod = sfs.code "
					+ "    and ts.techagrkindrefcode = " + ENTechAgr2SOKind.ENTECHAGRKIND_PKD
					+ "    and (sfs.elementcode = pl.elementrefcode or pl.servicesfsidefinid = ts.findocid) "
					+ "    and ts.code = " + agreement2soCode + " ) "
					+ " and pl.kindcode = " + ENPlanWorkKind.CURRENT
					+ " and ei.kindrefcode = " + ENEstimateItemKind.SERVICES  + " ) ";

			int estArr[] = estimateItemDao.getFilteredCodeArray(estimateItemFilter, 0, -1);
			for (int e = 0; e < estArr.length; e++) {
				ENEstimateItem estimateItem = estimateItemDao.getObject(estArr[e]);
				agreementCost = agreementCost.add(estimateItem.cost);
			}

			ENTechAgreement2ServicesObjectFilter agreement2soFilter = new ENTechAgreement2ServicesObjectFilter();
			agreement2soFilter.code = agreement2soCode;

			int agreement2soArr[] = agreement2soDao.getFilteredCodeArray(agreement2soFilter, 0, -1);
			if (agreement2soArr.length > 0) {
				ENTechAgreement2ServicesObject agreement2so = agreement2soDao.getObject(agreement2soArr[0]);
				agreement2so.costWorks = agreementCost;
				agreement2soDao.save(agreement2so);
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * 	���������� ��� ������ �������� ������� �� ���������� ���...
	 *
	 *	@param elementCode - ��� �������� �����
	 * 	@return agreement2soCode - ��� ������ ��������
	 */
	public int getAgreement2soCode(int elementCode) {

		int agreement2soCode = Integer.MIN_VALUE;

		try {
			ENTechAgreement2ServicesObjectDAO techAgreement2soDao = new ENTechAgreement2ServicesObjectDAO(connection, userProfile);
			ENTechAgreement2ServicesObjectFilter techAgreement2soFilter = new ENTechAgreement2ServicesObjectFilter();

			techAgreement2soFilter.conditionSQL = "code in (select ts.code "
					+ " from entechagrmnt2srvcsbjct ts, enservicesfromsidebjct sfs, enplanwork pl "
					+ " where ts.servicesfromsiderefcod = sfs.code "
					+ " and ts.techagrkindrefcode = " + ENTechAgr2SOKind.ENTECHAGRKIND_PKD
					+ " and (sfs.elementcode = pl.elementrefcode or pl.servicesfsidefinid = ts.findocid) "
					+ " and pl.elementrefcode = " + elementCode + ")";

			int tsArr[] = techAgreement2soDao.getFilteredCodeArray(techAgreement2soFilter, 0, -1);

			if (tsArr.length > 0) {
				agreement2soCode = tsArr[0];
			}

			return agreement2soCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

/* ������ ��������� ���� ���������� ����� �� ������
 *
 * */
public void calculationBoundaryDateWork(ENServicesObject soObj) {
		try {
			PlanWorkLogic plLogic = new PlanWorkLogic(connection, userProfile);
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);

			docFlowConnection = getDocFlowConnection();

            DFPackDAO dfpDAO = new DFPackDAO(docFlowConnection, userProfile);
            DFServicesListDAO dfSListDAO = new DFServicesListDAO(docFlowConnection, userProfile);

            DFPack dfpObj = dfpDAO.getObject(soObj.dfPackCode);
            if (dfpObj == null ){ return;}
            DFServicesList dfSListObj = dfSListDAO.getObject(dfpObj.servicesListRef.code);
            if (dfSListObj == null ){ return;}
            soObj.term = dfSListObj.term;  /// ����������� ���������� ���� ����������(���)
            soObj.regulation = dfSListObj.regulation; // ��������� �����: 0 ��� Null - ������� ���, 1 - �����������

            if (soObj.term==Integer.MIN_VALUE){
             	throw new SystemException(" �� ������� ����� ��������� ������� (������������ -> �������� -> ������� ������(S) ) " + dfSListObj.snum + " " + dfSListObj.name  );
            }


            /* +1 �.�  �������� ������� ��������� ���� �� ��������� ��� */
            if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ){
            	//soObj.boundaryDateWork =  plLogic.getDateOnworkingDay( dfpObj.dateRegistration , soObj.term+1 ); // 	��������� ���� ���������� ����� ����������� �� ������� ����
            	//int calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(Tools.addDays(dfpObj.dateRegistration, 1)  , Tools.addDays(dfpObj.dateRegistration, soObj.term) );
  			    //int workDaysCount = dfLogic.getWorkDaysBetweenDates(Tools.addDays(dfpObj.dateRegistration, 1) , Tools.addDays(dfpObj.dateRegistration, soObj.term) );
  			    //int weekendDaysCount = soObj.term- workDaysCount;
  			    //soObj.boundaryDateWork  = Tools.addDays(dfpObj.dateRegistration, (soObj.term + weekendDaysCount));
            	//---
            	soObj.boundaryDateWork = plLogic.getDateOnworkingDay(dfpObj.dateRegistration, soObj.term+1);


            } else {
            	soObj.boundaryDateWork =  Tools.addDays(dfpObj.dateRegistration, soObj.term );  // 	��������� ���� ���������� ����� ����������� �� ����������� ����
            }

            soObj.countDayDelay = 0;
            soDAO.save(soObj);


		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


/* ������ ��������� ���� ���������� ����� �� ������ ��� ��������/�������� �������� �� ���� ���������
 *
 * */
public void calculationBoundaryDateWorkAtDelaysNETO(ENServicesObject soObj  ) {
		try {
			PlanWorkLogic plLogic = new PlanWorkLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

			docFlowConnection = getDocFlowConnection();

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			ENDelayServicesDAO delayDAO = new ENDelayServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

            if (soObj.term==Integer.MIN_VALUE){
            	throw new SystemException(" �� ��������� ����� ��������� �������!!! ");
            }
            if (soObj.boundaryDateWork == null ){
            	throw new SystemException(" �� ��������� �������� ���� ��������� ���� �� �������� !!!)");
            }

            ENDelayServicesFilter delayFil = new ENDelayServicesFilter();
            delayFil.servicesObjectRef.code = soObj.code;
            delayFil.orderBySQL = " ENDelayServices.datestart ";

            ENDelayServicesShortList delayList = delayDAO.getScrollableFilteredList(delayFil, 0, -1);

            calculationBoundaryDateWork(soObj); // 1. �������� ��������� ����

            // 2. ���� �������� ���, �� �����
            if (delayList.totalCount==0){
            	return;
            }



            Date newBoundaryDateWork = soObj.boundaryDateWork; // ��������������� ��������� ����
            int sumDayDelayCount = 0;

            // 3. ���� �������� ����
            for (int i = 0; i < delayList.totalCount ; i++) {

        	// ���� ��������� ���� � �������� dateStart � dateFinal -- ��������� ���� = dateFinal + ���-�� ���� �����(dateFinal � dateStart)
        	// if (  newBoundaryDateWork.compareTo(delayList.get(i).dateStart) >= 0 && newBoundaryDateWork.compareTo(delayList.get(i).dateFinal) <= 0 	){
            	if (  delayList.get(i).dateStart.compareTo(newBoundaryDateWork) <= 0 ){

        		 /* newBoundaryDateWork = Tools.addDays(soObj.boundaryDateWork,
        				                                ( (int) ( Tools.getDaysDiff( delayList.get(i).dateStart , delayList.get(i).dateFinal  , TimeUnit.DAYS  )+1) )
        				                              );*/
        		  // �������� ����������� ���� �������� ��� ���
        		  // newBoundaryDateWork = plLogic.getDateOnworkingDay( newBoundaryDateWork , 0 );


      			/*int workDaysCount = dfLogic.getWorkDaysBetweenDates(newBoundaryDateWork, newBoundaryDateWork);
      			if (workDaysCount==0){
	      			boolean isWorkDay = false;
		      			while (!isWorkDay) {
		      				 newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, 1);
		      				 workDaysCount = dfLogic.getWorkDaysBetweenDates(newBoundaryDateWork, newBoundaryDateWork);
		      				 if (workDaysCount>0){
		      					 isWorkDay=true;
		      				 }
						}
            	}*/
        		  // ���� ���� ���������� ���������� � ������� ����, �� � ���������� ������ ���� � ������� ������� ��������� ���-�� �������� ����
        		  // � ������� �������� � ������������ ��� ������� � ��������� ���� ���������� �����
        		  if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ){
        			  // int calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(delayList.get(i).dateStart , delayList.get(i).dateFinal);
        			  // int workDaysCount = dfLogic.getWorkDaysBetweenDates(delayList.get(i).dateStart , delayList.get(i).dateFinal);
        			  //int weekendDaysCount = delayList.get(i).calendarDaysCount - delayList.get(i).workDaysCount;
        			  // ��������� ���� ���������� ����� � ������ ��� ����
        			  //newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, (delayList.get(i).calendarDaysCount + weekendDaysCount));


        			  sumDayDelayCount = sumDayDelayCount +  delayList.get(i).workDaysCount; // ���-�� ���� �������� � ������� ����
        			  newBoundaryDateWork  = plLogic.getDateOnworkingDay(newBoundaryDateWork, delayList.get(i).calendarDaysCount + 1);
        		  }
        		  // ���� ���� ���������� ���������� � ����������� ���� �� � ��������� ���� ���������� ���-�� ���� ��������
        		  else if( soObj.regulation == 1 ){

        			  newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, delayList.get(i).calendarDaysCount);
        			  sumDayDelayCount = sumDayDelayCount +  delayList.get(i).calendarDaysCount; // ���-�� ���� �������� � ����������� ����
        		  }



            	}
            	else {
            		throw new SystemException("\n\n NET-4560 ���������� ������� ������ � �������� ����� ��������� ���� ���������� ����� �� ������ !");
            	}


			}

        	ENServicesObject ssObj = soDAO.getObjectNoSegr(soObj.code);
        	ssObj.countDayDelay = sumDayDelayCount;
        	ssObj.boundaryDateWork = newBoundaryDateWork;
        	soDAO.save(ssObj);



		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}

/* ������ ��������� ���� ���������� ����� �� ������ ��� ��������/�������� �������� �� ���� ���������
 *
 * */
public void calculationBoundaryDateWorkAtDelays(ENServicesObject soObj) {
	try {
 		PlanWorkLogic plLogic = new PlanWorkLogic(connection, userProfile);

		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
		ENDelayServicesDAO delayDAO = new ENDelayServicesDAO(connection, userProfile);


       // DFPackDAO dfpDAO = new DFPackDAO(docFlowConnection, userProfile);
       // DFServicesListDAO dfSListDAO = new DFServicesListDAO(docFlowConnection, userProfile);

        if (soObj.term==Integer.MIN_VALUE){
         /*return; */	throw new SystemException(" �� ��������� ����� ��������� �������!!! soObj = " + soObj.code);
        }
        if (soObj.boundaryDateWork == null ){
         /*return; */ throw new SystemException(" �� ��������� �������� ���� ��������� ���� �� �������� !!!) soObj = " + soObj.code );
        }

        ENDelayServicesFilter delayFil = new ENDelayServicesFilter();
        delayFil.servicesObjectRef.code = soObj.code;
        delayFil.orderBySQL = " ENDelayServices.datestart ";

        ENDelayServicesShortList delayList = delayDAO.getScrollableFilteredList(delayFil, 0, -1);

        calculationBoundaryDateWork(soObj); // 1. �������� ��������� ����

        // 2. ���� �������� ���, �� �����
        if (delayList.totalCount==0){
        	return;
        }

        soObj = soDAO.getObjectNoSegr(soObj.code);

        Date newBoundaryDateWork = soObj.boundaryDateWork; // ��������������� ��������� ����

        int sumDayDelayCount = 0;
        int workDaysCount = 0;
        int calendarDaysCount = 0;

        // 3. ���� �������� ����
        for (int i = 0; i < delayList.totalCount ; i++) {

        	/* if (  delayList.get(i).dateStart.compareTo(newBoundaryDateWork) <= 0 ){

        	}
        	else {
        		throw new SystemException("\n\n NET-4560 ���������� ������� ������ � �������� ����� ��������� ���� ���������� ����� �� ������ !");
        	}*/

          workDaysCount = workDaysCount + delayList.get(i).workDaysCount;
          calendarDaysCount = calendarDaysCount + delayList.get(i).calendarDaysCount;

		}

         if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ) {
 			  sumDayDelayCount = workDaysCount ; // ���-�� ���� �������� � ������� ����
 			  newBoundaryDateWork  = plLogic.getDateOnworkingDay(newBoundaryDateWork, workDaysCount + 1);
 		  }
 		  // ���� ���� ���������� ���������� � ����������� ���� �� � ��������� ���� ���������� ���-�� ���� ��������
 		  else if( soObj.regulation == 1 ){

 			  newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, calendarDaysCount );
 			  sumDayDelayCount = calendarDaysCount; // ���-�� ���� �������� � ����������� ����
 		  }

			ENServicesObject ssObj = soDAO.getObjectNoSegr(soObj.code);
			ssObj.countDayDelay = sumDayDelayCount;
			ssObj.boundaryDateWork = newBoundaryDateWork;
			soDAO.save(ssObj);


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkDisconnectionInitiator(ENServicesObject servicesObject) {
		if (servicesObject == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ������� �� �������!");
		}

		if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
				&& servicesObject.personalAccountCode != Integer.MIN_VALUE) {

			if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
				throw new SystemException("NET-4576 ��� ��� ���� �� ������� ������� ������� EIC-��� ����� �����!");
			}

			boolean workConnections = checkWorks(servicesObject.code, true);

			if (workConnections) {
				BillingLogic billingLogic = new BillingLogic(connection, userProfile);
				DisconnectionInitiator disconnectionInitiator = billingLogic.getDisconnectionInitiatorByEIC(servicesObject.codeEIC, isServicesObjectByt(servicesObject));

				// ��� ��. ���, ���� �� ������� ���������� ���������� ����������, �������, ��� ��������� - ���
				if (servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL &&
					servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL_NOREZIDENT) {
					if (disconnectionInitiator == null) {
						disconnectionInitiator = DisconnectionInitiator.OSR;
					}
				}
				if (disconnectionInitiator == null) {
					throw new SystemException("NET-4576 �� ������� ��������� ��������� ���������� ��� ����� ����� � EIC-����� " + servicesObject.codeEIC + " !");
				}

				if (disconnectionInitiator == DisconnectionInitiator.SUPPLIER) {
					throw new SystemException("\n\nNET-4576 ���������� ���������� ��� ����� ����� � EIC-����� " + servicesObject.codeEIC + " � ������������!\n" +
							"��� ���������� �������� ������� ���������� �� �������������!");
				}

			}

		}
	}

	public void budgetApproved(int svoCode, int planCode) {
		try {

			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject servicesObject = servicesObjectDao.getObject(svoCode);
			/** ��� ������ */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);


			if (servicesObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
				throw new SystemException("\n"
						+ "���������� �������� ������� ���� �� ��������� �������, code = " + svoCode);
			}

			if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "�������� ��� �������� �������� ����������!");
			}


			/** ��� ������ �� ���� ������ */
			boolean requiredEIC = true;
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();

				ServicesConsumerLogic servicesConsumerLogic = new ServicesConsumerLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerKindDAO docServicesConsumerKindDao = new DFDocServicesConsumerKindDAO(docFlowConnection, userProfile);

				int servicesKindCode = servicesConsumerLogic.getServicesKindCode(servicesConsumerCode);
				if (servicesKindCode != Integer.MIN_VALUE) {

					DFDocServicesConsumerKind servicesConsumerKind = docServicesConsumerKindDao.getObject(servicesKindCode);
					if (servicesConsumerKind.requiredEIC == ENConsts.NO) {
						requiredEIC = false;
					}
				}
			}


			// SUPP-91510 �������� ���������� ���������� �� �� ������ �������� � ������ "���������", � ������
			/** SUPP-99483... 07.04.2021... +++ ��������� ���� ������������ EIC */
			if (requiredEIC) {
				checkDisconnectionInitiator(servicesObject);
			}


	        /* ��� ���������� �������� ��������� � ����� � ����� */
			if (servicesObject.contractKindRef.code == ENServicesContractKind.SALE) {
				ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.elementRef.code = servicesObject.element.code;

				int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
				if (planArr.length > 0) {
					ENEstimateItemDAO estDao = new ENEstimateItemDAO(connection, userProfile);
					ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
					estFilter.planRef.code = planArr[0];

					int estArr[] = estDao.getFilteredCodeArray(estFilter, 0, -1);
					if (estArr.length == 0) {
						throw new SystemException("\n "
								+ "³����� �������� � ����!!!");
					}
				}

	            /** 01.10.2013 +++ ������ �����?!?! */
				for (int i = 0; i < planArr.length; i++) {
					ENPlanWork plan = planDao.getObject(planArr[i]);
					plan.status.code = ENPlanWorkStatus.LOCKED;
					planDao.save(plan);
				}
			}


	        ///// 16.05.13 NET-4235 ������ ���� ��� ��������������� ������
			if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
				calcForPrepayment2(servicesObject);
			}
	        /////

			servicesObject.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
			servicesObjectDao.save(servicesObject);

			/** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.SECOND, servicesObject.code);

					/** ������� ���������� �� ������ � �����.. */
					ENServicesObject sObject = servicesObjectDao.getObjectNoSegr(servicesObject.code);
					docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, sObject.contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);

					String message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " sformovano rahunok. "
							+ "Zaydit do personalnogo kabinetu dlya yogo otrymannya.";

					/** �������� ���  */
					docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);
				}

				/** SUPP-93284... +++ ��� ������, ������� ������ � ����� ��� �������� � ������ "�������� �����������" ������������� ���������� � ������ "���������" */
				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE
						&& servicesObject.createdFromSite == ENConsts.YES) {

					boolean priconnections = false;
					boolean isClient = false;

					signed(svoCode, priconnections, isClient);
				}
			}


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	/**
	 *	�������� ������� ����� ��������� � ��������� �� ������
	 *
	 *	@param soCode - ��� ��������
	 *	@return - boolean isServicesConsumer
	 */
	public int getServicesConsumerCode(int soCode) {
		try {
			int servicesConsumerCode = Integer.MIN_VALUE;
			docFlowConnection = getDocFlowConnection();

			DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
			DFDocServicesConsumerFilter servicesConsumerFilter = new DFDocServicesConsumerFilter();
			servicesConsumerFilter.conditionSQL = " dfdocservicesconsumer.code = ("
					+ " select sc.code from dfdocservicesconsumer sc "
					+ " where sc.doccode = ( "
					+ "  select d.parentrefcode "
					+ "    from dfdoc d where d.code = ( "
					+ "    select ds.docrefcode"
					+ "      from dfdoc2enservicesobject ds "
					+ "     where ds.servicesobjectcode = " + soCode + " ) ) )";

			int scArr[] = servicesConsumerDao.getFilteredCodeArray(servicesConsumerFilter, 0, -1);
			if (scArr.length > 0) {
				servicesConsumerCode = scArr[0];
			}

			return servicesConsumerCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	/**
	 *	���������� �������� - ���������� ��� ��������� �����, ���������� �� "���������"
	 */
	public int signed(int svoCode, boolean priconnections, boolean isClient) {
        Connection authConn = null;
        int newPlanCode = Integer.MIN_VALUE;

        try {
			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
            ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
            ENDepartment2EPRenDAO deepDao = new ENDepartment2EPRenDAO(connection, userProfile);

            ENServicesObject servicesObject = servicesObjectDao.getObject(svoCode);

            if (servicesObject.contractKindRef.code == ENServicesContractKind.SERVICES) {
            	// SUPP-102352 ��������� �� ���������
            	if (servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {
	                AuthLogic auth = new AuthLogic(authConn, userProfile);

	                if (!auth.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "signedServices")) {
	                    throw new SystemException("\n ����� �� ����������� �������� � � ������� ��� ����������������!!!");
	                }
            	}
            }

			/** ���� ������ ������� �� ������ � ����� - ������� ������������� � ������������ �������� �� ����� */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE
					&& isClient
					/** SUPP-91141... 04.05.2020... +++ ��������� ����������� ��������, ��������� ���������, � ������������ �� �����... */
					&& servicesObject.createdFromSite == ENConsts.CREATED_FROM_SITE_YES) {

				throw new SystemException("\n \n"
                        + "��� ������ ��������� �� ������� � ����� �� ���������� ���������� � ������������� ������!!!");
			}


            // NET-4295 ���� ���������� - ��. ���� ������, �� ����� ���������� � DocFlow �����������
            // ��� ����������, ���� ������������� - �� ���� �� ����������� � docFlow - ��� �������������
            // ���� ����� ���������� signedPriconnection

			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (isDocFlowLifeCycleStartsWithSigning(servicesObject)
						&& servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {

					servicesObject.dfPackCode = createDocFlowPack(servicesObject);
                    // NET-4560 - ������ ��������� ���� ���������� �����

    				calculationBoundaryDateWork(servicesObject);
    				// !!���������� EnServicesObject �.� ��� ������� ��������
    				// ���� ����������� ������
    				servicesObject = servicesObjectDao.getObject(servicesObject.code);
                }
            }


            /** 15.04.2013 +++ ��� ���������� �������� �� ������������� ������ ����� */
            if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

     //       if (isClient && priconnections) {
     //          throw new SystemException("\n NET-4231..."
     //                   + "\n \n �������� �� ��������� ����������� � EnergyWorkflow!!!");
     //       }

            Date executeWorkDate = servicesObject.executeWorkDate;

            /** 12.04.2013 +++ ����� ������������� */
            if (!priconnections) {
                if (servicesObject.contractStatusRef.code != ENServicesContractStatus.BUDGETAPPROVED) {
                    throw new SystemException(
                            "ϳ������� ������ ������� ���� ���� ������������ ���������, code = " + svoCode);
                }

                if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
                    throw new SystemException(
                            "�������� ��� �������� �������� ����������!");
                }

                /** SUPP-18463... 18.06.2014 +++ �������� ������� ������������ �� ��������... */
                if (servicesObject.warrantRef.code == Integer.MIN_VALUE) {
                	throw new SystemException("\n\n"+
                            "�� ��������� ��������� �� �������!!!");
                }

                /** NET-4422...  +++ � �������� �� ���������� ����� �� ������ �������� ��� �������� �� ������������� ����
                 *  ����������� ������ ���� ������ �/���� ��������
                 *  +++ ��� �������� ��������
                 */
				if (checkReplaceCounterServices(servicesObject.element.code)) {

					if (servicesObject.reconnectionTU == Integer.MIN_VALUE) {
						throw new SystemException("\n\n "
								+ "�� ��������� �������� ������� ��������� �� �������!!!");
					}

					if (servicesObject.countersZoneType == Integer.MIN_VALUE) {
						throw new SystemException("\n\n "
								+ "�� ��������� ������� ��� ��� ��������� �� �������!!!");
					}
				}

				checkGiveCounterForServicesObject(servicesObject);

                // NET-4295
                // �������� �� ��, ��� ��������� ������� ��� ���.�����
                if (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL
                        && servicesObject.reconnectionTU == Integer.MIN_VALUE
                        && checkWorks(servicesObject.code)) {
                    ENDepartment2EPRenFilter deepFilter = new ENDepartment2EPRenFilter();
                    deepFilter.departmentRef.code = servicesObject.department.code;
                    deepFilter.conditionSQL = "billingserverip is not null";

                    int[] deepCodes = deepDao.getFilteredCodeArray(deepFilter, 0, -1);
                    if(deepCodes.length > 0)
                    {
                        throw new SystemException("\n\n"
                            + "������ ������ ������ ��� ���������� ���������� �� ���� ����������� �������� ��� ���. �����!!!");
                    }
                }

                // 09.12.2014 - ��� ���������� ���� ���� ���� ���������� ����� �� �������� �� ������� ���� � �������� � ������ ����������
                if (executeWorkDate == null ){
                	executeWorkDate = servicesObject.contractDateServices;
                	servicesObject.executeWorkDate = executeWorkDate;
                }



                /** SUPP-99483... 07.04.2021... +++ ��������� ���� ������������ EIC */
    			boolean requiredEIC = true;
    			if (servicesConsumerCode != Integer.MIN_VALUE) {

    				docFlowConnection = getDocFlowConnection();

    				ServicesConsumerLogic servicesConsumerLogic = new ServicesConsumerLogic(docFlowConnection, userProfile);
    				DFDocServicesConsumerKindDAO docServicesConsumerKindDao = new DFDocServicesConsumerKindDAO(docFlowConnection, userProfile);

    				int servicesKindCode = servicesConsumerLogic.getServicesKindCode(servicesConsumerCode);
    				if (servicesKindCode != Integer.MIN_VALUE) {

    					DFDocServicesConsumerKind servicesConsumerKind = docServicesConsumerKindDao.getObject(servicesKindCode);
    					if (servicesConsumerKind.requiredEIC == ENConsts.NO) {
    						requiredEIC = false;
    					}
    				}
    			}



    			/** SUPP-99483... 07.04.2021... +++ ��������� ���� ������������ EIC */
    			if (requiredEIC) {
                    // 29.10.2019 ���� �������� ������� ����, ����������� ���������� ������� EIC-��� ����� �����!
            		if (servicesObject.personalAccountCode > 0) {
            			if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
            				throw new SystemException("NET-4576 ��� ��� ���� �� ������� ������� ������� EIC-��� ����� �����!");
            			}
            		}
    			}


                servicesObject.contractStatusRef.code = ENServicesContractStatus.SIGNED;
                servicesObjectDao.save(servicesObject);
            }



            /* ��� ���������� ��� �� �� ���� , � �� ������ ��� ��*/
            if (servicesObject.contractKindRef.code != ENServicesContractKind.SALE &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_COMPANY_OBJ &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_CUSTOMER_OBJ &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.INFORMATIONAL_SERVICES &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SUPPLIER_CONTRACT&&
            		servicesObject.contractKindRef.code != ENServicesContractKind.REMOVAL_LINE_RM_KB &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SERVICES_LUZOD_ASKOE ) {


                /** NET-4159
                *  �������� ������������ ��������� ��� ����� ����������
                */
                if (!priconnections) {
                    checkGiveCounters(svoCode);
                }


                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
                ENPlanWork plan;

                if (priconnections) {
                    plan = getPlanWorkCalculationByElementCode(servicesObject.element.code, ENPlanWorkKind.CALCULATION, ENPlanWorkStatus.GOOD);

                } else {
                    plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);
                }

                // ���� �� ������ ������� ���� ²�������� ����� �� ������ (��� ����������̲� �����������) ����� �������� ���� ������ � ���� ����� ²�������� ����� �� �����
                /** SUPP-28447...  ��� ��������� �� ������������� ���� �� ������.... */
                if (!priconnections) {
                    if (executeWorkDate != null) {

                    	Calendar cExecuteWorkDate = Calendar.getInstance();
                    	cExecuteWorkDate.setTime(servicesObject.executeWorkDate);

                        plan.dateStart = executeWorkDate;
                        plan.dateFinal = executeWorkDate;
                        plan.monthGen = cExecuteWorkDate.get(Calendar.MONTH) + 1;
                        plDAO.save(plan);
                    }
                }

                /** 21.01.2017... +++ �������� �� �� ��� � ������������ ������������  */
                if (servicesObject.contractTypeRef.code == ENServicesContractType.TY
                		&& plan.status.code == ENPlanWorkStatus.LOCKED) {
                	return plan.code;
                }

                // SUPP-4515 �������� ������������� ���������
				if (!priconnections) {
					if (checkNeedInputKilometers(plan.code) == true) {
						if (! userProfile.userName.equals("energynet")) {
							throw new SystemException("\n\n "
									+ "�� ����������� ��������������� ���������!!! � ������� ����`������ ��������� ������� �������");
						}
					}
				}

                // ������� �������� ����
                newPlanCode = planWorkLogic.closePlan(plan.code);
                // ������ ������� ��� ����� ���������� ��������� � ������ ������������

                // NET-2264 ��������� ��������� ����� � ����� ��������� ���� � ������� �������� ��� ���� ����� ������� ��������� ����� .

                ENTransportItemDAO trtDAO = new ENTransportItemDAO(connection, userProfile);
                ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);
                ENDistanceFilter distFilter = new ENDistanceFilter();

                ENTransportItemFilter trtFilter = new ENTransportItemFilter();
                trtFilter.planRef.code = newPlanCode;
                trtFilter.tktransportType.code = TKTransportType.BRIGADE;
                int[] trtArr = trtDAO.getFilteredCodeArray(trtFilter, 0, -1);

				if (trtArr.length != 0) {
					for (int i = 0; i < trtArr.length; i++) {
						if (i >= 1) {
							distFilter.transportItemRef.code = trtArr[i];
							int[] distArr = distDAO.getFilteredCodeArray_1(distFilter, null, null, 0, -1, null);
							for (int j = 0; j < distArr.length; j++) {
								distDAO.remove(distArr[j]);
							}
						}
					}

					// �����������  �������� �� �����
					new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(newPlanCode);
                }


				ENPlanWorkFilter pwFilter = new ENPlanWorkFilter();
				pwFilter.elementRef.code = servicesObject.element.code;
				pwFilter.kind.code = ENPlanWorkKind.CALCULATION_SINGLE;
				int[] pwCode = plDAO.getFilteredCodeArray(pwFilter, 0, -1);
				if (pwCode.length != 0) {
					for (int g = 0; g < pwCode.length; g++) {
						ENPlanWork pw = plDAO.getObject(pwCode[g]);
						pw.status.code = ENPlanWorkStatus.LOCKED;
						plDAO.save(pw);
					}
				}

                // ��������� ������� ���� , �����, ������ �� ���������  ���� ������� � ���������� �������������� ��������
                // �� ��������� � ������� ����  � �� ������� �� ������� � � ����� ���� ������ ��������� ������������� �����
                // �������� �� ���� ���������������� , ��� ��� ���������� , �����������
                /* ���� ���������� �� ������ ����� ���� ����� �������� ������� ��� ���������� �������� ����� ���� ����� ������ ��� �� ��������� ������� ���� � ����� �������  */
				PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
				if ((plan.kind.code == ENPlanWorkKind.CALCULATION)
						&& ((pl.isReservedCalculationInContract(plan.code)) == true)
						&& ((pl.isAcessRemJobsByTime(plan.departmentRef.code)) == true)
						&& (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)) {

                        // �������� ����� ������� ���� �� ���������
                        newPlanCode = planWorkLogic.closePlan(newPlanCode);
                        // ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
                        // newPlanObj.dateGen
                        // ��� ������� ���� �������� ����� - �������
                        try {
                            createWorkOrderToPlanServices(newPlanCode);
                            // �������� finmoldata
                            createFinMolToPlanServices(newPlanCode);
                            // ��������� ���� ���� �� ����� ������ ���� ���� ����� ������� ������ �� ������
                            ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
                            ENTransportItemFilter trFilter = new ENTransportItemFilter();
                            trFilter.planRef.code = newPlanCode;
                            ENTransportItemShortList trList =  trDAO.getScrollableFilteredList(trFilter,0,-1);

                            ENTimeLineDAO tlDAO = new ENTimeLineDAO(connection, userProfile);
                            ENTimeLineFilter tlFilter = new ENTimeLineFilter();
                            tlFilter.servicesObjectRef.code = svoCode;
                            ENTimeLineShortList tllist = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
                            if (tllist.totalCount > 0 ) {

							Context context;
							try {
								context = new InitialContext();

								Object objTrordRef = context.lookup(ENTransportOrderController.JNDI_NAME);
								ENTransportOrderControllerHome TrordHome = (ENTransportOrderControllerHome) PortableRemoteObject
										.narrow(objTrordRef, ENTransportOrderControllerHome.class);
								ENTransportOrderController Trord = TrordHome.create();

								// ��������� � ������ ������������� ������������� ��������� ����������
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = servicesObject.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("\n"
											+ "�� �������� ����������� ����������!");
								}

								ENTransportItemShort[] trShortArr = new ENTransportItemShort[trList.list.size()];
								for (int i = 0; i < trList.list.size(); i++) {
									trShortArr[i] = trList.get(i);
								}
								if (trShortArr.length != 0) {
									Trord.addTransportOrderWithTransportItems(trShortArr,
											tllist.get(0).timeMoveToObject, tllist.get(0).dateGen,
											tllist.get(0).timeMoveOfObject, tllist.get(0).dateGen,
											td2tdList.get(0).transportDepartmentCode,
											ENTransportOrder.isAssignment_false, true);

								}
							} catch (NamingException e) {
								throw new SystemException(e.getMessage(), e);
							} catch (RemoteException e) {
								throw new SystemException(e.getMessage(), e);
							}
						}

					} catch (RemoteException e) {
						throw new SystemException(e.getMessage(), e);
					} catch (CreateException e) {
						throw new SystemException(e.getMessage(), e);
					}

				}

                // ��������� � ������� ���������� ����������� ������������� �� ������� ��� ����������� �������� �� �������� ����� ��������� ���� � � ���� �� ����� ��� � �������� ���� ���������� �����
                //  NET-4235   ���� �� ��� ���������� �������� ��� ���� ����������� (��.����� ������) ������� ������ ����. enservicesfactcalc
                // �� ���������� ��� ��� ��� ����������� ������� ���������� ����

				ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);
				ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
				factCalcFilter.servicesObjectRef.code = servicesObject.code;
				int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);

				if (factCalcArr.length > 0) {
					if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
						ENServicesFactCalc factCalc = factCalcDAO.getObject(factCalcArr[0]);

						factCalc.percentPrepay = new BigDecimal(0);
						factCalc.sumPrepay = new BigDecimal(0);
						factCalc.vatSumPrepay = new BigDecimal(0);
						factCalc.totalSumPrepay = new BigDecimal(0);
						factCalcDAO.save(factCalc);

					}
				}
			}


            // net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
            // ���� ��� ����������� ������ ����� �� ���������� �������� ������� �������� ����� �� �����������
			if (servicesObject.contractKindRef.code == ENServicesContractKind.SERVICES
					&& servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoCreateFkorderMoveCounterForServices(servicesObject);
			}


			/** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
			if (servicesConsumerCode != Integer.MIN_VALUE) {
				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);

				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					/** 17.03.2020... ��� ������� - ����� � ������ */
					if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
						docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FOURTH, servicesObject.code);
					} else {

						/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
						if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.EIGHTH, servicesObject.code);
						} else {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.THIRD, servicesObject.code);
						}
					}


					/** ���������� �������������� ���������� ��� ������ ������ */
					ENServicesObject sObject = servicesObjectDao.getObjectNoSegr(servicesObject.code);

			    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
			    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

					BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
							.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));

					docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);
				}
			}



			/** NET-4592... 26.05.2020... +++ ��� ����� �� �������, �������� ����� ��� ������� e-mail... */
			if (servicesObject.contractKindRef.code == ENServicesContractKind.SERVICES
					&& servicesObject.contractTypeRef.code == ENServicesContractType.OTHERS) {

					if (servicesObject.customerEmail != null
							&& servicesObject.customerEmail.length() > 0) {

						sendBillToCustomer(servicesObject, DocType.FIRST_BILL);
					}
			}



			/** SUPP-100912... 24.06.2021... +++ ��� ��������� ������ ��������� ����������� � CallCenter ��� ���������� �������� � EnergyNet....  */
			if (servicesObject.contractTypeRef.code == ENServicesContractType.OKSN) {

				if (servicesObject.partnerCode != null && servicesObject.partnerCode.length() > 0) {

					ENGeneralContractsDAO generalContractsDao = new ENGeneralContractsDAO(connection, userProfile);
					ENGeneralContractsFilter generalContractsFilter = new ENGeneralContractsFilter();
					generalContractsFilter.partnerCode = servicesObject.partnerCode;

					int[] gArr = generalContractsDao.getFilteredCodeArray(generalContractsFilter, 0, -1);
					if (gArr.length > 0) {

						ENGeneralContracts generalContracts = generalContractsDao.getObject(gArr[0]);

						CallCenterLogic centerLogic = new CallCenterLogic(connection, userProfile);
						centerLogic.addContragent(servicesObject.name, servicesObject.partnerCode, generalContracts.axPartnerCode);
					}
				}
			}




			return newPlanCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			closeDocFlowConnection();

			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



	/**
	 * �������� ������� email
	 *
	 * @param email
	 * @return
	 */
	public boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
	}




	public class DocType {

		/** ���� �� ���������� */
		public static final int FIRST_BILL = 1;
		/** ������������� ���� */
		public static final int SECOND_BILL = 2;
	}



	/**
	 * ������������ ����� � �������� �� e-mail
	 *
	 * @param servicesObject
	 * @param docType - (������ ����, ������ � �.�.)
	 */
	public void sendBillToCustomer(ENServicesObject servicesObject, int docType) {

		/** �������� ������� e-mail */
		if (servicesObject.customerEmail == null
				|| servicesObject.customerEmail.length() == 0) {
			return;
		}

		if (!isValidEmailAddress(servicesObject.customerEmail)) {
			return;
		}

		/** ������������ ������ � �������� �� e-mail */
		ReportLogic reportLogic = new ReportLogic(connection, userProfile);
		reportLogic.sendBillToCustomer(servicesObject, docType);
	}



	public int createDocFlowPack(ENServicesObject servicesObject) {

		int servicesListCode = Integer.MIN_VALUE;

		boolean requiredEIC = isEICRequired(servicesObject.code);

		/** SUPP-99539... 09.04.2021... +++ ��������� - ���� ������������ EIC */
		if (requiredEIC) {
			if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
					&& servicesObject.personalAccountCode != Integer.MIN_VALUE) {


				if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
					throw new SystemException("NET-4576 ��� ��� ���� �� ������� ������� ������� EIC-��� ����� �����!");
				}

				/** ���� ����������� ��������� � ����������� - ������� ����� � docFlow... */
				boolean workConnections = checkWorks(servicesObject.code, true);

				/** !!! ���� ������ ������� ���������� ����������� � ���� ��� �������� �����
	             *
	             *      S1.4.1 - �����
	             *      S1.4.2 - ����
	             *      ������������ ����� � DocFlow....
	             */

				if (workConnections) {
					BillingLogic billingLogic = new BillingLogic(connection, userProfile);
					DisconnectionInitiator disconnectionInitiator = billingLogic.getDisconnectionInitiatorByEIC(servicesObject.codeEIC, isServicesObjectByt(servicesObject));

					/**
					 * SUPP-57620 31.01.2017... +++ ��� ��������� ����� 1.4, ����� -
					 * �� 1.3....
					 */
					/* 28.10.2019 ������ ��� ��-������
					if (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {
						switch (servicesObject.regionalType) {
						case 1:
							servicesListCode = DFServicesList.S1_4_1;
							break;
						case 2:
							servicesListCode = DFServicesList.S1_4_2;
							break;
						default:
							throw new SystemException("\n "
									+ "������� ������ ����-���� ��� �������� � " + servicesObject.contractNumberServices);
						}
					} else {
						servicesListCode = DFServicesList.S1_3;
					}
					*/

					// ��� ��. ���, ���� �� ������� ���������� ���������� ����������, �������, ��� ��������� - ���
					if (servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL &&
						servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL_NOREZIDENT) {
						if (disconnectionInitiator == null) {
							disconnectionInitiator = DisconnectionInitiator.OSR;
						}
					}
					if (disconnectionInitiator == null) {
						throw new SystemException("NET-4576 �� ������� ��������� ��������� ���������� ��� ����� ����� � EIC-����� " + servicesObject.codeEIC + " !");
					}

					switch (disconnectionInitiator) {
						case OSR:
							switch (servicesObject.regionalType) {
								case 1:
									servicesListCode = DFServicesList.S3_2_1_NEW;
									break;
								case 2:
									servicesListCode = DFServicesList.S3_2_2_NEW;
									break;
								default:
									throw new SystemException("\n "
											+ "������� ������ ����-���� ��� �������� � " + servicesObject.contractNumberServices);
							}
							break;

						case CUSTOMER:
							servicesListCode = DFServicesList.S3_1_NEW;
							break;

						case SUPPLIER:
							throw new SystemException("\n\nNET-4576 ���������� ���������� ��� ����� ����� � EIC-����� " + servicesObject.codeEIC + " � ������������!\n" +
	                                                  "��� ���������� �������� ������� ���������� �� �������������!");

						default:
							throw new SystemException("\n\nNET-4576 �������� �������� ���������� ��� ����� ����� � EIC-����� " + servicesObject.codeEIC + " !");
					}

				}

			} else if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_NEWCONNECTIONTU) {

				/************************
				SUPP-87079 by ParfenovAY:
				����� ��� ������, ��� ���� ������������� ����������� � �����
				������������ ������� S3 "���������� ����������������� ����
				����������", � ��� �������� ������ "����� ��������" �� ������� � �� EnergyNet,
				����������� ��� ������������ S0.1 "���������� ������ ��������� �
				����������������� �������"
				*************************/
				if (checkWorks(servicesObject.code, true)) {
					servicesListCode = DFServicesList.S0_1_NEW;
				}

			}
		}

		return addServicesObjectToDocFlow(servicesObject, servicesListCode);
	}

	public boolean isEICRequired(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ������� �� �������!");
		}

		// SUPP-106102 06.12.2021 ���� ������ �� ������� � �����������������, �� EIC-��� �������� �������������� ��� ����������
		boolean requiredEIC = false;

		/** ��� ������ */
		int servicesConsumerCode = getServicesConsumerCode(servicesObjectCode);
		try {
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DFDocServicesConsumerKindDAO docServicesConsumerKindDao = new DFDocServicesConsumerKindDAO(docFlowConnection, userProfile);
				ServicesConsumerLogic servicesConsumerLogic = new ServicesConsumerLogic(docFlowConnection, userProfile);

				int servicesKindCode = servicesConsumerLogic.getServicesKindCode(servicesConsumerCode);
				if (servicesKindCode != Integer.MIN_VALUE) {

					DFDocServicesConsumerKind servicesConsumerKind = docServicesConsumerKindDao.getObject(servicesKindCode);
					if (servicesConsumerKind.requiredEIC == ENConsts.YES) {
						requiredEIC = true;
					}
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}

		return requiredEIC;
	}



	/**
	 *	������� �������� � ������ "³����� ��������� �� ������"
	 *
	 *	@param objCode - ��� ��������
	 *	@param isDocFlow - boolean default(false)
	 */
	public void disclaimerCustomerServices(int objCode) {
		disclaimerCustomerServices(objCode, false);
	}

	public void disclaimerCustomerServices(int objCode, boolean isDocFlow) {
		try {
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObject(objCode);

			if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n \n "
						+ "�������� ��� �������� �������� ����������!");
			}


			/** ��������� ���� ����� �� �� ���������������� */
			if (!isDocFlow) {
				/** ���� ������ ������� � ������� ����������� */
				int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
				if (servicesConsumerCode != Integer.MIN_VALUE) {
					throw new SystemException("\n\n"
							+ "������ ��������� �� ������� ���������!\n"
							+ "�������� �������� � ������ ������ ����������.");
				}
			}


            // NET-4295 ������ ��������
			ConfigDAO configDAO = new ConfigDAO(userProfile, getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE));
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				cancelServicesObjectInDocFlow(servicesObject, false);
			}

            // NET-4443 ���� ������� �� ��������� �������������� ��������, ������� ��� �� ������ �� ������� ���������
			removeForCounters(objCode, true);

			servicesObject.contractStatusRef.code = ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES;
			servicesObjectDao.save(servicesObject);


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	/**
	 *	������ ���������� ��������...
	 */
	public void unSigned(int svoCode, boolean priconnections, boolean isClient) {
		Connection authConn = null;
		try {
			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
            ENServicesObject obj = objDAO.getObject(svoCode);

            /** 15.04.2013 +++ ��� ���������� �������� �� ������������� ������ ����� */
            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (obj.contractKindRef.code == ENServicesContractKind.SERVICES && !priconnections) {

                AuthLogic auth = new AuthLogic(authConn, userProfile);
                if (!auth.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "signedServices")) {
                    throw new SystemException("\n ����� �� ����������� �������� � � ������� ��� ����������������!!!");
                }
            }

            // SUPP-80411 ������ ������ ���������� ��������, ���� ��� ���� ���� �������������� ����������
            ENAdditionalAgreementDAO additionalAgreementDao = new ENAdditionalAgreementDAO(connection, userProfile);
            ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
            servicesObjectRef.code = svoCode;
            long count = additionalAgreementDao.count(servicesObjectRef, null, null);
            if(count > 0) {
            	throw new SystemException(String.format("��� �������� � %s �� %s � �������� �����. ³���� ��������� ���������!"
            			, obj.contractNumberServices
            			, Tools.dateFormatDefault.format(obj.contractDateServices)));
            }

       //     if (isClient && priconnections) {
       //         throw new SystemException("\n NET-4231..."
       //                 + "\n \n �������� �� ��������� ����������� � EnergyWorkflow!!!");
       //     }

            if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
                throw new SystemException("\n"
                		+ "³������ ����� �� ���������� �������, code = " + svoCode);
            }

			if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "�������� ��� �������� �������� ����������!");
			}



			/** ���� ������ ������� �� ������ � ����� - ������� ������������� � ������������ �������� �� ����� */
			int servicesConsumerCode = getServicesConsumerCode(obj.code);
			if (servicesConsumerCode != Integer.MIN_VALUE
					&& isClient
					/** SUPP-91141... 04.05.2020... +++ ��������� ����������� ��������, ��������� ���������, � ������������ �� �����... */
					&& obj.createdFromSite == ENConsts.CREATED_FROM_SITE_YES) {

				throw new SystemException("\n \n"
                        + "��� ������ �������� ���������� � ������������� ������.\n"
                        + "���������� ��������� ���������!!!");
			}



            // net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
            // ���� ��� ����������� ������ ����� ��� ������ ���������� ������� ����� �� ����������� �� �������������� ��������
			if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
					&& obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoRemoveAllRereservedCountersForServices(obj);
				fkOrderLogic.autoRemoveFkorderMoveCounterForServices(obj);
			}

            ///  ������ �������� �� ������ // 03.05.19 // ����� ����������� � ��������
			//   isCancelableServices(svoCode);

            // PRIC-155. ������� ������ EnergyWorkFlow �� ��������
            if (obj.contractStatusRef.code == ENServicesContractType.TY
            && obj.cnPackCode != Integer.MIN_VALUE
            && obj.cnSubsystemTypeRef.code != Integer.MIN_VALUE
            && obj.element.code != Integer.MIN_VALUE)
            {
                //��������, ��� ��������� ������� ����� �� ������� ��������
                //��������� � ���������� ��, � �� � �������� ��������� � ��
                ENPlanWork2ClassificationTypeDAO pw2ctDAO = new ENPlanWork2ClassificationTypeDAO(userProfile, connection);
                ENPlanWork2ClassificationTypeFilter pw2ctFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2ctFilter.conditionSQL =
                    " ENPLANWORK2CLASSFCTNTP.CLASSIFICATIONTYPERFCD IN (" +
                    "    500004500, 500002263, 500002265, 500002269, 500002273, 500002274, " +
                    "    500002397, 500002398, 500002396, 500002278, 500002281, 500002282, " +
                    "    500002279, 500002275, 500002276, 500002280) " +
                    "  AND ENPLANWORK2CLASSFCTNTP.PLANREFCODE IN (SELECT ENPLANWORK.CODE " +
                    "    FROM ENPLANWORK WHERE ENPLANWORK.KINDCODE = " + ENPlanWorkKind.CALCULATION +
                    "    AND ENPLANWORK.ELEMENTREFCODE = " + obj.element.code + ")";

                int [] pw2ctCodeArray = pw2ctDAO.getFilteredCodeArray(pw2ctFilter, 0, -1);

                if (pw2ctCodeArray.length > 0)
                    {
                        Connection cnConnection = null;
                        try
                        {
                            cnConnection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
                            CNLogic cnLog = new CNLogic(cnConnection, userProfile);
                            CNPack packCN = new CNPack();
                            packCN.packCode = obj.cnPackCode;
                            packCN.subsystemRef.code = obj.cnSubsystemTypeRef.code;

                            int[] stateFromRedoIdArray = {0};

                            switch (packCN.subsystemRef.code) {
                                case CNSubsystemType.SS_CONNECTION: //�������������
                                {
                                    if (obj.contractServicesPower.doubleValue() > 5 || packCN.over5 == 1)
                                    {
                                        packCN.startState = 1000003;
                                        stateFromRedoIdArray[0]= 1000004;
                                    }
                                    else
                                        {
                                        packCN.startState = 2000003;
                                        stateFromRedoIdArray[0] = 2000004;
                                    }
                                    break;
                                }
                                case CNSubsystemType.SS_NEWCONNECTION: //������������� � 01.08.2010 �.
                                {
                                    if (obj.contractServicesPower.doubleValue() > 5 || packCN.over5 == 1)
                                    {
                                        packCN.startState = 1010001;
                                        stateFromRedoIdArray[0] = 1000002;
                                    }
                                    else
                                        {
                                        packCN.startState = 2010001;
                                        stateFromRedoIdArray[0] = 2000002;
                                        }
                                    break;
                                }
                                case CNSubsystemType.SS_CONNECTION_20110314: //������������� � 14.03.2011 �.
                                {
                                    if (obj.contractServicesPower.doubleValue() > 5 || packCN.over5 == 1)
                                    {
                                        packCN.startState = 1010001;
                                        stateFromRedoIdArray[0] = 1000002;
                                    }
                                    else
                                        {
                                        packCN.startState = 2010001;
                                        stateFromRedoIdArray[0] = 2000002;
                                        }
                                    break;
                                }
                                case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //������������� � 01.03.2013 �.
                                {
                                    if (obj.contractServicesPower.doubleValue() > 5 || packCN.over5 == 1)
                                    {
                                        packCN.startState = 1050005;
                                        stateFromRedoIdArray[0] = 1050041;
                                    }
                                    else
                                        {
                                        packCN.startState = 2050013;
                                        stateFromRedoIdArray[0] = 2050020;
                                        }
                                    break;
                                }
								case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //������������� � 19.04.2018 �.
								{
								  if (obj.contractServicesPower.doubleValue() < 16 || packCN.over5 == 0)
                                    {
                                        packCN.startState = 1;
                                        stateFromRedoIdArray[0] = 22;
                                    }
								  break;
								}
                                default:
                                {
                                    throw new SystemException("���������� ���������� EnergyWorkFlow");
                                }
                                }
                            if (!cnLog.completeTask(packCN, false, stateFromRedoIdArray, "������ ���������� �������� � EnergyNet"))
                            {
                                throw new SystemException("������ ���������� ����������." +
                                "\n ������� ����� � EnergyWorkFlow ������� ������� " +
                                "\n �� ���������� �������� � ���������� ��");
                            }
                        } catch (DatasourceConnectException e) {
                        	throw new SystemException("��� ����� � EnergyWorkFlow ...", e);
					} finally {
						try {
							if ((cnConnection != null) && !cnConnection.isClosed())
								cnConnection.close();
						} catch (SQLException e) {
						}
					}
                }
            }

            /* ��� ���������� ������� �� ������� ;) */
            if (obj.contractKindRef.code == ENServicesContractKind.SALE) {

                obj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                objDAO.save(obj);

            } else {

                // ������� �� ���� ������� ��� ����� ��������
                ENPlanWorkDAO planEstimateDAO = new ENPlanWorkDAO(userProfile, connection);
                ENPlanWorkFilter planEstimateFilter = new ENPlanWorkFilter();
                planEstimateFilter.elementRef.code = obj.element.code;
                planEstimateFilter.kind.code = ENPlanWorkKind.CALCULATION;
                int[] planEstimateArr = planEstimateDAO.getFilteredCodeArray(planEstimateFilter, 0, -1);
                int codePlanEstimate = Integer.MIN_VALUE;
                ENPlanWork planEstimate;
				for (int i = 0; i < planEstimateArr.length; i++) {
					planEstimate = planEstimateDAO.getObject(planEstimateArr[i]);
					codePlanEstimate = planEstimate.code;
				}

                PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);

                /* ���� ���� ������������� ������ � �������� ����� ������� ������� ������ ������� ���� ���� �� � �������� ������� */
                if ( isReservedCalculationInContract(svoCode) == true ) {
                    ENPlanWorkDAO planNPWDAO = new ENPlanWorkDAO(userProfile, connection);
                    ENPlanWorkFilter planNPWFilter = new ENPlanWorkFilter();
                    planNPWFilter.conditionSQL = " ENPLANWORK.CODE in ( " +
                    " select pw.code from enplanwork pw  , enservicesobject so " +
                    " where pw.elementrefcode = so.elementcode " +
                    " and pw.kindcode = " + ENPlanWorkKind.NPW +
                    " and so.code = " + svoCode +
                    " limit 1 ) ";
                    // ENPlanWorkShortList planNPWList = planNPWDAO.getScrollableFilteredList(planNPWFilter,0,-1);
                    int plArr[] = planNPWDAO.getFilteredCodeArray(planNPWFilter,0,-1);
                    if (plArr.length > 0) {
                        ENPlanWork plObj = planNPWDAO.getObject(plArr[0]);
                        if  (plObj.status.code != ENPlanWorkStatus.GOOD) {
                            throw new SystemException("\n"
                            		+ "��� ����� ��������� �������� ���� ������� ���� ��������!");
                        }
                        else
                            // ������ ������� ����
                            pl.openPlan(plObj.code,0);
                    }
                }

                if ( codePlanEstimate != Integer.MIN_VALUE ) {
                    // ������� �� ���� ������� ��� �������� �����
                    ENPlanWorkDAO planCurrentDAO = new ENPlanWorkDAO(userProfile, connection);
                    ENPlanWorkFilter planCurrentFilter = new ENPlanWorkFilter();
                    planCurrentFilter.elementRef.code = obj.element.code;
                    planCurrentFilter.kind.code = ENPlanWorkKind.CURRENT;
                    int[] planCurrentArr = planCurrentDAO.getFilteredCodeArray(planCurrentFilter, 0, -1);
                    int codePlanCurrent = Integer.MIN_VALUE;
                    ENPlanWork planCurrent;
                    for (int i = 0; i < planCurrentArr.length; i++)
                    {
                        planCurrent = planCurrentDAO.getObject(planCurrentArr[i]);
                        codePlanCurrent = planCurrent.code;

                        if (planCurrent.status.code != ENPlanWorkStatus.GOOD)
                        {
                            throw new SystemException("\n"
                            		+ "�������� ���� ������� ���� ��������!");
                        }
                        else

                        // �������� �������� ����� ��� �������������� ��������� , � ������ ������ ��������� � ������ �������� ������������
                        {

                            pl.openPlan(codePlanCurrent,0);

                            // ������ ������� ��� ����� ���������� ��������� � ������ ��������
							ENPlanWorkFilter pwFilter = new ENPlanWorkFilter();
							pwFilter.elementRef.code = obj.element.code;
							pwFilter.kind.code = ENPlanWorkKind.CALCULATION_SINGLE;
							int[] pwCode = planEstimateDAO.getFilteredCodeArray(pwFilter, 0, -1);
							if (pwCode.length != 0) {
								ENPlanWork pw = planEstimateDAO.getObject(pwCode[0]);
								pw.status.code = ENPlanWorkStatus.GOOD;
								planEstimateDAO.save(pw);
							}



                            // NET-4295
							ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
							Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
							if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
								if (isDocFlowLifeCycleStartsWithSigning(obj)
										&& obj.contractTypeRef.code != ENServicesContractType.CONNECTION) {
									deleteServicesObjectInDocFlow(obj);
								}
							}
                        }
                    }
                }

                /* 20.09.2018 ���� ����� �������� � ��� �������� ��������� ����
                 * (� ��� ������ ��� �� ���������� �������� ���������� ��������)*/
                obj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                objDAO.save(obj);
            }

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


    /**
     *  ������ �������� ����� �� �������
     *
     * 	@param svoCode - ��� ��������
     * 	@param commenGen - �����������
     *  @param isDocFlow - default (false)
     */
	public void canceled(int svoCode) {
		canceled(svoCode, null, false);
	}

	public void canceled(int svoCode, String commenGen, boolean isDocFlow) {
		try {

			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObject(svoCode);


			/** ���� ������ ������� � ������� ����������� */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE && !isDocFlow) {
				throw new SystemException("\n\n"
						+ "������ ��������� �� ������� ���������!\n"
						+ "�������� �������� � ������ ������ ����������.");
			}


			/** SUPP-91329... +++ �������� ������� ������... */
			ENPayment2SODAO enPayment2SODao = new ENPayment2SODAO(connection, userProfile);
			ENPayment2SOFilter enPayment2SOFilter = new ENPayment2SOFilter();
			enPayment2SOFilter.servicesObjectRef.code = svoCode;

			boolean isPayment = false;
			boolean isReturnPayment = false;

			int pArr[] = enPayment2SODao.getFilteredCodeArray(enPayment2SOFilter, 0, -1);
			for (int i = 0; i < pArr.length; i++) {
				ENPayment2SO payment2so = enPayment2SODao.getObject(pArr[i]);

				if (payment2so.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT
						|| payment2so.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT) {

					isPayment = true;
				}

				if (payment2so.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_RETURN_PAY) {

					isReturnPayment = true;
				}
			}

			if (isPayment && !isReturnPayment) {
				throw new SystemException("\n"
						+ "���������� ���������!\n"
						+ "�� ��������� �" + servicesObject.contractNumberServices + " ���� ������ �������.\n"
						+ "������� �������� ��������� ��������� �����.");
			}


			/**
			 *  SUPP-91700... +++ ������� � ������� "�������"
  			 *  �������� ������� �������� ��� ������� �������� �����
			 */
			/*
			if (servicesObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
				if (!isSilent) {
					throw new SystemException("\n"
							+ "³������ ����� ����� �������� ������, code = " + svoCode);
				}
			}
			*/

			// NET-4295
			// �������� - �� ���� ������ ���� ������ �� ������� ���������������� ���� �� ������.
			if (servicesObject.dfPackCode != Integer.MIN_VALUE && !isDocFlow)
				throw new SystemException("\n"
						+ "Error - dfPackCode doesn't equal null");

			if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "�������� ��� �������� �������� ����������!");
			}

			// NET-4443 ���� ������� �� ��������� �������������� ��������, ������� ��� �� ������ �� ������� ���������
			removeForCounters(svoCode, true);

			servicesObject.contractStatusRef.code = ENServicesContractStatus.CANCELED;

			if (commenGen != null && !commenGen.equals("")) {
				servicesObject.commentServicesGen = commenGen;
			}


			/** ������ ���������� ������ */
			if (servicesObject.dfPackCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

				docFlowLogic.registerServiceCancellationByDFPackCode(servicesObject.dfPackCode, new Date());
			}


			servicesObjectDao.save(servicesObject);

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}


	/**
	 *  ������� �������� � ������ "�������� ��������������� ����"
	 *
	 */
	public void prepaid(int svoCode, boolean priconnections, boolean isClient) {
		Connection authConn = null;
		try {

			ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
			ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(connection, userProfile);
			PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);

			ENServicesObject obj = objDAO.getObject(svoCode);

			if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				priconnections = true;
			}

			if (isClient && priconnections) {
				throw new SystemException("\n NET-4231..."
						+ "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
			}

			if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
				throw new SystemException("\n "
						+ "�������� ������� ������� ����� �� ���������� �������, code = " + svoCode);
			}

			if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "�������� ��� �������� �������� ����������!");
			}

			if (obj.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT) {
				throw new SystemException("\n\n"
						+ "NET-4235 ��� ����� �������� ������ \"�������� ��������� �������\" �� ���������������! ��� ��������: " + svoCode);
			}


			// SUPP-4100 �������� ��� �������� �������� � ������ "���������� ���������"
			// ��� �� ���� ������� ����� �� ���������� �� ������� "������� ������ ����������" (����� ��������� ����������� � ����������� ��������� )
			if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
				if (obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
						&& obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = svoCode;
					paymentSoFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;
					int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

					if (paymentArr.length == 0) {
						throw new SystemException("\n SUPP-4100..."
								+ "\n \n ��������� ������� ��������� ������(������� \" ������� ������ \") !!!");
					}
					// ����� �� ���������� �������� - �������� ��� ���� ������� ������ �� 0 )))
					BigDecimal summPrepay = new BigDecimal(0);
					for (int i = 0; i < paymentArr.length; i++) {
						ENPayment2SO paymentSoObj = paymentSoDAO.getObject(paymentArr[i]);
						summPrepay = summPrepay.add(paymentSoObj.sumTotal);
					}
	                if (summPrepay.doubleValue() == 0 ) {
	                	throw new SystemException("\n SUPP-4100..."
	                			+ "\n \n ��������� ������� ��������� ������(������� \" ������� ������ \") !!!");
					}
				}
			}

			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

	        // NET-4295 ������� ���������� � DocFlow
			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (!isDocFlowLifeCycleStartsWithSigning(obj)) {
					obj.dfPackCode = createDocFlowPack(obj);

					// NET-4560 - ������ ��������� ���� ���������� �����
					calculationBoundaryDateWork(obj);
					// !!���������� EnServicesObject �.� ��� ������� ��������
					// ���� ����������� ������
					obj = objDAO.getObject(obj.code);
				}
			}

			obj.contractStatusRef.code = ENServicesContractStatus.PREPAID;
			objDAO.save(obj);

			/* ��� ���������� ��� �� ����!!! */
			if (obj.contractKindRef.code != ENServicesContractKind.SALE) {
                /* ���� ���������� �� �� ������
                * � �� �������� ��� ���� ������� ����
                * � ������ ��������� �������������
                * � ��������� ��� ������ ��� ��� ��
                * ���� ��� ������������� �������� ����
                * ����� ��������� ������� ���� � ����� ������� � ������ �� ���������  �������� ������� ��� ������ ��������   */

				PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
	            // ��������� ���� ��������
				ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter plCalcFilter = new ENPlanWorkFilter();
				plCalcFilter.elementRef.code = obj.element.code;
				plCalcFilter.kind.code = ENPlanWorkKind.CALCULATION;
				int plCalcArr[] = plDAO.getFilteredCodeArray(plCalcFilter, 0, -1);
				ENPlanWork planCalc = null;
				if (plCalcArr.length > 0) {
					planCalc = plDAO.getObject(plCalcArr[0]);
				}

	            // ��������� �������� ����
				ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
				plFilter.elementRef.code = obj.element.code;
				plFilter.kind.code = ENPlanWorkKind.CURRENT;
				int plArr[] = plDAO.getFilteredCodeArray(plFilter, 0, -1);
				ENPlanWork planCurrent = null;
				if (plArr.length > 0) {
					planCurrent = plDAO.getObject(plArr[0]);
				}

	            // ��������� ����� ������� ����
				ENPlanWorkFilter plNpwFilter = new ENPlanWorkFilter();
				plNpwFilter.elementRef.code = obj.element.code;
				plNpwFilter.kind.code = ENPlanWorkKind.NPW;
				int plNpwArr[] = plDAO.getFilteredCodeArray(plNpwFilter, 0, -1);
				ENPlanWork planNpw = null;
				if (plNpwArr.length > 0) {
					planNpw = plDAO.getObject(plNpwArr[0]);
				}

				if (((pl.isReservedCalculationInContract(planCalc.code)) == true)
						&& ((pl.isAcessRemJobsByTime(planCurrent.departmentRef.code)) == true)
						&& (obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET)
						&& (planCurrent != null) && (planNpw == null)) {

					// ��������  ������� ���� �� ���������
					int planNpwCode = planWorkLogic.closePlan(planCurrent.code);
					//    ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
					//    newPlanObj.dateGen
					// ��� ������� ���� �������� ����� - �������
					try {
						createWorkOrderToPlanServices(planNpwCode);
						// �������� finmoldata
						createFinMolToPlanServices(planNpwCode);
	                    // ��������� ���� ���� �� ����� ������ ���� ���� ����� ������� ������ �� ������
						ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
						ENTransportItemFilter trFilter = new ENTransportItemFilter();
						trFilter.planRef.code = planNpwCode;
						ENTransportItemShortList trList = trDAO.getScrollableFilteredList(trFilter, 0, -1);

						ENTimeLineDAO tlDAO = new ENTimeLineDAO(connection, userProfile);
						ENTimeLineFilter tlFilter = new ENTimeLineFilter();
						tlFilter.servicesObjectRef.code = svoCode;
						ENTimeLineShortList tllist = tlDAO.getScrollableFilteredList(tlFilter, 0, -1);
						if (tllist.totalCount > 0) {

							Context context;
							try {
								context = new InitialContext();

								Object objTrordRef = context.lookup(ENTransportOrderController.JNDI_NAME);
								ENTransportOrderControllerHome TrordHome = (ENTransportOrderControllerHome) PortableRemoteObject
										.narrow(objTrordRef, ENTransportOrderControllerHome.class);
								ENTransportOrderController Trord = TrordHome.create();

								// ��������� � ������ ������������� ������������� ��������� ����������
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = obj.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("\n"
											+ "�� �������� ����������� ����������!");
								}

								ENTransportItemShort[] trShortArr = new ENTransportItemShort[trList.list.size()];

								for (int i = 0; i < trList.list.size(); i++) {
									trShortArr[i] = trList.get(i);
								}

								if (trShortArr.length != 0) {
									Trord.addTransportOrderWithTransportItems(trShortArr,
											tllist.get(0).timeMoveToObject,
											tllist.get(0).dateGen ,
											tllist.get(0).timeMoveOfObject ,
											tllist.get(0).dateGen ,
											td2tdList.get(0).transportDepartmentCode,
											ENTransportOrder.isAssignment_false,
											true);
								}

							} catch (NamingException e) {
								throw new SystemException(e.getMessage(), e);
							} catch (RemoteException e) {
								throw new SystemException(e.getMessage(), e);
							}
						}

					} catch (RemoteException e) {
						throw new SystemException(e.getMessage(), e);
					} catch (CreateException e) {
						throw new SystemException(e.getMessage(), e);
					}

				}
			}

			// net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
			// ���� ��� ����������� �� ������ ����� ��� ������ �������� ������� �������� ����� �� �����������
			if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
					&& obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
					&& !this.isGiveCounterOnBalanceByServicesObjectCode(obj.code)) {

				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoCreateFkorderMoveCounterForServices(obj);
			}


			/** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
			int servicesConsumerCode = getServicesConsumerCode(svoCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {
				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FOURTH, svoCode);

					/** ������� ���������� �� ������ � �����.. */
					docFlowLogic.saveSiteApplication(servicesConsumer.code, obj.isNoPay, obj.calcTypeRef.code,
							servicesConsumer.numberGen, obj.boundaryDateWork, obj.contractServicesSumma,
							obj.department.code, obj.contractNumberServices, null, obj.contragentName);
				}
			}



		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}



	/**
     * ������� �������� �� ������� �� ������� � ������ "������ ���������"
     */
	public int finishWorks(int objCode, boolean notFinishWorks, boolean forcedRecalcServicesFact,
			boolean validateProfitability) {

		Connection authConn = null;
		try {

			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

        	ENActDAO actDAO = new ENActDAO(connection, userProfile);
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
            ActLogic actLogic = new ActLogic(connection, userProfile);            
            ENServicesObject obj = objDAO.getObject(objCode);
            

            if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
                throw new SystemException("\n\nNET-4235 �������� ��� �������� �������� ����������!");
            }

            ///////////
            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {

                // ���� ��� ���. ���� ���� ��. ���� ��������, ���������� � ������ "������ ���������" ����� ������ ����� ������,
                // �.�. ������ �������� ������ ���� "�������� ��������� �������"
    			if (obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL
    					|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET
    					|| obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT
    					|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NOREZIDENT) {
    				if (obj.contractStatusRef.code != ENServicesContractStatus.PREPAID
    						&& obj.contractTypeRef.code != ENServicesContractType.OKSN) {

    					/*SUPP-55189 ���� ������� ����������� �� ������ �� ���� � ����� ���������� � ������� �����������*/
                    	/*SUPP-55401 ���� �����-�� ������� ����������� ������� ���� ���������� �� � ��� ���� ���������� � ������ ���������*/
                    	if (!((obj.contractStatusRef.code == ENServicesContractStatus.SIGNED
                    			|| obj.contractStatusRef.code == ENServicesContractStatus.PAID)&& obj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY)) {
                    		throw new SystemException("\n\nNET-4235 ������ ������� ���� ������ \"�������� ��������� �������\"!");
    					}
    				}
    			}
                // ���� ��� ��. ���� ������, ���������� � ������ "������ ���������" �����, �� ��������� ������,
                // �.�. ������ �������� ������ ���� "�����������" (��� "�������� ��������� �������")
                else if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                {
                    if ((obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                     obj.contractStatusRef.code != ENServicesContractStatus.PREPAID) && obj.contractTypeRef.code != ENServicesContractType.OKSN)
                    {
                        throw new SystemException("\n\nNET-4235 ������ ������� ���� ������ \"ϳ��������\" ��� \"�������� ��������� �������\"!");
                    }
                }
                else
                {
                    throw new SystemException("�������� ��� �����������!");
                }

            } else {

            	if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                {

                    if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                    	obj.contractStatusRef.code != ENServicesContractStatus.PAID)
                    {
                        throw new SystemException("\n\nNET-4235 ������ ������� ���� ������ \"ϳ��������\" ��� \"���������\"!");
                    }

                } else {

                	if (obj.contractStatusRef.code != ENServicesContractStatus.PAID)
                    {
                    	throw new SystemException("\n\nNET-4235 ������ ������� ���� ������ \"���������\"!");
                    }

                }

            }
            /////


            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(connection, userProfile);

            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.elementRef.code = obj.element.code;
            planFilter.kind.code = ENPlanWorkKind.FACT;
            int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

            for (int i = 0; i < planArr.length; i++)
            {
                //ENPlanWork plan = planDAO.getObject(planArr[i]);
                ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
                a2pFilter.plan.code = planArr[i];

                int[] a2pArr = a2pDAO.getFilteredCodeArray(a2pFilter, null, null, 0, -1, null);
                if (a2pArr.length == 0)
                {
                    throw new SystemException("\n\nNET-4235 ��������-���� � ����� " + planArr[i] + " �� �������� �� ����!");
                }
            }


            ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(connection, userProfile);

            // SUPP-4100 �������� ��� �������� �������� � ������ "������ �������"
            // ��� �� ���� ������� ����� �� ���������� �� ������� "������� ������ ����������" (����� ��������� ����������� � ����������� ��������� )
            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
            		obj.contractTypeRef.code != ENServicesContractType.OKSN) {
				if (obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
						&& obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {

					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = obj.code;
					paymentSoFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;
					int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

                    if (paymentArr.length == 0 ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n ��������� ������� ��������� ������(������� \" ������� ������ \") !!!");
                    }
                    // ����� �� ���������� �������� - �������� ��� ���� ������� ������ �� 0 )))
                    BigDecimal summPrepay = new BigDecimal(0);
                    for (int i = 0; i < paymentArr.length; i++) {
                        ENPayment2SO paymentSoObj = paymentSoDAO.getObject(paymentArr[i]);
                        summPrepay = summPrepay.add(paymentSoObj.sumTotal);
                    }
                    if (summPrepay.doubleValue() == 0 ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n ��������� ������� ��������� ������(������� \" ������� ������ \") !!!");
                    }
				}
			}

            // �������� ������ ����������� ������ (� �������������� ����� ��� ��� � ������)
            /**  NET-4422... +++ �� ������� �� ������ �������� ��� ���������� ����
             *   ���������� ��, ������������� ��� � ����������� ������� �� ��������.....
             *   ��������� ������ ���� � ������� ��....
             *
             */

            int[] actArr = actDAO.getArrayOfCodesByENElement(obj.element, null, null);
            
            boolean replaceCounterServices = checkReplaceCounterServices(obj.element.code);
            
            /*SUPP-103689 ������ ����������� � ������� �� ����� ������� replace_counter.
             * 	��� �����, �������������, ����� ����������� ������� �������� �� ����� (��� �������� ���� ������������ �� �� ����� ��������
             * �������� � ������ "������ ���������"*/
            boolean isCounters = actArr.length > 0 && actLogic.checkInSCCounterByActCode(actArr[0], false) > 0;

            /** SUPP-31596... ;)  ����� ����������� ������ �� �������������� ���������� ���� ������ ��� ��������� ������� ��������....  */
            if (replaceCounterServices || isCounters) {

				if (actArr.length == 0) {
					throw new SystemException("\n\n"
							+ "�� �������� ���������� ��� ��� ��������! ��� ��������: "+ obj.code);
				}

				if (actArr.length > 1) {
					throw new SystemException("\n\n"
							+ "������ �� ����� �������� ������ ����������� ����� ���������� �����!\n"
							+ "��������� ����������� ��������� ����!!!\n"
							+ "��� ��������: "+ obj.code);
				}

				ENAct act = actDAO.getObject(actArr[0]);

				if (act.statusRef.code == ENActStatus.GOOD) {
					SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

					if (!notFinishWorks) {

						scLogic.createUsageInput(act.code);
						obj.contractServicesSumma = recalcServicesFactCalc(obj, false, false);

					} else {
						obj.contractServicesSumma = recalcServicesFactCalc(obj, false, notFinishWorks);
					}

				} else {
					obj.contractServicesSumma = recalcServicesFactCalc(obj, true, false);
				}


            } else {
                if (notFinishWorks && validateProfitability) {
                	obj.contractServicesSumma = recalcServicesFactCalc(obj, forcedRecalcServicesFact, false);
                } else {
                	obj.contractServicesSumma = recalcServicesFactCalc(obj, forcedRecalcServicesFact, notFinishWorks);
                }
            }


            if (obj.contractServicesSumma == null)
            {
                throw new SystemException("\n\nNET-4235 ������� �� ��� ���������� ���� �� ���������!");
            }


            ///// 30.10.13 SUPP-8502 SUPP-8757 �������� ��������������
            // ���� ��������� ������ ��� ������������ �����
            if (isLicensed(obj) && validateProfitability) {
                validateProfitability(obj);
            }
            /////

            /**
             *  SUPP-12236...
             *  ������ ���������� ������ ��� ��������� ������� ��������
             */
            if (!notFinishWorks) {
                // ������ ������ �� "������ ���������"
                obj.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
                objDAO.save(obj);


                /** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
    			int servicesConsumerCode = getServicesConsumerCode(objCode);
    			if (servicesConsumerCode != Integer.MIN_VALUE) {

    				docFlowConnection = getDocFlowConnection();
    				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

    				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
    				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

    				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

    					// ����� �� ���� ������ ��� ������ � �������� �������!!! 
    					String ipAddres = Tools.getInetAddress();
    					if (ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
    						/** 17.03.2020... ��� ������� - ������� �������� ������ */
            				if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
            				} else {

                				/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
                				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
                					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
                				} else {
                					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, objCode);
                				}
            				}


            				/** ���������� �������������� ���������� ��� ������ ������ */
            				ENServicesObject sObject = objDAO.getObjectNoSegr(obj.code);

            		    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
            		    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

            				BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
            						.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));


            				/** topay - ������������� ����� ������ �� �������� (����� �������� � ������ "������ ���������") */
            				BigDecimal topay = new BigDecimal(0);

        					ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);
        					ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
        					factCalcFilter.servicesObjectRef.code = sObject.code;

        					int[] factCalcArr = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
        					if (factCalcArr.length > 0) {
        						topay = factCalcDAO.getObject(factCalcArr[0]).totalSumRest;
        					}


            				docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
            						servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
            						sObject.department.code, sObject.contractNumberServices, topay, sObject.contragentName);    						
    					}
        				
    				}


    				/** �������� ���  */
    				String message = "";

					/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
    				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
    					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
    							+ "Zaydit do personalnogo kabinetu dlya otrymannya ostatochnogo rozrahunku.";
    				} else {
    					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
    							+ "Dyakuyemo, shcho skorystalysya poslugamy KhersonOblEnergo.";
    				}

    				docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);

    			}


                /** !!! ���� ������ ������� ���������� ����������� � ���� ��� �������� �����
                 *
                 *  ��������� �� � ��������....
                 *  ��������� ����� � DocFlow....
                 */
                ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
                Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
                if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

                	/** �� ����������, ���� ������ �� ������ �������� */
                	if (!checkReplaceCounterServices(obj.element.code)) {
                		 if (obj.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
                                 && obj.personalAccountCode != Integer.MIN_VALUE) {

                             boolean workConnections = checkWorks(obj.code);

                             if (workConnections && obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {
                                 String commentGen = "������ �=" + obj.contractNumberServices +
                                         ", �� " + new SimpleDateFormat("dd.MM.yyyy").format(obj.contractDateServices).toString();
                                 connectedTY(obj.personalAccountCode, obj.department.code, getFactMaxDate(obj), commentGen);
                             }
                         }
                	}

                    /*����������� ������� � DocFlow*/
                    finishServicesObjectInDocFlow(obj);
                }


                /**
    			 *  NET-4406... 30.09.2014 +++ ����������� ��������� ������� ������������ �� ������....
    			 *  ���� ������� ������ � ����������, ��������� �������� � DocFlow...
    			 *
    			 */

    			updateDocMovementStatusByServicesConsumer(obj.code, true);


    			/** NET-4592... 27.05.2020... +++ ��� ����� �� �������, �������� ����� ��� ������� e-mail... */
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {

					if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
							&& obj.contractTypeRef.code == ENServicesContractType.OTHERS) {

						if (obj.customerEmail != null && obj.customerEmail.length() > 0) {

							sendBillToCustomer(obj, DocType.SECOND_BILL);
						}
					}
				}


            }

            return objCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			closeDocFlowConnection();

			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * SUPP-107222 ������� �������� � ������ "������ �������" �� ���� ������������� ������� ��� ��� �����������
	 * ��������� (���������� �������� �� ����������� � ������� "�������", ������� ��������� ��� ����������
	 * ��������� ����, � ��������� � "������ �������" ����������� ������� ��� ��� �����������)
	 *
	 * @param objCode - ��� �������� ({@link com.ksoe.energynet.valueobject.ENServicesObject})
	 */
	public void finishWorksForServicesObjectInFK(int objCode) {
		if (objCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		Connection authConn = null;

		try {
	        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
	        ENServicesObject obj = objDAO.getObject(objCode);

	        if (obj.contractStatusRef.code == ENServicesContractStatus.COMPLETED) {
	        	throw new SystemException("\n\n������ � ����� " + objCode + " ��� ����������� � ������ \"������ �������\"!");
	        }

            // ������ ������ �� "������ ���������"
            obj.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
            objDAO.save(obj);

            /** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
			int servicesConsumerCode = getServicesConsumerCode(objCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					// ����� �� ���� ������ ��� ������ � �������� �������!!! 
					String ipAddres = Tools.getInetAddress();
					if (ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
						/** 17.03.2020... ��� ������� - ������� �������� ������ */
        				if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
        					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
        				} else {

            				/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
            				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
            				} else {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, objCode);
            				}
        				}


        				/** ���������� �������������� ���������� ��� ������ ������ */
        				ENServicesObject sObject = objDAO.getObjectNoSegr(obj.code);

        		    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
        		    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

        				BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
        						.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));


        				/** topay - ������������� ����� ������ �� �������� (����� �������� � ������ "������ ���������") */
        				BigDecimal topay = new BigDecimal(0);

    					ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);
    					ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
    					factCalcFilter.servicesObjectRef.code = sObject.code;

    					int[] factCalcArr = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
    					if (factCalcArr.length > 0) {
    						topay = factCalcDAO.getObject(factCalcArr[0]).totalSumRest;
    					}


        				docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
        						servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
        						sObject.department.code, sObject.contractNumberServices, topay, sObject.contragentName);    						
					}
    				
				}

				/** �������� ���  */
				String message = "";

				/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
							+ "Zaydit do personalnogo kabinetu dlya otrymannya ostatochnogo rozrahunku.";
				} else {
					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
							+ "Dyakuyemo, shcho skorystalysya poslugamy KhersonOblEnergo.";
				}

				docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);

			}

			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            /** !!! ���� ������ ������� ���������� ����������� � ���� ��� �������� �����
             *
             *  ��������� �� � ��������....
             *  ��������� ����� � DocFlow....
             */
            ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

            	/** �� ����������, ���� ������ �� ������ �������� */
            	if (!checkReplaceCounterServices(obj.element.code)) {
            		 if (obj.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
                             && obj.personalAccountCode != Integer.MIN_VALUE) {

                         boolean workConnections = checkWorks(obj.code);

                         if (workConnections && obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {
                             String commentGen = "������ �=" + obj.contractNumberServices +
                                     ", �� " + new SimpleDateFormat("dd.MM.yyyy").format(obj.contractDateServices).toString();
                             connectedTY(obj.personalAccountCode, obj.department.code, getFactMaxDate(obj), commentGen);
                         }
                     }
            	}

                /*����������� ������� � DocFlow*/
                finishServicesObjectInDocFlow(obj);
            }


            /**
			 *  NET-4406... 30.09.2014 +++ ����������� ��������� ������� ������������ �� ������....
			 *  ���� ������� ������ � ����������, ��������� �������� � DocFlow...
			 *
			 */

			updateDocMovementStatusByServicesConsumer(obj.code, true);


			/** NET-4592... 27.05.2020... +++ ��� ����� �� �������, �������� ����� ��� ������� e-mail... */
			if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {

				if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
						&& obj.contractTypeRef.code == ENServicesContractType.OTHERS) {

					if (obj.customerEmail != null && obj.customerEmail.length() > 0) {

						sendBillToCustomer(obj, DocType.SECOND_BILL);
					}
				}
			}

	        
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			closeDocFlowConnection();

			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
 	}

    /**
     *  ���������� �� � ��������
     *
     *  @param personalAccountCode - ��� �������� �����
     *  @param departmentCode - ��� �������������
     *  @param executeWorkDate - ���� ���������� �����
     *  @param commentGen - �����������
     *
     */
    public void connectedTY(int personalAccountCode, int departmentCode,
            Date executeWorkDate, String commentGen) {
        try {
            DepartmentLogic depLogic = new DepartmentLogic(connection, userProfile);

            BillingServerData serverData = depLogic.getServerDataByDepartmentCode(departmentCode);

            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
                throw new SystemException("\n \n"
                        + "������� ��� ��������� ��� ��� ��������� �������!!!");
            }

            String jndi = "ksoe/contract/RecordPointHistoryController";
            String ejbHome = "com.ksoe.contract.ejb.RecordPointHistoryControllerHome";

			RecordPointHistoryControllerHome ejbRecordPointHistoryControllerHome;

			ejbRecordPointHistoryControllerHome = (RecordPointHistoryControllerHome) BillingEjbCache.getHome(jndi,
					ejbHome, serverData.billingServerIp, serverData.billingServerJnpPort);
			RecordPointHistoryController controller = ejbRecordPointHistoryControllerHome.create();

			RecordPointHistoryRequest request = new RecordPointHistoryRequest();

			request.recordPointCode = personalAccountCode;
			request.isWorkingCode = IsWorking.YES;
			request.executorCode = Integer.MIN_VALUE;
			request.disconnectionReasonCode = DisconnectionReason.BY_DEBT;
			request.date = executeWorkDate;
			request.comment = commentGen;

			controller.connect(request, true);

		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException("\n \n" + "��� ����� � ���������...");
		} catch (NamingException ne) {
			throw new SystemException("\n \n" + "��� ����� � ���������...");
		}
    }



	public void paid(int svoCode, boolean priconnections, boolean isClient) {
		Connection authConn = null;
		try {
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
            PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);

            ENServicesObject obj = objDAO.getObject(svoCode);

            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (isClient && priconnections) {
                throw new SystemException("\n NET-4231..."
                        + "\n \n ��� �������� �� ��������� ��� ������ �� ���������������!!!");
            }

            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (! isDocFlowLifeCycleStartsWithSigning(obj)) {
                    // SUPP-10624
                    // ���� ����� �������� �������� �� �������� "������ �������", ����� �� ���� ��������� � DocFlow
					if (obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
						obj.dfPackCode = createDocFlowPack(obj);

						// NET-4560 - ������ ��������� ���� ���������� �����
						calculationBoundaryDateWork(obj);
						// !!���������� EnServicesObject �.� ��� ������� �������� ���� ����������� ������
						obj = objDAO.getObject(obj.code);
					}
				}
			}


            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
            {
                if (isTKCalcKindNew(svoCode) && obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
                    if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                    	obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
                        throw new SystemException("\n\n�������� ������� ��� ��. ��� (������) ������� ����� �� ���������� ������� ��� ������� " +
                    	                          "� �������� \"������ �������\", ��� �������� = " + svoCode);
                    }
                } else if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
                    throw new SystemException("\n �������� ������� ������� ����� �� ���������� �������, ��� �������� = " + svoCode);
                }
            }
            else if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
            {
                ///// 15.05.13 NET-4235 ��������� ���������� � ������ "����������" ������ �������� �� �������� "������ ���������"!
                if (obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED)
                {
                    throw new SystemException("\n �������� ������� ������� ����� �� ������� � �������� \"������ �������\", ��� �������� = " + svoCode);
                }
                /////
            }
            else
            {
                throw new SystemException("\n\nNET-4235 �������� ��� ���������� ��� ��������! ��� ��������: " + svoCode);
            }

            ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(connection, userProfile);
            ENServicesFactCalcDAO factDAO = new ENServicesFactCalcDAO(connection, userProfile);
            // SUPP-4100 �������� ��� ������������� ������ ����� �� ����� ��������
            // ��� ��  ����� �� ���������� � ������������� ������� �� ������� "������� ������ ����������" ���� �� ������ ��� ����� ����� � ���� ������ ����������  (����� ����������� ��������� )
			if (obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = obj.code;
                    // ��������� ���������� � ������������� ������ �� ��������
                    paymentSoFilter.conditionSQL = " ENPAYMENT2SO.paymenttyperefcode in ( " + ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT +" , "+ ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT+ ")";

                    // SUPP-4214 ����� ���������� ����-����������� ����� ����� ������������ ��������
                    //   if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
                    //    {
                    //    throw new SystemException("�������� ��� �������� �������� ����������!");
                    //    }
                    int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

                    if (paymentArr.length == 0 ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n ��������� ������� ������ �� �������� (������� \" ������� ������ \") !!!");
                    }
                    // ��������  ������ - �������� ��� ���� ��� ���� ������ ��� ����� ����� �� ���� ������ ������� ����� �������� )))
					BigDecimal summPay = new BigDecimal(0);

					ENServicesFactCalcFilter factFilter = new ENServicesFactCalcFilter();
					factFilter.servicesObjectRef.code = obj.code;
					int[] factArr = factDAO.getFilteredCodeArray(factFilter, 0, -1);
					ENServicesFactCalc factObj = factDAO.getObject(factArr[0]);

					BigDecimal factTotalSum = new BigDecimal(0);
					if (factObj.totalSum != null) {
						factTotalSum = factObj.totalSum;
					}

					for (int i = 0; i < paymentArr.length; i++) {
						ENPayment2SO paymentSoObj = paymentSoDAO.getObject(paymentArr[i]);
						summPay = summPay.add(paymentSoObj.sumTotal);
					}


                    if ( factTotalSum.doubleValue() > summPay.doubleValue()  ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n �������� ������ �� �������� "+ summPay  +"(���. � ���) ������ �� ��������� ���� �� �������� "+ factTotalSum +"(���. � ���) (������� \" ������� ������ \") !!!");
					}
				}
			}

            obj.contractStatusRef.code = ENServicesContractStatus.PAID;
            objDAO.save(obj);


            /* ��� ���������� ��� �� ����!!! */
            if (obj.contractKindRef.code != ENServicesContractKind.SALE && obj.statusRef.code != ENServicesObjectStatus.CLOSED) {

                //�������� ������������ �������� ����� � Billing-�
                if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION &&
                    obj.cnPackCode != Integer.MIN_VALUE &&
                    obj.cnSubsystemTypeRef.code != Integer.MIN_VALUE)
                {
                    ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(connection, userProfile);
                    ENTechConditionsServicesFilter tcsFilter = new ENTechConditionsServicesFilter();
                    tcsFilter.conditionSQL =
                    " entechconditionsservcs.cnpackcode = " + obj.cnPackCode +
                    " and entechconditionsservcs.cnsubsystemtyperefcode = " + obj.cnSubsystemTypeRef.code;
					int[] tcsCodeArr = tcsDAO.getFilteredCodeArray(tcsFilter, 0, -1);

					if (tcsCodeArr.length != 0) {
						ENTechConditionsServices tcsObj = tcsDAO.getObject(tcsCodeArr[0]);

						//����������� ����� � Billing-� ������ ����������� ��� ���� ��������� ������������ �������������
						//� ��� ��������� �������� ������� �������������� ������������� (����� ����)
						boolean isCreateVirtualAccount = (tcsObj.connectionKindRef.code == ENConnectionKind.NO_STANDART
								&& (obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL
										|| obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT))
								|| (tcsObj.connectionKindRef.code == ENConnectionKind.STANDART);

						if (isCreateVirtualAccount) {
							RecordPointWFDAO wfrpDAO = new RecordPointWFDAO(connection, userProfile);
							RecordPointWF wfrpObj = new RecordPointWF();
							wfrpObj.accountnumber = null;

							wfrpObj.contractnumber = obj.contractNumberServices;
							if (obj.contractNumber != "") {
								wfrpObj.contractnumber = wfrpObj.contractnumber + "/" + obj.contractNumberServices;
							}

							wfrpObj.contragentname = obj.contragentName;
							wfrpObj.contragentaddress = obj.contragentAddress;
							wfrpObj.contragentpassport = obj.contragentPassport;
							wfrpObj.contragentokpo = obj.contragentOkpo;
							wfrpObj.cnpackcode = obj.cnPackCode;

							wfrpObj.rencode = Integer.MIN_VALUE;

							//���������� ���� ���-� �� ��������, ���������� �� ���������� ��
							if (tcsObj.element != null) {
								if (tcsObj.element.renRef != null) {
									if (tcsObj.element.renRef.code != Integer.MIN_VALUE) {
										wfrpObj.rencode = tcsObj.element.renRef.code;
									}
								}
							}
							//���� ��� ���-� ������ - ���������� �� ��������, ���������� �� ���������� ��
							if (wfrpObj.rencode == Integer.MIN_VALUE || wfrpObj.rencode == 0) {
								if (obj.element != null) {
									if (obj.element.renRef != null) {
										if (obj.element.renRef.code != Integer.MIN_VALUE) {
											wfrpObj.rencode = obj.element.renRef.code;
										}
									}
								}
							}

							wfrpObj.isbyt = Integer.MIN_VALUE;
							if (obj.contragentTypeRef != null) {
								if (obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL
										|| obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT) {
									wfrpObj.isbyt = 1;
								} else if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET
										|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET
										|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NOREZIDENT) {
									wfrpObj.isbyt = 0;
								}
							}

							wfrpObj.contractdate = obj.contractDateServices;
							wfrpObj.iscounterinst = 1; // �� ��������� ������� ��������� �� ���������� ����
							wfrpObj.rpcode = Integer.MIN_VALUE;
							wfrpObj.rpname = "";

							wfrpObj.cnsubsystemtyperefcode = obj.cnSubsystemTypeRef.code;
							wfrpObj.phasityrefcode = Integer.MIN_VALUE;
							wfrpObj.techcondservicesrefcod = tcsObj.code;

							if (tcsObj.connectionKindRef != null) {
								if (tcsObj.connectionKindRef.code == ENConnectionKind.STANDART) {
									if (tcsObj.tariffEntryRef != null) {
										if (tcsObj.tariffEntryRef.code != Integer.MIN_VALUE) {
											ENConnectionTariffDAO tariffDAO = new ENConnectionTariffDAO(connection, userProfile);
											ENConnectionTariffEntryDAO tEntryDAO = new ENConnectionTariffEntryDAO(connection, userProfile);

											ENConnectionTariffEntry tEntry = tEntryDAO.getObject(tcsObj.tariffEntryRef.code);
											ENConnectionTariff tariffObj = tariffDAO.getObject(tEntry.tariffRef.code);

											if (tariffObj.phasityRef != null)
												if (tariffObj.phasityRef.code != Integer.MIN_VALUE) {
													wfrpObj.phasityrefcode = tariffObj.phasityRef.code;
												}
										}
									}
								}

								if (tcsObj.connectionKindRef.code == ENConnectionKind.NO_STANDART
										|| wfrpObj.rencode == 0 || wfrpObj.rencode == Integer.MIN_VALUE) {
									Connection cnConnection = null;
									try {
										// ���������� ������ ���������� ������������� � 01.03.2013 ��������� EnergyWorkFlow
										cnConnection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
										CNPackDAO packDAO = new CNPackDAO(cnConnection, userProfile);
										CNPack packCN = packDAO.getObjectByCodeAndSubsystem(obj.cnPackCode, obj.cnSubsystemTypeRef.code);

										if (tcsObj.connectionKindRef.code == ENConnectionKind.NO_STANDART) {
											if (packCN.tension_point.doubleValue() >= 220
													&& packCN.tension_point.doubleValue() < 380) {
												wfrpObj.phasityrefcode = ENConnectionPhasity.I;
											} else if (packCN.tension_point.doubleValue() >= 380) {
												wfrpObj.phasityrefcode = ENConnectionPhasity.III;
											}
										}

										// ���� ��� ���-� ������������� ���� ��������������� - ���������� �� ������
										if (wfrpObj.rencode == 0 || wfrpObj.rencode == Integer.MIN_VALUE) {

											wfrpObj.rencode = packCN.id_ren;
											switch (packCN.id_ren) {
											case 1001: // ���
											{
												wfrpObj.rencode = 0; // ���
												break;
											}
											case 1: // ���������� �������
											{
												wfrpObj.rencode = 9; // ����
												break;
											}
											case 11: // �.����������� �������
											{
												wfrpObj.rencode = 10; // �.����������� ���
												break;
											}
											case 13: // �������������� �������
											{
												wfrpObj.rencode = 16; // ��������� ���
												break;
											}
											case 15: // ������������ �������
											{
												wfrpObj.rencode = 20; // ���������� ���
												break;
											}
											default: {
												wfrpObj.rencode = packCN.id_ren;
												break;
											}
											}
										}

									} catch (DatasourceConnectException e) {
										throw new SystemException("��� ����� � EnergyWorkFlow ...", e);
									} finally {
										try {
											if ((cnConnection != null) && !cnConnection.isClosed())
												cnConnection.close();
										} catch (SQLException e) {
										}
									}
								}
							}

							RecordPointWFFilter wfrpFilter = new RecordPointWFFilter();
							wfrpFilter.conditionSQL = "recordpointwf.cnpackcode = " + obj.cnPackCode +
									"and recordpointwf.cnsubsystemtyperefcode = " + obj.cnSubsystemTypeRef.code;

							int wfrpCodeArr[] = wfrpDAO.getFilteredCodeArray(wfrpFilter, 0, -1);
							if (wfrpCodeArr.length == 0) {
								wfrpDAO.add(wfrpObj);
							} else {
								RecordPointWF wfrpOld = wfrpDAO.getObject(wfrpCodeArr[0]);
								wfrpObj.accountnumber = wfrpOld.accountnumber;
								wfrpDAO.save(wfrpObj);
							}
						}
					}
				}

                /* ���� ���������� �� �� ������
                * � �� �������� ��� ���� ������� ����
                * � ������ ��������� �������������
                * � ��������� ��� ������ ��� ��� ��
                * ���� ��� ������������� �������� ����
                * ����� ��������� ������� ���� � ����� ������� � ������ �� ���������  �������� ������� ��� ������ ��������   */

                // ��������� ���� ��������
				ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter plCalcFilter = new ENPlanWorkFilter();
				plCalcFilter.elementRef.code = obj.element.code;
				plCalcFilter.kind.code = ENPlanWorkKind.CALCULATION;
				int plCalcArr[] = plDAO.getFilteredCodeArray(plCalcFilter, 0, -1);
				ENPlanWork planCalc = null;
				if (plCalcArr.length > 0) {
					planCalc = plDAO.getObject(plCalcArr[0]);
				}

                // ��������� �������� ����
				ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
				plFilter.elementRef.code = obj.element.code;
				plFilter.kind.code = ENPlanWorkKind.CURRENT;
				int plArr[] = plDAO.getFilteredCodeArray(plFilter, 0, -1);
				ENPlanWork planCurrent = null;
				if (plArr.length > 0) {
					planCurrent = plDAO.getObject(plArr[0]);
				}

                // ��������� ����� ������� ����
				ENPlanWorkFilter plNpwFilter = new ENPlanWorkFilter();
				plNpwFilter.elementRef.code = obj.element.code;
				plNpwFilter.kind.code = ENPlanWorkKind.NPW;
				int plNpwArr[] = plDAO.getFilteredCodeArray(plNpwFilter, 0, -1);
				ENPlanWork planNpw = null;
				if (plNpwArr.length > 0) {
					planNpw = plDAO.getObject(plNpwArr[0]);
				}

				if (((planWorkLogic.isReservedCalculationInContract(planCalc.code)) == true)
						&& ((planWorkLogic.isAcessRemJobsByTime(planCurrent.departmentRef.code)) == true)
						&& (obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET)
						&& (planCurrent != null) && (planNpw == null)) {

					// ��������  ������� ���� �� ���������
                    int planNpwCode = planWorkLogic.closePlan(planCurrent.code);
                    // ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
                    // newPlanObj.dateGen
                    // ��� ������� ���� �������� ����� - �������
					try {
						createWorkOrderToPlanServices(planNpwCode);
						// �������� finmoldata
						createFinMolToPlanServices(planNpwCode);
						// ��������� ���� ���� �� ����� ������ ���� ���� ����� ������� ������ �� ������
						ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
						ENTransportItemFilter trFilter = new ENTransportItemFilter();
						trFilter.planRef.code = planNpwCode;
						ENTransportItemShortList trList = trDAO.getScrollableFilteredList(trFilter, 0, -1);

						ENTimeLineDAO tlDAO = new ENTimeLineDAO(connection, userProfile);
						ENTimeLineFilter tlFilter = new ENTimeLineFilter();
						tlFilter.servicesObjectRef.code = svoCode;
						ENTimeLineShortList tllist = tlDAO.getScrollableFilteredList(tlFilter, 0, -1);
						if (tllist.totalCount > 0) {

							Context context;
							try {
								context = new InitialContext();

								Object objTrordRef = context.lookup(ENTransportOrderController.JNDI_NAME);
								ENTransportOrderControllerHome TrordHome = (ENTransportOrderControllerHome) PortableRemoteObject
										.narrow(objTrordRef, ENTransportOrderControllerHome.class);
								ENTransportOrderController Trord = TrordHome.create();

								// ��������� � ������ ������������� ������������� ��������� ����������
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = obj.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("�� �������� ����������� ����������!");
								}

								ENTransportItemShort[] trShortArr = new ENTransportItemShort[trList.list.size()];

								for (int i = 0; i < trList.list.size(); i++) {
									trShortArr[i] = trList.get(i);
								}
								if (trShortArr.length != 0) {
									Trord.addTransportOrderWithTransportItems(trShortArr,
											tllist.get(0).timeMoveToObject,
											tllist.get(0).dateGen ,
											tllist.get(0).timeMoveOfObject ,
											tllist.get(0).dateGen ,
											td2tdList.get(0).transportDepartmentCode,
											ENTransportOrder.isAssignment_false,
											true);
								}

							} catch (NamingException e) {
								throw new SystemException(e.getMessage(), e);
							} catch (RemoteException e) {
								throw new SystemException(e.getMessage(), e);
							}
						}

					} catch (RemoteException e) {
						throw new SystemException(e.getMessage(), e);
					} catch (CreateException e) {
						throw new SystemException(e.getMessage(), e);
					}
				}
			}


            // SUPP-4588 - ��������� ��� ������ �������� ���� ������� ������������� �� ������ �������� �����
            // ������ ������ ���� ������ ��� ����� ����� �� ���������
            /** 10.07.2013 +++ ��� ���������� ��� �� ����!!! */
            /** SUPP-5137... 11.07.2013 +++ �������� ����� ������ ��� ����� !!! */

            if (obj.contractTypeRef.code == ENServicesContractType.OTHERS
                    || obj.contractTypeRef.code == ENServicesContractType.TY) {
                if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
                {
                    ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(connection, userProfile);
                    ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
                    calcFilter.conditionSQL = " ENCALCCONTRACTTOTAL.code in (" +
                                                " select c.code \n" +
                                                " from enservicesobject so, enplanwork p, encalccontracttotal c \n" +
                                                " where so.code = " + obj.code + " \n" +
                                                "   and p.kindcode = " + ENPlanWorkKind.CALCULATION + " \n" +
                                                "   and p.elementrefcode = so.elementcode \n" +
                                                "   and c.planrefcode = p.code \n" +
                                                " ) \n";
                    ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

                    if (calcList.totalCount == 0)
                    {
                        throw new SystemException("�� �������� ���������� ��� ���������! (��� ��'����: " + obj.code + ")");
                    }

                    if (calcList.totalCount > 1)
                    {
                        throw new SystemException("���������� ��� ��������� ����� ������! (��� ��'����: " + obj.code + ")");
                    }

					BigDecimal totalSum = calcList.get(0).totalCost; // ����� �� �������� � ���

					// ������� ����� ������ �� �������� � ���
					ENPayment2SODAO paymentDAO = new ENPayment2SODAO(connection, userProfile);
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = obj.code;

					int[] paymentArr = paymentDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

					BigDecimal summPayment = new BigDecimal(0); // ����� � ���
					for (int i = 0; i < paymentArr.length; i++) {
						ENPayment2SO paymentSoObj = paymentDAO.getObject(paymentArr[i]);
						if (paymentSoObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT
								|| paymentSoObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT) {
							summPayment = summPayment.add(paymentSoObj.sumTotal);
						} else if (paymentSoObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_RETURN_PAY) {
							summPayment = summPayment.subtract(paymentSoObj.sumTotal);
						}
					}

					if (obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY
							&& obj.contractTypeRef.code != ENServicesContractType.TY) {
						if (summPayment.doubleValue() < totalSum.doubleValue()) {
							throw new SystemException("\n\n"
									+ "��������� �������� ������. ���� ��������� ����� ("
									+ summPayment
									+ " ���.) ����� �� ���� ����� ��������� ("
									+ totalSum + " ���.) !!! ");
						}
					}
                }
            }

            // 21.07.2018 ����������� �� ������ prepaid, �.�. �� ������ �� ����� ���������� (��� ����� ���������)
			// net-4445 ������� �������� � ������� �� ������� �� ������� ��������������� ������ �� �������� (���� ��� ������ �� ��������� )
			// ���� ��� ����������� �� ������ ����� ��� ������ �������� ������� �������� ����� �� �����������
            if (isTKCalcKindNew(svoCode)) {

                if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
    					&& obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET) {

    				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
    				fkOrderLogic.autoCreateFkorderMoveCounterForServices(obj);
    			}

            }


			/** ���� ������ ������� � ������� � ����� - ������ � ������� �� ����� */
			int servicesConsumerCode = getServicesConsumerCode(svoCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

				/** ������� ���������� �� ������ � �����.. */
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					/** 17.03.2020... ��� ������� - ��������� */
					if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
						docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, svoCode);
					} else {

						/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
						if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, svoCode);
						} else {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FOURTH, svoCode);
						}
					}


					ENServicesObject sObject = objDAO.getObjectNoSegr(svoCode);

			    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
			    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

					BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
							.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));

					docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);
				}



				/** NET-4564... 12.12.2019...  +++ ��� ��������� � ����� ������� "�� �����" */
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
					String message = "Za Vashoyu zayavkoyu N:" + servicesConsumer.numberGen + " zaversheno roboty. "
							+ "Dyakuyemo, shcho skorystalysya poslugamy KhersonOblEnergo.";

					/** �������� ���  */
					docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);
				}
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			closeDocFlowConnection();

			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public int addServicesObjectForCalculation(ENServicesObject servicesObject) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(connection, userProfile);

			int objectCode = Integer.MIN_VALUE;
			servicesObject.contractKindRef.code = ENServicesContractKind.SERVICES;
			servicesObject.contractStatusRef.code = ENServicesContractStatus.GOOD;

			if (servicesObject.contractNumber == null)
				servicesObject.contractNumber = "" + new Date().getTime();

			if (servicesObject.contractDate == null)
				servicesObject.contractDate = new Date();

			if (servicesObject.name == null)
				servicesObject.name = userProfile.userName + " " + new Date().getTime();

			servicesObject.department.code = ENConsts.ENDEPARTMENT_KSOE;

			///// 12.08.2011
			servicesObject.contractNumberServices = "" + objectDAO._collectAutoIncrementNumber();
			/////

			servicesObject.statusRef.code = ENServicesObjectStatus.GOOD;

			objectCode = this.addServicesObject(servicesObject);

			return objectCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public int addServicesObject(ENServicesObject servicesObject) {
		try {
			ENElementDAO elementDAO = new ENElementDAO(userProfile, connection);
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(connection, userProfile);
			ENWarrantDAO warrantDAO = new ENWarrantDAO(connection, userProfile);

			servicesObject.setDomain_info(null);

			if (servicesObject.contractKindRef == null || servicesObject.contractKindRef.code == Integer.MIN_VALUE) {
				throw new SystemException("\n "
						+ "�������� ��� ��������!!!");
			}

	        /**
	         *   NET-3971
	         *   22.12.2012 +++ �������� ������������
	         *   SUPP-4358
	         *   11.06.2013 +++ �������� �� 100
	         *
	         *   SUPP-70982... +++ ������� ���������� �������� �� add � save....
	         */
			if (servicesObject.contractServicesPower != null && servicesObject.warrantRef != null
					&& servicesObject.warrantRef.code != Integer.MIN_VALUE) {

				ENWarrant warrant = warrantDAO.getObject(servicesObject.warrantRef.code);

				/** SUPP-5130... 11.07.2013 +++ ���� �������� � �������� ��������� ��������� �������� � ������������ */
				if (servicesObject.contractServicesPower.doubleValue() > warrant.power) {
					throw new SystemException("\n"
							+ "\n ��������� �� ������� ��������!!!"
							+ "\n ������ ��������� �������� ��������!!!");
				}
			}


			servicesObject.dateEdit = new Date();
			servicesObject.userGen = userProfile.userName;

			ENElement e = new ENElement();
			e.typeRef.code = ENElementType.SERVICES_OBJECT;

			// ������ ������ �� ��-�������� !!! � �� ����� �����???
			// ��� ����� ������ �������� ...
			if (servicesObject.element.renRef != null) {
				if (servicesObject.element.renRef.code != Integer.MIN_VALUE) {
					e.renRef.code = servicesObject.element.renRef.code;
				}
			}

			if (e.renRef.code == Integer.MIN_VALUE) {
				e.renRef.code = 0;
			}

			servicesObject.element.code = elementDAO.add(e);

			servicesObject.element.renRef.code = e.renRef.code;
			servicesObject.element.typeRef.code = e.typeRef.code;
			servicesObject.statusRef.code = ENServicesObjectStatus.GOOD;

			return objectDAO.add(servicesObject);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public boolean isTKCalcKindNew(int servicesObjectCode) {

		boolean result = false;

		try {

			/** SUPP-74840... +++ ��� ��������� �� ���������� ��� �������� ����������� ����������... �� ������ ���... */
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
			TKCalcCostDAO calcCostDao = new TKCalcCostDAO(connection, userProfile);

			ENServicesObject servicesObject = servicesObjectDao.getObjectNoRef(servicesObjectCode);

			if (servicesObject.contractKindRef.code == ENServicesContractKind.SALE) {
				return true;
			}

			ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);

			ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
			p2cFilter.conditionSQL = " enplanwork2classfctntp.code in ( " +
									 " select p2c.code from enservicesobject so, enplanwork p, enplanwork2classfctntp p2c \n " +
									 " where so.code = " + servicesObjectCode +
								     " and so.elementcode = p.elementrefcode \n "+
									 " and p.kindcode = " + ENPlanWorkKind.CALCULATION +
									 " and p.code = p2c.planrefcode limit 1 )";

			ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);

			if (p2cList.totalCount == 0) {

				ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
				servicesObjectRef.code = servicesObjectCode;

				int[] servicesCosts = servicesCostDao.getCodesbyENServicesObjectRef(servicesObjectRef);

				if(servicesCosts.length > 0) {
					ENServicesCost servicesCost = servicesCostDao.getObject(servicesCosts[0]);
					TKCalcCost calcCost = calcCostDao.getObject(servicesCost.tkCalcCostRef.code);
					return calcCost.calcKindRef.code == TKCalcKind.NEW || calcCost.calcKindRef.code == TKCalcKind.NEW2;
				}

				throw new SystemException("\n\n�� �������� ������� ������ ���������!");
			}

			if (p2cList.get(0).calcKindRefCode == TKCalcKind.NEW || p2cList.get(0).calcKindRefCode == TKCalcKind.NEW2) {
				result = true;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return result;

	}


	/**
	 *	��������� ������ ������������ ��������� ����
	 *
	 *	@param soCode
	 *	@param creatMetodCode
	 */
	public void changeActIncomeCreatMetod(int soCode, int creatMetodCode) {

		PreparedStatement statement = null;
		String updateSql = " update enservicesobject set actincomecreatmetdrfcd = " + creatMetodCode + " where code = " + soCode;

		try {

			statement = connection.prepareStatement(updateSql);
			statement.execute();

		} catch (SQLException e) {
			throw new SystemException(e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
		}
	}

	public void checkTkCalcKind(int planWorkCode) {
        try {
            ENPlanWork2ClassificationTypeDAO plan2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);


            ENPlanWork2ClassificationTypeFilter plan2clFilter = new ENPlanWork2ClassificationTypeFilter();
            plan2clFilter.planRef.code = planWorkCode;

            ENPlanWork2ClassificationTypeShortList plan2clList = plan2clDAO.getScrollableFilteredList(plan2clFilter, 0, -1);

            if (plan2clList.totalCount<=1) return;
            int tkCalcKindCode = plan2clList.get(0).calcKindRefCode;

            for (int j = 0; j < plan2clList.totalCount; j++) {
            	if (plan2clList.get(j).calcKindRefCode !=  tkCalcKindCode ){
            		throw new SystemException("\n "
                            + " ���������� �������� ����������� � ������ �������� ���������� !!! ");
            	}


			}


        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        }
    }

	public String getCodeEICForServices(ENServicesObject soobj) {
		try {
			String codeEIC = "";
			callcenterConnection  = getCallcenterConnection();


			CCRecordPointDAO ccRpDAO = new CCRecordPointDAO(callcenterConnection, userProfile);

			int elementRenCodeForCC = soobj.element.renRef.code;
			if (elementRenCodeForCC == 21) {
				elementRenCodeForCC = 9;
			}


			String condition = "";
			condition = " cccustomer.res = ( select r.res from ccren r where r.code in ( " + elementRenCodeForCC + "  ) ) and "
            + "  CCCUSTOMER.accountnumber = '" + soobj.personalAccountNumber +"'";

			if( !soobj.personalAccountUid.equals("")){
				condition = " cccustomer.uid = '" + soobj.personalAccountUid+"' and " +
                        "  CCCUSTOMER.accountnumber = '" + soobj.personalAccountNumber +"'" ;
			}


			CCRecordPointFilter ccRpFil = new CCRecordPointFilter();
			ccRpFil.conditionSQL = condition;
			ccRpFil.orderBySQL = " ccrecordpoint.eic ";

			CCRecordPointShortList ccRpList = ccRpDAO.getScrollableFilteredList(ccRpFil, 0, -1);
			if(ccRpList.totalCount > 0 ) {
				codeEIC= ccRpList.get(0).eiccode;
				return codeEIC;
			}

			return codeEIC;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeCallCenterConnection();
		}
	}

	public void calculateSOValuesDate(int soCode, int valCode, int daysCnt) throws PersistenceException {
		calculateSOValuesDate(soCode, valCode, daysCnt, true);
	}

	public void calculateSOValuesDate(int soCode, int valCode, int daysCnt, boolean isException) throws PersistenceException {

		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject so = soDAO.getObjectNoSegr(soCode);
		ENSOValuesDAO soValDAO = new ENSOValuesDAO(connection, userProfile);
		ENSOValuesFilter soValFilter = new ENSOValuesFilter();

		ENSOValuesTypeDAO soValTypeDAO = new ENSOValuesTypeDAO(connection, userProfile);
		ENSOValuesType soValType = soValTypeDAO.getObject(valCode);

		soValFilter.soValuesType.code = valCode;
		soValFilter.servicesobject.code = soCode;
		ENSOValuesShortList soValList = soValDAO.getScrollableFilteredList(soValFilter, 0, -1);

		if (soValList.totalCount == 0) {
			if (isException) {
				throw new SystemException("��� �������� - " + so.contractNumberServices + " �� ������� " + soValType.name);
			} else {
				return;
			}
		}

		ENSOValues soVal = soValDAO.getObject(soValList.get(0).code);

		if (soVal.soValuesType.code != ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS) {
			return;
		} else
		{
			soVal.dateVal = Tools.addDays(soVal.dateVal, daysCnt);
			soValDAO.save(soVal);
		}


	}

	/**
	 *	���������� ����� �  ���� �������� �� ������������� �� ���� ����������� �����
	 *
	 *	@param actCode - ��� ����
	 *
	 */
	public String[] getPriconnectionInfo(int actCode) {

		String outName[] = new String[2];
		outName[0] = "undefine";
		outName[1] = "";

		String sql = " select  ts.contractnumber , to_char(ts.contractdate,'dd.MM.yyyy') as contractdate "
				+ " from enact2enplanwork a2p , entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc , "
		        + " entechconditionsservcs ts, enconnectionkind k " +
						" where a2p.actrefcode = " + actCode +
						" and a2p.plancode= tc2p.planrefcode " +
						" and tc2p.techconservicesrefcode = s2tc.techcondservrefcode " +
						" and ts.code = s2tc.techcondservrefcode  \n" +
						" and ts.connectionkindrefcode = k.code   \n" +
						" union all \n" +
						" select so.contractnumberservices as  contractnumber , to_char(so. contractdateservices ,'dd.MM.yyyy') as contractdate \n" +
						"  from  \n" +
						"  enservicesobject so , enact a  ,  enservicesobject2techcondtnsservices so2pric , \n" +
						"  entechconditionsservcs ts, enconnectionkind k   \n" +
						"  where so.elementcode = a.elementcode  \n" +
						"  and a.code = " + actCode +
						"  and so.code = so2pric.servicesobjectrefcode \n" +
						"  and ts.code = so2pric.techcondservrefcode  \n" +
						"  and ts.connectionkindrefcode = k.code \n" +
						" union all \n" +
						" select so.contractnumberservices as  contractnumber , to_char(so. contractdateservices ,'dd.MM.yyyy') as contractdate"
						+ "  from  ENSOProj2SOConn pfj2so , enservicesobject so , enact a , enservicesobject2techcondtnsservices so2pric , entechconditionsservcs ts, enconnectionkind k \n" +
						" where pfj2so.soprojrefcode = so.code \n" +
						" and so.elementcode = a.elementcode \n" +
						" and a.code = " + actCode +
						" and so2pric.servicesobjectrefcode = pfj2so.soconnrefcode \n" +
						" and ts.code = so2pric.techcondservrefcode   \n" +
						" and ts.connectionkindrefcode = k.code \n"+
		                " limit 1 \n"
						//+ ") "
		                ;

//String sql = "select e.ename, e.invnumber from enelementdata as e where e.ecode = ?";
  	Vector<Integer> params = new Vector<>();
  	//params.add(elementCode);
  	Object[] arr = BaseDAOUtils.executeStatementAndReadObject(connection, sql, params
			, new BaseDAOUtils.ObjectArrayFromResultSetTransformator(), false);

  	if(arr != null && arr.length == 2) {
		outName[0] = (arr[0] != null) ? arr[0].toString() : null;
		outName[1] = (arr[1] != null) ? arr[1].toString() : null;
  	}

		return outName;
	}

	public int createDFDocByENServicesObject(int servicesObjectCode, int dfDocType, 
                        String docName, String docNum, Date docDate, int dfDepartmentCode, String customerAddress, String customerName, String customerPostCode) throws PersistenceException {

		return createDFDocByENServicesObject(servicesObjectCode, dfDocType, docName, docNum, docDate, 
                                dfDepartmentCode, customerAddress, customerName, customerPostCode, 
                                true);
	}

	/**
	 *
	 * @param servicesObjectCode
	 * @param dfDocType
	 * @param docName
	 * @param docNum
	 * @param docDate
	 * @param dfDepartmentCode
	 * @param customerAddress
	 * @param customerName
	 * @param customerPostCode
	 * @param ignoreDocDate - ���� = true, ���. �������� �������������� ������� ���������� �����, ����� - ����� docDate
	 * @return
	 * @throws PersistenceException
	 */
	public int createDFDocByENServicesObject(int servicesObjectCode, int dfDocType, 
                        String docName, String docNum, Date docDate, int dfDepartmentCode, 
                        String customerAddress, String customerName, String customerPostCode,
			boolean ignoreDocDate) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ��������!");
		}

		if (dfDocType == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
		}

		ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject servicesObject = servicesObjectDAO.getObjectNoSegr(servicesObjectCode);

		if (servicesObject == null) {
			throw new SystemException("\n\n�� �������� ������ � ����� " + servicesObjectCode + " !");
		}

		String contragentName = servicesObject.contragentName;
		if (customerName != null && !customerName.isEmpty()) {
			contragentName = customerName;
		}

		String postCode = servicesObject.postCode;
		if (customerPostCode != null && !customerPostCode.isEmpty()) {
			postCode = customerPostCode;
		}

		return createDFDoc(contragentName, servicesObject.contragentAddress, servicesObject.contragentPhoneNumber,
				postCode, servicesObject.department.code, dfDocType, docName, docNum, docDate, dfDepartmentCode, customerAddress, ignoreDocDate);
	}

	/**
	 *
	 * @param contragentName            - ��������
	 * @param contragentAddress         - ������ ���������
	 * @param contragentPhoneNumber     - ����� �������� ���������
	 * @param postCode                  - �������� ������
	 * @param departmentCode            - ϳ�������
	 * @param dfDocType
	 * @param docName
	 * @param docNum
	 * @param docDate
	 * @param dfDepartmentCode
	 * @param customerAddress
	 * @param ignoreDocDate - ���� = true, ���. �������� �������������� ������� ���������� �����, ����� - ����� docDate
	 * @return
	 */
	public int createDFDoc(String contragentName, String contragentAddress, String contragentPhoneNumber,
                           String postCode, int departmentCode, int dfDocType, String docName,
                           String docNum, Date docDate, int dfDepartmentCode, String customerAddress, boolean ignoreDocDate) {
		// ���� ������� ������ ��������� ������
		if (dfDocType == DFDocType.OUTBOX) {

			try {
	            Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(DFDocOutboxController.JNDI_NAME);
	            DFDocOutboxControllerHome docOutboxHome = (DFDocOutboxControllerHome) PortableRemoteObject
	                    .narrow(objRef, DFDocOutboxControllerHome.class);
	            DFDocOutboxController docOutboxController = docOutboxHome.create();

	            DFDocOutbox docOutbox = new DFDocOutbox();

	            docOutbox.doc.docTypeRef.code = DFDocType.OUTBOX;
	            docOutbox.doc.docKindRef.code = DFDocKind.OUTBOX;

	            docOutbox.doc.name = docName + " " + contragentName;
	            docOutbox.doc.docNum = docNum;

	            if (ignoreDocDate) {
	            	docOutbox.doc.dateRegistration = new Date();
	            } else {
	            	docOutbox.doc.dateRegistration = docDate;
	            }

	            docOutbox.doc.customerName = contragentName;
	            if (customerAddress == null) {
	            	docOutbox.doc.customerAddress = contragentAddress;
	            } else {
	            	docOutbox.doc.customerAddress = customerAddress;
	            }
	            docOutbox.doc.customerPhone = contragentPhoneNumber;

	            if (postCode != null)
	                docOutbox.doc.postCode = postCode;

	            docOutbox.doc.description = docOutbox.doc.name;

				if (dfDepartmentCode != Integer.MIN_VALUE) {
					docOutbox.doc.departmentRef.code = dfDepartmentCode;
				} else {
					docFlowConnection = getDocFlowConnection();
					DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
					docOutbox.doc.departmentRef.code = docFlowLogic.getDFDepartmentCodeByENDepartmentCode(departmentCode, true);
				}

	            int docOutboxCode = docOutboxController.add(docOutbox);
	    		if (docOutboxCode == Integer.MIN_VALUE) {
	    			throw new SystemException("\n\n�� ������� �������� �������� ��������!");
	    		}

	    		docOutbox = docOutboxController.getObject(docOutboxCode);
	    		if (docOutbox == null) {
	    			throw new SystemException("\n\n�� �������� �������� �������� � ����� " + docOutboxCode + " !");
	    		}

	    		return docOutbox.doc.code;

			} catch (NamingException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (RemoteException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (CreateException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
	        	closeDocFlowConnection();
	        }

		} else {
			return Integer.MIN_VALUE;
		}
	}

	public int createAttachmentForENServicesObject(int servicesObjectCode, int dfDocCode, String attachmentDescription, String fileName,
			EPReportRequestEx request, String type, boolean is_for_docflow, int oldDFDocAttachmentCode) {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ��������!");
		}

		if (dfDocCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
		}

		int enDoAattCode = Integer.MIN_VALUE;
        try {
            enDoAattCode = createDFDocAttachmentENReport(dfDocCode, attachmentDescription, fileName,
                    request, type, is_for_docflow, oldDFDocAttachmentCode);

	        ENDocAttachment2ENServicesObjectControllerHome da2soHome = (ENDocAttachment2ENServicesObjectControllerHome)
	        		Tools.createControllerHome(ENDocAttachment2ENServicesObjectController.JNDI_NAME, ENDocAttachment2ENServicesObjectControllerHome.class);
	        ENDocAttachment2ENServicesObjectController da2soController = da2soHome.create();

	        da2soController.add(new ENDocAttachment(), null, fileName, servicesObjectCode, Integer.MIN_VALUE, false, enDoAattCode);

            return enDoAattCode;
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
            throw new SystemException(e.getMessage(), e);
        }
    }

	public void createAttachmentByENSheets4SO(ENSheets4SO sheet) {
		ENSheets4SOType sheetType = getSheet4SOType(sheet);
		if (sheetType == null) {
			throw new SystemException("\n\n�� ������� ��� �����!");
		}

		if (sheet.code == Integer.MIN_VALUE) {
			throw new SystemException("\n\n�� ������� ��� �����!");
		}

		String attachmentDescription = sheetType.nameForDfDoc;
		String dateTimePart = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String fileName = sheetType.reportFileName + "_" + dateTimePart + "." + sheetType.reportType;
		String type = sheetType.reportType;

		EPReportRequestEx request = new EPReportRequestEx();
		request.funcName = sheetType.reportPath;
		request.argNames = new String[] {"sheetCode"};
		request.args = new String[] {String.valueOf(sheet.code)};

		/************************** ���. ��������� **************************/
		if (sheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
			int daysCount = getLandSheetDaysCount(sheet);
			if (daysCount == Integer.MIN_VALUE) {
				daysCount = 10;
			}
			int connectionKind = getConnectionKind(sheet.servicesobject.code);
			request.argNames = new String[] {"sheetCode", "dayscnt", "connectionKind"};
			request.args = new String[] {String.valueOf(sheet.code),
					                     String.valueOf(daysCount),
					                     String.valueOf(connectionKind)};
		}
		/********************************************************************/

        boolean isDistributionList = false;
        if (sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_STATEMENT_ACCESSION
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_POINT_PASSPORT
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR) {
            isDistributionList = true;
        }

        if (sheet.attachment != null && sheet.attachment.code != Integer.MIN_VALUE) {

        	int oldDFDocAttachmentCode = Integer.MIN_VALUE;

			try {
				docFlowConnection = getDocFlowConnection();
				DFDocAttachmentDAO dfAttDAO = new DFDocAttachmentDAO(docFlowConnection, userProfile);
				DFDocAttachmentFilter dfAttFilter = new DFDocAttachmentFilter();
				dfAttFilter.endocattcode = sheet.attachment.code;
				int[] attArr = dfAttDAO.getFilteredCodeArray(dfAttFilter,0,-1);
				oldDFDocAttachmentCode = attArr[0];
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				closeDocFlowConnection();
			}

			if (isDistributionList)
				sheet.attachment.code = createDFDocAttachmentENReport(sheet.dfDocCode, attachmentDescription, fileName, request, type, false, oldDFDocAttachmentCode);
			else
				sheet.attachment.code = createAttachmentForENServicesObject(sheet.servicesobject.code, sheet.dfDocCode, attachmentDescription, fileName, request, type, false, oldDFDocAttachmentCode);
		}

        else
        {
			if (isDistributionList)
				sheet.attachment.code = createDFDocAttachmentENReport(sheet.dfDocCode, attachmentDescription, fileName, request, type, false, Integer.MIN_VALUE);
			else
				sheet.attachment.code = createAttachmentForENServicesObject(sheet.servicesobject.code, sheet.dfDocCode, attachmentDescription, fileName, request, type, false, Integer.MIN_VALUE);
		}
	}

	public String getDFDocNumberByCode(int docCode) {
		try {
			docFlowConnection = getDocFlowConnection();
			DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
			return docFlowLogic.getDFDocNumberByCode(docCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
        	closeDocFlowConnection();
        }
	}

	public DFDoc getDFDocByCode(int docCode) {
		try {
			docFlowConnection = getDocFlowConnection();
			DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
			return docFlowLogic.getDFDocByCode(docCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
        	closeDocFlowConnection();
        }
	}

	public ENSigner getSigner(ENSheets4SOType sheetType) {
		if (sheetType == null) {
			throw new SystemException("\n\n�� ������� ��� �����!");
		}

		if (sheetType.signerRef == null || sheetType.signerRef.code == Integer.MIN_VALUE) {
			return null;
		}

		ENSignerDAO signerDAO = new ENSignerDAO(connection, userProfile);
		try {
			return signerDAO.getObject(sheetType.signerRef.code);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ��� ���������� ������ ������ ������� � ���������� �� ������ ������ ������ ������� "���������"
	 *
	 * @param sheet - ����� ������ (������� �����������)
	 * @throws PersistenceException
	 */
	public void updateLastSheet4SO(ENSheets4SO sheet) throws PersistenceException {
		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ��������!");
		}

		if (sheet.sheet4sotype == null || sheet.sheet4sotype.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		ENSheets4SODAO sheetDAO = new ENSheets4SODAO(connection, userProfile);

		ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
		sheetFilter.servicesobject.code = sheet.servicesobject.code;
		sheetFilter.sheet4sotype.code = sheet.sheet4sotype.code;
		sheetFilter.isLast = ENConsts.YES;

		int[] sheetsArr = sheetDAO.getFilteredCodeArray(sheetFilter, 0, -1);

		if (sheetsArr.length > 1) {
			throw new SystemException("\n\n�������� ������� ����� � ������� \"�������\"!\n" +
					"��� ��������: " + sheet.servicesobject.code + ", ��� ���� �����: " + sheet.sheet4sotype.code);
		} else if (sheetsArr.length == 1) {
			ENSheets4SO lastSheet = sheetDAO.getObject(sheetsArr[0]);
			// ��� ����� �� ������ ����� ��������� ����������
			if (sheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				if (sheet.dateGen.compareTo(lastSheet.dateGen) <= 0) {
					throw new SystemException("\n\n���� ����� ������� ���� ������ �� ���� ������������ �����!\n" +
							"��� ������������ �����: " + lastSheet.code + ", ����: " + new SimpleDateFormat("dd.MM.yyyy").format(lastSheet.dateGen));
				}

				// 20.07.2020 SUPP-93091 ��� ����������� ������� ��������� ���� ���������� ����� �� ��������
				// ���-�� ���� �������� ��� ������ ������� ��� ������� ��� ����� ����� ��������� ��������
				// (�.�. ��� ��������� ������ ������ ������������� ���-�� ���� �������� ��� �����������)
				/*
				 * Tools.getDaysDiff �� ������ ��������� ������������ - ��������, ����� 30.03.2020 � 20.03.2020
			     * ���������� 9 ���� ������ 10, �.�. ������� � ����� 239 (� �� 240) ��-�� �������� �� ������ �����
				lastSheet.dayscnt = (int) Tools.getDaysDiff(Tools.clearTimeOfDate(lastSheet.dateGen),
						                                    Tools.clearTimeOfDate(sheet.dateGen),
						                                    TimeUnit.DAYS);
			    */
				lastSheet.dayscnt = Tools.getDaysBetweenTwoDates(Tools.clearTimeOfDate(lastSheet.dateGen),
						                                         Tools.clearTimeOfDate(sheet.dateGen));
			}
			// � ���������� �� ������ ������ ������ ������� ������� "���������"
			lastSheet.isLast = ENConsts.NO;
			sheetDAO.save(lastSheet);
		}
	}

	/**
	 * ��� �������� ���������� ������ ������� ���������� � ������������� ��� ������� "���������"
	 *
	 * @param sheet - ��������� ������
	 * @throws PersistenceException
	 */
	public void updateIsLastForSheet4SO(ENSheets4SO sheet) throws PersistenceException {
		if (sheet.isLast != ENConsts.YES) {
			return;
		}

		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ��������!");
		}

		if (sheet.sheet4sotype == null || sheet.sheet4sotype.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		ENSheets4SODAO sheetDAO = new ENSheets4SODAO(connection, userProfile);

		ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
		sheetFilter.servicesobject.code = sheet.servicesobject.code;
		sheetFilter.sheet4sotype.code = sheet.sheet4sotype.code;
		sheetFilter.isLast = ENConsts.NO;
		sheetFilter.conditionSQL = "ENSHEETS4SO.CODE <> " + sheet.code;
		sheetFilter.orderBySQL = "ENSHEETS4SO.DATEGEN DESC, ENSHEETS4SO.CODE DESC";

		int[] sheetsArr = sheetDAO.getFilteredCodeArray(sheetFilter, 0, 1);

		if (sheetsArr.length == 1) {
			// ������ ������� "���������"
			ENSheets4SO newLastSheet = sheetDAO.getObject(sheetsArr[0]);
			newLastSheet.isLast = ENConsts.YES;

			// 20.07.2020 SUPP-93091 ���������� ���������� ������ ���-�� ���� �������� �� ���������
			if (newLastSheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				newLastSheet.dayscnt = getLandSheetDaysCount(newLastSheet);
			}

			sheetDAO.save(newLastSheet);
		}
	}

	public ENSheets4SOType getSheet4SOType(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� �����!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		try {
			ENSheets4SOTypeDAO sheetTypeDAO = new ENSheets4SOTypeDAO(connection, userProfile);
			return sheetTypeDAO.getObject(sheet.sheet4sotype.code);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateENDocAttachmentForServicesObject(int oldAttachmentCode, int newAttachmentCode) {
		if (oldAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������, �� ���������!");
		}

		if (newAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ������ ���������!");
		}

		try {
			ENDocAttachment2ENServicesObjectDAO attachment2ServicesDAO = new ENDocAttachment2ENServicesObjectDAO(connection, userProfile);
			ENDocAttachment2ENServicesObjectFilter attachment2ServicesFilter = new ENDocAttachment2ENServicesObjectFilter();
			attachment2ServicesFilter.docAttachmentRef.code = oldAttachmentCode;
			int[] attachment2ServicesArr = attachment2ServicesDAO.getFilteredCodeArray(attachment2ServicesFilter, 0, -1);

			if (attachment2ServicesArr.length == 0) {
				return;
			}

			ENDocAttachment2ENServicesObject attachment2Services = attachment2ServicesDAO.getObject(attachment2ServicesArr[0]);
			if (attachment2Services == null) {
				throw new SystemException("\n\n�� �������� ��'���� ��������� � ��������� (��� ��'����: " + attachment2ServicesArr[0] + ")!");
			}

			attachment2Services.docAttachmentRef.code = newAttachmentCode;
			attachment2ServicesDAO.save(attachment2Services);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateENDocAttachmentForENSheet(int oldAttachmentCode, int newAttachmentCode) {
		if (oldAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������, �� ���������!");
		}

		if (newAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ������ ���������!");
		}

		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.attachment.code = oldAttachmentCode;
			int[] sheetsArr = sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);

			if (sheetsArr.length == 0) {
				return;
			}

			ENSheets4SO sheet = sheetsDAO.getObject(sheetsArr[0]);
			if (sheet == null) {
				throw new SystemException("\n\n�� �������� ���� ��� �������� (��� �����: " + sheetsArr[0] + ")!");
			}

			sheet.attachment.code = newAttachmentCode;
			sheetsDAO.save(sheet);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public HashMap<Integer, ENSOValues> getCalculatedDatesOfTermsForStandardConnection(ENServicesObject servicesObject)
			throws PersistenceException {
		ENSOValuesDAO soValuesDao = new ENSOValuesDAO(connection, userProfile);
		ENPayment2SODAO paymentsDao = new ENPayment2SODAO(connection, userProfile);
		ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
		ENSOBillDAO billsDao = new ENSOBillDAO(connection, userProfile);
		ENSheets4SODAO sheetsDao = new ENSheets4SODAO(connection, userProfile);

		HashMap<Integer, ENSOValues> hashMap = new HashMap<>();
		for(Integer typeCode : ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION) {
			hashMap.put(typeCode, null);
		}

		ENTechConditionsServices techCond = techCondDao.getObjectByENEServicesObject(servicesObject);

		String contractText = String.format("� %s �� %s", servicesObject.contractNumberServices
				, Tools.dateFormatDefault.format(servicesObject.contractDateServices));

		ENSOValues dateRegistry = soValuesDao.getObject(servicesObject, ENSOValuesType.CONTRACT_REGISTRATION_DATE);
		ENSOValues serviceStart = soValuesDao.createEmptySOValuesForServicesObject(servicesObject, ENSOValuesType.SERVICE_START);
		ENSOValues serviceStop = soValuesDao.createEmptySOValuesForServicesObject(servicesObject, ENSOValuesType.SERVICE_STOP);
		ENSOValues serviceSecondStart = soValuesDao.createEmptySOValuesForServicesObject(servicesObject, ENSOValuesType.SERVICE_SECOND_START);
		ENSOValues limitDateContractWorks = soValuesDao.createEmptySOValuesForServicesObject(servicesObject, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS);
		ENSOValues dateFinishWorks = soValuesDao.createEmptySOValuesForServicesObject(servicesObject, ENSOValuesType.DATE_FINISH_WORKS);

		if(dateRegistry == null || dateRegistry.dateVal == null
				|| techCond.connectionKindRef.code != ENConnectionKind.STANDART) return hashMap;

		ENPayment2SOShortList paymentsList = paymentsDao.getListByENServicesObject(servicesObject);
		ENSOBillShortList billsList = billsDao.getListByENServicesObject(servicesObject);

		ENPayment2SOShort firstPayment = null;
		ENSOBillShort secondBill = null;
		Date dateContractWasFullyPaid = null;

		BigDecimal overallSumPayments = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
		BigDecimal sumPaymentsBeforeSecondBill = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);

		if(paymentsList.totalCount > 0) {
			firstPayment = paymentsList.get(0);
			// ���� ������� ������� ����� ��������� ���� ���. ��������� "������� ������� ������� (����� ������)"
			if(firstPayment.dateGen.compareTo(dateRegistry.dateVal) < 0) {
				throw new SystemException(String.format("���� ����� ������ �� ��������� %s �� ������ ���� ������ �� ���� ��������� ����� "
						+ "(%s < %s)"
						, contractText, Tools.dateFormatDefault.format(firstPayment.dateGen), Tools.dateFormatDefault.format(dateRegistry.dateVal)));
			}
			serviceStart.dateVal = firstPayment.dateGen;
			hashMap.put(ENSOValuesType.SERVICE_START, serviceStart);

			// �� ������ ������� ������ ������ ����� ��������� ����, ���� �������� ����� ��� ���� ������ ������
			for(ENSOBillShort bill : billsList.list) {
				if(bill.dateGen.before(dateRegistry.dateVal)) {
					if(firstPayment.dateGen.compareTo(dateRegistry.dateVal) < 0) {
						throw new SystemException(String.format("���� ������� �� ��������� %s �� ������ ���� ������ �� ���� ��������� ����� "
								+ "(%s < %s)"
								, contractText, Tools.dateFormatDefault.format(bill.dateGen), Tools.dateFormatDefault.format(dateRegistry.dateVal)));
					}
				}
				if(bill.dateGen.after(firstPayment.dateGen)) {
					secondBill = bill;
					break;
				}
			}

			boolean isFullyPaid = false;
			int totalDaysToMoveByStop = 0;
			for(ENPayment2SOShort payment : paymentsList.list) {
				overallSumPayments = overallSumPayments.add(payment.sumTotal);
				if(secondBill != null && secondBill.dateGen.compareTo(payment.dateGen) > 0) {
					sumPaymentsBeforeSecondBill = sumPaymentsBeforeSecondBill.add(payment.sumTotal);
				}
				if(!isFullyPaid && overallSumPayments.compareTo(techCond.tySummaGen) >= 0) {
					dateContractWasFullyPaid = payment.dateGen;
					isFullyPaid = true;
				}
			}

			if(secondBill != null && techCond.tySummaGen.compareTo(sumPaymentsBeforeSecondBill) == 1) {
				serviceStop.dateVal = secondBill.dateGen;
				hashMap.put(ENSOValuesType.SERVICE_STOP, serviceStop);
				if(overallSumPayments.compareTo(techCond.tySummaGen) >= 0 && dateContractWasFullyPaid != null) {
					serviceSecondStart.dateVal = dateContractWasFullyPaid;
					hashMap.put(ENSOValuesType.SERVICE_SECOND_START, serviceSecondStart);
					totalDaysToMoveByStop = (int)Tools.getDaysDiff(secondBill.dateGen, dateContractWasFullyPaid, TimeUnit.DAYS);
				}
			}

			Entry<Date, Integer> entryPlannedLimitDate = this.getPlannedLimitDateForStandardConnection(dateRegistry.dateVal, firstPayment.dateGen
					, techCond.tyServicesPower);

			Date plannedLimitDate = entryPlannedLimitDate.getKey();
			serviceStart.strVal = String.format("%d", entryPlannedLimitDate.getValue());

			int totalDaysToMoveBySheets = 0;
			ENSheets4SOShortList sheetsList = sheetsDao.getListByENServicesObject(servicesObject);
			for(ENSheets4SOShort sheet : sheetsList.list) {
				if(sheet.dayscnt > 0) {
					totalDaysToMoveBySheets += sheet.dayscnt;
				}
			}
			plannedLimitDate = Tools.addDays(plannedLimitDate, totalDaysToMoveByStop);
			plannedLimitDate = Tools.addDays(plannedLimitDate, totalDaysToMoveBySheets);
			limitDateContractWorks.dateVal = plannedLimitDate;
			hashMap.put(ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, limitDateContractWorks);
		}

		// ������ ���������� 5�� ���. ���������, ������� �� ������� �� ������ � ����� ���� ����������
		// ���������� ���� � ���������� �����
		Date lastDateOfAct = this.getDateFinishWorksForStandardConnection(servicesObject);
		if(lastDateOfAct != null) {
			dateFinishWorks.dateVal = lastDateOfAct;
			hashMap.put(ENSOValuesType.DATE_FINISH_WORKS, dateFinishWorks);
		}


		return hashMap;
	}

	public void calculateENSOValuesTermsIfNeeded(int servicesObjectCode) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� � ������ �� �������!");
		}

		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);

		if (servicesObject == null) {
			throw new SystemException("\n\n�� �������� ������ � ������ �� ������� � ����� " + servicesObjectCode + " !");
		}

		calculateENSOValuesTermsIfNeeded(servicesObject);
 	}

	public void calculateENSOValuesTermsIfNeeded(ENServicesObject servicesObject) throws PersistenceException {
		if(servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION
				&& servicesObject.contractDateServices != null) {
			this.calculateENSOValuesTermsForStandardConnection(servicesObject);
		}

	}

	public void calculateENSOValuesTermsForStandardConnection(ENServicesObject servicesObject) throws PersistenceException {

		ENSOValuesDAO valuesDao = new ENSOValuesDAO(connection, userProfile);
		ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);

		ENServicesObject servicesObjectOld = servicesObjectDao.getObjectNoSegr(servicesObject.code);
		ENTechConditionsServices techCond = techCondDao.getObjectByENEServicesObject(servicesObject);

		if(techCond == null || techCond.connectionKindRef.code != ENConnectionKind.STANDART) return;

		HashMap<Integer, Date> factDates = valuesDao.getActualDatesOfTermsForStandardConnection(servicesObject);
		HashMap<Integer, ENSOValues> calculatedDates = this.getCalculatedDatesOfTermsForStandardConnection(servicesObject);

		for(Integer typeCode : ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION) {
			Date factDate = factDates.get(typeCode);
			ENSOValues calculatedDate = calculatedDates.get(typeCode);

			ENSOValues values = null;
			if(calculatedDate != null) {

				if(factDate == null) {
					valuesDao.add(calculatedDate);
				} else {
					if(factDate.compareTo(calculatedDate.dateVal) != 0) {
						values = valuesDao.getObject(servicesObject, typeCode);
						calculatedDate.code = values.code;
						calculatedDate.modify_time = values.modify_time;
						valuesDao.save(calculatedDate);
					}
				}
			} else {
				if(factDate != null) {
					values = valuesDao.getObject(servicesObject, typeCode);
					valuesDao.remove(values.code);
				}
			}
		}

		// �������� � ������� ���������� ����������� ���� ���������� �����
		// ����������� � ������ ������ ���������
		ENSOValues dateFinishWorks = calculatedDates.get(ENSOValuesType.DATE_FINISH_WORKS);
		if(dateFinishWorks != null && servicesObjectOld.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
			if(Arrays.asList(ENServicesContractStatus.SIGNED, ENServicesContractStatus.PAID
					, ENServicesContractStatus.PREPAID).contains(servicesObjectOld.contractStatusRef.code)) {
				servicesObjectOld.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
				servicesObjectDao.save(servicesObjectOld);
			}
		}
		// ���� ��� ������� ��� � ������� ��������� � ������� ������ ���������, �� ��� ����� ��������� ������ ����������
		if(dateFinishWorks == null && servicesObjectOld.contractStatusRef.code == ENServicesContractStatus.COMPLETED) {
			servicesObjectOld.contractStatusRef.code = ENServicesContractStatus.PAID;
			servicesObjectDao.save(servicesObjectOld);
		}
	}

	public Date getDateFinishWorksForStandardConnection(ENServicesObject servicesObject) throws PersistenceException {
		ENActDAO actDao = new ENActDAO(connection, userProfile);
		RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(connection, userProfile);
		RQFKOrder2PlanFactDAO order2PlanDao = new RQFKOrder2PlanFactDAO(connection, userProfile);
		ENTechConditionsServicesDAO techCondServicesDao = new ENTechConditionsServicesDAO(connection, userProfile);
		ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
		ENAct2ENPlanWorkDAO act2PlanDao = new ENAct2ENPlanWorkDAO(connection, userProfile);
		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

		Collection<Integer> excludedDDSCodes = settingsLogic.getVectorWithIntValues(ENSettingsKeysConsts.DDS_CODES_TO_EXCLUDE_FROM_CONNECTION_FINISH_WORKS);

		ENTechConditionsServices techCondServices = techCondServicesDao.getObjectByENEServicesObject(servicesObject);

		List<Integer> actStatusCodes = Arrays.asList(ENActStatus.SIGNATURE, ENActStatus.CLOSED);
		List<Integer> actTypeCodes = ENConsts.ACT_TYPES_FOR_CALCULATION_OF_CONNECTION_WORK_TERM;

		List<Integer> fkOrderStatusCodes = Arrays.asList(RQFKOrderStatus.CREATED, RQFKOrderStatus.IN_FK);
		List<Integer> fkOrderKindCodes = Arrays.asList(RQFKOrderKind.SERVICES_FROM_SIDE);

		ENActShortList actList = actDao.getActListByENTechConditionsServices(techCondServices, actTypeCodes, actStatusCodes);
		ENActShortList actList2 = actDao.getActListByENElement(servicesObject.element, actTypeCodes, actStatusCodes);
		RQFKOrderShortList fkOrderList = fkOrderDao.getListByENTechConditionsServices(techCondServices, fkOrderKindCodes, fkOrderStatusCodes);

		actList.list.addAll(actList2.list);
		actList.totalCount += actList2.totalCount;

		Date latestDate = null;
		for(ENActShort act : actList.list) {
			// ���� ��������� � ������� ��� ����������� ������������ ���� ��� �� ������ ������������ � ������� ����������� ���� ����������� �����.
			boolean isExcludedByDds = false;
			if(excludedDDSCodes.size() > 0) {
				List<Integer> planCodes = act2PlanDao.getListOfPlanCodesByActCode(act.code);

				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, Tools.repeatSymbol("?", ",", planCodes.size()));
				planFilter.conditionSQL += String.format(" AND %s in (%s)", ENPlanWork.ddsCodes_QFielld, Tools.repeatSymbol("?", ",", excludedDDSCodes.size()));

				Vector<Integer> params = new Vector<>();
				params.addAll(planCodes);
				params.addAll(excludedDDSCodes);

				isExcludedByDds = planDao.getScrollableFilteredList(planFilter, 0, -1, params).totalCount > 0;
			}

			if(!isExcludedByDds) {
				latestDate = (latestDate == null || act.dateAct.after(latestDate)) ? act.dateAct : latestDate;
			}

		}
		for(RQFKOrderShort fkOrder : fkOrderList.list) {
			boolean isExcludedByDds = false;
			if(excludedDDSCodes.size() > 0) {
				RQFKOrder2PlanFactFilter planFilter = new RQFKOrder2PlanFactFilter();
				planFilter.fkorder.code = fkOrder.code;
				planFilter.conditionSQL = String.format("EXISTS (SELECT FROM enplanwork AS pw1 WHERE pw1.%s IN (%s) AND pw1.%s = %s)"
						, ENPlanWork.ddsCodes_Field, Tools.repeatSymbol("?", ",", excludedDDSCodes.size())
						, ENPlanWork.code_Field, RQFKOrder2PlanFact.plan_QFielld);
				Vector<Object> params = new Vector<>(excludedDDSCodes);
				isExcludedByDds = order2PlanDao.getScrollableFilteredList(planFilter, 0, -1, params).totalCount > 0;
			}

			if(!isExcludedByDds) {
				latestDate = (latestDate == null || fkOrder.dateGen.after(latestDate)) ? fkOrder.dateGen : latestDate;
			}
		}
		return latestDate;
	}

	/**
	 *
	 * ��������� ���� - ����������� ���� ���������������� ���������� ����� � ���� � ����
	 *
	 * @param registryDate ���� ������ ���������
	 * @param startDate ������� ������� �������
	 * @param capacity ��������� �� ���������
	 * @return ��������� �������� ���� ��������� ����
	 * @throws PersistenceException
	 */
	public Entry<Date, Integer> getPlannedLimitDateForStandardConnection(Date registryDate, Date startDate, BigDecimal capacity)
			throws PersistenceException {
		BigDecimal bd16 = new BigDecimal(16).setScale(0, BigDecimal.ROUND_HALF_UP);
		BigDecimal bd50 = new BigDecimal(50).setScale(0, BigDecimal.ROUND_HALF_UP);

		Integer limit = 0;

		if(capacity.compareTo(BigDecimal.ZERO) < 0) {
			ENSOValuesTypeDAO valuesTypeDao = new ENSOValuesTypeDAO(connection, userProfile);
			ENSOValuesType valuesTypeLimitDate = valuesTypeDao.getObject(ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS);
			throw new SystemException(String.format("��������� �� ��������� �� ���� ���� ��'�����.\n"
					+ "��������� ��������� ���������� ������� \"%s\"", valuesTypeLimitDate.name));
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(Tools.clearTimeOfDate(startDate));
		Date date07122019 = null;
		try {
			date07122019 = Tools.dateFormatDefault.parse("07.12.2019");
		} catch (ParseException e) { throw new SystemException(e); }
		if(registryDate.compareTo(date07122019) < 0) {
			calendar.add(Calendar.MONTH, 3);
			limit = (int)Tools.getDaysDiff(startDate, calendar.getTime(), TimeUnit.DAYS);
		} else {
			if(capacity.compareTo(bd16) <= 0) {
				calendar.add(Calendar.DATE, 45);
				limit = 45;
			} else {
				if(capacity.compareTo(bd50) == 1) {
					calendar.add(Calendar.MONTH, 3);
					limit = (int)Tools.getDaysDiff(startDate, calendar.getTime(), TimeUnit.DAYS);
				} else {
					calendar.add(Calendar.DATE, 60);
					limit = 60;
				}

			}
		}
		return new AbstractMap.SimpleEntry<>(calendar.getTime(), limit);
	}

	public boolean checkENSheetForENAttachment(int enAttachmentCode) {
		if (enAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
		}

		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.attachment.code = enAttachmentCode;
			int[] sheetsArr = sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);

			return (sheetsArr.length > 0);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean checkENSheetForDFDoc(int dfDocCode) {
		return checkENSheetForDFDoc(dfDocCode, Integer.MIN_VALUE);
	}

	public boolean checkENSheetForDFDoc(int dfDocCode, int servicesObjectCode) {
		return checkENSheetForDFDoc(dfDocCode, servicesObjectCode, Integer.MIN_VALUE);
	}

	public boolean checkENSheetForDFDoc(int dfDocCode, int servicesObjectCode, int sheetType) {
		if (dfDocCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
		}

		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.dfDocCode = dfDocCode;
			sheetFilter.servicesobject.code = servicesObjectCode;
			sheetFilter.sheet4sotype.code = sheetType;
			int[] sheetsArr = sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);

			return (sheetsArr.length > 0);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * �������� ������������ ������ �� �������� � ���������������� (���������, �������� � �.�.)
	 *
	 * @param sheet - ������ ��� �������� ({@link ENSheets4SO})
	 */
	public void removeDocFlowRelationsForENSheet(ENSheets4SO sheet) {
		if (sheet.dfDocCode == Integer.MIN_VALUE) {
			return;
		}

		try {
			docFlowConnection = getDocFlowConnection();
			DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
			docFlowLogic.cancelDFDocWithAttachments(sheet.dfDocCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}

	/**
	 * ��������� ������ ������ ��� ������ �� ������ ����� (�� ������ ������� ����� ������)
	 *
	 * @param sheet - ������ �� ������ ����� ({@link ENSheets4SO})
	 * @return ����� ������ (1 - 5)
	 */
	public int getLandSheetStageNumber(ENSheets4SO sheet, boolean isException) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� �����!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		if (sheet.sheet4sotype.code != ENSheets4SOType.LAND_SHEET) {
			return Integer.MIN_VALUE;
		}

		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ������ ��� �����!");
		}

		ENSOValues soValue = getENSOValueForServicesObject(sheet.servicesobject.code, ENSOValuesType.LAND_SHEET_STAGE_NUMBER);
		if (soValue != null) {
			try {
				return Integer.valueOf(soValue.strVal);
			} catch (NumberFormatException e) {
				if (isException) {
					throw new SystemException("\n\nSUPP-88605 ���������� �������� ��� ����������� �������� \"����� ���䳿 ��������� �������� ������\"!\n" +
							"�� ���� ������� �������� �� 1 �� 5!");
				}
				return Integer.MIN_VALUE;
			}
		}

		return Integer.MIN_VALUE;
	}

	/**
	 * ��������� ���������� ���� �������� (�������������) ��� ������ �� ������ �����
	 *
	 * @param sheet - ������ �� ������ ����� ({@link ENSheets4SO})
	 * @return ���������� ���� ��������
	 */
	public int getLandSheetDaysCount(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� �����!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		if (sheet.sheet4sotype.code != ENSheets4SOType.LAND_SHEET) {
			return Integer.MIN_VALUE;
		}

		return getLandSheetDelayForServicesObject(sheet.servicesobject.code);
		/*
		int connectionKind = getConnectionKind(sheet.servicesobject.code);
		if (connectionKind == Integer.MIN_VALUE) {
			return Integer.MIN_VALUE;
		}

		String daysCountKey = "";

		if (connectionKind == ENConnectionKind.STANDART) {
			daysCountKey = ENSettingsKeysConsts.SERVICES_SHEETS_LAND_DELAY_STANDARD;
		} else if (connectionKind == ENConnectionKind.NO_STANDART || connectionKind == ENConnectionKind.READY_MADE) {
			daysCountKey = ENSettingsKeysConsts.SERVICES_SHEETS_LAND_DELAY_NONSTANDARD;
		}

		if (daysCountKey == null || daysCountKey.equals("")) {
			return Integer.MIN_VALUE;
		}

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
		try {
			String strDaysCount = settingsLogic.getValue(daysCountKey).trim();
			if (strDaysCount == null || strDaysCount.equals("")) {
				return Integer.MIN_VALUE;
			}

			try {
				return Integer.valueOf(strDaysCount);
			} catch (NumberFormatException e) {
				throw new SystemException("\n\nSUPP-88605 ���������� �������� ������������ " +
										  "\"ʳ������ ��� ���������� ������ ��� �������� ����� ��� ��������� ����\"!");
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
		*/
	}

	public ENSOValues getENSOValueForServicesObject(int servicesObjectCode, int soValuesTypeCode) {
		try {
			ENSOValuesDAO soValuesDAO = new ENSOValuesDAO(connection, userProfile);
			return soValuesDAO.getObject(servicesObjectCode, soValuesTypeCode);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean isServicesObjectByt(ENServicesObject servicesObject) {
		if (servicesObject == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ��������!");
		}

		if (servicesObject.contragentTypeRef == null || servicesObject.contragentTypeRef.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ����������� (Գ�. �����/��. �����!");
		}

		return (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
				servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT);
	}

	/**
	 * ����� ��� ��������������� ������������ ����� �� ������ �����
	 * (��������� ������, ������� ���������� ��������� ������).
	 * ����� ������� ����������� ������, �������� ������� ��������
	 * �� �������� � ����������� ��� (�.�., ���� ������ �������, ��
	 * ����� ������������ ����� ������, ������� �� ����� ������ ����
	 * ���������� � ������� � �����������)
	 *
	 * @return ���-�� ��������� �����
	 */
	public int generateNextLandSheets() {
		Date tomorrow = Tools.getTomorrowDate();
		return generateNextLandSheetsForDate(tomorrow);
	}

	/**
	 * ��������� �����, ������� ���������� ��������� �������
	 *
	 * @return ���-�� ��������� �����
	 */
	public int generateNextLandSheetsForToday() {
		return generateNextLandSheetsForDate(new Date());
	}

	/**
	 * ����� ��� ��������������� ������������ ����� �� ������ �����
	 * (��������� ������, ������� ���������� ��������� � �������� ����).
	 * ����� ������� ����������� ������, �������� ������� ��������
	 * �� �������� � ����������� ��� (�.�., ���� ������ �������, ��
	 * ����� ������������ ����� ������, ������� �� ����� ������ ����
	 * ���������� � ������� � �����������).
	 *
	 * ���� ������� ����� � generationDateStart = ������� ����, ��
	 * ���������� ������, ������� ������ ���� ���������� �������
	 *
	 * @param generationDateStart - ����, �� ������� �� ������� ������ (�� ��������� - ���������� ����)
	 * @return ���-�� ��������� �����
	 */
	public int generateNextLandSheetsForDate(Date generationDateStart) {
		mDaxLogic axLogic = new mDaxLogic(connection, userProfile);

		// ���� generationDateStart - ��������, ������ �� �������
		// (��� ��� ������ ���� ���� ��������� ��������)
		//Date tomorrow = Tools.getTomorrowDate();
		if (axLogic.isHoliday(generationDateStart)) {
			return 0;
		}

		List<Date> dates = new ArrayList<>();

		// ���� �� ���������, ��� generationDateStart �� ��������, ������� ������� �� generationDateStart
		dates.add(generationDateStart);

		// ���� ��������� ���� ����� generationDateStart ��������, ������� �� ���� ����
		// � �� ������ ��������� ����, ���� ��������� ���� �������� ��������
		Date nextDate = Tools.addDays(generationDateStart, 1);
		while (axLogic.isHoliday(nextDate)) {
			dates.add(nextDate);
			nextDate = Tools.addDays(nextDate, 1);
		}

		String strDates = "";
		for (Date date : dates) {
			String strDate = new SimpleDateFormat("dd.MM.yyyy").format(date);
			strDates += (strDates.isEmpty() ? strDate : ", " + strDate);
		}

		System.out.println("@@@@@ STARTING ENSHEETS4SO AUTOGENERATION for dates: " + strDates + " @@@@@");

		int totalSheetsCount = 0;

		for (Date date : dates) {
			int sheetsCount = generateNextLandSheets(date, generationDateStart);
			totalSheetsCount += sheetsCount;
		}

		System.out.println("@@@@@ FINISHED ENSHEETS4SO AUTOGENERATION for dates: " + strDates + " @@@@@");

		return totalSheetsCount;
	}

	/**
	 * ����� ��� ��������������� ������������ ����� �� ������ �����
	 *
	 * @param newSheetPlanDate - ����, ����� �� ������ ������ ������ �� ����� (�� ������)
	 * @param newSheetFactDate - ���� ����������� ��������� ������ (��� �����, ��������� ������� �������� �� �������� ����,
	 *                           ����� ������, ��� ��������)
	 *
	 * @return ���-�� ��������� �����
	 */
	public int generateNextLandSheets(Date newSheetPlanDate, Date newSheetFactDate) {
		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			int[] sheetsArr = getLandSheetsListForAutoGeneration(newSheetPlanDate);

			int i = 0;
			for (int sheetCode : sheetsArr) {
				System.out.println(String.format("@@@@@ GENERATING ENSHEETS4SO for %s, %d of %d @@@@@",
						                         new SimpleDateFormat("dd.MM.yyyy").format(newSheetPlanDate), ++i, sheetsArr.length));

				ENSheets4SO previousSheet = sheetsDAO.getObject(sheetCode);
				//addENSheetByPreviousSheet(previousSheet, newSheetPlanDate, false);
				addENSheetByPreviousSheet(previousSheet, newSheetFactDate, false);
			}

			return sheetsArr.length;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int[] getLandSheetsListForAutoGeneration(Date newSheetPlanDate) {
		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.conditionSQL =
					" ensheets4so.code in " +
							" ( " +
							" select s.code " +
							" from ensheets4so s, ensovalues v " +
							" where s.servicesobjectcode = v.servicesobjectcode " +
							"   and s.sheet4sotypecode = " + ENSheets4SOType.LAND_SHEET +
							"   and v.sovaluestypecode = " + ENSOValuesType.LAND_SHEET_STAGE_NUMBER +
							"   and s.islast = " + ENConsts.YES +
							"   and s.nextsheetdate = to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(newSheetPlanDate) + "', 'dd.MM.yyyy') " +
							" ) ";

			return sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getLastENSheetCode(int servicesObjectCode) {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.servicesobject.code = servicesObjectCode;
			sheetFilter.sheet4sotype.code = ENSheets4SOType.LAND_SHEET;
			sheetFilter.isLast = ENConsts.YES;

			int[] sheetsArr = sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);

			if (sheetsArr.length == 0) {
				throw new SystemException("\n\n�� �������� ������� ����� ��� ��������� ���� ��� �������� � ����� " + servicesObjectCode + " !");
			} else if (sheetsArr.length > 1) {
				throw new SystemException("\n\n�������� ������� (" + sheetsArr.length +
						") ����� ��� ��������� ���� � ������� \"�������\" ��� �������� � ����� " + servicesObjectCode + " !");
			}

			return sheetsArr[0];
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ����� ��� ������� �������� "���� ���������� ������" �� ��������� ������
	 *
	 * @param servicesObjectCode - ��� �������� ({@link ENServicesObject})
	 */
	public void clearNextSheetDate(int servicesObjectCode) {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		try {
			int lastSheetCode = getLastENSheetCode(servicesObjectCode);

			if (lastSheetCode != Integer.MIN_VALUE) {
				ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
				ENSheets4SO lastSheet = sheetsDAO.getObject(lastSheetCode);
				lastSheet.nextSheetDate = null;
				sheetsDAO.save(lastSheet);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void addENSheetByPreviousSheet(ENSheets4SO previousSheet, Date newSheetDate) {
		addENSheetByPreviousSheet(previousSheet, newSheetDate, true);
	}

	public void addENSheetByPreviousSheet(ENSheets4SO previousSheet, Date newSheetDate, boolean ignoreDocDate) {
		if (previousSheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ����� ��� ��������!");
		}

		ENSheets4SO newSheet = new ENSheets4SO();
		newSheet.name = previousSheet.name;
		newSheet.dateGen = newSheetDate;
		newSheet.userGen = previousSheet.userGen;
		// ����� ����� ������ �� ��������, � �� �� ����������� ������
		newSheet.dayscnt = getLandSheetDaysCount(previousSheet); //previousSheet.dayscnt;
		newSheet.recipient = previousSheet.recipient;
		newSheet.recipientAddress = previousSheet.recipientAddress;

		newSheet.postCode = getSheetPostCode(previousSheet.servicesobject.code, previousSheet.postCode);

		/** SUPP-96455... +++ ��� ����� �� ������ ����� ���������� ����� �� ��������... */
		if (previousSheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {

			setSignerToSheets(newSheet, ENSheets4SOType.LAND_SHEET);
		}


		newSheet.isWithSignature = previousSheet.isWithSignature;
		newSheet.executorFio = previousSheet.executorFio;
		newSheet.executorPhone = previousSheet.executorPhone;
		newSheet.executorEmail = previousSheet.executorEmail;
		newSheet.additionalText = previousSheet.additionalText;
		newSheet.sheet4sotype = previousSheet.sheet4sotype;
		newSheet.servicesobject.code = previousSheet.servicesobject.code;
		newSheet.commentgen = "����������� ����������� " + new SimpleDateFormat("dd.MM.yyyy").format(new Date());

		int newSheetCode = addENSheets4SO(newSheet,  ignoreDocDate, null);

		updateUserGenForAutogeneratedENSheets4SO(newSheetCode);
	}

	public String getSheetPostCode(int servicesobjectCode, String previousSheetPostCode) {
		// SUPP-108499 ���������� ������� � ������ ������� ��� ���������
		ENSOValuesDAO ensoValuesDAO = new ENSOValuesDAO(connection, userProfile);
		ENSOValuesFilter ensoValuesFilter = new ENSOValuesFilter();
		ensoValuesFilter.servicesobject.code = servicesobjectCode;
		ensoValuesFilter.soValuesType.code = ENSOValuesType.INDEX;
		ENSOValuesShortList ensoValuesShortList;
		try {
			ensoValuesShortList = ensoValuesDAO.getFilteredList(ensoValuesFilter);
			if (ensoValuesShortList.totalCount > 0) {
				return ensoValuesShortList.list.elementAt(0).strVal;
			} else if (previousSheetPostCode != null) {
				return previousSheetPostCode;
			} else {
				ENServicesObjectDAO enServicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
				return enServicesObjectDAO.getObject(servicesobjectCode).postCode;
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 * ����������� ���������� ��� ����������������� ������
	 *
	 * @param newSheet
	 * @param sheetType
	 */
	private void setSignerToSheets(ENSheets4SO newSheet, int sheetType) {
		try {

			ENSignerDAO signerDao = new ENSignerDAO(connection, userProfile);
			ENSignerFilter signerFilter = new ENSignerFilter();
			signerFilter.conditionSQL = " ensigner.code = ( "
					+ " select s.code "
					+ "   from ensheets4sotype st, ensigner s "
					+ "  where st.signerrefcode = s.code "
					+ "    and st.code = " + sheetType + " ) ";


			int[] sArr = signerDao.getFilteredCodeArray(signerFilter, 0, -1);
			if (sArr.length > 0) {
				ENSigner signer = signerDao.getObject(sArr[0]);

				newSheet.signerFio = signer.signerFio;
				newSheet.signerPosition = signer.signerPosition;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


    public void regenerateENSheets4SO(int sheetCode) {
        try {
            ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
            ENDocAttachmentDAO enDocAttachmentDAO = new ENDocAttachmentDAO(connection, userProfile);

            ENSheets4SO object = objectDAO.getObject(sheetCode);



            if (object.dfDocCode == Integer.MIN_VALUE) {
                throw new SystemException("\n\n���� ��'���� � ����������!");
            }


            // ��� � ������ ��������� ��� ���������� ��������,
            // ������� ����� ����� ����� ��� �������������
            createAttachmentByENSheets4SO(object);

            int newAttCode = object.attachment.code;
            object = objectDAO.getObject(object.code);
            if (object.userGen == null) {
                object.userGen = userProfile.userName;
            }
            object.dateEdit = new Date();
            object.attachment.code = newAttCode;
            objectDAO.save(object);

            DFDoc dfDoc = getDFDocByCode(object.dfDocCode);

            //������ ���� ��� ���� ������ ����� ����� "���� ��� ������������� ������������"
            if (object.sheet4sotype.code != ENSheets4SOType.LAND_SHEET) {
                DFDocOutbox dfDocOutbox = getDFDocOutBoxByDFDoc(object.dfDocCode);
                stampingAttachmentsByDocOutBox(dfDocOutbox, dfDoc);
            }

			boolean isDistributionList = false;
			if (object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_STATEMENT_ACCESSION
					|| object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_POINT_PASSPORT
					|| object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT
					|| object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR) {
				isDistributionList = true;
			}

            if (isDistributionList) {
                DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByWFPackCode(object.wfPackCode);
                ENDocAttachment enDocAttachment = enDocAttachmentDAO.getObject(object.attachment.code);
                createAttachmentLinkToDFDocAttachment(enDocAttachment,dfDocSupplyEE.doc.code);
            }

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        }
    }



    public int addENSheets4SO(ENSheets4SO object) {
		return addENSheets4SO(object, true, null);
	}

	public int addENSheets4SO(ENSheets4SO object, ENSheets4SOItems[] items) {
		return addENSheets4SO(object, true, items);
	}

	public int addENSheets4SO(ENSheets4SO object, boolean ignoreDocDate, ENSheets4SOItems[] items) {
		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
			ENDocAttachmentDAO enDocAttachmentDAO = new ENDocAttachmentDAO(connection, userProfile);

			if (object.userGen == null) {
		    	object.userGen = userProfile.userName;
		    }
	        object.dateEdit = new Date();

	        if (object.sheet4sotype == null || object.sheet4sotype.code == Integer.MIN_VALUE) {
	        	throw new SystemException("\n\n�� ������� ��� �����!");
	        }

	        boolean isDistributionList = false;
	        if (object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_STATEMENT_ACCESSION
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_POINT_PASSPORT
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR) {
                isDistributionList = true;
            }

 	        if(isDistributionList && object.wfPackCode == Integer.MIN_VALUE)
                    throw new SystemException("\n\n�� ������� ��� ������!");


            if (!isDistributionList) {
                // ������� � ����������� ������ ������� "���������" � ������ ��� ����, ������� ������ ���������
                updateLastSheet4SO(object);
            }

            object.isLast = ENConsts.YES;

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, object.dayscnt, false);
				// ������������� ���� ���������� ������
				object.nextSheetDate = Tools.addDays(object.dateGen, object.dayscnt);
	        }

			ENSheets4SOType sheetType = getSheet4SOType(object);
            int dfDocCode = Integer.MIN_VALUE;

            if (isDistributionList) {
                dfDocCode = createDFDocByWFPack(object.wfPackCode, DFDocType.OUTBOX,
                        sheetType.nameForDfDoc, sheetType.dfDocNumMask, object.dateGen, sheetType.dfDepartmentCode, object.recipientAddress, ignoreDocDate);
            } else {
            	String customerName = null;
            	// ��� "����������� ����� �� ������������ ��������� ������"
            	// ���������� ����� �� �� ��������, � �� ������ �����
            	// (�.�. � ��� ����������� ��������, ��������, ��������, � ��� ��� ��������)
            	if (sheetType.code == ENSheets4SOType.PETITION) {
            		customerName = object.recipient;
            	}

                dfDocCode = createDFDocByENServicesObject(object.servicesobject.code, DFDocType.OUTBOX,
                        sheetType.nameForDfDoc, sheetType.dfDocNumMask, object.dateGen, sheetType.dfDepartmentCode, 
                        object.recipientAddress, customerName, object.postCode, ignoreDocDate);
            }

            DFDoc dfDoc = getDFDocByCode(dfDocCode);
			object.numbergen = dfDoc.docNum;
			object.dfDocCode = dfDocCode;
			object.dfDocTypeCode = DFDocType.OUTBOX;
			object.dfDocNumber = dfDoc.docNum;
			object.dfDocDate = dfDoc.dateRegistration;

	        object.code = objectDAO.add(object);

        	object = objectDAO.getObject(object.code);

        	// ��������� ������ ������, ���� ��� ����
			if (items != null) {
				ENSheets4SOItemsDAO sheet4SOItemsDao = new ENSheets4SOItemsDAO(connection, userProfile);
				for (ENSheets4SOItems sheetItem : items) {
					sheetItem.sheet4soRef.code = object.code;
					sheet4SOItemsDao.add(sheetItem);
				}
			}

        	// ��� � ������ ��������� ��� ���������� ��������,
        	// ������� ����� ����� ����� ��� �������������
        	createAttachmentByENSheets4SO(object);
        	objectDAO.save(object);

            //������ ���� ��� ���� ������ ����� ����� "���� ��� ������������� ������������"
            if (object.sheet4sotype.code != ENSheets4SOType.LAND_SHEET) {
                DFDocOutbox dfDocOutbox = getDFDocOutBoxByDFDoc(dfDoc.code);
                stampingAttachmentsByDocOutBox(dfDocOutbox, dfDoc);
            }

            if (isDistributionList) {
                DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByWFPackCode(object.wfPackCode);
                ENDocAttachment enDocAttachment = enDocAttachmentDAO.getObject(object.attachment.code);
                createAttachmentLinkToDFDocAttachment(enDocAttachment,dfDocSupplyEE.doc.code);
            }

        	createWFPack2DFDocForENSheet4SO(object);

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				// �������� ��������� ���� ���������� �����
				// 20.07.2020 SUPP-93091 ����� ����������� ���������, ������ ��� ��� ������ updateLastSheet4SO ����
	        	// ���������� ���-�� ���� �������� ��� ����������� ������
	        	calculateENSOValuesTermsIfNeeded(object.servicesobject.code);
	        }

		    return object.code;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/* ENSheets4SO. ������� */
	public void removeENSheets4SO(int code) {
		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
            ENSheets4SOItemsDAO itemsDAO = new ENSheets4SOItemsDAO(connection, userProfile);

			ENSheets4SO object = objectDAO.getObject(code);

	        if (object.sheet4sotype == null || object.sheet4sotype.code == Integer.MIN_VALUE) {
	        	throw new SystemException("\n\n�� ������� ��� �����!");
	        }

			if (object.isLast != ENConsts.YES) {
				throw new SystemException("\n\n�������� ������� ����� ������� ���� �������� ���� ��� ��������! ��� ���� �� � �������!");
			}

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, -object.dayscnt, false);
	        }

	        // ������� ������ ������ WorkFlow � ���������� DocFlow, ��������� ��� ������� ������
	        removeWFPack2DFDocForENSheet4SO(object);

	        // ������� ������ ������, ���� ��� ����
            ENSheets4SOItemsFilter itemFilter = new ENSheets4SOItemsFilter();
            itemFilter.sheet4soRef.code = object.code;
            int[] itmArr = itemsDAO.getFilteredCodeArray(itemFilter,0,-1);
            for (int i=0;itmArr.length>i;i++)
            {
                itemsDAO.remove(itmArr[i]);
            }

			objectDAO.remove(code);

	        // ������� (�� ��������� - ������ ������) ��������� ��������� �������� � ��������
	        removeDocFlowRelationsForENSheet(object);

			// ������ ������� "���������" ����������� ������
			updateIsLastForSheet4SO(object);

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
	        	// �������� ��������� ���� ���������� �����
				// 20.07.2020 SUPP-93091 ����� ����������� ���������, ������ ��� ��� ������ updateIsLastForSheet4SO ����
	        	// ���������� ���-�� ���� �������� ��� ����������� ������
				calculateENSOValuesTermsIfNeeded(object.servicesobject.code);
	        }
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

   	/* ENSheets4SO. �������� */
	public void saveENSheets4SO(ENSheets4SO object) {
		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
		    object.userGen = userProfile.userName;
	        object.dateEdit = new Date();

	        if (object.sheet4sotype == null || object.sheet4sotype.code == Integer.MIN_VALUE) {
	        	throw new SystemException("�� ������ ��� �����!");
	        }

	        ENSheets4SO oldObject = objectDAO.getObject(object.code);

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
	        	if (oldObject.dayscnt != object.dayscnt ) {
	        		int delta = object.dayscnt - oldObject.dayscnt;
	        		calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, delta, false);

					// ������������� ���� ���������� ������
					object.nextSheetDate = Tools.addDays(object.dateGen, object.dayscnt);
	        	}
	        }

		    objectDAO.save(object);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateUserGenForAutogeneratedENSheets4SO(int sheetCode) {
		if (sheetCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �����!");
		}

		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SO sheet = objectDAO.getObject(sheetCode);

			if (sheet.attachment != null && sheet.attachment.code != Integer.MIN_VALUE) {
				ENDocAttachmentDAO enDocAttachmentDAO = new ENDocAttachmentDAO(connection, userProfile);
				ENDocAttachment enDocAttachment = enDocAttachmentDAO.getObject(sheet.attachment.code);
				if (enDocAttachment != null) {
					enDocAttachment.userAdd = sheet.userGen;
					enDocAttachment.userGen = sheet.userGen;
					enDocAttachmentDAO.save(enDocAttachment);
				}
			}

			if (sheet.dfDocCode != Integer.MIN_VALUE) {
	            docFlowConnection = getDocFlowConnection();
	            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
	            docFlowLogic.updateUserForDFDoc(sheet.dfDocCode, sheet.userGen);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeDocFlowConnection();
		}
	}

	/**
	 * �������� ���� �������� �� ������� �� ����� ��� ��������� �������� �� �������������
	 *
	 * @param servicesObjectCode - ��� �������� �� �������������
	 *
	 * @throws PersistenceException
	 */
	public void recalcENSheets4SODaysCount(int servicesObjectCode) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������!");
		}

		ENSheets4SODAO sheetDao = new ENSheets4SODAO(connection, userProfile);

		ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
		sheetFilter.servicesobject.code = servicesObjectCode;
		sheetFilter.sheet4sotype.code = ENSheets4SOType.LAND_SHEET;
		sheetFilter.orderBySQL = "ENSHEETS4SO.DATEGEN, ENSHEETS4SO.CODE";

		int[] sheetCodes = sheetDao.getFilteredCodeArray(sheetFilter, 0, -1);

		// �������� ����� ������ ��� ���������, �� ������� ������ ������ ������
		if (sheetCodes.length <= 1) {
			return;
		}

		for (int i = 0; i < sheetCodes.length - 1; i++) {
			ENSheets4SO currentSheet = sheetDao.getObject(sheetCodes[i]);
			ENSheets4SO nextSheet = sheetDao.getObject(sheetCodes[i+1]);
			// 20.07.2020 SUPP-93091 ��� ����������� ������� ��������� ���� ���������� ����� �� ��������
			// ���-�� ���� �������� ��� ������ ������� ��� ������� ��� ����� ����� ��������� ��������
			// (�.�. ��� ��������� ������ ������ ������������� ���-�� ���� �������� ��� �����������)
			/*
			 * Tools.getDaysDiff �� ������ ��������� ������������ - ��������, ����� 30.03.2020 � 20.03.2020
			 * ���������� 9 ���� ������ 10, �.�. ������� � ����� 239 (� �� 240) ��-�� �������� �� ������ �����
			currentSheet.dayscnt = (int) Tools.getDaysDiff(Tools.clearTimeOfDate(currentSheet.dateGen),
					                                       Tools.clearTimeOfDate(nextSheet.dateGen),
					                                       TimeUnit.DAYS);
			*/
			currentSheet.dayscnt = Tools.getDaysBetweenTwoDates(Tools.clearTimeOfDate(currentSheet.dateGen),
                    											Tools.clearTimeOfDate(nextSheet.dateGen));
			sheetDao.save(currentSheet);
		}

		// ������������� ��������� ���� ���������� �����
		calculateENSOValuesTermsIfNeeded(servicesObjectCode);
	}

	public void createWFPack2DFDocForENSheet4SO(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ����� ��� ��������!");
		}
		// ������������ ����� ������������ ������ ��� ������ �� �������� - ��� ��� ������ �������� �� �����
		if (sheet.dfDocCode == Integer.MIN_VALUE) {
			//throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� ���� ��� ��������!");
			return;
		}

        boolean isDistributionList = false;
        if (sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_STATEMENT_ACCESSION
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_POINT_PASSPORT
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT
                || sheet.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR) {
            isDistributionList = true;
        }

        if (!isDistributionList) {
            if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
                throw new IllegalArgumentException("\n\n�� ������� ��� �������� �� ����!");
            }
        } else {
            if (sheet.wfPackCode <= 0) {
                throw new IllegalArgumentException("\n\n�� ������� ��� ������!");
            }
        }

		Connection wfConnection = null;
		try {
			wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, userProfile);
			WFPackDAO wfPackDAO = new WFPackDAO(wfConnection,userProfile);
			WFPack wfPack = null;
			if (isDistributionList)
                wfPack = wfPackDAO.getObject(sheet.wfPackCode);
            else
                wfPack = workFlowLogic.getWFPackByENServicesObjectCode(sheet.servicesobject.code);

			if (wfPack == null) {
				return;
			}

			DFDoc dfDoc = getDFDocByCode(sheet.dfDocCode);

			WFPack2DFDocControllerHome pack2DFDocHome = (WFPack2DFDocControllerHome)
	        		Tools.createControllerHome(WFPack2DFDocController.JNDI_NAME, WFPack2DFDocControllerHome.class);
			WFPack2DFDocController pack2DFDocController = pack2DFDocHome.create();

			WFPack2DFDoc pack2DFDoc = new WFPack2DFDoc();
			pack2DFDoc.packRef.code = wfPack.code;
			pack2DFDoc.dfDocCode = sheet.dfDocCode;
			pack2DFDoc.dfDocNumber = dfDoc.docNum;
			pack2DFDoc.dfDocDate = dfDoc.dateRegistration;
			pack2DFDoc.dfDocTypeCode = dfDoc.docTypeRef.code;
			pack2DFDoc.dfDocDescription = dfDoc.description;
			pack2DFDoc.commentgen = "������ ����������� ���� ��������� ����� �" + sheet.numbergen;
			pack2DFDocController.add(pack2DFDoc);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (wfConnection != null && !wfConnection.isClosed()) {
					wfConnection.close();
					wfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void removeWFPack2DFDocForENSheet4SO(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ����� ��� ��������!");
		}
		// ������������ ����� ������������ ������ ��� ������ �� �������� - ��� ��� ������ �������� �� �����
		if (sheet.dfDocCode == Integer.MIN_VALUE) {
			//throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� ���� ��� ��������!");
			return;
		}
		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� �� ����!");
		}

		Connection wfConnection = null;
		try {
			wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, userProfile);

			WFPack wfPack = workFlowLogic.getWFPackByENServicesObjectCode(sheet.servicesobject.code);
			if (wfPack == null) {
				return;
			}

			WFPack2DFDocFilter pack2DFDocFilter = new WFPack2DFDocFilter();
			pack2DFDocFilter.packRef.code = wfPack.code;
			pack2DFDocFilter.dfDocCode = sheet.dfDocCode;

			WFPack2DFDocDAO pack2DFDocDAO = new WFPack2DFDocDAO(wfConnection, userProfile);
			int[] pack2DFDocCodes = pack2DFDocDAO.getFilteredCodeArray(pack2DFDocFilter, 0, -1);
			if (pack2DFDocCodes.length == 0) {
				return;
			}

			for (int pack2DFDocCode : pack2DFDocCodes) {
				workFlowLogic.removeWFPack2DFDoc(pack2DFDocCode, false);
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (wfConnection != null && !wfConnection.isClosed()) {
					wfConnection.close();
					wfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void createWFPack2DFDoc(int wfPackCode, int dfDocCode) {
		createWFPack2DFDoc(wfPackCode, dfDocCode, null);
	}

	public void createWFPack2DFDoc(int wfPackCode, int dfDocCode, String comment) {
        if (wfPackCode <= 0) {
            throw new IllegalArgumentException("\n\n�� ������� ��� ������!");
        }
		if (dfDocCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
		}

		try {
			DFDoc dfDoc = getDFDocByCode(dfDocCode);

			WFPack2DFDocControllerHome pack2DFDocHome = (WFPack2DFDocControllerHome)
	        		Tools.createControllerHome(WFPack2DFDocController.JNDI_NAME, WFPack2DFDocControllerHome.class);
			WFPack2DFDocController pack2DFDocController = pack2DFDocHome.create();

			WFPack2DFDoc pack2DFDoc = new WFPack2DFDoc();
			pack2DFDoc.packRef.code = wfPackCode;
			pack2DFDoc.dfDocCode = dfDocCode;
			pack2DFDoc.dfDocNumber = dfDoc.docNum;
			pack2DFDoc.dfDocDate = dfDoc.dateRegistration;
			pack2DFDoc.dfDocTypeCode = dfDoc.docTypeRef.code;
			pack2DFDoc.dfDocDescription = dfDoc.description;
			pack2DFDoc.commentgen = (comment != null ? comment :
				"������ ����������� ���� ��������� ��������� � ����� " + dfDocCode);

			pack2DFDocController.add(pack2DFDoc);

		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int addENSheetForENActIncomeTechCond(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ���������!");
		}

		try {
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			if (servicesObject == null) {
				throw new SystemException("\n\n�� �������� ������ ��� ��������� � ����� " + servicesObjectCode + " !");
			}

			ENSheets4SO newSheet = new ENSheets4SO();
			newSheet.dateGen = new Date();

			newSheet.recipient = servicesObject.contragentName;
			if (servicesObject.customerMailingAddress != null &&
					!servicesObject.customerMailingAddress.trim().isEmpty()) {
				newSheet.recipientAddress = servicesObject.customerMailingAddress;
			} else {
				newSheet.recipientAddress = servicesObject.contragentAddress;
			}

			if (newSheet.recipient == null || newSheet.recipient.trim().isEmpty()) {
				throw new SystemException("\n\n�� ������� ��������� ��������� ��� �������� ��� ��������� � ����� " +
						servicesObjectCode + " !");
			}
			if (newSheet.recipientAddress == null || newSheet.recipientAddress.trim().isEmpty()) {
				throw new SystemException("\n\n�� ������� ��������� ������ ��������� ��� �������� ��� ��������� � ����� " +
						servicesObjectCode + " !");
			}

			newSheet.sheet4sotype.code = ENSheets4SOType.NOTIFICATION_ACT;

			setSignerToSheets(newSheet, newSheet.sheet4sotype.code);
			newSheet.isWithSignature = 1;

			ENSheets4SOType sheetType = getSheet4SOType(newSheet);
			if (sheetType == null) {
				throw new SystemException("\n\n�� ������� ��� �����!");
			}

			newSheet.name = sheetType.nameForDfDoc;
			newSheet.executorFio = sheetType.executorFio;
			newSheet.executorPhone = sheetType.executorPhone;
			newSheet.executorEmail = sheetType.executorEmail;

			newSheet.servicesobject.code = servicesObjectCode;

			newSheet.commentgen = "����������� ����������� " + new SimpleDateFormat("dd.MM.yyyy").format(new Date());

			return addENSheets4SO(newSheet);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void removeENSheetForENActIncomeTechCond(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ���������!");
		}
		try {
			ENSheets4SODAO sheetDao = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.servicesobject.code = servicesObjectCode;
			sheetFilter.sheet4sotype.code = ENSheets4SOType.NOTIFICATION_ACT;

			int[] sheetCodes = sheetDao.getFilteredCodeArray(sheetFilter, 0, -1);
			if (sheetCodes.length > 1) {
				throw new SystemException("\n\n��� �������� � ����� " + servicesObjectCode +
						" �������� ������� ���������� ����� �� ����������� ��� ������� ������� � ���������!");
			}

			if (sheetCodes.length == 1) {
				removeENSheets4SO(sheetCodes[0]);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ���� ���������� ��� ��������� �� �� �������� ��������
	 * @param servicesObject
	 */
	public void recalcServicesDistance(ENServicesObject servicesObject) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(connection, userProfile);
			PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
			ENPlanWork2ClassificationTypeDAO pl2clDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENPlanWork2ClassificationTypeFilter pl2clFilter = new ENPlanWork2ClassificationTypeFilter();

			pl2clFilter.planRef.code = getPlanWorkCalculationByElementCode(servicesObject.element.code).code;
			ENPlanWork2ClassificationTypeShortList pl2clList = pl2clDao.getScrollableFilteredList(pl2clFilter, 0, -1);

			boolean deleteServicesObject = false;
			BigDecimal contractServicesDistance = servicesObject.contractServicesDistance;


			ENPlanWork2ClassificationTypeShortList oldClassificationTypeShortList = new ENPlanWork2ClassificationTypeShortList();

			for (int n = 0; n < pl2clList.totalCount; n++) {

				ENPlanWork2ClassificationTypeShort classificationTypeShort = new ENPlanWork2ClassificationTypeShort();
				classificationTypeShort.classificationTypeRefCode = pl2clList.get(n).classificationTypeRefCode;
				classificationTypeShort.countGen = pl2clList.get(n).countGen;

				oldClassificationTypeShortList.list.add(classificationTypeShort);

				planWorkItemLogic.removePlanWorkItemsByClassificationTypeForCalculation(pl2clList.get(n).code, deleteServicesObject);
			}


			for (int i = 0; i < pl2clList.totalCount; i++) {

				/** ��� ������ ����������� ����������� ���������� (��) ����������... */
				boolean everyNext = checkClassificationEveryNext(oldClassificationTypeShortList.get(i).classificationTypeRefCode);

				if (everyNext) {
					contractServicesDistance = new BigDecimal(0);
				}

				ENPlanWork2ClassificationType planWork2ClassificationType = new ENPlanWork2ClassificationType();
				planWork2ClassificationType.classificationTypeRef.code = oldClassificationTypeShortList.get(i).classificationTypeRefCode;
				planWork2ClassificationType.countGen = oldClassificationTypeShortList.get(i).countGen;
				planWork2ClassificationType.machineHours = new BigDecimal(0);
				planWork2ClassificationType.isJobsByTime = ENPlanWork2ClassificationType.NOT_JOBSBYTIME;
				planWork2ClassificationType.isVisitClient = ENPlanWork2ClassificationType.NOT_VISITCLIENT;
				
				// SUPP-106625 ����� ������ ������ � ���������� "����������" ��� ��������, ����� ��� �������� ����������� � ����� if
				planWork2ClassificationType.planRef.code = planWorkLogic.getPlanCodeForCalculationByServicesObjectCode(servicesObject.code);
				
				if (everyNext) {

					planWorkItemLogic.addPlanWorkItemsByClassificationTypeForCalculation2(
							planWork2ClassificationType, contractServicesDistance, servicesObject.department.code, false, null);

				} else {
					planWorkItemLogic.addPlanWorkItemsByClassificationTypeForCalculation2(planWork2ClassificationType,
							contractServicesDistance, servicesObject.department.code, false, false, servicesObject,
							true, servicesObject.countersZoneType, false, null);
				}
			}


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



	/**
	 * �������� - �������� �� ����������� ������ �����������...
	 *
	 * @param classificationTypeCode
	 * @return everyNext
	 */
	private boolean checkClassificationEveryNext(int classificationTypeCode) {

		boolean everyNext = false;

		try {
			TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);

			TKClassificationTypeFilter tkClassificationTypeFilter = new TKClassificationTypeFilter();
			tkClassificationTypeFilter.conditionSQL = " tk.code in (select cl.code " + " from tkclassificationtype cl "
					+ " where cl.everynextrefcode = " + classificationTypeCode + " ) ";

			int tArr[] = classificationTypeDao.getFilteredCodeArray(tkClassificationTypeFilter, 0, -1);
			if (tArr.length > 0) {
				everyNext = true;
			}

			return everyNext;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 * ��� ������ ����� �� ������ �������� ��������� � �������...
	 *
	 * @param servicesObject
	 */
	public void compareBudgetRelation(ENServicesObject servicesObject) {
		try {

			/** ���� ������ ������� � ������� � ����� */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.consumerTypeRef.code == DFConsumerType.JURIDICAL) {

					if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET
							|| servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET) {


						if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
							servicesConsumer.budgetRelation = ENConsts.YES;
						} else {
							servicesConsumer.budgetRelation = ENConsts.NO;
						}

						servicesConsumerDao.save(servicesConsumer);


						if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

							docFlowConnection = getDocFlowConnection();
							SiteLogic siteLogic = new SiteLogic(docFlowConnection, userProfile);

							siteLogic.updateBudgetRelationSiteApplication(servicesConsumer.code, servicesConsumer.budgetRelation);
						}

					} else {
						throw new SystemException("\n\n"
								+ "��� ����������� ������� ���� \"��.����� (������)\" ��� \"��.����� (�� ������)\"!");
					}
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateRecordPointByt(ENRecordPointBytShort recordPointByt) {
		if (recordPointByt == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� - ����� �����!");
		}

		if (recordPointByt.elementCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ����� �����!");
		}

		if (recordPointByt.accountNumber == null || recordPointByt.accountNumber.trim().equals("")) {
			throw new IllegalArgumentException("\n\n�� ������� �������� ������� ��� ����� �����! [elementCode = " +
                                               recordPointByt.elementCode + "]");
		}

		try {
			ENRecordPointBytDAO recordPointBytDao = new ENRecordPointBytDAO(connection, userProfile);
			ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
			recordPointBytFilter.element.code = recordPointByt.elementCode;

			int rpArr[] = recordPointBytDao.getFilteredCodeArray(recordPointBytFilter, 0, -1);
			if (rpArr.length == 1) {
				ENRecordPointByt recordPointBytForUpdate = recordPointBytDao.getObject(rpArr[0]);
				String oldAccountNumber = recordPointBytForUpdate.accountNumber;

				recordPointBytForUpdate.accountNumber = recordPointByt.accountNumber;
				if (recordPointByt.contractDate != null) {
					recordPointBytForUpdate.contractDate = recordPointByt.contractDate;
				}

				recordPointBytDao.save(recordPointBytForUpdate);
				System.out.println("@@@@@ UPDATED RecordPointByt: oldAccountNumber - " + oldAccountNumber + ", " +
				                   "newAccountNumber: " + recordPointByt.accountNumber + " @@@@@");
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateRecordPointProm(ENRecordPointPromShort recordPointProm) {
		if (recordPointProm == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� - ����� �����!");
		}

		if (recordPointProm.elementCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ����� �����!");
		}

		if (recordPointProm.accountNumber == null || recordPointProm.accountNumber.trim().equals("")) {
			throw new IllegalArgumentException("\n\n�� ������� �������� ������� ��� ����� �����! [elementCode = " +
                                               recordPointProm.elementCode + "]");
		}

		try {
			ENRecordPointPromDAO recordPointPromDao = new ENRecordPointPromDAO(connection, userProfile);
			ENRecordPointPromFilter recordPointPromFilter = new ENRecordPointPromFilter();
			recordPointPromFilter.element.code = recordPointProm.elementCode;

			int rpArr[] = recordPointPromDao.getFilteredCodeArray(recordPointPromFilter, 0, -1);
			if (rpArr.length == 1) {
				ENRecordPointProm recordPointPromForUpdate = recordPointPromDao.getObjectNoSegr(rpArr[0]);
				String oldAccountNumber = recordPointPromForUpdate.accountNumber;

				recordPointPromForUpdate.accountNumber = recordPointProm.accountNumber;
				if (recordPointProm.contractDate != null) {
					recordPointPromForUpdate.contractDate = recordPointProm.contractDate;
				}

				recordPointPromDao.save(recordPointPromForUpdate);
				System.out.println("@@@@@ UPDATED RecordPointProm: oldAccountNumber - " + oldAccountNumber + ", " +
		                           "newAccountNumber: " + recordPointProm.accountNumber + " @@@@@");
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
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

			callcenterConnection  = getCallcenterConnection();
			ENServicesObjectDAO enServicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
			//������ ������������ ���������� ������� � �����
			CCTower2JLCDAO ccTower2JLCDAO = new CCTower2JLCDAO(userProfile, callcenterConnection);

			ENServicesObject enServicesObject = enServicesObjectDAO.getObject(servicesObjectCode);

			if (enServicesObject == null)
				throw new SystemException("�������� �� ������ ����� ("+servicesObjectCode+") �� ����");

			/* ��� �������� �� ������ - ���������� ������ */
			if ((enServicesObject.contractTypeRef.code == ENServicesContractType.OKSN )
					/*��� �������� �� ������ - �������� �� ������ �������(����������) � �������������� */
				&& (enServicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU)
						/*������� ��������� ����� �� �������*/
				&& (enServicesObject.contractStatusRef.code == ENServicesContractStatus.SIGNED)
				/*������ �������� �� ������� �� ������� � ���. ���.*/
				&& (enServicesObject.statusRef.code == ENServicesObjectStatus.GOOD)){

				/*--------------------------------------------Update to CallCenter------------------------------------------------------------------*/

				CCTower2JLCFilter ccTower2JLCFilterTo = new CCTower2JLCFilter();
				ccTower2JLCFilterTo.contractNumberServices = enServicesObject.contractNumberServices;
				CCTower2JLCShortList ccTower2JLCShortList = ccTower2JLCDAO.getScrollableFilteredList(ccTower2JLCFilterTo,0,-1);

				if(ccTower2JLCShortList.size()>0)
					ccTower2JLCDAO.updateIsRealizedCCtower2jlc(enServicesObject.contractNumberServices,isRealized);

			}else{
				throw new SystemException("��� �������� �� ������� �� �������, ������� ���� - ����\n"+
											"��� �������� �� ������� �� �������, ������� ���� - �������� �� ������ ���� (����)\n"+
											"������ �������� ������ �� �������, ������� ���� - ϳ��������\n"+
											"������ �������� ������ �� ������� � Գ�.���., ������� ���� - ��������");
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeCallCenterConnection();
		}
	}

	/**
	 * ���������� ��� �������� �� ������������� ({@link ENServicesObject}) �� ���� ���������� ����
	 *
	 * @param actCode - ��� ���� ({@link ENAct})
	 * @param isThrowExceptionIfNotExists - ���������� �� ����������, ���� ������� �� ������ ({@code true} - ��)
	 *
	 * @return ��� �������� �� �������������
	 *
	 * @throws PersistenceException
	 */
    public int getServicesObjectConnectionByActCode(int actCode, boolean isThrowExceptionIfNotExists) throws PersistenceException {
        if (actCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\n�� ������� ��� ����!");
        }

        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObjectFilter f = new ENServicesObjectFilter();
        f.conditionSQL = " code in (" +
						 "   select so2tc.servicesobjectrefcode " +
						 "   from enact2enplanwork a2pl, entechcond2planwork tc2pl, enservicesobject2techcondtnsservices so2tc " +
						 "   where a2pl.plancode = tc2pl.planrefcode " +
						 "     and so2tc.techcondservrefcode = tc2pl.techconservicesrefcode " +
						 "     and a2pl.actrefcode = " + actCode + ")";

        int[] arr = objDAO.getFilteredCodeArrayNOSEGR(f, 0, -1);

        if (arr.length != 1) {
        	if(arr.length == 0) {
        		if(isThrowExceptionIfNotExists) {
        			throw new SystemException("\n\n��� ���� � ����� " + actCode + " �� �������� ������ ��� ���������!");
        		} else {
        			return Integer.MIN_VALUE;
        		}
        	} else {
                throw new SystemException("\n\n��� ���� � ����� " + actCode + " �������� ������� (" + arr.length + ") �������� ��� ���������!");
        	}
        }

        return arr[0];
    }

    /**
     * ��������� ������ WorkFlow �� ���� ���������� ���� (��� ��������� �� �������������)
     *
     * @param actCode - ��� ���� ({@link ENAct})
     *
     * @return ����� WorkFlow ({@link WFPack})
     */
	public WFPack getWFPackByActCode(int actCode) {
        if (actCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\n�� ������� ��� ����!");
        }

		Connection wfConnection = null;
		try {
			wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, userProfile);

			int servicesObjectCode = getServicesObjectConnectionByActCode(actCode, false);
			if (servicesObjectCode == Integer.MIN_VALUE) {
				return null;
			}

			return workFlowLogic.getWFPackByENServicesObjectCode(servicesObjectCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (wfConnection != null && !wfConnection.isClosed()) {
					wfConnection.close();
					wfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public WFPack2DFDoc generateWFPack2DFDocByDFDocDecree(int wfPackCode, DFDocDecree decree) {
		WFPack2DFDoc wfPack2DFDoc = new WFPack2DFDoc();
		wfPack2DFDoc.packRef.code = wfPackCode;
		wfPack2DFDoc.dfDocCode = decree.doc.code;
		wfPack2DFDoc.dfDocTypeCode = decree.doc.docTypeRef.code;
		wfPack2DFDoc.dfDocNumber = decree.doc.docNum;
		wfPack2DFDoc.dfDocDate = decree.doc.dateRegistration;
		wfPack2DFDoc.dfDocDescription = decree.doc.description;
		return wfPack2DFDoc;
	}

	public void checkGiveCounterForServicesObject(ENServicesObject servicesObject) throws PersistenceException {
		if (isGiveCounterOnBalanceByServicesObjectCode(servicesObject.code, ENGiveCounter.IS_GIVE_TO_BALANCE)
				&& !Arrays.asList(ENServicesContragentType.JURIDICAL_BUDGET,
						          ENServicesContragentType.JURIDICAL_NONBUDGET,
						          ENServicesContragentType.JURIDICAL_NOREZIDENT).contains(servicesObject.contragentTypeRef.code)) {
	        ENServicesObject2RQFKOrderDAO sofoDao = new ENServicesObject2RQFKOrderDAO(connection, userProfile);
			RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(connection, userProfile);
			ENServicesObject2RQFKOrderShortList sofoList = sofoDao.getENServicesObject2RQFKOrderShortListByServicesObject(servicesObject);

			boolean hasOrder = false;

			for (ENServicesObject2RQFKOrderShort sofo : sofoList.list) {
				RQFKOrder fkOrder = fkOrderDao.getObject(sofo.fkOrderRefCode);
				if (fkOrder.kind.code == RQFKOrderKind.PRIHOD_POSTAVKA
						&& fkOrder.accountingTypeRef.code == TKAccountingType.COUNTERS) {
					hasOrder = true;
					break;
				}
			}

			if(!hasOrder) {
				throw new SystemException(String.format("\n\n��� �������� � %s �� ������������ ��������"
						+ ", ��� ����� �� �������� �� �������� �� ���� ��������.\n"
						+ "��������� ������� �������� ���������� �� ���� ����������� �������� �\n"
						+ "������� \"˳�������, �� ����������\".", servicesObject.contractNumberServices));
			}
		}

		if (isGiveCounterOnBalanceByServicesObjectCode(servicesObject.code, ENGiveCounter.IS_GIVE)) {
			ENGiveCounterDAO giveCounterDao = new ENGiveCounterDAO(connection, userProfile);
			ENGiveCounterFilter giveCounterFilter = new ENGiveCounterFilter();
			giveCounterFilter.servicesObjectRef.code = servicesObject.code;

			int[] giveCounterCodes = giveCounterDao.getFilteredCodeArray(giveCounterFilter, 0, -1);

			if (giveCounterCodes.length == 0) {
				throw new SystemException(String.format("\n\n��� �������� � %s �� ������������ ��������"
						+ ", ��� ����� ��� �������� �� ��������.\n"
						+ "��������� ������� �������� ���������� �� ���� ����������� �������� �\n"
						+ "������� \"˳�������, �� ����������\".", servicesObject.contractNumberServices));
			}
		}
	}

    /**
     *
     * @param wfPackCode
     * @param dfDocType
     * @param docName
     * @param docNum
     * @param docDate
     * @param dfDepartmentCode
     * @param customerAddress
     * @param ignoreDocDate - ���� = true, ���. �������� �������������� ������� ���������� �����, ����� - ����� docDate
     * @return
     */
    public int createDFDocByWFPack(int wfPackCode, int dfDocType,
                                             String docName, String docNum, Date docDate, int dfDepartmentCode, String customerAddress,
                                             boolean ignoreDocDate) {
        if (wfPackCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\n�� ������� wfPackCode!");
        }

        if (dfDocType == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\n�� ������� ��� ���������!");
        }

        int dfDocCode = Integer.MIN_VALUE;
        String postCode = null;

        Connection wfConnection = null;
        WFPack wfPack = null;
        try {
            wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
            WFPackDAO wfPackDAO = new WFPackDAO(wfConnection, userProfile);
            wfPack = wfPackDAO.getObject(wfPackCode);

            if (wfPack == null) {
                throw new SystemException("\n\n�� �������� ����� � ����� " + wfPackCode + " !");
            }

            postCode = getDFDocPostCodeByWFPackCode(wfPackCode);

            dfDocCode = createDFDoc(wfPack.customerName, wfPack.customerAddress, wfPack.customerPhone, postCode,
                    wfPack.department.code,dfDocType, docName, docNum, docDate, dfDepartmentCode, customerAddress, ignoreDocDate);

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            try {
                if (wfConnection != null && !wfConnection.isClosed()) {
                    wfConnection.close();
                    wfConnection = null;
                }
            } catch (SQLException e) {
            }
        }

        return dfDocCode;
    }

    public int createDFDocAttachmentENReport(int dfDocCode, String attachmentDescription, String fileName,
                                                   EPReportRequestEx request, String type, boolean is_for_docflow, int oldDFDocAttachmentCode) {
        try {
            ENReportControllerHome reportHome = (ENReportControllerHome)
                    Tools.createControllerHome(ENReportController.JNDI_NAME,ENReportControllerHome.class);
            ENReportController reportController = reportHome.create();

            byte[] report = reportController.processAsByteArray(request, type, is_for_docflow);

            DFDocAttachmentControllerHome docAttachmentHome = (DFDocAttachmentControllerHome)
                    Tools.createControllerHome(DFDocAttachmentController.JNDI_NAME, DFDocAttachmentControllerHome.class);
            DFDocAttachmentController dfDocAttachmentController = docAttachmentHome.create();

            DFDocAttachment dfDocAttachment = new DFDocAttachment();
            dfDocAttachment.doc.code = dfDocCode;
            dfDocAttachment.commentGen = attachmentDescription;
            // ���� ��� ���� ��� ��������, �� ������� ���
            if (oldDFDocAttachmentCode != Integer.MIN_VALUE) {
            	dfDocAttachment.parentRef.code = oldDFDocAttachmentCode;
			}
            int dfDocAttachmentCode = dfDocAttachmentController.add(dfDocAttachment, report, fileName);
            if (dfDocAttachmentCode == Integer.MIN_VALUE) {
                throw new SystemException("\n\n�� ������� ������ ���������!");
            }
            dfDocAttachment = dfDocAttachmentController.getObject(dfDocAttachmentCode);
            if (dfDocAttachment == null) {
                throw new SystemException("\n\n�� �������� ��������� � ����� " + dfDocAttachmentCode + " !");
            }

            return dfDocAttachment.endocattcode;
        } catch (RemoteException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new SystemException(e.getMessage(), e);
        }
    }

    public DFDocSupplyEE getDFDocSupplyEEByWFPackCode(int wfPackCode) {
        try {
            docFlowConnection = getDocFlowConnection();
            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
            return docFlowLogic.getDFDocSupplyEEByWFPackCode(wfPackCode);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeDocFlowConnection();
        }
    }

    /**
     *  ������ �� �������� ���������� ��� DFDocAttachment
     *
     *  @param enDocAttachment - ���������
     *  @param dfDocCode - ��� DFDoc
     */
    public int createAttachmentLinkToDFDocAttachment(ENDocAttachment enDocAttachment, int dfDocCode){
        Connection wfConnection = null;
        int dfDocAttachmentCode = Integer.MIN_VALUE;
        try {
            wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
            WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, userProfile);
            dfDocAttachmentCode = workFlowLogic.createAttachmentLinkToDFDocAttachment(enDocAttachment,dfDocCode);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        }finally {
            try {
                if (wfConnection != null && !wfConnection.isClosed()) {
                    wfConnection.close();
                    wfConnection = null;
                }
            } catch (SQLException e) {
            }
        }
        return dfDocAttachmentCode;
    }

    public DFDocOutbox getDFDocOutBoxByDFDoc(int dfDocCode){
        try {
            docFlowConnection = getDocFlowConnection();
            DFDocOutboxDAO dfDocOutboxDAO = new DFDocOutboxDAO(docFlowConnection, userProfile);
            DFDocOutboxFilter dfDocOutboxFilter = new DFDocOutboxFilter();
            dfDocOutboxFilter.doc.code=dfDocCode;
            DFDocOutboxShortList dfDocOutboxShortList = dfDocOutboxDAO.getScrollableFilteredList(dfDocOutboxFilter,0,-1);
            DFDocOutbox dfDocOutbox = null;
            if (dfDocOutboxShortList.totalCount == 1)
                dfDocOutbox = dfDocOutboxDAO.getObject(dfDocOutboxShortList.get(0).code);
            return dfDocOutbox;
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeDocFlowConnection();
        }
    }

    /**
     * ��������� ������ ���������� �� �������� ������� ���������
     *
     * @param dfDocOutbox
     * @param doc
     *
     */
    public void stampingAttachmentsByDocOutBox(DFDocOutbox dfDocOutbox, DFDoc doc) {
        try {
            docFlowConnection = getDocFlowConnection();
            AttachmentsLogic attachmentsLogic = new AttachmentsLogic(docFlowConnection, userProfile);
            attachmentsLogic.stampingAttachmentsByDocOutBox(dfDocOutbox,doc);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeDocFlowConnection();
        }
    }

    /**
     * �������� PostCode �� DFDoc
     *
      * @param wfPackCode   -   ��� ������
     * @return
     */
    public String getDFDocPostCodeByWFPackCode(int wfPackCode){
        if (wfPackCode == Integer.MIN_VALUE) {
            throw new SystemException("�� �������� ��� ������!");
        }

        String postCode = null;
        int dfDocCode = Integer.MIN_VALUE;

        Connection wfConnection = null;

        try {
            wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
            docFlowConnection = getDocFlowConnection();
            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
            WFPack2DFDocDAO p2dDAO = new WFPack2DFDocDAO(wfConnection, userProfile);
            WFPack2DFDocFilter p2dFilter = new WFPack2DFDocFilter();
            p2dFilter.packRef.code = wfPackCode;
            p2dFilter.dfDocTypeCode = DFDocType.SERVICESCONSUMER;
            WFPack2DFDocShortList p2dList = p2dDAO.getScrollableFilteredList(p2dFilter, 0, -1);

            if (p2dList.totalCount == 1)
                dfDocCode = p2dList.get(0).dfDocCode;
            if (dfDocCode != Integer.MIN_VALUE)
                postCode = docFlowLogic.getDFDocByCode(dfDocCode).postCode;
            return postCode;
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        }finally {
            closeDocFlowConnection();
            try {
                if (wfConnection != null && !wfConnection.isClosed()) {
                    wfConnection.close();
                    wfConnection = null;
                }
            } catch (SQLException e) {
            }
        }
    }



	/**
	 * �������� ������������ �� �� �������� ��������
	 *
	 * @param servicesObjectCode
	 * @param warrantCode
	 */
	public void changeWarrant(int servicesObjectCode, int warrantCode) {

		PreparedStatement statement = null;
		String updateSql = " update enservicesobject set warrantrefcode = " + warrantCode + " where code = " + servicesObjectCode;

		try {

			statement = connection.prepareStatement(updateSql);
			statement.execute();

		} catch (SQLException e) {
			throw new SystemException(e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
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
    public int addBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode) throws SystemException {
        try {
            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
            ENElement2ENElementDAO enElement2ENElementDAO = new ENElement2ENElementDAO(connection, userProfile);
            ENServicesObjectFilter filterCalculation = new ENServicesObjectFilter();
            ENServicesObjectFilter filterConnection = new ENServicesObjectFilter();
            filterCalculation.element.code = soElementCalculationCode;
            filterConnection.element.code = soElementConnectionCode;

            int[] arrCalculation = objDAO.getFilteredCodeArrayNOSEGR(filterCalculation, 0, -1);
            int[] arrConnection = objDAO.getFilteredCodeArrayNOSEGR(filterConnection, 0, -1);

            checkSOByElementCode(arrCalculation.length,soElementCalculationCode,"������!");
            checkSOByElementCode(arrConnection.length,soElementConnectionCode,"������ ��� ���������!");

            ENElement2ENElement enElement2ENElement = new ENElement2ENElement();
            enElement2ENElement.elementInRef.code = soElementCalculationCode;
            enElement2ENElement.elementOutRef.code = soElementConnectionCode;
            enElement2ENElement.typeRef.code = SERVICES_OBJECT_BIND_CALCULATION_TO_CONNECTION;

            return enElement2ENElementDAO.add(enElement2ENElement);

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
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
            ENElement2ENElementDAO enElement2ENElementDAO = new ENElement2ENElementDAO(connection, userProfile);
            ENElement2ENElementFilter enElement2ENElementFilter = new ENElement2ENElementFilter();
            enElement2ENElementFilter.elementInRef.code = soElementCalculationCode;
            enElement2ENElementFilter.elementOutRef.code = soElementConnectionCode;
			enElement2ENElementFilter.typeRef.code = SERVICES_OBJECT_BIND_CALCULATION_TO_CONNECTION;

            ENElement2ENElementShortList enElement2ENElementShortList = enElement2ENElementDAO.getScrollableFilteredList(enElement2ENElementFilter,0,-1);

            checkSOByElementCode(enElement2ENElementShortList.totalCount,soElementCalculationCode,"������!");

            enElement2ENElementDAO.remove(enElement2ENElementShortList.get(0).code);

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        }
    }

    public void checkSOByElementCode(int arrLength, int soElementCode, String message){
		if (arrLength <= 0) {
			throw new SystemException("\n\n�� element �������: " + soElementCode + " �� �������� "+message);
		}
    }


	public ENServicesObject getServicesObjectByTechCoditionObjectCode(int tcoCode)
			throws PersistenceException {
		ENServicesObject out = new ENServicesObject();

		ENServicesObjectDAO servicesDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObjectFilter servicesFilter = new ENServicesObjectFilter();
		servicesFilter.conditionSQL = " code in (select so2tc.servicesobjectrefcode \n" +
				"from entechconditionsobjcts tco, encontragent contr, enservicesobject2techcondtnsservices so2tc \n" +
				"where tco.code = contr.techconobjectscode \n" +
				"and contr.techcondservicesrefcod = so2tc.techcondservrefcode\n" +
				"and tco.code = " + tcoCode + ")";
		int[] servArr = servicesDAO.getFilteredCodeArray(servicesFilter, 0, -1);
		if (servArr.length != 1){
			throw new SystemException("������� � ������� ��� ���� ��� ��������! " );
		}

		out = servicesDAO.getObject(servArr[0]);

		return out;
	}

	public ENTechConditionsObjects getTechCoditionByServicesObjectCode(int soCode)
			throws PersistenceException {
		ENTechConditionsObjects out = new ENTechConditionsObjects();

		ENTechConditionsObjectsDAO tcoDAO = new ENTechConditionsObjectsDAO(connection, userProfile);
		ENTechConditionsObjectsFilter tcoFilter = new ENTechConditionsObjectsFilter();
		tcoFilter.conditionSQL = " code in (select tco.code \n" +
				"from entechconditionsobjcts tco, encontragent contr, enservicesobject2techcondtnsservices so2tc \n" +
				"where tco.code = contr.techconobjectscode \n" +
				"and contr.techcondservicesrefcod = so2tc.techcondservrefcode\n" +
				"and so2tc.servicesobjectrefcode = " + soCode + ")";
		int[] tcoArr = tcoDAO.getFilteredCodeArray(tcoFilter, 0, -1);
		if (tcoArr.length != 1){
			throw new SystemException("������� � ������� �������� ��� �������! " );
		}

		out = tcoDAO.getObject(tcoArr[0]);

		return out;
	}

	/**
	 * ����� ��� ������ ���������� �������� �� ������� �� ������� ��� ������ ���������� ���������� ����
	 *
	 * @param act - ���, ������� ���������� ({@link com.ksoe.energynet.valueobject.ENAct})
	 */
	public void deleteServicesObjectFromFK(ENAct act) {
		try {
			ENServicesObject servicesObject = getServicesObjectByAct(act);

			// ���� ��� ������� �� �������������, �������, ������ ��� �� ���������� ���
			// ���������� ������� � ���������� ����� (����������� ��� ��������� ����)
			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				return;
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENServicesObjectController.JNDI_NAME);
			ENServicesObjectControllerHome servicesObjectControllerHome = (ENServicesObjectControllerHome) PortableRemoteObject.narrow(objRef, ENServicesObjectControllerHome.class);
			ENServicesObjectController servicesObjectController = servicesObjectControllerHome.create();

			// �������� ���������� ��������
			servicesObjectController.deleteFromFK(servicesObject.code, Integer.MIN_VALUE, this);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ����� ��� ������ �������� �������� �� ������� �� ������� � ������ "������ ���������" ��� ������ ���������� ���������� ����
	 *
	 * @param act - ���, ������� ���������� ({@link com.ksoe.energynet.valueobject.ENAct})
	 */
	public void undoFinishWorksForServicesObject(ENAct act) {
		try {
			ENServicesObject servicesObject = getServicesObjectByAct(act);

			// ���� ��� ������� �� �������������, �������, ������ ��� �� ���������� ���
			// ���������� ������� � ���������� ����� (����������� ��� ��������� ����)
			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				return;
			}

			if (servicesObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
				return;
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENServicesObjectController.JNDI_NAME);
			ENServicesObjectControllerHome servicesObjectControllerHome = (ENServicesObjectControllerHome) PortableRemoteObject.narrow(objRef, ENServicesObjectControllerHome.class);
			ENServicesObjectController servicesObjectController = servicesObjectControllerHome.create();

			// �������� ������� � ������ "������ ���������"
			servicesObjectController.undoFinishWorks(servicesObject.code);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public ENServicesObject getServicesObjectByAct(ENAct act) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		if (act.actTypeRef.code != ENPlanWorkState.WORK_IN_OUT ||
				act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
			return null;
		}

		try {
			ENServicesObject servicesObject = getServicesObjectByElementCode(act.element.code);

			if (servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4596 �� �������� ������ ������ �� ������� ��� ���� � ����� " + act.code + " !");
			}

			return servicesObject;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean checkIfStandardServicesObjectByAct(ENAct act) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		ENServicesObject servicesObject = getServicesObjectByAct(act);

		if (servicesObject == null) {
			return false;
		}

		if (servicesObject.contractTypeRef.code != ENServicesContractType.TY && 
				servicesObject.contractTypeRef.code != ENServicesContractType.OTHERS) {
			return false;
		}

		if (servicesObject.contractKindRef.code != ENServicesContractKind.SERVICES) {
			return false;
		}

		return true;
	}

	public void addENSoValuesForPersonalCabinet(int servicesObjectCode, String login, String password) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\nSUPP-104504 �� ������� ��� �������� ��� ���������!");
		}
		if (login == null || login.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\nSUPP-104504 �� ������� ���� ��� ��������� ������������� ������� � ���������!");
		}
		if (password == null || password.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\nSUPP-104504 �� ������� ������ ��� ��������� ������������� ������� � ���������!");
		}

		addStringENSoValueForServicesObject(servicesObjectCode, ENSOValuesType.PERSONAL_CABINET_LOGIN, login);
		addStringENSoValueForServicesObject(servicesObjectCode, ENSOValuesType.PERSONAL_CABINET_PASSWORD, password);
	}

	public void addStringENSoValueForServicesObject(int servicesObjectCode, int soValuesType, String strVal) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ���������!");
		}
		if (soValuesType <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ����������� ��������!");
		}
		if (strVal == null || strVal.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\n�� ������ �������� ����������� ��������!");
		}

		try {
			ENSOValuesDAO soValuesDAO = new ENSOValuesDAO(connection, userProfile);

			ENSOValues soValue = new ENSOValues();
			soValue.servicesobject.code = servicesObjectCode;
			soValue.soValuesType.code = soValuesType;
			soValue.strVal = strVal;
			soValuesDAO.add(soValue);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int getLandSheetDelayForServicesObject(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� ��� ���������!");
		}

		int connectionKind = getConnectionKind(servicesObjectCode);
		if (connectionKind == Integer.MIN_VALUE) {
			return Integer.MIN_VALUE;
		}

		try {
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			if (servicesObject == null) {
				throw new SystemException("\n\n�� �������� ������ ��� ��������� � ����� " + servicesObjectCode + " !");
			}

			ENLandSheetsDelaysDAO delaysDao = new ENLandSheetsDelaysDAO(connection, userProfile);

			ENLandSheetsDelaysFilter delaysFilter = new ENLandSheetsDelaysFilter();
			String strDate = Tools.dateFormatDefault.format(Tools.clearTimeOfDate(servicesObject.contractDateServices));
			delaysFilter.conditionSQL = "to_date('" + strDate + "', 'dd.MM.yyyy') between DATEFROM and DATETO";

			ENLandSheetsDelaysShortList delaysList = delaysDao.getScrollableFilteredList(delaysFilter, 0, -1);

			if (delaysList.totalCount == 0) {
				throw new SystemException("\n\n�� �������� ����� ��� ����������� ��������� �����-���������� " +
						"��� �������� � ����� " + strDate + " (��� ��������: " + servicesObjectCode + ") !");
			} else if (delaysList.totalCount > 1) {
				throw new SystemException("\n\n�������� ������� ������ � ������ ��� ����������� ��������� �����-���������� " +
						"��� �������� � ����� " + strDate + " (��� ��������: " + servicesObjectCode + ") !");
			}

			if (connectionKind == ENConnectionKind.STANDART) {
				return delaysList.get(0).standardDelay;
			} else if (connectionKind == ENConnectionKind.NO_STANDART || connectionKind == ENConnectionKind.READY_MADE) {
				return delaysList.get(0).nonstandardDelay;
			}

			return Integer.MIN_VALUE;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}
	
	//SUPP-107075 ����. ����������� ������������� ������ ��������� �� ������, �� ���������� �������� ��� ���������
	public void expiredAgreementsCancellation() {
		Connection wfConnection = null;
		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENServicesObjectDAO enServicesObjectDAO = new ENServicesObjectDAO(netConnection, userProfile);

			ENServicesObjectFilter enServicesObjectFilter = new ENServicesObjectFilter();
			enServicesObjectFilter.conditionSQL = "(SELECT ensovalues.dateval FROM ensovalues "
					+ "WHERE ensovalues.sovaluestypecode = " + ENSOValuesType.CONTRACT_REGISTRATION_DATE
					+ " AND ensovalues.servicesobjectcode = enservicesobject.code) >= to_date('01.06.2021', 'dd.MM.yyyy') "
					+ "AND (SELECT ensovalues.dateval + interval '20' DAY FROM ensovalues "
					+ "WHERE ensovalues.sovaluestypecode = " + ENSOValuesType.TU_RECEIVING_DATE
					+ " AND ensovalues.servicesobjectcode = enservicesobject.code) < CURRENT_DATE "
					+ "AND (SELECT enpayment2so.code FROM enpayment2so "
					+ "WHERE enpayment2so.servicesobjectrefcode = enservicesobject.code limit 1) IS NULL "
					+ "AND enservicesobject.contractstatusrefcode not in ("
					+ ENServicesContractStatus.TERMINATED + ", " + ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES + ")"
					+ " AND ENSERVICESOBJECT.contracttyperefcode = " + ENServicesContractType.CONNECTION
					+ " AND ENSERVICESOBJECT.contractkindrefcode = " + ENServicesContractKind.SERVICES;
			int[] enServicesObjectCodes = enServicesObjectDAO.getFilteredCodeArrayNOSEGR(enServicesObjectFilter, 0, -1);

			if (enServicesObjectCodes.length == 0) {
				return;
			}

			wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WFPackDAO wFPackDAO = new WFPackDAO(wfConnection, userProfile);
			WFPackFilter wFPackFilter = new WFPackFilter();
			String soCodes = Tools.intArrayToStr(enServicesObjectCodes, ",");
			wFPackFilter.conditionSQL = "wfpack.code IN (SELECT wfpack2servicesobject.packcode FROM wfpack2servicesobject "
					+ "WHERE wfpack2servicesobject.socode IN(" + soCodes + "))";

			int[] wFPackCodes = wFPackDAO.getFilteredCodeArray(wFPackFilter, 0, -1);

			WorkFlowLogic workFlowLogic = new WorkFlowLogic(wfConnection, userProfile);
			for (int i : wFPackCodes) {
				if(wFPackDAO.getObject(i).packStatus.code != WFPackStatus.ARCHIVE){
					workFlowLogic.sendToArchive(i, Integer.MIN_VALUE, "����� �� �������, �� �������� �������");
				}
			}

			if (netConnection == null || netConnection.isClosed()) {
				netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			}
			ENSOValuesDAO ensoValuesDAO = new ENSOValuesDAO(netConnection, userProfile);
			enServicesObjectDAO = new ENServicesObjectDAO(netConnection, userProfile);

			for (int i : enServicesObjectCodes) {
				ENServicesObject enServicesObject = enServicesObjectDAO.getObject(i);
				if(ensoValuesDAO.getObject(enServicesObject, ENSOValuesType.FUNDS_HAVE_NOT_BEEN_PAID) == null){
					ensoValuesDAO.add(ensoValuesDAO.createEmptySOValuesForServicesObject(enServicesObject,
							ENSOValuesType.FUNDS_HAVE_NOT_BEEN_PAID));
				}
				if (enServicesObject.contractStatusRef.code != ENServicesContractStatus.TERMINATED) {
					enServicesObject.contractStatusRef.code = ENServicesContractStatus.TERMINATED;
					enServicesObjectDAO.save(enServicesObject);
				}
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (wfConnection != null && !wfConnection.isClosed()) {
					wfConnection.close();
					wfConnection = null;
				}
			} catch (SQLException e) {
			}
			if (netConnection != null) {
				try {
					netConnection.close();
				} catch (SQLException e) {
				}
			}
		}
	}
}
