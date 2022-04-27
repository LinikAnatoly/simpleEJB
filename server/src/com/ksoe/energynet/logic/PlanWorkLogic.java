package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.address.valueobject.Supplier2ServicesObjectType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.valueobject.CCRecordPoint;
import com.ksoe.callcenter.valueobject.filter.CCRecordPointFilter;
import com.ksoe.datahub.valueobject.DHDisconnectionStatus;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.energynet.dataminer.ENAccess2EnelementDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENAct2HumenDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENBindingOverDAO;
import com.ksoe.energynet.dataminer.ENChangePersonBytDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimePlanDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENElement2TKMaterialsDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENInspectionSheetDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENMOLSTOREKEEPER2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENMarkEstimateDAO;
import com.ksoe.energynet.dataminer.ENPlan2HumenDAO;
import com.ksoe.energynet.dataminer.ENPlanCorrectHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanInformCustomerDAO;
import com.ksoe.energynet.dataminer.ENPlanProjectDAO;
import com.ksoe.energynet.dataminer.ENPlanProjectTemplateDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ActFailureDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2CCDamageLogDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2DecreeDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2PlanWorkReasonDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkENAct2OSDataDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkFormDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkFuelHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2PlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2TKKoefDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkMoveHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkStatusDAO;
import com.ksoe.energynet.dataminer.ENPlanwork2GeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENPurchasesNoObjectDAO;
import com.ksoe.energynet.dataminer.ENPurchasesObjectDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENSOContractDAO;
import com.ksoe.energynet.dataminer.ENServFromSide2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServices2PlanDAO;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;
import com.ksoe.energynet.dataminer.ENServicesFromSideObjectDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENSizObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.EPRen2FINExecutorDAO;
import com.ksoe.energynet.dataminer.FINContractsDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINExecutor2PlanDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCSeal2ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.ENEstimateItemController;
import com.ksoe.energynet.ejb.ENEstimateItemControllerHome;
import com.ksoe.energynet.ejb.ENMOL2PlanWorkController;
import com.ksoe.energynet.ejb.ENMOL2PlanWorkControllerHome;
import com.ksoe.energynet.ejb.ENPlanWorkController;
import com.ksoe.energynet.ejb.ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.ENPlanWorkItemController;
import com.ksoe.energynet.ejb.ENPlanWorkItemControllerHome;
import com.ksoe.energynet.ejb.ENServicesCostController;
import com.ksoe.energynet.ejb.ENServicesCostControllerHome;
import com.ksoe.energynet.ejb.ENTransportOrderController;
import com.ksoe.energynet.ejb.ENTransportOrderControllerHome;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkController;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.FINMaterialsController;
import com.ksoe.energynet.ejb.FINMaterialsControllerHome;
import com.ksoe.energynet.ejb.FINMolDataController;
import com.ksoe.energynet.ejb.FINMolDataControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.util.tools.CollectionTools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENBindingOver;
import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDepartmentType;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElement2TKMaterialsType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Plan;
import com.ksoe.energynet.valueobject.ENEstimateItem2PlanType;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.ENManagement;
import com.ksoe.energynet.valueobject.ENMarkEstimate;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlan2CCDamageLogType;
import com.ksoe.energynet.valueobject.ENPlanCorrectHistory;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2CCDamageLog;
import com.ksoe.energynet.valueobject.ENPlanWork2PlanWorkReason;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkFuelHistory;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2PlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2PlanWorkItemType;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENPlanwork2GeneralContracts;
import com.ksoe.energynet.valueobject.ENPurchasesNoObject;
import com.ksoe.energynet.valueobject.ENPurchasesNoObjectType;
import com.ksoe.energynet.valueobject.ENPurchasesObjectReason;
import com.ksoe.energynet.valueobject.ENSOContract;
import com.ksoe.energynet.valueobject.ENServFromSide2PlanWork;
import com.ksoe.energynet.valueobject.ENServices2Plan;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesFromSideObject;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;
import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportItem2TransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.FINExecutor2Plan;
import com.ksoe.energynet.valueobject.FINExecutorType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemForClosePlanShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;
import com.ksoe.energynet.valueobject.filter.ENAccess2EnelementFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENBindingOverFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENElement2TKMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.ENElementFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENMOLSTOREKEEPER2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENMarkEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanInformCustomerFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectTemplateFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ActFailureFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2CCDamageLogFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2DecreeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkENAct2OSDataFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFuelHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2PlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2TKKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkMoveHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanwork2GeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENPurchasesNoObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENPurchasesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENSOContractFilter;
import com.ksoe.energynet.valueobject.filter.ENServFromSide2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesCostFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFromSideObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.EPRen2FINExecutorFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINExecutor2PlanFilter;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimePlanShortList;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENElement2TKMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2PlanShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENMOLSTOREKEEPER2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2CCDamageLogShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkENAct2OSDataShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkFuelHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemForClosePlanShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkMoveHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPurchasesNoObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;
import com.ksoe.energynet.valueobject.lists.ENSOContractShortList;
import com.ksoe.energynet.valueobject.lists.ENServices2PlanShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.energynet.valueobject.lists.EPRen2FINExecutorShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINExecutor2PlanShortList;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.FINMolTypeRef;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.logic.FKLogic;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.GenericSessionStatelessBean;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.netobjects.dataminer.ENCallCenterObjectDAO;
import com.ksoe.netobjects.valueobject.ENCallCenterObject;
import com.ksoe.netobjects.valueobject.filter.ENCallCenterObjectFilter;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.logic.PlanPurchaseLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.lists.RQOrgShortList;
import com.ksoe.techcard.dataminer.TEMPNomenclaturesDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKElement2TechCardDAO;
import com.ksoe.techcard.dataminer.TKMaterialParametersDAO;
import com.ksoe.techcard.dataminer.TKMaterials2TKTechCardDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKReportItem2TechCardDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.dataminer.TKTechCardSourceKoefDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.dataminer.TKVirtualBrigadeDAO;
import com.ksoe.techcard.ejb.TKCalcCostController;
import com.ksoe.techcard.ejb.TKCalcCostControllerHome;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKMaterials2TechCardType;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.TKVirtualBrigade;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;
import com.ksoe.techcard.valueobject.filter.TEMPNomenclaturesFilter;
import com.ksoe.techcard.valueobject.filter.TKElement2TechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterialParametersFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterials2TKTechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKReportItem2TechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKTechCardSourceKoefFilter;
import com.ksoe.techcard.valueobject.filter.TKTransportRealFilter;
import com.ksoe.techcard.valueobject.filter.TKVirtualBrigadeFilter;
import com.ksoe.techcard.valueobject.lists.TEMPNomenclaturesShortList;
import com.ksoe.techcard.valueobject.lists.TKElement2TechCardShortList;
import com.ksoe.techcard.valueobject.lists.TKMaterialParametersShortList;
import com.ksoe.techcard.valueobject.lists.TKMaterials2TKTechCardShortList;
import com.ksoe.techcard.valueobject.lists.TKReportItem2TechCardShortList;
import com.ksoe.techcard.valueobject.lists.TKTransportRealShortList;
import com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;
import com.ksoe.techcard.valueobject.references.TKTechCardRef;



public class PlanWorkLogic extends LogicModule{

	private static final long serialVersionUID = 1L;


	private Connection docFlowConnection = null;

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


    public class TKMaterialsData
    {
        int materialCode;
        String mainNomenclatureNumber;
        BigDecimal minAllowedQuantity;
        String nomenclaturesList;

        public TKMaterialsData(int vMaterialCode, String vMainNomenclatureNumber, BigDecimal vMinAllowedQuantity, String vNomenclaturesList)
        {
        	materialCode = vMaterialCode;
        	mainNomenclatureNumber = vMainNomenclatureNumber;
        	minAllowedQuantity = vMinAllowedQuantity;
        	nomenclaturesList = vNomenclaturesList;
        }

        @Override
		public int hashCode()
        {
            return ("" + materialCode).hashCode();
        }

        @Override
		public boolean equals(Object obj)
        {
            if (obj instanceof TKMaterialsData)
            {
            	TKMaterialsData other = (TKMaterialsData)obj;
            	return (this.materialCode == other.materialCode);
            }
            else
            {
                return false;
            }
        }
    }

    public void checkPlanAccessByLogin(ENPlanWork plan, String userName) throws PersistenceException {
    	/*
    	// 18.09.2018 ���������� �������� ������ ������ �� ����������� ��������
    	boolean isTechnicalManagement = false;
    	ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
    	ENDepartment department = dao.getObject(plan.budgetRef.code);
    	isTechnicalManagement = department != null && department.managementRef != null
    			&& department.managementRef.code == ENManagement.TECHNICAL;
    	*/
    	// ��� ��� �����
    	if (plan.typeRef.code == ENPlanWorkType.SIZ) {
    		return;
    	}

        if (plan.formRef.code == ENPlanWorkForm.PLANNED
        		&& plan.kind.code != ENPlanWorkKind.NPW
        		&& plan.kind.code != ENPlanWorkKind.FACT
        		&& plan.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND //SUPP-105445 101.0	�� - �������� ����� , ����������   
        		) {

        	ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

        	List<Integer> allowedYears = settingsLogic.getVectorWithIntValues(ENSettingsKeysConsts.PLANNING_ALLOWED_YEARS, false);

           if (allowedYears == null || allowedYears.isEmpty() || !allowedYears.contains(plan.yearGen)) {
        		List<String> granted = settingsLogic.getVectorWithValues(ENSettingsKeysConsts.USERS_ALLOWED_PLAN_ACCESS_WHEN_PROHIBITED, false);
            	if (granted == null || !CollectionTools.checkCollectionContainsStringIgnoreCase(granted, userName) /*&& isTechnicalManagement*/) {
            		throw new SystemException(String.format("\n\n����������� ����� �� %d �� ���������� ����������� ������!", plan.yearGen));
            	}
        	}
          
		}
    }

	public void checkInSCCounterByPlanCode4Edit(int planCode) throws PersistenceException {
		checkInSCCounterByPlanCode4Edit(planCode, false);
	}


	public void checkInSCCounterByPlanCode4Edit(int planCode, boolean isFromBilling) throws PersistenceException {

		/**
		 *  SUPP-65483... 06.09.2017... +++ ���������� �������� ������������� �������...
		 *  ��� ��-���� ������ �� ���������...
		 */
		ElementLogic elementLogic = new ElementLogic(connection, userProfile);
		int elementType = elementLogic.getElementTypeByPlanCode(planCode);

		if (elementType == ENElementType.TY_PROM) {
			return;
		}

		SCCounterDAO cDAO = new SCCounterDAO(connection, userProfile);
		SCCounterFilter cFilter = new SCCounterFilter();
		cFilter.conditionSQL = "estimateitemrefcode in (select e.code from enestimateitem e where e.planrefcode = " + planCode + ")";

		if (isFromBilling) {
			cFilter.conditionSQL = cFilter.conditionSQL + " and SCCOUNTER.KINDREFCODE <> " + SCCounterKind.FOR_WORKORDERBYT;
		}


		/**  ������ ��� ����� :)  */
		if (!userProfile.userName.equals("energynet")) {
			int[] cArr = cDAO.getFilteredCodeArray(cFilter, 0, -1);
			if (cArr.length != 0) {

				/** 14.06.2018... +++ �������� ������ ���� ��� ��� ������� */
				for (int s = 0; s < cArr.length; s++) {
					SCCounter scCounter = cDAO.getObject(cArr[s]);

					if (scCounter.invNumber != null
							&& scCounter.invNumber.length() > 0) {
						throw new EnergyproSystemException("\n\n"
								+ "������� � ����� ��'������ � ���������� ... ����������� ���������� ... ");
					}
				}
			}
		}



	}


    public void checkTransportOrderInPlan(int planCode) throws PersistenceException
    {
        ENTransportOrderDAO tOrdDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrderFilter tOrdFilter = new ENTransportOrderFilter();
        tOrdFilter.planRef.code = planCode;
        int[] tOrdArr =  tOrdDAO.getFilteredCodeArray(tOrdFilter, 0, -1);
        if (tOrdArr.length > 0)
        {
            throw new EnergyproSystemException("�� ����� ���� � ���������� ������! ��� ���� ���� ����� ����� �� ��������!");
        }
    }

    // ����� �� ����� � ActLogic checkInSCCounterByActCode
    public void checkInSCCounterByPlanCode4ClosePlan(int planCode) throws PersistenceException
    {

    	/**
		 *  SUPP-65483... 06.09.2017... +++ ���������� �������� ������������� �������...
		 *  ��� ��-���� ������ �� ���������...
		 */
		ElementLogic elementLogic = new ElementLogic(connection, userProfile);
		int elementType = elementLogic.getElementTypeByPlanCode(planCode);

		if (elementType == ENElementType.TY_PROM) {
			return;
		}

        SCCounterDAO cDAO = new SCCounterDAO(connection, userProfile);
        SCCounterFilter cFilter = new SCCounterFilter();
        //cFilter.conditionSQL = "estimateitemrefcode in (select e.code from enestimateitem e where e.planrefcode = "+ planCode +")";
        cFilter.conditionSQL =  "code in (select cc.code from  " +
        " sccounter cc , enestimateitem e " +
        " where " +
        " cc.estimateitemrefcode = e.code " +
        " and e.planrefcode = " + planCode +
        " and cc.molcode is not null /*������ ��*/ " +
        " and e.kindrefcode <> 3 /*�������� �� �����*/ )" ;

        int[] cArr = cDAO.getFilteredCodeArray(cFilter, 0, -1);
        if (cArr.length != 0){
            throw new EnergyproSystemException("\n\n"
            		+ "������� � ����� ��'������ � ���������� ... ����������� ���������� ... ");
        }
    }

    /**
     *
     * {@link PlanWorkLogic#checkInSCSealByPlanCode4ClosePlan(int, boolean)}
     *
     * ��-��������� ��������������� ������ �� ����������� {@code withUnmounted} = {@code false}
     *
     * @see PlanWorkLogic#checkInSCSealByPlanCode4ClosePlan(int, boolean)
     */
    public void checkInSCSealByPlanCode4ClosePlan(int planCode) throws PersistenceException {
    	this.checkInSCSealByPlanCode4ClosePlan(planCode, false);
    }

    /**
     *
     * �������� ������� ����� �� ����� � ��� �� ������� ����������� ����������
     *
     * @param planCode ��� ����� ��� �������� ��������� ������
     * @param withUnmounted ��������� ��������������� (������) ������ {@code true} - ��������� {@code false} - ���
     * @throws PersistenceException
     */
    public void checkInSCSealByPlanCode4ClosePlan(int planCode, boolean withUnmounted) throws PersistenceException
    {
        SCSealDAO cDAO = new SCSealDAO(connection, userProfile);
        SCSealFilter cFilter = new SCSealFilter();
        //cFilter.conditionSQL = "estimateitemrefcode in (select e.code from enestimateitem e where e.planrefcode = "+ planCode +")";
        cFilter.conditionSQL =  "code in (select cc.code from  " +
        " scseal cc , enestimateitem e " +
        " where " +
        " cc.estimateitemrefcode = e.code " +
        " and e.planrefcode = " + planCode +
        ((!withUnmounted) ? " and e.kindrefcode <> 3 /*�������� �� �����*/ " : "") +
        ")" ;

        int[] cArr = cDAO.getFilteredCodeArray(cFilter, 0, -1);
        if (cArr.length != 0){
            throw new EnergyproSystemException("������� � ����� ��'������ � ������� ... ����������� ���������� ... ");
        }
    }

	public void checkInSCCounterByPlanCode(int planCode) throws PersistenceException {
		checkInSCCounterByPlanCode4Edit(planCode);
	}

    /**
    * ����� ��� ��������, ������� �� ���� � ������� ������� ��� ����������� (�������� ������ ��� �������-������)
    *
    * @param planCode - ��� �����
    * @param additionalException - �������������� ����� ������ (��������� � ���������� � ������������)
    *
    */
    public void checkPlanInWorkOrderByt(int planCode, String additionalException) throws PersistenceException
    {
    	checkPlanInWorkOrderByt(planCode, additionalException, Integer.MIN_VALUE);
    }

    /**
    * ����� ��� ��������, ������� �� ���� � ������� ������� ��� ����������� (�������� ������ ��� �������-������)
    *
    * @param planCode - ��� �����
    * @param additionalException - �������������� ����� ������ (��������� � ���������� � ������������)
    * @param workOrderBytType - ��� �������� ������� (���� = Integer.MIN_VALUE, ��������� ���������� �� ����)
    *
    */
    public void checkPlanInWorkOrderByt(int planCode, String additionalException, int workOrderBytType) throws PersistenceException
    {
    	ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);

    	ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();
	    itemFilter.planRef.code = planCode;
	    if (workOrderBytType > Integer.MIN_VALUE)
	    {
	    	itemFilter.conditionSQL = "ENWORKORDERBYT.typerefcode = " + workOrderBytType;
	    }
	    itemFilter.orderBySQL = "ENWORKORDERBYT.DATEGEN desc, ENWORKORDERBYT.CODE desc, ENWORKORDERBYTITEM.CODE desc";

	    //ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getScrollableFilteredList(itemFilter, 0, -1);
	    //int[] itemArr = workOrderBytItemDAO.getFilteredCodeArray(itemFilter, 0, -1);
	    ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getLightList(itemFilter, 0, -1);

	 	if (itemList.totalCount > 0)
	 	{
	 		/*
	 		throw new SystemException("\n\nNET-4350 ���� � ����� " + planCode + " ��� �������� � ����� �������� � " +
	 	                              itemList.get(0).workOrderBytRefNumberGen + " �� " +
	 	                              new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(0).workOrderBytRefDateGen) +
	 	                              " (���: " + itemList.get(0).workOrderBytRefCode + ") !" +
	 	                              "\n\n��� ���� ���� ����� ������� �������� �������� ���� � ������� �������� ��� �������� � ���� ����� �������� � ���������� �����!"
	 			   );
	 	    */

	 		//ENWorkOrderBytItemShort item = workOrderBytItemDAO.getShortObject(itemArr[0]);

	 		String message =
	 				"\n\nNET-4350 ���� � ����� " + planCode + " ��� �������� � ����� �������� � " +
	 				itemList.get(0).workOrderBytRefNumberGen + " �� " +
                    new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(0).workOrderBytRefDateGen) +
                    " (���: " + itemList.get(0).workOrderBytRefCode + ") !";

	 		if (additionalException != null)
	 		{
	 			if (! additionalException.trim().equals(""))
	 			{
	 				message = message + "\n\n" + additionalException;
	 			}
	 		}

	 		throw new SystemException(message);
	 	}
    }

    /**
    * ����� ��� ��������, �������� �� ������ � ������� ������� ��� �����������
    *
    * @param planItemCode - ��� ������
    * @param additionalException - �������������� ����� ������ (��������� � ���������� � ������������)
    *
    */
    public void checkPlanWorkItemInWorkOrderByt(int planItemCode, String additionalException) throws PersistenceException
    {
    	/*
    	ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, userProfile);

    	ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();
	    itemFilter.planItemRef.code = planItemCode;
	    itemFilter.orderBySQL = "ENWORKORDERBYT.DATEGEN desc, ENWORKORDERBYT.CODE desc, ENWORKORDERBYTITEM.CODE desc";

	    //ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getScrollableFilteredList(itemFilter, 0, -1);
	    //int[] itemArr = workOrderBytItemDAO.getFilteredCodeArray(itemFilter, 0, -1);
	    ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getLightList(itemFilter, 0, -1);

	 	if (itemList.totalCount > 0)
	 	{
	 		//ENWorkOrderBytItemShort item = workOrderBytItemDAO.getShortObject(itemArr[0]);

	 		String message =
	 				"\n\nNET-4350 ������ � ����� " + planItemCode + " ��� �������� � ����� �������� � " +
	 				itemList.get(0).workOrderBytRefNumberGen + " �� " +
                    new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(0).workOrderBytRefDateGen) +
                    " (���: " + itemList.get(0).workOrderBytRefCode + ") !";

	 		if (additionalException != null)
	 		{
	 			if (! additionalException.trim().equals(""))
	 			{
	 				message = message + "\n\n" + additionalException;
	 			}
	 		}

	 		throw new SystemException(message);
	 	}
	 	*/
    }

    public boolean checkPlanByServicesObjectForSupplier(int planCode) throws PersistenceException {
    	return checkPlanByServicesObjectForSupplier(planCode, true);
    }

    public boolean checkPlanByServicesObjectForSupplier(int planCode, boolean isException) throws PersistenceException {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
    	}

    	ENServices2PlanDAO services2planDAO = new ENServices2PlanDAO(connection, userProfile);

    	ENServices2PlanFilter services2planFilter = new ENServices2PlanFilter();
    	services2planFilter.conditionSQL =
    			"code in (" +
    			"	select sp.code " +
				"	from enservices2plan sp, enservicesobject so " +
				"	where sp.servicesobjectrefcode = so.code " +
				"     and sp.planrefcode = " + planCode +
				"     and so.contracttyperefcode = " + ENServicesContractType.SHIFT_LINES +
				"     and so.contractkindrefcode = " + ENServicesContractKind.SUPPLIER_CONTRACT +
				")";

    	int[] services2planArr = services2planDAO.getFilteredCodeArray(services2planFilter, 0, -1);

    	if (services2planArr.length > 0) {
    		if (isException) {
	    		//throw new SystemException("\n\nNET-4576 ��� ��� ���� ��������-���� ���������� ����� � �����!");
	    		throw new SystemException("\n\nNET-4576 ��� ��� ���� ����� ����������� �� ����������� ����� � �����!");
    		} else {
    			return true;
    		}
    	}

    	return false;
    }

    public ENServices2Plan getENServices2PlanByPlanCode(int planCode) {
    	return getENServices2PlanByPlanCode(planCode, true);
    }

    public ENServices2Plan getENServices2PlanByPlanCode(int planCode, boolean isException) {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
    	}

		try {
			ENServices2PlanDAO services2PlanDAO = new ENServices2PlanDAO(connection, userProfile);
			ENServices2PlanFilter services2PlanFilter = new ENServices2PlanFilter();
			services2PlanFilter.planRef.code = planCode;

			int[] services2PlanArr = services2PlanDAO.getFilteredCodeArray(services2PlanFilter, 0, -1);

			if (services2PlanArr.length == 0) {
				if (isException) {
					throw new SystemException("\n\nNET-4576 �� ��������� ��'���� �������� � ������!");
				} else {
					return null;
				}
			} else if (services2PlanArr.length != 1) {
				if (isException) {
					throw new SystemException("\n\nNET-4576 �������� ������� (" + services2PlanArr.length + ") ��'���� �������� � ������!");
				} else {
					return null;
				}
			} else {
				ENServices2Plan services2Plan = services2PlanDAO.getObject(services2PlanArr[0]);
				if (services2Plan == null && isException) {
					throw new SystemException("\n\nNET-4576 �� ��������� ����� ��� ��'���� �������� � ������ (��� ��'����: " + services2PlanArr[0] + ")!");
				}
				return services2Plan;
			}
		}
		catch (PersistenceException e) {
        	throw new EnergyproSystemException(e.getMessage(), e);
		}
    }

    public void registerServiceFinishForSupplier(int planCode) throws PersistenceException {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
    	}

    	if (! checkPlanByServicesObjectForSupplier(planCode, false)) {
    		return;
    	}

		try {
			ENServices2Plan services2Plan = getENServices2PlanByPlanCode(planCode, true);

			if (services2Plan.dfPackCode == Integer.MIN_VALUE) {
				// TODO: UNCOMMENT LATER!!!
				// ���� ��� ����� ������ ��������, ������ ��� ��� ��������� ����� ��������� ���� ������ �� �����
				//throw new SystemException("\n\nNET-4576 ��� ��'���� �������� � ������ �� ������� ��� ������ � DocFlow! [services2Plan.code = " +
				//		services2Plan.code + "]");
				return;
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

			if (plan == null) {
				throw new SystemException("\n\nNET-4576 �� �������� ���� � ����� " + planCode + " !");
			}

			DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);
			docFlowLogic.registerServiceFinishByDFPackCode(services2Plan.dfPackCode, plan.dateStart);

		} catch (DatasourceConnectException ex) {
			throw new SystemException(ex.getMessage(), ex);
		} finally {
			closeDocFlowConnection();
		}
    }

    public void registerServiceCancellationForSupplier(int planCode) throws PersistenceException {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
    	}

    	if (! checkPlanByServicesObjectForSupplier(planCode, false)) {
    		return;
    	}

		try {
			ENServices2Plan services2Plan = getENServices2PlanByPlanCode(planCode, true);

			if (services2Plan.dfPackCode == Integer.MIN_VALUE) {
				return;
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

			if (plan == null) {
				throw new SystemException("\n\nNET-4576 �� �������� ���� � ����� " + planCode + " !");
			}

			DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);
			docFlowLogic.registerServiceCancellationByDFPackCode(services2Plan.dfPackCode, plan.dateStart);

		} catch (DatasourceConnectException ex) {
			throw new SystemException(ex.getMessage(), ex);
		} finally {
			closeDocFlowConnection();
		}
    }

    public void undoRegisterServiceFinishForSupplier(int planCode) throws PersistenceException {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
    	}

    	if (! checkPlanByServicesObjectForSupplier(planCode, false)) {
    		return;
    	}

		try {
			ENServices2Plan services2Plan = getENServices2PlanByPlanCode(planCode, true);

			if (services2Plan.dfPackCode == Integer.MIN_VALUE) {
				return;
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

			if (plan == null) {
				throw new SystemException("\n\nNET-4576 �� �������� ���� � ����� " + planCode + " !");
			}

			DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);
			docFlowLogic.undoRegisterServiceFinishByDFPackCode(services2Plan.dfPackCode, plan.dateStart);

		} catch (DatasourceConnectException ex) {
			throw new SystemException(ex.getMessage(), ex);
		} finally {
			closeDocFlowConnection();
		}
    }

    public void updateDataHubDisconnectionFactCode(int npzCode, int factCode) {
    	DataHubLogic dhLogic = new DataHubLogic(connection, userProfile);

    	dhLogic.checkNpzCodeInDHDisconnection(npzCode);
    	dhLogic.updateDisconnectionFactCode(npzCode, factCode);
    }

    public boolean checkIfDataHubDisconnectionCompleted(int factCode) {
    	DataHubLogic dhLogic = new DataHubLogic(connection, userProfile);

    	int statusCode = dhLogic.getDHDisconnectionStatusByFactCode(factCode);
    	return (statusCode == DHDisconnectionStatus.COMPLETED ||
    			statusCode == DHDisconnectionStatus.PAID ||
    			statusCode == DHDisconnectionStatus.CANCELED);
    }

    public void validateInOrdered(ENPlanWork plan) throws PersistenceException
    {
        if (plan.kind.code == ENPlanWorkKind.CURRENT){
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.planRef.code = plan.code;

            //eFilter.conditionSQL = ENEstimateItem.countGen_QFielld + " <> 0 ";

            /* ��� ������ �����������, ������ ��� ���� ���� �� ������ �-�� � ����� ���������
            * ������ "� ��������" (�� �� ��� ���� �� �����������), �� ������ ��������������� �� ���������...
            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
            for (int i=0; i<eList.totalCount; i++){
                if (eList.get(i).statusRefCode != ENEstimateItemStatus.PLANNED){
                    throw new EnergyproSystemException("� ����� ����� ��� � �������� �������� ("+ eList.get(i).materialRefName +") ... ����������� ����� ��������� ���������� !!!");
                }
            }
            */

            // �������� ��-�������
            eFilter.conditionSQL = "( (enestimateitem.code in (select oe.estimateitemcode from rqorderitem2enestimttm oe)) or " +
                                "  (enestimateitem.code in (select oe1.estimateitemcode from rqfkorderitem2enstmttm oe1)) )" +
                                   "and " + ENEstimateItem.countGen_QFielld + " <> 0 "; // ?? ���������� �� ���������, ���� ���� ��� � ������ (������, ������, �� ����� ����...)
            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
            if(eList.totalCount > 0) {
            	throw new EnergyproSystemException("� ����� ����� ��� � �������� �������� ("+ eList.get(0).materialRefName +") ... ����������� ����� �������� ���������� !!!");
            }
        }
    }

    public void validateInOrdered(int planCode) throws PersistenceException
    {
        //PlanWorkLogic l = new PlanWorkLogic(connection, userProfile );
        //ENPlanWork p = l.getPlanByCode(planItemObj.planRef.code);
        ENPlanWork plan = getPlanByCode(planCode);
        validateInOrdered(plan);
    }


    public void validateMOLinPlan(int planCode) throws PersistenceException
    {
    	/** SUPP-92318... 16.06.2020... �������� ���� �����������... */
    	if ( 1 == 1 ) return;

        /* 17.01.2012 +++ �� ��������� ���� ��� ����� �� ������� */
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDao.getObject(planCode);

        ElementLogic elementLogic = new ElementLogic(connection, userProfile);
        int eType = elementLogic.getElementTypeByPlan(plan);


        /* 10.03.2012 +++ �� ��������� ��������� ������
        * 27.03.2012 +++ ���� �� ������������� � ��������������....
        * 27.02.2014 +++ � ����������� ������� CallCenter'� ����
        * */
        if (eType != ENElementType.CARGO_OBJECT && eType != ENElementType.CALLCENTER_OBJECT && eType != ENElementType.SERVICES_OBJECT) {
            if (plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
                && plan.typeRef.code != ENPlanWorkType.DESIGNING_TECHCONDITIONS
                && plan.typeRef.code != ENPlanWorkType.PRIEDNANNY
                    && plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {

                ENMOL2PlanWorkDAO dao = new ENMOL2PlanWorkDAO(connection, userProfile);
                ENMOL2PlanWorkFilter f = new ENMOL2PlanWorkFilter();
                f.planRef.code = planCode;

                int[] arr = dao.getFilteredCodeArray(f, null, null, 0, 1, null);
                if (arr.length == 0) {
                    throw new EnergyproSystemException("������ ���� ��� ���������� �� ����, �� ���������� ...");
                }
            }
        }
    }


    /*
    * ��������� �� ������������ ����
    */
    public boolean isUnicPlan(ENPlanWork plan) throws PersistenceException
    {
        //CREATE UNIQUE INDEX "enplanwork_unic" ON "net"."enplanwork"
        //  USING btree ("yeargen", "monthgen", "statuscode", "elementrefcode",
        //"typerefcode", "kindcode", "datestart", "staterefcode",
        //"finexecutorcode");
        boolean out1 = false;
        out1 = true;
        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.yearGen = plan.yearGen;
        f.monthGen = plan.monthGen;
        //f.status.code = plan.status.code;
        out1 = false;
        // �� ���������������� ��� ����� ���� ��������� ������
        f.budgetRef.code = plan.budgetRef.code;
        f.departmentRef.code = plan.departmentRef.code;

        f.elementRef.code = plan.elementRef.code;
        f.typeRef.code = plan.typeRef.code;
        f.kind.code = plan.kind.code;

        f.formRef.code = plan.formRef.code;


        if (plan.kind.code != ENPlanWorkKind.YEAR &&
            plan.kind.code != ENPlanWorkKind.CURRENT &&
            plan.kind.code != ENPlanWorkKind.CALCULATION)
        {
	        f.dateStart = plan.dateStart;


	        // NET-2961 ������ ��������� ������� ����� ������ ��� ������
	        if (plan.elementRef.code == ENElement.BUFFET_REALIZATION_OBJECT
	                && (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION
	                /* 19.09.2012 +++ NET-3072 +++ �������� ��� (������, �����) */
	                    || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION
	                    || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL
	                )) {
	            return false;
	        }

	        // ��� ���������� ��� ������ ����� ����� ;)))
	        if ((plan.typeRef.code == ENPlanWorkType.AVR) && (plan.formRef.code == ENPlanWorkForm.NOPLANNED)){
	            return false;
	        }

	          // ��� ������ �� �������� ������� ������ ������ ����� ����� ;)))
	        if ((plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)){
	            return false;
	        }

	        // ��� �������� ���� ... �� 04.04.2011
	        // ��� �� � ��� �������� ��������� ...
	        if ((plan.typeRef.code == ENPlanWorkType.WRITINGS)
	                && (
	                        (plan.stateRef.code == ENPlanWorkState.WRITINGS_TMC)
	                        || (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP)
	                        || (plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA)
	                        || (plan.stateRef.code == ENPlanWorkState.WRITINGS_OS)
	                        || (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
	                        || (plan.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/)
	                    )
	        )
	        {
	            return false;
	        }

	        // 26.05.2011 �� - ��� ����� ����������� ����� ��������� ������� ���� ����� ��������� ��������� �������-������/������ �� ���� ����
	        if ((plan.typeRef.code == ENPlanWorkType.TMC_TRANSFER) && (plan.stateRef.code == ENPlanWorkState.TMC_TRANSFER)){
	            return false;
	        }

	        // ��� ����������� ����� - ����� ������� - �� ��������� ��������� ����� ;)
	        ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
	        ENDepartmentFilter depFilter = new ENDepartmentFilter();
	        depFilter.code = plan.budgetRef.code;
	        depFilter.typeRef.code = ENDepartmentType.BUDGET;
	        depFilter.conditionSQL = "endepartment.managementrefcode in (" + ENManagement.TECHNICAL + ", " + ENManagement.COMMERCIAL + ", " + ENManagement.EXECUTIVE + ")";
	        int[] depArr = depDAO.getFilteredCodeArray(depFilter, depFilter.conditionSQL, null, 0, -1, null);
	        if (depArr.length == 1) return false;
        }


        /** 04.04.2015... +++ ���� �� ������� ���������... ��� �������� ������ */
        if (plan.elementRef.code == ENElement.NO_OBJECT_COUNTERS_SERVICES) {
        	return false;
        }


        ///// 18.09.14 NET-4401 ��� �������������� ������ �� ���������� ��� ����� �������� ���������� ���� ����, �������� ��� ������
        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement element = elementDAO.getObject(plan.elementRef.code);

        if (element.typeRef.code == ENElementType.NO_OBJECT_AVZ)
        {
        	return false;
        }
        /////


        f.stateRef.code = plan.stateRef.code;
        if (plan.code != Integer.MIN_VALUE){
            f.conditionSQL = "enplanwork.code<>" + plan.code;
        }

        /*
        if (plan.typeRef.code == ENPlanWorkType.PRIEDNANNY) {
            f.priConnectionNumber = plan.priConnectionNumber;
        }*/

        /* ����� ������������� � ������� �������������� :) */
        if (plan.priConnectionNumber != null) {
            if (!plan.priConnectionNumber.equals("")) {
                f.priConnectionNumber = plan.priConnectionNumber;
            }

        }

        ///// 10.09.13 �.�. ��� ���� ��������� �������� ���������� ���������� �������/�������� ������
        if ((plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT) && (plan.budgetRef.code == ENConsts.ENBUDGET_SVES))
        {
            return false;
        }
        /////

        ///// 20.05.19 SUPP-82487
        // ��������� �������� ���������� ���������� �������� ������ �� �����������/����������
        // (�.�. ���� ���� ����� ��������� ������ �� ����������, � ������ ����� �� - �� �����������)
        if (plan.kind.code == ENPlanWorkKind.CURRENT && plan.typeRef.code == ENPlanWorkType.EZ_OFF_ONN)
        {
            return false;
        }
        /////

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWorkShortList l = planDAO.getScrollableFilteredList(f, 0, -1);
        int[] arr = planDAO.getFilteredCodeArray(f,0,1);

        FINExecutorDAO  finExDAO = new FINExecutorDAO(connection, userProfile);
        ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(connection, userProfile);


        //for (int i = 0; i < l.totalCount; i++){
        for (int i = 0; i < arr.length; i++){
            ENPlanWork p1 = planDAO.getObject(arr[i]);


            if ((plan.kind.code == ENPlanWorkKind.CURRENT) &&
                (plan.typeRef.code == ENPlanWorkType.TMC_TRANSFER) && (plan.stateRef.code == ENPlanWorkState.TMC_TRANSFER))
            {
				if (plan.code != Integer.MIN_VALUE) {
					ENMOL2PlanWorkFilter mpFilter = new ENMOL2PlanWorkFilter();
					mpFilter.planRef.code = plan.code;
					ENMOL2PlanWorkShortList mpList = mpDAO.getScrollableFilteredList(mpFilter, 0, -1);
					if (mpList.totalCount > 0) {
						ENMOL2PlanWorkFilter mpFilter1 = new ENMOL2PlanWorkFilter();
						mpFilter1.planRef.code = p1.code;
						ENMOL2PlanWorkShortList mpList1 = mpDAO.getScrollableFilteredList(mpFilter1, 0, -1);
						if (mpList1.totalCount > 0) {
							if (mpList.get(0).molCode.equals(mpList1.get(0).molCode)) {
								out1 = true;
							}
						}
					}
				}
            }

            if ((plan.typeRef.code != ENPlanWorkType.TMC_TRANSFER) || (plan.stateRef.code != ENPlanWorkState.TMC_TRANSFER)){

                if (p1.finExecutor.code > Integer.MIN_VALUE ){
                    FINExecutor ex = null;
                    if (plan.finExecutor != null){
                        if (plan.finExecutor.code != Integer.MIN_VALUE){
                            ex = finExDAO.getObject( plan.finExecutor.code );
                        }
                    }

                    if (ex != null) {

                    	///// MDAX-441
                		boolean isFinExecutorsEqual =
                			compareFinExecutorsByCodes(ex.axOrgId, p1.finExecutor.axOrgId,
                    								   ex.finCode, p1.finExecutor.finCode);
                    	/////

                        //if (ex.finCode == p1.finExecutor.finCode)
                		//if (isFinCodesEqual || isAXOrgIdsEqual)
                		if (isFinExecutorsEqual)
                        {
                            out1 = true;
                        }
                    }
                }
                else{
                    if (plan.finExecutor != null){
                        if (plan.finExecutor.code == Integer.MIN_VALUE){
                            out1 = true;
                        }
                    }
                    else{
                        out1 = true;
                    }
                }
            }


            ///// 10.09.13 �.�. ��� ���� ��������� �������� ���������� ���������� �������� ������ (� ������, � �������-������ � �������)
            if ((plan.kind.code == ENPlanWorkKind.NPW || plan.kind.code == ENPlanWorkKind.FACT) && (plan.budgetRef.code == ENConsts.ENBUDGET_SVES))
            {
                int parentCurrentPlanCode = getParentCurrentPlanCode(plan);
                int parentCurrentPlanCode1 = getParentCurrentPlanCode(p1);

                // ���� ����/���� �� ������ ��������� - �� �����, ����� - �����!
                if (parentCurrentPlanCode != parentCurrentPlanCode1)
                {
                    out1 = false;
                }
            }
            /////


        }
        return out1;
    }

    public void checkUnicPlan(ENPlanWork plan) throws PersistenceException
    {
        if (isUnicPlan(plan)) throw new EnergyproSystemException("���� � ������ ����������� ��� ���� ... ����� ��� ;)", userProfile);
    }

    public void processDeliveryTimesByPlanCode(int planCode)     throws PersistenceException
    {
        new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(planCode);
        new HumenLogic(connection, userProfile).createDeliveryTime(planCode);
    }

    public void processDeliveryTimesByTransportCode(int transportCode)     throws PersistenceException
    {
        int planCode = getPlanCodeByTransport(transportCode);
        processDeliveryTimesByPlanCode(planCode);
    }

public ENPlanWork getPlanByWorkOrderCode(int workOrderCode) throws PersistenceException
{
    ENPlanWork pw = new ENPlanWork();
    pw.code = Integer.MIN_VALUE;
    ENWorkOrder2ENPlanWorkDAO dao = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
    ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

    ENWorkOrder2ENPlanWorkFilter f = new ENWorkOrder2ENPlanWorkFilter();
    f.workOrder.code = workOrderCode;

    ENWorkOrder2ENPlanWorkShortList list = dao.getScrollableFilteredList(f, 0, -1);
    for (int i=0; i< list.totalCount; i++){
        pw = planDAO.getObject(list.get(i).planCode);
    }
    return pw;
}

	public ENWorkOrder getWorkOrderByPlanCode(int planCode) throws PersistenceException
	{
		ENWorkOrder2ENPlanWorkDAO workOrder2planDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);

		ENWorkOrder2ENPlanWorkFilter workOrder2planFilter = new ENWorkOrder2ENPlanWorkFilter();
		workOrder2planFilter.plan.code = planCode;

	    ENWorkOrder2ENPlanWorkShortList workOrder2planList = workOrder2planDAO.getScrollableFilteredList(workOrder2planFilter, 0, -1);

	    if (workOrder2planList.totalCount > 0)
	    {
	    	ENWorkOrderDAO workOrderDAO = new ENWorkOrderDAO(connection, userProfile);
	    	return workOrderDAO.getObjectNOSEGR(workOrder2planList.get(0).workOrderCode);
	    }
	    else
	    {
	    	return null;
	    }
	}


    public int getPlanCodeByTransport(int transportCode)   throws PersistenceException
    {
        ENTransportItemDAO dao = new ENTransportItemDAO(connection, userProfile);
        return dao.getObject(transportCode).planRef.code;
    }

    public int getPlanCodeByEstimate(int estimateCode)    throws PersistenceException
    {
        ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(connection, userProfile);
        return objectDAO.getObject(estimateCode).planRef.code;
    }

    public int getPlanCodeByEstimateNoSegr(int estimateCode)    throws PersistenceException
    {
        ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(connection, userProfile);
        return objectDAO.getObjectNoSegr(estimateCode).planRef.code;
    }


    public int getPlanCodeByItem(int itemCode)    throws PersistenceException
    {
        ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(connection, userProfile);
        return objectDAO.getObject(itemCode).planRef.code;
    }

    public ENPlanWork getPlanBySeal(SCSeal seal) throws PersistenceException
    {
    	if (seal == null)
    	{
    		return null;
    	}

    	if (seal.estimateItemRef == null)
    	{
    		return null;
    	}

    	if (seal.estimateItemRef.code == Integer.MIN_VALUE)
    	{
    		return null;
    	}

    	ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);
    	ENEstimateItem estimateItem = estimateItemDAO.getObject(seal.estimateItemRef.code);

    	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

    	return planDAO.getObjectNOSEGR(estimateItem.planRef.code);
    }

    public int getParentPlanWorkCode(ENPlanWork plan) throws PersistenceException
    {
        return getParentPlanWorkCode(plan, true);
    }

    public int getParrentKind(int currentKind){
        int out = Integer.MIN_VALUE;
        return out;
    }

    public int getParentPlanWorkCode(ENPlanWork plan, boolean isException) throws PersistenceException
    {

        // ���������� ��� �������� �� �����

        /*ENElementDAO etdao = new ENElementDAO(connection, userProfile);
        ENElementFilter etf = new ENElementFilter();
        etf.conditionSQL = " code = " + plan.elementRef.code ;
        int elementtype = 0;
        ENElementShortList l = etdao.getScrollableFilteredList(etf,0,-1);
        if (l.totalCount>0){
            elementtype = l.get(0).typeRefCode;

        }*/

        ElementLogic elLogic = new ElementLogic(connection, userProfile);
        // int elType = elLogic.getElementTypeByPlanCode(planCode);
        int elementtype = elLogic.getElementTypeByPlanCode(plan.code);

        //ENPlanWorkItem out = null;
        int parentPlanCode = Integer.MIN_VALUE;

        int corrReason = Integer.MIN_VALUE;
        //int newStatus = Integer.MIN_VALUE;

        if (plan.kind.code == ENPlanWorkKind.FACT)
            corrReason = ENPlanCorrectReason.MOVE_TO_FACT;
        else
        if (plan.kind.code == ENPlanWorkKind.NPW)
            corrReason = ENPlanCorrectReason.MOVE_TO_NPW;
        else
        if (plan.kind.code == ENPlanWorkKind.CURRENT && elementtype != ENElementType.SERVICES_OBJECT  )
            corrReason = ENPlanCorrectReason.MOVE_TO_CURRENT;
        else
        // ���� ���� ������� � ��� ������ �� ������� ����� Reason ����� ���������
        if (plan.kind.code == ENPlanWorkKind.CURRENT && elementtype == ENElementType.SERVICES_OBJECT )
                corrReason = ENPlanCorrectReason.MOVE_FROM_CALCULATION_TO_CURRENT;
        else
            // �� �� ��� �������??? ������ ������� ������� :)
            // ���� ��������� �� ���������� ;)
        {
            if (isException){
                throw new EnergyproSystemException("����� ���� �� ��������������. " + plan.kind.name);
            }
            else{
                return parentPlanCode; //Integer.MIN_VALUE;
            }
        }

        boolean isWriteOffOS = false; // �������� ��������� NET-4383
        if ( plan.stateRef.code == ENPlanWorkState.WRITINGS_OS && plan.typeRef.code == ENPlanWorkType.ENPLANWORKTYPE_WRITEOFF_OS){
        	isWriteOffOS = true;
        }

        if ( (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION && plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT)
        	 &&
        	 (isWriteOffOS == false)
        	){
        parentPlanCode = getParentPlanWorkCode(plan.code, corrReason);


        if ((parentPlanCode == Integer.MIN_VALUE) && (isException)  ){
            throw new EnergyproSystemException("���������� ���� �� ������ ...");
        }
        }


        return parentPlanCode;
    }


    public int getParentPlanWorkCode(int currentPlanCode, int correctReasonCode) throws PersistenceException
    {
        //ENPlanWorkItem out = null;
        int parentPlanCode = Integer.MIN_VALUE;

        ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
        historyFilter.reason.code = correctReasonCode; //ENPlanCorrectReason.MOVE_TO_NPW;
        historyFilter.planNewRef.code = currentPlanCode;
        ENPlanCorrectHistoryShortList historyList = historyDAO.getScrollableFilteredList(historyFilter, 0, -1);
        if (historyList.totalCount > 0)
            parentPlanCode = historyList.get(0).planOldRefCode;

        return parentPlanCode;
    }


    public int getParentCurrentPlanCode(int planCode) throws PersistenceException
    {
        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = pDAO.getObject(planCode);
        return getParentCurrentPlanCode(plan);
    }

    public int getParentCurrentPlanCode(ENPlanWork plan) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;

        ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();

        ENPlanCorrectHistoryShortList historyList;

        int prevPlanCode = Integer.MIN_VALUE;

        /**
         *  SUPP-66344...
         *  18 - �������� ������ �������
         *  ��������� ����� ���....
         */
        if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
        	return plan.code;
        }

        if (plan.kind.code == ENPlanWorkKind.YEAR){
            // � �������� ���� ���� ���� ...
            //throw new EnergyproSystemException("���� ����� ������ ��� ��� � ������ ...");
        }
        else
        if (plan.kind.code == ENPlanWorkKind.CURRENT){
            return plan.code;
        }
        else
        if (plan.kind.code == ENPlanWorkKind.FACT){

            historyFilter.planNewRef.code = plan.code;
            historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT ; //ENPlanCorrectReason.MOVE_TO_NPW;

            historyList = historyDAO.getScrollableFilteredList(historyFilter, 0, -1);
            if (historyList.totalCount == 0 ){
                throw new EnergyproSystemException("���� ��� ��������� ;)");
            }
            else{
                prevPlanCode = historyList.get(0).planOldRefCode;
            }
        }
        else
        if (plan.kind.code == ENPlanWorkKind.NPW){
            prevPlanCode = plan.code;
        }
        else
        {
            throw new EnergyproSystemException("Error on PlanWorkKind ... code = " + plan.kind.code );
        }

        if ( ( prevPlanCode != Integer.MIN_VALUE ) )
        {

            historyFilter = new ENPlanCorrectHistoryFilter();
            historyFilter.planNewRef.code = prevPlanCode;
            historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;

            historyList = historyDAO.getScrollableFilteredList(historyFilter, 0, -1);

            if (historyList.totalCount == 0){
                //throw new EnergyproSystemException("�������� ���� �� ������ ...");
                return out;
            }

            out = historyList.get(0).planOldRefCode;

        }
        //ENPlanWork currentPlan = pDAO.getObject(historyList.get(0).planOldRefCode);

        return out;

    }

    public ENPlanWorkItem getParentCurrentPlanWorkItem(int planItemCode) throws PersistenceException
    {

        // ���� ����� ���������� ��� getParentCurrentPlanCode

        ENPlanWorkItem out = new ENPlanWorkItem();

        out.code = Integer.MIN_VALUE;

        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

        ENPlanWorkItem pItem = piDAO.getObject(planItemCode);

        ENPlanWork plan = pDAO.getObject(pItem.planRef.code);

        ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();

        int currentPlanCode =  plan.code;
        ENPlanCorrectHistoryShortList historyList;

        if ((plan.kind.code == ENPlanWorkKind.YEAR) || (plan.kind.code == ENPlanWorkKind.CURRENT)){
            throw new EnergyproSystemException("���� ����� ������ ��� ��� � ������ ...");
        }
        else
        if (plan.kind.code == ENPlanWorkKind.FACT){

            historyFilter.planNewRef.code = plan.code;
            historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT ; //ENPlanCorrectReason.MOVE_TO_NPW;

            historyList = historyDAO.getScrollableFilteredList(historyFilter, 0, -1);
            if (historyList.totalCount == 0 ){
                throw new EnergyproSystemException("���� ��� ��������� ;)");
            }
            else{
                currentPlanCode = historyList.get(0).planOldRefCode;
            }
        }

        historyFilter = new ENPlanCorrectHistoryFilter();
        historyFilter.planNewRef.code = currentPlanCode;
        historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW ;
        historyList = historyDAO.getScrollableFilteredList(historyFilter, 0, -1);

        if (historyList.totalCount == 0){
            throw new EnergyproSystemException("�������� ���� �� ������ ...");
        }

        ENPlanWork currentPlan = pDAO.getObject(historyList.get(0).planOldRefCode);



        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
        piFilter.planRef.code = currentPlan.code;
        piFilter.kartaRef.code = pItem.kartaRef.code ;


        ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(piFilter, 0, -1);
        // ������ � ����������� �������� �� ����� !!!
        if (piList.totalCount > 0){

        }

        if (piList.totalCount > 0){
            out = piDAO.getObject(piList.get(0).code);
        }
        else{
            out.planRef.code = currentPlan.code;
        }

        return out;
    }



    public ENPlanWorkItem getParentPlanWorkItem(int currentPlanItemCode, int techCardCode, int reasonCorrectCode) throws PersistenceException
    {

        ENPlanWorkItem out = null;

        int planCode = getPlanCodeByItem(currentPlanItemCode);

        int parentPlan = getParentPlanWorkCode(planCode, reasonCorrectCode);

        if (parentPlan == Integer.MIN_VALUE){
            return out;
        }

        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
        piFilter.planRef.code = parentPlan;
        piFilter.kartaRef.code = techCardCode;
        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(piFilter, 0, -1);
        // ������ � ����������� �������� �� ����� !!!
        if (piList.totalCount > 0){

        }

        if (piList.totalCount > 0){
            out = piDAO.getObject(piList.get(0).code);
        }

        return out;
    }



	public int addPlanWorkItem(ENPlanWorkItem object, ENPlanWork plan) throws PersistenceException {
		return addPlanWorkItem(object, plan, null);
	}

	public int addPlanWorkItem(ENPlanWorkItem object, ENPlanWork plan, TKMaterials2TKMaterialsShort m2mShort)
			throws PersistenceException {
		if (object.planRef.code == Integer.MIN_VALUE) {
			new EnergyproSystemException("planRef not found");
		}

        //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWork plan = planDAO.getObject(object.planRef.code);

        if (isNotEditablePlan(plan)) {
            throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
        }


        ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(connection, userProfile);

        object.dateEdit = new Date();
        object.userGen = userProfile.userName;

        object.code = objectDAO.add(object);


        // ����������� ����� ...
        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
        //eLogic.cancelENEstimateItem(object.code); // ��� ���������� ������ ������������� ...


        boolean isFromParent = true;
		if (((plan.kind.code == ENPlanWorkKind.FACT) || (plan.kind.code == ENPlanWorkKind.NPW))
				&& (plan.typeRef.code == ENPlanWorkType.AVR)) {
			isFromParent = false;
		}

        boolean isCalcCost = (plan.kind.code == ENPlanWorkKind.CALCULATION);
		if (plan.kind.code == ENPlanWorkKind.CALCULATION) {
			isFromParent = false;
		}


        eLogic.createENEstimateItems(object.code, isFromParent, m2mShort);


        // ����������� �����
        HumenLogic hLogic = new HumenLogic(connection, userProfile);
        hLogic.createHumenItems(object.code, isCalcCost);


        // ����������� ���������
        TransportLogic tLogic = new TransportLogic(connection, userProfile);
        tLogic.createENTransportItems(object.code);


        // 29.01.2020 ������������ �����������. ����� ���������� ������������ ��������� , ������ �� ����������������, ���������, � ���� ����
		PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(connection, userProfile);

		if (object.kartaRef.code != Integer.MIN_VALUE) {

			TKTechCardDAO tkDAO = new TKTechCardDAO(connection, userProfile);
			TKTechCard tkObj = tkDAO.getObject(object.kartaRef.code);

			TKTechCardSourceKoefDAO srsKoefDAO = new TKTechCardSourceKoefDAO(connection, userProfile);
			TKTechCardSourceKoefFilter srsKofFil = new TKTechCardSourceKoefFilter();
			srsKofFil.budgetRef.code = plan.budgetRef.code;
			srsKofFil.workStateRef.code = plan.stateRef.code;
			srsKofFil.techCardSourceRef.code = tkObj.techcardsource.code;
			int[] srsKofArr = srsKoefDAO.getFilteredCodeArray(srsKofFil, 0, -1);

			if (srsKofArr.length > 0) {

				ENPlanWorkItem2TKKoef item2tkKoef = new ENPlanWorkItem2TKKoef();
				item2tkKoef.planWorkItemRef.code = object.code;
				item2tkKoef.sourceKoef.code = srsKofArr[0];

				planWorkItemLogic.addPlanWorkItem2TKKoef(item2tkKoef);
			}
		}


        return object.code;
    }

	private int copyPlanWorkOnly4AVR(int planCode, int newStatus, int oldStatus) throws PersistenceException {
		return copyPlanWorkOnly4AVR(planCode, newStatus, oldStatus, null);
	}

    private int copyPlanWorkOnly4AVR(int planCode, int newStatus, int oldStatus, Date newPlanDate) throws PersistenceException
    {

        Connection finConn = null;

        int newPlanCode = Integer.MIN_VALUE;

        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);
        obj.status.code = oldStatus;

        // �� ����� ���� ������� ����������� ... ���� �� ��� ...
        FINExecutor finExecutor = obj.finExecutor;

        dao.save(obj);

        ENPlanWork currentPlan = dao.getObject(obj.code);

        /*NET-2938*/
        try
        {
            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);

            boolean isOS = fkOsLogic.isOS(obj.elementRef.code);
            if(isOS == true)
            {
                    ElementLogic elLogic = new ElementLogic(connection, userProfile);
                    String invNumber = elLogic.getElementInvNumber(obj.elementRef.code);
                    if(invNumber.length() == 5) invNumber = "0" + invNumber;
                    /*���� ������ ����� - �������� ��������, �� ����������� ����������� � ������������*/
                    boolean isInService = fkOsLogic.isInService(invNumber);
                    if(!isInService)
                        throw new EnergyproSystemException("�������� ���� � ���. ������� " + invNumber + " �� �������� � ������������");
            }
        }
        catch(DatasourceConnectException e){}
        finally
        {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }
        // NEW plan ............


        ENPlanWork newObj = new ENPlanWork();
        newObj = obj;
        newObj.code = Integer.MIN_VALUE;
        newObj.status.code = newStatus; //ENPlanWorkStatus.INCORRECTION;

        if (obj.kind.code == ENPlanWorkKind.YEAR)
            newObj.kind.code = ENPlanWorkKind.CURRENT;
        else
        if (obj.kind.code == ENPlanWorkKind.CURRENT)
                newObj.kind.code = ENPlanWorkKind.NPW;
        else
            if (obj.kind.code == ENPlanWorkKind.NPW)
                newObj.kind.code = ENPlanWorkKind.FACT;
        else
            new EnergyproSystemException("s NPW ne ponytno cto delat ... paka");



        //newObj.kind.code = ENPlanWorkKind.NPW;
        // �������� ���� ������ ������ ��� ��� !!!
        if (newObj.kind.code == ENPlanWorkKind.NPW)
        {
        	if (newPlanDate != null) {
        		newObj.dateStart = newObj.dateFinal = newPlanDate;
        	} else {
        		newObj.dateStart = newObj.dateFinal = genNextDateForNPZ(currentPlan);
        	}

        	/////
        	// 24.06.16 ����� ��������� ����� � ���, ������ ��� ����� ���� ����� ������� � ����. �����
        	int newPlanMonth = Tools.getMonth(newObj.dateStart) + 1;
        	int newPlanYear = Tools.getYear(newObj.dateStart);

        	newObj.monthGen = newPlanMonth;
        	newObj.yearGen = newPlanYear;
        	/////
        }

        if (finExecutor.code > Integer.MIN_VALUE){
            newObj.finExecutor.code = new FINExecutorDAO(connection, userProfile).add(finExecutor);
        }
        else
            newObj.finExecutor.code = Integer.MIN_VALUE;




        // ������� ������ ����� !!!! ... ��� ������ ������ �� ���� ���� ..
        // � ��� �� ��������� ���� �������� �����

        newObj.code = dao.add(newObj);
        newPlanCode = newObj.code;

        // ��������� ����� �������� !!! � ���������� ...
        ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
        ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
        dtpFilter.planWorkRef.code = planCode;
        int dtpArr[] = dtpDAO.getFilteredCodeArray(dtpFilter,null, null,0, -1, null);
        for (int i = 0; i < dtpArr.length; i++ ){
            ENDeliveryTimePlan dtp = dtpDAO.getObject(dtpArr[i]);
            dtp.planWorkRef.code = newPlanCode;
            dtp.code = Integer.MIN_VALUE;
            dtpDAO.add(dtp);
        }

        // ��� �� �����  .. ��� ����������
        ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
        ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
        m2pFilter.planRef.code = planCode;
        int arrM2P[] = m2pDAO.getFilteredCodeArray(m2pFilter, null, null, 0, -1, null);
        for (int i=0; i < arrM2P.length; i++){
            //m2pDAO.remove(arrM2P[i]);
            ENMOL2PlanWork m2p = m2pDAO.getObject(arrM2P[i]);
            m2p.planRef.code = newPlanCode;
            m2p.code = Integer.MIN_VALUE;
            m2pDAO.add(m2p);
        }

        // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
        recalcTotalTime(newPlanCode);

        return newPlanCode;
    }

    private int copyPlanWorkOnly(int planCode, int newStatus, int oldStatus) throws PersistenceException {
    	return copyPlanWorkOnly(planCode, newStatus, oldStatus, null);
    }

    private int copyPlanWorkOnly(int planCode, int newStatus, int oldStatus, Date newPlanDate) throws PersistenceException
    {

        int newPlanCode = Integer.MIN_VALUE;

        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);
        obj.status.code = oldStatus;

        // �� ����� ���� ������� ����������� ... ���� �� ��� ...
        FINExecutor finExecutor = obj.finExecutor;

        dao.save(obj);

        ENPlanWork currentPlan = dao.getObject(obj.code);

        // NEW plan ............


        ENPlanWork newObj = new ENPlanWork();
        newObj = obj;
        newObj.code = Integer.MIN_VALUE;
        newObj.status.code = newStatus; //ENPlanWorkStatus.INCORRECTION;

        if (obj.kind.code == ENPlanWorkKind.YEAR)
            newObj.kind.code = ENPlanWorkKind.CURRENT;
        else
        if (obj.kind.code == ENPlanWorkKind.CURRENT)
                newObj.kind.code = ENPlanWorkKind.NPW;
        else
            if (obj.kind.code == ENPlanWorkKind.NPW)
                newObj.kind.code = ENPlanWorkKind.FACT;
        else
            if (obj.kind.code == ENPlanWorkKind.CALCULATION)
                newObj.kind.code = ENPlanWorkKind.CURRENT;
        else
            //new EnergyproSystemException("s NPW ne ponytno cto delat ... paka");
            throw new EnergyproSystemException("����������� ��� ����� (��� = " + obj.kind.code + ")");


        //newObj.kind.code = ENPlanWorkKind.NPW;
        // �������� ���� ������ ������ ��� ��� !!!
        if (newObj.kind.code == ENPlanWorkKind.NPW)
        {
        	if (newPlanDate != null) {
        		newObj.dateStart = newObj.dateFinal = newPlanDate;
        	} else {
        		newObj.dateStart = newObj.dateFinal = genNextDateForNPZ(currentPlan);
        	}

        	/////
        	// 24.06.16 ����� ��������� ����� � ���, ������ ��� ����� ���� ����� ������� � ����. �����
        	// int newPlanMonth = newObj.dateStart.getMonth() + 1;
        	// int newPlanYear = newObj.dateStart.getYear() + 1900;
        	int newPlanMonth = Tools.getMonth(newObj.dateStart) + 1;
        	int newPlanYear = Tools.getYear(newObj.dateStart);

        	newObj.monthGen = newPlanMonth;
        	newObj.yearGen = newPlanYear;
        	/////
        }

        if (finExecutor.code > Integer.MIN_VALUE){
            newObj.finExecutor.code = new FINExecutorDAO(connection, userProfile).add(finExecutor);
        }
        else
            newObj.finExecutor.code = Integer.MIN_VALUE;




        // ������� ������ ����� !!!! ... ��� ������ ������ �� ���� ���� ..
        // � ��� �� ��������� ���� �������� �����

        newObj.code = dao.add(newObj);
        newPlanCode = newObj.code;

        ////////////////////////////////////////
        // 27.08.12 NET-2800 �������� ��������� ����������� �� ����� (��� �������) - � �������� FINExecutor2Plan
        updatePrimaryFinExecutor(newObj);
        ////////////////////////////////////////


        // ��������� ����� �������� !!! � ���������� ...
        ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
        ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
        dtpFilter.planWorkRef.code = planCode;
        int dtpArr[] = dtpDAO.getFilteredCodeArray(dtpFilter,null, null,0, -1, null);
        for (int i = 0; i < dtpArr.length; i++ ){
            ENDeliveryTimePlan dtp = dtpDAO.getObject(dtpArr[i]);
            dtp.planWorkRef.code = newPlanCode;
            dtp.code = Integer.MIN_VALUE;
            dtpDAO.add(dtp);
        }


        if (obj.kind.code != ENPlanWorkKind.CALCULATION)
        {
        // ��� �� �����  .. ��� ����������
        ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
        ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
        m2pFilter.planRef.code = planCode;
        int arrM2P[] = m2pDAO.getFilteredCodeArray(m2pFilter, null, null, 0, -1, null);
        for (int i=0; i < arrM2P.length; i++){
            //m2pDAO.remove(arrM2P[i]);
            ENMOL2PlanWork m2p = m2pDAO.getObject(arrM2P[i]);
            m2p.planRef.code = newPlanCode;
            m2p.code = Integer.MIN_VALUE;
            m2pDAO.add(m2p);
        }
        }

        // ��� ����, ����� �����
            if (obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE &&
                obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
            {
                // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
            	if (newObj.kind.code == ENPlanWorkKind.CURRENT)
            	{
            		// 26.11.14 ��� ����������� �������� ����� � �������� �� ���� ��������� ����������� ������������!!!
            		recalcTotalTime(newPlanCode, true);
            	}
            	else
            	{
            		recalcTotalTime(newPlanCode);
            	}
            }


            /* 20.03.2012 +++ ���� ���� �� ������� �� ��, ��������� � ������ "���� - ������� �� ��" */
            ENTechCond2PlanWorkDAO ty2plDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
        ENTechCond2PlanWorkFilter ty2plFilter = new ENTechCond2PlanWorkFilter();
        ty2plFilter.planRef.code = planCode;
        int ty2plArr[] = ty2plDAO.getFilteredCodeArray(ty2plFilter, 0, -1);

        if (ty2plArr.length > 0) {
            ENTechCond2PlanWork ty2pl = new ENTechCond2PlanWork();
            ENTechCond2PlanWork oldTy2pl = ty2plDAO.getObject(ty2plArr[0]);

			/// �������� �� ��������� ����� � ��������� ���������
            ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			ENTechCond2PlanWorkFilter tc2planFilter = new ENTechCond2PlanWorkFilter();
			tc2planFilter.planRef.code = planCode;
			tc2planFilter.conditionSQL = " techconservicesrefcode <> " + oldTy2pl.techConServicesRef.code;
			int[] tc2plArr = ty2plDAO.getFilteredCodeArray(tc2planFilter,0,-1);
			if (tc2plArr.length > 0) {
				ENTechCond2PlanWork tc2pl = ty2plDAO.getObject(tc2plArr[0]);
				throw new SystemException("��� ���� ��� ��������������� � ������� - " +
						soDAO.getObjectByTechConditionsServices(techCondDao.getObject(tc2pl.techConServicesRef.code)).contractNumberServices);
			}
			///

            ty2pl.code = Integer.MIN_VALUE;
            ty2pl.planRef.code = newPlanCode;
            ty2pl.techConServicesRef.code = oldTy2pl.techConServicesRef.code;

            ty2plDAO.add(ty2pl);
        }


        /* 25.04.2017 +++ ���� ���� �� ������� �� ������ ����� ��� ������ ������, � ������� ����
         * ������ � �������, ��
         *  ��������� � ������ "���� - ������� �� ������ �� �������" */
    ENServices2PlanDAO s2pDAO = new ENServices2PlanDAO(connection, userProfile);
    ENServices2PlanFilter s2pFilter = new ENServices2PlanFilter();
    s2pFilter.planRef.code = planCode;
    int s2pArr[] = s2pDAO.getFilteredCodeArray(s2pFilter, 0, -1);

    if (s2pArr.length > 0) {
    	/*
    	// ��� ����� �������� � ������ ���������� ������ ���� � ENServices2Plan ��������� ��� ����
    	// ������ ��� ����������. ��� ������ ���������� ���� dfPackCode � �� �������������... ((
    	ENServices2Plan s2p = new ENServices2Plan();
    	ENServices2Plan olds2p = s2pDAO.getObject(s2pArr[0]);

    	s2p.code = Integer.MIN_VALUE;
    	s2p.planRef.code = newPlanCode;
    	s2p.servicesObjectRef.code = olds2p.servicesObjectRef.code;
		*/
    	ENServices2Plan s2p = s2pDAO.getObject(s2pArr[0]);
    	s2p.code = Integer.MIN_VALUE;
    	s2p.planRef.code = newPlanCode;

    	s2pDAO.add(s2p);
    }


        /* 28.04.2012 +++ ��� ��������� �������� ������� */
        if (obj.typeRef.code == ENPlanWorkType.TRUCKING) {
            TransportRouteLogic trLogic = new TransportRouteLogic(connection, userProfile);
            trLogic.copyRoute(planCode, newPlanCode);
        }


        return newPlanCode;
    }

    public int copyPlanForNPZ(int planCode, int newStatus, int oldStatus)  throws PersistenceException
    {
        int newPlanCode = Integer.MIN_VALUE;

/*
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);
        obj.status.code = oldStatus;
        dao.save(obj);

        ENPlanWork newObj = new ENPlanWork();
        newObj = obj;
        newObj.code = Integer.MIN_VALUE;
        newObj.status.code = newStatus; //ENPlanWorkStatus.INCORRECTION;
        newObj.kind.code = ENPlanWorkKind.NPW;
        newObj.dateStart = newObj.dateFinal = genNextDateForNPZ(planCode);
        newObj.code = dao.add(newObj);
        newPlanCode = newObj.code;
*/
        newPlanCode = copyPlanWorkOnly(planCode, newStatus, oldStatus);

        //ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
        //ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
        //ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);

        ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();
        itemFilter.planRef.code = planCode;
        ENPlanWorkItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter,0,-1);
        for (int i=0; i < itemList.totalCount; i++){
            ENPlanWorkItem item = new ENPlanWorkItem();
            ENPlanWorkItem newItem = new ENPlanWorkItem();
            item = itemDAO.getObject(itemList.get(i).code);

            newItem = item;
            // ����� ���������� - ����� item ������ (�� ��� ;))) ... ����� ��������� .. ��� ��� � ������
            item = null;

            newItem.countGen = new BigDecimal(0);
            newItem.planRef.code = newPlanCode;
            newItem.dateEdit = new Date();
            newItem.userGen = userProfile.userName;
            newItem.code = itemDAO.add(newItem);
        }

        // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
        // recalcTotalTime(newPlanCode); 13.03.12 � ��� !!! ���� ����������� ���!

        return newPlanCode;
    }



	public int copyPlan(ENPlanCorrectHistory object, int newStatus,
			int oldStatus) throws PersistenceException {

		return copyPlan(object.planOldRef.code, newStatus, oldStatus, null);
	}

	public int copyPlan(int planCode, int newStatus, int oldStatus,
			ENPlanWorkItemShort[] planWorkItemArr) throws PersistenceException {

		return copyPlan(planCode, newStatus, oldStatus, planWorkItemArr, false);
	}

	public int copyPlan(int planCode, int newStatus, int oldStatus,
			ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier) throws PersistenceException {
		return copyPlan(planCode, newStatus, oldStatus, planWorkItemArr, isForSupplier, null);
	}

	public int copyPlan(int planCode, int newStatus, int oldStatus,
			ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier, Date newPlanDate) throws PersistenceException {

		int newPlanCode = Integer.MIN_VALUE;
		int oldPlanItemCode = Integer.MIN_VALUE;

        int newTransportItemCode = Integer.MIN_VALUE;
        int oldTransportItemCode = Integer.MIN_VALUE;

        int newEstimateCode = Integer.MIN_VALUE;

        try {

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);


			ENMarkEstimateDAO meDAO = new ENMarkEstimateDAO(connection, userProfile);
			ENPlanWork oldPlan = planDAO.getObject(planCode);

			ElementLogic eLogic = new ElementLogic(connection, userProfile);
			int eType = eLogic.getElementTypeByPlanCode(planCode);

			if (eType != ENElementType.SERVICES_OBJECT) {
				if (oldPlan.yearGen >= 2016) {
					/* 03.03.2020 SUPP-89938 ���� ������, �.�. ����������� ���������, � �������� �� ������� ������� ����������
					checkForProhibitedWorks(planCode, eType, "������� ���������� ��� �����!", isForSupplier);
					*/
				}
			}

			// ���� ������ ���� .... �����������������
			if ((oldPlan.kind.code == ENPlanWorkKind.CURRENT) && (oldPlan.typeRef.code == ENPlanWorkType.AVR)) {
				newPlanCode = copyPlanWorkOnly4AVR(planCode, newStatus, oldStatus);
				return newPlanCode;
				// ������������ ��� ��� !!!!!!!!!!!!
			}
			else
			{
				newPlanCode = copyPlanWorkOnly(planCode, newStatus, oldStatus, newPlanDate);
        	}


			ENPlanWork plan = planDAO.getObject(newPlanCode);



	        // ��������� �����
	        //FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
	        ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
	        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(connection, userProfile);

	        int woNewCode = Integer.MIN_VALUE;
	        int woOldCode;
	        ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
	        w2pFilter.plan.code = planCode;
	        ENWorkOrder2ENPlanWorkShortList w2pList = w2pDAO.getScrollableFilteredList(w2pFilter, 0, -1);

	        Vector<int[]> molCodesVector = new Vector<>();
	        int newMolCode = Integer.MIN_VALUE;
	        int oldMolCode = Integer.MIN_VALUE;

	        if (w2pList.totalCount > 0 ) {
	            ENWorkOrder wo = woDAO.getObject(w2pList.get(0).workOrderCode);
	            woOldCode = w2pList.get(0).workOrderCode;
	            wo.code = Integer.MIN_VALUE;
	            woNewCode = woDAO.add(wo);

	            //ENWorkOrder2ENPlanWork w2p = w2pDAO.getObject(w2pList.get(0).)
	            ENWorkOrder2ENPlanWork w2p = new ENWorkOrder2ENPlanWork();
	            w2p.plan.code = newPlanCode;
	            w2p.workOrder.code = woNewCode;
	            w2pDAO.add(w2p);

	            // ��������� ������ �������� ���������� � ��
	            FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(connection, userProfile);
	            FINMolDataDAO molDataDAO = new FINMolDataDAO(connection, userProfile);


	            FINMolDataFilter molFilter = new FINMolDataFilter();
	            molFilter.workOrder.code = woOldCode;

	            int[] molArr = molDataDAO.getFilteredCodeArray(molFilter,0,-1);

	            for (int qq = 0; qq < molArr.length; qq++) {
	                FINMolData m = molDataDAO.getObject(molArr[qq]);
	                oldMolCode = m.code;
	                m.workOrder.code = woNewCode;
	                newMolCode = molDataDAO.add(m);
	                int[] molCodes = new int[2];
	                molCodes[0] = oldMolCode;
	                molCodes[1] = newMolCode;
	                molCodesVector.add(molCodes);
	                FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
	                d2mFilter.molData.code = oldMolCode;
	                int[] d2mArr = d2mDAO.getFilteredCodeArray(d2mFilter, 0, -1);
	                for (int qqq = 0; qqq < d2mArr.length; qqq++) {
	                    FINDoc2MolData d2m = d2mDAO.getObject(d2mArr[qqq]);
	                    d2m.molData.code = newMolCode;
	                    d2mDAO.save(d2m);
	                }
	            }
	        }


	        // ��� ����������� - ��������� ����������� ...
	        // ���� ���� ����� :( ... �������� ��� ���� ..
	        //if (��� ����� = �����������){}
	        ENBindingOverFilter boFilter = new ENBindingOverFilter();
	        boFilter.planRef.code = planCode;
	        ENBindingOverDAO boDAO = new ENBindingOverDAO(connection, userProfile);
	        int[] boArr = boDAO.getFilteredCodeArray(boFilter,0,-1);
	        if (boArr.length > 0){
	            ENBindingOver bo = boDAO.getObject(boArr[0]);
	            bo.planRef.code = newPlanCode;
	            boDAO.add(bo);
	        }


	        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
	        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
	        ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
	        ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
	        FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
	        FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);

	        SCCounterDAO scDAO = new SCCounterDAO(connection, userProfile);
	        SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);
	        SCSeal2ENWorkOrderBytDAO seal2wbDAO = new SCSeal2ENWorkOrderBytDAO(connection, userProfile);

			FINWorkerDAO finWorkerFKDAO = null;
			Connection finConn = null;

			try {
				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);
				finWorkerFKDAO = new FINWorkerDAO(finConn, userProfile);

	            /*NET-2938*/
	            boolean isOS = fkOsLogic.isOS(plan.elementRef.code);
	            if(isOS == true)
	            {
	                    ElementLogic elLogic = new ElementLogic(connection, userProfile);
	                    String invNumber = elLogic.getElementInvNumber(plan.elementRef.code);
	                    if(invNumber.length() == 5) invNumber = "0" + invNumber;
	                    /*���� ������ ����� - �������� ��������, �� ����������� ����������� � ������������*/
	                    boolean isInService = fkOsLogic.isInService(invNumber);
	                    if(!isInService)
	                        throw new EnergyproSystemException("�������� ���� � ���. ������� " + invNumber + " �� �������� � ������������");
	            }

			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			}
			try {
				finConn.close();
				finConn = null;
				finWorkerFKDAO = null;

			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}



	        ENPlanWorkItem2TKKoefDAO k2DAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
	        //TKTechCardDAO techCardDAO = new TKTechCardDAO(connection, userProfile);

	        TransportLogic transportLogic = new TransportLogic(connection, userProfile);
	        EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);
	        HumenLogic humenLogic = new HumenLogic(connection, userProfile);

	        TKMaterialsDAO materialsDAO = new TKMaterialsDAO(connection, userProfile);

	        ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(connection, userProfile);
	        ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();
	        itemFilter.planRef.code = planCode;

	        /*21.10.2011 18:06 ������������� � �������� ������ ����������*/
	        itemFilter.conditionSQL = " TKTECHCARD.code not in (select tc.code from tktechcard as tc, tkclassificationtype as tkcls where tkcls.code = tc.classificationtypecode and tkcls.isnotlicensedactivity = 3)";

	        ENPlanWorkItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

	        newMolCode = Integer.MIN_VALUE;
	        oldMolCode = Integer.MIN_VALUE;

	        for (int i=0; i < itemList.totalCount; i++) {

	            ENPlanWorkItem item = new ENPlanWorkItem();
	            ENPlanWorkItem newItem = new ENPlanWorkItem();
	            item = itemDAO.getObject(itemList.get(i).code);

	            /////
	            // TKTechCard techCard = techCardDAO.getObject(item.kartaRef.code);
	            /////

	            oldPlanItemCode = item.code;

	            newItem = item;
	            // ����� ���������� - ����� item ������ (�� ��� ;))) ... ����� ��������� .. ��� ��� � ������
	            item = null;

	            newItem.planRef.code = newPlanCode;
	            newItem.dateEdit = new Date();
	            newItem.userGen = userProfile.userName;

	            newItem.code = itemDAO.add(newItem);



	            // ��������� ���� ��� ����� ...
	            ENPlanWorkItem2TKKoefFilter k2Filter = new ENPlanWorkItem2TKKoefFilter();
	            k2Filter.planWorkItemRef.code = oldPlanItemCode;
	            int[] k2arr = k2DAO.getFilteredCodeArray(k2Filter, null, null, 0, -1, null);
	            for (int k2=0; k2 < k2arr.length ; k2++){
	                ENPlanWorkItem2TKKoef kf2 = k2DAO.getObject(k2arr[k2]);
	                kf2.planWorkItemRef.code = newItem.code;
	                k2DAO.add(kf2);
	            }


	            // ��������� ��������� ..... ���������� � �������, ������������� - ��������� ����
	            ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
	            estFilter.planItemRef.code = oldPlanItemCode;

	            // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
	            /* 12.01.2012 +++ ���� ������, �� ���� ���� */

	            if (oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
	                    || oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
	                estFilter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
	                        + ENEstimateItemKind.SERVICES + ")";
	            } else {
	            //    estFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
	            // ���������� ��������� ��������� 14.06.2012
	                estFilter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
	                + ENEstimateItemKind.CUSTOMER_MATERIALS + ")";
	            }

	            //ENEstimateItemShortList estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
	            int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

	            /* 24.11.2011 +++  ��� �������������� ������������� ������ ��� ����������� ������ */
	            // ���� ������ ���� ���������� - �������� ...
	            /* if (estArr.length == 0){
	                estimateLogic.createENEstimateItems(newItem.code, false);
	            }
	            else */

	            for (int j=0; j < estArr.length; j++) {
	                ENEstimateItem est = new ENEstimateItem();
	                ENEstimateItem newEst = new ENEstimateItem();
	                est = estDAO.getObject(estArr[j]);
	                newEst = est; // ����� ������� ����� !!!
	                // ������ ��� ��� ��������� ����� � newEst ��� ��������� � � est!!! � ���������, ����� ���������� � �����
	                // (est.code � ����� ( ����� ������ estDAO.add(newEst) ) ����� ����� ������ ���������, � �� �������, ��� ����� ���� �� ��������!!!)
	                newEst.planRef.code = newPlanCode;
	                newEst.planItemRef.code = newItem.code;
	                newEst.dateEdit = new Date();
	                newEst.userGen = userProfile.userName;

	                /////
	                // ��� ����� ����� ��� ����� �� ����������� ���������� (���� ���� �� ��� ����) -
	                // ������ ��� ���������� �� ������� ����� � ������������ ����� �����
	                TKMaterials material = materialsDAO.getObject(est.materialRef.code);
	                if (material.accountingTypeRef.code == TKAccountingType.SEAL ||
	                	material.accountingTypeRef.code == TKAccountingType.IMP  ||
	                	material.accountingTypeRef.code == TKAccountingType.HOLO)
	                {
	                	newEst.accountingTypeRef.code = material.accountingTypeRef.code;
	                }
	                /////

	                /// 27.12.10 �������� �� ������� ��������� � �������� ������
	                if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
	                estimateLogic.checkInRQOrder(newEst, true);
	                ///

	                // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
	                if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
	                	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
	                }

	                newEstimateCode = estDAO.add(newEst);

	                // ��������� ����������� ��������� ...
	                // ������ ��� ��������� - ����-����
	                if (plan.kind.code == ENPlanWorkKind.FACT){
	                    FINMaterialsFilter finFilter = new FINMaterialsFilter();
	                    finFilter.statusRef.code = FINMaterialsStatus.GOOD;
	                    finFilter.estimateItemRef.code = estArr[j];
	                    FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
	                    for (int k = 0; k < finList.totalCount; k++){
	                        FINMaterials finOld = finDAO.getObject( finList.get(k).code );
	                        FINMaterials finNew = new FINMaterials();
	                        finNew = finOld;
	                        finOld = null;
	                        finNew.estimateItemRef.code = newEstimateCode;
	                        // ������ �������� � ������������� � ������ ��������� ..
	                        newMolCode = Integer.MIN_VALUE;
	                        for (int ii=0; ii < molCodesVector.size(); ii++ ){
	                            int[] molCodes_ = (int[]) molCodesVector.get(ii);
	                            if ( molCodes_[0] == finNew.molDataRef.code ){
	                                newMolCode = molCodes_[1];
	                            }
	                        }
	                        if (newMolCode == Integer.MIN_VALUE){
	                            throw new EnergyproSystemException("Error in newMOLCode for Estimateitem !!!. finmaterialsCode = " + finNew.code);
	                        }
	                        finNew.molDataRef.code = newMolCode;
	                        finDAO.add(finNew);
	                    }

	                    // + �������� �� ��
	                    if (est.accountingTypeRef.code == TKAccountingType.COUNTERS)
	                    {
	                        SCCounterFilter scFilter = new SCCounterFilter();
	                        scFilter.estimateItemRef.code = estArr[j];
	                        int[] scArr = scDAO.getFilteredCodeArray(scFilter, 0, -1);
	                        for (int sc : scArr){
	                            SCCounter scCounter = scDAO.getObject(sc);
	                            scCounter.estimateItemRef.code = newEstimateCode;
	                            scDAO.add(scCounter);
	                        }
	                    }

	                    if (est.accountingTypeRef.code == TKAccountingType.SEAL ||
	                    	est.accountingTypeRef.code == TKAccountingType.IMP ||
	                    	est.accountingTypeRef.code == TKAccountingType.HOLO)
	                    {
	                        SCSealFilter scFilter = new SCSealFilter();
	                        scFilter.estimateItemRef.code = estArr[j]; //est.code;
	                        // !!! � est.code ��� ��� ������������ ���������!!! �� ���� �������� ����������� ��������: newEst = est !!!

	                        int[] scArr = sealDAO.getFilteredCodeArray(scFilter, 0, -1);

	                        for (int sc = 0; sc < scArr.length; sc++){
	                        	SCSeal scSeal = sealDAO.getObject(scArr[sc]);
	                        	scSeal.estimateItemRef.code = newEstimateCode;
	                        	int newSealCode = sealDAO.add(scSeal);

	                            // ������� ������ SCSeal2WorkOrderByt �� �������� �� ����� SCSeal'� � kindRefCode = 2 (����) !!!!!
	                            SCSeal2ENWorkOrderBytFilter scSeal2wbFilter = new SCSeal2ENWorkOrderBytFilter();
	                            scSeal2wbFilter.sealRef.code = scArr[sc];
	                            scSeal2wbFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;

	                            int[] scSeal2wbArr = seal2wbDAO.getFilteredCodeArray(scSeal2wbFilter, 0, -1);

	                            for (int w = 0; w < scSeal2wbArr.length; w++)
	                            {
	                            	SCSeal2ENWorkOrderByt scSeal2wb = seal2wbDAO.getObject(scSeal2wbArr[w]);
	                            	scSeal2wb.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
	                            	scSeal2wb.sealRef.code = newSealCode;
	                            	seal2wbDAO.add(scSeal2wb);
	                            }
	                        }
	                    }
	                }

	                // �������� �������� ���-��� � ��������� ...
	                ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
	                meFilter.estimateItem.code = estArr[j];
	                int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
	                for (int me=0; me < meArr.length; me++){
	                    ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
	                    meObj.estimateItem.code = newEstimateCode;
	                    meDAO.add(meObj);
	                }

	                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
	                e2e.estimateItemInRef.code = estArr[j];
	                e2e.estimateItemOutRef.code = newEstimateCode;
	                e2e.countGen = est.countFact;
	                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
	                e2eDAO.add(e2e);

	            }


	            // ��������� ������ ��� � ���������� ...
	            estFilter = new ENEstimateItemFilter();
	            estFilter.planItemRef.code = oldPlanItemCode;
	            // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
	            estFilter.kindRef.code = ENEstimateItemKind.GSM;
	            estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null";
	            //estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
	            estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

	            for (int j=0; j < estArr.length; j++) {
	                /*
	                if (1 == 1){
	                    System.out.println("copy bad estimate , code = " + estArr[j]);
	                    throw new EnergyproSystemException("�������� ������ !!! (��� � �������������??)");
	                }
	                */

	                ENEstimateItem est = new ENEstimateItem();
	                ENEstimateItem newEst = new ENEstimateItem();
	                est = estDAO.getObject(estArr[j]);
	                newEst = est;
	                newEst.planRef.code = newPlanCode;
	                newEst.planItemRef.code = newItem.code;
	                newEst.dateEdit = new Date();
	                newEst.userGen = userProfile.userName;

	                /* �� ��� ���� �� ������� ???
	                /// 27.12.10 �������� �� ������� ��������� � �������� ������
	                //if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
	                //  estimateLogic.checkInRQOrder(newEst, true);
	                ///
	                */
	             // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
	                if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
	                	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
	                }

	                newEstimateCode = estDAO.add(newEst);

	                // ��������� ����������� ��������� ...
	                // ������ ��� ��������� - ����-����
	                if (plan.kind.code == ENPlanWorkKind.FACT){
	                    FINMaterialsFilter finFilter = new FINMaterialsFilter();
	                    finFilter.statusRef.code = FINMaterialsStatus.GOOD;
	                    finFilter.estimateItemRef.code = estArr[j];
	                    FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
	                    for (int k = 0; k < finList.totalCount; k++){
	                        FINMaterials finOld = finDAO.getObject( finList.get(k).code );
	                        FINMaterials finNew = new FINMaterials();
	                        finNew = finOld;
	                        finOld = null;
	                        finNew.estimateItemRef.code = newEstimateCode;
	                        // ������ �������� � ������������� � ������ ��������� ..
	                        newMolCode = Integer.MIN_VALUE;
	                        for (int ii=0; ii < molCodesVector.size(); ii++ ){
	                            int[] molCodes_ = (int[]) molCodesVector.get(ii);
	                            if ( molCodes_[0] == finNew.molDataRef.code ){
	                                newMolCode = molCodes_[1];
	                            }
	                        }
	                        if (newMolCode == Integer.MIN_VALUE){
	                            throw new EnergyproSystemException("Error in newMOLCode for Estimateitem !!!. finmaterialsCode = " + finNew.code);
	                        }
	                        finNew.molDataRef.code = newMolCode;
	                        finDAO.add(finNew);
	                    }
	                }

	                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
	                e2e.estimateItemInRef.code = estArr[j];
	                e2e.estimateItemOutRef.code = newEstimateCode;
	                e2e.countGen = est.countFact;
	                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
	                e2eDAO.add(e2e);

	            }

	            ///////////////////////////////////////////////////////////////////

	            // ��������� �������������� (�������� !!!) ��������� ...
	            estFilter = new ENEstimateItemFilter();
	            estFilter.planItemRef.code = oldPlanItemCode;
	            estFilter.kindRef.code = ENEstimateItemKind.UNMOUNT;


	            estArr = estDAO.getFilteredCodeArray(estFilter,0,-1);
	            for (int j=0; j < estArr.length; j++) {
	                ENEstimateItem est = new ENEstimateItem();
	                ENEstimateItem newEst = new ENEstimateItem();
	                est = estDAO.getObject(estArr[j]);
	                newEst = est;
	                newEst.planRef.code = newPlanCode;
	                newEst.planItemRef.code = newItem.code;
	                newEst.dateEdit = new Date();
	                newEst.userGen = userProfile.userName;
	                newEstimateCode = estDAO.add(newEst);
	            }


	            // ��������� ����� ...���������� � �������, ������������� - ��������� ����
	            ENHumenItemFilter hFilter = new ENHumenItemFilter();
	            hFilter.planItemRef.code = oldPlanItemCode;
	            ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hFilter,0,-1);
	            if ( hList.totalCount == 0) {
	                humenLogic.createHumenItems(newItem.code);
	            }
	            else
	            for (int j=0; j < hList.totalCount; j++){
	                ENHumenItem h = new ENHumenItem();
	                ENHumenItem newH = new ENHumenItem();
	                h = hDAO.getObject(hList.get(j).code);
	                newH = h;
	                newH.planRef.code = newPlanCode;
	                newH.planItemRef.code = newItem.code;
	                newH.dateEdit = new Date();
	                newH.userGen = userProfile.userName;

	                FINWorker w = newH.finWorker;
	                if ( (w != null)  )
	                {
	                    if (w.tabNumber != null) {

	                        if (finWorkerFKDAO != null) {
	                            FINWorkerFilter ff = new FINWorkerFilter();
	                            ff.tabNumber = w.tabNumber;
	                            FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff,0,-1, plan.dateStart, true);
	                            if (fList.totalCount > 0) {
	                                w.categor = fList.get(0).categor;
	                                w.departmentCode = fList.get(0).departmentCode;
	                                w.departmentName = fList.get(0).departmentName;
	                                w.finCode = fList.get(0).finCode;
	                                w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
	                                w.name = fList.get(0).name;
	                                w.positionCode = fList.get(0).positionCode;
	                                w.positionName = fList.get(0).positionName;
	                                w.priceGen = fList.get(0).priceGen;
	                                w.tabNumber = fList.get(0).tabNumber;
	                                /////
	                                w.categorId = fList.get(0).categorId;
	                                w.categorName = fList.get(0).categorName;
	                                w.workTimeId = fList.get(0).workTimeId;
	                                /////
	                                // MDAX-441
	                                w.positionId = fList.get(0).positionId;

	                                w.code = Integer.MIN_VALUE;
	                                newH.finWorker.code = finWorkerDAO.add(w);

	                            } else {

	                                newH.finWorker = new FINWorker();
	                            }
	                        }
	                    }
	                }

	                hDAO.add(newH);
	            }


	            // ��������� ��������� ...���������� � �������, ������������� - ��������� ����
	            ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
	            ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection, userProfile);

	            ENTransportItem2TransportItemDAO t2tDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);

	            ENTransportItemFilter tFilter = new ENTransportItemFilter();
	            tFilter.planItemRef.code = oldPlanItemCode;
	            //ENTransportItemShortList tList = tDAO.getScrollableFilteredList(tFilter,0,-1);
	            int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);

	            if ( tArr.length == 0){
	                transportLogic.createENTransportItems(newItem.code);
	            }
	            else {
	            for (int j=0; j < tArr.length; j++){
	                ENTransportItem t = new ENTransportItem();
	                ENTransportItem newT = new ENTransportItem();
	                t = tDAO.getObject(tArr[j]);

	                oldTransportItemCode = tArr[j];

	                newT = t;
	                newT.planRef.code = newPlanCode;
	                newT.planItemRef.code = newItem.code;
	                newT.dateEdit = new Date();
	                newT.userGen = userProfile.userName;

	                // ��������� ����������� ����������� �� ���������
	                FINWorker w = newT.finWorker;
	                if (w != null){
	                    if (w.tabNumber != null) {

	                        if (finWorkerFKDAO != null) {
	                            FINWorkerFilter ff = new FINWorkerFilter();
	                            ff.tabNumber = w.tabNumber;
	                            FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff,0,-1, plan.dateStart, true);
	                            if (fList.totalCount > 0) {
	                                w.categor = fList.get(0).categor;
	                                w.departmentCode = fList.get(0).departmentCode;
	                                w.departmentName = fList.get(0).departmentName;
	                                w.finCode = fList.get(0).finCode;
	                                w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
	                                w.name = fList.get(0).name;
	                                w.positionCode = fList.get(0).positionCode;
	                                w.positionName = fList.get(0).positionName;
	                                w.priceGen = fList.get(0).priceGen;
	                                w.tabNumber = fList.get(0).tabNumber;
	                                /////
	                                w.categorId = fList.get(0).categorId;
	                                w.categorName = fList.get(0).categorName;
	                                w.workTimeId = fList.get(0).workTimeId;
	                                /////
	                                // MDAX-441
	                                w.positionId = fList.get(0).positionId;

	                                w.code = Integer.MIN_VALUE;
	                                newT.finWorker.code = finWorkerDAO.add(w);

	                            } else {

	                                newT.finWorker = new FINWorker();
	                            }
	                        }
	                    }
	                }

	                // �������� ��������� !!!
	                newTransportItemCode = tDAO.add(newT);

	            //     ENTransportItem

	                // �������� ����� ������� ...
	                if (oldPlan.kind.code == ENPlanWorkKind.NPW){
	                    ENTransportItem2TransportItem t2t = new ENTransportItem2TransportItem();
	                    t2t.inRef.code = oldTransportItemCode;
	                    t2t.outRef.code = newTransportItemCode;
	                    t2tDAO.add(t2t);
	                }

	                // ��������� ���������� .... ��� ����� ���������� ..

	                ENDistanceFilter dFilter = new ENDistanceFilter();
	                dFilter.transportItemRef.code = oldTransportItemCode ; // ���������� ��� ����� ����������
	                ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);
	                for (int n=0; n<dList.totalCount; n++){
	                    ENDistance dist = dDAO.getObject(dList.get(n).code);
	                    dist.transportItemRef.code = newTransportItemCode;
	                    dist.code = Integer.MIN_VALUE;
	                    dDAO.add(dist);
	                }

	                // ���������� ��������


	                // ��������� .. ��� �������� �������� ��� ��� ����� ���������� ...
	                // ���� �� �������� � �������� ...

	                if ( newT.transportReal != null ){
	                    if ( newT.transportReal.code > Integer.MIN_VALUE){
	                        ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
	                        t2eFilter.transportRef.code = tArr[j] ;
	                        ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);

	                        if (t2eList.totalCount > 0)
	                        {
	                            for (int n=0; n < t2eList.totalCount; n++){
	                                ENEstimateItem gsmE = estDAO.getObject(t2eList.get(n).estimateRefCode);
	                                ENEstimateItem gsmENew = gsmE;
	                                gsmENew.planRef.code = newPlanCode;
	                                gsmENew.planItemRef.code = newItem.code;
	                                newEstimateCode = estDAO.add(gsmENew);

	                                ENTransport2ENEstimate t2eNew = new ENTransport2ENEstimate();
	                                t2eNew.estimateRef.code = newEstimateCode; //gsmENew.code;
	                                t2eNew.transportRef.code = newTransportItemCode; //newT.code;
	                                t2eDAO.add(t2eNew);

	                                // ��������� ����������� ��������� ... ������ �� ����� ...
	                                // ������ �������� ����������� ��� ...
	                                if (plan.kind.code == ENPlanWorkKind.FACT){
	                                    FINMaterialsFilter finFilter = new FINMaterialsFilter();
	                                    finFilter.estimateItemRef.code = t2eList.get(n).estimateRefCode;
	                                    finFilter.statusRef.code = FINMaterialsStatus.GOOD;
	                                    FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
	                                    for (int k = 0; k < finList.totalCount; k++){
	                                        FINMaterials finOld = finDAO.getObject( finList.get(k).code );
	                                        FINMaterials finNew = new FINMaterials();
	                                        finNew = finOld;
	                                        finOld = null;
	                                        finNew.estimateItemRef.code = gsmENew.code;

	                                        // ������ �������� � ������������� � ������ ��������� ..
	                                        newMolCode = Integer.MIN_VALUE;
	                                        for (int ii=0; ii < molCodesVector.size(); ii++ ){
	                                            int[] molCodes_ = (int[]) molCodesVector.get(ii);
	                                            if ( molCodes_[0] == finNew.molDataRef.code ){
	                                                newMolCode = molCodes_[1];
	                                            }
	                                        }
	                                        if (newMolCode == Integer.MIN_VALUE){
	                                            throw new EnergyproSystemException("Error in newMOLCode for GSMEstimateitem !!!. GSMfinmaterialsCode = " + finNew.code);
	                                        }
	                                        finNew.molDataRef.code = newMolCode;
	                                        finDAO.add(finNew);
	                                }
	                            }

	                            }
	                        }
	                        else
	                        {
	                        transportLogic.generateGSMEstimate(newT.code);
	                        }
	                    }
	                    else {
	                        transportLogic.generateNORMGSM(newT.code);
	                        }
	                }
	                else {
	                    transportLogic.generateNORMGSM(newT.code);
	                    }

	/*
	                if ( newT.transportReal != null ){
	                    if ( newT.transportReal.code > Integer.MIN_VALUE){
	                        ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
	                        t2eFilter.transportRef.code = tList.get(j).code ;
	                        ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);

	                        if (t2eList.totalCount > 0){
	                        for (int n=0; n < t2eList.totalCount; n++){

	                        }
	                        }
	                        else
	                        {
	                            // �������� �������� ��� ���� ������ ...
	                            ENEstimateItem ee = new ENEstimateItem();
	                            ee.kindRef.code = ENEstimateItemKind.GSM;
	                            ee.planRef.code = newT.planRef.code;
	                            ee.planItemRef.code = newT.planItemRef.code;
	                            ee.countGen = new BigDecimal(0);
	                            ee.materialRef.code = transportLogic.getMaterialByFuelType( newT.transportReal.transportmark.fueltype.code ); // ��� ����� �� ������� !!!!!!!!!!!!!!!!
	                            ee.typeRef.code = ENEstimateItemType.AUTO;
	                            ee.countFact = transportLogic.calculateFuelCount(newTransportItemCode) ;// ��������� !!! ;)
	                            ee.cost = new BigDecimal(0); // ???
	                            ee.userGen = userProfile.userName;
	                            ee.dateEdit = new Date();


	                        }

	                    }
	                } // ����� ��������� ��� ���
	*/
	            }

	            /*
	            ������� ��� ������ ��������� � ����� ��������� ���� ����
	            ������ ��� �������� - �� ������   ������ ���� ������ � ��� �
	            ����� ����� "���������" � ����� ������������ ���������� "���������"- ����� ���� �� ����� 0. �� ������ �������
	            �������� ������ ��������� ����� ���� (�� ������������ ��
	            �������� ) � ������� �� ������ ����. ������ ������� ����
	            ������ ����� ���� .
	            */
	            ENPlanWorkDAO objPlanOldDAO = new ENPlanWorkDAO(connection,userProfile);
	            ENPlanWork objPlanOld = objPlanOldDAO.getObject(planCode);
	            if (objPlanOld.kind.code == ENPlanWorkKind.CALCULATION  ) {
	            ENTransportItemDAO copyTiDAO = new ENTransportItemDAO(connection, userProfile);
	            // ���� ���������� �� ������ ����� � ����� ��������� � ����� ����� ���������
	            ENTransportItemFilter ti1Filter = new ENTransportItemFilter();
	            ti1Filter.planRef.code = planCode;
	            ti1Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti  , tktransport tr , tktransportmark trm " +
	                                    " where ti.planitemrefcode = " + oldPlanItemCode  +
	                                    "  and  ti.transportcode =  tr.code " +
	                                    "  and  tr.transporttypecode = " + TKTransportType.BRIGADE +  /*���������*/
	                                    "  and  tr.transportmarkcode = trm.code " +
	                                    "  and  trm.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/ " limit 1 ) ";
	            ENTransportItemShortList ti1List = copyTiDAO.getScrollableFilteredList(ti1Filter,0,-1);
	            // ���� ���������� �� ������ ����� � ����� ������ ���������
	            ENTransportItemFilter ti2Filter = new ENTransportItemFilter();
	            ti2Filter.planRef.code = planCode;
	            ti2Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti  , tktransport tr " +
	                                    " where ti.planitemrefcode = " + oldPlanItemCode  +
	                                    "  and  ti.transportcode =  tr.code " +
	                                    "  and  tr.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/
	                                    " ) ";
	            ENTransportItemShortList ti2List = copyTiDAO.getScrollableFilteredList(ti2Filter,0,-1);
	            // ���� ��������� ���� � ����� ���� �� ��������� �����
	            if (ti1List.totalCount> 0 && ti2List.totalCount == 0) {
	                ENTransportItem tiOldCopy = new ENTransportItem();
	                ENTransportItem tiNewCopy = new ENTransportItem();
	                tiOldCopy = tDAO.getObject(ti1List.get(0).code);

	                tiNewCopy = tiOldCopy;
	                tiNewCopy.planRef.code = newPlanCode;
	                tiNewCopy.planItemRef.code = newItem.code;
	                tiNewCopy.dateEdit = new Date();
	                tiNewCopy.userGen = userProfile.userName;
	                tiNewCopy.tktransportType.code = TKTransportType.AUTOTOWER;
	                // ������� ����� ������
	                copyTiDAO.add(tiNewCopy);
	                /// ��������� ������ ������� ��� ����������� ���������
	                transportLogic.generateNORMGSM(tiNewCopy.code);
	                // ������ ���� �� ��������� ������ � ������ ������� ��������� �� �������� ���� ��� ��������� ����������
	                ENTransportItemFilter brigFilter = new ENTransportItemFilter();
	                brigFilter.planRef.code = newPlanCode;
	                brigFilter.planItemRef.code = newItem.code;
	                brigFilter.transport.code = tiOldCopy.transport.code;
	                brigFilter.tktransportType.code = TKTransportType.BRIGADE;
	                ENTransportItemShortList brigList = copyTiDAO.getScrollableFilteredList(brigFilter,0,-1);

	                if (brigList.totalCount > 0 ) {
		                ENTransportItem brigItemObj = copyTiDAO.getObject(brigList.get(0).code);
		                brigItemObj.countWorkFact = new BigDecimal(0);
		                brigItemObj.countWorkGen = new BigDecimal(0);
		                copyTiDAO.save(brigItemObj);
	                }


	              }

	            }
	           }

	        }
	        // end planWorkItem

        // ��������� ��������� .. ������� �� ��������� � ������� �����
        ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
        estFilter.planRef.code = planCode;
        estFilter.conditionSQL = "planitemrefcode is null";
        //ENEstimateItemShortList estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
        int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
        for (int i=0; i < estArr.length; i++) {
            ENEstimateItem est = new ENEstimateItem();
            ENEstimateItem newEst = new ENEstimateItem();
            est = estDAO.getObject(estArr[i]);
            newEst = est;
            newEst.planRef.code = newPlanCode;
            newEst.dateEdit = new Date();
            newEst.userGen = userProfile.userName;

            /// 27.12.10 �������� �� ������� ��������� � �������� ������
            if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
            estimateLogic.checkInRQOrder(newEst, true);
            ///

         // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
            if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
            	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
            }

            newEstimateCode = estDAO.add(newEst);

            // ��������� ����������� ��������� ...
            // ������ ������� ����-����
            if (plan.kind.code == ENPlanWorkKind.FACT){
                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.estimateItemRef.code = estArr[i];
                FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
                for (int k = 0; k < finList.totalCount; k++){
                    FINMaterials finOld = finDAO.getObject( finList.get(k).code );
                    FINMaterials finNew = new FINMaterials();
                    finNew = finOld;
                    finOld = null;
                    finNew.estimateItemRef.code = newEstimateCode;

                    // ������ �������� � ������������� � ������ ��������� ..
                    newMolCode = Integer.MIN_VALUE;
                    for (int ii=0; ii < molCodesVector.size(); ii++ ){
                        int[] molCodes_ = (int[]) molCodesVector.get(ii);
                        if ( molCodes_[0] == finNew.molDataRef.code ){
                            newMolCode = molCodes_[1];
                        }
                    }
                    if (newMolCode == Integer.MIN_VALUE){
                        throw new EnergyproSystemException("Error in newMOLCode for NOPlanWorkItem Estimateitem !!!. NOPlanWorkItem finmaterialsCode = " + finNew.code);
                    }
                    finNew.molDataRef.code = newMolCode;
                    finDAO.add(finNew);
                }

                // + �������� �� ��
                if (est.accountingTypeRef.code == TKAccountingType.COUNTERS) {
                    SCCounterFilter scFilter = new SCCounterFilter();
                    scFilter.estimateItemRef.code = estArr[i];
                    int[] scArr = scDAO.getFilteredCodeArray(scFilter, 0, -1);
                    for (int sc : scArr){
                        SCCounter scCounter = scDAO.getObject(sc);
                        scCounter.estimateItemRef.code = newEstimateCode;
                        scDAO.add(scCounter);
                    }
                }

                if (est.accountingTypeRef.code == TKAccountingType.SEAL ||
                    est.accountingTypeRef.code == TKAccountingType.IMP ||
                    est.accountingTypeRef.code == TKAccountingType.HOLO)
                {
                    SCSealFilter scFilter = new SCSealFilter();
                    scFilter.estimateItemRef.code = estArr[i]; //est.code;
                    // !!! � est.code ��� ��� ������������ ���������!!! �� ���� �������� ����������� ��������: newEst = est !!!

                    int[] scArr = sealDAO.getFilteredCodeArray(scFilter, 0, -1);

                    for (int sc = 0; sc < scArr.length; sc++){
                    	SCSeal scSeal = sealDAO.getObject(scArr[sc]);
                    	scSeal.estimateItemRef.code = newEstimateCode;
                    	int newSealCode = sealDAO.add(scSeal);

                        // ������� ������ SCSeal2WorkOrderByt �� �������� �� ����� SCSeal'� � kindRefCode = 2 (����) !!!!!
                        SCSeal2ENWorkOrderBytFilter scSeal2wbFilter = new SCSeal2ENWorkOrderBytFilter();
                        scSeal2wbFilter.sealRef.code = scArr[sc];
                        scSeal2wbFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;

                        int[] scSeal2wbArr = seal2wbDAO.getFilteredCodeArray(scSeal2wbFilter, 0, -1);

                        for (int w = 0; w < scSeal2wbArr.length; w++)
                        {
                        	SCSeal2ENWorkOrderByt scSeal2wb = seal2wbDAO.getObject(scSeal2wbArr[w]);
                        	scSeal2wb.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
                        	scSeal2wb.sealRef.code = newSealCode;
                        	seal2wbDAO.add(scSeal2wb);
                        }
                    }


                }
            }

            // �������� �������� ���-��� � ��������� ...
            ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
            meFilter.estimateItem.code = estArr[i];
            int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
            for (int me=0; me < meArr.length; me++){
                ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
                meObj.estimateItem.code = newEstimateCode;
                meDAO.add(meObj);
            }

            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
            e2e.estimateItemInRef.code = estArr[i];
            e2e.estimateItemOutRef.code = newEstimateCode;
            e2e.countGen = est.countFact;
            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            e2eDAO.add(e2e);

        }



        // ��������� ������ ��� � ���������� ...
        estFilter = new ENEstimateItemFilter();
        estFilter.planRef.code = planCode;

        // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
        estFilter.kindRef.code = ENEstimateItemKind.GSM;
        estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null and enestimateitem.planitemrefcode is null";
        //estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
        estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

        for (int j=0; j < estArr.length; j++){
            ENEstimateItem est = new ENEstimateItem();
            ENEstimateItem newEst = new ENEstimateItem();
            est = estDAO.getObject(estArr[j]);
            newEst = est;
            newEst.planRef.code = newPlanCode;
            newEst.dateEdit = new Date();
            newEst.userGen = userProfile.userName;

            // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
            if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
            	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
            }

            newEstimateCode = estDAO.add(newEst);

            // ��������� ����������� ��������� ...
            // ������ ��� ��������� - ����-����
            if (plan.kind.code == ENPlanWorkKind.FACT){
                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.estimateItemRef.code = estArr[j];
                FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
                for (int k = 0; k < finList.totalCount; k++){
                    FINMaterials finOld = finDAO.getObject( finList.get(k).code );
                    FINMaterials finNew = new FINMaterials();
                    finNew = finOld;
                    finOld = null;
                    finNew.estimateItemRef.code = newEstimateCode;
                    // ������ �������� � ������������� � ������ ��������� ..
                    newMolCode = Integer.MIN_VALUE;
                    for (int ii=0; ii < molCodesVector.size(); ii++ ){
                        int[] molCodes_ = (int[]) molCodesVector.get(ii);
                        if ( molCodes_[0] == finNew.molDataRef.code ){
                            newMolCode = molCodes_[1];
                        }
                    }
                    if (newMolCode == Integer.MIN_VALUE){
                        throw new EnergyproSystemException("Error in newMOLCode for Estimateitem !!!. finmaterialsCode = " + finNew.code);
                    }
                    finNew.molDataRef.code = newMolCode;
                    finDAO.add(finNew);
                }
            }

            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
            e2e.estimateItemInRef.code = estArr[j];
            e2e.estimateItemOutRef.code = newEstimateCode;
            e2e.countGen = est.countFact;
            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            e2eDAO.add(e2e);

        }
////////////////////////////////////////////////////

        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //��� ������ ��������� ����/��������� ��� ����� - ������������ �������� !!!
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // ��������� ����� .. ������� �� ��������� � ������� �����
/*
 *  !!!!!!  ������ ���� ��� !!!!!!!!!!!!!!
 *
        ENHumenItemFilter hFilter = new ENHumenItemFilter();
        hFilter.planRef.code = planCode;
        hFilter.conditionSQL = "planitemrefcode is null";
        ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hFilter,0,-1);
        for (int i=0; i < hList.totalCount; i++){
            ENHumenItem h = new ENHumenItem();
            ENHumenItem newH = new ENHumenItem();
            h = hDAO.getObject(hList.get(i).code);
            newH = h;
            newH.planRef.code = newPlanCode;
            newH.dateEdit = new Date();
            newH.userGen = userProfile.userName;
            hDAO.add(newH);
        }

        // ��������� ��������� .. ������� �� ��������� � ������� �����
        ENTransportItemFilter tFilter = new ENTransportItemFilter();
        tFilter.planRef.code = planCode;
        tFilter.conditionSQL = "planitemrefcode is null";
        ENTransportItemShortList tList = tDAO.getScrollableFilteredList(tFilter,0,-1);
        for (int i=0; i < tList.totalCount; i++){
            ENTransportItem t = new ENTransportItem();
            ENTransportItem newT = new ENTransportItem();
            t = tDAO.getObject(tList.get(i).code);
            newT = t;
            newT.planRef.code = newPlanCode;
            newT.dateEdit = new Date();
            newT.userGen = userProfile.userName;
            tDAO.add(newT);
        }
*/

        // � ����� ������������� ���� ����? ... �� ���� �� ����� ��������� ����������������
        //EstimateLogic el = new EstimateLogic(connection, userProfile);
        //el.createENEstimate11(newPlanCode);


    	if (oldPlan.kind.code == ENPlanWorkKind.YEAR && plan.kind.code == ENPlanWorkKind.CURRENT)
    	{
    		// 26.11.14 ��� ����������� �������� ����� � �������� �� ���� ��������� ����������� ������������!!!
    		transportLogic.createDeliveryTimeForPlan(newPlanCode, false, true);
    	}
    	else
    	{
    		transportLogic.createDeliveryTimeForPlan(newPlanCode);
    	}
        humenLogic.createDeliveryTime(newPlanCode);

        // ��� ����, ����� �����
            if (plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE &&
                plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
            {
                // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
            	if (oldPlan.kind.code == ENPlanWorkKind.YEAR && plan.kind.code == ENPlanWorkKind.CURRENT)
            	{
            		// 26.11.14 ��� ����������� �������� ����� � �������� �� ���� ��������� ����������� ������������!!!
            		recalcTotalTime(newPlanCode, true);
            	}
            	else
            	{
            		recalcTotalTime(newPlanCode);
            	}
            }

        /////
        // NET-4440 ������� ������ � ������� ��� �� ���������� �����
        // (��������� �������� = true, ����� ������������ ������� �� ����� ���������,
        // ������ ��� ��� ����� ���� ��������� ��� ������� generateGSMEstimate � generateNORMGSM,
        // �� �� ��� ���� estimateitem'�� � ����� "���")
        generatePlanFuelHistory(newPlanCode, plan.dateStart, true);
        /////


        /** ********************************************************* */
        /** 31.05.2017 +++ ������������ ������ � ����� �����������... */
        if (planWorkItemArr != null && planWorkItemArr.length > 0) {

            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENPlanWorkItemController.JNDI_NAME);
            ENPlanWorkItemControllerHome planWorkItemHome = (ENPlanWorkItemControllerHome) PortableRemoteObject
                    .narrow(objRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();


            ENPlanWorkItemFilter planWorkItemFilter = new ENPlanWorkItemFilter();
            planWorkItemFilter.planRef.code = newPlanCode;
            int itemArr[] = itemDAO.getFilteredCodeArray(planWorkItemFilter, 0, -1);

            for (int p = 0; p < itemArr.length; p++) {

            	ENPlanWorkItem planWorkItem = itemDAO.getObject(itemArr[p]);

            	for (int n = 0; n < planWorkItemArr.length; n++) {

            		if (planWorkItemArr[n].kartaRefCode == planWorkItem.kartaRef.code
            				&& planWorkItemArr[n].countGen.doubleValue() != planWorkItem.countGen.doubleValue()) {

            			planWorkItem.countGen = planWorkItemArr[n].countGen;
            			planWorkItemController.save(planWorkItem, false, false);
            		}
            	}
            }
        }
        /** ********************************************************* */


        return newPlanCode;

		}

		catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


    public int copyPlanForTemplate(int planCode, ENPlanWork newPlan) throws PersistenceException
    {
        int newPlanCode = Integer.MIN_VALUE;
        int oldPlanItemCode = Integer.MIN_VALUE;

        int newTransportItemCode = Integer.MIN_VALUE;
        int oldTransportItemCode = Integer.MIN_VALUE;

        int newEstimateCode = Integer.MIN_VALUE;

        Connection finConn = null;

        try
        {


            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

/*
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);
        obj.status.code = oldStatus;
        dao.save(obj);

        ENPlanWork newObj = new ENPlanWork();
        newObj = obj;
        newObj.code = Integer.MIN_VALUE;
        newObj.status.code = newStatus; //ENPlanWorkStatus.INCORRECTION;
        newObj.code = dao.add(newObj);
        newPlanCode = newObj.code;
*/

        ENMarkEstimateDAO meDAO = new ENMarkEstimateDAO(connection, userProfile);

        ENPlanWork oldPlan = planDAO.getObject(planCode);

        //**************** newPlanCode = copyPlanWorkOnly(planCode, newStatus, oldStatus);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //int newPlanCode = Integer.MIN_VALUE;

        //ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = planDAO.getObject(planCode);
        //obj.status.code = oldStatus;

        // �� ����� ���� ������� ����������� ... ���� �� ��� ...
        FINExecutor finExecutor = obj.finExecutor;

        //dao.save(obj);

        //ENPlanWork currentPlan = planDAO.getObject(obj.code);

        // NEW plan ............


        ENPlanWork newObj = new ENPlanWork();
        newObj = obj;
        newObj.code = Integer.MIN_VALUE;
        newObj.status.code = ENPlanWorkStatus.GOOD; //newStatus; //ENPlanWorkStatus.INCORRECTION;

        if (newPlan.kind.code != ENPlanWorkKind.YEAR && newPlan.kind.code != ENPlanWorkKind.CURRENT)
        {
            throw new EnergyproSystemException("����������� ��� ����� (��� = " + obj.kind.code + ")");
        }

        newObj.formRef.code = newPlan.formRef.code;
        newObj.kind.code = newPlan.kind.code;

        newObj.yearGen = newPlan.yearGen;
        newObj.monthGen = newPlan.monthGen;

        /////
        Calendar calendar_ = Calendar.getInstance();
        calendar_.clear(Calendar.HOUR);
        calendar_.clear(Calendar.HOUR_OF_DAY);
        calendar_.clear(Calendar.MINUTE);
        calendar_.clear(Calendar.SECOND);
        calendar_.clear(Calendar.MILLISECOND);
        calendar_.set(newObj.yearGen, newObj.monthGen - 1, 1); // ��������� ������� � ���� ������ ���������� � 0 (������ = 0)!!!
        newObj.dateStart = calendar_.getTime();

        // �� ������� ���� ��������� ����� �� ����� ������
        // (���� ��� ������������� ����� ������ recalcTotalTime - ��� ���� ������, ����� ����� �� �������)
        Calendar calendar_2 = Calendar.getInstance();
        calendar_2.clear(Calendar.HOUR);
        calendar_2.clear(Calendar.HOUR_OF_DAY);
        calendar_2.clear(Calendar.MINUTE);
        calendar_2.clear(Calendar.SECOND);
        calendar_2.clear(Calendar.MILLISECOND);
        calendar_2.set(newObj.yearGen, newObj.monthGen - 1, calendar_.getActualMaximum(Calendar.DAY_OF_MONTH));
        newObj.dateFinal = calendar_2.getTime();
        /////


        //newObj.kind.code = ENPlanWorkKind.NPW;
        // �������� ���� ������ ������ ��� ��� !!!
        //if (newObj.kind.code == ENPlanWorkKind.NPW)
        //   newObj.dateStart = newObj.dateFinal = genNextDateForNPZ(currentPlan);

        if (finExecutor != null && finExecutor.code > Integer.MIN_VALUE) {
            newObj.finExecutor.code = new FINExecutorDAO(connection, userProfile).add(finExecutor);
        }
        else
            newObj.finExecutor.code = Integer.MIN_VALUE;

        newObj.priConnectionNumber = ""; // ???
        newObj.commentGen = ""; // ???

        newObj.yearOriginal = Integer.MIN_VALUE;
        newObj.monthOriginal = Integer.MIN_VALUE;

        if (newObj.typeRef.code == ENPlanWorkType.WORK_IN_OUT)
        {
            throw new EnergyproSystemException("ֳ ����� ��������� ����� � ���� \"������� �� �������\"!");
        }

        ///////
        // ��� ���� �������� add �����������, � �� ��� !!!
        //newObj.code = planDAO.add(newObj);

        Context planCnt = new InitialContext();
        Object planRef = planCnt.lookup(ENPlanWorkController.JNDI_NAME);
        ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
        ENPlanWorkController planController = planHome.create();
        newObj.code = planController.add(newObj);

        newPlanCode = newObj.code;
        ///////

        // ��������� ����� �������� !!! � ���������� ...
        ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
        ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
        dtpFilter.planWorkRef.code = planCode;
        int dtpArr[] = dtpDAO.getFilteredCodeArray(dtpFilter,null, null,0, -1, null);
        for (int i = 0; i < dtpArr.length; i++ ){
            ENDeliveryTimePlan dtp = dtpDAO.getObject(dtpArr[i]);
            dtp.planWorkRef.code = newPlanCode;
            dtp.code = Integer.MIN_VALUE;
            dtpDAO.add(dtp);
        }


        // ��� �� �����  .. ��� ����������
        ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
        ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
        m2pFilter.planRef.code = planCode;
        int arrM2P[] = m2pDAO.getFilteredCodeArray(m2pFilter, null, null, 0, -1, null);
        for (int i=0; i < arrM2P.length; i++){
        //m2pDAO.remove(arrM2P[i]);
        ENMOL2PlanWork m2p = m2pDAO.getObject(arrM2P[i]);
        m2p.planRef.code = newPlanCode;
        m2p.code = Integer.MIN_VALUE;
        m2pDAO.add(m2p);
        }


        /* ��� �� ���� ����
        // ��� ����, ����� �����
            if (obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE &&
                obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
            {
                // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
                recalcTotalTime(newPlanCode);
            }
            */


            /* ���� ���� �� ������� �� ��, �� ������� - �� ����� ��������� � ����� ��������*/
        ENTechCond2PlanWorkDAO ty2plDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
        ENTechCond2PlanWorkFilter ty2plFilter = new ENTechCond2PlanWorkFilter();
        ty2plFilter.planRef.code = planCode;
        int ty2plArr[] = ty2plDAO.getFilteredCodeArray(ty2plFilter, 0, -1);

        if (ty2plArr.length > 0) {
            /*
            ENTechCond2PlanWork ty2pl = new ENTechCond2PlanWork();
            ENTechCond2PlanWork oldTy2pl = ty2plDAO.getObject(ty2plArr[0]);

            ty2pl.code = Integer.MIN_VALUE;
            ty2pl.planRef.code = newPlanCode;
            ty2pl.techConServicesRef.code = oldTy2pl.techConServicesRef.code;

            ty2plDAO.add(ty2pl);
            */
            throw new EnergyproSystemException("ֳ ����� ������� �������� � ����� �������� (���� \"������� �� �������\" -> \"���������\")!");
        }



        // return newPlanCode;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        ENPlanWork plan = planDAO.getObject(newPlanCode);


        /*
        // ��� ����������� - ��������� ����������� ...
        // ���� ���� ����� :( ... �������� ��� ���� ..
        //if (��� ����� = �����������){}
        ENBindingOverFilter boFilter = new ENBindingOverFilter();
        boFilter.planRef.code = planCode;
        ENBindingOverDAO boDAO = new ENBindingOverDAO(connection, userProfile);
        int[] boArr = boDAO.getFilteredCodeArray(boFilter,0,-1);
        if (boArr.length > 0){
            ENBindingOver bo = boDAO.getObject(boArr[0]);
            bo.planRef.code = newPlanCode;
            boDAO.add(bo);
        }
        */


        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
        //ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
        ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
        //FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
        FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);

        ElementLogic elementLogic = new ElementLogic(connection, userProfile);
        int eType = elementLogic.getElementTypeByPlan(plan);

        FINWorkerDAO finWorkerFKDAO = null;
        try
        {
            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);
            finWorkerFKDAO = new FINWorkerDAO(finConn, userProfile);

            /*NET-2938*/
            boolean isOS = fkOsLogic.isOS(plan.elementRef.code);
            if(isOS == true)
            {
                    String invNumber = elementLogic.getElementInvNumber(plan.elementRef.code);
                    if(invNumber.length() == 5) invNumber = "0" + invNumber;
                    /*���� ������ ����� - �������� ��������, �� ����������� ����������� � ������������*/
                    boolean isInService = fkOsLogic.isInService(invNumber);
                    if(!isInService)
                        throw new EnergyproSystemException("�������� ���� � ���. ������� " + invNumber + " �� �������� � ������������");
            }
        }
        catch (DatasourceConnectException e) {
            //throw new EnergyproSystemException("��� ����� � ������������� ...",e);
            finConn = null;
            finWorkerFKDAO = null;
        }

        checkForProhibitedWorks(planCode, eType, "�� ����� �������� ����� ����!");

        ENPlanWorkItem2TKKoefDAO k2DAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);

        TransportLogic transportLogic = new TransportLogic(connection, userProfile);
        EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);
        HumenLogic humenLogic = new HumenLogic(connection, userProfile);

        ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();
        itemFilter.planRef.code = planCode;

        /*21.10.2011 18:06 ������������� � �������� ������ ����������*/
        itemFilter.conditionSQL = " TKTECHCARD.code not in (select tc.code from tktechcard as tc, tkclassificationtype as tkcls where tkcls.code = tc.classificationtypecode and tkcls.isnotlicensedactivity = 3)";

        ENPlanWorkItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter,0,-1);

        //newMolCode = Integer.MIN_VALUE;
        //oldMolCode = Integer.MIN_VALUE;
        for (int i=0; i < itemList.totalCount; i++){
            ENPlanWorkItem item = new ENPlanWorkItem();
            ENPlanWorkItem newItem = new ENPlanWorkItem();
            item = itemDAO.getObject(itemList.get(i).code);

            oldPlanItemCode = item.code;

            newItem = item;
            // ����� ���������� - ����� item ������ (�� ��� ;))) ... ����� ��������� .. ��� ��� � ������
            item = null;

            newItem.planRef.code = newPlanCode;
            newItem.dateEdit = new Date();
            newItem.userGen = userProfile.userName;

            newItem.code = itemDAO.add(newItem);

            // ��������� ���� ��� ����� ...
            ENPlanWorkItem2TKKoefFilter k2Filter = new ENPlanWorkItem2TKKoefFilter();
            k2Filter.planWorkItemRef.code = oldPlanItemCode;
            int[] k2arr = k2DAO.getFilteredCodeArray(k2Filter, null, null, 0, -1, null);
            for (int k2=0; k2 < k2arr.length ; k2++){
                ENPlanWorkItem2TKKoef kf2 = k2DAO.getObject(k2arr[k2]);
                kf2.planWorkItemRef.code = newItem.code;
                k2DAO.add(kf2);
            }


            // ��������� ��������� ..... ���������� � �������, ������������� - ��������� ����
            ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
            estFilter.planItemRef.code = oldPlanItemCode;
            // SUPP-96143 �� ����� ���������� ���������, ����������� �� ������ �������
            estFilter.conditionSQL = " coalesce(ENESTIMATEITEM.TYPEREFCODE, 0) <> " + ENEstimateItemType.MANUAL_BY_PLANITEM;

            // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
            /* 12.01.2012 +++ ���� ������, �� ���� ���� */

            if (oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                    || oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                estFilter.conditionSQL = estFilter.conditionSQL + " AND ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
                        + ENEstimateItemKind.SERVICES + ")";
            } else {
                estFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
            }

            //ENEstimateItemShortList estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
            int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

            /* 24.11.2011 +++  ��� �������������� ������������� ������ ��� ����������� ������ */
            // ���� ������ ���� ���������� - �������� ...
            /* if (estArr.length == 0){
                estimateLogic.createENEstimateItems(newItem.code, false);
            }
            else */

            for (int j=0; j < estArr.length; j++){
                ENEstimateItem est = new ENEstimateItem();
                ENEstimateItem newEst = new ENEstimateItem();
                est = estDAO.getObject(estArr[j]);
                newEst = est;
                newEst.code = Integer.MIN_VALUE;
                newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                newEst.planRef.code = newPlanCode;
                newEst.planItemRef.code = newItem.code;
                newEst.dateEdit = new Date();
                newEst.userGen = userProfile.userName;

                /// �������� �� ������� ��������� � �������� ������
                // if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
                if (newPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.countFact.doubleValue() > 0)
                estimateLogic.checkInRQOrder(newEst, true);
                ///

                newEstimateCode = estDAO.add(newEst);

                // �������� �������� ���-��� � ��������� ... // ??? � ���� �� ? ����� ���� �����
                ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
                meFilter.estimateItem.code = estArr[j];
                int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
                for (int me=0; me < meArr.length; me++){
                    ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
                    meObj.estimateItem.code = newEstimateCode;
                    meDAO.add(meObj);
                }

                /*
                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
                e2e.estimateItemInRef.code = estArr[j];
                e2e.estimateItemOutRef.code = newEstimateCode;
                e2e.countGen = est.countFact;
                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
                e2eDAO.add(e2e);
                */
            }


            // ��������� ������ ��� � ���������� ...
            estFilter = new ENEstimateItemFilter();
            estFilter.planItemRef.code = oldPlanItemCode;
            // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
            estFilter.kindRef.code = ENEstimateItemKind.GSM;
            estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null";
            //estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
            estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

            for (int j=0; j < estArr.length; j++){
                /*
                if (1 == 1){
                    System.out.println("copy bad estimate , code = " + estArr[j]);
                    throw new EnergyproSystemException("�������� ������ !!! (��� � �������������??)");
                }
                */

                ENEstimateItem est = new ENEstimateItem();
                ENEstimateItem newEst = new ENEstimateItem();
                est = estDAO.getObject(estArr[j]);
                newEst = est;
                newEst.code = Integer.MIN_VALUE;
                newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                newEst.planRef.code = newPlanCode;
                newEst.planItemRef.code = newItem.code;
                newEst.dateEdit = new Date();
                newEst.userGen = userProfile.userName;

                /* �� ��� ���� �� ������� ???
                /// 27.12.10 �������� �� ������� ��������� � �������� ������
                //if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
                //  estimateLogic.checkInRQOrder(newEst, true);
                ///
                */

             // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
                if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
                	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
                }

                newEstimateCode = estDAO.add(newEst);

                /*
                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
                e2e.estimateItemInRef.code = estArr[j];
                e2e.estimateItemOutRef.code = newEstimateCode;
                e2e.countGen = est.countFact;
                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
                e2eDAO.add(e2e);
                */
            }

            ///////////////////////////////////////////////////////////////////

            // ��������� �������������� (�������� !!!) ��������� ...
            estFilter = new ENEstimateItemFilter();
            estFilter.planItemRef.code = oldPlanItemCode;
            estFilter.kindRef.code = ENEstimateItemKind.UNMOUNT;


            estArr = estDAO.getFilteredCodeArray(estFilter,0,-1);
            for (int j=0; j < estArr.length; j++){
                ENEstimateItem est = new ENEstimateItem();
                ENEstimateItem newEst = new ENEstimateItem();
                est = estDAO.getObject(estArr[j]);
                newEst = est;
                newEst.code = Integer.MIN_VALUE;
                newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                newEst.planRef.code = newPlanCode;
                newEst.planItemRef.code = newItem.code;
                newEst.dateEdit = new Date();
                newEst.userGen = userProfile.userName;
                newEstimateCode = estDAO.add(newEst);
            }


            // ��������� ����� ...���������� � �������, ������������� - ��������� ����
            ENHumenItemFilter hFilter = new ENHumenItemFilter();
            hFilter.planItemRef.code = oldPlanItemCode;
            ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hFilter,0,-1);
            if ( hList.totalCount == 0){
                humenLogic.createHumenItems(newItem.code);
            }
            else
            for (int j=0; j < hList.totalCount; j++){
                ENHumenItem h = new ENHumenItem();
                ENHumenItem newH = new ENHumenItem();
                h = hDAO.getObject(hList.get(j).code);
                newH = h;
                newH.planRef.code = newPlanCode;
                newH.planItemRef.code = newItem.code;
                newH.dateEdit = new Date();
                newH.userGen = userProfile.userName;

                FINWorker w = newH.finWorker;
                if ( (w != null)  )
                {
                    if (w.tabNumber != null) {

                        if (finWorkerFKDAO != null) {
                            FINWorkerFilter ff = new FINWorkerFilter();
                            ff.tabNumber = w.tabNumber;
                            FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff,0,-1, plan.dateStart, true);
                            if (fList.totalCount > 0) {
                                w.categor = fList.get(0).categor;
                                w.departmentCode = fList.get(0).departmentCode;
                                w.departmentName = fList.get(0).departmentName;
                                w.finCode = fList.get(0).finCode;
                                w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
                                w.name = fList.get(0).name;
                                w.positionCode = fList.get(0).positionCode;
                                w.positionName = fList.get(0).positionName;
                                w.priceGen = fList.get(0).priceGen;
                                w.tabNumber = fList.get(0).tabNumber;
                                /////
                                w.categorId = fList.get(0).categorId;
                                w.categorName = fList.get(0).categorName;
                                w.workTimeId = fList.get(0).workTimeId;
                                /////
                                // MDAX-441
                                w.positionId = fList.get(0).positionId;

                                w.code = Integer.MIN_VALUE;
                                newH.finWorker.code = finWorkerDAO.add(w);

                            } else {

                                newH.finWorker = new FINWorker();
                            }
                        }
                    }
                }

                hDAO.add(newH);
            }


            // ��������� ��������� ...���������� � �������, ������������� - ��������� ����
            ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
            ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection, userProfile);

            //ENTransportItem2TransportItemDAO t2tDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);

            ENTransportItemFilter tFilter = new ENTransportItemFilter();
            tFilter.planItemRef.code = oldPlanItemCode;
            //ENTransportItemShortList tList = tDAO.getScrollableFilteredList(tFilter,0,-1);
            int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);

            if ( tArr.length == 0){
                transportLogic.createENTransportItems(newItem.code);
            }
            else
            for (int j=0; j < tArr.length; j++){
                ENTransportItem t = new ENTransportItem();
                ENTransportItem newT = new ENTransportItem();
                t = tDAO.getObject(tArr[j]);

                oldTransportItemCode = tArr[j];

                newT = t;
                newT.planRef.code = newPlanCode;
                newT.planItemRef.code = newItem.code;
                newT.dateEdit = new Date();
                newT.userGen = userProfile.userName;

                // �� ���������� �� �������� � ������� ������ �� ������ ���� ������� ������� ������
                // (����������, ������ ��� ��� ����� ��������� ��� ����������� �� �������-������/������)
                newT.numberList = null;

                // ��������� ����������� ����������� �� ���������
                FINWorker w = newT.finWorker;
                if (w != null){
                    if (w.tabNumber != null) {

                        if (finWorkerFKDAO != null) {
                            FINWorkerFilter ff = new FINWorkerFilter();
                            ff.tabNumber = w.tabNumber;
                            FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff,0,-1, plan.dateStart, true);
                            if (fList.totalCount > 0) {
                                w.categor = fList.get(0).categor;
                                w.departmentCode = fList.get(0).departmentCode;
                                w.departmentName = fList.get(0).departmentName;
                                w.finCode = fList.get(0).finCode;
                                w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
                                w.name = fList.get(0).name;
                                w.positionCode = fList.get(0).positionCode;
                                w.positionName = fList.get(0).positionName;
                                w.priceGen = fList.get(0).priceGen;
                                w.tabNumber = fList.get(0).tabNumber;
                                /////
                                w.categorId = fList.get(0).categorId;
                                w.categorName = fList.get(0).categorName;
                                w.workTimeId = fList.get(0).workTimeId;
                                /////
                                // MDAX-441
                                w.positionId = fList.get(0).positionId;

                                w.code = Integer.MIN_VALUE;
                                newT.finWorker.code = finWorkerDAO.add(w);

                            } else {

                                newT.finWorker = new FINWorker();
                            }
                        }
                    }
                }

                // �������� ��������� !!!
                newTransportItemCode = tDAO.add(newT);
                /*
                ������� ��� ������ ��������� � ����� ��������� ���� ����
                ������ ��� �������� - �� ������   ������ ���� ������ � ��� �
                ����� ����� "���������" � ����� ������������ ���������� "���������"- ����� ���� �� ����� 0. �� ������ �������
                �������� ������ ��������� ����� ���� (�� ������������ ��
                �������� ) � ������� �� ������ ����. ������ ������� ����
                ������ ����� ���� .
                */
                ENPlanWorkDAO objPlanOldDAO = new ENPlanWorkDAO(connection,userProfile);
                ENPlanWork objPlanOld = objPlanOldDAO.getObject(planCode);
                if (objPlanOld.kind.code == ENPlanWorkKind.CALCULATION  ) {
                ENTransportItemDAO copyTiDAO = new ENTransportItemDAO(connection, userProfile);
                // ���� ���������� �� ������ ����� � ����� ��������� � ����� ����� ���������
                ENTransportItemFilter ti1Filter = new ENTransportItemFilter();
                ti1Filter.planRef.code = planCode;
                ti1Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti  , tktransport tr , tktransportmark trm " +
                                        " where ti.planitemrefcode = " + oldPlanItemCode  +
                                        "  and  ti.transportcode =  tr.code " +
                                        "  and  tr.transporttypecode = " + TKTransportType.BRIGADE +  /*���������*/
                                        "  and  tr.transportmarkcode = trm.code " +
                                        "  and  trm.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/ " limit 1 ) ";
                ENTransportItemShortList ti1List = copyTiDAO.getScrollableFilteredList(ti1Filter,0,-1);
                // ���� ���������� �� ������ ����� � ����� ������ ���������
                ENTransportItemFilter ti2Filter = new ENTransportItemFilter();
                ti2Filter.planRef.code = planCode;
                ti2Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti  , tktransport tr " +
                                        " where ti.planitemrefcode = " + oldPlanItemCode  +
                                        "  and  ti.transportcode =  tr.code " +
                                        "  and  tr.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/
                                        " ) ";
                ENTransportItemShortList ti2List = copyTiDAO.getScrollableFilteredList(ti2Filter,0,-1);
                // ���� ��������� ���� � ����� ���� �� ��������� �����
                if (ti1List.totalCount> 0 && ti2List.totalCount == 0) {
                    ENTransportItem tiOldCopy = new ENTransportItem();
                    ENTransportItem tiNewCopy = new ENTransportItem();
                    tiOldCopy = tDAO.getObject(ti1List.get(0).code);

                    tiNewCopy = tiOldCopy;
                    tiNewCopy.planRef.code = newPlanCode;
                    tiNewCopy.planItemRef.code = newItem.code;
                    tiNewCopy.dateEdit = new Date();
                    tiNewCopy.userGen = userProfile.userName;
                    tiNewCopy.tktransportType.code = TKTransportType.AUTOTOWER;

                    // �� ���������� �� �������� � ������� ������ �� ������ ���� ������� ������� ������
                    // (����������, ������ ��� ��� ����� ��������� ��� ����������� �� �������-������/������)
                    tiNewCopy.numberList = null;

                    // ������� ����� ������
                    copyTiDAO.add(tiNewCopy);
                    // ������ ���� �� ��������� ������ � ������ ������� ��������� �� �������� ���� ��� ��������� ����������
                    ENTransportItemFilter brigFilter = new ENTransportItemFilter();
                    brigFilter.planRef.code = newPlanCode;
                    brigFilter.planItemRef.code = newItem.code;
                    brigFilter.tktransportType.code = TKTransportType.BRIGADE;
                    ENTransportItemShortList brigList = copyTiDAO.getScrollableFilteredList(brigFilter,0,-1);

                    if (brigList.totalCount > 0 ) {
                    ENTransportItem brigItemObj = copyTiDAO.getObject(brigList.get(0).code);
                    brigItemObj.countWorkFact = new BigDecimal(0);
                    copyTiDAO.save(brigItemObj);
                    }


                }

                }
            //     ENTransportItem

                /*
                // �������� ����� ������� ...
                if (oldPlan.kind.code == ENPlanWorkKind.NPW){
                    ENTransportItem2TransportItem t2t = new ENTransportItem2TransportItem();
                    t2t.inRef.code = oldTransportItemCode;
                    t2t.outRef.code = newTransportItemCode;
                    t2tDAO.add(t2t);
                }
                */

                // ��������� ���������� .... ��� ����� ���������� ..

                ENDistanceFilter dFilter = new ENDistanceFilter();
                dFilter.transportItemRef.code = oldTransportItemCode ; // ���������� ��� ����� ����������
                ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);
                for (int n=0; n<dList.totalCount; n++){
                    ENDistance dist = dDAO.getObject(dList.get(n).code);
                    dist.transportItemRef.code = newTransportItemCode;
                    dist.code = Integer.MIN_VALUE;
                    dDAO.add(dist);
                }

                // ���������� ��������


                // ��������� .. ��� �������� �������� ��� ��� ����� ���������� ...
                // ���� �� �������� � �������� ...

                if ( newT.transportReal != null ){
                    if ( newT.transportReal.code > Integer.MIN_VALUE){
                        ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
                        t2eFilter.transportRef.code = tArr[j] ;
                        ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);

                        if (t2eList.totalCount > 0)
                        {
                            for (int n=0; n < t2eList.totalCount; n++){
                                ENEstimateItem gsmE = estDAO.getObject(t2eList.get(n).estimateRefCode);
                                ENEstimateItem gsmENew = gsmE;
                                gsmENew.planRef.code = newPlanCode;
                                gsmENew.planItemRef.code = newItem.code;
                                newEstimateCode = estDAO.add(gsmENew);

                                ENTransport2ENEstimate t2eNew = new ENTransport2ENEstimate();
                                t2eNew.estimateRef.code = newEstimateCode; //gsmENew.code;
                                t2eNew.transportRef.code = newTransportItemCode; //newT.code;
                                t2eDAO.add(t2eNew);
                            }
                        }
                        else
                        {
                        transportLogic.generateGSMEstimate(newT.code);
                        }
                    }
                }
                else {
                    transportLogic.generateNORMGSM(newT.code);
                }

            }
        }

        // ��������� ��������� .. ������� �� ��������� � ������� �����
        ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
        estFilter.planRef.code = planCode;

        ///// 12.04.12 ��� ��� ����� ����� �� ����� - ��� ���, ��� ��������� �� ������� �� ������,
        /////  � � �������� � ������� ������ ��� ��� �� �����
        // estFilter.conditionSQL = "planitemrefcode is null";
        estFilter.conditionSQL = "planitemrefcode is null and kindrefcode <> " + ENEstimateItemKind.GSM;
        /////

        //ENEstimateItemShortList estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
        int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
        for (int i=0; i < estArr.length; i++){
            ENEstimateItem est = new ENEstimateItem();
            ENEstimateItem newEst = new ENEstimateItem();
            est = estDAO.getObject(estArr[i]);
            newEst = est;
            newEst.code = Integer.MIN_VALUE;
            newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
            newEst.planRef.code = newPlanCode;
            newEst.dateEdit = new Date();
            newEst.userGen = userProfile.userName;

            /// 27.12.10 �������� �� ������� ��������� � �������� ������
            if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0)
            estimateLogic.checkInRQOrder(newEst, true);
            ///

            newEstimateCode = estDAO.add(newEst);

            // �������� �������� ���-��� � ��������� ...
            ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
            meFilter.estimateItem.code = estArr[i];
            int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
            for (int me=0; me < meArr.length; me++){
                ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
                meObj.estimateItem.code = newEstimateCode;
                meDAO.add(meObj);
            }

            /*
            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
            e2e.estimateItemInRef.code = estArr[i];
            e2e.estimateItemOutRef.code = newEstimateCode;
            e2e.countGen = est.countFact;
            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            e2eDAO.add(e2e);
            */
        }

        // ��������� ������ ��� � ���������� ...
        estFilter = new ENEstimateItemFilter();
        estFilter.planRef.code = planCode;

        // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
        estFilter.kindRef.code = ENEstimateItemKind.GSM;
        estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null and enestimateitem.planitemrefcode is null";
        //estList = estDAO.getScrollableFilteredList(estFilter,0,-1);
        estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

        for (int j=0; j < estArr.length; j++){
            ENEstimateItem est = new ENEstimateItem();
            ENEstimateItem newEst = new ENEstimateItem();
            est = estDAO.getObject(estArr[j]);
            newEst = est;
            newEst.code = Integer.MIN_VALUE;
            newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
            newEst.planRef.code = newPlanCode;
            newEst.dateEdit = new Date();
            newEst.userGen = userProfile.userName;

         // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
            if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
            	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
            }

            newEstimateCode = estDAO.add(newEst);

            /*
            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
            e2e.estimateItemInRef.code = estArr[j];
            e2e.estimateItemOutRef.code = newEstimateCode;
            e2e.countGen = est.countFact;
            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            e2eDAO.add(e2e);
            */
        }
////////////////////////////////////////////////////


        transportLogic.createDeliveryTimeForPlan(newPlanCode);
        humenLogic.createDeliveryTime(newPlanCode);

        ///////////////// 29.08.12 NET-2800
        // ��� ����������� ����� ���� ������ ���� ������������ ������ ����� ��, ��� � �����
        FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
        FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
        finExecutor2PlanFilter.planRef.code = plan.code;
        int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

        for (int i = 0; i < finExecutor2PlanArr.length; i++)
        {
            FINExecutor2Plan finExecutor2Plan = finExecutor2PlanDAO.getObject(finExecutor2PlanArr[i]);
            /*
            Calendar c = Calendar.getInstance();
            c.setTime(Tools.clearTimeOfDate(finExecutor2Plan.dateStart));
            c.set(Calendar.MONTH, plan.monthGen - 1);
            c.set(Calendar.YEAR, plan.yearGen);

            finExecutor2Plan.dateStart = c.getTime();
            */
            finExecutor2Plan.dateStart = plan.dateStart;
            finExecutor2PlanDAO.save(finExecutor2Plan);
        }
        ////////////////


        // ��� ����, ����� �����
            if (plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE &&
                plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
            {
                // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
                recalcTotalTime(newPlanCode);
            }

        /////
        // NET-4440 ������� ������ � ������� ��� �� ���������� �����
        // (��������� �������� = true, ����� ������������ ������� �� ����� ���������,
        // ������ ��� ��� ����� ���� ��������� ��� ������� generateGSMEstimate � generateNORMGSM,
        // �� �� ��� ���� estimateitem'�� � ����� "���")
        generatePlanFuelHistory(newPlanCode, plan.dateStart, true);
        /////


        /// �������� ������ ENServFromSide2PlanWork ������ �������� ������ ������ � �������
        ENServFromSide2PlanWorkDAO so2plDAO = new ENServFromSide2PlanWorkDAO(connection, userProfile);
        ENServFromSide2PlanWorkFilter so2plFil = new ENServFromSide2PlanWorkFilter();
        so2plFil.planRef.code=oldPlan.code;
        int[] so2plArr = so2plDAO.getFilteredCodeArray(so2plFil, 0, -1);
        if (so2plArr.length != 0) {
        	ENServFromSide2PlanWork so2plOld = so2plDAO.getObject(so2plArr[0]);


        	ENServFromSide2PlanWork so2pl = new ENServFromSide2PlanWork();
        	so2pl.code = Integer.MIN_VALUE;
        	so2pl.planRef.code = newPlanCode;
        	so2pl.servFromSideRef.code = so2plOld.servFromSideRef.code;
        	so2plDAO.add(so2pl);
        }
        return newPlanCode;

        }

        catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

        }

    }


    public Date genNextDateForNPZ(ENPlanWork currentPlan) throws PersistenceException
    {
        Date d = currentPlan.dateStart;
        int delta = 0;
        //ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
        //f.planOldRef.code = currentPlanCode;
        //f.orderBySQL =
        //ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        //ENPlanCorrectHistoryShortList l = chDAO.getScrollableFilteredList(f,0,-1);
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.yearGen = currentPlan.yearGen;
        f.monthGen = currentPlan.monthGen;
        f.elementRef.code = currentPlan.elementRef.code;
        f.typeRef.code = currentPlan.typeRef.code;
        f.stateRef.code = currentPlan.stateRef.code;
        f.formRef.code = currentPlan.formRef.code;
        f.conditionSQL = "code in (select plannewrefcode from enplancorrecthistory where planoldrefcode = " + currentPlan.code +
        		                    " and reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW + ")";
        f.orderBySQL = "datestart desc";
        ENPlanWorkShortList l = dao.getScrollableFilteredList(f,0,-1);
        if (l.totalCount>0){
            d = l.get(0).dateStart;
            delta = 1;
        }

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(d);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.add(Calendar.DATE, delta);

        /** ��� 1 ������ ���������� ���� ��� �� 31 �������.... */
		if (calendar.get(Calendar.DATE) == 1
				&& calendar.get(Calendar.MONTH) == 0 && delta == 1) {
			calendar.add(Calendar.DATE, -1);
		}

        return calendar.getTime();
    }

    // �������� ������� ����� - ��� ���������� (� �����)
    // !!! ����� ������� ��������� ���-�� ���������� ... + �������� ������ �� ��� ����� ������ !!!
    public void closeClearPlan(ENPlanWork obj)  throws PersistenceException, DatasourceConnectException
    {
        closeClearPlan(obj, 1);
    }

    public void closeClearPlan(ENPlanWork obj, int isClient) throws PersistenceException, DatasourceConnectException
    {

        Connection finConn = null;
        try {

        WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
        ENWorkOrder workOrder = woLogic.getWorkOrderByPlanCode(obj.code, true);


        // ����� �� WorkOrderLogica .... removeWorkOrderForOpenPlanByWorkOrderCode2
        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
        FINLogic finLogic = new FINLogic(finConn, userProfile);

        FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(connection, userProfile);

        FINMolDataFilter molDataFilter = new FINMolDataFilter();
        molDataFilter.workOrder.code = workOrder.code;

        FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();

        if (obj.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| obj.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| obj.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
        {
            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_28_332;
        }
        else
        {
            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_28_302;
        }
        f2mFilter.conditionSQL = "FINDOC2MOLDATA.moldatacode in (select finmoldata.code from finmoldata where finmoldata.workordercode = " + workOrder.code + ")";

        FINDoc2MolDataShortList f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);

        //FINMolDataShortList molList  = molDAO.getScrollableFilteredList(molDataFilter, 0, -1);
        for (int k = 0; k < f2mList.totalCount; k++){
            //if (isDeleteInFK)
            {
                    finLogic.removeDoc(
                                        f2mList.get(k).finDocCode,
                                        finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode )
                                        );
            }
            f2mDAO.remove(f2mList.get(k).code);
        }

        //f2mFilter = new FINDoc2MolDataFilter();
        //if (obj.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
        if (obj.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| obj.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| obj.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
        {
            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_332;
        }
        else
        {
            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_302;
        }
        f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (int k = 0; k < f2mList.totalCount; k++){
            //FINDoc2MolData f2m = f2mDAO.getObject(f2mArr[k]);
            //if (isDeleteInFK)
            {

            	finLogic.removeDoc(
                                        f2mList.get(k).finDocCode,
                                        finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode ));
            }
            f2mDAO.remove(f2mList.get(k).code);
        }


/* ��� ��� ��� �� ��� .. ������ ����� !!!!
        // �� ������ �� ���� ���� �������� - ������� �������� ...
        FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
        //FINLogic fLogic = new FINLogic(getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

        FINDoc2WorkOrderFilter ff = new FINDoc2WorkOrderFilter();
        ff.workOrderRef.code = wo.code; // code of WorkOrder
        ff.typeRef.code = FINDocType.MOVE_28_302;
        FINDoc2WorkOrderShortList arr = f2wDAO.getScrollableFilteredList(ff, 0, -1);


            InitialContext initialContext = new InitialContext();
            DataSource dataSource = (DataSource) initialContext
                    .lookup(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            finConn = dataSource.getConnection();

            FINLogic fLogic = new FINLogic(finConn, userProfile);



        for (int i = 0; i < arr.totalCount; i++){
            fLogic.removeDoc(arr.get(i).finDocMOLCode, 28);
            fLogic.removeDoc(arr.get(i).finDocMechanicCode, 28);
            f2wDAO.remove(arr.get(i).code);
        }

        ff.typeRef.code = FINDocType.MOVE_302;
        arr = f2wDAO.getScrollableFilteredList(ff, 0, -1);
        for (int i = 0; i < arr.totalCount; i++){
            fLogic.removeDoc(arr.get(i).finDocMOLCode, 302);
            fLogic.removeDoc(arr.get(i).finDocMechanicCode, 303);
            f2wDAO.remove(arr.get(i).code);
        }
        */
        } catch (DatasourceConnectException e) {
            throw new DatasourceConnectException(AuthorizationJNDINames.FINMATERIAL_DATASOURCE, e);
            } catch (PersistenceException e) {
            throw new PersistenceException("error in delete findoc", e);
            }
        finally{
            try{
            finConn.close();
            finConn = null;
            }
            catch (SQLException e) {
            }
        }

    }


	public int closePlan(int planCode) throws PersistenceException,
			DatasourceConnectException {
		return closePlan(planCode, 1, false);
	}

	public int closePlan(int planCode, boolean parameterizationCounter)
			throws PersistenceException, DatasourceConnectException {
		return closePlan(planCode, 1, parameterizationCounter);
	}

	public int closePlan(int planCode, int isClient)
			throws PersistenceException, DatasourceConnectException {
		return closePlan(planCode, isClient, false);
	}

	public int closePlan(int planCode, int isClient, boolean parameterizationCounter) throws PersistenceException, DatasourceConnectException
	{
		return closePlan(planCode, isClient, parameterizationCounter, false);
	}


	public int closePlan(int planCode, int isClient,
			boolean parameterizationCounter, boolean isFromBilling)
			throws PersistenceException, DatasourceConnectException {

		return closePlan(planCode, isClient, parameterizationCounter, isFromBilling, null);
	}

	public int closePlan(int planCode, int isClient, boolean parameterizationCounter, boolean isFromBilling,
			ENPlanWorkItemShort[] planWorkItemArr) throws PersistenceException, DatasourceConnectException {
		return closePlan(planCode, isClient, parameterizationCounter, isFromBilling, planWorkItemArr, false);
	}

	public int closePlan(int planCode, int isClient, boolean parameterizationCounter, boolean isFromBilling,
			ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier) throws PersistenceException, DatasourceConnectException {
		return closePlan(planCode, isClient, parameterizationCounter, isFromBilling, planWorkItemArr, isForSupplier, null);
	}

	public int closePlan(int planCode, int isClient, boolean parameterizationCounter, boolean isFromBilling,
			ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier, Date newPlanDate)
			throws PersistenceException, DatasourceConnectException {

		ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
		ENDepartmentDAO depDao = new ENDepartmentDAO(connection, userProfile);
		ENPlanWorkStatusDAO planStatusDao = new ENPlanWorkStatusDAO(connection, userProfile);

		ENPlanWork obj = dao.getObject(planCode);
		ENDepartment budget = depDao.getObject(obj.budgetRef.code);

        ENElement e = new ENElementDAO(connection, userProfile).getObject(obj.elementRef.code);

        if (obj.kind.code == ENPlanWorkKind.CURRENT &&
        		obj.status.code != ENPlanWorkStatus.LOCKED) {

            /**
             *  SUPP-17251... 26.05.2014 +++ ����������� ������� ��� ����������� �������� ������,
             *  � ������� ������������ ������ �� ������� ��������... ����....
             */
        	checkModelProjectWorks(planCode);

        	/*SUPP-55735 ����������� ����� �� ����������� �������� (����� �������) ������ ���� �������������
        	 * ������ ��� ��������� � ��� �����-�������*/

        	/** 11.08.2017... +++ ��� ������� ����������������... */
        	if (budget != null && budget.managementRef.code != Integer.MIN_VALUE) {
        		if (obj.formRef.code == ENPlanWorkForm.NOPLANNED) {
            		if (budget.managementRef.code == ENManagement.TECHNICAL
            				&& budget.code != ENConsts.ENBUDGET_VRTU
            				&& e.typeRef.code != ENElementType.PURCHASES_NO_OBJECT
            				&& e.typeRef.code != ENElementType.WRITING_NO_OBJECT
            				&& !(e.typeRef.code == ENElementType.SERVICES_OBJECT
            					|| obj.typeRef.code == ENPlanWorkType.WORK_IN_OUT
            					|| obj.stateRef.code == ENPlanWorkState.WORK_IN_OUT)
            				&& obj.typeRef.code != ENPlanWorkType.DESIGNING_TECHCONDITIONS
            				///// SUPP-67434
            				&& obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
            				&& obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST
            				/////
            				&& e.typeRef.code != ENElementType.SERVICES_FROM_SIDE_OBJECT
            				&& obj.typeRef.code < ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER
            				&& obj.typeRef.code != ENPlanWorkType.AVR) {
            			ENPlanWorkStatus status = planStatusDao.getObject(obj.status.code);
            			throw new SystemException(String.format("SUPP-55735 \n �� ������� �������� ���������� �����-�������� ����� �������� ����� ���� ������������ �������� �����. \n"
            					+ " ���� � ����� ���������� �����-�������� ����������� � ������ \"%s\"", status.name));
            		}
            	}
        	}
        }


        /*NET-2843 �������� �� ����� ��������� �������� - ��� ��� �� ����� ����������� �����-�������*/
        if(e.typeRef.code == ENElementType.GIFT)
        {
            throw new EnergyproSystemException("�� ���� ��������� �������� ��������� ������� �����-��������");
        }

        if(e.typeRef.code == ENElementType.NO_OBJECT_AVR16)
        {
            throw new EnergyproSystemException("�� ���� ���������� ���16 ��������� ������� �����-��������");
        }

        // 19.02.2018 NET-4561
    	if (e.code == ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
    		throw new EnergyproSystemException("�� ��� ���� ��������� ������� �����-��������!\n" +
    				"�������������� ���� \"���������� -> �������� ����� (���������� ���������)\"!");
    	}

        // NET-3213 ����������� ������������� ������������ ����������
        if(e.typeRef.code == ENElementType.TRANSPORT)
        {
            TKTransportRealDAO trDAO = new TKTransportRealDAO(connection, userProfile);
            TKTransportRealFilter trFilter = new TKTransportRealFilter();
            trFilter.enelement.code = e.code;
            TKTransportRealShortList trList = trDAO.getScrollableFilteredList(trFilter, 0, -1);

            if(trList.totalCount != 1)
                throw new EnergyproSystemException("������� � ������� ��������������");

            if(trList.get(0).isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
                throw new EnergyproSystemException("��������� " + trList.get(0).name + " � ����� - " +trList.get(0).code + " ���������� ���������������");

        }



        /**  11.08.2015 +++ ��� ����� �� �������������� ���� ����������� �� ��������
         *   ��� ���������� ������(��������������) ��������
         */
        /* 16.03.2020 SUPP-90211 ������ ��������, � � �������� ����� �������� - ���� ��� ���� ����, �� ���������� ��� ��������
        if (e.typeRef.code == ENElementType.SERVICES_OBJECT
        		&& obj.kind.code == ENPlanWorkKind.NPW) {

        	ENPlanWork2ClassificationTypeDAO p2cDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        	ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
        	p2cFilter.conditionSQL = " enplanwork2classfctntp.planrefcode in ( "
        			+ " select pl.code from enplanwork pl where pl.elementrefcode = " + e.code + " ) "
        			+ " and enplanwork2classfctntp.classificationtyperfcd in ( "
        			+ " select ct.code from tkclassificationtype ct "
        			+ " where ct.replacecounterkindcode = " + TKClassificationType.PARAMETERIZATION_COUNTER + ")";

        	int p2cArr[] = p2cDao.getFilteredCodeArray(p2cFilter, 0, -1);
        	if (p2cArr.length > 0 && !parameterizationCounter) {
        		if (! userProfile.userName.equalsIgnoreCase("energynet")) {
        		 throw new EnergyproSystemException("\n\n"
        		 		+ "����� �� �������� �������������� ����� �������� ����� � Energy!!!");
        		}
        	}
        }
        */

        /*�������� ��������� ����� �� ������ � ��������� �� �������*/
        if(obj.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND && e.typeRef.code != ENElementType.ROUTE_BYT)
        {
            throw new EnergyproSystemException("���� � ����� ������� ����� �������� ����� ��� �������� � Energy");
        }


        if(obj.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND_ADD && e.typeRef.code != ENElementType.ROUTE_BYT)
        {
            throw new EnergyproSystemException("���� � ����� ������� ����� �������� ����� ��� �������� � Energy");
        }

        ///// 01.03.14 NET-4337 ��������� ���������� �������-����� �� ����������� ������� CallCenter'� (������ � ����� ���������� �������� �� ��������)
        if(e.typeRef.code == ENElementType.CALLCENTER_OBJECT)
        {
            if (obj.kind.code == ENPlanWorkKind.NPW)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ��� ������������ ��������-����� ������� ������ ���������� ��'��� �� ��������!");
            }
        }
        /////

        ///// 01.03.14 NET-4337 �������� ��� �������-������, ��������� �� CallCenter'�
        if (obj.kind.code == ENPlanWorkKind.NPW)
        {
            ENPlanWork2CCDamageLogDAO plan2CCDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLogFilter plan2CCDamageLogFilter = new ENPlanWork2CCDamageLogFilter();
            plan2CCDamageLogFilter.planRef.code = obj.code;
            int[] plan2CCDamageLogArr = plan2CCDamageLogDAO.getFilteredCodeArray(plan2CCDamageLogFilter, 0, -1);

            // ���� ���� ������ �� CallCenter'�
            if (plan2CCDamageLogArr.length > 0)
            {
                /// 05.03.14 NET-4337 ��������� ���������� �������-�����, ��������� �� CallCenter'�, ���� �� ������� �����������
                //  (�.�. �� ��������� � �������� ����������� ������� ��� - ��� ����� �������� �� ���������� �������!)

                // ��������� �� �������� �����!!!!!
                // ���� ��������� �������� ����
                ENPlanCorrectHistoryDAO planHistoryDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
                ENPlanCorrectHistoryFilter planHistoryFilter = new ENPlanCorrectHistoryFilter();
                planHistoryFilter.planNewRef.code = obj.code;
                planHistoryFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
                ENPlanCorrectHistoryShortList planHistoryList = planHistoryDAO.getScrollableFilteredList(planHistoryFilter, 0, -1);

                if (planHistoryList.totalCount != 1)
                {
                    throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ������ ̳������� �����! ��� ��������-�����: " + obj.code);
                }

                int monthPlanCode = planHistoryList.get(0).planOldRefCode;
                if (monthPlanCode == Integer.MIN_VALUE)
                {
                    throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ������ ̳������� �����! ��� ��������-�����: " + obj.code);
                }

                ENPlanWork monthPlan = dao.getObject(monthPlanCode);
                if (monthPlan == null)
                {
                    throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ������ ̳������� �����!\n" +
                                                    "��� ��������-�����: " + obj.code + ", " +
                                                    "��� ̳������� �����: " + monthPlanCode);
                }

                //if (obj.finExecutor != null)
                if (monthPlan.finExecutor != null)
                {
                    //if (obj.finExecutor.code > Integer.MIN_VALUE)
                    if (monthPlan.finExecutor.code > Integer.MIN_VALUE)
                    {
                        FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
                        FINExecutorFilter finExecutorFilter = new FINExecutorFilter();
                        //finExecutorFilter.code = obj.finExecutor.code;
                        finExecutorFilter.code = monthPlan.finExecutor.code;
                        finExecutorFilter.conditionSQL =
                                "fincode in " +
                                "( " +
                                " select fe.fincode from finexecutor fe " +
                                " where fe.code in (select rf.finexecutorrefcode from epren2finexecutor rf where rf.renrefcode != 0) " +
                                ") ";

                        int[] finExecutorArr = finExecutorDAO.getFilteredCodeArray(finExecutorFilter, 0, -1);

                        if (finExecutorArr.length > 0)
                        {
                            throw new EnergyproSystemException("\n\nNET-4337 ��� ������������ ��������-����� ����� ��������� �� ̳������� ���� �� ��������� �������!");
                        }
                        ///// MDAX-441
                        else
                        {
                        	// ������ ��� �� ���� �� AX (����� ����������� ����� �������� �� AX ����� ��������
                        	// � ������ ����� fincode, �� � ����������� axorgid)
                    		boolean usesMDAXData = false;
                        	AuthLogic netAuth = new AuthLogic(connection, userProfile);
                        	usesMDAXData = netAuth.checkUsesMDAXData();

                        	if (usesMDAXData)
                        	{
                                finExecutorFilter = new FINExecutorFilter();
                                finExecutorFilter.code = monthPlan.finExecutor.code;
                                finExecutorFilter.conditionSQL =
                                        "axorgid in " +
                                        "( " +
                                        " select fe.axorgid from finexecutor fe " +
                                        " where fe.code in (select rf.finexecutorrefcode from epren2finexecutor rf where rf.renrefcode != 0) " +
                                        ") ";

                                finExecutorArr = finExecutorDAO.getFilteredCodeArray(finExecutorFilter, 0, -1);

                                if (finExecutorArr.length > 0)
                                {
                                    throw new EnergyproSystemException("\n\nNET-4337 ��� ������������ ��������-����� ����� ��������� �� ̳������� ���� �� ��������� �������!");
                                }
                        	}
                        }
                        /////
                    }
                }
                ///

                /// 01.03.14 NET-4337 ��������� ���������� �������-�����, ��������� �� CallCenter'�, ���� � �����-������� ��� ����-�������
                FINMolDataDAO molDataDAO = new FINMolDataDAO(connection, userProfile);
                FINMolDataFilter molDataFilter = new FINMolDataFilter();
                molDataFilter.conditionSQL =
                        "code in (" +
                            "select md.code " +
                            "from finmoldata md, enworkorder2enplanwork wp " +
                            "where md.workordercode = wp.workordercode " +
                            "  and md.moltyperefcode = " + FINMolType.MASTER +
                            "  and wp.plancode = " +obj.code +
                        ")";
                int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);

                if (molDataArr.length == 0)
                {
                    throw new EnergyproSystemException("\n\nNET-4337 ��� ������������ ��������-����� ������� ������ ������� � �����-��������!");
                }
                ///



            }

        }
        /////

        if (obj.kind.code == ENPlanWorkKind.NPW && !isFromBilling)
        {
            // 30.11.15 ��������� ��������� �������-�����, ���������� � ������� ������� ��� �������� ������ -
            // ���� ��� ��� ��������� ������ �� ��������!!!
        	checkPlanInWorkOrderByt(planCode, "���� ���������� ����� � �����!", ENWorkOrderBytType.RAID_BY_BILLING);
        }

        // 22.06.16 �� ����� ������� �������-����, ���� � ��� ���� ������, � ������ � ���� �� �������� � ������� �������
        if (obj.kind.code == ENPlanWorkKind.NPW)
        {
        	if (e.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
        		checkSealsInWorkOrderByt(planCode);
        	}
        }

    	// ��� ��������� � ������������ �/� �� ���������� ������ �� �����������/����������
    	// �������-����� ��������� ������ �� ��������
        if (obj.kind.code == ENPlanWorkKind.CURRENT && !isFromBilling && !isForSupplier) {
        	checkPlanByServicesObjectForSupplier(planCode);
        }

        /////// 28.12.10 �������� !!!!! ����� ������ (29.12.10 - �������)
        //if (!((obj.status.code == ENPlanWorkStatus.PRECONFIRMED) && (obj.kind.code == ENPlanWorkKind.YEAR)))
        //{
        ///////
        /* 05.12.14 ���-�� ��� �������� ��-���������� �������...
        if (
                (obj.status.code != ENPlanWorkStatus.GOOD) &  // ������ ���� && !!!
                (obj.status.code != ENPlanWorkStatus.INCORRECTION) & // ������ ���� && !!!
                (obj.kind.code != ENPlanWorkKind.CURRENT)& // ������ ���� && !!!
                (obj.kind.code != ENPlanWorkKind.NPW)
        )
        {
            throw new EnergyproSystemException("PlanWork already closed or canceled , code="+planCode);
        }
        */
        // 05.12.14 ��� ��� ���������� ;)
        if (obj.status.code != ENPlanWorkStatus.GOOD && obj.kind.code != ENPlanWorkKind.CURRENT)
        {
        	throw new EnergyproSystemException("���� � ����� " + planCode + " ��� �� ��������!");
        }


        ///// 05.12.14
        // �������� �� �������, ����� �� ���� �������� ������ (�������� closePlan ��������� ��� �����
        // ������ ��� �������� ������ - ��������� ��������� �������-������)
        if (obj.kind.code != ENPlanWorkKind.CURRENT)
        {
            ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
            ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
            historyFilter.planOldRef.code = planCode;
            historyFilter.conditionSQL = "ENPLANCORRECTHISTORY.REASONCODE in (" +
            		ENPlanCorrectReason.MOVE_TO_CURRENT + ", " +
            		ENPlanCorrectReason.MOVE_FROM_CALCULATION_TO_CURRENT + ", " +
            		ENPlanCorrectReason.MOVE_TO_FACT + ")";
            int[] historyArr = historyDAO.getFilteredCodeArray(historyFilter, 0, -1);

            if (historyArr.length > 0)
            {
            	throw new EnergyproSystemException("\n\n� ����� � ����� " + planCode + " ��� �������� ������� ����!");
            }
        }
        /////

        /* 14.04.2013 +++ ��� ������������� ���������� �������� ������������ ����� */
        boolean priconnections = false;
        if (e.typeRef.code == ENElementType.SERVICES_OBJECT) {
            ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
            ENServicesObject soObject = soLogic.getServicesObjectByPlanCode(planCode);
            if (soObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
                priconnections = true;
            }
        }

        boolean isServices = false;
        if (obj.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                || obj.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
            isServices = true;
        }

        /* 30.11.2011 +++ ���������� - ����������� � ���!!!! */
        if (obj.typeRef.code == ENPlanWorkType.TRUCKING
                && obj.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT) {
            throw new EnergyproSystemException(
                    "��� ����������� ���������� �������� ����� � ������� ���� \"�����������\"!");
        }

        /* �������� �������� ��� ��������� */
        if (obj.typeRef.code == ENPlanWorkType.TRUCKING) {

            boolean isCargo = false;
            if (e.typeRef.code == ENElementType.CARGO_OBJECT) {
                isCargo = true;
            }

            ENPlanWorkItemDAO iDao = new ENPlanWorkItemDAO(connection, userProfile);
            ENPlanWorkItemFilter iFilter = new ENPlanWorkItemFilter();
            iFilter.planRef.code = obj.code;
            ENPlanWorkItemShortList piList = iDao.getScrollableFilteredList(iFilter, 0, -1);

            for (int i = 0; i < piList.totalCount; i++) {
                int works = piList.get(i).kartaRefCode;

                if (works == ENConsts.MATERIALS_TRUCKING) {
                    isCargo = true;
                }

                /* ��� ��������� ������ - �������� ������� ����������� ���������� */
                if (works == ENConsts.MATERIALS_TRUCKING || works == ENConsts.MATERIALS_LOADS) {
                    validateMaterialsTrucking(piList.get(i).code, obj.code, isCargo);
                }

                /* ��� ��������� ��������� - �������� ������� ����������� ���������� */
                if (works == ENConsts.ADMIN_TRUCKING || works == ENConsts.HUMEN_TRUCKING) {
                    ///// 15.11.12 NET-3664 ��� ����������� ������� ������
                    if (obj.kind.code != ENPlanWorkKind.YEAR)
                    {
                        validateHumenTrucking(piList.get(i).code);
                    }
                    /////
                }
            }
        }


        /*
        *  04.05.2012 +++ �������� �� ������� �����
        *  � ���������� ����� �������� ���������
        */
        if (obj.typeRef.code == ENPlanWorkType.TRUCKING
                && obj.kind.code == ENPlanWorkKind.CURRENT) {
            TransportRouteLogic trRouteLogic = new TransportRouteLogic(connection, userProfile);
            obj.commentGen = trRouteLogic.getRoutesByPlan(obj.code);
        }


        if ((obj.status.code == ENPlanWorkStatus.PRECONFIRMED) ) // �� NET-352 23.05.2011 ���� ��� �� ���� ;)) && (obj.typeRef.code != ENPlanWorkType.AVR))
        {
            throw new EnergyproSystemException("�� ���� �� �������� �� ����������� ������ ��������� ��� !!!");
        }

        if (obj.status.code == ENPlanWorkStatus.WORKS_FINISHED)
        {
            throw new EnergyproSystemException("���������� ������������� ����� � �������� \"������ ��������\"!");
        }
        /////// 28.12.10 �������� !!!!! ����� ������ (29.12.10 - �������)
        //}
        ///////


        /****
        if ((obj.kind.code == ENPlanWorkKind.CURRENT)
            && (e.typeRef.code != ENElementType.WRITING_NO_OBJECT)
        )
        {
            validateMOLinPlan(obj.code);
        }
        */

        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);

        if ( countResourcesInPlan(obj.code) == 0){
            throw new EnergyproSystemException("�� ����� ��� �� �����, �� ����������, �� �����, �� ���������� ... ����������� ���������� ... ��� �����="+planCode);
        }

        //copyPlan(obj.code,-1);
        //if (obj.kind.code == ENPlanWorkKind.YEAR){

        // ������ ������������ ���� � ���� ��� ������ ...
        if (obj.kind.code == ENPlanWorkKind.NPW) {
            WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
            if (woLogic.getWorkOrderByPlanCode(obj.code, false) == null)
                throw new EnergyproSystemException("�������� �����-������� ��� ����� " + obj.code);

            ///// 28.07.10 - ������ ����������� ����� �� ������ "������ �� �������", ���� �� ������ �������� ������� �� ������.

            // 20.12.10 - 21.12.10 ��� ��������� � ���������� ��������� ���� (� ��� ����� ��� �������� � �� �� �������)
            if ((e.typeRef.code == ENElementType.SERVICES_OBJECT) &&
                (obj.departmentRef.code != ENConsts.ENDEPARTMENT_INSPECTION) &&
                (obj.budgetRef.code != ENConsts.ENBUDGET_METROLOGY))
            {
                ENServicesObject sObj = null;
                ENServicesObjectFilter sObjFilter = new ENServicesObjectFilter();
                sObjFilter.element.code = obj.elementRef.code;
                ENServicesObjectDAO sObjDAO = new ENServicesObjectDAO(connection, userProfile);
                int[] sObjArr = sObjDAO.getFilteredCodeArray(sObjFilter, null, null, 0, 2, null);

                if (sObjArr.length != 1)
                    throw new EnergyproSystemException("������ � ��������� ��������� ... ��� �������� = " + obj.elementRef.code);

                sObj = sObjDAO.getObject(sObjArr[0]);

                if (sObj.finDocID == Integer.MIN_VALUE)
                    throw new EnergyproSystemException("����� ��������� �������-����, ���������� � ������� \"������ �� �������\" ������� �������! \n" +
                                                    "��� �������: " + sObj.code);
            }
            /////

            boolean isRouteByt = false;

            /////
            // ����� ��� ������ ����������� �� ��������� (�������� �����, �������� ����� ���������� ����������)
            // ��������� ������ ������� � �������� �������� ������
            if (e.typeRef.code == ENElementType.ROUTE_BYT)
            {
            	if (obj.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND || obj.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND_ADD)
            	{
            		isRouteByt = true;

                    // Date firstDayOfCurrentMonth = Tools.getFirstDayOfMonth(new Date());
                    Date lastDayOfCurrentMonth = Tools.getLastDayOfMonth(new Date());

                    if (obj.dateStart.after(lastDayOfCurrentMonth)) {
                        throw new EnergyproSystemException(
                                "���� �� ������� ����� ������ ������ � �������� �������� ������! " +
                                "��� ����� = " + obj.code,
                                userProfile
                                );
                    }
            	}
            }
            /////


            // ������ ������ ���� ��� �������� ..
            // ����� ��� ���. ������ ... 3 ���
            // �� 22.03.2011 - ��� ����� �� 5 ���� .. ����� ����� 7 - ���� ������ ...
            // 26.01.2017 ��� ����� �������� ���������� �� ��������� ���� �� ���������
            if (! isRouteByt && e.code != ENElement.NO_OBJECT_RECYCLABLE_MATERIALS)
            {
	            Calendar c = Calendar.getInstance();
	            c.setTime(Tools.clearTimeOfDate(new Date()));
	            if (obj.dateStart.after(c.getTime())){
	                throw new EnergyproSystemException(
	                        "���� �� ������� ������ ������ .. ��������� ���� ���� ����� = " + new SimpleDateFormat("dd.MM.yyyy").format(obj.dateStart).toString()
	                        +", ��� �����=" + obj.code
	                        , userProfile
	                        );
	            }
            }


        }

        // ����������� - ������ � ������� � �����������
        if (obj.typeRef.code == ENPlanWorkType.PREDPISANIE) {
            ENBindingOverFilter boFilter = new ENBindingOverFilter();
            boFilter.planRef.code = obj.code;
            ENBindingOverDAO boDAO = new ENBindingOverDAO(connection, userProfile);
            int[] boArr = boDAO.getFilteredCodeArray(boFilter,0,1);
            if (boArr.length == 0) {
                throw new EnergyproSystemException("��������� ������� ��� ��� ������ ...");
            }
        }


        // ��� ����������� - �� ������ � ��������� ��� .. � ��� - ���� ..
        // ������ ��� �������������� ... � �� ��� �� ������ �������� �� ������������
        //if ( (obj.status.code == ENPlanWorkStatus.GOOD) && ( obj.kind.code == ENPlanWorkKind.CURRENT) ){

        /* 17.01.2012 +++ �� ��������� ����������� ��� ����� �� ������� � ��������� ������ */
        if (obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
                && obj.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST

                /* 05.04.2012 +++ ��������� ������ :) ������....
                * ��� ����������� �� ����� ��� ��������� � �������....
                */
                //&& (e.typeRef.code != ENElementType.CARGO_OBJECT)
                ) {

			if (e.typeRef.code == ENElementType.SERVICES_OBJECT) {
				ENServicesObjectFilter sObjFilter = new ENServicesObjectFilter();
				sObjFilter.element.code = obj.elementRef.code;
				ENServicesObjectDAO sObjDAO = new ENServicesObjectDAO(connection, userProfile);
				int[] sObjArr = sObjDAO.getFilteredCodeArray(sObjFilter, 0, -1);

				if (sObjArr.length > 0) {
					ENServicesObject sObj = sObjDAO.getObject(sObjArr[0]);

					if ((obj.kind.code != ENPlanWorkKind.YEAR)
							&& (obj.kind.code != ENPlanWorkKind.CALCULATION)
							&& (e.typeRef.code != ENElementType.WRITING_NO_OBJECT)
							&& ((obj.kind.code != ENPlanWorkKind.CURRENT)
									&& (obj.typeRef.code != ENPlanWorkType.WORK_IN_OUT)
									&& (sObj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET))) {
						if (obj.finExecutor == null) {
							throw new EnergyproSystemException("\n\n" +
									"��������� ������� ��������� ����� ...");
						} else if (obj.finExecutor.code == Integer.MIN_VALUE) {
							throw new EnergyproSystemException("\n\n" +
									"��������� ������� ��������� ����� ...");
						}
					}
				}

        	} else {
                if ((obj.kind.code != ENPlanWorkKind.YEAR) &&
                        (obj.kind.code != ENPlanWorkKind.CALCULATION) &&
                        (e.typeRef.code != ENElementType.WRITING_NO_OBJECT))
                    {
                        if ( obj.finExecutor == null ){
                            throw new EnergyproSystemException("\n\n" +
                            		"��������� ������� ��������� ����� ...");
                        }
                        else
                        if (obj.finExecutor.code == Integer.MIN_VALUE){
                            throw new EnergyproSystemException("\n\n" +
                            		"��������� ������� ��������� ����� ...");
                        }
                    }
        	}
        }


        // ��� ��� ������� �������� ���������� .. ���� ��� ����������������� ..
        if (obj.status.code == ENPlanWorkStatus.GOOD){
            //�� NET-352 23.05.2011 ���� ��� �� ���� ;))
            /*
            if ((obj.typeRef.code == ENPlanWorkType.AVR) && ( obj.kind.code == ENPlanWorkKind.CURRENT )){
                obj.status.code = ENPlanWorkStatus.PRECONFIRMED;
            }
            else{
            obj.status.code = ENPlanWorkStatus.LOCKED;
            }
            */
            obj.status.code = ENPlanWorkStatus.LOCKED;
        }

        /////// 28.12.10 �������� !!!!! ����� ������ (29.12.10 - �������)
        //if ((obj.status.code == ENPlanWorkStatus.PRECONFIRMED) && (obj.kind.code == ENPlanWorkKind.YEAR))
        //{
        //    obj.status.code = ENPlanWorkStatus.LOCKED;
        //}
        ///////

        if (obj.status.code == ENPlanWorkStatus.INCORRECTION)
            obj.status.code = ENPlanWorkStatus.CORRECTED;

        //}

        //if (obj.kind.code == ENPlanWorkKind.CURRENT){
        // if (obj.status.code == ENPlanWorkStatus.GOOD)
        //     obj.status.code = ENPlanWorkStatus.LOCKED;

        //  if (obj.status.code == ENPlanWorkStatus.INCORRECTION)
        //      obj.status.code = ENPlanWorkStatus.CORRECTED;
        //}

        //else

        /** SUPP-10958... 30.12.2013 +++ ���������� ��� �������������... ??? ������ � ��� �������� ??? */
        if (!priconnections) {
            /** NET-4269... 06.10.2013 +++ ���������� ��� ��������� �� ���������� (������ �������������) */
            if (e.typeRef.code != ENElementType.TECHCONDITIONSSERVICES) {
                //!!! �� ��������� � �������� � �� ������� �� ������� � � ����� ���� ������ ��������� ������������� �����
                // �������� �� ���� ���������������� , ��� ��� ���������� , �����������
                if (     (obj.kind.code == ENPlanWorkKind.CALCULATION) &&
                        ((this.isReservedCalculationInContract(obj.code)) == true ) &&
                        ((this.isAcessRemJobsByTime(obj.departmentRef.code)) == true)
                        )  {

                	// ���������������� ���� ������ ������ ����������
                    // ����� ��������������� ������ ����������
                    obj.budgetRef.code = ENConsts.ENBUDGET_ENERGOSBYT;
                    obj.responsibilityRef.code = ENConsts.ENRESPONSIBILITY_ENERGOSBYT;

                    // �������� �� ����������� ���� ������ ���� ������� ��� ���������� (������������� ��� ������ �� ������)
                    // �� ������ ���������� ������� ������� �� ���� ����� ����� ��������
                    TKVirtualBrigade vbObj = this.getTKVirtualBrigade(obj.code);

                    /** SUPP-24275 */
                    if (vbObj == null) {
                    	throw new SystemException("\n\n " +
                    			" �� �������� ��� ��������� ���� ��� ������� �������!!!\n" +
                    			" �������� ������������ ���� ��� ��������!!!");
                    }

                    if (vbObj.molMasterCode == null ){
                        throw new EnergyproSystemException("������� '������� � �������' ������ ��� ��� ������� " + vbObj.nameCompound  );
                    }
                    // ��� ��� ����
                    ENMOL2PlanWorkDAO mol2planDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
                    ENMOL2PlanWorkFilter mol2planFilter = new ENMOL2PlanWorkFilter();
                    mol2planFilter.planRef.code = obj.code;
                    int mol2planArr[] = mol2planDAO.getFilteredCodeArray(mol2planFilter, null, null, 0, -1, null);
                    if (mol2planArr.length > 0 ) {
                        for (int i = 0; i < mol2planArr.length; i++ ){
                        mol2planDAO.remove(mol2planArr[i]);
                        }
                    }

                    if(vbObj.molMasterCode != null && vbObj.molMasterCode.length() > 0) {
                    	Connection finConn = null;
                    	try {
                             finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
                            FKLogic fkLogic = new FKLogic(finConn, userProfile);
                            fkLogic.isMolActive(vbObj.molMasterCode, true);
                    	} finally {
                    		try {
								if(finConn != null && !finConn.isClosed()) {
									finConn.close();
									finConn = null;

								}
							} catch (SQLException e1) {
								e1.printStackTrace();
							}
                    	}
                    }

                    ENMOL2PlanWork mol2plan = new ENMOL2PlanWork();
                    mol2plan.planRef.code = obj.code;
                    mol2plan.molCode = vbObj.molMasterCode;
                    mol2plan.molName = vbObj.molMasterName;

                    mol2planDAO.add(mol2plan);

                    Connection finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);


                    // �����������
                    FINExecutorDAO fexDAO = new FINExecutorDAO(finConn,userProfile);
                    // FINExecutorDAO fexDAO = new FINExecutorDAO(userProfile,getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
                    FINExecutorFilter fexFilter = new FINExecutorFilter();
                    //fexFilter.conditionSQL = "p.Podr_Id = " + vbObj.endepartmentRef.code;

                    ///// MDAX-441
            		boolean usesMDAXData = false;
                	AuthLogic netAuth = new AuthLogic(connection, userProfile);
                	usesMDAXData = netAuth.checkUsesMDAXData();
                	/////

                	if (usesMDAXData)
                	{
                		ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
                		ENDepartment dep = depDAO.getObject(vbObj.endepartmentRef.code);

                		if (dep != null)
                		{
                			fexFilter.axOrgId = dep.hrmorganizationid;
                		}
                	}
                	else
                	{
                		fexFilter.finCode = vbObj.endepartmentRef.code;
                	}

                    FINExecutorShortList fexList = fexDAO.getFINExecutorList(fexFilter, 0, -1);

                    FINExecutorDAO feDAO = new FINExecutorDAO(connection, userProfile);
                    FINExecutor fe = new FINExecutor();
                    if (fexList.totalCount > 0)
                    {
                    	if (usesMDAXData)
                    	{
                    		fe.name = this.getAXFullExecutorName(fexList.get(0).axOrgId);
                    	}
                    	else
                    	{
                    		fe.name = this.getFullExecutorName(fexList.get(0).finCode);
                    	}

                        fe.finCode = fexList.get(0).finCode;
                        fe.finTypeName = fexList.get(0).finTypeName;
                        fe.finTypeCode = fexList.get(0).finTypeCode;
                        fe.finKindName = fexList.get(0).finKindName;
                        fe.finKindCode = fexList.get(0).finKindCode;
                        fe.finCehName = fexList.get(0).finCehName;
                        fe.finCehCode = fexList.get(0).finCehCode;
                        //// MDAX-441
                        fe.axOrgId = fexList.get(0).axOrgId;
                        fe.axParentOrgId = fexList.get(0).axParentOrgId;
                        fe.axParentOrgName = fexList.get(0).axParentOrgName;
                        fe.axOrgTypeId = fexList.get(0).axOrgTypeId;
                        fe.axOrgTypeName = fexList.get(0).axOrgTypeName;
                        ////

                        int finExecutorCode = feDAO.add(fe);
	                    obj.finExecutor.code = finExecutorCode;
                    }
                }
            }
        }

        dao.save(obj);

        // ������� ��������� � ������� ...
        ENPlanCorrectHistory ch = new ENPlanCorrectHistory();
        if ( obj.kind.code == ENPlanWorkKind.YEAR ) {


            ch.dateGen = new Date();
            ch.userGen = userProfile.userName;

            ch.reason.code = ENPlanCorrectReason.MOVE_TO_CURRENT;
            ch.planOldRef.code = obj.code;
            ch.code = correctionPlan(ch, ENPlanWorkStatus.GOOD, obj.status.code, null, isForSupplier);

            ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
            ch = chDAO.getObject(ch.code);

            //obj = dao.getObject(ch.planNewRef.code);
            //obj.kind.code = ENPlanWorkKind.CURRENT;

            //dao.save(obj);
            // ��� ������ correctionPlan()
            //


            if (obj.budgetRef.code != ENConsts.ENBUDGET_ENERGOSBYT) {

                ENPlanWork newPlan = dao.getObject(ch.planNewRef.code);
                newPlan.status.code = ENPlanWorkStatus.PRECONFIRMED;

                dao.save(newPlan);
            }

        }
        else
            // ������� ��������� � ��� (������. ���� �������) ...
            if ( obj.kind.code == ENPlanWorkKind.CURRENT) {
                //ENPlanCorrectHistory ch = new ENPlanCorrectHistory();

                // ����� � ������������ ����������� ������ ������� ������ .. ����� ������� ��� � ������������
                checkIncompleteCurrentPlan(obj.code, true);
                //if (checkIncompleteCurrentPlan(obj.code, false)) {
                //    throw new EnergyproSystemException("��� ����� ��������� � ����-���������� ����� ...");
                //}

                /*  12.10.2011
                *  ��� ����� �� �������
                *  �������� ������ �� ��������
                *  ��� ��� ������ ����� ������ ������/������
                */

                checkPayByServicesObject(e, true);

                // NET-4425 5. �� ���� ������ ����������� �����-�������, ���� �� ���������� ��� ���� ������������, �.�. �� ��������� �����������.

                checkCreateSecondNPZByServices(e);

                // SUPP-92662 ��� ������ �� ������ ���������� ��������, ����� ���� ���������� ��������� �������� � ����������������
                if (isPlanForRepairRequest(obj)) {
                	checkDocApprovalByPlanCode(obj.code);
                }

                ch.dateGen = new Date();
                ch.userGen = userProfile.userName;

                ch.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
                ch.planOldRef.code = obj.code;

                ch.code = correctionPlan(ch, ENPlanWorkStatus.GOOD, obj.status.code, planWorkItemArr, false, newPlanDate);


                ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
                ch = chDAO.getObject(ch.code);

                ENChangePersonBytDAO changePersonBytDao = new ENChangePersonBytDAO(connection, userProfile);
                changePersonBytDao.changePlanForChangePersonByt(obj, false);

                obj = dao.getObject(ch.planNewRef.code);

                // ������ ��� ������ � ��������� "���������� ����� � ����������� ������������" � ��� ��������� �� ��������� � ���
                if (obj.causeDisconnection == 1 && ch.planNewRef.code != ch.planOldRef.code && ch.reason.code == ENPlanCorrectReason.MOVE_TO_NPW)
                {
	                // �������� ���� ����� �� ����������� ����������� � ������ ENPlanWork2CCDamageLog
	                ENPlanWork2CCDamageLogDAO pl2ccDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
	                ENPlanWork2CCDamageLogFilter pl2ccFilter = new ENPlanWork2CCDamageLogFilter();
	                PlanWorkLogic pwLogic = new PlanWorkLogic(connection, userProfile);
	                pl2ccFilter.planRef.code = pwLogic.getMonthPlanCodeByAnyPlanCode(obj.code);
	                pl2ccFilter.orderBySQL = " enplanwork2ccdamagelog.datebegin asc ";
	                ENPlanWork2CCDamageLogShortList pl2ccList = pl2ccDAO.getScrollableFilteredList(pl2ccFilter, 0, -1);

	                if (pl2ccList.totalCount > 0) {
		                obj.dateStart = pl2ccList.get(0).dateBegin;
		                obj.dateFinal = obj.dateStart;

		                /////
		                // 24.06.16 ����� ��������� ����� � ���, ������ ��� ����� ���� ����� ������� � ����. �����
		            	int planMonth = Tools.getMonth(obj.dateStart) + 1;
		            	int planYear = Tools.getYear(obj.dateStart);

		            	obj.monthGen = planMonth;
		            	obj.yearGen = planYear;
		            	/////

		                dao.save(obj);
		            }
	                else {
	                	throw new EnergyproSystemException("��� ����� ����� �� ������� �� ���� ����������� ���� ���������� �����!");
	                }
                }

                // ��� ������ � ����� ��������� �� ������ ...
                // ���� ����� ����������� ... ��� ������ !!!

                //obj.dateStart = genNextDateForNPZ();
                //obj.dateFinal = calendar.getTime();

                //obj.dateStart = new Date(obj.dateStart.getTime() + (1.00));
                //obj.kind.code = ENPlanWorkKind.NPW;
                //dao.save(obj);
            }
            else
                // ��� ��������� � ����  ...
                if ( obj.kind.code == ENPlanWorkKind.NPW) {
                    //ENPlanCorrectHistory ch = new ENPlanCorrectHistory();

                    ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);


                    /** 05.12.2012 +++ ������ ������ � ������ ��� ����� !!!! */
                    ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
                    chFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
                    chFilter.planOldRef.code = obj.code;
                    int chArr[] = chDAO.getFilteredCodeArray(chFilter, null, null, 0, -1, null);
                    if (chArr.length > 0) {
                        throw new EnergyproSystemException("" +
                                "\n \n ��� ����� �����-������� ���� ��� ����!!!!!!!");
                    }


                    ch.dateGen = new Date();
                    ch.userGen = userProfile.userName;

                    ch.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
                    ch.planOldRef.code = obj.code;

                    ch.code = correctionPlan(ch, ENPlanWorkStatus.GOOD, obj.status.code );

                    ch = chDAO.getObject(ch.code);

                    obj = dao.getObject(ch.planNewRef.code);

                    obj.kind.code = ENPlanWorkKind.FACT;


                    /** SUPP-74627... 01.08.2018... +++ �������� ���������... ���-1696 �� 11.07.2018 "��� ������������� ����������"... */
                    /*
                    // ������ ��� ������ � ��������� "���������� ����� � ����������� ������������" � ��� ��������� ��  ��� � ����
                    if (obj.causeDisconnection == 1 && ch.planNewRef.code != ch.planOldRef.code && ch.reason.code == ENPlanCorrectReason.MOVE_TO_FACT)
                    {
                    // �������� ���� ����� �� ����������� ����������� � ������ ENPlanWork2CCDamageLog
                    ENPlanWork2CCDamageLogDAO pl2ccDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
                    ENPlanWork2CCDamageLogFilter pl2ccFilter = new ENPlanWork2CCDamageLogFilter();
                    PlanWorkLogic pwLogic = new PlanWorkLogic(connection, userProfile);
                    pl2ccFilter.planRef.code = pwLogic.getMonthPlanCodeByAnyPlanCode(obj.code);
                    pl2ccFilter.orderBySQL = " enplanwork2ccdamagelog.datebegin asc ";
                    ENPlanWork2CCDamageLogShortList pl2ccList = pl2ccDAO.getScrollableFilteredList(pl2ccFilter, 0, -1);

                    if (pl2ccList.totalCount == 0)

						// obj.dateStart = pl2ccList.get(0).dateBegin;
						// obj.dateFinal = obj.dateStart;
						// dao.save(obj);}
						// else
                        {
                    	throw new EnergyproSystemException("��� ����� ����� �� ������� �� ���� ����������� ���� ���������� �����!");
                        }
                    }
                    */


                    dao.save(obj);



                    /** NET-4555... +++ 23.08.2017....
                     *  ���� ��� ��������� � ���� � �������� ���� ������ � ������� �����������,
                     *  ������� � ���������������� ��������� ����������...
                     */
                    boolean planConsumerServices = false;
                    boolean closePlan = true;

                    if (e.typeRef.code == ENElementType.TY_BYT) {
            			try {
            				int monthPlanCode = getMonthPlanCodeByAnyPlanCode(obj.code);

            				DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);

                        	planConsumerServices = docFlowLogic.checkPlanConsumerServices(monthPlanCode);

                        	if (planConsumerServices) {
                        		docFlowLogic.closeTaskConsumerServices(monthPlanCode, closePlan);
                        	}

            			} catch (DatasourceConnectException ex) {
            				throw new SystemException(ex.getMessage(), ex);
            			} finally {
            				closeDocFlowConnection();
            			}
                    }

                    /**  06.08.2018... +++ ���� ������� � ��������� "������ ��������� �������� �����������", ��������� �������� � DocFlow... */
                    if (e.typeRef.code == ENElementType.SERVICES_OBJECT) {

                    	ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
                    	ENServicesObjectDAO sObjDao = new ENServicesObjectDAO(connection, userProfile);

        				ENServicesObjectFilter sObjFilter = new ENServicesObjectFilter();
        				sObjFilter.element.code = obj.elementRef.code;

        				int[] sObjArr = sObjDao.getFilteredCodeArray(sObjFilter, 0, -1);
        				if (sObjArr.length > 0) {

        					ENServicesObject servicesObject = sObjDao.getObjectNoSegr(sObjArr[0]);

        					/** 26.07.2018... +++ ��� ����� ������ ��� ������ ��������� */
							if (!soLogic.isTKCalcKindNew(servicesObject.code)) {
								if (servicesObject.calcTypeRef.code == ENServicesObjectCalcType.BY_CALCULATION
										&& servicesObject.contractTypeRef.code == ENServicesContractType.OTHERS) {

									boolean calcTypeByCalculation = true;

									soLogic.updateDocMovementStatusByServicesConsumer(servicesObject.code, true, calcTypeByCalculation);

                                 	/** ����������� ������� � DocFlow */
                                    soLogic.finishServicesObjectInDocFlow(servicesObject);
								}
        					}
        				}
                    }

                    // ��� �������� �������-����� �� �����������/���������� �� ������ ����������
                    // ���������� �������� � ������� ��� ���������� �������-�����
                	if (checkPlanByServicesObjectForSupplier(planCode, false)) {
                		updateDataHubDisconnectionFactCode(planCode, obj.code);
                	}


                    /* !!! ������ ���� �� ����� .. ��� ������ �� ����� ...
                    // ������������ �������� ���� - ��� � ���� ...
                    ENAct2ENPlanWorkDAO a2DAO = new ENAct2ENPlanWorkDAO(connection, userProfile);
                    ENAct2ENPlanWorkFilter a2Filter = new ENAct2ENPlanWorkFilter();
                    a2Filter.plan.code = planCode;
                    ENAct2ENPlanWorkShortList a2List = a2DAO.getScrollableFilteredList(a2Filter,0,-1);
                    if ( a2List.totalCount > 1){
                        throw new EnergyproSystemException("error in count act in plans, code="+planCode);
                    }
                    if ( a2List.totalCount == 1){
                        ENAct2ENPlanWork a2p = a2DAO.getObject(a2List.get(0).code);
                        a2p.plan.code = obj.code;
                        a2DAO.save(a2p);
                    }
                    */
                }
                else
                // ���� ������� ��������� ...
                if ( obj.kind.code == ENPlanWorkKind.FACT){

                    // �������� ��������� ���� ...
                    if (isClient == 1)
                    {
                        checkInSCCounterByPlanCode4ClosePlan(obj.code);
                        // 26.05.16 NET-4530 ������� � ����� ����� ��������� �� �������� �� ����������
                        checkInSCSealByPlanCode4ClosePlan(obj.code, true);
                    }

                    // � �����??? ����� ;) ... ������� ��� � ������� ... � ��� ����� ��� .. ������ �� ����������� !!!
                    // + ���� �� ����� ;) ... ���� ����� ;) .. ���� ������ ;)
                    //if ( obj.typeRef.code != ENPlanWorkType.AVR){
                    //
                    if ( coutEstimateResources__(obj.code) != 0 ){
                        throw new EnergyproSystemException("�� ���� ����� ���� ������������ ��� ����������������� ��������� ... ���� ����������� ����� ��� !");
                    }
                    //}

                        FINMaterialsShortList fList = eLogic.getFINMaterialsListByPlanCode(planCode, Integer.MIN_VALUE);
                        if ( fList.totalCount > 0 ){
                            throw new EnergyproSystemException("�� ���� ����� ���� ����������������� ��������� ... ���� ����������� ����� ��� ��� �������� �������������� !");
                        }

                        // �������� ���� �� ������� ...
                        countRealResources(obj.code);

                        //ENElement e = new ENElementDAO(connection, userProfile).getObject(obj.elementRef.code);

                        ENAct act = new ActLogic(connection,userProfile).getActByPlanCode(planCode, false);
                        if (
                                (act != null)
                            )
                        {
                            //ENElement e = new ENElementDAO(connection, userProfile).getObject(obj.elementRef.code);
                            // ��� ���������� - ����� ��� ������������ ���� ...
                            if ( !
                                    ((e.typeRef.code == ENElementType.METROLOGY_COUNTER)
                                    && (obj.stateRef.code == ENPlanWorkState.TO))
                                )
                            {
                                throw new EnergyproSystemException("���� ���� �������� � ���� � "+ act.numberGen +" ) !!!");
                            }
                        }

                        // ��� ���������� - ��������� � �����������
                        if (e.typeRef.code == ENElementType.METROLOGY_COUNTER){
                            CounterLogic cLogic = new CounterLogic(connection, userProfile);
                            ENMetrologyCounter cnt = cLogic.getCounterByElementCode(obj.elementRef.code);

                            WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
                            ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(obj.code, true);

                            //cLogic.unLockByAct(act.code, 0);
                            cLogic.lockCounterForMetrology(cnt, wo, 0, obj.stateRef.code);
                        }

                            Calendar c = Calendar.getInstance();
                            c.setTime(com.ksoe.energynet.util.Tools.clearTimeOfDate(new Date()));
                            if (obj.dateStart.after(c.getTime())){
                                throw new EnergyproSystemException(
                                        "���� �� ������� ���������� ������ .. ��������� ���� ���� ����� = " + new SimpleDateFormat("dd.MM.yyyy").format(obj.dateStart).toString()
                                        +", ��� �����=" + obj.code
                                        );
                            }

                    closeClearPlan(obj);

                }
                else
                    // "��������" ��������� � �������� ����
                    if (obj.kind.code == ENPlanWorkKind.CALCULATION){
                        ch.dateGen = new Date();
                        ch.userGen = userProfile.userName;

                        ch.reason.code = ENPlanCorrectReason.MOVE_FROM_CALCULATION_TO_CURRENT;
                        ch.planOldRef.code = obj.code;
                        //ch.code = correctionPlanForNPZ(ch, ENPlanWorkStatus.GOOD, obj.status.code );
                        ch.code = correctionPlan(ch, ENPlanWorkStatus.GOOD, obj.status.code);//obj.status.code );

                        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
                        ch = chDAO.getObject(ch.code);

                        obj = dao.getObject(ch.planNewRef.code);
                    }
                    else
                    {
                        throw new EnergyproSystemException("�������� ��� ����� (��� = " + obj.kind.code + ")!");
                    }

        int outPlanCode = Integer.MIN_VALUE;

        // �������� ����� ���� �� ������������ ...
        if (ch.code >  Integer.MIN_VALUE){
            ENPlanWork p = dao.getObject(ch.planNewRef.code);

            if ((!isServices) && (!priconnections)
                    && (e.typeRef.code != ENElementType.CARGO_OBJECT)
                    /* 20.09.2012 +++ ������� ������������ ������ */
                    && (e.typeRef.code != ENElementType.BUILDER)
                    /* 06.10.2013 +++ ������� � ���������� ���.������� */
                    && (e.typeRef.code != ENElementType.TECHCONDITIONSSERVICES) ) {
                checkUnicPlan(p);
            }

            // ������ ��� ������ �����
            outPlanCode = p.code;
        }

        // ���� ��������� ������� ���� � ��������
        if (obj.kind.code == ENPlanWorkKind.YEAR)
        {
        	// 27.11.14 NET-4415 ������� ������� �������� ���� �� ������������ �� ��������
        	closePlansForCPPByMainPlan(planCode, outPlanCode);
        }

        // SUPP-84293 �������� ������ ����� � �������� ���� ��� ��������� ������

       if (outPlanCode != Integer.MIN_VALUE){
        ENPlanWork pForContract = dao.getObject(outPlanCode);
        if(     pForContract.typeRef.code == ENPlanWorkType.TMC_TRANSFER ){
    		    ENPlanwork2GeneralContractsDAO p2genDAO = new ENPlanwork2GeneralContractsDAO(connection, userProfile);
                ENGeneralContractsDAO gencontrDAO = new ENGeneralContractsDAO(connection, userProfile);

  		    	ENPlanwork2GeneralContractsFilter p2genFil = new ENPlanwork2GeneralContractsFilter();
  				p2genFil.planRef.code = outPlanCode;
  				int[] p2genArr = p2genDAO.getFilteredCodeArray(p2genFil, 0, -1);

  				if (p2genArr.length==0){ // ���� �� ����� ������ � ���������
  					ENPlanwork2GeneralContractsFilter p2genF = new ENPlanwork2GeneralContractsFilter();
  					p2genF.planRef.code = planCode; // ������ �������� � ��������� ����������� ���������� �����
  	  				int[] p2genA = p2genDAO.getFilteredCodeArray(p2genF, 0, -1);

  	  				if(p2genA.length>0){

  	  				    ENPlanwork2GeneralContracts p2genct = p2genDAO.getObject(p2genA[0]);

	  	  				ENPlanwork2GeneralContracts p2gen = new ENPlanwork2GeneralContracts();


	  	  		    	p2gen.dateEdit=new Date();
	  	  		    	p2gen.generalContractRef.code=p2genct.generalContractRef.code;
	  	  		    	p2gen.planRef.code=outPlanCode;
	  	  		    	p2gen.userGen=userProfile.userName;
	  	  		    	p2genDAO.add(p2gen);
  	  				}


  		       }
         }
	 }


        return outPlanCode;
    }


	public int createCorrectionPlanHistory(ENPlanCorrectHistory object) throws PersistenceException
    {
        ENPlanCorrectHistoryDAO objectDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

        ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
        f.planNewRef.code = object.planOldRef.code;

        ENPlanCorrectHistoryShortList l = objectDAO.getScrollableFilteredList(f,0,-1);
        if (l.totalCount > 0 ){
            object.planRef.code = l.get(0).planRefCode;
        }
        else{
            object.planRef.code = object.planOldRef.code;
        }

        object.dateEdit = new Date();
        object.dateGen = new Date();
        object.userGen = userProfile.userName;

        return objectDAO.add(object);
    }



	public int correctionPlan(ENPlanCorrectHistory object, int newStatus,
			int oldStatus) throws PersistenceException {

		return correctionPlan(object, newStatus, oldStatus, null);
	}

	public int correctionPlan(ENPlanCorrectHistory object, int newStatus,
			int oldStatus, ENPlanWorkItemShort[] planWorkItemArr)
			throws PersistenceException {

		return correctionPlan(object, newStatus, oldStatus, planWorkItemArr, false);
	}

	public int correctionPlan(ENPlanCorrectHistory object, int newStatus,
			int oldStatus, ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier) throws PersistenceException {
		return correctionPlan(object, newStatus, oldStatus, planWorkItemArr, isForSupplier, null);
	}

	public int correctionPlan(ENPlanCorrectHistory object, int newStatus,
			int oldStatus, ENPlanWorkItemShort[] planWorkItemArr, boolean isForSupplier, Date newPlanDate)
			throws PersistenceException {

		int newPlanCode = copyPlan(object.planOldRef.code, newStatus, oldStatus, planWorkItemArr, isForSupplier, newPlanDate);

		if (newPlanCode == Integer.MIN_VALUE) {
			throw new EnergyproSystemException("\n"
					+ "Plan not corrected, code = " + object.planOldRef.code);
		}

		object.planNewRef.code = newPlanCode;

		return createCorrectionPlanHistory(object);
	}


    public int correctionPlanForNPZ(ENPlanCorrectHistory object, int newStatus, int oldStatus) throws PersistenceException
    {
        /*
        object.setDomain_info(null);

        object.dateEdit = new Date();
        object.dateGen = new Date();
        object.userGen = userProfile.userName;

        ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
        f.planNewRef.code = object.planOldRef.code;

        ENPlanCorrectHistoryDAO objectDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryShortList l = objectDAO.getScrollableFilteredList(f,0,-1);

        if (l.totalCount > 0 ){
            object.planRef.code = l.get(0).planRefCode;
        }
        else{
            object.planRef.code = object.planOldRef.code;
        }
        */
        //PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());

        int newPlanCode = copyPlanForNPZ(object.planOldRef.code, newStatus, oldStatus);

            if (newPlanCode == Integer.MIN_VALUE){
                throw new EnergyproSystemException("Plan not corrected , code=" + object.planOldRef.code);
            }

        object.planNewRef.code = newPlanCode;

        return createCorrectionPlanHistory(object) ;  //objectDAO.add(object);

    }

    public void removeMoveHistory(int planCode) throws PersistenceException
    {
        // ������� ��������� � ��� ..
        ENPlanWorkMoveHistoryDAO mDAO = new ENPlanWorkMoveHistoryDAO(connection, userProfile);
        ENPlanWorkMoveHistoryFilter mFilter = new ENPlanWorkMoveHistoryFilter();
        mFilter.planRef.code = planCode;
        int[] mArr = mDAO.getFilteredCodeArray(mFilter, null, null, 0, -1, null);
        for (int mh = 0; mh < mArr.length; mh++){
            mDAO.remove(mArr[mh]);
        }
    }


    public void deletePlan(int planCode) throws PersistenceException
    {

    	Connection finConn = null;

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(planCode);

        if ( plan.status.code != ENPlanWorkStatus.GOOD ){
            new EnergyproSystemException("���� ���� ������������ .. ����������� �������� ��� ������������� �����������");
        }

        if (plan.kind.code == ENPlanWorkKind.FACT)
        {
            ENAct act = new ActLogic(connection,userProfile).getActByPlanCode(planCode, false);
            if (act != null){
                if (act.statusRef.code != ENActStatus.GOOD)
                throw new EnergyproSystemException("��� (� "+ act.numberGen +" ) ��� ���������� ��� ��������� !!!");
            }
        }

        String chCodes = getCodesHistoryDown(planCode);
        //String strPlanCode = ""+planCode;

        if ( ! chCodes.equals(""+planCode ) ){
            throw new EnergyproSystemException("�������� ����� ������ ��������� ���� ... ����������� �������� ��� ������������� �����������");
        }

        int parentPlanCode = getParentPlanWorkCode(plan, false);
        // ��� ��������� ����� �������� , ���� ���� ���� �������� ��� ���� �������� ����� �� ������ ������� �������(���) ����

        if (parentPlanCode != Integer.MIN_VALUE){
        ENPlanWork parentPlan = planDAO.getObject(parentPlanCode);
        if ( parentPlan != null ){
            throw new EnergyproSystemException("�������� ����� ������ ��������� ���� ... ����������� �������� ��� ������������� �����������");
        }
        }

        TransportLogic tLogic = new TransportLogic(connection, userProfile);
        HumenLogic hLogic = new HumenLogic(connection, userProfile);
        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
        PlanWorkItemLogic pLogic = new PlanWorkItemLogic(connection, userProfile);

        /// 17.01.11
        eLogic.checkInContractByPlanWorkCode(planCode);
        ///

        ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
        planItemFilter.planRef.code = plan.code;

        int planItemArr[] = planItemDAO.getFilteredCodeArray(planItemFilter, 0, -1);
        for (int i = 0; i < planItemArr.length; i++){
            tLogic.removeENTransportItemsByPlanItemCode(planItemArr[i]);

            hLogic.removeHumenItemsByPlanItemCode(planItemArr[i]);

            eLogic.removeENEstimateItemsByPlanItemCode(planItemArr[i]);

            /*�������� ������������� �������� ��������� � ������*/
            pLogic.deleteTKKoefByPlanWorkItemCode(planItemArr[i]);

            planItemDAO.remove(planItemArr[i]);
        }

        /** 26.03.2014...  +++ � ������� �� �������� ���������� ����� ���... */
        eLogic.removeENEstimateItemsByPlanCode(plan.code);

        // 24.02.15 NET-4440 ������� ������� ��������� ������� ��� �� �����
        removePlanFuelHistory(plan.code);

        WorkOrderLogic wLogic = new WorkOrderLogic(connection, userProfile);

        wLogic.removeWorkOrderForOpenPlanByPlanCode(plan.code, true); // ������ ��� ������� ���� �� ��

        // ������ ������� �������������
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(userProfile, connection);
        ENPlanCorrectHistoryFilter chF = new ENPlanCorrectHistoryFilter();
        chF.planNewRef.code = planCode;
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chF,0,-1);
        for (int i=0; i < chList.totalCount; i++){
            chDAO.remove(chList.get(i).code);
        }

        // ���� �� ������� ������� ��������� ...

        ENPlanWorkMoveHistoryDAO mhDAO = new ENPlanWorkMoveHistoryDAO(userProfile, connection);
        ENPlanWorkMoveHistoryFilter mhF = new ENPlanWorkMoveHistoryFilter();
        mhF.planRef.code = planCode;
        ENPlanWorkMoveHistoryShortList mhList = mhDAO.getScrollableFilteredList(mhF,0,-1);
        for (int i=0; i < mhList.totalCount; i++){
            mhDAO.remove(mhList.get(i).code);
        }


        /**  17.08.2012 +++ ��������� ������������ �� ����� */
        FINExecutor2PlanDAO executor2PlanDAO = new FINExecutor2PlanDAO(userProfile, connection);
        FINExecutor2PlanFilter ex2planFilter = new FINExecutor2PlanFilter();
        ex2planFilter.planRef.code = planCode;
        FINExecutor2PlanShortList ex2planList = executor2PlanDAO.getScrollableFilteredList(ex2planFilter, 0, -1);
        for (int e = 0; e < ex2planList.totalCount; e++) {
            executor2PlanDAO.remove(ex2planList.get(e).code);
        }


        /** SUPP-14913... ��������� �� �����... */
        ENMOLSTOREKEEPER2PlanWorkDAO m2pwDao = new ENMOLSTOREKEEPER2PlanWorkDAO(userProfile, connection);
        ENMOLSTOREKEEPER2PlanWorkFilter m2pwFilter = new ENMOLSTOREKEEPER2PlanWorkFilter();
        m2pwFilter.planRef.code = planCode;
        ENMOLSTOREKEEPER2PlanWorkShortList m2pwList = m2pwDao.getScrollableFilteredList(m2pwFilter, 0, -1);
        for (int m = 0; m < m2pwList.totalCount; m++) {
            m2pwDao.remove(m2pwList.get(m).code);
        }

        // NET-4383 ������ ������ ��������� ��� �������� ���� ���� . � �������� ���� ��� ��������
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_OS && plan.kind.code == ENPlanWorkKind.FACT ) {

        	ENPlanWorkENAct2OSDataDAO pl2actOSDAO = new ENPlanWorkENAct2OSDataDAO(userProfile, connection);
        	ENPlanWorkENAct2OSDataFilter pl2actFilter = new ENPlanWorkENAct2OSDataFilter();

        	pl2actFilter.planWorkRef.code = plan.code;

        	ENPlanWorkENAct2OSDataShortList pl2actList = pl2actOSDAO.getScrollableFilteredList(pl2actFilter, 0, -1);

	    	 if( pl2actList.totalCount > 0 ) {

	    		 try
	             {
	                 finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	                 FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);
	                 fkOsLogic.unlockOS(pl2actList.get(0).num_un); // ������� ���������� ��������� ��� ��������

	             }
	             catch(DatasourceConnectException e){}
	             finally
	             {
	                 try {
	                     if (finConn != null && ! finConn.isClosed()) {
	                         finConn.close();
	                         finConn = null;
	                     }
	                 } catch (SQLException e) {
	                 }
	             }

	    		  pl2actOSDAO.remove(pl2actList.get(0).code);   // ������ ���� ��� ��������


	    	 }

        } // end NET-4383


        /** ������ � ���������� */
        ENServices2PlanDAO services2PlanDAO = new ENServices2PlanDAO(userProfile, connection);
        ENServices2PlanFilter services2planFilter = new ENServices2PlanFilter();
        services2planFilter.planRef.code = planCode;
        ENServices2PlanShortList services2planList = services2PlanDAO.getScrollableFilteredList(services2planFilter, 0, -1);
        for (int e = 0; e < services2planList.totalCount; e++) {
        	services2PlanDAO.remove(services2planList.get(e).code);
        }


        /** ����� ������� */
		ENInspectionSheetDAO inspectionSheetDao = new ENInspectionSheetDAO(userProfile, connection);
		ENInspectionSheetFilter inspectionSheetFilter = new ENInspectionSheetFilter();
		inspectionSheetFilter.planRef.code = planCode;

		int shArr[] = inspectionSheetDao.getFilteredCodeArray(inspectionSheetFilter, 0, -1);
		for (int h = 0; h < shArr.length; h++) {
			ENInspectionSheet inspectionSheet = inspectionSheetDao.getObject(shArr[h]);
			inspectionSheet.planRef.code = Integer.MIN_VALUE;

			inspectionSheetDao.save(inspectionSheet);
		}


		/** ���� ��� �������� ���������  */
		ENPlanProjectTemplateDAO plProjTmplDAO = new ENPlanProjectTemplateDAO(userProfile, connection);
		ENPlanProjectTemplateFilter plProjTmplFil = new ENPlanProjectTemplateFilter();
		plProjTmplFil.planRef.code = planCode;
		int plProjTmplArr[] = plProjTmplDAO.getFilteredCodeArray(plProjTmplFil, 0, -1);
		for (int pt = 0; pt < plProjTmplArr.length; pt++) {
			plProjTmplDAO.remove(plProjTmplArr[pt]);
		}

		/** ������� ���������  */
		ENPlanProjectDAO plProjDAO = new ENPlanProjectDAO(userProfile, connection);
		ENPlanProjectFilter plProjFil = new ENPlanProjectFilter();
		plProjFil.planRef.code = planCode;
		int plProjArr[] = plProjDAO.getFilteredCodeArray(plProjFil, 0, -1);
		for (int pp = 0; pp < plProjArr.length; pp++) {
			plProjDAO.remove(plProjArr[pp]);
		}


		/// ������� ������ ENServFromSide2PlanWork ������ �������� ������ ������ � �������
        ENServFromSide2PlanWorkDAO so2plDAO = new ENServFromSide2PlanWorkDAO(connection, userProfile);
        ENServFromSide2PlanWorkFilter so2plFil = new ENServFromSide2PlanWorkFilter();
        so2plFil.planRef.code=planCode;
        int[] so2plArr = so2plDAO.getFilteredCodeArray(so2plFil, 0, -1);
        if (so2plArr.length != 0) {
        	so2plDAO.remove(so2plArr[0]);

        }

        planDAO.remove(plan.code);

        // ������ ������������!!!
        // ������� ��� ;) ����������������� ���������� ;)
        /* ���������� � ��� ...
        if (plan.finExecutor.code > Integer.MIN_VALUE){
            FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
            d.remove(plan.finExecutor.code);
        }
        */
    }


    public void openPlan(int planCode) throws PersistenceException
    {
        openPlan(planCode, 1);
    }

    public void openPlan(int planCode, int isClient) throws PersistenceException
    {
        openPlan(planCode, isClient, false);
    }

    public void openPlan(int planCode, int isClient, boolean isFromCallCenter) throws PersistenceException
    {
    	openPlan(planCode, isClient, isFromCallCenter, false);
    }

    public void openPlan(int planCode, int isClient, boolean isFromCallCenter, boolean isFromBilling) throws PersistenceException
    {


                //         ���������� ��� �������� �� �����

                /*ENElementDAO etdao = new ENElementDAO(connection, userProfile);
                ENElementFilter etf = new ENElementFilter();
                etf.conditionSQL = " enelement.code in ( select  elementrefcode from  enplanwork where enplanwork.code = " + planCode + " ) "  ;
                int elementtype = Integer.MIN_VALUE;
                ENElementShortList l = etdao.getScrollableFilteredList(etf,0,-1);
                if (l.totalCount>0){
                    elementtype = l.get(0).typeRefCode;

                }*/



        ElementLogic elLogic = new ElementLogic(connection, userProfile);
        // int elType = elLogic.getElementTypeByPlanCode(planCode);
        int elementType = elLogic.getElementTypeByPlanCode(planCode);

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(planCode);

        if (plan.status.code == ENPlanWorkStatus.WORKS_FINISHED)
        {
            //throw new EnergyproSystemException("���������� �������� ����� � �������� \"������ ��������\"! �������� �������� ���� � ������ \"������������\"!");
            throw new EnergyproSystemException("���������� �������� ����� � �������� \"������ ��������\"! �������� �������� ���� � ������ \"��������\"!");
        }


        /* 28.04.2012 +++ ��� ��������� ������� ������� */
        if (plan.typeRef.code == ENPlanWorkType.TRUCKING) {
            TransportRouteLogic trLogic = new TransportRouteLogic(connection, userProfile);
            trLogic.deleteRoute(plan.code);
        }


        /* �������  ������ �� ��������� */
        /*    SUPP-65266 ������ ����������� �������-����
         * 		�� ����� ������� ������������ ������, ���� ����������
         * 		������ "�������������" � ������� ����
         * */
        if(!(plan.kind.code == ENPlanWorkKind.FACT &&
        		plan.status.code == ENPlanWorkStatus.LOCKED)) {
            TransportOrderLogic trOrdLogic = new TransportOrderLogic(connection, userProfile);
            ENTransportOrder trOrdObj = null;


            if (plan.kind.code == ENPlanWorkKind.FACT
            		&& (plan.stateRef.code != ENPlanWorkState.WRITINGS_OS
            			&& plan.typeRef.code != ENPlanWorkType.ENPLANWORKTYPE_WRITEOFF_OS)) {
                int npzCode = getParentPlanWorkCode(plan);

                if (npzCode == Integer.MIN_VALUE) {
                	trOrdObj =  trOrdLogic.getTransportOrderByPlanCode(planCode);
                } else {
                	trOrdObj =  trOrdLogic.getTransportOrderByPlanCode(npzCode);
                }

            } else {
                trOrdObj =  trOrdLogic.getTransportOrderByPlanCode(planCode);
            }


            if (trOrdObj != null ) {
    	        if (trOrdObj.transportOrderStatus.code != ENTransportOrderStatus.GOOD){
    	            throw new EnergyproSystemException("���������� �������� ����� �� ���� ��������� ���������� ������ , �� ������ ������ �� � \"��������\" !"+ " ��� ����������� ������ - " + trOrdObj.numbergen  );
    	        }
    	        if (trOrdObj.transportReal.code != Integer.MIN_VALUE){
    	                throw new EnergyproSystemException("���������� �������� ����� �� ���� ��������� ���������� ������ , �� � ������ ����`������ �������� ��������� !" + " ��� ����������� ������ - " + trOrdObj.numbergen);
    	        }
                try {
                    Context context;

                        context = new InitialContext();
                        Object objtoOrdRef = context.lookup(ENTransportOrderController.JNDI_NAME);
                        ENTransportOrderControllerHome toOrdHome = (ENTransportOrderControllerHome) PortableRemoteObject.narrow(objtoOrdRef, ENTransportOrderControllerHome.class);
                        ENTransportOrderController toOrd = toOrdHome.create();
                        toOrd.removeTransportOrderWithTransportItems(trOrdObj.code);
                } catch (NamingException e) {
                	throw new EnergyproSystemException(e.getMessage(),e);
                } catch (RemoteException e) {
                	throw new EnergyproSystemException(e.getMessage(),e);
                } catch (CreateException e) {
                	throw new EnergyproSystemException(e.getMessage(),e);
                }

            }
        }



        /** NET-4555... +++ 23.08.2017....
         *  ���� ��� ��������� � ���� � �������� ���� ������ � ������� �����������,
         *  ������� � ���������������� ��������� ����������...
         */
        if (plan.kind.code == ENPlanWorkKind.FACT && elementType == ENElementType.TY_BYT) {
        	boolean planConsumerServices = false;
        	boolean closePlan = false;
        	int monthPlanCode = getMonthPlanCodeByAnyPlanCode(plan.code);

			try {
				DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);

				planConsumerServices = docFlowLogic.checkPlanConsumerServices(monthPlanCode);
				if (planConsumerServices) {
					docFlowLogic.closeTaskConsumerServices(monthPlanCode, closePlan);
				}

			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				closeDocFlowConnection();
			}
		}



        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);

        // �������� ������ � ����� ... � ������� ����� � ���
        // ��� ��� ���� �� ������� ...
        if (plan.kind.code == ENPlanWorkKind.FACT)
        {
            // ���� ���� �������� - ������ .. ��� ������ �� ������� ������� ������ �� ��������� ..
            if (isClient == 1)
            {
                checkInSCCounterByPlanCode4ClosePlan(plan.code);
                // 26.05.16 NET-4530 ������� � ����� ����� ��������� �� �������� �� ����������
                // ��� ������ ����� ����������� � �������� �����.
                checkInSCSealByPlanCode4ClosePlan(plan.code, true);
            }

            ENAct act = new ActLogic(connection,userProfile).getActByPlanCode(planCode, false);
            if (act != null)
            {
                // ������ ���� ������� �� ����� ;)
                //if (act.statusRef.code != ENActStatus.GOOD)
                throw new EnergyproSystemException("��� ���� �������� �� ���� (� "+ act.numberGen +" ) ... ��������� ����'���� �� ����!!!");
            }

            // �������� ��������� ����� ��� ���� ...
            if (plan.status.code == ENPlanWorkStatus.LOCKED){

                if ( coutEstimateResources__(planCode) != 0 ){
                    throw new EnergyproSystemException("�� ���� ����� ���� ������������ ��� ����������������� ��������� ... ���� ����������� ����� ��� !");
                }

                FINMaterialsShortList fList = eLogic.getFINMaterialsListByPlanCode(planCode, Integer.MIN_VALUE);
                if ( fList.totalCount > 0 ){
                    throw new EnergyproSystemException("�� ���� ����� ���� ����������������� ��������� ... ");
                }

                //AuthLogic auth = new AuthLogic(connection, userProfile);
                //if ( ! auth.checkPermission("ksoe/energynet/", ""))

                /**  04.09.2017... +++ ����� �� ����� ��� ���� ��� ��������!?!?!?!
                Date d = new Date();
                Calendar c = Calendar.getInstance();
                c.setTime(d);
                c.add(Calendar.MONTH, -1);
                Date d1 = c.getTime();
                if (plan.dateStart.before(d1))
                {
                    throw new EnergyproSystemException("����� ����� ��������� � ������� ����� ���� �������� ...", userProfile);
                }
                */

                plan.status.code = ENPlanWorkStatus.GOOD;
                planDAO.save(plan);
                return;
            }


        }

        if ( isNotEditablePlan(plan) ){
            /// 14.03.14 ��� ��� ���� �����???
            //new EnergyproSystemException("���� ���� ������������ .. �������� ��� ...");
            throw new EnergyproSystemException("\n\n���� � ����� " + plan.code + " ��� ���������! ������� �������� �����������!");
            ///
        }

        String chCodes = getCodesHistoryDown(planCode);
        //String strPlanCode = ""+planCode;

        if ( ! chCodes.equals(""+planCode ) ){
            throw new EnergyproSystemException("�������� ����� ������ ��������� ���� ...");
        }

    	// ��� ��������� � ������������ �/� �� ���������� ������ �� �����������/����������
    	// �������-����� ��������� ������ �� ��������
        if (plan.kind.code == ENPlanWorkKind.NPW && !isFromBilling) {
        	if (!userProfile.userName.equals("energynet")) {
        		checkPlanByServicesObjectForSupplier(planCode);
        	}
        }

        TransportLogic tLogic = new TransportLogic(connection, userProfile);
        HumenLogic hLogic = new HumenLogic(connection, userProfile);

        int corrReason = Integer.MIN_VALUE;
        //int newStatus = Integer.MIN_VALUE;

        if (plan.kind.code == ENPlanWorkKind.FACT)
            corrReason = ENPlanCorrectReason.MOVE_TO_FACT;
        else
        if (plan.kind.code == ENPlanWorkKind.NPW)
            corrReason = ENPlanCorrectReason.MOVE_TO_NPW;
        else
        if (plan.kind.code == ENPlanWorkKind.CURRENT && elementType != ENElementType.SERVICES_OBJECT  )
            corrReason = ENPlanCorrectReason.MOVE_TO_CURRENT;
        else
            // ���� ���� ������� � ��� ������ �� ������� ����� Reason ����� ���������
        if (plan.kind.code == ENPlanWorkKind.CURRENT && elementType == ENElementType.SERVICES_OBJECT )
            corrReason = ENPlanCorrectReason.MOVE_FROM_CALCULATION_TO_CURRENT;
        else
            throw new EnergyproSystemException("����� ���� �� ��������������. " + plan.kind.name);

        int parentPlanCode = getParentPlanWorkCode(plan.code, corrReason);

        if ((parentPlanCode == Integer.MIN_VALUE) &&
        		(plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION && plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT)  ){
            throw new EnergyproSystemException("���������� ���� �� ������ ...");
        }

        ENPlanWork parentPlan = planDAO.getObject(parentPlanCode);

        // ������������ ����� ...
        if (plan.kind.code == ENPlanWorkKind.NPW){
            // �� ��� �� ����� .. ��� ����� ���� ...
            tLogic.checkTransportItemInTravelSheetByPlanCode(plan.code, true);

            // ������ ���� �� ����� ;)
            // ��������� � ��� � ������������ ����� ..
            /*
            ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(connection, userProfile);
            ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();
            tsiFilter.planRef.code = plan.code;
            int[] tsiArr = tsiDAO.getFilteredCodeArray(tsiFilter, 0, 1);
            if ( tsiArr.length != 0 ){
                throw new EnergyproSystemException("��� ���� � � ������������ ���� ... ��� ��������� ����� �������� ��������� ���� � ����������� �����");
            }
            */

            checkPlanInWorkOrderByt(planCode, "�������� ������� ���� � ������� ��������!");
        }

        if (plan.kind.code == ENPlanWorkKind.FACT){
            // ��������� � ��� � ������������ ����� ..
            /*
            if (tLogic.checkTransportItemInTravelSheetByPlanCode(plan.code, true))
            {
                throw new EnergyproSystemException("��� ���� � � ������������ ���� ... ��� ��������� ����� �������� ��������� ���� � ����������� �����");
            }
            */
            ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(connection, userProfile);
            ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();
            tsiFilter.planRef.code = plan.code;
            int[] tsiArr = tsiDAO.getFilteredCodeArray(tsiFilter, 0, 1);
            if ( tsiArr.length != 0 ){
                throw new EnergyproSystemException("��� ���� � � ������������ ���� ... ��� ��������� ����� �������� ��������� ���� � ����������� �����");
            }


            tsiFilter.planRef.code = parentPlanCode;
            tsiArr = tsiDAO.getFilteredCodeArray(tsiFilter, 0, 1);
            if ( tsiArr.length != 0 ){
                throw new EnergyproSystemException("��� ����� ����� � � ������������ ���� ... ��� ��������� ����� ��������� ���� � ����������� �����");
            }

            // ������ �� � ������� ������� ����2����� ...
            //ENPlan2HumenDAO p2hDAO = new ENPlan2HumenDAO(connection, userProfile);
            //p2hDAO.deleteByPlanCode(plan.code);
            ActCalculator actClc = new ActCalculator(connection, userProfile);
            actClc.deletePlanWorkItem2Humen(plan.code);

            actClc.deletePlan2HumenByTabNumberPlanCodeKindCode__(null, plan.code, Integer.MIN_VALUE);

            // 30.11.15 ��������� �������� �������-����, ���� ��� �������-���� �������� � ������� ������� ��� �������� ������� -
            // ��� ����� ������ ������ �� ��������!!!
            if (parentPlanCode > Integer.MIN_VALUE && !isFromBilling)
            {
            	checkPlanInWorkOrderByt(parentPlanCode, "���� ������� ������� ����� � �����!", ENWorkOrderBytType.RAID_BY_BILLING);
            }
        }


        ENPlanWorkItem2TKKoefDAO pi2kDAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);

            AVRLogic avrLogic = new AVRLogic(connection, userProfile);

        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);



        /// 17.01.11
        // ������ ���� ... �� ����������� ��������� ...
        //eLogic.checkInContractByPlanWorkCode(planCode);
        ///

        ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
        planItemFilter.planRef.code = plan.code;
        ENPlanWorkItemShortList planItemList = planItemDAO.getScrollableFilteredList(planItemFilter, 0, -1);
        for (int i = 0; i < planItemList.totalCount; i++){

            if ((( plan.kind.code == ENPlanWorkKind.NPW ) || ( plan.kind.code == ENPlanWorkKind.FACT )) && (plan.typeRef.code == ENPlanWorkType.AVR ))
            {

                ENPlanWorkItem pItem = planItemDAO.getObject(planItemList.get(i).code);

                ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
                estimateFilter.planItemRef.code = pItem.code;

                /* 12.01.2012 +++ ���� ������, �� ���� ���� */
                if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                        || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                    estimateFilter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
                        + ENEstimateItemKind.SERVICES + ")";
                } else {
                    estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
                }

                ENEstimateItemShortList oldEList = eDao.getScrollableFilteredList(estimateFilter, 0, -1);

                BigDecimal oldCount = pItem.countGen;
                pItem.countGen = new BigDecimal(0);
                planItemDAO.save(pItem);

                eLogic.recalcENEstimateItemsByPlanItemCodeAVR(pItem.code);
                avrLogic.recalcCurrentAVRByPlanWorkItem(pItem, oldCount, oldEList);

            }

            tLogic.removeENTransportItemsByPlanItemCode(planItemList.get(i).code);

            hLogic.removeHumenItemsByPlanItemCode(planItemList.get(i).code);

            eLogic.removeENEstimateItemsByPlanItemCode(planItemList.get(i).code);

            ////////////// 20.12.10
            ENEstimateItemFilter filter = new ENEstimateItemFilter();
            filter.planItemRef.code = planItemList.get(i).code;

            // ��� ���������� � ����������� ... �� �� ����... ������ ���, ������� ������ � ���������������
            // (� ���, ������� ������ ���������� (��� ����) - ���!)
            filter.kindRef.code = ENEstimateItemKind.GSM;

            //filter.typeRef.code = ENEstimateItemType.AUTO;
            //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
            int[] eArr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
            for (int j=0; j < eArr.length; j++){
                ENEstimateItem eItem = eDao.getObject(eArr[j]);
                eLogic.checkInRQOrder(eItem, true);

                eLogic.checkInContract(eItem.code);

                // NET-4529	���� ������� , �������// ���� � ����� ������� �� ���� ������
                if (plan.kind.code == ENPlanWorkKind.CURRENT)
                	eLogic.checkInPurchaseItem(eItem);

                ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
                ff.estimateItemOutRef.code = eArr[j]; //list.get(i).code;
                int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
                for (int qq = 0; qq < eeArr.length; qq++){
                    e2eDAO.remove(eeArr[qq]);
                }

                eDao.remove(eArr[j]);
            }
            //////////////


            // �� ������� ����� ���� ... ������� ��
            ENPlanWorkItem2TKKoefFilter pi2kFilter = new ENPlanWorkItem2TKKoefFilter();
            pi2kFilter.planWorkItemRef.code = planItemList.get(i).code;
            int[] pi2kArr = pi2kDAO.getFilteredCodeArray(pi2kFilter, null, null, 0, -1, null);
            for (int qq=0; qq<pi2kArr.length; qq++ ){
                pi2kDAO.remove(pi2kArr[qq]);
            }
            planItemDAO.remove(planItemList.get(i).code);
        }
        // ������ ��������� �� ����������� � ������� ...
        // + �������� ������ ...
        // + ���������������

        ENMarkEstimateDAO m2eDAO = new ENMarkEstimateDAO(connection, userProfile);

        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planRef.code = plan.code;

        //filter.typeRef.code = ENEstimateItemType.AUTO;
        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] estArr = eDao.getFilteredCodeArray(filter, 0, -1);
        for (int i=0; i < estArr.length; i++){

        	ENEstimateItem eItem = eDao.getObject(estArr[i]);

            // 31.12.10 �������� �� ����� ��������� � ���������
            eLogic.checkInContract(estArr[i]);

            // NET-4529	���� ������� , �������// ���� � ����� ������� �� ���� ������
            if (plan.kind.code == ENPlanWorkKind.CURRENT)
                eLogic.checkInPurchaseItem(eItem);

            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = estArr[i];
            ff.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            // ������� ������� ??
            ENMarkEstimateFilter m2eFilter = new ENMarkEstimateFilter();
            m2eFilter.estimateItem.code = estArr[i];
            int[] m2eArr = m2eDAO.getFilteredCodeArray(m2eFilter, 0, -1);
            for (int m2e = 0; m2e  < m2eArr.length; m2e++){
                m2eDAO.remove(m2eArr[m2e]);
            }



            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 ��������, ������� ����� ��������������� ���
            if (eItem.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// ������������� ������ � ����� �� ������������ � ������� ������ � ���� ������
            	recalcPlanForCPP(eItem, true);
            }
            ////////////////////////////////////////////////////////////////

            eDao.remove(estArr[i]);
        }



        WorkOrderLogic wLogic = new WorkOrderLogic(connection, userProfile);

        //-----------------------------
        // �������� ������� � ���������� ... ������ ��� ��� ...
        if (plan.kind.code == ENPlanWorkKind.NPW){

            // ��� ��������� - ��������� � ������������� ...
                ENElement el = new ENElementDAO(connection, userProfile).getObject(plan.elementRef.code);

                // ������ ��� ��������� - �������� ��� ��� �������� � ������������� ...
                if (el.typeRef.code == ENElementType.METROLOGY_COUNTER){
                    ENWorkOrder workOrder1 = wLogic.getWorkOrderByPlanCode(plan.code, false) ; // new ENWorkOrderDAO(enConn, getUserProfile()).getObject(w2p.workOrder.code);
                    CounterLogic cntLogic = new CounterLogic(connection, userProfile);
                    ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(el.code);
                    cntLogic.lockCounterForMetrology(cnt, workOrder1, 0, plan.stateRef.code);
                }
        }

        //-----------------------------


        eLogic.canceledFINMaterialsByPlan(plan.code);
        wLogic.removeWorkOrderForOpenPlanByPlanCode(plan.code, true); // ������ ��� ������� ���� �� ��



        int parentStatus = ENPlanWorkStatus.GOOD;

        if (parentPlan != null){

            // ������� ������������ �� ������������� ����� ...
            //�� ������� ������� removeWorkOrderForOpenPlanByPlanCode
            if ( parentPlan.kind.code != ENPlanWorkKind.CURRENT ){
                eLogic.canceledFINMaterialsByPlan(parentPlan.code);
                wLogic.removeWorkOrderForOpenPlanByPlanCode(parentPlan.code, false); // ����� � �� ��� ���� .. �������� ���� ...
            }


            if ((parentPlan.kind.code == ENPlanWorkKind.NPW) && ( parentPlan.typeRef.code == ENPlanWorkType.AVR)){
                ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
                piFilter.planRef.code = parentPlan.code;
                int[] piArr = planItemDAO.getFilteredCodeArray(piFilter, null, null,0, -1, null);
                for (int q1=0; q1<piArr.length; q1++){
                    ENPlanWorkItem pi = planItemDAO.getObject(piArr[q1]);

                    ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
                    estimateFilter.planItemRef.code = pi.code;
                    estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

                    ENEstimateItemShortList oldEList_ = eDao.getScrollableFilteredList(estimateFilter, 0, -1);
                    ENEstimateItemShortList oldEList = new ENEstimateItemShortList();
                    for (int q2=0; q2 < oldEList_.totalCount; q2++){
                        ENEstimateItemShort es = oldEList_.get(q2);
                        es.countGen = es.countFact = new BigDecimal(0);
                        oldEList.list.add( es );
                    }
                    oldEList.setTotalCount(oldEList_.totalCount);

                    avrLogic.recalcCurrentAVRByPlanWorkItem(pi, new BigDecimal(0), oldEList);

                }

            }

            // ��� �������� �������-����� �� �����������/���������� �� ������ ����������
            // ���������� �������� � �������� ��� �������-�����
            if (plan.kind.code == ENPlanWorkKind.FACT) {
            	if (checkPlanByServicesObjectForSupplier(parentPlan.code, false)) {
            		updateDataHubDisconnectionFactCode(parentPlan.code, Integer.MIN_VALUE);
            	}
            }

            // ���� ������� � ���� ��� �����/����� - ������ �� ������ ...
            if (parentPlan.kind.code == ENPlanWorkKind.CURRENT){

                // ��� �������� � ����������� - �������� ����������� ������ !!!
                if (parentPlan.sourceRef.code == ENPlanWorkSource.AUTO_CREATE){
                    parentStatus = ENPlanWorkStatus.LOCKED;
                }
                else
                if ((parentPlan.sourceRef.code == ENPlanWorkSource.MANUAL))
                {

                if (parentPlan.formRef.code == ENPlanWorkForm.PLANNED){
                    parentStatus = ENPlanWorkStatus.LOCKED;
                }
                else
                {
                    String parentCodes = getCodesHistoryDown(parentPlan.code);
                    ENPlanWorkFilter parentFilter = new ENPlanWorkFilter();
                    if ( parentCodes.length() > 0){

                        parentFilter.conditionSQL = " enplanwork.code in (" + parentCodes + ")";
                        parentFilter.conditionSQL = parentFilter.conditionSQL + " and enplanwork.code <> "+ plan.code;

                        int[] parentArr = planDAO.getFilteredCodeArray(parentFilter, 0, -1) ;

                        //if (parentCodes.indexOf(",") >= 0){
                        // ������ �������� ����� ;) ... ��� ��� �� ������� ...
                        if (parentArr.length > 1){
                            parentStatus = parentPlan.status.code;
                        }
                    }

                    // ��� �������������� ������ �� ������������ (���� ��� �����-������ ����� ������������) ��������� ������ "������������"
                    if (isAutoPlanForOwnProduction(parentPlan.code))
                    {
                    	parentStatus = ENPlanWorkStatus.LOCKED;
                    }

                    // ��� �������������� ������ �� ���������� ��� ���� ��������� ������ "������������"
                    if (elementType == ENElementType.NO_OBJECT_AVZ)
                    {
                    	parentStatus = ENPlanWorkStatus.LOCKED;
                    }
                }
                } // if ((parentPlan.sourceRef.code == ENPlanWorkSource.MANUAL))
            }

            parentPlan.status.code = parentStatus;
            planDAO.save(parentPlan);
        }

        // ����� ��������� ������� ���������� ������� ������ �� ����
        ENChangePersonBytDAO changePersonBytDao = new ENChangePersonBytDAO(connection, userProfile);
        changePersonBytDao.changePlanForChangePersonByt(plan, true);

        // ������ ������� �������������
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(userProfile, connection);
        ENPlanCorrectHistoryFilter chF = new ENPlanCorrectHistoryFilter();
        chF.planNewRef.code = planCode;
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chF,0,-1);
        for (int i=0; i < chList.totalCount; i++){
            chDAO.remove(chList.get(i).code);
        }

        // ���� �� ������� ������� ��������� ...

        // ������� ����� !!!
        //� ��������� ������� �� ���� ������������ � ������

        // ����� �������� � ���

        // ��� ������� �� ���������� !!!
        // ���� ���� ��� - ���������� ��������� � ������ !!!
        /*
        ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(connection, userProfile);
        ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
        a2pFilter.plan.code = planCode;
        int actArr[] = a2pDAO.getFilteredCodeArray(a2pFilter, null, null, 0, -1, null);
        for (int i=0; i < actArr.length; i++){
            a2pDAO.remove(actArr[i]);
        }
        */

        /**  27.08.2012 +++ ��������� ������������ �� ����� */
        FINExecutor2PlanDAO executor2PlanDAO = new FINExecutor2PlanDAO(userProfile, connection);
        FINExecutor2PlanFilter ex2planFilter = new FINExecutor2PlanFilter();
        ex2planFilter.planRef.code = planCode;
        FINExecutor2PlanShortList ex2planList = executor2PlanDAO.getScrollableFilteredList(ex2planFilter, 0, -1);
        for (int e = 0; e < ex2planList.totalCount; e++) {
            executor2PlanDAO.remove(ex2planList.get(e).code);
        }

        ///// 13.03.14 SUPP-13672 ���� ����� ���������� ��� ������ ������ �� CallCenter'�, ������� ������ ����� � �������
        /*
        if (isFromCallCenter)
        {
            ENPlanWork2CCDamageLogDAO plan2CCDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLogFilter plan2CCDamageLogFilter = new ENPlanWork2CCDamageLogFilter();
            plan2CCDamageLogFilter.planRef.code = planCode;
            int[] plan2CCDamageLogArr = plan2CCDamageLogDAO.getFilteredCodeArray(plan2CCDamageLogFilter, 0, -1);

            for (int i = 0; i < plan2CCDamageLogArr.length; i++)
            {
                plan2CCDamageLogDAO.remove(plan2CCDamageLogArr[i]);
            }
        }
        */
        if (plan.kind.code == ENPlanWorkKind.NPW)
        {
            ENPlanWork2CCDamageLogDAO plan2CCDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLogFilter plan2CCDamageLogFilter = new ENPlanWork2CCDamageLogFilter();
            plan2CCDamageLogFilter.planRef.code = planCode;
            int[] plan2CCDamageLogArr = plan2CCDamageLogDAO.getFilteredCodeArray(plan2CCDamageLogFilter, 0, -1);

            if (plan2CCDamageLogArr.length > 0)
            {
                if (isFromCallCenter)
                {
                    for (int i = 0; i < plan2CCDamageLogArr.length; i++)
                    {
                        plan2CCDamageLogDAO.remove(plan2CCDamageLogArr[i]);
                    }
                }
                else // ���� ����� �� �� CallCenter'�, ������� �������� �����, ����� �� �������� �� foreign key
                {
                    ENPlanWork2CCDamageLog plan2CCDamageLog = plan2CCDamageLogDAO.getObject(plan2CCDamageLogArr[0]);

                    throw new EnergyproSystemException("\n\nNET-4337 ��� ���� ��� ����������� ��������� � CallCenter'�.\n" +
                                                    "��� ���� ��������� ������� ������� �������� ������ � CallCenter'� !\n"+
                                                    "��� ������: " + plan2CCDamageLog.ccDamageLogCode);
                }
            }
        }
        /////

        // 24.02.15 NET-4440 ������� ������� ��������� ������� ��� �� �����
        removePlanFuelHistory(plan.code);

        removeServices2Plan(plan.code);

        removeInform2Plan(plan.code);

        // SUPP-71707
        InvestProgramLogic investProgramLogic = new InvestProgramLogic(connection, userProfile);
        investProgramLogic.checkPlanInInvestProgram(plan);

        planDAO.remove(plan.code);

        // ������ ������������!!!
        // ������� ��� ;) ����������������� ���������� ;)
        //  AS ���������� � ��� ������
        /*
        if (plan.finExecutor.code > Integer.MIN_VALUE){
            FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
            d.remove(plan.finExecutor.code);
        }
        */

        //ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWork obj = dao.getObject(planCode);
        //if (obj.status.code != ENPlanWorkStatus.LOCKED){
        //    throw new EnergyproSystemException("PlanWork already opened or canceled , code="+planCode);
        //}


        //obj.status.code = ENPlanWorkStatus.GOOD;
        //dao.save(obj);

    }



    private void removeServices2Plan(int planCode) throws PersistenceException {
		ENServices2PlanDAO s2pDAO = new ENServices2PlanDAO(connection, userProfile);
		ENServices2PlanFilter s2pFilter = new ENServices2PlanFilter();
		s2pFilter.planRef.code = planCode;
		int[] s2pArr = s2pDAO.getFilteredCodeArray(s2pFilter, 0, -1);
		for (int g=0;g<s2pArr.length;g++)
		{
			s2pDAO.remove(s2pArr[g]);
		}

	}


    private void removeInform2Plan(int planCode) throws PersistenceException {
		ENPlanInformCustomerDAO pciDAO = new ENPlanInformCustomerDAO(connection, userProfile);
		ENPlanInformCustomerFilter pciFilter = new ENPlanInformCustomerFilter();
		pciFilter.planRef.code = planCode;
		int[] pciArr = pciDAO.getFilteredCodeArray(pciFilter, 0, -1);
		for (int g=0;g<pciArr.length;g++)
		{
			pciDAO.remove(pciArr[g]);
		}

	}

	public boolean isWinterMonth(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        int month = calendar.get(Calendar.MONTH);
        return month == Calendar.DECEMBER || month == Calendar.JANUARY || month == Calendar.FEBRUARY;
    }

    public boolean isWinterPlan(int planCode) throws PersistenceException{
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObjectNOSEGR(planCode);

        if (obj.code == Integer.MIN_VALUE){
            throw new EnergyproSystemException("PlanWork not found , code="+planCode);
        }

        return isWinterMonth(obj.dateStart);
    }


    public boolean isNotEditablePlan(int planCode) throws PersistenceException{
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObjectNoRefNoSegr(planCode);

        if (obj.code == Integer.MIN_VALUE){
            throw new EnergyproSystemException("PlanWork not found , code="+planCode);
        }

        return isNotEditablePlan(obj);
    }

    public boolean isNotEditablePlan(ENPlanWork obj) throws PersistenceException{

        if (obj == null){
            throw new EnergyproSystemException("PlanWork NULLLLLLL");
        }

        if (obj.code == Integer.MIN_VALUE){
            throw new EnergyproSystemException("PlanWork not found , code="+ obj.code);
        }

        return obj.status.code == ENPlanWorkStatus.LOCKED
            || obj.status.code == ENPlanWorkStatus.CORRECTED
            || obj.status.code == ENPlanWorkStatus.OLDER
            || obj.status.code == ENPlanWorkStatus.CANCELED_
            || obj.status.code == ENPlanWorkStatus.WORKS_FINISHED
            //|| obj.status.code == ENPlanWorkStatus.PRECONFIRMED
        ? true : false;
    }


    /**
     *	������� ��������� �����
	 * 	@param ENPlanWorkMoveHistory
	 *	@param isChangeForm - �������� ��� ����� �����
     *
     */
	public int movePlanWork(ENPlanWorkMoveHistory data, boolean isChangeForm)
			throws PersistenceException {

		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
		ENPlanWork plan = planDAO.getObject(data.planRef.code);

		ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
		ENElement elementObj = elementDAO.getObject(plan.elementRef.code);

		PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);


/*
 * ������ ������� �� ������ �������� ��������� ����� �����������
 * ����� �� ���� ��������� ����� ��� ���� ����
		if (
        ((elementObj.typeRef.code==ENElementType.TY_BYT)
            ||(elementObj.typeRef.code==ENElementType.TY_PROM))
            && (plan.formRef.code==ENPlanWorkForm.NOPLANNED)
        )
        {
            if (plan.budgetRef.code != ENConsts.ENBUDGET_VRTU)
                throw new EnergyproSystemException("���������� ���������� ������������ �������� �����!");
        }
*/

		int yearPlanBeforeMove = plan.yearGen;

        if (plan.status.code == ENPlanWorkStatus.WORKS_FINISHED)
        {
            throw new EnergyproSystemException("���������� ���������� ����� � �������� \"������ ��������\"!");
        }

        ///// 29.11.13 ���� ������� ����� ������ � �������� ������ ����
        if (data.yearGen != plan.yearGen)
        {
        	/*
            if(!(data.yearGen == 2015 && plan.yearGen == 2014) &&
                    !(data.yearGen == 2014 && plan.yearGen == 2013)
                    && !(data.yearGen == 2014 && plan.yearGen == 2015)
                    && !(data.yearGen == 2015 && plan.yearGen == 2016)
                    && !(data.yearGen == 2016 && plan.yearGen == 2015)
                    && !(data.yearGen == 2017 && plan.yearGen == 2015) // SUPP-38701
                    && !(data.yearGen == 2017 && plan.yearGen == 2016)
                    && !(data.yearGen == 2018 && plan.yearGen == 2016)
                    && !(data.yearGen == 2018 && plan.yearGen == 2017)
                    ) //SUPP-10198, SUPP-10819, SUPP-22998
             */

        	// 27.06.2017 SUPP-63317 �������� ��-������� (����� ���� �� 2 ���� � ��� �������)
        	if (Math.abs(data.yearGen - plan.yearGen) > 2 && !userProfile.userName.equals("energynet") ) {
        		throw new EnergyproSystemException("\n\n���������� ����� ������� ����� � ����� ������ ����!");
        	}
        }
        /////


        /////
        // 07.12.2015 �������� ������� ������, � ������� ���� ������ �� ��������� "�����, �� �� ����� ���������������"
        /*
        if (checkForProhibitedWorks(plan.code))
        {
        	throw new EnergyproSystemException("\n\n� ���� � ����� " + plan.code + " � ������ � ������� ��������� \"�����, �� �� ����� ���������������\".\n" +
        			"��� ��������� ��� ����, ��� ������ ������� ��������!");
        }
        */
        checkForProhibitedWorks(plan.code, elementObj.typeRef.code, "��� ��������� ��� ����, ��� ������ ������� ��������!");
        /////

		if (plan.kind.code == ENPlanWorkKind.CURRENT) {

			if (data.dateGen.after(new Date())) {
				throw new EnergyproSystemException(
						"���� ���� ����� �� ������� ���� ����� �� ������� ...");
			}

			Calendar calendar_ = Calendar.getInstance();
            calendar_.set(Calendar.HOUR_OF_DAY, 0);
            calendar_.set(Calendar.MINUTE, 0);
            calendar_.set(Calendar.SECOND, 0);
            calendar_.set(Calendar.MILLISECOND, 0);
            calendar_.set(Calendar.MONTH, data.monthGen - 1);
            calendar_.set(Calendar.YEAR, data.yearGen);
            calendar_.set(Calendar.DATE, 1);

            Calendar calendar_1 = Calendar.getInstance();
            calendar_1.setTime(new Date());
            calendar_1.set(Calendar.HOUR_OF_DAY, 0);
            calendar_1.set(Calendar.MINUTE, 0);
            calendar_1.set(Calendar.SECOND, 0);
            calendar_1.set(Calendar.MILLISECOND, 0);
            calendar_1.set(Calendar.DATE, 1);
            calendar_1.add(Calendar.MONTH,2);

            // 10.01.2016 VS... ������ ������������... ����� ������� ���� �����, ���� �� ����������...
            if (calendar_.getTime().after(calendar_1.getTime())&&
                    ((elementObj.typeRef.code==ENElementType.TY_BYT)||(elementObj.typeRef.code==ENElementType.TY_PROM))
            ){
                throw new EnergyproSystemException("���� ����� �� ������� ���� ����� �� 2 ����� �� ������� ...");
            }


        /// 17.01.11
        //
        //EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
        //eLogic.checkInContractByPlanWorkCode(plan.code);
        ///

        // �������� ��� �� ���/������ ....
        String planCodes = getCodesHistoryDown(data.planRef.code);
        if (planCodes.indexOf(",") != -1 ){
            throw new EnergyproSystemException("��� � �����-�������� ��� ����� �� ����� ���� ... ��������� �� ...");
        }

        ENPlanWorkMoveHistoryDAO moveDAO = new ENPlanWorkMoveHistoryDAO(connection, userProfile);

        ENPlanWorkMoveHistoryFilter moveFilter = new ENPlanWorkMoveHistoryFilter();
        moveFilter.planRef.code = data.planRef.code;
        moveFilter.conditionSQL = " dategen > ?";

        Vector<Date> dates = new Vector<>();
        dates.add(data.dateGen);

        ENPlanWorkMoveHistoryShortList moveList = moveDAO.getScrollableFilteredList(moveFilter,0,-1,dates);
        if ( moveList.totalCount > 0){
            throw new EnergyproSystemException("���� ���� ����� ������� ���� ����� �� ������� ���� ���� (" + moveList.get(0).dateGen + ") ;) ");
        }

        ///// 25.11.14 NET-4415
        if (isPlanWithOwnProduction(plan.code))
        {
        	// throw new SystemException("\n\nNET-4415 ���������� ����������� �����, � ���� � �������� � �������� \"������ �����������\"!");

        	// �������� ������� ������, � ������� ���� ��������� �� �������� "������ �����������", ������ ������ � ������ ��� ��������
        	if (isChangeForm)
        	{
        		throw new SystemException("\n\nNET-4415 ���������� �����, � ���� � �������� � �������� \"������ �����������\", " +
						"������������ ����� �� �����²!");
        	}

        	// ������� ������ �����
			Date planDate = Tools.encodeDate(plan.yearGen, plan.monthGen, 1);
            // ������, �� ������� ���� ����� ���������
			Date dataDate = Tools.encodeDate(data.yearGen, data.monthGen, 1);

			if (dataDate.before(planDate))
			{
				throw new SystemException("\n\nNET-4415 ���������� �����, � ���� � �������� � �������� \"������ �����������\", " +
						"������������ ����� �� ���� ��� ������!");
			}
        }

        // ������� �������������� ������ �� ������������ ���� ���������
        if (isAutoPlanForOwnProduction(plan.code) /*for SUPP-73775 */ && !userProfile.userName.equals("energynet")  )
        {
        	throw new SystemException("\n\nNET-4415 ���������� ����������� ����������� ��������� ����� �� ������������!");
        }
        /////

        ENPlanWorkMoveHistory moveOut = new ENPlanWorkMoveHistory();
        moveOut.monthGen = plan.monthGen;
        moveOut.yearGen = plan.yearGen;
        moveOut.commentGen = data.commentGen;
        moveOut.dateGen = data.dateGen;
        moveOut.planRef.code = data.planRef.code;
        moveOut.reason.code = data.reason.code;
        moveOut.dateEdit = new Date();
        moveOut.userGen = userProfile.userName;

        ///// �������� ������ �������� ��� � ����� �����, ����� ������� ����� � ������ ������
        if (plan.monthOriginal == Integer.MIN_VALUE)
        	plan.monthOriginal = plan.monthGen;
        if (plan.yearOriginal == Integer.MIN_VALUE)
        	plan.yearOriginal = plan.yearGen;
        /////

        plan.monthGen = data.monthGen;
        plan.yearGen = data.yearGen;

        // AS ���� ���������� ��� ����� ���� ...
        //checkPeriod(plan, true);

        // �������� ���� �� ���������� ��� ��������� ;) .. ��� ������
        ENPlanWorkForm pf = new ENPlanWorkFormDAO(connection, userProfile).getObject(plan.formRef.code);
        if (moveOut.commentGen == null) moveOut.commentGen = "";
        moveOut.commentGen = moveOut.commentGen + " (" + pf.name + ")";


        if (!isChangeForm) {
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItem obj;
            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);

            eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter.planRef.code = plan.code;
            eFilter.statusRef.code = ENEstimateItemStatus.PLANNED;
            eFilter.conditionSQL = " enestimateitem.countfact > 0 ";

            int eList[] = eDAO.getFilteredCodeArray(eFilter, 0, -1);
            for (int i = 0; i < eList.length; i++) {

            	obj = eDAO.getObject(eList[i]);
                if (estimateLogic.checkInRQOrder(obj, plan, true, false)) {
                	throw new SystemException("\n\n" +
                    		"������� � ����� ����� ������ � ��� �������� ������! \n" +
                    		"��������� ���� �� ������������");
                }
            }
        } else {
			plan.formRef.code = ENPlanWorkForm.NOPLANNED;
		}

        //// ������... ���������� ���� ��� ����������� � ����� ��������� �������� � ��������� ������

        /*
         * /// 26.11.2018 - c �������� ���� ����������� � ��������� � ����� �� �� ��� ���������� ����� � ���������� ���� �������� ������� - �����
         * if (isChangeForm && planBeforeMove.formRef.code == ENPlanWorkForm.PLANNED && plan.kind.code == ENPlanWorkKind.CURRENT ) {
         *
        	ENEstimateItem2ContractDAO ei2ctDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
        	ENEstimateItem2ContractFilter ei2ctFil = new ENEstimateItem2ContractFilter();
        	ei2ctFil.conditionSQL = " enestimateitem2contrct.code in  " +
        			                " ( select distinct ei2ct.code from enestimateitem ei , enestimateitem2contrct ei2ct "+
        			                " where ei.planrefcode = "+ plan.code +
        			                " and ei.code = ei2ct.estimateitemcode ) ";
        	int[] ei2ctArr = ei2ctDAO.getFilteredCodeArray(ei2ctFil, 0, -1);
        	if (ei2ctArr.length>0){
        		ENEstimateItem2Contract ei2ctObj = ei2ctDAO.getObject(ei2ctArr[0]);
        		throw new SystemException("\n\n" +
                		"������� � ����� ����� ��� ������� �� �������� � " + ei2ctObj.contractNumber + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(ei2ctObj.contractDate) );
        	}
        }*/

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);
        calendar.set(Calendar.DATE, 1);
        plan.dateStart = calendar.getTime();

        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        plan.dateFinal = calendar.getTime();

  /////// NET-4529	���� ������� , ������� PLANPURCHASE  ������������� ���������� �� ����� ������� ��� �������� ����� �� ��� �����
      	if (yearPlanBeforeMove < data.yearGen  ){

      		purchaseLogic.freeEstimateWhenPlanWorkMoving(plan.code);

      	}

        planDAO.save(plan);


		// ���� ������� �������� �� ������� �������� ������ � ��� � ������� ���� ���� �������
	   if(data.yearGen>plan.yearGen ) {
        if( purchaseLogic.checkHavePlanPurchaseByEstimate(plan.code)  > 0  ) {
				throw new EnergyproSystemException(" \n PlanWorkLogic.movePlanWork  \n \n ��� ��������� ����� ���� ���������. ���������� ���� �� ����������. ");
		}
	   }

        ///////////////// 29.08.12 NET-2800
        // ��� �������� ����� ���� ������ ���� ������������ ������ ����� ��, ��� � �����
        FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
        FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
        finExecutor2PlanFilter.planRef.code = plan.code;
        int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

        for (int i = 0; i < finExecutor2PlanArr.length; i++)
        {
            FINExecutor2Plan finExecutor2Plan = finExecutor2PlanDAO.getObject(finExecutor2PlanArr[i]);
            finExecutor2Plan.dateStart = plan.dateStart;
            finExecutor2PlanDAO.save(finExecutor2Plan);
        }

        if (finExecutor2PlanArr.length > 0)
        {
            recalcTotalTime(plan.code);
        }
        ////////////////

    	///// NET-4440 ��� ��������� ���� ����� ��������� ������� ��� �� ����� �����
    	PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
    	planLogic.generatePlanFuelHistory(plan.code, plan.dateStart);
    	/////


        return moveDAO.add(moveOut);


        }
        else
            throw new EnergyproSystemException("��� ���� ��������� ��������� �� ���� ������ ��������� ...");
    }


    public boolean validatePlanPeriodStart(ENPlanWork plan) {

            boolean out = true;

            Date d;
            Calendar calendar = Calendar.getInstance();

            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.MONTH, plan.monthGen - 1);
            calendar.set(Calendar.YEAR, plan.yearGen);
            calendar.set(Calendar.DATE, 1);
            d = calendar.getTime();
            if ( plan.dateStart.before(d) ){
                throw new EnergyproSystemException("���� ������ ����� ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
            }


            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.MONTH, plan.monthGen - 1);
            calendar.set(Calendar.YEAR, plan.yearGen);
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            d = calendar.getTime();
            if (plan.dateFinal.after(d)){
                throw new EnergyproSystemException("���� ��������� ����� ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
            }

            // � ������� �������� ������ !!!
            calendar.setTime(new Date());
            ///// 03.01.11 � ����� �����, ������!!! ;-)
            //if (plan.yearGen < calendar.get(Calendar.YEAR)){
            if (plan.yearGen < calendar.get(Calendar.YEAR) &&
                // � ������ ���� ��������� ����� �� ������-������� ����������� ����
                !((plan.monthGen == 11 || plan.monthGen == 12) &&
                    (plan.yearGen == calendar.get(Calendar.YEAR) - 1) &&
                    (calendar.get(Calendar.MONTH) == 0))
                )
            {
                throw new EnergyproSystemException("������ ����� �� ����� ���� ������ �������� ����");
            }
            return out;
    }

    public void validatePlanPeriodOnlyStart(ENPlanWork plan)
    {
        Date d;

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);
        calendar.set(Calendar.DATE, 1);
        d = calendar.getTime();
        if ( plan.dateStart.before(d) ){
            throw new EnergyproSystemException("���� ������ ����� ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
        }

        calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        d = calendar.getTime();
        if (plan.dateStart.after(d)){
            throw new EnergyproSystemException("���� ������ ����� ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
        }

        // � ������� �������� ������ !!!
        calendar.setTime(new Date());
        ///// 03.01.11 � ����� �����, ������!!! ;-)
        //if (plan.yearGen < calendar.get(Calendar.YEAR)){
        if (plan.yearGen < calendar.get(Calendar.YEAR) &&
             // � ������ ���� ��������� ����� �� ������-������� ����������� ����
            !((plan.monthGen == 11 || plan.monthGen == 12) &&
                (plan.yearGen == calendar.get(Calendar.YEAR) - 1) &&
                (calendar.get(Calendar.MONTH) == 0))
            )
        {
            throw new EnergyproSystemException("������ ����� �� ����� ���� ������ �������� ����");
        }

    }

    public void validatePlanPeriod(ENPlanWork plan) {

    	Date d;

        Calendar calendar = Calendar.getInstance();

        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);
        calendar.clear(Calendar.HOUR);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.HOUR_OF_DAY);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);
        calendar.set(Calendar.DATE, 1);

        /////
        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);
        calendar.clear(Calendar.HOUR);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.HOUR_OF_DAY);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        /////

        /////
        Calendar cStart = Calendar.getInstance();
        cStart.setTime(plan.dateStart);
        cStart.clear(Calendar.HOUR);
        cStart.clear(Calendar.HOUR_OF_DAY);
        cStart.clear(Calendar.MINUTE);
        cStart.clear(Calendar.SECOND);
        cStart.clear(Calendar.MILLISECOND);

        cStart.set(Calendar.HOUR, 0);
        cStart.set(Calendar.HOUR_OF_DAY, 0);
        cStart.set(Calendar.MINUTE, 0);
        cStart.set(Calendar.SECOND, 0);
        cStart.set(Calendar.MILLISECOND, 0);

        Date planDateStart = cStart.getTime();
        /////

        d = calendar.getTime();
        //if ( plan.dateStart.before(d) ){
        if ( planDateStart.before(d) ){
            throw new EnergyproSystemException("���� ������ ����� (" + new SimpleDateFormat("dd.MM.yyyy").format(plan.dateStart) + ") ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
        }


        calendar = Calendar.getInstance();

        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);
        calendar.clear(Calendar.HOUR);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.HOUR_OF_DAY);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));

        /////
        Calendar cFinal = Calendar.getInstance();
        cFinal.setTime(plan.dateFinal);
        cFinal.clear(Calendar.HOUR);
        cFinal.clear(Calendar.HOUR_OF_DAY);
        cFinal.clear(Calendar.MINUTE);
        cFinal.clear(Calendar.SECOND);
        cFinal.clear(Calendar.MILLISECOND);

        cFinal.set(Calendar.HOUR, 0);
        cFinal.set(Calendar.HOUR_OF_DAY, 0);
        cFinal.set(Calendar.MINUTE, 0);
        cFinal.set(Calendar.SECOND, 0);
        cFinal.set(Calendar.MILLISECOND, 0);
        /////

        d = calendar.getTime();
        //if (plan.dateFinal.after(d)){

        /** SUPP-76664...
        if (planDateFinal.after(d)){
            throw new EnergyproSystemException("���� ��������� ����� (" + new SimpleDateFormat("dd.MM.yyyy").format(plan.dateFinal) + ") ������ ���� � �������� "+ plan.yearGen +" ���� � "+ plan.monthGen+" ������");
        }
        */

        // � ������� �������� ������ !!!
        calendar.setTime(new Date());
        ///// 03.01.11 � ����� �����, ������!!! ;-)
        //if (plan.yearGen < calendar.get(Calendar.YEAR)){
        if (plan.yearGen < calendar.get(Calendar.YEAR) &&
             // � ������ ���� ��������� ����� �� ������-������� ����������� ����
            !((plan.monthGen == 11 || plan.monthGen == 12) &&
                (plan.yearGen == calendar.get(Calendar.YEAR) - 1) &&
                (calendar.get(Calendar.MONTH) == 0))
            )
        {
            throw new EnergyproSystemException("������ ����� �� ����� ���� ������ �������� ����");
        }
/*
 * ��� �� ����������� .. ��� �������(01.04 ;) .. ������� ���� �� 31.03 ...)
 *
        if ( (plan.yearGen ==  calendar.get(Calendar.YEAR)) && (plan.monthGen < calendar.get(Calendar.MONTH) + 1))
        {
            throw new EnergyproSystemException("������ ����� �� ����� ���� ������ �������� ������");
        }
*/
    }

    public void countRealResources(int planCode) throws PersistenceException
    {
            countRealResources(planCode, "");
    }

    public void countRealResources(int planCode, String workOrderNumber) throws PersistenceException
    {
        int count = 0;
        int count1 = 0;

        ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
        f.planRef.code = planCode;
        f.conditionSQL = " enplanworkitem.countgen <> 0 and " +
                            // 24.11.11 NET-991 ������� ������ �� ��������� ���������� "������ ��� �������� ����� �� ����"
                            // (�� ��� ������� ��� � �� ������ ���� �� �����, �� �-���, �� ��-��)
                            // 16.11.12 ������� �������� �� ������ ���������������
                            " enplanworkitem.kartarefcode not in " +
                            " (select tc.code from tktechcard tc where tc.techcardsourcecode = " + TKConsts.TKCARD_SOURCE_REPORTS  +
                                    " or tc.classificationtypecode =  " + TKConsts.TKCARD_CLASSIFICATIONTYPE_PETROL_GENERATOR + ")";
        ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
        ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
        ENPlanWorkItemShortList l = dao.getScrollableFilteredList(f, 0, -1);
        for (int i=0; i<l.totalCount;i++){
               count = 0;
               count1 = 0;

               ENHumenItemFilter hFilter = new ENHumenItemFilter();
            hFilter.planItemRef.code = l.get(i).code;
            hFilter.conditionSQL = "enhumenitem.finworkercode is not null";
            int[] hArr = hDAO.getFilteredCodeArray(hFilter, hFilter.conditionSQL , null, 0,-1,null);
            if (hArr.length == 0){
                count = count + 1;
            }

            // ���� ��� - ������ ������� ... ;)
            // 08.07.10 - ������ :)
            ENTransportItemFilter tFilter = new ENTransportItemFilter();
            tFilter.planItemRef.code = l.get(i).code;
            tFilter.conditionSQL = "/*entransportitem.countworkfact <> 0 and*/ entransportitem.finworkercode is not null";
            int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
            if (tArr.length == 0){
                count1 = count1 + 1;
            }

            if (count > 0 && count1 > 0) {
                throw new EnergyproSystemException("�� ������ " + l.get(i).kartaNum + " "+ l.get(i).kartaRefName +" ��� �������� �����. �������� ���-�� ����� ��� ��������� �������� ���������� (��� ����� "+ planCode +")" + workOrderNumber);
            }
        }
    }


    public int countResourcesInPlan(int planCode) throws PersistenceException
    {
        int count = 0;

        ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
        f.planRef.code = planCode;
        f.conditionSQL = "enplanworkitem.countgen <> 0";
        ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemShortList l = dao.getScrollableFilteredList(f, 0, -1);
        count = l.totalCount;


        EstimateLogic el = new EstimateLogic(connection, userProfile);
        count = count + el.countEstimateItemInPlan(planCode);

        HumenLogic hl = new HumenLogic(connection, userProfile);
        count+=hl.countHumenItemInPlan(planCode);

        TransportLogic tl = new TransportLogic(connection, userProfile);
        count+= tl.countTransportItemInPlan(planCode);

        return count;

    }

    public int coutEstimateResources__(int planCode) throws PersistenceException
    {
        int out = 0;
        EstimateLogic el = new EstimateLogic(connection, userProfile);
        out = el.countEstimateItemInPlanForPlanClose__(planCode);
        return out;
    }


    public void removePlan(int planCode) throws PersistenceException
    {
            // ������ ������� ������������� .. � ��������� !!!
            ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(userProfile, connection);
            ENPlanCorrectHistoryFilter chF = new ENPlanCorrectHistoryFilter();
            chF.planNewRef.code = planCode;
            ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chF,0,-1);
            for (int i=0; i < chList.totalCount; i++){
                chDAO.remove(chList.get(i).code);
            }

    }



    public String getCodesHistoryUp(int planCode) throws PersistenceException
    {
        String out = getCodesHistoryUp(planCode, "");
        return out.length() == 0 ? "" + Integer.MIN_VALUE : out;
    }


    public String getCodesHistoryUp(int planCode, String data)  throws PersistenceException
    {
        if (data.length() > 500)
        {
            throw new EnergyproSystemException("\n\n!!! ����������� ���� [PlanWorkLogic.getCodesHistoryUp]!!! PlanCode = " + planCode);
        }

        String codes = "";
        int oldPlan;
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planNewRef.code = planCode;
        chFilter.conditionSQL = String.format("%s not in (%d, %d, %d)", ENPlanCorrectHistory.reason_QFielld, ENPlanCorrectReason.MOVE_TO_preCONFIRM, ENPlanCorrectReason.MOVE_TO_CONFIRM, ENPlanCorrectReason.UNDO_MOVE_TO_preCONFIRM);
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chFilter, 0, -1);

        if ( chList.totalCount == 0 )
            return data;

        for (int i=0; i<chList.totalCount; i++){
            oldPlan = chList.get(i).planOldRefCode;
            if (data.length() <= 0){
                codes = "" + oldPlan;
            }
            else
            {
                codes = data + ", " + oldPlan;
            }

            //if (oldPlan != chList.get(i).planRefCode){
                codes = getCodesHistoryUp(oldPlan, codes);
            //}
            //else
            //{
            //      return codes;
            // }
        }
        return  codes;
    }

    public String getCodesHistoryUp2(int planCode) throws PersistenceException
    {
        String out = getCodesHistoryUp2(planCode, "");
        return out.length() == 0 ? "" + Integer.MIN_VALUE : out;
    }


    public String getCodesHistoryUp2(int planCode, String data)  throws PersistenceException
    {
        if (data.length() > 500)
        {
            throw new EnergyproSystemException("\n\n!!! ����������� ���� [PlanWorkLogic.getCodesHistoryUp2]!!! PlanCode = " + planCode);
        }

        String codes = "";
        int newPlan;
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planOldRef.code = planCode;
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chFilter, 0, -1);

        if ( chList.totalCount != 0 ){
        for (int i=0; i<chList.totalCount; i++){
            newPlan = chList.get(i).planNewRefCode;
            if (newPlan != planCode){
                if (codes.length() <= 0){
                    codes = "" + getCodesHistoryUp2(newPlan, data);
                }
                else
                {
                    codes = codes + ", " + getCodesHistoryUp2(newPlan, data);
                }
            }
        }
        }

        if (codes.length() == 0 )
                codes = "" + planCode;
            else
                codes += ", " + planCode;


        return  codes;
    }

    public String getCodesHistoryDown(int planCode) throws PersistenceException
    {
        String out = getCodesHistoryDown(planCode, "");
        return out.length() == 0 ? "" + Integer.MIN_VALUE : out;
    }


    public String getCodesHistoryDown(int planCode, String data)  throws PersistenceException
    {
        if (data.length() > 500)
        {
            throw new EnergyproSystemException("\n\n!!! ����������� ���� [PlanWorkLogic.getCodesHistoryDown]!!! PlanCode = " + planCode);
        }

        String codes = "";
        int newPlan;
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planOldRef.code = planCode;
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chFilter, 0, -1);

        if ( chList.totalCount != 0 ){
        for (int i=0; i<chList.totalCount; i++){
            newPlan = chList.get(i).planNewRefCode;
            if (newPlan != planCode){
                if (codes.length() <= 0){
                    codes = "" + getCodesHistoryDown(newPlan, data);
                }
                else
                {
                    codes = codes + ", " + getCodesHistoryDown(newPlan, data);
                }
            }
        }
        }

        if (codes.length() == 0 )
                codes = "" + planCode;
            else
                codes += ", " + planCode;


        return  codes;
    }

    public int getFactCode4NPZ(int npzCode) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
        ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planOldRef.code = npzCode;
        chFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
        ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chFilter, 0, -1);
        if (chList.totalCount > 0){
            out = chList.get(0).planNewRefCode;
        }
        return out;
    }


    public ENPlanWork getPlanByCode(int planCode) throws PersistenceException
    {
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObject(planCode);
            return plan;

    }

    public ENPlanWork getPlanByCodeNOSEGR(int planCode) throws PersistenceException
    {
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);
            return plan;

    }

    public boolean checkPeriodYear(ENPlanWork object, boolean isGenException){
        boolean out = true;
        if (object.kind.code == ENPlanWorkKind.YEAR){
            if (object.yearGen == 2011){
                if (isGenException){
                    throw new EnergyproSystemException("�� ��� �� ��� ����� ��� ������ ���� ������� ...", userProfile);
                }
                else{
                    out = false;
                }
            }
        }

        return out;
    }

    public boolean checkPeriodYearNEW(ENPlanWork object, boolean isGenException)
    {
        boolean out = true;

        if (object.kind.code == ENPlanWorkKind.YEAR)
        {
            if (object.yearGen == 2020)
            {
                AuthLogic authLogic = new AuthLogic(connection, userProfile);
                if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "editPreConfirm"))
                {
                    if (isGenException)
                    {
                        throw new EnergyproSystemException("\n\n NET-2970 �� ��� �� ��� ����� ������� �������� ��� ������ ���� �������!", userProfile);
                    }
                    else
                    {
                        out = false;
                    }
                }
            }
        }

        return out;
    }

    public boolean checkPeriod(ENPlanWork object, boolean isGenException) throws PersistenceException
    {
        ElementLogic eLogic = new ElementLogic(connection, userProfile);
        int eType = eLogic.getElementTypeByCode(object.elementRef.code);



       /* 24.01.2012 +++ ������ �� ������� ���������� */
        if ((object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE)
                && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
                    && (object.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND)
					&& (object.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND_ADD)
                    && (object.typeRef.code != ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER)
        ) {
            if (object.yearGen == 2012)
            {
                AuthLogic authLogic = new AuthLogic(connection, userProfile);
                if (! authLogic.checkPermission4YearPlans())
                {
                    throw new EnergyproSystemException("���������� �������� ����� �� 2012 ��!");
                }
            }
        }

        ///// 29.12.10
        if (object.yearGen == 2012)
        {
            // ������ ���� ����� �������
            if (object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE || object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) return true;

            // ��� ���������� - ����� ������ ....
            if (object.formRef.code == ENPlanWorkForm.NOPLANNED) return true;

            if (
                (object.kind.code == ENPlanWorkKind.CURRENT || object.kind.code == ENPlanWorkKind.YEAR)
                &&
                (
                        object.formRef.code == ENPlanWorkForm.PLANNED
                        &&
                        (
                            // ���� ��� ���� ������ ...
                        //eType != ENElementType.TY_BYT && eType != ENElementType.TY_PROM &&
                                eType != ENElementType.TRANSPORT  && object.typeRef.code != ENPlanWorkType.PRIEDNANNY
                                // 16.02.11 �� ���� ������� ����� ��������� ��������
                                && eType != ENElementType.PURCHASES_OBJECT && eType != ENElementType.PURCHASES_NO_OBJECT
                                // ��� �������� �������� �� 02.03.2011
                                && eType != ENElementType.ISOLATION && object.budgetRef.code != ENConsts.ENBUDGET_IZOLATION
                                // ��������� ��� ���
                                && object.typeRef.code != ENPlanWorkType.SIZ
                                && object.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND
								&& object.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND_ADD
                                && object.typeRef.code != ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER
                        )
                )
            )
            {
                throw new EnergyproSystemException("����� �������� (1)!");
            }

            /*
                // || object.formRef.code == ENPlanWorkForm.NOPLANNED)
            // ��� ������������ �������
            if (
                    ! (
                            (
                                    object.formRef.code == ENPlanWorkForm.NOPLANNED ||
                                    (object.formRef.code == ENPlanWorkForm.PLANNED && eType == ENElementType.TY_BYT)
                            ) &&
                    (object.kind.code == ENPlanWorkKind.CURRENT || object.kind.code == ENPlanWorkKind.YEAR
                            // ���������� �������� �� �������� ��� ;)
                            || object.kind.code != ENPlanWorkKind.NPW ))
                )
                throw new EnergyproSystemException("����� �������� (1)!");
            */
            boolean allow = false;

            // ��-��� � ��-����
            //���� ��� ���� ������ ...

            //allow = //((object.kind.code == ENPlanWorkKind.CURRENT) || (object.kind.code == ENPlanWorkKind.YEAR)) &&
                        //(object.formRef.code == ENPlanWorkForm.NOPLANNED) &&
            //          ((eType == ENElementType.TY_BYT) || (eType == ENElementType.TY_PROM));

            if (!allow)
            {
                // ��� �������������� � ���� �������� ����� �� �������������� ������ �� �������� "�� �����������"
                AuthLogic authLogic = new AuthLogic(connection, userProfile);
                if ((eType == ENElementType.TRANSPORT  || object.typeRef.code == ENPlanWorkType.PRIEDNANNY) && object.formRef.code == ENPlanWorkForm.PLANNED)
                allow = authLogic.checkPermission4NoplannedPlans(object);
                else
                    allow = true;
            }

            // ����� �� ��� � ���������� ������ � ����� "����������" ���� ����� ��������� ���
            if (
                (object.formRef.code == ENPlanWorkForm.NOPLANNED) &&
                (object.kind.code == ENPlanWorkKind.CURRENT) &&
                (object.typeRef.code == ENPlanWorkType.AVR || object.typeRef.code == ENPlanWorkType.NOT_PLANED)
                )
                allow = true;


            if (!allow)
                throw new EnergyproSystemException("����� �������� (2)!");

        } else {
            if (object.kind.code != ENPlanWorkKind.YEAR) {
                if (object.yearGen != 2016
                        // DEBUG !!!!
                        && object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
                        && object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST
                        && object.typeRef.code != ENPlanWorkType.SIZ
                        && object.typeRef.code != ENPlanWorkType.EZ_CHANGE_ZKU
                        && object.typeRef.code != ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER
                        && object.typeRef.code != ENPlanWorkType.EZ_PLANNED
                        && eType!= ENElementType.ROUTE_BYT
                        && eType!= ENElementType.PURCHASES_OBJECT
                        && eType!= ENElementType.PURCHASES_NO_OBJECT
                		) {
                	if(!userProfile.userName.toLowerCase().equals("energynet")) {
                		throw new EnergyproSystemException("�������� ������ �������?! �� ��� � ���!!!");
                	}

                }
            }

        }
        /////


        boolean out = true;
        if ((object.formRef.code == ENPlanWorkForm.PLANNED) &&
                    (( object.kind.code == ENPlanWorkKind.CURRENT ) || (object.kind.code == ENPlanWorkKind.YEAR))
            )
            {
                if (( /// 28.12.10
                    //    (object.yearGen == 2010) &&
                    //    ((object.monthGen == 6) || (object.monthGen == 7) || (object.monthGen == 8) || (object.monthGen == 9) || (object.monthGen == 10))
                    ///
                    object.yearGen == 2011
                )
                    //&& (eType != ENElementType.TY_BYT)
                    && (object.typeRef.code != ENPlanWorkType.PRIEDNANNY)
                    // 16.02.11 �� ���� ������� ����� ��������� ��������
                    && (eType != ENElementType.PURCHASES_OBJECT && eType != ENElementType.PURCHASES_NO_OBJECT)
                    // ��� �������� �������� �� 02.03.2011
                    && eType != ENElementType.ISOLATION && object.budgetRef.code != ENConsts.ENBUDGET_IZOLATION
                    // ��������� ��� ���
                    && object.typeRef.code != ENPlanWorkType.SIZ
                    // ���������� ���������������� �������
                    && eType != ENElementType.NO_OBJECT_RESTOCKING
                    )
                {
                    if (isGenException){
                        throw new EnergyproSystemException("����� �������� ... ����� �������� ����� ����� �� ���������² ������ (��� ����) !!!", userProfile);
                    }
                    else
                    {
                        out = false;
                    }
                }
            }
        return out;
    }

    public boolean checkIncompleteCurrentPlan(int monthPlanCode, boolean isException) throws PersistenceException
    {
        boolean out = false;

        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

        ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
        f.planOldRef.code = monthPlanCode;
        f.reason.code = ENPlanCorrectReason.CREATE_INCOMPLETE;
        int[] arr = chDAO.getFilteredCodeArray(f, null, null, 0, -1, null);
        if (arr.length != 0) {
            if (isException){
                throw new EnergyproSystemException("� ����� ����� ��� �������� ���� �� ����������� ... ");
            }
            out = true;
        }
        return out;
    }

    public boolean checkIncomletePlanInAct(int actCode, int monthPlanCode, boolean isException) throws PersistenceException
    {
        boolean out = false;
        String plansInAct = new ActLogic(connection, userProfile).getPlanCodesByAct(actCode);

        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

        ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
        f.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
        f.conditionSQL = " plannewrefcode in (" + plansInAct + ")";
        int[] fArr = chDAO.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);

        f = new ENPlanCorrectHistoryFilter();
        f.planOldRef.code = monthPlanCode;
        f.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
        int[] pArr = chDAO.getFilteredCodeArray(f, null, null, 0, -1, null);

        if (fArr.length != pArr.length){
            if (isException){
                throw new EnergyproSystemException("� ��� �������� �� �� ���/����� � �������� ����� ... ��� ��������� ���/����� ... ��� ��������� �� �� ���� ..");
            }
            out = true;
        }
        return out;
    }

    public void createIncompletePlansFromAct(ENAct act) throws PersistenceException
    {
        if (
                (act.element.typeRef.code == ENElementType.METROLOGY_OBJECT)
                || (act.element.typeRef.code == ENElementType.TY_BYT)
                || (act.element.typeRef.code == ENElementType.TY_PROM)
            ){
            return;
        }

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        int[] planCodes = planDAO.getMonthPlansByAct(act.code);
        for (int i=0; i<planCodes.length; i++){
            checkIncomletePlanInAct(act.code, planCodes[i], true);
            createIncompletePlansFromMonthPlan(planCodes[i]);
        }

    }

    public void removeIncompletePlansFromAct(ENAct act) throws PersistenceException
    {
        if (
                (act.element.typeRef.code == ENElementType.METROLOGY_OBJECT)
                || (act.element.typeRef.code == ENElementType.TY_BYT)
                || (act.element.typeRef.code == ENElementType.TY_PROM)
            ){
            return;
        }

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

        int[] planCodes = planDAO.getMonthPlansByAct(act.code);
        for (int i=0; i<planCodes.length; i++){
            ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
            chFilter.planOldRef.code = planCodes[i];
            chFilter.reason.code = ENPlanCorrectReason.CREATE_INCOMPLETE;
            ENPlanCorrectHistoryShortList chList = chDAO.getScrollableFilteredList(chFilter, 0, -1);
            for (int j=0; j < chList.totalCount; j++){
                removeIncompletePlansFromMonthPlan(chList.get(j).planNewRefCode);
            }
        }
    }

    // �������� ��� ���� - �������� ��� ����� ����� ...
    public void createIncompletePlansFromPlan(ENPlanWork plan) throws PersistenceException
    {
        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement element = elementDAO.getObject(plan.elementRef.code);

        if (
                (element.typeRef.code == ENElementType.METROLOGY_COUNTER)
                ||(element.typeRef.code == ENElementType.TY_BYT)
                || (element.typeRef.code == ENElementType.TY_PROM)
            ){
            return;
        }

        int currentPlanCode = getParentCurrentPlanCode(plan.code);
        createIncompletePlansFromMonthPlan(currentPlanCode);
    }



    public void createIncompletePlansFromMonthPlan(int planCode) throws PersistenceException
    {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.kind.code = ENPlanWorkKind.FACT;
        planFilter.conditionSQL ="code in (select chf.plannewrefcode from enplancorrecthistory ch, enplancorrecthistory chf " +
                " where ch.planoldrefcode = " + planCode +
                " and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
                " and chf.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
                " and ch.plannewrefcode = chf.planoldrefcode)";

        int[] factCodes = planDAO.getFilteredCodeArray(planFilter, 0, -1);
        String factCodesSQL = "";
        for (int i=0; i<factCodes.length; i++){
            if (factCodesSQL.length() == 0)
                factCodesSQL = "" + factCodes[i];
            else
                factCodesSQL = factCodesSQL + ", " + factCodes[i];
        }

        ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();
        itemFilter.planRef.code = planCode;
        itemFilter.conditionSQL = "countgen > 0";
        ENPlanWorkItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

        Vector<ENPlanWorkItemShort> itemVector = new Vector<>();
        for (int i=0; i < itemList.totalCount; i++){
            ENPlanWorkItemFilter itemFactFilter = new ENPlanWorkItemFilter();
            itemFactFilter.kartaRef.code = itemList.get(i).kartaRefCode;
            itemFactFilter.conditionSQL = "countgen > 0 and planrefcode in ( "+ factCodesSQL +")";
            BigDecimal count_ = new BigDecimal(0);
            BigDecimal time_ = new BigDecimal(0);
            ENPlanWorkItemShortList itemFactList = itemDAO.getScrollableFilteredList(itemFactFilter, 0, -1);
            // ����� ���-�� ����� � ����� �� ���� ������ ����� (planCode) ���. ����� ...
            for (int j=0; j<itemFactList.totalCount; j++){
                count_ = count_.add(itemFactList.get(j).countGen).setScale(3, BigDecimal.ROUND_HALF_UP);
                time_ = time_.add(itemFactList.get(j).timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            if (itemList.get(i).countGen.doubleValue() > count_.doubleValue()){
                ENPlanWorkItemShort itemShort = new ENPlanWorkItemShort();
                itemShort.kartaRefCode = itemList.get(i).kartaRefCode;
                itemShort.countGen = itemList.get(i).countGen.subtract(count_).setScale(3, BigDecimal.ROUND_HALF_UP);
                itemVector.add(itemShort);
            }

        }

        if (itemVector.size() == 0) return;


        // ��������� ���� ...

        int newPlanCode = copyPlanWorkOnly(planCode, ENPlanWorkStatus.LOCKED, ENPlanWorkStatus.LOCKED);
        ENPlanWork newPlan = planDAO.getObject(newPlanCode);
        newPlan.sourceRef.code = ENPlanWorkSource.AUTO_CREATE;
        newPlan.kind.code = ENPlanWorkKind.CURRENT;
        // ���� ������� �������� (���� �������� ������ � �.�.).. ����� �������� �� ������������...
        newPlan.status.code = ENPlanWorkStatus.GOOD;

        // ����� ��� - ����� � ������ ���������� ��������� ����� ...
        // ����� ����� ������
        planDAO.save(newPlan);

        newPlan = planDAO.getObject(newPlanCode);

        // �������� �������� ����� � ������ ������ ...
        ENPlanCorrectHistory ch = new ENPlanCorrectHistory();
        ch.planNewRef.code = newPlanCode;
        ch.planOldRef.code = planCode;
        ch.reason.code = ENPlanCorrectReason.CREATE_INCOMPLETE;
        createCorrectionPlanHistory(ch);

        ENPlanWorkItem2PlanWorkItemDAO pi2piDAO = new ENPlanWorkItem2PlanWorkItemDAO(connection, userProfile);

        for (int i=0; i<itemVector.size(); i++ ){
            ENPlanWorkItem pi = new ENPlanWorkItem();
            pi.planRef.code = newPlanCode;
            pi.kartaRef.code = ((ENPlanWorkItemShort)itemVector.get(i)).kartaRefCode;
            pi.countGen = ((ENPlanWorkItemShort)itemVector.get(i)).countGen;
            pi.dateEdit = new Date();
            pi.userGen = userProfile.userName;
            // ��� ��������� ������ ... ����� ����� ����� ����������� ...
            int piCode = this.addPlanWorkItem(pi, newPlan);


            ENPlanWorkItemFilter itemParentFilter = new ENPlanWorkItemFilter();
            itemParentFilter.planRef.code = planCode;
            itemParentFilter.kartaRef.code = pi.kartaRef.code;
            int[] itemParentArr = itemDAO.getFilteredCodeArray(itemParentFilter, null, null, 0, -1, null);
            if (itemParentArr.length != 1){
                throw new EnergyproSystemException("������� � ������� ���� � ���� ...");
            }

            ENPlanWorkItem2PlanWorkItem pi2pi = new ENPlanWorkItem2PlanWorkItem();
            pi2pi.countGen = ((ENPlanWorkItemShort)itemVector.get(i)).countGen;
            pi2pi.planItemInRef.code = itemParentArr[0];
            pi2pi.planItemOutRef.code = piCode;
            pi2pi.typeRef.code = ENPlanWorkItem2PlanWorkItemType.MOVE_BY_AUTO;
            pi2piDAO.add(pi2pi);

        }

        // ���� .. ������� ..
        newPlan.status.code = ENPlanWorkStatus.LOCKED;
        planDAO.save(newPlan);



    }

    public void removeIncompletePlansFromMonthPlan(int planCode) throws PersistenceException
    {
        ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);


        ENPlanCorrectHistoryFilter chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planOldRef.code = planCode;
        int[] chArr = chDAO.getFilteredCodeArray(chFilter, null, null, 0, -1, null);
        if (chArr.length != 0){
            throw new EnergyproSystemException("� ����� �� ����������� ��� �������� ��� ��� ����� .. ��������� �� ...");
        }

        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
        HumenLogic hLogic = new HumenLogic(connection, userProfile);
        TransportLogic tLogic = new TransportLogic(connection, userProfile);


        ENPlanWorkItem2PlanWorkItemDAO pi2piDAO = new ENPlanWorkItem2PlanWorkItemDAO(connection, userProfile);

        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
        piFilter.planRef.code = planCode;
        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);
        int[] piArr = piDAO.getFilteredCodeArray(piFilter, null, null, 0, -1, null );
        for (int i=0; i < piArr.length; i++){

            ENPlanWorkItem2PlanWorkItemFilter pi2piFilter = new ENPlanWorkItem2PlanWorkItemFilter();
            pi2piFilter.planItemOutRef.code = piArr[i];
            pi2piFilter.typeRef.code = ENPlanWorkItem2PlanWorkItemType.MOVE_BY_AUTO;
            int[] pi2piArr = pi2piDAO.getFilteredCodeArray(pi2piFilter, 0, -1);
            for (int j=0; j < pi2piArr.length; j++){
                pi2piDAO.remove(pi2piArr[j]);
            }

            eLogic.removeENEstimateItemsByPlanItemCode(piArr[i]);
            hLogic.removeHumenItemsByPlanItemCode(piArr[i]);
            tLogic.removeENTransportItemsByPlanItemCode(piArr[i]);

            piDAO.remove(piArr[i]);
        }

        // ���� ���-�� ��� ����� ...
        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.planRef.code = planCode;
        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
        for (int i=0; i<eArr.length; i++){
            eDAO.remove(eArr[i]);
        }

        // ������� �������������
        chFilter = new ENPlanCorrectHistoryFilter();
        chFilter.planNewRef.code = planCode;
        chFilter.reason.code = ENPlanCorrectReason.CREATE_INCOMPLETE;
        chArr = chDAO.getFilteredCodeArray(chFilter, null, null, 0, -1, null);
        for (int i=0; i < chArr.length; i++){
            chDAO.remove(chArr[i]);
        }

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        planDAO.remove(planCode);


    }


        //////////////////////////////////////////
        // ����� �� TravelSheetFuelLogic
        public Date getFirstDate(Date dateIn)
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateIn);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            //calendar.set(Calendar.MONTH, dateIn.getMonth());
            //calendar.set(Calendar.YEAR, dateIn.getYear());
            calendar.set(Calendar.DATE, 1);
            return calendar.getTime();
        }

        public Date getLastDate(Date dateIn)
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateIn);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            //calendar.set(Calendar.MONTH, dateIn.getMonth());
            //calendar.set(Calendar.YEAR, dateIn.getYear());
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            return calendar.getTime();
        }
      //////////////////////////////////////////

    public PlanWorkLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }


    public boolean checkInShtatWorker(String tabNumber, boolean isException,
            int sizObjectCode) throws PersistenceException {
        boolean out = false;
        Connection finConn = null;
        try {
            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            FINWorkerDAO fwDao = new FINWorkerDAO(finConn, userProfile);

            FINWorkerFilter fwFilter = new FINWorkerFilter();
            fwFilter.tabNumber = tabNumber;

            FINWorkerShortList fwList = new FINWorkerShortList();
            fwList = fwDao.getFINWorkerList(fwFilter, 0, -1, new Date(), true);

            if (fwList.totalCount == 0) {
                /*
                * if (isException) { throw new EnergyproSystemException(
                * "�� �������� ���������� � ������ ���.� " + tabNumber); }
                */

                ENSizObjectDAO szDao = new ENSizObjectDAO(connection, userProfile);
                szDao.fastUpdateFiredWorker(sizObjectCode);

                out = true;

            }
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...", e);
        }
        return out;
    }

    public boolean isCurrentPlanFromCalculation(ENPlanWork plan) throws PersistenceException
    {
        boolean out = false;

        if (plan.kind.code == ENPlanWorkKind.CURRENT)
        {
            int parentPlanCode = getParentPlanWorkCode(plan.code, ENPlanCorrectReason.MOVE_FROM_CALCULATION_TO_CURRENT);
            if (parentPlanCode > Integer.MIN_VALUE)
            {
            out = true;
            }
        }
        else
            throw new EnergyproSystemException("��� ��� ����� �� ������������!");

        return out;
    }

    public boolean checkPayByServicesObject(ENElement element,
            boolean isException) throws PersistenceException {
        boolean result = false;

        if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {

            ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
            ENServicesObject soObj = soLogic.getServicesObjectByElementCode(element.code);
//            ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
//            ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
//            plFilter.elementRef.code =  soObj.element.code;
//            plFilter.kind.code = ENPlanWorkKind.CALCULATION;
//            ENPlanWork pwObj = null;
//            int plArr[] = plDAO.getFilteredCodeArray(plFilter,0,-1);
//            if  (plArr.length != 0 ) {
//
//                pwObj = plDAO.getObject(plArr[0]);
//            }

            /*
            *  13.10.2011
            *  ��� �� ��������� ��� �����
            */
            /* ��� ������������� ����� �� �������� ���� ��������� ��� ����� */
            // PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);
//            if ((soObj.contractTypeRef.code == ENServicesContractType.TY)
//                  || ((pl.isReservedCalculationInContract(pwObj.code) == true ) &&
//                        (pl.isAcessRemJobsByTime(pwObj.departmentRef.code) == true))
//                       )
//                return false;

            if (soObj.contractTypeRef.code == ENServicesContractType.CONNECTION)
                return false;

            if (soObj.contractTypeRef.code == ENServicesContractType.TY)
                return false;

            if (soObj.contractTypeRef.code == ENServicesContractType.OKSN)
                return false;

            if (soObj.contractTypeRef.code == ENServicesContractType.OHRINA)
                return false;

            if (soObj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY)
            	return false;

            if (((soObj.contragentTypeRef.code == ENServicesContragentType.PHYSICAL)
                || (soObj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET))
                    && (soObj.contractStatusRef.code != ENServicesContractStatus.PAID && soObj.contractStatusRef.code != ENServicesContractStatus.PREPAID))
            {
                if (isException)
                    throw new EnergyproSystemException("\n\n"
                    		+ "������� �� ��� ��������� �� ��������!!!");
                else
                    return true;
            }

        }

        return result;
    }

    public void validateMaterialsTrucking(int itemCode, int planCode, boolean isCargo)
            throws PersistenceException {

        boolean notMaterials = false;
        boolean notRoures = false;

        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.planItemRef.code = itemCode;
        eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

        int[] arr = eDao.getFilteredCodeArray(eFilter, null, null, 0, 1, null);

        if (arr.length == 0) {
            notMaterials = true;
        }

        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
        ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
        routeFilter.planRef.code = planCode;

        int[] routeArr = routeDAO.getFilteredCodeArray(routeFilter, 0, -1);

        if (routeArr.length == 0) {
            notRoures = true;
        }

        /* 07.05.2012 +++ ��� ��������/��������� ��������� �������� */
        if (isCargo) {
            /* 07.05.2012 +++ ������ ���� ������ �������� */
            /* ���� ���-�� ������ ���� */
            if (notRoures) {
                throw new EnergyproSystemException(
                        "������ �������� �������� ��� �����������...");
            }
        } else {
            if (notMaterials) {
                throw new EnergyproSystemException(
                        "������ �������� �������� ��� �������������...");
            }
        }
    }

    public void validateHumenTrucking(int itemCode)
            throws PersistenceException {
        ENHumenItemDAO hDao = new ENHumenItemDAO(connection, userProfile);
        ENHumenItemFilter hFilter = new ENHumenItemFilter();
        hFilter.planItemRef.code = itemCode;

        int[] arr = hDao.getFilteredCodeArray(hFilter, null, null, 0, -1, null);
        /* ��� ����� �������� */
        if (arr.length <= 1) {
            throw new EnergyproSystemException(
                    "������ ��������, ���� ���� ������������...");
        }
    }

/* ������ �������, ��� �� ����������
    public void recalcTotalTime(int planCode) throws PersistenceException
    {
        BigDecimal totalTime = new BigDecimal(0);
        // ���� � ����� ��� �����, �� ���� ��������� ��������� �� ����� (��������, ����� ��� ����� ��������� - ��� ����� ���� �� ���� �����)
        boolean hasWorkItems = false;

        ////////// ��� �������� ����� �� �����
        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter pwiFilter = new ENPlanWorkItemFilter();
        pwiFilter.planRef.code = planCode;
        //pwiFilter.conditionSQL = "enplanworkitem.countgen > 0";

        ENPlanWorkItemShortList pwiList = pwiDAO.getScrollableFilteredList(pwiFilter, 0, -1);

        for (int i = 0; i < pwiList.totalCount; i++)
        {
            // �������� � �����!!!
            // totalTime = totalTime.add(pwiList.get(i).timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);

            if (pwiList.get(i).countGen.doubleValue() > 0)
            {
                totalTime = totalTime.add(pwiList.get(i).timeGen);
            }

            hasWorkItems = true;
        }
        //////////

        ////////// � ��� ���������� ����� ��������
        ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
        ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
        dtpFilter.planWorkRef.code = planCode;

        ENDeliveryTimePlanShortList dtpList = dtpDAO.getScrollableFilteredList(dtpFilter, 0, -1);

        for (int i = 0; i < dtpList.totalCount; i++)
        {
            // ����� ������ deliveryTimePlan, � �� deliveryTimeFact, ������ ��� ����� ���� ��������� �� ��� ����
            // (� � deliveryTimePlan ������ ����� ������ �����, ������������ �� ����������, - ��, ������� ��� � �����)

            // �������� � �����!!!
            // totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan).setScale(2, BigDecimal.ROUND_HALF_UP);
            totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan);
        }
        //////////

        ////////// �������� ����� ���������� ����� � ��������� ���� ���������� ���������� �����
        totalTime = totalTime.setScale(2, BigDecimal.ROUND_HALF_UP);

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(planCode);

        // totalTimeHours - ����� � �����, totalTimeDays - � ����
        plan.totalTimeHours = totalTime;
        plan.totalTimeDays = totalTime.divide(new BigDecimal(8), 1, BigDecimal.ROUND_HALF_UP); // ��������� �� ������ �����

        // ��� ���� ������, ����� �������-������ � �������-������ (��� ���� ������ � ��������� ������ ���������), �������� dateFinal
        if (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT ||
            plan.kind.code == ENPlanWorkKind.CALCULATION || plan.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
        {
            if (hasWorkItems)
            {
                // ����� ���-�� ���� (�� ������� 8-�������� �������� ���)
                int days = totalTime.divide(new BigDecimal(8), 0, BigDecimal.ROUND_CEILING).intValue();

                Calendar calendar_ = Calendar.getInstance();
                calendar_.setTime(plan.dateStart);
                calendar_.clear(Calendar.HOUR);
                calendar_.clear(Calendar.HOUR_OF_DAY);
                calendar_.clear(Calendar.MINUTE);
                calendar_.clear(Calendar.SECOND);
                calendar_.clear(Calendar.MILLISECOND);
                calendar_.add(Calendar.DATE, days - 1);

                plan.dateFinal = calendar_.getTime();
            }
        }

        /// 28.02.12 ������ save ���������� �����, ������� �������� ������ ������ ���� - ����� �������� optimistic locking!
        //planDAO.save(plan);
        planDAO.updateDateFinalAndTotalTime(plan);

        //////////
    }
*/


    /*
    * �������� ������ ������� ���������� ����� �� ����� � ���� ��������� ���������� �����
    */
    public void recalcTotalTime_OLD(int planCode) throws PersistenceException
    {
        // *****************************************************************************
        // DEBUG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*
        if (1 == 1)
        {
            recalcTotalTimeNew(planCode);
            return;
        }
        */
        // DEBUG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // *****************************************************************************

        // ������ ������ � ���!!!!!!!!!!
        ENPlanWork plan = getPlanByCode(planCode);
        if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE ||
            plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
        {
            return;
        }

        TKElement2TechCardDAO tkElement2TechCardDAO = null;
        Connection tkConn = null;
        try {
            tkConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            tkElement2TechCardDAO = new TKElement2TechCardDAO(tkConn, userProfile);
        } catch (DatasourceConnectException e) {
            tkConn = null;
            tkElement2TechCardDAO = null;
            throw new EnergyproSystemException(
                    "Error in getConnection!", e);
        }

        BigDecimal totalTime = new BigDecimal(0);
        // ���� � ����� ��� �����, �� ���� ��������� ��������� �� ����� (��������, ����� ��� ����� ��������� - ��� ����� ���� �� ���� �����)
        boolean hasWorkItems = false;

        //TKElement2TechCardDAO tkElement2TechCardDAO = new TKElement2TechCardDAO(connection, userProfile);

        ////////// ��� �������� ����� �� �����
        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter pwiFilter = new ENPlanWorkItemFilter();
        pwiFilter.planRef.code = planCode;
        //pwiFilter.conditionSQL = "enplanworkitem.countgen > 0";

        /////
        //Connection tkConn = null;

        try
        {
            /*
            TKElement2TechCardDAO tkElement2TechCardDAO = null;
            try
            {
                tkConn = getConnection_(AuthorizationJNDINames.ENERGY_DATASOURCE);
                tkElement2TechCardDAO = new TKElement2TechCardDAO(tkConn, userProfile);
            }
            catch (DatasourceConnectException e) {
                throw new EnergyproSystemException("Error in getConnection!", e);
                //tkConn = null;
                //tkElement2TechCardDAO = null;
            }
            */
            /////

            //TKElement2TechCardDAO tkElement2TechCardDAO = new TKElement2TechCardDAO(connection, userProfile);

            ENPlanWorkItemShortList pwiList = pwiDAO.getScrollableFilteredList(pwiFilter, 0, -1);

            for (int i = 0; i < pwiList.totalCount; i++)
            {
                // �������� � �����!!!
                // totalTime = totalTime.add(pwiList.get(i).timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);

                if (pwiList.get(i).countGen.doubleValue() > 0)
                {
                    //totalTime = totalTime.add(pwiList.get(i).timeGen);

                    // ������� ���-�� ����������� ���������� � ������ ������
                    TKElement2TechCardFilter tkElement2TechCardFilter = new TKElement2TechCardFilter();
                    tkElement2TechCardFilter.techKart.code = pwiList.get(i).kartaRefCode;
                    tkElement2TechCardFilter.conditionSQL = "TKELEMENT.ELEMENTTYPECODE = " + TKConsts.TKELEMENTTYPE_POSITION;
                    TKElement2TechCardShortList tkElement2TechCardList = tkElement2TechCardDAO.getScrollableFilteredList(tkElement2TechCardFilter, 0, -1);

                    BigDecimal positionsCount = new BigDecimal(0);

                    for (int j = 0; j < tkElement2TechCardList.totalCount; j++)
                    {
                        positionsCount = positionsCount.add(tkElement2TechCardList.get(j).kolvo);
                    }

                    if (positionsCount.doubleValue() > 0)
                    {
                        // ����� ����������� ����� �� ��� ������ �� ���-�� ����������� ���������� � ���
                        totalTime = totalTime.add(pwiList.get(i).timeGen.divide(positionsCount, 2, BigDecimal.ROUND_HALF_UP));
                    }
                    else
                    {
                        totalTime = totalTime.add(pwiList.get(i).timeGen);
                    }
                }

                hasWorkItems = true;
            }
            //////////

            ////////// � ��� ���������� ����� ��������
            ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
            ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
            dtpFilter.planWorkRef.code = planCode;

            ENDeliveryTimePlanShortList dtpList = dtpDAO.getScrollableFilteredList(dtpFilter, 0, -1);

            for (int i = 0; i < dtpList.totalCount; i++)
            {
                // ����� ������ deliveryTimePlan, � �� deliveryTimeFact, ������ ��� ����� ���� ��������� �� ��� ����
                // (� � deliveryTimePlan ������ ����� ������ �����, ������������ �� ����������, - ��, ������� ��� � �����)

                // �������� � �����!!!
                // totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan).setScale(2, BigDecimal.ROUND_HALF_UP);
                totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan);
            }
            //////////

            ////////// �������� ����� ���������� ����� � ��������� ���� ���������� ���������� �����
            totalTime = totalTime.setScale(2, BigDecimal.ROUND_HALF_UP);

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            plan = planDAO.getObject(planCode);

            // totalTimeHours - ����� � �����, totalTimeDays - � ����
            plan.totalTimeHours = totalTime;
            ///plan.totalTimeDays = totalTime.divide(new BigDecimal(8), 1, BigDecimal.ROUND_HALF_UP); // ��������� �� ������ �����
            plan.totalTimeDays = totalTime.divide(new BigDecimal(8), 3, BigDecimal.ROUND_HALF_UP); // 13.03.12 ��������� �� ���� ������ !!!

            // ��� ���� ������, ����� �������-������ � �������-������ (��� ���� ������ � ��������� ������ ���������), �������� dateFinal
            if (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT ||
                plan.kind.code == ENPlanWorkKind.CALCULATION || plan.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
            {
                if (hasWorkItems)
                {
                    // ����� ���-�� ���� (�� ������� 8-�������� �������� ���)
                    int days = totalTime.divide(new BigDecimal(8), 0, BigDecimal.ROUND_CEILING).intValue();

                    if (days > 0)
                    {
                        Calendar calendar_ = Calendar.getInstance();
                        calendar_.setTime(plan.dateStart);
                        calendar_.clear(Calendar.HOUR);
                        calendar_.clear(Calendar.HOUR_OF_DAY);
                        calendar_.clear(Calendar.MINUTE);
                        calendar_.clear(Calendar.SECOND);
                        calendar_.clear(Calendar.MILLISECOND);

                        calendar_.set(Calendar.HOUR, 0);
                        calendar_.set(Calendar.HOUR_OF_DAY, 0);
                        calendar_.set(Calendar.MINUTE, 0);
                        calendar_.set(Calendar.SECOND, 0);
                        calendar_.set(Calendar.MILLISECOND, 0);

                        calendar_.add(Calendar.DATE, days - 1);

                        plan.dateFinal = calendar_.getTime();
                    }
                }
            }

            /// 28.02.12 ������ save ���������� �����, ������� �������� ������ ������ ���� - ����� �������� optimistic locking!
            //planDAO.save(plan);

            planDAO.updateDateFinalAndTotalTime(plan);

            //////////
        }
        finally
        {
            /*
            try {
                if (tkConn != null && ! tkConn.isClosed()) {
                    tkConn.close();
                    tkConn = null;
                }
            } catch (SQLException e) {
            }
            */
        }
    }

    /**
    * �������� ������ ������� ���������� ����� �� ����� � ���� ��������� ���������� �����
    *
    * @param int planCode - ��� �����
    */
    public void recalcTotalTime(int planCode) throws PersistenceException
    {
    	recalcTotalTime(planCode, false);
    }

    /**
    * �������� ������ ������� ���������� ����� �� ����� � ���� ��������� ���������� �����
    *
    * @param int planCode - ��� �����
    * @param isMonthPlanFromYear - true, ���� ����� ���������� ��� �������� ��������� ����� �� ��������
    */
    public void recalcTotalTime(int planCode, boolean isMonthPlanFromYear) throws PersistenceException
    {
        // ������ ������ � ���!!!!!!!!!!
    	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObjectNoRefNoSegr(planCode);
        if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE ||
            plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
        {
            return;
        }

        TKElement2TechCardDAO tkElement2TechCardDAO = new TKElement2TechCardDAO(connection, userProfile);

        BigDecimal totalTime = new BigDecimal(0);
        BigDecimal totalTimeManHours = new BigDecimal(0);

        // ���� � ����� ��� �����, �� ���� ��������� ��������� �� ����� (��������, ����� ��� ����� ��������� - ��� ����� ���� �� ���� �����)
        boolean hasWorkItems = false;

        ////////// ��� �������� ����� �� �����
        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter pwiFilter = new ENPlanWorkItemFilter();
        pwiFilter.planRef.code = planCode;
        //pwiFilter.conditionSQL = "enplanworkitem.countgen > 0";


        try
        {
            ENPlanWorkItemShortList pwiList = pwiDAO.getScrollableFilteredList(pwiFilter, 0, -1);

            //////////
            for (int i = 0; i < pwiList.totalCount; i++)
            {
                // �������� � �����!!!
                // totalTime = totalTime.add(pwiList.get(i).timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);

                if (pwiList.get(i).countGen.doubleValue() > 0)
                {
                    //totalTime = totalTime.add(pwiList.get(i).timeGen);

                    // ������� ���-�� ����������� ���������� � ������ ������
                    TKElement2TechCardFilter tkElement2TechCardFilter = new TKElement2TechCardFilter();
                    tkElement2TechCardFilter.techKart.code = pwiList.get(i).kartaRefCode;
                    tkElement2TechCardFilter.conditionSQL = "TKELEMENT.ELEMENTTYPECODE = " + TKConsts.TKELEMENTTYPE_POSITION;
                    TKElement2TechCardShortList tkElement2TechCardList = tkElement2TechCardDAO.getScrollableFilteredList(tkElement2TechCardFilter, 0, -1);

                    BigDecimal positionsCount = new BigDecimal(0);

                    for (int j = 0; j < tkElement2TechCardList.totalCount; j++)
                    {
                        positionsCount = positionsCount.add(tkElement2TechCardList.get(j).kolvo);
                    }

                    if (positionsCount.doubleValue() > 0)
                    {
                        // ����� ����������� ����� �� ��� ������ �� ���-�� ����������� ���������� � ���
                        totalTime = totalTime.add(pwiList.get(i).timeGen.divide(positionsCount, 2, BigDecimal.ROUND_HALF_UP));
                    }
                    else
                    {
                        totalTime = totalTime.add(pwiList.get(i).timeGen);
                    }

                    totalTimeManHours = totalTimeManHours.add(pwiList.get(i).timeGen);
                }

                hasWorkItems = true;
            }
            //////////

            ////////// 23.08.12 ������� ����� ��������
            ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
            ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
            dtpFilter.planWorkRef.code = planCode;

            ENDeliveryTimePlanShortList dtpList = dtpDAO.getScrollableFilteredList(dtpFilter, 0, -1);

            BigDecimal deliveryTime = new BigDecimal(0);

            for (int i = 0; i < dtpList.totalCount; i++)
            {
                // ����� ������ deliveryTimePlan, � �� deliveryTimeFact, ������ ��� ����� ���� ��������� �� ��� ����
                // (� � deliveryTimePlan ������ ����� ������ �����, ������������ �� ����������, - ��, ������� ��� � �����)
                deliveryTime = deliveryTime.add(dtpList.get(i).deliveryTimePlan);
            }
            //////////

            ////////// 22.08.12 NET-2800 �������� ������� ������ ������������
            recalcFinExecutorsPercentLoad(planCode, isMonthPlanFromYear);

            FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
            FINExecutor2PlanFilter fFilter = new FINExecutor2PlanFilter();
            fFilter.planRef.code = planCode;
            FINExecutor2PlanShortList fList = finExecutor2PlanDAO.getScrollableFilteredList(fFilter, 0, -1);

            BigDecimal tmpSumHours = new BigDecimal(0);
            //BigDecimal tmpSumDays  = new BigDecimal(0);
            BigDecimal tmpSumManHours = new BigDecimal(0);

            for (int i = 0; i < fList.totalCount; i++)
            {
                if (fList.get(i).finExecutorTypeRefCode != FINExecutorType.PRIMARY)
                {
                    FINExecutor2Plan finExecutor2PlanObj = finExecutor2PlanDAO.getObject(fList.get(i).code);

                    BigDecimal percentLoad = finExecutor2PlanObj.percentLoad.divide(new BigDecimal(100), 3, java.math.BigDecimal.ROUND_HALF_UP);

                    //BigDecimal totalTimeHours = totalTime.multiply(percentLoad).setScale(2, BigDecimal.ROUND_HALF_UP);
                    BigDecimal totalTimeHours = totalTime.multiply(percentLoad);
                    tmpSumHours = tmpSumHours.add(totalTimeHours);

                    // 30.08.12 �������� ������� ��������-����
                    ///
                    BigDecimal totalTimeMH = totalTimeManHours.multiply(percentLoad);
                    tmpSumManHours = tmpSumManHours.add(totalTimeMH);
                    ///

                    totalTimeHours = totalTimeHours.add(deliveryTime).setScale(2, BigDecimal.ROUND_HALF_UP);
                    BigDecimal totalTimeDays = totalTimeHours.divide(new BigDecimal(8), 3, BigDecimal.ROUND_HALF_UP);

                    //tmpSumHours = tmpSumHours.add(totalTimeHours);
                    //tmpSumDays  = tmpSumDays.add(totalTimeDays);

                    finExecutor2PlanObj.totalTimeHours = new BigDecimal(totalTimeHours.doubleValue());
                    finExecutor2PlanObj.totalTimeDays  = new BigDecimal(totalTimeDays.doubleValue());
                    ///
                    finExecutor2PlanObj.totalTimeManHours = new BigDecimal(totalTimeMH.doubleValue());
                    finExecutor2PlanObj.deliveryTime = new BigDecimal(deliveryTime.doubleValue());
                    ///

                    // ����� ���-�� ���� (�� ������� 8-�������� �������� ���)
                    int days = totalTimeHours.divide(new BigDecimal(8), 0, BigDecimal.ROUND_CEILING).intValue();

                    Calendar calendar_ = Calendar.getInstance();
                    calendar_.setTime(finExecutor2PlanObj.dateStart);

                    Calendar cFinal = Calendar.getInstance();
                    cFinal.setTime(Tools.clearTimeOfDate(calendar_.getTime()));

                    if (days > 0)
                    {
                        cFinal.add(Calendar.DATE, days - 1);
                    }

                    finExecutor2PlanObj.dateStart = plan.dateStart;
                    finExecutor2PlanObj.dateFinal = cFinal.getTime();


                    if (plan.dateStart != null && days > 0)
                    {
	                    /* SUPP-60843 ����������� �������� ���� ���������� ����� ������ �� ������� ����*/
	                    Date DateFinalWork = getDateOnworkingDay(plan.dateStart, days);
	                    if (DateFinalWork == null) {
	                    	throw new EnergyproSystemException("\n \n SUPP-60843 ������� ��� ��������� ������������ ���� ��������� ���� !! ��� ����� " + plan.code
	                    			+ " plan.dateStart = " + plan.dateStart + " days = " + days );
	                    }

	                    finExecutor2PlanObj.dateStart = plan.dateStart;
	                    finExecutor2PlanObj.dateFinal = DateFinalWork;
                    }

                    finExecutor2PlanDAO.updateTimes(finExecutor2PlanObj);
                }
            }

            FINExecutor2PlanFilter fPrimaryFilter = new FINExecutor2PlanFilter();
            fPrimaryFilter.planRef.code = planCode;
            fPrimaryFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
            int[] fPrimaryArr = finExecutor2PlanDAO.getFilteredCodeArray(fPrimaryFilter, 0, -1);

            if (fPrimaryArr.length > 1)
            {
                throw new EnergyproSystemException("\n \n NET-2800 �� ���� ����� ������ (" + fPrimaryArr.length + ") ��������� ���������!");
            }
            else
            if (fPrimaryArr.length == 1)
            {
                FINExecutor2Plan fPrimary = finExecutor2PlanDAO.getObject(fPrimaryArr[0]);

                BigDecimal totalTimeHours = totalTime.subtract(tmpSumHours); //.setScale(2, BigDecimal.ROUND_HALF_UP);
                if (totalTime.doubleValue() > 0 && totalTimeHours.doubleValue() <= 0)
                {
                    throw new EnergyproSystemException("\n \n NET-2800 ���������� �������� ������������� ���� ������ ��� ��������� ���������: \n" +
                            totalTimeHours.doubleValue() + " � !");
                }

                BigDecimal totalTimeMH = totalTimeManHours.subtract(tmpSumManHours); //.setScale(2, BigDecimal.ROUND_HALF_UP);
                if (totalTimeManHours.doubleValue() > 0 && totalTimeMH.doubleValue() <= 0)
                {
                    throw new EnergyproSystemException("\n \n NET-2800 ���������� �������� ������������� ���� ������ ��� ��������� ���������: \n" +
                            totalTimeMH.doubleValue() + " ���/��� !");
                }

                totalTimeHours = totalTimeHours.add(deliveryTime).setScale(2, BigDecimal.ROUND_HALF_UP);

                //BigDecimal tmpTotalTimeDays = totalTime.divide(new BigDecimal(8), 3, BigDecimal.ROUND_HALF_UP);
                //BigDecimal totalTimeDays = tmpTotalTimeDays.subtract(tmpSumDays).setScale(3, BigDecimal.ROUND_HALF_UP);
                BigDecimal totalTimeDays = totalTimeHours.divide(new BigDecimal(8), 3, BigDecimal.ROUND_HALF_UP);

                fPrimary.totalTimeHours = new BigDecimal(totalTimeHours.doubleValue());
                fPrimary.totalTimeDays  = new BigDecimal(totalTimeDays.doubleValue());
                ///
                fPrimary.totalTimeManHours = new BigDecimal(totalTimeMH.doubleValue());
                fPrimary.deliveryTime = new BigDecimal(deliveryTime.doubleValue());
                ///

                // ����� ���-�� ���� (�� ������� 8-�������� �������� ���)
                int days = totalTimeHours.divide(new BigDecimal(8), 0, BigDecimal.ROUND_CEILING).intValue();


                Calendar calendar_ = Calendar.getInstance();
                calendar_.setTime(fPrimary.dateStart);

                Calendar cFinal = Calendar.getInstance();
                cFinal.setTime(Tools.clearTimeOfDate(calendar_.getTime()));

                if (days > 0)
                {
                    cFinal.add(Calendar.DATE, days - 1);
                }

                fPrimary.dateStart = plan.dateStart;
                fPrimary.dateFinal = cFinal.getTime();

                if (plan.dateStart != null && days > 0)
                {
	                /* SUPP-60843 ����������� �������� ���� ���������� ����� ������ �� ������� ����*/
	                Date DateFinalWork = getDateOnworkingDay(plan.dateStart, days);
	                if (DateFinalWork == null ){
	                	DateFinalWork = Tools.addDays(plan.dateStart, days);
	                }

	                if (DateFinalWork == null) {
	                	throw new EnergyproSystemException("\n \n SUPP-60843 ������� ��� ��������� ������������ ���� ��������� ���� !! ��� ����� " + plan.code
	                			 + " plan.dateStart = " + plan.dateStart + " days = " + days  );
	                }
	             fPrimary.dateStart = plan.dateStart;
                 fPrimary.dateFinal = DateFinalWork;
                }




                finExecutor2PlanDAO.updateTimes(fPrimary);
            }
            //////////

            ////////// � ��� ���������� ����� ��������
            /*
            ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
            ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
            dtpFilter.planWorkRef.code = planCode;

            ENDeliveryTimePlanShortList dtpList = dtpDAO.getScrollableFilteredList(dtpFilter, 0, -1);

            BigDecimal deliveryTime = new BigDecimal(0);

            for (int i = 0; i < dtpList.totalCount; i++)
            {
                // ����� ������ deliveryTimePlan, � �� deliveryTimeFact, ������ ��� ����� ���� ��������� �� ��� ����
                // (� � deliveryTimePlan ������ ����� ������ �����, ������������ �� ����������, - ��, ������� ��� � �����)

                // �������� � �����!!!
                // totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan).setScale(2, BigDecimal.ROUND_HALF_UP);
                totalTime = totalTime.add(dtpList.get(i).deliveryTimePlan);
            }
            */
            totalTime = totalTime.add(deliveryTime);
            //////////

            ////////// �������� ����� ���������� ����� � ��������� ���� ���������� ���������� ����� �� �����
            /*************************/
            plan = planDAO.getObjectNoRefNoSegr(planCode);

            fFilter = new FINExecutor2PlanFilter();
            fFilter.planRef.code = planCode;
            fFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
            fList = finExecutor2PlanDAO.getScrollableFilteredList(fFilter, 0, -1);

            if (fList.totalCount > 0 && (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT))
            {
                Date dateStart = plan.dateStart; // SUPP-81730  fList.get(0).dateStart;
                Date dateFinal = fList.get(0).dateFinal;
                BigDecimal maxTotalTimeHours = new BigDecimal(fList.get(0).totalTimeHours.doubleValue());

                for (int i = 1; i < fList.totalCount; i++)
                {
                    if (fList.get(i).dateStart.before(dateStart))
                    {
                        dateStart = fList.get(i).dateStart;
                    }

                    if (fList.get(i).dateFinal.after(dateFinal))
                    {
                        dateFinal = fList.get(i).dateFinal;
                    }

                    if (fList.get(i).totalTimeHours.doubleValue() > maxTotalTimeHours.doubleValue())
                    {
                        maxTotalTimeHours = new BigDecimal(fList.get(i).totalTimeHours.doubleValue());
                    }
                }

                dateStart = Tools.clearTimeOfDate(dateStart);
                dateFinal = Tools.clearTimeOfDate(dateFinal);


                Calendar c = Calendar.getInstance();

                c.setTime(dateStart);
                long tmp = c.getTimeInMillis();
                c.setTime(dateFinal);
                tmp = c.getTimeInMillis() - tmp;


                plan.dateStart = dateStart;
                plan.dateFinal = dateFinal;
                /*
                //plan.totalTimeHours = new BigDecimal(tmp / (60 * 60 * 1000));
                plan.totalTimeDays  = new BigDecimal((tmp / (24 * 60 * 60 * 1000)) + 1).setScale(3, BigDecimal.ROUND_HALF_UP);
                plan.totalTimeHours = plan.totalTimeDays.multiply(new BigDecimal(8)).setScale(2, BigDecimal.ROUND_HALF_UP);
                */
                BigDecimal tmpTotalTimeDays  = new BigDecimal((tmp / (24 * 60 * 60 * 1000)) + 1).setScale(3, BigDecimal.ROUND_HALF_UP);
                BigDecimal tmpTotalTimeHours = tmpTotalTimeDays.multiply(new BigDecimal(8)).setScale(2, BigDecimal.ROUND_HALF_UP);

                /*
                // � ���� ��������� ��� � ������ �� ������������??? ����� ���� �������, �� ����, ����� �� ����������,
                // � ������ ������� (������ �� �������� dateFinal � dateStart) ����� ����������
                plan.totalTimeHours = new BigDecimal(maxTotalTimeHours.doubleValue());
                plan.totalTimeDays  = new BigDecimal(maxTotalTimeDays.doubleValue());
                */

                /*
                // ����� ��� � ���
                if (tmpTotalTimeHours.doubleValue() != tmpHours)
                {
                    plan.totalTimeHours = new BigDecimal(tmpTotalTimeHours.doubleValue());
                    plan.totalTimeDays  = new BigDecimal(tmpTotalTimeDays.doubleValue());
                }
                else
                {
                    plan.totalTimeHours = new BigDecimal(maxTotalTimeHours.doubleValue());
                    plan.totalTimeDays  = new BigDecimal(maxTotalTimeDays.doubleValue());
                }
                */

                plan.totalTimeHours = new BigDecimal(tmpTotalTimeHours.doubleValue());
                plan.totalTimeDays  = new BigDecimal(tmpTotalTimeDays.doubleValue());

                /// 28.02.12 ������ save ���������� �����, ������� �������� ������ ������ ���� - ����� �������� optimistic locking!
                //planDAO.save(plan);

                // ���������, ����� dateStart �����, ������� �� �������� ��������, �� ��� ������ 1-�� ����� ������ ����� (01.<monthGen>.<yearGen>)
                // � ����� �� �� ��� ������ ���������� ����� ������ (?)
                /* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                Calendar c = Calendar.getInstance();
                Calendar c1 = Calendar.getInstance();
                c.setTime(dateStart);
                c1.setTime(plan.date)
                */

                planDAO.updateDatesAndTotalTime(plan);
            }
            else
            {
                totalTime = totalTime.setScale(2, BigDecimal.ROUND_HALF_UP);

                // totalTimeHours - ����� � �����, totalTimeDays - � ����
                plan.totalTimeHours = totalTime;
                plan.totalTimeDays = totalTime.divide(new BigDecimal(8), 3, BigDecimal.ROUND_HALF_UP); // 13.03.12 ��������� �� ���� ������ !!!

                // ��� ���� ������, ����� �������-������ � �������-������ (��� ���� ������ � ��������� ������ ���������), �������� dateFinal
                if (plan.kind.code == ENPlanWorkKind.YEAR || plan.kind.code == ENPlanWorkKind.CURRENT ||
                    plan.kind.code == ENPlanWorkKind.CALCULATION || plan.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
                {
                    if (hasWorkItems)
                    {
                        // ����� ���-�� ���� (�� ������� 8-�������� �������� ���)
                        int days = totalTime.divide(new BigDecimal(8), 0, BigDecimal.ROUND_CEILING).intValue();

                        if (days > 0)
                        {
                            Calendar calendar_ = Calendar.getInstance();
                            calendar_.setTime(plan.dateStart);
                            calendar_.clear(Calendar.HOUR);
                            calendar_.clear(Calendar.HOUR_OF_DAY);
                            calendar_.clear(Calendar.MINUTE);
                            calendar_.clear(Calendar.SECOND);
                            calendar_.clear(Calendar.MILLISECOND);

                            calendar_.set(Calendar.HOUR, 0);
                            calendar_.set(Calendar.HOUR_OF_DAY, 0);
                            calendar_.set(Calendar.MINUTE, 0);
                            calendar_.set(Calendar.SECOND, 0);
                            calendar_.set(Calendar.MILLISECOND, 0);

                            calendar_.add(Calendar.DATE, days - 1);

                            plan.dateFinal = calendar_.getTime();
                        }
                    }
                }

                /// 28.02.12 ������ save ���������� �����, ������� �������� ������ ������ ���� - ����� �������� optimistic locking!
                //planDAO.save(plan);

                planDAO.updateDateFinalAndTotalTime(plan);
            }

            /*************************/
            //////////

        }
        finally
        {
            /*
            try {
                if (tkConn != null && ! tkConn.isClosed()) {
                    tkConn.close();
                    tkConn = null;
                }
            } catch (SQLException e) {
            }
            */
        }
    }

    /**
    * �������� �������� �������� ������������ �� �����
    *
    * @param int planCode - ��� �����
    */
    public void recalcFinExecutorsPercentLoad(int planCode) throws PersistenceException
    {
    	recalcFinExecutorsPercentLoad(planCode, false);
    }

    /**
    * �������� �������� �������� ������������ �� �����
    *
    * @param int planCode - ��� �����
    * @param isMonthPlanFromYear - true, ���� ����� ���������� ��� �������� ��������� ����� �� ��������
    */
    public void recalcFinExecutorsPercentLoad(int planCode, boolean isMonthPlanFromYear) throws PersistenceException
    {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(planCode);

        if (plan.kind.code != ENPlanWorkKind.CURRENT && plan.kind.code != ENPlanWorkKind.YEAR)
        {
            return;
        }

        FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
        FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);

        //////////////////////////////
        // ���� �� ����� ���� �����������, � � ���� ������ �� ��� �� ������ (����� ����� ��� ������ ������),
        // ������� ��������� ��������� ����������� � ������ (����� �� �����)
        FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
        finExecutor2PlanFilter.planRef.code = planCode;
        finExecutor2PlanFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
        int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

        boolean noFinExecutor = false;

        if (finExecutor2PlanArr.length == 0)
        {
            // �������, ����� �� ��������� ������ � ������
            boolean addPrimaryFinExecutor = false;

            if (plan.kind.code == ENPlanWorkKind.CURRENT)
            {
                // ���������� ����� ������ ��� ��������, ��� ������� ������ ������ �� ������
                if (plan.finExecutor == null)
                {
                    if (plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT && plan.elementRef.code != ENElement.CARGO_OBJECT)
                    {
                    	// 26.11.14 ��� ����������� �������� ����� � �������� �� ���� ��������� ����������� ������������!!!
                    	if (! isMonthPlanFromYear)
                    	{
                    		throw new EnergyproSystemException("\n \n �������� ������� ������� ��������� ��������� ����� - �� ������� \"�������\" �� ����!");
                    	}
                    	else
                    	{
                    		noFinExecutor = true;
                    	}
                    }
                    else
                    {
                        return;
                    }
                }

                if (plan.finExecutor.code == Integer.MIN_VALUE)
                {
                    if (plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT && plan.elementRef.code != ENElement.CARGO_OBJECT)
                    {
                        //ElementLogic elementLogic = new ElementLogic(connection, userProfile);
                        //int eType = elementLogic.getElementTypeByCode(plan.elementRef.code);
                        // 27.02.14 ��� ����������� �������� CallCenter'� �� ���������
                        //if (eType != ENElementType.CALLCENTER_OBJECT)
                        //{

                    	// 26.11.14 ��� ����������� �������� ����� � �������� �� ���� ��������� ����������� ������������!!!
                    	if (! isMonthPlanFromYear)
                    	{
                            throw new EnergyproSystemException("\n \n �������� ������� ������� ��������� ��������� ����� - �� ������� \"�������\" �� ����!");
                    	}
                    	else
                    	{
                    		noFinExecutor = true;
                    	}

                    	//}
                    }
                    else
                    {
                        return;
                    }
                }

                addPrimaryFinExecutor = true;
            }
            else if (plan.kind.code == ENPlanWorkKind.YEAR)
            {
                if (plan.finExecutor == null)
                {
                    addPrimaryFinExecutor = false;
                }
                else
                {
                    if (plan.finExecutor.code == Integer.MIN_VALUE)
                    {
                        addPrimaryFinExecutor = false;
                    }
                    else
                    {
                        addPrimaryFinExecutor = true;
                    }
                }
            }

            if (addPrimaryFinExecutor && (!noFinExecutor))
            {
                FINExecutor f = new FINExecutor();
                f.finCode = plan.finExecutor.finCode;
                f.name =  plan.finExecutor.name;
                f.finCehCode = plan.finExecutor.finCehCode;
                f.finCehName = plan.finExecutor.finCehName;
                f.finKindCode = plan.finExecutor.finKindCode;
                f.finKindName = plan.finExecutor.finKindName;
                f.finTypeCode = plan.finExecutor.finTypeCode;
                f.finTypeName = plan.finExecutor.finTypeName;
                ///// MDAX-441
                f.axOrgId = plan.finExecutor.axOrgId;
                f.axParentOrgId = plan.finExecutor.axParentOrgId;
                f.axParentOrgName = plan.finExecutor.axParentOrgName;
                f.axOrgTypeId = plan.finExecutor.axOrgTypeId;
                f.axOrgTypeName = plan.finExecutor.axOrgTypeName;
                /////
                int fCode = finExecutorDAO.add(f);

                FINExecutor2Plan executor2Plan = new FINExecutor2Plan();
                executor2Plan.code = Integer.MIN_VALUE;
                executor2Plan.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
                executor2Plan.planRef.code = planCode;
                executor2Plan.finExecutor.code = fCode;
                executor2Plan.dateStart = plan.dateStart;
                executor2Plan.dateFinal = plan.dateFinal;
                executor2Plan.percentLoad = new BigDecimal(100);
                executor2Plan.budgetRef.code = plan.budgetRef.code;

                finExecutor2PlanDAO.add(executor2Plan);
            }
        }
        //////////////////////////////

        if (plan.kind.code != ENPlanWorkKind.CURRENT || noFinExecutor)
        {
            return;
        }

        FINExecutor2PlanFilter fPrimaryFilter = new FINExecutor2PlanFilter();
        fPrimaryFilter.planRef.code = planCode; //finExecutor2Plan.planRef.code;
        fPrimaryFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
        int[] fPrimaryArr = finExecutor2PlanDAO.getFilteredCodeArray(fPrimaryFilter, 0, -1);

        if (fPrimaryArr.length == 0)
        {
            // � ������� �� ������� ��� �������� ��������� ����� �� ��������� ����������� ����� ��� �� ����!
            // ��� ������� "����������� �������" ���� �� �������
            if (plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT && plan.elementRef.code != ENElement.CARGO_OBJECT)
            {
                throw new EnergyproSystemException("\n \n �������� ������� ������� ��������� ��������� ����� - �� ������� \"�������\" �� ����!");
            }
            else
            {
                return;
            }
        }

        if (fPrimaryArr.length > 1)
        {
            throw new EnergyproSystemException("\n \n NET-2800 �� ���� ����� ������ (" + fPrimaryArr.length + ") ��������� ���������!");
        }

        FINExecutor2PlanFilter fFilter = new FINExecutor2PlanFilter();
        fFilter.planRef.code = planCode; //finExecutor2Plan.planRef.code;
        FINExecutor2PlanShortList fList = finExecutor2PlanDAO.getScrollableFilteredList(fFilter, 0, -1);

        BigDecimal tmpSum = new BigDecimal(0);

        for (int i = 0; i < fList.totalCount; i++)
        {
            if (fList.get(i).finExecutorTypeRefCode != FINExecutorType.PRIMARY)
            {
                tmpSum = tmpSum.add(fList.get(i).percentLoad);
            }
        }

        // ������� �������� ��� ��������� ����������� ������� ��� (100 - ����� ��������� �������� ��� ���. ������������)
        BigDecimal primaryPercentLoad = (new BigDecimal(100)).subtract(tmpSum);
        if (primaryPercentLoad.doubleValue() <= 0)
        {
            throw new EnergyproSystemException("\n \n NET-2800 ���������� �������� ������������� ������� ������������ ��� ��������� ���������: \n" +
                    primaryPercentLoad.doubleValue() + "% !");
        }

        /*
        FINExecutor2Plan fPrimary = finExecutor2PlanDAO.getObject(fPrimaryArr[0]);
        fPrimary.percentLoad = new BigDecimal(primaryPercentLoad.doubleValue());
        finExecutor2PlanDAO.save(fPrimary);
        */
        finExecutor2PlanDAO.updatePercentLoad(fPrimaryArr[0], primaryPercentLoad);
    }


    /**
    * ���������� ��������� ����������� �� ����� (� �������� FINExecutor2Plan)
    *
    * @param ENPlanWork object - ����
    */
    public void updatePrimaryFinExecutor(ENPlanWork object) throws PersistenceException
    {
        if (object.finExecutor == null)
        {
            return;
        }

        if (object.finExecutor.finCode == Integer.MIN_VALUE && object.finExecutor.axOrgId == null)
        {
            return;
        }

        ////////////////////////////////////////
        // NET-2800 �������� ��������� ����������� �� ����� (��� �������) - � �������� FINExecutor2Plan
        if (object.kind.code == ENPlanWorkKind.CURRENT || object.kind.code == ENPlanWorkKind.YEAR)
        {
            FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);

            FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
            FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
            finExecutor2PlanFilter.planRef.code = object.code;
            finExecutor2PlanFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
            FINExecutor2PlanShortList finExecutor2PlanList = finExecutor2PlanDAO.getScrollableFilteredList(finExecutor2PlanFilter, 0, -1);

            FINExecutor fPrimary = null;

            if (finExecutor2PlanList.totalCount == 0)
            {
                fPrimary = new FINExecutor();
                fPrimary.finCode = object.finExecutor.finCode;
                fPrimary.name =  object.finExecutor.name;
                fPrimary.finCehCode = object.finExecutor.finCehCode;
                fPrimary.finCehName = object.finExecutor.finCehName;
                fPrimary.finKindCode = object.finExecutor.finKindCode;
                fPrimary.finKindName = object.finExecutor.finKindName;
                fPrimary.finTypeCode = object.finExecutor.finTypeCode;
                fPrimary.finTypeName = object.finExecutor.finTypeName;
                ///// MDAX-441
                fPrimary.axOrgId = object.finExecutor.axOrgId;
                fPrimary.axParentOrgId = object.finExecutor.axParentOrgId;
                fPrimary.axParentOrgName = object.finExecutor.axParentOrgName;
                fPrimary.axOrgTypeId = object.finExecutor.axOrgTypeId;
                fPrimary.axOrgTypeName = object.finExecutor.axOrgTypeName;
                /////
                int fCode = d.add(fPrimary);

                FINExecutor2Plan executor2Plan = new FINExecutor2Plan();
                executor2Plan.code = Integer.MIN_VALUE;
                executor2Plan.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
                executor2Plan.planRef.code = object.code;
                executor2Plan.finExecutor.code = fCode;
                executor2Plan.dateStart = object.dateStart;
                executor2Plan.dateFinal = object.dateFinal;
                executor2Plan.percentLoad = new BigDecimal(100);
                executor2Plan.budgetRef.code = object.budgetRef.code;

                finExecutor2PlanDAO.add(executor2Plan);
            }
            else if (finExecutor2PlanList.totalCount > 1)
            {
                throw new EnergyproSystemException("\n \n NET-2800 �� ���� ����� ������ (" + finExecutor2PlanList.totalCount + ") ��������� ���������!");
            }
            else
            {
                fPrimary = d.getObject(finExecutor2PlanList.get(0).finExecutorCode);
                fPrimary.finCode = object.finExecutor.finCode;
                fPrimary.name =  object.finExecutor.name;
                fPrimary.finCehCode = object.finExecutor.finCehCode;
                fPrimary.finCehName = object.finExecutor.finCehName;
                fPrimary.finKindCode = object.finExecutor.finKindCode;
                fPrimary.finKindName = object.finExecutor.finKindName;
                fPrimary.finTypeCode = object.finExecutor.finTypeCode;
                fPrimary.finTypeName = object.finExecutor.finTypeName;
                ///// MDAX-441
                fPrimary.axOrgId = object.finExecutor.axOrgId;
                fPrimary.axParentOrgId = object.finExecutor.axParentOrgId;
                fPrimary.axParentOrgName = object.finExecutor.axParentOrgName;
                fPrimary.axOrgTypeId = object.finExecutor.axOrgTypeId;
                fPrimary.axOrgTypeName = object.finExecutor.axOrgTypeName;
                /////
                FINExecutor2Plan f2p = finExecutor2PlanDAO.getObject(finExecutor2PlanList.get(0).code);
                f2p.finExecutor.code = d.add(fPrimary);
                finExecutor2PlanDAO.save(f2p);

            }
        }
        ////////////////////////////////////////
    }


    public int closePlanCountersWriteOff(int planCode) throws PersistenceException, DatasourceConnectException
    {
        ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork obj = dao.getObject(planCode);

        ENPlanCorrectHistory ch = new ENPlanCorrectHistory();
        // ��������� �� ��������� � ������� ����
        if ( obj.kind.code == ENPlanWorkKind.CURRENT){
            // ����� � ������������ ����������� ������ ������� ������ .. ����� ������� ��� � ������������

            ch.dateGen = new Date();
            ch.userGen = userProfile.userName;

            ch.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
            ch.planOldRef.code = obj.code;

            ch.code = correctionPlanForCountersWriteOff(ch, ENPlanWorkStatus.GOOD, obj.status.code);

            ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
            ch = chDAO.getObject(ch.code);

            obj = dao.getObject(ch.planNewRef.code);


        }
        else
            // ��� ��������� � ����  ...
            if ( obj.kind.code == ENPlanWorkKind.NPW){
                //ENPlanCorrectHistory ch = new ENPlanCorrectHistory();

                ch.dateGen = new Date();
                ch.userGen = userProfile.userName;

                ch.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
                ch.planOldRef.code = obj.code;

                ch.code = correctionPlanForCountersWriteOff(ch, ENPlanWorkStatus.GOOD, obj.status.code );

                ENPlanCorrectHistoryDAO chDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
                ch = chDAO.getObject(ch.code);

                obj = dao.getObject(ch.planNewRef.code);
                obj.kind.code = ENPlanWorkKind.FACT;
                dao.save(obj);

            }

        return obj.code; // ������� ��� ��������� �����
    }

    public int correctionPlanForCountersWriteOff(ENPlanCorrectHistory object, int newStatus, int oldStatus) throws PersistenceException
    {


        int newPlanCode = copyPlanForCountersWriteOff(object.planOldRef.code, newStatus, oldStatus);

            if (newPlanCode == Integer.MIN_VALUE){
                throw new EnergyproSystemException("Plan not corrected , code=" + object.planOldRef.code);
            }

        object.planNewRef.code = newPlanCode;

        return createCorrectionPlanHistory(object) ;//objectDAO.add(object);

    }


    public int copyPlanForCountersWriteOff(int planCode, int newStatus, int oldStatus) throws PersistenceException
    {
        int newPlanCode = Integer.MIN_VALUE;

        int newEstimateCode = Integer.MIN_VALUE;

        Connection finConn = null;

        try
        {


        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

        ENPlanWork oldPlan = planDAO.getObject(planCode);

        planDAO.save(oldPlan);
        // �������� ������ ����
        newPlanCode = copyPlanWorkOnly(planCode, newStatus, oldStatus);


        // ��������� �����
        //FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
        ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(connection, userProfile);

        int woNewCode = Integer.MIN_VALUE;
        int woOldCode;
        ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
        w2pFilter.plan.code = planCode;
        ENWorkOrder2ENPlanWorkShortList w2pList = w2pDAO.getScrollableFilteredList(w2pFilter, 0, -1);

        Vector<int[]> molCodesVector = new Vector<>();
        int newMolCode = Integer.MIN_VALUE;
        int oldMolCode = Integer.MIN_VALUE;

        if (w2pList.totalCount > 0 ){
            ENWorkOrder wo = woDAO.getObject(w2pList.get(0).workOrderCode);
            woOldCode = w2pList.get(0).workOrderCode;
            wo.code = Integer.MIN_VALUE;
            woNewCode = woDAO.add(wo);

            ENWorkOrder2ENPlanWork w2p = new ENWorkOrder2ENPlanWork();
            w2p.plan.code = newPlanCode;
            w2p.workOrder.code = woNewCode;
            w2pDAO.add(w2p);



            FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(connection, userProfile);
            FINMolDataDAO molDataDAO = new FINMolDataDAO(connection, userProfile);


            FINMolDataFilter molFilter = new FINMolDataFilter();
            molFilter.workOrder.code = woOldCode;

            int[] molArr = molDataDAO.getFilteredCodeArray(molFilter,0,-1);

            for (int qq = 0; qq < molArr.length; qq++){
                FINMolData m = molDataDAO.getObject(molArr[qq]);
                oldMolCode = m.code;
                m.workOrder.code = woNewCode;
                newMolCode = molDataDAO.add(m);
                int[] molCodes = new int[2];
                molCodes[0] = oldMolCode;
                molCodes[1] = newMolCode;
                molCodesVector.add(molCodes);
                FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = oldMolCode;
                int[] d2mArr = d2mDAO.getFilteredCodeArray(d2mFilter, 0, -1);
                for (int qqq = 0; qqq < d2mArr.length; qqq++){
                    FINDoc2MolData d2m = d2mDAO.getObject(d2mArr[qqq]);
                    d2m.molData.code = newMolCode;
                    d2mDAO.save(d2m);
                }

            }

        }

        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);

        newMolCode = Integer.MIN_VALUE;
        oldMolCode = Integer.MIN_VALUE;

        // ��������� ��������� .. ������� �� ��������� � ������� �����
        ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
        estFilter.planRef.code = planCode;
        estFilter.conditionSQL = "planitemrefcode is null";

        int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
        for (int i=0; i < estArr.length; i++){
            ENEstimateItem est = new ENEstimateItem();
            ENEstimateItem newEst = new ENEstimateItem();
            est = estDAO.getObject(estArr[i]);
            newEst = est;
            newEst.planRef.code = newPlanCode;
            newEst.dateEdit = new Date();
            newEst.userGen = userProfile.userName;

         // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
            if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
            	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
            }

            newEstimateCode = estDAO.add(newEst);

            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
            e2e.estimateItemInRef.code = estArr[i];
            e2e.estimateItemOutRef.code = newEstimateCode;
            e2e.countGen = est.countFact;
            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            e2eDAO.add(e2e);
        }

        return newPlanCode;

        }

        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }

        }

    }
// �������� ���� �� � ������ ENPlanWork2ClassificationType ������ ������������� �� �������
    public boolean isReservedCalculationInContract(int planCode) throws PersistenceException{
        boolean out = false;

        ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
        pw2cltFilter.planRef.code = planCode;
        pw2cltFilter.isJobsByTime = 1;
        int[] pw2cltArr = pw2cltDAO.getFilteredCodeArray(pw2cltFilter, 0, -1);

            if ( pw2cltArr.length > 0  ){
                out = true;
            }

        return out;
    }

//     �������� ������������� ������� ��������� �������� � �������� �� ��������������
    public boolean isAcessRemJobsByTime(int codeDepartment) throws PersistenceException{
        boolean out = false;
        // ��������� ���� 23.03.2012
        /* if ( codeDepartment == 481 ){ // ����������� ��������� ���� (���� ���� �� ����)
                out = true;
            } */
        if ( codeDepartment == 17
                || codeDepartment == 480  ){ // ����������� ��������� ���� (���� ���� �� ������� � ����� �������)
                out = true;
            }
        return out;
    }

    public TKVirtualBrigade getTKVirtualBrigade(int planCode) throws PersistenceException
    {

        TKVirtualBrigade out = null;

        TKVirtualBrigadeDAO vbDAO = new TKVirtualBrigadeDAO(connection, userProfile);
        TKVirtualBrigadeFilter vbFilter = new TKVirtualBrigadeFilter();


        vbFilter.conditionSQL = " TKVIRTUALBRIGADE.CODE in ( " +
        " Select vb.code " +
        " From enplanwork pw , enservicesobject so , entimeline tl  , tkvirtualbrigade vb " +
        " Where pw.code = " + planCode +
        " and pw.elementrefcode = so.elementcode " +
        " and tl.servicesobjectrefcode = so.code " +
        " and tl.virtualbrigaderefcode = vb.code " +
        " order by vb.molmechaniccode " +
        " limit 1 " +
        ")";


        int[] vbArr = vbDAO.getFilteredCodeArray(vbFilter,0,-1);
        if (vbArr.length > 0 ) {
        out = vbDAO.getObject(vbArr[0]);
        }
        return out;
    }

//
    public String getFullExecutorName(int podrId) throws PersistenceException, DatasourceConnectException{
        String outStr = "";
        int temp_podr_id = podrId;
        Connection finConn = null;

        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
        // �����������
        FINExecutorDAO fexDAO = new FINExecutorDAO(finConn,userProfile);
        while (temp_podr_id != Integer.MIN_VALUE ){

            FINExecutorFilter fexFilter = new FINExecutorFilter();
            //fexFilter.conditionSQL = "p.Podr_Id = " + temp_podr_id;

            fexFilter.finCode = temp_podr_id;

            FINExecutorShortList fexList = fexDAO.getFINExecutorList2(fexFilter, 0, -1);
            if ((fexList.totalCount > 0) &&(fexList.get(0).finCehCode != 0 && fexList.get(0).finCehCode != 1) )
            {
            	temp_podr_id = fexList.get(0).finCehCode;

            	if (fexList.get(0).finKindName != null)
            	{
            		if (! fexList.get(0).finKindName.equals(""))
            		{
            			if (outStr.length() == 0)
            			{
            				outStr = fexList.get(0).name;
            			}
            			else
            			{
            				outStr = outStr + " " + fexList.get(0).name;
            			}
            		}
            	}
            }
            else break ;
//            if (fexList.get(0).finCehCode == 0 || fexList.get(0).finCehCode == 1) {
//                break ;
//            }
        }

        return outStr;
    }

    public String getAXFullExecutorName(String axOrgId) throws PersistenceException, DatasourceConnectException
    {
        String outStr = "";
        //boolean out = false;
        String temp_podr_id = axOrgId;
        Connection finConn = null;

        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        // �����������
        FINExecutorDAO fexDAO = new FINExecutorDAO(finConn,userProfile);

        while (! temp_podr_id.equals(""))
        {
            FINExecutorFilter fexFilter = new FINExecutorFilter();
            //fexFilter.conditionSQL = "p.Podr_Id = " + temp_podr_id;

            fexFilter.axOrgId = temp_podr_id;

            FINExecutorShortList fexList = fexDAO.getFINExecutorList(fexFilter, 0, -1);
            if (fexList.totalCount > 0 && fexList.get(0).axParentOrgId != null)
            {
            	temp_podr_id = fexList.get(0).axParentOrgId;

            	if (! fexList.get(0).axParentOrgId.equals(""))
            	{
            		if (fexList.get(0).axOrgTypeId != 0)
            		{
            			//temp_podr_id = fexList.get(0).axParentOrgId;
            			if (outStr.length() == 0)
            			{
            				outStr = fexList.get(0).name;
            			}
            			else
            			{
            				outStr = outStr + " " + fexList.get(0).name;
            			}
            		}
            	}
            	else
            		break;
            }
            else
            	break;
//            if (fexList.get(0).finCehCode == 0 || fexList.get(0).finCehCode == 1) {
//                break ;
//            }
        }

        return outStr;
    }

    public void addWorkOrderJobsByTime(int planCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
            if (planCode != Integer.MIN_VALUE) {
            ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork pwObj = pwDAO.getObject(planCode);
            ENWorkOrder2ENPlanWork wOrder2Plan = new ENWorkOrder2ENPlanWork();
            wOrder2Plan.code = Integer.MIN_VALUE;
            wOrder2Plan.plan.code = pwObj.code;
            wOrder2Plan.workOrder.dateGen =  pwObj.dateStart;
            wOrder2Plan.workOrder.department.code = pwObj.departmentRef.code;
            wOrder2Plan.workOrder.code = Integer.MIN_VALUE;

            Context context = new InitialContext();
            Object objWoRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);
            ENWorkOrder2ENPlanWorkControllerHome woHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject.narrow(objWoRef, ENWorkOrder2ENPlanWorkControllerHome.class);
            ENWorkOrder2ENPlanWorkController wo2PlanController = woHome.create();

            wo2PlanController.add(wOrder2Plan);
            }

    }

    /**
    *  16.06.2012 +++
    *  �������� ������� ��� �������� ��������� ���������� ��� �������� ������
    */
    public void validatePeriodBySCCounter(int estimateItemCode) throws PersistenceException {

        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem estimate = eDao.getObject(estimateItemCode);

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(estimate.planRef.code);

        Date currDate = new Date();
        Calendar calendar = Calendar.getInstance();

        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);
        calendar.clear(Calendar.HOUR);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.HOUR_OF_DAY);

        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.HOUR, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));

        currDate = calendar.getTime();

        Calendar cStart = Calendar.getInstance();
        cStart.setTime(plan.dateStart);
        cStart.clear(Calendar.HOUR);
        cStart.clear(Calendar.HOUR_OF_DAY);
        cStart.clear(Calendar.MINUTE);
        cStart.clear(Calendar.SECOND);
        cStart.clear(Calendar.MILLISECOND);

        cStart.set(Calendar.HOUR, 0);
        cStart.set(Calendar.HOUR_OF_DAY, 0);
        cStart.set(Calendar.MINUTE, 0);
        cStart.set(Calendar.SECOND, 0);
        cStart.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.MONTH, plan.monthGen - 1);
        calendar.set(Calendar.YEAR, plan.yearGen);

        Date planDateStart = cStart.getTime();

        /* 06.09.2012 +++ �������� ���������� �� ������ ����������, �� ����� ���� �� �������� ;) */
        if (planDateStart.before(currDate) && plan.code != 0) {
            throw new EnergyproSystemException(
                    "\n \n ���������� ���������� ��������� �� ������ ������ ������� ������!!!");
        }
    }

    /**
    *  17.06.2012 +++
    *  ���������� ��� ������� �����
    */
    public int getPlanWorkTypeByEstimateCode(int estimateCode)
            throws PersistenceException {
        ENEstimateItemDAO estDao = new ENEstimateItemDAO(connection, userProfile);
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);

        int planCode = estDao.getObject(estimateCode).planRef.code;
        return planDao.getObject(planCode).typeRef.code;
    }


	public int changePlanWorkItem(ENPlanWorkItem object, ENPlanWork plan)
			throws PersistenceException {
		return changePlanWorkItem(object, plan, false);
	}

	public int changePlanWorkItem(ENPlanWorkItem object, ENPlanWork plan,
			boolean createEstimate) throws PersistenceException {

		if (object.planRef.code == Integer.MIN_VALUE) {
			new EnergyproSystemException("planRef not found");
		}

        ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItem oldPwItem = objectDAO.getObject(object.code);

        object.dateEdit = new Date();
        object.userGen = userProfile.userName;

        object.code = objectDAO.add(object);

		if (!createEstimate) {
			/* ������������ ��������� ��� ����� ������ */
			ENEstimateItemDAO esDao = new ENEstimateItemDAO(connection, userProfile);
			ENEstimateItemFilter esFilter = new ENEstimateItemFilter();
			esFilter.planItemRef.code = oldPwItem.code;

			int estArr[] = esDao.getFilteredCodeArray(esFilter, 0, -1);
			if (estArr.length > 0) {
				for (int i = 0; i < estArr.length; i++) {
					ENEstimateItem estimate = esDao.getObject(estArr[i]);
					estimate.planItemRef.code = object.code;
					esDao.save(estimate);
				}
			}
		} else {
			EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
			eLogic.createENEstimateItems(object.code, false, null,ENEstimateItemStatus.UNUSED);
		}

        /* ����������� ����� */
        HumenLogic hLogic = new HumenLogic(connection, userProfile);
        hLogic.createHumenItemsByChangePlanWorkItem(object.code, false);

        /* ����������� ��������� */
        TransportLogic tLogic = new TransportLogic(connection, userProfile);
        tLogic.createENTransportItems(object.code);

        /* ������� ������ ������ */
        ENPlanWorkItem newPwItem = objectDAO.getObject(oldPwItem.code);
        newPwItem.countGen = new BigDecimal(0);

        try {
            Context context = new InitialContext();
            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);

            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController;

            pwiController = pwiHome.create();

            pwiController.saveByChange(newPwItem);

        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }


        return object.code;
    }

    public void checkForCorrectInvNumber(ENPlanWork plan)
    {
        String invNum = "";

        ElementLogic elLogic = new ElementLogic(connection, userProfile);
        ENAccess2EnelementDAO a2eDAO = new ENAccess2EnelementDAO(connection, userProfile);
        ENElementDAO elDAO = new ENElementDAO(connection, userProfile);

        Connection finConn = null;

        try
        {
			try {
				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException("\n\n" +
						"��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
						e);
			}

            FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);

            invNum = elLogic.getElementInvNumber(plan.elementRef.code);

            // SUPP-79044
            if(plan.stateRef.code == ENPlanWorkState.TO && (invNum == null || invNum.length() == 0)) {
            	throw new SystemException("������� �������������� ��������� �������� �� ��'����, �� ����� �����������, ��������������, �������� ��� ����� �����");
            }

            if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
            {
                return;
            }

            //SUPP-2100
            if (plan.stateRef.code == ENPlanWorkState.SERVICES_FROM_OUT || plan.stateRef.code == ENPlanWorkState.TMC_TRANSFER)
            {
                return;
            }

            // �� ������� 163 ��������� ������������ ���������
            /*if (    plan.elementRef.code == 1017000079 // - Ѳ��� - ճ���-���������������� �������� ����������������� �����
                    || plan.elementRef.code ==    210015498 // - Ѳ��� -��-1 ���������� ���������
                    || plan.elementRef.code == 1017000128 // - Ѳ��� -���������� ������� ������������
                    || plan.elementRef.code == 1017000402 // - Ѳ��� -���������� ������� ������������
                    || plan.elementRef.code == 1017000062 // - Ѳ��� -���������� ������� ������������
                    || plan.elementRef.code == 500001822  // - Ѳ��� -�������� �������� ò��� ���� Ѳ��� (����� �������� �� ������� �� ����������� �� ������������)



                    || plan.elementRef.code == 900000307    // ����- ������������ ������� ������������
                    || plan.elementRef.code == 230000440    // ����- ������������ ������� ������������        000000    9
                    || plan.elementRef.code == 230000579    // ����- ��� ������������ ������� ������������        000000    9
                    || plan.elementRef.code == 22385    // ����-������������ ������� ������������        000000    9
                    || plan.elementRef.code == 900000320    // ����-������������ ������� ������������        000000    9
                    || plan.elementRef.code == 30014406    // ����-������������ ������� ������������        000000    9

                    || plan.elementRef.code == 19046 // ����- ������������ ���� � ��������


                    || plan.elementRef.code == 900000326 // ����-    �������� ����        000000    9
                    || plan.elementRef.code == 900000327    // ����- �������� �������� ���������� ���        000000    9
                    || plan.elementRef.code == 30010976     // ����- �������� ����        000000    9
                    || plan.elementRef.code == 30011087    // ����- �������� �����.���������        000000    9
                ){
                return;
            } */

            /*for (int i = 0; i < invNum.length(); i++)
            {
                if (! invNum.substring(i, i + 1).equals("0"))
                {
                    return;
                }
            }*/

            ENElementDAO eDao = new ENElementDAO(connection, userProfile);
            ENElement e = eDao.getObject(plan.elementRef.code, false);


            if (e.typeRef.code == ENElementType.NO_OBJECT_COUNTERS_SERVICES) {
            	return;
            }

            /*if (e.typeRef.code == ENElementType.SIT)
            {
                return;
            }*/


            /** SUPP-8217... 16.10.2013 +++ �� ������� ������������ ��������� ������ � ������� �������������...  */
            /** SUPP-8217... 17.10.2013 +++ ��������� ������ �� ������� NET-�...
             *  ������ ��� �������, �� ������� ���� ��� ������ (���� ������� �������� �� CN-a)...
             */
            if (e.elementInRef.code == ENElementType.SERVICES_OBJECT) {
                ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
                ENServicesObject so = soLogic.getServicesObjectByElementCode(e.code);
                if (so.cnPackCode != Integer.MIN_VALUE) {
                    TKTechCardDAO techCardDao = new TKTechCardDAO(connection, userProfile);
                    TKTechCardFilter tkFilter = new TKTechCardFilter();
                    tkFilter.conditionSQL = " tktechcard.code in (select pi.kartarefcode " +
                            " from enplanworkitem pi where pi.planrefcode = " + plan.code + ")";

                    int tkArr[] = techCardDao.getFilteredCodeArray(tkFilter, 0, -1);
                    if (tkArr.length > 0) {
                        for (int t = 0; t < tkArr.length; t++) {

                            TKTechCard tCatd = techCardDao.getObject(tkArr[t]);
                            int notUseWorkArr[] = TKClassificationType.DONT_USE;

                            for (int n = 0; n < notUseWorkArr.length; n++) {
                                if (notUseWorkArr[n] == tCatd.classificationType.code) {
                                    throw new EnergyproSystemException("\n " +
                                            "\n SUPP-8217..." +
                                            "\n ��� �������� ��� ���������� �� ���������� ������������ ������ ������볿!!!" +
                                            "\n � = 2.2.050201, 2.2.050202, 2.2.060201, 2.2.060201.02, 2.2.060201.03...");
                                }
                            }
                        }
                    }
                }
            }


            if (plan.stateRef.code == ENPlanWorkState.CAPITAL_BUILDER
                    || plan.stateRef.code == ENPlanWorkState.PRODUCTION
                    || plan.stateRef.code == ENPlanWorkState.DESIGNING)
            {
                return;
            }


            /** SUPP-7437... 01.10.2013 +++ ������ ������ � ������� �� "���� ������� ����"... */
            if (e.typeRef.code == ENElementType.PURCHASES_NO_OBJECT) {
                ENPurchasesNoObjectDAO pnoDao = new ENPurchasesNoObjectDAO(connection, userProfile);
                ENPurchasesNoObjectFilter pnoFilter = new ENPurchasesNoObjectFilter();
                pnoFilter.element.code = e.code;

                int pnoArr[] = pnoDao.getFilteredCodeArray(pnoFilter, 0, -1);
                if (pnoArr.length > 0) {
                    ENPurchasesNoObject pno = pnoDao.getObject(pnoArr[0]);
                    if (pno.name.contains("������")) {
                        throw new EnergyproSystemException("\n \n" +
                                "SUPP-7437... ���������� ��������� ����� �� �ᒺ��� � ����� \"���� ������� ������\"!!!");
                    }
                }
            }


            // �������� ������� � �������
            ENAccess2EnelementFilter a2eFilter = new ENAccess2EnelementFilter();
            a2eFilter.elementRef.code = plan.elementRef.code;
            a2eFilter.isAccess = 1;
            int[] a2eArr = a2eDAO.getFilteredCodeArray(a2eFilter, 0, -1);

            if (a2eArr.length != 0){
                return;
            }
            else {
// ���� ��� � �������� �� �������� �� �� ��� �� ��� ����� �� ��� ��� ����
//                for (int i = 0; i < invNum.length(); i++)
//                {
//                    if (! invNum.substring(i, i + 1).equals("0") && ! invNum.substring(i, i + 1).equals("") && ! invNum.substring(i, i + 1).equals("-"))
//                    {
//                        return;
//                    }
//                }
            // ���� ���� � �� ����� ���������
                if (fkOsLogic.getInvNumberIsExist(invNum)){
                    return;
                    }

            }

            // ��������� �� �������� ���� ������ ��������� � ������ �� ������������ �����
            ENElementFilter elFilter = new ENElementFilter();
            elFilter.code = plan.elementRef.code;
            elFilter.conditionSQL = " ENELEMENT.TYPEREFCODE in ( " + ENElementType.SQL_NO_SELECTED_ELEMENT_TYPE_FOR_ACCESS + ")";
            int[] elArr = elDAO.getFilteredCodeArray(elFilter, 0, -1);

            if (elArr.length != 0){
                return;
            }


            System.out.println("===== USER: " + userProfile.getUserName() + ", DOMAIN: " + userProfile.getDomainInfo().getDomain() + " =====");

            // throw new EnergyproSystemException("���������� �������� ����� �� ���� �� ��'���� � ���. ������� \"" + invNum + "\" !");
            //throw new EnergyproSystemException("����� ������ �163 �� 19.03.2013, �� ��'��� " + invNum + "  ���������� �������� �����, ����. ��� ������� ������� ��������� � ���������-�������� ���� (���)!");

        }
        catch (PersistenceException e)
        {
            throw new EnergyproSystemException(e.getMessage(), e);
        }

        finally
        {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }


    public int findMonthPlanForAVR(ENPlanWork plan) throws PersistenceException
    {
        //CREATE UNIQUE INDEX "enplanwork_unic" ON "net"."enplanwork"
        //  USING btree ("yeargen", "monthgen", "statuscode", "elementrefcode",
        //"typerefcode", "kindcode", "datestart", "staterefcode",
        //"finexecutorcode");

        //boolean out1 = false;
        //out1 = true;

        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.yearGen = plan.yearGen;
        f.monthGen = plan.monthGen;
        //f.status.code = plan.status.code;

        //out1 = false;

        f.budgetRef.code = plan.budgetRef.code;
        f.departmentRef.code = plan.departmentRef.code;

        f.elementRef.code = plan.elementRef.code;
        f.typeRef.code = plan.typeRef.code;
        f.kind.code = plan.kind.code;

        f.formRef.code = plan.formRef.code;


        if (plan.kind.code != ENPlanWorkKind.CURRENT)
        {
            return Integer.MIN_VALUE;
        }

        f.stateRef.code = plan.stateRef.code;

        if (plan.code != Integer.MIN_VALUE){
            f.conditionSQL = "enplanwork.code <> " + plan.code;
        }

        /* ����� ������������� � ������� �������������� :) */
        if (plan.priConnectionNumber != null) {
            if (!plan.priConnectionNumber.equals("")) {
                f.priConnectionNumber = plan.priConnectionNumber;
            }

        }


        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWorkShortList l = planDAO.getScrollableFilteredList(f, 0, -1);
        int[] arr = planDAO.getFilteredCodeArray(f,0,1);

        //FINExecutorDAO  finExDAO = new FINExecutorDAO(connection, userProfile);
        //ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(connection, userProfile);


        //for (int i = 0; i < l.totalCount; i++){
        for (int i = 0; i < arr.length; i++){
            ENPlanWork p1 = planDAO.getObject(arr[i]);

                if (p1.finExecutor.code > Integer.MIN_VALUE ){
                    //FINExecutor ex = null;
                    if (plan.finExecutor != null){
                        /*
                        if (plan.finExecutor.code != Integer.MIN_VALUE){
                            ex = finExDAO.getObject( plan.finExecutor.code );
                        }
                        */

                    	///// MDAX-441
                		boolean isFinExecutorsEqual =
                			compareFinExecutorsByCodes(plan.finExecutor.axOrgId, p1.finExecutor.axOrgId,
                									   plan.finExecutor.finCode, p1.finExecutor.finCode);
                    	/////

                    	//if (plan.finExecutor.finCode == p1.finExecutor.finCode)
                		//if (isFinCodesEqual || isAXOrgIdsEqual)
                		if (isFinExecutorsEqual)
                        {
                			return p1.code;
                        }
                    }
                    /*
                    if ( ex != null){
                        if (ex.finCode == p1.finExecutor.finCode ){
                            //out1 = true;
                            return p1.code;
                        }
                    }
                    */
                }
                else{
                    return p1.code;
                    /*
                    if (plan.finExecutor != null){
                        if (plan.finExecutor.code == Integer.MIN_VALUE){
                            //out1 = true;
                            return p1.code;
                        }
                    }
                    else{
                        //out1 = true;
                        return p1.code;
                    }
                    */
                }

        }

        //return out1;
        return Integer.MIN_VALUE;
    }


    public int findMonthPlan(ENPlanWork plan, String molCode) throws PersistenceException
    {
        //CREATE UNIQUE INDEX "enplanwork_unic" ON "net"."enplanwork"
        //  USING btree ("yeargen", "monthgen", "statuscode", "elementrefcode",
        //"typerefcode", "kindcode", "datestart", "staterefcode",
        //"finexecutorcode");

        //boolean out1 = false;
        //out1 = true;

        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.yearGen = plan.yearGen;
        f.monthGen = plan.monthGen;
        //f.status.code = plan.status.code;

        //out1 = false;

        f.budgetRef.code = plan.budgetRef.code;
        f.departmentRef.code = plan.departmentRef.code;

        f.elementRef.code = plan.elementRef.code;
        f.typeRef.code = plan.typeRef.code;
        f.kind.code = plan.kind.code;

        f.formRef.code = plan.formRef.code;


        if (plan.kind.code != ENPlanWorkKind.CURRENT)
        {
            return Integer.MIN_VALUE;
        }

        f.stateRef.code = plan.stateRef.code;

        if (plan.code != Integer.MIN_VALUE){
            f.conditionSQL = "enplanwork.code <> " + plan.code;
        }

        /* ����� ������������� � ������� �������������� :) */
        if (plan.priConnectionNumber != null) {
            if (!plan.priConnectionNumber.equals("")) {
                f.priConnectionNumber = plan.priConnectionNumber;
            }

        }


        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWorkShortList l = planDAO.getScrollableFilteredList(f, 0, -1);
        int[] arr = planDAO.getFilteredCodeArray(f, 0, -1);

        //FINExecutorDAO  finExDAO = new FINExecutorDAO(connection, userProfile);

        /*
        String planMOLCode = "";

        ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(connection, userProfile);

        ENMOL2PlanWorkFilter mpFilter = new ENMOL2PlanWorkFilter();
        mpFilter.planRef.code = plan.code;
        ENMOL2PlanWorkShortList mpList = mpDAO.getScrollableFilteredList(mpFilter, 0, -1);
        if (mpList.totalCount > 0)
        {
        	planMOLCode = mpList.get(0).molCode;
        }
        */

        ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(connection, userProfile);

        if (molCode == null)
        {
        	molCode = "";
        }

        //for (int i = 0; i < l.totalCount; i++){
        for (int i = 0; i < arr.length; i++)
        {
            ENPlanWork p1 = planDAO.getObject(arr[i]);

                if (p1.finExecutor.code > Integer.MIN_VALUE)
                {
                    //FINExecutor ex = null;
                    if (plan.finExecutor != null)
                    {
                        /*
                        if (plan.finExecutor.code != Integer.MIN_VALUE){
                            ex = finExDAO.getObject( plan.finExecutor.code );
                        }
                        */

                    	///// MDAX-441
                		boolean isFinExecutorsEqual =
                			compareFinExecutorsByCodes(plan.finExecutor.axOrgId, p1.finExecutor.axOrgId,
                									   plan.finExecutor.finCode, p1.finExecutor.finCode);
                    	/////

                		//if (plan.finExecutor.finCode == p1.finExecutor.finCode)
                		//if (isFinCodesEqual || isAXOrgIdsEqual)
                		if (isFinExecutorsEqual)
                        {
                        	if (! molCode.equals(""))
                        	{
                                ENMOL2PlanWorkFilter mpFilter1 = new ENMOL2PlanWorkFilter();
                                mpFilter1.planRef.code = p1.code;
                                ENMOL2PlanWorkShortList mpList1 = mpDAO.getScrollableFilteredList(mpFilter1, 0, -1);
                                if (mpList1.totalCount > 0)
                                {
                                    if (molCode.equals(mpList1.get(0).molCode))
                                    {
                                    	return p1.code;
                                    }
                                }
                        	}
                        	else
                        	{
                        		return p1.code;
                        	}
                        }
                    }
                }
                else
                {
                	/*
                	if (! planMOLCode.equals(""))
                	{
                        ENMOL2PlanWorkFilter mpFilter1 = new ENMOL2PlanWorkFilter();
                        mpFilter1.planRef.code = p1.code;
                        ENMOL2PlanWorkShortList mpList1 = mpDAO.getScrollableFilteredList(mpFilter1, 0, -1);
                        if (mpList1.totalCount > 0)
                        {
                            if (planMOLCode.equals(mpList1.get(0).molCode))
                            {
                            	return p1.code;
                            }
                        }
                	}
                	else
                	{
                		return p1.code;
                	}
                	*/
                }

        }

        //return out1;
        return Integer.MIN_VALUE;
    }


    public int findYearPlan(ENPlanWork plan) throws PersistenceException
    {
        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.yearGen = plan.yearGen;
        f.monthGen = plan.monthGen;
        //f.status.code = plan.status.code;

        //out1 = false;

        f.budgetRef.code = plan.budgetRef.code;
        f.departmentRef.code = plan.departmentRef.code;

        f.elementRef.code = plan.elementRef.code;
        f.typeRef.code = plan.typeRef.code;
        f.kind.code = plan.kind.code;

        f.formRef.code = plan.formRef.code;


        if (plan.kind.code != ENPlanWorkKind.YEAR)
        {
            return Integer.MIN_VALUE;
        }

        f.stateRef.code = plan.stateRef.code;

        if (plan.code != Integer.MIN_VALUE){
            f.conditionSQL = "enplanwork.code <> " + plan.code;
        }

        /* ����� ������������� � ������� �������������� :) */
        if (plan.priConnectionNumber != null) {
            if (!plan.priConnectionNumber.equals("")) {
                f.priConnectionNumber = plan.priConnectionNumber;
            }

        }


        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWorkShortList l = planDAO.getScrollableFilteredList(f, 0, -1);
        int[] arr = planDAO.getFilteredCodeArray(f, 0, -1);

        //FINExecutorDAO  finExDAO = new FINExecutorDAO(connection, userProfile);


        //for (int i = 0; i < l.totalCount; i++){
        for (int i = 0; i < arr.length; i++)
        {
            ENPlanWork p1 = planDAO.getObject(arr[i]);

                if (p1.finExecutor.code > Integer.MIN_VALUE)
                {
                    //FINExecutor ex = null;
                    if (plan.finExecutor != null)
                    {
                        /*
                        if (plan.finExecutor.code != Integer.MIN_VALUE){
                            ex = finExDAO.getObject( plan.finExecutor.code );
                        }
                        */

                    	///// MDAX-441
                		boolean isFinExecutorsEqual =
                			compareFinExecutorsByCodes(plan.finExecutor.axOrgId, p1.finExecutor.axOrgId,
                									   plan.finExecutor.finCode, p1.finExecutor.finCode);
                    	/////

                        //if (plan.finExecutor.finCode == p1.finExecutor.finCode)
                		//if (isFinCodesEqual || isAXOrgIdsEqual)
                		if (isFinExecutorsEqual)
                        {
                        	return p1.code;
                        }
                    }
                }

        }

        //return out1;
        return Integer.MIN_VALUE;
    }


    public int addForAVR(ENPlanWork object, ENPlanWorkItem[] planItems,
            String masterCode, String masterName, String mechanicCode, String mechanicName)
    {
        try
        {
            if (masterCode == null)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������ ���-�������!");
            }

            if (masterCode.equals(""))
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������ ���-�������!");
            }

            if (object.finExecutor == null)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������ ��������� �����!");
            }

            Context context = new InitialContext();
            Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();

            // ������� �� ��������� ����� � �������-����!!! (���. ���� ����� ������� ���� ����� ��� ������������)
            object.kind = new ENPlanWorkKind();
            object.kind.code = ENPlanWorkKind.CURRENT;

            object.finExecutor.code = Integer.MIN_VALUE;

            /////
            //planController.getScrollableFilteredList((ENPlanWorkFilter)object, 0, -1);
            int monthPlanCode = findMonthPlanForAVR(object);
            /////

            Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

            ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
            ENMOL2PlanWorkController mol2planController = mol2planHome.create();

            boolean noMol2plan = true;

            if (monthPlanCode != Integer.MIN_VALUE)
            {
                ENMOL2PlanWorkFilter mol2planFilter = new ENMOL2PlanWorkFilter();
                mol2planFilter.code = Integer.MIN_VALUE;
                mol2planFilter.planRef = new ENPlanWorkRef();
                mol2planFilter.planRef.code = monthPlanCode;
                //mol2planFilter.molCode = masterCode;
                ENMOL2PlanWorkShortList mol2planList = mol2planController.getScrollableFilteredList(mol2planFilter, 0, -1);

                if (mol2planList.totalCount == 0)
                {
                    ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                    mol2planObj.code = Integer.MIN_VALUE;
                    mol2planObj.planRef = new ENPlanWorkRef();
                    mol2planObj.planRef.code = monthPlanCode;
                    mol2planObj.molCode = masterCode;
                    mol2planObj.molName = masterName;

                    mol2planController.add(mol2planObj);
                }
                else
                {
                    noMol2plan = false;
                }
            }

            // int planCode = planController.add(object);

            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);

            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController = pwiHome.create();

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                monthPlanCode = planController.add(object, false, true);

                ///// ��������� ���� ��� ����������
                if (noMol2plan)
                {
                    ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                    mol2planObj.code = Integer.MIN_VALUE;
                    mol2planObj.planRef = new ENPlanWorkRef();
                    mol2planObj.planRef.code = monthPlanCode;
                    mol2planObj.molCode = masterCode;
                    mol2planObj.molName = masterName;

                    mol2planController.add(mol2planObj);
                }
                /////

                ///// ���������� ������ � �������� ����
                for (int i = 0; i < planItems.length; i++)
                {
                    /*
                    planItems[i].code = Integer.MIN_VALUE;
                    planItems[i].planRef = new ENPlanWorkRef();
                    planItems[i].planRef.code = monthPlanCode;
                    planItems[i].countGen = new BigDecimal(0);
                    pwiController.add(planItems[i]);
                    */

                    ENPlanWorkItem planItem = new ENPlanWorkItem();
                    planItem.code = Integer.MIN_VALUE;
                    planItem.planRef = new ENPlanWorkRef();
                    planItem.planRef.code = monthPlanCode;
                    planItem.kartaRef = new TKTechCardRef();
                    planItem.kartaRef.code = planItems[i].kartaRef.code;
                    /// 28.01.14 SUPP-11863 ����� ��������
                    planItem.countGen = planItems[i].countGen; //new BigDecimal(0);
                    ///
                    pwiController.add(planItem);
                }
                /////

                /// 28.01.14 SUPP-11863 ����� ��������
                ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
                ENPlanWorkItemFilter pwiFilter = new ENPlanWorkItemFilter();
                pwiFilter.planRef.code = monthPlanCode;
                int pwiArr[] = pwiDAO.getFilteredCodeArray(pwiFilter, 0, -1);

                for (int i = 0; i < pwiArr.length; i++)
                {
                    ENPlanWorkItem pwi = pwiDAO.getObject(pwiArr[i]);
                    pwi.countGen = new BigDecimal(0);
                    pwiDAO.save(pwi);
                }
                ///

                ///// 26.02.15 ����� ��������� � pwiController.add
                // NET-4440 ������� ������ � ������� ��� �� ���������� �����
                // (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
                // generatePlanFuelHistory(monthPlanCode, object.dateStart, true);
                /////
            }

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������� �� ��� ��������� ̳������� �����!");
            }


            int planCode = planController.closePlanWork(monthPlanCode);

            ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);

            // �������� ����� ���� ����� ���������� �������-�����
            /////
            ENPlanWork plan = planDao.getObject(planCode);
            if (plan == null)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������� �� ��� ��������� ��������-�����!");
            }
            plan.dateStart = object.dateStart;
            plan.dateFinal = object.dateFinal;
            plan.yearGen = object.yearGen;
            plan.monthGen = object.monthGen;
            this.save(plan);
            /////

            ///// ���������� ������ � �������-���� (�.�. ��� ��� ��� �� ���������� �� ��������� �����)
            for (int i = 0; i < planItems.length; i++)
            {
                planItems[i].code = Integer.MIN_VALUE;
                planItems[i].planRef = new ENPlanWorkRef();
                planItems[i].planRef.code = planCode;
                /// 28.01.14 SUPP-11863
                //pwiController.add(planItems[i]);
                pwiController.add(planItems[i], true);
                ///
            }
            /////

            ///// ������� �����-�������
            ENWorkOrder2ENPlanWork wo2plan = new ENWorkOrder2ENPlanWork();
            wo2plan.code = Integer.MIN_VALUE;

            wo2plan.plan = new ENPlanWork();
            wo2plan.plan.code = planCode;

            wo2plan.workOrder = new ENWorkOrder();
            wo2plan.workOrder.code = Integer.MIN_VALUE;
            wo2plan.workOrder.department = new ENDepartment();
            wo2plan.workOrder.department.code = object.departmentRef.code;
            wo2plan.workOrder.dateGen = object.dateStart;
            wo2plan.workOrder.commentGen = "����������� �������� �����-��������";
            wo2plan.workOrder.finMolCode = masterCode;
            wo2plan.workOrder.finMolName = masterName;
            //wo2plan.workOrder.finMechanicCode = mechanicCode;
            //wo2plan.workOrder.finMechanicName = mechanicName;

            Object wo2planRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);

            ENWorkOrder2ENPlanWorkControllerHome wo2planHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject.narrow(wo2planRef, ENWorkOrder2ENPlanWorkControllerHome.class);
            ENWorkOrder2ENPlanWorkController wo2planController = wo2planHome.create();

            int wo2planCode = wo2planController.add(wo2plan);
            ENWorkOrder2ENPlanWork wo2planObj = wo2planController.getObject(wo2planCode);

            if (wo2planObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder == null)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder.code == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4214 ������� �� ��� ��������� �����-��������!");
            }

            FINMolData finMOLDataObj = new FINMolData();
            finMOLDataObj.workOrder = new ENWorkOrder();
            finMOLDataObj.workOrder.code = wo2planObj.workOrder.code;
            finMOLDataObj.finMolCode = masterCode;
            finMOLDataObj.finMolName = masterName;
            finMOLDataObj.molTypeRef = new FINMolTypeRef();
            finMOLDataObj.molTypeRef.code = FINMolType.MASTER;
            finMOLDataObj.code = Integer.MIN_VALUE;

            Object finMOLDataRef = context.lookup(FINMolDataController.JNDI_NAME);

            FINMolDataControllerHome finMOLDataHome = (FINMolDataControllerHome) PortableRemoteObject.narrow(finMOLDataRef, FINMolDataControllerHome.class);
            FINMolDataController finMOLDataController = finMOLDataHome.create();

            finMOLDataController.add(finMOLDataObj, wo2planObj.workOrder.code, 1);

            if (mechanicCode != null)
            {
                if (! mechanicCode.equals(""))
                {
                    finMOLDataObj = new FINMolData();
                    finMOLDataObj.workOrder = new ENWorkOrder();
                    finMOLDataObj.workOrder.code = wo2planObj.workOrder.code;
                    finMOLDataObj.finMolCode = mechanicCode;
                    finMOLDataObj.finMolName = mechanicName;
                    finMOLDataObj.molTypeRef = new FINMolTypeRef();
                    finMOLDataObj.molTypeRef.code = FINMolType.MECHANIC;
                    finMOLDataObj.code = Integer.MIN_VALUE;

                    finMOLDataController.add(finMOLDataObj, wo2planObj.workOrder.code, 1);
                }
            }
            /////

            ///// 26.02.15 ����� ��������� � pwiController.add
            // NET-4440 ������� ������ � ������� ��� �� ���������� �����
            // (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
            // generatePlanFuelHistory(planCode, plan.dateStart, true);
            /////

            return planCode;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }



    public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
            int planStateCode, String comment, ENPlanWorkItem[] planItems,
            int netObjectCode)
    {
    	return addForAVRFromCallCenter(ccDamageLogCode, objectName, renCode, ccExecutorCode,
                planStateCode, comment, planItems,
                netObjectCode,
                null,
                null, null,
                null, null,
                null, null, Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE);
    }

    /**
    * ����� ��� �������� ����� �� ��� �� CallCenter'�
    *
    * @param ccDamageLogCode - ��� ������ CallCenter'�
    * @param objectName - ������������ ������� (����) � CallCenter'�
    * @param renCode - ��� ����
    * @param ccExecutorCode - ��� ����������� �� CallCenter'� (���, ������ ��, ������ �� � �.�.)
    * @param planStateCode - ��� ���� (��, ��)
    * @param comment - ����������
    * @param planItems - ������ �����
    * @param netObjectCode - ��� ������� �����
    * @param finExecutor - ����������� �� ��
    * @param masterMolCode - ��� ���� �������
    * @param masterMolName - ������������ ���� �������
    * @param mechanicMolCode - ��� ���� ��������
    * @param mechanicMolName - ������������ ���� ��������
    * @param dateStart - ���� � ����� ��� ������ ���������� (�����)
    * @param dateFinal - ���� � ����� ��� ������ ���������� (�����)
    * @param planReasonCode  - ������� ���������� �������
	 * @param enDepCode - ��� �������������
	 * @param enBudgCode - ��� ����������������
	 * @param enRespCode - ��� ������ ���������������
    * @return ��� ���������� �����
    *
    */
    public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
            int planStateCode, String comment, ENPlanWorkItem[] planItems,
            int netObjectCode, FINExecutor finExecutor,
            String masterMolCode, String masterMolName,
            String mechanicMolCode, String mechanicMolName,
            Date dateStart, Date dateFinal, int planReasonCode, int enDepCode, int enBudgCode, int enRespCode)
    {
        if (ccDamageLogCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ������ � CallCenter'�!");
        }

        if (renCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ���� � CallCenter'�!");
        }

        if (ccExecutorCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ��������� � CallCenter'�!");
        }

        if (objectName == null)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��'��� � CallCenter'�!");
        }

        if (objectName.trim().equals(""))
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��'��� � CallCenter'�!");
        }

        if (comment == null)
        {
            throw new EnergyproSystemException("\n\nNET-4337 ³������ ���� ��䳿 � CallCenter'�!");
        }

        if (comment.trim().equals(""))
        {
            throw new EnergyproSystemException("\n\nNET-4337 ³������ ���� ��䳿 � CallCenter'�!");
        }

        if (finExecutor == null)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ������� ���������!");
        }

        if (finExecutor.axOrgId == null)
        {
            throw new EnergyproSystemException("\n\nNET-4337 �� ��������� ��� �������� ��������� �� MS Dynamics AX!");
        }

		if (enDepCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ϳ������� � CallCenter'�!");
		}

		if (enBudgCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� �������������� � CallCenter'�!");
		}

		if (enRespCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ������ ³������������ � CallCenter'�!");
		}

        try
        {

        	ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
            EPRen2FINExecutorDAO ren2FINExecutorDAO = new EPRen2FINExecutorDAO(connection, userProfile);

            FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);

            int finExecutorCode = finExecutorDAO.add(finExecutor);
            FINExecutor finExecutorObj = finExecutorDAO.getObject(finExecutorCode);

            ENPlanWork object = new ENPlanWork();

            object.departmentRef.code = enDepCode;

            object.finExecutor = finExecutorObj;

            object.budgetRef.code = enBudgCode;
            object.responsibilityRef.code = enRespCode;

            object.commentGen = comment; //"TEST for CallCenter"; // damObj.commentgen;
            object.dateStart = (dateStart == null) ? (new java.util.Date()) : dateStart;
            object.dateFinal = (dateFinal == null) ? (new java.util.Date()) : dateFinal;
            object.yearGen = Tools.getYear(object.dateStart);
            object.monthGen = Tools.getMonth(object.dateStart) + 1;


// ���� ������ ���������� ������ �����, �� ����� ������� ���, � ���� ��� �� �������, �� ����� ��������� �����������
            if (netObjectCode == Integer.MIN_VALUE) {

		            ENCallCenterObject ccObj = new ENCallCenterObject();
		            ccObj.name = "[CC] " + objectName;
		            ccObj.invNumber = "" + ccDamageLogCode;
		            ccObj.element.renRef.code = renCode;

		            ENCallCenterObjectDAO ccObjDAO = new ENCallCenterObjectDAO(connection, userProfile);
		            int ccObjCode = ccObjDAO.add(ccObj);
		            ccObj = ccObjDAO.getObject(ccObjCode);

		            if (ccObj == null)
		            {
		                throw new EnergyproSystemException("\n\nNET-4337 ������� ��� �������� ����������� ��'����!");
		            }

		            if (ccObj.code == Integer.MIN_VALUE)
		            {
		                throw new EnergyproSystemException("\n\nNET-4337 ������� ��� �������� ����������� ��'����!");
		            }

		            if (ccObj.element == null)
		            {
		                throw new EnergyproSystemException("\n\nNET-4337 ������� ��� �������� ����������� ��'����!");
		            }

		            if (ccObj.element.code == Integer.MIN_VALUE)
		            {
		                throw new EnergyproSystemException("\n\nNET-4337 ������� ��� �������� ����������� ��'����!");
		            }

		            object.elementRef.code = ccObj.element.code;

            }
            else
            {
            	object.elementRef.code = netObjectCode;

            	boolean is_OVB_ABON_WORKS_FOR_CALL_CENTER = false;

                if (planItems!=null){
	            	for (int i = 0; i < planItems.length; i++)
	                {
	                    if (planItems[i].kartaRef.code == TKConsts.TKTECHCARD_OVB_ABON_WORKS_FOR_CALL_CENTER)
	                    {
	                    	is_OVB_ABON_WORKS_FOR_CALL_CENTER = true;
	                    	break;
	                    }
	                }

	                if (is_OVB_ABON_WORKS_FOR_CALL_CENTER && planItems.length > 1)
	                {
	                	throw new EnergyproSystemException("\n\nNET-4337 ������ \"�������� ������� ������������������� ��������� �� ������� \"����-������\"\"" +
	                			" �� ���� ����������������� � ������ ��������!");
	                }
                }
                /*
                if (is_OVB_ABON_WORKS_FOR_CALL_CENTER)
                {
                	ENRecordPointBytDAO recordPointBytDAO = new ENRecordPointBytDAO(connection, userProfile);
                	ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
                	recordPointBytFilter.element.code = netObjectCode;
                	ENRecordPointBytShortList recordPointBytList = recordPointBytDAO.getScrollableFilteredListNOSEGR(recordPointBytFilter, null, null, 0, -1, null);

                	if (recordPointBytList.totalCount == 0)
                	{
                		throw new EnergyproSystemException("\n\nNET-4337 �� �������� ����� ��� ����� �����! [elementCode = " + netObjectCode + "]");
                	}

                	if (recordPointBytList.totalCount > 1)
                	{
                		throw new EnergyproSystemException("\n\nNET-4337 �������� ����� ���� ����� �����! [elementCode = " + netObjectCode + "]");
                	}
                }
                */
            }

            Context context = new InitialContext();
            Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();

            // ������� �� ��������� ����� � �������-����!!! (���. ���� ����� ������� ���� ����� ��� ������������)
            object.kind = new ENPlanWorkKind();
            object.kind.code = ENPlanWorkKind.CURRENT;

            object.formRef.code = ENPlanWorkForm.NOPLANNED;
            object.status.code = ENPlanWorkStatus.GOOD;
            object.typeRef.code = ENPlanWorkType.AVR;

            if (planStateCode == Integer.MIN_VALUE)
            {
                object.stateRef.code = ENPlanWorkState.TO;
            }
            else
            {
                object.stateRef.code = planStateCode;
            }


            /////
            //planController.getScrollableFilteredList((ENPlanWorkFilter)object, 0, -1);
            int monthPlanCode = findMonthPlanForAVR(object); //Integer.MIN_VALUE; //findMonthPlanForAVR(object);
            /////

            // int planCode = planController.add(object);

            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);

            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController = pwiHome.create();

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                monthPlanCode = planController.add(object, false, true, true);

                ///// ��������� ���� ��� ����������
                Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

                ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
                ENMOL2PlanWorkController mol2planController = mol2planHome.create();

                ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                mol2planObj.code = Integer.MIN_VALUE;
                mol2planObj.planRef = new ENPlanWorkRef();
                mol2planObj.planRef.code = monthPlanCode;
                mol2planObj.molCode = "0000";
                mol2planObj.molName = "��������� ��� EnergyNet";

                mol2planController.add(mol2planObj);
                /////

                ///��������� Reason, ���� ������
                if (planReasonCode != Integer.MIN_VALUE) {
                	ENPlanWork2PlanWorkReasonDAO p2rDAO = new ENPlanWork2PlanWorkReasonDAO(connection, userProfile);
                	ENPlanWork2PlanWorkReason p2r = new ENPlanWork2PlanWorkReason();
                	p2r.planRef.code = monthPlanCode;
                	p2r.planWorkReasonRef.code = planReasonCode;
                	p2rDAO.add(p2r);
                }
                ///


                if (planItems!=null){
	                ///// ���������� ������ � �������� ����
	                for (int i = 0; i < planItems.length; i++)
	                {
	                    ENPlanWorkItem planItem = new ENPlanWorkItem();
	                    planItem.code = Integer.MIN_VALUE;
	                    planItem.planRef = new ENPlanWorkRef();
	                    planItem.planRef.code = monthPlanCode;
	                    planItem.kartaRef = new TKTechCardRef();
	                    planItem.kartaRef.code = planItems[i].kartaRef.code;
	                    /// 28.01.14 SUPP-11863 ����� ��������
	                    planItem.countGen = planItems[i].countGen; //new BigDecimal(0);
	                    ///
	                    pwiController.add(planItem);
	                }
                }
                /////

                /// 28.01.14 SUPP-11863 ����� ��������
                ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
                ENPlanWorkItemFilter pwiFilter = new ENPlanWorkItemFilter();
                pwiFilter.planRef.code = monthPlanCode;
                int pwiArr[] = pwiDAO.getFilteredCodeArray(pwiFilter, 0, -1);

                for (int i = 0; i < pwiArr.length; i++)
                {
                    ENPlanWorkItem pwi = pwiDAO.getObject(pwiArr[i]);
                    pwi.countGen = new BigDecimal(0);
                    pwiDAO.save(pwi);
                }
                ///

    			///// 26.02.15 ����� ��������� � pwiController.add
    			// NET-4440 ������� ������ � ������� ��� �� ���������� �����
    			// (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
    			// generatePlanFuelHistory(monthPlanCode, object.dateStart, true);
    			/////
            }

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ��������� ̳������� �����!");
            }



            ///// ��������� ���� ��� ����������, ���� ��� ��� ��� ��������� ����� �������� ����

            ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
            ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
            m2pFilter.planRef.code = monthPlanCode;
            ENMOL2PlanWorkShortList m2pList = m2pDAO.getScrollableFilteredList(m2pFilter, 0, -1);

            if (m2pList.totalCount == 0)
            {
	            Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

	            ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
	            ENMOL2PlanWorkController mol2planController = mol2planHome.create();

	            ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
	            mol2planObj.code = Integer.MIN_VALUE;
	            mol2planObj.planRef = new ENPlanWorkRef();
	            mol2planObj.planRef.code = monthPlanCode;
	            mol2planObj.molCode = "0000";
	            mol2planObj.molName = "��������� ��� EnergyNet";

	            mol2planController.add(mol2planObj);
            }

            /////

            int planCode = planController.closePlanWork(monthPlanCode);

            // �������� ����� ���� ����� ���������� �������-�����
            /////
            ENPlanWork plan = planDao.getObject(planCode);
            if (plan == null)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ��������� ��������-�����!");
            }
            plan.dateStart = object.dateStart;
            plan.dateFinal = object.dateFinal;
            plan.yearGen = object.yearGen;
            plan.monthGen = object.monthGen;

            this.save(plan);
            /////

            if (planItems!=null){
            ///// ���������� ������ � �������-���� (�.�. ��� ��� ��� �� ���������� �� ��������� �����)
            	for (int i = 0; i < planItems.length; i++)
	            {
	                planItems[i].code = Integer.MIN_VALUE;
	                planItems[i].planRef = new ENPlanWorkRef();
	                planItems[i].planRef.code = planCode;
	                /// 28.01.14 SUPP-11863
	                //pwiController.add(planItems[i]);
	                pwiController.add(planItems[i], true);
	                ///
	            }
        	}
            /////

            ///// ������� �����-�������
            ENWorkOrder2ENPlanWork wo2plan = new ENWorkOrder2ENPlanWork();
            wo2plan.code = Integer.MIN_VALUE;

            wo2plan.plan = new ENPlanWork();
            wo2plan.plan.code = planCode;

            wo2plan.workOrder = new ENWorkOrder();
            wo2plan.workOrder.code = Integer.MIN_VALUE;
            wo2plan.workOrder.department = new ENDepartment();
            wo2plan.workOrder.department.code = object.departmentRef.code;
            wo2plan.workOrder.dateGen = object.dateStart;
            wo2plan.workOrder.commentGen = "����������� �������� �����-�������� [Call-Center]";

            // �������� ����� �� �����-�������
            if ((masterMolCode == null || masterMolCode.trim().equals("") ||
            	masterMolName == null || masterMolName.trim().equals("") ||
            	mechanicMolCode == null || mechanicMolCode.trim().equals("") ||
            	mechanicMolName == null || mechanicMolCode.trim().equals("")) != true)
             {
            	wo2plan.workOrder.finMolCode = masterMolCode;
                wo2plan.workOrder.finMolName = masterMolName;
                wo2plan.workOrder.finMechanicCode = mechanicMolCode;
                wo2plan.workOrder.finMechanicName = mechanicMolName;
             }

            Object wo2planRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);

            ENWorkOrder2ENPlanWorkControllerHome wo2planHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject.narrow(wo2planRef, ENWorkOrder2ENPlanWorkControllerHome.class);
            ENWorkOrder2ENPlanWorkController wo2planController = wo2planHome.create();

            int wo2planCode = wo2planController.add(wo2plan);
            ENWorkOrder2ENPlanWork wo2planObj = wo2planController.getObject(wo2planCode);

            if (wo2planObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder == null)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder.code == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4337 ������� �� ��� ��������� �����-��������!");
            }


        /// �������� ����������

            Object fmDataRef = context.lookup(FINMolDataController.JNDI_NAME);

            FINMolDataControllerHome fmDataHome = (FINMolDataControllerHome) PortableRemoteObject.narrow(fmDataRef, FINMolDataControllerHome.class);
            FINMolDataController fmDataController = fmDataHome.create();

            if ((masterMolCode == null || masterMolCode.trim().equals("") ||
                	masterMolName == null || masterMolName.trim().equals("")) != true)
                 {
            	  FINMolData fmd = new FINMolData();
            	  fmd.finMolCode = masterMolCode;
            	  fmd.finMolName = masterMolName;
            	  fmd.molTypeRef.code = FINMolType.MASTER;
            	  fmd.workOrder.code = wo2planObj.workOrder.code;
          	      fmDataController.add(fmd, fmd.workOrder.code, 1);
                 }

            if ((mechanicMolCode == null || mechanicMolCode.trim().equals("") ||
                	mechanicMolName == null || mechanicMolCode.trim().equals("")) != true)
                 {
            	  FINMolData fmd = new FINMolData();
            	  fmd.finMolCode = mechanicMolCode;
            	  fmd.finMolName = mechanicMolName;
            	  fmd.molTypeRef.code = FINMolType.MECHANIC;
            	  fmd.workOrder.code = wo2planObj.workOrder.code;
          	      fmDataController.add(fmd, fmd.workOrder.code, 1);
                 }

            /////

            ///// ��������� ������ ���������� �������-����� � ������� �� CallCenter'�
            ENPlanWork2CCDamageLogDAO plan2ccDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLog plan2ccDamageLog = new ENPlanWork2CCDamageLog();
            plan2ccDamageLog.planRef.code = planCode;
            plan2ccDamageLog.ccDamageLogCode = ccDamageLogCode;
            plan2ccDamageLog.typeRef.code = ENPlan2CCDamageLogType.AVR;
            plan2ccDamageLogDAO.add(plan2ccDamageLog);
            /////


       /*     if (dateStart != null && dateFinal != null)
            {
            /// �������� ������ ��� ����������, ��� ����� ��������������� ���������� �� �����
            ENTransportOrderDAO trOrderDAO = new ENTransportOrderDAO(connection, userProfile);
            ENTransportOrderShortList trList = trOrderDAO.getGroupedTransportListByPlanCode(planCode);

            if (trList.totalCount > 0)
            {
                Object trOrderRef = context.lookup(ENTransportOrderController.JNDI_NAME);

                ENTransportOrderControllerHome trOrderHome = (ENTransportOrderControllerHome) PortableRemoteObject.narrow(trOrderRef, ENTransportOrderControllerHome.class);
                ENTransportOrderController trOrderController = trOrderHome.create();

                for (int i=0; trList.totalCount > i; i++)
                {

		            int transportCode = trList.get(i).transportCode;

		            ENTransportItemDAO trItemDAO = new ENTransportItemDAO(connection, userProfile);
		            ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
		            trItemFilter.conditionSQL = " and tr.TRANSPORTCODE in (select tktransport.code " +
					    " from tktransport where tktransport.transportclassifictncd =  " + transportCode + ")" +
						" and p.code = " + planCode +
						" and tr.code not in " +
						" (select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm " +
						" where entrnsprtrdr2trnsprttm.transportordercode in " +
						" (select entransportorder.code from entransportorder " +
						" where entransportorder.transportcode in (select tktransport.code " +
						" from tktransport where tktransport.transportclassifictncd =  " + transportCode + ")" +
						" and entransportorder.planrefcode = " + planCode + "))";

		            ENTransportItemShortList trItemList = trItemDAO.getListDetailedForTravelSheetItem(trItemFilter);

		            Date timeFrom = dateStart;
		            Date dateFrom = dateStart;
		            Date timeTill = dateFinal;
		            Date dateTill = dateFinal;

		            System.out.println("###date###" + dateStart);
		            System.out.println("###date###" + dateFinal);


		            ENTransportItemShort trArr[] = new ENTransportItemShort[trItemList.totalCount];

		            for (int z=0; trItemList.totalCount > z; z++)
		                {
                           trArr[z] = trItemList.get(z);
		                }

		            trOrderController.addTransportOrderWithTransportItems(trArr, timeFrom, dateFrom, timeTill, dateTill, Integer.MIN_VALUE, 0);

                 }

            }

         }   */

            ///// 26.02.15 ����� ��������� � pwiController.add
            // NET-4440 ������� ������ � ������� ��� �� ���������� �����
            // (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
            // generatePlanFuelHistory(planCode, plan.dateStart, true);
            /////

            return planCode;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }


    /**
    * ����� ��� �������� ����� ��� ����������� �� CallCenter'�
    *
    * @param ccDamageLogCode - ��� ������ CallCenter'�
    * @param elementCode - ��� �������� EnergyNet (�.�. ��� �������� ��� ����� ����� - enrecordpointbyt.elementcode)
    * @param renCode - ��� ����
    * @param planTypeCode - ������ �����
    * @param comment - ����������
    * @param planItems - ������ �����
    * @param finExecutor - ����������� �� ��
    * @param enDepCode - ��� �������������
	 * @param enBudgCode - ��� ����������������
	 * @param enRespCode - ��� ������ ���������������
    * @return ��� ���������� �����
    *
    */
    public int addForWorkOrderBytFromCallCenter(int ccDamageLogCode, int elementCode, int renCode, int planTypeCode, String comment, ENPlanWorkItem[] planItems, FINExecutor finExecutor, int enDepCode, int enBudgCode, int enRespCode)
    {
        if (ccDamageLogCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4399 �� ������� ��� ������ � CallCenter'�!");
        }

    	if (elementCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4399 �� ������� ��� ��'���� � CallCenter'�!");
        }

        if (renCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4399 �� ������� ��� ���� � CallCenter'�!");
        }

        if (comment == null)
        {
            throw new EnergyproSystemException("\n\nNET-4399 ³������ ���� ��䳿 � CallCenter'�!");
        }

        if (comment.trim().equals(""))
        {
            throw new EnergyproSystemException("\n\nNET-4399 ³������ ���� ��䳿 � CallCenter'�!");
        }

		if (finExecutor == null)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ���������!");
		}

		if (finExecutor.axOrgId == null)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ��������� ��� �������� ��������� �� MS Dynamics AX!");
		}

		if (enDepCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ϳ������� � CallCenter'�!");
		}

		if (enBudgCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� �������������� � CallCenter'�!");
		}

		if (enRespCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4337 �� ������� ��� ������ ³������������ � CallCenter'�!");
		}

        try
        {
        	ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        	ENRecordPointBytDAO recordPointBytDAO = new ENRecordPointBytDAO(connection, userProfile);
        	ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
        	recordPointBytFilter.element.code = elementCode;
        	ENRecordPointBytShortList recordPointBytList = recordPointBytDAO.getScrollableFilteredListNOSEGR(recordPointBytFilter, null, null, 0, -1, null);

        	if (recordPointBytList.totalCount == 0)
        	{
        		throw new EnergyproSystemException("\n\nNET-4399 �� �������� ����� ��� ����� �����! [elementCode = " + elementCode + "]");
        	}

        	if (recordPointBytList.totalCount > 1)
        	{
        		throw new EnergyproSystemException("\n\nNET-4399 �������� ����� ���� ����� �����! [elementCode = " + elementCode + "]");
        	}

             int finExecutorCode = Integer.MIN_VALUE;

            if (finExecutor != null)
            {
	            if (finExecutor.finCode != Integer.MIN_VALUE || finExecutor.axOrgId != null) {
	            	FINExecutorDAO fexecDAO = new FINExecutorDAO(connection, userProfile);
	            	finExecutorCode = fexecDAO.add(finExecutor);
	            }
            }

            ENPlanWork object = new ENPlanWork();

            object.departmentRef.code = enDepCode;

            FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
            FINExecutor finExecutorObj = finExecutorDAO.getObject(finExecutorCode);

            if (finExecutorObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4399 �� �������� ��������� � ����� " + finExecutorCode + " !");
            }

            object.finExecutor = finExecutorObj;

            object.budgetRef.code = enBudgCode;
            object.responsibilityRef.code = enRespCode;

            object.commentGen = comment; //"TEST for CallCenter"; // damObj.commentgen;
            object.dateStart = new java.util.Date();
            object.dateFinal = new java.util.Date();
            object.yearGen = Tools.getYear(new java.util.Date());
            object.monthGen = Tools.getMonth(new java.util.Date()) + 1;

            object.elementRef.code = elementCode;

            Context context = new InitialContext();
            Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();

            // ������� �� ��������� ����� � �������-����!!! (���. ���� ����� ������� ���� ����� ��� ������������)
            object.kind = new ENPlanWorkKind();
            object.kind.code = ENPlanWorkKind.CURRENT;

            object.formRef.code = ENPlanWorkForm.NOPLANNED;
            object.status.code = ENPlanWorkStatus.GOOD;
            object.stateRef.code = ENPlanWorkState.TO;

            if (planTypeCode == Integer.MIN_VALUE)
            {
            	object.typeRef.code = ENPlanWorkType.EZ_NOT_PLANNED;
            }
            else
            {
                object.typeRef.code = planTypeCode;
            }

            /////
            //planController.getScrollableFilteredList((ENPlanWorkFilter)object, 0, -1);
            int monthPlanCode = Integer.MIN_VALUE; //findMonthPlanForAVR(object);
            /////



            // int planCode = planController.add(object);

            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);

            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController = pwiHome.create();

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                monthPlanCode = planController.add(object, false, true, true);

                ///// ��������� ���� ��� ����������
                Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

                ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
                ENMOL2PlanWorkController mol2planController = mol2planHome.create();

                ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                mol2planObj.code = Integer.MIN_VALUE;
                mol2planObj.planRef = new ENPlanWorkRef();
                mol2planObj.planRef.code = monthPlanCode;
                mol2planObj.molCode = "0000";
                mol2planObj.molName = "��������� ��� EnergyNet";

                mol2planController.add(mol2planObj);
                /////

                ///// ���������� ������ � �������� ����
                for (int i = 0; i < planItems.length; i++)
                {
                    ENPlanWorkItem planItem = new ENPlanWorkItem();
                    planItem.code = Integer.MIN_VALUE;
                    planItem.planRef = new ENPlanWorkRef();
                    planItem.planRef.code = monthPlanCode;
                    planItem.kartaRef = new TKTechCardRef();
                    planItem.kartaRef.code = planItems[i].kartaRef.code;
                    planItem.countGen = planItems[i].countGen;
                    pwiController.add(planItem);
                }
                /////

    			///// 26.02.15 ����� ��������� � pwiController.add
    			// NET-4440 ������� ������ � ������� ��� �� ���������� �����
    			// (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
    			// generatePlanFuelHistory(monthPlanCode, object.dateStart, true);
    			/////
            }

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4399 ������� �� ��� ��������� ̳������� �����!");
            }


            // �������� ����� ���� ����� ���������� ��������� �����
            /////
			ENPlanWork plan = planDao.getObject(monthPlanCode);
			if (plan == null) {
				throw new EnergyproSystemException("\n\n"
						+ "NET-4399 ������� �� ��� ��������� ��������-�����!");
			}

            updatePlanDateStart(plan.code, object.dateStart);

            /**
            plan.dateStart = object.dateStart;
            //plan.dateFinal = object.dateFinal;
            this.save(plan);
			*/
            /////


            /*
            int planCode = planController.closePlanWork(monthPlanCode);

            // �������� ����� ���� ����� ���������� �������-�����
            /////
            ENPlanWork plan = planController.getObject(planCode);
            if (plan == null)
            {
                throw new EnergyproSystemException("\n\nNET-4399 ������� �� ��� ��������� ��������-�����!");
            }
            plan.dateStart = object.dateStart;
            plan.dateFinal = object.dateFinal;
            planController.save(plan);
            /////

            ///// ������� �����-�������
            ENWorkOrder2ENPlanWork wo2plan = new ENWorkOrder2ENPlanWork();
            wo2plan.code = Integer.MIN_VALUE;

            wo2plan.plan = new ENPlanWork();
            wo2plan.plan.code = planCode;

            wo2plan.workOrder = new ENWorkOrder();
            wo2plan.workOrder.code = Integer.MIN_VALUE;
            wo2plan.workOrder.department = new ENDepartment();
            wo2plan.workOrder.department.code = object.departmentRef.code;
            wo2plan.workOrder.dateGen = object.dateStart;
            wo2plan.workOrder.commentGen = "����������� �������� �����-�������� ��� ����������� [Call-Center]";
            //wo2plan.workOrder.finMolCode = masterCode;
            //wo2plan.workOrder.finMolName = masterName;
            //wo2plan.workOrder.finMechanicCode = mechanicCode;
            //wo2plan.workOrder.finMechanicName = mechanicName;

            Object wo2planRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);

            ENWorkOrder2ENPlanWorkControllerHome wo2planHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject.narrow(wo2planRef, ENWorkOrder2ENPlanWorkControllerHome.class);
            ENWorkOrder2ENPlanWorkController wo2planController = wo2planHome.create();

            int wo2planCode = wo2planController.add(wo2plan);
            ENWorkOrder2ENPlanWork wo2planObj = wo2planController.getObject(wo2planCode);

            if (wo2planObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4399 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder == null)
            {
                throw new EnergyproSystemException("\n\nNET-4399 ������� �� ��� ��������� �����-��������!");
            }

            if (wo2planObj.workOrder.code == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4399 ������� �� ��� ��������� �����-��������!");
            }

            /////
            */

            /*
            ///// ��������� ������ ���������� �������-����� � ������� �� CallCenter'�
            ENPlanWork2CCDamageLogDAO plan2ccDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLog plan2ccDamageLog = new ENPlanWork2CCDamageLog();
            plan2ccDamageLog.planRef.code = planCode;
            plan2ccDamageLog.ccDamageLogCode = ccDamageLogCode;
            plan2ccDamageLog.typeRef.code = ENPlan2CCDamageLogType.BYT;
            plan2ccDamageLogDAO.add(plan2ccDamageLog);
            /////
			*/

            ///// ��������� ������ ���������� ��������� ����� � ������� �� CallCenter'�
            ENPlanWork2CCDamageLogDAO plan2ccDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
            ENPlanWork2CCDamageLog plan2ccDamageLog = new ENPlanWork2CCDamageLog();
            plan2ccDamageLog.planRef.code = monthPlanCode;
            plan2ccDamageLog.ccDamageLogCode = ccDamageLogCode;
            plan2ccDamageLog.typeRef.code = ENPlan2CCDamageLogType.BYT;
            plan2ccDamageLogDAO.add(plan2ccDamageLog);
            /////

            ///// 26.02.15 ����� ��������� � pwiController.add
            // NET-4440 ������� ������ � ������� ��� �� ���������� �����
            // (��������� �������� = true, ����� ������������ ������� �� ����� ���������)
            // generatePlanFuelHistory(planCode, plan.dateStart, true);
            /////


            /** 12.02.2018... +++ ��������� ����... */
            planController.closePlanWork(monthPlanCode);


            //return planCode;
            return monthPlanCode;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }



    public boolean checkPriconnectionByServicesObject(int elementCode)
            throws PersistenceException {
        boolean result = false;

        ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement element = elementDAO.getObject(elementCode);
        if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {
            ENServicesObject soObj = soLogic.getServicesObjectByElementCode(elementCode);
            if (soObj.contractTypeRef.code == ENServicesContractType.CONNECTION)
                return true;
        }

        return result;
    }

    /**
     * ������� ����� ���������� � �������� � ������������ �� ����� ������
     * ��� ������������ ������ �� ��������� ������
     * @throws PersistenceException **/
    public BigDecimal getSumByPlanFact(String codesPlans) throws PersistenceException
    {
        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
     ENPlan2HumenDAO p2hDAO = new ENPlan2HumenDAO(connection, userProfile);
     TKReportItem2TechCardDAO r2tDAO = new TKReportItem2TechCardDAO(connection, userProfile);
     ENElementDAO elDAO = new ENElementDAO(connection, userProfile);
     ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(connection, userProfile);
     ENHumenItemDAO hiDAO = new  ENHumenItemDAO(connection, userProfile);
     FINMaterialsDAO fmDAO = new FINMaterialsDAO(connection, userProfile);

     TKReportItem2TechCardFilter r2tFilter = new TKReportItem2TechCardFilter();
     ActLogic actLogic = new ActLogic(connection, userProfile);
     TransportLogic trLogic = new TransportLogic(connection, userProfile);

        ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
        pFilter.conditionSQL = " enplanwork.code in (" + codesPlans+ " ) ";
        ENPlanWorkShortList pList = pDAO.getFilteredListWithOutDomain(pFilter);
        ENElement elObject = elDAO.getObject(pList.get(0).elementRefCode);
        if (elObject.typeRef.code == ENElementType.LINE150){
        r2tFilter.reportitem.code = 500000222;
        } else if
    (elObject.typeRef.code == ENElementType.LINE10){
            r2tFilter.reportitem.code = 500000227;
        }
    else if
    (elObject.typeRef.code == ENElementType.LINE04){
            r2tFilter.reportitem.code = 500000223;
        }

        //  � ����������� �� ���� �������� ��������� �������� � ������� ����� �������� ��������� � �������� ����������
    TKReportItem2TechCardShortList r2tList = r2tDAO.getFilteredList(r2tFilter);
    String TechCardCodes = "";
    for (int r=0; r<r2tList.totalCount; r++){
        if (TechCardCodes.equals(""))
        {TechCardCodes = ""+r2tList.get(r).techCardCode;}
        else
        {TechCardCodes = TechCardCodes + " , " + r2tList.get(r).techCardCode;}
    }

        BigDecimal timeWorkGen = new BigDecimal(0);
        BigDecimal paysworkbonus = new BigDecimal(0); // �������� � ������ ������
        BigDecimal paysworkbonusSoc = new BigDecimal(0); // �������� � ������ ������ + ��� ����������
     BigDecimal paysworkAll = new BigDecimal(0); // �������� �� �����������
     BigDecimal costMaterial = new BigDecimal(0); // ��������� ���������

     for (int i=0; i<pList.totalCount; i++){
        // ������������� ������ ���������� �� ����� ����
        ENPlan2HumenShortList p2hList = p2hDAO.getTabNumberListByPlanSomeTechCard(pList.get(i).code, pList.get(i).departmentRefCode);
        for (int n=0; n < p2hList.totalCount; n++)
            {
            // ����� � �������� �� ���������� �� ���� ����
            // ���� ��������
            if (p2hList.get(n).humenKindRefCode == ENHumenItemKind.DRIVER  ){
                timeWorkGen = actLogic.getTimeGen4DriverByPositionAndSalarySomeTechCard(p2hList.get(n).tabNumber, pList.get(i).code, p2hList.get(n).planRefDateStart, p2hList.get(n).positionCode, p2hList.get(n).priceGen , TechCardCodes);
            }
            // ������������
            if (p2hList.get(n).humenKindRefCode == ENHumenItemKind.ELTEH  ){
                // �������� ������ ���� ����� �� ��� � ��������� ��� ����� �����
                    if ( ! p2hDAO.isPersonHavingMoreThanOneJob(p2hList.get(n).tabNumber, pList.get(i).code) )
                    {
                        BigDecimal delTime = trLogic.calculateTimeForPlanByDistance(pList.get(i).code, 0, false);
                        timeWorkGen = p2hList.get(n).timeWorkGen.add(delTime);

                    }
                }
            // �� ������������ ������� � ������ ������� �������� ��������� ������ ��
            ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
            a2hFilter.tabNumber = p2hList.get(n).tabNumber;
            a2hFilter.humenKindRef.code = p2hList.get(n).humenKindRefCode;
            a2hFilter.conditionSQL = " actrefcode = (select a2p.actrefcode from enact2enplanwork a2p where a2p.plancode = " + pList.get(i).code + " limit 1 ) ";
            int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFilter, 0, -1);
            ENAct2Humen a2hObject = null;
            if (a2hArr.length > 0 ){
                a2hObject = a2hDAO.getObject(a2hArr[0]);
            }
            else throw new EnergyproSystemException(" ���������� ��� ��������� ����!!!");

            paysworkbonus = timeWorkGen.multiply(a2hObject.salaryHoursBonus).setScale(2, BigDecimal.ROUND_HALF_UP);

            // ��������� �� �������� ������ ������ �� ������������'������ �������� ��������� �����������  (�������� �� finworker )
             // ������� ������� ��� ���������� (�� ���������� � ���� ���������  )
            ENHumenItemFilter hiFilter = new ENHumenItemFilter();
            hiFilter.finWorker.tabNumber = p2hList.get(n).tabNumber;
            hiFilter.planRef.code =  pList.get(i).code;
            hiFilter.finWorker.kindRef.code = p2hList.get(n).humenKindRefCode;
            int[] hiArr = hiDAO.getFilteredCodeArray(hiFilter, 0, -1);

            if(hiArr.length == 0 ){
                throw new EnergyproSystemException(" �������!!!");
            }
            ENHumenItem hiObject = hiDAO.getObject(hiArr[0]);

            paysworkbonusSoc = new BigDecimal(0);
            if ( hiObject.finWorker.chargePercent != null && paysworkbonus != null) {
            paysworkbonusSoc =  paysworkbonus.add(paysworkbonus.multiply(hiObject.finWorker.chargePercent).divide(new BigDecimal(100))).setScale(2, BigDecimal.ROUND_HALF_UP);
            }
            paysworkAll = paysworkAll.add(paysworkbonusSoc);





            }
        /// ��������� ��������� �� ����� �� �������� ���������
            FINMaterialsFilter fmFilter = new FINMaterialsFilter();
            fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
            fmFilter.conditionSQL = " finmaterials.code in ( "+
                    "select finmat.code "+
                    " From enestimateitem estimate , finmaterials finmat, enact2enplanwork ena2 , enplanworkitem pi "+
                    " where ena2.plancode = "+ pList.get(i).code +
                    " and ena2.plancode = estimate.planrefcode "+
                    " and finmat.estimateitemrefcode = estimate.code "+
                    " and finmat.statusrefcode = 1 "+
                    " and estimate.kindrefcode in (1,2) "+
                    " and finmat.cost<> 0 "+
                    " and estimate.planitemrefcode = pi.code  " +
                    " and pi.kartarefcode in ( " + TechCardCodes + ") " +
                    " )";

            FINMaterialsShortList fmList = fmDAO.getScrollableFilteredList(fmFilter, 0, -1);
            for (int m=0; m< fmList.totalCount; m++){
                costMaterial = costMaterial.add(fmList.get(m).cost);

            }
     }

        return (paysworkAll.add(costMaterial)).divide(new BigDecimal(1000)).setScale(2, BigDecimal.ROUND_HALF_UP);

    }


    /**
     *  ����������� ����� ��� �������� �� �������������
     *
     *  @param planCode - ��� �����
     *  @param monthGen - ����� �����
     *  @param yearGen - ��� �����
     *  @param soCode - ��� ��������
     *  @param elementCode - ��� ��������
     *
     *  @return newPlanCode - ��� ���������� �����
     *
     */
    public int copyPlanPriconnections(int planCode, int monthGen, int yearGen,
            int soCode, int elementCode) throws PersistenceException {

        int newPlanCode = Integer.MIN_VALUE;
        int oldPlanItemCode = Integer.MIN_VALUE;

        int newTransportItemCode = Integer.MIN_VALUE;
        int oldTransportItemCode = Integer.MIN_VALUE;

        int newEstimateCode = Integer.MIN_VALUE;

        Connection finConn = null;

        try {
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENMarkEstimateDAO meDAO = new ENMarkEstimateDAO(connection, userProfile);
            ENPlanWork oldPlan = planDAO.getObject(planCode);
            ENPlanWork obj = planDAO.getObject(planCode);

            /** �� ����� ���� ������� ����������� ... ���� �� ��� ... */
            FINExecutor finExecutor = obj.finExecutor;

            ENPlanWork newObj = new ENPlanWork();
            newObj = obj;
            newObj.code = Integer.MIN_VALUE;
            newObj.status.code = ENPlanWorkStatus.GOOD;
            newObj.formRef.code = ENPlanWorkForm.NOPLANNED;
            newObj.kind.code = ENPlanWorkKind.CURRENT;
            newObj.yearGen = yearGen;
            newObj.monthGen = monthGen;

            Calendar calendar_ = Calendar.getInstance();
            calendar_.clear(Calendar.HOUR);
            calendar_.clear(Calendar.HOUR_OF_DAY);
            calendar_.clear(Calendar.MINUTE);
            calendar_.clear(Calendar.SECOND);
            calendar_.clear(Calendar.MILLISECOND);
            calendar_.set(newObj.yearGen, newObj.monthGen - 1, 1);
            newObj.dateStart = calendar_.getTime();

            /** �� ������� ���� ��������� ����� �� ����� ������ */
            Calendar calendar_2 = Calendar.getInstance();
            calendar_2.clear(Calendar.HOUR);
            calendar_2.clear(Calendar.HOUR_OF_DAY);
            calendar_2.clear(Calendar.MINUTE);
            calendar_2.clear(Calendar.SECOND);
            calendar_2.clear(Calendar.MILLISECOND);
            calendar_2.set(newObj.yearGen, newObj.monthGen - 1, calendar_.getActualMaximum(Calendar.DAY_OF_MONTH));
            newObj.dateFinal = calendar_2.getTime();

            if (finExecutor != null && finExecutor.code > Integer.MIN_VALUE) {
                newObj.finExecutor.code = new FINExecutorDAO(connection, userProfile).add(finExecutor);
            } else
                newObj.finExecutor.code = Integer.MIN_VALUE;

            newObj.yearOriginal = Integer.MIN_VALUE;
            newObj.monthOriginal = Integer.MIN_VALUE;



            ENServicesObjectDAO soDao = new ENServicesObjectDAO(connection, userProfile);
            ENServicesObject sObject = soDao.getObject(soCode);

            // 25.05.2017 ���� ������� ��� ��������, �� ����� �� ���� ���� ��������� ������ ����� energynet!
            if (sObject.statusRef.code == ENServicesObjectStatus.CLOSED ||
            	sObject.statusRef.code == ENServicesObjectStatus.CLOSED_BY_BUH_SPRAV) {

            	if (! userProfile.userName.toLowerCase().equals("energynet")) {
            		throw new SystemException("\n\n������ ��� ����������!\n" +
            				"��� ��������� ����� ����� �� ��� ��������� �������� ������ ����������!");
            	}
            }

            /** ���������� ��� ����� */
            String planComment = "�" + sObject.contractNumberServices + " �� " +
                    new SimpleDateFormat("dd.MM.yyyy").format(sObject.contractDate) + " �. " +
                    "(" + sObject.contragentName + ")";

            newObj.commentGen = planComment;
            newObj.priConnectionNumber = sObject.contractNumberServices;
            newObj.dateEndPriConnection = null;

            /** ������ ������ ������������ */
            newObj.elementRef.code = elementCode;


            /** ������� ���� */
            Context planCnt = new InitialContext();
            Object planRef = planCnt.lookup(ENPlanWorkController.JNDI_NAME);
            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();
            newObj.code = planController.add(newObj);
            newPlanCode = newObj.code;


            /** ��������� ����� �������� !!! � ���������� ... */
            ENDeliveryTimePlanFilter dtpFilter = new ENDeliveryTimePlanFilter();
            ENDeliveryTimePlanDAO dtpDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
            dtpFilter.planWorkRef.code = planCode;
            int dtpArr[] = dtpDAO.getFilteredCodeArray(dtpFilter, null, null, 0, -1, null);
            for (int i = 0; i < dtpArr.length; i++) {
                ENDeliveryTimePlan dtp = dtpDAO.getObject(dtpArr[i]);
                dtp.planWorkRef.code = newPlanCode;
                dtp.code = Integer.MIN_VALUE;
                dtpDAO.add(dtp);
            }


            /** ��� �� �����  .. ��� ���������� */
            ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);
            ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
            m2pFilter.planRef.code = planCode;
            int arrM2P[] = m2pDAO.getFilteredCodeArray(m2pFilter, null, null, 0, -1, null);
            for (int i = 0; i < arrM2P.length; i++) {
                ENMOL2PlanWork m2p = m2pDAO.getObject(arrM2P[i]);
                m2p.planRef.code = newPlanCode;
                m2p.code = Integer.MIN_VALUE;
                m2pDAO.add(m2p);
            }

            ENPlanWork plan = planDAO.getObject(newPlanCode);

            ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
            ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
            ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
            FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);

            FINWorkerDAO finWorkerFKDAO = null;
            try {
                finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
                FKOSLogic fkOsLogic = new FKOSLogic(finConn, userProfile);
                finWorkerFKDAO = new FINWorkerDAO(finConn, userProfile);

                /** NET-2938 */
                boolean isOS = fkOsLogic.isOS(plan.elementRef.code);
                if (isOS == true) {
                    ElementLogic elLogic = new ElementLogic(connection, userProfile);
                    String invNumber = elLogic.getElementInvNumber(plan.elementRef.code);
                    if (invNumber.length() == 5)
                        invNumber = "0" + invNumber;

                    /**
                     * ���� ������ ����� - �������� ��������, �� �����������
                     * ����������� � ������������
                     */
                    boolean isInService = fkOsLogic.isInService(invNumber);
                    if (!isInService)
                        throw new EnergyproSystemException("\n "
                                + "\n �������� ���� � ���. ������� "
                                + invNumber + " �� �������� � ������������");
                }
            } catch (DatasourceConnectException e) {
                finConn = null;
                finWorkerFKDAO = null;
            }


            ENPlanWorkItem2TKKoefDAO k2DAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
            TKTechCardDAO techCardDAO = new TKTechCardDAO(connection, userProfile);

            TransportLogic transportLogic = new TransportLogic(connection, userProfile);
            EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);
            HumenLogic humenLogic = new HumenLogic(connection, userProfile);

            ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(connection, userProfile);
            ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();
            itemFilter.planRef.code = planCode;
            /** �������� ���������� ������ */
            itemFilter.conditionSQL = " enplanworkitem.countgen > 0 ";

            /** 21.10.2011 18:06 ������������� � �������� ������ ���������� */
            itemFilter.conditionSQL = " tktechcard.code not in (" +
                    " select tc.code from tktechcard as tc, tkclassificationtype as tkcls " +
                    " where tkcls.code = tc.classificationtypecode and tkcls.isnotlicensedactivity = " +
                    TKConsts.ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR + ")";

            ENPlanWorkItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

            for (int i = 0; i < itemList.totalCount; i++) {
                ENPlanWorkItem item = new ENPlanWorkItem();
                ENPlanWorkItem newItem = new ENPlanWorkItem();
                item = itemDAO.getObject(itemList.get(i).code);

                /////
                TKTechCard techCard = techCardDAO.getObject(item.kartaRef.code);
                /////

                oldPlanItemCode = item.code;

                newItem = item;
                item = null;

                newItem.planRef.code = newPlanCode;
                newItem.dateEdit = new Date();
                newItem.userGen = userProfile.userName;

                /////
                // 09.12.2015 ���� �������� ���������� � �������� "�����, �� �� ����� ���������������"
                // ��� ��������� ������� "��������� ������������", �������� ����� ������ � ����� ���� � ������� ���-���!!!
                if (techCard.techcardsource.code == TKTechCardSource.NOT_BE_USED || techCard.isProhibited == TKTechCard.PROHIBITED)
                {
                	newItem.countGen = new BigDecimal(0);

                	// ������� �������
                	if (newItem.commentGen == null)
                	{
                		newItem.commentGen = "";
                	}
                	if (techCard.techcardsource.code == TKTechCardSource.NOT_BE_USED)
                	{
                		newItem.commentGen += "\n[������ ������������� ��������, �.�. �������� ���������� " +
                				"� �������� \"�����, �� �� ����� ���������������\"]";
                	}
                	else if (techCard.isProhibited == TKTechCard.PROHIBITED)
                	{
                		newItem.commentGen += "\n[������ ������������� ��������, �.�. �� �������� " +
                				"���������� ������� \"���������� ���������������\"]";
                	}
                }
                /////

                newItem.code = itemDAO.add(newItem);

                // ��������� ���� ��� ����� ...
                ENPlanWorkItem2TKKoefFilter k2Filter = new ENPlanWorkItem2TKKoefFilter();
                k2Filter.planWorkItemRef.code = oldPlanItemCode;
                int[] k2arr = k2DAO.getFilteredCodeArray(k2Filter, null, null, 0, -1, null);
                for (int k2 = 0; k2 < k2arr.length; k2++) {
                    ENPlanWorkItem2TKKoef kf2 = k2DAO.getObject(k2arr[k2]);
                    kf2.planWorkItemRef.code = newItem.code;
                    k2DAO.add(kf2);
                }

                // ��������� ��������� ..... ���������� � �������, ������������� - ��������� ����
                ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
                estFilter.planItemRef.code = oldPlanItemCode;

                // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
                /* 12.01.2012 +++ ���� ������, �� ���� ���� */

                if (oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                        || oldPlan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                    estFilter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN ("
                            + ENEstimateItemKind.MATERIALS + ", "
                            + ENEstimateItemKind.SERVICES + ")";
                } else {
                    estFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
                }

                int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

                for (int j = 0; j < estArr.length; j++) {
                    ENEstimateItem est = new ENEstimateItem();
                    ENEstimateItem newEst = new ENEstimateItem();
                    est = estDAO.getObject(estArr[j]);
                    newEst = est;
                    newEst.code = Integer.MIN_VALUE;
                    newEst.statusRef.code = ENEstimateItemStatus.PLANNED; // !!! ��������� �� �������� "������������"!!!
                    newEst.planRef.code = newPlanCode;
                    newEst.planItemRef.code = newItem.code;
                    newEst.dateEdit = new Date();
                    newEst.userGen = userProfile.userName;

                    /// �������� �� ������� ��������� � �������� ������
                    estimateLogic.checkInRQOrder(newEst, true);
                    ///

                 // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
                    if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
                    	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
                    }

                    newEstimateCode = estDAO.add(newEst);

                    // �������� �������� ���-��� � ���������...
                    ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
                    meFilter.estimateItem.code = estArr[j];
                    int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
                    for (int me = 0; me < meArr.length; me++) {
                        ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
                        meObj.estimateItem.code = newEstimateCode;
                        meDAO.add(meObj);
                    }
                }

                // ��������� ������ ��� � ���������� ...
                estFilter = new ENEstimateItemFilter();
                estFilter.planItemRef.code = oldPlanItemCode;
                // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
                estFilter.kindRef.code = ENEstimateItemKind.GSM;
                estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null";

                estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

                for (int j = 0; j < estArr.length; j++) {

                    ENEstimateItem est = new ENEstimateItem();
                    ENEstimateItem newEst = new ENEstimateItem();
                    est = estDAO.getObject(estArr[j]);
                    newEst = est;
                    newEst.code = Integer.MIN_VALUE;
                    newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                    newEst.planRef.code = newPlanCode;
                    newEst.planItemRef.code = newItem.code;
                    newEst.dateEdit = new Date();
                    newEst.userGen = userProfile.userName;

                 // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
                    if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
                    	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
                    }

                    newEstimateCode = estDAO.add(newEst);
                }

                // ��������� �������������� (�������� !!!) ��������� ...
                estFilter = new ENEstimateItemFilter();
                estFilter.planItemRef.code = oldPlanItemCode;
                estFilter.kindRef.code = ENEstimateItemKind.UNMOUNT;

                estArr = estDAO.getFilteredCodeArray(estFilter,0,-1);

                for (int j = 0; j < estArr.length; j++) {
                    ENEstimateItem est = new ENEstimateItem();
                    ENEstimateItem newEst = new ENEstimateItem();
                    est = estDAO.getObject(estArr[j]);
                    newEst = est;
                    newEst.code = Integer.MIN_VALUE;
                    newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                    newEst.planRef.code = newPlanCode;
                    newEst.planItemRef.code = newItem.code;
                    newEst.dateEdit = new Date();
                    newEst.userGen = userProfile.userName;
                    newEstimateCode = estDAO.add(newEst);
                }


                // ��������� ����� ...���������� � �������, ������������� - ��������� ����
                ENHumenItemFilter hFilter = new ENHumenItemFilter();
                hFilter.planItemRef.code = oldPlanItemCode;
                ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hFilter, 0, -1);
                if (hList.totalCount == 0) {
                    humenLogic.createHumenItems(newItem.code);
                } else {
                    for (int j = 0; j < hList.totalCount; j++) {
                        ENHumenItem h = new ENHumenItem();
                        ENHumenItem newH = new ENHumenItem();
                        h = hDAO.getObject(hList.get(j).code);
                        newH = h;
                        newH.planRef.code = newPlanCode;
                        newH.planItemRef.code = newItem.code;
                        newH.dateEdit = new Date();
                        newH.userGen = userProfile.userName;

                        FINWorker w = newH.finWorker;
                        if ((w != null)) {
                            if (w.tabNumber != null) {

                                if (finWorkerFKDAO != null) {
                                    FINWorkerFilter ff = new FINWorkerFilter();
                                    ff.tabNumber = w.tabNumber;
                                    FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff, 0, -1, plan.dateStart, true);
                                    if (fList.totalCount > 0) {
                                        w.categor = fList.get(0).categor;
                                        w.departmentCode = fList.get(0).departmentCode;
                                        w.departmentName = fList.get(0).departmentName;
                                        w.finCode = fList.get(0).finCode;
                                        w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
                                        w.name = fList.get(0).name;
                                        w.positionCode = fList.get(0).positionCode;
                                        w.positionName = fList.get(0).positionName;
                                        w.priceGen = fList.get(0).priceGen;
                                        w.tabNumber = fList.get(0).tabNumber;
                                        /////
                                        w.categorId = fList.get(0).categorId;
                                        w.categorName = fList.get(0).categorName;
                                        w.workTimeId = fList.get(0).workTimeId;
                                        /////
                                        // MDAX-441
                                        w.positionId = fList.get(0).positionId;
                                    }
                                }
                                w.code = Integer.MIN_VALUE;
                                newH.finWorker.code = finWorkerDAO.add(w);
                            }
                        }

                        hDAO.add(newH);
                    }
                }


                // ��������� ��������� ...���������� � �������, ������������� - ��������� ����
                ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
                ENTransport2ENEstimateDAO t2eDAO = new ENTransport2ENEstimateDAO(connection, userProfile);

                ENTransportItemFilter tFilter = new ENTransportItemFilter();
                tFilter.planItemRef.code = oldPlanItemCode;

                int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);

                if (tArr.length == 0) {
                    transportLogic.createENTransportItems(newItem.code);
                } else {
                    for (int j = 0; j < tArr.length; j++) {
                        ENTransportItem t = new ENTransportItem();
                        ENTransportItem newT = new ENTransportItem();
                        t = tDAO.getObject(tArr[j]);

                        oldTransportItemCode = tArr[j];
                        newT = t;
                        newT.planRef.code = newPlanCode;
                        newT.planItemRef.code = newItem.code;
                        newT.dateEdit = new Date();
                        newT.userGen = userProfile.userName;

                        // �� ���������� �� �������� � ������� ������ �� ������ ���� ������� ������� ������
                        // (����������, ������ ��� ��� ����� ��������� ��� ����������� �� �������-������/������)
                        newT.numberList = null;

                        // ��������� ����������� ����������� �� ���������
                        FINWorker w = newT.finWorker;
                        if (w != null) {
                            if (w.tabNumber != null) {
                                if (finWorkerFKDAO != null) {
                                    FINWorkerFilter ff = new FINWorkerFilter();
                                    ff.tabNumber = w.tabNumber;
                                    FINWorkerShortList fList = finWorkerFKDAO.getFINWorkerList(ff, 0, -1, plan.dateStart, true);
                                    if (fList.totalCount > 0) {
                                        w.categor = fList.get(0).categor;
                                        w.departmentCode = fList.get(0).departmentCode;
                                        w.departmentName = fList.get(0).departmentName;
                                        w.finCode = fList.get(0).finCode;
                                        w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
                                        w.name = fList.get(0).name;
                                        w.positionCode = fList.get(0).positionCode;
                                        w.positionName = fList.get(0).positionName;
                                        w.priceGen = fList.get(0).priceGen;
                                        w.tabNumber = fList.get(0).tabNumber;
                                        /////
                                        w.categorId = fList.get(0).categorId;
                                        w.categorName = fList.get(0).categorName;
                                        w.workTimeId = fList.get(0).workTimeId;
                                        /////
                                        // MDAX-441
                                        w.positionId = fList.get(0).positionId;
                                    }
                                }
                                w.code = Integer.MIN_VALUE;
                                newT.finWorker.code = finWorkerDAO.add(w);
                            }
                        }

                        // �������� ��������� !!!
                        newTransportItemCode = tDAO.add(newT);
                        /*
                        ������� ��� ������ ��������� � ����� ��������� ���� ����
                        ������ ��� �������� - �� ������   ������ ���� ������ � ��� �
                        ����� ����� "���������" � ����� ������������ ���������� "���������"- ����� ���� �� ����� 0. �� ������ �������
                        �������� ������ ��������� ����� ���� (�� ������������ ��
                        �������� ) � ������� �� ������ ����. ������ ������� ����
                        ������ ����� ���� .
                        */
                        ENPlanWorkDAO objPlanOldDAO = new ENPlanWorkDAO(connection,userProfile);
                        ENPlanWork objPlanOld = objPlanOldDAO.getObject(planCode);

                        if (objPlanOld.kind.code == ENPlanWorkKind.CALCULATION) {
                            ENTransportItemDAO copyTiDAO = new ENTransportItemDAO(connection, userProfile);
                            // ���� ���������� �� ������ ����� � ����� ��������� � ����� ����� ���������
                            ENTransportItemFilter ti1Filter = new ENTransportItemFilter();
                            ti1Filter.planRef.code = planCode;
                            ti1Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti, tktransport tr, tktransportmark trm " +
                                    " where ti.planitemrefcode = " + oldPlanItemCode  +
                                    "  and  ti.transportcode =  tr.code " +
                                    "  and  tr.transporttypecode = " + TKTransportType.BRIGADE +  /*���������*/
                                    "  and  tr.transportmarkcode = trm.code " +
                                    "  and  trm.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/ " limit 1 ) ";
                            ENTransportItemShortList ti1List = copyTiDAO.getScrollableFilteredList(ti1Filter, 0, -1);

                            // ���� ���������� �� ������ ����� � ����� ������ ���������
                            ENTransportItemFilter ti2Filter = new ENTransportItemFilter();
                            ti2Filter.planRef.code = planCode;
                            ti2Filter.conditionSQL = "  entransportitem.code in (select ti.code From entransportitem ti, tktransport tr " +
                                    " where ti.planitemrefcode = " + oldPlanItemCode  +
                                    "  and  ti.transportcode =  tr.code " +
                                    "  and  tr.transporttypecode = " + TKTransportType.AUTOTOWER +  /*���������*/
                                    " ) ";
                            ENTransportItemShortList ti2List = copyTiDAO.getScrollableFilteredList(ti2Filter, 0, -1);

                            // ���� ��������� ���� � ����� ���� �� ��������� �����
                            if (ti1List.totalCount> 0 && ti2List.totalCount == 0) {
                                ENTransportItem tiOldCopy = new ENTransportItem();
                                ENTransportItem tiNewCopy = new ENTransportItem();
                                tiOldCopy = tDAO.getObject(ti1List.get(0).code);

                                tiNewCopy = tiOldCopy;
                                tiNewCopy.planRef.code = newPlanCode;
                                tiNewCopy.planItemRef.code = newItem.code;
                                tiNewCopy.dateEdit = new Date();
                                tiNewCopy.userGen = userProfile.userName;
                                tiNewCopy.tktransportType.code = TKTransportType.AUTOTOWER;

                                // �� ���������� �� �������� � ������� ������ �� ������ ���� ������� ������� ������
                                // (����������, ������ ��� ��� ����� ��������� ��� ����������� �� �������-������/������)
                                tiNewCopy.numberList = null;

                                // ������� ����� ������
                                copyTiDAO.add(tiNewCopy);
                                // ������ ���� �� ��������� ������ � ������ ������� ��������� �� �������� ���� ��� ��������� ����������
                                ENTransportItemFilter brigFilter = new ENTransportItemFilter();
                                brigFilter.planRef.code = newPlanCode;
                                brigFilter.planItemRef.code = newItem.code;
                                brigFilter.tktransportType.code = TKTransportType.BRIGADE;
                                ENTransportItemShortList brigList = copyTiDAO.getScrollableFilteredList(brigFilter, 0, -1);

                                if (brigList.totalCount > 0 ) {
                                    ENTransportItem brigItemObj = copyTiDAO.getObject(brigList.get(0).code);
                                    brigItemObj.countWorkFact = new BigDecimal(0);
                                    copyTiDAO.save(brigItemObj);
                                }
                            }
                        }

                        // ��������� ���������� .... ��� ����� ���������� ..
                        ENDistanceFilter dFilter = new ENDistanceFilter();
                        dFilter.transportItemRef.code = oldTransportItemCode; // ���������� ��� ����� ����������
                        ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter, 0, -1);
                        for (int n = 0; n < dList.totalCount; n++) {
                            ENDistance dist = dDAO.getObject(dList.get(n).code);
                            dist.transportItemRef.code = newTransportItemCode;
                            dist.code = Integer.MIN_VALUE;
                            dDAO.add(dist);
                        }

                        // ���������� ��������
                        // ���������... ��� �������� �������� ��� ��� ����� ����������...
                        // ���� �� �������� � ��������...
                        if (newT.transportReal != null) {
                            if (newT.transportReal.code > Integer.MIN_VALUE) {
                                ENTransport2ENEstimateFilter t2eFilter = new ENTransport2ENEstimateFilter();
                                t2eFilter.transportRef.code = tArr[j];
                                ENTransport2ENEstimateShortList t2eList = t2eDAO.getScrollableFilteredList(t2eFilter, 0, -1);

                                if (t2eList.totalCount > 0) {
                                    for (int n = 0; n < t2eList.totalCount; n++) {
                                        ENEstimateItem gsmE = estDAO.getObject(t2eList.get(n).estimateRefCode);
                                        ENEstimateItem gsmENew = gsmE;
                                        gsmENew.planRef.code = newPlanCode;
                                        gsmENew.planItemRef.code = newItem.code;
                                        newEstimateCode = estDAO.add(gsmENew);

                                        ENTransport2ENEstimate t2eNew = new ENTransport2ENEstimate();
                                        t2eNew.estimateRef.code = newEstimateCode;
                                        t2eNew.transportRef.code = newTransportItemCode;
                                        t2eDAO.add(t2eNew);
                                    }
                                } else {
                                    transportLogic.generateGSMEstimate(newT.code);
                                }
                            }
                        } else {
                            transportLogic.generateNORMGSM(newT.code);
                        }
                    }
                }
            }

            // ��������� ���������... ������� �� ��������� � ������� �����
            ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
            estFilter.planRef.code = planCode;

            ///// 12.04.12 ��� ��� ����� ����� �� ����� - ��� ���, ��� ��������� �� ������� �� ������,
            /////  � � �������� � ������� ������ ��� ��� �� �����
            estFilter.conditionSQL = " planitemrefcode is null and kindrefcode <> " + ENEstimateItemKind.GSM;
            /////

            int[] estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
            for (int i = 0; i < estArr.length; i++) {
                ENEstimateItem est = new ENEstimateItem();
                ENEstimateItem newEst = new ENEstimateItem();
                est = estDAO.getObject(estArr[i]);
                newEst = est;
                newEst.code = Integer.MIN_VALUE;
                newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                newEst.planRef.code = newPlanCode;
                newEst.dateEdit = new Date();
                newEst.userGen = userProfile.userName;

                /// 27.12.10 �������� �� ������� ��������� � �������� ������
                if (oldPlan.kind.code == ENPlanWorkKind.YEAR && newEst.countFact.doubleValue() > 0) {
                    estimateLogic.checkInRQOrder(newEst, true);
                }
                ///

             // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
                if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
                	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
                }

                newEstimateCode = estDAO.add(newEst);

                // �������� �������� ���-��� � ��������� ...
                ENMarkEstimateFilter meFilter = new ENMarkEstimateFilter();
                meFilter.estimateItem.code = estArr[i];
                int[] meArr = meDAO.getFilteredCodeArray(meFilter, 0, -1);
                for (int me=0; me < meArr.length; me++){
                    ENMarkEstimate meObj = meDAO.getObject(meArr[me]);
                    meObj.estimateItem.code = newEstimateCode;
                    meDAO.add(meObj);
                }
            }

            // ��������� ������ ��� � ���������� ...
            estFilter = new ENEstimateItemFilter();
            estFilter.planRef.code = planCode;

            // ������� ������ ��������� ... ��� ���� ��� ... ��������� �����/����� ���������� ...
            estFilter.kindRef.code = ENEstimateItemKind.GSM;
            estFilter.conditionSQL = " enestimateitem.countgen = 0 and enestimateitem.commentgen is null and enestimateitem.planitemrefcode is null";
            estArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);

            for (int j = 0; j < estArr.length; j++) {
                ENEstimateItem est = new ENEstimateItem();
                ENEstimateItem newEst = new ENEstimateItem();
                est = estDAO.getObject(estArr[j]);
                newEst = est;
                newEst.code = Integer.MIN_VALUE;
                newEst.statusRef.code = ENEstimateItemStatus.PLANNED; //!!! ��������� �� �������� "������������" !!!
                newEst.planRef.code = newPlanCode;
                newEst.dateEdit = new Date();
                newEst.userGen = userProfile.userName;

             // NET-4529 - ��� ����������� � ��������� ��������� ������ �� ������ ����� �������
                if (oldPlan.kind.code == ENPlanWorkKind.CURRENT && newEst.purchaseItemRef.code != Integer.MIN_VALUE ){
                	newEst.purchaseItemRef.code = Integer.MIN_VALUE ;
                }

                newEstimateCode = estDAO.add(newEst);
            }

            transportLogic.createDeliveryTimeForPlan(newPlanCode);
            humenLogic.createDeliveryTime(newPlanCode);

            ///////////////// 29.08.12 NET-2800
            // ��� ����������� ����� ���� ������ ���� ������������ ������ ����� ��, ��� � �����
            FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
            FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
            finExecutor2PlanFilter.planRef.code = plan.code;
            int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

            for (int i = 0; i < finExecutor2PlanArr.length; i++) {
                FINExecutor2Plan finExecutor2Plan = finExecutor2PlanDAO.getObject(finExecutor2PlanArr[i]);
                finExecutor2Plan.dateStart = plan.dateStart;
                finExecutor2PlanDAO.save(finExecutor2Plan);
            }
            ////////////////

            // ��� ����, ����� �����
            if (plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
                    && plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                // 24.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
                recalcTotalTime(newPlanCode);
            }


            /** ����� ����� � ��������� */
            TechConditionsLogic tcLogic = new TechConditionsLogic(connection, userProfile);
            int tcsCode = tcLogic.getTechCodeBySoCode(soCode);

            if (tcsCode != Integer.MIN_VALUE) {

            	TechConditionsLogic techConditionsLogic = new TechConditionsLogic(connection, userProfile);
                techConditionsLogic.checkActIncone(tcsCode);

                ENTechCond2PlanWorkDAO tc2planDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
                ENTechCond2PlanWork tc2plan = new ENTechCond2PlanWork();
                /// �������� �� ��������� ����� � ��������� ���������
				ENTechCond2PlanWorkDAO ty2plDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);
				ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(connection, userProfile);
				ENTechCond2PlanWorkFilter tc2planFilter = new ENTechCond2PlanWorkFilter();
				tc2planFilter.planRef.code = planCode;
				tc2planFilter.conditionSQL = " techconservicesrefcode <> " + tcsCode;
				int[] tc2plArr = ty2plDAO.getFilteredCodeArray(tc2planFilter,0,-1);
				if (tc2plArr.length > 0) {
					ENTechCond2PlanWork tc2pl = ty2plDAO.getObject(tc2plArr[0]);
					throw new SystemException("��� ���� ��� ��������������� � ������� - " +
							soDao.getObjectByTechConditionsServices(techCondDao.getObject(tc2pl.techConServicesRef.code)).contractNumberServices);
				}
				///
                tc2plan.planRef.code = newPlanCode;
                tc2plan.techConServicesRef.code = tcsCode;
                tc2planDAO.add(tc2plan);
            } else {
                throw new EnergyproSystemException("\n " +
                        "\n ������� ��� ��������� ��������!!! ��� ������� ��� ��������� = " + soCode + "...");
            }

            /////
            // NET-4440 ������� ������ � ������� ��� �� ���������� �����
            // (��������� �������� = true, ����� ������������ ������� �� ����� ���������,
            // ������ ��� ��� ����� ���� ��������� ��� ������� generateGSMEstimate � generateNORMGSM,
            // �� �� ��� ���� estimateitem'�� � ����� "���")
            generatePlanFuelHistory(newPlanCode, plan.dateStart, true);
            /////

            return newPlanCode;

        }

        catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            try {
                if (finConn != null && !finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

    /**
     *  ���������� ���� �� ���� ���������
     *  @param eCode - ��� ���������
     */
    public ENPlanWork getPlanCodeByEstimateItemCode(int eCode)
            throws PersistenceException {
        ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);

        int planCode  = estimateDao.getObjectNoSegr(eCode).planRef.code;
        return planDao.getObjectNOSEGR(planCode);
    }


    public void saveAddInfoExecutorDepartment(ENPlanWork object) throws PersistenceException
    {
            //try
            //{

                if (( object.kind.code == ENPlanWorkKind.YEAR ) || (object.kind.code == ENPlanWorkKind.FACT)) {
                    throw new EnergyproSystemException("��� �������� �������� ������ �� �������� � ���������� ������!");
                }


                AuthLogic l = new AuthLogic(connection, userProfile);
                if ( ! l.checkPermission4PlanItems(object.code) ){
                    throw new EnergyproSystemException("Access denied for method addBy... from method ENPlanWork.save()");
                }

            object.setDomain_info(null);

            ENPlanWorkDAO objectDAO = new ENPlanWorkDAO(connection, userProfile);

            if (object.finExecutor != null){

                FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
                FINExecutor f = null;
                if (object.finExecutor.finCode > Integer.MIN_VALUE || object.finExecutor.axOrgId != null)
                {
                    if (object.finExecutor.code > Integer.MIN_VALUE)
                        f = d.getObject(object.finExecutor.code);
                    else
                    {
                        f = new FINExecutor();
                        f.code = Integer.MIN_VALUE;
                    }

                    f.finCode = object.finExecutor.finCode;
                    f.name =  object.finExecutor.name;
                    f.finCehCode = object.finExecutor.finCehCode;
                    f.finCehName = object.finExecutor.finCehName;
                    f.finKindCode = object.finExecutor.finKindCode;
                    f.finKindName = object.finExecutor.finKindName;
                    f.finTypeCode = object.finExecutor.finTypeCode;
                    f.finTypeName = object.finExecutor.finTypeName;
                    ///// MDAX-441
                    f.axOrgId = object.finExecutor.axOrgId;
                    f.axParentOrgId = object.finExecutor.axParentOrgId;
                    f.axParentOrgName = object.finExecutor.axParentOrgName;
                    f.axOrgTypeId = object.finExecutor.axOrgTypeId;
                    f.axOrgTypeName = object.finExecutor.axOrgTypeName;
                    /////
                    f.code = Integer.MIN_VALUE;
                    object.finExecutor.code = d.add(f);

                    ////////////////////////////////////////
                    // NET-2800 �������� ��������� ����������� �� ����� (��� �������) - � �������� FINExecutor2Plan
                    updatePrimaryFinExecutor(object);
                    ////////////////////////////////////////
                }

            }

            // ������� ����������� � ������������� ����������� �� ���� ����������� ������ ������� ���� ������� � ������� ������
            ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(connection, userProfile);
            ENActDAO aDAO = new ENActDAO(connection, userProfile);
            ENPlanWork newplObj = null;

            String codesPlanChild = getCodesHistoryUp2(object.code);
            ENPlanWorkFilter plFiltr = new ENPlanWorkFilter();
            plFiltr.conditionSQL = " ENPLANWORK.CODE in (  " + codesPlanChild + ")" ;

            int[] plArr = objectDAO.getFilteredCodeArray(plFiltr, 0, -1);
            for (int i = 0; i < plArr.length; i++){
                newplObj = objectDAO.getObject(plArr[i]);
                if (newplObj.kind.code == ENPlanWorkKind.FACT) {
                    // ���� ���� ��� �� �� ��������� ����������� � ������������� \
                    ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
                    a2pFilter.plan.code = newplObj.code;
                    int[] a2pArr  =a2pDAO.getFilteredCodeArray(a2pFilter, null, null, 0, -1, null);
                    if (a2pArr.length > 0 ) {
                        ENAct2ENPlanWork a2pObj = a2pDAO.getObject(a2pArr[0]);

                        ENAct aObj = aDAO.getObject(a2pObj.actRef.code);
                        throw new EnergyproSystemException("����� ��`���� � ����� " + aObj.numberGen + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(aObj.dateAct) + " ������ ��������� �� ������ ���������  ...");
                    }


                }

                // ��������� ������������ � ������������� �� �������� ���� ������
                if (object.finExecutor != null && object.code != newplObj.code){

                    FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
                    FINExecutor f = null;
                    if (newplObj.finExecutor.finCode > Integer.MIN_VALUE || newplObj.finExecutor.axOrgId != null)
                    {
                        if (newplObj.finExecutor.code > Integer.MIN_VALUE)
                            f = d.getObject(newplObj.finExecutor.code);
                        else
                        {
                            f = new FINExecutor();
                            f.code = Integer.MIN_VALUE;
                        }

                        f.finCode = object.finExecutor.finCode;
                        f.name =  object.finExecutor.name;
                        f.finCehCode = object.finExecutor.finCehCode;
                        f.finCehName = object.finExecutor.finCehName;
                        f.finKindCode = object.finExecutor.finKindCode;
                        f.finKindName = object.finExecutor.finKindName;
                        f.finTypeCode = object.finExecutor.finTypeCode;
                        f.finTypeName = object.finExecutor.finTypeName;
                        ///// MDAX-441
                        f.axOrgId = object.finExecutor.axOrgId;
                        f.axParentOrgId = object.finExecutor.axParentOrgId;
                        f.axParentOrgName = object.finExecutor.axParentOrgName;
                        f.axOrgTypeId = object.finExecutor.axOrgTypeId;
                        f.axOrgTypeName = object.finExecutor.axOrgTypeName;
                        /////
                        f.code = Integer.MIN_VALUE;
                        newplObj.finExecutor.code = d.add(f);
                    }
                }

                // ����� ���������� ����������� �� �������� ������
                // ������������ �������� ���� �����
                if ( object.code != newplObj.code && newplObj != null ) {
                    newplObj.departmentRef.code = object.departmentRef.code;
                    ///// 12.03.14 ����� �� ���� optimistic locking'�� (����� ���������� ��� ���������� �.-����� �� ���),
                    //    �������� ����� ����� ��������� �� ����� save
                    //newplObj.setDomain_info(null);
                    //objectDAO.save(newplObj);
                    objectDAO.updateFinExecutorAndDepartment(newplObj.code, newplObj.finExecutor.code, newplObj.departmentRef.code);
                    /////
                }
            }


            ENPlanWork plan = objectDAO.getObjectNOSEGR(object.code);

            objectDAO.save(object);


            if (!object.dateStart.equals(plan.dateStart))
            {
            	///// NET-4440 ��� ��������� ���� ����� ��������� ������� ��� �� ����� �����
            	PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
            	planLogic.generatePlanFuelHistory(object.code, object.dateStart);
            	/////
            }

            //}
            //catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWork%} object.",e);}
            //catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
            //finally                              {closeConnection();}
    }

    /**
    * ����� ��� �����������, ������ �� ���� �� CallCenter'� (�������� ������ ��� �������-������!!!)
    *
    * @param planCode - ��� �����
    *
    * @return true - ���� �� CallCenter'�, false - ���
    *
    */
    public boolean isPlanFromCallCenter(int planCode) throws PersistenceException
    {
        ENPlanWork2CCDamageLogDAO plan2CCDamageLogDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
        ENPlanWork2CCDamageLogFilter plan2CCDamageLogFilter = new ENPlanWork2CCDamageLogFilter();
        plan2CCDamageLogFilter.planRef.code = planCode;
        plan2CCDamageLogFilter.conditionSQL = " enplanwork2ccdamagelog.newspapername is null and " +
                                              " enplanwork2ccdamagelog.datebegin is null ";
        int[] plan2CCDamageLogArr = plan2CCDamageLogDAO.getFilteredCodeArray(plan2CCDamageLogFilter, 0, -1);

        // ���� ���� ������ �� CallCenter'�
        if (plan2CCDamageLogArr.length > 0)
        {
            return true;
        }

        return false;
    }

    public void removeENCallCenterObjectByElementCode(int elementCode) throws PersistenceException
    {
        ENCallCenterObjectDAO ccObjDAO = null;
        Connection netObjectsConn = null;
        try {
            //netObjectsConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            netObjectsConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ccObjDAO = new ENCallCenterObjectDAO(netObjectsConn, userProfile);
        } catch (DatasourceConnectException e) {
            netObjectsConn = null;
            ccObjDAO = null;
            throw new EnergyproSystemException(
                    "Error in getConnection (netObjectsConn)!", e);
        }

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = elementCode;

        int[] planArr = planDAO.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);

        // ���� �� ������ ��� ������, ������� ���
        if (planArr.length == 0)
        {
            ENCallCenterObjectFilter ccObjFilter = new ENCallCenterObjectFilter();
            ccObjFilter.element.code = elementCode;

            int[] ccObjArr = ccObjDAO.getFilteredCodeArray(ccObjFilter, 0, -1);

            for (int j = 0; j < ccObjArr.length; j++)
            {
                ccObjDAO.remove(ccObjArr[j]);
            }
        }
    }


	public boolean checkModelProjectWorks(int planCode) {
		boolean isModelProject = false;
		try {
			TKTechCardDAO techCardDao = new TKTechCardDAO(connection, userProfile);
			TKTechCardFilter tkFilter = new TKTechCardFilter();
			tkFilter.conditionSQL = " tktechcard.techcardsourcecode = " + TKConsts.TKCARD_SOURCE_MODELPROJECT
					+ " and tktechcard.code in (select pi.kartarefcode "
					+ " from enplanworkitem pi where pi.planrefcode = " + planCode + ")";
			int tkArr[] = techCardDao.getFilteredCodeArray(tkFilter, 0, -1);

			if (tkArr.length > 0) {
				AuthLogic authLogic = new AuthLogic(connection, userProfile);
				if (!authLogic.checkPermissionSilent("ksoe/energynet/ENPlanWorkController", "closePlanByModelProject")) {
					 throw new SystemException("\n\n" +
			                    "��� ������������ ����� �� ����� ������� ��������� � ������!!!");
				}
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return isModelProject;
	}

/** ��������� ����� �� ������� ������� "������ ����������� � ����������� ������������"
 *  ���� �� ������������� ������������� ��������, �� false, ����� true
 * @param plan
 * @return
 */
	public boolean checkPlanForSetCauseDisconnection(ENPlanWork plan) {

		try {

		ENElement e = new ENElementDAO(connection,userProfile).getObject(plan.elementRef.code, false);

		boolean result = false;

		if (// ����� ����� ������ ����������� ����������������� (��������, ��������,
			// �����������, ���������������, ����������, �������, ��������������� � ������������
			// � ��� - ��� ���������)
			(plan.budgetRef.code == ENConsts.ENBUDGET_IZOLATION ||
			plan.budgetRef.code == ENConsts.ENBUDGET_OKS ||
			plan.budgetRef.code == ENConsts.ENBUDGET_VRTU ||
			plan.budgetRef.code == ENConsts.ENBUDGET_SVES ||
			plan.budgetRef.code == ENConsts.ENBUDGET_SKEM ||
			plan.budgetRef.code == ENConsts.ENBUDGET_RZA ||
			plan.budgetRef.code == ENConsts.ENBUDGET_SPS ||
			plan.budgetRef.code == ENConsts.ENBUDGET_SRS ||
			plan.budgetRef.code == ENConsts.ENBUDGET_SDTU ||
			plan.budgetRef.code == ENConsts.ENBUDGET_ODG )  &&
			// ���������� ���� �������� - ����� (0.4, 10, 35-150), ���������� (0.4-6-10, 35-150),
			// ������� ����������, �������������� � ��������
			(e.typeRef.code == ENElementType.LINE04 ||
			 e.typeRef.code == ENElementType.LINE10 ||
			 e.typeRef.code == ENElementType.SUBSTATION04 ||
			 e.typeRef.code == ENElementType.SUBSTATION150 ||
			 e.typeRef.code == ENElementType.LINE150 ||
			 e.typeRef.code == ENElementType.LINE_CABLE ||
			 e.typeRef.code == ENElementType.RZA ||
			 e.typeRef.code == ENElementType.SDTU ||
			 e.typeRef.code == ENElementType.ISOLATION) &&
			 // ���� ������ - ��������, �����������, ���������������, ����������, ��������� �����, ����������, ���
			 (plan.typeRef.code == ENPlanWorkType.PLANOVIE ||
			  plan.typeRef.code == ENPlanWorkType.PREDPISANIE ||
			  plan.typeRef.code == ENPlanWorkType.INVEST ||
			  plan.typeRef.code == ENPlanWorkType.PRIEDNANNY ||
			  plan.typeRef.code == ENPlanWorkType.WORK_IN_OUT ||
			  plan.typeRef.code == ENPlanWorkType.RESORE_CABLE_LINE ||
			  plan.typeRef.code == ENPlanWorkType.NOT_PLANED ||
			  plan.typeRef.code == ENPlanWorkType.AVR)
			 ) {
           result = true;
		}
return result;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/** ���������� ��� ��������� ����� �� ���� ������ �����
	 * @param plancode
	 * @return plancode
	 */
	public int getMonthPlanCodeByAnyPlanCode(int plancode) {
		return this.getMonthPlanCodeByAnyPlanCode(plancode, true);
	}

	/** ���������� ��� ��������� ����� �� ���� ������ �����
	 * @param plancode
	 * @param isThrowException ��������� �� ����������, ���� false �� ����� ������ {@code Integer.MIN_VALUE}
	 * @return plancode
	 */

	public int getMonthPlanCodeByAnyPlanCode(int plancode, boolean isThrowException) {
		try {
			ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = pDAO.getObject(plancode);

			/** SUPP-20890... +++  � ������� �� ������ ���� ������ :) */
			if (plan.kind.code == ENPlanWorkKind.CURRENT) {
				return plan.code;
			}

			// SUPP-40280 � ���� ���� ������� ��������, ��������� ������ �� �����!
			if (plan.kind.code == ENPlanWorkKind.YEAR && plan.status.code == ENPlanWorkStatus.GOOD) {
				return -1; // Integer.MIN_VALUE ������, �.�. ������ ��������� �� ����� ���� � ������ ������ ��� �����!!
			}

			ENPlanWorkFilter pFil = new ENPlanWorkFilter();
			pFil.kind.code = ENPlanWorkKind.CURRENT;
			pFil.conditionSQL = " enplanwork.code in " +
					" ( " +
					" select pcp.planoldrefcode from enplancorrecthistory pcf, enplancorrecthistory pcp " +
					"  where pcf.plannewrefcode = " + plancode +
					"    and pcf.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"    and pcf.planoldrefcode = pcp.plannewrefcode " +
					"    and pcp.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
					" union " +
					" select pcp.planoldrefcode from enplancorrecthistory pcp " +
					"  where pcp.plannewrefcode = " + plancode +
					"	 and pcp.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
					/// 19.10.15 � ���� � ��� ���� �������??? ����� ��� ���:
					" union " +
					" select pcp.plannewrefcode from enplancorrecthistory pcp " +
					"  where pcp.planoldrefcode = " + plancode +
					"	 and pcp.reasoncode = " + ENPlanCorrectReason.MOVE_TO_CURRENT +
					///
					" union " +
					" select pc.plannewrefcode from enplancorrecthistory pc " +
					"  where pc.plannewrefcode = " + plancode +
					"	 and pc.reasoncode in (" + ENPlanCorrectReason.MOVE_TO_CURRENT + ", " +
						ENPlanCorrectReason.NO_YEAR + ", " + ENPlanCorrectReason.MOVE_TO_CONFIRM + "))";

			int[] pArr  =  pDAO.getFilteredCodeArrayNOSEGR(pFil, 0, -1);

			if( pArr.length > 1 || pArr.length == 0) {
				System.out.println("############## plancode = " + plancode);
				if(!isThrowException) {
					return Integer.MIN_VALUE;
				} else {
					throw new SystemException("\n\n" +
		                    "�������� ���� �� ���������!");
				}

			}

			return pArr[0];

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}



	}

	/**
	 *  ���������� ���� ������� ���� �� ��������� �����
	 * */
	public int[] getNPZFactByMonthPlan(int codeMonthPlan) {
		try {
			ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkFilter pFil = new ENPlanWorkFilter();
			pFil.kind.code = ENPlanWorkKind.CURRENT;
			pFil.conditionSQL = " enplanwork.code in " +
					" ( " +
					" select pcf.plannewrefcode from enplancorrecthistory pcp, enplancorrecthistory pcf " +
					" where pcp.planoldrefcode =  " + codeMonthPlan +
					" and pcp.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
					" and pcp.plannewrefcode = pcf.planoldrefcode " +
					" and pcf.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"		) ";
			int[] pArr  =  pDAO.getFilteredCodeArray(pFil, 0, -1);

			return pArr;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}



	}

	/**
	 * ����� ���������� ��� ������ ��������������� �� ���� ����������������
	 *
	 * @param budgetCode - ��� ����������������
	 * @return ��� ������ ���������������
	 */
	public int getResponsibilityByBudgetCode(int budgetCode)
	{
		for (int i = 0; i < ENConsts.ENBUDGET_2_RESPONSIBILITIES.length; i++)
		{
			if (ENConsts.ENBUDGET_2_RESPONSIBILITIES[i][0] == budgetCode)
			{
				return ENConsts.ENBUDGET_2_RESPONSIBILITIES[i][1];
			}
		}

		throw new EnergyproSystemException("\n\n��� ��������� �������������� �� ������� ��������� ����� �������������! budgetCode = " + budgetCode);
	}

	/**
	 * ����������� ������� (ENPurchasesNoObject) ��� ��������������� �������� ������ �� ���������� ���
	 *
	 * @param budgetCode - ��� ����������������
	 *
	 * @return ��� �������� ��� ���������������� �������
	 */
	public int getElementCodeForAVZByBudgetCode(int budgetCode, int rest_purpose_type_id)
	{
		try
		{
			if(rest_purpose_type_id == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("�� ������� ��� �������!");
			}
			if(budgetCode == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("�� ������� �������������!");
			}

			int purchasesNoObjectType;
			String purchasesNoObjectTypeName;
			switch(rest_purpose_type_id) {
			case RQConsts.REST_PURPOSE_TYPE_ID_AVAR:
				purchasesNoObjectType = ENPurchasesNoObjectType.AVZ;
				purchasesNoObjectTypeName = "���";
				break;
			case RQConsts.REST_PURPOSE_TYPE_ID_PVZ:
				purchasesNoObjectType = ENPurchasesNoObjectType.RESTOCKING;
				purchasesNoObjectTypeName = "���";
				break;
			case RQConsts.REST_PURPOSE_TYPE_ID_AVR16:
				purchasesNoObjectType = ENPurchasesNoObjectType.AVR16;
				purchasesNoObjectTypeName = "���16";
				break;
				default:
					throw new SystemException(String.format("��������� ��������� ��'��� ���������� ����� ��� ���� ������� � ����� %d"
							, rest_purpose_type_id));
			}

			ENPurchasesNoObjectFilter pnoFilter = new ENPurchasesNoObjectFilter();
			pnoFilter.typeRef.code = purchasesNoObjectType;
			pnoFilter.budget.code = budgetCode;

			ENPurchasesNoObjectDAO pnoDAO = new ENPurchasesNoObjectDAO(connection, userProfile);
			ENPurchasesNoObjectShortList pnoList = pnoDAO.getScrollableFilteredList(pnoFilter, 0, -1);

			if (pnoList.totalCount == 0) {
				throw new EnergyproSystemException(String.format("\n\nNET-4401 ��� �������������� � ����� " + budgetCode +
						" �� �������� ��'��� ��� ���������� ����� %s!", purchasesNoObjectTypeName));
			}

			if (pnoList.totalCount > 1) {
				throw new EnergyproSystemException(String.format("\n\nNET-4401 ��� �������������� � ����� " + budgetCode +
						" �������� ������� (" + pnoList.totalCount + ") ��'���� ��� ���������� ����� %s!", purchasesNoObjectTypeName));
			}

			if (pnoList.get(0).elementCode == Integer.MIN_VALUE) {
				throw new EnergyproSystemException(String.format("\n\nNET-4401 ��� �������������� � ����� " + budgetCode +
						" �� �������� ��'��� ��� ���������� ����� %s! [elementCode is null]", purchasesNoObjectTypeName));
			}

			return pnoList.get(0).elementCode;
		}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
	}


	/**
	 * ����������� ������� ��� ��������������� �������� ������ �� ������������
	 *
	 * @param estimateItem - �������� �� �����, ������� ����� ���������������
	 *
	 * @return ��� �������� ��� ���������������� �������
	 */
	public int getElementCodeForProduction(ENEstimateItem estimateItem)
	{
		try
		{
			ENElement2TKMaterialsFilter e2mFilter = new ENElement2TKMaterialsFilter();
			e2mFilter.typeRef.code = ENElement2TKMaterialsType.OWN_PRODUCTION;
			e2mFilter.materialRef.code = estimateItem.materialRef.code;

			ENElement2TKMaterialsDAO e2mDAO = new ENElement2TKMaterialsDAO(connection, userProfile);
			ENElement2TKMaterialsShortList e2mList = e2mDAO.getScrollableFilteredList(e2mFilter, 0, -1);

			if (e2mList.totalCount == 0)
			{
				throw new EnergyproSystemException("\n\nNET-4415 ��� �������� � ����� " + estimateItem.materialRef.code +
						" �� �������� ��'��� ��� ������������!");
			}

			if (e2mList.totalCount > 1)
			{
				throw new EnergyproSystemException("\n\nNET-4415 ��� �������� � ����� " + estimateItem.materialRef.code +
						" �������� ������� (" + e2mList.totalCount + ") ��'���� ��� ������������!");
			}

			if (e2mList.get(0).elementRefCode == Integer.MIN_VALUE)
			{
				throw new EnergyproSystemException("\n\nNET-4415 ��� �������� � ����� " + estimateItem.materialRef.code +
						" �� �������� ��'��� ��� ������������! [elementCode is null]");
			}

			return e2mList.get(0).elementRefCode;
		}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
	}


	/**
	 * ����� ��� ��������������� �������� ����� �� ���������� ��� ��� ���������� ������ �� ����� ���������� �� ���
	 *
	 * @param fkOrder - ��� ������
	 * @param budgetCode - ��� ����������������
	 *
	 * @return ��� ��������� �����
	 */
    public int createPlanForAVZByRQFKOrder(RQFKOrder fkOrder, int budgetCode)
    {
        if (fkOrder == null)
        {
            throw new EnergyproSystemException("\n\nNET-4401 �� ������� ����� �� ��������� �������� � ��������� ������!");
        }

        if (fkOrder.code == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4401 �� ������� ����� �� ��������� �������� � ��������� ������!");
        }

        if (fkOrder.kind.code != RQFKOrderKind.AVAR_OUT)
        {
            throw new EnergyproSystemException("\n\nNET-4401 �� �������� ���������� ����� ��� ������ �� ��������� �������� � ��������� ������!");
        }

        try
        {
        	//****************************************************************************
            EPRen2FINExecutorDAO ren2FINExecutorDAO = new EPRen2FINExecutorDAO(connection, userProfile);
            EPRen2FINExecutorFilter ren2FINExecutorFilter = new EPRen2FINExecutorFilter();
            ren2FINExecutorFilter.departmentRef.code = fkOrder.department.code;

            EPRen2FINExecutorShortList ren2FINExecutorList = ren2FINExecutorDAO.getScrollableFilteredList(ren2FINExecutorFilter, 0, -1);

            if (ren2FINExecutorList.totalCount == 0)
            {
                throw new EnergyproSystemException("\n\nNET-4401 �� �������� ����� ��� �������� ������! ��� ��������: " + fkOrder.department.code +
                		", ��� ������: " + fkOrder.code);
            }

            if (ren2FINExecutorList.totalCount > 1)
            {
                throw new EnergyproSystemException("\n\nNET-4401 ������� �� ��� ������ ����� ��� �������� ������! ��� ��������: " + fkOrder.department.code +
                		", ��� ������: " + fkOrder.code);
            }

            int finExecutorCode = ren2FINExecutorList.get(0).finExecutorRefCode;
            if (finExecutorCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4401 �� �������� ����� ��� ���������� ��� ��������� ��������! ��� ��������: " + fkOrder.department.code +
                		", ��� ������: " + fkOrder.code);
            }

            ENPlanWork plan = new ENPlanWork();

            plan.departmentRef.code = ren2FINExecutorList.get(0).departmentRefCode;

        	FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
            FINExecutor finExecutorObj = finExecutorDAO.getObject(finExecutorCode);

            if (finExecutorObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4401 �� �������� ��������� � ����� " + ren2FINExecutorList.get(0).finExecutorRefCode + " !");
            }

            plan.finExecutor = finExecutorObj;

            plan.budgetRef.code = budgetCode;
            plan.responsibilityRef.code = getResponsibilityByBudgetCode(budgetCode);

            plan.commentGen = "����������� ��������� ���� �� ���������� ��� ����� ������ �� ��������� �������� � ��� �" + fkOrder.numberDoc +
            		" �� " + new SimpleDateFormat("dd.MM.yyyy").format(fkOrder.dateGen) + " (��� ������: " + fkOrder.code + ")";


            // TODO: ������ ����� - ��������� �� ������� ��������� !!!!!
            plan.dateStart = new java.util.Date();
            plan.dateFinal = new java.util.Date();
            plan.yearGen = Tools.getYear(new java.util.Date());
            plan.monthGen = Tools.getMonth(new java.util.Date()) + 1;


            int elementCode = getElementCodeForAVZByBudgetCode(budgetCode, RQConsts.REST_PURPOSE_TYPE_ID_AVAR);

            if (elementCode == Integer.MIN_VALUE)
            {
            	throw new EnergyproSystemException("\n\nNET-4401 �� ������� ��������� ��'��� ��� ��������� �����!");
            }

            plan.elementRef.code = elementCode;

            plan.kind.code = ENPlanWorkKind.CURRENT;

            plan.formRef.code = ENPlanWorkForm.NOPLANNED;
            plan.status.code = ENPlanWorkStatus.GOOD;
            plan.stateRef.code = ENPlanWorkState.CAPITAL_REPAIR;
            plan.typeRef.code = ENPlanWorkType.NOT_PLANED;

            /////
            //int monthPlanCode = Integer.MIN_VALUE;
            // �������� ����� ���������� ����
            int monthPlanCode = findMonthPlan(plan, fkOrder.molInCode);
            /////

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                Context context = new InitialContext();
                Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

                ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
                ENPlanWorkController planController = planHome.create();

                monthPlanCode = planController.add(plan);

                ///// ��������� ���� ��� ����������
                Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

                ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
                ENMOL2PlanWorkController mol2planController = mol2planHome.create();

                ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                mol2planObj.code = Integer.MIN_VALUE;
                mol2planObj.planRef = new ENPlanWorkRef();
                mol2planObj.planRef.code = monthPlanCode;
                mol2planObj.molCode = fkOrder.molInCode;
                mol2planObj.molName = fkOrder.molInName;

                mol2planController.add(mol2planObj);
                /////
            }

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4401 ������� �� ��� ��������� ̳������� �����!");
            }
        	//****************************************************************************


            return monthPlanCode;


        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }


    /**
     * ����� ��� �������� �������� ������ �� ���������� ��� ��� �������������� ������
     *
     * @param budgetCode - ��� ����������������
     * @param departmentCode - ��� �������������
     * @param orderPeriod - ������ ������
     * @param rest_purpose_type_id - ��� ���������� �������
     * @return ��� ���������� �����
     */
    public int createPlanForAVZ(int budgetCode, int departmentCode, Date orderPeriod, int rest_purpose_type_id)
    {
        if (budgetCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4405 �� ������� ��� ��������������!");
        }

        if (departmentCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4405 �� ������� ��� ��������!");
        }

        if (rest_purpose_type_id == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4405 �� ������� ��� �������!");
        }

        try
        {
        	//****************************************************************************
            EPRen2FINExecutorDAO ren2FINExecutorDAO = new EPRen2FINExecutorDAO(connection, userProfile);
            EPRen2FINExecutorFilter ren2FINExecutorFilter = new EPRen2FINExecutorFilter();
            ren2FINExecutorFilter.departmentRef.code = departmentCode;

            EPRen2FINExecutorShortList ren2FINExecutorList = ren2FINExecutorDAO.getScrollableFilteredList(ren2FINExecutorFilter, 0, -1);

            if (ren2FINExecutorList.totalCount == 0)
            {
                throw new EnergyproSystemException("\n\nNET-4405 �� �������� ����� ��� ��������! ��� ��������: " + departmentCode);
            }

            if (ren2FINExecutorList.totalCount > 1)
            {
                throw new EnergyproSystemException("\n\nNET-4405 ������� �� ��� ������ ����� ��� �������� (������� > 1)! ��� ��������: " + departmentCode);
            }

            int finExecutorCode = ren2FINExecutorList.get(0).finExecutorRefCode;
            if (finExecutorCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4405 �� �������� ����� ��� ���������� ��� ��������� ��������! ��� ��������: " + departmentCode);
            }

            ENPlanWork plan = new ENPlanWork();

            plan.departmentRef.code = ren2FINExecutorList.get(0).departmentRefCode;

        	FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
            FINExecutor finExecutorObj = finExecutorDAO.getObject(finExecutorCode);

            if (finExecutorObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4405 �� �������� ��������� � ����� " + ren2FINExecutorList.get(0).finExecutorRefCode + " !");
            }

            plan.finExecutor = finExecutorObj;

            plan.budgetRef.code = budgetCode;
            plan.responsibilityRef.code = getResponsibilityByBudgetCode(budgetCode);

            plan.commentGen = "����������� ��������� ���� �� ���������� ���";

            // plan.dateStart = new java.util.Date();
            // plan.dateFinal = new java.util.Date();
            // plan.yearGen = new java.util.Date().getYear() + 1900;
            // plan.monthGen = new java.util.Date().getMonth() + 1;

            // ������ ����� ���������� �� ������� ������
            plan.dateStart = Tools.getFirstDayOfMonth(orderPeriod);
            plan.dateFinal = Tools.getLastDayOfMonth(orderPeriod);
            plan.yearGen = Tools.getYear(plan.dateStart);
            plan.monthGen = Tools.getMonth(plan.dateStart) + 1;


            int elementCode = getElementCodeForAVZByBudgetCode(budgetCode, rest_purpose_type_id);


            if (elementCode == Integer.MIN_VALUE)
            {
            	throw new EnergyproSystemException("\n\nNET-4405 �� ������� ��������� ��'��� ��� ��������� �����!");
            }

            plan.elementRef.code = elementCode;

            plan.kind.code = ENPlanWorkKind.CURRENT;

            plan.formRef.code = ENPlanWorkForm.NOPLANNED;
            plan.status.code = ENPlanWorkStatus.GOOD;
            plan.stateRef.code = ENPlanWorkState.CAPITAL_REPAIR;
            plan.typeRef.code = ENPlanWorkType.NOT_PLANED;

            /////
            //int monthPlanCode = Integer.MIN_VALUE;
            // �������� ����� ���������� ����
            int monthPlanCode = findMonthPlan(plan, "0000");
            /////

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                Context context = new InitialContext();
                Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

                ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
                ENPlanWorkController planController = planHome.create();

                monthPlanCode = planController.add(plan);

                ///// ��������� ���� ��� ����������
                Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

                ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
                ENMOL2PlanWorkController mol2planController = mol2planHome.create();

                ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
                mol2planObj.code = Integer.MIN_VALUE;
                mol2planObj.planRef = new ENPlanWorkRef();
                mol2planObj.planRef.code = monthPlanCode;
                mol2planObj.molCode = "0000";
                mol2planObj.molName = "��������� ��� EnergyNet";

                mol2planController.add(mol2planObj);
                /////
            }

            if (monthPlanCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4405 ������� �� ��� ��������� ̳������� �����!");
            }
        	//****************************************************************************


            return monthPlanCode;


        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }

    /**
     * ����� ��� ��������������� �������� �������� ������ �� ������������ ��� ���
     *
     * @param estimateItem - �������� �� �����, ������� ����� ���������������

     * @return ��� ���������� �����
     */
    public int createPlanForCPP(ENEstimateItem estimateItem)
    {
    	/// �������� �����
        AuthLogic authLogic = new AuthLogic(connection, userProfile);

        if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "createPlanForCPP"))
        {
            throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
        }
        ///

        if (estimateItem == null)
        {
            throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������� � �����!");
        }

        if (estimateItem.code == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������� � ����� (������� ���)!");
        }

        try
        {
        	// eiPlan - ���� �����, ��� ���������� ������� ��� ���������� ���������� ��������, �.�. ������� ���� �� ��� ������������
        	ENPlanWork eiPlan = getPlanByCodeNOSEGR(estimateItem.planRef.code);

            if (eiPlan == null)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����! ��� �����: " + estimateItem.planRef.code);
            }

            // ����� ����� ����������� ������ ��� ������� � �������� ������
            if (eiPlan.kind.code != ENPlanWorkKind.YEAR && eiPlan.kind.code != ENPlanWorkKind.CURRENT)
            {
            	return Integer.MIN_VALUE;
            }

            if (eiPlan.formRef.code == ENPlanWorkForm.NOPLANNED)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� ������������ ������ ���������� ��������������� ������ �������� \"������ �����������\"!");
            }

            if (estimateItem.countFact.compareTo(new BigDecimal(0)) <= 0)
            {
                throw new EnergyproSystemException("\n\nNET-4415 ������� ������� ��������, �� ��������������, ������������!");
            }

        	//****************************************************************************
            EPRen2FINExecutorDAO ren2FINExecutorDAO = new EPRen2FINExecutorDAO(connection, userProfile);
            EPRen2FINExecutorFilter ren2FINExecutorFilter = new EPRen2FINExecutorFilter();
            ren2FINExecutorFilter.departmentRef.code = ENConsts.ENDEPARTMENT_CPP;

            EPRen2FINExecutorShortList ren2FINExecutorList = ren2FINExecutorDAO.getScrollableFilteredList(ren2FINExecutorFilter, 0, -1);

            if (ren2FINExecutorList.totalCount == 0)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����� ��� ��������! ��� ��������: " + ENConsts.ENDEPARTMENT_CPP);
            }

            if (ren2FINExecutorList.totalCount > 1)
            {
                throw new EnergyproSystemException("\n\nNET-4415 ������� �� ��� ������ ����� ��� �������� (������� > 1)! ��� ��������: " + ENConsts.ENDEPARTMENT_CPP);
            }

            int finExecutorCode = ren2FINExecutorList.get(0).finExecutorRefCode;
            if (finExecutorCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����� ��� ���������� ��� ��������� ��������! ��� ��������: " + ENConsts.ENDEPARTMENT_CPP);
            }

            // ������� ���� �� ������������
            ENPlanWork plan = new ENPlanWork();

            plan.departmentRef.code = ren2FINExecutorList.get(0).departmentRefCode;

        	FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
            FINExecutor finExecutorObj = finExecutorDAO.getObject(finExecutorCode);

            if (finExecutorObj == null)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ��������� � ����� " + ren2FINExecutorList.get(0).finExecutorRefCode + " !");
            }

            plan.finExecutor = finExecutorObj;

            // ���������������� ����� � ������������� ����� (����� � ������ ����� ������ ����������� �� ����� ���)
            // plan.budgetRef.code = ENConsts.ENBUDGET_CPP;
            plan.budgetRef.code = eiPlan.budgetRef.code;
            plan.responsibilityRef.code = getResponsibilityByBudgetCode(ENConsts.ENBUDGET_CPP);

            // TODO: ��� ����������� ����� � ���� ����� �������� ������� ������ - �������� ���� ���� ��������� �������� ������
            //plan.commentGen = "����������� ��������� ���� �� ������������ ��� ��� (��� �������� � ����� " +
            //		estimateItem.code + " � ���� � ����� " + estimateItem.planRef.code + ")";
            plan.commentGen = "����������� ��������� ���� �� ������������ ��� ���";


            ///////
            // ������ ������������ ����� �� ������������ ������������ ��� (������ ����� - 1 �����)
            Calendar calendar = Calendar.getInstance();

            calendar.setTime(Tools.clearTimeOfDate(eiPlan.dateStart));
            calendar.add(Calendar.MONTH, -1);

            Date planPeriod = calendar.getTime();

            plan.dateStart = Tools.getFirstDayOfMonth(planPeriod);
            plan.dateFinal = Tools.getLastDayOfMonth(planPeriod);
            plan.yearGen = calendar.get(Calendar.YEAR); // plan.dateStart.getYear() + 1900;
            plan.monthGen = calendar.get(Calendar.MONTH) + 1; // plan.dateStart.getMonth() + 1;
            ///////

            int elementCode = getElementCodeForProduction(estimateItem);

            if (elementCode == Integer.MIN_VALUE)
            {
            	throw new EnergyproSystemException("\n\nNET-4415 �� ������� ��������� ��'��� ��� ��������� �����!");
            }

            plan.elementRef.code = elementCode;

            // ������� ���� � ����� �� �����, ��� � ������������ (�������/��������)
            plan.kind.code = eiPlan.kind.code; //ENPlanWorkKind.CURRENT;

            plan.formRef.code = ENPlanWorkForm.PLANNED;
            plan.status.code = ENPlanWorkStatus.GOOD;
            plan.stateRef.code = ENPlanWorkState.PRODUCTION;

            // ������ ����� ����� � ������������� ����� (����� ��������� ����� ������ �� ������/������)
            // plan.typeRef.code = ENPlanWorkType.PLANOVIE;
            plan.typeRef.code = eiPlan.typeRef.code;
            // 22.12.14 ���� ������������ ���� �� ��� (���������� ����� ����� � ����, � �-��� ���� ������������ ��� ��������),
            // �� ������� ���� � �������� "�������� ������", ������ ��� ��� ������� "���" � ��� ���������� � ������� ������� "������ ����",
            // "����� �������" � �.�. (�.�. ��� �� ������ ����� ��������� � ����� ����� ����� � �.�.).
            // � �� ��� ������ ���� ������ ����� �� ������.
            if (plan.typeRef.code == ENPlanWorkType.RESTOCKING)
            {
            	plan.typeRef.code = ENPlanWorkType.PLANOVIE;
            }

            /////
            //int monthPlanCode = Integer.MIN_VALUE
            int planCode = Integer.MIN_VALUE;
            // �������� ����� ���������� ����
            if (eiPlan.kind.code == ENPlanWorkKind.CURRENT)
            {
            	planCode = findMonthPlan(plan, "0000");
            }
            else if (eiPlan.kind.code == ENPlanWorkKind.YEAR)
            {
            	planCode = findYearPlan(plan);
            }
            /////

            Context context = new InitialContext();

            boolean planExists = false;

            if (planCode == Integer.MIN_VALUE)
            {
                Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

                ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
                ENPlanWorkController planController = planHome.create();

                planCode = planController.add(plan);

                ///// ��������� ���� ��� ����������
                if (plan.kind.code == ENPlanWorkKind.CURRENT)
                {
	                Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

	                ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
	                ENMOL2PlanWorkController mol2planController = mol2planHome.create();

	                ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
	                mol2planObj.code = Integer.MIN_VALUE;
	                mol2planObj.planRef = new ENPlanWorkRef();
	                mol2planObj.planRef.code = planCode;
	                mol2planObj.molCode = "0000";
	                mol2planObj.molName = "��������� ��� EnergyNet";

	                mol2planController.add(mol2planObj);
                }
                /////
            }
            else
            {
            	planExists = true;
            }

            if (planCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4415 ������� �� ��� ��������� ����� �� ������������!");
            }
        	//****************************************************************************

            ///// �������� �� �������, ����� �� ���� �������� ������ (��� ������� - ��������, ��� �������� - �������-������)
            if (planExists) // ������ ��� ��� �������������� ����� ������
            {
	            ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
	            ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
	            historyFilter.planOldRef.code = planCode;
	            historyFilter.conditionSQL = "ENPLANCORRECTHISTORY.REASONCODE in (" +
	            		ENPlanCorrectReason.MOVE_TO_CURRENT + ", " +
	            		ENPlanCorrectReason.MOVE_TO_NPW + ")";
	            int[] historyArr = historyDAO.getFilteredCodeArray(historyFilter, 0, -1);

	            if (historyArr.length > 0)
	            {
	            	throw new EnergyproSystemException("\n\nNET-4415 � ����� �� ������������ � ����� " + planCode + " ��� �������� ������� ����!");
	            }
            }
            /////

            /////
	    	// ����� ������������ ����� � ���� ��������� ��� � ������ "��������"
            // (���� �� ����� ��� ������������ ����, �� �� ����� ���� ������������)
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			plan = planDAO.getObjectNOSEGR(planCode);
			plan.status.code = ENPlanWorkStatus.GOOD;
			planDAO.save(plan);
            /////

            ///// ���������� ������ � ����
            TKMaterials2TKTechCardFilter mat2tcFilter = new TKMaterials2TKTechCardFilter();
            mat2tcFilter.materialRef.code = estimateItem.materialRef.code;
            mat2tcFilter.typeRef.code = TKMaterials2TechCardType.OWN_PRODUCTION;

            TKMaterials2TKTechCardDAO mat2tcDAO = new TKMaterials2TKTechCardDAO(connection, userProfile);
            TKMaterials2TKTechCardShortList mat2tcList = mat2tcDAO.getScrollableFilteredList(mat2tcFilter, 0, -1);

            if (mat2tcList.totalCount == 0)
            {
            	throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������ ������� ��� ������������ ��������! ��� ��������: " + estimateItem.materialRef.code);
            }

            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);
            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController = pwiHome.create();

            ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);

            for (int i = 0; i < mat2tcList.totalCount; i++)
            {
            	boolean planItemFound = false;

            	// ���� ���� ��� ����, ���� � ������, ���� �� � ��� ����� ������.
            	// ���� ����, �� ����� ��������� �� ����������
            	if (planExists)
            	{
            		ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
            		planItemFilter.planRef.code = planCode;
            		planItemFilter.kartaRef.code = mat2tcList.get(i).techCardRefCode;

            		int[] pwiArr = pwiDAO.getFilteredCodeArray(planItemFilter, 0, -1);

            		if (pwiArr.length > 1)
            		{
            			throw new EnergyproSystemException("\n\nNET-4415 �������� ������� (" + pwiArr.length + ") ��������� ���� � ����!" +
            					"\n��� �����: " + planCode + ", ��� ��������: " + mat2tcList.get(i).techCardRefCode);
            		}

            		// ���������� � ������ ����������� ����������
            		if (pwiArr.length == 1)
            		{
            			ENPlanWorkItem planItem = pwiDAO.getObject(pwiArr[0]);
            			planItem.countGen = planItem.countGen.add(mat2tcList.get(i).countGen.multiply(estimateItem.countFact).
            					setScale(3, java.math.BigDecimal.ROUND_HALF_UP)).
            					setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
            			pwiController.save(planItem, true);

            			planItemFound = true;
            		}

            	}

            	// ���� ������ � ����� �� ���� ��� ���� ������ ������, ��������� ������ � ����
            	if (! planItemFound)
            	{
                    ENPlanWorkItem planItem = new ENPlanWorkItem();

                    planItem.code = Integer.MIN_VALUE;
                    planItem.planRef.code = planCode;
                    planItem.kartaRef.code = mat2tcList.get(i).techCardRefCode;
                    // ���-�� ����� � ����� �� ������������ = ���-�� ����� �� ������� ��������� * ���-�� ��������� � �����, ��� �-���� �������������
                    planItem.countGen = mat2tcList.get(i).countGen.multiply(estimateItem.countFact).setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

                    pwiController.add(planItem);
            	}
            }
            /////

            /////
	    	// ���������� ����
			plan = planDAO.getObjectNOSEGR(planCode);
			plan.status.code = ENPlanWorkStatus.LOCKED;
			planDAO.save(plan);
            /////

			///// ��������� ������ ��������� � ��������� ������
			ENEstimateItem2PlanDAO ei2planDAO = new ENEstimateItem2PlanDAO(connection, userProfile);

			ENEstimateItem2Plan ei2plan = new ENEstimateItem2Plan();
			ei2plan.estimateItemRef.code = estimateItem.code;
			ei2plan.planRef.code = planCode;
			ei2plan.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;

			ei2planDAO.add(ei2plan);
			/////

            return planCode;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }


    /**
     * ����� ��� ��������� ���������� ����� � �������� ������ �� ������������ ��� ���
     *
     * @param estimateItem - �������� �� �����, ������� ����� ���������������
     * @param isDelete - ����� �� ������� ������ estimateItem'� � ������ (true - �������)
     *
     * @return ��� ����� �� ������������
     */
    public int recalcPlanForCPP(ENEstimateItem estimateItem, boolean isDelete)
    {
        if (estimateItem == null)
        {
            throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������� � �����!");
        }

        if (estimateItem.code == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������� � ����� (������� ���)!");
        }

        /* ���� ���-�� �������, ����� �������� ������� ���� �� ������������
        if (estimateItem.countFact.compareTo(new BigDecimal(0)) <= 0)
        {
            throw new EnergyproSystemException("\n\nNET-4415 ������� ������� ��������, �� ��������������, ������������!");
        }
        */

        try
        {
        	// eiPlan - ���� �����, ��� ���������� ������� ��� ���������� ���������� ��������, �.�. ������� ���� �� ��� ������������
        	ENPlanWork eiPlan = getPlanByCodeNOSEGR(estimateItem.planRef.code);

            if (eiPlan == null)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����! ��� �����: " + estimateItem.planRef.code);
            }

            // ����� ����� ����������� ������ ��� ������� � �������� ������
            if (eiPlan.kind.code != ENPlanWorkKind.YEAR && eiPlan.kind.code != ENPlanWorkKind.CURRENT)
            {
            	return Integer.MIN_VALUE;
            }

            if (eiPlan.formRef.code == ENPlanWorkForm.NOPLANNED)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� ������������ ������ ���������� ��������������� ������ �������� \"������ �����������\"!");
            }

        	/// ��� ������� �������� ��������� �� �������� "������ �����������" �������� �����
            if (isDelete)
            {
    	    	AuthLogic authLogic = new AuthLogic(connection, userProfile);

    	        if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "createPlanForCPP"))
    	        {
    	            throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
    	        }
            }
            ///

			///// ���� ���� �� ������
			ENEstimateItem2PlanDAO ei2planDAO = new ENEstimateItem2PlanDAO(connection, userProfile);

			ENEstimateItem2PlanFilter ei2planFilter = new ENEstimateItem2PlanFilter();
			ei2planFilter.estimateItemRef.code = estimateItem.code;
			ei2planFilter.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;

			ENEstimateItem2PlanShortList ei2planList = ei2planDAO.getScrollableFilteredList(ei2planFilter, 0, -1);

			if (ei2planList.totalCount != 1)
			{
				throw new EnergyproSystemException("\n\nNET-4415 ������� � ������� ��'���� (" + ei2planList.totalCount + ") �������� � ������ �� ������������!");
			}

			int planCode = ei2planList.get(0).planRefCode;

            if (planCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4415 �� �������� ��'������ ���� �� ������������!");
            }
			/////

            ///// �������� �� �������, ����� �� ���� �������� ������ (��� ������� - ��������, ��� �������� - �������-������)
            ENPlanCorrectHistoryDAO historyDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
            ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
            historyFilter.planOldRef.code = planCode;
            historyFilter.conditionSQL = "ENPLANCORRECTHISTORY.REASONCODE in (" +
            		ENPlanCorrectReason.MOVE_TO_CURRENT + ", " +
            		ENPlanCorrectReason.MOVE_TO_NPW + ")";
            int[] historyArr = historyDAO.getFilteredCodeArray(historyFilter, 0, -1);

            if (historyArr.length > 0)
            {
            	throw new EnergyproSystemException("\n\nNET-4415 � ����� �� ������������ � ����� " + planCode + " ��� �������� ������� ����!");
            }
            /////

            ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItem oldEstimateItem = eiDAO.getObjectNoSegr(estimateItem.code);

            // ������� ���-�� ������ � �������
            BigDecimal countDelta = new BigDecimal(0);

            if (! isDelete)
            {
            	countDelta = estimateItem.countFact.subtract(oldEstimateItem.countFact).setScale(6, BigDecimal.ROUND_HALF_UP);
            }
            else
            {
            	// ���� ������� ��������, �� ������ = -���������� (�.�. �� ������ ������ ������ �� ���-��, ������� �� ��������� ���������)
            	countDelta = estimateItem.countFact.negate();
            }

            /////
	    	// ����� ������������ ����� � ���� ��������� ��� � ������ "��������"
            // (���� �� ����� ��� ������������ ����, �� �� ����� ���� ������������)
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);
			plan.status.code = ENPlanWorkStatus.GOOD;
			planDAO.save(plan);
            /////

            ///// ���������� ������ � ����
            TKMaterials2TKTechCardFilter mat2tcFilter = new TKMaterials2TKTechCardFilter();
            mat2tcFilter.materialRef.code = estimateItem.materialRef.code;
            mat2tcFilter.typeRef.code = TKMaterials2TechCardType.OWN_PRODUCTION;

            TKMaterials2TKTechCardDAO mat2tcDAO = new TKMaterials2TKTechCardDAO(connection, userProfile);
            TKMaterials2TKTechCardShortList mat2tcList = mat2tcDAO.getScrollableFilteredList(mat2tcFilter, 0, -1);

            if (mat2tcList.totalCount == 0)
            {
            	throw new EnergyproSystemException("\n\nNET-4415 �� ������� ������ ������� ��� ������������ ��������! ��� ��������: " + estimateItem.materialRef.code);
            }

            Context context = new InitialContext();

            Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);
            ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
            ENPlanWorkItemController pwiController = pwiHome.create();

            ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);

            String techCardsCodes = "";

            for (int i = 0; i < mat2tcList.totalCount; i++)
            {
            	boolean planItemFound = false;

        		ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
        		planItemFilter.planRef.code = planCode;
        		planItemFilter.kartaRef.code = mat2tcList.get(i).techCardRefCode;

        		int[] pwiArr = pwiDAO.getFilteredCodeArray(planItemFilter, 0, -1);

        		if (pwiArr.length > 1)
        		{
        			throw new EnergyproSystemException("\n\nNET-4415 �������� ������� (" + pwiArr.length + ") ��������� ���� � ����!" +
        					"\n��� �����: " + planCode + ", ��� ��������: " + mat2tcList.get(i).techCardRefCode);
        		}

        		if (techCardsCodes.equals(""))
        		{
        			techCardsCodes = "" + mat2tcList.get(i).techCardRefCode;
        		}
        		else
        		{
        			techCardsCodes = techCardsCodes + ", " + mat2tcList.get(i).techCardRefCode;
        		}

        		// ���������� � ������ ����������� ����������
        		if (pwiArr.length == 1)
        		{
        			if (countDelta.compareTo(new BigDecimal(0)) != 0)
        			{
	        			ENPlanWorkItem planItem = pwiDAO.getObject(pwiArr[0]);
	        			planItem.countGen = planItem.countGen.add(mat2tcList.get(i).countGen.multiply(countDelta).
	        					setScale(3, java.math.BigDecimal.ROUND_HALF_UP)).
	        					setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

	        			// �� ������ ������ �������� �� ������������� ���-�� �����
	        			if (planItem.countGen.compareTo(new BigDecimal(0)) < 0)
	        			{
	        				throw new EnergyproSystemException("\n\nNET-4415 ʳ������ ���� �� ���� ���� ��'�����!");
	        			}

	        			pwiController.save(planItem, true);
        			}

        			planItemFound = true;
        		}

            	// ���� ������ � ����� �� ����, ��������� ������ � ����
            	if (! planItemFound && ! isDelete)
            	{
                    ENPlanWorkItem planItem = new ENPlanWorkItem();

                    planItem.code = Integer.MIN_VALUE;
                    planItem.planRef.code = planCode;
                    planItem.kartaRef.code = mat2tcList.get(i).techCardRefCode;
                    // ���-�� ����� � ����� �� ������������ = ���-�� ����� �� ������� ��������� * ���-�� ��������� � �����, ��� �-���� �������������
                    planItem.countGen = mat2tcList.get(i).countGen.multiply(estimateItem.countFact).setScale(3, java.math.BigDecimal.ROUND_HALF_UP);


                    pwiController.add(planItem);

            	}
            }

            // ������, ������� ��� ��� � ����������� ������ � ��������������� ����������, ��������
            if (! techCardsCodes.equals(""))
            {
            	ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
            	planItemFilter.planRef.code = planCode;
            	planItemFilter.conditionSQL = "ENPLANWORKITEM.KARTAREFCODE not in (" + techCardsCodes + ")";

        		int[] pwiArr = pwiDAO.getFilteredCodeArray(planItemFilter, 0, -1);

        		for (int i = 0; i < pwiArr.length; i++)
        		{
        			ENPlanWorkItem planItem = pwiDAO.getObject(pwiArr[i]);
        			planItem.countGen = new BigDecimal(0);

        			pwiController.save(planItem, true);
        		}
            }
            /////

			/////
			// ������� ������ � ������ (���� ���������/���������� ��� ��������������� �������� ��� � ���� ��������� ������ "������ �����������")
			if (isDelete /*|| estimateItem.countFact.compareTo(new BigDecimal(0)) <= 0*/) // ���� �� ����� ������� ������ ��� ��������� ���������
			{
				ei2planDAO.remove(ei2planList.get(0).code);
			}

			/* ���� �� ����� ������� ������ ��� ��������� ��������� - ������ ��� �������� ��� ��������� ������� �� �������� �� "������ �����������"
			// ���� �������� �������� �� �������� "������ �����������", ������� ��� ������ �� "��������� ���������"
			// (������ ��� ���� �� ������� ��� ���� ������ � ������, � �����, ��������, ��� ��������� ����� ������� ������, ��� �� ������� ������)
			if (estimateItem.countFact.compareTo(new BigDecimal(0)) <= 0)
			{
				if (estimateItem.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
				{
					estimateItem.statusRef.code = ENEstimateItemStatus.UNUSED;
				}
			}
			*/
			/////

			ei2planFilter = new ENEstimateItem2PlanFilter();
			ei2planFilter.planRef.code = planCode;
			ei2planFilter.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;

			int[] ei2planArr = ei2planDAO.getFilteredCodeArray(ei2planFilter, 0, -1);

			// ���� ������ � ������ ������ ���, ���������� ������� ����
			if (ei2planArr.length == 0)
			{
				Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
                ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
                ENPlanWorkController planController = planHome.create();

                int parentPlanCode = Integer.MIN_VALUE;

                if (plan.kind.code == ENPlanWorkKind.CURRENT)
                {
                	parentPlanCode = getParentPlanWorkCode(planCode, ENPlanCorrectReason.MOVE_TO_CURRENT);
                }

		        // ���� ���� ������������ ����, ����� ������������ "�������� ��� ������������� �����������", ����� ������ ��������
		        if (parentPlanCode != Integer.MIN_VALUE)
		        {
		        	planController.openPlanWork(planCode);

			    	// ����� �������� ��������� ����� ����� ��������� ��� ������������ �������
					ENPlanWork parentPlan = planDAO.getObjectNOSEGR(parentPlanCode);
					parentPlan.status.code = ENPlanWorkStatus.LOCKED;
					planDAO.save(parentPlan);
		        }
		        else
		        {
		        	planController.remove(planCode);
		        }
			}
			else
			{
	            /////
		    	// ���������� ����
				plan = planDAO.getObjectNOSEGR(planCode);
				plan.status.code = ENPlanWorkStatus.LOCKED;
				planDAO.save(plan);
	            /////
			}

            return planCode;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }


    /**
     * ����� ��� ����������� �������� ����� �� ������������ � �������� �� ���� ��������� ��� ����������� ��������� �������� �����
     *
     * @param yearPlanCode - ��� �������� �����, � ������� ���� ��������� �� �������� "������ �����������"
     * @param monthPlanCode - ��� ��������� �����, ���������� ��� ����������� �������� � ����� yearPlanCode
     *
     */
    public void closePlansForCPPByMainPlan(int yearPlanCode, int monthPlanCode)
    {
    	if (yearPlanCode == Integer.MIN_VALUE)
    	{
    		throw new EnergyproSystemException("\n\nNET-4415 �� ������� ��� г����� �����!");
    	}

    	if (monthPlanCode == Integer.MIN_VALUE)
    	{
    		throw new EnergyproSystemException("\n\nNET-4415 �� ������� ��� ̳������� �����!");
    	}

    	try
    	{
		    ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

		    ENPlanWork yearPlan = planDAO.getObjectNOSEGR(yearPlanCode);

	        if (yearPlan == null)
	        {
	            throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����! ��� �����: " + yearPlanCode);
	        }

	        if (yearPlan.kind.code != ENPlanWorkKind.YEAR)
	        {
	        	//return Integer.MIN_VALUE;
	        	throw new EnergyproSystemException("\n\nNET-4415 ���� � ����� " + yearPlanCode + " �� � г����!");
	        }

			ENPlanWork monthPlan = planDAO.getObjectNOSEGR(monthPlanCode);

	        if (monthPlan == null)
	        {
	            throw new EnergyproSystemException("\n\nNET-4415 �� �������� ����! ��� �����: " + monthPlanCode);
	        }

	        if (monthPlan.kind.code != ENPlanWorkKind.CURRENT)
	        {
	        	//return Integer.MIN_VALUE;
	        	throw new EnergyproSystemException("\n\nNET-4415 ���� � ����� " + monthPlanCode + " �� � ̳������!");
	        }

        	//throw new EnergyproSystemException("\n\nNET-4415 �� �������� ��������������� ����� ��� �����, � ���� � �������� " +
        	//		"� �������� \"������ �����������\"!");

	        ENEstimateItem2ENEstimateItemDAO ei2eiDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
	        ENPlanCorrectHistoryDAO planHistoryDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

	        // ���� ��������� � �������� �����
	        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
	        ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
	        eiFilter.planRef.code = monthPlanCode;
	        eiFilter.conditionSQL = " enestimateitem.countfact > 0 ";
	        eiFilter.statusRef.code = ENEstimateItemStatus.OWN_PRODUCTION;

	        int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);

	        if (eiArr.length == 0)
	        {
	        	return;
	        }

	        for (int i = 0; i < eiArr.length; i++)
	        {
				// ��������, �� ������ �� ��� ��������� ���� �� ������������ ����� (� �������� ���� ������ � ��� ������, ���� ��� ��� ���)
				int monthPlanForCPPCode = getPlanForOwnProduction(eiArr[i], false);

				// ���� ����� ��� ���, �������� ���
				if (monthPlanForCPPCode == Integer.MIN_VALUE)
				{
					ENEstimateItem estimateItem = eiDAO.getObject(eiArr[i]);
	        		monthPlanForCPPCode = createPlanForCPP(estimateItem);
				}

	        	if (monthPlanForCPPCode == Integer.MIN_VALUE)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4415 ������� ��� �������� ̳������� ����� �� ������������ " +
	        				"��� �������� � �����: " + eiArr[i]);
	        	}

	        	// ����� ����� ��������������� �������� �� �������� �����, � ����� �� ���� ��������� � ��� ������� ���� �� ������������.
	        	// ����� ����� ������� ������� � �������� ����� �� ������������ ����� ������� (���� ��� ��� ������ � �������, ������ ���
	        	// ���. ���� ��� ��� ���� ������ �����, � �� ������ ���������� � ���� ���������)

		        ENEstimateItem2ENEstimateItemFilter ei2eiFilter = new ENEstimateItem2ENEstimateItemFilter();
		        ei2eiFilter.estimateItemOutRef.code = eiArr[i];
		        ei2eiFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;

		        ENEstimateItem2ENEstimateItemShortList ei2eiList = ei2eiDAO.getScrollableFilteredList(ei2eiFilter, 0, -1);

		        if (ei2eiList.totalCount != 1)
		        {
		        	throw new EnergyproSystemException("\n\nNET-4415 ������� � ������� (" + ei2eiList.totalCount + ") ��'���� ��������!");
		        }
		        else
		        {
		        	ENEstimateItem eiYear = eiDAO.getObjectNoSegr(ei2eiList.get(0).estimateItemInRefCode);

		        	if (eiYear.planRef.code != yearPlanCode)
		        	{
		        		throw new EnergyproSystemException("\n\nNET-4415 �� ���������� ���� ����� ����� (" +
		        				eiYear.planRef.code + " �� " + yearPlanCode + ") !");
		        	}

		        	int yearPlanForCPPCode = getPlanForOwnProduction(ei2eiList.get(0).estimateItemInRefCode, true);

		        	ENPlanCorrectHistoryFilter planHistoryFilter = new ENPlanCorrectHistoryFilter();
		        	planHistoryFilter.planOldRef.code = yearPlanForCPPCode;
		        	planHistoryFilter.planNewRef.code = monthPlanForCPPCode;
		        	planHistoryFilter.reason.code = ENPlanCorrectReason.MOVE_TO_CURRENT;

		        	int[] planHistoryArr = planHistoryDAO.getFilteredCodeArray(planHistoryFilter, 0, -1);

		        	// ���� ������� ���� ��� �� ������ � �������� � �������, ��������� ������
		        	if (planHistoryArr.length == 0)
		        	{
			        	ENPlanCorrectHistory planHistory = new ENPlanCorrectHistory();
			        	planHistory.code = Integer.MIN_VALUE;
			        	planHistory.planRef.code = yearPlanForCPPCode;
			        	planHistory.planOldRef.code = yearPlanForCPPCode;
			        	planHistory.planNewRef.code = monthPlanForCPPCode;
			        	planHistory.dateGen = new Date();
			        	planHistory.userGen = userProfile.userName;
			        	planHistory.reason.code = ENPlanCorrectReason.MOVE_TO_CURRENT;
			        	planHistory.commentGen = "����������� ����������� ������ ����� �� ������������ ��� ������������ ��������� �����";
			        	planHistoryDAO.add(planHistory);
		        	}
		        }
	        }

    	}
    	catch (PersistenceException e)
    	{
    		throw new EnergyproSystemException(e.getMessage(), e);
    	}
    }


    /**
     * ����� ���������� ��������� ���� �� ������������ �� ���� ��������� �� �����
     *
     * @param estimateItemCode - ��� ��������� �� �������� "������ �����������"
     * @param isException - ���������� �� ������, ���� ���� �� ������ (true - ��)
     *
     * @return ��� ���������� ����� �� ������������
     */
    public int getPlanForOwnProduction(int estimateItemCode, boolean isException)
    {
    	try
    	{
	    	ENEstimateItem2PlanDAO ei2planDAO = new ENEstimateItem2PlanDAO(connection, userProfile);

	    	ENEstimateItem2PlanFilter ei2planFilter = new ENEstimateItem2PlanFilter();
	    	ei2planFilter.estimateItemRef.code = estimateItemCode;
	    	ei2planFilter.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;

	    	ENEstimateItem2PlanShortList ei2planList = ei2planDAO.getScrollableFilteredList(ei2planFilter, 0, -1);

	    	if (ei2planList.totalCount > 1)
	    	{
	    		throw new EnergyproSystemException("\n\nNET-4415 ������� � ������� (" + ei2planList.totalCount +
	    				") ��'���� �������� � ������ �� ������������!");
	    	}

	    	if (ei2planList.totalCount == 1)
	    	{
	    		return ei2planList.get(0).planRefCode;
	    	}
	    	else
	    	{
	    		if (isException)
	    		{
	    			throw new EnergyproSystemException("\n\nNET-4415 �� �������� ��'������ ���� �� ������������ ��� �������� � �����: " + estimateItemCode);
	    		}
	    		else
	    		{
	    			return Integer.MIN_VALUE;
	    		}
	    	}
    	}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
    }

    /**
     * ��������, �������� �� ���� ������������� ��������� ������ �� ������������
     *
     * @param planCode - ��� �����
     *
     * @return true - ���� ��� ������������� ��������� ���� �� ������������, ����� - false
     */
    public boolean isAutoPlanForOwnProduction(int planCode)
    {
		try
		{
	        ENEstimateItem2PlanDAO ei2planDAO = new ENEstimateItem2PlanDAO(connection, userProfile);

	        ENEstimateItem2PlanFilter ei2planFilter = new ENEstimateItem2PlanFilter();
	    	ei2planFilter.planRef.code = planCode;
	    	ei2planFilter.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;

	    	int[] ei2planArr = ei2planDAO.getFilteredCodeArray(ei2planFilter, 0, -1);

	    	return (ei2planArr.length > 0);
		}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
    }


    /**
     * ��������, ���� �� � ����� ��������� �� �������� "������ �����������"
     *
     * @param planCode - ��� �����
     *
     * @return true - ���� � ����� ���� ��������� �� �������� "������ �����������", ����� - false
     */
    public boolean isPlanWithOwnProduction(int planCode)
    {
		try
		{
	        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
	        ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
	        eiFilter.planRef.code = planCode;
	        //eiFilter.conditionSQL = " enestimateitem.countfact > 0 "; // ��������� ��� ���??? ���� ���������� ���� ���������!
	        eiFilter.statusRef.code = ENEstimateItemStatus.OWN_PRODUCTION;

	        int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);

	    	return (eiArr.length > 0);
		}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
    }


    /**
     * �������� ���������� �� ������������� ��������� ������ �� ���������� ���
     *
     * @param estimateList - ������ ����� ���������� (����������)
     */
    public void removeEstimatesForAVZ(String estimateList)
    {
    	if (estimateList == null)
        {
            throw new EnergyproSystemException("\n\nNET-4401 �� ������� ������ �������� � ����� ��� ���������!");
        }

    	if (estimateList.equals(""))
        {
            throw new EnergyproSystemException("\n\nNET-4401 �� ������� ������ �������� � ����� ��� ���������!");
        }

    	try
    	{
    		ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(connection, userProfile);

	    	Context context = new InitialContext();

	    	Object estimateItemRef = context.lookup(ENEstimateItemController.JNDI_NAME);
	    	ENEstimateItemControllerHome estimateItemHome = (ENEstimateItemControllerHome) PortableRemoteObject
	                .narrow(estimateItemRef, ENEstimateItemControllerHome.class);
	    	ENEstimateItemController estimateItemController = estimateItemHome.create();

	    	ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
	    	eiFilter.conditionSQL = "code in (" + estimateList + ")";

	    	ENEstimateItemShortList eiList = estimateDAO.getScrollableFilteredList(eiFilter, 0, -1);

	    	if (eiList.totalCount == 0)
	    	{
	    		return;
	    	}

	    	// � ���� ����� ������ ������������ ��������� ������ �� ������ �����
	    	int planCode = eiList.get(0).planRefCode;

            if (planCode == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("\n\nNET-4401 ������� �� ��� ������ �����!");
            }

	    	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

			// ����� ���, ��� ������� ��������� �� �����, ��������� ��� � ������ "��������"
			if (plan.status.code != ENPlanWorkStatus.GOOD)
			{
				plan.status.code = ENPlanWorkStatus.GOOD;
				planDAO.save(plan);
			}

            // ������� ���������
	    	for (int i = 0; i < eiList.totalCount; i++)
	    	{
	    		estimateItemController.remove(eiList.get(i).code);
	    	}

	    	// ���������, �������� �� � ����� ��� �����-�� ���������
	    	eiFilter = new ENEstimateItemFilter();
	    	eiFilter.planRef.code = planCode;

	    	int[] eiArr = estimateDAO.getFilteredCodeArray(eiFilter, 0, -1);

	    	// ���� ��������� ��� ���� � �����, �������, ���� ��� � ���� ������ ����
	    	if (eiArr.length > 0)
	    	{
	    		// ���� � ����� �������� ���������, ��������� ��� � ������ "������������"
				plan = planDAO.getObjectNOSEGR(planCode);
				plan.status.code = ENPlanWorkStatus.LOCKED;
				planDAO.save(plan);

	    		return;
	    	}

	    	Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
	    	ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
	                .narrow(planRef, ENPlanWorkControllerHome.class);
	    	ENPlanWorkController planController = planHome.create();

	    	// ������� ����
	    	planController.remove(planCode);

    	} catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }

    /**
     * ����� ��� ������� �������� ������� ������ �� ���������� ���
     *
     * @param elementCode - ��� ��������
     *
     * @throws PersistenceException
     */
    public void checkForAVZObject(int elementCode) throws PersistenceException
    {
    	ENPurchasesObjectFilter poFilter = new ENPurchasesObjectFilter();
    	poFilter.element.code = elementCode;
    	poFilter.purchasesReason.code = ENPurchasesObjectReason.PURCHASES_AVZ;
    	// ���� ��������� ������ ����������� ��������
    	poFilter.conditionSQL =
    			" ENPURCHASESOBJECT.BUDGETCODE in " +
    			" (select d.code from endepartment d " +
    			"   where d.managementrefcode is not null " +
    			"     and d.managementrefcode = " + ENManagement.TECHNICAL +
    			"     and d.typerefcode = " + ENDepartmentType.BUDGET + ")";

    	ENPurchasesObjectDAO poDAO = new ENPurchasesObjectDAO(connection, userProfile);
    	int poArr[] = poDAO.getFilteredCodeArrayNOSEGR(poFilter, poFilter.conditionSQL, null, 0, -1, null);

    	if (poArr.length > 0)
    	{
    		throw new EnergyproSystemException("\n\nNET-4395 ��������� ������ ����� �� ���������� ��� ����������!\n" +
    				"ֳ ����� ����������� ����������� �� ��� ���������� ������ �� ���������� ���!");
    	}
    }

 // NET-4425 5. �� ���� ������ ����������� �����-�������, ���� �� ���������� ��� ���� ������������, �.�. �� ��������� �����������. - ��� ������������ �����
    public boolean checkCreateSecondNPZByServices(ENElement element) throws PersistenceException {
        boolean result = false;
    	ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
    	ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
    	ENPlanWork2ActFailureDAO p2faDAO = new ENPlanWork2ActFailureDAO(connection, userProfile);

        if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {

        	ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
        	soFilter.element.code = element.code;
        	soFilter.conditionSQL = " enservicesobject.contracttyperefcode in ("+ENServicesContractType.TY +","+ENServicesContractType.OTHERS+") " +
        			"/*������ ������*/ " +
        	        " and (select count(p2c.code) from enplanwork2classfctntp p2c , enplanwork p , tkclassificationtype tp " +
        	        "        where p2c.planrefcode = p.code" +
        	        "        and p.kindcode =  " + ENPlanWorkKind.CALCULATION +
        	        "        and p.elementrefcode = enservicesobject.elementcode" +
        	        "        and p2c.classificationtyperfcd = tp.code" +
        	        "        and tp.isnotlicensedactivity = 0 ) > 0" ;
        			;

        	int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);
        	if(soArr.length > 0) {

        		ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
        		pFilter.elementRef.code = element.code;
        		pFilter.kind.code = ENPlanWorkKind.NPW;

        		// ���� ���� ��� �� �������� ������� ���� �� �������� ���� �� � ���� ����� �������� ���� ������������ ���� ���� � ������ ������� ���� ���� ����������� ��� �� �������� � �� ���� ������� ��� ���� ������� ����
        		int[] pArr = pDAO.getFilteredCodeArray(pFilter, 0, -1);

        		for (int i=0; i<pArr.length; i++){


            		ENPlanWork2ActFailureFilter p2faFilter = new ENPlanWork2ActFailureFilter();
            		p2faFilter.planRef.code = pArr[i];
            		int[] p2faArr = p2faDAO.getFilteredCodeArray(p2faFilter, 0, -1);
            		if(p2faArr.length == 0 ) {
            		ENServicesObject soObj = soDAO.getObject(soArr[0]);
            			throw new EnergyproSystemException("\n\n NET-4425 �.5 ��� �������� �� �������� �� ������� � " + soObj.contractNumberServices + " ��� ��� ��������� ��������-����, \n ��� ��������� �������� �������-����� ��������� ��� ������������ ��������-���� ������ ��� ����������� ����!!! (������� \"�����\" �� ������� ������ �� �������)  ");
            		}

            	}

        	}


        }

        return result;
    }


    /**
     * ���������� ������� �� ��� ��� ����
     *
     * @param planCode - ��� �����
     * @param dateGen - ���� �����
     * @param fuelTypeCode - ��� ���� �������
     * @param countGen - ���������� �������
     * @param version - ������ ������ � ������� ��� ����� � ����� planCode
     *
     * @return ��� ������ � �������
     *
     * @throws PersistenceException
     */
    public int addPlanFuelHistory(int planCode, Date dateGen, int fuelTypeCode, BigDecimal countGen, int version) throws PersistenceException
    {
    	if (planCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nNET-4440 �� ������� ��� �����!");
    	}

    	if (version <= 0)
    	{
    		throw new SystemException("\n\nNET-4440 �� ������� ����� ���� ������ � ����� ���� ������ ��� ��� ����� � ����� " + planCode + " !");
    	}

    	ENPlanWorkFuelHistoryDAO fuelHistoryDAO = new ENPlanWorkFuelHistoryDAO(connection, userProfile);

    	ENPlanWorkFuelHistory fuelHistory = new ENPlanWorkFuelHistory();

    	fuelHistory.code = Integer.MIN_VALUE;
    	fuelHistory.planRef.code = planCode;
    	fuelHistory.dateGen = dateGen;
    	fuelHistory.countGen = countGen;
    	fuelHistory.fuelTypeRef.code = fuelTypeCode;
    	fuelHistory.version = version;

    	return fuelHistoryDAO.add(fuelHistory);
    }

    /**
     * ���������� ������� �� ��� ��� ����
     *
     * @param planCode - ��� �����
     *
     * @throws PersistenceException
     */
    public void generatePlanFuelHistory(int planCode) throws PersistenceException
    {
    	if (planCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nNET-4440 �� ������� ��� �����!");
    	}

    	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

    	ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

    	if (plan == null)
    	{
    		throw new SystemException("\n\nNET-4440 �� �������� ���� � ����� " + planCode + " !");
    	}

    	generatePlanFuelHistory(planCode, plan.dateStart);
    }

    /**
     * ���������� ������� �� ��� ��� ����
     *
     * @param planCode - ��� �����
     * @param newDate - ����� ���� ����� (��� ���������� ����� ��� ��������� ���� ����� ��������� �������)
     *
     * @throws PersistenceException
     */
    public void generatePlanFuelHistory(int planCode, Date newDate) throws PersistenceException
    {
    	generatePlanFuelHistory(planCode, newDate, false);
    }

    /**
     * ���������� ������� �� ��� ��� ����
     *
     * @param planCode - ��� �����
     * @param newDate - ����� ���� ����� (��� ���������� ����� ��� ��������� ���� ����� ��������� �������)
     * @param recreate - ����� �� ����������� ������� �� ����� (���� = true, �� ��� ������������ �������
     * ����� ����������� ����� ������ ����� �������, ����� ����� ������ ��������� � ������������)
     *
     * @throws PersistenceException
     */
    public void generatePlanFuelHistory(int planCode, Date newDate, boolean recreate) throws PersistenceException
    {
    	if (planCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nNET-4440 �� ������� ��� �����!");
    	}

    	if (newDate == null)
    	{
    		throw new SystemException("\n\nNET-4440 �� ������ ���� ���� �����!");
    	}

    	ENPlanWorkFuelHistoryDAO fuelHistoryDAO = new ENPlanWorkFuelHistoryDAO(connection, userProfile);

    	if (recreate)
    	{
    		// � ������ ������ ��� ������������ ������� �� ����� (������������ ��� ����������� �����)
    		removePlanFuelHistory(planCode);
    		// ������� ������������ ����� ������ �� �����
    		fuelHistoryDAO._resetAutoIncrementVersion(planCode);
    	}

    	ENPlanWorkFuelHistoryShortList fuelList = fuelHistoryDAO.getFuelListForPlan(planCode);

    	if (fuelList.totalCount > 0)
    	{
    		// ����� ������ ����� ������� ������ � ��� ������, ���� � ����� ���-�� ����
	    	int version = fuelHistoryDAO._collectAutoIncrementVersion(planCode);

	    	for (int i = 0; i < fuelList.totalCount; i++)
	    	{
	    		addPlanFuelHistory(planCode, newDate, fuelList.get(i).fuelTypeRefCode, fuelList.get(i).countGen, version);
	    	}
    	}
    }

    /**
     * �������� ������� ��������� ������� ��� �� ���� �����
     *
     * @param planCode - ��� �����
     *
     * @throws PersistenceException
     */
    public void removePlanFuelHistory(int planCode) throws PersistenceException
    {
    	ENPlanWorkFuelHistoryDAO fuelHistoryDAO = new ENPlanWorkFuelHistoryDAO(connection, userProfile);

		ENPlanWorkFuelHistoryFilter fuelHistoryFilter = new ENPlanWorkFuelHistoryFilter();
		fuelHistoryFilter.planRef.code = planCode;

		int[] fuelHistoryArr = fuelHistoryDAO.getFilteredCodeArray(fuelHistoryFilter, 0, -1);

		for (int i = 0; i < fuelHistoryArr.length; i++)
		{
			fuelHistoryDAO.remove(fuelHistoryArr[i]);
		}
    }


    /**
     *  ����� ��� �������� ��������� ����� �� ������� ��������� ��� �������������� ������
     *
     *  @param orderPeriod - ������ ������
     *  @return ��� ���������� �����
     */
	public int createPlanForCountersServices(Date orderPeriod) {
		int monthPlanCode = Integer.MIN_VALUE;
		try {

			int departmentCode = ENConsts.ENDEPARTMENT_METROLOGY;
			int budgetCode = ENConsts.ENBUDGET_ENERGOSBYT;
			int elementCode = ENElement.NO_OBJECT_COUNTERS_SERVICES;

			ENPlanWork plan = new ENPlanWork();

			plan.departmentRef.code = departmentCode;
			// plan.finExecutor.code = finExecutorObj;

			plan.budgetRef.code = budgetCode;
			plan.responsibilityRef.code = getResponsibilityByBudgetCode(budgetCode);

			plan.commentGen = "����������� ��������� ���� �� �������� ���������";

			// ������ ����� ���������� �� ������� ������
			plan.dateStart = Tools.getFirstDayOfMonth(orderPeriod);
			plan.dateFinal = Tools.getLastDayOfMonth(orderPeriod);
			plan.yearGen = Tools.getYear(plan.dateStart);
			plan.monthGen = Tools.getMonth(plan.dateStart) + 1;

            plan.finExecutor.name = "³��� ����������-��������� ����������";
            plan.finExecutor.finCode = 45;
            plan.finExecutor.finTypeName = "������������ ��������";
            plan.finExecutor.finTypeCode = 1;
            plan.finExecutor.finKindName = "³���";
            plan.finExecutor.finKindCode = 3;
            plan.finExecutor.finCehName = "������ ���������";
            plan.finExecutor.finCehCode = 3;

            ///// MDAX-441
            plan.finExecutor.axOrgId = "018";
            plan.finExecutor.axParentOrgId = "0001";
            plan.finExecutor.axParentOrgName = "��̲Ͳ���������-�����˲����� �������";
            plan.finExecutor.axOrgTypeId = 3;
            plan.finExecutor.axOrgTypeName = "�����";
            /////


            if (plan.finExecutor != null) {
                if (plan.finExecutor.finCode > Integer.MIN_VALUE || plan.finExecutor.axOrgId != null) {
                    FINExecutor f = new FINExecutor();
                    f.finCode = plan.finExecutor.finCode;
                    f.name = plan.finExecutor.name;
                    f.finCehCode = plan.finExecutor.finCehCode;
                    f.finCehName = plan.finExecutor.finCehName;
                    f.finKindCode = plan.finExecutor.finKindCode;
                    f.finKindName = plan.finExecutor.finKindName;
                    f.finTypeCode = plan.finExecutor.finTypeCode;
                    f.finTypeName = plan.finExecutor.finTypeName;
                    ///// MDAX-441
                    f.axOrgId = plan.finExecutor.axOrgId;
                    f.axParentOrgId = plan.finExecutor.axParentOrgId;
                    f.axParentOrgName = plan.finExecutor.axParentOrgName;
                    f.axOrgTypeId = plan.finExecutor.axOrgTypeId;
                    f.axOrgTypeName = plan.finExecutor.axOrgTypeName;
                    /////
                    f.code = new FINExecutorDAO(connection, userProfile).add(f);
                    plan.finExecutor.code = f.code;
                }
            }

			plan.elementRef.code = elementCode;
			plan.kind.code = ENPlanWorkKind.CURRENT;
			plan.formRef.code = ENPlanWorkForm.NOPLANNED;
			plan.status.code = ENPlanWorkStatus.GOOD;
			plan.stateRef.code = ENPlanWorkState.TO;
			plan.typeRef.code = ENPlanWorkType.NOT_PLANED;


			if (monthPlanCode == Integer.MIN_VALUE) {
				Context context = new InitialContext();
				Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);

				ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
						.narrow(planRef, ENPlanWorkControllerHome.class);
				ENPlanWorkController planController = planHome.create();

				monthPlanCode = planController.add(plan);

				///// ��������� ���� ��� ����������
				Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

				ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject
						.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
				ENMOL2PlanWorkController mol2planController = mol2planHome.create();

				ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
				mol2planObj.code = Integer.MIN_VALUE;
				mol2planObj.planRef = new ENPlanWorkRef();
				mol2planObj.planRef.code = monthPlanCode;
				mol2planObj.molCode = "0000";
				mol2planObj.molName = "��������� ��� EnergyNet";

				mol2planController.add(mol2planObj);
			}

			if (monthPlanCode == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("\n\n"
						+ "������� �� ��� ��������� ̳������� �����!");
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return monthPlanCode;
	}


    /**
     *  ����� ��� �������� ������ (���������, �������-����� � �������-�����) ��� ��������������� �������� ���������� �� ���������
     *
     *  @param act - ��� �� ������� ���������� �� ��������� ({@link ENAct})
     *  @return ��� ���������� �������-�����
     */
	public int createPlanForRecyclableMaterialsByAct(ENAct act) {

		int monthPlanCode = Integer.MIN_VALUE;
		int factCode = Integer.MIN_VALUE;

		try {
			int departmentCode = ENConsts.ENDEPARTMENT_VMTP;
			int budgetCode = ENConsts.ENBUDGET_VMTP;
			int elementCode = ENElement.NO_OBJECT_RECYCLABLE_MATERIALS;

			ENPlanWork plan = new ENPlanWork();

			plan.departmentRef.code = departmentCode;
			// plan.finExecutor.code = finExecutorObj;

			plan.budgetRef.code = budgetCode;
			plan.responsibilityRef.code = getResponsibilityByBudgetCode(budgetCode);

			plan.commentGen = "����������� ��������� ���� �� ����������� �������� �� �������� ��������";

			plan.dateStart = Tools.getFirstDayOfMonth(act.dateAct);
			plan.dateFinal = Tools.getLastDayOfMonth(act.dateAct);
			plan.yearGen = Tools.getYear(plan.dateStart);
			plan.monthGen = Tools.getMonth(plan.dateStart) + 1;

            plan.finExecutor.name = "³��� ����������-��������� ����������";
            plan.finExecutor.finCode = 45;
            plan.finExecutor.finTypeName = "������������ ��������";
            plan.finExecutor.finTypeCode = 1;
            plan.finExecutor.finKindName = "³���";
            plan.finExecutor.finKindCode = 3;
            plan.finExecutor.finCehName = "������ ���������";
            plan.finExecutor.finCehCode = 3;

            ///// MDAX-441
            plan.finExecutor.axOrgId = "018";
            plan.finExecutor.axParentOrgId = "0001";
            plan.finExecutor.axParentOrgName = "��̲Ͳ���������-�����˲����� �������";
            plan.finExecutor.axOrgTypeId = 3;
            plan.finExecutor.axOrgTypeName = "�����";
            /////


            if (plan.finExecutor != null) {
                if (plan.finExecutor.finCode > Integer.MIN_VALUE || plan.finExecutor.axOrgId != null) {
                    FINExecutor f = new FINExecutor();
                    f.finCode = plan.finExecutor.finCode;
                    f.name = plan.finExecutor.name;
                    f.finCehCode = plan.finExecutor.finCehCode;
                    f.finCehName = plan.finExecutor.finCehName;
                    f.finKindCode = plan.finExecutor.finKindCode;
                    f.finKindName = plan.finExecutor.finKindName;
                    f.finTypeCode = plan.finExecutor.finTypeCode;
                    f.finTypeName = plan.finExecutor.finTypeName;
                    ///// MDAX-441
                    f.axOrgId = plan.finExecutor.axOrgId;
                    f.axParentOrgId = plan.finExecutor.axParentOrgId;
                    f.axParentOrgName = plan.finExecutor.axParentOrgName;
                    f.axOrgTypeId = plan.finExecutor.axOrgTypeId;
                    f.axOrgTypeName = plan.finExecutor.axOrgTypeName;
                    /////
                    f.code = new FINExecutorDAO(connection, userProfile).add(f);
                    plan.finExecutor.code = f.code;
                }
            }

			plan.elementRef.code = elementCode;
			plan.kind.code = ENPlanWorkKind.CURRENT;
			plan.formRef.code = ENPlanWorkForm.NOPLANNED;
			//plan.status.code = ENPlanWorkStatus.GOOD;
			plan.stateRef.code = ENPlanWorkState.WRITINGS_TMC;
			plan.typeRef.code = ENPlanWorkType.WRITINGS;

			// ������� ���� ���� �� ������ ��� ���������. ���� �� ������, ��������
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			int[] planArr = planDAO.getFilteredCodeArray(plan, null, null, 0, -1, null);

			if (planArr.length > 0)
			{
				monthPlanCode = planArr[0];
			}

			Context context = new InitialContext();

			Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
					.narrow(planRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planController = planHome.create();

			if (monthPlanCode == Integer.MIN_VALUE) {

				plan.status.code = ENPlanWorkStatus.GOOD;
				monthPlanCode = planController.add(plan);

				///// ��������� ���� ��� ����������
				Object mol2planRef = context.lookup(ENMOL2PlanWorkController.JNDI_NAME);

				ENMOL2PlanWorkControllerHome mol2planHome = (ENMOL2PlanWorkControllerHome) PortableRemoteObject
						.narrow(mol2planRef, ENMOL2PlanWorkControllerHome.class);
				ENMOL2PlanWorkController mol2planController = mol2planHome.create();

				ENMOL2PlanWork mol2planObj = new ENMOL2PlanWork();
				mol2planObj.code = Integer.MIN_VALUE;
				mol2planObj.planRef = new ENPlanWorkRef();
				mol2planObj.planRef.code = monthPlanCode;
				//mol2planObj.molCode = "0000";
				//mol2planObj.molName = "��������� ��� EnergyNet";
				mol2planObj.molCode = act.finMolCode;
				mol2planObj.molName = act.finMolName;

				mol2planController.add(mol2planObj);
			}

			if (monthPlanCode == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("\n\n"
						+ "������� �� ��� ��������� ̳������� �����!");
			}

			// ������� �� ���. ����� �������-���� � �����, ������ ���� ������ ����
			int npzCode = planController.closePlanWorkWithDate(monthPlanCode, act.dateAct);

			if (npzCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4543 �� ������� ������� ��������-���� �� ̳������� ����� � ����� " + monthPlanCode + " !");
			}

			// ������� �� �������-����� �����-������� � �����-�������� �� ����
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Object wo2planRef = context.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);
			ENWorkOrder2ENPlanWorkControllerHome wo2planHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject
					.narrow(wo2planRef, ENWorkOrder2ENPlanWorkControllerHome.class);
			ENWorkOrder2ENPlanWorkController wo2planController = wo2planHome.create();

			ENWorkOrder2ENPlanWork wo2plan = new ENWorkOrder2ENPlanWork();
			wo2plan.plan.code = npzCode;
			wo2plan.workOrder = new ENWorkOrder();
			wo2plan.workOrder.department.code = departmentCode;
			wo2plan.workOrder.dateGen = act.dateAct;
			wo2plan.workOrder.commentGen = "����������� �������� �����-�������� ��� ����������� �������� �� ����. ��������";
			wo2plan.workOrder.finMolCode = act.finMolCode;
			wo2plan.workOrder.finMolName = act.finMolName;

			int wo2planCode = wo2planController.add(wo2plan);

			wo2plan = wo2planController.getObject(wo2planCode);

			if (wo2plan == null)
			{
				throw new SystemException("\n\nNET-4543 ������� �� ��� ��������� �����-�������� �� ���� � ����� " + npzCode + " !");
			}

			Object finMolDataRef = context.lookup(FINMolDataController.JNDI_NAME);
			FINMolDataControllerHome finMolDataHome = (FINMolDataControllerHome) PortableRemoteObject
					.narrow(finMolDataRef, FINMolDataControllerHome.class);
			FINMolDataController finMolDataController = finMolDataHome.create();

			FINMolData finMolData = new FINMolData();
			finMolData.workOrder.code = wo2plan.workOrder.code;
			finMolData.finMolCode = act.finMolCode;
			finMolData.finMolName = act.finMolName;
			finMolData.molTypeRef.code = FINMolType.MASTER;

			finMolDataController.add(finMolData, wo2plan.workOrder.code, 1);
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////

			// ������� �� �������-����� �������-����
			factCode = planController.closePlanWork(npzCode);

			if (factCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4543 �� ������� ������� ��������-���� �� ��������-����� � ����� " + npzCode + " !");
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}

		//return monthPlanCode;
		return factCode;
	}

	public LinkedHashMap<Integer, TKMaterialsData> generateTKMaterialsData()
	{
		try {
			TKMaterialParametersDAO materialParametersDAO = new TKMaterialParametersDAO(connection, userProfile);
			TEMPNomenclaturesDAO tempNomenclaturesDAO = new TEMPNomenclaturesDAO(connection, userProfile);

			TKMaterialParametersFilter materialParametersFilter = new TKMaterialParametersFilter();
			materialParametersFilter.conditionSQL =
					" TKMATERIALPARAMETERS.MINALLOWEDQUANTITY is not null AND " +
					" TKMATERIALPARAMETERS.materialrefcode in " +
					" (select mr.materialrefcode " +
					"  from tkmaterials2rccldmtrls mr " +
					"  where mr.materialrefcode = TKMATERIALPARAMETERS.materialrefcode)";
			materialParametersFilter.orderBySQL = "TKMATERIALPARAMETERS.MATERIALREFCODE";

			TKMaterialParametersShortList materialParametersList = materialParametersDAO.getScrollableFilteredList(materialParametersFilter, 0, -1);

			LinkedHashMap<Integer, TKMaterialsData> materialsData = new LinkedHashMap<>();

			for (int i = 0; i < materialParametersList.totalCount; i++)
			{
				//LinkedHashMap<AXPurchaseData, AXPurchaseData> purchaseData = new LinkedHashMap<AXPurchaseData, AXPurchaseData>();
	            //AXPurchaseData pKey;
				TEMPNomenclaturesFilter tempNomenclaturesFilter = new TEMPNomenclaturesFilter();
				tempNomenclaturesFilter.materialRef.code = materialParametersList.get(i).materialRefCode;
				// ����� ������ �� ������������, � ������� ������� ��������� ��������� � �������� ��������� ��������� ���������
				tempNomenclaturesFilter.measurementname = materialParametersList.get(i).measurementName;
				TEMPNomenclaturesShortList tempNomenclaturesList = tempNomenclaturesDAO.getScrollableFilteredList(tempNomenclaturesFilter, 0, -1);

				String nomenclaturesList = "";

				for (int j = 0; j < tempNomenclaturesList.totalCount; j++)
				{
					if (nomenclaturesList.equals(""))
					{
						nomenclaturesList = "'" + tempNomenclaturesList.get(j).nn + "'";
					}
					else
					{
						nomenclaturesList += ", '" + tempNomenclaturesList.get(j).nn + "'";
					}
				}

				if (nomenclaturesList.equals(""))
				{
					continue;
				}

				TKMaterialsData pValue = new TKMaterialsData(
							materialParametersList.get(i).materialRefCode,
							materialParametersList.get(i).materialRefNomenclatureNumber,
							materialParametersList.get(i).minAllowedQuantity,
							nomenclaturesList
						);

				materialsData.put(new Integer(materialParametersList.get(i).materialRefCode), pValue);
			}

			return materialsData;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void reserveMaterialsForRecyclableMaterials(int factCode)
	{
		try {
			ENWorkOrder workOrder = getWorkOrderByPlanCode(factCode);

			if (workOrder == null)
			{
				throw new SystemException("\n\nNET-4543 �� �������� �����-�������� ��� ��������-����� � ����� " + factCode + " !");
			}

			if (workOrder.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4543 �� �������� �����-�������� ��� ��������-����� � ����� " + factCode + " !");
			}

	        FINMolDataDAO finMolDataDAO = new FINMolDataDAO(connection, userProfile);

	        FINMolDataFilter finMolDataFilter = new FINMolDataFilter();
	        finMolDataFilter.molTypeRef.code = FINMolType.MASTER;
	        finMolDataFilter.workOrder.code = workOrder.code;

	        int[] finMolDataArr = finMolDataDAO.getFilteredCodeArray(finMolDataFilter, 0, -1);

	        if (finMolDataArr.length == 0)
	        {
	        	throw new SystemException("\n\nNET-4543 �� �������� ����� �� ��� ��� ��������-����� � ����� " + factCode + " !");
	        }

	        FINMolData finMolData = finMolDataDAO.getObject(finMolDataArr[0]);

	        if (finMolData == null)
	        {
	        	throw new SystemException("\n\nNET-4543 �� �������� ����� �� ��� ��� ��������-����� � ����� " + factCode + " !");
	        }

	        if (finMolData.code == Integer.MIN_VALUE)
	        {
	        	throw new SystemException("\n\nNET-4543 �� �������� ����� �� ��� ��� ��������-����� � ����� " + factCode + " !");
	        }

	        FINDoc2MolDataDAO finDoc2MolDataDAO = new FINDoc2MolDataDAO(connection, userProfile);

	        FINDoc2MolDataFilter finDoc2MolDataFilter = new FINDoc2MolDataFilter();
	        finDoc2MolDataFilter.molData.code = finMolDataArr[0];
	        finDoc2MolDataFilter.finDocTypeRef.code = FINDocType.MOVE_302;

	        FINDoc2MolDataShortList finDoc2MolDataList = finDoc2MolDataDAO.getScrollableFilteredList(finDoc2MolDataFilter, 0, -1);

	        if (finDoc2MolDataList.totalCount == 0)
	        {
	        	throw new SystemException("\n\nNET-4543 �� �������� ����� �� ��� ��� ��������-����� � ����� " + factCode + " !");
	        }

	        int finDocCode = finDoc2MolDataList.get(0).finDocCode;

	        ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

	        ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
	        estimateItemFilter.planRef.code = factCode;
	        estimateItemFilter.materialRef.code = TKConsts.TKMATERIALS_WRITING;
	        estimateItemFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

	        int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

	        if (estimateItemArr.length == 0)
	        {
	        	throw new SystemException("\n\nNET-4543 �� ��������� ������� ��� ������� � �������-���� � ����� " + factCode + " !");
	        }

	        int estimateItemCode = estimateItemArr[0];

	        ///// �������� �������
			Context context = new InitialContext();

	        Object finMaterialsRef = context.lookup(FINMaterialsController.JNDI_NAME);
	        FINMaterialsControllerHome finMaterialsHome = (FINMaterialsControllerHome) PortableRemoteObject.
	        		narrow(finMaterialsRef, FINMaterialsControllerHome.class);
	        FINMaterialsController finMaterialsController = finMaterialsHome.create();

            String balansNumberCondition = "";
            String materialCondition = "and h.op_kind_id not in ('10','310','300')";
            String molCode = finMolData.finMolCode;
            Date docDate = workOrder.dateGen;

            LinkedHashMap<Integer, TKMaterialsData> materialsData = generateTKMaterialsData();

            Iterator<Integer> iterator = materialsData.keySet().iterator();
            while (iterator.hasNext()) {
                Integer materialsDataKey = (Integer)iterator.next();
                TKMaterialsData materialsDataValue = (TKMaterialsData)materialsData.get(materialsDataKey);

                if (materialsDataValue.nomenclaturesList == null)
                {
                	throw new SystemException("\n\nNET-4543 �� �������� ��'������ ����������� ��� ����. �������� � ����� " +
                			materialsDataValue.materialCode + " !");
                }

                if (materialsDataValue.nomenclaturesList.equals(""))
                {
                	throw new SystemException("\n\nNET-4543 �� �������� ��'������ ����������� ��� ����. �������� � ����� " +
                			materialsDataValue.materialCode + " !");
                }

                FINMaterialsFilter fmFilter = new FINMaterialsFilter();
                // ���������� �������� ����� ��� (?)
                //fmFilter.rest_purpose_type_id = ...;
                fmFilter.conditionSQL = "( substr(dat.bal_sch,1,2) in ('15', '20', '22') ) and " +
                		" nn in (" + materialsDataValue.nomenclaturesList + ") and " +
                	    " dat.rest_purpose_type_id in (" + RQConsts.REST_PURPOSE_TYPE_ID_OPERATIVE + "," + RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE + ") ";


                FINMaterialsList finMaterialsFKList =
                        finMaterialsController.getMaterialsList(fmFilter, balansNumberCondition, molCode, materialCondition, docDate, finDocCode);

                System.out.println("%%%%% RESTS count for " + materialsDataValue.materialCode + ": " + finMaterialsFKList.totalCount);

                if (finMaterialsFKList.totalCount == 0)
                {
                	continue;
                }

                for (int i = 0; i < finMaterialsFKList.totalCount; i++)
                {
                    // ���� ���-�� ��������� � �������� ������ ���������� �����������, �� ��� ��� ������
                    if (finMaterialsFKList.get(i).quantity.compareTo(materialsDataValue.minAllowedQuantity) < 0)
                    {
                        FINMaterials finMaterialsObj = new FINMaterials();

                        finMaterialsObj.quantity = finMaterialsFKList.get(i).quantity;

                        finMaterialsObj.estimateItemRef.code = estimateItemCode;
                        finMaterialsObj.finDocItemCode = -1;

                        finMaterialsObj.nn = finMaterialsFKList.get(i).nn;
                        finMaterialsObj.mat_name = finMaterialsFKList.get(i).mat_name;
                        finMaterialsObj.mu_name = finMaterialsFKList.get(i).mu_name;

                        finMaterialsObj.div_code = molCode;
                        finMaterialsObj.div_name = finMaterialsFKList.get(i).div_name;

                        finMaterialsObj.rest_purpose_name = finMaterialsFKList.get(i).rest_purpose_name;
                        finMaterialsObj.partner_name = finMaterialsFKList.get(i).partner_name;
                        finMaterialsObj.doc_date = finMaterialsFKList.get(i).doc_date;

                        finMaterialsObj.party_discription = finMaterialsFKList.get(i).party_discription;
                        finMaterialsObj.rest_purpose_id = finMaterialsFKList.get(i).rest_purpose_id;
                        finMaterialsObj.rest_purpose_type_id = finMaterialsFKList.get(i).rest_purpose_type_id;
                        finMaterialsObj.budget_core_id = finMaterialsFKList.get(i).budget_core_id;

                        finMaterialsObj.frc_code = finMaterialsFKList.get(i).frc_code;
                        finMaterialsObj.frc_name = finMaterialsFKList.get(i).frc_name;

                        finMaterialsObj.calc_price = finMaterialsFKList.get(i).calc_price;
                        finMaterialsObj.price = finMaterialsFKList.get(i).price;
                        finMaterialsObj.cost = finMaterialsFKList.get(i).cost;

                        finMaterialsObj.bal_sch = finMaterialsFKList.get(i).bal_sch;

                        finMaterialsObj.mat_id = finMaterialsFKList.get(i).mat_id;

                        finMaterialsObj.party_id = finMaterialsFKList.get(i).party_id;

                        finMaterialsObj.partner = finMaterialsFKList.get(i).partner;

                        finMaterialsObj.mu_id = finMaterialsFKList.get(i).mu_id;

                        finMaterialsObj.doc_num = finMaterialsFKList.get(i).doc_num;

                        finMaterialsObj.fullQuantity = finMaterialsFKList.get(i).fullQuantity;
                        finMaterialsObj.fullCost = finMaterialsFKList.get(i).fullCost;

                        finMaterialsObj.wear_date = finMaterialsFKList.get(i).wear_date;

                        /////
                        finMaterialsObj.ax_frc_code = finMaterialsFKList.get(i).ax_frc_code;
                        finMaterialsObj.ax_inv_avail_phys_unit = finMaterialsFKList.get(i).ax_inv_avail_phys_unit;
                        finMaterialsObj.ax_inv_deducted_unit = finMaterialsFKList.get(i).ax_inv_deducted_unit;
                        finMaterialsObj.ax_inv_physical_value = finMaterialsFKList.get(i).ax_inv_physical_value;
                        finMaterialsObj.ax_inv_posted_qty_unit = finMaterialsFKList.get(i).ax_inv_posted_qty_unit;
                        finMaterialsObj.ax_inv_posted_value = finMaterialsFKList.get(i).ax_inv_posted_value;
                        finMaterialsObj.ax_inv_received_unit = finMaterialsFKList.get(i).ax_inv_received_unit;
                        finMaterialsObj.ax_inv_reserv_phys_unit = finMaterialsFKList.get(i).ax_inv_reserv_phys_unit;
                        finMaterialsObj.ax_party_id = finMaterialsFKList.get(i).ax_party_id;
                        finMaterialsObj.ax_rest_purpose_id = finMaterialsFKList.get(i).ax_rest_purpose_id;
                        finMaterialsObj.ax_rest_purpose_typeid = finMaterialsFKList.get(i).ax_rest_purpose_typeid;
                        /////

                        finMaterialsObj.molDataRef.code = finMolData.code;
                        finMaterialsObj.parentRef.code = Integer.MIN_VALUE;
                        finMaterialsObj.oldCode = Integer.MIN_VALUE;

                        // ������ �������� (isException) ������������� � false - ����� ��� ������������� �������� �������
                        // �� ������� exception, � ������ ������������ ��� ������
                        finMaterialsController.addMaterials(finMaterialsObj, false);
                    }
                }

            }

            /////

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

    public boolean checkForRecyclableMaterials(ENPlanWork plan)
    {
    	return checkForRecyclableMaterials(plan, true);
    }

    public boolean checkForRecyclableMaterials(ENPlanWork plan, boolean isException)
    {
    	if (plan.elementRef.code == ENElement.NO_OBJECT_RECYCLABLE_MATERIALS)
    	{
	        AuthLogic al = new AuthLogic(connection, userProfile);

	        if (! al.checkPermissionSilent("ksoe/energynet/ENActController", "createActForRecyclableMaterials"))
	        {
	        	if (isException)
	        	{
	        		throw new EnergyproSystemException("\n\nNET-4543 � ��� ���� ���� �� �� �������� (����������� �������� �� ����.��������)!");
	        	}
	        	else
	        	{
	        		return false;
	        	}
	        }
    	}

    	return true;
    }


    /**
     *  ����� ��� �������� ���� �� �������� ����������� ������ ����������� (����������� ���. ������) - ����� �����
     *
     *  @param plan - ���� (������ ENPlanWork)
     */
	public void checkEZNoplannedPlansClosing(ENPlanWork plan)
	{
		try
		{
	        ///// 06.04.15
	        if (plan.kind.code != ENPlanWorkKind.NPW && plan.kind.code != ENPlanWorkKind.FACT &&
	        	plan.formRef.code == ENPlanWorkForm.NOPLANNED && plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT)
	        {
	        	ElementLogic elementLogic = new ElementLogic(connection, userProfile);
		        int elementType = elementLogic.getElementTypeByPlan(plan);

		        if (elementType != ENElementType.SERVICES_OBJECT && elementType != ENElementType.WRITING_NO_OBJECT)
		        {
			        // 10.04.15 ���� ���� ��� ������ �������� (�.�. ��� ���������), �� ���������.
			        // �������� ��� �� ������� � ��������� ����� ������������� ��������
		        	if (plan.kind.code == ENPlanWorkKind.CURRENT)
		        	{
		        		ENPlanCorrectHistoryFilter pchFilter = new ENPlanCorrectHistoryFilter();
		        		pchFilter.planNewRef.code = plan.code;
		        		pchFilter.reason.code = ENPlanCorrectReason.MOVE_TO_CURRENT;

		        		ENPlanCorrectHistoryDAO pchDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);

		        		int[] pchArr = pchDAO.getFilteredCodeArray(pchFilter, 0, -1);

		        		if (pchArr.length > 0)
		        		{
		        			return;
		        		}
		        	}

		        	//throw new SystemException("\n\n��������� ������������ ����� ��� ����������� ���������� ����������� ������!");
		        	AuthLogic authLogic = new AuthLogic(connection, userProfile);
		        	//if (! authLogic.checkPermissionSilent("ksoe/energynet/ENPlanWorkController", "closeEZNoplannedPlans"))
		        	if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "closeEZNoplannedPlans"))
		        	{
		        		throw new SystemException("\n\n��������� ������������ ����� ��� ����������� (���� ������ �� �������) ���������� ����������� ������!");
		        	}
		        }
	        }
	        /////
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ����� ��� ��������, ��������� �� ��� ����������� (��� FINExecutor'�)
	 *
	 * @param axOrgId1 - ���� axOrgId 1-�� ������� FINExecutor
	 * @param axOrgId2 - ���� axOrgId 2-�� ������� FINExecutor
	 * @param finCode1 - ���� finCode 1-�� ������� FINExecutor
	 * @param finCode2 - ���� finCode 2-�� ������� FINExecutor
	 *
	 * @return true - ���� ��� ���� � ��� �� �����������, ����� false
	 */
	public boolean compareFinExecutorsByCodes(String axOrgId1, String axOrgId2, int finCode1, int finCode2)
	{
    	boolean isAXOrgIdsEqual = false;
    	boolean isFinCodesEqual = false;

		if (axOrgId1 != null && axOrgId2 != null)
		{
			isAXOrgIdsEqual = axOrgId1.equals(axOrgId2);
		}

		if (finCode1 != Integer.MIN_VALUE && finCode2 != Integer.MIN_VALUE)
		{
			isFinCodesEqual = (finCode1 == finCode2);
		}

		/*
		if (!isAXOrgIdsEqual && !isFinCodesEqual)
		{
			boolean usesMDAXData = false;
	    	AuthLogic netAuth = new AuthLogic(connection, userProfile);
	    	usesMDAXData = netAuth.checkUsesMDAXData();

	    	if (usesMDAXData)
	    	{

	    	}
	    	else
	    	{

	    	}
		}
		*/

		return (isAXOrgIdsEqual || isFinCodesEqual);
	}


	/**
	 *  �������� ������ ������ � �������������
	 *  @param decreeCode
	 */
	public void removePlan2Decree(int decreeCode) {
		try {
			ENPlanWork2DecreeDAO planWork2DecreeDao = new ENPlanWork2DecreeDAO(connection, userProfile);
			ENPlanWork2DecreeFilter planWork2DecreeFilter = new ENPlanWork2DecreeFilter();
			planWork2DecreeFilter.decreeCode = decreeCode;

			int pArr[] = planWork2DecreeDao.getFilteredCodeArray(planWork2DecreeFilter, 0, -1);
			for (int p = 0; p < pArr.length; p++) {
				planWork2DecreeDao.remove(pArr[p]);
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkForProhibitedWorks(int planCode, int elementType, String additionalException) {
		checkForProhibitedWorks(planCode, elementType, additionalException, false);
	}

	/**
	 * ��������, ���� �� � ����� ������ �� ��������� "�����, �� �� ����� ���������������"
	 * ��� ������ � ��������� "���������� ���������������"
	 *
	 * @param planCode - ��� �����
	 */
	public void checkForProhibitedWorks(int planCode, int elementType, String additionalException, boolean isForSupplier)

	{
		try {
			ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
			planItemFilter.planRef.code = planCode;
			planItemFilter.conditionSQL = "ENPLANWORKITEM.COUNTGEN > 0 ";

			ENPlanWorkItemShortList planItemShortList = planItemDAO.getScrollableFilteredList(planItemFilter, 0, -1);

			for (int z=0;z<planItemShortList.totalCount;z++) {
				checkForProhibitedTechCard(planItemShortList.get(z).kartaRefCode, planItemShortList.get(z).planRefCode, elementType, additionalException, isForSupplier);
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkForProhibitedTechCard(int techCardCode, int planCode, int elementType, String additionalException) {
		checkForProhibitedTechCard(techCardCode, planCode, elementType, additionalException, false);
	}

	/**
	 * �������� �� ������ �� ��������� "�����, �� �� ����� ���������������"
	 * ��� ������ � ��������� "���������� ���������������"
	 * ��� �� ����������� ������ �� �����������
	 * @param planCode - ��� �����
	 */
	public void checkForProhibitedTechCard(int techCardCode, int planCode, int elementType, String additionalException, boolean isForSupplier)

	{
		try {

			TKTechCardDAO tkDAO = new TKTechCardDAO(connection, userProfile);
			TKTechCard tk = tkDAO.getObject(techCardCode);

			if (tk.techcardsource.code == TKTechCardSource.NOT_BE_USED && elementType != ENElementType.SERVICES_OBJECT) {
	        	throw new EnergyproSystemException("\n\n �� ����� ��������������� ������ � ������� ��������� \"�����, �� �� ����� ���������������\".\n" +
	        			additionalException);
			}

			if (tk.isProhibited == TKTechCard.PROHIBITED)
			{
	        	throw new EnergyproSystemException("\n\n �� ����� ��������������� ������ � ������� \"���������� ���������������\".\n" +
	        			additionalException);
			}

			// ��� ����� �� �����������/���������� �� �������� ����������� �� ���������
			/////
			if (isForSupplier) {
				return;
			}

			TKClassificationTypeDAO tkClassificationTypeDAO = new TKClassificationTypeDAO(connection, userProfile);
			TKClassificationType tkClassificationType = tkClassificationTypeDAO.getObject(tk.classificationType.code);

			if (tkClassificationType.isConnectionForSupplier == 1 || tkClassificationType.isDisconnectionForSupplier == 1) {
				return;
			}
			/////


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ����� ��� ��������� ���� ������ ����� �� ����� (��� �����������)
	 *
	 * @param planCode - ��� �����
	 * @param newDate - ����� ���� ������ �����
	 */
	public void changePlanDateForByt(int planCode, Date newDate)
	{
		try
		{
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObject(planCode);

            if (plan == null)
            {
            	throw new SystemException("\n\nNET-4516 �� �������� ���� � ����� " + planCode);
            }

            ElementLogic elementLogic = new ElementLogic(connection, userProfile);
            int elementType = elementLogic.getElementTypeByPlan(plan);

            if (elementType != ENElementType.TY_BYT && elementType != ENElementType.ROUTE_BYT && elementType != ENElementType.TY_PROM ) // 30.08.2019 ����������� � ��������� , ��������� ���������� � ��� �����
            {
            	throw new SystemException("\n\nNET-4516 �� �������� ��������������� ���� ��� ��������� ����� �����!");
            }

			///////
			// ��������, ����� ����� ���� ������ ���������� ����� �������� � ����� �����
			Date dateStart, planMonthStart, planMonthFinish;
			dateStart = Tools.clearTimeOfDate(newDate);

			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.YEAR, plan.yearGen);
			calendar.set(Calendar.MONTH, plan.monthGen - 1);
			calendar.set(Calendar.DATE, 1);
			planMonthStart = Tools.clearTimeOfDate(calendar.getTime());


			// 08.05.2019 �� ������� ���������� � , ����� ���� ������ �� ����� � ������ �������� ����� �����������.
			/*if (dateStart.before(planMonthStart))
			{
				throw new EnergyproSystemException("\n\nNET-4516 ���� ������� ��������� ���� ������� ���� � ����� " +
						plan.monthGen + " ����� " + plan.yearGen + " ���� !");
			}*/

			Calendar calendar_2 = Calendar.getInstance();
			calendar_2.set(Calendar.YEAR, plan.yearGen);
			calendar_2.set(Calendar.MONTH, plan.monthGen - 1);
			calendar_2.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
			planMonthFinish = Tools.clearTimeOfDate(calendar_2.getTime());

			// 08.05.2019 �� ������� ���������� � , ����� ���� ������ �� ����� � ������ �������� ����� �����������.
			/*if (dateStart.after(planMonthFinish))
			{
				throw new EnergyproSystemException("\n\nNET-4516 ���� ������� ��������� ���� ������� ���� � ����� " +
						plan.monthGen + " ����� " + plan.yearGen + " ���� !");
			}*/
			///////

			Date planDateStart = Tools.clearTimeOfDate(plan.dateStart);
			newDate = Tools.clearTimeOfDate(newDate);

			// ���� ���� �� ����������, �������
			if (newDate.equals(planDateStart))
			{
				return;
			}

			plan.dateStart = newDate;

			Calendar cc = Calendar.getInstance();
			cc.setTime(plan.dateStart);


			plan.monthGen = cc.get(Calendar.MONTH)+1;  // calendar.get(Calendar.MONTH) + 1; /// zzzzz
			planDAO.save(plan);

			// ���� ���� ������ � �������������, �������� ���� ������ ���������� ����� ��� ��������� �����������
			FINExecutor2PlanDAO f2pDAO = new FINExecutor2PlanDAO(connection, userProfile);

			FINExecutor2PlanFilter f2pFilter = new FINExecutor2PlanFilter();
			f2pFilter.planRef.code = planCode;
			f2pFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;

			int[] f2pArr = f2pDAO.getFilteredCodeArray(f2pFilter, 0, -1);

			if (f2pArr.length > 0)
			{
				FINExecutor2Plan f2pObj = f2pDAO.getObject(f2pArr[0]);
				f2pObj.dateStart = newDate;
				f2pDAO.save(f2pObj);
			}

			// ����������� ����� ���������� ����� � ���� ��������� ����� �� �����
			recalcTotalTime(planCode);

		} catch (PersistenceException e) {
	        throw new EnergyproSystemException(e.getMessage(), e);
	    }
	}


	public void save(ENPlanWork object) {
		this.save(object, false);
	}

	public void save(ENPlanWork object, boolean isFromWorkOrderByt) {
		this.save(object, isFromWorkOrderByt, false);
	}

	public void save(ENPlanWork object, boolean isFromWorkOrderByt,
			boolean isFromBilling) {
		this.save(object, isFromWorkOrderByt, isFromBilling, false);
	}

	public void save(ENPlanWork object, boolean isFromWorkOrderByt,
			boolean isFromBilling, boolean isOnlyRebinding) {
		this.save(object, isFromWorkOrderByt, isFromBilling, isOnlyRebinding, false);
	}

	public void save(ENPlanWork object, boolean isFromWorkOrderByt,
			boolean isFromBilling, boolean isOnlyRebinding, boolean isForSupplier) {

	    //SUPP-40334. ���������� ���������� isOnlyRebinding ����� ��� ������������
		//����������������� ������������� ����������� ������ � ��������� ��������
		//�������������, ������� ��� �������� �������� � �� ��� ��������� ������ �����
		Connection finConn = null;
	    Connection authCon = null;

	    try {
	    	authCon = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

	        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(userProfile, connection);
	        ENPlanWorkDAO objectDAO = new ENPlanWorkDAO(userProfile, connection);
	        ENPlanwork2GeneralContractsDAO p2genDAO = new ENPlanwork2GeneralContractsDAO(userProfile, connection);
	        ENGeneralContractsDAO genContrDAO = new ENGeneralContractsDAO(userProfile, connection);
	        EstimateLogic estLogic = new EstimateLogic(connection, userProfile);
	        FINExecutorLogic finExecLogic = new FINExecutorLogic(connection, userProfile);

	        ENPlanWork oldPlan = objectDAO.getObject(object.code);

	        ElementLogic elementLogic = new ElementLogic(connection, userProfile);
	        int eType = elementLogic.getElementTypeByPlan(object);

	        if (object.sourceRef == null ) object.sourceRef.code = ENPlanWorkSource.MANUAL;
	        if (object.sourceRef.code == Integer.MIN_VALUE ) object.sourceRef.code = ENPlanWorkSource.MANUAL;


	        /* 03.03.2020 SUPP-89938 ���� ������, �.�. ����������� ���������, � �������� �� ������� ������� ����������
	        if ((oldPlan.yearGen >= 2016 || object.yearGen >= 2016) ||
	            (object.dateStart.compareTo(new SimpleDateFormat("dd.MM.yyyy").parse("01.01.2016")) >= 0) ||
	            (oldPlan.dateStart.compareTo(new SimpleDateFormat("dd.MM.yyyy").parse("01.01.2016")) >= 0))
	        {
	        	this.checkForProhibitedWorks(object.code, eType, "������� ���������� ��� �����!", isForSupplier);
	        }
	        */


	        boolean isServices = false;
	        if (object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
	                || object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
	            isServices = true;
	        }

	        // ��������� ������������ �� 2016
	        if
	           ((object.yearGen == 2016 || object.yearGen == 2017 || object.yearGen == 2019) && object.formRef.code == ENPlanWorkForm.PLANNED
	           && ((object.kind.code != ENPlanWorkKind.NPW) && (object.kind.code != ENPlanWorkKind.FACT)))

	        {
	        		if (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE)
	        		{
	        			if (object.typeRef.code != ENPlanWorkType.SIZ)
	        			{
	        				this.checkPlanAccessByLogin(object, userProfile.userName);
	        			}
	        		}
	        }


	        // 12.03.14 ������ �� ���� �������� �� ������ �����??? ����� ����, ��� ����? ;)
	        if (object.status.code != ENPlanWorkStatus.GOOD && object.status.code != ENPlanWorkStatus.PRECONFIRMED && !isOnlyRebinding)
	        {
	            throw new EnergyproSystemException("\n\n���� � ����� " + object.code + " ���������� ����������, ���� �� �� ������������!");
	        }



	        // �������� �� ������� ������������ ������ �� �����

	        ///// 06.09.12 ������ �������� ������� ������ �� 2013 ��� ��� ���. ��������
	        if (object.budgetRef.code != oldPlan.budgetRef.code)
	        {
	            ENDepartmentDAO depDAO = new ENDepartmentDAO(userProfile, connection);
	            ENDepartment dep = depDAO.getObject(object.budgetRef.code);
	            if (dep.managementRef != null)
	            {
	                if (dep.managementRef.code > Integer.MIN_VALUE)
	                {
	                    if (dep.managementRef.code == ENManagement.TECHNICAL)
	                    {
	                        this.checkPeriodYearNEW(object, true);
	                    }
	                }
	            }
	        }
	        /////


	        /* SUPP-3877 YurkovskyAV 29/05/13
	         * ������ ������� �� ��������� ������������ ���� ��������� ���������� ����� �� ��������, �.�.
	         * ����� ���� ���.���������� �� ��������� ��������� � �������������� � ������ ������ ����� ���� ������
	         * ����.
	         * ��� ������������ ������������ ��� ��������� � ������ �� �����...
	         *

	        // �������� ���� ����� �������� �� ������������� �� ������ � ���� ��������� ����� ���������� ����� �� ������
	        // �� �������� ��� �� ��� ����� � ����� ������� �������� � ��������������  ����� ����� �� ���� . ���� ��� �� ��� �� ��������
	        if ( object.priConnectionNumber != "" && object.dateEndPriConnection != null )  {
	            ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
	            plFilter.priConnectionNumber = object.priConnectionNumber;
	            plFilter.departmentRef.code = object.departmentRef.code;
	            plFilter.conditionSQL = " enplanwork.code not in ("+ object.code +") ";
	            int[] arr = objectDAO.getFilteredCodeArray(plFilter,0, -1);
	                for (int i = 0; i < arr.length; i++){
	                ENPlanWork tempPlan = objectDAO.getObject(arr[i]);

	                   if (tempPlan.dateEndPriConnection != null ){
	                    if (tempPlan.dateEndPriConnection.compareTo(object.dateEndPriConnection) != 0)
	                    {throw new EnergyproSystemException(" � ������ ���� ��`������ � ��������� � " +  object.priConnectionNumber + " ������� ���� ���� �������� ������ ��������� ���� " + " ( ��� ����� " + tempPlan.code +")"  + "!!!"); }
	                }


	                }

	        }

	*/

	        /* 24.01.2012 +++ ��� ������ �� ������ �� ������� */
	        if (isServices) {
	            if (object.ddsCodes.code == Integer.MIN_VALUE) {
	                throw new EnergyproSystemException("/n/n"
	                		+ "�� �������� ��� ���!!!");
	            }
	        }

	        if ((isServices) && (object.budgetRef.code == ENConsts.ENBUDGET_TRANSPORT))
	            {
	                if ((object.stateRef.code != ENPlanWorkState.TO) &&
	                    (object.stateRef.code != ENPlanWorkState.CURRENT_REPAIR) &&
	                    (object.stateRef.code != ENPlanWorkState.TRANSPORT_SERVICES_4_SIDE) &&
	                    /*19.06.2013 +++ SUPP-4498 ��������� �������� �� �������������/������������ �� ����������� � �������*/
	                    (object.stateRef.code != ENPlanWorkState.RECONSTRUCTION_MODERNIZATION))
	                    {
	                    throw new EnergyproSystemException("���������� ��������������� ���� ���� ���� ��� - ��, �� �� ���������� �������!");
	                    }
	            }

	        /* 20.02.2012 +++ ������ ������ ������� �� ����� ���� ��� ���� ������!!!!! */
	        if (isServices
	                && (oldPlan.servicesFSideFinId != object.servicesFSideFinId))
	        {
	            if (object.formRef.code == ENPlanWorkForm.PLANNED) // 13.09.12 �������� ������ ��� �������� ������!
	            {
	                if (estLogic.checkInRQOrderByPlan(object, false, isServices))
	                    throw new EnergyproSystemException(
	                            "������� � ����� ��� �������� � ������... ������ � ���� �������� �������", userProfile);
	            }
	        }


	        if (this.isNotEditablePlan(oldPlan)){
	            throw new EnergyproSystemException("Plan CLOSED. Using Reopen");
	        }


	        AuthLogic l = new AuthLogic(connection, userProfile);
	        if ( ! l.checkPermission4PlanItems(oldPlan) ){
	            throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWork.save()");
	        }


	        // ��� ������ �������� ����� �� ��������������� ���� �����
	        if (object.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION
	        		|| object.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION
	        		|| object.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	        {
	            if (! l.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
	                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
	            }
	        }

	        // NET-1026 ��� �������� ���������
	        if (object.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
	        {

	            if (!l.checkPermission("ksoe/energynet/SCCounterController", "addCountersForWriteOff")) {
	                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
	            }
	        }

	        // ��� ���������� ������ �� ����������� �������� ����� �� ������������ ��������� ��
	        if(object.typeRef.code == ENPlanWorkType.TRUCKING)
	        {
	            if (! l.checkPermission("ksoe/energynet/ENPlanWorkController", "addByTrucking")) {
	                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
	            }
	        }


	        if ((object.kind.code == ENPlanWorkKind.NPW) || (object.kind.code == ENPlanWorkKind.FACT))
	        {
	            if (! object.dateStart.equals(oldPlan.dateStart))
	            {
	                FINMaterialsShortList fList = estLogic.getFINMaterialsListByPlanCode(object.code , Integer.MIN_VALUE);
	                if (fList.totalCount > 0)
	                    throw new EnergyproSystemException("��� ���� ���� �������� ������� ������������ �������� ");

	                if (object.kind.code == ENPlanWorkKind.NPW)
	                {
		                // ���������� �����, �.�. ������� �������� � ����� ������� ����� ;)
		                Date newDate = com.ksoe.energynet.util.Tools.clearTimeOfDate(object.dateStart);
		                Date oldDate = com.ksoe.energynet.util.Tools.clearTimeOfDate(oldPlan.dateStart);

		                // NET-4350 ���� ���� ������� � ������� ������� �����������, �� ���� �������� ���� �����
		                if (! newDate.equals(oldDate))
		                {
		                	// 11.06.14 SUPP-18287 ��������� ������ � ��� ������, ���� ���������� ���������� �� �� �������� �������
		                	if (! isFromWorkOrderByt)
		                	{
		                		this.checkPlanInWorkOrderByt(object.code,
		                				"��� ���� ���� ����� ������� �������� �������� ���� � ������� �������� ��� " +
		                				"�������� � ���� ����� �������� � ���������� �����!");
		                	}
		                }
	                }
	            }

	            if(object.kind.code == ENPlanWorkKind.FACT && com.ksoe.energynet.util.Tools.clearTimeOfDate(object.dateStart).after(
	            		com.ksoe.energynet.util.Tools.clearTimeOfDate(oldPlan.dateStart))) {
	                Calendar c = Calendar.getInstance();
	                c.setTime(com.ksoe.energynet.util.Tools.clearTimeOfDate(new Date()));
	                if (com.ksoe.energynet.util.Tools.clearTimeOfDate(object.dateStart).after(c.getTime())){
	                    throw new EnergyproSystemException(
	                            "���� �� ������� ������ ������ .. ��������� ���� ���� ����� = " + new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart).toString()
	                            +", ��� �����=" + object.code
	                            );
	                }
	            }

	            // ��� ��������� ���� - ������ ;)
	            if (object.kind.code == ENPlanWorkKind.NPW){
	                //planLogic.checkInSCCounterByPlanCode(object.code);
	                this.checkInSCCounterByPlanCode4Edit(object.code, isFromBilling);
	            }
	        }


	        if (object.kind.code == ENPlanWorkKind.FACT)
	        {
	            ActLogic actLogic = new ActLogic(connection, userProfile);
	            System.out.println("chk plan-act" + object.code);
	            ENAct act = actLogic.getActByPlanCode(object.code, false) ;
	            if ( act != null){
	                if (act.statusRef.code != ENActStatus.GOOD){
	                    throw new EnergyproSystemException("��� �������� ��� ������� ... code=" + act.code);
	                }

	                if (act.dateGen.before(object.dateStart)){
	                    throw new EnergyproSystemException("���� ���������� ������ ���� ������ ���� ���� !!! code=" + act.code);
	                }
	            }
	        }


	        /////// 25.02.2013
	        this.checkForCorrectInvNumber(object);
	        ///////

	        // ���� ����� �� ���� ���� ..
	        ///////////////////27.01.2011
	        /*
	        if (object.kind.code == ENPlanWorkKind.FACT){
	            int npwPlanCode = planLogic.getParentPlanWorkCode(object.code, ENPlanCorrectReason.MOVE_TO_FACT);
	            ENPlanWork npwPlan = objectDAO.getObject(npwPlanCode);
	            if (npwPlan.dateStart.after(object.dateStart)){
	                // ��������� �������� �������� / ������ ..
	                // ���� ���� - ����� ������� �� ..
	                if (fList.totalCount > 0)
	                    throw new EnergyproSystemException("���� ���������� ������ ���� ������ ���� ����� ... ������� �������������� ���������� ");
	            }
	        }
	        ////////////////////
	        */

	        WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, userProfile);
	        ENWorkOrder workOrder = workOrderLogic.getWorkOrderByPlanCode(object.code, false);
	        // ���� ���� ����� - ��� ����� � ��� ... ����� ������� / ����������� ... � �� �����������(�������) ������ ������� ;))
	        if ( workOrder != null){

	            // ������ ������� !!!!!!!!!!!!!!!!!!!!!!!!!!!
	            // � ����� ��������������� ...
	            //�������� ����, � ������� �� ��� �������� ������ ;)
	            // ����� �� ����� ;)
	            //AS 27.01.2011
	            //if (! object.dateStart.equals(oldPlan.dateStart))
	            //      throw new EnergyproSystemException("������� ����� ... ������� ����, ��������� ���� ... � ���� ��������� ����� ...");

	                /////////////////////////
	                    finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	                    FINMaterialsShortList finList = estLogic.getFINMaterialsListByPlanCode(object.code, Integer.MIN_VALUE);
	                    if ((finList.totalCount > 0) && (object.dateStart.getTime() != oldPlan.dateStart.getTime())){
	                        throw new EnergyproSystemException("� ������������ �������� ... ���� �������� �� ����� ...");
	                    }

	                workOrder.dateGen = object.dateStart;
	                woDAO.save(workOrder);
	                // �������� ���� ��������� � ��
	                FINLogic finLogic = new FINLogic(finConn, userProfile);

	                finLogic.validateDocDate(workOrder.dateGen);

	                FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
	                d2mFilter.conditionSQL = " findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.workordercode = "+ workOrder.code +")";
	                FINDoc2MolDataShortList d2mList = new FINDoc2MolDataDAO(connection, userProfile).getScrollableFilteredList(d2mFilter, 0, -1);

	                for (int z = 0; z < d2mList.totalCount; z++){
	                    finLogic.updateDoc(d2mList.get(z).finDocCode, workOrder.workOrderNumber, workOrder.dateGen);
	                    finLogic.updateDocByParentCode(d2mList.get(z).finDocCode, workOrder.workOrderNumber, workOrder.dateGen);
	                }

	                ///////////////////

	                /*
	                FINDoc2WorkOrder d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code , FINDocType.MOVE_302);

	                finLogic.updateDoc(d2w.finDocMOLCode, workOrder.workOrderNumber, workOrder.dateGen);
	                finLogic.updateDoc(d2w.finDocMechanicCode, workOrder.workOrderNumber, workOrder.dateGen);

	                d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code , FINDocType.MOVE_28_302);

	                finLogic.updateDoc(d2w.finDocMOLCode, workOrder.workOrderNumber, workOrder.dateGen);
	                finLogic.updateDoc(d2w.finDocMechanicCode, workOrder.workOrderNumber, workOrder.dateGen);
	                */
	        }


	        /*�������� ��������� ����� �� ������ � ��������� �� �������*/
	        if(object.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND && eType != ENElementType.ROUTE_BYT)
	        {
	            throw new EnergyproSystemException("���� � ����� ������� ����� �������� ����� ��� �������� � Energy");
	        }

	        if(object.typeRef.code == ENPlanWorkType.EZ_PLANED_ROUND_ADD && eType != ENElementType.ROUTE_BYT)
	        {
	            throw new EnergyproSystemException("���� � ����� ������� ����� �������� ����� ��� �������� � Energy");
	        }

	        // ������ ��� �������� ����������� �� ������
	        // �� ���� �� ������ ����� ���� ...
	        if (object.finExecutor != null){

	            FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
	            FINExecutor f = null;
	            if (object.finExecutor.finCode > Integer.MIN_VALUE || object.finExecutor.axOrgId != null)
	            {
	                if (object.finExecutor.code > Integer.MIN_VALUE)
	                    f = d.getObject(object.finExecutor.code);
	                else
	                {
	                    f = new FINExecutor();
	                    f.code = Integer.MIN_VALUE;
	                }

	                f.finCode = object.finExecutor.finCode;
	                f.name = object.finExecutor.name;
	                f.finCehCode = object.finExecutor.finCehCode;
	                f.finCehName = object.finExecutor.finCehName;
	                f.finKindCode = object.finExecutor.finKindCode;
	                f.finKindName = object.finExecutor.finKindName;
	                f.finTypeCode = object.finExecutor.finTypeCode;
	                f.finTypeName = object.finExecutor.finTypeName;
	                ///// MDAX-441
	                f.axOrgId = object.finExecutor.axOrgId;
	                f.axParentOrgId = object.finExecutor.axParentOrgId;
	                f.axParentOrgName = object.finExecutor.axParentOrgName;
	                f.axOrgTypeId = object.finExecutor.axOrgTypeId;
	                f.axOrgTypeName = object.finExecutor.axOrgTypeName;
	                /////
	                f.code = Integer.MIN_VALUE;


	                /**
	                 * 23.02.2017... ������� ����������
	                 */
					if (object.typeRef.code != ENPlanWorkType.EZ_PLANED_ROUND
							&& object.typeRef.code != ENPlanWorkType.EZ_RAID
							&& object.typeRef.code != ENElementType.PURCHASES_OBJECT
		            		&& object.typeRef.code != ENElementType.PURCHASES_NO_OBJECT
		            		&& object.typeRef.code != ENElementType.NO_OBJECT_RESTOCKING
		            		&& object.typeRef.code != ENElementType.NO_OBJECT_GIFT
		            		&& object.typeRef.code != ENElementType.NO_OBJECT_AVR16
		            		&& object.typeRef.code != ENElementType.NO_OBJECT_AVZ)   {

						finExecLogic.checkFinExecutorHasPersonal(object.dateStart, f);
					}


	                object.finExecutor.code = d.add(f);


	                ////////////////////////////////////////
	                // NET-2800 �������� ��������� ����������� �� ����� (��� �������) - � �������� FINExecutor2Plan
	                /*
	                if (object.kind.code == ENPlanWorkKind.CURRENT || object.kind.code == ENPlanWorkKind.YEAR)
	                {
	                    FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(enConn, getUserProfile());
	                    FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
	                    finExecutor2PlanFilter.planRef.code = object.code;
	                    finExecutor2PlanFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
	                    FINExecutor2PlanShortList finExecutor2PlanList = finExecutor2PlanDAO.getScrollableFilteredList(finExecutor2PlanFilter, 0, -1);

	                    FINExecutor fPrimary = null;

	                    if (finExecutor2PlanList.totalCount == 0)
	                    {
	                        fPrimary = new FINExecutor();
	                        fPrimary.finCode = object.finExecutor.finCode;
	                        fPrimary.name =  object.finExecutor.name;
	                        fPrimary.finCehCode = object.finExecutor.finCehCode;
	                        fPrimary.finCehName = object.finExecutor.finCehName;
	                        fPrimary.finKindCode = object.finExecutor.finKindCode;
	                        fPrimary.finKindName = object.finExecutor.finKindName;
	                        fPrimary.finTypeCode = object.finExecutor.finTypeCode;
	                        fPrimary.finTypeName = object.finExecutor.finTypeName;
	                        int fCode = d.add(fPrimary);

	                        FINExecutor2Plan executor2Plan = new FINExecutor2Plan();
	                        executor2Plan.code = Integer.MIN_VALUE;
	                        executor2Plan.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
	                        executor2Plan.planRef.code = object.code;
	                        executor2Plan.finExecutor.code = fCode;
	                        executor2Plan.dateStart = object.dateStart;
	                        executor2Plan.dateFinal = object.dateFinal;
	                        executor2Plan.percentLoad = new BigDecimal(100);
	                        finExecutor2PlanDAO.add(executor2Plan);
	                    }
	                    else if (finExecutor2PlanList.totalCount > 1)
	                    {
	                        throw new EnergyproSystemException("\n \n NET-2800 �� ���� ����� ������ (" + finExecutor2PlanList.totalCount + ") ��������� ���������!");
	                    }
	                    else
	                    {
	                        fPrimary = d.getObject(finExecutor2PlanList.get(0).finExecutorCode);
	                        fPrimary.finCode = object.finExecutor.finCode;
	                        fPrimary.name =  object.finExecutor.name;
	                        fPrimary.finCehCode = object.finExecutor.finCehCode;
	                        fPrimary.finCehName = object.finExecutor.finCehName;
	                        fPrimary.finKindCode = object.finExecutor.finKindCode;
	                        fPrimary.finKindName = object.finExecutor.finKindName;
	                        fPrimary.finTypeCode = object.finExecutor.finTypeCode;
	                        fPrimary.finTypeName = object.finExecutor.finTypeName;
	                        d.save(fPrimary);
	                    }
	                }
	                */
	                this.updatePrimaryFinExecutor(object);
	                ////////////////////////////////////////


	            }
	            else
	            {
	                if ((object.kind.code != ENPlanWorkKind.YEAR)
	                        && (object.typeRef.code != ENPlanWorkType.WRITINGS)
	                        && (object.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION)
	                        && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE)
	                        && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
	                        && (object.typeRef.code != ENPlanWorkType.SALE_PRODUCTS)
	                        && (eType != ENElementType.CARGO_OBJECT)
	                        )
	                {
	                    throw new EnergyproSystemException("��������� ������� ��������� ����� ...");
	                }
	            }
	        }
	        else
	        {
	            if ((object.kind.code != ENPlanWorkKind.YEAR)
	                    && (object.typeRef.code != ENPlanWorkType.WRITINGS)
	                    && (object.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION)
	                    && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE)
	                    && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)
	                    && (eType != ENElementType.CARGO_OBJECT)
	                    )
	            {
	                throw new EnergyproSystemException("��������� ������� ��������� ����� ...");
	            }
	        }


	    ///// 12.03.14 SUPP-13683 ��� ���: ��������� ����������� �� ��������� ������ ��� ��������� �� �������-�����
	    if (object.kind.code == ENPlanWorkKind.NPW && object.typeRef.code == ENPlanWorkType.AVR)
	    {
	        // ������ ��� ������, ��������� �� CallCenter'�
	        if (this.isPlanFromCallCenter(object.code))
	        {
	            // ���� ��������� �������� ����
	            ENPlanCorrectHistoryDAO planHistoryDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
	            ENPlanCorrectHistoryFilter planHistoryFilter = new ENPlanCorrectHistoryFilter();
	            planHistoryFilter.planNewRef.code = object.code;
	            planHistoryFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
	            ENPlanCorrectHistoryShortList planHistoryList = planHistoryDAO.getScrollableFilteredList(planHistoryFilter, 0, -1);

	            if (planHistoryList.totalCount != 1)
	            {
	                throw new EnergyproSystemException("\n\nSUPP-13683 ������� �� ��� ������ ̳������� �����! ��� ��������-�����: " + object.code);
	            }

	            int monthPlanCode = planHistoryList.get(0).planOldRefCode;
	            if (monthPlanCode == Integer.MIN_VALUE)
	            {
	                throw new EnergyproSystemException("\n\nSUPP-13683 ������� �� ��� ������ ̳������� �����! ��� ��������-�����: " + object.code);
	            }

	            ENPlanWork monthPlan = objectDAO.getObject(monthPlanCode);
	            if (monthPlan == null)
	            {
	                throw new EnergyproSystemException("\n\nSUPP-13683 ������� �� ��� ������ ̳������� �����!\n" +
	                                                "��� ��������-�����: " + object.code + ", " +
	                                                "��� ̳������� �����: " + monthPlanCode);
	            }

	            monthPlan.departmentRef.code = object.departmentRef.code;

	            if (object.finExecutor != null)
	            {

	            	if ((monthPlan.finExecutor == null) || (object.finExecutor.code != monthPlan.finExecutor.code)) {

	                monthPlan.finExecutor = new FINExecutor();
	                monthPlan.finExecutor.code = Integer.MIN_VALUE;
	                monthPlan.finExecutor.finCode = object.finExecutor.finCode;
	                monthPlan.finExecutor.name = object.finExecutor.name;
	                monthPlan.finExecutor.finCehCode = object.finExecutor.finCehCode;
	                monthPlan.finExecutor.finCehName = object.finExecutor.finCehName;
	                monthPlan.finExecutor.finKindCode = object.finExecutor.finKindCode;
	                monthPlan.finExecutor.finKindName = object.finExecutor.finKindName;
	                monthPlan.finExecutor.finTypeCode = object.finExecutor.finTypeCode;
	                monthPlan.finExecutor.finTypeName = object.finExecutor.finTypeName;
	                ///// MDAX-441
	                monthPlan.finExecutor.axOrgId = object.finExecutor.axOrgId;
	                monthPlan.finExecutor.axParentOrgId = object.finExecutor.axParentOrgId;
	                monthPlan.finExecutor.axParentOrgName = object.finExecutor.axParentOrgName;
	                monthPlan.finExecutor.axOrgTypeId = object.finExecutor.axOrgTypeId;
	                monthPlan.finExecutor.axOrgTypeName = object.finExecutor.axOrgTypeName;
	                /////


	                this.saveAddInfoExecutorDepartment(monthPlan);
	            }
	          }
	       }
	    }
	    /////


	    // ���� ������ ����� � ������ �����
	    if ((oldPlan.kind.code != ENPlanWorkKind.YEAR ) && ((oldPlan.yearGen != object.yearGen) || (oldPlan.monthGen != object.monthGen))){

	    	if (oldPlan.kind.code != ENPlanWorkKind.NPW) {
	    		throw new EnergyproSystemException("\n\n"
	    				+ "������� ������ ������ ������ ... ����������� ������� ������");
	 	    }

	    }
	    else if ((oldPlan.yearGen != object.yearGen) || (oldPlan.monthGen != object.monthGen))
	    {
	        /////
	        // 07.12.2015 �������� �������� ������� ������, � ������� ���� ������ �� ��������� "�����, �� �� ����� ���������������"
	        /*
	    	if (planLogic.checkForProhibitedWorks(object.code))
	        {
	        	throw new EnergyproSystemException("\n\n� ���� � ����� " + object.code + " � ������ � ������� ��������� \"�����, �� �� ����� ���������������\".\n" +
	        			"��� ������ ����� ��������� ����� �����, ��� ������ ������� ��������!");
	        }
	        */
	    	this.checkForProhibitedWorks(object.code, eType, "��� ������ ����� ��������� ����� �����, ��� ������ ������� ��������!", isForSupplier);
	        /////
	    }


	    if ((object.stateRef.code != ENPlanWorkState.WRITINGS_OS)  // NET-4383
	    		/** SUPP-22415 */
	    		&& (object.stateRef.code != ENPlanWorkState.WRITINGS_MBP)
	    		&& (object.stateRef.code != ENPlanWorkState.WRITINGS_MNMA) ) {

		    // ���� ������ ������� ��� ��
		    if ((object.kind.code == ENPlanWorkKind.NPW) || (object.kind.code == ENPlanWorkKind.FACT))
		    {
		        TransportLogic transportLogic = new TransportLogic(connection, userProfile);
		        transportLogic.checkTransportItemInTravelSheetByPlanCode(object.code, true);

		        if (object.kind.code == ENPlanWorkKind.FACT) {
		        	// ������ ���� � �������� ��� �� ��������� � ������� ����
		        	ENPlanCorrectHistoryDAO pchDAO = new ENPlanCorrectHistoryDAO(connection, userProfile);
		        	ENPlanCorrectHistoryFilter pchFilter = new ENPlanCorrectHistoryFilter();
		        	pchFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
		        	pchFilter.planNewRef.code = object.code;
		        	ENPlanCorrectHistoryShortList pchList = pchDAO.getScrollableFilteredList(pchFilter, 0, 1);
		        	transportLogic.checkTransportItemInTravelSheetByPlanCode(pchList.get(0).planOldRefCode, true);
		        }
		    }

	   }

	    // AS 2011.02.24 ...
	    // ��� ������� ����-�� ����� ������ ���� ��� � �����(� �������/�������) ������ ...

	    boolean isTransport = false;
	    if (
	            ( object.kind.code == ENPlanWorkKind.NPW )
	            && (object.budgetRef.code != ENConsts.ENBUDGET_ENERGOSBYT)
	            //&& ( eType == ENElementType.TRANSPORT )
	            //&& (object.stateRef.code != ENPlanWorkState.TRUCKING)
	    )
	    {

	          if (( eType == ENElementType.TRANSPORT ) &&
	            (object.stateRef.code != ENPlanWorkState.TRUCKING))
	          {
	            isTransport = true;
	          }

	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(object.dateStart);
	        calendar.set(Calendar.HOUR_OF_DAY, 0);
	        calendar.set(Calendar.MINUTE, 0);
	        calendar.set(Calendar.SECOND, 0);
	        calendar.set(Calendar.MILLISECOND, 0);

	        Calendar calendarOld = Calendar.getInstance();
	        calendarOld.setTime(oldPlan.dateStart);
	        calendarOld.set(Calendar.HOUR_OF_DAY, 0);
	        calendarOld.set(Calendar.MINUTE, 0);
	        calendarOld.set(Calendar.SECOND, 0);
	        calendarOld.set(Calendar.MILLISECOND, 0);

	        if ( calendar.get(Calendar.MONTH) != calendarOld.get(Calendar.MONTH) ){

	            if (workOrder != null){
	                throw new EnergyproSystemException("������� �����, � ���� ������� ���� ������� ���� ...");
	            }

	        }

	        if (object.monthGen != calendar.get(Calendar.MONTH) + 1)
	        {
	                ///// �������� ������ �������� ��� � ����� �����
	                if (object.yearOriginal == Integer.MIN_VALUE)
	                object.yearOriginal = oldPlan.yearGen;
	            if (object.monthOriginal == Integer.MIN_VALUE)
	                object.monthOriginal = oldPlan.monthGen;
	            /////
	            //object.yearOriginal = oldPlan.yearGen;
	            //object.monthOriginal = oldPlan.monthGen;

	            object.yearGen = calendar.get(Calendar.YEAR);
	            object.monthGen = calendar.get(Calendar.MONTH) + 1;
	        }

	        if (eType != ENElementType.SERVICES_OBJECT && /*NET-4122*/object.budgetRef.code != ENConsts.ENBUDGET_VRTU) {
	            if ( calendarOld.get(Calendar.YEAR) != object.yearGen ) {
	            	// 03.01.2017 - Fwd: ������� ��� ��������� ������� ���� ( ��������� ���� ������ �� ������� ����)
	            	if(object.kind.code != ENPlanWorkKind.NPW  )
	                throw new EnergyproSystemException("���� ������� ���� � ����� " + calendarOld.get(Calendar.YEAR) + " ���� !!!");
	            }
	        }

	        // object.yearOriginal = object.yearGen;
	        // object.monthOriginal = object.monthGen;




	        /* ��� ���� ���������� ����� ....
	        Date curDate = new Date();

	        Calendar calendar = Calendar.getInstance();
	        calendar.set(Calendar.HOUR_OF_DAY, 0);
	        calendar.set(Calendar.MINUTE, 0);
	        calendar.set(Calendar.SECOND, 0);
	        calendar.set(Calendar.MILLISECOND, 0);
	        calendar.set(Calendar.MONTH, object.monthGen - 1);
	        calendar.set(Calendar.YEAR, object.yearGen);
	        calendar.set(Calendar.DATE, 1);

	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.setTime(curDate);
	        calendar1.set(Calendar.HOUR_OF_DAY, 0);
	        calendar1.set(Calendar.MINUTE, 0);
	        calendar1.set(Calendar.SECOND, 0);
	        calendar1.set(Calendar.MILLISECOND, 0);
	        calendar1.set(Calendar.MONTH, plan.monthGen - 1);
	        calendar1.set(Calendar.YEAR, plan.yearGen);
	        calendar1.set(Calendar.DATE, 1);

	        Date curDate = new Date();
	        if ( curDate.getTime() < object.dateStart.getTime() ){
	            throw new EnergyproSystemException();
	        }
	    }
	    */
	    }
	    else
	        //if (object.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT)
	        //{
	            // ��� ���� ��������� ���� ������ ������ ������� � ������� ���� ...
	            // �� 19.04.11 ��� ����� ����, ����� �����������
	        if (eType != ENElementType.SERVICES_OBJECT) { // ��� ����� �� ������� ������� �������� �� ���� 03,01,2012
	            this.validatePlanPeriod(object);
	        }
	        //}


	    // 29.08.11 �������� ������� �����/���� ���� ��� ������ �� ������� ��������� �� �� � ������
	    if (eType == ENElementType.OPERATIVE_OBJECT)
	    {
	        if ((object.typeRef.code != ENPlanWorkType.AVR) &&
	            (object.typeRef.code != ENPlanWorkType.PLANOVIE) &&
	            (object.typeRef.code != ENPlanWorkType.NOT_PLANED))
	        {
	            throw new EnergyproSystemException("��� ��� ��'���� ����� �������� ����� ����� � ���������� �������� ����: \n" +
	                                                "\"������ ������\", \"�������� ������\", \"���\"!");
	        }

	        if ((object.stateRef.code != ENPlanWorkState.WORK_IN_OUT)
	                && (object.stateRef.code != ENPlanWorkState.MEASUREMENT))
	        {
	            throw new EnergyproSystemException("��� ��� ��'���� ����� �������� ����� ����� � ����� ���� \"������ �� �������\"!");
	        }
	    }

	    // 03.10.11 �������� ������� �����/���� ���� ��� ������ �� ������� �� �������
	    if (eType == ENElementType.SERVICES_OBJECT)
	    {
	        if (object.typeRef.code != ENPlanWorkType.WORK_IN_OUT
	                && object.typeRef.code != ENPlanWorkType.SALE_PRODUCTS)
	        {
	            throw new EnergyproSystemException("��� ��� ��'���� ����� �������� ����� ����� � ������� ���� \"������ �� �������\"!");
	        }

	        if (object.stateRef.code != ENPlanWorkState.WORK_IN_OUT
	                && object.stateRef.code != ENPlanWorkState.SALE_PRODUCTS)
	        {
	            throw new EnergyproSystemException("��� ��� ��'���� ����� �������� ����� ����� � ����� ���� \"������ �� �������\"!");
	        }


	        /** 18.04.2017... +++ ���������� ���� �� ������� ��������, � ����� ������� �� �����..... */
	        if (object.kind.code == ENPlanWorkKind.CURRENT
	        		&&  object.dateStart.before(oldPlan.dateStart) ) {
	        	throw new SystemException("\n\n"
	        			+ "���� ������� ���� �� ��������� " + new SimpleDateFormat("dd.MM.yyyy").format(oldPlan.dateStart) + " �� ����������!");
	        }
	    }


	    /* 24.01.2012 +++ ������ ���������� +++ ��������� ������ */
	    if ((!isServices)
	            && (eType != ENElementType.CARGO_OBJECT)
	            /* 20.09.2012 +++ ������� ������������ ������ */
	            && (eType != ENElementType.BUILDER)
	            // �������� �� ���� ���������
	            && (object.stateRef.code != ENPlanWorkState.WRITINGS_OS)
	    		) {
	        // �������� ������������ ..
	        this.checkUnicPlan(object);
	    }


	    /* 31.05.2012 +++ ���� ��������� ������ �������� ������ ��������� */
	    if (eType == ENElementType.CARGO_OBJECT) {
	        TransportRouteLogic trLogic = new TransportRouteLogic(connection, userProfile);
	        object.commentGen = trLogic.getRoutesByPlan(object.code);
	    }


	    if (oldPlan.formRef.code != object.formRef.code){
	        if ( estLogic.checkInRQOrderByPlan(object, false) )
	            throw new EnergyproSystemException("������� � ����� ��� �������� � ������ ... ��� ����� �������� �������", userProfile);
	    }

	    if ((object.formRef == null) || (object.formRef.code == Integer.MIN_VALUE)){
	        throw new EnergyproSystemException("����������� � ��������� ... ���� �� ������� ��������� � ��� ... � ������� ��� ���������� ������...", userProfile);
	    }

	    // �������� ���������� ����� � ������� ...
	    // ����� �� � ���

	    if ( ! isTransport && eType != ENElementType.SIZ) {

	        Calendar calendar_ = Calendar.getInstance();
	        Calendar calendar_11 = Calendar.getInstance();
	        calendar_11.set(object.yearGen, object.monthGen - 1 ,1);

	        calendar_.setTime(new Date());

	        int monthDelta = 1;
	        // ���� ��� ����� ��������� ���� �� 3 ������ ����� ������ ���������� ...
	        if (
	                (object.budgetRef.code == 75000009) // ���
	                && (object.typeRef.code == ENPlanWorkType.INVEST)
	                && ((object.stateRef.code == ENPlanWorkState.RECONSTRUCTION_MODERNIZATION) || (object.stateRef.code == ENPlanWorkState.CAPITAL_BUILDER))
	        )
	        {
	            monthDelta = 3;
	        }

	        /** SUPP-11830... +++ � ��� ��������� �� ����.������� �� 4 ������ ������ */
	        if (eType == ENElementType.SIZ) {
	            monthDelta = 4;
	        }

	        /** ��� SDTU ������ ���������� ����� �� ���� ��� ������*/
	        if (object.budgetRef.code == ENConsts.ENBUDGET_SDTU) {
	        	monthDelta = 12;
	        }

	        calendar_.add(Calendar.MONTH, monthDelta);

	        //if (object.monthGen > (calendar_.get(Calendar.MONTH) + 1))

	        if (object.formRef.code == ENPlanWorkForm.NOPLANNED) // 07.11.12 NET-3576 ������ ��� ����������� !!!
	        {
	            if (calendar_11.after(calendar_)

	                    // 19.07 2011   �������� ��������� ����������� ������� 2012 ����
	                    // && (object.kind.code != ENPlanWorkKind.YEAR && object.yearGen != 2012)
	                    && object.yearGen != 2012 //!(object.kind.code == ENPlanWorkKind.YEAR && object.yearGen == 2012)
	                )
	            {
	            	if (!userProfile.userName.equalsIgnoreCase("energynet") && !userProfile.userName.equalsIgnoreCase("PrometnayaOP")) // �������� �.�. ������ ��� �� ����� ������� ������������ �������� �����
	                throw new EnergyproSystemException("���������� ����� ����������� �� ����� �� �� ����� ������ (�� ����� "+ (calendar_.get(Calendar.MONTH) + 1 )+")...", userProfile);
	            }
	        }

	    }
	      // AS 27.01.2011 ���������� ���� ...
	      /*
	    if ( object.formRef.code == ENPlanWorkForm.NOPLANNED){
	            Calendar calendar_ = Calendar.getInstance();
	            Calendar calendar_11 = Calendar.getInstance();
	            calendar_11.set(object.yearGen, object.monthGen - 1 ,1);

	            calendar_.setTime(new Date());
	            calendar_.add(Calendar.MONTH, 1);

	            //if (object.monthGen > (calendar_.get(Calendar.MONTH) + 1))
	            if (calendar_11.after(calendar_))
	            {
	                throw new EnergyproSystemException("���������� ����� ����������� �� ����� �� �� ����� ������ (�� ����� "+ (calendar_.get(Calendar.MONTH) + 1 )+")...", getUserProfile());
	            }
	    }
	    */


	    if (object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
	            || object.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
	        if (eType == ENElementType.SERVICES_FROM_SIDE_OBJECT) {

	        	ENServicesFromSideObjectDAO fsDAO = new ENServicesFromSideObjectDAO(connection, userProfile);
	            ENServicesFromSideObjectFilter fsFilter = new ENServicesFromSideObjectFilter();
	            fsFilter.element.code = object.elementRef.code;

	            int fsA[] = fsDAO.getFilteredCodeArray(fsFilter, 0, -1);
	            ENServicesFromSideObject fsObject = fsDAO.getObject(fsA[0]);
	            object.servicesFSideFinId = fsObject.finDocID;
	            object.servicesFSideCnNum = fsObject.contractNumber;
	        }
	      }


	    if ((object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE)
	            && (object.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST)) {
	        if (object.kind.code == ENPlanWorkKind.CURRENT) {
	            this.validateMOLinPlan(object.code);
	        }
	    }

	    // CALL-123... +++  02.06.2014 DEBUG!!!!
	    // boolean isPlanForSetCauseDisconnection = planLogic.checkPlanForSetCauseDisconnection(object);
	    // if (isPlanForSetCauseDisconnection) {object.causeDisconnection = 1;}

	    object.dateEdit = new Date();
	    object.userGen = userProfile.userName;


	    // �������� ����������� ���� ���������� ����� ��� ������ � ��������� "������ ����������� � ����������� ������������"
	    if ((object.kind.code == ENPlanWorkKind.NPW || object.kind.code == ENPlanWorkKind.FACT) &&
	    	(object.causeDisconnection == ENConsts.YES) && (object.typeRef.code != ENPlanWorkType.AVR) &&
	    	(oldPlan.dateStart != object.dateStart || oldPlan.dateFinal != object.dateFinal))
	    {
	    	ENPlanWork2CCDamageLogDAO pl2ccDAO = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
	        ENPlanWork2CCDamageLogFilter pl2ccFilter = new ENPlanWork2CCDamageLogFilter();

	        pl2ccFilter.planRef.code = this.getMonthPlanCodeByAnyPlanCode(object.code);
	        pl2ccFilter.conditionSQL = " '" + new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart) + "'"  +
	             " between enplanwork2ccdamagelog.datebegin and enplanwork2ccdamagelog.datefinish";
	        ENPlanWork2CCDamageLogShortList pl2ccList = pl2ccDAO.getScrollableFilteredList(pl2ccFilter, 0, -1);

				if (pl2ccList.totalCount == 0)
				{
				throw new EnergyproSystemException("\n" +
				"\n ������ ������� ��� ���� (" + new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart) +") ������ ���������� �����, �.�. � ��� � ������ ����������� ���(����������) ���������� �����!");
				}
	    }


	    if (object.kind.code == ENPlanWorkKind.NPW || object.kind.code == ENPlanWorkKind.FACT)
	    {
	    	/////
	    	// 29.06.16 ����� ��������� ����� � ���, ������ ��� ����� ���� ����� ���� � ������ ������
	        int newPlanMonth = Tools.getMonth(object.dateStart) + 1;
	    	int newPlanYear = Tools.getYear(object.dateStart);

	    	object.monthGen = newPlanMonth;
	    	object.yearGen = newPlanYear;
	    	/////
	    }

	    objectDAO.save(object);

	    ///////////////// 29.08.12 NET-2800
	    // ���� ������ ���� ������������ ������ ����� ��, ��� � �����
	    if (object.kind.code == ENPlanWorkKind.YEAR)
	    {
	        FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
	        FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
	        finExecutor2PlanFilter.planRef.code = object.code;
	        int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

	        for (int i = 0; i < finExecutor2PlanArr.length; i++)
	        {
	            FINExecutor2Plan finExecutor2Plan = finExecutor2PlanDAO.getObject(finExecutor2PlanArr[i]);
	            finExecutor2Plan.dateStart = object.dateStart;
	            finExecutor2PlanDAO.save(finExecutor2Plan);
	        }
	    }
	    else if (object.kind.code == ENPlanWorkKind.CURRENT)
	    {
	        FINExecutor2PlanDAO finExecutor2PlanDAO = new FINExecutor2PlanDAO(connection, userProfile);
	        FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
	        finExecutor2PlanFilter.planRef.code = object.code;
	        int[] finExecutor2PlanArr = finExecutor2PlanDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

	        if (finExecutor2PlanArr.length == 1)
	        {
	            FINExecutor2Plan finExecutor2Plan = finExecutor2PlanDAO.getObject(finExecutor2PlanArr[0]);
	            finExecutor2Plan.dateStart = object.dateStart;
	            finExecutor2PlanDAO.save(finExecutor2Plan);
	        }
	    }
	    ////////////////

	    // 17.02.12 NET-1355 ������������� ���� ��������� � ����� ����� ���������� �����
	    this.recalcTotalTime(object.code);

	    if (!object.dateStart.equals(oldPlan.dateStart))
	    {
	        this.checkTransportOrderInPlan(object.code);

	    	///// NET-4440 ��� ��������� ���� ����� ��������� ������� ��� �� ����� �����
	    	this.generatePlanFuelHistory(object.code, object.dateStart);
	    	/////
	    }




          //// this.setContract SUPP-84293
			if( object.typeRef.code == ENPlanWorkType.TMC_TRANSFER && object.servicesFSideCnNum != null  ){

				boolean isUpdateServicesFSide = false; // ������� ��������� ��� ��� ������� �������

			    ENPlanwork2GeneralContractsFilter p2genFil = new ENPlanwork2GeneralContractsFilter();
				p2genFil.planRef.code = object.code;
				int[] p2genArr = p2genDAO.getFilteredCodeArray(p2genFil, 0, -1);

				if (p2genArr.length>0){
					ENPlanwork2GeneralContracts p2genObjOld = p2genDAO.getObject(p2genArr[0]);
					ENGeneralContracts genContrObj = genContrDAO.getObject(p2genObjOld.generalContractRef.code);
					if( !genContrObj.finDocCode.equals(object.finDocCode) || !genContrObj.partnerCode.equalsIgnoreCase(object.partnerCode )    ){
						isUpdateServicesFSide=true;
					}
				} else {
					isUpdateServicesFSide= true;
				}

				if (isUpdateServicesFSide) {
					boolean isCustomer = false;
					boolean isException = true;
					ContractLogic contractLogic = new ContractLogic(connection,
							userProfile);

					// ������� ��� �������� �� �������� � engeneralcontract
					int generalContractCode = contractLogic
							.addByContractNumber(object.servicesFSideCnNum,
									object.partnerCode, object.finDocCode,
									isCustomer, isException);

					if (generalContractCode == Integer.MIN_VALUE) {
						throw new EnergyproSystemException(
								"�� �������� ������ � �� "
										+ object.servicesFSideCnNum + "!!!");
					}

					ENPlanwork2GeneralContractsFilter p2genFF = new ENPlanwork2GeneralContractsFilter();
					p2genFF.planRef.code = object.code;
					int[] p2genARR = p2genDAO.getFilteredCodeArray(p2genFF, 0,-1);

					for (int i = 0; i < p2genARR.length; i++) {
						p2genDAO.remove(p2genARR[i]);
					}

					ENPlanwork2GeneralContracts p2gen = new ENPlanwork2GeneralContracts();
					p2gen.dateEdit = new Date();
					p2gen.generalContractRef.code = generalContractCode;
					p2gen.planRef.code = object.code;
					p2gen.userGen = userProfile.userName;
					p2genDAO.add(p2gen);
				}
		    }

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "��� ����������� � �� ������������ ��� ���������� ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (authCon != null && !authCon.isClosed()) {
					authCon.close();
					authCon = null;
				}
			} catch (SQLException e) {
			}
		}
	}


	public void validateAndClosePlan() {
		Connection finConn = null;
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	        FINLogic finLogic = new FINLogic(finConn, userProfile);

			FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(connection, userProfile);
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = " enplanwork.code in ("
					+ " select pl.code from enplanwork pl "
					+ " where pl.statuscode = " + ENPlanWorkStatus.GOOD
					+ " and pl.kindcode = " + ENPlanWorkKind.FACT
					+ " and pl.staterefcode = " + ENPlanWorkState.TO
					+ " and pl.budgetrefcode = " + ENConsts.ENBUDGET_ENERGOSBYT
					+ " and pl.datestart >= to_date('01.03.2016', 'dd.MM.yyyy') "
					+ " and pl.datefinal <= to_date('31.03.2016', 'dd.MM.yyyy') "
					+ " and pl.finexecutorcode in (select fe.code from finexecutor fe where fe.axorgid = '05230030503') ) ";   //  �����������
					// + " and pl.finexecutorcode in (select fe.code from finexecutor fe where fe.axorgid = '05230030502') ) ";   //  �����������


			int pArr[] = planDAO.getFilteredCodeArray(planFilter, 0, -1);

			System.out.println("############################ validateFinDocStatus pArr = " + pArr.length);

			for (int i = 0; i < pArr.length; i++) {

				ENPlanWork plan = planDAO.getObject(pArr[i]);
				WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
		        ENWorkOrder workOrder = woLogic.getWorkOrderByPlanCode(plan.code, true);

		        FINMolDataFilter molDataFilter = new FINMolDataFilter();
		        molDataFilter.workOrder.code = workOrder.code;

		        FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();
				f2mFilter.conditionSQL = "FINDOC2MOLDATA.moldatacode in (select finmoldata.code from finmoldata where finmoldata.workordercode = " + workOrder.code + ")";
				FINDoc2MolDataShortList f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);

				f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
				for (int k = 0; k < f2mList.totalCount; k++) {
					boolean validate = finLogic.validateFinDocStatus(f2mList.get(k).finDocCode,
							finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode));

					System.out.println("############################ validateFinDocStatus planCode = " + plan.code + " :: " + validate);

					if (!validate) {
						plan.status.code = ENPlanWorkStatus.LOCKED;
						planDAO.save(plan);

						System.out.println("############################ validateFinDocStatus save planCode = " + plan.code + " :: " + validate);
					}
				}
			}


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
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
		}
	}

	/**
	 * ��������, ����� ��� ������ �� �����, � ������� ���� ������, ���� �������� � ������� �������
	 *
	 * @param planCode - ��� �����
	 */
	public void checkSealsInWorkOrderByt(int planCode)
	{
		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

			ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
			estimateFilter.conditionSQL =
					" code in ( " +
					"	select ei.code " +
					"	from enestimateitem ei " +
					"	where ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"	  and ei.planrefcode = " + planCode +
					"	  and ei.countfact > 0 " +
					"	  and ei.planitemrefcode not in " +
					"	  ( " +
					"	    select bi.planitemrefcode " +
					"	    from enworkorderbytitem bi " +
					"	    where ei.planitemrefcode = bi.planitemrefcode " +
					"	  )	" +
					" ) ";

			int[] estimateCodes = estimateItemDAO.getFilteredCodeArray(estimateFilter, 0, -1);

			if (estimateCodes.length > 0)
			{
				throw new SystemException("\n\nNET-4530 � ���� � ����� " + planCode + " � ������ ��� ���, " +
						"��� ������ � ���� �� �������� �� ������� ��������!\n" +
						"�������� ������� ������ �� ������ � ����� �������� (��� �������� ������� �����)!");
			}
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ��������, ���� �� ������ � ������
	 *
	 * @param planItemCode - ��� ������
	 */
	public void checkSealsInPlanWorkItem(int planItemCode)
	{
		try
		{
			SCSealDAO sealDAO = new SCSealDAO(connection, userProfile);

			SCSealFilter sealFilter = new SCSealFilter();
			sealFilter.conditionSQL =
					" code in ( " +
					"   select sc.code " +
					"   from scseal sc, enestimateitem ei " +
					"   where sc.estimateitemrefcode = ei.code " +
					"     and ei.planitemrefcode = " + planItemCode +
					" ) ";

			int[] sealCodes = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

			if (sealCodes.length > 0)
			{
				throw new SystemException("\n\nNET-4530 � ����� � ����� " + planItemCode + " � ����'���� ������ ��� ���!\n" +
						"�������� ������� �� ������� ����������!");
			}
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void saveExecutorAndBudget(ENPlanWork plan)
	{
		try
		{
			saveAddInfoExecutorDepartment(plan);

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			planDAO.updateBudgetAndResponsibility(plan.code, plan.budgetRef.code, plan.responsibilityRef.code);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ���������� �������� ���� �� ���� ������ + ���-�� ���� ,
	 * ���� � ������ �������� ��������/��������� - �������� ���� �������� ���������� ������
	 * */
	public Date getDateOnworkingDay_neto(Date dateStart , int countDayForAdd ){

		Date dateFinal = null;
		mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);

   	    int countUnprocessedDays = countDayForAdd; // ���-�� �������������� ����

   	    Date dateStartFil = dateStart;
   	    Date dateEndFil = Tools.addDays(dateStart, countUnprocessedDays -1);

   	    while (countUnprocessedDays > 0 ) {

   	    	dateFinal = Tools.addDays(dateStartFil, countUnprocessedDays -1);

			int workDaysInPeriod = mdLogic.getWorkDaysBetweenDates(dateStartFil, dateEndFil);

			// � ������� ����� �� ���� ������� �� 2325 ���, � �� 2019 ���� !!!!!
			if (workDaysInPeriod <= 0) {
				return dateFinal;
			}

			dateStartFil = Tools.addDays(dateStartFil, countUnprocessedDays);; // ��� ������ �������� ���� � ������� ���� ���./������.
			countUnprocessedDays = countUnprocessedDays - workDaysInPeriod;
			dateEndFil = Tools.addDays(dateEndFil, countUnprocessedDays ); // ���������� ����� ������� ������ �� ���-�� ��������� ����

		}

   	    return dateFinal;

	}


	/**
	 * ���������� �������� ���� �� ���� ������ + ���-�� ���� ,
	 * ���� � ������ �������� ��������/��������� - �������� ���� �������� ���������� ������
	 * @param isExcept - ���� ���� ���������� ���� ���� ������� �� ����� �������� true */
	public Date getDateOnworkingDay_neto2(Date dateStart, int countDayForAdd, boolean isExcept) {

		Date dateFinal = null;

		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			selectStr = "select get_workdate_of_days(" + com.ksoe.energypro.util.Tools.convertDateTimeToSQLString(dateStart) + ", " + countDayForAdd + ")";

			statement = getDocFlowConnection().prepareStatement(selectStr);
			set = statement.executeQuery();

			if (set.next()) {
				return dateFinal = set.getDate(1);
			}

			System.out.println("################# getWorkDaysBetweenDates 333  dateStart = " + dateStart + " :: dateFinal = " + dateFinal + " :: countDayForAdd = " + countDayForAdd);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			closeDocFlowConnection();
		}




		mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
   	    //AuthLogic netAuth = new AuthLogic(connection, userProfile);



		/* get_workdate_of_days(w.datestart, term) end as deadline */


		System.out.println("################# getWorkDaysBetweenDates  dateStart = " + dateStart + " :: countDayForAdd = " + countDayForAdd);

		// ���� ���� � ������� ������� ��� �� ���������� , ����� � ���� ������ ���������� ���-�� ���� � �� ����� ... (������ ��������� �������� ��� ���������� ������� �������� ������� � ����)
		int checkWorkDay =  mdLogic.getWorkDaysBetweenDates(dateStart, Tools.addDays(dateStart, countDayForAdd) );
		if (checkWorkDay==0){
			if (isExcept){
				throw new SystemException("\n\n � ����� � " + new SimpleDateFormat("dd.MM.yyyy").format(dateStart)
						                                     + " �� "  + Tools.addDays(dateStart, countDayForAdd) + " ���� ������� �������� ���� !!! " );
			} else {
				return Tools.addDays(dateStart, countDayForAdd);
			}

		}

   	    int countUnprocessedDays = countDayForAdd; // ���-�� �������������� ����

   	    Date dateStartFil = dateStart;
   	    Date dateEndFil = Tools.addDays(dateStart, countUnprocessedDays -1);

   	    while (countUnprocessedDays > 0 ) {

   	    	System.out.println("################# countUnprocessedDays 1 = " + countUnprocessedDays);

			int workDaysInPeriod = mdLogic.getWorkDaysBetweenDates(dateStartFil, dateEndFil);

			if (workDaysInPeriod <= 0){
				if (isExcept){
					throw new SystemException("\n\n � ����� � " + new SimpleDateFormat("dd.MM.yyyy").format(dateStartFil)
							                                     + " �� "  + Tools.addDays(dateStartFil, countUnprocessedDays) + " ���� ������� �������� ���� !!! " );
				} else {
					return dateEndFil;
				}

			}

			dateFinal = Tools.addDays(dateStartFil, countUnprocessedDays -1);
			dateStartFil = Tools.addDays(dateStartFil, countUnprocessedDays);; // ��� ������ �������� ���� � ������� ���� ���./������.
			countUnprocessedDays = countUnprocessedDays - workDaysInPeriod;
			dateEndFil = Tools.addDays(dateEndFil, countUnprocessedDays ); // ���������� ����� ������� ������ �� ���-�� ��������� ����

			System.out.println("################# countUnprocessedDays 2 = " + countUnprocessedDays);

		}

   	    return dateFinal;

	}



	/**
	 *	���������� �������� ���� �� ���� ������ + ���-�� ������� ����...
	 *	������� get_workdate_of_days ���������� ������ AX_CALENDAR...
	 *
	 *	@param dateStart - ���� ������
	 *	@param countDayForAdd - ���-�� ������� ����
	 */
	public Date getDateOnworkingDay(Date dateStart, int countDayForAdd) {

		Date dateFinal = null;
		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			selectStr = "select get_workdate_of_days(" + com.ksoe.energypro.util.Tools.convertDateTimeToSQLString(dateStart) + ", " + countDayForAdd + ")";

			statement = getDocFlowConnection().prepareStatement(selectStr);
			set = statement.executeQuery();

			if (set.next()) {
				dateFinal = set.getDate(1);
			}

			return dateFinal;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			closeDocFlowConnection();
		}
	}




	/**
	 *  ������ ����� � ���������� ���-��� ��� �������� �����-�������...
	 *
	 *  @param planCode - ��� �����
	 *  @param kartaCode - ��� ��������
	 */

	public ENPlanWorkItemForClosePlanShortList getPlanWorkItemForClosePlanList(int planCode) {
		return getPlanWorkItemForClosePlanList(planCode, Integer.MIN_VALUE);
	}

	public ENPlanWorkItemForClosePlanShortList getPlanWorkItemForClosePlanList(int planCode, int kartaCode) {

		ENPlanWorkItemForClosePlanShortList result = new ENPlanWorkItemForClosePlanShortList();
		ENPlanWorkItemForClosePlanShort anObject;
		result.list = new Vector<>();

		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "select kartarefcode, "
				+ " (select tk.techkartnumber from tktechcard tk where tk.code = kartarefcode), "
				+ " (select tk.name from tktechcard tk where tk.code = kartarefcode), "
				+ " monthPlan, factcountgen, npzcountgen,  "
				+ " case when (monthPlan - factcountgen - npzcountgen) <= 0 then 0 "
				+ "   else (monthPlan - factcountgen - npzcountgen) end as possiblecountgen"

				+ " from ("
				+ " select pi.kartarefcode, pi.countgen as monthPlan, "

				+ " (select coalesce(sum(pi2.countgen), 0) from enplanworkitem pi2, enplanwork pl "
				+ " where pl.code = pi2.planrefcode "
				+ " and pl.kindcode = " + ENPlanWorkKind.FACT + " and pl.code in ( "
				+ " select plannewrefcode from enplancorrecthistory where planrefcode = " + planCode
				+ " union select " + planCode + " as planrefcode "
				+ " union select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode
				+ " union select plannewrefcode from enplancorrecthistory where planrefcode in ( "
				+ " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + " ) )  "
				+ "  and pi2.kartarefcode = pi.kartarefcode) as factcountgen, "

				+ " (select coalesce(sum(pi3.countgen), 0) from enplanworkitem pi3, enplanwork pl "
				+ " where pl.code = pi3.planrefcode "
				+ " and pl.kindcode = " + ENPlanWorkKind.NPW
				+ " and pl.statuscode = " + ENPlanWorkStatus.GOOD + " and pl.code in ( "
				+ " select plannewrefcode from enplancorrecthistory where planrefcode = " + planCode
				+ " union select " + planCode + " as planrefcode  "
				+ " union select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode
				+ " union select plannewrefcode from enplancorrecthistory where planrefcode in ( "
				+ " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + " ) )  "
				+ "  and pi3.kartarefcode = pi.kartarefcode ) as npzcountgen "

				+ " from enplanworkitem pi where pi.planrefcode = " + planCode + " ) m "

				+ (kartaCode == Integer.MIN_VALUE ? " " : " where m.kartarefcode = " + kartaCode)

				+ " order by 1";

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENPlanWorkItemForClosePlanShort();

				anObject.kartaRefCode = set.getInt(1);
				if (set.wasNull())
					anObject.kartaRefCode = Integer.MIN_VALUE;

				anObject.kartaNum = set.getString(2);
				anObject.kartaRefName = set.getString(3);

		        anObject.monthPlanCountGen = set.getBigDecimal(4);
		        if(anObject.monthPlanCountGen != null)
		            anObject.monthPlanCountGen = anObject.monthPlanCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

		        anObject.factCountGen = set.getBigDecimal(5);
		        if(anObject.factCountGen != null)
		            anObject.factCountGen = anObject.factCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

		        anObject.npzCountGen = set.getBigDecimal(6);
		        if(anObject.npzCountGen != null)
		            anObject.npzCountGen = anObject.npzCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

		        anObject.possibleCountGen = set.getBigDecimal(7);
		        if(anObject.possibleCountGen != null)
		            anObject.possibleCountGen = anObject.possibleCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);


				result.list.add(anObject);
			}

			result.setTotalCount(i);

			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}


	/**
	 *   ��������� ���� �����(�����) � �����
	 *   �������� �� ���������� ���������...
	 *
	 *	 @param - planCode
	 *   @param - materialCode
	 */
	public void setZeroOtherWork(int planCode, int materialCode) {
		try {

			Context context = new InitialContext();
			Object pwiRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);
			ENPlanWorkItemControllerHome pwiHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(pwiRef, ENPlanWorkItemControllerHome.class);
			ENPlanWorkItemController planWorkItemController = pwiHome.create();

			ENPlanWorkItemDAO planWorkItemDao = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItemFilter itemFilter = new ENPlanWorkItemFilter();

			itemFilter.conditionSQL = " enplanworkitem.code in ( "
					+ " select pi.code from enplanworkitem pi, enestimateitem ei "
					+ " where pi.planrefcode = ei.planrefcode "
					+ " and pi.code = ei.planitemrefcode "
					+ " and pi.planrefcode = " + planCode
					+ " and ei.materialrefcode <> " + materialCode
					+ " and ei.kindrefcode = " + ENEstimateItemKind.SERVICES + " ) ";

			int pwiArr[] = planWorkItemDao.getFilteredCodeArray(itemFilter, 0, -1);
			for (int i = 0; i < pwiArr.length; i++) {

				ENPlanWorkItem planWorkItem = planWorkItemDao.getObject(pwiArr[i]);
				planWorkItem.countGen = new BigDecimal(0);

				planWorkItemController.save(planWorkItem);
			}


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 *  �������� ����� ��������� ����� � ������� �� CallCenter'�
	 *
	 */
	public boolean checkPlan2CCDamageLog(int monthPlanCode) {
		try {
			ENPlanWork2CCDamageLogDAO plan2damageDao = new ENPlanWork2CCDamageLogDAO(connection, userProfile);
			ENPlanWork2CCDamageLogFilter plan2damageFilter = new ENPlanWork2CCDamageLogFilter();
			plan2damageFilter.planRef.code = monthPlanCode;

			int ccArr[] = plan2damageDao.getFilteredCodeArray(plan2damageFilter, 0, -1);
			if (ccArr.length > 0) {
				return true;
			}

			return false;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int createPlanForDisconnectionSupplier(int servicesCostCode, int elementCode, Date planDate,
			FINExecutor finExecutor, String molCode, String molName , int departmentCode , int budgetCode) {

        if (elementCode == Integer.MIN_VALUE)
        {
        	throw new EnergyproSystemException("\n\nNET-4576 �� ������� ��� ��'���� ��� ���������� �����!");
        }

        if (servicesCostCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n\nNET-4576 �� ������� ���������� ������������� �������!");
        }

        if (finExecutor == null)
        {
            throw new EnergyproSystemException("\n\nNET-4576 �� ������� ���������� ��� ���������� �����!");
        }

        try
        {
	        ENPlanWork plan = new ENPlanWork();

	        //DepartmentLogic departmentLogic = new DepartmentLogic(connection, userProfile);
	        //plan.departmentRef.code = ren2FINExecutorList.get(0).departmentRefCode;
	        plan.departmentRef.code = departmentCode; // departmentLogic.getDepartmentByElementCode(elementCode, true);

	        plan.finExecutor = finExecutor;

	        plan.budgetRef.code = budgetCode;// ENConsts.ENBUDGET_ENERGOSBYT;
			plan.responsibilityRef.code = getResponsibilityByBudgetCode(/* ENConsts.ENBUDGET_ENERGOSBYT */ plan.budgetRef.code );

	        //plan.commentGen = "";

	        plan.dateStart = planDate; //Tools.getFirstDayOfMonth(planDate);
	        plan.dateFinal = plan.dateStart; //Tools.getLastDayOfMonth(planDate);
	        plan.yearGen = Tools.getYear(plan.dateStart);
	        plan.monthGen = Tools.getMonth(plan.dateStart) + 1;

	        plan.elementRef.code = elementCode;

	        //plan.kind.code = ENPlanWorkKind.CURRENT;

	        plan.formRef.code = ENPlanWorkForm.NOPLANNED;
	        plan.status.code = ENPlanWorkStatus.GOOD;
	        plan.stateRef.code = ENPlanWorkState.WORK_IN_OUT;
	        plan.typeRef.code = ENPlanWorkType.WORK_IN_OUT;

			ENServicesCostControllerHome servicesCostHome =
					(ENServicesCostControllerHome) Tools.createControllerHome(ENServicesCostController.JNDI_NAME, ENServicesCostControllerHome.class);
			ENServicesCostController servicesCostController = servicesCostHome.create();

			ENServicesCostDAO servicesCostDAO = new ENServicesCostDAO(connection, userProfile);
			ENServicesCost servicesCost = servicesCostDAO.getObject(servicesCostCode);

			ENServicesCost[] servicesCosts = new ENServicesCost[] {servicesCost};
			int monthPlanCode = servicesCostController.generatePlans(servicesCosts, plan, true);

			return monthPlanCode;

        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (PersistenceException e) {
        	throw new EnergyproSystemException(e.getMessage(), e);
		}

	}

	public int getServicesObjectCodeForSupplierByElementCode(int elementCode) {
		CallCenterLogic ccLogic = new CallCenterLogic(connection, userProfile);

		CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
		ccRecordPointFilter.elementCode = elementCode;

		CCRecordPoint ccRecordPoint = null;
		try {
			ccRecordPoint = ccLogic.getCCRecordPoint(ccRecordPointFilter, false);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}

		if (ccRecordPoint == null) {
			throw new SystemException("\n\nNET-4576 �� ������� ��������� ����� ����� (CCRecordPoint)! " +
		                              "[elementCode = " + elementCode + "]");
		}

		int supplierCode = ccRecordPoint.supplierCode;

		if (supplierCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� ������������� ��� ����� �����! " +
                                      "[CCRecordPoint.code = " + ccRecordPoint.code + "]");
		}

		return getServicesObjectCodeForSupplier(supplierCode);
	}

	public int getServicesObjectCodeForSupplier(int supplierCode) {
		if (supplierCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� �������������!");
		}

		Connection addressConnection = null;

		try {
			addressConnection = getConnection(AuthorizationJNDINames.ADDRESS_DATASOURCE);

	        PreparedStatement statement = null;
	        ResultSet set = null;
	        String sql =
	        		" select sso.servicesobjectcode " +
					" from supplier2enservicsbjct sso " +
					" where sso.supplierrefcode = ? " +
					"   and sso.typerefcode = " + Supplier2ServicesObjectType.REIMBURSEMENT;

	        try {

	            statement = addressConnection.prepareStatement(sql);
	            statement.setInt(1, supplierCode);

	            set = statement.executeQuery();
	            if (set.next()) {
	            	return set.getInt(1);
	            }

	        } catch (SQLException e) {
	            System.out.println(e.getMessage() + "\nstatement - " + sql);
	            throw new SystemException(e.getMessage(), e);
	        } finally {
				try {
					if (set != null)
						set.close();
				} catch (SQLException e) {
				}
				try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	        }

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (addressConnection != null && !addressConnection.isClosed()) {
					addressConnection.close();
					addressConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		return Integer.MIN_VALUE; //1017139766; //1017117572; //1017140446;
	}

	public void saveDFPackCodeForPlanDisconnectionSupplier(int dfPackCode, int planCode) {
		if (dfPackCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� ������ � DocFlow!");
		}

		if (planCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
		}

		try {
			ENServices2PlanDAO services2PlanDAO = new ENServices2PlanDAO(connection, userProfile);

			ENServices2Plan services2Plan = getENServices2PlanByPlanCode(planCode, true);

			ENServices2PlanFilter services2PlanFilter = new ENServices2PlanFilter();
			services2PlanFilter.planRef.code = planCode;
			services2Plan.dfPackCode = dfPackCode;
			services2PlanDAO.save(services2Plan);
		}
		catch (PersistenceException e) {
        	throw new EnergyproSystemException(e.getMessage(), e);
		}
	}

	public int makePlanDisconnectionSupplier(int elementCode, int tkCode, Date planDate, FINExecutor finExecutor,
			String masterCode, String masterName, String mechanicCode, String mechanicName, int dfPackCode , int departmentCode
			,int budgetCode) {

		// TODO: UNCOMMENT LATER!!!
		/* ���� ��� ��� �������� ������, ������ ��� ������ ����� ����� �������� ������ ������� ��� ���� ������
		if (dfPackCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� ������ � DocFlow!");
		}
		*/

		int servicesObjectCode = getServicesObjectCodeForSupplierByElementCode(elementCode);

		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� �������� �� ������������ ������ ��� �������������!");
		}

		try {
			TKCalcCostControllerHome calcCostHome =
					(TKCalcCostControllerHome) Tools.createControllerHome(TKCalcCostController.JNDI_NAME, TKCalcCostControllerHome.class);
			TKCalcCostController calcCostController = calcCostHome.create();

			TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
			classificationTypeRef.code = tkCode;
			TKCalcCost calcCost = calcCostController.getObject(classificationTypeRef, planDate);

			if (calcCost == null) {
				throw new SystemException("\n\n "
						+ "���� ���������� ��� �����������. \n"
						+ "��������� �� ����������� �����.");
			}

			ENServicesCostControllerHome servicesCostHome =
					(ENServicesCostControllerHome) Tools.createControllerHome(ENServicesCostController.JNDI_NAME, ENServicesCostControllerHome.class);
			ENServicesCostController servicesCostController = servicesCostHome.create();

			ENServicesCost servicesCost = new ENServicesCost();
			servicesCost.servicesObjectRef.code = servicesObjectCode;
			servicesCost.tkCalcCostRef.code = calcCost.code;
			servicesCost.countGen = new BigDecimal(1);
			servicesCost.dateGen = planDate;

			BigDecimal distance = new BigDecimal(0);
			int servicesCostCode = servicesCostController.add(servicesCost, distance);

			int planCode = createPlanForDisconnectionSupplier(servicesCostCode, elementCode, planDate, finExecutor,
					masterCode, masterName , departmentCode , budgetCode );

			// ���������� ��� ������ �� DocFlow � ������ ����� � ���������
			if (dfPackCode != Integer.MIN_VALUE) {
				saveDFPackCodeForPlanDisconnectionSupplier(dfPackCode, planCode);
			}

			// ������� �������-����
		    /////
			ENPlanWorkControllerHome planHome =
					(ENPlanWorkControllerHome) Tools.createControllerHome(ENPlanWorkController.JNDI_NAME, ENPlanWorkControllerHome.class);
			ENPlanWorkController planController = planHome.create();

			return planController.closePlanWorkWithParams(planCode, planDate, null, null,
					masterCode, masterName, mechanicCode, mechanicName, null, true);
			/////

        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }

	}

	public void removePlanDisconnectionSupplier(int planCode) {
		if (planCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
		}

		try {
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObjectNOSEGR(planCode);

			if (plan.kind.code != ENPlanWorkKind.NPW) {
				throw new SystemException("\n\nNET-4576 ���� � ����� " + planCode + " �� � ���������-������!");
			}

			ENPlanWorkControllerHome planHome =
					(ENPlanWorkControllerHome) Tools.createControllerHome(ENPlanWorkController.JNDI_NAME, ENPlanWorkControllerHome.class);
			ENPlanWorkController planController = planHome.create();

			int monthPlanCode = getMonthPlanCodeByAnyPlanCode(planCode);

			// ������� �������-����
			planController.openPlanWork(planCode, false, true);

			// ������� �������� ���� ������ � ������������
			removeServicesCostsByMonthPlanCode(monthPlanCode);

	    } catch (RemoteException e) {
	        throw new EnergyproSystemException(e.getMessage(), e);
	    } catch (CreateException e) {
	        throw new EnergyproSystemException(e.getMessage(), e);
	    } catch (PersistenceException e) {
	    	throw new EnergyproSystemException(e.getMessage(), e);
		}
	}

	public void removeServicesCostsByMonthPlanCode(int monthPlanCode) {
		if (monthPlanCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nNET-4576 �� ������� ��� �����!");
		}

		try {
			ENServicesCostDAO servicesCostDAO = new ENServicesCostDAO(connection, userProfile);
			ENServicesCostFilter servicesCostFilter = new ENServicesCostFilter();
			servicesCostFilter.planRef.code = monthPlanCode;
			int[] servicesCostArr = servicesCostDAO.getFilteredCodeArray(servicesCostFilter, 0, -1);

			if (servicesCostArr.length > 0) {
				ENServicesCost[] servicesCosts = new ENServicesCost[servicesCostArr.length];
				for (int i = 0; i < servicesCostArr.length; i++) {
					servicesCosts[i] = servicesCostDAO.getObject(servicesCostArr[i]);
				}

				ENServicesCostControllerHome servicesCostHome =
						(ENServicesCostControllerHome) Tools.createControllerHome(ENServicesCostController.JNDI_NAME, ENServicesCostControllerHome.class);
				ENServicesCostController servicesCostController = servicesCostHome.create();

				servicesCostController.generatePlans(servicesCosts, false);
				servicesCostController.remove(servicesCostArr);
			} else {
				throw new SystemException("\n\nNET-4576 ��� ����� � ����� " + monthPlanCode + " �� �������� ����������� ����������!");
			}
	    } catch (RemoteException e) {
	        throw new EnergyproSystemException(e.getMessage(), e);
	    } catch (CreateException e) {
	        throw new EnergyproSystemException(e.getMessage(), e);
	    } catch (PersistenceException e) {
	    	throw new EnergyproSystemException(e.getMessage(), e);
		}
	}




	/**
	 *  ������������� ������� �� ������� �������� ������� ������
	 */
	public void closeAllYearPlans() {

		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
		String selectStr = " select distinct pl.budgetrefcode "
				+ " from enplanwork pl "
				+ " where pl.kindcode = 1 "
				+ " and pl.yeargen = 2020 "
				+ " and pl.statuscode = 1 "
				+ " and pl.budgetrefcode <> 240000001 "
				+ " order by 1 ";

			statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(selectStr);
			rs = statement.executeQuery();

			while (rs.next()) {
				int budgetCode = rs.getInt(1);
				startJob(budgetCode);
			}

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void startJob(int budgetCode) {

		startJob runJob = new startJob(budgetCode);
		Thread t = new Thread(runJob);
		t.start();

	}

	public class startJob implements Runnable {

		private int budgetCode;

		public startJob(int budgetCode) {
			this.budgetCode = budgetCode;
		}

		@Override
		public void run() {

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";
			DomainInfo domainInfo = new DomainInfo();
			GenericSessionStatelessBean._userAlias = "energynet";

			try {

				connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
				domainInfo = getDomainInfo(userProfile.userName);

				userProfile.domainInfo.domain = domainInfo.domainName;
				userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
				userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

				Context cnt = new InitialContext();
				Object objRef = cnt.lookup(ENPlanWorkController.JNDI_NAME);
				ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
						.narrow(objRef, ENPlanWorkControllerHome.class);
				ENPlanWorkController planController = planHome.create();



				ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.conditionSQL = " enplanwork.code in ( "
						+ " select pl.code "
						+ " from enplanwork pl "
						+ " where pl.kindcode = 1 "
						+ " and pl.yeargen = 2020 "
						+ " and pl.statuscode = 1 "
						+ " and pl.budgetrefcode = " + budgetCode + " ) ";

				planFilter.orderBySQL = "enplanwork.code ";


				int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
				for (int i = 0; i < planArr.length; i++) {

					System.out.println("########## closePlanWork: planWork " + (i + 1) + " of " + planArr.length + " ####### planCode = " + planArr[i]
						+ " :: budgetCode = " + budgetCode);

					planController.closePlanWork(planArr[i]);
				}


			} catch (Exception e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				GenericSessionStatelessBean._userAlias = "";
				try {
					connection.close();
				} catch (SQLException e) {
					throw new SystemException(e.getMessage(), e);
				}
			}
		}
	}


	public class DomainInfo {
		public String domainName;
		public int minCodeValue;
		public int maxCodeValue;
	}

	public DomainInfo getDomainInfo(String userName) throws PersistenceException, DatasourceConnectException {

		Connection connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

		PreparedStatement statement = null;
		DomainInfo info = null;

		try {
			String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
                    + " from auth_domain d"
                    + " where d.name = (select user_domain"
                    + " from auth_user"
                    + " where user_name = " + "'" + userName + "')";

			statement = connection.prepareStatement(selectStr);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				info = new DomainInfo();
				info.domainName = resultSet.getString(1);
				info.minCodeValue = resultSet.getInt(2);
				info.maxCodeValue = resultSet.getInt(3);
			}
			resultSet.close();

			return info;
		} catch (SQLException e) {
			throw new PersistenceException("Can't get DomainInfo", e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	// ������ � ������ ������ �� ������ �������� �� ��� ��������
	public String getStrCodePlanFromENtechCond2enplanwork(int codeEnTechConditionsServices) throws PersistenceException {
		String stringCodePlan = "-1";

			ENTechCond2PlanWorkDAO objectDAO = new ENTechCond2PlanWorkDAO(connection, userProfile);

			ENTechCond2PlanWorkShortList enTechCond2PlanWorkShortLists = new ENTechCond2PlanWorkShortList();
			ENTechCond2PlanWorkFilter enTechCond2PlanWorkFilter = new ENTechCond2PlanWorkFilter();
			enTechCond2PlanWorkFilter.techConServicesRef.code = codeEnTechConditionsServices;

			enTechCond2PlanWorkShortLists = objectDAO.getScrollableFilteredList(enTechCond2PlanWorkFilter, 0, -1);

			for (int i = 0; i < enTechCond2PlanWorkShortLists.size(); i++) {
				if ("-1".equals(stringCodePlan)) {
					stringCodePlan = String
							.valueOf(enTechCond2PlanWorkShortLists.get(i).planRefCode);
				} else {
					stringCodePlan = stringCodePlan
							+ ","
							+ String.valueOf(enTechCond2PlanWorkShortLists
									.get(i).planRefCode);
				}
			}

		return stringCodePlan;
	}

	/**
	 * �������� ������� �� ENPlanWork ( ���� �� ���.���.: servicesFSideFinId,
	 * servicesFSideCnNum) �� ���������: - �������� ���� - ������� �� �������
	 *
	 * @param servicesConnectionCode
	 *            - ��� (��"���� - ������� �� �������)
	 * @param enServicesConnectionElementCode
	 *            - ��� (������� ����)
	 * @param codeEnTechConditionsServices
	 *            - ��� �� (������ ��� ��������� �������� ����)
	 * @param servicesFSideFinId
	 *            - PK �������� � ���.���.
	 */
	public void addFinDocIdFromENPlanWork(int servicesConnectionCode, int enServicesConnectionElementCode,
			int codeEnTechConditionsServices, int servicesFSideFinId) throws PersistenceException {
		Connection finConn = null;

		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			String strTechCondPlanCodes = getStrCodePlanFromENtechCond2enplanwork(codeEnTechConditionsServices);
			String nameOrg = "";
			ENPlanWorkDAO enPlanWorkDAO = new ENPlanWorkDAO(connection, userProfile);

			FINContractsDAO finContractsDAO = new FINContractsDAO(finConn, userProfile);
			ENSOContractDAO enSOContractDAO = new ENSOContractDAO(connection, userProfile);
			RQOrgDAO rqOrgDAO = new RQOrgDAO(finConn, userProfile);

			ENPlanWorkFilter enPlanWorkFilter = new ENPlanWorkFilter();
			ENPlanWorkShortList enPlanWorkShortLists;
			RQOrgShortList rqOrgShortList;
			FINContracts finContracts;
			FINContracts tempFinContracts = new FINContracts();
			ENSOContract enSOContract;
			ENSOContractShortList enSOContractShortLists = new ENSOContractShortList();
			ENSOContractFilter enSOContractFilter = new ENSOContractFilter();

			enSOContractFilter.servicesObjectRef.code = servicesConnectionCode;
			// enSOContractShortLists =
			// enSOContractDAO.getScrollableFilteredList(enSOContractFilter,0,-1);

			enPlanWorkFilter.conditionSQL = "(enplanwork.elementrefcode = "
					+ enServicesConnectionElementCode
					+ " or enplanwork.code in (" + strTechCondPlanCodes
					+ "))"
					+ " AND enplanwork.kindcode = "
					+ ENPlanWorkKind.CURRENT // ̳������
					+ " AND enplanwork.typerefcode = "
					+ ENPlanWorkType.SERVICES_FROM_SIDE // ������� � �������
					+ " AND enplanwork.SERVICESFSIDEFINID = "
					+ servicesFSideFinId;

			enPlanWorkShortLists = enPlanWorkDAO.getScrollableFilteredList(
					enPlanWorkFilter, 0, -1);

			for (int i = 0; i < enPlanWorkShortLists.size(); i++) {
				enSOContract = new ENSOContract();
				int tmpServicesFSideFinId = enPlanWorkShortLists.get(i).servicesFSideFinId;

				finContracts = finContractsDAO.getObjectFromFK(tmpServicesFSideFinId);
				rqOrgShortList = rqOrgDAO.getPartnersListForAgree(tmpServicesFSideFinId);

				nameOrg = rqOrgShortList.get(0).getName();

				if (finContracts != null) {
					enSOContractFilter.finDocID = finContracts.getFinDocID();
					enSOContractShortLists = enSOContractDAO.getScrollableFilteredList(enSOContractFilter, 0,-1);
					// ���� ������ ��������(servicesFSideFinId) ��� �� ���������
					if (enSOContractShortLists.size() <= 0) {
						enSOContract.numContractFinCol = finContracts.getContractNumber();
						enSOContract.dateContractFinCol = finContracts.getContractDate();
						enSOContract.namePartnerFinCol = nameOrg;// finContracts.getOrg().name;
						enSOContract.noteContrcatFinCol = finContracts.getDescription();
						enSOContract.finDocID = finContracts.getFinDocID();
						enSOContract.servicesObjectRef.code = servicesConnectionCode;

						enSOContractDAO.add(enSOContract);
					}
				}
			}
		}catch(DatasourceConnectException e){}
		finally{
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
		}

	}



	/**
	 * ���������� ��� �����-����������� �� ���� ��������
	 *
	 * @param soCode
	 * @return calculationPlanCode
	 */
	public int getPlanCodeForCalculationByServicesObjectCode(int soCode) {

		int calculationPlanCode = Integer.MIN_VALUE;
		try {

			ENPlanWorkDAO planWorkDao = new ENPlanWorkDAO(connection, userProfile);

			ENPlanWorkFilter planWorkFilter = new ENPlanWorkFilter();
			planWorkFilter.kind.code = ENPlanWorkKind.CALCULATION;
			planWorkFilter.conditionSQL = " enplanwork.elementrefcode = ( "
					+ " select so.elementcode from enservicesobject so "
					+ " where so.code = " + soCode + ")";

			int pArr[] = planWorkDao.getFilteredCodeArray(planWorkFilter, 0, -1);
			if (pArr.length > 0) {
				calculationPlanCode = pArr[0];
			}

			return calculationPlanCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public boolean isPlanForRepairRequest(ENPlanWork plan) {
		if (plan == null) {
			throw new IllegalArgumentException("\n\nSUPP-92662 �� ������� ��'��� �����!");
		}

		if (//plan.kind.code != ENPlanWorkKind.CURRENT ||
			plan.stateRef.code != ENPlanWorkState.DISMANTLING) {
			return false;
		}

		try {
			ElementLogic elementLogic = new ElementLogic(connection, userProfile);
			int elementType = elementLogic.getElementTypeByPlan(plan);
			if (elementType != ENElementType.TRANSPORT) {
				return false;
			}

			return true;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkDocApprovalByPlanCode(int planCode) {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new IllegalArgumentException("\n\nSUPP-92662 �� ������� ��� �����!");
    	}

    	try {
			DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);
			docFlowLogic.checkDocApprovalByPlanCode(planCode);
		} catch (DatasourceConnectException ex) {
			throw new SystemException(ex.getMessage(), ex);
		} finally {
			closeDocFlowConnection();
		}
	}

	public boolean isPlanConnected2Doc(int planCode) {
    	if (planCode == Integer.MIN_VALUE) {
    		throw new IllegalArgumentException("\n\nSUPP-92662 �� ������� ��� �����!");
    	}

    	try {
			DocFlowLogic docFlowLogic = new DocFlowLogic(getDocFlowConnection(), userProfile);
			return docFlowLogic.isPlanConnected2Doc(planCode);
		} catch (DatasourceConnectException ex) {
			throw new SystemException(ex.getMessage(), ex);
		} finally {
			closeDocFlowConnection();
		}
	}

	public void checkIfManualMaterialsAddingAllowed(ENEstimateItem estimateItem) {
    	if (estimateItem == null) {
    		throw new IllegalArgumentException("\n\n�� ������� �������!");
    	}

    	if (estimateItem.planItemRef == null || estimateItem.planItemRef.code == Integer.MIN_VALUE) {
    		return;
    	}

    	try {
	    	ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
	    	ENPlanWork plan = planDao.getObjectNOSEGR(estimateItem.planRef.code);

	    	// ��� "�����������" �����
	    	if (plan.typeRef.code == ENPlanWorkType.TRUCKING) {
	    		return;
	    	}

	    	if (estimateItem.kindRef.code == ENEstimateItemKind.MATERIALS) {
	    		ENPlanWorkItemDAO planItemDao = new ENPlanWorkItemDAO(connection, userProfile);
		    	ENPlanWorkItem planItem = planItemDao.getObject(estimateItem.planItemRef.code);
		    	// ��� ������ "����������� �������" ���� �����
		    	if (planItem.kartaRef.code == TKTechCard.TRUCKING_CARGO) {
		    		return;
		    	}

	    		throw new SystemException("\n\nSUPP-96143 ����� ������������� ������ �������� ���������� ��������� ����������� �������� �� ������ ������!\n" +
	    				"��������� �������� ������ ���� ������ �� �������!");
	    	}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void validateENPlanWorkItemSource(ENPlanWorkItem planItem, int elementType) {
    	if (planItem == null) {
    		throw new IllegalArgumentException("\n\n�� ������ ������!");
    	}

    	if (elementType <= 0) {
    		throw new IllegalArgumentException("\n\n�� ������ ��� ���� ��������!");
    	}

    	try {
			if (elementType == ENElementType.SERVICES_OBJECT) {
				if (planItem.countGen.compareTo(new BigDecimal(0)) > 0) {
					TKTechCardDAO techCardDAO = new TKTechCardDAO(connection, userProfile);
					TKTechCard techCard = techCardDAO.getObject(planItem.kartaRef.code);
					if (techCard.techcardsource.code != TKTechCardSource.CALCULATIONS
							&& techCard.techcardsource.code != TKTechCardSource.CALCULATIONS_2016 ) {
						throw new EnergyproSystemException("\n\n"
								+ "�������� ������ � ���� ��� ������ �� ������� ������� ����� � ������� ��������� \"�����������\"!");
					}
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



	/**
	 * ��������� ���� �����
	 *
	 * @param planCode
	 * @param dateStart
	 */
	public void updatePlanDateStart(int planCode, Date dateStart) {

		PreparedStatement preparedStmt = null;

		try {

			String updQuery = "update enplanwork set datestart = ? where code = ?";

			preparedStmt = connection.prepareStatement(updQuery);
			preparedStmt.setDate(1, new java.sql.Date(dateStart.getTime()));
			preparedStmt.setInt(2, planCode);

			preparedStmt.execute();

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
		}
	}


}
