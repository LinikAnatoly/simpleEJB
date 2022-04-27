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
	// Переехало в ENConsts
    //public static final int DEPARTMENT_CO = 3; // Аппарат управления

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
            throw new SystemException("Помилка у кількості планів-кошторисів ... " );
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
            throw new SystemException("Помилка у кількості планів-кошторисів ... " );
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
            throw new SystemException("Помилка у кількості планів-кошторисів ... " );
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

        /** SUPP-8557... 11.11.2013 +++ для присоединений план с типом акта "Реконструкция и модернизация" */
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

/** SUPP-20235 2014-07-18 после общения с бухгалтерией (Скороход, Федорчак) было решено добавить условие на
  * определение цеха по следующему алгоритму:
  * 1.если есть акт реконструкции/модернизации - берем его
  * 2.если акта реконструкции/модернизации нет, проверяем есть ли акт строительства - берем его
/** SUPP-21767 2014-08-22 появился еще один тип акта, который добавлен в условие определения цеха
  * 3.если нет акта строительства проверяем тип акта технического обслуживания - берем его (при этом смотрим на
  * задание-факт, т.к. планы по ЗКУ ВРТУВД связывает руками и вкидывает только факт...)
  * 4.если ничего нет-вываливаем ошибку (бухгалтерия сказала, что не знает сейчас что в таком случае делать)*/

        /**
         * SUPP-45793 Уже знает что делать - проверяем тип акта - роботы на сторону
         */

        if (priconnections) {
            if (planArr.length == 0) {
                planFilter.stateRef.code = ENPlanWorkState.CAPITAL_BUILDER;
                planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

                /** 12.12.2016 +++ проектирование */
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
	                                   "Помилка формування проводок!" +
	                        		   "\n Неможливо визначити <Цех> для шаблону проводок." +
	                                   "\n Немає актів з реконструкції/модернізації, або капітального будівництва." +
	                        		   "\n Зверніться до методолога ЦБ.");
	                	   }
	                   }
	                }
	            }
	        }
         }

        if (!priconnections) {
            if (planArr.length != 1) {
                throw new SystemException("\n" +
                        "Помилка у кількості місячних планів ... " );
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
            * SystemException("Помилка у кількості актів ... " ); }
            */
            if (actArr.length == 0) {
                throw new SystemException(
                        "На цей об'єкт ще не складений видатковий акт!");
            }

            if (actArr.length > 1) {
                throw new SystemException(
                        "На даний об'єкт знайдено більше, ніж один видатковий акт!");
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
    		throw new IllegalArgumentException("\n\nНе заданий договір послуг на сторону!");
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
		 * "Помилка у кількості планів для Калькуляції № " +
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
		 * NET-2396 NET-2397 NET-2399 NET-2401 проверить являются ли калькуляции
		 * Работы службы изоляции» (ветка в справочнике классификаторов 1.1.01)
		 * «Кабельные линии 0,4-35кВ»(ветка в справочнике классификаторов 1.1.02
		 * ) «Воздушные линии 0.4-20кВ» (ветка в справочнике классификаторов
		 * 1.1.03) «Воздушные линии 35-150кВ» (ветка в справочнике
		 * классификаторов 1.1.04) Если относятся тогда механизм расчета
		 * километража отдельный
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

		// дочерние кода справочника класификаций работ для службы изоляции
		strCodeIzol = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED));


		// дочерние кода справочника класификаций работ для Кабельные линии
		// 0,4-35кВ
		strKL04_35 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV));

		// дочерние кода справочника класификаций работ для Воздушные линии
		// 0.4-20кВ
		strVL04_20 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV));

		// дочерние кода справочника класификаций работ для Воздушные линии
		// 35-150кВ
		strVL35_150 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV));

		strBuilding = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_BUILDING));

		strSzdtu = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SZDTU));

		// определим к чему именно относится калькуляции в кошторисе (работы сл
		// изоляц или каб лин 04-34 или воздушн линий 04-20 или воздушн линий
		// 35-150)
		ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
		ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
		ENPlanWork2ClassificationTypeShortList p2cList = null;
		// ищем для сл изоляции
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
		// ищем для каб линий 04-35
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
		// ищем для воздушных линий 04-20
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

		// ищем для воздушных линий 35-150
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

		// ищем для воздушных линий 35-150
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

		// ищем для СЗДТУ
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

		// если работы службы изоляции
		if (isCodeIzol) {
			createDistancesIzol(servicesObject, plan, distance);
		} else if (isKL04_35 || isVL04_20 || isVL35_150 || isBuilding) {
			/*если работы по каб линиям или работы по возд линиям и по строительству */
			createDistancesKlVl(servicesObject, plan, distance);
		} else if(isSzdtu) {
			/*Если работа СЗДТУ*/
			createDistancesKlVl(servicesObject, plan, distance, true);
	    } else {
			for (int i = 0; i < trArr.length; i++) {
				// Для калькуляций по нелиц. работам (по всем, кроме транспорта
				// !!) накидываем расстояния только на 1-ю машину

				int transportCode = trArr[i];

				if (isNotLicensedActivity == TKConsts.ISNOTLICENSEDACTIVITY_SERVICE_OTHERS) {
					if (i > 0)
						break;
				}

				if(isNotLicensedActivity == TKConsts.ISNOTLICENSEDACTIVITY_SERVICE_OTHERS) {
					// 08.04.2019 небольшая ошибка из-за которой для нелицензионных работ не расчитывалась
					// доставка персонала - непонятно, то ли глюк в программе или в данных - если транспорт
					// был введен на нескольких техкартах калькуляции, то дистанции могут проставиться не на том транспорте, что
					// с доставкой. Сделаем так, чтобы, если есть транспорт с доставкой, то брался он, а не первый попавшийся.
					ENTransportItemFilter filter = new ENTransportItemFilter();
					filter.planRef.code = plan.code;
					filter.conditionSQL = "exists (select 1 from tktechcard as tc1 inner join enplanworkitem as pi1 on tc1.code = pi1.kartarefcode " +
					" where coalesce(tc1.middlesallaryway,?) > ? and pi1.code = ENTRANSPORTITEM.PLANITEMREFCODE)";
					Vector<BigDecimal> binded = new Vector<>(Arrays.asList(BigDecimal.ZERO, BigDecimal.ZERO));
					int[] transportWithDelivery = trDAO.getFilteredCodeArray(filter, 0, -1, binded);
					if(transportWithDelivery.length > 0) {
						// 08.04.2019 Будем присваивать транспорт если нашелся ровно один с доставкой персонала, если нашлось несколько, то
						// возникает неопределенность на какой транспорт нужно добавлять дистанции
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


		// а нах нам кол-во бенза? ;))
		// если надо - ИСПРАВИТЬ generateGSMEstimate4Calculation - он считает из
		// норм РЕАЛЬНОГО тр-та ...
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
     * Возвращает объект услуг на сторону {@link ENServicesObject} по коду элемента {@link ENElement}
     *
     * Выдаст ошибку если элемент не является договором услуг на сторону
     *
     * @param elementCode код элемента
     * @return объект договора услуг на сторону {@link ENServicesObject}
     * @throws PersistenceException
     */
    public ENServicesObject getServicesObjectByElementCode(int elementCode) throws PersistenceException {
    	return getServicesObjectByElementCode(elementCode, true);
    }

    /**
     *
     * Возвращает объект услуг на сторону {@link ENServicesObject} по коду элемента {@link ENElement}
     *
     * @param elementCode код элемента
     * @param isThrowExceptionIfNotExists если {@code true}, то выдаст исключение если элемент не связан с договором,
     * в противном случае возвратит {@code null}
     * @return объект договора услуг на сторону {@link ENServicesObject}
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
            throw new SystemException("\n\nNET-4576 Не заданий код акту!");
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
    		//throw new SystemException("\n\nNET-4576 Не знайдено договір для акту з кодом " + actCode + " !");
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

          /* Обязательные поля
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
                throw new SystemException("Редагувати можливо тільки чорнові кошториси!");
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
                throw new SystemException("Редагувати можливо тільки чорнові кошториси!");
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
                throw new SystemException("Цей кошторис редагувати не можна!");
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
        // Проверяем, чтобы не добавляли в калькуляции классификации без привязки к виду работ из Услуг
        TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
        TKClassificationTypeShort ctObjShort = ctDAO.getShortObject(object.classificationTypeRef.code);

        if (ctObjShort.finWorkTypeCode == Integer.MIN_VALUE)
        {
            throw new SystemException("Для роботи (класифікації) \"" + ctObjShort.kod + "  " + ctObjShort.name + "\"" +
                                                "\n не вказаний вид робіт з Послуг! \n Зверніться у Центральну Бухгалтерію!");
        }

        if ((ctObjShort.finWorkTypeFinCode == null) || (ctObjShort.finWorkTypeFinCode == ""))
        {
            throw new SystemException("У довіднику видів робіт з Послуг не заданий код виду. Код у довіднику: " + ctObjShort.finWorkTypeCode);
        }

        if ((ctObjShort.finWorkTypeAccount == null) || (ctObjShort.finWorkTypeAccount == ""))
        {
            throw new SystemException("У довіднику видів робіт з Послуг (" + ctObjShort.finWorkTypeFinCode + ") не заданий бух. рахунок. Код у довіднику: " + ctObjShort.finWorkTypeCode);
        }
        ///////

        if (!priconnections) {
            ////////////////////////////////////////////////////////////////
            // Проверка на совпадение видов работ из Услуг
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
                                throw new SystemException("Заборонено включати у договір роботи, які мають різні види у Послугах: \n" +
                                        ctObj.kod  + ": " + (ctObj.finWorkType.name == null ? "(невідомо)" : ctObj.finWorkType.name) + " \n" +
                                        ctObj1.kod + ": " + (ctObj1.finWorkType.name == null ? "(невідомо)" : ctObj1.finWorkType.name) + " !");
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
            // находим код плана для кошториса и кошториса единичного по объекту
              // для кошториса не единичного
            Connection connect = null;
            try {
            int planCalcSingle = Integer.MIN_VALUE;
            int planCalc = Integer.MIN_VALUE;

            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            // код плана единичного кошториса
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

            // проверим если нет единичного кошториса то тогда и пересчитывать нечего
            if (planCalcSingleList.length == 0 ) {
                return;
            }
            planCalcSingle = planCalcSingleList[0];
            // код плана кошториса

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
            // пересчитываем расчет зарплаты для кошториса
            scLogic.reCalculateCalcHumenSalary(planCalcSingle , planCalc );
            // пересчитываем расчет материалов для кошториса

            //  scLogic.recalculateMaterials(planCalcSingle , planCalc );  NET-4212

            // encalccost пересчет вартості виконання додаткових робіт (послуг) (Калькуляційна вартість згідно калькуляції)
            scLogic.recalculateCost(planCalcSingle, planCalc, priconnections);
            // encalcTotalcost пересчет стоимости общей
            scLogic.recalculateTotalCost(planCalcSingle, planCalc, priconnections);
            // пересчитываем стоимость общую по договору для ПЛАНА кошторис единичный
            scLogic.calculateContractCost(planCalcSingle, priconnections);
            // пересчитываем стоимость общую по договору для ПЛАНА кошторис
            scLogic.calculateContractCost(planCalc, priconnections);

            ENServicesObject soObj = getServicesObjectByPlanCode(planCalc);

            // обновим сумму по договору на сервис обжекте
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


            // по коду кошториса выбираем записи со связки и пересчитываем cost b totalcost
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


            // сумарное время выполнения работ
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
            // вытянем время доставки в один конец
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

            // начало времени отведенного для выполнения работ по договору  timestart
            ENTimeLineDAO tlDAO = new ENTimeLineDAO(connect, userProfile);
            ENTimeLineFilter tlFilter = new ENTimeLineFilter();
            tlFilter.servicesObjectRef.code = servicesObjectCode;
            ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
            if (tlList.totalCount > 0 ){

                // ОБЕДЕННОЕ ВРЕМЯ
                Calendar cLunch  = Calendar.getInstance();
                cLunch.setTime(tlList.get(0).dateGen); // ДАТУ БЕРЕМ ИЗ ТАЙМ ЛАЙН ПОД ТЕКУЩИЙ ДОГОВОР
                cLunch.set(Calendar.HOUR,START_LUNCH_HOUR);
                cLunch.set(Calendar.MINUTE,START_LUNCH_MINUTE);
                cLunch.set(Calendar.SECOND,0);
                cLunch.set(Calendar.MILLISECOND,0);

                long startLunch_Value = cLunch.getTime().getTime();

                cLunch  = Calendar.getInstance();
                cLunch.setTime(tlList.get(0).dateGen); // ДАТУ БЕРЕМ ИЗ ТАЙМ ЛАЙН ПОД ТЕКУЩИЙ ДОГОВОР
                cLunch.set(Calendar.HOUR,FINAL_LUNCH_HOUR);
                cLunch.set(Calendar.MINUTE,FINAL_LUNCH_MINUTE);
                cLunch.set(Calendar.SECOND,0);
                cLunch.set(Calendar.MILLISECOND,0);

                long finalLunch_Value = cLunch.getTime().getTime();


                int timeHour = sumTime.intValue(); // длительность выполнения работ ЧАСЫ
                int timeMinute = new Double( (sumTime.doubleValue() - sumTime.intValue()) * 60 ).intValue(); // длительность выполнения работ МИНУТЫ
                // значения даты начала  интервала пребывания исполнителя у заказчика
                Calendar c = Calendar.getInstance();
                c.setTime(tlList.get(0).timeStart);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                long tempTimeStart_Value = c.getTime().getTime();
                // значения даты во сколько исполнитель отправляется к заказчику
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
                  // значения даты окончания интервала пребывания исполнителя у заказчика
                Date tempTimeFinal_Date = c.getTime();
                long tempTimeFinal_Value = c.getTime().getTime();





                // список всех тайм лайнов по этим же бригадам что привязаны к этому договору за указаный день выполнения работ.
                ENTimeLineFilter tlOtherFilter = new ENTimeLineFilter();
                tlOtherFilter.dateGen = tlList.get(0).dateGen;
                tlOtherFilter.conditionSQL = " ENSERVICESOBJECT.CODE <> " + servicesObjectCode +
                    " and ENTIMELINE.VIRTUALBRIGADEREFCODE in " +
                    " ( select tl2.virtualbrigaderefcode from entimeline tl2 where tl2.servicesobjectrefcode = " + servicesObjectCode + " )";
                ENTimeLineShortList tlOtherList = tlDAO.getScrollableFilteredList(tlOtherFilter,0,-1);


//                 если интервал ПРЕБІВАНИЯ НА ОБЇЕКТЕ "По"  НАХОДИТСЯ В ПРЕДЕЛАХ ОБЕДА ИЛИ ПЕРЕКРЫВАЕТ время обеда то перенести часть времени на после обед
                /* if ( (tempTimeFinal_Value > startLunch_Value ) && ( tempTimeFinal_Value < finalLunch_Value ) ) {
                    tempTimeFinal_Value = finalLunch_Value +
                                            (tempTimeFinal_Value - tempTimeStart_Value ) - // длительность выполнения работ
                                            (startLunch_Value - tempTimeStart_Value)  ;
                    tempTimeFinal_Date.setTime(tempTimeFinal_Value);
                }
                // если интервал пребывания на объекте вылазит за пределы обеденного времени то к времени конца
                if ((tempTimeFinal_Value  > finalLunch_Value) && (tempTimeStart_Value < startLunch_Value )) {
                    tempTimeFinal_Date.setTime(tempTimeFinal_Value + (finalLunch_Value - startLunch_Value));
                } */

                if ((tempTimeFinal_Value > startLunch_Value ) && ( tempTimeStart_Value < startLunch_Value )) {
                            tempTimeFinal_Value = finalLunch_Value +
                              (tempTimeFinal_Value - tempTimeStart_Value ) - // длительность выполнения работ
                              (startLunch_Value - tempTimeStart_Value)  ;
                        tempTimeFinal_Date.setTime(tempTimeFinal_Value);
                }

                int timeHourDelivery1Way = timeDelivery1Way.intValue(); // время доставки ЧАСЫ
                  int timeMinuteDelivery1Way = new Double( (timeDelivery1Way.doubleValue() - timeDelivery1Way.intValue()) * 60 ).intValue(); // время доставки Минуты
                  c = Calendar.getInstance();
                  // к времени окончания интервала пребывания исполнителя у заказчика прибавим кол-во часов для определения во сколько исполнитель вернется на базу
                c.setTime(tempTimeFinal_Date);
                c.add(Calendar.HOUR , timeHourDelivery1Way);
                c.add(Calendar.MINUTE , timeMinuteDelivery1Way);
                c.set(Calendar.SECOND, 0);
                c.set(Calendar.MILLISECOND,0);
                  // значения даты возвращения исполнителя от заказчика
                Date tempTimeMoveOfObject_Date = c.getTime();
                long tempTimeMoveOfObject_Value = c.getTime().getTime();

                for (int ii = 0; ii < tlOtherList.totalCount; ii++){
                    // определим начало и конец выполнения работ этими же бригадми в этот день
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





                    // проверка что бы не налазило на соседние тайм лайн
                    // если конец timeLine текущего договора попал во внутрь другого timeLine то посылаем
                    if ( (tempTimeMoveOfObject_Value > startOtherTimeLine) && (tempTimeMoveOfObject_Value < finalOtherTimeLine)){
                        throw new SystemException("Помилка в резервуванні часу для поточного договору . В цей час бригади задіяні на іншому об`єкті." );
                        }
                    // если конец timeline текущего договора оказался больше чем timeline по длругому договору
                    // и если начало выполнения движений по текущему договору меньше чем для другого договора
                    if ( (tempTimeMoveOfObject_Value >= finalOtherTimeLine) && ( tempTimeMoveToObject_Value < startOtherTimeLine )){
                        throw new SystemException("Помилка в резервуванні часу для поточного договору . В цей час бригади задіяні на іншому об`єкті." );
                        }



                }
                // проверили на пересечение если не пересклись значит ставим новое время окончания работ на объекте и время возвращения в TimeLine
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
                // обновить  дату выполнения , интервал с и  интервал по на сервисобжекте
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connect, userProfile);
                ENServicesObject soObj ;
                soObj =  soDAO.getObject(servicesObjectCode);
                soObj.executeWorkDate = tlList.get(0).dateGen; // дата выполнения работ
                soObj.timeStart = tlList.get(0).timeStart; // время начала пребывания на объекте
                soObj.timeFinal = tempTimeFinal_Date; // новое время окончания периода пребывания на объекте
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


//         проверка есть ли в связке ENPlanWork2ClassificationType работы резервируемые по времени под договор
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
        * Обязательные поля
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


        /** SUPP-69112... +++ даты плана берем с договора... */
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
    //  {throw new SystemException("Больше одного транспорт айтема!");}
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
    //  {throw new SystemException("Больше одного транспорт айтема!");}
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



  // дочерние кода справочника класификаций работ для службы изоляции
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
        // есть ли в калькуляциях ЭТЛ если есть то вернем транспорт итем с той калькуляции у которой проставлено максимальное значение средней ЗП в дороге
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

        // транспорт итем с ЕТЛ определили значит ставим для него дистансы
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

        // если ЕТЛ нет тогда определим транспортитем с бригадным авто и с максимальной ЗП в дороге в перечне калькуляций

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

        // проставим дистансы для транспорт итемов исключая бригадные авто сгрупированных по нормативному транспорту и которые с мин кодом транспорт итема

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
        // есть ли в калькуляциях ЭТЛ если есть то вернем транспорт итем с той калькуляции у которой проставлено максимальное значение средней ЗП в дороге
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



        // определим транспортитем с бригадным авто и с максимальной ЗП в дороге в перечне калькуляций

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

        // проставим дистансы для транспорт итемов исключая бригадные авто сгрупированных по нормативному транспорту и которые с мин кодом транспорт итема
         //  NET-4215 - не создавать дистансы на марки транспорта с типом "Засоби механізації"
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
    * Метод для проверки количества счетчиков в Услугах (метрология) при
    * работах, в которых обязательна передача счетчика абонентом
    * @param servicesObjectCode - код договора по услугам на сторону (ENServicesObject)
    *
    */
    public void checkGiveCounters(int servicesObjectCode) {
    	// SUPP-90074 Из-за объединения калькуляций нужно убирать проверку
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
                                + "\n Кількість лічильників " + giveCounterArr.length + " які передаются "
                                + "\n не відповідає кількості робіт " + plan2clList.get(i).countGen.intValue() + "!!!"
                                + "\n Класифікація - " + plan2clList.get(i).classificationTypeRefName);
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
     * Метод для расчета стоимости фактически использованных материалов в услугах на сторону по коду акта
     * @param actCode - код акта выполненных работ
     * @return Стоимость фактически использованных материалов, грн.
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
            "   /*Если costworkcontractor не пустая, значит работа сторонняя - не включаем в расходный акт*/ \n" +
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
            "  /*Если costworkcontractor не пустая, значит работа сторонняя - не включаем в расходный акт*/ "+
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
                    //throw new SystemException("\n\nNET-4235 Помилка під час розрахунку витрат матеріалів для акту з кодом " + actCode);
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
     * Возвращает стоимость счетчика без стоимости последней параматризации
     *
     * SUPP-57045 не берется стоимость счетчика если он оприходован от абонента (находится на счету 1534)
     * SUPP-67287 не берется стоимость счетчика если он оприходован от абонента
     * и равен по стоимости основному средству (находится на счету 1522)
     *
     * @param actCode - код акта
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
     * Метод для расчета стоимости фактических транспортных затрат в услугах на сторону по коду акта
     * @param actCode - код акта выполненных работ
     * @return Стоимость фактических транспортных затрат, грн.
     */
    public BigDecimal getTransportCostByAct(int actCode) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0);

        BigDecimal fuelCost = new BigDecimal(0);
        BigDecimal salary = new BigDecimal(0);
        BigDecimal transportCost = new BigDecimal(0);

        ////////////////////////////////////////////////////////////////////////////////////////
        // 1 - Стоимость ГСМ
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
            "   /*Если costworkcontractor не пустая, значит работа сторонняя - не включаем в расходный акт*/ \n" +
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
                    //throw new SystemException("\n\nNET-4235 Помилка під час розрахунку транспортних витрат (1) для акту з кодом " + actCode);
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
        // 2 - Зарплата водителей с учетом ЕСВ
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

        // 22.05.13 С учетом ЕСВ!!!
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
                    //throw new SystemException("\n\nNET-4235 Помилка під час розрахунку транспортних витрат (2) для акту з кодом " + actCode);
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
        // 3 - Затраты на использование транспорта
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
                    //throw new SystemException("\n\nNET-4235 Помилка під час розрахунку транспортних витрат (3) для акту з кодом " + actCode);
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
     * Метод для расчета стоимости нахождения специалистов в дороге (с учетом ЕСВ!) в услугах на сторону по коду акта
     * @param actCode - код акта выполненных работ
     * @return Стоимость нахождения специалистов в дороге с учетом ЕСВ, грн.
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
                    //throw new SystemException("\n\nNET-4235 Помилка під час розрахунку вартості знаходження спеціалістів у дорозі для акту з кодом " + actCode);
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
     * Метод для получения калькуляционной стоимости по договору в услугах на сторону по коду элемента
     * @param elementCode - код элемента
     * @return Калькуляционная стоимость, грн.
     */
    public BigDecimal getCalculationCostByElementCode(int elementCode) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(elementCode);

        if (plan == null)
        {
            throw new SystemException("\n\nNET-4235 Не знайдено план-кошторис для elementCode = " + elementCode);
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
                    throw new SystemException("\n\nNET-4235 Помилка під час визначення калькуляційної вартості для elementCode = " + elementCode);
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
     * Метод для расчета фактических затрат по акту для услуг на сторону
     *
     * @param actCode - код акта
     * @param unsign - можно ли отменить подписание акта автоматически
     *                ( = true, если акт был переведен в статус "На підписанні" автоматически в recalcServicesFactCalc)
     * @param isSignatured - указание для перевода акта в статус "На підписанні"
     */
	public void recalcServicesFactCalcByAct(int actCode, boolean unsign,
			boolean isSignatured) throws PersistenceException {

        ENActDAO actDAO = new ENActDAO(connection, userProfile);
        ENAct act = actDAO.getObject(actCode);


        if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT)
        {
            throw new SystemException("\n\nNET-4235 Акт не є актом виконаних робіт по послугах на сторону! Код акту: " + actCode);
        }


        /** для услуг со счетчиками подписание акта присходит при формировании ОЗ
         *  при перерасчете акта удалять связку нельзя
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

        // Выносим старый расчет
        if (act.statusRef.code != ENActStatus.CLOSED) {
            ENServicesFactCalcByActFilter factCalcByActFilter = new ENServicesFactCalcByActFilter();
            factCalcByActFilter.actRef.code = actCode;
            int[] factCalcByActArr = factCalcByActDAO.getFilteredCodeArray(factCalcByActFilter, 0, -1);
            for (int i = 0; i < factCalcByActArr.length; i++)
            {
                factCalcByActDAO.remove(factCalcByActArr[i]);
            }

            // Создаем новый расчет
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
                throw new SystemException("\n\nNET-4235 Неможливо перерахувати час доставки персоналу, тому що " +
                        "видатковий акт для цього об'єкта вже проведений! " +
                        "Спочатку поверніть акт у статус \"Чорновий\"!" +
                        "\nКод акту: " + act.code);
            }

            // ???!!! return;
        }


        /**  при отмене статуса "Работы выполнены" - удаляется расчет фактических затрат и доставка уже может быть посчитана в акте...  */
        if (act.statusRef.code == ENActStatus.SIGNATURE
        		&& factCalcByAct.deliveryCost != null) {

            // Создаем новый расчет
            factCalcByAct.actRef.code = actCode;
            factCalcByAct.servicesObjectRef.code = servicesObject.code;

            factCalcByAct.materialsCost = getMaterialsCostByAct(actCode);
            factCalcByAct.transportCost = getTransportCostByAct(actCode);

        } else {

        	///////////////////////////////////////////////////////////////////////////
            // 22.05.13 Новицкая Л.В. Если транспортные затраты нулевые, но на договоре есть километраж,
            // пересчитываем время доставки, исходя из расстояния на договоре и средней скорости 30 км/ч

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
                        throw new SystemException("\n\nNET-4235 Неможливо перерахувати час доставки персоналу, тому що " +
                                "видатковий акт для цього об'єкта вже проведений! " +
                                "Спочатку поверніть акт у статус \"Чорновий\"!" +
                                "\nКод акту: " + act.code);
                    }

                    if (act.statusRef.code == ENActStatus.SIGNATURE)
                    {
                        // Если акт на подписании, отменяем подписание
                        // (но только в том случае, если акт был подписан автоматически нами же в recalcServicesFactCalc)
                        if (unsign)
                        {
                        	// Перед отменой подписания акта сохраним подписантов
                        	ActLogic actLogic = new ActLogic(connection, userProfile);
                        	DFDocSigner[] dfDocSigners = actLogic.getDFDocSigners(act);

                            // Отменяем подписание
                        	actController.unSignatured(act.code, deleteUsageInput);
                        	// Перечитаем акт
                        	act = actDAO.getObject(act.code);

                        	// Если на акте были подписанты, вернем их обратно и пересохраним акт
                        	if (dfDocSigners != null && dfDocSigners.length > 0) {
                        		actController.saveDFDocSigners(act, dfDocSigners);
                        		// перечитаем акт, чтобы где-нибудь потом не вылетело Optimistic locking
                        		act = actDAO.getObject(act.code);
                        	}
                        }
                        else
                        {
                            throw new SystemException("\n\nNET-4235 Неможливо перерахувати час доставки персоналу, тому що " +
                                    "видатковий акт для цього об'єкта знаходиться на підписанні! " +
                                    "Спочатку поверніть акт у статус \"Чорновий\"!" +
                                    "\nКод акту: " + act.code);
                        }
                    }
                    else if (act.statusRef.code != ENActStatus.GOOD)
                    {
                        throw new SystemException("\n\nNET-4235 Неприпустимий статус акту (" + act.statusRef.code + ")! Код акту: " + act.code);
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
                        // Пересчитываем акт и переводим его в статус "На подписании"                    	
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
     * Метод для расчета фактических затрат по договору по услугам на сторону
     *
     * @param servicesObject - договор по услугам на сторону (объект)
     * @param forceRecalcServicesFact - указание для расчета фактических затрат при проведенном акте
     * @param notFinishWorks - указание для изменения статуса договора
     *
     * @return Сумма по договору без НДС
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
					"\n\nNET-4235 Не знайдено видатковий акт для об'єкту! Код об'єкта: "
							+ servicesObject.code);
		}


		try {
			Context cnt = new InitialContext();
			Object objRef = cnt.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
			ENActController actController = actHome.create();

			boolean unsign = false;

			/** указание для перевода акта в статус "На подписи" */
			boolean isSignatured = true;
			if (notFinishWorks) {
				isSignatured = false;
			}

			//////////
			// 19.07.2018 Для договоров с расчетом по кошторису ничего не пересчитываем, просто вернем текущую сумму
			if (servicesObject.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT) {

				// Переведем черновые акты в статус "На подписании"
				for (int i = 0; i < actArr.length; i++) {
					ENAct act = actDAO.getObject(actArr[i]);

					if (act == null) {
						throw new SystemException(
								"\n\nNET-4235 Не знайдено видатковий акт для об'єкту! Код об'єкта: "
										+ servicesObject.code);
					}

					if (act.statusRef.code == ENActStatus.GOOD) {
						// Если акт еще не на подписании, пересчитываем его и переводим на подписание (автоматически переводится после пересчета)
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
								"\n\nNET-4235 Не знайдено видатковий акт для об'єкту! Код об'єкта: "
										+ servicesObject.code);
					}

					if (act.statusRef.code == ENActStatus.GOOD) {
						// Если акт еще не на подписании, пересчитываем его и переводим на подписание (автоматически переводится после пересчета)
	                    actController.fillActData(act.code, isSignatured);
						unsign = true;

					} else if (act.statusRef.code == ENActStatus.SIGNATURE) {
						unsign = true;

					} else {
						///// 17.06.13 ВПТУ Не будем пересчитывать акт, если он уже подписан
	                    // Если акт на подписании, вначале отменяем подписание, а потом пересчитываем его
	                    // actController.unSignatured(act.code);
	                    // actController.fillActData(act.code);
	                    /////
	                    unsign = false;
	                }

					/**  28.03.2018... +++ если акт проведен, для него уже должен быть расчет фактических затрат.... */
					if (act.statusRef.code == ENActStatus.CLOSED) {
						recalcServicesOnlyFactCalcByAct(act.code);
					} else {
						// Вызываем расчет фактических затрат по акту
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
              throw new SystemException("\n\nNET-4235 Не знайдено фактичний розрахунок вартості! (Код договору: " + servicesObject.code + ")");
          }

          if (factCalcArr.length > 1)
          {
              throw new SystemException("\n\nNET-4235 Фактичних розрахунків вартості більше одного! (Код договору: " + servicesObject.code + ")");
          }

        /*
        // Выносим старый расчет
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

        // SUPP-90336 Если была найдена только одна методика расчета, которая равняется новой без учета транспорта и материалов
        // тогда в остаточный расчет не будут включаться транспорт и материалы
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

        ///// Рассчитываем оставшуюся к оплате сумму
        ///// SUPP-4100 учитываем НЕ сумму factCalc.totalSumPrepay(она содержит посчитаную программой сумму которую должен оплатить заказчик  )
        ///// а суммы оплат с типом предоплата которые фактически платит заказчик  вкладка Фактические оплаты на договоре
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

          // Добавляем или пересохраняем расчет
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
     * Метод для расчета сумм для предварительной оплаты по услугам на сторону
     * @param servicesObject - договор по услугам на сторону (объект)
     */
    public void calcForPrepayment(ENServicesObject servicesObject) throws PersistenceException
    {
        ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

        if (plan == null)
        {
            throw new SystemException("\n\nNET-4235 Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
        }

        if (plan.code == Integer.MIN_VALUE)
        {
            throw new SystemException("\n\nNET-4235 Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
        }

        ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(connection, userProfile);

        ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
        calcFilter.planRef.code = plan.code;
        ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

          if (calcList.totalCount == 0)
          {
            throw new SystemException("\n\nNET-4235 Не знайдено розрахунок за кошторисом для договору! Код договору: " + servicesObject.code);
          }

          if (calcList.totalCount > 1)
          {
            throw new SystemException("\n\nNET-4235 Знайдено декілька розрахунків за кошторисом для договору! Код договору: " + servicesObject.code);
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

          ///// Рассчитываем сумму предварительной оплаты (для бюджетников - 0)
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
        * Метод для расчета сумм для предварительной оплаты по услугам на сторону
        * @param servicesObject - договор по услугам на сторону (объект)
        */
    /** 28 мая 2013 решили что сумма по калькуляции (где расчитываются работа людей ) берется 100 % денег а всякие
    * материальные расходы, затраты на транспорт и доставку сумировать и брать за них 70 % предоплаты  **/
    /* SUPP-4444 100% денег брать нада и за материалы  */
        public void calcForPrepayment2(ENServicesObject servicesObject) throws PersistenceException
        {
            ENPlanWork plan = getPlanWorkCalculationByElementCode(servicesObject.element.code);

            if (plan == null)
            {
                throw new SystemException("\n\nNET-4235 Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
            }

            if (plan.code == Integer.MIN_VALUE)
            {
                throw new SystemException("\n\nNET-4235 Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
            }

            ENCalcContractTotalDAO calcDAO = new ENCalcContractTotalDAO(connection, userProfile);

            ENCalcContractTotalFilter calcFilter = new ENCalcContractTotalFilter();
            calcFilter.planRef.code = plan.code;
            ENCalcContractTotalShortList calcList = calcDAO.getScrollableFilteredList(calcFilter, 0, -1);

            if (calcList.totalCount == 0)
            {
                throw new SystemException("\n\nNET-4235 Не знайдено розрахунок за кошторисом для договору! Код договору: " + servicesObject.code);
            }

            if (calcList.totalCount > 1)
            {
                throw new SystemException("\n\nNET-4235 Знайдено декілька розрахунків за кошторисом для договору! Код договору: " + servicesObject.code);
            }

            ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(connection, userProfile);
            ENCalcTotalCostDAO calcTotalCostDAO = new ENCalcTotalCostDAO(connection, userProfile);
            ENCalcTotalCostFilter calcTotalCostFilter = new ENCalcTotalCostFilter();
            calcTotalCostFilter.planRef.code = plan.code;

            BigDecimal calculationcost = new BigDecimal(0);
            BigDecimal materialexpenses = new BigDecimal(0);
            BigDecimal transportexpenses = new BigDecimal(0);
            BigDecimal deliverycost = new BigDecimal(0);


            // по всем калькуляциям в договоре посчитаем суммы отдельно калькуляционная стоимость вместе , материальные затраты вместе , затраты по использованию транспорта вместе , доставка вместе
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

            ///// Рассчитываем сумму предварительной оплаты (для бюджетников - 0)
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

        /*показываем сумарные авансовые платежи по договору и по типу платежа */
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

        /* проверка что бы в договоре все калькуляции были или только без выезда или только с выездом - поле iswithoutprecost */
        public void checkClassificationTypePreCost(ENPlanWork2ClassificationType object) throws PersistenceException
            {

                TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
                TKClassificationTypeShort ctObjShort = ctDAO.getShortObject(object.classificationTypeRef.code);

                ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
                ENPlanWork2ClassificationTypeFilter p2clFilter = new ENPlanWork2ClassificationTypeFilter();
                p2clFilter.planRef.code = object.planRef.code;
                int[] p2clArr = p2clDAO.getFilteredCodeArray(p2clFilter, 0, -1);

                // проверяем если под план уже что то внесено
                if (p2clArr.length > 0 && object.planRef.code != Integer.MIN_VALUE) {
                // определим есть ли в связке плана и калькуляции такие калькуляции у которых разные значения поля iswithoutprecost(с предварительным кошториса или нет)
                    // не совпадают со значением этого поля по калькуляции которая сейчас добавляется
                    p2clFilter.planRef.code = object.planRef.code;
                    if (ctObjShort.isWithoutPreCost == Integer.MIN_VALUE ) {
                    p2clFilter.conditionSQL = " TKCLASSIFICATIONTYPE.iswithoutprecost = 1  ";}
                    if (ctObjShort.isWithoutPreCost == 0 ) {
                        p2clFilter.conditionSQL = " TKCLASSIFICATIONTYPE.iswithoutprecost = 1  ";}
                    if (ctObjShort.isWithoutPreCost == 1 ) {
                        p2clFilter.conditionSQL = " ( (TKCLASSIFICATIONTYPE.iswithoutprecost = 0) or (TKCLASSIFICATIONTYPE.iswithoutprecost is null) ) ";}
                    ENPlanWork2ClassificationTypeShortList p2clShort = p2clDAO.getScrollableFilteredList(p2clFilter, 0, -1);
                    if (p2clShort.totalCount > 0){
                        throw new SystemException("\n\n Значення \"Калькуляция без предварительной сметы\" не співпадають у калькуляціях та що додається, та що вже додана у Договор!!!");
                    }

                }

            }



   /** SUPP-4515 пункт 3.1 - возвратит true если есть в договоре стоит 0 км и при этом в техкартах предусмотрено использование транспорта и стоит норма "Средне часовой ЗП на пробег" */
   /** 3.1. Давати можливість підпису  для Договорів виключно з відстанями, більшими чим 0 км, якщо в договорі є хоча-б одна робота:
    *   для транспортних послуг - з машинами
    *   для робіт (послуг) - з машинами і середньою часовою зар. платою в дорозі згідно з Тех. картою.
    */
	public boolean checkNeedInputKilometers(int planCode)
			throws PersistenceException, DatasourceConnectException {

		Connection connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

		boolean result = false;
		BigDecimal distance = new BigDecimal(0);

		String sql =
                /** SUPP-5518... 24.07.2013 +++ на бригадных - км только на одной работе.... */
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

			// есть в выборке строки с нулевым километражом и при этом машины на техкартах есть
			while (resultSet.next()) {
				/**
				 * SUPP-5518... 24.07.2013 +++ на бригадных км только на одной работе....
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
        * Обязательные поля
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

        /** связь плана с договором */
        /// проверка на включение плана в несколько договоров
        ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
        ENTechCond2PlanWorkFilter tc2planFilter = new ENTechCond2PlanWorkFilter();
        tc2planFilter.planRef.code = planCode;
        int[] tc2plArr = tc2planDAO.getFilteredCodeArray(tc2planFilter,0,-1);
        if (tc2plArr.length > 0) {
			ENTechCond2PlanWork tc2pl = tc2planDAO.getObject(tc2plArr[0]);
			throw new SystemException("Цей план вже використовується у договорі - " +
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

        /* NET-2396 NET-2397 NET-2399 NET-2401 проверить являются ли калькуляции
        Работы службы изоляции» (ветка в справочнике классификаторов 1.1.01)
        «Кабельные линии 0,4-35кВ»(ветка в справочнике классификаторов 1.1.02 )
        «Воздушные линии 0.4-20кВ» (ветка в справочнике классификаторов 1.1.03)
        «Воздушные линии 35-150кВ» (ветка в справочнике классификаторов 1.1.04)
        Если относятся тогда механизм расчета километража отдельный
        */

        String strCodeIzol = "";
        String strKL04_35 = "";
        String strVL04_20 = "";
        String strVL35_150 = "";
        boolean isCodeIzol = false;
        boolean isKL04_35 = false;
        boolean isVL04_20 = false;

        // дочерние кода справочника класификаций работ для службы изоляции
        strCodeIzol = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_SLUJBA_ISOLATED));
        // дочерние кода справочника класификаций работ для Кабельные линии 0,4-35кВ
        strKL04_35 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_KL04_35KV));
        // дочерние кода справочника класификаций работ для Воздушные линии 0.4-20кВ
        strVL04_20 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL04_20KV));
        // дочерние кода справочника класификаций работ для Воздушные линии 35-150кВ
        strVL35_150 = getStringCodesClassificationtypeDown(settingsLogic.getValue(ENSettingsKeysConsts.TKCLASSIFICATIONTYPE_CODES_WORKS_VL35_150KV));

        // определим к чему именно относится калькуляции в кошторисе (работы сл изоляц или каб лин 04-34 или воздушн линий 04-20 или воздушн линий 35-150)
           ENPlanWork2ClassificationTypeDAO p2clDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
           ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
           ENPlanWork2ClassificationTypeShortList p2cList = null;
           // ищем для сл изоляции
           p2cFilter.planRef.code = plan.code;
           // p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_SLUJBA_ISOLATED;
           p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strCodeIzol +" )  " +
                                    " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                    "                                    where p2c.planrefcode = " + plan.code + " ) ";
           p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
           if (p2cList.totalCount >0 ){
            isCodeIzol = true;
           }
           // ищем для каб линий 04-35
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
        // ищем для воздушных линий 04-20
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

           // ищем для воздушных линий 35-150
           if (!isCodeIzol && !isKL04_35 && !isVL04_20){
            p2cFilter.planRef.code = plan.code;
              // p2cFilter.classificationTypeRef.code = TKClassificationType.TKCLASSIFICATIONTYPE_CODE_WORKS_VL35_150KV;
               p2cFilter.conditionSQL = " TKCLASSIFICATIONTYPE.CODE in ( " + strVL35_150 +" )  " +
                                        " and TKCLASSIFICATIONTYPE.CODE in ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c " +
                                        "                                    where p2c.planrefcode = " + plan.code + " ) ";
               p2cList = p2clDAO.getScrollableFilteredList(p2cFilter, 0, -1);
           }


          for (int i=0; i < trArr.length; i++){
            // Для калькуляций по нелиц. работам (по всем, кроме транспорта !!) накидываем расстояния только на 1-ю машину

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
     * Метод для расчета суммы расходного акта
     * @param actCode - код акта
     * @return Сумма расходного акта
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
                    throw new SystemException("\n\nSUPP-8502 Помилка під час визначення суми видаткового акту (код акту: " + actCode + ")!");
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
     * Метод для расчета суммы расходных актов по договору
     * @param servicesObject - договор по услугам на сторону (объект)
     * @return Сумма расходных актов по договору
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
            throw new SystemException("\n\nSUPP-8502 Не знайдено видатковий акт для об'єкту! Код об'єкта: " + servicesObject.code);
        }

        for (int i=0; i < actArr.length; i++)
        {
            result = result.add(getSumByActServicesOut(actArr[i] , true ));
        }

        result = result.setScale(2, BigDecimal.ROUND_HALF_UP);

        return result;
    }



    /**
     * віборка доходной части для проверки рентабельности ( уточнили что для этого проверяется только ЗП , или если это установка многотарифного счетчика то и плюс сумма материалов )
     *
     * SUPP-84181 19.07.2019 Для транспортных услуг з/п водителя рассчитывается иным способом и её нужно брать по-другому.
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
            throw new SystemException("\n\nSUPP-8502 Не знайдено розрахунок по договору " + servicesObject.contractNumberServices);
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

            // SUPP-84181 Для транспорта берется расчитанная з/п водителя т.к.
            // для услуг по транспорту не сохраняется калькуляционная стоимость
            // но только там где метод расчета новый, если не новый то берется
            // вся стоимость по калькуляции
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
     * Метод для контроля рентабельности по договору
     * @param servicesObject - договор по услугам на сторону (объект)
     * @throws PersistenceException
     */
    public void validateProfitability(ENServicesObject servicesObject) throws PersistenceException
    {
        AuthLogic authLogic = new AuthLogic(connection, userProfile);


        /**  SUPP-14532... 01.04.2014 +++ проверка рентабельности для старых договоров...
         *   кроме присоединений, продажи и т.п.. +++ для лицензионных работ....
         */

        /** SUPP-97236... 13.01.2021... все условия внутри проверки... */
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



        /** SUPP-42754... 17.12.2015 +++ не проверяем безоплатные договора... */
        if (servicesObject.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
        	return;
        }

        boolean isLicensed = this.isLicensed(servicesObject);


        // Человек с правами на метод dontValidateProfitability
        // сможет перевести договор в статус "Роботи виконані" независимо от процента рентабельности
        boolean dontValidateProfitability = (authLogic.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "dontValidateProfitability"));
        if (dontValidateProfitability) {
            return;
         }


        // BigDecimal profits  = servicesObject.contractServicesSumma.setScale(2, BigDecimal.ROUND_HALF_UP); // Доход
        BigDecimal profits  = getSumProfitsForServicesObject(servicesObject); // Доход 25.04.2019//

        // нужно к доходу добавить дополнительный расчет, который не входит в калькуляции
        ENServices2CalcAdditionalItemsDAO s2caiDAO = new ENServices2CalcAdditionalItemsDAO(connection, userProfile);
        ENServices2CalcAdditionalItemsFilter s2caiFilter = new ENServices2CalcAdditionalItemsFilter();
        s2caiFilter.servicesObjectRef.code = servicesObject.code;
        ENServices2CalcAdditionalItemsShortList s2caiList = s2caiDAO.getScrollableFilteredList(s2caiFilter, 0, -1);
        for (int brr=0;brr<s2caiList.totalCount;brr++) {
        	System.out.println(
                    "\n\nСума додаткових витрат "+ brr + ": " + s2caiList.get(brr).summa);
        	profits = profits.add(s2caiList.get(brr).summa);
        }

        BigDecimal expenses = getSumExpensesForServicesObject(servicesObject); // Расход


        if (expenses.doubleValue() == 0)
        {
            throw new SystemException("\n\nSUPP-8502 Витрати за договором відсутні (сума = 0)! Код договору: " + servicesObject.code);
        }

        /*
            Формула для расчета процента рентабельности:
            ((Сума по прибутковому акту (без ПДВ) - Загальна сума видаткових актів) / Загальна сума видаткових актів) * 100%

            Т.е.:
            ((profits - expenses) / expenses) * 100%
        */

        // Процент рентабельности
        // double profitability = ((profits.doubleValue() - expenses.doubleValue()) / expenses.doubleValue()) * 100;
        BigDecimal profitability = new BigDecimal(((profits.doubleValue() - expenses.doubleValue()) / expenses.doubleValue()) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);


        if (userProfile.userName.toUpperCase().equals("energynet".toUpperCase())) {
        	System.out.println(
                    "\n\nДані для поточного договору: " +
                    "\n\nСума прибутку: " + profits + "\nСума видатків: " + expenses +
                    "\n\nВідсоток рентабельності = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
                    " = " + profitability + "%" +
                    "\n\nПеревірте правильність складання видаткового акту!");
        }


        // DEBUG!!!!!!!!!
          if (userProfile.userName.toUpperCase().equals("energynet".toUpperCase())
        	|| servicesObject.code == 1017117363 // договор нужно провсти без проверки , согласовано с зам фин дир
        	|| servicesObject.code == 1017117371 // договор нужно провсти без проверки , согласовано с зам фин дир
        	) {
              profitability = new BigDecimal(5);
          }

	       // SUPP-35436 - для леценз <-5 и >10 а для нелеценз проверка на меньше 0
	       // Процент рентабельности по договору должен быть в пределах -5 - +10%
	       if (isLicensed)
	       {
		        ///// 06.10.15 SUPP-39812 Отрицательная рентабельность нам больше не нравится!
		    	//if (profitability.doubleValue() < -5 || profitability.doubleValue() > 10)
		    	// if (profitability.doubleValue() < 0 || profitability.doubleValue() > 10)
		    	if (profitability.doubleValue() < 0 || profitability.doubleValue() > 15)  // SUPP-74403
		        {
		            //throw new SystemException("\n\nSUPP-8757 Рентабельність за договором повинна бути в межах -5 - +10% !" +
		    		throw new SystemException("\n\nSUPP-39812 Рентабельність за договором повинна бути в межах 0 - +15% !" +
		                    "\n\nДані для поточного договору: " +
		                    "\n\nСума прибутку: " + profits + "\nСума видатків: " + expenses +
		                    "\n\nВідсоток рентабельності = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
		                    " = " + profitability + "%" +
		                    "\n\nПеревірте правильність складання видаткового акту!");
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
	    		   throw new SystemException("\n\nSUPP-35436 Рентабельність за договором повинна бути не менше 0% !" +
	                       new String ( (servicesObject.contractTypeRef.code == ENServicesContractType.OKSN ? " Або більше 40%" : "") ) +
	                       "\n\nДані для поточного договору: " +
	                       "\n\nСума прибутку: " + profits + "\nСума видатків: " + expenses +
	                       "\n\nВідсоток рентабельності = ((" + profits + " - " + expenses + ") / " + expenses + ") * 100%" +
	                       " = " + profitability + "%" +
	                       "\n\nПеревірте правильність складання видаткового акту!");
	    	   }
	       }

    }

    /**
     * Метод для определения типа услуг (лицензионные/нелицензионные)
     * @param servicesObject - договор по услугам на сторону (объект)
     * @return true - если лицензионные услуги, false - если нелицензионные
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
            throw new SystemException("Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
        }

        if (plan.code == Integer.MIN_VALUE)
        {
            throw new SystemException("Не знайдено кошторис для договору! Код договору: " + servicesObject.code);
        }

        ENPlanWork2ClassificationTypeFilter p2ctFilter = new ENPlanWork2ClassificationTypeFilter();
        p2ctFilter.planRef.code = plan.code;

        ENPlanWork2ClassificationTypeDAO p2ctDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeShortList p2ctList = p2ctDAO.getScrollableFilteredList(p2ctFilter, 0, -1);

        if (p2ctList.totalCount == 0)
        {
            throw new SystemException("В договорі немає жодної калькуляції! Код договору: " + servicesObject.code);
        }

        TKClassificationType ctObj = ctDAO.getObject(p2ctList.get(0).classificationTypeRefCode);

        if (ctObj == null)
        {
            throw new SystemException("Не знайдено калькуляцію для договору! Код договору: " + servicesObject.code);
        }

        if (ctObj.code == Integer.MIN_VALUE)
        {
            throw new SystemException("Не знайдено калькуляцію з кодом " + ctObj.code + " !");
        }

        // Если 0 (или, возможно, Integer.MIN_VALUE) - услуга лицензионная, если > 0 - нелицензионная
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
            // код плана единичного кошториса
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

            // проверим если нет единичного кошториса то тогда и пересчитывать нечего
            if (planCalcSingleList.length == 0 ) {
                return;
            }
            planCalcSingle = planCalcSingleList[0];
            // код плана кошториса

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
            // пересчитываем расчет зарплаты для кошториса
            scLogic.reCalculateCalcHumenSalary(planCalcSingle , planCalc );
            // пересчитываем расчет материалов для кошториса

            // encalccost пересчет вартості виконання додаткових робіт (послуг) (Калькуляційна вартість згідно калькуляції)
            scLogic.recalculateCost(planCalcSingle , planCalc );
            // encalcTotalcost пересчет стоимости общей
            scLogic.recalculateTotalCost(planCalcSingle , planCalc );
            // пересчитываем стоимость общую по договору для ПЛАНА кошторис единичный
            scLogic.calculateContractCost(planCalcSingle, priconnections);
            // пересчитываем стоимость общую по договору для ПЛАНА кошторис
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
     * Метод для проверки правильности введенных дат задержек на услугах на сторону
     * @param delayServicesObject - задержка для договора по услугам на сторону (объект)
     * @return true - если все ок, false - если нет :)
     * @throws PersistenceException
     */
  public boolean isValidDelay(ENDelayServices delay)
    {

    // где то тут должны быть проверки :)
    return false;
    }

  /**
   *
   * Добавление объекта услуг в систему документооборота DocFlow.
   *
   * Функция вернет код создавшегося пакета документов в DocFlow,
   * а также запишет его в dfPackCode объекта object, кот.
   * бы передан в нее. В базу net ничего сохранятся не будет.
   *
   * Ф-ция работает только для услуг и присоединения, для всех остальных
   * будет произведен выход из нее и она вернет Integer.MIN_VALUE
   *
   * @param object объект договора услуг
   * @return int код создавшегося пакета документов в DocFlow
   */
  public int addServicesObjectToDocFlow(ENServicesObject object, int servicesDocFlowCode)
  {
    try
    {
        if(object == null)
            throw new SystemException("Не заданий об'ект послуг");

        // Если продажа, то выход из процедуры
        if(object.contractKindRef.code == Integer.MIN_VALUE)
            throw new SystemException("Error in contractKindRef.code");
        else
        {
            if(object.contractKindRef.code != ENServicesContractKind.SERVICES)
                return Integer.MIN_VALUE;
        }

            // Проверка типа
            if (object.contractTypeRef.code == Integer.MIN_VALUE) throw new SystemException("Error in contractTypeRef.code");
            /** 17.04.2018... +++ регистрируем только обычные услуги.... присоединение обрабатывается CN-ом...  */
            // if ((object.contractTypeRef.code != ENServicesContractType.CONNECTION) && (object.contractTypeRef.code != ENServicesContractType.OTHERS))

			if (object.contractTypeRef.code != ENServicesContractType.OTHERS)
				return Integer.MIN_VALUE;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
            // Получение кошториса


            int servicesListCode = Integer.MIN_VALUE;
            int servicesList2Code = Integer.MIN_VALUE;

            if (servicesDocFlowCode == Integer.MIN_VALUE)
            {
                // Выборка калькуляций кошториса
                if(object.element.code == Integer.MIN_VALUE) throw new SystemException("error in object.element.code");
                ENPlanWork planCalc = getPlanWorkCalculationByElementCode(object.element.code);
                ENPlanWork2ClassificationTypeDAO pla2siDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
                ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
                pla2siFilter.planRef.code = planCalc.code;
                ENPlanWork2ClassificationTypeShortList pla2siList = pla2siDao.getScrollableFilteredList(pla2siFilter, 0, -1);

                String classCodesStr = "";
                if(pla2siList.totalCount == 0) throw new SystemException("Помилка у кількості калькуляцій");
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

                if(classList.totalCount == 0) throw new SystemException("Помилка у кількості калькуляцій");

                // Нахождение кода услуг из системы документооборота
                servicesListCode = classList.get(0).servicesListCode;
                servicesList2Code = classList.get(0).servicesList2Code;
                //if(servicesListCode == Integer.MIN_VALUE) throw new SystemException("Помилка: на калькуляції № " + classList.get(0).kod + " не проставлений код послуги з системи документообігу");

                /** SUPP-30095.... */
                // if(servicesListCode == Integer.MIN_VALUE) return Integer.MIN_VALUE;
                if (servicesList2Code == Integer.MIN_VALUE
                		|| servicesList2Code == 0) {
                	 throw new SystemException("\n\n"
                	 		+ "Помилка: на калькуляції не проставлений код послуги з системи документообігу!!!\n "
                	 		+ "Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
                }

                if(classList.totalCount > 1)
                {
                    for(int i = 1; i < classList.totalCount; i++)
                    {
                        if(classList.get(i).servicesList2Code != servicesList2Code && classList.get(i).servicesList2Code != Integer.MIN_VALUE)
                        {
                            if(classList.get(i).servicesList2Code != Integer.MIN_VALUE)
                                // throw new SystemException("Помилка: код послуг з системи документообігу для першої калькуляції № " + classList.get(0).kod + " відрізняється від код послуги для калькуляції № " + classList.get(i).kod);

                                /** SUPP-11965 +++ а проверочку надо перенести ещё на момент, когда вкидывается калькуляция!!! */
                                throw new SystemException("\n" +
                                        "\n Заборонено використовувати в одному договорі калькуляції з різними видами послуг!!!" +
                                        "\n Kод послуги для калькуляції № " + classList.get(0).kod + " : " + classList.get(0).servicesList2Number +
                                        "\n Kод послуги для калькуляції № " + classList.get(i).kod + " : " + classList.get(i).servicesList2Number +
                                        "\n Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
                            else
                            	throw new SystemException("Помилка: на калькуляції № " + classList.get(i).kod + " не проставлений код послуги з системи документообігу");

                        }
                    }
                }
            }
            else
            {
                servicesListCode = servicesDocFlowCode;
                servicesList2Code = servicesDocFlowCode;
            }


        // Формируется объекты DFPack и DFMovement для передачи в DocFlow
        DFPack pack = new DFPack();
        DFMovement movement = new DFMovement();


        //Дата регистрации
        //if(object.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET || object.contractTypeRef.code == ENServicesContractType.CONNECTION)
        if(isDocFlowLifeCycleStartsWithSigning(object) || object.contractTypeRef.code == ENServicesContractType.CONNECTION)
        {
            // Для бюджетных организаций и приєднань - дата регистрации является дата договора
            pack.dateRegistration = object.contractDateServices;
            movement.stateName = "Договір заведено";
        }
        else
        {
            // Для остальных - это дата первой оплаты
            ENPayment2SODAO paymentDao = new ENPayment2SODAO(connection, userProfile);
            ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
            paymentFilter.servicesObjectRef.code = object.code;
            paymentFilter.orderBySQL = ENPayment2SO.dateGen_QFielld + " ASC";

            ENPayment2SOShortList paymentList = paymentDao.getScrollableFilteredList(paymentFilter, 0, -1);

            if(paymentList.totalCount == 0) throw new SystemException("Не знайдено жодної сплати");

            /**
             * 	SUPP-25137... 03.11.2014 +++ служебка Бакланова (Парфёнова) -
             *  услуги S1_3, S1_4_1 и S1_4_2 регистрируются датой разноски....
             */
            if (servicesListCode == DFServicesList.S1_3
            		|| servicesListCode == DFServicesList.S1_4_1
            		|| servicesListCode == DFServicesList.S1_4_2
                    // + Из нового каталога
            		|| servicesList2Code == DFServicesList.S3_NEW) {

            	pack.dateRegistration = paymentList.get(0).dateEdit;
            } else {
            	pack.dateRegistration = paymentList.get(0).dateGen;
            }


            movement.stateName = "Внесена передплата";
        }


        pack.organizationName = object.contragentName;
        pack.customerName = object.contragentName;
        pack.customerAddress = object.contragentAddress;
        pack.customerPhone = object.contragentPhoneNumber;
        pack.description = object.commentGen;
        // Если на калькуляции есть S-ка со 2-го каталога, ставим ее, иначе - S-ку из 1-го
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
        	personalAccountNumber = "Новий";
        }

        if (object.personalAccountNumber != null) {
        	personalAccountNumber = object.personalAccountNumber;
		}

        pack.personalAccountNumber = personalAccountNumber;
        pack.eic = object.codeEIC;

        movement.dateStart = pack.dateRegistration;

        // Если уже был dfPackCode - то борода из Вити - не дает сохранить пакет документов
        /** SUPP-35156... 12.06.2015 +++ а зачем борода? передали - пусть себе там и лежит....
            if(object.dfPackCode != Integer.MIN_VALUE) throw new SystemException("Договор был уже передан один раз в Систему документооборота");
         */
        if(object.dfPackCode != Integer.MIN_VALUE)
        	return object.dfPackCode;


        int docFlowCode = docFlowLogic.registerServiceStart(pack, movement);
        object.dfPackCode = docFlowCode;



        /** расчет граничной даты выполнения на договоре */


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
   * Добавление объекта услуг в систему документооборота DocFlow.
   *
   * Функция вернет код создавшегося пакета документов в DocFlow
   *
   * Ф-ция работает только для услуг и присоединения, для всех остальных
   * будет произведен выход из нее.
   *
   * @param servicesObjectCode код объекта договора услуг
   * @return int код создавшегося пакета документов в DocFlow
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
   * проверка принадлежности калькуляции к работам по подключению
   *
   * @param soCode - код договора
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

                	/* Избавляемся от проверки по статическому набору кодов
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
     * Процедура для отмены пакета по договору
     *
     * Код пакета на договоре <b>object</b> сбрасывается в Integer.MIN_VALUE если setDfPackCodeToNull = true
     *
     * @param object объект договора
     */
    public void cancelServicesObjectInDocFlow(ENServicesObject object, boolean setDfPackCodeToNull)
    {
        try
        {
            if(object == null)
                throw new SystemException("Не заданий об'ект послуг");

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
     * Процедура для удаления пакета из системы документоборота по договору
     *
     * Код пакета на договоре <b>object</b> сбрасывается в Integer.MIN_VALUE.
     * Договор не сохраняется
     *
     * @param object объект договора
     */
    public void deleteServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("Не заданий об'ект послуг");

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
     * Процедура завершения выполнения работ по договору в Системе документообора DocFlow
     *
     * @param object объект договора
     */
    public void finishServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("Не заданий об'ект послуг");

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            DFMovement movement = new DFMovement();


            movement.stateName = "Роботи виконані за договором № " + object.contractNumberServices;
            movement.packRef.code = object.dfPackCode;
            movement.dateStart = getFactMaxDate(object);
            movement.dateFinish = getFactMaxDate(object);


            String personalAccountNumber = null;

            if (object.reconnectionTU == 0) {
            	personalAccountNumber = "Новий";
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
     * Определяется должен ли набор документов по договору <b>obj</b> начинаться при подписании
     *
     * @param obj объект ENServicesObject - договор из EnergyNet
     * @return <b>true</b> если пакет документов по договору должен попасть в
     * систему документооборота при подписании, <b>false</b> в противном случае
     */
    public boolean isDocFlowLifeCycleStartsWithSigning(ENServicesObject obj)
    {
        boolean result = true;

        // Для договоров на приєднання, бюджетников и
        // безоплатных вставляются в систему документооборота DocFlow
        // при подписании иначе вставляются при оплате

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
    * Возвращает максимальную дату наряд-заданий для договора <b>so</b>
    *
    * @param so
    * @return
    * @throws SystemException если не найдено планов-фактов
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

        if(list.totalCount == 0) throw new SystemException("Не знайдено планів");


        Date maxDate = list.get(0).dateFinal;

        for(int i = 0; i < list.size(); i++)
        {
            if(maxDate.compareTo(list.get(i).dateFinal) < 0)
                maxDate = list.get(i).dateFinal;
        }


        // Просмотр по тех. условиям
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
     * Процедура отмены завершения выполнения работ по договору в Системе документообора DocFlow
     *
     * @param object объект договора
     */
    public void undoFinishServicesObjectInDocFlow(ENServicesObject object)
    {
        try
        {
            if(object == null)
                throw new SystemException("Не заданий об'ект послуг");

            if(object.dfPackCode == Integer.MIN_VALUE) return;

            docFlowConnection = getDocFlowConnection();

            DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

            DFMovement movement = new DFMovement();


            movement.stateName = "Відміна статуса \"Роботи виконані\" за договором № " + object.contractNumberServices;
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
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			if (object.servicesObjectRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			ENDelayServicesDAO dlDAO = new ENDelayServicesDAO(connection, userProfile);

			ENServicesObject soObj = soDAO.getObjectNoSegr(object.servicesObjectRef.code);

			// проверить на пересение вносимых задержек с уже внесенными
			ENDelayServicesFilter dlFilter = new ENDelayServicesFilter();
			dlFilter.servicesObjectRef.code = soObj.code;
			dlFilter.conditionSQL = "  ( '"+ new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart)  +"' between endelayservices.datestart and endelayservices.datefinal \n " +
								    "  or \n " +
								    "   '"+ new SimpleDateFormat("dd.MM.yyyy").format(object.dateFinal)  +"' between endelayservices.datestart and endelayservices.datefinal \n " +
								    "  ) ";
			int[] dlArr = dlDAO.getFilteredCodeArray(dlFilter, 0, -1);
			if (dlArr.length > 0 ){
				throw new SystemException("\n\n Период задержки пересекается с уже внесенной задержкой по договору !");
			}

			if (soObj.dfPackCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4315 Нет ссылки на пакет из DocFlow! Невозможно внести данные о задержке!");
			}

			//  NET-4560 нельзя вносить данные о задержке после граничной даты выпонения работ по услуге *
			if ( soObj.boundaryDateWork.compareTo( object.dateStart ) < 0 ){
				throw new SystemException("\n\n NET-4560 Невозможно вносить данные о задержке после граничной даты выпонения работ по услуге !");
			}

			docFlowConnection = getDocFlowConnection();
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

			object.calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(object.dateStart, object.dateFinal);
			object.workDaysCount = dfLogic.getWorkDaysBetweenDates(object.dateStart, object.dateFinal);

			ENDelayServicesDAO objectDAO = new ENDelayServicesDAO(connection, userProfile);

			int objectCode = objectDAO.add(object);

			///// Добавляем данные о задержке в DocFlow
			DFMovement movementDelay = new DFMovement();
			movementDelay.packRef.code = soObj.dfPackCode;
			movementDelay.dateStart = object.dateStart;
			movementDelay.dateFinish = object.dateFinal;
			movementDelay.stateName = "Затримка надання послуги з вини споживача та третіх осіб";

			DFMovement movement = new DFMovement();
			movement.packRef.code = soObj.dfPackCode;
			movement.dateStart = movementDelay.dateFinish;
			movement.stateName = "Продовження робіт за послугою";

			dfLogic.registerServiceDelay(movementDelay, movement, object.calendarDaysCount, object.workDaysCount);
			/////

			// NET-4560 -- Расчет граничной даты выполнения работ по услугам на сторону по данным справочника "Довідник послуг(S)"
			this.calculationBoundaryDateWorkAtDelays(soObj);


			/** если услуга связана с заявкой с сайта - обновим информацию на заявке с сайта.. */
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


				/** граничная дата выполнения */
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
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			if (object.servicesObjectRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject soObj = soDAO.getObjectNoSegr(object.servicesObjectRef.code);

			if (soObj.dfPackCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4315 Нет ссылки на пакет из DocFlow! Невозможно удалить данные о задержке!");
			}

			objectDAO.remove(code);

			///// Добавляем данные об отмене задержки в DocFlow
			docFlowConnection = getDocFlowConnection();
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

	        // Будем добавлять запись в dfmovement с датами начала и окончания, совпадающими с датой начала для последнего состояния по пакету
	        DFMovement lastMovement = dfLogic.getLastMovement(soObj.dfPackCode);

			DFMovement movementDelay = new DFMovement();
			movementDelay.packRef.code = soObj.dfPackCode;
			movementDelay.dateStart = lastMovement.dateStart;
			movementDelay.dateFinish = lastMovement.dateStart;
			movementDelay.stateName = "Видалення затримки надання послуги";

			DFMovement movement = new DFMovement();
			movement.packRef.code = soObj.dfPackCode;
			movement.dateStart = movementDelay.dateFinish;
			movement.stateName = "Продовження робіт за послугою";

			dfLogic.undoRegisterServiceDelay(movementDelay, movement, object.calendarDaysCount, object.workDaysCount);
			/////

			// NET-4560 -- Расчет граничной даты выполнения работ по услугам на сторону по данным справочника "Довідник послуг(S)"
			this.calculationBoundaryDateWorkAtDelays(soObj  );


			/** если услуга связана с заявкой с сайта - обновим информацию на заявке с сайта.. */
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


				/** граничная дата выполнения */
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
     *  При наличии связи договора с заявлением меняет статус договора на отмененный и завершает движение в DocFlow...
     *
     *  @param soCode - код договора
     * 	@param finishWorks - признак выполнения работ по договору
     * 	@param calcTypeByCalculation - если договор с признаком "Расчет стоимости согласно калькуляции" - true
     *
     *  @return - true (если была связь)
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

			/** если есть связь заявления с договором на услуги */
			int doc2soArr[] = doc2soDao.getFilteredCodeArray(doc2soFilter, 0, -1);
			if (doc2soArr.length > 0) {

				ENServicesObject soObj = soDAO.getObjectNoSegr(soCode);

				DFDoc2ENServicesObject doc2so = doc2soDao.getObject(doc2soArr[0]);

				/** последнее движение по документу */
				DFDocMovementFilter docMovementFilter = new DFDocMovementFilter();
				docMovementFilter.docRef.code = doc2so.docRef.code;
				docMovementFilter.isLast = DFDocMovement.LAST;

				int docMovementArr[] = docMovementDao.getFilteredCodeArray(docMovementFilter, 0, -1);

				if (docMovementArr.length == 1) {
					DFDocMovement docMovement = docMovementDao.getObject(docMovementArr[0]);

					if (finishWorks) {
						docMovement.resolution = "Виконання договору на послуги №" + soObj.contractNumberServices + " в EnergyNet.";
						docMovement.isCompleted = DFDocMovement.COMPLETED;
						docMovement.jobStatusRef.code = DFJobStatus.COMPLETED;
					} else {
						docMovement.resolution = "Відміна договору на послуги №" + soObj.contractNumberServices + " в EnergyNet.";
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
		             *   возможно сохранение ENServicesObject, поэтому обновим объект...
		             */
		            soObj = soDAO.getObject(soCode);


		            if (!finishWorks) {
						soObj.contractStatusRef.code = ENServicesContractStatus.CANCELED;
						soDAO.save(soObj);

						// Отвяжем привязанные счетчики
						removeForCounters(soObj.code, true);
		            }

					return true;

				} else {
					throw new SystemException("\n\n[DOCFLOW] " +
							" Помилка при визначенні поточного стану документа!!!");
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
     *  При наличии связи договора с заявлением сохраняется дата оплаты по договору...
     *
     *  @param soCode - код договора
     *  @parem paymentDate - дата оплаты
     *
     */
	public void setPaymentDateByServicesConsumer(int soCode, Date paymentDate) {
		try {
			docFlowConnection = getDocFlowConnection();

			DFDoc2ENServicesObjectDAO doc2soDao = new DFDoc2ENServicesObjectDAO(docFlowConnection, userProfile);
			DFDoc2ENServicesObjectFilter doc2soFilter = new DFDoc2ENServicesObjectFilter();
			doc2soFilter.servicesObjectCode = soCode;

			/** если есть связь заявления с договором на услуги */
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
					"\n\nNET-4235 Акт не є актом виконаних робіт по послугах на сторону! Код акту: "
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

		// Создаем новый расчет
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
         *  01.02.2016... +++ хуже не бедет если считать доставку всегда при contractServicesDistance > 0
         *  в createDeliveryTime проверяютя техкарты на признак "Не расчитывать доставку"
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
	    	throw new SystemException("Не знайдено калькуляції для договору з кодом " + svoCode);
	    }

	    /* Не понятно теперь, к чему эта проверка... ))
	    boolean isLicensedActivity = false;

	    if (ctList.get(0).isnotlicensedactivity == 0) isLicensedActivity = true;
	    if (ctList.get(0).isnotlicensedactivity > 0) isLicensedActivity = false;

		if (isLicensedActivity) {
			AuthLogic authLogic = new AuthLogic(connection, userProfile);
			if (!authLogic.checkPermissionSilent(
					"ksoe/energynet/ENServicesObjectController", "cancelServices")) {
				throw new SystemException("\n\n"
						+ "У Вас немає прав на скасування цього статусу! \n"
						+ "Звертайтеся до бюджетотримача за напрямком.");
			}
		}
		*/
	}


	/**
	 * проверка наличия в договоре работ по замене счетчика
	 * при переходе на многотарифный учет
	 *
	 * @param soElementCode - код элемента договора
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
	 * проверка наличия в договоре работ по параметризации счетчика
	 *
	 *
	 * @param soElementCode - код элемента договора
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
	 * возвращает код документа на ввод в эксплуатацию счетчиков
	 * @param actCode - код акта
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
	 * Функция для поиска подходящего счетчика для работ на сторону , многотарифный учет
	 *
	 * */
	// NET-4443-y - для услуг на сторону если добавляем калькуляцию по установке / замене многотарифного прибора учета тогда
	// если на техкарте нашли счетчик то будем его искать на остатках как уже параметризированный или если нету на остатке, то
	// искать в сформированных автоматических заявках по материалу и фазности
	// Если найдем в остатках тогда сразу залочить его для договора под кошторис (естимейт запишем в ostable и залочим под договора SERVICES_COUNTERS_LOCK )

	public ENMetrologyCounterShort getParametrizedCounterForServiceObject(TKClassificationType clTypeObj,
			int countersZoneType, int departmentCode) {

		try {
			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
			DepartmentLogic depLogic = new DepartmentLogic(connection, userProfile);
			ENMetrologyCounterShort counterShort = null;

			if (countersZoneType == Integer.MIN_VALUE) {
				throw new SystemException(" \n NET-4443 - Не вказано зонність лічильника !!! ");
			}

			// признак того что используется калькуляции услуг на сторону с заменой многотарифтного счетчика
			if (clTypeObj.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER) {

				TKMaterials2TKMaterialsShortList m2mList = getTKMaterials2TKMaterialsShortListByTkClassificationTypeCode(clTypeObj.code, false);

				if (m2mList.totalCount == 0) {
					throw new SystemException("\n\n"
							+ "NET-4443 - Не знайдено зв'язаних лічильників для пошуку у залишках!");
				}


	    		ENMetrologyCounterShort scShort = null;
	    		int renCode = depLogic.getFINDepartment2Department(departmentCode, false);

        		// цикл по реальным счетчикам ищем остатки
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
	 * Возвращаем свободную строку с утвержденной стоимостью счетчика под развязанные типы счетчиков к калькуляции
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
				 throw new SystemException("\n\nNET-4443 - Не знайдено зв'язаних лічильників для пошуку у заявках!");
			}

			// цикл по реальным счетчикам ищем заявки
			for (int g=0; g<m2mList.totalCount; g++){


				int phasity = (m2mList.get(g).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_1FService)  ? 1 :
					          (m2mList.get(g).tkmaterialsInRefCode == TKConsts.TKMATERIALS_COUNTER_3FService) ? 3 :
			                   0 ;

				apCostShort = scLogic.getApprovedCost(phasity,  m2mList.get(g).tkmaterialsOutRefCode);
				if (apCostShort != null ) {

					BigDecimal freeDif 	= apCostShort.countGen.subtract(apCostShort.countFact);
					if (freeDif.compareTo(new BigDecimal(0)) > 0  ){
						break; // выход из цикла
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
	   			throw new SystemException("\n\nNET-4443 - Для роботи (класифікації) \"" + ctObjShort.kod + "  " + ctObjShort.name + ". \n"
	   					+ "Не знайдено зв'язаних лічильників для автоматичного складання заявки!"
	   			 		+ "Зверніться в метрологію.");
	   		}

	   		 // 18.09.15 Вот нафига так?? У нас лист m2mList и так передается в rqorderController.addCountersServices,
	   		 // поэтому там внутри определим фазность конкретно для m2mList.get(i), а сейчас она всегда одна, так как
	   		 // мы берем ее из 0-го элемента (m2mList.get(0))
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
	 * Создание заявки на закупку счетчиков
	 *
	 * @param m2mList - лист со связками материалов
	 *
	 * @return код созданной заявки
	 */
	public int generateAutoOrderByCountersServices(TKMaterials2TKMaterialsShortList m2mList)
	{
		int orderCode = Integer.MIN_VALUE;

		try
		{
			// Если лист пустой, ничего не делаем
			if (m2mList.totalCount == 0)
	   		{
				//throw new SystemException("\n\nNET-4506 Не знайдено зв'язаних лічильників для автоматичного складання заявки!");
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

				// 1. Выбираем кол-во счетчиков в остатках
				ENMetrologyCounterShortList countersRest = scLogic.getCounters(materialCode);

				int countersRestCount = countersRest.totalCount;

				// Если в остатках достаточно счетчиков, переходим к следующему материалу
				if (countersRestCount >= m2mList.get(i).count2Order.intValue())
				{
					continue;
				}

				// 2. Выбираем кол-во счетчиков в заявках (то, которое еще не занято под договора)
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

				// Если кол-ва счетиков в остатках + кол-ва в заявках (еще не занятого) достаточно,
				// переходим к следующему материалу
				if (countersRestCount + countersOrderedCount >= m2mList.get(i).count2Order.intValue())
				{
					continue;
				}

				int count2order = m2mList.get(i).count2Order.intValue() - (countersRestCount + countersOrderedCount);

				// В этот if мы, по идее, не попадем, но на всякий случай проверим
				if (count2order <= 0)
				{
					continue;
				}

				m2mList.get(i).count2Order = new BigDecimal(count2order);

				m2mListForOrder.list.add(m2mList.get(i));
				m2mListForOrder.totalCount++;
			}

			// 3. Генерим заявку
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
	 *  Перечень доступных материалов под калькуляцию с многотарифным счетчиком
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
					throw new SystemException("\n NET-4443 - На калькуляції повинен бути ЕЛЕКТРОЛІЧИЛЬНИК БАГАТОФУНКЦІЙНИЙ  !!! ");

				TKMaterials2TKMaterialsFilter m2mFilter = new TKMaterials2TKMaterialsFilter();

	    		m2mFilter.tkmaterialsInRef.code = tmArr[0]; // нормативный виртуальный счетчик
	    		m2mFilter.conditionSQL = " tkmaterials2tkmaterils.tkmaterialsoutrefcode in ( select m2cl.materialrefcode \n " +
	    								" from tkclassificationtype clt , tkmaterls2tkclssfctntp m2cl , tkmaterials2tkmaterils m2m \n " +
	    								" where clt.code = m2cl.classificationtyperfcd \n "  +
	    								" and m2cl.materialrefcode = m2m.tkmaterialsoutrefcode \n " +
	    				 				" and clt.code =  " + tkClassificationTypeCode + " ) " +
	    								(isForOrder ? " and coalesce(tkmaterials2tkmaterils.count2order, 0) > 0" : "");

	    		m2mList = m2mDAO.getScrollableFilteredList(m2mFilter, 0, -1);

	    		/*
	    		if(m2mList.totalCount == 0 ){
	    			 throw new SystemException(" \n NET-4443 - Під калькуляцію яка додається у договір не вказані лічильники для використання !!! ");
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
	 * @param isCancel - если = true, то это отмена Заказчика и, если счетчики не найдены, мы ругаться не должны
	 *
	 */
	public void removeForCounters(int servicesObjectCode, boolean isCancel)
	{
		// Отвязываем договор от заявки на закупку счетчиков
		removeApprovedCostItem(servicesObjectCode);
		// Отменяем резервирование счетчика под договор в СканСчетчиках
		undoReserveCounterForServicesObject(servicesObjectCode);
		//SUPP-47167 Отмена перерезервированных счетчиков
		this.cancelRereservedCounters(servicesObjectCode, isCancel);
	}

	public void reserveCounterForServicesObject(ENMetrologyCounterShort counter, ENServicesObject servicesObject, int planKindCode)
	{

		try {

			SCLogic scLogic = new SCLogic(connection, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			// Лочим счетчик
			scLogic.lockCounterInSC_(counter.scCode, "№ дог." + servicesObject.contractNumberServices, servicesObject.contractDateServices, ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
			// Резервируем счетчик на остатке под договор (код естим кошториса)
			scLogic.updateCounterEstimateCode(counter.scCode,
					getENEstimateItemCodeCounterByServicesObjectAndKindPlan(servicesObject.element.code,planKindCode));

			// накинем связку с утвержденной ценой если на отстатке нашли счетчик с авто заяки (утв. цена)

			if(counter.rqorderitemcode > 0) {

				/**  NET-4467... +++ непонятки с Connection...
				 *   работало до определенного момента, потом (16.05.2015) перестало...
				 *   возможно ограниничение и DS ?!?!?!?
				 */

				RQApprovedCostDAO appDAO = new RQApprovedCostDAO(connection, userProfile);
				RQApprovedCostFilter appFilter = new RQApprovedCostFilter();
				appFilter.rqOrderItemRef.code = counter.rqorderitemcode;
				RQApprovedCostShortList appList = appDAO.getScrollableFilteredList(appFilter, 0, -1);

				if (appList.totalCount>1 || appList.totalCount==0) {
					throw new SystemException("\n\n NET-4443 \n Помилка при резервуванні лічильника!!!");
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
					// Если счетчик залочен, разлочим его
					if (counter.lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK)
					{
						scLogic.lockCounterInSC_(counter.scCode, servicesObject.contractNumberServices, servicesObject.contractDateServices, (-1) * ENMetrologyCounter.SERVICES_COUNTERS_LOCK);
					}

					// Скинем код эстимейта для всех строк в ScanCounters (даже тех, у к-рых show_ <> "Y") по инв. номеру
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
	 * Процедура перерезервирования счетчика под договор
	 *
	 * Старая привязка счетчика отменяется и производится повторный поиск и привязка счетчика
	 * с подотчета МОЛов РЭС или центрального склада. Если счетчик не нашелся, то вызывается
	 * процедура {@link ServicesLogic#addApprovedCostItem(RQApprovedCostShort, int, int)}
	 * для включения этой услуги в заявку.
	 *
	 * @param servicesObjectCode код услуги на сторону {@link ENServicesObject}
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
		            			throw new SystemException("\n\nNET-4455 Помилка пошуку затвердженої вартості лічильників!");
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
	 * @param isCancel - если = true, то это отмена Заказчика и, если счетчики не найдены, мы ругаться не должны
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
				throw new SystemException(" \n\n NET-4443 \n На договорі знайдено більше одного лічильника!!! ");
			} else
			if (eiArr.length == 0 ){
				if (! isCancel) {
					throw new SystemException(" \n\n NET-4443 \n На договорі не знайдено жодного лічильника!!! ");
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
	 * Метод добавляет запись в sccounter с типом "Для сменного задания" по договору на услуги на сторону
	 * (только для договоров на установку многотарифных счетчиков)
	 *
	 * @param servicesObject - договор (объект типа ENServicesObject)
	 * @param workOrderBytCode - код сменного задания
	 *
	 * @return код добавленной записи в sccounter
	 */
	public int createSCCounterForWorkOrderBytItem(ENServicesObject servicesObject, int workOrderBytCode)
	{
    	if (servicesObject == null)
    	{
    		throw new SystemException("\n\nSUPP-33009 Не заданий договір з послуг на сторону!");
    	}

    	if (servicesObject.code == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nSUPP-33009 Не заданий договір з послуг на сторону!");
    	}

    	if (workOrderBytCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nSUPP-33009 Не заданий код змінного завдання!");
    	}

    	try
    	{
			/////
			// Проверим, если в сменном задании уже есть строки по заданному договору с привязанным счетчиком,
			// то просто вернем код счетчика и не будем ничего добавлять - следующие строки сменного задания
			// по этому договору будут ссылаться на этот счетчик
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
	 * Метод удаляет запись из sccounter с типом "Для сменного задания"
	 *
	 * @param scCounterCode - код записи в sccounter
	 */
	public void removeSCCounterForWorkOrderBytItem(int scCounterCode)
	{
    	if (scCounterCode == Integer.MIN_VALUE)
    	{
    		// throw new SystemException("\n\nSUPP-33009 Не заданий код лічильника!");
    		return;
    	}
	    try
	    {
	    	ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);
			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.scCounterRef.code = scCounterCode;

			int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			// Если на счетчик еще есть ссылки в строках сменных заданий, то не удаляем его
			if (workOrderBytItemArr.length > 0)
			{
				return;
			}

			SCCounterDAO scCounterDAO = new SCCounterDAO(connection, userProfile);

			SCCounter scCounter = scCounterDAO.getObject(scCounterCode);

			if (scCounter == null)
	    	{
	    		throw new SystemException("\n\nSUPP-33009 Не знайдено лічильник з кодом " + scCounterCode + " !");
	    	}

			// Проверим на всякий случай тип записи (kind)
			if (scCounter.kindRef.code != SCCounterKind.FOR_WORKORDERBYT)
	    	{
	    		throw new SystemException("\n\nSUPP-33009 Лічильник (sccounter) з кодом " + scCounterCode +
	    				" має некоректний тип (kind): " + scCounter.kindRef.code + " !");
	    	}

			scCounterDAO.remove(scCounterCode);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}


	/* ENServicesObject. Удалить */
	public void removeServicesObject(int code) {
		try {
			ENServicesObjectDAO objectDAO = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject object = objectDAO.getObject(code);

			if (object.statusRef != null)
				if (object.statusRef.code == ENServicesObjectStatus.CLOSED) {
					throw new SystemException(
							"Видаляти вже проведені договори заборонено!");
				}

			if (object.contractStatusRef != null)
				if (object.contractStatusRef.code == ENServicesContractStatus.SIGNED
						|| object.contractStatusRef.code == ENServicesContractStatus.PAID) {
					throw new SystemException(
							"Видаляти підписані або сплачені договори заборонено!");
				}


			/**
			 *  NET-4406... 29.09.2014 +++ регистрация заявлений бытовых потребителей на услуги....
			 *  если договор связан з Заявлением, меняем статус договора на отмененный и завершаем движение в DocFlow...
			 *
			 */

			if (updateDocMovementStatusByServicesConsumer(object.code, false)) {
				return;
			}



			/** 03.09.2020... +++ счетчик надо отвязывать пока есть планы... */
			/** 15.04.2020... +++
			 *  Если договор на установку многотарифного счетчика, отвяжем его от заявки на закупку счетчиков
			 */
			removeForCounters(code, true);



			// вытянем по коду объекта код плана кошторис
			ENPlanWorkDAO planEstimateDAO = new ENPlanWorkDAO(connection, userProfile);

			ENPlanWorkFilter planEstimateFilter = new ENPlanWorkFilter();
			planEstimateFilter.elementRef.code = object.element.code;
			// planEstimateFilter.kind.code = ENPlanWorkKind.CALCULATION;
			// по елементу вытяним план кошторис и план кошторис единичный
			int[] planEstimateArr = planEstimateDAO.getFilteredCodeArray(planEstimateFilter, 0, -1);
			int codePlanEstimate = Integer.MIN_VALUE;
			ENPlanWork planEstimate;

			for (int i = 0; i < planEstimateArr.length; i++) {
				planEstimate = planEstimateDAO.getObject(planEstimateArr[i]);
				codePlanEstimate = planEstimate.code;

				if (planEstimate.status.code != ENPlanWorkStatus.GOOD) {
					throw new SystemException("\n\n" +
							"Кошторис повинен бути чорновим!");
				} else {

					// удаление текущего плана для редактирования кошториса , и ставим статус кошториса в статус Кошторис затверджений
					// удаление записей из таблицы encalcmaterialsusage
                    ENCalcMaterialsUsageDAO matdao = new ENCalcMaterialsUsageDAO(connection, userProfile);

                    ENCalcMaterialsUsageFilter matFilter = new ENCalcMaterialsUsageFilter();
                    matFilter.planRef.code = codePlanEstimate;

					int imatArr[] = matdao.getFilteredCodeArray(matFilter, 0, -1);
					for (int imat = 0; imat < imatArr.length; imat++) {
						matdao.remove(imatArr[imat]);
					}

                    // удаление записей из таблицы encalccontracttotal
                    ENCalcContractTotalDAO cctdao = new ENCalcContractTotalDAO(connection, userProfile);

                    ENCalcContractTotalFilter cctFilter = new ENCalcContractTotalFilter();
                    cctFilter.planRef.code = codePlanEstimate;

                    int icctArr[] = cctdao.getFilteredCodeArray(cctFilter, 0, -1);
                    for (int icct = 0; icct < icctArr.length; icct++) {
                        cctdao.remove(icctArr[icct]);
                    }

                    // удаление  записей из таблицы encalctransportusagehr
                    ENCalcTransportUsageHourDAO tuhdao = new ENCalcTransportUsageHourDAO(connection, userProfile);

                    ENCalcTransportUsageHourFilter tuhFilter = new ENCalcTransportUsageHourFilter();
                    tuhFilter.planRef.code = codePlanEstimate;

                    int ituhArr[] = tuhdao.getFilteredCodeArray(tuhFilter, 0, -1);
                    for (int ituh = 0; ituh < ituhArr.length; ituh++) {
                        tuhdao.remove(ituhArr[ituh]);
                    }

                    // удаление  записей из таблицы encalctotalcost
                    ENCalcTotalCostDAO costTotaldao = new ENCalcTotalCostDAO(connection, userProfile);

                    ENCalcTotalCostFilter costTotalFilter = new ENCalcTotalCostFilter();
                    costTotalFilter.planRef.code = codePlanEstimate;

                    int icosttArr[] = costTotaldao.getFilteredCodeArray(costTotalFilter, 0, -1);
                    for (int icostt = 0; icostt < icosttArr.length; icostt++) {
                        costTotaldao.remove(icosttArr[icostt]);
                    }

                    // удаление  записей из таблицы encalccost
                    ENCalcCostDAO costdao = new ENCalcCostDAO(connection, userProfile);

                    ENCalcCostFilter costFilter = new ENCalcCostFilter();
                    costFilter.planRef.code = codePlanEstimate;

                    int icostArr[] = costdao.getFilteredCodeArray(costFilter, 0, -1);
                    for (int icost = 0; icost < icostArr.length; icost++) {
                        costdao.remove(icostArr[icost]);
                    }

                    // удаление  записей из таблицы encalchumendelivery
                    ENCalcHumenDeliveryDAO hddao = new ENCalcHumenDeliveryDAO(connection, userProfile);

                    ENCalcHumenDeliveryFilter hdFilter = new ENCalcHumenDeliveryFilter();
                    hdFilter.planRef.code = codePlanEstimate;

                    int ihdArr[] = hddao.getFilteredCodeArray(hdFilter, 0, -1);
                    for (int ihd = 0; ihd < ihdArr.length; ihd++) {
                        hddao.remove(ihdArr[ihd]);
                    }

                    // удаление  записей из таблицы encalchumensalary
                    ENCalcHumenSalaryDAO hdao = new ENCalcHumenSalaryDAO(connection, userProfile);

                    ENCalcHumenSalaryFilter hFilter = new ENCalcHumenSalaryFilter();
                    hFilter.planRef.code = codePlanEstimate;

                    int ihArr[] = hdao.getFilteredCodeArray(hFilter, 0, -1);
                    for (int ih = 0; ih < ihArr.length; ih++) {
                        hdao.remove(ihArr[ih]);
                    }

                    // удаление записей из таблицы encalctransportusage
                    ENCalcTransportUsageDAO cTrdao = new ENCalcTransportUsageDAO(connection, userProfile);

                    ENCalcTransportUsageFilter cTrFilter = new ENCalcTransportUsageFilter();
                    cTrFilter.planRef.code = codePlanEstimate;

                    int itArr[] = cTrdao.getFilteredCodeArray(cTrFilter, 0, -1);
                    for (int it = 0; it < itArr.length; it++) {
                        cTrdao.remove(itArr[it]);
                    }

                    // удаление в связке плана и класификации
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

                    	/** Связь счетчиков, которые передаются с класификациею в договоре */
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

			// удаление в записей из таблицы ENTimeLine
			ENTimeLineDAO timeLineDao = new ENTimeLineDAO(connection, userProfile);

			ENTimeLineFilter timeLineFilter = new ENTimeLineFilter();
			timeLineFilter.servicesObjectRef.code = code;

			int timeLineArr[] = timeLineDao.getFilteredCodeArray(timeLineFilter, 0, -1);
			for (int tl = 0; tl < timeLineArr.length; tl++) {
				timeLineDao.remove(timeLineArr[tl]);
			}

			// удаление в записей из таблицы ENServicesFactCalc
			ENServicesFactCalcDAO factCalcDao = new ENServicesFactCalcDAO(connection, userProfile);

			ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
			factCalcFilter.servicesObjectRef.code = code;

			int factCalcArr[] = factCalcDao.getFilteredCodeArray(factCalcFilter, 0, -1);
			for (int fc = 0; fc < factCalcArr.length; fc++) {
				factCalcDao.remove(factCalcArr[fc]);
			}


			/** период проживания договор - домик */
			ENRentPeriod2ServicesDAO rentPeriodDao = new ENRentPeriod2ServicesDAO(connection, userProfile);
			ENRentPeriod2ServicesFilter rentPeriodFilter =  new ENRentPeriod2ServicesFilter();
			rentPeriodFilter.servicesObjectRef.code = code;

			int rentPeriodArr[] = rentPeriodDao.getFilteredCodeArray(rentPeriodFilter, 0, -1);
			for (int rp = 0; rp < rentPeriodArr.length; rp++) {
				rentPeriodDao.remove(rentPeriodArr[rp]);
			}

			/** состав семьи для договора (путевки) */
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


			/** дополнительный расчет к договору */
			ENServices2CalcAdditionalItemsDAO calcAdditionalItemsDao = new ENServices2CalcAdditionalItemsDAO(connection, userProfile);
			ENServices2CalcAdditionalItemsFilter calcAdditionalItemsFilter = new ENServices2CalcAdditionalItemsFilter();
			calcAdditionalItemsFilter.servicesObjectRef.code = code;

			int caArr[] = calcAdditionalItemsDao.getFilteredCodeArray(calcAdditionalItemsFilter, 0, -1);
			for (int c = 0; c < caArr.length; c++) {
				calcAdditionalItemsDao.remove(caArr[c]);
			}

			/** вложения к договору */
			ENDocAttachment2ENServicesObjectDAO attachment2enServicesObjectDao = new ENDocAttachment2ENServicesObjectDAO(connection, userProfile);
			ENDocAttachment2ENServicesObjectFilter attachment2enServicesObjectFilter = new ENDocAttachment2ENServicesObjectFilter();
			attachment2enServicesObjectFilter.servicesObjectRef.code = code;

			int attArr[] = attachment2enServicesObjectDao.getFilteredCodeArray(attachment2enServicesObjectFilter, 0, -1);
			for (int t = 0; t < attArr.length; t++) {
				attachment2enServicesObjectDao.remove(attArr[t]);
			}



			// удалим объект договора
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
	 *  возврашает вид присоединения (стандартное/не стандартное) по коду договора
	 *
	 *  @param soCode - код договора
	 *  @return connectionKind - вид присоединения
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
	 * Есть ли в договоре калькуляции в работах которого используются пломбы
	 *
	 * @param soCode код договора
	 * @return true - есть, false - иначе
	 * @throws PersistenceException
	 */
	public boolean isContainsKSU(int soCode) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isContainsKSUByServicesObjectCode(soCode);
	}

	/**
	 *
	 * Есть ли в договоре калькуляции, где абонент передает свой счетчик на баланс облэнерго
	 *
	 * @param soCode - код договора
	 *
	 * @return true - есть, false - иначе
	 * @throws PersistenceException
	 */
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isGiveCounterOnBalanceByServicesObjectCode(soCode);
	}

	/**
	 *
	 * Есть ли в договоре калькуляции, где абонент передает свой счетчик
	 *
	 * @param soCode - код договора
	 * @param giveCounterType - тип передачи счетчика (на баланс/на забаланс)
	 *
	 * @return true - есть, false - иначе
	 * @throws PersistenceException
	 */
	public boolean isGiveCounterOnBalanceByServicesObjectCode(int soCode, int giveCounterType) throws PersistenceException {
		TKClassificationTypeDAO clTypeDao = new TKClassificationTypeDAO(connection, userProfile);
		return clTypeDao.isGiveCounterOnBalanceByServicesObjectCode(soCode, giveCounterType);
	}


	/**
	 *
	 * Создание приходных ордеров для приходования счетчиков от абонентов на баланс предприятия
	 *
	 * @param so договор
	 * @throws PersistenceException
	 */
	public void makeIncomeFKOrdersForGivenCounters(ENServicesObject so) throws PersistenceException {

		if(so.contractDateServices == null) {
			throw new SystemException("Не задана дата для договору!");
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
		/*Коды счетчиков для которых не надо формировать ордера */
		Vector<Integer> giveCounterCodesNotNeeded = new Vector<>();

		ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
		int codeFinalConsumer = settingsLogic.getIntValue(ENSettingsKeysConsts.RQORG_FINAL_CONSUMER_CODE, so.contractDateServices);
		
		/*SUPP-104499*/
		if(so.finDocID == Integer.MIN_VALUE) {
			throw new SystemException(String.format("\n\nДля договору № %s від %s не обраний договір з Фінансової колекції.\nНеобхідно перейти на вкладку \"Основне\" та обрати договір!\n\n"
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
			throw new SystemException("Не знайдено лічильників для формування прибуткового ордеру");
		}

		for(ENGiveCounterShort shortCounter : countersList.getList()) {
			BigDecimal vat = (shortCounter.vat == null ? new BigDecimal(0) : shortCounter.vat);
			if(shortCounter.cost == null) {
				throw new SystemException(String.format("Для лічильника з заводським номером %s не задано вартість", shortCounter.serialNumber));
			}
			if(shortCounter.molCode == null) {
				throw new SystemException(String.format("Для лічильника з заводським номером %s не задано МОЛ для оприбуткування", shortCounter.serialNumber));
			}

			/*Проверка, что калькуляция, к которой привязан передаваемый счетчик не является калькуляцией где просто передают счетчик без
			 * приходования на баланс (может случиться если на договоре есть несколько калькуляций с разными признаками)*/
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
				/*Связка*/
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

		// Перебивание подразделения (временно) на плане на метрологию
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

		// Теперь необходимо вставить черновики приходуемых счетчиков
		for(ENGiveCounterShort shortCounter : countersList.getList()) {
			if(giveCounterCodesNotNeeded.contains(shortCounter.code)) {
				continue;
			}
			RQFKOrderItem fkOrderItem = orderItems.get(shortCounter.code);
			int[] invoiceCodes = invoiceDao.getCodesByFKOrderItem(fkOrderItem);
			if(invoiceCodes.length != 1) {
				throw new SystemException(String.format("Помилка у кількості накладних СканЛічильників для строки %s: %d", fkOrderItem.nomenclatureName, invoiceCodes.length));
			}
			SCInvoice invoice = invoiceDao.getObject(invoiceCodes[0]);
			int[] scOrderCodes = orderDao.getCodesBySCInvoice(invoice);
			if(scOrderCodes.length != 1) {
				throw new SystemException(String.format("Помилка у кількості разнарядок СканЛічильників для строки %s: %d", fkOrderItem.nomenclatureName, scOrderCodes.length));
			}

			SCOrder scOrder = orderDao.getObject(scOrderCodes[0]);
			int scOrderSCCode = scOrder.scCode;

			if(shortCounter.dateBuild == null) {
				throw new SystemException(String.format("Для лічильника із серійним номером %s не введено дати виробництва", shortCounter.serialNumber));
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
			throw new SystemException(String.format("Невідома фазність для лічильника з серійним номером %s", counter.serialNumber));
		}

		/*Выборка необходимых настроек*/
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
			throw new SystemException(String.format("Помилка у кількості строк прибуткового ордеру %d", fkOrderItemCodes.length));
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
				item.nomenclatureNum = "Без номенклатури";
				/* SUPP-66105 Определяется счет если стоимость счетчика больше или равна минимальной стоимости
				 * основного средства, то приходуется на счет прихода основных средств, а если меньше, то на счет
				 * прихода счетчиков от потребителей */
				if(counter.cost.compareTo(assetsMinimalPrice) >= 0) {
					item.nomenclatureBalSch = accountForAssetsIncome;
				} else {
					item.nomenclatureBalSch = accountCustomerIncome;
				}

				item.nomenclatureName = counter.counterType;
				item.nomenclatureUnitCode = 796;
				item.nomenclatureUnitName = "ШТ";
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
	 * Удаление приходных ордеров с счетчиками абонента связанных с договором
	 *
	 * @param so
	 *            договор услуг на сторону
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
	 * 	Изменение связки между двумя сущностями {@code ENServicesObject}
	 *
	 *	Если связка посылается с кодом равным {@code Integer.MIN_VALUE} то она будет добавлена
	 *	в противном случае заменена, если {@code elementOutRef.code} равен {@code Integer.MIN_VALUE}, то связка будет удалена
	 *
	 *
	 * @param element2element объект с кодами элементов двух {@code ENServicesObject} и типом {@link ENElement2ENElementType}
	 */
	public void changeLinkBetweenServices(ENElement2ENElement element2element) {
		try {
			if(element2element == null || element2element.elementInRef.code == Integer.MIN_VALUE) {
				throw new SystemException("Об'єкт пустий");
			}

			ENElement2ENElementDAO dao = new ENElement2ENElementDAO(connection, userProfile);
			if(element2element.code != Integer.MIN_VALUE) {
				/*Пока можно вводить только тип связки по договорам аренды ОКСН на допуск и ОКСН ТУ,
				 * согласование и работы*/
				int[] types = new int[4];
				types[0] = ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU;
				types[1] = ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU;
				types[2] = ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU;
				types[3] = ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU;
				dao.checkType(element2element, types, true);
				dao.remove(element2element.code);
				element2element.code = Integer.MIN_VALUE;
			}

			/*Проверка общего количества по договору - должно быть 0, если больше то ошибка*/
			ENElement2ENElementFilter filter = new ENElement2ENElementFilter();
			filter.elementInRef.code = element2element.elementInRef.code;

		    filter.conditionSQL = " enelement2enelement.typerefcode in (" + ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU + "," +
		    		              ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU + ")";

			long count = dao.count(filter);
			if(count > 0) {
				throw new SystemException(String.format("Помилка у кількості для договору "));
			}

			ENServicesObject servicesObjectIn = this.getServicesObjectByElementCode(element2element.elementInRef.code);

			if(servicesObjectIn == null) {
				throw new SystemException(String.format("Не знайдено об'єкт послуг на сторону для елементу  з кодом %d", element2element.elementInRef.code));
			}

			/*Если не задан out, то это будет рассмотрено как удаление связки */
			if(element2element.elementOutRef.code == Integer.MIN_VALUE) {
				return;
			}

			ENServicesObject servicesObjectOut = this.getServicesObjectByElementCode(element2element.elementOutRef.code);
			if(servicesObjectOut == null) {
				throw new SystemException(String.format("Не знайдено об'єкт послуг на сторону для елементу  з кодом %d", element2element.elementOutRef.code));
			}


			element2element.typeRef.code = Integer.MIN_VALUE;

			/*Связка договора аренды пропуск - ТУ*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_ACCESS
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_ACCESS_WITH_OKSN_TU;
			}

			/*Связка договора аренды узгодження - ТУ*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_AGREE
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_AGREE_WITH_OKSN_TU;
			}

			/*Связка договора аренды відшкодування - ТУ*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_WORK
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_WORK_WITH_OKSN_TU;
			}

			/*Связка договора аренды внесення змін до ТУ - ТУ*/
			if(servicesObjectIn.contractKindRef.code == ENServicesContractKind.OKSN_TU_MODIFY
					&& servicesObjectOut.contractKindRef.code == ENServicesContractKind.OKSN_TU) {
				element2element.typeRef.code = ENElement2ENElementType.SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU;
			}

			if(element2element.typeRef.code == Integer.MIN_VALUE) {
				ENServicesContractKindDAO kindDao = new ENServicesContractKindDAO(connection, userProfile);
				ENServicesContractKind inKind = kindDao.getObject(servicesObjectIn.contractKindRef.code);
				ENServicesContractKind outKind = kindDao.getObject(servicesObjectOut.contractKindRef.code);
				throw new SystemException(String.format("Неможливо визначити тип з''вязку для договорів виду \"%s\" та \"%s\""
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
	 * Проставление статуса "Неактивно" всем перерезервированным счетчикам под договор
	 *
	 * @param code код договора @link ENServicesObject}
	 * @param isCancel - если = true, то это отмена Заказчика и, если счетчики не найдены, мы ругаться не должны
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
	 * Проставление статуса "Неактивно" всем перерезервированным счетчикам под договор
	 *
	 * @param so договор {@link ENServicesObject}
	 * @param isCancel - если = true, то это отмена Заказчика и, если счетчики не найдены, мы ругаться не должны
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
	 * Все перерезервированные счетчики под договор
	 *
	 * @param so договор {@link ENServicesObject}
	 * @param isCancel - если = true, то это отмена Заказчика и, если счетчики не найдены, мы ругаться не должны
	 *
	 * @return {@link SCCounterShortList} список перерезервированных счетчиков
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
     *  При наличии связи договора с заявлением сохраняется дополнительные данные по договору...
     *
     *  @param soCode - код договора
     *
     */
	public void setServicesConsumerInfo(int soCode) {
		try {
			docFlowConnection = getDocFlowConnection();

			DFDoc2ENServicesObjectDAO doc2soDao = new DFDoc2ENServicesObjectDAO(docFlowConnection, userProfile);
			DFDoc2ENServicesObjectFilter doc2soFilter = new DFDoc2ENServicesObjectFilter();
			doc2soFilter.servicesObjectCode = soCode;

			/** если есть связь заявления с договором на услуги */
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
	 * 	Проверка принадлежности плана к услуге для договоров подряда на выполнение ПКД...
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
	 * 	Обновление стоимости по договору подряда на выполнение ПКД...
	 *
	 * 	@param agreement2soCode - код связки договора
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
	 * 	Возвращает код связки договора подряда на выполнение ПКД...
	 *
	 *	@param elementCode - код элемента плана
	 * 	@return agreement2soCode - код связки договора
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

/* Расчет граничной даты выполнения работ по услуге
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
            soObj.term = dfSListObj.term;  /// Максимально допустимый срок выполнения(дни)
            soObj.regulation = dfSListObj.regulation; // Регуляция срока: 0 или Null - рабочие дни, 1 - календарные

            if (soObj.term==Integer.MIN_VALUE){
             	throw new SystemException(" Не вказано термін виконання послуги (Документообіг -> Довідники -> Довідник послуг(S) ) " + dfSListObj.snum + " " + dfSListObj.name  );
            }


            /* +1 т.к  начинаем считать граничную дату со следющего дня */
            if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ){
            	//soObj.boundaryDateWork =  plLogic.getDateOnworkingDay( dfpObj.dateRegistration , soObj.term+1 ); // 	Граничная дата выполнения работ расчитанная по рабочим дням
            	//int calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(Tools.addDays(dfpObj.dateRegistration, 1)  , Tools.addDays(dfpObj.dateRegistration, soObj.term) );
  			    //int workDaysCount = dfLogic.getWorkDaysBetweenDates(Tools.addDays(dfpObj.dateRegistration, 1) , Tools.addDays(dfpObj.dateRegistration, soObj.term) );
  			    //int weekendDaysCount = soObj.term- workDaysCount;
  			    //soObj.boundaryDateWork  = Tools.addDays(dfpObj.dateRegistration, (soObj.term + weekendDaysCount));
            	//---
            	soObj.boundaryDateWork = plLogic.getDateOnworkingDay(dfpObj.dateRegistration, soObj.term+1);


            } else {
            	soObj.boundaryDateWork =  Tools.addDays(dfpObj.dateRegistration, soObj.term );  // 	Граничная дата выполнения работ расчитанная по календарным дням
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


/* Расчет граничной даты выполнения работ по услуге при внесении/удалении задержек по вине заказчика
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
            	throw new SystemException(" Не визначено термін виконання послуги!!! ");
            }
            if (soObj.boundaryDateWork == null ){
            	throw new SystemException(" Не визначено граничну дату виконання робіт по договору !!!)");
            }

            ENDelayServicesFilter delayFil = new ENDelayServicesFilter();
            delayFil.servicesObjectRef.code = soObj.code;
            delayFil.orderBySQL = " ENDelayServices.datestart ";

            ENDelayServicesShortList delayList = delayDAO.getScrollableFilteredList(delayFil, 0, -1);

            calculationBoundaryDateWork(soObj); // 1. пересчет граничной даты

            // 2. если задержек нет, то выход
            if (delayList.totalCount==0){
            	return;
            }



            Date newBoundaryDateWork = soObj.boundaryDateWork; // пересчитываемая граничная дата
            int sumDayDelayCount = 0;

            // 3. если задержки есть
            for (int i = 0; i < delayList.totalCount ; i++) {

        	// если граничная дата в пределах dateStart и dateFinal -- граничная дата = dateFinal + кол-во дней между(dateFinal и dateStart)
        	// if (  newBoundaryDateWork.compareTo(delayList.get(i).dateStart) >= 0 && newBoundaryDateWork.compareTo(delayList.get(i).dateFinal) <= 0 	){
            	if (  delayList.get(i).dateStart.compareTo(newBoundaryDateWork) <= 0 ){

        		 /* newBoundaryDateWork = Tools.addDays(soObj.boundaryDateWork,
        				                                ( (int) ( Tools.getDaysDiff( delayList.get(i).dateStart , delayList.get(i).dateFinal  , TimeUnit.DAYS  )+1) )
        				                              );*/
        		  // проверим посчитанный день выходной или нет
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
        		  // если срок выполнения измеряется в рабочих днях, то к количеству календ дней в периоде заержки прибывать кол-во выходных дней
        		  // в периоде забержки и получившиеся дни добавть к граничной дате выполнения работ
        		  if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ){
        			  // int calendarDaysCount = dfLogic.getCalendarDaysBetweenDates(delayList.get(i).dateStart , delayList.get(i).dateFinal);
        			  // int workDaysCount = dfLogic.getWorkDaysBetweenDates(delayList.get(i).dateStart , delayList.get(i).dateFinal);
        			  //int weekendDaysCount = delayList.get(i).calendarDaysCount - delayList.get(i).workDaysCount;
        			  // граничная дата выполнения работ с учетом вых дней
        			  //newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, (delayList.get(i).calendarDaysCount + weekendDaysCount));


        			  sumDayDelayCount = sumDayDelayCount +  delayList.get(i).workDaysCount; // кол-во дней задержки в рабочих днях
        			  newBoundaryDateWork  = plLogic.getDateOnworkingDay(newBoundaryDateWork, delayList.get(i).calendarDaysCount + 1);
        		  }
        		  // если срок выполнения измеряется в календарных днях то к граничной дате прибавлить кол-во дней задержки
        		  else if( soObj.regulation == 1 ){

        			  newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, delayList.get(i).calendarDaysCount);
        			  sumDayDelayCount = sumDayDelayCount +  delayList.get(i).calendarDaysCount; // кол-во дней задержки в календарных днях
        		  }



            	}
            	else {
            		throw new SystemException("\n\n NET-4560 Невозможно вносить данные о задержке после граничной даты выполнения работ по услуге !");
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

/* Расчет граничной даты выполнения работ по услуге при внесении/удалении задержек по вине заказчика
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
         /*return; */	throw new SystemException(" Не визначено термін виконання послуги!!! soObj = " + soObj.code);
        }
        if (soObj.boundaryDateWork == null ){
         /*return; */ throw new SystemException(" Не визначено граничну дату виконання робіт по договору !!!) soObj = " + soObj.code );
        }

        ENDelayServicesFilter delayFil = new ENDelayServicesFilter();
        delayFil.servicesObjectRef.code = soObj.code;
        delayFil.orderBySQL = " ENDelayServices.datestart ";

        ENDelayServicesShortList delayList = delayDAO.getScrollableFilteredList(delayFil, 0, -1);

        calculationBoundaryDateWork(soObj); // 1. пересчет граничной даты

        // 2. если задержек нет, то выход
        if (delayList.totalCount==0){
        	return;
        }

        soObj = soDAO.getObjectNoSegr(soObj.code);

        Date newBoundaryDateWork = soObj.boundaryDateWork; // пересчитываемая граничная дата

        int sumDayDelayCount = 0;
        int workDaysCount = 0;
        int calendarDaysCount = 0;

        // 3. если задержки есть
        for (int i = 0; i < delayList.totalCount ; i++) {

        	/* if (  delayList.get(i).dateStart.compareTo(newBoundaryDateWork) <= 0 ){

        	}
        	else {
        		throw new SystemException("\n\n NET-4560 Невозможно вносить данные о задержке после граничной даты выполнения работ по услуге !");
        	}*/

          workDaysCount = workDaysCount + delayList.get(i).workDaysCount;
          calendarDaysCount = calendarDaysCount + delayList.get(i).calendarDaysCount;

		}

         if( soObj.regulation == Integer.MIN_VALUE || soObj.regulation == 0 ) {
 			  sumDayDelayCount = workDaysCount ; // кол-во дней задержки в рабочих днях
 			  newBoundaryDateWork  = plLogic.getDateOnworkingDay(newBoundaryDateWork, workDaysCount + 1);
 		  }
 		  // если срок выполнения измеряется в календарных днях то к граничной дате прибавлить кол-во дней задержки
 		  else if( soObj.regulation == 1 ){

 			  newBoundaryDateWork = Tools.addDays(newBoundaryDateWork, calendarDaysCount );
 			  sumDayDelayCount = calendarDaysCount; // кол-во дней задержки в календарных днях
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт послуги на сторону!");
		}

		if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
				&& servicesObject.personalAccountCode != Integer.MIN_VALUE) {

			if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
				throw new SystemException("NET-4576 Для цих робіт на договорі потрібно вказати EIC-код точки обліку!");
			}

			boolean workConnections = checkWorks(servicesObject.code, true);

			if (workConnections) {
				BillingLogic billingLogic = new BillingLogic(connection, userProfile);
				DisconnectionInitiator disconnectionInitiator = billingLogic.getDisconnectionInitiatorByEIC(servicesObject.codeEIC, isServicesObjectByt(servicesObject));

				// Для юр. лиц, если не удалось определить инициатора отключения, считаем, что инициатор - ОСР
				if (servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL &&
					servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL_NOREZIDENT) {
					if (disconnectionInitiator == null) {
						disconnectionInitiator = DisconnectionInitiator.OSR;
					}
				}
				if (disconnectionInitiator == null) {
					throw new SystemException("NET-4576 Не вдалося визначити ініціатора відключення для точки обліку з EIC-кодом " + servicesObject.codeEIC + " !");
				}

				if (disconnectionInitiator == DisconnectionInitiator.SUPPLIER) {
					throw new SystemException("\n\nNET-4576 Ініціатором відключення для точки обліку з EIC-кодом " + servicesObject.codeEIC + " є постачальник!\n" +
							"Для підключення споживач повинен звертатись до постачальника!");
				}

			}

		}
	}

	public void budgetApproved(int svoCode, int planCode) {
		try {

			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);

			ENServicesObject servicesObject = servicesObjectDao.getObject(svoCode);
			/** код заявки */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);


			if (servicesObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
				throw new SystemException("\n"
						+ "Затвердити кошторис можливо лише на черновому договорі, code = " + svoCode);
			}

			if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "Змінювати вже проведені договори заборонено!");
			}


			/** код услуги по коду заявки */
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


			// SUPP-91510 Проверим инициатора отключения не на стадии перевода в статус "Сплачений", а раньше
			/** SUPP-99483... 07.04.2021... +++ проверяем если обязательный EIC */
			if (requiredEIC) {
				checkDisconnectionInitiator(servicesObject);
			}


	        /* для реализации проверим материалы в плане и ордер */
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
								+ "Відсутні матеріали в плані!!!");
					}
				}

	            /** 01.10.2013 +++ статус плана?!?! */
				for (int i = 0; i < planArr.length; i++) {
					ENPlanWork plan = planDao.getObject(planArr[i]);
					plan.status.code = ENPlanWorkStatus.LOCKED;
					planDao.save(plan);
				}
			}


	        ///// 16.05.13 NET-4235 Расчет сумм для предварительной оплаты
			if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
				calcForPrepayment2(servicesObject);
			}
	        /////

			servicesObject.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
			servicesObjectDao.save(servicesObject);

			/** если услуга связана с заявкой с сайта - запись в историю на сайте */
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.SECOND, servicesObject.code);

					/** обновим информацию на заявке с сайта.. */
					ENServicesObject sObject = servicesObjectDao.getObjectNoSegr(servicesObject.code);
					docFlowLogic.saveSiteApplication(servicesConsumer.code, sObject.isNoPay, sObject.calcTypeRef.code,
							servicesConsumer.numberGen, sObject.boundaryDateWork, sObject.contractServicesSumma,
							sObject.department.code, sObject.contractNumberServices, null, sObject.contragentName);

					String message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " sformovano rahunok. "
							+ "Zaydit do personalnogo kabinetu dlya yogo otrymannya.";

					/** отправка СМС  */
					docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);
				}

				/** SUPP-93284... +++ Для заявок, которые поданы с сайта при переводе в статус "кошторис затверджено" автоматически переводить в статус "підписаний" */
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
	 *	проверка наличия связи заявления с договором на услуги
	 *
	 *	@param soCode - код договора
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
	 *	Подписание договора - возвращает код месячного плана, созданного из "кошториса"
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
            	// SUPP-102352 Приєднання не проверяем
            	if (servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {
	                AuthLogic auth = new AuthLogic(authConn, userProfile);

	                if (!auth.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "signedServices")) {
	                    throw new SystemException("\n Права на переведення договорів є у діловодів ЦОС «Херсонобленерго»!!!");
	                }
            	}
            }

			/** если услуга создана по заявке с сайта - договор подписывается в персональном кабинете на сайте */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE
					&& isClient
					/** SUPP-91141... 04.05.2020... +++ разрешаем подписывать договора, созданные деловодом, с регистрацией на сайте... */
					&& servicesObject.createdFromSite == ENConsts.CREATED_FROM_SITE_YES) {

				throw new SystemException("\n \n"
                        + "Цей договір створений за заявкою з сайту та підписується споживачем в персональному кабінеті!!!");
			}


            // NET-4295 Если контрагент - юр. лицо бюджет, то пакет документов в DocFlow вставляется
            // при подписании, если присоединения - то тоже не вставляется в docFlow - для присоединения
            // свой метод подписания signedPriconnection

			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (isDocFlowLifeCycleStartsWithSigning(servicesObject)
						&& servicesObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {

					servicesObject.dfPackCode = createDocFlowPack(servicesObject);
                    // NET-4560 - расчет граничной даты выполнения работ

    				calculationBoundaryDateWork(servicesObject);
    				// !!перечитаем EnServicesObject т.к при расчете граниной
    				// даты проапдетили данные
    				servicesObject = servicesObjectDao.getObject(servicesObject.code);
                }
            }


            /** 15.04.2013 +++ для подписания договора на присоединение другой метод */
            if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

     //       if (isClient && priconnections) {
     //          throw new SystemException("\n NET-4231..."
     //                   + "\n \n Договори на приєднання підписуються в EnergyWorkflow!!!");
     //       }

            Date executeWorkDate = servicesObject.executeWorkDate;

            /** 12.04.2013 +++ кроме присоединений */
            if (!priconnections) {
                if (servicesObject.contractStatusRef.code != ENServicesContractStatus.BUDGETAPPROVED) {
                    throw new SystemException(
                            "Підписати договір можливо лише після затвердження кошторису, code = " + svoCode);
                }

                if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
                    throw new SystemException(
                            "Змінювати вже проведені договори заборонено!");
                }

                /** SUPP-18463... 18.06.2014 +++ проверка наличия доверенности на договоре... */
                if (servicesObject.warrantRef.code == Integer.MIN_VALUE) {
                	throw new SystemException("\n\n"+
                            "Не зазначена довіреність на договорі!!!");
                }

                /** NET-4422...  +++ в договоре на выполнение работ по замене счетчика при переходе на многотарифный учет
                 *  обязательно должен быть указан л/счет абонента
                 *  +++ тип зонности счетчика
                 */
				if (checkReplaceCounterServices(servicesObject.element.code)) {

					if (servicesObject.reconnectionTU == Integer.MIN_VALUE) {
						throw new SystemException("\n\n "
								+ "Не зазначено особовий рахунок споживача на договорі!!!");
					}

					if (servicesObject.countersZoneType == Integer.MIN_VALUE) {
						throw new SystemException("\n\n "
								+ "Не зазначено кількість зон для лічильника на договорі!!!");
					}
				}

				checkGiveCounterForServicesObject(servicesObject);

                // NET-4295
                // Проверка на то, что поставлен признак для физ.особы
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
                            + "Оберіть ознаку нового або повторного підключення на формі редагування договору для фіз. особи!!!");
                    }
                }

                // 09.12.2014 - при подписании если нету даты выполнения работ по договору то засетим дату с договора в момент подписания
                if (executeWorkDate == null ){
                	executeWorkDate = servicesObject.contractDateServices;
                	servicesObject.executeWorkDate = executeWorkDate;
                }



                /** SUPP-99483... 07.04.2021... +++ проверяем если обязательный EIC */
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



    			/** SUPP-99483... 07.04.2021... +++ проверяем если обязательный EIC */
    			if (requiredEIC) {
                    // 29.10.2019 Если заполнен лицевой счет, обязательно необходимо выбрать EIC-код точки учета!
            		if (servicesObject.personalAccountCode > 0) {
            			if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
            				throw new SystemException("NET-4576 Для цих робіт на договорі потрібно вказати EIC-код точки обліку!");
            			}
            		}
    			}


                servicesObject.contractStatusRef.code = ENServicesContractStatus.SIGNED;
                servicesObjectDao.save(servicesObject);
            }



            /* для реализации это всё не надо , и не только для неё*/
            if (servicesObject.contractKindRef.code != ENServicesContractKind.SALE &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_COMPANY_OBJ &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SHIFT_LINES_CUSTOMER_OBJ &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.INFORMATIONAL_SERVICES &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SUPPLIER_CONTRACT&&
            		servicesObject.contractKindRef.code != ENServicesContractKind.REMOVAL_LINE_RM_KB &&
            		servicesObject.contractKindRef.code != ENServicesContractKind.SERVICES_LUZOD_ASKOE ) {


                /** NET-4159
                *  проверка передаваемых счетчиков для работ Метрологии
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

                // ЕСЛИ НА СЕРВИС ОБЖЕКТЕ ДАТА ВІПОЛНЕНИЯ РАБОТ НЕ ПУСТАЯ (ДЛЯ РЕЗЕРВИРУЕМІХ КАЛЬКУЛЯЦИЙ) ТОГДА АПДЕЙТИМ ДАТУ НАЧАЛИ И ДАТУ КОНЦА ВІПОЛНЕНИЯ РАБОТ НА ПЛАНЕ
                /** SUPP-28447...  для договоров на присоединение даты не меняем.... */
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

                /** 21.01.2017... +++ договора на ТУ уже с утвержденной калькуляцией  */
                if (servicesObject.contractTypeRef.code == ENServicesContractType.TY
                		&& plan.status.code == ENPlanWorkStatus.LOCKED) {
                	return plan.code;
                }

                // SUPP-4515 проверка необходимости дистанции
				if (!priconnections) {
					if (checkNeedInputKilometers(plan.code) == true) {
						if (! userProfile.userName.equals("energynet")) {
							throw new SystemException("\n\n "
									+ "По калькуляції використовується транспорт!!! В договорі обов`язково необхідно вказати відстань");
						}
					}
				}

                // генерим месячный план
                newPlanCode = planWorkLogic.closePlan(plan.code);
                // апдейт статуса для плана единичного кошториса в статус Затверджений

                // NET-2264 переберем транспорт итемы с типом бригадное авто и обнулим дистансы для всех кроме первого транспорт итема .

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

					// пересчитаем  доставку на плане
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

                // сгенирить Задание ПЛАН , Наряд, заявку на транспорт  если договор с временными резервируемыми работами
                // из месячного в задание ПЛАН  и по услугам на сторону и в плане есть работы временные резервируемые тогда
                // вытянуть на план БюджетодержаТеля , Мол для разнарядки , исполнителя
                /* ЕСЛИ КОНТРАГЕНТ ЮР БЮДЖЕТ ТОГДА ЭТОТ КУСОК ПЫТАЕМСЯ СДЕЛАТЬ ПРИ ПОДПИСАНИИ ДОГОВОРА ИНАЧЕ НАДА ЖДАТЬ ОПЛАТУ ЧТО БЫ СГЕНЕРИТЬ ЗАДАНИЕ ПЛАН И НАРЯД ЗАДАНИЕ  */
				PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
				if ((plan.kind.code == ENPlanWorkKind.CALCULATION)
						&& ((pl.isReservedCalculationInContract(plan.code)) == true)
						&& ((pl.isAcessRemJobsByTime(plan.departmentRef.code)) == true)
						&& (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)) {

                        // сгенерим сразу задание ПЛАН из месячного
                        newPlanCode = planWorkLogic.closePlan(newPlanCode);
                        // ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
                        // newPlanObj.dateGen
                        // для задания ПЛАН создадим Наряд - Задание
                        try {
                            createWorkOrderToPlanServices(newPlanCode);
                            // заполним finmoldata
                            createFinMolToPlanServices(newPlanCode);
                            // проверить если есть на плане машины если есть тогда сделаем заявку на машины
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

								// определим к какому транспортному подразделению относится автомобиль
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = servicesObject.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("\n"
											+ "Не знайдено транспортне підприємство!");
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

                // договоров в которых содержатся калькуляции резервируемые по времени при утверждении договора на месячном плане проставим дату с и дату по такую как в договоре дата выполнения работ
                //  NET-4235   нада бы при подписании договора при Типе контрагента (Юр.особа бюджет) чистить расчет табл. enservicesfactcalc
                // по предоплате так как для бюджетников никакой предоплаты нема

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


            // net-4445 Создать механизм в услугах на сторону по созданю автоматического ордера по счетчику (если это услуга со счетчиком )
            // если тип контрагента бюджет тогда на подписании привяжем счетчик сгенерим ордер на перемещение
			if (servicesObject.contractKindRef.code == ENServicesContractKind.SERVICES
					&& servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoCreateFkorderMoveCounterForServices(servicesObject);
			}


			/** если услуга связана с заявкой с сайта - запись в историю на сайте */
			if (servicesConsumerCode != Integer.MIN_VALUE) {
				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);

				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					/** 17.03.2020... для бюджета - сразу в работу */
					if (servicesObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
						docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FOURTH, servicesObject.code);
					} else {

						/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
						if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.EIGHTH, servicesObject.code);
						} else {
							docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.THIRD, servicesObject.code);
						}
					}


					/** сохранение дополнительной информации для онлайн заявки */
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



			/** NET-4592... 26.05.2020... +++ для услуг на сторону, отправка счета при наличии e-mail... */
			if (servicesObject.contractKindRef.code == ENServicesContractKind.SERVICES
					&& servicesObject.contractTypeRef.code == ENServicesContractType.OTHERS) {

					if (servicesObject.customerEmail != null
							&& servicesObject.customerEmail.length() > 0) {

						sendBillToCustomer(servicesObject, DocType.FIRST_BILL);
					}
			}



			/** SUPP-100912... 24.06.2021... +++ для договоров аренды добавлять контрагента в CallCenter при подписании договора в EnergyNet....  */
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
	 * проверка формата email
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

		/** счет на предоплату */
		public static final int FIRST_BILL = 1;
		/** окончательный счет */
		public static final int SECOND_BILL = 2;
	}



	/**
	 * формирование счета и отправка на e-mail
	 *
	 * @param servicesObject
	 * @param docType - (первый счет, второй и т.п.)
	 */
	public void sendBillToCustomer(ENServicesObject servicesObject, int docType) {

		/** проверка формата e-mail */
		if (servicesObject.customerEmail == null
				|| servicesObject.customerEmail.length() == 0) {
			return;
		}

		if (!isValidEmailAddress(servicesObject.customerEmail)) {
			return;
		}

		/** формирование отчета и отправка на e-mail */
		ReportLogic reportLogic = new ReportLogic(connection, userProfile);
		reportLogic.sendBillToCustomer(servicesObject, docType);
	}



	public int createDocFlowPack(ENServicesObject servicesObject) {

		int servicesListCode = Integer.MIN_VALUE;

		boolean requiredEIC = isEICRequired(servicesObject.code);

		/** SUPP-99539... 09.04.2021... +++ проверяем - если обязательный EIC */
		if (requiredEIC) {
			if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
					&& servicesObject.personalAccountCode != Integer.MIN_VALUE) {


				if (servicesObject.codeEIC == null || servicesObject.codeEIC.trim().equals("")) {
					throw new SystemException("NET-4576 Для цих робіт на договорі потрібно вказати EIC-код точки обліку!");
				}

				/** если калькуляция относится к подключению - создаем пакет в docFlow... */
				boolean workConnections = checkWorks(servicesObject.code, true);

				/** !!! если указан признак повторного подключения и есть код лицевого счета
	             *
	             *      S1.4.1 - город
	             *      S1.4.2 - село
	             *      сформировать пакет в DocFlow....
	             */

				if (workConnections) {
					BillingLogic billingLogic = new BillingLogic(connection, userProfile);
					DisconnectionInitiator disconnectionInitiator = billingLogic.getDisconnectionInitiatorByEIC(servicesObject.codeEIC, isServicesObjectByt(servicesObject));

					/**
					 * SUPP-57620 31.01.2017... +++ для населения делим 1.4, юрики -
					 * на 1.3....
					 */
					/* 28.10.2019 Теперь все по-новому
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
									+ "Невідома ознака село-місто для договору № " + servicesObject.contractNumberServices);
						}
					} else {
						servicesListCode = DFServicesList.S1_3;
					}
					*/

					// Для юр. лиц, если не удалось определить инициатора отключения, считаем, что инициатор - ОСР
					if (servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL &&
						servicesObject.contragentTypeRef.code != ENServicesContragentType.PHYSICAL_NOREZIDENT) {
						if (disconnectionInitiator == null) {
							disconnectionInitiator = DisconnectionInitiator.OSR;
						}
					}
					if (disconnectionInitiator == null) {
						throw new SystemException("NET-4576 Не вдалося визначити ініціатора відключення для точки обліку з EIC-кодом " + servicesObject.codeEIC + " !");
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
											+ "Невідома ознака село-місто для договору № " + servicesObject.contractNumberServices);
							}
							break;

						case CUSTOMER:
							servicesListCode = DFServicesList.S3_1_NEW;
							break;

						case SUPPLIER:
							throw new SystemException("\n\nNET-4576 Ініціатором відключення для точки обліку з EIC-кодом " + servicesObject.codeEIC + " є постачальник!\n" +
	                                                  "Для підключення споживач повинен звертатись до постачальника!");

						default:
							throw new SystemException("\n\nNET-4576 Невідомий ініціатор відключення для точки обліку з EIC-кодом " + servicesObject.codeEIC + " !");
					}

				}

			} else if (servicesObject.reconnectionTU == ENConsts.SERVICESOBJECT_NEWCONNECTIONTU) {

				/************************
				SUPP-87079 by ParfenovAY:
				Прошу для послуг, для яких застосовується калькуляції з кодом
				класифікації послуги S3 "відновлення електропостачання після
				відключення", у разі наявності ознаки "Новий споживач" на договорі в ПК EnergyNet,
				присвоювати код класифікації S0.1 "підключення нового споживача в
				багатоквартирному будинку"
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
			throw new IllegalArgumentException("\n\nНе заданий код договора про послуги на сторону!");
		}

		// SUPP-106102 06.12.2021 если услуга не связана с документооборотом, то EIC-код является необязательным для заполнения
		boolean requiredEIC = false;

		/** код заявки */
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
	 *	перевод договора в статус "Відмова замовника від послуг"
	 *
	 *	@param objCode - код договора
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
						+ "Змінювати вже проведені договори заборонено!");
			}


			/** проверяем если вызов не из документооборота */
			if (!isDocFlow) {
				/** если услуга связана с заявкой потребителя */
				int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
				if (servicesConsumerCode != Integer.MIN_VALUE) {
					throw new SystemException("\n\n"
							+ "Договір створений за заявкою споживача!\n"
							+ "Скасуйте завдання в журналі заявок споживачів.");
				}
			}


            // NET-4295 Отмена договора
			ConfigDAO configDAO = new ConfigDAO(userProfile, getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE));
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				cancelServicesObjectInDocFlow(servicesObject, false);
			}

            // NET-4443 Если договор на установку многотарифного счетчика, отвяжем его от заявки на закупку счетчиков
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
	 *	Отмена подписание договора...
	 */
	public void unSigned(int svoCode, boolean priconnections, boolean isClient) {
		Connection authConn = null;
		try {
			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
            ENServicesObject obj = objDAO.getObject(svoCode);

            /** 15.04.2013 +++ для подписания договора на присоединение другой метод */
            if (obj.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }

            if (obj.contractKindRef.code == ENServicesContractKind.SERVICES && !priconnections) {

                AuthLogic auth = new AuthLogic(authConn, userProfile);
                if (!auth.checkPermissionSilent("ksoe/energynet/ENServicesObjectController", "signedServices")) {
                    throw new SystemException("\n Права на переведення договорів є у діловодів ЦОС «Херсонобленерго»!!!");
                }
            }

            // SUPP-80411 Запрет отмены подписания договора, если для него есть дополнительные соглашения
            ENAdditionalAgreementDAO additionalAgreementDao = new ENAdditionalAgreementDAO(connection, userProfile);
            ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
            servicesObjectRef.code = svoCode;
            long count = additionalAgreementDao.count(servicesObjectRef, null, null);
            if(count > 0) {
            	throw new SystemException(String.format("Для договору № %s від %s є додаткові угоди. Відміна підписання неможлива!"
            			, obj.contractNumberServices
            			, Tools.dateFormatDefault.format(obj.contractDateServices)));
            }

       //     if (isClient && priconnections) {
       //         throw new SystemException("\n NET-4231..."
       //                 + "\n \n Договори на приєднання підписуються в EnergyWorkflow!!!");
       //     }

            if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
                throw new SystemException("\n"
                		+ "Відміняти треба на підписаному договорі, code = " + svoCode);
            }

			if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "Змінювати вже проведені договори заборонено!");
			}



			/** если услуга создана по заявке с сайта - договор подписывается в персональном кабинете на сайте */
			int servicesConsumerCode = getServicesConsumerCode(obj.code);
			if (servicesConsumerCode != Integer.MIN_VALUE
					&& isClient
					/** SUPP-91141... 04.05.2020... +++ разрешаем подписывать договора, созданные деловодом, с регистрацией на сайте... */
					&& obj.createdFromSite == ENConsts.CREATED_FROM_SITE_YES) {

				throw new SystemException("\n \n"
                        + "Цей договір підписано споживачем в персональному кабінеті.\n"
                        + "Скасування підписання неможливе!!!");
			}



            // net-4445 Создать механизм в услугах на сторону по созданю автоматического ордера по счетчику (если это услуга со счетчиком )
            // если тип контрагента бюджет тогда при отмене подписания удалить ордер на перемещение по многотарифному счетчику
			if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
					&& obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoRemoveAllRereservedCountersForServices(obj);
				fkOrderLogic.autoRemoveFkorderMoveCounterForServices(obj);
			}

            ///  уберем проверку на отмену // 03.05.19 // после размышлений с Андрюхой
			//   isCancelableServices(svoCode);

            // PRIC-155. Возврат пакета EnergyWorkFlow на Ожидание
            if (obj.contractStatusRef.code == ENServicesContractType.TY
            && obj.cnPackCode != Integer.MIN_VALUE
            && obj.cnSubsystemTypeRef.code != Integer.MIN_VALUE
            && obj.element.code != Integer.MIN_VALUE)
            {
                //Проверка, что связанный договор Услуг на сторону является
                //договором о Подготовке ТУ, а не о Внесении Изменений в ТУ
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
                                case CNSubsystemType.SS_CONNECTION: //Присоединение
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
                                case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
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
                                case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
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
                                case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
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
								case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
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
                                    throw new SystemException("Неизвестна подсистема EnergyWorkFlow");
                                }
                                }
                            if (!cnLog.completeTask(packCN, false, stateFromRedoIdArray, "Отмена подписания договора в EnergyNet"))
                            {
                                throw new SystemException("Отмена подписания невозможна." +
                                "\n Сначала нужно в EnergyWorkFlow вернуть задание " +
                                "\n на подписание договора о подготовке ТУ");
                            }
                        } catch (DatasourceConnectException e) {
                        	throw new SystemException("Нет связи с EnergyWorkFlow ...", e);
					} finally {
						try {
							if ((cnConnection != null) && !cnConnection.isClosed())
								cnConnection.close();
						} catch (SQLException e) {
						}
					}
                }
            }

            /* для реализации немного по другому ;) */
            if (obj.contractKindRef.code == ENServicesContractKind.SALE) {

                obj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                objDAO.save(obj);

            } else {

                // вытянем по коду объекта код плана кошторис
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

                /* Если есть резервируемые работы в договоре тогда пробуем удалить сперва задание ПЛАН если он в черновом статусе */
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
                            		+ "Для відміни підписання Завдання ПЛАН повинен бути чорновим!");
                        }
                        else
                            // удалим задание план
                            pl.openPlan(plObj.code,0);
                    }
                }

                if ( codePlanEstimate != Integer.MIN_VALUE ) {
                    // вытянем по коду объекта код текущего плана
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
                            		+ "Поточный план повинен бути чорновим!");
                        }
                        else

                        // удаление текущего плана для редактирования кошториса , и ставим статус кошториса в статус Кошторис затверджений
                        {

                            pl.openPlan(codePlanCurrent,0);

                            // апдейт статуса для плана единичного кошториса в статус Черновой
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

                /* 20.09.2018 тоже самое подходит и для договорів виконання робіт
                 * (у Оли Кравец СРМ не получалось отменить подписание договора)*/
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
     *  отмена договора услуг на сторону
     *
     * 	@param svoCode - код договора
     * 	@param commenGen - комментарий
     *  @param isDocFlow - default (false)
     */
	public void canceled(int svoCode) {
		canceled(svoCode, null, false);
	}

	public void canceled(int svoCode, String commenGen, boolean isDocFlow) {
		try {

			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObject(svoCode);


			/** если услуга связана с заявкой потребителя */
			int servicesConsumerCode = getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE && !isDocFlow) {
				throw new SystemException("\n\n"
						+ "Договір створений за заявкою споживача!\n"
						+ "Скасуйте завдання в журналі заявок споживачів.");
			}


			/** SUPP-91329... +++ проверка наличия оплаты... */
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
						+ "Скасування неможливе!\n"
						+ "За договором №" + servicesObject.contractNumberServices + " була оплата рахунку.\n"
						+ "Потрібно спочатку повернути замовнику кошти.");
			}


			/**
			 *  SUPP-91700... +++ договор в статусе "Оплачен"
  			 *  отменить договор возможно при наличии возврата денег
			 */
			/*
			if (servicesObject.contractStatusRef.code != ENServicesContractStatus.GOOD) {
				if (!isSilent) {
					throw new SystemException("\n"
							+ "Відміняти треба тільки чорновий договір, code = " + svoCode);
				}
			}
			*/

			// NET-4295
			// Проверка - на этой стадии кода пакета из системы документооборота быть не должно.
			if (servicesObject.dfPackCode != Integer.MIN_VALUE && !isDocFlow)
				throw new SystemException("\n"
						+ "Error - dfPackCode doesn't equal null");

			if (servicesObject.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "Змінювати вже проведені договори заборонено!");
			}

			// NET-4443 Если договор на установку многотарифного счетчика, отвяжем его от заявки на закупку счетчиков
			removeForCounters(svoCode, true);

			servicesObject.contractStatusRef.code = ENServicesContractStatus.CANCELED;

			if (commenGen != null && !commenGen.equals("")) {
				servicesObject.commentServicesGen = commenGen;
			}


			/** отмена регистации пакета */
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
	 *  перевод договора в статус "Оплачено предварительный счет"
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
						+ "\n \n Для договорів на приєднання цей статус не використовується!!!");
			}

			if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
				throw new SystemException("\n "
						+ "Сплатити рахунок можливо тільки на підписаному договорі, code = " + svoCode);
			}

			if (obj.statusRef.code == ENServicesObjectStatus.CLOSED) {
				throw new SystemException("\n"
						+ "Змінювати вже проведені договори заборонено!");
			}

			if (obj.calcTypeRef.code != ENServicesObjectCalcType.BY_FACT) {
				throw new SystemException("\n\n"
						+ "NET-4235 Для цього договору статус \"Сплачено попередній рахунок\" не використовується! Код договору: " + svoCode);
			}


			// SUPP-4100 проверка при переводе договора в статус "попередньо оплачений"
			// что бы были внесены суммы по предоплате во вкладке "Фактичні оплати замовником" (кроме бюджетных организаций и безоплатных договоров )
			if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
				if (obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
						&& obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = svoCode;
					paymentSoFilter.paymentTypeRef.code = ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT;
					int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

					if (paymentArr.length == 0) {
						throw new SystemException("\n SUPP-4100..."
								+ "\n \n Необхідно занести попередню оплату(Вкладка \" Фактичні оплати \") !!!");
					}
					// какие то предоплаты вытянули - проверим что были внесены оплаты не 0 )))
					BigDecimal summPrepay = new BigDecimal(0);
					for (int i = 0; i < paymentArr.length; i++) {
						ENPayment2SO paymentSoObj = paymentSoDAO.getObject(paymentArr[i]);
						summPrepay = summPrepay.add(paymentSoObj.sumTotal);
					}
	                if (summPrepay.doubleValue() == 0 ) {
	                	throw new SystemException("\n SUPP-4100..."
	                			+ "\n \n Необхідно занести попередню оплату(Вкладка \" Фактичні оплати \") !!!");
					}
				}
			}

			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

	        // NET-4295 Вставка документов в DocFlow
			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (!isDocFlowLifeCycleStartsWithSigning(obj)) {
					obj.dfPackCode = createDocFlowPack(obj);

					// NET-4560 - расчет граничной даты выполнения работ
					calculationBoundaryDateWork(obj);
					// !!перечитаем EnServicesObject т.к при расчете граниной
					// даты проапдетили данные
					obj = objDAO.getObject(obj.code);
				}
			}

			obj.contractStatusRef.code = ENServicesContractStatus.PREPAID;
			objDAO.save(obj);

			/* для реализации это не надо!!! */
			if (obj.contractKindRef.code != ENServicesContractKind.SALE) {
                /* ЕСЛИ КОНТРАГЕНТ НЕ ЮР БЮДЖЕТ
                * и по договору еще нету задания план
                * и работы вревенные резервируемые
                * и разрешено это делать для РЕС ов
                * есть уже сформированый месячный план
                * ТОГДА СГЕНЕРИТЬ ЗАДАНИЕ ПЛАН И НАРЯД ЗАДАНИЕ и заявку на транспорт  ПЫТАЕМСЯ СДЕЛАТЬ ПРИ оплате ДОГОВОРА   */

				PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
	            // определим план кошторис
				ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter plCalcFilter = new ENPlanWorkFilter();
				plCalcFilter.elementRef.code = obj.element.code;
				plCalcFilter.kind.code = ENPlanWorkKind.CALCULATION;
				int plCalcArr[] = plDAO.getFilteredCodeArray(plCalcFilter, 0, -1);
				ENPlanWork planCalc = null;
				if (plCalcArr.length > 0) {
					planCalc = plDAO.getObject(plCalcArr[0]);
				}

	            // определим месячный план
				ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
				plFilter.elementRef.code = obj.element.code;
				plFilter.kind.code = ENPlanWorkKind.CURRENT;
				int plArr[] = plDAO.getFilteredCodeArray(plFilter, 0, -1);
				ENPlanWork planCurrent = null;
				if (plArr.length > 0) {
					planCurrent = plDAO.getObject(plArr[0]);
				}

	            // попробуем найти задание ПЛАН
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

					// сгенерим  задание ПЛАН из месячного
					int planNpwCode = planWorkLogic.closePlan(planCurrent.code);
					//    ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
					//    newPlanObj.dateGen
					// для задания ПЛАН создадим Наряд - Задание
					try {
						createWorkOrderToPlanServices(planNpwCode);
						// заполним finmoldata
						createFinMolToPlanServices(planNpwCode);
	                    // проверить если есть на плане машины если есть тогда сделаем заявку на машины
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

								// определим к какому транспортному подразделению относится автомобиль
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = obj.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("\n"
											+ "Не знайдено транспортне підприємство!");
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

			// net-4445 Создать механизм в услугах на сторону по созданю автоматического ордера по счетчику (если это услуга со счетчиком )
			// если тип контрагента не бюджет тогда при оплате привяжем счетчик сгенерим ордер на перемещение
			if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
					&& obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET
					&& !this.isGiveCounterOnBalanceByServicesObjectCode(obj.code)) {

				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
				fkOrderLogic.autoCreateFkorderMoveCounterForServices(obj);
			}


			/** если услуга связана с заявкой с сайта - запись в историю на сайте */
			int servicesConsumerCode = getServicesConsumerCode(svoCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {
				docFlowConnection = getDocFlowConnection();

				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FOURTH, svoCode);

					/** обновим информацию на заявке с сайта.. */
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
     * Перевод договора по услугам на сторону в статус "Работы выполнены"
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
                throw new SystemException("\n\nNET-4235 Змінювати вже проведені договори заборонено!");
            }

            ///////////
            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {

                // Если это физ. лицо либо юр. лицо небюджет, переводить в статус "Работы выполнены" можно только после оплаты,
                // т.е. статус договора должен быть "Сплачено попередній рахунок"
    			if (obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL
    					|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET
    					|| obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT
    					|| obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NOREZIDENT) {
    				if (obj.contractStatusRef.code != ENServicesContractStatus.PREPAID
    						&& obj.contractTypeRef.code != ENServicesContractType.OKSN) {

    					/*SUPP-55189 Если договор безоплатный то оплата не надо и можно переводить в статусе подписанный*/
                    	/*SUPP-55401 Если каким-то образом безоплатный договор стал сплаченным то и его даем переводить в работы завершены*/
                    	if (!((obj.contractStatusRef.code == ENServicesContractStatus.SIGNED
                    			|| obj.contractStatusRef.code == ENServicesContractStatus.PAID)&& obj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY)) {
                    		throw new SystemException("\n\nNET-4235 Договір повинен мати статус \"Сплачено попередній рахунок\"!");
    					}
    				}
    			}
                // Если это юр. лицо бюджет, переводить в статус "Работы выполнены" можно, не дожидаясь оплаты,
                // т.е. статус договора должен быть "Подписанный" (или "Сплачено попередній рахунок")
                else if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                {
                    if ((obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                     obj.contractStatusRef.code != ENServicesContractStatus.PREPAID) && obj.contractTypeRef.code != ENServicesContractType.OKSN)
                    {
                        throw new SystemException("\n\nNET-4235 Договір повинен мати статус \"Підписаний\" або \"Сплачено попередній рахунок\"!");
                    }
                }
                else
                {
                    throw new SystemException("Невідомий тип контрагенту!");
                }

            } else {

            	if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET)
                {

                    if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                    	obj.contractStatusRef.code != ENServicesContractStatus.PAID)
                    {
                        throw new SystemException("\n\nNET-4235 Договір повинен мати статус \"Підписаний\" або \"Сплачений\"!");
                    }

                } else {

                	if (obj.contractStatusRef.code != ENServicesContractStatus.PAID)
                    {
                    	throw new SystemException("\n\nNET-4235 Договір повинен мати статус \"Сплачений\"!");
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
                    throw new SystemException("\n\nNET-4235 Завдання-Факт з кодом " + planArr[i] + " не включено до акту!");
                }
            }


            ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(connection, userProfile);

            // SUPP-4100 проверка при переводе договора в статус "Роботи виконані"
            // что бы были внесены суммы по предоплате во вкладке "Фактичні оплати замовником" (кроме бюджетных организаций и безоплатных договоров )
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
                                + "\n \n Необхідно занести попередню оплату(Вкладка \" Фактичні оплати \") !!!");
                    }
                    // какие то предоплаты вытянули - проверим что были внесены оплаты не 0 )))
                    BigDecimal summPrepay = new BigDecimal(0);
                    for (int i = 0; i < paymentArr.length; i++) {
                        ENPayment2SO paymentSoObj = paymentSoDAO.getObject(paymentArr[i]);
                        summPrepay = summPrepay.add(paymentSoObj.sumTotal);
                    }
                    if (summPrepay.doubleValue() == 0 ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n Необхідно занести попередню оплату(Вкладка \" Фактичні оплати \") !!!");
                    }
				}
			}

            // Вызываем расчет фактических затрат (и перезаписываем сумму без НДС в объект)
            /**  NET-4422... +++ по услугам по замене счетчика при подписании акта
             *   формируетя ОЗ, расчитывается акт и фоктические затраты по договору.....
             *   проверяем статус акта и наличие ОЗ....
             *
             */

            int[] actArr = actDAO.getArrayOfCodesByENElement(obj.element, null, null);
            
            boolean replaceCounterServices = checkReplaceCounterServices(obj.element.code);
            
            /*SUPP-103689 Иногда калькуляции у которых не стоит признак replace_counter.
             * 	Для таких, дополнительно, будет проверяться наличие счетчика на плане (это делается ради формирования ОЗ на этапе перевода
             * договора в статус "Работы завершены"*/
            boolean isCounters = actArr.length > 0 && actLogic.checkInSCCounterByActCode(actArr[0], false) > 0;

            /** SUPP-31596... ;)  перед выполнением отчета по рентабельности вызывается типа расчет без изменения статуса договора....  */
            if (replaceCounterServices || isCounters) {

				if (actArr.length == 0) {
					throw new SystemException("\n\n"
							+ "Не знайдено видатковий акт для договору! Код договору: "+ obj.code);
				}

				if (actArr.length > 1) {
					throw new SystemException("\n\n"
							+ "Роботи по цьому договору повинні закриватись одним видатковим актом!\n"
							+ "Перевірьте правильність складання акту!!!\n"
							+ "Код договору: "+ obj.code);
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
                throw new SystemException("\n\nNET-4235 Помилка під час розрахунку суми за договором!");
            }


            ///// 30.10.13 SUPP-8502 SUPP-8757 Проверка рентабельности
            // Пока проверяем только для лицензионных услуг
            if (isLicensed(obj) && validateProfitability) {
                validateProfitability(obj);
            }
            /////

            /**
             *  SUPP-12236...
             *  расчет фактически затрат без изменения статуса договора
             */
            if (!notFinishWorks) {
                // Меняем статус на "Работы выполнены"
                obj.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
                objDAO.save(obj);


                /** если услуга связана с заявкой с сайта - запись в историю на сайте */
    			int servicesConsumerCode = getServicesConsumerCode(objCode);
    			if (servicesConsumerCode != Integer.MIN_VALUE) {

    				docFlowConnection = getDocFlowConnection();
    				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

    				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
    				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

    				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

    					// Лезем на сайт только при вызове с рабочего сервака!!! 
    					String ipAddres = Tools.getInetAddress();
    					if (ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
    						/** 17.03.2020... для бюджета - Ожидает конечной оплаты */
            				if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
            				} else {

                				/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
                				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
                					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
                				} else {
                					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, objCode);
                				}
            				}


            				/** сохранение дополнительной информации для онлайн заявки */
            				ENServicesObject sObject = objDAO.getObjectNoSegr(obj.code);

            		    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
            		    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

            				BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
            						.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));


            				/** topay - окончательная сумма оплаты по договору (после перевода в статус "Работы выполнены") */
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


    				/** отправка СМС  */
    				String message = "";

					/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
    				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
    					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
    							+ "Zaydit do personalnogo kabinetu dlya otrymannya ostatochnogo rozrahunku.";
    				} else {
    					message = "Za Vashoyu zayavkoyu N: " + servicesConsumer.numberGen + " zaversheno roboty. "
    							+ "Dyakuyemo, shcho skorystalysya poslugamy KhersonOblEnergo.";
    				}

    				docFlowLogic.sendSmsConsumer(servicesConsumerCode, message);

    			}


                /** !!! если указан признак повторного подключения и есть код лицевого счета
                 *
                 *  подключит ТУ в биллинге....
                 *  завершить пакет в DocFlow....
                 */
                ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
                Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
                if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

                	/** не подключаем, если услуга по замене счетчика */
                	if (!checkReplaceCounterServices(obj.element.code)) {
                		 if (obj.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
                                 && obj.personalAccountCode != Integer.MIN_VALUE) {

                             boolean workConnections = checkWorks(obj.code);

                             if (workConnections && obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {
                                 String commentGen = "Договір №=" + obj.contractNumberServices +
                                         ", від " + new SimpleDateFormat("dd.MM.yyyy").format(obj.contractDateServices).toString();
                                 connectedTY(obj.personalAccountCode, obj.department.code, getFactMaxDate(obj), commentGen);
                             }
                         }
                	}

                    /*Закрывается договор в DocFlow*/
                    finishServicesObjectInDocFlow(obj);
                }


                /**
    			 *  NET-4406... 30.09.2014 +++ регистрация заявлений бытовых потребителей на услуги....
    			 *  если договор связан з Заявлением, завершаем движение в DocFlow...
    			 *
    			 */

    			updateDocMovementStatusByServicesConsumer(obj.code, true);


    			/** NET-4592... 27.05.2020... +++ для услуг на сторону, отправка счета при наличии e-mail... */
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
	 * SUPP-107222 Перевод договора в статус "Роботи виконані" со всей сопутствующей логикой для уже проведенных
	 * договоров (попадаются договора по бюджетникам в статусе "Сплачені", которые провелись при проведении
	 * расходого акта, и перевести в "Роботи виконані" стандартным методом уже нет возможности)
	 *
	 * @param objCode - код договора ({@link com.ksoe.energynet.valueobject.ENServicesObject})
	 */
	public void finishWorksForServicesObjectInFK(int objCode) {
		if (objCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код договору!");
		}

		Connection authConn = null;

		try {
	        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
	        ENServicesObject obj = objDAO.getObject(objCode);

	        if (obj.contractStatusRef.code == ENServicesContractStatus.COMPLETED) {
	        	throw new SystemException("\n\nДоговір з кодом " + objCode + " вже знаходиться в статусі \"Роботи виконані\"!");
	        }

            // Меняем статус на "Работы выполнены"
            obj.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
            objDAO.save(obj);

            /** если услуга связана с заявкой с сайта - запись в историю на сайте */
			int servicesConsumerCode = getServicesConsumerCode(objCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					// Лезем на сайт только при вызове с рабочего сервака!!! 
					String ipAddres = Tools.getInetAddress();
					if (ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
						/** 17.03.2020... для бюджета - Ожидает конечной оплаты */
        				if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
        					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
        				} else {

            				/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
            				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.NINTH, objCode);
            				} else {
            					docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, objCode);
            				}
        				}


        				/** сохранение дополнительной информации для онлайн заявки */
        				ENServicesObject sObject = objDAO.getObjectNoSegr(obj.code);

        		    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
        		    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, sObject.contractDate);

        				BigDecimal contractServicesSumma = sObject.contractServicesSumma.add(sObject.contractServicesSumma
        						.multiply(nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP));


        				/** topay - окончательная сумма оплаты по договору (после перевода в статус "Работы выполнены") */
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

				/** отправка СМС  */
				String message = "";

				/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
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

            /** !!! если указан признак повторного подключения и есть код лицевого счета
             *
             *  подключит ТУ в биллинге....
             *  завершить пакет в DocFlow....
             */
            ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
            Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
            if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {

            	/** не подключаем, если услуга по замене счетчика */
            	if (!checkReplaceCounterServices(obj.element.code)) {
            		 if (obj.reconnectionTU == ENConsts.SERVICESOBJECT_RECONNECTIONTU
                             && obj.personalAccountCode != Integer.MIN_VALUE) {

                         boolean workConnections = checkWorks(obj.code);

                         if (workConnections && obj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL) {
                             String commentGen = "Договір №=" + obj.contractNumberServices +
                                     ", від " + new SimpleDateFormat("dd.MM.yyyy").format(obj.contractDateServices).toString();
                             connectedTY(obj.personalAccountCode, obj.department.code, getFactMaxDate(obj), commentGen);
                         }
                     }
            	}

                /*Закрывается договор в DocFlow*/
                finishServicesObjectInDocFlow(obj);
            }


            /**
			 *  NET-4406... 30.09.2014 +++ регистрация заявлений бытовых потребителей на услуги....
			 *  если договор связан з Заявлением, завершаем движение в DocFlow...
			 *
			 */

			updateDocMovementStatusByServicesConsumer(obj.code, true);


			/** NET-4592... 27.05.2020... +++ для услуг на сторону, отправка счета при наличии e-mail... */
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
     *  подключить ТУ в биллинге
     *
     *  @param personalAccountCode - код лицевого счета
     *  @param departmentCode - код подразделения
     *  @param executeWorkDate - дата выполнения работ
     *  @param commentGen - комментарий
     *
     */
    public void connectedTY(int personalAccountCode, int departmentCode,
            Date executeWorkDate, String commentGen) {
        try {
            DepartmentLogic depLogic = new DepartmentLogic(connection, userProfile);

            BillingServerData serverData = depLogic.getServerDataByDepartmentCode(departmentCode);

            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
                throw new SystemException("\n \n"
                        + "Помилка при визначенні РЕМ для особового рахунку!!!");
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
			throw new SystemException("\n \n" + "Нет связи с биллингом...");
		} catch (NamingException ne) {
			throw new SystemException("\n \n" + "Нет связи с биллингом...");
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
                        + "\n \n Для договорів на приєднання цей статус не використовується!!!");
            }

            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, authConn);
			Config useNetServices = configDAO.getConfigByName(Config.ENERGY_USES_NET_SERVICES);
			if (useNetServices.value.equals(Config.ENERGY_USES_NET_SERVICES_YES)) {
				if (! isDocFlowLifeCycleStartsWithSigning(obj)) {
                    // SUPP-10624
                    // Сюда могут заходить договора со статусом "Роботи виконані", такие не надо вставлять в DocFlow
					if (obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
						obj.dfPackCode = createDocFlowPack(obj);

						// NET-4560 - расчет граничной даты выполнения работ
						calculationBoundaryDateWork(obj);
						// !!перечитаем EnServicesObject т.к при расчете граниной даты проапдетили данные
						obj = objDAO.getObject(obj.code);
					}
				}
			}


            if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION)
            {
                if (isTKCalcKindNew(svoCode) && obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
                    if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED &&
                    	obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
                        throw new SystemException("\n\nСплатити рахунок для Юр. осіб (бюджет) можливо тільки на підписаному договорі або договорі " +
                    	                          "зі статусом \"Роботи виконані\", код договору = " + svoCode);
                    }
                } else if (obj.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
                    throw new SystemException("\n Сплатити рахунок можливо тільки на підписаному договорі, код договору = " + svoCode);
                }
            }
            else if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
            {
                ///// 15.05.13 NET-4235 Разрешено переводить в статус "Оплаченный" только договора со статусом "Работы выполнены"!
                if (obj.contractStatusRef.code != ENServicesContractStatus.COMPLETED)
                {
                    throw new SystemException("\n Сплатити рахунок можливо тільки на договорі зі статусом \"Роботи виконані\", код договору = " + svoCode);
                }
                /////
            }
            else
            {
                throw new SystemException("\n\nNET-4235 Невідомий тип розрахунку для договору! Код договору: " + svoCode);
            }

            ENPayment2SODAO paymentSoDAO = new ENPayment2SODAO(connection, userProfile);
            ENServicesFactCalcDAO factDAO = new ENServicesFactCalcDAO(connection, userProfile);
            // SUPP-4100 проверка при окончательной оплате счета по новой методике
            // что бы  суммы по предоплате и окончательном расчете во вкладке "Фактичні оплати замовником" была не меньше чем общая сумма в акте приема передедачи  (кроме безоплатных договоров )
			if (obj.isNoPay != ENConsts.ENSERVICES_OBJECT_ISNOPAY) {
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = obj.code;
                    // учитываем предоплаты и окончательные оплаты по договору
                    paymentSoFilter.conditionSQL = " ENPAYMENT2SO.paymenttyperefcode in ( " + ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT +" , "+ ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT+ ")";

                    // SUPP-4214 после проведения акта-выполненных работ могут оплачиваться договора
                    //   if (obj.statusRef.code == ENServicesObjectStatus.CLOSED)
                    //    {
                    //    throw new SystemException("Змінювати вже проведені договори заборонено!");
                    //    }
                    int[] paymentArr = paymentSoDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

                    if (paymentArr.length == 0 ) {
                        throw new SystemException("\n SUPP-4100..."
                                + "\n \n Необхідно занести оплати по договору (Вкладка \" Фактичні оплати \") !!!");
                    }
                    // вытянули  оплаты - проверим что были они были больше или равны сумме по акту приема передач иначе посылаем )))
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
                                + "\n \n Фактична оплата по договору "+ summPay  +"(грн. з ПДВ) меньша ніж Остаточна сума по договору "+ factTotalSum +"(грн. з ПДВ) (Вкладка \" Фактичні оплати \") !!!");
					}
				}
			}

            obj.contractStatusRef.code = ENServicesContractStatus.PAID;
            objDAO.save(obj);


            /* для реализации это не надо!!! */
            if (obj.contractKindRef.code != ENServicesContractKind.SALE && obj.statusRef.code != ENServicesObjectStatus.CLOSED) {

                //Создание виртуального лицевого счёта в Billing-е
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

						//Виртуальные счета в Billing-е должны создаваться для всех абонентов Стандартного Присоединения
						//и для абонентов бытового сектора Нестандартного Присоединения (жилые дома)
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

							//Считывание кода РЭС-а из сущности, отвечающей за реализацию ТУ
							if (tcsObj.element != null) {
								if (tcsObj.element.renRef != null) {
									if (tcsObj.element.renRef.code != Integer.MIN_VALUE) {
										wfrpObj.rencode = tcsObj.element.renRef.code;
									}
								}
							}
							//Если код РЭС-а пустой - считывание из сущности, отвечающей за подготовку ТУ
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
							wfrpObj.iscounterinst = 1; // По умолчанию счётчик поступает по разнарядке ОРТУ
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
										// Добавление пакета подсистемы ПРИСОЕДИНЕНИЕ с 01.03.2013 комплекса EnergyWorkFlow
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

										// Если код РЭС-а соответствует коду ХерсонОблЭнерго - считывание из пакета
										if (wfrpObj.rencode == 0 || wfrpObj.rencode == Integer.MIN_VALUE) {

											wfrpObj.rencode = packCN.id_ren;
											switch (packCN.id_ren) {
											case 1001: // ХОЭ
											{
												wfrpObj.rencode = 0; // ХОЭ
												break;
											}
											case 1: // Белозёрский участок
											{
												wfrpObj.rencode = 9; // ХГЭС
												break;
											}
											case 11: // В.Рогачикский участок
											{
												wfrpObj.rencode = 10; // В.Лепетихский РЭС
												break;
											}
											case 13: // Горностаевский участок
											{
												wfrpObj.rencode = 16; // Каховский РЭС
												break;
											}
											case 15: // Каланчакский участок
											{
												wfrpObj.rencode = 20; // Чаплынский РЭС
												break;
											}
											default: {
												wfrpObj.rencode = packCN.id_ren;
												break;
											}
											}
										}

									} catch (DatasourceConnectException e) {
										throw new SystemException("Нет связи с EnergyWorkFlow ...", e);
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

                /* ЕСЛИ КОНТРАГЕНТ НЕ ЮР БЮДЖЕТ
                * и по договору еще нету задания план
                * и работы вревенные резервируемые
                * и разрешено это делать для РЕС ов
                * есть уже сформированый месячный план
                * ТОГДА СГЕНЕРИТЬ ЗАДАНИЕ ПЛАН И НАРЯД ЗАДАНИЕ и заявку на транспорт  ПЫТАЕМСЯ СДЕЛАТЬ ПРИ оплате ДОГОВОРА   */

                // определим план кошторис
				ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter plCalcFilter = new ENPlanWorkFilter();
				plCalcFilter.elementRef.code = obj.element.code;
				plCalcFilter.kind.code = ENPlanWorkKind.CALCULATION;
				int plCalcArr[] = plDAO.getFilteredCodeArray(plCalcFilter, 0, -1);
				ENPlanWork planCalc = null;
				if (plCalcArr.length > 0) {
					planCalc = plDAO.getObject(plCalcArr[0]);
				}

                // определим месячный план
				ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
				plFilter.elementRef.code = obj.element.code;
				plFilter.kind.code = ENPlanWorkKind.CURRENT;
				int plArr[] = plDAO.getFilteredCodeArray(plFilter, 0, -1);
				ENPlanWork planCurrent = null;
				if (plArr.length > 0) {
					planCurrent = plDAO.getObject(plArr[0]);
				}

                // попробуем найти задание ПЛАН
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

					// сгенерим  задание ПЛАН из месячного
                    int planNpwCode = planWorkLogic.closePlan(planCurrent.code);
                    // ENPlanWork newPlanObj = plDAO.getObject(newPlanCode);
                    // newPlanObj.dateGen
                    // для задания ПЛАН создадим Наряд - Задание
					try {
						createWorkOrderToPlanServices(planNpwCode);
						// заполним finmoldata
						createFinMolToPlanServices(planNpwCode);
						// проверить если есть на плане машины если есть тогда сделаем заявку на машины
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

								// определим к какому транспортному подразделению относится автомобиль
								ENTransportDep2DepDAO td2tdDAO = new ENTransportDep2DepDAO(connection, userProfile);
								ENTransportDep2DepFilter td2tdFilter = new ENTransportDep2DepFilter();
								td2tdFilter.department.code = obj.department.code;
								ENTransportDep2DepShortList td2tdList = td2tdDAO.getScrollableFilteredList(td2tdFilter, 0, -1);
								if (td2tdList.totalCount <= 0) {
									throw new SystemException("Не знайдено транспортне підприємство!");
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


            // SUPP-4588 - проверить при оплате договора если договор расчитывается по старой методике тогда
            // оплаты должны быть больше или равны сумме по кошторису
            /** 10.07.2013 +++ для реализации это не надо!!! */
            /** SUPP-5137... 11.07.2013 +++ проверка нужна только для услуг !!! */

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
                        throw new SystemException("Не знайдено розрахунок для кошторису! (Код об'єкта: " + obj.code + ")");
                    }

                    if (calcList.totalCount > 1)
                    {
                        throw new SystemException("Розрахунків для кошторису більше одного! (Код об'єкта: " + obj.code + ")");
                    }

					BigDecimal totalSum = calcList.get(0).totalCost; // сумма по договору с НДС

					// выберем сумму оплаты по договору с НДС
					ENPayment2SODAO paymentDAO = new ENPayment2SODAO(connection, userProfile);
					ENPayment2SOFilter paymentSoFilter = new ENPayment2SOFilter();
					paymentSoFilter.servicesObjectRef.code = obj.code;

					int[] paymentArr = paymentDAO.getFilteredCodeArray(paymentSoFilter, 0, -1);

					BigDecimal summPayment = new BigDecimal(0); // сумма с НДС
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
									+ "Неможливо сплатити договір. Сума фактичних оплат ("
									+ summPayment
									+ " грн.) менша за суму згідно кошторису ("
									+ totalSum + " грн.) !!! ");
						}
					}
                }
            }

            // 21.07.2018 Скопировано из метода prepaid, т.к. он теперь не будет вызываться (для новых договоров)
			// net-4445 Создать механизм в услугах на сторону по созданю автоматического ордера по счетчику (если это услуга со счетчиком )
			// если тип контрагента не бюджет тогда при оплате привяжем счетчик сгенерим ордер на перемещение
            if (isTKCalcKindNew(svoCode)) {

                if (obj.contractKindRef.code == ENServicesContractKind.SERVICES
    					&& obj.contragentTypeRef.code != ENServicesContragentType.JURIDICAL_BUDGET) {

    				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
    				fkOrderLogic.autoCreateFkorderMoveCounterForServices(obj);
    			}

            }


			/** если услуга связана с заявкой с сайта - запись в историю на сайте */
			int servicesConsumerCode = getServicesConsumerCode(svoCode);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				docFlowConnection = getDocFlowConnection();
				DocFlowLogic docFlowLogic = new DocFlowLogic(docFlowConnection, userProfile);

				/** обновим информацию на заявке с сайта.. */
				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				if (servicesConsumer.docFormRef.code == DFDocForm.DF_DOC_FORM_SITE) {

					/** 17.03.2020... для бюджета - Выполнена */
					if (obj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
						docFlowLogic.addSiteHistory(servicesConsumerCode, ApplicationStatus.FIFTH, svoCode);
					} else {

						/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
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



				/** NET-4564... 12.12.2019...  +++ для договоров с типом расчета "по факту" */
				if (obj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {
					String message = "Za Vashoyu zayavkoyu N:" + servicesConsumer.numberGen + " zaversheno roboty. "
							+ "Dyakuyemo, shcho skorystalysya poslugamy KhersonOblEnergo.";

					/** отправка СМС  */
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
						+ "Невідомий вид договору!!!");
			}

	        /**
	         *   NET-3971
	         *   22.12.2012 +++ проверка доверенности
	         *   SUPP-4358
	         *   11.06.2013 +++ изменено до 100
	         *
	         *   SUPP-70982... +++ немного отличались проверка на add и save....
	         */
			if (servicesObject.contractServicesPower != null && servicesObject.warrantRef != null
					&& servicesObject.warrantRef.code != Integer.MIN_VALUE) {

				ENWarrant warrant = warrantDAO.getObject(servicesObject.warrantRef.code);

				/** SUPP-5130... 11.07.2013 +++ если мощность в договоре превышает граничную мощность в доверенности */
				if (servicesObject.contractServicesPower.doubleValue() > warrant.power) {
					throw new SystemException("\n"
							+ "\n Довіреність не відповідає договору!!!"
							+ "\n Оберіть довіреність відповідно договору!!!");
				}
			}


			servicesObject.dateEdit = new Date();
			servicesObject.userGen = userProfile.userName;

			ENElement e = new ENElement();
			e.typeRef.code = ENElementType.SERVICES_OBJECT;

			// значит только по ИН-элементу !!! а он вааще нужен???
			// это пошли ХИТРЫЕ елементы ...
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

			/** SUPP-74840... +++ для договоров на реализацию ТМЦ проверка калькуляций невозможна... их просто нет... */
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

				throw new SystemException("\n\nНе знайдено жодного пункту кошторису!");
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
	 *	Изменение метода формирования доходного акта
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
                            + " Заборонено додавати калькуляції з різними методами розрахунку !!! ");
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
				throw new SystemException("Для договора - " + so.contractNumberServices + " не вказано " + soValType.name);
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
	 *	возврашает номер и  дату договора по присоединению по акту выполненных работ
	 *
	 *	@param actCode - код акта
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
	 * @param ignoreDocDate - если = true, исх. документ регистрируется текущей физической датой, иначе - датой docDate
	 * @return
	 * @throws PersistenceException
	 */
	public int createDFDocByENServicesObject(int servicesObjectCode, int dfDocType, 
                        String docName, String docNum, Date docDate, int dfDepartmentCode, 
                        String customerAddress, String customerName, String customerPostCode,
			boolean ignoreDocDate) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт договору!");
		}

		if (dfDocType == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий тип документу!");
		}

		ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject servicesObject = servicesObjectDAO.getObjectNoSegr(servicesObjectCode);

		if (servicesObject == null) {
			throw new SystemException("\n\nНе знайдено договір з кодом " + servicesObjectCode + " !");
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
	 * @param contragentName            - Замовник
	 * @param contragentAddress         - Адреса замовника
	 * @param contragentPhoneNumber     - Номер телефону замовника
	 * @param postCode                  - Поштовий індекс
	 * @param departmentCode            - Підрозділи
	 * @param dfDocType
	 * @param docName
	 * @param docNum
	 * @param docDate
	 * @param dfDepartmentCode
	 * @param customerAddress
	 * @param ignoreDocDate - если = true, исх. документ регистрируется текущей физической датой, иначе - датой docDate
	 * @return
	 */
	public int createDFDoc(String contragentName, String contragentAddress, String contragentPhoneNumber,
                           String postCode, int departmentCode, int dfDocType, String docName,
                           String docNum, Date docDate, int dfDepartmentCode, String customerAddress, boolean ignoreDocDate) {
		// Пока создаем только исходящие письма
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
	    			throw new SystemException("\n\nНе вдалося створити вихідний документ!");
	    		}

	    		docOutbox = docOutboxController.getObject(docOutboxCode);
	    		if (docOutbox == null) {
	    			throw new SystemException("\n\nНе знайдено вихідний документ з кодом " + docOutboxCode + " !");
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт договору!");
		}

		if (dfDocCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код документу!");
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
			throw new SystemException("\n\nНе заданий тип листа!");
		}

		if (sheet.code == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код листа!");
		}

		String attachmentDescription = sheetType.nameForDfDoc;
		String dateTimePart = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String fileName = sheetType.reportFileName + "_" + dateTimePart + "." + sheetType.reportType;
		String type = sheetType.reportType;

		EPReportRequestEx request = new EPReportRequestEx();
		request.funcName = sheetType.reportPath;
		request.argNames = new String[] {"sheetCode"};
		request.args = new String[] {String.valueOf(sheet.code)};

		/************************** ДОП. ПАРАМЕТРЫ **************************/
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
			throw new SystemException("\n\nНе заданий тип листа!");
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
	 * При добавлении нового письма убирает у последнего на данный момент письма признак "Последнее"
	 *
	 * @param sheet - новое письмо (которое добавляется)
	 * @throws PersistenceException
	 */
	public void updateLastSheet4SO(ENSheets4SO sheet) throws PersistenceException {
		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт договору!");
		}

		if (sheet.sheet4sotype == null || sheet.sheet4sotype.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий тип листа!");
		}

		ENSheets4SODAO sheetDAO = new ENSheets4SODAO(connection, userProfile);

		ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
		sheetFilter.servicesobject.code = sheet.servicesobject.code;
		sheetFilter.sheet4sotype.code = sheet.sheet4sotype.code;
		sheetFilter.isLast = ENConsts.YES;

		int[] sheetsArr = sheetDAO.getFilteredCodeArray(sheetFilter, 0, -1);

		if (sheetsArr.length > 1) {
			throw new SystemException("\n\nЗнайдено декілька листів з ознакою \"Останній\"!\n" +
					"Код договору: " + sheet.servicesobject.code + ", код типу листа: " + sheet.sheet4sotype.code);
		} else if (sheetsArr.length == 1) {
			ENSheets4SO lastSheet = sheetDAO.getObject(sheetsArr[0]);
			// Для писем об отводе земли проверяем хронологию
			if (sheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				if (sheet.dateGen.compareTo(lastSheet.dateGen) <= 0) {
					throw new SystemException("\n\nДата листа повинна бути більшою за дату попереднього листа!\n" +
							"Код попереднього листа: " + lastSheet.code + ", дата: " + new SimpleDateFormat("dd.MM.yyyy").format(lastSheet.dateGen));
				}

				// 20.07.2020 SUPP-93091 Для корректного расчета граничной даты выполнения работ по договору
				// кол-во дней отсрочки для письма считаем как разницу дат между двумя соседними письмами
				// (т.е. при написании нового письма пересчитываем кол-во дней отсрочки для предыдущего)
				/*
				 * Tools.getDaysDiff не всегда корректно отрабатывает - например, между 30.03.2020 и 20.03.2020
			     * возвращает 9 дней вместо 10, т.к. разница в часах 239 (а не 240) из-за перехода на летнее время
				lastSheet.dayscnt = (int) Tools.getDaysDiff(Tools.clearTimeOfDate(lastSheet.dateGen),
						                                    Tools.clearTimeOfDate(sheet.dateGen),
						                                    TimeUnit.DAYS);
			    */
				lastSheet.dayscnt = Tools.getDaysBetweenTwoDates(Tools.clearTimeOfDate(lastSheet.dateGen),
						                                         Tools.clearTimeOfDate(sheet.dateGen));
			}
			// У последнего на данный момент письма убираем признак "Последний"
			lastSheet.isLast = ENConsts.NO;
			sheetDAO.save(lastSheet);
		}
	}

	/**
	 * При удалении последнего письма находит предыдущее и устанавливает ему признак "Последнее"
	 *
	 * @param sheet - удаляемое письмо
	 * @throws PersistenceException
	 */
	public void updateIsLastForSheet4SO(ENSheets4SO sheet) throws PersistenceException {
		if (sheet.isLast != ENConsts.YES) {
			return;
		}

		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт договору!");
		}

		if (sheet.sheet4sotype == null || sheet.sheet4sotype.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий тип листа!");
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
			// Ставим признак "Последний"
			ENSheets4SO newLastSheet = sheetDAO.getObject(sheetsArr[0]);
			newLastSheet.isLast = ENConsts.YES;

			// 20.07.2020 SUPP-93091 Возвращаем последнему письму кол-во дней отсрочки по умолчанию
			if (newLastSheet.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				newLastSheet.dayscnt = getLandSheetDaysCount(newLastSheet);
			}

			sheetDAO.save(newLastSheet);
		}
	}

	public ENSheets4SOType getSheet4SOType(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\nНе заданий тип листа!");
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
			throw new IllegalArgumentException("\n\nНе заданий код вкладення, що змінюється!");
		}

		if (newAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код нового вкладення!");
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
				throw new SystemException("\n\nНе знайдено зв'язку вкладення з договором (код зв'язки: " + attachment2ServicesArr[0] + ")!");
			}

			attachment2Services.docAttachmentRef.code = newAttachmentCode;
			attachment2ServicesDAO.save(attachment2Services);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void updateENDocAttachmentForENSheet(int oldAttachmentCode, int newAttachmentCode) {
		if (oldAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код вкладення, що змінюється!");
		}

		if (newAttachmentCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код нового вкладення!");
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
				throw new SystemException("\n\nНе знайдено лист для договору (код листа: " + sheetsArr[0] + ")!");
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

		String contractText = String.format("№ %s від %s", servicesObject.contractNumberServices
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
			// Дата первого платежа будет равняться дате доп. реквизита "Початок надання послуги (перша сплата)"
			if(firstPayment.dateGen.compareTo(dateRegistry.dateVal) < 0) {
				throw new SystemException(String.format("Дата першої сплати за договором %s не повина бути меньше ніж дата реєстрації заяви "
						+ "(%s < %s)"
						, contractText, Tools.dateFormatDefault.format(firstPayment.dateGen), Tools.dateFormatDefault.format(dateRegistry.dateVal)));
			}
			serviceStart.dateVal = firstPayment.dateGen;
			hashMap.put(ENSOValuesType.SERVICE_START, serviceStart);

			// По логике расчета вторым счетом будет считаться счет, дата которого позже чем дата первой оплаты
			for(ENSOBillShort bill : billsList.list) {
				if(bill.dateGen.before(dateRegistry.dateVal)) {
					if(firstPayment.dateGen.compareTo(dateRegistry.dateVal) < 0) {
						throw new SystemException(String.format("Дата рахунку за договором %s не повина бути меньше ніж дата реєстрації заяви "
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

		// Расчет последнего 5го доп. реквизита, который не зависит от других и равен дате последнего
		// расходного акта с конкретным типом
		Date lastDateOfAct = this.getDateFinishWorksForStandardConnection(servicesObject);
		if(lastDateOfAct != null) {
			dateFinishWorks.dateVal = lastDateOfAct;
			hashMap.put(ENSOValuesType.DATE_FINISH_WORKS, dateFinishWorks);
		}


		return hashMap;
	}

	public void calculateENSOValuesTermsIfNeeded(int servicesObjectCode) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код договора з послуг на сторону!");
		}

		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);

		if (servicesObject == null) {
			throw new SystemException("\n\nНе знайдено договір з послуг на сторону з кодом " + servicesObjectCode + " !");
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

		// Договора у которых определена фактическая дата выполнения работ
		// переводятся в статус Работы завершены
		ENSOValues dateFinishWorks = calculatedDates.get(ENSOValuesType.DATE_FINISH_WORKS);
		if(dateFinishWorks != null && servicesObjectOld.contractStatusRef.code != ENServicesContractStatus.COMPLETED) {
			if(Arrays.asList(ENServicesContractStatus.SIGNED, ENServicesContractStatus.PAID
					, ENServicesContractStatus.PREPAID).contains(servicesObjectOld.contractStatusRef.code)) {
				servicesObjectOld.contractStatusRef.code = ENServicesContractStatus.COMPLETED;
				servicesObjectDao.save(servicesObjectOld);
			}
		}
		// Если был отменен акт и договор находился в статусе работы выполнены, то ему будет поставлен статус оплаченный
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
			// Акты связанные с планами где проставлены определенные коды РГК не должны учавствовать в расчете фактической даты выполненных работ.
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
	 * Возвратит пару - расчитанную дату предварительного завершения работ и срок в днях
	 *
	 * @param registryDate дата подачі реєстрації
	 * @param startDate початок надання послуги
	 * @param capacity потужність за договором
	 * @return попередня гранична дата виконання робіт
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
			throw new SystemException(String.format("Потужність за договором не може бути від'ємною.\n"
					+ "Неможливо визначити додатковий реквізит \"%s\"", valuesTypeLimitDate.name));
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
			throw new IllegalArgumentException("\n\nНе заданий код вкладення!");
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
			throw new IllegalArgumentException("\n\nНе заданий код вкладення!");
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
	 * Удаление зависимостей письма по договору в документообороте (документа, вложений и т.п.)
	 *
	 * @param sheet - письмо для договора ({@link ENSheets4SO})
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
	 * Получение номера стадии для письма об отводе земли (от номера зависит текст письма)
	 *
	 * @param sheet - письмо об отводе земли ({@link ENSheets4SO})
	 * @return номер стадии (1 - 5)
	 */
	public int getLandSheetStageNumber(ENSheets4SO sheet, boolean isException) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\nНе заданий тип листа!");
		}

		if (sheet.sheet4sotype.code != ENSheets4SOType.LAND_SHEET) {
			return Integer.MIN_VALUE;
		}

		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий договір для листа!");
		}

		ENSOValues soValue = getENSOValueForServicesObject(sheet.servicesobject.code, ENSOValuesType.LAND_SHEET_STAGE_NUMBER);
		if (soValue != null) {
			try {
				return Integer.valueOf(soValue.strVal);
			} catch (NumberFormatException e) {
				if (isException) {
					throw new SystemException("\n\nSUPP-88605 Некоректне значення для додаткового реквізиту \"Номер стадії відведення земельної ділянки\"!\n" +
							"Має бути числове значення від 1 до 5!");
				}
				return Integer.MIN_VALUE;
			}
		}

		return Integer.MIN_VALUE;
	}

	/**
	 * Получение количества дней отсрочки (периодичность) для письма об отводе земли
	 *
	 * @param sheet - письмо об отводе земли ({@link ENSheets4SO})
	 * @return количество дней отсрочки
	 */
	public int getLandSheetDaysCount(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа!");
		}

		if (sheet.sheet4sotype == null) {
			throw new IllegalArgumentException("\n\nНе заданий тип листа!");
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
				throw new SystemException("\n\nSUPP-88605 Некоректне значення налаштування " +
										  "\"Кількість днів подовження строку при написанні листів про відведення землі\"!");
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт договору!");
		}

		if (servicesObject.contragentTypeRef == null || servicesObject.contragentTypeRef.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий тип контрагента (Фіз. особа/Юр. особа!");
		}

		return (servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL ||
				servicesObject.contragentTypeRef.code == ENServicesContragentType.PHYSICAL_NOREZIDENT);
	}

	/**
	 * Метод для автоматического формирования писем об отводе земли
	 * (формирует письма, которые необходимо отправить ЗАВТРА).
	 * Также заранее формируются письма, отправка которых выпадает
	 * на выходные и праздничные дни (т.е., если завтра пятница, то
	 * будут сформированы также письма, которые по сроку должны быть
	 * отправлены в субботу и воскресенье)
	 *
	 * @return кол-во созданных писем
	 */
	public int generateNextLandSheets() {
		Date tomorrow = Tools.getTomorrowDate();
		return generateNextLandSheetsForDate(tomorrow);
	}

	/**
	 * Генерация писем, которые необходимо отправить СЕГОДНЯ
	 *
	 * @return кол-во созданных писем
	 */
	public int generateNextLandSheetsForToday() {
		return generateNextLandSheetsForDate(new Date());
	}

	/**
	 * Метод для автоматического формирования писем об отводе земли
	 * (формирует письма, которые необходимо отправить в заданную дату).
	 * Также заранее формируются письма, отправка которых выпадает
	 * на выходные и праздничные дни (т.е., если завтра пятница, то
	 * будут сформированы также письма, которые по сроку должны быть
	 * отправлены в субботу и воскресенье).
	 *
	 * Если вызвать метод с generationDateStart = текущей дате, то
	 * сгенерятся письма, которые должны быть отправлены сегодня
	 *
	 * @param generationDateStart - дата, на которую мы генерим письма (по умолчанию - завтрашний день)
	 * @return кол-во созданных писем
	 */
	public int generateNextLandSheetsForDate(Date generationDateStart) {
		mDaxLogic axLogic = new mDaxLogic(connection, userProfile);

		// Если generationDateStart - выходной, ничего не генерим
		// (все уже должно было быть сгенерено накануне)
		//Date tomorrow = Tools.getTomorrowDate();
		if (axLogic.isHoliday(generationDateStart)) {
			return 0;
		}

		List<Date> dates = new ArrayList<>();

		// Выше мы проверили, что generationDateStart не выходной, поэтому генерим на generationDateStart
		dates.add(generationDateStart);

		// Если следующий день после generationDateStart выходной, генерим на этот день
		// и на каждый следующий день, пока следующий день является выходным
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
	 * Метод для автоматического формирования писем об отводе земли
	 *
	 * @param newSheetPlanDate - дата, когда мы должны писать письмо по плану (по срокам)
	 * @param newSheetFactDate - дата фактической генерации письма (для писем, написание которых выпадает на выходной день,
	 *                           будет раньше, чем плановая)
	 *
	 * @return кол-во созданных писем
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
			throw new IllegalArgumentException("\n\nНе заданий код договору!");
		}

		try {
			ENSheets4SODAO sheetsDAO = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.servicesobject.code = servicesObjectCode;
			sheetFilter.sheet4sotype.code = ENSheets4SOType.LAND_SHEET;
			sheetFilter.isLast = ENConsts.YES;

			int[] sheetsArr = sheetsDAO.getFilteredCodeArray(sheetFilter, 0, -1);

			if (sheetsArr.length == 0) {
				throw new SystemException("\n\nНе знайдено жодного листа про відведення землі для договору з кодом " + servicesObjectCode + " !");
			} else if (sheetsArr.length > 1) {
				throw new SystemException("\n\nЗнайдено декілька (" + sheetsArr.length +
						") листів про відведення землі з ознакою \"Останній\" для договору з кодом " + servicesObjectCode + " !");
			}

			return sheetsArr[0];
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * Метод для очистки значения "Дата следующего письма" на последнем письме
	 *
	 * @param servicesObjectCode - код договора ({@link ENServicesObject})
	 */
	public void clearNextSheetDate(int servicesObjectCode) {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код договору!");
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа для договору!");
		}

		ENSheets4SO newSheet = new ENSheets4SO();
		newSheet.name = previousSheet.name;
		newSheet.dateGen = newSheetDate;
		newSheet.userGen = previousSheet.userGen;
		// Будем брать всегда из настроек, а не из предыдущего письма
		newSheet.dayscnt = getLandSheetDaysCount(previousSheet); //previousSheet.dayscnt;
		newSheet.recipient = previousSheet.recipient;
		newSheet.recipientAddress = previousSheet.recipientAddress;

		newSheet.postCode = getSheetPostCode(previousSheet.servicesobject.code, previousSheet.postCode);

		/** SUPP-96455... +++ для писем об отводе земли подписанта берем из настроек... */
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
		newSheet.commentgen = "Згенеровано автоматично " + new SimpleDateFormat("dd.MM.yyyy").format(new Date());

		int newSheetCode = addENSheets4SO(newSheet,  ignoreDocDate, null);

		updateUserGenForAutogeneratedENSheets4SO(newSheetCode);
	}

	public String getSheetPostCode(int servicesobjectCode, String previousSheetPostCode) {
		// SUPP-108499 Добавление индекса в случае наличия доп реквезита
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
	 * определение подписанта для сопроводительного письма
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
                throw new SystemException("\n\nНемає зв'язку з документом!");
            }


            // тут в объект запишется код созданного вложения,
            // поэтому нужно после этого его пересохранить
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

            //Ставим штам для всех листов кроме листа "Лист про землевпорядну документацію"
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
	        	throw new SystemException("\n\nНе вказано тип листа!");
	        }

	        boolean isDistributionList = false;
	        if (object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_STATEMENT_ACCESSION
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_POINT_PASSPORT
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT
                    || object.sheet4sotype.code == ENSheets4SOType.DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR) {
                isDistributionList = true;
            }

 	        if(isDistributionList && object.wfPackCode == Integer.MIN_VALUE)
                    throw new SystemException("\n\nНе заданий код пакета!");


            if (!isDistributionList) {
                // Убираем у предыдущего письма признак "Последний" и ставим его тому, которое сейчас добавляем
                updateLastSheet4SO(object);
            }

            object.isLast = ENConsts.YES;

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, object.dayscnt, false);
				// Устанавливаем дату следующего письма
				object.nextSheetDate = Tools.addDays(object.dateGen, object.dayscnt);
	        }

			ENSheets4SOType sheetType = getSheet4SOType(object);
            int dfDocCode = Integer.MIN_VALUE;

            if (isDistributionList) {
                dfDocCode = createDFDocByWFPack(object.wfPackCode, DFDocType.OUTBOX,
                        sheetType.nameForDfDoc, sheetType.dfDocNumMask, object.dateGen, sheetType.dfDepartmentCode, object.recipientAddress, ignoreDocDate);
            } else {
            	String customerName = null;
            	// Для "Супровідного листа до розпорядників земельних ділянок"
            	// получателя берем не из договора, а из самого листа
            	// (т.к. у них получателем является, например, горсовет, а нем сам заказчик)
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

        	// Сохраняем пункты письма, если они есть
			if (items != null) {
				ENSheets4SOItemsDAO sheet4SOItemsDao = new ENSheets4SOItemsDAO(connection, userProfile);
				for (ENSheets4SOItems sheetItem : items) {
					sheetItem.sheet4soRef.code = object.code;
					sheet4SOItemsDao.add(sheetItem);
				}
			}

        	// тут в объект запишется код созданного вложения,
        	// поэтому нужно после этого его пересохранить
        	createAttachmentByENSheets4SO(object);
        	objectDAO.save(object);

            //Ставим штам для всех листов кроме листа "Лист про землевпорядну документацію"
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
				// Пересчет граничной даты выполнения работ
				// 20.07.2020 SUPP-93091 Нужно пересчитать полностью, потому что при вызове updateLastSheet4SO выше
	        	// изменяется кол-во дней отсрочки для предыдущего письма
	        	calculateENSOValuesTermsIfNeeded(object.servicesobject.code);
	        }

		    return object.code;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/* ENSheets4SO. Удалить */
	public void removeENSheets4SO(int code) {
		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
            ENSheets4SOItemsDAO itemsDAO = new ENSheets4SOItemsDAO(connection, userProfile);

			ENSheets4SO object = objectDAO.getObject(code);

	        if (object.sheet4sotype == null || object.sheet4sotype.code == Integer.MIN_VALUE) {
	        	throw new SystemException("\n\nНе вказано тип листа!");
	        }

			if (object.isLast != ENConsts.YES) {
				throw new SystemException("\n\nВидаляти можливо тільки останній лист заданого типу для договору! Цей лист не є останнім!");
			}

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
				calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, -object.dayscnt, false);
	        }

	        // Удаляем связку пакета WorkFlow с документом DocFlow, созданным для данного письма
	        removeWFPack2DFDocForENSheet4SO(object);

	        // Удаляем строки письма, если они есть
            ENSheets4SOItemsFilter itemFilter = new ENSheets4SOItemsFilter();
            itemFilter.sheet4soRef.code = object.code;
            int[] itmArr = itemsDAO.getFilteredCodeArray(itemFilter,0,-1);
            for (int i=0;itmArr.length>i;i++)
            {
                itemsDAO.remove(itmArr[i]);
            }

			objectDAO.remove(code);

	        // Удаляем (НЕ физически - меняем статус) связанный исходящий документ и вложения
	        removeDocFlowRelationsForENSheet(object);

			// Ставим признак "Последнее" предыдущему письму
			updateIsLastForSheet4SO(object);

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
	        	// Пересчет граничной даты выполнения работ
				// 20.07.2020 SUPP-93091 Нужно пересчитать полностью, потому что при вызове updateIsLastForSheet4SO выше
	        	// изменяется кол-во дней отсрочки для предыдущего письма
				calculateENSOValuesTermsIfNeeded(object.servicesobject.code);
	        }
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

   	/* ENSheets4SO. Изменить */
	public void saveENSheets4SO(ENSheets4SO object) {
		try {
			ENSheets4SODAO objectDAO = new ENSheets4SODAO(connection, userProfile);
		    object.userGen = userProfile.userName;
	        object.dateEdit = new Date();

	        if (object.sheet4sotype == null || object.sheet4sotype.code == Integer.MIN_VALUE) {
	        	throw new SystemException("Не вказан тип листа!");
	        }

	        ENSheets4SO oldObject = objectDAO.getObject(object.code);

	        if (object.sheet4sotype.code == ENSheets4SOType.LAND_SHEET) {
	        	if (oldObject.dayscnt != object.dayscnt ) {
	        		int delta = object.dayscnt - oldObject.dayscnt;
	        		calculateSOValuesDate(object.servicesobject.code, ENSOValuesType.LIMIT_DATE_CONTRACT_WORKS, delta, false);

					// Устанавливаем дату следующего письма
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
			throw new IllegalArgumentException("\n\nНе заданий код листа!");
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
	 * Пересчет дней отсрочки на письмах по земле для заданного договора на присоединение
	 *
	 * @param servicesObjectCode - код договора на присоединение
	 *
	 * @throws PersistenceException
	 */
	public void recalcENSheets4SODaysCount(int servicesObjectCode) throws PersistenceException {
		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код договору!");
		}

		ENSheets4SODAO sheetDao = new ENSheets4SODAO(connection, userProfile);

		ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
		sheetFilter.servicesobject.code = servicesObjectCode;
		sheetFilter.sheet4sotype.code = ENSheets4SOType.LAND_SHEET;
		sheetFilter.orderBySQL = "ENSHEETS4SO.DATEGEN, ENSHEETS4SO.CODE";

		int[] sheetCodes = sheetDao.getFilteredCodeArray(sheetFilter, 0, -1);

		// Пересчет нужен только для договоров, по которым больше одного письма
		if (sheetCodes.length <= 1) {
			return;
		}

		for (int i = 0; i < sheetCodes.length - 1; i++) {
			ENSheets4SO currentSheet = sheetDao.getObject(sheetCodes[i]);
			ENSheets4SO nextSheet = sheetDao.getObject(sheetCodes[i+1]);
			// 20.07.2020 SUPP-93091 Для корректного расчета граничной даты выполнения работ по договору
			// кол-во дней отсрочки для письма считаем как разницу дат между двумя соседними письмами
			// (т.е. при написании нового письма пересчитываем кол-во дней отсрочки для предыдущего)
			/*
			 * Tools.getDaysDiff не всегда корректно отрабатывает - например, между 30.03.2020 и 20.03.2020
			 * возвращает 9 дней вместо 10, т.к. разница в часах 239 (а не 240) из-за перехода на летнее время
			currentSheet.dayscnt = (int) Tools.getDaysDiff(Tools.clearTimeOfDate(currentSheet.dateGen),
					                                       Tools.clearTimeOfDate(nextSheet.dateGen),
					                                       TimeUnit.DAYS);
			*/
			currentSheet.dayscnt = Tools.getDaysBetweenTwoDates(Tools.clearTimeOfDate(currentSheet.dateGen),
                    											Tools.clearTimeOfDate(nextSheet.dateGen));
			sheetDao.save(currentSheet);
		}

		// Пересчитываем граничную дату выполнения работ
		calculateENSOValuesTermsIfNeeded(servicesObjectCode);
	}

	public void createWFPack2DFDocForENSheet4SO(ENSheets4SO sheet) {
		if (sheet == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа для договору!");
		}
		// Теоретически могут существовать письма без ссылки на документ - для них данная операция не нужна
		if (sheet.dfDocCode == Integer.MIN_VALUE) {
			//throw new IllegalArgumentException("\n\nНе заданий код документу на листі для договору!");
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
                throw new IllegalArgumentException("\n\nНе заданий код договору на листі!");
            }
        } else {
            if (sheet.wfPackCode <= 0) {
                throw new IllegalArgumentException("\n\nНе заданий код пакета!");
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
			pack2DFDoc.commentgen = "Додано автоматично після створення листа №" + sheet.numbergen;
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт листа для договору!");
		}
		// Теоретически могут существовать письма без ссылки на документ - для них данная операция не нужна
		if (sheet.dfDocCode == Integer.MIN_VALUE) {
			//throw new IllegalArgumentException("\n\nНе заданий код документу на листі для договору!");
			return;
		}
		if (sheet.servicesobject == null || sheet.servicesobject.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код договору на листі!");
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
            throw new IllegalArgumentException("\n\nНе заданий код пакета!");
        }
		if (dfDocCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код документа!");
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
				"Додано автоматично після створення документа з кодом " + dfDocCode);

			pack2DFDocController.add(pack2DFDoc);

		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int addENSheetForENActIncomeTechCond(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код договору про приєднання!");
		}

		try {
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			if (servicesObject == null) {
				throw new SystemException("\n\nНе знайдено договір про приєднання з кодом " + servicesObjectCode + " !");
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
				throw new SystemException("\n\nНе вдалося визначити замовника для договору про приєднання з кодом " +
						servicesObjectCode + " !");
			}
			if (newSheet.recipientAddress == null || newSheet.recipientAddress.trim().isEmpty()) {
				throw new SystemException("\n\nНе вдалося визначити адресу замовника для договору про приєднання з кодом " +
						servicesObjectCode + " !");
			}

			newSheet.sheet4sotype.code = ENSheets4SOType.NOTIFICATION_ACT;

			setSignerToSheets(newSheet, newSheet.sheet4sotype.code);
			newSheet.isWithSignature = 1;

			ENSheets4SOType sheetType = getSheet4SOType(newSheet);
			if (sheetType == null) {
				throw new SystemException("\n\nНе заданий тип листа!");
			}

			newSheet.name = sheetType.nameForDfDoc;
			newSheet.executorFio = sheetType.executorFio;
			newSheet.executorPhone = sheetType.executorPhone;
			newSheet.executorEmail = sheetType.executorEmail;

			newSheet.servicesobject.code = servicesObjectCode;

			newSheet.commentgen = "Згенеровано автоматично " + new SimpleDateFormat("dd.MM.yyyy").format(new Date());

			return addENSheets4SO(newSheet);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void removeENSheetForENActIncomeTechCond(int servicesObjectCode) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код договору про приєднання!");
		}
		try {
			ENSheets4SODAO sheetDao = new ENSheets4SODAO(connection, userProfile);
			ENSheets4SOFilter sheetFilter = new ENSheets4SOFilter();
			sheetFilter.servicesobject.code = servicesObjectCode;
			sheetFilter.sheet4sotype.code = ENSheets4SOType.NOTIFICATION_ACT;

			int[] sheetCodes = sheetDao.getFilteredCodeArray(sheetFilter, 0, -1);
			if (sheetCodes.length > 1) {
				throw new SystemException("\n\nДля договору з кодом " + servicesObjectCode +
						" знайдено декілька Супровідних листів до повідомлення про надання послуги з приєднання!");
			}

			if (sheetCodes.length == 1) {
				removeENSheets4SO(sheetCodes[0]);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * типа перерасчет при изменении км на черновом договоре
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

				/** для каждой последующей калькуляции расстояние (км) обнуляется... */
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
				
				// SUPP-106625 Чтобы убрать ошибку в количестве "кошторисов" для договора, ранее это действие выполнялось в блоке if
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
	 * проверка - является ли калькуляция каждой последующей...
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
	 * для онлайн услуг по юрикам проверка отношения к бюджету...
	 *
	 * @param servicesObject
	 */
	public void compareBudgetRelation(ENServicesObject servicesObject) {
		try {

			/** если услуга связана с заявкой с сайта */
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
								+ "Тип контрагента повинен бути \"Юр.особа (бюджет)\" або \"Юр.особа (не бюджет)\"!");
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт - точка обліку!");
		}

		if (recordPointByt.elementCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код елементу для точки обліку!");
		}

		if (recordPointByt.accountNumber == null || recordPointByt.accountNumber.trim().equals("")) {
			throw new IllegalArgumentException("\n\nНе заданий особовий рахунок для точки обліку! [elementCode = " +
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
			throw new IllegalArgumentException("\n\nНе заданий об'єкт - точка обліку!");
		}

		if (recordPointProm.elementCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе заданий код елементу для точки обліку!");
		}

		if (recordPointProm.accountNumber == null || recordPointProm.accountNumber.trim().equals("")) {
			throw new IllegalArgumentException("\n\nНе заданий особовий рахунок для точки обліку! [elementCode = " +
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
	 * update поля isRealized (CallCenter ->  table CCtower2jlc)
	 * CCtower2jlc - Связка контрагентов совмесного подвеса и опоры
	 *
	 * @param contractnumberservices 		- Номер договора услуг  (Договор оренди)
	 * @param isRealized  					- 0 - не реализовано, 1 - реализовано
	 */
	public void updateIsRealizedCCtower2jlc(int servicesObjectCode, int isRealized){
		try {

			callcenterConnection  = getCallcenterConnection();
			ENServicesObjectDAO enServicesObjectDAO = new ENServicesObjectDAO(connection, userProfile);
			//Связка контрагентов совмесного подвеса и опоры
			CCTower2JLCDAO ccTower2JLCDAO = new CCTower2JLCDAO(userProfile, callcenterConnection);

			ENServicesObject enServicesObject = enServicesObjectDAO.getObject(servicesObjectCode);

			if (enServicesObject == null)
				throw new SystemException("Договору за такими кодом ("+servicesObjectCode+") не існує");

			/* Тип договора на услуги - совместный подвес */
			if ((enServicesObject.contractTypeRef.code == ENServicesContractType.OKSN )
					/*Вид договора на услуги - договора на видачу условий(требований) к проектированию */
				&& (enServicesObject.contractKindRef.code == ENServicesContractKind.OKSN_TU)
						/*Статусы договоров услуг на сторону*/
				&& (enServicesObject.contractStatusRef.code == ENServicesContractStatus.SIGNED)
				/*Статус договора по услугам на сторону в Фин. Кол.*/
				&& (enServicesObject.statusRef.code == ENServicesObjectStatus.GOOD)){

				/*--------------------------------------------Update to CallCenter------------------------------------------------------------------*/

				CCTower2JLCFilter ccTower2JLCFilterTo = new CCTower2JLCFilter();
				ccTower2JLCFilterTo.contractNumberServices = enServicesObject.contractNumberServices;
				CCTower2JLCShortList ccTower2JLCShortList = ccTower2JLCDAO.getScrollableFilteredList(ccTower2JLCFilterTo,0,-1);

				if(ccTower2JLCShortList.size()>0)
					ccTower2JLCDAO.updateIsRealizedCCtower2jlc(enServicesObject.contractNumberServices,isRealized);

			}else{
				throw new SystemException("Тип договора по услугам на сторону, повинен бути - ОКСН\n"+
											"Вид договору на послуги на сторону, повинен бути - Договори на видачу умов (ОКСН)\n"+
											"Статус договору послуг на сторону, повинен бути - Підписаний\n"+
											"Статус договору послуг на сторону в Фін.Кол., повинен бути - Чорновий");
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
	 * Возвращает код договора на присоединение ({@link ENServicesObject}) по коду расходного акта
	 *
	 * @param actCode - код акта ({@link ENAct})
	 * @param isThrowExceptionIfNotExists - выкидывать ли исключение, если договор не найден ({@code true} - да)
	 *
	 * @return код договора на присоединение
	 *
	 * @throws PersistenceException
	 */
    public int getServicesObjectConnectionByActCode(int actCode, boolean isThrowExceptionIfNotExists) throws PersistenceException {
        if (actCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\nНе заданий код акту!");
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
        			throw new SystemException("\n\nДля акта з кодом " + actCode + " не знайдено договір про приєднання!");
        		} else {
        			return Integer.MIN_VALUE;
        		}
        	} else {
                throw new SystemException("\n\nДля акта з кодом " + actCode + " знайдено декілька (" + arr.length + ") договорів про приєднання!");
        	}
        }

        return arr[0];
    }

    /**
     * Получение пакета WorkFlow по коду расходного акта (для договоров на присоединение)
     *
     * @param actCode - код акта ({@link ENAct})
     *
     * @return пакет WorkFlow ({@link WFPack})
     */
	public WFPack getWFPackByActCode(int actCode) {
        if (actCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\nНе заданий код акту!");
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
				throw new SystemException(String.format("\n\nДля договору № %s має передаватися лічильник"
						+ ", але ордер на передачу від абонента не було знайдено.\n"
						+ "Необхідно занести відповідну інформацію на формі редагування договору у\n"
						+ "вкладці \"Лічильник, що передається\".", servicesObject.contractNumberServices));
			}
		}

		if (isGiveCounterOnBalanceByServicesObjectCode(servicesObject.code, ENGiveCounter.IS_GIVE)) {
			ENGiveCounterDAO giveCounterDao = new ENGiveCounterDAO(connection, userProfile);
			ENGiveCounterFilter giveCounterFilter = new ENGiveCounterFilter();
			giveCounterFilter.servicesObjectRef.code = servicesObject.code;

			int[] giveCounterCodes = giveCounterDao.getFilteredCodeArray(giveCounterFilter, 0, -1);

			if (giveCounterCodes.length == 0) {
				throw new SystemException(String.format("\n\nДля договору № %s має передаватися лічильник"
						+ ", але даних про лічильник не знайдено.\n"
						+ "Необхідно занести відповідну інформацію на формі редагування договору у\n"
						+ "вкладці \"Лічильник, що передається\".", servicesObject.contractNumberServices));
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
     * @param ignoreDocDate - если = true, исх. документ регистрируется текущей физической датой, иначе - датой docDate
     * @return
     */
    public int createDFDocByWFPack(int wfPackCode, int dfDocType,
                                             String docName, String docNum, Date docDate, int dfDepartmentCode, String customerAddress,
                                             boolean ignoreDocDate) {
        if (wfPackCode == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\nНе заданий wfPackCode!");
        }

        if (dfDocType == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("\n\nНе заданий тип документу!");
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
                throw new SystemException("\n\nНе знайдено пакет з кодом " + wfPackCode + " !");
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
            // если уже есть код вложения, то заменим его
            if (oldDFDocAttachmentCode != Integer.MIN_VALUE) {
            	dfDocAttachment.parentRef.code = oldDFDocAttachmentCode;
			}
            int dfDocAttachmentCode = dfDocAttachmentController.add(dfDocAttachment, report, fileName);
            if (dfDocAttachmentCode == Integer.MIN_VALUE) {
                throw new SystemException("\n\nНе вдалося додати вкладення!");
            }
            dfDocAttachment = dfDocAttachmentController.getObject(dfDocAttachmentCode);
            if (dfDocAttachment == null) {
                throw new SystemException("\n\nНе знайдено вкладення з кодом " + dfDocAttachmentCode + " !");
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
     *  ссылка на вложение документов для DFDocAttachment
     *
     *  @param enDocAttachment - Вкладення
     *  @param dfDocCode - Код DFDoc
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
     * наложение штампа исходящего на вложения другого документа
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
     * Получить PostCode из DFDoc
     *
      * @param wfPackCode   -   Код пакета
     * @return
     */
    public String getDFDocPostCodeByWFPackCode(int wfPackCode){
        if (wfPackCode == Integer.MIN_VALUE) {
            throw new SystemException("Не вказаний код пакету!");
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
	 * Изменить доверенность на не черновом договоре
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
     * Додати звязок з послугу на строну до приєднання
     *
     * @param soElementCalculationCode      -  Код елемент: послуги на сторону
     * @param soElementConnectionCode       -  Код елемент: приєднання
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

            checkSOByElementCode(arrCalculation.length,soElementCalculationCode,"договір!");
            checkSOByElementCode(arrConnection.length,soElementConnectionCode,"договір про приєднання!");

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
     * Видалити звязок з послугу на строну до приєднання
     *
     * @param soElementCalculationCode   -   Код
     * @param soElementConnectionCode   -   Код
     */
    public void removeBindSOCalculationToSOConnection(int soElementCalculationCode, int soElementConnectionCode){
        try {
            ENElement2ENElementDAO enElement2ENElementDAO = new ENElement2ENElementDAO(connection, userProfile);
            ENElement2ENElementFilter enElement2ENElementFilter = new ENElement2ENElementFilter();
            enElement2ENElementFilter.elementInRef.code = soElementCalculationCode;
            enElement2ENElementFilter.elementOutRef.code = soElementConnectionCode;
			enElement2ENElementFilter.typeRef.code = SERVICES_OBJECT_BIND_CALCULATION_TO_CONNECTION;

            ENElement2ENElementShortList enElement2ENElementShortList = enElement2ENElementDAO.getScrollableFilteredList(enElement2ENElementFilter,0,-1);

            checkSOByElementCode(enElement2ENElementShortList.totalCount,soElementCalculationCode,"договір!");

            enElement2ENElementDAO.remove(enElement2ENElementShortList.get(0).code);

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        }
    }

    public void checkSOByElementCode(int arrLength, int soElementCode, String message){
		if (arrLength <= 0) {
			throw new SystemException("\n\nЗа element котодом: " + soElementCode + " Не знайдено "+message);
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
			throw new SystemException("Помилка у кількості тех умов для договору! " );
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
			throw new SystemException("Помилка у кількості договорів для техумов! " );
		}

		out = tcoDAO.getObject(tcoArr[0]);

		return out;
	}

	/**
	 * Метод для отмены проведения договора по услугам на сторону при отмене проведения расходного акта
	 *
	 * @param act - акт, который отменяется ({@link com.ksoe.energynet.valueobject.ENAct})
	 */
	public void deleteServicesObjectFromFK(ENAct act) {
		try {
			ENServicesObject servicesObject = getServicesObjectByAct(act);

			// Если это договор на присоединение, выходим, потому что он проводится при
			// подписании справки о выполнении работ (повідомлення про виконання робіт)
			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				return;
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENServicesObjectController.JNDI_NAME);
			ENServicesObjectControllerHome servicesObjectControllerHome = (ENServicesObjectControllerHome) PortableRemoteObject.narrow(objRef, ENServicesObjectControllerHome.class);
			ENServicesObjectController servicesObjectController = servicesObjectControllerHome.create();

			// Отменяем проведение договора
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
	 * Метод для отмены перевода договора по услугам на сторону в статус "Работы выполнены" при отмене проведения расходного акта
	 *
	 * @param act - акт, который отменяется ({@link com.ksoe.energynet.valueobject.ENAct})
	 */
	public void undoFinishWorksForServicesObject(ENAct act) {
		try {
			ENServicesObject servicesObject = getServicesObjectByAct(act);

			// Если это договор на присоединение, выходим, потому что он проводится при
			// подписании справки о выполнении работ (повідомлення про виконання робіт)
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

			// Отменяем перевод в статус "Работы выполнены"
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
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий об'єкт акту!");
		}

		if (act.actTypeRef.code != ENPlanWorkState.WORK_IN_OUT ||
				act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
			return null;
		}

		try {
			ENServicesObject servicesObject = getServicesObjectByElementCode(act.element.code);

			if (servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4596 Не знайдено договір послуг на сторону для акта з кодом " + act.code + " !");
			}

			return servicesObject;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean checkIfStandardServicesObjectByAct(ENAct act) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий об'єкт акту!");
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
			throw new IllegalArgumentException("\n\nSUPP-104504 Не заданий код договору про приєднання!");
		}
		if (login == null || login.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\nSUPP-104504 Не заданий логін для створення персонального кабінету з приєднання!");
		}
		if (password == null || password.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\nSUPP-104504 Не заданий пароль для створення персонального кабінету з приєднання!");
		}

		addStringENSoValueForServicesObject(servicesObjectCode, ENSOValuesType.PERSONAL_CABINET_LOGIN, login);
		addStringENSoValueForServicesObject(servicesObjectCode, ENSOValuesType.PERSONAL_CABINET_PASSWORD, password);
	}

	public void addStringENSoValueForServicesObject(int servicesObjectCode, int soValuesType, String strVal) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий код договору про приєднання!");
		}
		if (soValuesType <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий тип додаткового реквізиту!");
		}
		if (strVal == null || strVal.trim().isEmpty()) {
			throw new IllegalArgumentException("\n\nНе задано значення додаткового реквізиту!");
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
			throw new IllegalArgumentException("\n\nНе заданий код договору про приєднання!");
		}

		int connectionKind = getConnectionKind(servicesObjectCode);
		if (connectionKind == Integer.MIN_VALUE) {
			return Integer.MIN_VALUE;
		}

		try {
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			if (servicesObject == null) {
				throw new SystemException("\n\nНе знайдено договір про приєднання з кодом " + servicesObjectCode + " !");
			}

			ENLandSheetsDelaysDAO delaysDao = new ENLandSheetsDelaysDAO(connection, userProfile);

			ENLandSheetsDelaysFilter delaysFilter = new ENLandSheetsDelaysFilter();
			String strDate = Tools.dateFormatDefault.format(Tools.clearTimeOfDate(servicesObject.contractDateServices));
			delaysFilter.conditionSQL = "to_date('" + strDate + "', 'dd.MM.yyyy') between DATEFROM and DATETO";

			ENLandSheetsDelaysShortList delaysList = delaysDao.getScrollableFilteredList(delaysFilter, 0, -1);

			if (delaysList.totalCount == 0) {
				throw new SystemException("\n\nНе знайдено даних про періодичність написання листів-повідомлень " +
						"для договору з датою " + strDate + " (код договору: " + servicesObjectCode + ") !");
			} else if (delaysList.totalCount > 1) {
				throw new SystemException("\n\nЗнайдено декілька записів з даними про періодичність написання листів-повідомлень " +
						"для договору з датою " + strDate + " (код договору: " + servicesObjectCode + ") !");
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
	
	//SUPP-107075 ВПТУ. Автоматичне “відправлення” пакету документів до архіву, та скасування договору про приєднання
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
					workFlowLogic.sendToArchive(i, Integer.MIN_VALUE, "Кошти не сплачені, ТУ втратили чинність");
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
