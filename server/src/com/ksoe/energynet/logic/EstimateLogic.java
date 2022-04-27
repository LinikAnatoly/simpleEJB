package com.ksoe.energynet.logic;

//import java.awt.geom.RoundRectangle2D;
import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.exception.AuthorizationSystemException;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocAgreementDAO;
import com.ksoe.docflow.dataminer.DFDocDAO;
import com.ksoe.docflow.dataminer.DFSpecItem2ENEstimateDAO;
import com.ksoe.docflow.dataminer.DFSpecification2AgreeDAO;
import com.ksoe.docflow.dataminer.DFSpecificationItemDAO;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDocAgreement;
import com.ksoe.docflow.valueobject.DFDocStatus;
import com.ksoe.docflow.valueobject.DFSpecItem2ENEstimate;
import com.ksoe.docflow.valueobject.DFSpecification2Agree;
import com.ksoe.docflow.valueobject.DFSpecificationItem;
import com.ksoe.docflow.valueobject.filter.DFDocFilter;
import com.ksoe.docflow.valueobject.filter.DFSpecItem2ENEstimateFilter;
import com.ksoe.docflow.valueobject.filter.DFSpecification2AgreeFilter;
import com.ksoe.docflow.valueobject.filter.DFSpecificationItemFilter;
import com.ksoe.docflow.valueobject.lists.DFDocShortList;
import com.ksoe.docflow.valueobject.lists.DFSpecItem2ENEstimateShortList;
import com.ksoe.docflow.valueobject.lists.DFSpecification2AgreeShortList;
import com.ksoe.docflow.valueobject.lists.DFSpecificationItemShortList;
import com.ksoe.energynet.dataminer.ENContractDAO;
import com.ksoe.energynet.dataminer.ENContractItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateHistoryDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemPlanPayDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemStatusHistoryDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENMarkEstimateDAO;
import com.ksoe.energynet.dataminer.ENNomenclaturesOperativeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENSizMaterials2TKMaterialsDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCLogicDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.ENEstimateItem2ContractController;
import com.ksoe.energynet.ejb.ENEstimateItem2ContractControllerHome;
import com.ksoe.energynet.ejb.FINMaterialsController;
import com.ksoe.energynet.ejb.FINMaterialsControllerHome;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.ENContractItem;
import com.ksoe.energynet.valueobject.ENContractType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateHistory;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemData;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2FinShort;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENContractItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemPlanPayFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemStatusHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMarkEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENNomenclaturesOperativeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.ENContractItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2FinShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemPlanPayShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.valueobject.FINDocType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQBillDAO;
import com.ksoe.rqorder.dataminer.RQBillItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQBillItem2OrderItemDAO;
import com.ksoe.rqorder.dataminer.RQBillItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.dataminer.RQPlanPurchaseDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItem2EstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItemDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItemTender2EnContractDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItemTender2RQPurchaseItemDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItemTenderDAO;
import com.ksoe.rqorder.logic.AllocationListLogic;
import com.ksoe.rqorder.logic.BillLogic;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.ksoe.rqorder.logic.OrderLogic;
import com.ksoe.rqorder.logic.PlanPurchaseLogic;
import com.ksoe.rqorder.logic.RQAuthLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.logic.lockRQOrder;
import com.ksoe.rqorder.valueobject.RQBill;
import com.ksoe.rqorder.valueobject.RQBillItem;
import com.ksoe.rqorder.valueobject.RQBillItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQOrder;
import com.ksoe.rqorder.valueobject.RQOrderForm;
import com.ksoe.rqorder.valueobject.RQOrderItem;
import com.ksoe.rqorder.valueobject.RQOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQOrderItem2ENEstimateItemStatus;
import com.ksoe.rqorder.valueobject.RQOrderItemStatus;
import com.ksoe.rqorder.valueobject.RQOrderKind;
import com.ksoe.rqorder.valueobject.RQOrderStatus;
import com.ksoe.rqorder.valueobject.RQOrderType;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.RQPlanPurchase;
import com.ksoe.rqorder.valueobject.RQPurchaseItem;
import com.ksoe.rqorder.valueobject.RQPurchaseItem2EstimateItem;
import com.ksoe.rqorder.valueobject.RQPurchaseItem2EstimateItemStatus;
import com.ksoe.rqorder.valueobject.RQPurchaseItemTender2EnContract;
import com.ksoe.rqorder.valueobject.RQPurchaseItemType;
import com.ksoe.rqorder.valueobject.brief.RQPurchaseItem2EstimateItemGroupShort;
import com.ksoe.rqorder.valueobject.brief.RQPurchaseItem2EstimateItemShort;
import com.ksoe.rqorder.valueobject.filter.RQBillItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQBillItem2OrderItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrgFilter;
import com.ksoe.rqorder.valueobject.filter.RQPlanPurchaseFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItem2EstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItemTender2EnContractFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItemTender2RQPurchaseItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItemTenderFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItem2ENEstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrderItem2ENEstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrgShortList;
import com.ksoe.rqorder.valueobject.lists.RQPlanPurchaseShortList;
import com.ksoe.rqorder.valueobject.lists.RQPurchaseItem2EstimateItemGroupShortList;
import com.ksoe.rqorder.valueobject.lists.RQPurchaseItem2EstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQPurchaseItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQPurchaseItemTender2RQPurchaseItemShortList;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;
import com.ksoe.techcard.valueobject.filter.TKMaterialsFilter;
import com.ksoe.techcard.valueobject.lists.TKMaterialsShortList;


/*
 * tehkart
 *
 */

public class EstimateLogic extends LogicModule{


    private java.sql.Connection docConnection = null;

	protected java.sql.Connection getDOCConnection() throws DatasourceConnectException {
		try {
			if (docConnection != null && !docConnection.isClosed()) {
				return docConnection;
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext
					.lookup(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			docConnection = dataSource.getConnection();
			return docConnection;
		} catch (NamingException e) {
			throw new DatasourceConnectException(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE,
					e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE,
					e);
		}
	}

	public void closeDOCConnection() {
		try {
			if (docConnection != null && !docConnection.isClosed()) {
				docConnection.close();
				docConnection = null;
			}
		} catch (SQLException e) {
		}
	}


    public EstimateLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }


	public void checkInSCCounterByEstimateItemCode(int estCode) throws PersistenceException {

    	/**
		 *  SUPP-65483... 06.09.2017... +++ промовские счетчики привязываются вручную...
		 *  для ТУ-пром решили не проверять...
		 */
    	ENEstimateItemDAO estimateItemDao = new ENEstimateItemDAO(connection, userProfile);
    	ENEstimateItem estimateItem = estimateItemDao.getObject(estCode);

		ElementLogic elementLogic = new ElementLogic(connection, userProfile);
		int elementType = elementLogic.getElementTypeByPlanCode(estimateItem.planRef.code);

		if (elementType == ENElementType.TY_PROM) {
			return;
		}

        SCCounterDAO cDAO = new SCCounterDAO(connection, userProfile);
        SCCounterFilter cFilter = new SCCounterFilter();
        cFilter.estimateItemRef.code = estCode;
        int[] cArr = cDAO.getFilteredCodeArray(cFilter, 0, -1);
        if (cArr.length != 0){
            throw new EnergyproSystemException("\n\n"
            		+ "Цей матеріал зв'язаний з лічільником ... коригування заборонено ... ");
        }
    }

    public int getSCSealsCountByEstimateItemCode(int estCode, boolean isException) throws PersistenceException
    {
        SCSealDAO scDAO = new SCSealDAO(connection, userProfile);

        SCSealFilter scFilter = new SCSealFilter();
        scFilter.estimateItemRef.code = estCode;

        int[] scArr = scDAO.getFilteredCodeArray(scFilter, 0, -1);

        if (scArr.length != 0)
        {
        	if (isException)
        	{
        		throw new EnergyproSystemException("\n\nNET-4530 Цей матеріал зв'язаний з пломбою або ІМП! Коригування заборонено!");
        	}
        	else
        	{
        		return scArr.length;
        	}
        }

        return 0;
    }


    public BigDecimal getEstimateStateByCurrent(int estimateCode) throws PersistenceException
    {

            BigDecimal count_ = new BigDecimal(0);
  //          BigDecimal sum_ = new BigDecimal(0);

  //          FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
            String result = "";

        // 26.11.2013
        // после добавления разбивки материалов SplitEstimate решили убрать проверки привязки на фактах
        // поиск по мат-лам из планов ...
//        String eCodes = getEstimateCodesDown(estimateCode, "");
//        if (eCodes.length() > 0 ){
//            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
//            ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
//
//            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
//            eFilter.conditionSQL = "enestimateitem.code in ("+ eCodes+") and enestimateitem.countfact <> 0 and enestimateitem.code <> " + estimateCode;
//
//            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter,0,-1);
//            for (int e=0; e < eList.totalCount; e++){
//                //ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
//                //pFilter.code = eList.get(e).planRefCode;
//                ENPlanWorkShort pShort = pDAO.getShortObject(eList.get(e).planRefCode);
//                result = result + "Матеріал " + eList.get(e).materialRefName + "\n" ;
//                result = result + pShort.kindName + " план " + eList.get(e).invNumber + " " + pShort.objectName + " № наряду " + pShort.workOrderNumber
//                + " від " + new SimpleDateFormat("dd.MM.yyyy").format(pShort.dateStart) +
//                " кількість у плані " + eList.get(e).countFact + " " +eList.get(e).measureType + "\n";
//
//                FINMaterialsFilter fFilter = new FINMaterialsFilter();
//                fFilter.statusRef.code = FINMaterialsStatus.GOOD;
//                fFilter.estimateItemRef.code = eList.get(e).code;
//                fFilter.conditionSQL = "finmaterials.moldatarefcode is not null";
//
//                FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter, 0, -1);
//                if ( fList.totalCount > 0 ){
//                    result = result + "у РЕЗЕРВІ в ФК : \n ";
//                }
//                for (int f=0; f < fList.totalCount; f++){
//                    result = result + " " + fList.get(f).nn + " " + fList.get(f).mat_name + " " + fList.get(f).quantity + " " + fList.get(f).mu_name + " \n";
//
//                    if ( eList.get(e).measureType.toUpperCase().trim().equals( fList.get(f).mu_name.toUpperCase().trim() ) ){
//                        count_ = count_.add(fList.get(f).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
//                    }
//                }
//            }
//
//        }


        RQFKOrderItem2ENEstimateItemDAO ri2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);

            // расходы ...
        RQFKOrderItem2ENEstimateItemFilter f_ = new RQFKOrderItem2ENEstimateItemFilter();
            f_.estimateItem.code = estimateCode;
            f_.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null";
            // переделаем на массивчик
            // RQFKOrderItem2ENEstimateItemShortList l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);

            int[] oi2eArr = ri2eDAO.getFilteredCodeArray(f_, 0, -1);

//            if (oi2eArr.length > 0){
//                result = result + " матеріал у ПЕРЕМІЩЕННЯХ : \n";
//            }
            for (int i_ = 0; i_ < oi2eArr.length; i_++){
//                result = result + l_.get(i_).finMaterialsRefNn + " " + l_.get(i_).finMaterialsRefMat_name + " " +
//                l_.get(i_).finMaterialsRefQuantity + " " + l_.get(i_).finMaterialsRefMu_name + "\n";

                count_ = count_.add(ri2eDAO.getObject(oi2eArr[i_]).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);

//                sum_ = sum_.add(
//                        l_.get(i_).finMaterialsRefPrice.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                        ).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            // типа если проскочик в Резерве .. или в перемещениях между планами - в Оп Зап
            if (count_.doubleValue() > 0){
                return  new ENEstimateItemDAO(connection, userProfile).getObject(estimateCode).countFact;
            }


            // приходы ...    ТОЛЬКО проведенные !!!
            f_ = new RQFKOrderItem2ENEstimateItemFilter();

            f_.conditionSQL = " RQFKORDERITEM2ENSTMTTM.CODE IN ( " +
            		          " select rqfkorderitem2enstmttm.code " +
                              " from  rqfkorderitem2enstmttm, rqfkorderitem, rqfkorder " +
                              " where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null " +
                              " and RQFKORDER.STATUSCODE = " + RQFKOrderStatus.IN_FK +
                              " and RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode = rqfkorderitem.code " +
                              " and rqfkorderitem.fkorderrefcode = rqfkorder.code " +
                              " and RQFKORDERITEM2ENSTMTTM.estimateitemcode = " + estimateCode + ")";

       //   l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);

            oi2eArr = ri2eDAO.getFilteredCodeArray(f_, 0, -1);

//            if (l_.totalCount > 0){
//                result = result + " матеріал у ПРИХОДАХ : \n";
//            }

            for (int i_ = 0; i_ < oi2eArr.length; i_++){

//                result = result + l_.get(i_).fkOrderRefNumberGen + " від " + new SimpleDateFormat("dd.MM.yyyy").format( l_.get(i_).fkOrderRefDateGen ) + " " +
//                " на " + l_.get(i_).fkOrderRefMOLOUTCode + " " + l_.get(i_).fkOrderRefMOLOUTName  + " " + l_.get(i_).fkOrderItemRefNomenclatureNum + " " + l_.get(i_).fkOrderItemRefNomenclatureName + " " + l_.get(i_).countGen;

                count_ = count_.add(ri2eDAO.getObject(oi2eArr[i_]).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
//                sum_ = sum_.add(
//                        l_.get(i_).fkOrderItemRefPriceWithoutNds.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                        ).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            System.out.println(result);

            return count_;

    }

    // 26.11.2013
    // после добавления разбивки материалов SplitEstimate решили убрать проверки привязки на фактах
//    public BigDecimal getEstimateStateByCurrentNEW(int estimateCode) throws PersistenceException
//    {
//
//            BigDecimal count_ = new BigDecimal(0);
//            BigDecimal sum_ = new BigDecimal(0);
//
//            FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
//            String result = "";
//
//
//
//        // поиск по мат-лам из планов ...
//        String eCodes = getEstimateCodesDown(estimateCode, "");
//        if (eCodes.length() > 0 ){
//            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
//            ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
//
//            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
//            eFilter.conditionSQL = "enestimateitem.code in ("+ eCodes+") and enestimateitem.countfact <> 0 and enestimateitem.code <> " + estimateCode;
//
//            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter,0,-1);
//            for (int e=0; e < eList.totalCount; e++){
//                //ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
//                //pFilter.code = eList.get(e).planRefCode;
//                ENPlanWorkShort pShort = pDAO.getShortObject(eList.get(e).planRefCode);
//                result = result + "Матеріал " + eList.get(e).materialRefName + "\n" ;
//                result = result + pShort.kindName + " план " + eList.get(e).invNumber + " " + pShort.objectName + " № наряду " + pShort.workOrderNumber
//                + " від " + new SimpleDateFormat("dd.MM.yyyy").format(pShort.dateStart) +
//                " кількість у плані " + eList.get(e).countFact + " " +eList.get(e).measureType + "\n";
//
//                FINMaterialsFilter fFilter = new FINMaterialsFilter();
//                fFilter.statusRef.code = FINMaterialsStatus.GOOD;
//                fFilter.estimateItemRef.code = eList.get(e).code;
//                fFilter.conditionSQL = "finmaterials.moldatarefcode is not null";
//
//                FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter, 0, -1);
//                if ( fList.totalCount > 0 ){
//                    result = result + "у РЕЗЕРВІ в ФК : \n ";
//                }
//                for (int f=0; f < fList.totalCount; f++){
//                    result = result + " " + fList.get(f).nn + " " + fList.get(f).mat_name + " " + fList.get(f).quantity + " " + fList.get(f).mu_name + " \n";
//
//                    //if ( eList.get(e).measureType.toUpperCase().trim().equals( fList.get(f).mu_name.toUpperCase().trim() ) ){
//                    //  count_ = count_.add(fList.get(f).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
//                    //}
//
//                    if ( ! eList.get(e).measureType.toUpperCase().trim().equals( fList.get(f).mu_name.toUpperCase().trim() ) ){
//                        throw new EnergyproSystemException("Не співпадають одиниці виміру норм. матеріалу та матеріалу з ФК у попередніх прив'язках: \n" + result);
//                    }
//                }
//            }
//
//        }
//
//
//        RQFKOrderItem2ENEstimateItemDAO ri2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
//        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
//        ENEstimateItem estObj = estDAO.getObject(estimateCode);
//
//        TKMaterialsDAO matDAO = new TKMaterialsDAO(connection, userProfile);
//        TKMaterialsShort matShort = matDAO.getShortObject(estObj.materialRef.code);
//
//        String result2 = "";
//
//            // расходы ...
//        RQFKOrderItem2ENEstimateItemFilter f_ = new RQFKOrderItem2ENEstimateItemFilter();
//            f_.estimateItem.code = estimateCode;
//
//            f_.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null";
//            RQFKOrderItem2ENEstimateItemShortList l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);
//            if (l_.totalCount > 0){
//                result = result + " матеріал у ПЕРЕМІЩЕННЯХ : \n";
//                result2 = result2 + "Матеріал у ПЕРЕМІЩЕННЯХ : \n";
//            }
//            for (int i_ = 0; i_ < l_.totalCount; i_++){
//                result = result + l_.get(i_).finMaterialsRefNn + " " + l_.get(i_).finMaterialsRefMat_name + " " +
//                l_.get(i_).finMaterialsRefQuantity + " " + l_.get(i_).finMaterialsRefMu_name + "\n";
//
//                result2 = result2 + l_.get(i_).finMaterialsRefNn + " " + l_.get(i_).finMaterialsRefMat_name + ", " +
//                l_.get(i_).finMaterialsRefQuantity + " " + l_.get(i_).finMaterialsRefMu_name + "\n";
//
//                if ( ! matShort.measurementName.toUpperCase().trim().equals( l_.get(i_).finMaterialsRefMu_name.toUpperCase().trim() ) ){
//                    throw new EnergyproSystemException("Не співпадають одиниці виміру норм. матеріалу та матеріалу з ФК у попередніх прив'язках: \n" + result2);
//                }
//
//
//                count_ = count_.add( l_.get(i_).countGen ).setScale(6, BigDecimal.ROUND_HALF_UP);
//                sum_ = sum_.add(
//                        l_.get(i_).finMaterialsRefPrice.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                        ).setScale(2, BigDecimal.ROUND_HALF_UP);
//            }
//
//            // типа если проскочик в Резерве .. или в перемещениях между планами - в Оп Зап
//            if (count_.doubleValue() > 0){
//                //return  new ENEstimateItemDAO(connection, userProfile).getObject(estimateCode).countFact;
//                return  estObj.countFact;
//            }
//
//
//            String result3 = "";
//
//            // приходы ...    ТОЛЬКО проведенные !!!
//            f_ = new RQFKOrderItem2ENEstimateItemFilter();
//            f_.estimateItem.code = estimateCode;
//
//            f_.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null and RQFKORDER.STATUSCODE = " + RQFKOrderStatus.IN_FK;
//
//            l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);
//
//            if (l_.totalCount > 0){
//                result = result + " матеріал у ПРИХОДАХ : \n";
//                result3 = result3 + "Матеріал у ПРИХОДАХ : \n";
//            }
//
//            for (int i_ = 0; i_ < l_.totalCount; i_++){
//
//                result = result + l_.get(i_).fkOrderRefNumberGen + " від " + new SimpleDateFormat("dd.MM.yyyy").format( l_.get(i_).fkOrderRefDateGen ) + " " +
//                " на " + l_.get(i_).fkOrderRefMOLOUTCode + " " + l_.get(i_).fkOrderRefMOLOUTName  + " " + l_.get(i_).fkOrderItemRefNomenclatureNum + " " + l_.get(i_).fkOrderItemRefNomenclatureName + " " + l_.get(i_).countGen;
//
//                result3 = result3 + l_.get(i_).fkOrderRefNumberGen + " від " + new SimpleDateFormat("dd.MM.yyyy").format( l_.get(i_).fkOrderRefDateGen ) + " " +
//                " на " + l_.get(i_).fkOrderRefMOLOUTCode + " " + l_.get(i_).fkOrderRefMOLOUTName  + " " + l_.get(i_).fkOrderItemRefNomenclatureNum + " " + l_.get(i_).fkOrderItemRefNomenclatureName + " " + l_.get(i_).countGen;
//
//                if ( ! matShort.measurementName.toUpperCase().trim().equals( l_.get(i_).fkOrderItemRefNomenclatureUnitName.toUpperCase().trim() ) ){
//                    throw new EnergyproSystemException("Не співпадають одиниці виміру норм. матеріалу та матеріалу з ФК у попередніх прив'язках: \n" + result2);
//                }
//
//                count_ = count_.add( l_.get(i_).countGen ).setScale(6, BigDecimal.ROUND_HALF_UP);
//                sum_ = sum_.add(
//                        l_.get(i_).fkOrderItemRefPriceWithoutNds.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                        ).setScale(2, BigDecimal.ROUND_HALF_UP);
//            }
//
//            System.out.println(result);
//
//            return count_;
//
//
//    }


    public BigDecimal getEstimateStateByCurrentForOrderOut(int estimateCode, RQFKOrder order) throws PersistenceException
    {

            BigDecimal count_ = new BigDecimal(0);
   //         BigDecimal sum_ = new BigDecimal(0);

  //          FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
            String result = "";

           //
          // 26.11.2013
         // после добавления разбивки материалов SplitEstimate решили убрать проверки привязки на фактах
        // поиск по мат-лам из планов ...
       // String eCodes = getEstimateCodesDown(estimateCode, "");
      //  if (eCodes.length() > 0 ){
     //       ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
    //        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
   //
  //          ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
 //           eFilter.conditionSQL = "enestimateitem.code in ("+ eCodes+") and enestimateitem.countfact <> 0 and enestimateitem.code <> " + estimateCode;
//
//            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter,0,-1);
//            for (int e=0; e < eList.totalCount; e++){
//                //ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
//                //pFilter.code = eList.get(e).planRefCode;
//                ENPlanWorkShort pShort = pDAO.getShortObjectWithOutDomain(eList.get(e).planRefCode);
//                result = result + "Матеріал " + eList.get(e).materialRefName + "\n" ;
//                result = result + pShort.kindName + " план " + eList.get(e).invNumber + " " +
//                    pShort.objectName + " № наряду " + pShort.workOrderNumber +
//                    " від " + new SimpleDateFormat("dd.MM.yyyy").format(pShort.dateStart) +
//                    " кількість у плані " + eList.get(e).countFact + " " +eList.get(e).measureType + "\n";
//
//                FINMaterialsFilter fFilter = new FINMaterialsFilter();
//                fFilter.statusRef.code = FINMaterialsStatus.GOOD;
//                fFilter.estimateItemRef.code = eList.get(e).code;
//                fFilter.conditionSQL = "finmaterials.moldatarefcode is not null";
//
//                FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter, 0, -1);
//                if ( fList.totalCount > 0 ){
//                    result = result + "у РЕЗЕРВІ в ФК : \n ";
//                }
//                for (int f=0; f < fList.totalCount; f++){
//                    result = result + " " + fList.get(f).nn + " " + fList.get(f).mat_name + " " + fList.get(f).quantity + " " + fList.get(f).mu_name + " \n";
//
//                    // 11.10.11 А вот тут вопрос: учитываем ли любую привязку или только по тем номенклатурам,
//                    // у к-рых ед. изм. совпадает с ед. изм. нормативного материала в плане (для приходов учитываются только такие)?
//                    //*** if ( eList.get(e).measureType.toUpperCase().trim().equals( fList.get(f).mu_name.toUpperCase().trim() ) ){
//                        count_ = count_.add(fList.get(f).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
//                    //*** }
//                }
//            }
//
//        }


        RQFKOrderItem2ENEstimateItemDAO ri2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);

            // расходы ...
        RQFKOrderItem2ENEstimateItemFilter f_ = new RQFKOrderItem2ENEstimateItemFilter();
            //  f_.estimateItem.code = estimateCode;

            // 11.10.11 Выбираем все ордера на внутр. перемещение (на того же МОЛа!), кроме текущего ордера
            //*** f_.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null";
            /*
            f_.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null " +
                            " and RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode not in " +
                            " (select oi.code from rqfkorderitem oi where oi.fkorderrefcode = " + order.code + ")";
            */
            f_.conditionSQL =  " RQFKORDERITEM2ENSTMTTM.code in  ( select RQFKORDERITEM2ENSTMTTM.code " +
            " from RQFKORDERITEM2ENSTMTTM where  " +
            " RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null " +
            " and RQFKORDERITEM2ENSTMTTM.estimateitemcode = " + estimateCode +
            " and RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode in " +
            " (select oi.code " +
            " from rqfkorderitem oi, rqfkorder o " +
            " where oi.fkorderrefcode = o.code " +
            "   and o.moloutcode = '" + order.molOutCode + "' " +
            "   and o.code <> " + order.code +
            "   /*and o.dategen <= (дата текущего ордера)*/)) "; // не будем пока на даты смотреть

            // RQFKOrderItem2ENEstimateItemShortList l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);
            int[] oi2eArr = ri2eDAO.getFilteredCodeArray(f_, 0, -1);

//          if (oi2eArr.length > 0){
//              result = result + " матеріал у ПЕРЕМІЩЕННЯХ : \n";
//          }
          for (int i_ = 0; i_ < oi2eArr.length; i_++){
//              result = result + l_.get(i_).finMaterialsRefNn + " " + l_.get(i_).finMaterialsRefMat_name + " " +
//              l_.get(i_).finMaterialsRefQuantity + " " + l_.get(i_).finMaterialsRefMu_name + "\n";

              count_ = count_.add(ri2eDAO.getObject(oi2eArr[i_]).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);

//              sum_ = sum_.add(
//                      l_.get(i_).finMaterialsRefPrice.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                      ).setScale(2, BigDecimal.ROUND_HALF_UP);
          }

          /* 24.08.2016 NET-4537 Убираем пока
            // типа если проскочик в Резерве .. или в перемещениях между планами - в Оп Зап
            if (count_.doubleValue() > 0){
                return  new ENEstimateItemDAO(connection, userProfile).getObject(estimateCode).countFact;
            }
		  */

            // приходы ...    ТОЛЬКО проведенные !!!
            f_ = new RQFKOrderItem2ENEstimateItemFilter();

            f_.conditionSQL = " RQFKORDERITEM2ENSTMTTM.CODE IN ( " +
  		          " select rqfkorderitem2enstmttm.code " +
                    " from  rqfkorderitem2enstmttm, rqfkorderitem, rqfkorder " +
                    " where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null " +
                    " and RQFKORDER.STATUSCODE = " + RQFKOrderStatus.IN_FK +
                    " and RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode = rqfkorderitem.code " +
                    " and rqfkorderitem.fkorderrefcode = rqfkorder.code " +
                    " and RQFKORDER.moloutcode = '" + order.molOutCode + "' " +
                    " and RQFKORDERITEM2ENSTMTTM.estimateitemcode = " + estimateCode + ")";

//            l_ = ri2eDAO.getScrollableFilteredList(f_, 0, -1);

            oi2eArr = ri2eDAO.getFilteredCodeArray(f_, 0, -1);

//          if (l_.totalCount > 0){
//              result = result + " матеріал у ПРИХОДАХ : \n";
//          }

          for (int i_ = 0; i_ < oi2eArr.length; i_++){

//              result = result + l_.get(i_).fkOrderRefNumberGen + " від " + new SimpleDateFormat("dd.MM.yyyy").format( l_.get(i_).fkOrderRefDateGen ) + " " +
//              " на " + l_.get(i_).fkOrderRefMOLOUTCode + " " + l_.get(i_).fkOrderRefMOLOUTName  + " " + l_.get(i_).fkOrderItemRefNomenclatureNum + " " + l_.get(i_).fkOrderItemRefNomenclatureName + " " + l_.get(i_).countGen;

              count_ = count_.add(ri2eDAO.getObject(oi2eArr[i_]).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
//              sum_ = sum_.add(
//                      l_.get(i_).fkOrderItemRefPriceWithoutNds.multiply(l_.get(i_).countGen).setScale(2, BigDecimal.ROUND_HALF_UP)
//                      ).setScale(2, BigDecimal.ROUND_HALF_UP);
          }

            System.out.println(result);

            // 24.08.2016 NET-4537 Убираем пока
            // return count_;

            // 24.08.2016 NET-4537
            return new BigDecimal(0);

    }


    public String getEstimateCodesDown(int estimateCode, String codes) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;
        String tmpCodes = "";
        ENEstimateItem2ENEstimateItemDAO dao = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemFilter f = new ENEstimateItem2ENEstimateItemFilter();

        f.estimateItemInRef.code = estimateCode;
        // f.conditionSQL = " ENESTIMATEITEM2NSTMTTM.TYPEREFCODE in (" + ENEstimateItem2Type.PLAN_MOVED + "," + ENEstimateItem2Type.OBJECT_MOVED + ")";
        f.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
        ENEstimateItem2ENEstimateItemShortList l = dao.getScrollableFilteredList(f, 0, -1);

        if (l.totalCount == 0){
            if ( codes.length() ==0 ){
                codes = "" + estimateCode;
            }
            else{
                codes = codes + "," + estimateCode;
            }

            return codes;
        }

        for (int i = 0; i < l.totalCount; i++){
            if (codes.length() == 0){
                codes = getEstimateCodesDown(l.get(i).estimateItemOutRefCode, tmpCodes);
            }
            else{
                codes = codes + "," + getEstimateCodesDown(l.get(i).estimateItemOutRefCode, tmpCodes);
            }
        }

        return codes;

    }

    public ENEstimateItem getParentByMovedType(int estimateCode, int movedType) throws PersistenceException
    {
            ENEstimateItem estOut = new ENEstimateItem();
            estOut.code = Integer.MIN_VALUE;

            ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
            ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

            ENEstimateItem2ENEstimateItemFilter f = new ENEstimateItem2ENEstimateItemFilter();
            f.typeRef.code = movedType; //ENEstimateItem2Type.PLAN_MOVED;
            f.estimateItemOutRef.code = estimateCode;
            ENEstimateItem2ENEstimateItemShortList l = e2eDAO.getScrollableFilteredList(f, 0, -1);
            if (l.totalCount == 1){
                estOut = getParentByMovedType(l.get(0).estimateItemInRefCode, movedType);
            }
            else{
                estOut =  estDAO.getObject(estimateCode);
            }


            return estOut;
    }

        //planKindOut = ENPlanWorkKind.CURRENT
    // moveTypeCondition = ENPlanWorkKind.CURRENT
        public ENEstimateItem getEstimateFromE2E(int estimateCode, int planKindOut, String moveTypeCondition) throws PersistenceException
        {
            ENEstimateItem estOut = new ENEstimateItem();
            estOut.code = Integer.MIN_VALUE;

            ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

            ENEstimateItem est = estDAO.getObjectNoSegr(estimateCode);

            ENPlanWork plan = new ENPlanWorkDAO(connection, userProfile).getObjectNOSEGR(est.planRef.code);

            if ( plan.kind.code == planKindOut ){
                estOut = est;
            }
            else
            {
                ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
                ENEstimateItem2ENEstimateItemFilter f = new ENEstimateItem2ENEstimateItemFilter();
                if ( moveTypeCondition.indexOf(",") > 0 ){
                    f.conditionSQL = " typerefcode in (" + moveTypeCondition +")";
                }
                else{
                    f.typeRef.code =  new Integer(moveTypeCondition).intValue() ; // ENEstimateItem2Type.PLAN_MOVED;
                }

                f.estimateItemOutRef.code = est.code;
                ENEstimateItem2ENEstimateItemShortList l = e2eDAO.getScrollableFilteredList(f, 0, -1);
                if (l.totalCount == 1){
                    return getEstimateFromCurrentPlanByEstimateCode( l.get(0).estimateItemInRefCode );
                }
                else{
                    return estOut;
                }

            }
            return estOut;

        }


    public  ENEstimateItem getCurrentEstimate(int estimateCode) throws PersistenceException
    {
        ENEstimateItem out = new ENEstimateItem();
        out.code = Integer.MIN_VALUE;

        out = getEstimateFromCurrentPlanByEstimateCode(estimateCode);

        // типа в связках(Ест2Ест) ниче нету (пока у метрологии) + кривые АВРы
        if (out.code == Integer.MIN_VALUE){
            out = getEstimateFromCurrentPlanByPlans(estimateCode);
        }

        return out;
    }


    public ENEstimateItem getEstimateFromCurrentPlanByPlans(int estimateCode) throws PersistenceException
    {
        ENEstimateItem out = new ENEstimateItem();
        out.code = Integer.MIN_VALUE;

        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);

        ENEstimateItem e = eDAO.getObject(estimateCode);
        // пока без работ - заборт ..
        if ( e.planItemRef.code == Integer.MIN_VALUE){
            return out;
        }

        PlanWorkLogic pLogic = new PlanWorkLogic(connection, userProfile);
        ENPlanWorkItem planItem = pLogic.getParentCurrentPlanWorkItem(e.planItemRef.code);
        if (planItem.code == Integer.MIN_VALUE){
            return out;
        }

        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.planItemRef.code = planItem.code;
        eFilter.materialRef.code = e.materialRef.code;
        int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
        if (eArr.length == 0){
            return out;
        }

        out.code = eArr[0];

        return out;
    }

    public ENEstimateItem getEstimateFromCurrentPlanByEstimateCode(int estimateCode) throws PersistenceException
    {
        return getEstimateFromE2E(estimateCode, ENPlanWorkKind.CURRENT, "" + ENEstimateItem2Type.PLAN_MOVED);

        /*
        ENEstimateItem estOut = new ENEstimateItem();
        estOut.code = Integer.MIN_VALUE;

        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

        ENEstimateItem est = estDAO.getObject(estimateCode);

        ENPlanWork plan = new ENPlanWorkDAO(connection, userProfile).getObject(est.planRef.code);

        if ( plan.kind.code == ENPlanWorkKind.CURRENT ){
            estOut = est;
        }
        else
        {
            ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
            ENEstimateItem2ENEstimateItemFilter f = new ENEstimateItem2ENEstimateItemFilter();
            f.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
            f.estimateItemOutRef.code = est.code;
            ENEstimateItem2ENEstimateItemShortList l = e2eDAO.getScrollableFilteredList(f, 0, -1);
            if (l.totalCount == 1){
                return getEstimateFromCurrentPlanByEstimateCode( l.get(0).estimateItemInRefCode );
            }
            else{
                return estOut;
            }

        }
        return estOut;
        */
    }

    public int changeStatus(int estimateItemCode, int statusCode) throws PersistenceException
    {
        if (statusCode == Integer.MIN_VALUE) return statusCode;

        /*
        if (
                (statusCode != ENEstimateItemStatus.TEMP)
                && (statusCode != ENEstimateItemStatus.PLANNED)
                && (statusCode != ENEstimateItemStatus.IN_SKLAD)
            ){
            throw new EnergyproSystemException("Можна змінювати тильки статуси : Запланований /на Складі");
        }
        */

        // 26.10.11 Статус "Перенесенный" вручную тоже не ставится!
        //if ((statusCode == ENEstimateItemStatus.ORDERED) ) //|| (obj.statusRef.code == ENEstimateItemStatus.ORDERED)){
        if ((statusCode == ENEstimateItemStatus.ORDERED) || (statusCode == ENEstimateItemStatus.MOVED) || (statusCode == ENEstimateItemStatus.PRESENT))
        {
            String statusName = "";

            if (statusCode == ENEstimateItemStatus.ORDERED)
            statusName = "Замовлений";

            if (statusCode == ENEstimateItemStatus.MOVED)
            statusName = "Перенесений";

            if (statusCode == ENEstimateItemStatus.PRESENT)
            statusName = "У наявності";

            throw new EnergyproSystemException("Статус \"" + statusName + "\" ЗАБОРОНЕНО ставити вручну!", userProfile);
        }


        ENEstimateItemDAO dao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem obj = dao.getObject(estimateItemCode);

        // 21.11.14 Если статус не меняется, выходим
        if (obj.statusRef.code == statusCode)
        {
        	return statusCode;
        }

        /* 05.12.2011 +++ Статус "Для перевезень" вручную тоже не ставится! */
        if ((obj.statusRef.code == ENEstimateItemStatus.BY_TRUCKING)) {
            String statusName = "";
            statusName = "Для перевезень";
            throw new EnergyproSystemException("Статус \"" + statusName
                    + "\" ЗАБОРОНЕНО змінювати вручну!", userProfile);
        }

        // 26.10.11 Если у м-ла стоял статус "Перенесений", то его разрешается изменить на "Запланований", "У наявності" или "Непотрібний"
        if (obj.statusRef.code != ENEstimateItemStatus.MOVED)
        {
            RQFKOrderItem2ENEstimateItemFilter f = new RQFKOrderItem2ENEstimateItemFilter();
            f.estimateItem.code = obj.code;
            RQFKOrderItem2ENEstimateItemDAO dao2 = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
            int[] arr = dao2.getFilteredCodeArray(f, 0, 1);
            if (arr.length > 0){
                throw new EnergyproSystemException("Цей матеріал змінив статус автоматично ... змінювати вручну заборонено ...", userProfile);
            }

           if(obj.statusRef.code != ENEstimateItemStatus.PLANNED  || statusCode != ENEstimateItemStatus.UNUSED )
            checkInRQOrder(obj, true);
        }

        ////////////////////////////////////////////////////////////////
        // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

        if (statusCode == ENEstimateItemStatus.OWN_PRODUCTION &&
        	obj.statusRef.code != ENEstimateItemStatus.OWN_PRODUCTION)
        {
        	// Создаем план на изготовление
        	planLogic.createPlanForCPP(obj);
        }
        else if (statusCode != ENEstimateItemStatus.OWN_PRODUCTION &&
        		 obj.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
        {
        	// Пересчитываем работы в плане на изготовление и удаляем связку с этим планом
        	planLogic.recalcPlanForCPP(obj, true);
        }
        ////////////////////////////////////////////////////////////////

        obj.statusRef.code = statusCode;
        dao.save(obj);

        return statusCode;
    }


    public void transformEstimate(int estimateItemCode, ENEstimateItem newEstimate ) throws PersistenceException
    {
        if (newEstimate.materialRef.code == Integer.MIN_VALUE)
            throw new SystemException("Не вказано код матеріалу!");

        ENEstimateItemDAO dao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        TKMaterialsDAO matDao = new TKMaterialsDAO(connection, userProfile);
        TKMaterials mat = matDao.getObject(newEstimate.materialRef.code);

        ENEstimateItem obj = dao.getObject(estimateItemCode);
        if (obj.purchaseItemRef.code != Integer.MIN_VALUE && !userProfile.userName.equalsIgnoreCase("energynet")) {
            throw new SystemException("Цей матеріал включено до плану закупівель! Коригування заборонено!");
    }
        int statusCode = obj.statusRef.code;

        if ((statusCode == ENEstimateItemStatus.ORDERED) || (statusCode == ENEstimateItemStatus.MOVED) || (statusCode == ENEstimateItemStatus.PRESENT))
        {
            String statusName = "";

            if (statusCode == ENEstimateItemStatus.ORDERED)
                statusName = "Замовлений";

            if (statusCode == ENEstimateItemStatus.MOVED)
                statusName = "Перенесений";

            if (statusCode == ENEstimateItemStatus.PRESENT)
                statusName = "У наявності";

            throw new EnergyproSystemException("Матеріал зі статусом \"" + statusName + "\" ЗАБОРОНЕНО змінювати!", userProfile);
        }


        if (statusCode != ENEstimateItemStatus.MOVED)
        {
            RQFKOrderItem2ENEstimateItemFilter f = new RQFKOrderItem2ENEstimateItemFilter();
            f.estimateItem.code = obj.code;
            RQFKOrderItem2ENEstimateItemDAO dao2 = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
            int[] arr = dao2.getFilteredCodeArray(f, 0, 1);
            if (arr.length > 0){
                throw new EnergyproSystemException("На цей матеріал вже э ордера! Змінювати вручну заборонено!", userProfile);
            }

            if(obj.statusRef.code != ENEstimateItemStatus.PLANNED  || statusCode != ENEstimateItemStatus.UNUSED )
                checkInRQOrder(obj, true);
        }

        obj.countFact = new BigDecimal(0);
        obj.statusRef.code = ENEstimateItemStatus.UNUSED;
        if (obj.commentGen != null) {
        obj.commentGen = (obj.commentGen.length() > 0 ? obj.commentGen : "") + "Перетворено на новий матеріал - " + mat.name;
        } else obj.commentGen = "Перетворено на новий матеріал - " + mat.name;
        dao.save(obj);

        ENEstimateItem transformatedEstimate = new ENEstimateItem();
        transformatedEstimate.accountingTypeRef.code = obj.accountingTypeRef.code;
        transformatedEstimate.countGen = transformatedEstimate.countFact = newEstimate.countFact;
        transformatedEstimate.dateEdit = new Date();
        transformatedEstimate.userGen = userProfile.getUserName();
        transformatedEstimate.planRef.code = obj.planRef.code;
        transformatedEstimate.planItemRef.code = obj.planItemRef.code;
        transformatedEstimate.statusRef.code = ENEstimateItemStatus.PLANNED;
        transformatedEstimate.typeRef.code = ENEstimateItemType.CORRECTED;
        transformatedEstimate.cost = mat.cost;
        transformatedEstimate.price = mat.cost.multiply(newEstimate.countFact);
        transformatedEstimate.materialRef.code = mat.code;
        int newEstimateCode = dao.add(transformatedEstimate);

        ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
        e2e.estimateItemInRef.code = newEstimateCode;
        e2e.estimateItemOutRef.code = obj.code;
        e2e.typeRef.code = ENEstimateItem2Type.TRANSFORM_MATERIAL;
        e2e.countGen = newEstimate.countFact;
        e2eDAO.add(e2e);

    }



    public boolean checkCurrentEstimateInFKOrder(int estimateItemCode) throws PersistenceException
        {
            RQFKOrderItem2ENEstimateItemDAO dao = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
            RQFKOrderItem2ENEstimateItemFilter f = new RQFKOrderItem2ENEstimateItemFilter();
            f.estimateItem.code = estimateItemCode;

            /**  непонятное условие?!?!?
            f.conditionSQL = "RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE in (select oi.code from rqfkorder o, rqfkorderitem oi where o.code = oi.fkorderrefcode " +
                            // пусть буду все ... пока?! "and o.statuscode in (3,4,5)" +
                            // как будет тормозить - вернуть ;) " and o.accountingtyperefcode = " + TKAccountingType.COUNTERS +
                            ")";
            */

            int[] arr = dao.getFilteredCodeArray(f, 0, -1);
			return arr.length == 0 ? false : true;
        }


        public void addStatusHistory(int estimateCode, int newStatusCode, int typeMove) throws PersistenceException
        {
            // история статусов ..
            ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(connection, userProfile);
            ENEstimateItemStatusHistoryFilter shFilter = new ENEstimateItemStatusHistoryFilter();
            shFilter.estimateItemRef.code = estimateCode;
            shFilter.isLast = 1;
            int[] shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
            for (int i=0; i < shArr.length; i++){
                ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
                estSH1.isLast = 0;
                estSHDAO.save(estSH1);
            }

            ENEstimateItemStatusHistory estSH = new ENEstimateItemStatusHistory();
            estSH.estimateItemRef.code = estimateCode;
            estSH.statusRef.code = newStatusCode;
            estSH.typeRef.code = typeMove; //ENEstimateItem2Type.OBJECT_MOVED;
            estSH.isLast = 1;
            estSH.dateEdit = new Date();
            estSHDAO.add(estSH);
        }

        public int removeStatusHistory(int estimateCode, int typeMove) throws PersistenceException
        {
            int prevStatus = Integer.MIN_VALUE;

            ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(connection, userProfile);
            ENEstimateItemStatusHistoryFilter shFilter = new ENEstimateItemStatusHistoryFilter();
            shFilter.estimateItemRef.code = estimateCode;
            shFilter.typeRef.code = typeMove;
            shFilter.isLast = 1;
            int[] shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
            for (int i=0; i < shArr.length; i++){
                ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
                prevStatus = estSH1.statusRef.code;
                estSHDAO.remove(shArr[i]);
            }

            shFilter = new ENEstimateItemStatusHistoryFilter();
            shFilter.estimateItemRef.code = estimateCode;
            shFilter.typeRef.code = typeMove;
            shFilter.orderBySQL = "dateedit desc";
            shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, 1);
            for (int i=0; i < shArr.length; i++){
                ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
                estSH1.isLast = 1;
                estSHDAO.save(estSH1);
            }
            return prevStatus;
        }


    public void checkOnRQinPlanWorkItem(int planItemCode) throws PersistenceException
    {

        ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);

        ENPlanWorkItem planItemObj = planItemDAO.getObject(planItemCode);

        PlanWorkLogic l = new PlanWorkLogic(connection, userProfile );
        ENPlanWork p = l.getPlanByCode(planItemObj.planRef.code);

        if (p.kind.code == ENPlanWorkKind.CURRENT){

        ENEstimateItemDAO dao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter f = new ENEstimateItemFilter();
        f.planItemRef.code = planItemCode;
        // ГСМ резервируют??
        //f.kindRef.code = ENEstimateItemKind.MATERIALS;
        ENEstimateItemShortList list = dao.getScrollableFilteredList(f,0,-1);
            for (int i=0; i < list.totalCount; i++){
                if (
                    (list.get(i).statusRefCode != ENEstimateItemStatus.PLANNED)
                    ){
                    //throw new EnergyproSystemException("Матеріал вже заявлений !!!");
                    validateInOrders(list.get(i).code);
                }
            }

        }

    }


    public void validateInOrders(int estimateItemCode)  throws PersistenceException
    {
        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);

        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.code = estimateItemCode;
        eFilter.conditionSQL = " enestimateitem.statusrefcode <> "+ ENEstimateItemStatus.UNUSED +" and ( (enestimateitem.code in (select oe.estimateitemcode from rqorderitem2enestimttm oe)) or " +
                            "  (enestimateitem.code in (select oe1.estimateitemcode from rqfkorderitem2enstmttm oe1)) )";
                               //"and " + ENEstimateItem.countGen_QFielld + " <> 0 "; // ?? обнуленные не учитываем, даже если они в заявке (такого, правда, не дожно быть...)
        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
        if (eList.totalCount > 0)
            throw new EnergyproSystemException("Матеріал вже заявлений або доставлений !!!");

    }

    // расчет стоимости !!!
    public void calculateEstimateItem(int estimateItemCode) throws PersistenceException{
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem eObj = eDao.getObject(estimateItemCode);

        TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
        ENEstimateItemData mData = kDao.getMaterialDataItemsByMaterial(eObj.materialRef.code);

        eObj.price = mData.price;

        /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
        if (eObj.accountingTypeRef.code == TKAccountingType.SERVICES_FROM_SIDE) {
            eObj.cost = eObj.cost;
        } else {
            eObj.cost = mData.price.multiply(eObj.countFact).setScale(2,BigDecimal.ROUND_HALF_UP);
        }

        checkInRQOrder(eObj, true);
        eDao.save(eObj);

    }

    // расчет стоимости !!!
    public ENEstimateItem calculateEstimateItemNoSave(ENEstimateItem eObj) throws PersistenceException
    {
        ///// 07.11.12 NET-3079 При добавлении материалов заказчика цена вводится вручную на клиенте
        if (eObj.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS)
        {
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObject(eObj.planRef.code);

            if (plan.kind.code == ENPlanWorkKind.CURRENT)
            {
                if (eObj.price == null)
                {
                    throw new EnergyproSystemException("\n \n NET-3079 Введіть ціну матеріала!");
                }

                if (eObj.price.doubleValue() == 0)
                {
                    throw new EnergyproSystemException("\n \n NET-3079 Введіть ціну матеріала!");
                }

                eObj.cost = eObj.price.multiply(eObj.countFact).setScale(2, BigDecimal.ROUND_HALF_UP);

                return eObj;
            }
        }
        /////

        TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
        ENEstimateItemData mData = kDao.getMaterialDataItemsByMaterial(eObj.materialRef.code);

        /*для демонтированных материалов будем брать цену, которую поставили на клиенте*/
        if (eObj.kindRef.code != ENEstimateItemKind.UNMOUNT)
        {
            eObj.price = mData.price;
        }

        /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
        if (eObj.accountingTypeRef.code == TKAccountingType.SERVICES_FROM_SIDE)
            {
            eObj.cost = eObj.cost;
            }
        else if (eObj.kindRef.code == ENEstimateItemKind.UNMOUNT)
            {
            eObj.cost = eObj.price.multiply(eObj.countFact).setScale(2,BigDecimal.ROUND_HALF_UP);
            }
        else
        {
            eObj.cost = mData.price.multiply(eObj.countFact).setScale(2,BigDecimal.ROUND_HALF_UP);
        }
        return eObj;
    }

    public void checkAddForMetrology(ENEstimateItem eObj) throws PersistenceException{
        PlanWorkLogic pLogic = new PlanWorkLogic(connection, userProfile);
        ENPlanWork plan = pLogic.getPlanByCode(eObj.planRef.code);

        ElementLogic eLogic = new ElementLogic(connection, userProfile);
        int eType = eLogic.getElementTypeByPlanCode(eObj.planRef.code);

        if ((eType == ENElementType.METROLOGY_COUNTER) && (plan.stateRef.code == ENPlanWorkState.TO))
        {
        throw new EnergyproSystemException("В план с типом ТО нельзя добавлять материалы!!!");
        }
    }


    public boolean checkInRQOrderByPlan(ENPlanWork plan, boolean validateFormRef)  throws PersistenceException {
        return checkInRQOrderByPlan( plan,  validateFormRef, false);
    }

    public boolean checkInRQOrderByPlan(ENPlanWork plan, boolean validateFormRef, boolean isServices) throws PersistenceException
    {
        boolean out = false;
        if  (plan.kind.code != ENPlanWorkKind.CURRENT)
        {
            return out;
        }

        ENEstimateItemDAO eDAO = new  ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.planRef.code = plan.code;
        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
        for (int i=0; i < eList.totalCount; i++){
            checkInRQOrder(eList.get(i).materialRefCode, eList.get(i).deliveryTime, plan, validateFormRef, isServices);
            if (eList.get(i).statusRefCode == ENEstimateItemStatus.ORDERED){
                out = true;
            }
        }

        return out;
    }


        public void checkInRQOrder(ENEstimateItem obj, boolean validateFormRef, ENPlanWork plan) throws PersistenceException
        {

            //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            //ENPlanWork plan = planDAO.getObject(obj.planRef.code);
            if (obj.statusRef.code == ENEstimateItemStatus.PLANNED){
                checkInRQOrder(obj, plan, validateFormRef);
            }

            if (plan.kind.code == ENPlanWorkKind.CURRENT){
                // проверим есть ли в заявке этот Эстимэйт
                if (obj.code == Integer.MIN_VALUE){ return;}

                RQOrderItem2ENEstimateItemFilter i2eFilter = new RQOrderItem2ENEstimateItemFilter();
                RQOrderItem2ENEstimateItemDAO i2eDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
                i2eFilter.estimateItem.code = obj.code;
                int[] i2eArr =  i2eDAO.getFilteredCodeArray(i2eFilter, 0, -1);
                if (i2eArr.length > 0){
                    throw new EnergyproSystemException("Цей матеріал вже замовлений ...");
                }
            }
        }


        public void checkInRQOrder(ENEstimateItem obj, boolean validateFormRef) throws PersistenceException
        {

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObject(obj.planRef.code);
            if (plan.typeRef.code != ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER &&
                plan.typeRef.code != ENPlanWorkType.EZ_SETUP_ZKU &&
                plan.typeRef.code != ENPlanWorkType.EZ_CHANGE_ZKU &&
                plan.typeRef.code != ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU)
            {
                checkInRQOrder(obj, validateFormRef, plan);
            }
            else
            {
                if (checkInRQOrder(obj, plan, true))
                {
                    obj.statusRef.code=ENEstimateItemStatus.UNUSED;
                }
                else
                {
                    obj.statusRef.code=ENEstimateItemStatus.PLANNED;
                }
            }

            /*
            if ((obj.statusRef.code == ENEstimateItemStatus.PLANNED) || (obj.statusRef.code == ENEstimateItemStatus.TEMP_)){
                checkInRQOrder(obj, plan, validateFormRef);
            }

            if (plan.kind.code == ENPlanWorkKind.CURRENT){
                // проверим есть ли в заявке этот Эстимэйт
                if (obj.code == Integer.MIN_VALUE){ return;}

                RQOrderItem2ENEstimateItemFilter i2eFilter = new RQOrderItem2ENEstimateItemFilter();
                RQOrderItem2ENEstimateItemDAO i2eDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
                i2eFilter.estimateItem.code = obj.code;
                int[] i2eArr =  i2eDAO.getFilteredCodeArray(i2eFilter, 0, -1);
                if (i2eArr.length > 0){
                    throw new EnergyproSystemException("Цей матеріал вже замовлений ...");
                }
            }
            */
        }


        // 31.12.10 Проверка на связь материала с договором (по коду эстимэйта)
        public void checkInContract(int estimateCode) throws PersistenceException
        {

            ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
            TKMaterialsDAO materialsDao = new TKMaterialsDAO(connection, userProfile);
            ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItem2ContractFilter e2cFilter = new ENEstimateItem2ContractFilter();
            e2cFilter.estimateItem.code = estimateCode;
            int [] e2cList = e2cDAO.getFilteredCodeArray(e2cFilter, 0, -1);

            if (e2cList.length > 0) {
            	ENEstimateItem2Contract e2cObj = e2cDAO.getObject(e2cList[0]);
            	ENEstimateItem estimate = estimateDao.getObject(estimateCode);
            	TKMaterials material = materialsDao.getObject(estimate.materialRef.code);

                throw new EnergyproSystemException("\n\n"
                		+ " Цей матеріал (\"" + material.name + "\" сис. код. " + estimateCode + ") вже зв'язаний з  договором № " + e2cObj.contractNumber + " від "
                		+ new SimpleDateFormat("dd.MM.yyyy").format(e2cObj.contractDate).toString()
                		+ "\n (постачальник: \"" + e2cObj.org.name + "\", ОКПО:" + e2cObj.org.okpo + ")"
                		+ "\n Зверніться у \"Тендерний відділ\" т.12-82.");
            }

        }


	// 31.12.10 Проверка на связь материала с планом закупки (по коду эстимэйта)
	public void checkInPurchaseItem(ENEstimateItem estimateItem) throws PersistenceException {

		TKMaterialsDAO mDao = new TKMaterialsDAO(connection, userProfile);
		RQPlanPurchaseDAO plDAO = new RQPlanPurchaseDAO(connection, userProfile);
		AuthLogic al = new AuthLogic(connection, userProfile);

		if (estimateItem.code != Integer.MIN_VALUE) {
			if (estimateItem.purchaseItemRef.code != Integer.MIN_VALUE
					/*planpurchase2017*/ && (!al.checkPermissionSilent("ksoe/rqorder/RQPlanPurchaseController", "editEnplanwork")) ) {

				TKMaterials mObj = mDao.getObject(estimateItem.materialRef.code);
				RQPlanPurchaseFilter plFilter = new RQPlanPurchaseFilter();
				plFilter.conditionSQL = " rqplanpurchase.code in ( select pi.purchaserefcode from rqpurchaseitem pi where pi.code =  " + estimateItem.purchaseItemRef.code + " ) ";

				RQPlanPurchaseShortList plList = plDAO.getScrollableFilteredList(plFilter, 0, -1);
				if (plList.totalCount > 0
						 && !(userProfile.userName.equalsIgnoreCase("energynet") || userProfile.userName.equalsIgnoreCase("voloshinavp") )
						) {
					 throw new EnergyproSystemException("\n\n "
					 		+ " Цей матеріал (\"" + mObj.name + "\" сис. код. " + estimateItem.code + ") вже зв'язаний з  планом закупівель № "
							+ plList.get(0).name  + " від " + new SimpleDateFormat("dd.MM.yyyy").format(plList.get(0).dateAdd).toString()  );
				}
			}
		}
	}


        // 31.12.10 Проверка на связь материала с договором (по коду работы)
        public void checkInContractByPlanWorkItemCode(int planWorkItemCode) throws PersistenceException
        {
            ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);

            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.planItemRef.code = planWorkItemCode;
            int [] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);

            for(int i = 0; i < eArr.length; i++)
            {
                checkInContract(eArr[i]);
            }

        }

        // 31.12.10 Проверка на связь материала с договором (по коду плана)
        public void checkInContractByPlanWorkCode(int planWorkCode) throws PersistenceException
        {
            ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);

            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.planRef.code = planWorkCode;
            int [] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);

            for(int i = 0; i < eArr.length; i++)
            {
                checkInContract(eArr[i]);

            }

        }


    public boolean checkInRQOrder(ENEstimateItem obj, ENPlanWork plan,
    		boolean validateFormRef) throws PersistenceException {
    	return checkInRQOrder(obj, plan, validateFormRef, true);
    }

	public boolean checkInRQOrder(ENEstimateItem obj, ENPlanWork plan,
			boolean validateFormRef, boolean isException) throws PersistenceException {

		if (obj.statusRef.code == ENEstimateItemStatus.PLANNED) {

			/* 14.12.2011 +++ разделяем проверку для ТМЦ и услуг */
			if (obj.kindRef.code == ENEstimateItemKind.SERVICES) {
				return checkInRQOrder(obj.materialRef.code, obj.deliveryTime, plan, validateFormRef, true, isException);
			} else {
				return checkInRQOrder(obj.materialRef.code, obj.deliveryTime, plan, validateFormRef, false, isException);
			}
		}

		return false;
	}

	public boolean checkInRQOrder(int materialCode, int deliveryTime_,
			ENPlanWork plan, boolean validateFormRef, boolean isServices)
			throws PersistenceException {
		return checkInRQOrder(materialCode, deliveryTime_, plan, validateFormRef, isServices, true);
	}

	public boolean checkInRQOrder(int materialCode, int deliveryTime_,
			ENPlanWork plan, boolean validateFormRef, boolean isServices, boolean isException)
			throws PersistenceException {

		if (((plan.formRef.code == ENPlanWorkForm.NOPLANNED) && validateFormRef)
				|| (plan.kind.code != ENPlanWorkKind.CURRENT)) {
			return false;
		}

		RQOrderFilter orderFilter = new RQOrderFilter();
		RQOrderDAO orderDAO = new RQOrderDAO(connection, userProfile);

		RQAuthLogic authLogic = new RQAuthLogic(connection, userProfile);

		if (isServices) {
			orderFilter.kindRef.code = RQOrderKind.OE_PLANNED_SERVICES;
		} else {
			orderFilter.kindRef.code = RQOrderKind.OE_PLANNED_AUTO;
		}

        orderFilter.rqOrderForm.code = RQOrderForm.PLANNED;

        if (plan.typeRef.code == ENPlanWorkType.INVEST ||
                plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST ||
                plan.typeRef.code == ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER ||
                plan.typeRef.code == ENPlanWorkType.EZ_SETUP_ZKU ||
                plan.typeRef.code == ENPlanWorkType.EZ_CHANGE_ZKU ||
                plan.typeRef.code == ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU)

        {
            orderFilter.rqOrderType.code = RQOrderType.INVEST;
        } else {
            orderFilter.rqOrderType.code = RQOrderType.BUDGET;
        }

        int deliveryTime;

        if (deliveryTime_ > Integer.MIN_VALUE){
            deliveryTime = deliveryTime_;
        } else {
            TKMaterials m = new TKMaterialsDAO(connection, userProfile).getObject(materialCode);
            if (m.deliveryDate > Integer.MIN_VALUE ){
                deliveryTime = m.deliveryDate;
            } else {
                if (isServices) {
                    deliveryTime = RQConsts.DELIVERY_TIME_SERVICES;
                } else {
                    deliveryTime = RQConsts.DELIVERY_TIME;
                }
            }
        }

		int monthGen;
		int yearGen;
		BigDecimal d = new BigDecimal(deliveryTime).divide(new BigDecimal(30), 0, BigDecimal.ROUND_DOWN);
		int d1 = d.intValue();
		int dY = 0;
		if (plan.monthGen - d1 < 1) {
			dY = -1;
			monthGen = 12 + (plan.monthGen - d1);
		} else {
			monthGen = plan.monthGen - d1;
		}

		yearGen = plan.yearGen + dY;

		orderFilter.conditionSQL = " orderperiod = '01" + (monthGen < 10 ? ".0" + monthGen : "." + monthGen) + "." + yearGen + "'";

		synchronized (lockRQOrder.class) {
			// 27.12.10 Уберем сегрегацию, потому что для РЭСовских юзеров данный метод не находит уже существующих
            // плановых заявок, сделанных в ХОЭ, и соответственно, пропускает добавление/редактирование материалов
            //int[] arr = orderDAO.getFilteredCodeArray(orderFilter, 0, 1);
            int[] arr = orderDAO.getFilteredCodeArray(orderFilter, 0, 1, false);
            if (arr.length > 0) {

                RQOrder order = orderDAO.getObject(arr[0], false);
                if (order.statusRef.code != RQOrderStatus.GOOD) {

                	if (isException) {
                		throw new EnergyproSystemException("\n\nЦей матеріал попаде у вже складену заявку № " + order.numberDoc, userProfile);
                	} else {
                		return true;
                	}
                }

                if (!authLogic.checkEditableEstimatesInRQOrder())
                {
                    throw new EnergyproSystemException("\n\nНемає прав для коригування матеріалів у Заявці № " + order.numberDoc, userProfile);
                }

            }

            return false;
		}
	}


    public boolean checkInRQFKOrderByt(int estimateCode)
            throws PersistenceException {

        RQFKOrderItem2ENEstimateItemDAO orderDAO = new RQFKOrderItem2ENEstimateItemDAO(
                connection, userProfile);
        RQFKOrderItem2ENEstimateItemFilter orderFilter = new RQFKOrderItem2ENEstimateItemFilter();
        orderFilter.estimateItem.code = estimateCode;
        RQFKOrderItem2ENEstimateItemShortList fkList = orderDAO.getScrollableFilteredList(orderFilter, 0, 1);
        if (fkList.totalCount > 0) {
            return true;
        } else {
            return false;
        }
    }




	public void createENEstimateItems(int planItemCode, boolean isFromParent) throws PersistenceException {
		createENEstimateItems(planItemCode, isFromParent, null);
	}


	public void createENEstimateItems(int planItemCode, boolean isFromParent, TKMaterials2TKMaterialsShort m2mShort)
			throws PersistenceException {

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
		ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
		ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);
		SiZLogic siZLogic = new SiZLogic(connection, userProfile);


        ENPlanWorkItem planItemObj = dao.getObject(planItemCode);
        ElementLogic el = new ElementLogic(connection, userProfile);
        int eType = el.getElementTypeByPlanCode(planItemObj.planRef.code);

        ENPlanWorkDAO plDao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = plDao.getObject(planItemObj.planRef.code);

        ENEstimateItem[] eArr = null;

        if (isFromParent){
            eArr = getEstimatesByPlanWorkItem(planItemObj.code);
        }


        /**  код реального материала для средств защиты  */
        int rmtCode = Integer.MIN_VALUE;

		if ((eArr == null) || (eType == ENElementType.METROLOGY_COUNTER)) {

        TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
        ENSizMaterials2TKMaterialsDAO szm2tkmDao = new ENSizMaterials2TKMaterialsDAO(connection, userProfile);

        ENEstimateItemData[] data = kDao.getMaterialDataItems(planItemObj.kartaRef.code);
        for (int i = 0; i < data.length; i++) {

            ENEstimateItem eItem = new ENEstimateItem();
            eItem.planItemRef.code = planItemObj.code;
            eItem.planRef.code = planItemObj.planRef.code;

            if (eType == ENElementType.SIZ) {
                int eCode = el.getElementCodeByPlanCode(planItemObj.planRef.code);
                rmtCode = szm2tkmDao.getRealMaterialBySiz(eCode, data[i].materialCode);

                if (rmtCode != Integer.MIN_VALUE) {

                	eItem.materialRef.code = rmtCode;

                } else {
                    eItem.materialRef.code = data[i].materialCode;
                }

            } else {
                eItem.materialRef.code = data[i].materialCode;
            }

            eItem.countGen = data[i].materialCount.multiply(planItemObj.countGen).setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

            eItem.price = data[i].price;

            // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
            if (m2mShort != null && data[i].accountingTypeRefCode == TKAccountingType.COUNTERS)
                //&& (data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_1F || data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_3F))
            {
            	eItem.price = m2mShort.tkmaterialsOutRefCost;
            }

            /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
            if (data[i].accountingTypeRefCode == TKAccountingType.SERVICES_FROM_SIDE) {

                /**
                 *  для договоров подряда на разработку ПКД стоимость услуг утверждена приказом..
                 *  для таких договоров - пересчитать стоимость...
                 *
                 */
                if (servicesLogic.checkServicesProject(plan.elementRef.code)) {
                	eItem.cost = data[i].price.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                } else {
                	eItem.cost = eItem.cost;
                }

            } else {
                // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
                if (m2mShort != null && data[i].accountingTypeRefCode == TKAccountingType.COUNTERS)
                    //&& (data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_1F || data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_3F))
                {
                	eItem.cost = m2mShort.tkmaterialsOutRefCost.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }
                else
                {
                	eItem.cost = data[i].price.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }
            }


            /* 29.12.2011 +++ для услуг со стороны */
            if (data[i].accountingTypeRefCode == TKAccountingType.SERVICES_FROM_SIDE) {
                eItem.kindRef.code = ENEstimateItemKind.SERVICES;
            }

            // для СиЗ пересчитать от факта наличия.....
            if (eType == ENElementType.SIZ) {

                Date planMonth = plan.dateFinal;
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(planMonth);

                calendar.add(Calendar.MONTH, 1);
                int lastDay = calendar.getActualMaximum(Calendar.DATE);
                calendar.set(Calendar.DATE, lastDay);
                Date planDate = calendar.getTime();


                int elCode = el.getElementCodeByPlanCode(planItemObj.planRef.code);
                Date purchaseDate = siZLogic.getPurchaseDate(elCode, eItem.materialRef.code);
                Date orderDate = siZLogic.getOrderDate(elCode, eItem.materialRef.code);
                Date issueDate = siZLogic.getIssueDate(elCode, eItem.materialRef.code);


                /** 23.12.2013 +++ в первый план - весь норматив */
                boolean firstPlan = checkFirstPlanBySiz(plan.elementRef.code);
                // System.out.println("############################# firstPlan = " + firstPlan);

                if (firstPlan) {
                    eItem.countFact = eItem.countGen;

                } else {
                    if (data[i].countMonth < 100) {
                        if (data[i].countMonth == 1) {
                            eItem.countFact = eItem.countGen;
                        } else {
                            if ((purchaseDate != null && purchaseDate.before(planDate))
                                    && issueDate.after(orderDate)) {

                            	eItem.countFact = eItem.countGen;

                            } else if ( purchaseDate.equals(orderDate) && orderDate.equals(issueDate) ) {

                            	eItem.countFact = eItem.countGen;

                            } else {

                                eItem.countFact = new BigDecimal(0);
                            }
                        }

                    } else {
                        eItem.countFact = new BigDecimal(0);
                    }

                }

                /**  если нет привязки реального материала для средств защиты  */
                if (rmtCode == Integer.MIN_VALUE) {
                	eItem.countFact = new BigDecimal(0);
                }


            } else {
                eItem.countFact = eItem.countGen;
            }

            eItem.typeRef.code = 1; // auto ...
            eItem.deliveryTime = 30;


            /* 16.01.2012 +++ для услуг со стороны статус "матеріал ХОЕ" */
            if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                    || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                if (data[i].accountingTypeRefCode == TKAccountingType.TMC) {
                    eItem.statusRef.code = ENEstimateItemStatus.KSOE;
                } else {
                    eItem.statusRef.code = ENEstimateItemStatus.PLANNED;
                }
            } else {
                eItem.statusRef.code = ENEstimateItemStatus.PLANNED;
            }


            if (eType == ENElementType.METROLOGY_COUNTER)
            {
            checkAddForMetrology(eItem);
            }

            if (eType == ENElementType.SIZ) {
                eItem.useWorkTime = data[i].countMonth;
            }

            eItem.accountingTypeRef.code = data[i].accountingTypeRefCode;

            /* на.... проверять обнулённый материал */
            if (eItem.countFact.doubleValue() > 0) {
                checkInRQOrder(eItem, true);
            }


            if (eType == ENElementType.SIZ) {
            	eDao.add(eItem, false);
            } else {
            	eDao.add(eItem);
            }


        }
        }
        else
        {
            for (int j = 0; j < eArr.length; j++){
                if (eType == ENElementType.METROLOGY_COUNTER)
                {
                checkAddForMetrology(eArr[j]);
                }

                /* на.... проверять обнулённый материал */
                if (eArr[j].countFact.doubleValue() > 0) {
                    checkInRQOrder(eArr[j], true);
                }

                /* Это все уже должно быть в массиве eArr[]
                // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
                if (m2mShort != null && eArr[j].accountingTypeRef.code == TKAccountingType.COUNTERS)
                    //&& (eArr[j].materialRef.code == TKConsts.TKMATERIALS_COUNTER_1F || eArr[j].materialRef.code == TKConsts.TKMATERIALS_COUNTER_3F))
                {
                	eArr[j].price = m2mShort.tkmaterialsOutRefCost;
                }
                */

                eDao.add(eArr[j]);
            }
        }

    }

    public void createENEstimateItems(int planItemCode, boolean isFromParent, TKMaterials2TKMaterialsShort m2mShort,int materialStatus) throws PersistenceException{

        ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        SiZLogic siZLogic = new SiZLogic(connection, userProfile);

        ENPlanWorkItem planItemObj = dao.getObject(planItemCode);
        ElementLogic el = new ElementLogic(connection, userProfile);
        int eType = el.getElementTypeByPlanCode(planItemObj.planRef.code);

        ENPlanWorkDAO plDao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = plDao.getObject(planItemObj.planRef.code);

        ENEstimateItem[] eArr = null;

        if (isFromParent){
            eArr = getEstimatesByPlanWorkItem(planItemObj.code);
        }


        if (
                ( eArr == null )
                || (eType == ENElementType.METROLOGY_COUNTER)
            )
        {
        TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
        ENSizMaterials2TKMaterialsDAO szm2tkmDao = new ENSizMaterials2TKMaterialsDAO(connection, userProfile);

        ENEstimateItemData[] data = kDao.getMaterialDataItems(planItemObj.kartaRef.code);
        for (int i=0; i<data.length; i++){
            ENEstimateItem eItem = new ENEstimateItem();
            eItem.planItemRef.code = planItemObj.code;
            eItem.planRef.code = planItemObj.planRef.code;

            if (eType == ENElementType.SIZ) {
                int eCode = el.getElementCodeByPlanCode(planItemObj.planRef.code);
                int rmtCode = szm2tkmDao.getRealMaterialBySiz(eCode, data[i].materialCode);
                if (rmtCode != Integer.MIN_VALUE) {
                    eItem.materialRef.code = rmtCode;
                } else {
                    eItem.materialRef.code = data[i].materialCode;
                }
            } else {
                eItem.materialRef.code = data[i].materialCode;
            }

            eItem.countGen = data[i].materialCount.multiply(planItemObj.countGen).setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

            eItem.price = data[i].price;

            // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
            if (m2mShort != null && data[i].accountingTypeRefCode == TKAccountingType.COUNTERS)
                //&& (data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_1F || data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_3F))
            {
            	eItem.price = m2mShort.tkmaterialsOutRefCost;
            }

            /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
            if (data[i].accountingTypeRefCode == TKAccountingType.SERVICES_FROM_SIDE) {
                eItem.cost = eItem.cost;
            } else {
                // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
                if (m2mShort != null && data[i].accountingTypeRefCode == TKAccountingType.COUNTERS)
                    //&& (data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_1F || data[i].materialCode == TKConsts.TKMATERIALS_COUNTER_3F))
                {
                	eItem.cost = m2mShort.tkmaterialsOutRefCost.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }
                else
                {
                	eItem.cost = data[i].price.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }
            }

            /* 29.12.2011 +++ для услуг со стороны */
            if (data[i].accountingTypeRefCode == TKAccountingType.SERVICES_FROM_SIDE) {
                eItem.kindRef.code = ENEstimateItemKind.SERVICES;
            }

            // для СиЗ пересчитать от факта наличия.....
            if (eType == ENElementType.SIZ) {

                Date planMonth = plan.dateFinal;
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(planMonth);

                calendar.add(Calendar.MONTH, 1);
                int lastDay = calendar.getActualMaximum(Calendar.DATE);
                calendar.set(Calendar.DATE, lastDay);
                Date planDate = calendar.getTime();


                int elCode = el.getElementCodeByPlanCode(planItemObj.planRef.code);
                Date purchaseDate = siZLogic.getPurchaseDate(elCode, eItem.materialRef.code);
                Date orderDate = siZLogic.getOrderDate(elCode, eItem.materialRef.code);
                Date issueDate = siZLogic.getIssueDate(elCode, eItem.materialRef.code);


                /** 23.12.2013 +++ в первый план - весь норматив */
                boolean firstPlan = checkFirstPlanBySiz(plan.elementRef.code);

                if (firstPlan) {
                    eItem.countFact = eItem.countGen;

                } else {
                    if (data[i].countMonth < 100) {
                        if (data[i].countMonth == 1) {
                            eItem.countFact = eItem.countGen;
                        } else {
                            if ((purchaseDate != null && purchaseDate.before(planDate))
                                    && issueDate.after(orderDate)) {

                                eItem.countFact = eItem.countGen;

                            } else if ( purchaseDate.equals(orderDate) && orderDate.equals(issueDate) ) {

                            	eItem.countFact = eItem.countGen;

                            } else {

                                eItem.countFact = new BigDecimal(0);
                            }
                        }

                    } else {
                        eItem.countFact = new BigDecimal(0);
                    }

                }


            } else {
                eItem.countFact = eItem.countGen;
            }

            eItem.typeRef.code = 1; // auto ...


            /* 16.01.2012 +++ для услуг со стороны статус "матеріал ХОЕ" */
            if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                    || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
                if (data[i].accountingTypeRefCode == TKAccountingType.TMC) {
                    eItem.statusRef.code = ENEstimateItemStatus.KSOE;
                } else {
                    eItem.statusRef.code = ENEstimateItemStatus.PLANNED;
                }
            } else {
            	eItem.statusRef.code = materialStatus;
            }


            if (eType == ENElementType.METROLOGY_COUNTER)
            {
            checkAddForMetrology(eItem);
            }

            if (eType == ENElementType.SIZ) {
                eItem.useWorkTime = data[i].countMonth;
            }

            eItem.accountingTypeRef.code = data[i].accountingTypeRefCode;

            /* на.... проверять обнулённый материал */
            if (eItem.countFact.doubleValue() > 0) {
                checkInRQOrder(eItem, true);
            }

            eDao.add(eItem);
        }
        }
        else
        {
            for (int j = 0; j < eArr.length; j++){
                if (eType == ENElementType.METROLOGY_COUNTER)
                {
                checkAddForMetrology(eArr[j]);
                }

                /* на.... проверять обнулённый материал */
                if (eArr[j].countFact.doubleValue() > 0) {
                    checkInRQOrder(eArr[j], true);
                }

                /* Это все уже должно быть в массиве eArr[]
                // ТОЛЬКО ДЛЯ УСЛУГ ПО ЗАМЕНЕ СЧЕТЧИКА!!!
                if (m2mShort != null && eArr[j].accountingTypeRef.code == TKAccountingType.COUNTERS)
                    //&& (eArr[j].materialRef.code == TKConsts.TKMATERIALS_COUNTER_1F || eArr[j].materialRef.code == TKConsts.TKMATERIALS_COUNTER_3F))
                {
                	eArr[j].price = m2mShort.tkmaterialsOutRefCost;
                }
                */

                eDao.add(eArr[j]);
            }
        }

    }



    public void createENEstimate11(int planCode) throws PersistenceException{

        cancelENEstimate11(planCode);

        ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter filter = new ENPlanWorkItemFilter();
        filter.planRef.code = planCode;
        ENPlanWorkItemShortList list = dao.getScrollableFilteredList(filter,0,-1);
        for (int i = 0 ; i < list.totalCount; i++){
            createENEstimateItems(list.get(i).code, true);
        }
    }

    public void cancelENEstimate11(int planCode) throws PersistenceException{

        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
        if (planLogic.isNotEditablePlan(planCode)){
            throw new EnergyproSystemException("Plan CLOSED. Using Reopen");
        }

        ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItemFilter filter = new ENPlanWorkItemFilter();
        filter.planRef.code = planCode;
        ENPlanWorkItemShortList list = dao.getScrollableFilteredList(filter,0,-1);
        for (int i = 0 ; i < list.totalCount; i++){
            cancelENEstimateItem11(list.get(i).code);
        }
    }

    public void cancelENEstimateItem11(int planItemCode) throws PersistenceException{
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planItemRef.code = planItemCode;
        //filter.typeRef.code = ENEstimateItemType.AUTO;
        ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        for (int i=0; i < list.totalCount; i++){
            //if (list.get(i).typeRefCode == ENEstimateItemType.MANUAL){
            //    throw new EnergyproSystemException("Estimate item is MANUAL. Drop it manually. code = "+list.get(i).code);
            //}
            eDao.remove(list.get(i).code);
        }
    }

    /*
    * удаляет все части СМЕТЫ по коду части плана
    */
    public void removeENEstimateItemsByPlanItemCode(int planItemCode) throws PersistenceException{
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENMarkEstimateDAO m2eDAO = new ENMarkEstimateDAO(connection, userProfile);
        ENPlanWorkItemDAO planWorkItemDao = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkDAO planWorkDao = new ENPlanWorkDAO(connection, userProfile);

        ENPlanWorkItem planWorkItem = planWorkItemDao.getObject(planItemCode);
        ENPlanWork planWork = planWorkDao.getObjectNOSEGR(planWorkItem.planRef.code);


        /* кривой БЫТ??
        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItem pi = piDAO.getObject(planItemCode);
        ElementLogic elLogic = new ElementLogic(connection, userProfile);
        int eType = elLogic.getElementTypeByPlanCode(pi.planRef.code);
        */

        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planItemRef.code = planItemCode;

        // удалим ТОЛЬКО материалы ... ГСМ выноситься с транспортом ...

        /* 12.01.2012 +++ если услуги, их тоже берём */
        //filter.kindRef.code = ENEstimateItemKind.MATERIALS;
        filter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
                + ENEstimateItemKind.SERVICES + ")";


        //filter.typeRef.code = ENEstimateItemType.AUTO;
        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] eArr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
        for (int i=0; i < eArr.length; i++) {

            ENEstimateItem eItem = eDao.getObject(eArr[i]);

            /* кривой БЫТ??
            if (eType == ENElementType.TY_BYT)
            {
                RQOrderItem2ENEstimateItemFilter i2eFilter = new RQOrderItem2ENEstimateItemFilter();
                RQOrderItem2ENEstimateItemDAO i2eDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
                i2eFilter.estimateItem.code = eArr[i];
                int[] i2eArr =  i2eDAO.getFilteredCodeArray(i2eFilter, 0, -1);
                if (i2eArr.length > 0){
                    throw new EnergyproSystemException("Цей матеріал вже замовлений ...");
                }
            }
            else
            */

            if (eItem.countFact.doubleValue() > 0) {
            	checkInRQOrder(eItem, true);
            }


            // 31.12.10 Проверка на связь материала с договором
            checkInContract(eItem.code);


            // NET-4529	План закупок , тендера // если в плане закупок не даем менять
            if (planWork.kind.code == ENPlanWorkKind.CURRENT) {
                System.out.print(" eLogic.checkInPurchaseItem Estimatelogic.removeENEstimateitemsByPlanItemCode  2107 // eItem.code = " + eItem.code );
                checkInPurchaseItem(eItem);
            }


            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
            if (eItem.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Пересчитываем работы в плане на изготовление и удаляем связку с этим планом
            	planLogic.recalcPlanForCPP(eItem, true);
            }
            ////////////////////////////////////////////////////////////////

            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = eArr[i]; //list.get(i).code;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            // вынесем Маркера ??
            ENMarkEstimateFilter m2eFilter = new ENMarkEstimateFilter();
            m2eFilter.estimateItem.code = eArr[i];
            int[] m2eArr = m2eDAO.getFilteredCodeArray(m2eFilter, 0, -1);
            for (int m2e = 0; m2e  < m2eArr.length; m2e++){
                m2eDAO.remove(m2eArr[m2e]);
            }

            // вынесем из связки с транспортом
            {ENTransport2ENEstimateDAO tiesDAO = new ENTransport2ENEstimateDAO(connection, userProfile);
            ENTransport2ENEstimateFilter tiesFilter = new ENTransport2ENEstimateFilter();
            tiesFilter.estimateRef.code = eArr[i];
            int[] tiesCodes = tiesDAO.getFilteredCodeArray(tiesFilter, null, null,0, -1, null);
            for(int z = 0; z < tiesCodes.length; z++){tiesDAO.remove(tiesCodes[z]);}}


            eDao.remove(eArr[i]);
        }

        /// вынесем ДЕМОНТАЖ
        filter.kindRef.code = ENEstimateItemKind.UNMOUNT;

        //filter.typeRef.code = ENEstimateItemType.AUTO;
        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        eArr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
        for (int i=0; i < eArr.length; i++){

            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = eArr[i]; //list.get(i).code;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            eDao.remove(eArr[i]);
        }

        // удалим МАТЕРИАЛЫ не привязанные к работам ...
        // + возможно бензин ...
        //ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        //ENEstimateItemFilter
// пока удаялть метриалы бeз работ не будем .. пусть висят ...
/*
        filter = new ENEstimateItemFilter();
        filter.planRef.code = pi.planRef.code;
        filter.kindRef.code = ENEstimateItemKind.MATERIALS;

        //filter.typeRef.code = ENEstimateItemType.AUTO;
        list = eDao.getScrollableFilteredList(filter,0,-1);
        for (int i=0; i < list.totalCount; i++){
            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = list.get(i).code;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            eDao.remove(list.get(i).code);
        }
*/

    }

    /*
    * Возвращаем нормативный материал ... на техкарте
    */
    public ENEstimateItemData getTKMaterialDataByTechCard(int TKmaterialCode, int kartaRefCode) throws PersistenceException
    {
        ENEstimateItemData data = new ENEstimateItemData();

        TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);

        data = kDao.getMaterialDataItemsByMaterialCodeAndTechCardCode(TKmaterialCode, kartaRefCode);

        return data;
    }



    public void recalcENEstimateItemsByPlanItemCodeAVR(int planItemCode) throws PersistenceException{

    	ENPlanWorkDAO planWorkDao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
        ENPlanWorkItem pwi = pwiDAO.getObject(planItemCode);
        EstimateLogic eLogic = new EstimateLogic(connection, userProfile);

        ENPlanWork planWork = planWorkDao.getObjectNOSEGR(pwi.planRef.code);

        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        //TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);

        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planItemRef.code = planItemCode;
        // возьмем только МАТЕРИАЛЫ .. гсм и демонтаж в сад ..
        filter.kindRef.code = ENEstimateItemKind.MATERIALS;

        //filter.typeRef.code = ENEstimateItemType.AUTO;

        ENEstimateItemData data = new ENEstimateItemData();


        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);

		if (arr.length > 0) {
			for (int i = 0; i < arr.length; i++) {
				ENEstimateItem eItem = eDao.getObject(arr[i]);
				//ENEstimateItem currentItem = eDao.getObject(list.get(i).code);

				//kDao.getMaterialDataItemsByMaterialCodeAndTechCardCode(eItem.materialRef.code, pwi.kartaRef.code );
				data = getTKMaterialDataByTechCard(eItem.materialRef.code, pwi.kartaRef.code);

				eItem.countGen = data.materialCount.multiply(pwi.countGen).setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
				eItem.countFact = eItem.countGen;

				if (data.price == null)
					data.price = new BigDecimal(0.0);

                /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
                if (eItem.accountingTypeRef.code == TKAccountingType.SERVICES_FROM_SIDE) {
                    eItem.cost = eItem.cost;
                } else {
                    eItem.cost = data.price.multiply(eItem.countFact).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }

                eItem.price = data.price;

				checkInRQOrder(eItem, true);
				checkInContract(eItem.code);

				if (planWork.kind.code == ENPlanWorkKind.CURRENT) {
	            	// NET-4529	План закупок , тендера// если в плане закупок не даем менять
					eLogic.checkInPurchaseItem(eItem);
				}

				eDao.save(eItem);
			}
		} else {
			createENEstimateItems(planItemCode, false);
		}
	}


    /*
    * пересчитываем все части СМЕТЫ по коду части плана ... и измененной части плана
    */
	public void recalcENEstimateItemsByPlanItemCode(int planItemCode) throws PersistenceException {
		recalcENEstimateItemsByPlanItemCode(planItemCode, true);
	}

	public void recalcENEstimateItemsByPlanItemCode(int planItemCode, boolean isInParentPlan) throws PersistenceException {
		recalcENEstimateItemsByPlanItemCode(planItemCode, isInParentPlan, false, null);
	}

	public void recalcENEstimateItemsByPlanItemCode(int planItemCode, boolean isInParentPlan, boolean servicesFromSide , BigDecimal ENPlanWorkItemCountGenBeforeUpdate)
			throws PersistenceException {

		ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItem pwi = pwiDAO.getObject(planItemCode);

        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDao.getObject(pwi.planRef.code);

        ElementLogic el = new ElementLogic(connection, userProfile);
        int eType = el.getElementTypeByPlanCode(pwi.planRef.code);

        ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        //TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);

        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planItemRef.code = planItemCode;

        if (servicesFromSide) {
        	filter.kindRef.code = ENEstimateItemKind.SERVICES;
        } else {
            // возьмем только МАТЕРИАЛЫ .. гсм и демонтаж в сад ..
            filter.kindRef.code = ENEstimateItemKind.MATERIALS;
        }

        ENEstimateItemData data = new ENEstimateItemData();





        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);

        if (arr.length > 0 )
        {

        	PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

	        for (int i=0; i < arr.length; i++)
	        {
	            ENEstimateItem eItem = eDao.getObject(arr[i]);
	            BigDecimal enEstimateitemcountFactBeforeUpdate = eItem.countFact;
	            //ENEstimateItem currentItem = eDao.getObject(list.get(i).code);

	            // там же пересчитают фактически использованные мат-лы из пред.плана ..
	            ENEstimateItem eParent = null;
	            if (isInParentPlan){
	                eParent = getEstimateItemFromPrevPlan(eItem.code);

	                /** SUPP-7019... 13.09.2013 +++ если это годовой план и один и тот же эстимейт, считаем, что парента нет... */
	                if (plan.kind.code == ENPlanWorkKind.YEAR
	                        && eParent.code == eItem.code) {
	                    eParent = null;
	                }

	            }

	            data = getTKMaterialDataByTechCard(eItem.materialRef.code, pwi.kartaRef.code);//kDao.getMaterialDataItemsByMaterialCodeAndTechCardCode(eItem.materialRef.code, pwi.kartaRef.code );

	            if (
	                    ( eParent == null)
	                    || (eType == ENElementType.METROLOGY_COUNTER)
	                )
	            {

	                if (eItem.typeRef.code == ENEstimateItemType.AUTO){
	                    eItem.countGen = data.materialCount.multiply(pwi.countGen).setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	                    eItem.countFact = eItem.countGen;
	                }else
	                if (eItem.typeRef.code == ENEstimateItemType.CORRECTED){
	                    eItem.countGen = data.materialCount.multiply(pwi.countGen).setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	                }


	                if (data.price == null) data.price = new BigDecimal(0.0);


	                /* 13.12.2011 +++ для "Услуг со стороны" не пересчитываем... */
                    if (eItem.accountingTypeRef.code == TKAccountingType.SERVICES_FROM_SIDE) {

                        /**
                         *  для договоров подряда на разработку ПКД стоимость услуг утверждена приказом..
                         *  для таких договоров - пересчитать стоимость...
                         *
                         */
                        if (servicesLogic.checkServicesProject(plan.elementRef.code)) {
                        	eItem.cost = data.price.multiply(eItem.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                        } else {
                        	eItem.cost = eItem.cost;
                        }

	                } else {
	                    eItem.cost = data.price.multiply(eItem.countFact).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	                }

	                eItem.price = data.price;
	            }
	            else
	            {
	                // предыдущие материалы
	                long t = eItem.modify_time;
	                int ccode = eItem.code;

	                // 19.12.2016 - так как на годовом плане нет привязки к плану закупки , то пересохраним ссылку на план закупок
	                int purchaseitemCode = eItem.purchaseItemRef.code;

	                eItem = eParent;

	                if (plan.kind.code == ENPlanWorkKind.CURRENT ) {
	                    eItem.purchaseItemRef.code = purchaseitemCode;
	                }

	                eItem.code = ccode;

	                eItem.planItemRef.code = pwi.code;
	                eItem.planRef.code = pwi.planRef.code;

	                // план по нормативам !!!
	                eItem.countGen = data.materialCount.multiply(pwi.countGen).setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	                eItem.countFact = eItem.countGen;
	                // факт пропорционально ... в eParent
	                // zzzzz если по нормативу нету тогда пересчитываем колво материала от работы (нов колво и старое колво )

	                ENPlanWorkItemCountGenBeforeUpdate= ENPlanWorkItemCountGenBeforeUpdate;
	                enEstimateitemcountFactBeforeUpdate=enEstimateitemcountFactBeforeUpdate;

	                //SUPP-84855
	                if( enEstimateitemcountFactBeforeUpdate.doubleValue() != 0.0 && eItem.countFact.doubleValue() == 0.0 && pwi.countGen.doubleValue()!= 0.0 && (plan.kind.code == ENPlanWorkKind.NPW || plan.kind.code == ENPlanWorkKind.FACT ) ){
	                	if (pwi.countGen.doubleValue() > ENPlanWorkItemCountGenBeforeUpdate.doubleValue() ){
	                		 double temp =   ((pwi.countGen.doubleValue() - ENPlanWorkItemCountGenBeforeUpdate.doubleValue()  ) / ENPlanWorkItemCountGenBeforeUpdate.doubleValue() ) * 100;
			                 eItem.countFact = new BigDecimal(enEstimateitemcountFactBeforeUpdate.doubleValue() + (( enEstimateitemcountFactBeforeUpdate.doubleValue() / 100 )*temp) );
		                }
	                	if (ENPlanWorkItemCountGenBeforeUpdate.doubleValue() > pwi.countGen.doubleValue()   ){

	                		 double temp =   (( ENPlanWorkItemCountGenBeforeUpdate.doubleValue() - pwi.countGen.doubleValue() ) / ENPlanWorkItemCountGenBeforeUpdate.doubleValue() ) * 100;
			                 eItem.countFact = new BigDecimal(enEstimateitemcountFactBeforeUpdate.doubleValue() - (( enEstimateitemcountFactBeforeUpdate.doubleValue() / 100 )*temp) );
			             }
	                }


	                eItem.modify_time = t;
	            }

	            // 08.06.12 NET-2151 Обнуленные материалы не проверяем
	            if (eItem.countFact.doubleValue() > 0)
	            {
	              checkInRQOrder(eItem, true);
	            }

	            ////////////////////////////////////////////////////////////////
	            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
	            if (eItem.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
	            {
	            	// Пересчитываем работы в плане на изготовление
	            	planLogic.recalcPlanForCPP(eItem, false);
	            }
	            ////////////////////////////////////////////////////////////////

	            eDao.save(eItem);
	        }


        }
        else
        {
            createENEstimateItems(planItemCode, isInParentPlan);
        }
    }

    public ENEstimateItem getEstimateItemFromPrevPlan(int estimateCode) throws PersistenceException
    {
        ENEstimateItem out = null;



        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem e = eDAO.getObject(estimateCode);

        ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);

        ENPlanWorkItem piCurrent = planItemDAO.getObject(e.planItemRef.code);


        PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObject(piCurrent.planRef.code);

        int moveReason;
        int planKind;

        if (plan.kind.code == ENPlanWorkKind.CURRENT){
            moveReason = ENPlanCorrectReason.MOVE_TO_CURRENT;
            planKind = ENPlanWorkKind.YEAR;
        }
        else
        if (plan.kind.code == ENPlanWorkKind.NPW){
            moveReason = ENPlanCorrectReason.MOVE_TO_NPW;
            planKind = ENPlanWorkKind.CURRENT;
        }
        else
        if (plan.kind.code == ENPlanWorkKind.FACT){
            moveReason = ENPlanCorrectReason.MOVE_TO_FACT;
            planKind = ENPlanWorkKind.NPW;
        }
        else
        {
            moveReason = Integer.MIN_VALUE;
            planKind = ENPlanWorkKind.YEAR;
        }


        out = this.getEstimateFromE2E(estimateCode, planKind, ""+ENEstimateItem2Type.PLAN_MOVED);

        //if (out != null) {
            if (out.code == Integer.MIN_VALUE){
                out = null;
                // return out;
            }
        //}

        ENPlanWorkItem parentItem = pl.getParentPlanWorkItem(piCurrent.code, piCurrent.kartaRef.code, moveReason); //ENPlanCorrectReason.MOVE_TO_NPW);

        if ( parentItem == null ){
            return out;
        }


        ENEstimateItemFilter eF = new ENEstimateItemFilter();
        eF.planRef.code = parentItem.planRef.code;
        eF.planItemRef.code = parentItem.code;
        eF.materialRef.code = e.materialRef.code;

        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eF, 0, -1);
        if (eList.totalCount == 0){
            return out;
        }

        if (out == null){
            out = eDAO.getObject(eList.get(0).code);
        }




        // если в предыдущем был 0 - будет БАГ с делением ниже ...
        if  (parentItem.countGen.doubleValue() < 0.0000001){
            return null;
        }

        // сделаем этот Эстимайт на нужный план ...
        out.planItemRef.code = e.planItemRef.code;
        out.planRef.code = e.planRef.code;

        // ОкруглениеЕЕЕЕЕЕЕЕЕЕЕ !!!!!!!!!!!!
        if ( Math.abs(piCurrent.countGen.doubleValue() - parentItem.countGen.doubleValue()) > 0.0000001 ){
            out.countFact = new BigDecimal((out.countFact.doubleValue() / parentItem.countGen.doubleValue()) * piCurrent.countGen.doubleValue());
            ENEstimateItemData ddd = getTKMaterialDataByTechCard(out.materialRef.code , piCurrent.kartaRef.code);

            out.countGen = ddd == null ? new BigDecimal(0) : ddd.materialCount.multiply(piCurrent.countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
        }

        out = calculateEstimateItemNoSave(out);

        return out;

    }

    // вернем пересчитанные ЕСТИМЭЙТЫ из предыдущего (для НПЗ) месячного палана
    public ENEstimateItem[] getEstimatesByPlanWorkItem(int planWorkItemCode) throws PersistenceException
    {
        ENEstimateItem[] out = null;

        Vector v = new Vector();
        PlanWorkLogic pl = new PlanWorkLogic(connection, userProfile);

        ENPlanWorkItem piCurrent = new ENPlanWorkItemDAO(connection, userProfile).getObject(planWorkItemCode);


        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

        ENPlanWork plan = planDAO.getObjectNoRefNoSegr(piCurrent.planRef.code);

        int moveReason;
        if (plan.kind.code == ENPlanWorkKind.CURRENT){
            moveReason = ENPlanCorrectReason.MOVE_TO_CURRENT;
        }
        else
        if (plan.kind.code == ENPlanWorkKind.NPW){
            moveReason = ENPlanCorrectReason.MOVE_TO_NPW;
        }
        else
        if (plan.kind.code == ENPlanWorkKind.FACT){
            moveReason = ENPlanCorrectReason.MOVE_TO_FACT;
        }
        else
            moveReason = Integer.MIN_VALUE;


        // найдем план который пришел из ТЕКУЩЕГО ... там попатчены материалы
        ENPlanWorkItem pi = pl.getParentPlanWorkItem(
                piCurrent.code,
                piCurrent.kartaRef.code,
                moveReason //ENPlanCorrectReason.MOVE_TO_NPW
                ); // по идее вернет с ТЕКУЩЕГО планаа .. НЕ ФАКТ..

        if (pi == null){
            return out;
        }


        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter eF = new ENEstimateItemFilter();
        eF.planItemRef.code = pi.code;
        // чисто МАТЕРИАЛЫ
        eF.kindRef.code = ENEstimateItemKind.MATERIALS;

        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eF, 0, -1);
        if (eList.totalCount == 0){
            return out;
        }

        for (int i=0; i<eList.totalCount; i++){
            ENEstimateItem e = new ENEstimateItem();
            ENEstimateItem eOld = eDAO.getObject(eList.get(i).code);
            ENEstimateItem ePrev = eDAO.getObject(eList.get(i).code);

            e = eOld;

            // ОкруглениеЕЕЕЕЕЕЕЕЕЕЕ !!!!!!!!!!!!
            if ((pi.countGen.doubleValue() != 0.0 ) &&( Math.abs(piCurrent.countGen.doubleValue() - pi.countGen.doubleValue())) > 0.0000001 ){
                e.countFact = new BigDecimal((ePrev.countFact.doubleValue() / pi.countGen.doubleValue()) * piCurrent.countGen.doubleValue());
                ENEstimateItemData data = getTKMaterialDataByTechCard(ePrev.materialRef.code, piCurrent.kartaRef.code );
                e.countGen = data.materialCount.multiply(piCurrent.countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
            }


            e = calculateEstimateItemNoSave(e);

            e.planItemRef.code = piCurrent.code;
            e.planRef.code = piCurrent.planRef.code;
            e.code = Integer.MIN_VALUE;
            v.add(e);
        }


        out = new ENEstimateItem[v.size()];
        for(int j = 0;j < v.size();j++)
        out[j] = ((ENEstimateItem)v.get(j));


        return out;
    }

    public void canceledFINMaterialsByPlan(int planCode) throws PersistenceException
    {
        FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
        FINMaterialsShortList fList = getFINMaterialsListByPlanCode(planCode , Integer.MIN_VALUE);
        for (int i = 0; i < fList.totalCount; i++){
            FINMaterials f = fDAO.getObject(fList.get(i).code);
            f.statusRef.code = FINMaterialsStatus.CANCELED;
            f.molDataRef.code = Integer.MIN_VALUE;
            fDAO.save(f);
        }
    }


    public FINMaterialsShortList getFINMaterialsListByFINMOLDataCode(int molDataCode) throws PersistenceException
    {
        FINMaterialsDAO mDAO = new FINMaterialsDAO(connection, userProfile);

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;
        mFilter.molDataRef.code = molDataCode;
        FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);
        return mList;
    }


    public FINMaterialsShortList getFINMaterialsListByPlanCode(int planCode, int EstimateItemKindCode) throws PersistenceException
    {

        FINMaterialsDAO mDAO = new FINMaterialsDAO(connection, userProfile);

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;
        mFilter.conditionSQL =
        " finmaterials.estimateitemrefcode in ("+
        " select enestimateitem.code from enestimateitem where "+
        " enestimateitem.planrefcode = " + planCode ;
        if (EstimateItemKindCode != Integer.MIN_VALUE ){
            mFilter.conditionSQL = mFilter.conditionSQL + " and enestimateitem.kindrefcode = " + EstimateItemKindCode ;
        }
        //" and "

        mFilter.conditionSQL = mFilter.conditionSQL + ")";

        //mFilter.orderBySQL = "finmaterials.nn, finmaterials.code";

        //mFilter.estimateItemRef.code = eList.get(i).code;

        FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

        return mList;
    }

    /**
    *
    * Возвращает список FINMaterialsShort с фактов связанных с актом код = actCode
    *
    * @param actCode код акта
    * @param count кол-во записей (-1 - все)
    * @return <b>FINMaterialsShortList</b>
    * @throws PersistenceException
    */
    public FINMaterialsShortList getFINMaterialsListByActCode(int actCode, int count) throws PersistenceException
    {

        FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
        FINMaterialsFilter fFilter = new FINMaterialsFilter();
        String condition = "select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in " +
        "(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = " + actCode + ")";

        fFilter.conditionSQL = "finmaterials.estimateitemrefcode in ("+condition + ")";

        return fDAO.getScrollableFilteredList(fFilter, 0, count);


    }

    public FINMaterialsShortList getFINMaterialsListByPlanItemCode(int planItemCode, int EstimateItemKindCode) throws PersistenceException
    {

        FINMaterialsDAO mDAO = new FINMaterialsDAO(connection, userProfile);

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;
        mFilter.conditionSQL =
        " finmaterials.estimateitemrefcode in ("+
        " select enestimateitem.code from enestimateitem where "+
        " enestimateitem.planitemrefcode = " + planItemCode ;
        if (EstimateItemKindCode != Integer.MIN_VALUE ){
            mFilter.conditionSQL = mFilter.conditionSQL + " and enestimateitem.kindrefcode = " + EstimateItemKindCode ;
        }
        //" and "

        mFilter.conditionSQL = mFilter.conditionSQL + ")";

        //mFilter.orderBySQL = "finmaterials.nn, finmaterials.code";

        //mFilter.estimateItemRef.code = eList.get(i).code;

        FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

        return mList;
    }

    public FINMaterialsShortList getFINMaterialsListByEstimateItemCode(int estimateItemCode) throws PersistenceException
    {

        FINMaterialsDAO mDAO = new FINMaterialsDAO(connection, userProfile);

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;
        mFilter.estimateItemRef.code = estimateItemCode;

        //mFilter.orderBySQL = "finmaterials.nn, finmaterials.code";

        //mFilter.estimateItemRef.code = eList.get(i).code;

        FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

        return mList;
    }

    public int countEstimateItemInPlan(int planCode) throws PersistenceException{
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planRef.code = planCode;
        //filter.typeRef.code = ENEstimateItemType.AUTO;
        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);
        //return list.totalCount;
        return arr.length;
    }

    public int countEstimateItemInPlanForPlanClose__(int planCode) throws PersistenceException{
        int count_ = 0;
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planRef.code = planCode;
        // везде где есть этот метод - идет проверка на счетчики ....
        // так что их пропустим вааще ....
        filter.conditionSQL = " enestimateitem.countfact <> 0 " +
        //" and (not (enestimateitem.accountingtyperefcode = " + TKAccountingType.COUNTERS +
        //    " and enestimateitem.kindrefcode = " + ENEstimateItemKind.UNMOUNT + "))";
        " and enestimateitem.accountingtyperefcode <> " + TKAccountingType.COUNTERS +
        " and enestimateitem.accountingtyperefcode not in (" + TKAccountingType.ALL_SEALS + ")";

        //filter.typeRef.code = ENEstimateItemType.AUTO;
        //ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
        int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);
        count_ = arr.length;

        if ( count_ == 0 ){
            FINMaterialsShortList fList = getFINMaterialsListByPlanCode(planCode, Integer.MIN_VALUE);
            count_ = count_ + fList.totalCount;
        }

        return count_;
    }

    public boolean getChangeBudget()
    {
        boolean out = true;

        try{
            AuthLogic a = new AuthLogic(connection, userProfile);
            a.checkPermission("ksoe/energynet/ENEstimateItem2ENEstimateItemController", "getChangeBudegt");
        }
        catch (AuthorizationSystemException e) {
            out = false;
        }
        return out;
    }

    public int addE2E(ENEstimateItem2ENEstimateItem object, int finCode, BigDecimal finCount)
    {
        try
        {

        FINMaterialsDAO fmDAO = new FINMaterialsDAO(connection, userProfile);

        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
        int planINCode = planLogic.getPlanCodeByEstimate(object.estimateItemInRef.code);

        int planOUTCode = planLogic.getPlanCodeByEstimate(object.estimateItemOutRef.code);

        /* См. ниже - проверка, чтобы отличались работы (план может быть один и тот же)
        if (planINCode == planOUTCode )
        {
            throw new EnergyproSystemException("Це один і той самий план ;) ...");
        }
        */


        ENPlanWork planIN  = planLogic.getPlanByCode(planINCode);

        ENPlanWork planOUT  = planLogic.getPlanByCode(planOUTCode);

        // для Хитрых Юзеров можно ...
        if ( ! (getChangeBudget()) ){
            if (planIN.budgetRef.code != planOUT.budgetRef.code )
            {
                //this.getChangeBudegt();
                throw new EnergyproSystemException("Не співпадають Бюджетотримачі у планах ...");
            }
        }


        EstimateLogic estimateLogic = new EstimateLogic(connection, userProfile);

        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);

        /////
        ENEstimateItem2ENEstimateItemFilter fe2e_ = new ENEstimateItem2ENEstimateItemFilter();
        fe2e_.typeRef.code = ENEstimateItem2Type.ESTIMATE_DIVIDED;
        fe2e_.estimateItemInRef.code = object.estimateItemOutRef.code;
        fe2e_.conditionSQL = "enestimateitem2nstmttm.estimateitemoutrefcode in " +
            "(select e2.estimateitemoutrefcode from enestimateitem2nstmttm e2 where e2.estimateiteminrefcode = " +
            object.estimateItemInRef.code + " and e2.typerefcode = " + ENEstimateItem2Type.OBJECT_MOVED + ")";
        int [] e2eArr = objectDAO.getFilteredCodeArray(fe2e_, 0, -1);
        if (e2eArr.length > 0)
        {
            throw new EnergyproSystemException("Цей матеріал вже був перенесений частково. Видаліть раніше зроблене перенесення!");
        }

        fe2e_ = new ENEstimateItem2ENEstimateItemFilter();
        fe2e_.typeRef.code = ENEstimateItem2Type.OBJECT_MOVED;
        fe2e_.estimateItemInRef.code = object.estimateItemInRef.code;
        fe2e_.estimateItemOutRef.code = object.estimateItemOutRef.code;
        e2eArr = objectDAO.getFilteredCodeArray(fe2e_, 0, -1);
        if (e2eArr.length > 0)
        {
            throw new EnergyproSystemException("Ці матеріали вже були зв'язані. Видаліть раніше зроблене перенесення!");
        }
        /////

        ENEstimateItem estIN = estDAO.getObject(object.estimateItemInRef.code);

        ENEstimateItem estOUT = estDAO.getObject(object.estimateItemOutRef.code);

        if (planINCode == planOUTCode )
        {
            if (estIN.planItemRef.code == estOUT.planItemRef.code)
            {
                throw new EnergyproSystemException("Це один і той самий план та однакова робота ;) ...");
            }
        }


        BigDecimal movedCount = object.countGen.setScale(6, BigDecimal.ROUND_HALF_UP);


        //if (estIN.countFact.doubleValue() < movedCount.doubleValue() ){
        //      throw new EnergyproSystemException("Кільсть не повинна перевищувати фактічну кількість ...");
        // }


        if (estOUT.countFact.doubleValue() < movedCount.doubleValue() ){
            throw new EnergyproSystemException("Кількість, що передається, не повинна перевищувати фактичну кількість на плані!");
        }


        int estOUTNewCode = Integer.MIN_VALUE;

        if (estOUT.countFact.doubleValue() == movedCount.doubleValue() ){

            // история статусов ..
            ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(connection, userProfile);
            ENEstimateItemStatusHistoryFilter shFilter = new ENEstimateItemStatusHistoryFilter();
            shFilter.estimateItemRef.code = estOUT.code;
            shFilter.isLast = 1;
            int[] shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
            for (int i=0; i < shArr.length; i++){
                ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
                estSH1.isLast = 0;
                estSHDAO.save(estSH1);
            }

            ENEstimateItemStatusHistory estSH = new ENEstimateItemStatusHistory();
            estSH.estimateItemRef.code = estOUT.code;
            estSH.statusRef.code = estOUT.statusRef.code;
            estSH.typeRef.code = ENEstimateItem2Type.OBJECT_MOVED;
            estSH.isLast = 1;
            estSH.dateEdit = new Date();
            estSHDAO.add(estSH);
            ////////////////////////////////

            estOUT.statusRef.code = ENEstimateItemStatus.PRESENT;
            estDAO.save(estOUT);

            estOUTNewCode = estOUT.code;

        }
        else
        {

            estOUT.countFact = estOUT.countFact.subtract(movedCount).setScale(6, BigDecimal.ROUND_HALF_UP);
            estDAO.save(estOUT);
            int estOutCode = estOUT.code;

            ENEstimateItem estOUTNew = new ENEstimateItem();
            estOUTNew = estOUT;
            estOUTNew.countGen = new BigDecimal(0);
            estOUTNew.countFact = movedCount;
            estOUTNew.statusRef.code = ENEstimateItemStatus.PRESENT;
            estDAO.add(estOUTNew);

            estOUTNewCode = estOUTNew.code;
            // соxраним связку разделения мат-ла
            ENEstimateItem2ENEstimateItem e2e_ = new ENEstimateItem2ENEstimateItem();
            e2e_.countGen = movedCount;
            e2e_.estimateItemInRef.code = estOutCode;
            e2e_.estimateItemOutRef.code = estOUTNewCode;
            e2e_.typeRef.code = ENEstimateItem2Type.ESTIMATE_DIVIDED;
            objectDAO.add(e2e_);

            // связка куска с родительским планом
            ENEstimateItem parentEst = estimateLogic.getEstimateFromE2E(object.estimateItemOutRef.code, ENPlanWorkKind.YEAR, ""+ENEstimateItem2Type.PLAN_MOVED);
            if (parentEst.code > Integer.MIN_VALUE){
                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
                e2e.countGen = movedCount;
                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
                e2e.estimateItemInRef.code = parentEst.code;
                e2e.estimateItemOutRef.code = estOUTNew.code;
                objectDAO.add(e2e);
            }

        }


          /// 26.10.11 Если с эстимейта забирается все кол-во, то ставим ему статус "Перенесенный"
        if (estIN.countFact.doubleValue() == movedCount.doubleValue()){
            estIN.statusRef.code = ENEstimateItemStatus.MOVED;
            estDAO.save(estIN);
        }
          /////



    finCount = finCount.setScale(6, BigDecimal.ROUND_HALF_UP);

    if (finCode == Integer.MIN_VALUE)
    {
        throw new EnergyproSystemException("Немає матеріалу для перенесення!");
    }

    /*
    if (finCode == Integer.MIN_VALUE)
    {
            FINMaterialsFilter fmFilter = new FINMaterialsFilter();
            fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
            fmFilter.statusRef.code = FINMaterialsStatus.GOOD;

            boolean inFIN = false;

            int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
            if ( fmArr.length > 0 ){
                //throw new EnergyproSystemException("Какой смысл перекидывать материалы, которых нету в наличии ??");
                inFIN = true;
            }


            if ( ! inFIN){
                RQFKOrderData2FKPartyDAO od2pDAO = new RQFKOrderData2FKPartyDAO(connection, userProfile);
                RQFKOrderDAO orderDAO = new RQFKOrderDAO(connection, userProfile);
                RQFKOrderItemDAO orderItemDAO = new RQFKOrderItemDAO(connection, userProfile);

                RQFKOrderData2FKPartyFilter od2pFilter = new RQFKOrderData2FKPartyFilter();
                od2pFilter.estimateItemRef.code = object.estimateItemInRef.code;
                int[] od2pArr = od2pDAO.getFilteredCodeArray(od2pFilter, 0, -1);
                for (int i = 0; i < od2pArr.length; i++){
                    RQFKOrderData2FKParty od2p = od2pDAO.getObject(od2pArr[i]);
                    RQFKOrder order = orderDAO.getObject(od2p.fkOrderRef.code);
                    RQFKOrderItem orderItem = orderItemDAO.getObject(od2p.fkOrderItemRef.code);

                    FINMaterials vF = new FINMaterials();
                    vF.mat_id = orderItem.nomenclatureCode;
                    vF.nn = orderItem.nomenclatureNum;
                    vF.mat_name = orderItem.nomenclatureName;
                    vF.mu_id = orderItem.nomenclatureUnitCode;
                    vF.mu_name = orderItem.nomenclatureUnitName;
                    vF.div_code = order.molOutCode;
                    vF.div_name = order.molOutName;
                    vF.party_id = od2p.partyCode;
                    vF.doc_num = order.numberDoc;
                    vF.partner = order.org.codeorg;
                    vF.partner_name = order.org.name;
                    vF.doc_date = order.dateGen;
                    vF.party_discription = od2p.partyCode + "_party_description";
                    vF.rest_purpose_id = -1; //RQConsts.REST_PURPOSE_ID_TRANZIT; //????

                    vF.rest_purpose_name = "Undefined"; //????
                    vF.rest_purpose_type_id = -1;
                    vF.budget_core_id = -1;
                    vF.frc_code = -1;
                    vF.frc_name = "";
                    vF.calc_price = orderItem.priceWithoutNds;
                    vF.quantity = movedCount ;//orderItem.countGen ; // ???????
                    vF.price = orderItem.priceWithoutNds;
                    vF.cost = orderItem.sumWithoutNds;

                    vF.bal_sch = "20__";
                    vF.finDocItemCode = -1;
                    vF.statusRef.code = FINMaterialsStatus.VIRTUAL ;
                    vF.fullQuantity = orderItem.countGen;
                    vF.fullCost = orderItem.sumWithoutNds;

                    vF.userGen = userProfile.userName;
                    vF.dateEdit = new Date();

                    vF.estimateItemRef.code = object.estimateItemOutRef.code;
                    fmDAO.add(vF);
                    inFIN = true;
                }
            }

            if ( ! inFIN){
                throw new EnergyproSystemException("Какой смысл перекидывать материалы, которых нету в наличии ??");
            }


            ElementLogic elementLogic = new ElementLogic(connection, userProfile);
            int eType = elementLogic.getElementTypeByPlan(planIN);

            for (int i=0; i < fmArr.length; i++){

                FINMaterials fm = fmDAO.getObject(fmArr[i]);

                // для ЗАКУПОК статус не меняют !!!
                if ((eType != ENElementType.PURCHASES_OBJECT ) || (eType != ENElementType.PURCHASES_NO_OBJECT)) {
                    fm.statusRef.code = FINMaterialsStatus.MOVED;
                    fmDAO.save(fm);
                }

                fm.estimateItemRef.code = object.estimateItemOutRef.code;
                fm.statusRef.code = FINMaterialsStatus.GOOD;
                fmDAO.add(fm);
            }

    }
    else */
    //{
        FINMaterials fm = fmDAO.getObject(finCode);

        //if ((eType != ENElementType.PURCHASES_OBJECT ) || (eType != ENElementType.PURCHASES_NO_OBJECT)) {
        //if (fm.quantity.doubleValue() == finCount.doubleValue() ){
            fm.statusRef.code = FINMaterialsStatus.MOVED;
            fmDAO.save(fm);
        // }
        //else

    if (fm.quantity.doubleValue() >= finCount.doubleValue() )
        {
        if (fm.quantity.doubleValue() != finCount.doubleValue() ){
            FINMaterials fm_new = fmDAO.getObject(finCode);
            fm_new.statusRef.code = FINMaterialsStatus.GOOD;
            fm_new.quantity = fm_new.quantity.subtract(finCount).setScale(6, BigDecimal.ROUND_HALF_UP);
            fm_new.parentRef.code = finCode;
            fmDAO.add(fm_new);
        }
        }
    else{
        throw new EnergyproSystemException("Кількість, що переноситься, більша за кількість у наявності ...");
    }

    /* 22.10.11 Этот финматериал добавится в расходном ордере !!!
        fm.quantity = finCount;
        fm.estimateItemRef.code = estOUTNewCode; //estOUTNew.code ; //object.estimateItemOutRef.code;
        fm.statusRef.code = FINMaterialsStatus.GOOD;
        fm.parentRef.code = finCode;
        fmDAO.add(fm);
    */
    //}


/*

        ENEstimateItem est = estDAO.getObject(object.estimateItemOutRef.code);

        // история статусов ..
        ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE));
        ENEstimateItemStatusHistoryFilter shFilter = new ENEstimateItemStatusHistoryFilter();
        shFilter.estimateItemRef.code = est.code;
        shFilter.isLast = 1;
        int[] shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
        for (int i=0; i < shArr.length; i++){
            ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
            estSH1.isLast = 0;
            estSHDAO.save(estSH1);
        }

        ENEstimateItemStatusHistory estSH = new ENEstimateItemStatusHistory();
        estSH.estimateItemRef.code = est.code;
        estSH.statusRef.code = est.statusRef.code;
        estSH.typeRef.code = ENEstimateItem2Type.OBJECT_MOVED;
        estSH.isLast = 1;
        estSH.dateEdit = new Date();
        estSHDAO.add(estSH);
        ////////////////////////////////

        est.statusRef.code = ENEstimateItemStatus.PRESENT;
        estDAO.save(est);


*/

        // посмотреть стоит ли его делить .. переходы мужду планами и обьектами ..

        object.estimateItemOutRef.code = estOUTNewCode;

        object.typeRef.code = ENEstimateItem2Type.OBJECT_MOVED;

        return objectDAO.add(object);
        }
        //catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        //finally                              {closeConnection();}
    }

    public void removeE2E(int code)
    {
        try
        {


        ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

        ENEstimateItem2ENEstimateItem object = objectDAO.getObject(code);


        // история статусов ..
        int prevStatus = Integer.MIN_VALUE; //ENEstimateItemStatus.MOVED;
        ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(connection, userProfile);
        ENEstimateItemStatusHistoryFilter shFilter = new ENEstimateItemStatusHistoryFilter();
        shFilter.estimateItemRef.code = object.estimateItemOutRef.code;
        shFilter.isLast = 1;
        int[] shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
        for (int i=0; i < shArr.length; i++){
            ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
            prevStatus = estSH1.statusRef.code;
            estSHDAO.remove(shArr[i]);
        }

        shFilter = new ENEstimateItemStatusHistoryFilter();
        shFilter.estimateItemRef.code = object.estimateItemOutRef.code;
        shFilter.orderBySQL = "dateedit desc";
        shArr = estSHDAO.getFilteredCodeArray(shFilter, 0, 1);
        for (int i=0; i < shArr.length; i++){
            ENEstimateItemStatusHistory estSH1 = estSHDAO.getObject(shArr[i]);
            estSH1.isLast = 1;
            estSHDAO.save(estSH1);
        }

        ////////////////////////////////

        //ENEstimateItem estIN = estDAO.getObject(object.estimateItemInRef.code);

        //ENEstimateItem estOUT = estDAO.getObject(object.estimateItemOutRef.code);


        FINMaterialsDAO fmDAO = new FINMaterialsDAO(connection, userProfile);
        RQFKOrderItem2ENEstimateItemDAO i2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);

        FINMaterialsFilter fmFilter = new FINMaterialsFilter();

        fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
        fmFilter.statusRef.code = FINMaterialsStatus.MOVED;
        fmFilter.conditionSQL = "finmaterials.code in (select f1.parentrefcode from finmaterials f1 where f1.estimateitemrefcode in ("
                + object.estimateItemOutRef.code + "," + object.estimateItemInRef.code + "))";

        int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
        int parentFinCode;
        BigDecimal movedCount = new BigDecimal(0);
        for (int i=0; i < fmArr.length; i++){
            parentFinCode = fmArr[i];

            FINMaterialsFilter fmFilterOut = new FINMaterialsFilter();
            fmFilterOut.estimateItemRef.code = object.estimateItemOutRef.code;
            fmFilterOut.parentRef.code = parentFinCode;
            fmFilterOut.statusRef.code = FINMaterialsStatus.MOVED; // не потянули ли уже разнесенный ...

            int[] arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
            if (arrOut.length > 0){
                throw new EnergyproSystemException("Цей матеріал перенесений на ...");
            }



            FINMaterialsFilter fmFilterOut1 = new FINMaterialsFilter();
            fmFilterOut1.estimateItemRef.code = object.estimateItemOutRef.code;
            fmFilterOut1.parentRef.code = parentFinCode;
            fmFilterOut1.statusRef.code = FINMaterialsStatus.GOOD;

            //fmFilterOut.conditionSQL = "finmaterials.parentrefcode is not null";
            int[] arrOut1 = fmDAO.getFilteredCodeArray(fmFilterOut1, 0, -1);
            for (int j=0; j < arrOut1.length; j++){
                FINMaterials ff = fmDAO.getObject(arrOut1[j]);
                //movedCount = movedCount.add(ff.quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
                FINMaterialsFilter fmFilter_ = new FINMaterialsFilter();
                /*** 24.10.11 А зачем искать так? Можно по parentRef'у
                fmFilter_.bal_sch = ff.bal_sch;
                fmFilter_.budget_core_id = ff.budget_core_id;
                fmFilter_.calc_price = ff.calc_price;
                fmFilter_.cost = ff.cost;
                fmFilter_.div_code = ff.div_code;
                fmFilter_.doc_date = ff.doc_date;
                fmFilter_.doc_num = ff.doc_num;
                fmFilter_.frc_code = ff.frc_code;
                fmFilter_.mat_id = ff.mat_id;
                fmFilter_.mu_id = ff.mu_id;
                fmFilter_.nn = ff.nn;
                fmFilter_.partner = ff.partner;
                fmFilter_.party_id = ff.party_id;
                fmFilter_.rest_purpose_id = ff.rest_purpose_id;
                fmFilter_.price = ff.price;
                fmFilter_.fullQuantity = ff.fullQuantity;
                fmFilter_.fullCost = ff.fullCost;
                ***/
                fmFilter_.mat_id = ff.mat_id;
                fmFilter_.mu_id = ff.mu_id;
                fmFilter_.nn = ff.nn;
                fmFilter_.party_id = ff.party_id;
                ///
                fmFilter_.parentRef.code = ff.parentRef.code; //*** !!!!!
                ///
                fmFilter_.statusRef.code = FINMaterialsStatus.GOOD;
                fmFilter_.estimateItemRef.code = object.estimateItemInRef.code;
                fmFilter_.conditionSQL = "finmaterials.code not in (select qq.finmaterialsrefcode from rqfkorderitem2enstmttm qq where qq.finmaterialsrefcode is not null)";

                int[] ffArr_ = fmDAO.getFilteredCodeArray(fmFilter_, 0, -1);
                if (ffArr_.length > 1){
                    throw new EnergyproSystemException("Error in count finMat in estimateItemInRef ");
                }
                if (ffArr_.length == 1){
                    BigDecimal qq = ff.quantity;
                    ff = fmDAO.getObject(ffArr_[0]);
                    ff.quantity = ff.quantity.add(qq);
                    /// 24.10.11
                    //ff.parentRef.code = Integer.MIN_VALUE;
                    ///
                    fmDAO.save(ff);
                }
                else
                {
                    ff.estimateItemRef.code = object.estimateItemInRef.code;
                    ff.parentRef.code = Integer.MIN_VALUE;
                    fmDAO.add(ff);
                }

                /////
                /*
                RQFKOrderItem2ENEstimateItemFilter i2eFilter = new RQFKOrderItem2ENEstimateItemFilter();
                i2eFilter.finMaterialsRef.code = arrOut1[j];
                int[] i2eArr = i2eDAO.getFilteredCodeArray(i2eFilter, 0, -1);
                if (i2eArr.length == 0)
                {
                    // Выносим финматериалс, если он не в ордере на переброску... если да, то он удалится при удалении строки
                    fmDAO.remove(arrOut1[j]);
                }
                */
                fmDAO.remove(arrOut1[j]);
                /////
            }

        }


        fmFilter = new FINMaterialsFilter();

    //     fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
    //      fmFilter.statusRef.code = FINMaterialsStatus.MOVED;
    //      fmFilter.conditionSQL = "finmaterials.code not in (select ff.parentrefcode from finmaterials ff where ff.parentrefcode is not null) ";
    //      Небольшая оптимизация  после перехода на ПГ 9.1
        fmFilter.conditionSQL = "finmaterials.code  in (select f1.code from finmaterials f1 left join  finmaterials f2 " +
                " on (f1.code = f2.parentrefcode) " +
                " where f1.statusrefcode = " + FINMaterialsStatus.MOVED +
                " and f1.estimateitemrefcode = " + object.estimateItemInRef.code +
                " and f2.parentrefcode is null)";

        RQFKOrderItem2ENEstimateItemDAO o2iDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
        int[] arrOut = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
        for (int i=0; i < arrOut.length; i++){
            RQFKOrderItem2ENEstimateItemFilter f_ = new RQFKOrderItem2ENEstimateItemFilter();
            f_.finMaterialsRef.code = arrOut[i];
            int[] rqArr = o2iDAO.getFilteredCodeArray(f_, 0, -1);
            if (rqArr.length == 0)
                fmDAO.remove(arrOut[i]);
        }

/*
        FINMaterialsFilter fmFilter = new FINMaterialsFilter();

        fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
        fmFilter.statusRef.code = FINMaterialsStatus.MOVED;
        fmFilter.conditionSQL = "finmaterials.code in (select f1.parentrefcode from finmaterials f1 where f1.estimateitemrefcode in ("
                + object.estimateItemOutRef.code + "," + object.estimateItemInRef.code + "))";

        int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
        int parentFinCode;
        for (int i=0; i < fmArr.length; i++){
            parentFinCode = fmArr[i];

            FINMaterialsFilter fmFilterOut = new FINMaterialsFilter();
            fmFilterOut.estimateItemRef.code = object.estimateItemOutRef.code;
            fmFilterOut.parentRef.code = parentFinCode;
            fmFilterOut.statusRef.code = FINMaterialsStatus.MOVED; // не потянули ли уже разнесенный ...

            int[] arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
            if (arrOut.length > 0){
                throw new EnergyproSystemException("Цей матеріал перенесений на ...");
            }


            fmFilterOut.statusRef.code = FINMaterialsStatus.GOOD;
            arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
            for (int j=0; j < arrOut.length; j++){
                fmDAO.remove(arrOut[j]);
            }

            fmFilterOut = new FINMaterialsFilter();
            fmFilterOut.estimateItemRef.code = object.estimateItemInRef.code;
            fmFilterOut.parentRef.code = parentFinCode;

            fmFilterOut.statusRef.code = FINMaterialsStatus.MOVED;
            arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
            if (arrOut.length > 0){
                    throw new EnergyproSystemException("Цей матеріал перенесений на ...");
            }

            fmFilterOut.statusRef.code = FINMaterialsStatus.GOOD;
            arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
            for (int j=0; j < arrOut.length; j++){
                fmDAO.remove(arrOut[j]);
            }

            FINMaterials fm = fmDAO.getObject(parentFinCode);

            FINMaterialsFilter fmFilter3 = new FINMaterialsFilter();
            fmFilter3.parentRef.code = parentFinCode;
            int [] fmArr3 = fmDAO.getFilteredCodeArray(fmFilter3, 0, -1);

            if (fmArr3.length == 0)
            {
                    fm.statusRef.code = FINMaterialsStatus.GOOD;
                fmDAO.save(fm);
            }
            else
            {
                for (int q3 = 0; q3 < fmArr3.length; q3++)
                {
                    // продолжение цепочки ВНИЗ ...
                    fmDAO.remove(fmArr3[q3]);


                }
            }


        }
*/

/*

        FINMaterialsDAO fmDAO = new FINMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE));
        FINMaterialsFilter fmFilter = new FINMaterialsFilter();
        fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
        fmFilter.statusRef.code = FINMaterialsStatus.MOVED;

        int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);

        for (int i=0; i < fmArr.length; i++){
            FINMaterials fm = fmDAO.getObject(fmArr[i]);
            fm.statusRef.code = FINMaterialsStatus.GOOD;
            fmDAO.save(fm);
        }

        fmFilter = new FINMaterialsFilter();
        fmFilter.estimateItemRef.code = object.estimateItemOutRef.code;
        //fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
        fmFilter.conditionSQL = "finmaterials.statusrefcode <> " + FINMaterialsStatus.CANCELED +
                                " and finmaterials.code not in " +
                                "(select rqfkorderitem2enstmttm.finmaterialsrefcode from rqfkorderitem2enstmttm where " +
                                " rqfkorderitem2enstmttm.estimateitemcode = " + object.estimateItemOutRef.code +
                                " and rqfkorderitem2enstmttm.finmaterialsrefcode is not null)";
        fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
        for (int i=0; i < fmArr.length; i++){
            fmDAO.remove(fmArr[i]);
        }
*/
        // статусы у материалов ...
        //ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE));

        if (prevStatus == Integer.MIN_VALUE){
            //ENEstimateItem estOld = estDAO.getObject(object.estimateItemOutRef.code);


            ENEstimateItem2ENEstimateItemFilter e2eF = new ENEstimateItem2ENEstimateItemFilter();
            e2eF.typeRef.code = ENEstimateItem2Type.ESTIMATE_DIVIDED;
            e2eF.estimateItemOutRef.code = object.estimateItemOutRef.code;
            ENEstimateItem2ENEstimateItemShortList e2eList = objectDAO.getScrollableFilteredList(e2eF,0,-1);
            BigDecimal count_ = new BigDecimal(0);
            for (int qq=0; qq < e2eList.totalCount; qq++){
                //count_ = count_.add();
                ENEstimateItem est_ = estDAO.getObject( e2eList.get(qq).estimateItemInRefCode );
                est_.countFact = est_.countFact.add(e2eList.get(qq).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
                estDAO.save(est_);
                objectDAO.remove(e2eList.get(qq).code);
            }


        }
        /*20170330 - проверить если предыдущий статус выбрался = 3 " у наявності "
         * то проверить были под естимейт ордера , если нет то не ставим " у наявності" а ставим непотрібно замовляти
         * в историю тоже статус запишим */
        else if (prevStatus == ENEstimateItemStatus.PRESENT){
        	RQFKOrderItem2ENEstimateItemFilter fi2eiFilter =new RQFKOrderItem2ENEstimateItemFilter();
        	fi2eiFilter.estimateItem.code = object.estimateItemOutRef.code;
        	int[] fi2eiArr = o2iDAO.getFilteredCodeArray(fi2eiFilter, 0, -1);
        	if (fi2eiArr.length == 0 ) {
        		ENEstimateItem est = estDAO.getObject(object.estimateItemOutRef.code);
                est.statusRef.code = ENEstimateItemStatus.UNUSED;
                estDAO.save(est);
                // обновим  инфо в истории
                ENEstimateItemStatusHistoryFilter shFilterUpd = new ENEstimateItemStatusHistoryFilter();
                shFilterUpd.estimateItemRef.code = object.estimateItemOutRef.code;
                shFilterUpd.isLast = 1;
                int[] estHistArr = estSHDAO.getFilteredCodeArray(shFilter, 0, -1);
                if (estHistArr.length > 0) {
                	ENEstimateItemStatusHistory estHistObj = estSHDAO.getObject(0);
                	estHistObj.statusRef.code= ENEstimateItemStatus.UNUSED;
                	estSHDAO.save(estHistObj);
                }
        	}
        }
        else
        {
            ENEstimateItem est = estDAO.getObject(object.estimateItemOutRef.code);
            est.statusRef.code = prevStatus ;
            estDAO.save(est);
        }

        objectDAO.remove(code);

        if (prevStatus == Integer.MIN_VALUE){
            estDAO.remove(object.estimateItemOutRef.code);
        }


        /// 26.10.11 Если у эстимейта был статус "Перенесений", возвращаем ему статус "У наявності"
        ENEstimateItem estIN = estDAO.getObject(object.estimateItemInRef.code);
        if (estIN.statusRef.code == ENEstimateItemStatus.MOVED)
        {
            estIN.statusRef.code = ENEstimateItemStatus.PRESENT;
            estDAO.save(estIN);
        }
        /////

        }
        //catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        //finally                              {closeConnection();}
    }

    public ENEstimateItem getEstimateByOldEstimate(int codePlan, int oldEstimate) throws PersistenceException
        {
            ENEstimateItem estOut = new ENEstimateItem();
            estOut.code = Integer.MIN_VALUE;

            TKMaterialsDAO tkmatDAO = new TKMaterialsDAO(connection,userProfile);
            TKMaterialsFilter tkmatFilter = new TKMaterialsFilter();
            tkmatFilter.conditionSQL = "TK1.CODE = (select materialrefcode from enestimateitem where enestimateitem.code = " + oldEstimate + " ) ";
            TKMaterialsShortList tkmatlist = tkmatDAO.getScrollableFilteredList(tkmatFilter,0,-1);

            int tkMatCode = 0;
            if (tkmatlist.totalCount > 0 ){
                tkMatCode = tkmatlist.get(0).code;
                }


            ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
            estFilter.materialRef.code = tkMatCode;
            estFilter.planRef.code = codePlan;
             ENEstimateItemShortList estlist = estDAO.getScrollableFilteredList(estFilter,0,-1);

             ENEstimateItem est = new ENEstimateItem();
            for (int ii=0; ii < estlist.totalCount; ii++){
                // est = estDAO.getObject(estlist.get(0).code);

                // вытянем дату ордера(ввода в эксплуатацию) для  естимейта который пытаемся вставить под новый план
                RQFKOrderDAO rqfkDAO = new RQFKOrderDAO(connection,userProfile);
                RQFKOrderFilter rqfkFilter = new  RQFKOrderFilter();
                rqfkFilter.conditionSQL = " RQFKORDER.code in (Select max(r.code) " +
                            " From rqfkorderitem2enstmttm rei , rqfkorderitem ri ,  rqfkorder r " +
                            " Where rei.estimateitemcode = " + oldEstimate +
                            "  and rei.fkorderitemrefcode = ri.code " +
                            "  and ri.fkorderrefcode = r.code " +
                            "  and r.kindcode in (8,9,11,12) " +
                            "  and r.statuscode = 3 ) ";
                //RQFKOrderShortList  rqfkList = rqfkDAO.getScrollableFilteredList(rqfkFilter,0,-1);
                int[] rqfkCodes = rqfkDAO.getFilteredCodeArrayNOSEGR(rqfkFilter, rqfkFilter.conditionSQL, rqfkFilter.orderBySQL, 0, -1, null);

                if(rqfkCodes.length != 1)
                    throw new EnergyproSystemException("Помилка у кількості ордерів");

                RQFKOrder rqfkOrder = rqfkDAO.getObjectNOSEGR(rqfkCodes[0]);

                // вытянем дату ордера (ввода в эксплуатацию) для естимейта который уже привязали и вставили под новый естимейт (через связку естимейт 2 естимейт)
                rqfkFilter = new  RQFKOrderFilter();
                rqfkFilter.conditionSQL = " RQFKORDER.code in (Select max(r.code) " +
                            " From rqfkorderitem2enstmttm rei , rqfkorderitem ri ,  rqfkorder r " +
                            " Where rei.estimateitemcode in ( select i2i.estimateiteminrefcode from enestimateitem2nstmttm i2i " +
                            "                                    where i2i.estimateitemoutrefcode = " + estlist.get(ii).code +
                            "          and  i2i.typerefcode = 6 " +
                            "           ) " +
                            "  and rei.fkorderitemrefcode = ri.code " +
                            "  and ri.fkorderrefcode = r.code " +
                            "  and r.kindcode in (8,9,11,12) " +
                            "  and r.statuscode = 3 ) ";
                RQFKOrderShortList  rqfkListInserted = rqfkDAO.getScrollableFilteredList(rqfkFilter,0,-1);

                // если даты ввода равны тогда возвращаем объект естимейт ИНАЧЕ ничего
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(rqfkOrder.dateGen);
                    calendar.set(Calendar.HOUR_OF_DAY, 0);
                    calendar.set(Calendar.MINUTE, 0);
                    calendar.set(Calendar.SECOND, 0);
                    calendar.set(Calendar.MILLISECOND, 0);

                    // перебирем все ордера под вставленные естимейты если находим значит не нужно креатить естимейт
                    for (int i=0; i < rqfkListInserted.totalCount; i++){

                    Calendar calendarInserted = Calendar.getInstance();
                    calendarInserted.setTime(rqfkListInserted.get(i).dateGen);
                    calendarInserted.set(Calendar.HOUR_OF_DAY, 0);
                    calendarInserted.set(Calendar.MINUTE, 0);
                    calendarInserted.set(Calendar.SECOND, 0);
                    calendarInserted.set(Calendar.MILLISECOND, 0);



                        if ( calendar.getTime().equals(calendarInserted.getTime()) ){
                            est = estDAO.getObject(estlist.get(ii).code);
                            }
                    }

                }

            estOut = est;



            return estOut;

        }


    public void checkAllFact(int estimateItemCode, int planCode,
            BigDecimal objectQuantity, BigDecimal estimateCountFact)
            throws PersistenceException {

        /* поиск мат-лов из фактов */
        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
        FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);

        ENPlanWork currPlan = pDAO.getObject(planCode);

        ENEstimateItem est = eDAO.getObject(estimateItemCode);
        /* код материала */
        int materialCode = est.materialRef.code;

        /* месячный план */
        ENPlanWorkFilter plMonthFilter = new ENPlanWorkFilter();
        plMonthFilter.elementRef.code = currPlan.elementRef.code;
        plMonthFilter.kind.code = ENPlanWorkKind.CURRENT;
        plMonthFilter.conditionSQL = " code in (" +
                " select plannewrefcode from enplancorrecthistory where planrefcode = " + planCode + " " +
                " union " +
                " select " + planCode + " as planrefcode " +
                " union " +
                " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + " " +
                " union " +
                " select plannewrefcode from enplancorrecthistory where planrefcode in (" +
                " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + "))";

        ENPlanWorkShortList planMonthList = pDAO.getScrollableFilteredList(plMonthFilter, 0, -1);
        ENPlanWork planMonth = pDAO.getObject(planMonthList.get(0).code);

        /* кол-во материала в месячном плане */
        ENEstimateItemFilter eMonthFilter = new ENEstimateItemFilter();
        eMonthFilter.planRef.code = planMonth.code;
        eMonthFilter.materialRef.code = materialCode;

        ENEstimateItemShortList eMonthList = eDAO.getScrollableFilteredList(eMonthFilter, 0, -1);
        ENEstimateItem eMonth = eDAO.getObject(eMonthList.get(0).code);

        double countMaterialMonth = eMonth.countFact.doubleValue();
        double countMaterialAllFact = 0.00;

        /* все факты */
        ENPlanWorkFilter plFactFilter = new ENPlanWorkFilter();
        plFactFilter.elementRef.code = currPlan.elementRef.code;
        plFactFilter.kind.code = ENPlanWorkKind.FACT;
        plFactFilter.conditionSQL = " code in (" +
                " select plannewrefcode from enplancorrecthistory where planrefcode = " + planCode + " " +
                " union " +
                " select " + planCode + " as planrefcode " +
                " union " +
                " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + " " +
                " union " +
                " select plannewrefcode from enplancorrecthistory where planrefcode in (" +
                " select planrefcode from enplancorrecthistory where plannewrefcode = " + planCode + "))";


        /* кол-во привязанного материала на факте */
        ENPlanWorkShortList planFactList = pDAO.getScrollableFilteredList(plFactFilter, 0, -1);
        if (planFactList.totalCount > 0) {
            for (int i = 0; i < planFactList.totalCount; i++) {

                ENEstimateItemFilter eFactFilter = new ENEstimateItemFilter();
                eFactFilter.planRef.code = planFactList.get(i).code;
                eFactFilter.materialRef.code = materialCode;

                ENEstimateItemShortList eFactList = eDAO.getScrollableFilteredList(eFactFilter, 0, -1);
                ENEstimateItem eFact = eDAO.getObject(eFactList.get(0).code);

                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.estimateItemRef.code = eFact.code;
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;

                FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);
                if (finList.totalCount > 0) {
                    for (int f = 0; f < finList.totalCount; f++) {
                        FINMaterials finMaterials = finDAO.getObject(finList.get(f).code);
                        countMaterialAllFact += finMaterials.quantity.doubleValue();
                    }
                }

            }
        }

        /* +++ может быть уже привязано к текущему */
        FINMaterialsFilter finMFilter = new FINMaterialsFilter();
        finMFilter.estimateItemRef.code = estimateItemCode;
        finMFilter.statusRef.code = FINMaterialsStatus.GOOD;

        FINMaterialsShortList finMList = finDAO.getScrollableFilteredList(finMFilter, 0, -1);
        if (finMList.totalCount > 0) {
            for (int m = 0; m < finMList.totalCount; m++) {
                FINMaterials finM = finDAO.getObject(finMList.get(m).code);
                countMaterialAllFact += finM.quantity.doubleValue();
            }
        }

        if (countMaterialMonth < (countMaterialAllFact + objectQuantity.doubleValue())) {
            throw new EnergyproSystemException("Вказана кількість перевищує нормативну!!!\n" +
                    "У місячному плані = " + new BigDecimal(countMaterialMonth).setScale(6, BigDecimal.ROUND_HALF_UP) + "\n" +
                    "Використано за фактом = " + new BigDecimal(countMaterialAllFact).setScale(6, BigDecimal.ROUND_HALF_UP));
        }
    }


    /*
    * удаляет все части СМЕТЫ по коду плана
    */
    public void removeENEstimateItemsByPlanCode(int planCode) throws PersistenceException{
        ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);

        ENMarkEstimateDAO m2eDAO = new ENMarkEstimateDAO(connection, userProfile);

        PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

        ENEstimateItemFilter filter = new ENEstimateItemFilter();
        filter.planRef.code = planCode;

        filter.conditionSQL = " ENESTIMATEITEM.KINDREFCODE IN (" + ENEstimateItemKind.MATERIALS + ", "
                + ENEstimateItemKind.SERVICES + ")";

        int[] eArr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
        for (int i=0; i < eArr.length; i++){

            ENEstimateItem eItem = eDao.getObject(eArr[i]);

            ////////////////////////////////////////////////////////////////
            // 19.11.14 NET-4415 Материал, который будет изготавливаться ЦПП
            if (eItem.statusRef.code == ENEstimateItemStatus.OWN_PRODUCTION)
            {
            	// Пересчитываем работы в плане на изготовление и удаляем связку с этим планом
            	planLogic.recalcPlanForCPP(eItem, true);
            }
            ////////////////////////////////////////////////////////////////

            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = eArr[i]; //list.get(i).code;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            // вынесем Маркера ??
            ENMarkEstimateFilter m2eFilter = new ENMarkEstimateFilter();
            m2eFilter.estimateItem.code = eArr[i];
            int[] m2eArr = m2eDAO.getFilteredCodeArray(m2eFilter, 0, -1);
            for (int m2e = 0; m2e  < m2eArr.length; m2e++){
                m2eDAO.remove(m2eArr[m2e]);
            }

            eDao.remove(eArr[i]);
        }

        /// вынесем ДЕМОНТАЖ
        filter.kindRef.code = ENEstimateItemKind.UNMOUNT;


        eArr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
        for (int i=0; i < eArr.length; i++){

            ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();
            ff.estimateItemOutRef.code = eArr[i]; //list.get(i).code;
            int[] eeArr = e2eDAO.getFilteredCodeArray(ff,0,-1);
            for (int qq = 0; qq < eeArr.length; qq++){
                e2eDAO.remove(eeArr[qq]);
            }

            eDao.remove(eArr[i]);
        }


    }

    /*
    * сумарное колличество (списанного т.е проведенных актов) из развязки ENEstimateItem2ENEstimateItem  по коду естимейта ИН
    */
    public BigDecimal getSumCountE2EByEnEstimateINForWriteOff(int estimateInCode ) throws PersistenceException{

        BigDecimal out = new BigDecimal(0);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();

        ff.estimateItemInRef.code = estimateInCode;
        // ff.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING; // SUPP-67830 - перенес в conditionSQL
        ff.conditionSQL = " ENESTIMATEITEM2NSTMTTM.CODE in ( select e2e.code from enestimateitem2nstmttm e2e , enestimateitem e  , enplanwork p  , enact2enplanwork a2p , enact a " +
                " where e2e.estimateiteminrefcode = " + estimateInCode +
                "  and e2e.estimateitemoutrefcode = e.code " +
                "  and e.planrefcode = p.code " +
                "  and a2p.plancode = p.code " +
                "  and a.code = a2p.actrefcode " +
                "  and a.acttyperefcode in (" + ENPlanWorkState.WRITINGS_MBP + ", " + ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS + " , " + ENPlanWorkState.WRITINGS_MNMA + " ) " +
                "  and a.statusrefcode = " +  ENActStatus.CLOSED +
                "    ) "
                + " and  ENESTIMATEITEM2NSTMTTM.typerefcode IN ( " + ENEstimateItem2Type.MOVEDFORWRITING + " , " + ENEstimateItem2Type.MOVEDFORWRITING_MANUAL_REMOVE + " ) " ;
            ENEstimateItem2ENEstimateItemShortList e2eList = e2eDAO.getScrollableFilteredList(ff,0,-1);
            for (int qq = 0; qq < e2eList.totalCount; qq++){
                out = out.add(e2eList.get(qq).countGen);
            }
            return out;


    }

    /*
    * сумарное колличество материала  из развязки ENEstimateItem2ENEstimateItem  по коду естимейта ИН для текущего акта
    */
    public BigDecimal getSumCountE2EByEnEstimateINForWriteOffCurrAct(int estimateInCode , int codeAct ) throws PersistenceException{

        BigDecimal out = new BigDecimal(0);
        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem2ENEstimateItemFilter ff = new ENEstimateItem2ENEstimateItemFilter();

        ff.estimateItemInRef.code = estimateInCode;
       //  ff.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING; // SUPP-67830 -- перенес в conditionSQL
        ff.conditionSQL = " ENESTIMATEITEM2NSTMTTM.CODE in ( select e2e.code from enestimateitem2nstmttm e2e , enestimateitem e  , enplanwork p  , enact2enplanwork a2p , enact a " +
                " where e2e.estimateiteminrefcode = " + estimateInCode +
                "  and e2e.estimateitemoutrefcode = e.code " +
                "  and e.planrefcode = p.code " +
                "  and a2p.plancode = p.code " +
                "  and a.code = a2p.actrefcode " +
                "  and a.acttyperefcode in (" + ENPlanWorkState.WRITINGS_MBP + ", " + ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS + " , " + ENPlanWorkState.WRITINGS_MNMA + " ) " +
                "  and a.code = "  + codeAct +
                "    ) "
                + " and  ENESTIMATEITEM2NSTMTTM.typerefcode IN ( " + ENEstimateItem2Type.MOVEDFORWRITING + " , " + ENEstimateItem2Type.MOVEDFORWRITING_MANUAL_REMOVE + " ) " ; ;
            ENEstimateItem2ENEstimateItemShortList e2eList = e2eDAO.getScrollableFilteredList(ff,0,-1);
            for (int qq = 0; qq < e2eList.totalCount; qq++){
                out = out.add(e2eList.get(qq).countGen);
            }
            return out;


    }

    /**
    *
    * Изменение статуса материала в плане при удалении строки приходного/расходного ордера
    *
    * @param fkOrderItemCode - код строки ордера
    * @param estimateItemCode - код материала в плане
     * @throws PersistenceException
    *
    **/
    public void updateStatus(int fkOrderItemCode, int estimateItemCode) throws PersistenceException
    {
        updateStatus(fkOrderItemCode, estimateItemCode, false);
    }

    /**
    *
    * Изменение статуса материала в плане при удалении строки приходного/расходного ордера
    *
    * @param fkOrderItemCode - код строки ордера
    * @param estimateItemCode - код материала в плане
    * @param isAllocationList - апдейтится ли с механизма ведомости распределения остатков
    *
    **/
    public void updateStatus(int fkOrderItemCode, int estimateItemCode, boolean isAllocationList)
            throws PersistenceException {

        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem eItem = eDAO.getObject(estimateItemCode);
        int statusCode = eItem.statusRef.code;
        boolean inFkOrder = false;
        boolean inRqOrder = false;

        /* если есть другие ордера под этот материал, оставляем у него статус "У наявності" */
        RQFKOrderItem2ENEstimateItemFilter f2eFilter = new RQFKOrderItem2ENEstimateItemFilter();
        f2eFilter.estimateItem.code = estimateItemCode;
        f2eFilter.conditionSQL = " rqfkorderitem2enstmttm.fkorderitemrefcode <> " + fkOrderItemCode;
        RQFKOrderItem2ENEstimateItemDAO f2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
        int[] f2eArr = f2eDAO.getFilteredCodeArray(f2eFilter, 0, -1);
        if (f2eArr.length > 0)
        {

            ///// 03.01.13 Если есть только один ордер на ввод ОС в эксплуатацию, то статус ставим "Введено в експлуатацію", иначе "У наявності"
            if (f2eArr.length == 1)
            {
                RQFKOrderItem2ENEstimateItem oi2ei = f2eDAO.getObject(f2eArr[0]);
                if (oi2ei != null)
                {
                    if (oi2ei.fkOrderItemRef != null)
                    {
                        RQFKOrderItemDAO oiDAO = new RQFKOrderItemDAO(connection, userProfile);

                        RQFKOrderItem oi = oiDAO.getObject(oi2ei.fkOrderItemRef.code);
                        if (oi != null)
                        {
                            if (oi.fkOrderRef != null)
                            {
                                RQFKOrderDAO orderDAO = new RQFKOrderDAO(connection, userProfile);
                                //RQFKOrder order = orderDAO.getObject(oi.fkOrderRef.code);
                                RQFKOrder order = orderDAO.getObjectNOSEGR(oi.fkOrderRef.code);

                                if (order != null)
                                {
                                    if (order.kind.code == RQFKOrderKind.OS_EXPL)
                                    {
                                        statusCode = ENEstimateItemStatus.IN_EXPLOITATION;
                                        inFkOrder = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            /////

            if (!inFkOrder)
            {
                statusCode = ENEstimateItemStatus.PRESENT;
                inFkOrder = true;
            }
        }

        /* если ордеров нет, но этот материал включен в заявку, изменяем ему статус на "Замовлений" */
        if (!inFkOrder) {
            RQOrderItem2ENEstimateItemFilter o2eFilter = new RQOrderItem2ENEstimateItemFilter();
            o2eFilter.estimateItem.code = estimateItemCode;
            RQOrderItem2ENEstimateItemDAO o2eDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
            int[] o2eArr = o2eDAO.getFilteredCodeArray(o2eFilter, 0, 1);
            if (o2eArr.length > 0) {
                statusCode = ENEstimateItemStatus.ORDERED;
                inRqOrder = true;
            }
        }

        /* если нет ни ордеров, ни заявки, ставим статус "Непотрібно замовляти"
         * но если есть ведмость распределения остатков для этого ордера, то
         * ставиться статус запланированный.
         * */
        if (!inFkOrder && !inRqOrder) {
            if(isAllocationList)
                statusCode = ENEstimateItemStatus.PLANNED;
            else
                statusCode = ENEstimateItemStatus.UNUSED;
        }

        eItem.statusRef.code = statusCode;

        if(isAllocationList) {
        	//this.checkInRQOrder(eItem, true);
        	eDAO.save(eItem, false);
        } else {
        	eDAO.save(eItem);
        }


    }


    public void updateStatusFromRQOrder(int estimateItemCode) throws PersistenceException {
    	updateStatusFromRQOrder(estimateItemCode, false);
    }

    /**
    *
    * Изменение статуса материала в плане при удалении его из строки заявки
    * (используется при удалении материала, добавленного ВРУЧНУЮ в ПЛАНОВУЮ заявку)
    *
    * @param orderItemCode - код строки заявки
    * @param estimateItemCode - код материала в плане
    *
    **/
    public void updateStatusFromRQOrder(int estimateItemCode, boolean isSilent)
            throws PersistenceException {

        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        ENEstimateItem eItem = eDAO.getObject(estimateItemCode);
        int statusCode = eItem.statusRef.code;
        boolean inFkOrder = false;
        //boolean inRqOrder = false;

        /* если есть ордера под этот материал, ставим ему статус "У наявності" */
        RQFKOrderItem2ENEstimateItemFilter f2eFilter = new RQFKOrderItem2ENEstimateItemFilter();
        f2eFilter.estimateItem.code = estimateItemCode;
        RQFKOrderItem2ENEstimateItemDAO f2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
        int[] f2eArr = f2eDAO.getFilteredCodeArray(f2eFilter, 0, -1);
        if (f2eArr.length > 0)
        {

            ///// 03.01.13 Если есть только один ордер на ввод ОС в эксплуатацию, то статус ставим "Введено в експлуатацію", иначе "У наявності"
            if (f2eArr.length == 1)
            {
                RQFKOrderItem2ENEstimateItem oi2ei = f2eDAO.getObject(f2eArr[0]);
                if (oi2ei != null)
                {
                    if (oi2ei.fkOrderItemRef != null)
                    {
                        RQFKOrderItemDAO oiDAO = new RQFKOrderItemDAO(connection, userProfile);

                        RQFKOrderItem oi = oiDAO.getObject(oi2ei.fkOrderItemRef.code);
                        if (oi != null)
                        {
                            if (oi.fkOrderRef != null)
                            {
                                RQFKOrderDAO orderDAO = new RQFKOrderDAO(connection, userProfile);
                                //RQFKOrder order = orderDAO.getObject(oi.fkOrderRef.code);
                               RQFKOrder order = orderDAO.getObjectNOSEGR(oi.fkOrderRef.code);

                                if (order != null)
                                {
                                    if (order.kind.code == RQFKOrderKind.OS_EXPL)
                                    {
                                        statusCode = ENEstimateItemStatus.IN_EXPLOITATION;
                                        inFkOrder = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            /////

            if (!inFkOrder)
            {
                statusCode = ENEstimateItemStatus.PRESENT;
                inFkOrder = true;
            }
        }

        /* если нет ордеров, ставим статус "Запланований" (потому что он был таким перед тем, как попасть в заявку) */
        if (!inFkOrder) {
            statusCode = ENEstimateItemStatus.PLANNED;
        }

        eItem.statusRef.code = statusCode;
        eDAO.save(eItem, false);

        if (!isSilent) {
            // Проверим, чтобы вдруг не появилось другой плановой заявки, в которую материал, удаляемый из текущей заявки, может влететь
            //checkInRQOrder(eItem, true);
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDAO.getObject(eItem.planRef.code);
            checkInRQOrder(eItem.materialRef.code, eItem.deliveryTime, plan, true, false);
        }
    }


    class EstimateItem2PartyData
    {
        int estimateCode;
        int party_id;

        public EstimateItem2PartyData(int vEstimateCode, int vParty_id)
        {
            estimateCode = vEstimateCode;
            party_id = vParty_id;
        }

        @Override
		public int hashCode()
        {
            return ("" + estimateCode + "" + party_id).hashCode();
        }

        @Override
		public boolean equals(Object obj)
        {
            if (obj instanceof EstimateItem2PartyData)
            {
                EstimateItem2PartyData other = (EstimateItem2PartyData)obj;
                return this.estimateCode == other.estimateCode
                    && this.party_id == other.party_id;
            } else
            {
                return false;
            }
        }

    }

    /*
    class EstimateItem2EstimateItem
    {
        int parentCode;
        int code;

        public EstimateItem2EstimateItem(int vParentCode, int vCode)
        {
            parentCode = vParentCode;
            code = vCode;
        }

        public int hashCode()
        {
            return ("" + parentCode + "" + code).hashCode();
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof EstimateItem2EstimateItem)
            {
                EstimateItem2EstimateItem other = (EstimateItem2EstimateItem)obj;
                return this.parentCode == other.parentCode
                    && this.code == other.code;
            } else
            {
                return false;
            }
        }

    }
    */

    public void getENEstimateItem2FinShortList_OLD(int planCode, String MOLCode, Date docDate, int finDocCode)
    {
        try
        {

            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter.planRef.code = planCode;
            eFilter.accountingTypeRef.code = TKAccountingType.TMC;
            eFilter.conditionSQL = "countfact > 0";

            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);

            String partyCodes = "";
            String eCodes = "";



            Hashtable<Integer, Integer> e2eData = new Hashtable<>();
            //EstimateItem2EstimateItem e2eKey;


            for (int i = 0; i < eList.totalCount; i++)
            {
                ENEstimateItem parentEstimate = getEstimateFromCurrentPlanByEstimateCode(eList.get(i).code);
                if (parentEstimate != null)
                {
                    if (parentEstimate.code != Integer.MIN_VALUE)
                    {
                        eCodes = (eCodes.length() == 0 ? "" + parentEstimate.code : eCodes + ", " + parentEstimate.code);

                        //e2eKey = new EstimateItem2EstimateItem(parentEstimate.code, eList.get(i).code);
                        e2eData.put(parentEstimate.code, eList.get(i).code);
                    }
                }
            }


                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.conditionSQL = "estimateitemrefcode in (" + eCodes + ")";
                finFilter.orderBySQL = "estimateitemrefcode";

                FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
                FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);

                //Vector<ENEstimateItem2Fin> ei2finList = new Vector<ENEstimateItem2Fin>();

                Hashtable<EstimateItem2PartyData, EstimateItem2PartyData> ei2finData = new Hashtable<>();
                EstimateItem2PartyData vKey;



                for (int i = 0; i < finList.totalCount; i++)
                {
                    partyCodes = (partyCodes.length() == 0 ? "" + finList.get(i).party_id : partyCodes + ", " + finList.get(i).party_id);

                    /*
                    ENEstimateItem2Fin ei2fin = new ENEstimateItem2Fin();
                    ei2fin.estimateCode = finList.get(i).estimateItemRefCode;
                    ei2fin.party_id = finList.get(i).party_id;

                    if (! ei2finList.contains(ei2fin))
                    {
                        ei2finList.add(ei2fin);
                    }
                    */

                    int estimateCode = e2eData.get(finList.get(i).estimateItemRefCode);

                    //vKey = new EstimateItem2PartyData(finList.get(i).estimateItemRefCode, finList.get(i).party_id);
                    vKey = new EstimateItem2PartyData(estimateCode, finList.get(i).party_id);
                    ei2finData.put(vKey, vKey);
                }

                /*
                for (int i = 0; i < ei2finList.size(); i++)
                {
                    System.out.println((i+1) + " - estimateCode: " + ((ENEstimateItem2Fin)ei2finList.get(i)).estimateCode + ", " +
                            "party_id: " + ((ENEstimateItem2Fin)ei2finList.get(i)).party_id);
                }
                */

                /*
                for (int i = 0; i < ei2finData.size(); i++)
                {
                    System.out.println((i+1) + " - estimateCode: " + ((EstimateItem2PartyData)ei2finData.get(i)).estimateCode + ", " +
                            "party_id: " + ((EstimateItem2PartyData)ei2finData.get(i)).party_id);
                }
                */

                // Get Hashtable Enumeration to get key and value
                Enumeration<EstimateItem2PartyData> em = ei2finData.keys();



                for (int j = 0; em.hasMoreElements(); j++)
                {
                    //nextElement is used to get key of Hashtable
                    EstimateItem2PartyData key = em.nextElement();

                    //get is used to get value of key in Hashtable
                    EstimateItem2PartyData value = ei2finData.get(key);

                    System.out.println((j+1) + " - estimateCode: " + value.estimateCode + ", " +
                            "party_id: " + value.party_id);
                }


                String finCondition = " isCN is null and ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
                if (partyCodes.length() > 0)
                {
                    finCondition = finCondition + " and dat.party_id in (" + partyCodes + ")";
                }

                FINMaterialsFilter finFilterFK = new FINMaterialsFilter();
                finFilterFK.conditionSQL = finCondition;

                FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
                FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK, "", MOLCode, " and h.op_kind_id not in ('5','10','310','15')", docDate, finDocCode);


                for (int i = 0; i < finListFK.totalCount; i++)
                {
                    System.out.println((i+1) + ": " + finListFK.get(i).party_id);
                }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    }

    public ENEstimateItem2FinShort mapENEstimateItem2FinShort(ENEstimateItem2FinShort anObject, ENEstimateItemShort eItem)
    {

        /*
        public int  estimateCode = Integer.MIN_VALUE;
        public BigDecimal  estimateCountFact;
        public BigDecimal  estimatePrice;
        public BigDecimal  estimateCost;

        public int planRefCode = Integer.MIN_VALUE;
        public int planItemRefCode = Integer.MIN_VALUE;
        public BigDecimal planItemRefCountGen;

        public int materialRefCode = Integer.MIN_VALUE;
        public String materialRefName;

        public String measureType;

        public int kartaRefCode = Integer.MIN_VALUE;
        public String kartaRefName;
        public String kartaNum;
        */

        anObject.estimateCode = eItem.code;

        anObject.estimateCountGen = eItem.countGen;
        anObject.estimateCountFact = eItem.countFact;

        anObject.planRefCode = eItem.planRefCode;
        anObject.planItemRefCode = eItem.planItemRefCode;

        anObject.materialRefCode = eItem.materialRefCode;
        anObject.materialRefName = eItem.materialRefName;

        anObject.measureType = eItem.measureType;

        anObject.quantityFINMaterials = eItem.quantityFINMaterials;

        return anObject;
    }

    public ENEstimateItem2FinShort mapENEstimateItem2FinShort(ENEstimateItem2FinShort anObject, FINMaterials finMaterial)
    {
        anObject.party_id = finMaterial.party_id;
        anObject.mat_id = finMaterial.mat_id;
        anObject.mat_name = finMaterial.mat_name;
        anObject.nn = finMaterial.nn;
        anObject.quantity = finMaterial.quantity;
        anObject.mu_id = finMaterial.mu_id;
        anObject.mu_name = finMaterial.mu_name;

        anObject.div_code = finMaterial.div_code;
        anObject.div_name = finMaterial.div_name;

        anObject.rest_purpose_id = finMaterial.rest_purpose_id;
        anObject.rest_purpose_type_id = finMaterial.rest_purpose_type_id;
        anObject.rest_purpose_name = finMaterial.rest_purpose_name;

        anObject.party_discription = finMaterial.party_discription;

        anObject.budget_core_id = finMaterial.budget_core_id;
        anObject.frc_code = finMaterial.frc_code;
        anObject.frc_name = finMaterial.frc_name;

        anObject.calc_price = finMaterial.calc_price;
        anObject.price = finMaterial.price;
        anObject.cost = finMaterial.cost;
        anObject.fullQuantity = finMaterial.fullQuantity;
        anObject.fullCost = finMaterial.fullCost;

        anObject.bal_sch = finMaterial.bal_sch;

        anObject.partner = finMaterial.partner;
        anObject.partner_name = finMaterial.partner_name;

        anObject.doc_num = finMaterial.doc_num;
        anObject.doc_date = finMaterial.doc_date;

        anObject.wear_date = finMaterial.wear_date;

        anObject.extra_cargo = finMaterial.extra_cargo;
        anObject.cost_ext = finMaterial.cost_ext;

        return anObject;
    }

    public ENEstimateItem2FinShortList getENEstimateItem2FinShortList____(int planCode, String MOLCode, Date docDate, int finDocCode)
    {
        try
        {
            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter.planRef.code = planCode;
            eFilter.accountingTypeRef.code = TKAccountingType.TMC;
            eFilter.conditionSQL = "countfact > 0";
            eFilter.orderBySQL = "code";

            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
            //ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
            ENEstimateItemShortList eList = eDAO.getShortListForFact(eFilter, 0, -1);

            String partyCodes = "";
            //String eCodes = "";



            //Hashtable<Integer, Integer> e2eData = new Hashtable<Integer, Integer>();
            //EstimateItem2EstimateItem e2eKey;


            Hashtable<EstimateItem2PartyData, EstimateItem2PartyData> ei2finData = new Hashtable<>();
            EstimateItem2PartyData vKey;


            for (int i = 0; i < eList.totalCount; i++)
            {
                ENEstimateItem parentEstimate = getEstimateFromCurrentPlanByEstimateCode(eList.get(i).code);
                if (parentEstimate != null)
                {
                    if (parentEstimate.code != Integer.MIN_VALUE)
                    {
                        FINMaterialsFilter finFilter = new FINMaterialsFilter();
                        finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                        finFilter.estimateItemRef.code = parentEstimate.code;
                        finFilter.orderBySQL = "estimateitemrefcode";

                        FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
                        FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);

                        for (int j = 0; j < finList.totalCount; j++)
                        {
                            partyCodes = (partyCodes.length() == 0 ? "" + finList.get(j).party_id : partyCodes + ", " + finList.get(j).party_id);

                            //vKey = new EstimateItem2PartyData(finList.get(i).estimateItemRefCode, finList.get(i).party_id);
                            vKey = new EstimateItem2PartyData(eList.get(i).code, finList.get(j).party_id);
                            ei2finData.put(vKey, vKey);
                        }

                    }
                }
            }



                // Get Hashtable Enumeration to get key and value
                Enumeration<EstimateItem2PartyData> em = ei2finData.keys();



                for (int j = 0; em.hasMoreElements(); j++)
                {
                    //nextElement is used to get key of Hashtable
                    EstimateItem2PartyData key = em.nextElement();

                    //get is used to get value of key in Hashtable
                    EstimateItem2PartyData value = ei2finData.get(key);

                    System.out.println((j+1) + " - estimateCode: " + value.estimateCode + ", " +
                            "party_id: " + value.party_id);
                }


                String finCondition = " isCN is null and ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
                if (partyCodes.length() > 0)
                {
                    finCondition = finCondition + " and dat.party_id in (" + partyCodes + ")";
                }

                FINMaterialsFilter finFilterFK = new FINMaterialsFilter();
                finFilterFK.conditionSQL = finCondition;
                finFilterFK.orderBySQL = "dat.party_id";

                FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
                FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK, "", MOLCode, " and h.op_kind_id not in ('5','10','310','15')", docDate, finDocCode);


                for (int i = 0; i < finListFK.totalCount; i++)
                {
                    System.out.println((i+1) + ": " + finListFK.get(i).party_id);
                }


                ////////////////////////////////////////
                ENEstimateItem2FinShortList result = new ENEstimateItem2FinShortList();
                ENEstimateItem2FinShort anObject;
                result.list = new Vector<>();


                for (int i = 0; i < eList.totalCount; i++)
                {
                    em = ei2finData.keys();

                    boolean isFinBinded = false;

                    while (em.hasMoreElements())
                    {
                        //nextElement is used to get key of Hashtable
                        EstimateItem2PartyData key = em.nextElement();

                        //get is used to get value of key in Hashtable
                        EstimateItem2PartyData value = ei2finData.get(key);

                        //System.out.println((j+1) + " - estimateCode: " + value.estimateCode + ", " +
                        //        "party_id: " + value.party_id);

                        if (eList.get(i).code == value.estimateCode)
                        {
                            for (int j = 0; j < finListFK.totalCount; j++)
                            {
                                if (finListFK.get(j).party_id == value.party_id)
                                {
                                    anObject = new ENEstimateItem2FinShort();
                                    anObject = mapENEstimateItem2FinShort(anObject, eList.get(i));
                                    anObject = mapENEstimateItem2FinShort(anObject, finListFK.get(j));

                                    result.list.add(anObject);
                                    result.setTotalCount(result.getTotalCount() + 1);

                                    isFinBinded = true;
                                }
                            }
                        }
                    }

                    if (! isFinBinded)
                    {
                        anObject = new ENEstimateItem2FinShort();
                        anObject = mapENEstimateItem2FinShort(anObject, eList.get(i));

                        result.list.add(anObject);
                        result.setTotalCount(result.getTotalCount() + 1);
                    }
                }

                //int tmpCode = Integer.MIN_VALUE;
                double totalRequiredQuantity = 0;
                double requiredQuantity = 0;
                double availableQuantity = 0;
                double filledQuantity = 0;
                double suggestedQuantity = 0;

                Hashtable<Integer, BigDecimal> est2finData = new Hashtable<>();
                ///// e2eData.put(parentEstimate.code, eList.get(i).code);
                ///// int estimateCode = e2eData.get(finList.get(i).estimateItemRefCode);
                ///// vKey = new EstimateItem2PartyData(estimateCode, finList.get(i).party_id);
                ///// ei2finData.put(vKey, vKey);

                for (int i = 0; i < result.totalCount; i++)
                {
                    System.out.println("*" + (i+1) + " - estimateCode: " + result.get(i).estimateCode + ", " +
                            "party_id: " + result.get(i).party_id);

                    //if (result.list.get(i).estimateCode != tmpCode)
                    //{
                        //tmpCode = result.list.get(i).estimateCode;

                        if (result.list.get(i).estimateCountFact != null)
                        {
                            totalRequiredQuantity = result.list.get(i).estimateCountFact.doubleValue();
                        }
                        else
                        {
                            totalRequiredQuantity = 0;
                        }

                        //requiredQuantity = result.list.get(i).estimateCountFact.subtract(result.list.get(i).quantityFINMaterials).doubleValue();
                        if (result.list.get(i).quantity != null)
                        {
                            availableQuantity = result.list.get(i).quantity.doubleValue();
                        }
                        else
                        {
                            availableQuantity = 0;
                        }

                        suggestedQuantity = 0;

                        filledQuantity = 0;
                        BigDecimal tmpFilledQuantity = est2finData.get(result.list.get(i).estimateCode);
                        if (tmpFilledQuantity != null)
                        {
                            filledQuantity = tmpFilledQuantity.doubleValue();
                        }
                        else
                        {
                            if (result.list.get(i).quantityFINMaterials != null)
                            {
                                filledQuantity = result.list.get(i).quantityFINMaterials.doubleValue();
                            }
                            else
                            {
                                filledQuantity = 0;
                            }
                            est2finData.put(result.list.get(i).estimateCode, new BigDecimal(filledQuantity).setScale(6, BigDecimal.ROUND_HALF_UP));
                        }
                        requiredQuantity = totalRequiredQuantity - filledQuantity;

                        if (requiredQuantity > 0)
                        {
                            if (availableQuantity >= requiredQuantity)
                            {
                                suggestedQuantity = requiredQuantity;
                            }
                            else
                            {
                                suggestedQuantity = availableQuantity;
                            }

                            if (suggestedQuantity > 0)
                            {
                                ENEstimateItem2FinShort item = result.list.get(i);
                                item.suggestedQuantity = new BigDecimal(suggestedQuantity).setScale(6, BigDecimal.ROUND_HALF_UP);
                                result.list.set(i, item);

                                filledQuantity = filledQuantity + suggestedQuantity;
                                est2finData.put(result.list.get(i).estimateCode, new BigDecimal(filledQuantity).setScale(6, BigDecimal.ROUND_HALF_UP));
                            }
                        }
                    //}
                }


                return result;
                ////////////////////////////////////////

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    }


    public ENEstimateItem2FinShortList getENEstimateItem2FinShortList(int planCode, FINMaterialsFilter aFilterObject, String MOLCode,
            String balansNumberCondition, String materialCondition, Date docDate, int finDocCode)
    {
        try
        {

            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter.planRef.code = planCode;
            eFilter.accountingTypeRef.code = TKAccountingType.TMC;
            eFilter.conditionSQL = "countfact > 0";
            eFilter.orderBySQL = "sm.NAME, ENESTIMATEITEM.CODE";

            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
            //ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
            ENEstimateItemShortList eList = eDAO.getShortListForFact(eFilter, 0, -1);

            //String partyCodes = "";
            String partyCodes = "-1"; // Чтобы ничего не выбралось в лист, если под эстимейты плана ничего не передавалось!!!
            //String eCodes = "";



            //Hashtable<Integer, Integer> e2eData = new Hashtable<Integer, Integer>();
            //EstimateItem2EstimateItem e2eKey;


            //Hashtable<EstimateItem2PartyData, EstimateItem2PartyData> ei2finData = new Hashtable<EstimateItem2PartyData, EstimateItem2PartyData>();
            LinkedHashMap<EstimateItem2PartyData, EstimateItem2PartyData> ei2finData = new LinkedHashMap<>();
            EstimateItem2PartyData vKey;


            for (int i = 0; i < eList.totalCount; i++)
            {
                ENEstimateItem parentEstimate = getEstimateFromCurrentPlanByEstimateCode(eList.get(i).code);
                if (parentEstimate != null)
                {
                    if (parentEstimate.code != Integer.MIN_VALUE)
                    {
                        FINMaterialsFilter finFilter = new FINMaterialsFilter();
                        finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                        finFilter.estimateItemRef.code = parentEstimate.code;
                        finFilter.orderBySQL = "estimateitemrefcode, party_id";

                        FINMaterialsDAO finDAO = new FINMaterialsDAO(connection, userProfile);
                        FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter, 0, -1);

                        for (int j = 0; j < finList.totalCount; j++)
                        {
                            partyCodes = (partyCodes.length() == 0 ? "" + finList.get(j).party_id : partyCodes + ", " + finList.get(j).party_id);

                            //vKey = new EstimateItem2PartyData(finList.get(i).estimateItemRefCode, finList.get(i).party_id);
                            vKey = new EstimateItem2PartyData(eList.get(i).code, finList.get(j).party_id);
                            ei2finData.put(vKey, vKey);
                        }

                    }
                }
            }



                // Get Hashtable Enumeration to get key and value
                // Enumeration<EstimateItem2PartyData> em = ei2finData.keys();
                Iterator<EstimateItem2PartyData> iterator = ei2finData.keySet().iterator();

                /*
                for (int j = 0; em.hasMoreElements(); j++)
                {
                    //nextElement is used to get key of Hashtable
                    EstimateItem2PartyData key = (EstimateItem2PartyData)em.nextElement();

                    //get is used to get value of key in Hashtable
                    EstimateItem2PartyData value = (EstimateItem2PartyData)ei2finData.get(key);

                    System.out.println((j+1) + " - estimateCode: " + value.estimateCode + ", " +
                            "party_id: " + value.party_id);
                }
                */


                //String finCondition = " isCN is null and ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
                String finCondition = aFilterObject.conditionSQL;
                if (finCondition == null)
                {
                    finCondition = " isCN is null and ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
                }
                else if (finCondition.equals(""))
                {
                    finCondition = " isCN is null and ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
                }

                finCondition = finCondition + " and dat.rest_purpose_type_id = " + RQConsts.REST_PURPOSE_TYPE_ID_TRANZIT;
                if (partyCodes.length() > 0)
                {
                    finCondition = finCondition + " and dat.party_id in (" + partyCodes + ")";
                }

                FINMaterialsFilter finFilterFK = new FINMaterialsFilter();
                finFilterFK.conditionSQL = finCondition;
                finFilterFK.orderBySQL = "dat.party_id";

                FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
                FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK, balansNumberCondition, MOLCode, materialCondition, docDate, finDocCode);

                /*
                for (int i = 0; i < finListFK.totalCount; i++)
                {
                    System.out.println((i+1) + ": " + finListFK.get(i).party_id);
                }
                */


                ////////////////////////////////////////
                ENEstimateItem2FinShortList result = new ENEstimateItem2FinShortList();
                ENEstimateItem2FinShort anObject;
                result.list = new Vector<>();

                /*
                java.util.List<EstimateItem2PartyData> tmp = java.util.Collections.list(ei2finData.keys());
                //java.util.Collections.sort(tmp);
                java.util.Collections.sort(tmp);
                java.util.Iterator<EstimateItem2PartyData> it = tmp.iterator();
        `        */

                for (int i = 0; i < eList.totalCount; i++)
                {
                    //em = ei2finData.keys();
                    iterator = ei2finData.keySet().iterator();

                    boolean isFinBinded = false;

                    //while (em.hasMoreElements())
                    while (iterator.hasNext())
                    {
                        //nextElement is used to get key of Hashtable
                        //EstimateItem2PartyData key = (EstimateItem2PartyData)em.nextElement();
                        EstimateItem2PartyData key = iterator.next();

                        //get is used to get value of key in Hashtable
                        EstimateItem2PartyData value = ei2finData.get(key);

                        //System.out.println((j+1) + " - estimateCode: " + value.estimateCode + ", " +
                        //        "party_id: " + value.party_id);

                        if (eList.get(i).code == value.estimateCode)
                        {
                            for (int j = 0; j < finListFK.totalCount; j++)
                            {
                                if (finListFK.get(j).party_id == value.party_id)
                                {
                                    anObject = new ENEstimateItem2FinShort();
                                    anObject = mapENEstimateItem2FinShort(anObject, eList.get(i));
                                    anObject = mapENEstimateItem2FinShort(anObject, finListFK.get(j));

                                    result.list.add(anObject);
                                    result.setTotalCount(result.getTotalCount() + 1);

                                    isFinBinded = true;
                                }
                            }
                        }
                    }

                    if (! isFinBinded)
                    {
                        anObject = new ENEstimateItem2FinShort();
                        anObject = mapENEstimateItem2FinShort(anObject, eList.get(i));

                        result.list.add(anObject);
                        result.setTotalCount(result.getTotalCount() + 1);
                    }
                }

                //int tmpCode = Integer.MIN_VALUE;
                double totalRequiredQuantity = 0;
                double requiredQuantity = 0;
                double availableQuantity = 0;
                double filledQuantity = 0;
                double suggestedQuantity = 0;

                Hashtable<Integer, BigDecimal> est2finData = new Hashtable<>();
                ///// e2eData.put(parentEstimate.code, eList.get(i).code);
                ///// int estimateCode = e2eData.get(finList.get(i).estimateItemRefCode);
                ///// vKey = new EstimateItem2PartyData(estimateCode, finList.get(i).party_id);
                ///// ei2finData.put(vKey, vKey);

                for (int i = 0; i < result.totalCount; i++)
                {
                    //System.out.println("*" + (i+1) + " - estimateCode: " + result.get(i).estimateCode + ", " +
                    //        "party_id: " + result.get(i).party_id);

                    //if (result.list.get(i).estimateCode != tmpCode)
                    //{
                        //tmpCode = result.list.get(i).estimateCode;

                        if (result.list.get(i).estimateCountFact != null)
                        {
                            totalRequiredQuantity = result.list.get(i).estimateCountFact.doubleValue();
                        }
                        else
                        {
                            totalRequiredQuantity = 0;
                        }

                        //requiredQuantity = result.list.get(i).estimateCountFact.subtract(result.list.get(i).quantityFINMaterials).doubleValue();
                        if (result.list.get(i).quantity != null)
                        {
                            availableQuantity = result.list.get(i).quantity.doubleValue();
                        }
                        else
                        {
                            availableQuantity = 0;
                        }

                        suggestedQuantity = 0;

                        filledQuantity = 0;
                        BigDecimal tmpFilledQuantity = est2finData.get(result.list.get(i).estimateCode);
                        if (tmpFilledQuantity != null)
                        {
                            filledQuantity = tmpFilledQuantity.doubleValue();
                        }
                        else
                        {
                            if (result.list.get(i).quantityFINMaterials != null)
                            {
                                filledQuantity = result.list.get(i).quantityFINMaterials.doubleValue();
                            }
                            else
                            {
                                filledQuantity = 0;
                            }
                            est2finData.put(result.list.get(i).estimateCode, new BigDecimal(filledQuantity).setScale(6, BigDecimal.ROUND_HALF_UP));
                        }
                        requiredQuantity = totalRequiredQuantity - filledQuantity;

                        if (requiredQuantity > 0)
                        {
                            if (availableQuantity >= requiredQuantity)
                            {
                                suggestedQuantity = requiredQuantity;
                            }
                            else
                            {
                                suggestedQuantity = availableQuantity;
                            }

                            if (suggestedQuantity > 0)
                            {
                                ENEstimateItem2FinShort item = result.list.get(i);
                                item.suggestedQuantity = new BigDecimal(suggestedQuantity).setScale(6, BigDecimal.ROUND_HALF_UP);
                                result.list.set(i, item);

                                filledQuantity = filledQuantity + suggestedQuantity;
                                est2finData.put(result.list.get(i).estimateCode, new BigDecimal(filledQuantity).setScale(6, BigDecimal.ROUND_HALF_UP));
                            }
                        }
                    //}
                }


                return result;
                ////////////////////////////////////////

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    }


    /**
    * Функция для проверки возможности списания выбранного материала из оперативного запаса (NET-4061, п. 3)
    *
    * @param elementType - тип элемента
    * @param plan - план (пока не используется, но может понадобиться)
    * @param finMaterialsObj - объект типа FINMaterials
    *
    */
    public void checkForOperativeStockRestriction(int elementType, ENPlanWork plan, FINMaterials finMaterialsObj) throws PersistenceException
    {
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///// 04.02.13 NET-4061, п. 3
        if (ENConsts.IS_OPERATIVE_STOCK_RESTRICTION)
        {
            if (elementType != ENElementType.WRITING_NO_OBJECT) // Кроме списаний
            {
                if (finMaterialsObj.rest_purpose_type_id != RQConsts.REST_PURPOSE_TYPE_ID_TRANZIT)
                {
                    ENNomenclaturesOperativeDAO nomDAO = new ENNomenclaturesOperativeDAO(connection, userProfile);

                    ENNomenclaturesOperativeFilter nomFilter = new ENNomenclaturesOperativeFilter();
                    nomFilter.id = finMaterialsObj.mat_id;
                    int[] nomArr = nomDAO.getFilteredCodeArray(nomFilter, 0, -1);

                    if (nomArr.length == 0)
                    {
                        throw new EnergyproSystemException("\n\nNET-4061 Для обраної номенклатури (" + finMaterialsObj.nn +
                                ") немає дозвілу на списання з Оперативного Запасу!");
                    }
                }
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }


    /**
    * Функция для деления материалов на плане
    *
    * @param estimateCode - код estimateItem'а
    * @param newStatusCode - код нового статуса
    * @param oldStatusCode - код статуса старого эстимейта
    * @param quantity - количество, которое необходимо отделить и перебросить в статус newStatusCode
    * @return код нового estimateItem'а
    *
    */

    public int splitEstimateItem(int estimateCode, int newStatusCode, int oldStatusCode, BigDecimal quantity) throws PersistenceException {
        return splitEstimateItem(estimateCode, newStatusCode, Integer.MIN_VALUE, quantity, false, Integer.MIN_VALUE);
    }

    public int splitEstimateItem(int estimateCode, int newStatusCode, BigDecimal quantity) throws PersistenceException {
        return splitEstimateItem(estimateCode, newStatusCode, Integer.MIN_VALUE, quantity, false, Integer.MIN_VALUE);
    }

    public int splitEstimateItem(int estimateCode, int newStatusCode, int oldStatusCode, BigDecimal quantity,
            boolean isPrihod, int fkOrderCode) throws PersistenceException
    {
        if (quantity.doubleValue() <= 0)
        {
            throw new EnergyproSystemException("\n\nNET-4258 Кількість, що передається, повинна перевищувати 0!");
        }

        int newEstimateCode = Integer.MIN_VALUE;

        ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);

        ENEstimateItem estObj = estDAO.getObject(estimateCode);

        if (estObj == null)
        {
            throw new EnergyproSystemException("\n\nNET-4258 Не знайдено матеріал на плані! Код матеріалу: " + estimateCode);
        }

        /*
        if (quantity.doubleValue() > estObj.countFact.doubleValue())
        {
            throw new EnergyproSystemException("\n\nNET-4258 Кількість, що передається, перевищує кількість матеріала на плані!");
        }
        */

        //int currentStatusCode = estObj.statusRef.code;

        BigDecimal restQuantity = new BigDecimal(estObj.countFact.doubleValue() - quantity.doubleValue()).setScale(6, BigDecimal.ROUND_HALF_UP);

        if (isPrihod) {
            ENEstimateItem newEstObj = new ENEstimateItem();
            if (restQuantity.doubleValue() > 0)
            {
                newEstObj = estDAO.getObject(estimateCode);
                newEstObj.countFact = new BigDecimal(restQuantity.doubleValue()).setScale(6, BigDecimal.ROUND_HALF_UP);
                newEstObj.code = Integer.MIN_VALUE;

                if (oldStatusCode != Integer.MIN_VALUE) {
                    newEstObj.statusRef.code = oldStatusCode;
                }

                // NET-4529 план закупок . Тут разрешим добавить естимейт при делении . В функции createDepending -обработаю по старому естимейту, и если он
                // в плане закупок то нужно новый естимейт связать с планом закупок в котором сидит старый естимейт
                newEstimateCode = estDAO.add(newEstObj , false );

                estObj.countFact = new BigDecimal(quantity.doubleValue()).setScale(6, BigDecimal.ROUND_HALF_UP);
            }

            estObj.statusRef.code = newStatusCode;
            estDAO.save(estObj , false ); // сейвим без проверки на план закупок , привязка к плану закупки в методе createDependingForPlanPurchaseAndContract

            createDepending(estObj, newEstObj, fkOrderCode);
            createDependingForPlanPurchaseAndContract(estObj, newEstObj);

        } else {

        	ENEstimateItem newEstObj = null;
            /** 28.03.2014... +++ только, если материал запланирован... */
            // Добавляем новый эстимейт с оставшимся кол-вом (кроме случаев, если материал уже в заявке)
            if (restQuantity.doubleValue() > 0 && estObj.statusRef.code == ENEstimateItemStatus.PLANNED)
            {
                /*
                // 10.07.13 Что делать в таком случае? Запрещать передавать или просто не разбивать эстимейт на 2?
                // 11.07.13 Решили, что для уже заказанных не будем делить строку, будет ставиться всей строке "У наявності" (как и раньше)
                if (estObj.statusRef.code == ENEstimateItemStatus.ORDERED)
                {
                    throw new EnergyproSystemException("\n\nNET-4258 Матеріал у плані вже замовлений! Передавати під нього можливо лише повну кількість!");
                }
                */

                // ENEstimateItem newEstObj = estObj;
                // Лучше так:
                newEstObj = estDAO.getObject(estimateCode);
                newEstObj.countFact = new BigDecimal(restQuantity.doubleValue()).setScale(6, BigDecimal.ROUND_HALF_UP);
                newEstObj.code = Integer.MIN_VALUE;

                if (oldStatusCode != Integer.MIN_VALUE) {
                    newEstObj.statusRef.code = oldStatusCode;
                }

               // 2016.10.11 newEstimateCode = estDAO.add(newEstObj);
               // в плане закупок то нужно новый естимейт связать с планом закупок в котором сидит старый естимейт
                newEstimateCode = estDAO.add(newEstObj , false );

                // Апдейтим кол-во на старом эстимейте
                estObj.countFact = new BigDecimal(quantity.doubleValue()).setScale(6, BigDecimal.ROUND_HALF_UP);
            }

            estObj.statusRef.code = newStatusCode;
            // 2016.10.11 estDAO.save(estObj);
            estDAO.save(estObj , false ); // сейвим без проверки на план закупок , привязка к плану закупки в методе createDependingForPlanPurchaseAndContract

            if (newEstObj != null){
            	createDependingForPlanPurchaseAndContract(estObj, newEstObj);
            }


        }

        return newEstimateCode;
    }


    /**
     * создание связок при делении материала
     *
     * @param oldEstimate - старый эстимейт
     * @param newEstimate - новый эстимейт
     * @param fkOrderCode - код приходного ордера
     *
     */

    private void createDependings(ENEstimateItem oldEstimate,
            ENEstimateItem newEstimate, int fkOrderCode) {

    }


    private void createDepending(ENEstimateItem oldEstimate,
            ENEstimateItem newEstimate, int fkOrderCode) {
        try {

            ENEstimateHistoryDAO ehDao = new ENEstimateHistoryDAO(connection, userProfile);

            /** заявка */
            RQOrderItem2ENEstimateItemDAO oi2eiDao = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
            RQOrderItem2ENEstimateItemFilter oi2eiFilter = new RQOrderItem2ENEstimateItemFilter();
            oi2eiFilter.estimateItem.code = oldEstimate.code;

            int oi2eiArr[] = oi2eiDao.getFilteredCodeArray(oi2eiFilter, 0, -1);
            if (oi2eiArr.length > 0) {
                RQOrderItem2ENEstimateItem oi2ei = oi2eiDao.getObject(oi2eiArr[0]);

                RQOrderItem2ENEstimateItem oi2eiNew = new RQOrderItem2ENEstimateItem();
                oi2eiNew.estimateItem.code = newEstimate.code;
                oi2eiNew.countGen = newEstimate.countFact;
                oi2eiNew.orderItem.code = oi2ei.orderItem.code;
                oi2eiNew.statusRef.code = oi2ei.statusRef.code;
                oi2eiNew.typeRef.code = oi2ei.typeRef.code;
                oi2eiDao.add(oi2eiNew);

                oi2ei.countGen = oldEstimate.countFact;
                oi2eiDao.save(oi2ei);

                /** история */
                ENEstimateHistoryFilter ehFilter = new ENEstimateHistoryFilter();
                ehFilter.estimateItemRef.code = oldEstimate.code;
                ehFilter.rqOrderItemRef.code = oi2ei.orderItem.code;

                int ehArr[] = ehDao.getFilteredCodeArray(ehFilter, 0, -1);
                if (ehArr.length > 0) {
                    ENEstimateHistory eh = ehDao.getObject(ehArr[0]);
                    eh.countFact = oldEstimate.countFact;
                    ehDao.save(eh);

                    ENEstimateHistory ehNew = eh;
                    ehNew.code = Integer.MIN_VALUE;
                    ehNew.estimateItemRef.code = newEstimate.code;
                    ehNew.countFact = newEstimate.countFact;
                    ehDao.add(ehNew);
                }
            }

            /** счет...
             *
             *  эстимейт может быть в нескольких счетах...
             *  по истории находим строку счета для этого прихода
             */
            ENEstimateHistoryFilter ehFilter = new ENEstimateHistoryFilter();
            ehFilter.estimateItemRef.code = oldEstimate.code;
            ehFilter.conditionSQL = " fkorderitemrefcode in (" +
                    "select foi.code from rqfkorderitem foi where foi.fkorderrefcode = " + fkOrderCode + ")";

            int ehArr[] = ehDao.getFilteredCodeArray(ehFilter, 0, -1);
            if (ehArr.length > 0) {
                ENEstimateHistory eh = ehDao.getObject(ehArr[0]);

                RQBillItem2ENEstimateItemDAO bi2eiDao = new RQBillItem2ENEstimateItemDAO(connection, userProfile);
                RQBillItem2ENEstimateItemFilter bi2eiFilter = new RQBillItem2ENEstimateItemFilter();
                bi2eiFilter.estimateItem.code = oldEstimate.code;
                bi2eiFilter.billItem.code = eh.rqBillItemRef.code;

                int bi2eiArr[] = bi2eiDao.getFilteredCodeArray(bi2eiFilter, 0, -1);
                if (bi2eiArr.length > 0) {
                    RQBillItem2ENEstimateItem bi2ei = bi2eiDao.getObject(bi2eiArr[0]);

                    /** разделяем связку только если в счете было большее кол-во */
                    if (bi2ei.countGen.doubleValue() > oldEstimate.countFact.doubleValue()) {

                        RQBillItem2ENEstimateItem bi2eiNew = new RQBillItem2ENEstimateItem();
                        bi2eiNew.estimateItem.code = newEstimate.code;
                        bi2eiNew.countGen = bi2ei.countGen.subtract(oldEstimate.countFact);
                        bi2eiNew.billItem.code = bi2ei.billItem.code;
                        bi2eiNew.statusRef.code = bi2ei.statusRef.code;
                        bi2eiDao.add(bi2eiNew);

                        bi2ei.countGen = oldEstimate.countFact;
                        bi2eiDao.save(bi2ei);


                        /** история */
                        ENEstimateHistoryFilter eshFilter = new ENEstimateHistoryFilter();
                        eshFilter.estimateItemRef.code = oldEstimate.code;
                        eshFilter.rqBillItemRef.code = bi2ei.billItem.code;
                        eshFilter.conditionSQL = " fkorderitemrefcode is null";

                        int eshArr[] = ehDao.getFilteredCodeArray(eshFilter, 0, -1);
                        if (eshArr.length > 0) {
                            ENEstimateHistory esh = ehDao.getObject(eshArr[0]);

                            esh.countFact = bi2ei.countGen;
                            ehDao.save(esh);

                            ENEstimateHistory ehNew = esh;
                            ehNew.code = Integer.MIN_VALUE;
                            ehNew.estimateItemRef.code = newEstimate.code;
                            ehNew.countFact = bi2eiNew.countGen;
                            ehDao.add(ehNew);
                        }
                    }
                }
            }

            System.out.println("createDepending ## oldEstimate.code = " +
            	        oldEstimate.code + " ## newEstimate.code = " + newEstimate.code);

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }


    /**
     * для связки материалы при разделении с планом закупок и договором
     * */
    public void createDependingForPlanPurchaseAndContract(ENEstimateItem oldEstimate, ENEstimateItem newEstimate) {
        try {

            RQPurchaseItem2EstimateItemDAO pui2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
            ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
            ENEstimateItem2ContractDAO ei2ctDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
            RQOrgDAO orgDAO = new RQOrgDAO(connection, userProfile);
            OrderItemLogic oitemLogic = new OrderItemLogic(connection, userProfile);

            // NET-4529  план закупок - естимейт если поделен то новый тоже нужно связать с планом закупок и с развязкой к договорам(если есть )
            if (oldEstimate.purchaseItemRef.code != Integer.MIN_VALUE){
             RQPurchaseItem2EstimateItemFilter pui2eiFil_oldEiFilter = new RQPurchaseItem2EstimateItemFilter();
             pui2eiFil_oldEiFilter.estimateItemRef.code = oldEstimate.code;
             pui2eiFil_oldEiFilter.purchaseItemRef.code = oldEstimate.purchaseItemRef.code;
             RQPurchaseItem2EstimateItemShortList pui2eiFil_oldEiList = pui2eiDAO.getScrollableFilteredList(pui2eiFil_oldEiFilter, 0, -1);

             ENEstimateItem eiNewObj = eiDAO.getObjectNoSegr(newEstimate.code);

             int purchaseItemCode = oldEstimate.purchaseItemRef.code;
             ///// Переехало ниже - после создания связки
             //eiNewObj.purchaseItemRef.code = purchaseItemCode; //oldEstimate.purchaseItemRef.code;
             //eiDAO.save(eiNewObj, false);
             /////

             // старый естимейт што связан с планом закупки уменьшим количество в связке
             RQPurchaseItem2EstimateItem pui2eiOldObj = pui2eiDAO.getObject(pui2eiFil_oldEiList.get(0).code);

             pui2eiOldObj.countGen = oldEstimate.countFact;
          // !!!!!! в связке может быть количество естимейта для публикации занулено уже , поэтому количество для публикациине трогаем и в новой связке оно тоже болжно пойти 0
             if(pui2eiOldObj.countPurchase.doubleValue() > 0) {
            	 pui2eiOldObj.countPurchase = oldEstimate.countFact;
             }


             pui2eiDAO.save(pui2eiOldObj);

             // связка со строкой плана закупки
             RQPurchaseItem2EstimateItemFilter pui2eiFil = new RQPurchaseItem2EstimateItemFilter();
             pui2eiFil.estimateItemRef.code = eiNewObj.code;
             pui2eiFil.purchaseItemRef.code = purchaseItemCode; //eiNewObj.purchaseItemRef.code;

             int[] pui2eiArr = pui2eiDAO.getFilteredCodeArray(pui2eiFil, 0, -1);
	             if (pui2eiArr.length == 0 ){
	            	 RQPurchaseItem2EstimateItem pui2eiObj = new RQPurchaseItem2EstimateItem();
	            	 pui2eiObj.code = Integer.MIN_VALUE;
	            	 pui2eiObj.countGen = newEstimate.countFact;

	            	// !!!!!! в старой связке может быть количество естимейта для публикации занулено уже , поэтому количество для публикаци в связке с новым естимейтом тоже должно быть 0
	            	 if(pui2eiOldObj.countPurchase.doubleValue() > 0) {
	            		 pui2eiObj.countPurchase = newEstimate.countFact;
	            	 } else
	            		 pui2eiObj.countPurchase = new BigDecimal(0);


	            	 pui2eiObj.estimateItemRef.code = newEstimate.code;
	            	 pui2eiObj.statusComment = pui2eiObj.statusComment+
	            			 (" || создано при делении естимейта ун.н =  "+ oldEstimate.code);
	            	 pui2eiObj.purchaseItemRef.code = purchaseItemCode; //eiNewObj.purchaseItemRef.code;
	            	 pui2eiObj.purchaseItem2EstimateItemStatusRef.code = pui2eiFil_oldEiList.get(0).purchaseItem2EstimateItemStatusRefCode;
	            	 pui2eiObj.purItemSourceReplaseRef.code = pui2eiFil_oldEiList.get(0).purItemSourceReplaseRefCode;
	            	 pui2eiDAO.add(pui2eiObj);
	             }

	             eiNewObj.purchaseItemRef.code = purchaseItemCode; //oldEstimate.purchaseItemRef.code;
	             eiDAO.save(eiNewObj, false);

            }

            // если есть связка старого естимейта с договором то связываем и новый естимейт тоже
            // !!!
            ENEstimateItem2ContractFilter ei2ctFilter = new ENEstimateItem2ContractFilter();
            ei2ctFilter.estimateItem.code = oldEstimate.code;
            int[] ei2ctArr = ei2ctDAO.getFilteredCodeArray(ei2ctFilter, 0, -1);
            if(ei2ctArr.length > 0 ){
            	ENEstimateItem2Contract ei2ctObjOld = ei2ctDAO.getObject(ei2ctArr[0]);
            	ENEstimateItem2Contract ei2ctObjNew = new ENEstimateItem2Contract();


				RQOrg orgObj = orgDAO.getObject(ei2ctObjOld.org.code);

				orgObj.code = Integer.MIN_VALUE;
				ei2ctObjNew.org.code = oitemLogic.copyOrg(orgObj);


				ei2ctObjNew.contractDate = ei2ctObjOld.contractDate;
				ei2ctObjNew.contractNumber = ei2ctObjOld.contractNumber;
				ei2ctObjNew.finDocCode = ei2ctObjOld.finDocCode;
				ei2ctObjNew.finDocID = ei2ctObjOld.finDocID;
				ei2ctObjNew.estimateItem.code = newEstimate.code;
				ei2ctObjNew.countFact = newEstimate.countFact;
				ei2ctObjNew.rqPurchItm2Estimate.code = ei2ctObjOld.rqPurchItm2Estimate.code;
				ei2ctDAO.add(ei2ctObjNew);

				// уменьшим на связке с договором со старым естимейтом кол-во
				ei2ctObjOld.countFact = oldEstimate.countFact;
				ei2ctDAO.save(ei2ctObjOld);


            }

            System.out.println("createDependingForPlanPurchaseAndContract ## oldEstimate.code = " +
            	        oldEstimate.code + " ## newEstimate.code = " + newEstimate.code);

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }



    public boolean checkFirstPlanBySiz(int elementCode)
            throws PersistenceException {

        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);

        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = elementCode;

		int[] pArr = planDao.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);
		if (pArr.length > 1) {
			return false;
		} else {
			return true;
		}
    }


    /**
     * Функция для проверки суммарного процента плановых оплат для материала в плане
     *
     * @param estimateItemCode - код estimateItem'а
     * @param isException - возвращать ли исключение

     * @return true - общий процент равен 100 (все правильно), false - общий процент не равен 100
     * @throws PersistenceException
     *
     */
    public boolean validateEstimateItemPlanPay(int estimateItemCode, boolean isException) throws PersistenceException
    {
        ENEstimateItemPlanPayDAO planPayDAO = new ENEstimateItemPlanPayDAO(connection, userProfile);

        ENEstimateItemPlanPayFilter planPayFilter = new ENEstimateItemPlanPayFilter();
        planPayFilter.estimateItemRef.code = estimateItemCode;
        ENEstimateItemPlanPayShortList planPayList = planPayDAO.getScrollableFilteredList(planPayFilter, 0, -1);

        BigDecimal totalPercentPay = new BigDecimal(0);

        for (int i = 0; i < planPayList.totalCount; i++)
        {
            totalPercentPay = totalPercentPay.add(planPayList.get(i).percentPay).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

        //if (! totalPercentPay.equals(new BigDecimal(100.00)))
        if (totalPercentPay.doubleValue() != 100)
        {
            if (isException)
            {
                throw new SystemException("\n\nNET-4303 Загальний відсоток сплати повинен дорівнювати 100 !");
            }
            else
            {
                return false;
            }
        }

        return true;
    }


    /**
     *  Проверка привязки номенклатуры к материалу через развязку с эталонным справочником
     *
     *  @param materialCode - код материала
     *  @param nn - номенклатура
     *
     *  @return true - есть привязка, false в другом случае
     */
    public boolean checkNomenclaturesByMaterial(int materialCode, String nn) {

        boolean out = false;
        PreparedStatement statement = null;
        ResultSet set = null;

        // SUPP-17474 - избавляемся от темпматериалс
        /*String sql =
        " select w.code, w.mat_id, w.nn, w.name, w.measurementname from ( " +
        " select n.code, n.mat_id, n.nn, n.name, n.measurementname  \n" +
        " from tempnomenclaturs2mtrls nm, tempnomenclatures n \n" +
        " where nm.materialetalonrefcode in \n" +
        " ( \n" +
        " select me.code \n" +
        " from tempmaterialsetalon me \n" +
        " where me.tempmaterialrefcode = ? \n" +
        "  \n" +
        " union  \n" +
        "  \n" +
        " select me.code \n" +
        " from tempmaterialschild mc, tempmaterialsetalon me \n" +
        " where mc.tempetalonrefcode = me.code \n" +
        "   and mc.tempmaterialrefcode = ? \n" +
        " ) \n" +
        " and nm.nomenclaturerefcode = n.code \n" +
        "  \n" +
        " union  \n" +
        "  \n" +
        " select n1.code, n1.mat_id, n1.nn, n1.name, n1.measurementname   \n" +
        " from tempnomenclatures n1 \n" +
        " where n1.parentrefcode in \n" +
        " ( \n" +
        "   select n.code  \n" +
        "   from tempnomenclaturs2mtrls nm, tempnomenclatures n \n" +
        "   where nm.materialetalonrefcode in \n" +
        "   ( \n" +
        "   select me.code \n" +
        "   from tempmaterialsetalon me \n" +
        "   where me.tempmaterialrefcode = ? \n" +
        "  \n" +
        "   union  \n" +
        "  \n" +
        "   select me.code \n" +
        "   from tempmaterialschild mc, tempmaterialsetalon me \n" +
        "   where mc.tempetalonrefcode = me.code \n" +
        "     and mc.tempmaterialrefcode = ? \n" +
        "   ) \n" +
        "   and nm.nomenclaturerefcode = n.code \n" +
        " ) " +
        " ) w where w.nn = ?"; */

        String sql = " select w.code, w.mat_id, w.nn, w.name, w.measurementname from \n" +
        " tempnomenclatures w \n" +
        " where w.materialrefcode = ? \n" +
        " and w.nn =  ? \n";

        try {

            statement = connection.prepareStatement(sql);

            statement.setInt(1, materialCode);
           // statement.setInt(2, materialCode);
           // statement.setInt(3, materialCode);
           // statement.setInt(4, materialCode);
            statement.setString(2, nn);

            set = statement.executeQuery();
            out = set.next();

            System.out.println("#### ww = " + out);

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e);
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

        return out;
    }

    public int getDepartmentByEstimateItemCode(int estimateItemCode)
    {
		if (estimateItemCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nНе вказано estimateItemCode!");
		}

    	try
    	{
    		String sql =  String.format("SELECT PW.%s FROM %s as ES \n " +
    				 "INNER JOIN %s as PW on ES.%s = PW.%s \n " +
    				 "where ES.%s = ? \n ", ENPlanWork.departmentRef_Field
    				 , ENEstimateItem.tableName, ENPlanWork.tableName
    				 , ENEstimateItem.planRef_Field, ENPlanWork.code_Field, ENEstimateItem.code_Field);
    		Vector<Integer> vec = new Vector<>();
    		vec.add(estimateItemCode);
    		Integer departmentCode = BaseDAOUtils.executeStatementAndReadObject(connection, sql, vec, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    		if(departmentCode == null || departmentCode == Integer.MIN_VALUE) {
    			throw new SystemException(String.format("Помилка при визначенні підрозділу для матеріалу з кодом %d", estimateItemCode));
    		}
    		return departmentCode;

    	} finally {

		}
    }


    /**
     *  Возвращает код группы материала
     *
     *  @param nn - номенклатура
     *
     *  @return materialGroupCode - код группы материала
     */
	public int getMaterialGroupCode(String nn) {

		int materialGroupCode = Integer.MIN_VALUE;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String sql = "select p.code from tkmaterials p where p.code = (" +
        		" select t.parentrefcode from tkmaterials t where t.code = (" +
        		" select w.materialrefcode from tempnomenclatures w where w.nn = ? ))";

        try {

            statement = connection.prepareStatement(sql);
            statement.setString(1, nn);

            resultSet = statement.executeQuery();

			while (resultSet.next()) {
				materialGroupCode = resultSet.getInt(1);
			}

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e);
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
        }

        return materialGroupCode;
    }

    /**
     *  Возвращает код нормативного материала по номеру номенклатуры
     *
     *  @param nn - номер номенклатуры
     *
     *  @return код нормативного материала
     */
	public int getTKMaterialCodeByNN(String nn)
	{
		int materialCode = Integer.MIN_VALUE;

        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String sql = "select n.materialrefcode from tempnomenclatures n where n.nn = ?";

        try {

            statement = connection.prepareStatement(sql);
            statement.setString(1, nn);

            resultSet = statement.executeQuery();

			while (resultSet.next()) {
				materialCode = resultSet.getInt(1);
			}

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e);
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
        }

        return materialCode;
	}

    /**
     * Проверка, является ли материал в плане топливом
     *
     * @param estimateItemCode - код материала из плана
     *
     * @return true - если это топливо, иначе - false
     */
    public boolean isFuel(int estimateItemCode)
    {
		try
		{
	        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);

	        ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
	        eiFilter.code = estimateItemCode;
	        eiFilter.conditionSQL = "ENESTIMATEITEM.materialrefcode in (select ft.materialrefcode from tkfueltype ft) and " +
	                                "ENESTIMATEITEM.kindrefcode in (" + ENEstimateItemKind.MATERIALS + ", " + ENEstimateItemKind.GSM + ")";

	    	int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);

	    	return (eiArr.length > 0);
		}
		catch (PersistenceException e)
		{
			throw new EnergyproSystemException(e.getMessage(), e);
		}
    }


	 /**
     * NET-4445 - возвращает код естимейта с месячного плана по инвентарному и по num_un старого состояния счетчика (тот который выбирали в sccounter при перемещении на кладовщика)
     *          - используется для формирования строк на перемещение счетчика с кладовщика реса на мастера по счету 1533.
     *          --  С проверкой если не нашли такой план то ругаемся ,
     *              если нашли план но МОЛ на плане не совпадает с молом получателя на ордере , то ругаемся
     *
     * */
	public int getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(ENMetrologyCounter sc,String molOutCode){

		SCCounterDAO scDAO = new SCCounterDAO(connection, userProfile);
		ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
	    ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
	    ENEstimateItem2ENEstimateItemDAO esesDao = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
	    ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(connection, userProfile);

		try {

        SCLogicDAO scLogicDAO = new SCLogicDAO(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

        SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
        		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

	    int estimateItemCode = Integer.MIN_VALUE;

		SCCounterFilter scFilter = new SCCounterFilter();
		scFilter.account = RQConsts.SCCOUNTER_PARAMETERIZED_MULTIFUNCTIONAL_COUNT;
		///scFilter.molCode = "1814";
		scFilter.kindRef.code = SCCounterKind.FOR_MOVED;
		scFilter.invNumber = sc.invNumber;
		scFilter.scCode = scLogicDAO.getParentNumUn(sc.scCode);
		scFilter.statusRef.code = SCCounterStatus.GOOD;

		// SUPP-63237 ограничивание выборки - выбираются только передачи на договора
		//, а не на стандартный план под перемещение счетчика
		scFilter.conditionSQL = SCCounter.estimateItemRef_QFielld + " not in (?,?)";
		// SUPP-75207 не выбираются отмененные услуги
		scFilter.conditionSQL += String.format(" and not exists (select 1 from %s as es1 ", ENEstimateItem.tableName)
				+ String.format(" inner join %s as pw1 on es1.%s = pw1.%s", ENPlanWork.tableName, ENEstimateItem.planRef_Field, ENPlanWork.code_Field)
				+ String.format(" inner join %s as so1 on pw1.%s = so1.%s", ENServicesObject.tableName, ENPlanWork.elementRef_Field, ENServicesObject.element_Field)
				+ String.format(" where es1.%s = %s and so1.%s in (?, ?, ?))", ENEstimateItem.code_Field, SCCounter.estimateItemRef_QFielld, ENServicesObject.contractStatusRef_Field);

		// SUPP-67012 Будем делать выборку не только по МОЛ 1814, но и по всем 18 МОЛам


		Vector<Object> binded = new Vector<>();
		binded.add(ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1);
		binded.add(ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3);

		// SUPP-75207 не выбираются отмененные услуги
		binded.add(ENServicesContractStatus.TERMINATED);
		binded.add(ENServicesContractStatus.CANCELED);
		binded.add(ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES);

		int[] scArr = scDAO.getFilteredCodeArray(scFilter, 0, -1, binded);
		// SUPP-47167 Если при заключении договора нашли счетчик в РЕСе то его тоже могут передавать (если нашли например на кладовщике то передают на мастрера)
		// поэтому если scArr пустой по условию выше , то ищем зарезервированный счетчик под еслитейт кошториса с локом 7 . на том же моле что и передает = мол ин на ордере.
		if (scArr.length == 0 ){
			ENMetrologyCounterFilter filter = new ENMetrologyCounterFilter();
			filter.invNumber = sc.invNumber;
			ENMetrologyCounterShortList counterList = scLogic.getCountersListFromScanCounter(filter, 0, -1);
			if(counterList.totalCount > 0) {
				if(counterList.totalCount != 1) {
					/*throw new SystemException(String.format("Помилка у кількості лічильників для інвентарного № %s: %d"
							, sc.invNumber, counterList.totalCount))*/ return estimateItemCode;
				}
			}

			if(counterList.get(0).enestimateItemCode != Integer.MIN_VALUE
					&& counterList.get(0).lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK) {
				ENEstimateItem2ENEstimateItemFilter esesFilter = new ENEstimateItem2ENEstimateItemFilter();
				esesFilter.estimateItemInRef.code = counterList.get(0).enestimateItemCode;

				ENEstimateItem2ENEstimateItemShortList esesList = esesDao.getScrollableFilteredList(esesFilter, 0, -1);

				if(esesList.totalCount > 0) {
					if(esesList.totalCount != 1) {
						/*throw new SystemException(String.format("Помилка у кількості матеріалів на плані для інвентарного № %s: %d"
								, sc.invNumber, esesList.totalCount))*/return estimateItemCode;
					}
					estimateItemCode = esesList.get(0).estimateItemOutRefCode;
				}
			}
		}
		// типа не нашли sccounter по которой перемещали на кладовщика
		if (scArr.length == 0 && estimateItemCode == Integer.MIN_VALUE) {
			if(!scLogic.isVrtu(sc.invNumber)) {
				/*throw new EnergyproSystemException("\n NET-4445. Помилка sccounter=0 при визначенні плана під який потрібно передати лічильник !!! " +
						" \n  Інв № лічильника  " +  sc.invNumber );*/
				//// SUPP-89815 не нужно ругаться, а вернуть код естимейта общий 1 фазного или 3 фазного,  если уже и фазность не нашли то ругня
				int phasity = scLogic.getPhasity(sc.invNumber);
				if(phasity == 1) {
					return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1;
				} else if(phasity == 3) {
					return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3;
				} else throw new SystemException(String.format("Помилка у фазності (%d) для лічильника № %s", phasity, sc.invNumber));
			} else {
				if(sc.phasity == 1) {
					return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1;
				} else if(sc.phasity == 3) {
					return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3;
				} else
					{
						int phasity = scLogic.getPhasity(sc.invNumber);
						if(phasity == 1) {
							return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_1;
						} else if(phasity == 3) {
							return ENConsts.ENESTIMATEITEM_COUNTERS_PHASITY_3;
						} else /*throw new SystemException(String.format("Помилка у фазності (%d) для лічильника № %s", phasity, sc.invNumber))*/ return estimateItemCode;
					}
			}

		}
		if(estimateItemCode == Integer.MIN_VALUE) {
			SCCounter scObj = scDAO.getObject(scArr[0]);
			estimateItemCode = scObj.estimateItemRef.code;
		}


		/* ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
		eiFilter.code = estimateItemCode;

		int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
		ENEstimateItem eiObj = eiDAO.getObject(eiArr[0]);

		ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
		pFilter.code = eiObj.planRef.code;
		pFilter.kind.code = ENPlanWorkKind.CURRENT;

		int[] pArr = pDAO.getFilteredCodeArray(pFilter, 0, -1);
		if(pArr.length == 0){
			throw new EnergyproSystemException("\n NET-4445. Помилка pcode=0 при визначенні плана під який потрібно передати лічильник !!! " +
					" \n  Інв № лічильника  " +  sc.invNumber );
		}

		ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
		m2pFilter.planRef.code = pArr[0];

		ENMOL2PlanWorkShortList m2pList = m2pDAO.getScrollableFilteredList(m2pFilter, 0, -1);

		if(m2pList.totalCount == 0 ){
			throw new EnergyproSystemException("\n На плані з кодом (" + pArr[0] + ") для якого передається лічильник Інв № "+ sc.invNumber +" вкажіть МОЛ для рознарядки !!! " );
		}

		// если не совпадают МОЛ ы на плане и на расходном ордере то поругаемся что бы не отправить счетчику ни к тому МОЛ у
		if (!m2pList.get(0).molCode.equals(molOutCode) && pArr[0] != 0 ){
			throw new EnergyproSystemException("\n NET-4445. МОЛ отримувач("+ molOutCode +") на видатковому ордері не співпадає " +
		         " з МОЛ-ом на плані("+ m2pList.get(0).molCode +") під який передаеться лічильник(код плана "+pArr[0]+")   " +
					" \n  Інв № лічильника  " +  sc.invNumber );
		}*/


		return estimateItemCode;
		} catch (Exception e) {
            throw new EnergyproSystemException(e);
        }
	}


	/** по перечню естимейтов без привязки к договорам  создаем  проект договора на закупку со спецификацией . */
	public void estimateWithoutContractAdd2SpecificationExecute(ENEstimateItemShort[] eiList) {

		try {

			ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
			ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
			ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
			TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
			ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
			RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
			RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);
			RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
			RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
			RQPurchaseItemTender2RQPurchaseItemDAO itt2itDAO = new RQPurchaseItemTender2RQPurchaseItemDAO(connection, userProfile);
			RQPurchaseItemTender2EnContractDAO pi2contractDAO = new RQPurchaseItemTender2EnContractDAO(connection, userProfile);
			RQPurchaseItemDAO itemDAO = new RQPurchaseItemDAO(connection, userProfile);
			RQOrgDAO rqOrgDAO = new RQOrgDAO(userProfile, connection);
			PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);


			docConnection = getDOCConnection();


			DFSpecificationItemDAO dfSpecItemDAO = new DFSpecificationItemDAO(docConnection, userProfile);
			DFSpecification2AgreeDAO dfSpec2agrDAO = new DFSpecification2AgreeDAO(docConnection, userProfile);
			DFSpecItem2ENEstimateDAO dfSpecItem2eiDAO = new DFSpecItem2ENEstimateDAO(docConnection, userProfile);
			DFDocAgreementDAO agreeDAO = new DFDocAgreementDAO(docConnection, userProfile);
			DFDocDAO docDAO = new DFDocDAO(docConnection, userProfile);


			  ENContract contractObj = contractDAO.getObject(eiList[0].enContractCode);

			  if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
	            	  throw new EnergyproSystemException("\n Додавання материалів неможливо. Це не проект договору !!!");
	           }

			  /// <<<<<<<<<<<<<<<статус проекта договора
			  {
				  DFSpecification2AgreeFilter dfSpec2agrFil = new DFSpecification2AgreeFilter();
			      dfSpec2agrFil.enContractCode = contractObj.code;

			  DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFil, 0, -1);
			  if (dfSpec2agrList.totalCount != 0){

					  DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);

					  DFDocFilter dfdocFil = new DFDocFilter();
				              dfdocFil.conditionSQL =   " dfdoc.code = ( select doc.code from docflow.DFSpecification2Agree spc2agr , docflow.dfdocagreement agr , docflow.dfdoc doc " +
																  " where spc2agr.encontractcode = " +   contractObj.code +
																  " and spc2agr.agreerefcode = agr.code " +
																  " and agr.doccode = doc.code ) " ;
				              DFDocShortList docList = docDAO.getScrollableFilteredList(dfdocFil, 0, -1);

				              DFDoc docObj = null;
				              if (docList.totalCount != 0){
				            	  docObj = docDAO.getObject(docList.get(0).code);
							   if (docObj.statusRef.code != DFDocStatus.DRAFT){
								   throw new EnergyproSystemException("\n Матеріал додається тільки якщо проект договору чорновий !!!");
							   }
					    }
                }
			  }
			 ////>>>>>>>>>>>>>>	  статус проекта договора

			  RQOrgDAO finOrgDao = new RQOrgDAO(userProfile, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));


			  if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
				  throw new EnergyproSystemException("\n Створювати спеціфікацію можливо тільки для проекту договору!!!");
			  }

			  if (eiList[0].materialRefCode == Integer.MIN_VALUE) {
				  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
			  }

			  RQPurchaseItemFilter itemFilter = new RQPurchaseItemFilter();
			  itemFilter.conditionSQL = " rqpurchaseitem.code = ( select distinct qqq.purchaseitemrefcode from rqpurchaseitem2estmttm qqq where qqq.code = "+ eiList[0].purchaseItem2EstimateitemCode +" ) " ;
			  RQPurchaseItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

			  RQPlanPurchase purchaseObj = pDAO.getObject(itemList.get(0).purchaseRefCode);

			  if (purchaseObj.statusRef.code !=RQConsts.RQPLANPURCHASE_STATUS_APPROVED ) {
				  throw new EnergyproSystemException("\n Додавати матеріал у класифікацію можливо коли план закупівель \"Затверджений\" ");
			}

			  OrderLogic ol = new OrderLogic(connection, userProfile);
			  BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
		      BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

			  TKMaterials mObj = mDAO.getObject(eiList[0].materialRefCode);

			  if(mObj.cost == null){
				  throw new EnergyproSystemException(" \n  Для " + mObj.name +" не вказана ціна у довіднику матеріалів !!!!  ");
			  }

			  ENEstimateItemShort[] eiListCheck = eiList;


			  // связка  сгрупированной строки (итем тендер ) с договором к котому подвязываем естимейты
              RQPurchaseItemTender2RQPurchaseItemFilter itt2itFilter = new RQPurchaseItemTender2RQPurchaseItemFilter();
              itt2itFilter.conditionSQL  =  "  rqprchstmtndr2rqprchst.purchaseitemrefcode in ( select qqq.purchaseitemrefcode from rqpurchaseitem2estmttm qqq where qqq.code = "+ eiList[0].purchaseItem2EstimateitemCode +" ) ";
              RQPurchaseItemTender2RQPurchaseItemShortList itt2itList = itt2itDAO.getScrollableFilteredList(itt2itFilter, 0, -1);
              for (int it = 0; it < itt2itList.totalCount; it++) {

              	 /*if (contractObj.purchaseItemTender.code != itt2itList.get(it).purchaseItemTenderRefCode || contractObj.purchaseItemTender.code == Integer.MIN_VALUE  ){
              		 contractObj.purchaseItemTender.code = itt2itList.get(it).purchaseItemTenderRefCode;
              		 contractDAO.save(contractObj);
              	 }*/
              	RQPurchaseItemTender2EnContractFilter pi2contractFil = new RQPurchaseItemTender2EnContractFilter();
              	pi2contractFil.contractRef.code = contractObj.code;
              	pi2contractFil.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;

              	int[] pi2contractArr = pi2contractDAO.getFilteredCodeArray(pi2contractFil, 0, -1);
	              	if ( pi2contractArr.length == 0   ){
	              		RQPurchaseItemTender2EnContract pi2contractObj = new RQPurchaseItemTender2EnContract();
	              		pi2contractObj.contractRef.code = contractObj.code;
	              		pi2contractObj.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;
	              		pi2contractObj.userGen = userProfile.userName;
	              		pi2contractDAO.add(pi2contractObj);
	              	}
				}

                 int eilistcount = 1;
			   for (int i = 0; i < eiList.length; i++) {
	        	 System.out.print(" estimateWithoutContractAdd2SpecificationExecute estimatecode = " + eiList[i].code   + " eilistcount = " + eilistcount++);


	        	   RQPurchaseItem2EstimateItem pi2eiObj = pi2eiDAO.getObject(eiList[i].purchaseItem2EstimateitemCode);

	        	   ENEstimateItem2ContractFilter e2cFilter = new ENEstimateItem2ContractFilter();
	        	   e2cFilter.estimateItem.code = eiList[i].code;

	        	   int[] ei2ctArr = e2cDAO.getFilteredCodeArray(e2cFilter, 0, -1);
	        	   if (ei2ctArr.length > 0 ) {
	        		   ENEstimateItem2Contract e2cObj = e2cDAO.getObject(ei2ctArr[0]);
	        		   throw new EnergyproSystemException("\n Матеріал вже доданий до договору    " + e2cObj.contractNumber  );
				}

	           	    ENEstimateItem eiObj = eiDAO.getObject(eiList[i].code);

	           	 if (eiObj.countFact == null)   {
	           		throw new EnergyproSystemException("\n Невизначено кількість матеріалу для прив`язки!!! ");
	           	 }
	           	 if ( eiObj.countFact.doubleValue() == 0 )
		        		throw new EnergyproSystemException("\n Невизначено кількість матеріалу для прив`язки!!! ");

    	        	//  спецификация на стороне EnergyNEt
	        	   	ENEstimateItem2Contract e2c = new ENEstimateItem2Contract();


	        	   	RQOrgFilter orgFilter = new RQOrgFilter();
					orgFilter.codeorg = contractObj.org.codeorg;
					RQOrgShortList orgList = finOrgDao.getRQOrgList(orgFilter, 0, -1);

					if (orgList.totalCount > 0) {
						RQOrg org = rqOrgDAO.makeObjectFromShort(orgList.get(0));
						int orgCode = rqOrgDAO.add(org);

						e2c.org.code = orgCode;

						//e2c.org.code = orgList.get(0).code; !!!!!!!!!!!!!! нужно потом так сделать, что б не плодились орги
					}

	                e2c.contractDate = contractObj.contractDate;
	                e2c.contractNumber = contractObj.contractNumber;
	                e2c.finDocCode = contractObj.finDocCode;
	                e2c.finDocID = contractObj.finDocID;
	                e2c.estimateItem.code = eiList[i].code;
	                e2c.countFact = eiObj.countFact;
	                e2c.rqPurchItm2Estimate.code = eiList[i].purchaseItem2EstimateitemCode;

	                e2cDAO.add(e2c);

	                ENContractItemFilter contractItemFilter = new ENContractItemFilter();
	                contractItemFilter.material.code = eiObj.materialRef.code;
	                contractItemFilter.contract.code = eiList[i].enContractCode;

	                ENContractItemShortList contractItemList = contractItemDAO.getScrollableFilteredList(contractItemFilter, 0, -1);
	                if (contractItemList.totalCount>0 ){
	                	ENContractItem contractItemObj = contractItemDAO.getObject(contractItemList.get(0).code);
	                	contractItemObj.countGen = contractItemObj.countGen.add(eiObj.countFact);
	                	contractItemObj.countReal = contractItemObj.countReal.add(eiObj.countFact);
	                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
	                	contractItemDAO.save(contractItemObj);


	                } else
	                {
	                	ENContractItem contractItemObj = new ENContractItem();
	                	contractItemObj.countGen = eiObj.countFact;
	                	contractItemObj.countReal = eiObj.countFact;
	                	contractItemObj.price = mObj.cost;
	                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
	                	contractItemObj.material.code = eiList[i].materialRefCode;
	                    contractItemObj.contract.code = 	eiList[i].enContractCode;
	                    contractItemDAO.add(contractItemObj);

	                }




		        	// /// спецификация на стороне docFlow
	                // найти нужно строку  спецификации договора в docFlow

	                DFSpecification2AgreeFilter dfSpec2agrFilter = new DFSpecification2AgreeFilter();
	                dfSpec2agrFilter.enContractCode = eiList[i].enContractCode;
	                DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFilter, 0, -1);
	                if (dfSpec2agrList.totalCount == 0 ){
	                	throw new EnergyproSystemException("\n Помилка при визначенні специфікації для договору DocFlow!!! \n Відсутня специфікація");
	                }
	                DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);


	                DFSpecificationItemFilter dfSpecItemFilter = new DFSpecificationItemFilter();
	                dfSpecItemFilter.materialCode = eiList[i].materialRefCode;
	                dfSpecItemFilter.specificationRef.code = dfSpec2agrObj.code;
	                DFSpecificationItemShortList dfSpecItemList =  dfSpecItemDAO.getScrollableFilteredList(dfSpecItemFilter, 0,-1);

	                if(dfSpecItemList.totalCount > 1){
	                	throw new EnergyproSystemException("\n Помилка визначення специфікації у DocFlow \n Кількість більше 1 !!!" );
	                }

	                int dfSpecItemCode = Integer.MIN_VALUE;

	                if (dfSpecItemList.totalCount > 0){
	                	dfSpecItemCode = dfSpecItemList.get(0).code;
	                }

				// если нет строки с материалом в  спецификации,  то создадим
				if (dfSpecItemCode == Integer.MIN_VALUE) {

					DFSpecificationItem dfSpecItemObj = new DFSpecificationItem();
					dfSpecItemObj.code = Integer.MIN_VALUE;
					dfSpecItemObj.countFact = eiObj.countFact;
					dfSpecItemObj.identid2010 = mObj.identid2010;
					dfSpecItemObj.identid2015 = mObj.identid2015;
					dfSpecItemObj.materialCode = mObj.code;
					dfSpecItemObj.materialName = mObj.name;
					dfSpecItemObj.measurement = mObj.measurement.name;
					dfSpecItemObj.priceWithoutNds = mObj.cost;
					dfSpecItemObj.priceWithNds = mObj.cost.multiply(nds_coeff).setScale(2, BigDecimal.ROUND_HALF_UP);
					dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
					dfSpecItemObj.sumWithNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);
					dfSpecItemObj.specificationRef.code = dfSpec2agrObj.code;
					dfSpecItemCode = dfSpecItemDAO.add(dfSpecItemObj);

				} else {
					DFSpecificationItem dfSpecItemObj = dfSpecItemDAO.getObject(dfSpecItemCode);

					dfSpecItemObj.countFact = dfSpecItemObj.countFact.add(eiObj.countFact);
					dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
					dfSpecItemObj.sumWithNds =  dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).multiply(nds_coeff). setScale(2, BigDecimal.ROUND_HALF_UP);
					dfSpecItemDAO.save(dfSpecItemObj);
				}

				// ++++++++++ обновить инфо товара на спецификации
				DFSpecificationItemShortList shrListForMatrlLSummary = 	 dfSpecItemDAO.getMaterialsListSummaryByRows(dfSpec2agrObj.code) ;
				if(shrListForMatrlLSummary.totalCount > 0 ){
					dfSpec2agrObj.materialsList =  shrListForMatrlLSummary.get(0).materialName;
					dfSpec2agrDAO.save(dfSpec2agrObj);
				}



	                DFSpecItem2ENEstimate dfSpecItem2ei = new DFSpecItem2ENEstimate();

	                dfSpecItem2ei.code = Integer.MIN_VALUE;
	                dfSpecItem2ei.materialCode = eiList[i].materialRefCode;
	                dfSpecItem2ei.enEstimateItemCode = eiList[i].code;
	                dfSpecItem2ei.countGen = eiObj.countFact;
	                dfSpecItem2ei.specificationItemRef.code = dfSpecItemCode;
	                dfSpecItem2eiDAO.add(dfSpecItem2ei);



	                /** проставить ссылки на строки спецификации и записать номер проекта договора на  строках заявок - если естимейты висят в заявках  */
	                // проверка - по естимейту выберем строку заявки , потом идем по естимейтам кторые относятся к этой строке заявки и проверяем есть ли этот естимейт в списке
	                // который передается с клиента . если нашли хоть один естимейт который есть в строке заявки , но его нет в переданном списке естимейтов. то ругаемся на то что мы
	                // не можем часть строки заявки сделать под договор а часть нет . т.к выбраны не все естимейты в строке заявки для формирования по ним спецификации с проектом договра .

	                RQOrderItem2ENEstimateItemFilter oi2eiFil = new RQOrderItem2ENEstimateItemFilter();
	                oi2eiFil.statusRef.code = RQOrderItem2ENEstimateItemStatus.GOOD;
	                oi2eiFil.conditionSQL = " rqorderitem2enestimttm.orderitemcode = ( select qqq.orderitemcode from rqorderitem2enestimttm qqq where qqq.estimateitemcode = " +  eiList[i].code   +"	)";

	                RQOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFil, 0, -1);

				    for (int j = 0; j < oi2eiList.totalCount; j++) {
				                	boolean isFindEi = false;
				                	for (int k = 0; k < eiListCheck.length; k++) {

				                		if(oi2eiList.get(j).estimateItemCode == eiListCheck[k].code){
				                			isFindEi = true;
				                		}

				                	}

				                	if (!isFindEi){
				                		RQOrderItem oiObj = oiDAO.getObject(oi2eiList.get(j).orderItemCode);
				                		RQOrder oObj = oDAO.getObject(oiObj.orderRef.code);
				                		ENEstimateItem eiiObj = eiDAO.getObject(oi2eiList.get(j).estimateItemCode);

				                		throw new EnergyproSystemException("\n Часткове додавання позицій матеріалу із строки заявки неможливо (заявка№  " + oObj.numberDoc  +" , строка заявки = " + oiObj.materialNameGen + " " + oiObj.ddsCodes + "  кількість =" + oiObj.countFact + "). \n " +
				                		"  \n Матеріал "+ oiObj.materialNameGen + " з плану  (ун.код плану = "+ eiiObj.planRef.code +" , код матеріалу з плану = "+ eiiObj.code + " кількість у плані =  " + eiiObj.countFact
				                				+ ") потрібно теж вибрати для додавання в специфікацію"  );
				                	}

				    }


	                RQOrderItem2ENEstimateItemFilter oi2eiFil22 = new RQOrderItem2ENEstimateItemFilter();
	                oi2eiFil22.statusRef.code = RQOrderItem2ENEstimateItemStatus.GOOD;
	                oi2eiFil22.conditionSQL = " rqorderitem2enestimttm.orderitemcode = ( select qqq.orderitemcode from rqorderitem2enestimttm qqq where qqq.estimateitemcode = " +  eiList[i].code   +" limit 1 	) ";
	                // RQOrderItem2ENEstimateItemShortList oi2eiList22 = oi2eiDAO.getScrollableFilteredList(oi2eiFil22, 0, -1);
	                int[] oi2eiArr22 = oi2eiDAO.getFilteredCodeArray(oi2eiFil22, 0, -1 );

	                if (oi2eiArr22.length > 0 ) {
	                	RQOrderItem2ENEstimateItem oi2eiObj = oi2eiDAO.getObject(oi2eiArr22[0]);
			                // на строке заявки - при условии что она есть . ставим ун.код. спецификации и код проекта договора
			                RQOrderItem oiObj =  oiDAO.getObject(oi2eiObj.orderItem.code);
			                RQOrderItem oldOiObj = oiDAO.getObject(oi2eiObj.orderItem.code);

			                DFDocAgreement agree = agreeDAO.getObject(dfSpec2agrObj.agreeRef.code);
			    			String agreeDocNum = docDAO.getObject(agree.doc.code).docNum;

			    			// если на заявке уже есть код проекта договора то проверим что бы другим договором не перетерли
			    			if (oiObj.agreeDocNum != null ){
				    			if (!oiObj.agreeDocNum.equals("") &&  !oiObj.agreeDocNum.equals(agreeDocNum)  ){
				    				throw new EnergyproSystemException("\n Строка  заявки ун.код = " + oiObj.code + " включено до іншого проекту договору (" + oiObj.agreeDocNum + ")"  );
				    			}
				    			}

			                oiObj.specificationCode = dfSpec2agrObj.code;
			    			oiObj.agreeDocNum = agreeDocNum;

			    			// на строке заявки проставим код строки плана закупок к которой он подвязан - - - если его нет т.к может сначала сформироваться заявка а потом сформироваться план закупок
			    			if(oiObj.purchaseItemRef.code == Integer.MIN_VALUE)
			    			{
			    			  oiObj.purchaseItemRef.code = pi2eiObj.purchaseItemRef.code;
			    			}

			    			if (       oldOiObj.specificationCode != oiObj.specificationCode
			    					|| !oldOiObj.agreeDocNum.equals(oiObj.agreeDocNum)
			    					|| oldOiObj.purchaseItemRef.code != oiObj.purchaseItemRef.code)
			    			{
			    				oiDAO.save(oiObj);
			    			}
	                }



			}

               // материал (естимейт) который добавляем в проект договора или договор можно его исключить из плана закупки если он находится в черновом плане закупок
               // функция - по естимейту внутри делает отвязку количества которое попадет на закупки и пересчет строк закупки детальной и строки предмета закупки +

            /*   RQPurchaseItem2EstimateItemShort[] purchItem2eiList = new RQPurchaseItem2EstimateItemShort[eiList.length];
               for (int ei = 0; ei < eiList.length; ei++) {

               	purchItem2eiList[ei] = pi2eiDAO.getShortObject(eiList[ei].purchaseItem2EstimateitemCode);
               }

               // если статус плана закупки черновой то уменьшим кол-во "Згідно плану закупівлі " для строки rqpurchaseitem

	               RQPlanPurchaseFilter pFil = new RQPlanPurchaseFilter();
	               pFil.conditionSQL = " rqplanpurchase.code = ( select p.code  from rqplanpurchase p \n" +
	            		   " , rqpurchaseitem pi  , rqpurchaseitem2estmttm pi2ei \n" +
	            		   " where p.code = pi.purchaserefcode \n" +
	            		   " and pi.code = pi2ei.purchaseitemrefcode  \n" +
	            		   " and pi2ei.code = "+  eiList[0].purchaseItem2EstimateitemCode +" ) \n";

	               RQPlanPurchaseShortList pList = pDAO.getScrollableFilteredList(pFil, 0, -1);

	               if (pList.totalCount == 0 ){
	            	   throw new EnergyproSystemException("\n Помилка при визначенні плану закупівлі !!! "  );
	               }

	               if (pList.get(0).statusRefCode == RQConsts.RQPLANPURCHASE_STATUS_DRAFT){
	            	   purchaseLogic.notAccountMaterialsForPurchase(purchItem2eiList);
	               } */


		} catch (SystemException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeDOCConnection();
		}
	}


	public BigDecimal getEstimateCountByTechCard(int estimateItemCode)
	{
		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

			ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemCode);

			if (estimateItem == null)
			{
				throw new SystemException("\n\n Не знайдено матеріал у плані! Код матеріала з плану: " + estimateItemCode);
			}

			if (estimateItem.planItemRef == null)
			{
				throw new SystemException("\n\n Не має прив'язки до роботи у матеріала з плану! Код матеріала з плану: " + estimateItemCode);
			}

			if (estimateItem.planItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\n Не має прив'язки до роботи у матеріала з плану! Код матеріала з плану: " + estimateItemCode);
			}

			ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			TKTechCardDAO techCardDAO = new TKTechCardDAO(connection, userProfile);

			ENPlanWorkItem planItem = planItemDAO.getObject(estimateItem.planItemRef.code);

			if (planItem == null)
			{
				throw new SystemException("\n\n Не знайдено роботу з кодом " + estimateItem.planItemRef.code + " !");
			}

            ENEstimateItemData data = getTKMaterialDataByTechCard(estimateItem.materialRef.code, planItem.kartaRef.code);

            if (data == null)
            {
            	throw new SystemException("\n\n Не знайдено даних у Техкартах для матеріала з плану! Код матеріала з плану: " + estimateItemCode);
            }

            return data.materialCount;
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}

	}

	/** отвязка перечня естимейтов от договоров (реальные договора или проекты договоров  )
	 *
	 * -- если отвязываем естимейт от проекта договора то пересчитаем спецификацию по материалу в energynet и docflow  и строку плана закупок  или изменений предмета закупки к которой относятся эстимейты
	 * тоже нада пересичитать если план закупок  или изменения еще черновые .*/
	 public void estimate2ProjectAgreeUnlink(ENEstimateItemShort[] eiList){
		   try {

			   ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
			   ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
			   ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
			   TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
			   ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			   RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
			   RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
			   RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);


			   docConnection = getDOCConnection();

			  DFSpecificationItemDAO dfSpecItemDAO = new DFSpecificationItemDAO(docConnection, userProfile);
			  DFSpecification2AgreeDAO dfSpec2agrDAO = new DFSpecification2AgreeDAO(docConnection, userProfile);
			  DFSpecItem2ENEstimateDAO dfSpecItem2eiDAO = new DFSpecItem2ENEstimateDAO(docConnection, userProfile);
			  DFDocAgreementDAO agreeDAO = new DFDocAgreementDAO(docConnection, userProfile);
			  DFDocDAO docDAO = new DFDocDAO(docConnection, userProfile);

			  BillLogic billLogic =  new BillLogic(userProfile, connection);

			  ENContract contractObj = contractDAO.getObject(eiList[0].enContractCode);

			  if (eiList[0].materialRefCode == Integer.MIN_VALUE) {
				  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
			  }

			  OrderLogic ol = new OrderLogic(connection, userProfile);
			  BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
		      BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

			  TKMaterials mObj = mDAO.getObject(eiList[0].materialRefCode);

			  ENEstimateItemShort[] eiListCheck = eiList;

			  DFSpecification2AgreeFilter dfSpec2agrFil = new DFSpecification2AgreeFilter();
			  dfSpec2agrFil.enContractCode = contractObj.code;

			  DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFil, 0, -1);
			  if (dfSpec2agrList.totalCount == 0){
				  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо!!! Помилка при визначенні договору DocFlow!!!");
			  }
			  DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);

			  DFDocFilter dfdocFil = new DFDocFilter();
              dfdocFil.conditionSQL =   " dfdoc.code = ( select doc.code from docflow.DFSpecification2Agree spc2agr , docflow.dfdocagreement agr , docflow.dfdoc doc " +
												  " where spc2agr.encontractcode = " +   contractObj.code +
												  " and spc2agr.agreerefcode = agr.code " +
												  " and agr.doccode = doc.code ) " ;
              DFDocShortList docList = docDAO.getScrollableFilteredList(dfdocFil, 0, -1);

              DFDoc docObj = null;
              if (docList.totalCount == 0){
            	  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо!!! Помилка при визначенні договору DocFlow!!!");
              } else
            	  docObj = docDAO.getObject(docList.get(0).code);

              if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
            	  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо. Це не проект договору !!!");
              }

  			// если проект договора уже какой то не черновой то не даем оттуда ничего отвязывать - статус берем из DOCFlow
			   if (docObj.statusRef.code != DFDocStatus.DRAFT && docObj.statusRef.code != DFDocStatus.CANCELED ){
				   throw new EnergyproSystemException("\n docObj.code = " + docObj.code  + " \n Прив`язка материалів до проекту договору відміняєтья тільки якщо проект договору чорновий !!!");
			   }

			   String codeOrderItemEarlierCheck = ""; // переменная с кодами строк заявок которые уже проверены на что что бы материалы из планов в них совпадали с выбранным перечнем для отмены привязки по договору
			   for (int i = 0; i < eiList.length; i++) {
		        	 System.out.print(" estimate2ProjectAgreeUnlink ... estimatecode = " + eiList[i].code);
		        	 // проверка на оплату по естимейту
		        	BigDecimal sumPayByEstimate = billLogic.getSumPayByEstimateitemCode(eiList[i].code);
		        	if(sumPayByEstimate.doubleValue() > 0){
		        		 throw new EnergyproSystemException("\n По матеріалу з кодом " + eiList[i].code + " була оплата!!! ");
		        	}
		        	 // отвяжем естимейты от проекта договора в енерджинете - encontractitem  ENEstimateItem2ContractFilter
		        	 ENEstimateItem2ContractFilter e2cFil = new ENEstimateItem2ContractFilter();
		        	 e2cFil.estimateItem.code = eiList[i].code;
		        	 e2cFil.rqPurchItm2Estimate.code = eiList[i].purchaseItem2EstimateitemCode;
		        	 e2cFil.finDocID = contractObj.finDocID;
		        	 int[] e2cArr = e2cDAO.getFilteredCodeArray(e2cFil, 0, -1);

		        	 for (int j = 0; j < e2cArr.length; j++) {
		        		 ENEstimateItem2Contract e2cObj = e2cDAO.getObject(e2cArr[j]);

		        		 // уменьшить кол-во на строке проекта договора
		        		 ENContractItemFilter contractItemFil = new ENContractItemFilter();
		        		 contractItemFil.material.code = mObj.code;
		        		 contractItemFil.contract.code = contractObj.code;

		        		 ENContractItemShortList contractItemlist = contractItemDAO.getScrollableFilteredList(contractItemFil, 0, -1);
		        		 for (int k = 0; k < contractItemlist.totalCount; k++) {
		        			 ENContractItem contractItemObj = contractItemDAO.getObject(contractItemlist.get(k).code);
		        			 contractItemObj.countGen = contractItemObj.countGen.subtract(e2cObj.countFact);
		        			 contractItemObj.countReal = contractItemObj.countGen.subtract(e2cObj.countFact);
		        			 // если кол-во в строке проекта договора нулевое то автоматом удалим строку проекта договора
		        			 if(contractItemObj.countGen.doubleValue() <= 0){
		        				 contractItemDAO.remove(contractItemObj.code);
		        			 } else {
		        			 contractItemDAO.save(contractItemObj);
		        			 }
						}

		        		 e2cDAO.remove(e2cObj.code);
					 }

		        	 // отвяжем естимейты и пересчитаем на стороне докфлов

		        	 DFSpecificationItemFilter  dfSpecItemFil = new DFSpecificationItemFilter();
		        	 dfSpecItemFil.specificationRef.code = dfSpec2agrObj.code;
		        	 dfSpecItemFil.materialCode = mObj.code;
		        	 DFSpecificationItemShortList dfSpecItemList = dfSpecItemDAO.getScrollableFilteredList(dfSpecItemFil, 0, -1);

		        	 if (dfSpecItemList.totalCount > 0) {
			        	 DFSpecItem2ENEstimateFilter dfSpecItem2eiFil = new DFSpecItem2ENEstimateFilter();
			        	 dfSpecItem2eiFil.enEstimateItemCode = eiList[i].code;
			        	 dfSpecItem2eiFil.specificationItemRef.code = dfSpecItemList.get(0).code;
			        	 DFSpecItem2ENEstimateShortList dfSpecItem2eiList = dfSpecItem2eiDAO.getScrollableFilteredList(dfSpecItem2eiFil, 0, -1);
			        	 for (int h = 0; h < dfSpecItem2eiList.totalCount; h++) {
			        		 DFSpecificationItem dfSpecItemObj = dfSpecItemDAO.getObject(dfSpecItemList.get(0).code);
	
			        		 dfSpecItemObj.countFact = dfSpecItemObj.countFact.subtract(dfSpecItem2eiList.get(h).countGen);
			        		 dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
							 dfSpecItemObj.sumWithNds =  dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).multiply(nds_coeff). setScale(2, BigDecimal.ROUND_HALF_UP);
	
			        		 dfSpecItem2eiDAO.remove(dfSpecItem2eiList.get(h).code);
	
			        		 if(dfSpecItemObj.countFact.doubleValue() <= 0){
			        			 dfSpecItemDAO.remove(dfSpecItemObj.code);
			        		 } else
			        		 {
			        			 dfSpecItemDAO.save(dfSpecItemObj);
			        		 }
			        	 }
		        	 }

		        	// ++++++++++ обновить инфо товара на спецификации
						DFSpecificationItemShortList shrListForMatrlLSummary = 	 dfSpecItemDAO.getMaterialsListSummaryByRows(dfSpec2agrObj.code) ;
						if(shrListForMatrlLSummary.totalCount > 0 ){
							dfSpec2agrObj.materialsList =  shrListForMatrlLSummary.get(0).materialName;
							dfSpec2agrDAO.save(dfSpec2agrObj);
						}

		       // если строка с материалом в заявке то проверить что бы все материалы которые в строке заявки тоже были выбраны для отмены привязки к проекту договора ....
						RQOrderItem2ENEstimateItemFilter oi2eiFil = new RQOrderItem2ENEstimateItemFilter();
						oi2eiFil.estimateItem.code = eiList[i].code;
						if(!codeOrderItemEarlierCheck.equals("")){
						oi2eiFil.conditionSQL = " orderitem.code not in ( " + codeOrderItemEarlierCheck + ")";
						}
						RQOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFil, 0, -1);


						if (oi2eiList.totalCount > 0){
							if (codeOrderItemEarlierCheck.equals("") ){
								codeOrderItemEarlierCheck = "" + oi2eiList.get(0).orderItemCode;
							} else
							{
								codeOrderItemEarlierCheck = codeOrderItemEarlierCheck.concat(","+ oi2eiList.get(0).orderItemCode) ;
							}

							RQOrderItem2ENEstimateItemFilter oi2eiFil2 = new RQOrderItem2ENEstimateItemFilter();
							oi2eiFil2.orderItem.code = oi2eiList.get(0).orderItemCode;
							RQOrderItem2ENEstimateItemShortList oi2eiList2= oi2eiDAO.getScrollableFilteredList(oi2eiFil2, 0, -1);

							for (int o = 0; o < oi2eiList2.totalCount; o++) {
								Boolean isFindEi = false;
								for (int k = 0; k < eiListCheck.length; k++) {
									if(oi2eiList2.get(o).estimateItemCode == eiListCheck[k].code){
			                			isFindEi = true;
			                		}
								}
								if (!isFindEi){
				                		RQOrderItem oiObj = oiDAO.getObject(oi2eiList2.get(o).orderItemCode);
				                		RQOrder oObj = oDAO.getObject(oiObj.orderRef.code);
				                		ENEstimateItem eiiObj = eiDAO.getObject(oi2eiList2.get(o).estimateItemCode);

				                		throw new EnergyproSystemException("\n Часткова відв`язка позицій матеріалу із строки заявки неможлива (заявка№  " + oObj.numberDoc  +" , строка заявки = " + oiObj.materialNameGen + " " + oiObj.ddsCodes + "  кількість =" + oiObj.countFact + "). \n " +
				                		"  Матеріал "+ oiObj.materialNameGen + " з плану  (ун.код плану = "+ eiiObj.planRef.code +" , код матеріалу з плану = "+ eiiObj.code
				                				+ ") потрібно теж вибрати для відв`язка від проекту договору"  );
			                	   }
							}

							// на строке заявки - при условии что она есть . ставим ун.код. спецификации и код проекта договора
			                RQOrderItem oiObj =  oiDAO.getObject(oi2eiList.get(0).orderItemCode);
			                oiObj.specificationCode = Integer.MIN_VALUE;
			    			oiObj.agreeDocNum = "";

			    			oiDAO.save(oiObj);

						}

			}

		} catch (SystemException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeDOCConnection();
		}

	}



	/**
	 * по перечню естимейтов привязывается к договору
	 */
	public void estimateWithoutContractLink2Contract(
			ENEstimateItemShort[] eiList, int enContractItemCode) {
		try {
			ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
			ENContractDAO contractDAO = new ENContractDAO(connection,userProfile);
			RQOrgDAO orgDAO = new RQOrgDAO(connection, userProfile);

			RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
			RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
			ENContractItem contractItemObj = contractItemDAO.getObject(enContractItemCode);
			ENContract contractObj = contractDAO.getObject(contractItemObj.contract.code);

			RQPurchaseItemTender2RQPurchaseItemDAO itt2itDAO = new RQPurchaseItemTender2RQPurchaseItemDAO(connection, userProfile);
			RQPurchaseItemTender2EnContractDAO pi2contractDAO = new RQPurchaseItemTender2EnContractDAO(connection, userProfile);

			PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);
			OrderItemLogic itemLogic = new OrderItemLogic(connection, userProfile);

			/** дополнение полями из АХ */
			RQOrg orgObj = orgDAO.getObject(contractObj.org.code);
			int newOrqCode = itemLogic.copyOrg(orgObj);
			RQOrg newOrg = orgDAO.getObject(newOrqCode);

			ENEstimateItem2Contract ei2ContractObj = new ENEstimateItem2Contract();
			newOrg.code = Integer.MIN_VALUE;
			ei2ContractObj.org.code = Integer.MIN_VALUE;

			ei2ContractObj.org.id = newOrg.id;
			ei2ContractObj.org.codeorg = newOrg.codeorg;
			ei2ContractObj.org.name = newOrg.name;
			ei2ContractObj.org.ukr_name = newOrg.ukr_name;
			ei2ContractObj.org.okpo = newOrg.okpo;
			ei2ContractObj.org.nalog_num = newOrg.nalog_num;
			ei2ContractObj.org.svidet_num = newOrg.svidet_num;
			ei2ContractObj.org.adr = newOrg.adr;
			ei2ContractObj.org.tel = newOrg.tel;
			ei2ContractObj.org.country = newOrg.country;
			ei2ContractObj.org.region = newOrg.region;
			ei2ContractObj.org.ministry = newOrg.ministry;
			ei2ContractObj.org.ownership = newOrg.ownership;
			ei2ContractObj.org.type = newOrg.type;
			ei2ContractObj.org.master_code = newOrg.master_code;
			ei2ContractObj.org.date_svidet = newOrg.date_svidet;
			ei2ContractObj.org.likv_date = newOrg.likv_date;
			ei2ContractObj.org.date_nalogform = newOrg.date_nalogform;
			ei2ContractObj.org.except_flag = newOrg.except_flag;
			ei2ContractObj.org.likv_flag = newOrg.likv_flag;
			ei2ContractObj.org.budget_flag = newOrg.budget_flag;
			ei2ContractObj.org.id_nalogform = newOrg.id_nalogform;
			ei2ContractObj.org.adr_legal = newOrg.adr_legal;
			ei2ContractObj.org.Primechan = newOrg.Primechan;

			ei2ContractObj.org.axOrgId = newOrg.axOrgId;
			ei2ContractObj.org.axOrgCode = newOrg.axOrgCode;

			ei2ContractObj.contractNumber = contractObj.contractNumber;
			ei2ContractObj.contractDate = contractObj.contractDate;
			ei2ContractObj.finDocCode = contractObj.finDocCode;
			ei2ContractObj.finDocID = contractObj.finDocID;


			Date date = new Date();
			if (contractObj.contractEndDate != null) {
				if (contractObj.contractEndDate.before(date)) {
					throw new EnergyproSystemException(
							"\n Договор закритий !!! ");
				}
			}


			// связка  сгрупированной строки (итем тендер ) с договором к котому подвязываем естимейты
	              RQPurchaseItemTender2RQPurchaseItemFilter itt2itFilter = new RQPurchaseItemTender2RQPurchaseItemFilter();
	              itt2itFilter.conditionSQL  =  "  rqprchstmtndr2rqprchst.purchaseitemrefcode in ( select qqq.purchaseitemrefcode from rqpurchaseitem2estmttm qqq where qqq.code = "+ eiList[0].purchaseItem2EstimateitemCode +" ) ";
	              RQPurchaseItemTender2RQPurchaseItemShortList itt2itList = itt2itDAO.getScrollableFilteredList(itt2itFilter, 0, -1);
	              for (int it = 0; it < itt2itList.totalCount; it++) {
	              	 /*if (contractObj.purchaseItemTender.code != itt2itList.get(it).purchaseItemTenderRefCode || contractObj.purchaseItemTender.code == Integer.MIN_VALUE  ){
	              		 contractObj.purchaseItemTender.code = itt2itList.get(it).purchaseItemTenderRefCode;
	              		 contractDAO.save(contractObj);
	              	 }*/

	            	 	RQPurchaseItemTender2EnContractFilter pi2contractFil = new RQPurchaseItemTender2EnContractFilter();
	                  	pi2contractFil.contractRef.code = contractObj.code;
	                  	pi2contractFil.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;

	                  	int[] pi2contractArr = pi2contractDAO.getFilteredCodeArray(pi2contractFil, 0, -1);
	    	              	if ( pi2contractArr.length == 0   ){
	    	              		RQPurchaseItemTender2EnContract pi2contractObj = new RQPurchaseItemTender2EnContract();
	    	              		pi2contractObj.contractRef.code = contractObj.code;
	    	              		pi2contractObj.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;
	    	              		pi2contractObj.userGen = userProfile.userName;
	    	              		pi2contractDAO.add(pi2contractObj);
	    	              	}
				 }



			    Context ei2ContractCnt = new InitialContext();
		        Object ei2ContractRef = ei2ContractCnt.lookup(ENEstimateItem2ContractController.JNDI_NAME);
		        ENEstimateItem2ContractControllerHome ei2ContractHome = (ENEstimateItem2ContractControllerHome) PortableRemoteObject.narrow(ei2ContractRef, ENEstimateItem2ContractControllerHome.class);
		        ENEstimateItem2ContractController ei2ContractController = ei2ContractHome.create();
		        // проверка что бы на всех строках материалов была свзяка со строкой плана закупок
		        for (int i=0; i < eiList.length; i++){
		        	if ( eiList[i].purchaseItem2EstimateitemCode == Integer.MIN_VALUE )
		        		throw new EnergyproSystemException("\n Для матеріалу з кодом =  "+ eiList[i].code + " невизначено строку плана закупок !!! ");

		        	if ( eiList[i].countFact.doubleValue() == 0 )
		        		throw new EnergyproSystemException("\n Невизначено кількість матеріалу для прив`язки!!! ");

		        }
		        ei2ContractController.addWithEstimateList(ei2ContractObj, eiList);


		        // материал (естимейт) который добавляем в проект договора или договор можно его исключить из плана закупки если он находится в черновом плане закупок
	            // функция - по естимейту внутри делает отвязку количества которое попадет на закупки и пересчет строк закупки детальной и строки предмета закупки +

		         RQPurchaseItem2EstimateItemShort[] purchItem2eiList = new RQPurchaseItem2EstimateItemShort[eiList.length];
	               for (int ei = 0; ei < eiList.length; ei++) {

	               	purchItem2eiList[ei] = pi2eiDAO.getShortObject(eiList[ei].purchaseItem2EstimateitemCode);
	               }

	               // если статус плана закупки черновой то уменьшим кол-во "Згідно плану закупівлі " для строки rqpurchaseitem

		               RQPlanPurchaseFilter pFil = new RQPlanPurchaseFilter();
		               pFil.conditionSQL = " rqplanpurchase.code = ( select p.code  from rqplanpurchase p \n" +
		            		   " , rqpurchaseitem pi  , rqpurchaseitem2estmttm pi2ei \n" +
		            		   " where p.code = pi.purchaserefcode \n" +
		            		   " and pi.code = pi2ei.purchaseitemrefcode  \n" +
		            		   " and pi2ei.code = "+  eiList[0].purchaseItem2EstimateitemCode +" ) \n";

		               RQPlanPurchaseShortList pList = pDAO.getScrollableFilteredList(pFil, 0, -1);

		               if (pList.totalCount == 0 ){
		            	   throw new EnergyproSystemException("\n Помилка при визначенні плану закупівлі !!! "  );
		               }

		               if (pList.get(0).statusRefCode == RQConsts.RQPLANPURCHASE_STATUS_DRAFT){

		            	   purchaseLogic.notAccountMaterialsForPurchase(purchItem2eiList);
		               }




		   }
		    catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}
	        catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
	        catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
	        catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}
		    finally {closeConnection();}
	 }


	 // Відмінити прив`язку вибраних строк матеріалів з планів від договору
	 /**
	  *  Відмінити прив`язку вибраних строк матеріалів з планів від договору
	  *
	  * */

	 public void estimateWithContractUnLink2Contract(ENEstimateItemShort[] eiList ) {
     try {


    	    Context ei2ContractCnt = new InitialContext();
	        Object ei2ContractRef = ei2ContractCnt.lookup(ENEstimateItem2ContractController.JNDI_NAME);
	        ENEstimateItem2ContractControllerHome ei2ContractHome = (ENEstimateItem2ContractControllerHome) PortableRemoteObject.narrow(ei2ContractRef, ENEstimateItem2ContractControllerHome.class);
	        ENEstimateItem2ContractController ei2ContractController = ei2ContractHome.create();

	        ENEstimateItem2ContractDAO ei2ContractDAO = new ENEstimateItem2ContractDAO(connection, userProfile);

	        RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
	        RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
	        PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection,userProfile);

	        RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection,userProfile);
	        RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection,userProfile);
	        RQOrderDAO oDAO = new RQOrderDAO(connection,userProfile);
	        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection,userProfile);

	        ENEstimateItemShort[] eiListCheck = eiList;

	        ///// Проверка, чтобы не отвязали от договора часть строки заявки (часть естимейтов ) - только полностью
            ///// (иначе ее придется делить на 2 строки -
	        for (int m = 0; m < eiList.length;m++) {

	        	RQOrderItem2ENEstimateItemFilter tmpOi2eFilter = new RQOrderItem2ENEstimateItemFilter();
		        tmpOi2eFilter.conditionSQL = " rqorderitem2enestimttm.orderitemcode = ( select qqq.orderitemcode from rqorderitem2enestimttm qqq where qqq.estimateitemcode = " +  eiList[m].code   +"	)";
		        RQOrderItem2ENEstimateItemShortList tmpOi2eList = oi2eiDAO.getScrollableFilteredList(tmpOi2eFilter, 0, -1);

		            for (int j = 0; j < tmpOi2eList.totalCount; j++){
		             boolean isFindEi = false;
	                	for (int k = 0; k < eiListCheck.length; k++) {

	                		if(tmpOi2eList.get(j).estimateItemCode == eiListCheck[k].code){
	                			isFindEi = true;
	                			break;
	                		}
	                	}
	                	if (!isFindEi){
	                		RQOrderItem oiObj = oiDAO.getObject(tmpOi2eList.get(j).orderItemCode);
	                		RQOrder oObj = oDAO.getObject(oiObj.orderRef.code);
	                		ENEstimateItem eiiObj = eiDAO.getObject(tmpOi2eList.get(j).estimateItemCode);

	                		throw new EnergyproSystemException("\n \n Часткова відміна прив`язки матеріалу із строки заявки неможлива (заявка№  " + oObj.numberDoc  +" , строка заявки = " + oiObj.materialNameGen + " " + oiObj.ddsCodes + "  кількість =" + oiObj.countFact + "). \n " +
	                		"  Матеріал "+ oiObj.materialNameGen + " з плану  (ун.код плану = "+ eiiObj.planRef.code +" , код матеріалу з плану = "+ eiiObj.code
	                				+ ") потрібно теж вибрати для відміни прив`язки !!! "  );
	                	}
	               }
	        }
            //////////////////////////// end check order item 2 enestimateitem

	        // отменяем привязку к договору

	        for (int i=0; i < eiList.length; i++){


	        	ENEstimateItem2ContractFilter ei2ContractFilter = new ENEstimateItem2ContractFilter();
	        	ei2ContractFilter.estimateItem.code = eiList[i].code;

	        	int[] ei2ContractArr = ei2ContractDAO.getFilteredCodeArray(ei2ContractFilter, 0, -1);

	        	if(ei2ContractArr.length>0){
	        	ei2ContractController.removeByEstimateCode(eiList[i].code);
	        	}


	        	// проверить если естимейт находится в заявке и он там один то отвяжем договор со строки заявки - типа при подвязке строки плана закупок с этим естимейтом к другому договору туда уже впишется новый договор .
	        	RQOrderItem2ENEstimateItemFilter oi2eiFil = new RQOrderItem2ENEstimateItemFilter();
	        	oi2eiFil.estimateItem.code = eiList[i].code;

	        	int[] oi2eiArr = oi2eiDAO.getFilteredCodeArray(oi2eiFil, 0, -1);
	        	if(oi2eiArr.length>0){
	        		RQOrderItem2ENEstimateItem oi2eiObj = oi2eiDAO.getObject(oi2eiArr[0]);

	        		oi2eiFil = new RQOrderItem2ENEstimateItemFilter();
	        		oi2eiFil.orderItem.code = oi2eiObj.orderItem.code;
	        		RQOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFil, 0, -1);

	        		if (oi2eiList.totalCount == 1 && ( oi2eiList.get(0).estimateItemCode ==  eiList[i].code ) ){
	        			// скинем договор и поствщика на строке заявки
	        			RQOrderItem oiObj =  oiDAO.getObject(oi2eiList.get(0).orderItemCode);
	        			oiObj.contractDate = null;
	        			oiObj.contractNumber = null;
	        			oiObj.finDocCode = null;
	        			oiObj.finDocID = Integer.MIN_VALUE;
	        			oiObj.org.code = Integer.MIN_VALUE;
	        			oiDAO.save(oiObj);

	        		}

	        	}

	        }

	        // если статус плана закупки черновой и статус записи в связке строки плана закупок к естимейту = отменен (т.е по естимейту первоначально кол-во
	        // для закупки было в этой строке плана закупки но
	        // но потом его подвязали к договору когда план закупок был черновой и в этом случае мы зануляем количество по плану закупок которое учитывается
	        // для строки плана закупки )
	        // то увеличим кол-во "Згідно плану закупівлі " для строки rqpurchaseitem
	        //  А если кол-во для закупки по этому естимейту не 0 и статус связки строки плана закупки к естимейту = не

            RQPlanPurchaseFilter pFil = new RQPlanPurchaseFilter();
            pFil.conditionSQL = " rqplanpurchase.code = ( select p.code  from rqplanpurchase p \n" +
         		   " , rqpurchaseitem pi  , rqpurchaseitem2estmttm pi2ei \n" +
         		   " where p.code = pi.purchaserefcode \n" +
         		   " and pi.code = pi2ei.purchaseitemrefcode  \n" +
         		   " and pi2ei.code = "+  eiList[0].purchaseItem2EstimateitemCode +" ) \n";

            RQPlanPurchaseShortList pList = pDAO.getScrollableFilteredList(pFil, 0, -1);

            if (pList.totalCount == 0 ){
         	   throw new EnergyproSystemException("\n Помилка при визначенні строки плану закупівлі !!! "  );
            }


            Vector<RQPurchaseItem2EstimateItemShort> result = new Vector<>();
            for (int ei = 0; ei < eiList.length; ei++) {
            	RQPurchaseItem2EstimateItem pi2eiObj = pi2eiDAO.getObject( eiList[ei].purchaseItem2EstimateitemCode ) ;
            	if (pi2eiObj.purchaseItem2EstimateItemStatusRef.code == RQPurchaseItem2EstimateItemStatus.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY
            			&& pList.get(0).statusRefCode == RQConsts.RQPLANPURCHASE_STATUS_DRAFT )
            	result.add(pi2eiDAO.getShortObject(eiList[ei].purchaseItem2EstimateitemCode));
            }
            RQPurchaseItem2EstimateItemShort[] purchItem2eiArr = new RQPurchaseItem2EstimateItemShort[result.size()];
            for(int j = 0;j < result.size();j++)
            	purchItem2eiArr[j] = ((RQPurchaseItem2EstimateItemShort)result.get(j));
           // возврат количества для закупки только для тех материлов по которым количество для закупки мы занулили путем подвязки естимейта к договору в этом плане закупок
           // и план закупок черновой . если не р\черновой то не возвращаем кол во . а только отвязка от договора (происходит выше )
	        if (purchItem2eiArr.length != 0 ){
	            purchaseLogic.acountMaterialsForPurchase(purchItem2eiArr); // пересчет кол-ва в плане закупок.. Учитываем количество материала с естимейта в строке плана закупок с пересчетом строк .
	        }



       }
     catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
     catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
     catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}
     catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}
	    finally {closeConnection();}
 }


	 public void estimateAdd2Planpurchase(ENEstimateItemShort[] eiList , int planPurchaseCode ){
		   try {
			   ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
			   ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
			   RQOrgDAO orgDAO = new RQOrgDAO(connection, userProfile);
			   ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			   ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			   TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
			   ENPlanWorkItemDAO planitDAO = new  ENPlanWorkItemDAO(connection, userProfile);


			   RQPurchaseItemTender2RQPurchaseItemDAO pit2piDAO = new RQPurchaseItemTender2RQPurchaseItemDAO(connection, userProfile);
			   RQPurchaseItemTenderDAO piTendDAO = new RQPurchaseItemTenderDAO(connection, userProfile);

			   RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
			   RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
			   RQPurchaseItemDAO piDAO = new RQPurchaseItemDAO(connection, userProfile);

			   //ENContract contractObj =  contractDAO.getObject(contractItemObj.contract.code);
			   //RQOrg orgObj =orgDAO.getObject(contractObj.org.code);
			   RQPlanPurchase Obj = pDAO.getObject(planPurchaseCode);


			   if(Obj.statusRef.code != RQConsts.RQPLANPURCHASE_STATUS_DRAFT  && !userProfile.userName.equals("energynet")   ){
				   throw new EnergyproSystemException(" План закупівель  не  черновий !!! " );
			   }

			   RQPurchaseItemTenderFilter piTendFil = new RQPurchaseItemTenderFilter();
			   piTendFil.purchaseRef.code = Obj.code;
			   int[] piTendArr = piTendDAO.getFilteredCodeArray(piTendFil, 0, -1);
			   if(piTendArr.length > 0  && !userProfile.userName.equals("energynet")  ){
				   throw new EnergyproSystemException(" Вже сформовані строки для публікації !!! " );
			   }



			   PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection,userProfile);


		        for (int i=0; i < eiList.length; i++){
		        	     	ENEstimateItem eiObj = eiDAO.getObjectNoSegr(eiList[i].code);
		        	     	ENPlanWork planObj = planDAO.getObject(eiObj.planRef.code);
		        	     	TKMaterials mobj = mDAO.getObject(eiObj.materialRef.code);

		        	     	System.out.print("estimateAdd2Planpurchase eiList[i].code = " + eiList[i].code );

		        	     	int purchaseItemCode = Integer.MIN_VALUE;

		        	 if (eiObj.kindRef.code == ENEstimateItemKind.MATERIALS || eiObj.kindRef.code == ENEstimateItemKind.GSM || eiObj.kindRef.code == ENEstimateItemKind.GSM){

					            RQPurchaseItemFilter piFilter = new RQPurchaseItemFilter();
					        	piFilter.materialRef.code = eiObj.materialRef.code;
					        	piFilter.purchaseRef.code =   planPurchaseCode;



					        	RQPurchaseItemShortList piLlist = piDAO.getScrollableFilteredList(piFilter, 0, -1);
					             if(piLlist.totalCount > 0){
					            	RQPurchaseItem piObj = piDAO.getObject(piLlist.get(0).code);
					            	purchaseItemCode= piObj.code;
					            	piObj.countGen = piObj.countGen.add(eiObj.countFact);
					            	piObj.countPurchase = piObj.countPurchase.add(eiObj.countFact);
					            	piObj.sumGenWithoutNds = piObj.countGen.multiply(piObj.priceGenWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
					            	piObj.sumGenWithNds =  piObj.countGen.multiply(piObj.priceGenWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);

					            	piObj.sumPurchaseWithoutNds = piObj.countPurchase.multiply(piObj.pricePurchaseWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
					            	piObj.sumPurchaseWithNds = piObj.countPurchase.multiply(piObj.pricePurchaseWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);

					            	if (piObj.objectsCodes.equals(""+planObj.elementRef.code) ){
					            		piObj.objectsCodes = piObj.objectsCodes + ";" +""+planObj.elementRef.code;
					            		piObj.objectsName = piObj.objectsName + ";" + eiList[i].elementName;
					            	}

					            	piDAO.save(piObj);
					             }  else
					             // если не нашли вставим новый
					             {  RQPurchaseItem purchItemObj = new RQPurchaseItem();
				            		purchItemObj.code = Integer.MIN_VALUE;
				            		purchItemObj.identid2010 = mobj.identid2010;
				            		purchItemObj.identid2015 = mobj.identid2015;
				            		purchItemObj.countGen = eiObj.countFact;
				            		purchItemObj.materialNameGen = mobj.name;
				            		purchItemObj.measurementNameGen = mobj.measurement.name;
				            		purchItemObj.priceGenWithoutNds =
				            				mobj.cost == null ? new BigDecimal(0) : mobj.cost;
				            		purchItemObj.priceGenWithNds =
				            				mobj.cost == null ? new BigDecimal(0) : mobj.cost.multiply(new BigDecimal(1.2)).setScale(2,BigDecimal.ROUND_HALF_UP);
				            		purchItemObj.sumGenWithoutNds = purchItemObj.countGen.multiply(purchItemObj.priceGenWithoutNds).setScale(2,BigDecimal.ROUND_HALF_UP);
				            		purchItemObj.sumGenWithNds =  purchItemObj.countGen.multiply(purchItemObj.priceGenWithNds).setScale(2,BigDecimal.ROUND_HALF_UP);
				            		purchItemObj.commentGen = "";
				            		purchItemObj.materialRef.code =mobj.code;
				            		purchItemObj.measurementRef.code = mobj.measurement.code;
				            		purchItemObj.purchaseRef.code = planPurchaseCode;
				            		purchItemObj.purchaseItemTypeRef.code = RQPurchaseItemType.ITEMTYPE_MATERIALS;

				            		purchItemObj.countPurchase = eiObj.countFact;
				            		purchItemObj.pricePurchaseWithoutNds =
				            				mobj.cost == null ? new BigDecimal(0) : mobj.cost;
				            		purchItemObj.pricePurchaseWithNds =
				            				mobj.cost == null ? new BigDecimal(0) : mobj.cost.multiply(new BigDecimal(1.2)).setScale(2,BigDecimal.ROUND_HALF_UP);
				            		purchItemObj.sumPurchaseWithoutNds =  purchItemObj.countPurchase.multiply(purchItemObj.pricePurchaseWithoutNds).setScale(2,BigDecimal.ROUND_HALF_UP);
				            		purchItemObj.sumPurchaseWithNds =  purchItemObj.countPurchase.multiply(purchItemObj.pricePurchaseWithNds).setScale(2,BigDecimal.ROUND_HALF_UP);

				            		purchItemObj.countFree = new BigDecimal(0); // при формировании ставим 0


				            		purchItemObj.objectsCodes = ""+planObj.elementRef.code;
				            		purchItemObj.objectsName = eiList[i].elementName;


				            		purchaseItemCode = piDAO.add(purchItemObj);
					             }

				            		// вставка связки
				            		RQPurchaseItem2EstimateItem purchaseItem2EstimateItemObj = new RQPurchaseItem2EstimateItem();
				                 	purchaseItem2EstimateItemObj.countGen =eiObj.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);
				                 	purchaseItem2EstimateItemObj.countPurchase = eiObj.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);
				                    purchaseItem2EstimateItemObj.estimateItemRef.code =eiObj.code;
				                 	purchaseItem2EstimateItemObj.purchaseItemRef.code = purchaseItemCode;
				                 	purchaseItem2EstimateItemObj.purchaseItem2EstimateItemStatusRef.code =   RQPurchaseItem2EstimateItemStatus.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_AND_FORPURCHASE;

				                 	pi2eiDAO.add(purchaseItem2EstimateItemObj);
				            		//

		        	 	} // услуги
		        	 else  if (eiObj.kindRef.code == ENEstimateItemKind.SERVICES){

		        		 ENPlanWorkItem planItObj = planitDAO.getObject(eiObj.planItemRef.code);
		        		   RQPurchaseItem purchItemObj = new RQPurchaseItem();
		            		purchItemObj.code = Integer.MIN_VALUE;
		            		purchItemObj.identid2010 = mobj.identid2010;
		            		purchItemObj.identid2015 = mobj.identid2015;
		            		purchItemObj.countGen = eiObj.countFact;
		            		// 19.09.2016 Гудым сказала что название по работам такое как в стправочнике должно быть  purchItemObj.materialNameGen = planItObj.commentGen; // название услуг в коменте работы
		            		purchItemObj.materialNameGen = mobj.name;
		            		purchItemObj.measurementNameGen =mobj.measurement.name;
		            		purchItemObj.priceGenWithoutNds = eiObj.cost.divide(new BigDecimal(1.2),6).setScale(2,BigDecimal.ROUND_HALF_UP);
		            		purchItemObj.priceGenWithNds =  eiObj.cost;
		            		purchItemObj.sumGenWithoutNds = purchItemObj.priceGenWithNds.divide(new BigDecimal(1.2),6).setScale(2,BigDecimal.ROUND_HALF_UP);
		            		purchItemObj.sumGenWithNds =  eiObj.cost;
		            		purchItemObj.commentGen = "";
		            		purchItemObj.materialRef.code =mobj.code;
		            		purchItemObj.measurementRef.code = mobj.measurement.code;
		            		purchItemObj.purchaseRef.code = planPurchaseCode;
		            		purchItemObj.purchaseItemTypeRef.code = RQPurchaseItemType.ITEMTYPE_SERVICES;

		            		purchItemObj.countPurchase = eiObj.countFact;
		            		purchItemObj.pricePurchaseWithoutNds = eiObj.cost.divide(new BigDecimal(1.2),6).setScale(2,BigDecimal.ROUND_HALF_UP);
		            		purchItemObj.pricePurchaseWithNds = eiObj.cost;
		            		purchItemObj.sumPurchaseWithoutNds =  purchItemObj.pricePurchaseWithNds.divide(new BigDecimal(1.2),6).setScale(2,BigDecimal.ROUND_HALF_UP);
		            		purchItemObj.sumPurchaseWithNds = eiObj.cost;

		            		purchItemObj.countFree = new BigDecimal(0); // при формировании ставим 0

		            		purchItemObj.objectsCodes = ""+planObj.elementRef.code;
		            		purchItemObj.objectsName = eiList[i].elementName;

		            		purchaseItemCode = piDAO.add(purchItemObj);


		            		// вставка связки
		            		RQPurchaseItem2EstimateItem purchaseItem2EstimateItemObj = new RQPurchaseItem2EstimateItem();
		                 	purchaseItem2EstimateItemObj.countGen =eiObj.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);
		                 	purchaseItem2EstimateItemObj.countPurchase = eiObj.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);
		                    purchaseItem2EstimateItemObj.estimateItemRef.code =eiObj.code;
		                 	purchaseItem2EstimateItemObj.purchaseItemRef.code = purchaseItemCode;
		                 	purchaseItem2EstimateItemObj.purchaseItem2EstimateItemStatusRef.code =   RQPurchaseItem2EstimateItemStatus.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_AND_FORPURCHASE;

		                 	pi2eiDAO.add(purchaseItem2EstimateItemObj);
		        	 }

		        	 if (purchaseItemCode == Integer.MIN_VALUE){
		        		  throw new EnergyproSystemException("\n Помилка при визначенні строки плану закупівлі !!! " + " eiObj.kindRef.code == " + eiObj.kindRef.code   );
		        	 }

		        	// на естимейтах проапдейтим ссылку на строку плана закупки
		        	 purchaseLogic.updateOnEnEstimateitemPurchaseItemCode(purchaseItemCode, ""+eiList[i].code);

		         	   //  апдейтим на строках  заявок коды плана закупок - по естимейтам которые в заявках
		        	 purchaseLogic.setOnRqorderItemPurchaseItemCode(purchaseItemCode, ""+eiList[i].code );

		        	 RQPurchaseItemTender2RQPurchaseItemFilter pit2piFilter = new RQPurchaseItemTender2RQPurchaseItemFilter();
		        	 pit2piFilter.purchaseItemRef.code = purchaseItemCode;

		        	 RQPurchaseItemTender2RQPurchaseItemShortList pit2piList = pit2piDAO.getScrollableFilteredList(pit2piFilter,0 , -1);
		        	 if (pit2piList.totalCount>0){
		        		 purchaseLogic.recalcTenderItem(pit2piList.get(0).purchaseItemTenderRefCode);
		        	 }



		        }









		   }
		    catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}
//	        catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
//	        catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
//	        catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}
		    finally {closeConnection();}
	 }

	 /**
	   *
	   * Создает finmaterials и резервирует материал для списания средства защиты
	   *
	   *
	   * @throws DatasourceConnectException
	   */
	  public int createFinmaterialForWritingOffProtection(int eiCodeInExploitation // код естимета в эксплуатации
			  , int eiCodeForWriteOff // код естимета для списания
			  , BigDecimal countFact // кол-во для списания
			  , int codePlan // код плана на списание средств защиты
			  , String kodObj // табельный сотрудника или инв.№ бригады или подстанции (взависимости с кого списывают)
        	  , String nameObj // ФИО сотрудника или название бригады или подстанции (взависимости с кого списывают)
        	  , String podrName  //  название подразделения сотрудника или название подразделения бригады или подстанции (взависимости с кого списывают)

			  )
	  {
		  int  finMaterialsCode = Integer.MIN_VALUE;
		  try
		  {

			     ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			     FINMolDataDAO fmDataDAO= new FINMolDataDAO(connection, userProfile);
			     ENEstimateItem eiObj = eiDAO.getObject(eiCodeForWriteOff);
			     FINMaterialsDAO fMDAO = new FINMaterialsDAO(connection, userProfile);

				 Context cnt = new InitialContext();
	             Object objRef = cnt.lookup(FINMaterialsController.JNDI_NAME);
	             FINMaterialsControllerHome finHome = (FINMaterialsControllerHome) PortableRemoteObject
	                    .narrow(objRef, FINMaterialsControllerHome.class);
	             FINMaterialsController finController = finHome.create();

	          // определим finDocCode
	             int finDocCode = -1;

	             FINDoc2MolDataDAO fd2mdDAO = new FINDoc2MolDataDAO(connection,userProfile);

	             FINDoc2MolDataFilter fd2mdFilter = new FINDoc2MolDataFilter();
	             fd2mdFilter.finDocTypeRef.code = FINDocType.MOVE_332;
	             fd2mdFilter.conditionSQL = " findoc2moldata.moldatacode in ((select md.code from finmoldata md " +
	            				            " where md.workordercode in (select wo.workordercode from enworkorder2enplanwork wo " +
	            				            " where wo.plancode ="  + eiObj.planRef.code + ")" +
	            				            " and md.moltyperefcode = "  + FINMolType.MASTER +"))";

	             FINDoc2MolDataShortList fd2mdList = fd2mdDAO.getScrollableFilteredList(fd2mdFilter, 0, -1);


	             if (fd2mdList.totalCount == 1)
	             {
	            	 finDocCode = fd2mdList.get(0).finDocCode;
	             }

	             if (finDocCode == -1)
	                 throw new EnergyproSystemException(" Помилка при визначенні finDocCode ");

	            FINMolDataFilter fmDataFil = new FINMolDataFilter();
	            fmDataFil.code = fd2mdList.get(0).molDataCode;
	            fmDataFil.molTypeRef.code = FINMolType.MASTER;
	            int[] fmDataFilArr = fmDataDAO.getFilteredCodeArray(fmDataFil, 0, -1);

	        if(fmDataFilArr.length == 0 ){
	            	throw new EnergyproSystemException(" Помилка при визначенні FINMolData для пошуку введених в експлуатацію засобів захисту !!!");
	         }

	        FINMolData fmData = fmDataDAO.getObject(fmDataFilArr[0]);

	        // дата наряд задания
	        WorkOrderLogic wrkOrderLogic = new WorkOrderLogic(connection, userProfile);
	    	ENWorkOrder workOrder = wrkOrderLogic.getWorkOrderByMolDataCode(fmData.code);


			BigDecimal countFactForEstimate = countFact;

			AllocationListLogic allocLogic = new AllocationListLogic(connection, userProfile);
			FINLogic finLogic = new FINLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

            // String nomenclaturesIds = allocLogic.getNomenclaturesIdsByMaterialCode(eiObj.materialRef.code);
			// определим номенклутуру какая вводилась и по не же ищем остаток
			String nomenclaturesIds = "";
			int mat_id = Integer.MIN_VALUE;
			FINMaterialsFilter fmFilter = new FINMaterialsFilter();
			fmFilter.estimateItemRef.code=eiCodeInExploitation;
			fmFilter.statusRef.code=FINMaterialsStatus.GOOD;
			fmFilter.conditionSQL = " finmaterials.code in ( select ff.code from rqfkorder f \n"+
					" , rqfkorderitem fi \n"+
					" ,rqfkorderitem2enstmttm fi2i \n"+
					" ,finmaterials ff \n"+
					" where f.code = fi.fkorderrefcode \n"+
					" and fi.code =fi2i.fkorderitemrefcode \n"+
					" and f.kindcode in (" + RQFKOrderKind.RASHOD_MBP +" , " +  RQFKOrderKind.RASHOD_MNMA +" , " +  RQFKOrderKind.RASHOD_LOADEXPL_MBP +" , " +  RQFKOrderKind.RASHOD_LOADEXPL_MNMA   +  "  ) \n"+
					" and ff.statusrefcode= "+  FINMaterialsStatus.GOOD +" \n"+
					" and ff.estimateitemrefcode=" + eiCodeInExploitation +" \n"+
					" and ff.code=fi2i.finmaterialsrefcode ) ";


			int[] fmArr_InExploitation = fMDAO.getFilteredCodeArray(fmFilter, 0, -1);
			if (fmArr_InExploitation.length==0){
				throw new SystemException(
						"Помилка при визначенні номенклатур для пошуку введених в експлуатацію матеріалів !!!");
			}

			FINMaterials fmObj = fMDAO.getObject(fmArr_InExploitation[0]);
			if(fmObj == null){
				throw new SystemException(
						"Помилка при визначенні номенклатури яка введена в експлуатацію !!!");
			}
			nomenclaturesIds = fmObj.nn;
			mat_id = fmObj.mat_id;

			if (nomenclaturesIds.length() == 0) {
				throw new SystemException(
						"Помилка при визначенні номенклатур для пошуку введених в експлуатацію матеріалів !!!");
			}

             String materialCondition = " and h.op_kind_id not in ('5','10','310','15') ";

             String balansNumberCondition = "";

			 FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(
			    		 getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			 FINMaterialsFilter finMatFil = new FINMaterialsFilter();
			 finMatFil.conditionSQL = "  dat.party_id = " + fmObj.party_id + " and  dat.mat_id in ( " + mat_id + ") AND isCN is null AND  ( dat.bal_sch like '07%' or dat.bal_sch like '11%' )  AND  dat.rest_purpose_type_id in( 5, 25, 0)";
			 finMatFil.orderBySQL = " dat.mat_name ";

			 FINMaterialsList finListFK = finLogic.getMaterialsList(codePlan
					 , finMatFil
					 , balansNumberCondition
					 , fmData.finMolCode
					 , materialCondition
					 , workOrder.dateGen
					 , finDocCode);



               if (finListFK.totalCount == 0) {
              	 throw new SystemException("\n На залишках не знайдено введеної в експлуатацію номенклатури !!!  " +
                         " \n Засіб захисту/спец. одяг = " + fmObj.mat_name +
                         " n Кількість = " + countFact +
                         " \n Робітник, бригада або підстанція з якого необхідно списати = " + kodObj + " " + nameObj + " " + podrName  +
              			 " \n Необхідно звернутися до Служби охорони праці, та повідомити номер наряд-завдання, та засіб захисту для ручного виведення з експлуатації !!! ");
               }

			                for (int bz=0; bz<finListFK.totalCount;bz++)
			                {


			                	if (countFactForEstimate.compareTo(new BigDecimal(0)) == 0) {
			                		break;
			                	}

			                	FINMaterials finmaterialsObject = new FINMaterials();

			                	if (finListFK.get(bz).quantity.compareTo(countFactForEstimate) < 0) {
			                		 finmaterialsObject.quantity = finListFK.get(bz).quantity;
			                		 countFactForEstimate = countFactForEstimate.subtract(finListFK.get(bz).quantity);
			                	} else if (finListFK.get(bz).quantity.compareTo(countFactForEstimate) >= 0) {
			                		finmaterialsObject.quantity = countFactForEstimate;
			                		countFactForEstimate = new BigDecimal(0);
			                	}


			                    finmaterialsObject.code = Integer.MIN_VALUE;
			                    finmaterialsObject.estimateItemRef.code = eiCodeForWriteOff;
			                    finmaterialsObject.div_code = fmData.finMolCode;
			                    finmaterialsObject.finDocItemCode = -1;
			                    finmaterialsObject.nn = finListFK.get(bz).nn;
			                    finmaterialsObject.mat_name = finListFK.get(bz).mat_name;
			                    finmaterialsObject.mu_name = finListFK.get(bz).mu_name;
			                    finmaterialsObject.div_name = finListFK.get(bz).div_name;
			                    finmaterialsObject.rest_purpose_name = finListFK.get(bz).rest_purpose_name;
			                    finmaterialsObject.nn = finListFK.get(bz).nn;
			                    finmaterialsObject.partner_name = finListFK.get(bz).partner_name;
			                    finmaterialsObject.doc_date = finListFK.get(bz).doc_date;
			                    finmaterialsObject.party_discription = finListFK.get(bz).party_discription;
			                    finmaterialsObject.rest_purpose_id = finListFK.get(bz).rest_purpose_id;
			                    finmaterialsObject.rest_purpose_type_id = finListFK.get(bz).rest_purpose_type_id;
			                    finmaterialsObject.budget_core_id = finListFK.get(bz).budget_core_id;
			                    finmaterialsObject.frc_code = finListFK.get(bz).frc_code;
			                    finmaterialsObject.frc_name = finListFK.get(bz).frc_name;
			                    finmaterialsObject.calc_price = finListFK.get(bz).calc_price;
			                    finmaterialsObject.price = finListFK.get(bz).price;
			                    finmaterialsObject.cost = finListFK.get(bz).cost;
			                    finmaterialsObject.bal_sch = finListFK.get(bz).bal_sch;
			                    finmaterialsObject.mat_id = finListFK.get(bz).mat_id;
			                    finmaterialsObject.party_id = finListFK.get(bz).party_id;
			                    finmaterialsObject.partner = finListFK.get(bz).partner;
			                    finmaterialsObject.mu_id = finListFK.get(bz).mu_id;
			                    finmaterialsObject.doc_num = finListFK.get(bz).doc_num;
			                    finmaterialsObject.fullQuantity = finListFK.get(bz).fullQuantity;
			                    finmaterialsObject.fullCost = finListFK.get(bz).fullCost;
			                    finmaterialsObject.molDataRef.code = fd2mdList.get(0).molDataCode; /// ----
			                    finmaterialsObject.wear_date = finListFK.get(bz).wear_date;
			                    int finCode = finController.addMaterials(finmaterialsObject);

			                }


         return finMaterialsCode;


		  } catch(PersistenceException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(RemoteException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(NamingException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(CreateException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  catch(DatasourceConnectException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  finally
		  {

		  }

	  }


	  public void writeOffZZOnlyEnergyNET( int eiCode , String finMolCode , BigDecimal countForWriteOff ){
		   try {
			     ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			     FINMolDataDAO fmDataDAO= new FINMolDataDAO(connection, userProfile);
			     ENEstimateItem eiObj = eiDAO.getObject(eiCode);
			     FINMaterialsDAO fMDAO = new FINMaterialsDAO(connection, userProfile);
			     ENEstimateItem2ENEstimateItemDAO est2estDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);

			     // если естимейт в связке, то не даем больше списывать
			     ENEstimateItem2ENEstimateItemFilter e2eFil = new ENEstimateItem2ENEstimateItemFilter();
			     e2eFil.estimateItemInRef.code = eiCode;
			     e2eFil.conditionSQL = " enestimateitem2nstmttm.typerefcode in ( " + ENEstimateItem2Type.MOVEDFORWRITING + " , " + ENEstimateItem2Type.MOVEDFORWRITING_MANUAL_REMOVE + ")  ";
			     int[] e2eArr = est2estDAO.getFilteredCodeArray(e2eFil, 0, -1);
			     if (e2eArr.length>=1) {
			    	 throw new SystemException(
								" Засіб захисту вже списано !!!");
				}


	          // определим finDocCode
	             int finDocCode = -1;

	             FINDoc2MolDataDAO fd2mdDAO = new FINDoc2MolDataDAO(connection,userProfile);

	             FINDoc2MolDataFilter fd2mdFilter = new FINDoc2MolDataFilter();
	             fd2mdFilter.finDocTypeRef.code = FINDocType.MOVE_332;
	             fd2mdFilter.conditionSQL = " findoc2moldata.moldatacode in ((select md.code from finmoldata md " +
	            				            " where md.workordercode in (select wo.workordercode from enworkorder2enplanwork wo " +
	            				            " where wo.plancode ="  + eiObj.planRef.code + ")" +
	            				            " and md.moltyperefcode = "  + FINMolType.MASTER +"))";

	             FINDoc2MolDataShortList fd2mdList = fd2mdDAO.getScrollableFilteredList(fd2mdFilter, 0, -1);


	             if (fd2mdList.totalCount == 1)
	             {
	            	 finDocCode = fd2mdList.get(0).finDocCode;
	             }

	             /*if (finDocCode == -1)
	                 throw new EnergyproSystemException(" Помилка при визначенні finDocCode ");*/

	            /*FINMolDataFilter fmDataFil = new FINMolDataFilter();
	            fmDataFil.code = fd2mdList.get(0).molDataCode;
	            fmDataFil.molTypeRef.code = FINMolType.MASTER;
	            int[] fmDataFilArr = fmDataDAO.getFilteredCodeArray(fmDataFil, 0, -1);

	        if(fmDataFilArr.length == 0 ){
	            	throw new EnergyproSystemException(" Помилка при визначенні FINMolData для пошуку введених в експлуатацію засобів захисту !!!");
	         }

	        FINMolData fmData = fmDataDAO.getObject(fmDataFilArr[0]);

	        // дата наряд задания
	        WorkOrderLogic wrkOrderLogic = new WorkOrderLogic(connection, userProfile);
	    	ENWorkOrder workOrder = wrkOrderLogic.getWorkOrderByMolDataCode(fmData.code);*/


			BigDecimal countFactForEstimate =  countForWriteOff ;

			FINLogic finLogic = new FINLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			String nomenclaturesIds = "";
			int mat_id = Integer.MIN_VALUE;
			FINMaterialsFilter fmFilter = new FINMaterialsFilter();
			fmFilter.estimateItemRef.code=eiCode;
			fmFilter.conditionSQL = " finmaterials.code in (   select ff.code \n" +
									" from  \n" +
					"            enestimateitem ei  , rqfkorderitem2enstmttm fi2ei , rqfkorderitem fi , rqfkorder f  , finmaterials ff \n" +
					" 			 where ei.code = "+ eiCode +" \n" +
					" 			 and ei.code = fi2ei.estimateitemcode \n" +
					" 			 and fi2ei.fkorderitemrefcode = fi.code  \n" +
					" 			 and fi.fkorderrefcode = f.code   \n" +
					" 			 and f.kindcode in (" + RQFKOrderKind.RASHOD_MBP +" , " +  RQFKOrderKind.RASHOD_MNMA +" , " +  RQFKOrderKind.RASHOD_LOADEXPL_MBP +" , " +  RQFKOrderKind.RASHOD_LOADEXPL_MNMA   +  ")   \n" +
					" 			 and ff.code = fi2ei.finmaterialsrefcode \n" +
					" 			 and ei.code = ff.estimateitemrefcode  ) ";


			int[] fmArr_InExploitation = fMDAO.getFilteredCodeArray(fmFilter, 0, -1);
			if (fmArr_InExploitation.length==0){
				throw new SystemException(
						"Помилка при визначенні номенклатур для пошуку введених в експлуатацію матеріалів !!!");
			}

			FINMaterials fmObj = fMDAO.getObject(fmArr_InExploitation[0]);
			if(fmObj == null){
				throw new SystemException(
						"Помилка при визначенні номенклатури яка введена в експлуатацію !!!");
			}
			nomenclaturesIds = fmObj.nn;
			mat_id = fmObj.mat_id;

			if (nomenclaturesIds.length() == 0) {
				throw new SystemException(
						"Помилка при визначенні номенклатур для пошуку введених в експлуатацію матеріалів !!!");
			}

           String materialCondition = " and h.op_kind_id not in ('5','10','310','15') ";

           String balansNumberCondition = "";

			 FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			 FINMaterialsFilter finMatFil = new FINMaterialsFilter();
			 finMatFil.conditionSQL = "  dat.party_id = " + fmObj.party_id + " and  dat.mat_id in ( " + mat_id + ") AND isCN is null AND  ( dat.bal_sch like '07%' or dat.bal_sch like '11%' )  AND  dat.rest_purpose_type_id in( 5, 25, 0)";
			 finMatFil.orderBySQL = " dat.mat_name ";

			 FINMaterialsList finListFK = finLogic.getMaterialsList(eiObj.planRef.code
					 , finMatFil
					 , balansNumberCondition
					 , finMolCode
					 , materialCondition
					 , java.util.Calendar.getInstance().getTime()
					 , /*finDocCode т.к нет документа , а просто нужно проверить остатки*/ 123546 );



             if (finListFK.totalCount > 0) {
            	 throw new SystemException("\n У залишках на МВО " + finMolCode +" є в наявності номенклатура " + nomenclaturesIds + "("+ fmObj.mat_name +") партія " + fmObj.party_id + ". Списання вручну неможливе !!!  ");
             }

             // добавление в связку естимет2естимет ссілку на естимет введенного в єксплуатацию защитного средства что бі он значился как списанный
             ENEstimateItem2ENEstimateItem est2est = new ENEstimateItem2ENEstimateItem();
             est2est.countGen = countForWriteOff;
             est2est.estimateItemInRef.code = eiCode;
             est2est.estimateItemOutRef.code = eiCode;
             est2est.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING_MANUAL_REMOVE; //
             est2estDAO.add(est2est);

		}
		    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с Фин.Коллекцией ...",e);}
		    catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}
		    finally {closeConnection();}
	 }


	  /** по перечню естимейтов без привязки к договорам  создаем  проект договора на закупку со спецификацией . */
		public void estimateGroupWithoutContractAdd2Specification(RQPurchaseItem2EstimateItemGroupShort[] pi2eiList) {

			try {

				ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
				ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
				ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
				TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
				ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
				RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
				RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
				RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);
				RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
				RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
				RQPurchaseItemTender2RQPurchaseItemDAO itt2itDAO = new RQPurchaseItemTender2RQPurchaseItemDAO(connection, userProfile);
				RQPurchaseItemTender2EnContractDAO pi2contractDAO = new RQPurchaseItemTender2EnContractDAO(connection, userProfile);
				RQPurchaseItemDAO itemDAO = new RQPurchaseItemDAO(connection, userProfile);
				RQOrgDAO rqOrgDAO = new RQOrgDAO(userProfile, connection);
				PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);


				docConnection = getDOCConnection();


				DFSpecificationItemDAO dfSpecItemDAO = new DFSpecificationItemDAO(docConnection, userProfile);
				DFSpecification2AgreeDAO dfSpec2agrDAO = new DFSpecification2AgreeDAO(docConnection, userProfile);
				DFSpecItem2ENEstimateDAO dfSpecItem2eiDAO = new DFSpecItem2ENEstimateDAO(docConnection, userProfile);
				DFDocAgreementDAO agreeDAO = new DFDocAgreementDAO(docConnection, userProfile);
				DFDocDAO docDAO = new DFDocDAO(docConnection, userProfile);


				ENContract contractObj = contractDAO.getObject(pi2eiList[0].enContractCode);
				TKMaterials mObj = mDAO.getObject(pi2eiList[0].materialCode);

				OrderLogic ol = new OrderLogic(connection, userProfile);
				BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
			    BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

				  if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
		            	  throw new EnergyproSystemException("\n Додавання материалів неможливо. Це не проект договору !!!");
		           }

				  /// <<<<<<<<<<<<<<<статус проекта договора
				  {
					  DFSpecification2AgreeFilter dfSpec2agrFil = new DFSpecification2AgreeFilter();
				      dfSpec2agrFil.enContractCode = contractObj.code;

				  DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFil, 0, -1);
				  if (dfSpec2agrList.totalCount != 0){

						  DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);

						  DFDocFilter dfdocFil = new DFDocFilter();
					              dfdocFil.conditionSQL =   " dfdoc.code = ( select doc.code from docflow.DFSpecification2Agree spc2agr , docflow.dfdocagreement agr , docflow.dfdoc doc " +
																	  " where spc2agr.encontractcode = " +   contractObj.code +
																	  " and spc2agr.agreerefcode = agr.code " +
																	  " and agr.doccode = doc.code ) " ;
					              DFDocShortList docList = docDAO.getScrollableFilteredList(dfdocFil, 0, -1);

					              DFDoc docObj = null;
					              if (docList.totalCount != 0){
					            	  docObj = docDAO.getObject(docList.get(0).code);
								   if (docObj.statusRef.code != DFDocStatus.DRAFT){
									   throw new EnergyproSystemException("\n Матеріал додається тільки якщо проект договору чорновий !!!");
								   }
						    }
	                }
				  }
				 ////>>>>>>>>>>>>>>	  статус проекта договора

				  RQOrgDAO finOrgDao = new RQOrgDAO(userProfile, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));


				  if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
					  throw new EnergyproSystemException("\n Створювати спеціфікацію можливо тільки для проекту договору!!!");
				  }

				  if (pi2eiList[0].materialCode == Integer.MIN_VALUE) {
					  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
				  }

				  ///// спецификация на стороне docFlow
	                //    найти нужно строку  спецификации договора в docFlow

	                DFSpecification2AgreeFilter dfSpec2agrFilter = new DFSpecification2AgreeFilter();
	                dfSpec2agrFilter.enContractCode = pi2eiList[0].enContractCode;
	                DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFilter, 0, -1);
	                if (dfSpec2agrList.totalCount == 0 ){
	                	throw new EnergyproSystemException("\n Помилка при визначенні специфікації для договору DocFlow!!! \n Відсутня специфікація");
	                }
	                DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);


	                DFSpecificationItemFilter dfSpecItemFilter = new DFSpecificationItemFilter();
	                dfSpecItemFilter.materialCode = pi2eiList[0].materialCode;
	                dfSpecItemFilter.specificationRef.code = dfSpec2agrObj.code;
	                DFSpecificationItemShortList dfSpecItemList =  dfSpecItemDAO.getScrollableFilteredList(dfSpecItemFilter, 0,-1);

	                if(dfSpecItemList.totalCount > 1){
	                	throw new EnergyproSystemException("\n Помилка визначення специфікації у DocFlow \n Кількість більше 1 !!!" );
	                }

	                int dfSpecItemCode = Integer.MIN_VALUE;

	                if (dfSpecItemList.totalCount > 0){
	                	dfSpecItemCode = dfSpecItemList.get(0).code;
	                } else
	                	{

							DFSpecificationItem dfSpecItemObj = new DFSpecificationItem();
							dfSpecItemObj.code = Integer.MIN_VALUE;
							dfSpecItemObj.countFact = new BigDecimal(0);
							dfSpecItemObj.identid2010 = mObj.identid2010;
							dfSpecItemObj.identid2015 = mObj.identid2015;
							dfSpecItemObj.materialCode = mObj.code;
							dfSpecItemObj.materialName = mObj.name;
							dfSpecItemObj.measurement = mObj.measurement.name;
							dfSpecItemObj.priceWithoutNds = mObj.cost;
							dfSpecItemObj.priceWithNds = mObj.cost.multiply(nds_coeff).setScale(2, BigDecimal.ROUND_HALF_UP);
							dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
							dfSpecItemObj.sumWithNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);
							dfSpecItemObj.specificationRef.code = dfSpec2agrObj.code;
							dfSpecItemCode = dfSpecItemDAO.add(dfSpecItemObj);

						}

				  for (int z = 0; z < pi2eiList.length; z++) {


					  RQPurchaseItemFilter itemFilter = new RQPurchaseItemFilter();
					  itemFilter.code =  pi2eiList[z].purchaseitemСode;
					  RQPurchaseItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

					  RQPlanPurchase purchaseObj = pDAO.getObject(itemList.get(0).purchaseRefCode);

					  if (purchaseObj.statusRef.code !=RQConsts.RQPLANPURCHASE_STATUS_APPROVED ) {
						  throw new EnergyproSystemException("\n Додавати матеріал у класифікацію можливо коли план закупівель \"Затверджений\" ");
					}





					  if(mObj.cost == null){
						  throw new EnergyproSystemException(" \n  Для " + mObj.name +" не вказана ціна у довіднику матеріалів !!!!  ");
					  }

					  RQPurchaseItem2EstimateItemGroupShort[] pi2eiListCheck = pi2eiList;


					  // связка  сгрупированной строки (итем тендер ) с договором к котому подвязываем естимейты
		              RQPurchaseItemTender2RQPurchaseItemFilter itt2itFilter = new RQPurchaseItemTender2RQPurchaseItemFilter();
		              itt2itFilter.purchaseItemRef.code = pi2eiList[z].purchaseitemСode; //  "  rqprchstmtndr2rqprchst.purchaseitemrefcode in ( select qqq.purchaseitemrefcode from rqpurchaseitem2estmttm qqq where qqq.code = "+ eiList[0].purchaseItem2EstimateitemCode +" ) ";
		              RQPurchaseItemTender2RQPurchaseItemShortList itt2itList = itt2itDAO.getScrollableFilteredList(itt2itFilter, 0, -1);
		              for (int it = 0; it < itt2itList.totalCount; it++) {

		              	RQPurchaseItemTender2EnContractFilter pi2contractFil = new RQPurchaseItemTender2EnContractFilter();
		              	pi2contractFil.contractRef.code = contractObj.code;
		              	pi2contractFil.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;

		              	int[] pi2contractArr = pi2contractDAO.getFilteredCodeArray(pi2contractFil, 0, -1);
			              	if ( pi2contractArr.length == 0   ){
			              		RQPurchaseItemTender2EnContract pi2contractObj = new RQPurchaseItemTender2EnContract();
			              		pi2contractObj.contractRef.code = contractObj.code;
			              		pi2contractObj.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;
			              		pi2contractObj.userGen = userProfile.userName;
			              		pi2contractDAO.add(pi2contractObj);
			              	}
						}

		              /// перечитаем данные сгрупированным запросом фильтруя по естимейтам которые зашли с клиента, т.к могут строки заявки быть уже разделены кем то другим

		              RQPurchaseItem2EstimateItemFilter pi2eiGroupFil = new RQPurchaseItem2EstimateItemFilter();
		              pi2eiGroupFil.conditionSQL = " rqpurchaseitem.code = " + pi2eiList[z].purchaseitemСode;
		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode not in \n"+
						          " ( \n"+
						          " select oi2ei.estimateitemcode \n"+
						          " from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi \n"+
						          " where oi2ei.orderitemcode = oi.code \n"+
						          " and coalesce(oi.findocid,0) <> 0 \n"+
						          " and oi2ei.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode \n"+
						          " union \n"+
						          " select e2c.estimateitemcode \n"+
						          " from net.enestimateitem2contrct e2c \n"+
						          " where e2c.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode \n"+
						          " ) \n";
		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode not in ( select eii.code from enestimateitem eii where eii.code = rqpurchaseitem2estmttm.estimateitemrefcode and eii.statusrefcode = " + ENEstimateItemStatus.UNUSED + ")"   ;

		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + new String( pi2eiList[z].orderitemСode != Integer.MIN_VALUE ?
		            		  " and rqpurchaseitem2estmttm.estimateitemrefcode in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei \n"+
	                          " where oi.statusrefcode = " + RQOrderItemStatus.GOOD  + " and oi.code = " + pi2eiList[z].orderitemСode +
	                          "   and oi.code = oi2ei.orderitemcode ) "
	                          : " ");
		              // ++ условие по естимейтам с клиента

		              System.out.println(Arrays.toString(pi2eiList[z].estimateArray) );

		              pi2eiGroupFil.conditionSQL =  pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode = any (ARRAY "
		                    +  new String( Arrays.toString(pi2eiList[z].estimateArray)   )  + " ) "  ;


		              RQPurchaseItem2EstimateItemGroupShortList pi2eiGroupList =
		            		   pi2eiDAO.getScrollableFilteredListEstimateGroupByAsOrderItem(pi2eiGroupFil, pi2eiGroupFil.conditionSQL , pi2eiGroupFil.orderBySQL , 0, -1, null);

		              Vector<ENEstimateItem2Contract> forAddei2ct = new Vector<>();
		              Vector<DFSpecItem2ENEstimate> forAddspi2ei = new Vector<>();

		              BigDecimal countAdd = new BigDecimal(0);

		              for (int i = 0; i < pi2eiGroupList.totalCount; i++) {

		            	  // проверка на часткове додавання естімейтів із строки заявки
		            	  if( pi2eiGroupList.get(i).arrEstimateDoesNotMathOrderItem.length != 0 ){
		            		  throw new EnergyproSystemException("\n Часткове додавання позицій матеріалу із строки заявки неможливо \n "
		            		  		+ "(ун. код строки заявки №  " + pi2eiGroupList.get(i).orderitemСode );
		            	  }


		            	  for (int e2c = 0;e2c<pi2eiGroupList.get(i).estimateArray.length ;e2c++) {

    		            		// генерация скрипта для вставки enestimateite2contract
		            		    ENEstimateItem eItem = eiDAO.getObjectNoRef(Integer.parseInt(pi2eiGroupList.get(i).estimateArray[e2c]));
	                            ENEstimateItem2Contract e2ctObj = new ENEstimateItem2Contract();
	                            e2ctObj.code = Integer.MIN_VALUE;
	                            e2ctObj.org.code = contractObj.org.code;
	                            e2ctObj.contractDate = contractObj.contractDate;
	                            e2ctObj.contractNumber = contractObj.contractNumber;
	                            e2ctObj.finDocCode = contractObj.finDocCode;
	                            e2ctObj.finDocID = contractObj.finDocID;
	                            e2ctObj.estimateItem.code = eItem.code;
	                            e2ctObj.countFact = eItem.countFact;
	                            countAdd = countAdd.add(eItem.countFact);
	                            e2ctObj.purchaseitemСode = pi2eiGroupList.get(i).purchaseitemСode;
	                            forAddei2ct.add(e2ctObj);

	   		                    // генерация скрипта для вставки естимейтов в спецификацию
	    		                DFSpecItem2ENEstimate dfSpecItem2ei = new DFSpecItem2ENEstimate();
	                		    dfSpecItem2ei.code = Integer.MIN_VALUE;
	    		                dfSpecItem2ei.materialCode = mObj.code;
	    		                dfSpecItem2ei.enEstimateItemCode = eItem.code;
	    		                dfSpecItem2ei.countGen = eItem.countFact;
	    		                dfSpecItem2ei.specificationItemRef.code = dfSpecItemCode;
	    		                forAddspi2ei.add(dfSpecItem2ei);

		            	    }
		            	    // вставка естимейтов под договора
		            	      e2cDAO.add(forAddei2ct, true, connection);
		            	    // вставка естимейтов под спецификацию
		            	      dfSpecItem2eiDAO.add(forAddspi2ei, true, docConnection);

					    }

		                // строка с материалом в договоре
		                ENContractItemFilter contractItemFilter = new ENContractItemFilter();
		                contractItemFilter.material.code = pi2eiList[z].materialCode;
		                contractItemFilter.contract.code = pi2eiList[z].enContractCode;

		                ENContractItemShortList contractItemList = contractItemDAO.getScrollableFilteredList(contractItemFilter, 0, -1);
		                if (contractItemList.totalCount>0 ){
		                	ENContractItem contractItemObj = contractItemDAO.getObject(contractItemList.get(0).code);
		                	contractItemObj.countGen = contractItemObj.countGen.add(countAdd);
		                	contractItemObj.countReal = contractItemObj.countReal.add(countAdd);
		                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
		                	contractItemDAO.save(contractItemObj);


		                } else
		                {
		                	ENContractItem contractItemObj = new ENContractItem();
		                	contractItemObj.countGen = countAdd;
		                	contractItemObj.countReal = countAdd;
		                	contractItemObj.price = mObj.cost;
		                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
		                	contractItemObj.material.code = pi2eiList[z].materialCode;
		                    contractItemObj.contract.code = pi2eiList[z].enContractCode;
		                    contractItemDAO.add(contractItemObj);

		                }


		                // пересчитать в спецификации суммы
						DFSpecificationItem dfSpecItemObj = dfSpecItemDAO.getObject(dfSpecItemCode);

						dfSpecItemObj.countFact = dfSpecItemObj.countFact.add(countAdd);
						dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemObj.sumWithNds =  dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).multiply(nds_coeff). setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemDAO.save(dfSpecItemObj);

				        // договор на строке заявки
						RQOrderItem oiObj = oiDAO.getObject(pi2eiList[z].orderitemСode);

						// если на заявке уже есть код проекта договора то проверим что бы другим договором не перетерли
						if (oiObj.agreeDocNum != null ){
								throw new EnergyproSystemException("\n Строка  заявки ун.код = " + oiObj.code + " включено до іншого проекту договору (" + oiObj.agreeDocNum + ")"  );
							}

						DFDocAgreement agree = agreeDAO.getObject(dfSpec2agrObj.agreeRef.code);
						String agreeDocNum = docDAO.getObject(agree.doc.code).docNum;

						oiObj.specificationCode = dfSpec2agrObj.code;
						oiObj.agreeDocNum = agreeDocNum;

						// на строке заявки проставим код строки плана закупок к которой он подвязан - - - если его нет т.к может сначала сформироваться заявка а потом сформироваться план закупок
						if(oiObj.purchaseItemRef.code == Integer.MIN_VALUE)
						{
						  oiObj.purchaseItemRef.code = pi2eiList[z].purchaseitemСode;
						}

						oiDAO.save(oiObj);
				  }



				  // ++++++++++ обновить инфо товара на спецификации
					DFSpecificationItemShortList shrListForMatrlLSummary = dfSpecItemDAO.getMaterialsListSummaryByRows(dfSpec2agrObj.code) ;
					if(shrListForMatrlLSummary.totalCount > 0 ){
						dfSpec2agrObj.materialsList =  shrListForMatrlLSummary.get(0).materialName;
						dfSpec2agrDAO.save(dfSpec2agrObj);
					}



                 /* int eilistcount = 1;
				   for (int i = 0; i < eiList.length; i++) {
		        	 System.out.print(" estimateWithoutContractAdd2SpecificationExecute estimatecode = " + eiList[i].code   + " eilistcount = " + eilistcount++);


		        	   RQPurchaseItem2EstimateItem pi2eiObj = pi2eiDAO.getObject(eiList[i].purchaseItem2EstimateitemCode);

		        	   ENEstimateItem2ContractFilter e2cFilter = new ENEstimateItem2ContractFilter();
		        	   e2cFilter.estimateItem.code = eiList[i].code;

		        	   int[] ei2ctArr = e2cDAO.getFilteredCodeArray(e2cFilter, 0, -1);
		        	   if (ei2ctArr.length > 0 ) {
		        		   ENEstimateItem2Contract e2cObj = e2cDAO.getObject(ei2ctArr[0]);
		        		   throw new EnergyproSystemException("\n Матеріал вже доданий до договору    " + e2cObj.contractNumber  );
					}

		           	 ENEstimateItem eiObj = eiDAO.getObject(pi2eiList[i].estimatearray[] ;

		           	 if (eiObj.countFact == null)   {
		           		throw new EnergyproSystemException("\n Невизначено кількість матеріалу для прив`язки!!! ");
		           	 }
		           	 if ( eiObj.countFact.doubleValue() == 0 )
			        		throw new EnergyproSystemException("\n Невизначено кількість матеріалу для прив`язки!!! ");

	    	        	//  спецификация на стороне EnergyNEt
		        	   	ENEstimateItem2Contract e2c = new ENEstimateItem2Contract();


		        	   	RQOrgFilter orgFilter = new RQOrgFilter();
						orgFilter.codeorg = contractObj.org.codeorg;
						RQOrgShortList orgList = finOrgDao.getRQOrgList(orgFilter, 0, -1);

						if (orgList.totalCount > 0) {
							RQOrg org = rqOrgDAO.makeObjectFromShort(orgList.get(0));
							int orgCode = rqOrgDAO.add(org);

							e2c.org.code = orgCode;

							//e2c.org.code = orgList.get(0).code; !!!!!!!!!!!!!! нужно потом так сделать, что б не плодились орги
						}

		                e2c.contractDate = contractObj.contractDate;
		                e2c.contractNumber = contractObj.contractNumber;
		                e2c.finDocCode = contractObj.finDocCode;
		                e2c.finDocID = contractObj.finDocID;
		                e2c.estimateItem.code = eiList[i].code;
		                e2c.countFact = eiObj.countFact;
		                e2c.rqPurchItm2Estimate.code = eiList[i].purchaseItem2EstimateitemCode;

		                e2cDAO.add(e2c);

		                ENContractItemFilter contractItemFilter = new ENContractItemFilter();
		                contractItemFilter.material.code = eiObj.materialRef.code;
		                contractItemFilter.contract.code = eiList[i].enContractCode;

		                ENContractItemShortList contractItemList = contractItemDAO.getScrollableFilteredList(contractItemFilter, 0, -1);
		                if (contractItemList.totalCount>0 ){
		                	ENContractItem contractItemObj = contractItemDAO.getObject(contractItemList.get(0).code);
		                	contractItemObj.countGen = contractItemObj.countGen.add(eiObj.countFact);
		                	contractItemObj.countReal = contractItemObj.countReal.add(eiObj.countFact);
		                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
		                	contractItemDAO.save(contractItemObj);


		                } else
		                {
		                	ENContractItem contractItemObj = new ENContractItem();
		                	contractItemObj.countGen = eiObj.countFact;
		                	contractItemObj.countReal = eiObj.countFact;
		                	contractItemObj.price = mObj.cost;
		                	contractItemObj.cost =  contractItemObj.countGen.multiply(mObj.cost).setScale(2, BigDecimal.ROUND_HALF_UP);
		                	contractItemObj.material.code = eiList[i].materialRefCode;
		                    contractItemObj.contract.code = 	eiList[i].enContractCode;
		                    contractItemDAO.add(contractItemObj);

		                }




			        	// /// спецификация на стороне docFlow
		                // найти нужно строку  спецификации договора в docFlow

		                DFSpecification2AgreeFilter dfSpec2agrFilter = new DFSpecification2AgreeFilter();
		                dfSpec2agrFilter.enContractCode = eiList[i].enContractCode;
		                DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFilter, 0, -1);
		                if (dfSpec2agrList.totalCount == 0 ){
		                	throw new EnergyproSystemException("\n Помилка при визначенні специфікації для договору DocFlow!!! \n Відсутня специфікація");
		                }
		                DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);


		                DFSpecificationItemFilter dfSpecItemFilter = new DFSpecificationItemFilter();
		                dfSpecItemFilter.materialCode = eiList[i].materialRefCode;
		                dfSpecItemFilter.specificationRef.code = dfSpec2agrObj.code;
		                DFSpecificationItemShortList dfSpecItemList =  dfSpecItemDAO.getScrollableFilteredList(dfSpecItemFilter, 0,-1);

		                if(dfSpecItemList.totalCount > 1){
		                	throw new EnergyproSystemException("\n Помилка визначення специфікації у DocFlow \n Кількість більше 1 !!!" );
		                }

		                int dfSpecItemCode = Integer.MIN_VALUE;

		                if (dfSpecItemList.totalCount > 0){
		                	dfSpecItemCode = dfSpecItemList.get(0).code;
		                }

					// если нет строки с материалом в  спецификации,  то создадим
					if (dfSpecItemCode == Integer.MIN_VALUE) {

						DFSpecificationItem dfSpecItemObj = new DFSpecificationItem();
						dfSpecItemObj.code = Integer.MIN_VALUE;
						dfSpecItemObj.countFact = eiObj.countFact;
						dfSpecItemObj.identid2010 = mObj.identid2010;
						dfSpecItemObj.identid2015 = mObj.identid2015;
						dfSpecItemObj.materialCode = mObj.code;
						dfSpecItemObj.materialName = mObj.name;
						dfSpecItemObj.measurement = mObj.measurement.name;
						dfSpecItemObj.priceWithoutNds = mObj.cost;
						dfSpecItemObj.priceWithNds = mObj.cost.multiply(nds_coeff).setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemObj.sumWithNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemObj.specificationRef.code = dfSpec2agrObj.code;
						dfSpecItemCode = dfSpecItemDAO.add(dfSpecItemObj);

					} else {
						DFSpecificationItem dfSpecItemObj = dfSpecItemDAO.getObject(dfSpecItemCode);

						dfSpecItemObj.countFact = dfSpecItemObj.countFact.add(eiObj.countFact);
						dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemObj.sumWithNds =  dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).multiply(nds_coeff). setScale(2, BigDecimal.ROUND_HALF_UP);
						dfSpecItemDAO.save(dfSpecItemObj);
					}

					// ++++++++++ обновить инфо товара на спецификации
					DFSpecificationItemShortList shrListForMatrlLSummary = 	 dfSpecItemDAO.getMaterialsListSummaryByRows(dfSpec2agrObj.code) ;
					if(shrListForMatrlLSummary.totalCount > 0 ){
						dfSpec2agrObj.materialsList =  shrListForMatrlLSummary.get(0).materialName;
						dfSpec2agrDAO.save(dfSpec2agrObj);
					}



		                DFSpecItem2ENEstimate dfSpecItem2ei = new DFSpecItem2ENEstimate();

		                dfSpecItem2ei.code = Integer.MIN_VALUE;
		                dfSpecItem2ei.materialCode = eiList[i].materialRefCode;
		                dfSpecItem2ei.enEstimateItemCode = eiList[i].code;
		                dfSpecItem2ei.countGen = eiObj.countFact;
		                dfSpecItem2ei.specificationItemRef.code = dfSpecItemCode;
		                dfSpecItem2eiDAO.add(dfSpecItem2ei);

tut!!!!!!!!!!!!!!!!!

		                *//** проставить ссылки на строки спецификации и записать номер проекта договора на  строках заявок - если естимейты висят в заявках  *//*
		                // проверка - по естимейту выберем строку заявки , потом идем по естимейтам кторые относятся к этой строке заявки и проверяем есть ли этот естимейт в списке
		                // который передается с клиента . если нашли хоть один естимейт который есть в строке заявки , но его нет в переданном списке естимейтов. то ругаемся на то что мы
		                // не можем часть строки заявки сделать под договор а часть нет . т.к выбраны не все естимейты в строке заявки для формирования по ним спецификации с проектом договра .

		                RQOrderItem2ENEstimateItemFilter oi2eiFil = new RQOrderItem2ENEstimateItemFilter();
		                oi2eiFil.statusRef.code = RQOrderItem2ENEstimateItemStatus.GOOD;
		                oi2eiFil.conditionSQL = " rqorderitem2enestimttm.orderitemcode = ( select qqq.orderitemcode from rqorderitem2enestimttm qqq where qqq.estimateitemcode = " +  eiList[i].code   +"	)";

		                RQOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFil, 0, -1);

					    for (int j = 0; j < oi2eiList.totalCount; j++) {
					                	boolean isFindEi = false;
					                	for (int k = 0; k < eiListCheck.length; k++) {

					                		if(oi2eiList.get(j).estimateItemCode == eiListCheck[k].code){
					                			isFindEi = true;
					                		}

					                	}

					                	if (!isFindEi){
					                		RQOrderItem oiObj = oiDAO.getObject(oi2eiList.get(j).orderItemCode);
					                		RQOrder oObj = oDAO.getObject(oiObj.orderRef.code);
					                		ENEstimateItem eiiObj = eiDAO.getObject(oi2eiList.get(j).estimateItemCode);

					                		throw new EnergyproSystemException("\n Часткове додавання позицій матеріалу із строки заявки неможливо (заявка№  " + oObj.numberDoc  +" , строка заявки = " + oiObj.materialNameGen + " " + oiObj.ddsCodes + "  кількість =" + oiObj.countFact + "). \n " +
					                		"  \n Матеріал "+ oiObj.materialNameGen + " з плану  (ун.код плану = "+ eiiObj.planRef.code +" , код матеріалу з плану = "+ eiiObj.code + " кількість у плані =  " + eiiObj.countFact
					                				+ ") потрібно теж вибрати для додавання в специфікацію"  );
					                	}

					    }


		                RQOrderItem2ENEstimateItemFilter oi2eiFil22 = new RQOrderItem2ENEstimateItemFilter();
		                oi2eiFil22.statusRef.code = RQOrderItem2ENEstimateItemStatus.GOOD;
		                oi2eiFil22.conditionSQL = " rqorderitem2enestimttm.orderitemcode = ( select qqq.orderitemcode from rqorderitem2enestimttm qqq where qqq.estimateitemcode = " +  eiList[i].code   +" limit 1 	) ";
		                // RQOrderItem2ENEstimateItemShortList oi2eiList22 = oi2eiDAO.getScrollableFilteredList(oi2eiFil22, 0, -1);
		                int[] oi2eiArr22 = oi2eiDAO.getFilteredCodeArray(oi2eiFil22, 0, -1 );

		                if (oi2eiArr22.length > 0 ) {
		                	RQOrderItem2ENEstimateItem oi2eiObj = oi2eiDAO.getObject(oi2eiArr22[0]);
				                // на строке заявки - при условии что она есть . ставим ун.код. спецификации и код проекта договора
				                RQOrderItem oiObj =  oiDAO.getObject(oi2eiObj.orderItem.code);
				                RQOrderItem oldOiObj = oiDAO.getObject(oi2eiObj.orderItem.code);

				                DFDocAgreement agree = agreeDAO.getObject(dfSpec2agrObj.agreeRef.code);
				    			String agreeDocNum = docDAO.getObject(agree.doc.code).docNum;

				    			// если на заявке уже есть код проекта договора то проверим что бы другим договором не перетерли
				    			if (oiObj.agreeDocNum != null ){
					    			if (!oiObj.agreeDocNum.equals("") &&  !oiObj.agreeDocNum.equals(agreeDocNum)  ){
					    				throw new EnergyproSystemException("\n Строка  заявки ун.код = " + oiObj.code + " включено до іншого проекту договору (" + oiObj.agreeDocNum + ")"  );
					    			}
					    			}

				                oiObj.specificationCode = dfSpec2agrObj.code;
				    			oiObj.agreeDocNum = agreeDocNum;

				    			// на строке заявки проставим код строки плана закупок к которой он подвязан - - - если его нет т.к может сначала сформироваться заявка а потом сформироваться план закупок
				    			if(oiObj.purchaseItemRef.code == Integer.MIN_VALUE)
				    			{
				    			  oiObj.purchaseItemRef.code = pi2eiObj.purchaseItemRef.code;
				    			}

				    			if (       oldOiObj.specificationCode != oiObj.specificationCode
				    					|| !oldOiObj.agreeDocNum.equals(oiObj.agreeDocNum)
				    					|| oldOiObj.purchaseItemRef.code != oiObj.purchaseItemRef.code)
				    			{
				    				oiDAO.save(oiObj);
				    			}
		                }



				}*/




			} catch (SystemException e) {
				throw new EnergyproSystemException(e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} finally {
				closeDOCConnection();
			}
		}


		/** отвязка сгрупированных материалов из проекта договора
		  *
		  * @param pi2eiList
		  * @throws java.rmi.RemoteException
		  */
		public void estimateGroupInContractUnlink2Specification(RQPurchaseItem2EstimateItemGroupShort[] pi2eiListIn) {
			   try {

				   ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
				   ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
				   ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
				   TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
				   ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
				   RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
				   RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
				   RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);
				   RQPurchaseItem2EstimateItemDAO pri2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);

				   docConnection = getDOCConnection();

				  DFSpecificationItemDAO dfSpecItemDAO = new DFSpecificationItemDAO(docConnection, userProfile);
				  DFSpecification2AgreeDAO dfSpec2agrDAO = new DFSpecification2AgreeDAO(docConnection, userProfile);
				  DFSpecItem2ENEstimateDAO dfSpecItem2eiDAO = new DFSpecItem2ENEstimateDAO(docConnection, userProfile);
				  DFDocAgreementDAO agreeDAO = new DFDocAgreementDAO(docConnection, userProfile);
				  DFDocDAO docDAO = new DFDocDAO(docConnection, userProfile);

				  BillLogic billLogic =  new BillLogic(userProfile, connection);

				  ENContract contractObj = contractDAO.getObject(pi2eiListIn[0].enContractCode);

				  if (pi2eiListIn[0].materialCode == Integer.MIN_VALUE) {
					  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
				  }

				  OrderLogic ol = new OrderLogic(connection, userProfile);
				  BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
			      BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

				  TKMaterials mObj = mDAO.getObject(pi2eiListIn[0].materialCode);

				  // ENEstimateItemShort[] eiListCheck = eiList;

				  DFSpecification2AgreeFilter dfSpec2agrFil = new DFSpecification2AgreeFilter();
				  dfSpec2agrFil.enContractCode = contractObj.code;

				  DFSpecification2AgreeShortList dfSpec2agrList = dfSpec2agrDAO.getScrollableFilteredList(dfSpec2agrFil, 0, -1);
				  if (dfSpec2agrList.totalCount == 0){
					  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо!!! Помилка при визначенні договору DocFlow!!!");
				  }
				  DFSpecification2Agree dfSpec2agrObj = dfSpec2agrDAO.getObject(dfSpec2agrList.get(0).code);

				  DFDocFilter dfdocFil = new DFDocFilter();
	              dfdocFil.conditionSQL =   " dfdoc.code = ( select doc.code from docflow.DFSpecification2Agree spc2agr , docflow.dfdocagreement agr , docflow.dfdoc doc " +
													  " where spc2agr.encontractcode = " +   contractObj.code +
													  " and spc2agr.agreerefcode = agr.code " +
													  " and agr.doccode = doc.code ) " ;
	              DFDocShortList docList = docDAO.getScrollableFilteredList(dfdocFil, 0, -1);

	              DFDoc docObj = null;
	              if (docList.totalCount == 0){
	            	  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо!!! Помилка при визначенні договору DocFlow!!!");
	              } else
	            	  docObj = docDAO.getObject(docList.get(0).code);

	              if(contractObj.contractType.code != ENContractType.CONTRACT_PROJECT ){
	            	  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо. Це не проект договору !!!");
	              }

	  			// если проект договора уже какой то не черновой то не даем оттуда ничего отвязывать - статус берем из DOCFlow
				   if (docObj.statusRef.code != DFDocStatus.DRAFT && docObj.statusRef.code != DFDocStatus.CANCELED ){
					   throw new EnergyproSystemException("\n docObj.code = " + docObj.code  + " \n Прив`язка материалів до проекту договору відміняєтья тільки якщо проект договору чорновий !!!");
				   }



				   for (int z = 0; z < pi2eiListIn.length; z++) {

					//!!! перечитаем по набору естимейтов материалы которые отвязываем
					   ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
					   ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
					   eFilter.conditionSQL = " enestimateitem.materialrefcode = " + pi2eiListIn[0].materialCode
							                 + " and enestimateitem2contrct.findocid =" + contractObj.finDocID
							                 + " and enestimateitem.code = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " ) "  ;
					   RQPurchaseItem2EstimateItemGroupShortList pi2eiList = pri2eiDAO.getGroupedEstimate2ContractList(eFilter, pFilter);

					   // сумарное кол-во по естимейтам
					   BigDecimal countEifromPi2eiList = new BigDecimal(0);

					   for (int xx = 0; xx < pi2eiList.totalCount; xx++) {

						   // проверка на часткове додавання естімейтів із строки заявки
			            	  if( pi2eiList.get(xx).arrEstimateDoesNotMathOrderItem.length != 0 ){
			            		  throw new EnergyproSystemException("\n Часткова відміна прив`язки позицій матеріалу із строки заявки неможлива \n "
			            		  		+ "(ун. код строки заявки №  " + pi2eiList.get(xx).orderitemСode );
			            	  }

						 // проверка на оплату по естимейту
			        	BigDecimal sumPayByEstimate = billLogic.getSumPayByGroupedEstimateitemCode( pi2eiList.get(xx).estimateArray );
			        	if(sumPayByEstimate.doubleValue() > 0){
			        		 throw new EnergyproSystemException("\n По матеріалу  " + mObj.name   + " була оплата!!! ");
			        	}
			        	countEifromPi2eiList = countEifromPi2eiList.add(pi2eiList.get(xx).countFact);
					   }

					  // отвяжем естимейты от проекта договора в енерджинете
					   e2cDAO.removeByEstimateArray(pi2eiListIn[z].estimateArray , pi2eiListIn[z].purchaseitemСode , contractObj.finDocID  );

					  // уменьшить кол-во на строке проекта договора
					   ENContractItemFilter contractItemFil = new ENContractItemFilter();
		        	   contractItemFil.material.code = mObj.code;
		        	   contractItemFil.contract.code = contractObj.code;
		        	   ENContractItemShortList contractItemlist = contractItemDAO.getScrollableFilteredList(contractItemFil, 0, -1);
		        		 for (int k = 0; k < contractItemlist.totalCount; k++) {
		        			 ENContractItem contractItemObj = contractItemDAO.getObject(contractItemlist.get(k).code);
		        			 contractItemObj.countGen = contractItemObj.countGen.subtract(countEifromPi2eiList);
		        			 contractItemObj.countReal = contractItemObj.countGen.subtract(countEifromPi2eiList);
		        			 // если кол-во в строке проекта договора нулевое то автоматом удалим строку проекта договора
		        			 if(contractItemObj.countGen.doubleValue() <= 0){
		        				 contractItemDAO.remove(contractItemObj.code);
		        			 } else {
		        			 contractItemDAO.save(contractItemObj);
		        			 }
						}


		        		// отвяжем естимейты и пересчитаем на стороне докфлов

			        	 DFSpecificationItemFilter  dfSpecItemFil = new DFSpecificationItemFilter();
			        	 dfSpecItemFil.specificationRef.code = dfSpec2agrObj.code;
			        	 dfSpecItemFil.materialCode = mObj.code;
			        	 DFSpecificationItemShortList dfSpecItemList = dfSpecItemDAO.getScrollableFilteredList(dfSpecItemFil, 0, -1);

			        	 dfSpecItem2eiDAO.removeByEstimateArray(pi2eiListIn[z].estimateArray , dfSpecItemList.get(0).code);

			        	 DFSpecificationItem dfSpecItemObj = null;
			        	 if(dfSpecItemList.totalCount > 0 ){
			        		 dfSpecItemObj = dfSpecItemDAO.getObject(dfSpecItemList.get(0).code);

			        		 dfSpecItemObj.countFact = dfSpecItemObj.countFact.subtract(countEifromPi2eiList);
			        		 dfSpecItemObj.sumWithoutNds = dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
							 dfSpecItemObj.sumWithNds =  dfSpecItemObj.countFact.multiply(dfSpecItemObj.priceWithoutNds).multiply(nds_coeff). setScale(2, BigDecimal.ROUND_HALF_UP);

			        		 if(dfSpecItemObj.countFact.doubleValue() <= 0){
			        			 dfSpecItemDAO.remove(dfSpecItemObj.code);
			        		 } else
			        		 {
			        			 dfSpecItemDAO.save(dfSpecItemObj);


			        		 }

			        	 }else
			        	 {
			        		 throw new EnergyproSystemException("Не знайдено строку проекту договору !!!" );
			        	 }

			        	    // на строке заявки - при условии что она есть . ставим ун.код. спецификации и код проекта договора
			                RQOrderItem oiObj =  oiDAO.getObject(pi2eiListIn[z].orderitemСode );
			                oiObj.specificationCode = Integer.MIN_VALUE;
			    			oiObj.agreeDocNum = null;

			    			oiDAO.save(oiObj);
				   }

				// ++++++++++ обновить инфо товара на спецификации
					DFSpecificationItemShortList shrListForMatrlLSummary = 	 dfSpecItemDAO.getMaterialsListSummaryByRows(dfSpec2agrObj.code) ;
					if(shrListForMatrlLSummary.totalCount > 0 ){
						dfSpec2agrObj.materialsList =  shrListForMatrlLSummary.get(0).materialName;
						dfSpec2agrDAO.save(dfSpec2agrObj);
					}





			} catch (SystemException e) {
				throw new EnergyproSystemException(e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} finally {
				closeDOCConnection();
			}

		}

		/**
		 * по перечню сгрупированных естимейтов привязывается к договору
		 */
		public void estimateGroupWithoutContractAdd2Contract( RQPurchaseItem2EstimateItemGroupShort[] pi2eiList , int enContractItemCode ) {

			try {

				ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
				ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
				ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
				TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
				ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
				RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
				RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
				RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);
				RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
				RQPlanPurchaseDAO pDAO = new RQPlanPurchaseDAO(connection, userProfile);
				RQPurchaseItemTender2RQPurchaseItemDAO itt2itDAO = new RQPurchaseItemTender2RQPurchaseItemDAO(connection, userProfile);
				RQPurchaseItemTender2EnContractDAO pi2contractDAO = new RQPurchaseItemTender2EnContractDAO(connection, userProfile);
				RQPurchaseItemDAO itemDAO = new RQPurchaseItemDAO(connection, userProfile);
				RQOrgDAO rqOrgDAO = new RQOrgDAO(userProfile, connection);
				PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);
				RQBillItem2OrderItemDAO bi2oiDAO = new RQBillItem2OrderItemDAO(connection, userProfile);
                ENIPItemDAO ipiDAO = new ENIPItemDAO(connection, userProfile);




				ENContract contractObj = contractDAO.getObject(pi2eiList[0].enContractCode);
				TKMaterials mObj = mDAO.getObject(pi2eiList[0].materialCode);
				ENContractItem contractItemObj = contractItemDAO.getObject(enContractItemCode);

				OrderLogic ol = new OrderLogic(connection, userProfile);
				OrderItemLogic oiLogic = new OrderItemLogic(connection, userProfile);

				InvestProgramLogic ipLogic = new InvestProgramLogic(connection, userProfile);
				/*BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
			    BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));
*/
			    if(contractObj.contractType.code != ENContractType.CONTRACT ){
	            	  throw new EnergyproSystemException("\n Додавання материалів неможливо. Документ № " + contractObj.contractNumber +  " не є договором !!!");
	             }


				Date date = new Date();
				if (contractObj.contractEndDate != null) {
					if (contractObj.contractEndDate.before(date)) {
						throw new EnergyproSystemException(
								"\n Додавання материалів неможливо. Договор закритий !!! ");
					}
				}


				  if (pi2eiList[0].materialCode == Integer.MIN_VALUE) {
					  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
				  }


				  for (int z = 0; z < pi2eiList.length; z++) {

					  if(pi2eiList[z].purchaseitemСode == Integer.MIN_VALUE){
						  throw new EnergyproSystemException(String.format( " \n  Для матеріалу %s , ун.код(estimateArray=%s), не вказано код строки закупок !!!  ",  mObj.name , Arrays.toString(pi2eiList[z].estimateArray) ));
					  }

					  RQPurchaseItemFilter itemFilter = new RQPurchaseItemFilter();
					  itemFilter.code =  pi2eiList[z].purchaseitemСode;
					  RQPurchaseItemShortList itemList = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);

					  RQPlanPurchase purchaseObj = pDAO.getObject(itemList.get(0).purchaseRefCode);

					 if( mObj.cost == null ){
						  throw new EnergyproSystemException(" \n  Для " + mObj.name +" не вказана ціна у довіднику матеріалів !!!!  ");
					  }

					  RQPurchaseItem2EstimateItemGroupShort[] pi2eiListCheck = pi2eiList;


					  // связка  сгрупированной строки (итем тендер ) с договором к котому подвязываем естимейты
		              RQPurchaseItemTender2RQPurchaseItemFilter itt2itFilter = new RQPurchaseItemTender2RQPurchaseItemFilter();
		              itt2itFilter.purchaseItemRef.code = pi2eiList[z].purchaseitemСode; //  "  rqprchstmtndr2rqprchst.purchaseitemrefcode in ( select qqq.purchaseitemrefcode from rqpurchaseitem2estmttm qqq where qqq.code = "+ eiList[0].purchaseItem2EstimateitemCode +" ) ";
		              RQPurchaseItemTender2RQPurchaseItemShortList itt2itList = itt2itDAO.getScrollableFilteredList(itt2itFilter, 0, -1);
		              for (int it = 0; it < itt2itList.totalCount; it++) {

		              	RQPurchaseItemTender2EnContractFilter pi2contractFil = new RQPurchaseItemTender2EnContractFilter();
		              	pi2contractFil.contractRef.code = contractObj.code;
		              	pi2contractFil.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;

		              	int[] pi2contractArr = pi2contractDAO.getFilteredCodeArray(pi2contractFil, 0, -1);
			              	if ( pi2contractArr.length == 0   ){
			              		RQPurchaseItemTender2EnContract pi2contractObj = new RQPurchaseItemTender2EnContract();
			              		pi2contractObj.contractRef.code = contractObj.code;
			              		pi2contractObj.purchaseItemTenderRef.code = itt2itList.get(it).purchaseItemTenderRefCode;
			              		pi2contractObj.userGen = userProfile.userName;
			              		pi2contractDAO.add(pi2contractObj);
			              	}
						}

		              /// ПЕРЕЧИТАЕМ данные сгрупированным запросом фильтруя по естимейтам которые зашли с клиента, т.к могут строки заявки быть уже разделены кем то другим

		              RQPurchaseItem2EstimateItemFilter pi2eiGroupFil = new RQPurchaseItem2EstimateItemFilter();
		              pi2eiGroupFil.conditionSQL = " rqpurchaseitem.code = " + pi2eiList[z].purchaseitemСode;
		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode not in \n"+
						          " ( \n"+
						          " select oi2ei.estimateitemcode \n"+
						          " from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi \n"+
						          " where oi2ei.orderitemcode = oi.code \n"+
						          " and coalesce(oi.findocid,0) <> 0 \n"+
						          " and oi2ei.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode \n"+
						          " union \n"+
						          " select e2c.estimateitemcode \n"+
						          " from net.enestimateitem2contrct e2c \n"+
						          " where e2c.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode \n"+
						          " ) \n";
		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode not in ( select eii.code from enestimateitem eii where eii.code = rqpurchaseitem2estmttm.estimateitemrefcode and eii.statusrefcode = " + ENEstimateItemStatus.UNUSED + ")"   ;

		              pi2eiGroupFil.conditionSQL = pi2eiGroupFil.conditionSQL + new String( pi2eiList[z].orderitemСode != Integer.MIN_VALUE ?
		            		  " and rqpurchaseitem2estmttm.estimateitemrefcode in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei \n"+
	                          " where oi.statusrefcode = " + RQOrderItemStatus.GOOD  + " and oi.code = " + pi2eiList[z].orderitemСode +
	                          "   and oi.code = oi2ei.orderitemcode ) "
	                          : " ");
		              // ++ условие по естимейтам с клиента

		              System.out.println(Arrays.toString(pi2eiList[z].estimateArray) );

		              pi2eiGroupFil.conditionSQL =  pi2eiGroupFil.conditionSQL + " and rqpurchaseitem2estmttm.estimateitemrefcode = any (ARRAY "
		                    +  new String( Arrays.toString(pi2eiList[z].estimateArray)   )  + " ) "  ;


		              RQPurchaseItem2EstimateItemGroupShortList pi2eiGroupList =
		            		   pi2eiDAO.getScrollableFilteredListEstimateGroupByAsOrderItem(pi2eiGroupFil, pi2eiGroupFil.conditionSQL , pi2eiGroupFil.orderBySQL , 0, -1, null);

		              Vector<ENEstimateItem2Contract> forAddei2ct = new Vector<>();


		              BigDecimal countAdd = new BigDecimal(0);

		     for (int i = 0; i < pi2eiGroupList.totalCount; i++) {

		            	  // проверка на часткове додавання естімейтів із строки заявки
		            	  if( pi2eiGroupList.get(i).arrEstimateDoesNotMathOrderItem.length != 0 && pi2eiGroupList.get(i).orderitemСode != Integer.MIN_VALUE ){
		            		  throw new EnergyproSystemException("\n Часткове додавання позицій матеріалу із строки заявки неможливо \n "
		            		  		+ "(ун. код строки заявки №  " + pi2eiGroupList.get(i).orderitemСode );
		            	  }

		            	  // если естимейті со строки заяВки проверим что б в строке заявки не было другого договора



		            	  for (int e2c = 0;e2c<pi2eiGroupList.get(i).estimateArray.length ;e2c++) {

    		            		// генерация скрипта для вставки enestimateite2contract
		            		    ENEstimateItem eItem = eiDAO.getObjectNoRef(Integer.parseInt(pi2eiGroupList.get(i).estimateArray[e2c]));
	                            ENEstimateItem2Contract e2ctObj = new ENEstimateItem2Contract();
	                            e2ctObj.code = Integer.MIN_VALUE;
	                            e2ctObj.org.code = contractObj.org.code;
	                            e2ctObj.contractDate = contractObj.contractDate;
	                            e2ctObj.contractNumber = contractObj.contractNumber;
	                            e2ctObj.finDocCode = contractObj.finDocCode;
	                            e2ctObj.finDocID = contractObj.finDocID;
	                            e2ctObj.estimateItem.code = eItem.code;
	                            e2ctObj.countFact = eItem.countFact;
	                            countAdd = countAdd.add(eItem.countFact);
	                            e2ctObj.purchaseitemСode = pi2eiGroupList.get(i).purchaseitemСode;
	                            forAddei2ct.add(e2ctObj);

		            	    }
		            	    // групповая вставка естимейтов под договора
		            	      e2cDAO.add(forAddei2ct, true, connection);


		            	   // договор на строке заявки
							RQOrderItem oiObj=null ;
							if(pi2eiList[z].orderitemСode != Integer.MIN_VALUE ){
								oiObj = oiDAO.getObject(pi2eiList[z].orderitemСode);
							}

							/// если есть строка заявки
							if (oiObj != null ){
								// если на заявке уже есть код проекта договора то проверим что бы другим договором не перетерли
								if ( oiObj.finDocID != Integer.MIN_VALUE &&  oiObj.finDocID != contractObj.finDocID ){
										throw new EnergyproSystemException("\n Строка  заявки ун.код = " + oiObj.code + " включено до іншого договору (" + oiObj.contractNumber + ")"  );
									}

								// на строке заявки проставим код строки плана закупок к которой он подвязан - - - если его нет т.к может сначала сформироваться заявка а потом сформироваться план закупок
								if(oiObj.purchaseItemRef.code == Integer.MIN_VALUE)
								{
								  oiObj.purchaseItemRef.code = pi2eiList[z].purchaseitemСode;
								}

								oiObj.finDocID = contractObj.finDocID;
								oiObj.finDocCode = contractObj.finDocCode;
								oiObj.contractNumber = contractObj.contractNumber;
								oiObj.contractDate = contractObj.contractDate;
								oiObj.org.code = contractObj.org.code;

								// SUPP-28268 обновим цены на строках заявки . берем с договора
		                        {

		                           BigDecimal priceByContract = contractItemObj.price;

		                            if (priceByContract.doubleValue() != 0  && priceByContract.doubleValue() != oiObj.priceWithoutNds.doubleValue() )
		                            {

			                            	RQOrder order = oDAO.getObject(oiObj.orderRef.code);
			                            	// для услуг не будем апдейтить цену
			                            	if(order.kindRef.code != RQOrderKind.OE_PLANNED_SERVICES && order.kindRef.code != RQOrderKind.OE_NOPLANNED_SERVICES  ){

			                            	// проверим что бы на строку заявки не было счета
			                            	RQBillItem2OrderItemFilter bi2oiFilter = new RQBillItem2OrderItemFilter();
			                            	bi2oiFilter.orderItemRef.code = oiObj.code;
			                            	int[] bi2oiArr = bi2oiDAO.getFilteredCodeArray(bi2oiFilter, 0, -1);

			                            	if (bi2oiArr.length > 0 ){
			                            		throw new EnergyproSystemException("/n/n" +
			                                            " SUPP-28268 Помилка при оновленні договірної ціни на строках заявки. " +
			                                            " \n\n У заявці " + order.numberDoc + " по позиції " + oiObj.materialNameGen + " вже складений рахунок" );
			                            	}



			                            	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, order.orderPeriod);
			                                BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

			                                oiObj.priceWithoutNds = priceByContract;
			                                oiObj.priceWithNds = oiObj.priceWithoutNds.multiply(nds_coeff).setScale(2, BigDecimal.ROUND_HALF_UP);

			                                oiObj.sumWithoutNds = oiObj.countFact.multiply(oiObj.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
			                                oiObj.sumGen = oiObj.countFact.multiply(oiObj.priceWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);

			                                oiObj.sumNds = new BigDecimal(0);
			                                oiObj.nds = nds;
			                            	}
		                            }
		                        }



								oiDAO.save(oiObj);


								 // определим тип оплаты и значение для строки заявки
		                        RQOrderItem tmpItem = oiLogic.getOrderItemWithTypePay(oiObj);

		                        if (tmpItem != null)
		                        {
		                        	RQOrderItem oiObjectInserted = oiDAO.getObject(oiObj.code);
		                        	RQOrder order = oDAO.getObject(oiObj.orderRef.code);
		                        	if (oiObjectInserted.finDocID > Integer.MIN_VALUE)
		                            {
			                        	oiObjectInserted.typePayRef.code = tmpItem.typePayRef.code;
			                        	oiObjectInserted.paymentValue = tmpItem.paymentValue;
			                            // определим даты поставки и дату оплаты план
			                            RQOrderItem tmpItem2 = oiLogic.getOrderItemWithPlannedDates(oiObjectInserted, order);
			                            oiObjectInserted.plannedDatePays = tmpItem2.plannedDatePays;
			                            oiObjectInserted.plannedDateDelivery = tmpItem2.plannedDateDelivery;
			                            oiDAO.save(oiObjectInserted);
		                            }

		                        }
							}
							/// конец если есть строка заявки


							 ////////// 16042014 задание по ИП NET-4344 нада если естимейт привязали к договору то
				            // по набору естимейтов одновим договор для пунктов ИП
				           ENIPItemFilter ipiFilter = new ENIPItemFilter();
				            ipiFilter.conditionSQL = " enipitem.code in ( \n" +
				            		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
				            		" where q.estimateitemcode  = any (ARRAY " + new String( Arrays.toString(pi2eiList[z].estimateArray)   )  + " ) " +
				            		" and q.estimateitemcode = ei.code  \n" +
				            		" and ei.planrefcode = pp.planrefcode ) \n" ;

				            int[] ipiArr = ipiDAO.getFilteredCodeArray(ipiFilter, 0, -1);
				            for (int c=0; c < ipiArr.length ; c++){
				            	ipLogic.recalcContract(ipiArr[c]);
				            	ENIPItem ipiObj = ipiDAO.getObject(ipiArr[c]);
				            	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
				                 	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
				     		    }
				            }
				         // материал (естимейт) который добавляем в договор можно его исключить из плана закупки если он находится в черновом плане закупок
					     // функция - по естимейту внутри делает отвязку количества которое попадет на закупки и пересчет строк закупки детальной и строки предмета закупки +
	   			         if ( purchaseObj.statusRef.code == RQConsts.RQPLANPURCHASE_STATUS_DRAFT  ){

		   			          RQPurchaseItem2EstimateItemFilter pri2eiFil = new RQPurchaseItem2EstimateItemFilter();
		  	                  pri2eiFil.conditionSQL = " rqpurchaseitem2estmttm.code in ( "
		  	     	                 + " select distinct prhi2ei.code from rqpurchaseitem2estmttm prhi2ei , rqpurchaseitem prhi , rqplanpurchase pr "
		  	    	                 + "	  where prhi2ei.purchaseitemrefcode = prhi.code "
		  	    	                 + "		    and prhi.purchaserefcode=pr.code "
		  	    	                 + "            and prhi2ei.estimateitemrefcode  = any (ARRAY " +  new String( Arrays.toString(pi2eiList[z].estimateArray)   )  + " ) "
		  	    	                 + "            and prhi.code =  " + pi2eiList[z].purchaseitemСode
		  	    	                 + "		  ) " ;
		  	                  int[] pri2eiArr =pi2eiDAO.getFilteredCodeArray(pri2eiFil, 0, -1);
		  	                  Vector<RQPurchaseItem2EstimateItemShort> result = new Vector<>();
		  	                  for (int pp = 0; pp < pri2eiArr.length; pp++) {
		  	                	  result.add(pi2eiDAO.getShortObject(pri2eiArr[pp]));
		  					   }

		  	                  RQPurchaseItem2EstimateItemShort[] purchItem2eiArr = new RQPurchaseItem2EstimateItemShort[result.size()];
		  	                  for(int j = 0;j < result.size();j++)
		  	                  	purchItem2eiArr[j] = ((RQPurchaseItem2EstimateItemShort)result.get(j));

		  	                  if (purchItem2eiArr.length != 0 ){
		  	      	            purchaseLogic.notAccountMaterialsForPurchase(purchItem2eiArr);
		  	      	          }
	   			         }


		            }




		}




			} catch (SystemException e) {
				throw new EnergyproSystemException(e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}/* catch (DatasourceConnectException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}*/ finally {
				closeDOCConnection();
			}
		}


		/** отвязка сгрупированных материалов договора
		  *
		  * @param pi2eiList
		  * @throws java.rmi.RemoteException
		  */
		public void estimateGroupInContractUnlink2Contract(RQPurchaseItem2EstimateItemGroupShort[] pi2eiListIn) {
			   try {

			   ENContractDAO contractDAO = new ENContractDAO(connection, userProfile);
			   ENContractItemDAO contractItemDAO = new ENContractItemDAO(connection, userProfile);
			   ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(connection, userProfile);
			   TKMaterialsDAO mDAO = new TKMaterialsDAO(connection, userProfile);
			   ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			   RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(connection, userProfile);
			   RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
			   RQOrderDAO oDAO = new RQOrderDAO(connection, userProfile);
			   RQPurchaseItem2EstimateItemDAO pri2eiDAO = new RQPurchaseItem2EstimateItemDAO(connection, userProfile);
			   RQBillItem2ENEstimateItemDAO bi2eiDAO = new RQBillItem2ENEstimateItemDAO(connection, userProfile);
			   RQBillItemDAO biDAO = new RQBillItemDAO(connection, userProfile);
			   RQBillDAO bDAO = new RQBillDAO(connection, userProfile);
			   ENIPItemDAO ipiDAO = new ENIPItemDAO(connection, userProfile);
			   InvestProgramLogic ipLogic = new InvestProgramLogic(connection, userProfile);
			   RQPurchaseItemDAO prchItemDAO = new RQPurchaseItemDAO(connection, userProfile);
			   RQPlanPurchaseDAO prchDAO = new RQPlanPurchaseDAO(connection, userProfile);



				  BillLogic billLogic =  new BillLogic(userProfile, connection);
				  PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(connection, userProfile);

				  ENContract contractObj = contractDAO.getObject(pi2eiListIn[0].enContractCode);

				  if (pi2eiListIn[0].materialCode == Integer.MIN_VALUE) {
					  throw new EnergyproSystemException("\n Помилка визначення матеріалу!!!");
				  }

				  OrderLogic ol = new OrderLogic(connection, userProfile);
				  BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, contractObj.contractDate);
			      BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

				  TKMaterials mObj = mDAO.getObject(pi2eiListIn[0].materialCode);

	              if(contractObj.contractType.code != ENContractType.CONTRACT ){
	            	  throw new EnergyproSystemException("\n Відмінити прив`язку материалів неможливо. Це не договір !!!");
	              }

				   for (int z = 0; z < pi2eiListIn.length; z++) {

					//!!! ПЕРЕЧИТАЕМ по набору естимейтов материалы которые отвязываем
					   ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
					   ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
					   eFilter.conditionSQL = " enestimateitem.materialrefcode = " + pi2eiListIn[0].materialCode
							                 + " and enestimateitem2contrct.findocid =" + contractObj.finDocID
							                 + " and enestimateitem.code = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " ) "  ;
					   RQPurchaseItem2EstimateItemGroupShortList pi2eiList = pri2eiDAO.getGroupedEstimate2ContractList(eFilter, pFilter);

					   // сумарное кол-во по естимейтам
					   BigDecimal countEifromPi2eiList = new BigDecimal(0);

					   for (int xx = 0; xx < pi2eiList.totalCount; xx++) {

							   // проверка на часткове додавання естімейтів із строки заявки
				            	  if( pi2eiList.get(xx).arrEstimateDoesNotMathOrderItem.length != 0 && pi2eiList.get(xx).orderitemСode != Integer.MIN_VALUE  ){
				            		  throw new EnergyproSystemException("\n Часткова відміна прив`язки позицій матеріалу із строки заявки неможлива \n "
				            		  		+ "(ун. код строки заявки №  " + pi2eiList.get(xx).orderitemСode );
				            	  }

							 // проверка на оплату по естимейту
				        	BigDecimal sumPayByEstimate = billLogic.getSumPayByGroupedEstimateitemCode( pi2eiList.get(xx).estimateArray );
				        	if(sumPayByEstimate.doubleValue() > 0){
				        		 throw new EnergyproSystemException("\n По матеріалу  " + mObj.name   + " була оплата!!! ");
				        	}
				        	countEifromPi2eiList = countEifromPi2eiList.add(pi2eiList.get(xx).countFact);

				        	// ПРОВЕРКА ЕСТИМЕЙТОВ на статусы
				        	ENEstimateItemFilter eFilterCheck = new ENEstimateItemFilter();
				        	eFilterCheck.conditionSQL = " enestimateitem.code = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " ) "
				        			         +" and (statusrefcode <> " +  ENEstimateItemStatus.PLANNED
				        	            	 + " and statusrefcode <> " + ENEstimateItemStatus.ORDERED
				        	            	 + " and statusrefcode <> " + ENEstimateItemStatus.PRESENT + ")" ;
				        	int[] iiArr = eiDAO.getFilteredCodeArray(eFilterCheck, 0, -1);
				        	if (iiArr.length>0){
				        		throw new EnergyproSystemException("Видаляти прив'язку можна тільки для матеріалів зі статусом \"Запланований\"  , \"Замовлений\" та \"У наявності\" але без рахунку   !");
				        	}

				        	// проверка естимейтов по счетам
				        	RQBillItem2ENEstimateItemFilter bi2eiFil = new RQBillItem2ENEstimateItemFilter();
				            bi2eiFil.conditionSQL = " rqbillitem2enestimattm.estimateitemcode = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " ) ";
				            int[] bi2eiArr = bi2eiDAO.getFilteredCodeArray(bi2eiFil, 0, -1);

				            if (bi2eiArr.length > 0 ){

				            	RQBillItem2ENEstimateItem bi2eiObj = bi2eiDAO.getObject(bi2eiArr[0]);

				            	RQBillItem biObj = biDAO.getObject(bi2eiObj.billItem.code);

				            	RQBill bObj = bDAO.getObject(biObj.billRef.code);

				            	TKMaterials matObj = mDAO.getObject(biObj.material.code);

				        		throw new EnergyproSystemException("/n/n" +
				                        " SUPP-28268 Помилка при відв`язці матеріалів від договору  . Матеріал " + matObj.name + " вже у рахунку № " + bObj.numberDoc );

				        	}


						 }



			            ////////// 16042014 задание по ИП NET-4344 перечитаем договора для ИП
			            ENIPItemFilter ipiFilter = new ENIPItemFilter();
			            ipiFilter.conditionSQL = " enipitem.code in ( \n" +
			            		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
			            		" where q.estimateitemcode  = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " )   \n" +
			            		" and q.estimateitemcode = ei.code  \n" +
			            		" and ei.planrefcode = pp.planrefcode ) \n";

			            /////!!!!!выберем пункты ИП до удаления естимейтов из связки ,!!А!!   пересчитывать после удаления  --> ipiList
			            ENIPItemShortList ipiList = ipiDAO.getScrollableFilteredList(ipiFilter, 0, -1);

					   // отвяжем естимейты от договора в енерджинете
					    e2cDAO.removeByEstimateArray(pi2eiListIn[z].estimateArray , pi2eiListIn[z].purchaseitemСode , contractObj.finDocID  );

					    for (int c=0; c < ipiList.totalCount; c++){

			            	ipLogic.recalcContract(ipiList.get(c).code);
			            	ENIPItem ipiObj = ipiDAO.getObject(ipiList.get(c).code);
			            	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
			                 	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
			     		    }
			            }



	        	      // на строке заявки - при условии что она есть убираем ссылку на договор и проект договора
	                  RQOrderItem oiObj = null;
	                  if(pi2eiListIn[z].orderitemСode != Integer.MIN_VALUE){
	                	  oiObj = oiDAO.getObject(pi2eiListIn[z].orderitemСode );

	                	    oiObj.finDocID = Integer.MIN_VALUE;
							oiObj.finDocCode = "";
							oiObj.contractNumber = "";
							oiObj.contractDate = null;
							oiObj.agreeDocNum = null;
			            	oiObj.specificationCode = Integer.MIN_VALUE;


		    			  oiDAO.save(oiObj);

	                  }

	               // если статус плана закупки черновой и статус записи в связке строки плана закупок к естимейту = отменен (т.е по естимейту первоначально кол-во
	      	        // для закупки было в этой строке плана закупки но
	      	        // но потом его подвязали к договору когда план закупок был черновой и в этом случае мы зануляем количество по плану закупок которое учитывается
	      	        // для строки плана закупки )
	      	        // то увеличим кол-во "Згідно плану закупівлі " для строки rqpurchaseitem
	      	        //  А если кол-во для закупки по этому естимейту не 0 и статус связки строки плана закупки к естимейту = не
	                  RQPurchaseItem prchItem = prchItemDAO.getObject(pi2eiListIn[z].purchaseitemСode);
	                  RQPlanPurchase prchObj = prchDAO.getObject(prchItem.purchaseRef.code);

	                // выборка строк связки естимейта с планом закупок по условию :
	                   //1 - статус строки связки = RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY = 2;
	                   //2 - статус Плана закупок = черновой RQConsts.RQPLANPURCHASE_STATUS_DRAFT
	                  RQPurchaseItem2EstimateItemFilter pri2eiFil = new RQPurchaseItem2EstimateItemFilter();
	                  pri2eiFil.conditionSQL = " rqpurchaseitem2estmttm.code in ( "
	     	                 + " select distinct prhi2ei.code from rqpurchaseitem2estmttm prhi2ei , rqpurchaseitem prhi , rqplanpurchase pr "
	    	                 + "	  where prhi2ei.purchaseitemrefcode = prhi.code "
	    	                 + "		    and prhi.purchaserefcode=pr.code "
	    	                 + "		    and prhi2ei.prchstm2stmttmsttsrfcd = " + RQPurchaseItem2EstimateItemStatus.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY
	    	                 + "            and prhi2ei.estimateitemrefcode  = any (ARRAY " +  new String( Arrays.toString(pi2eiListIn[z].estimateArray)   )  + " ) "
	    	                 + "            and pr.statusrefcode =  " + RQConsts.RQPLANPURCHASE_STATUS_DRAFT
	    	                 + "            and prhi.code =  " + prchItem.code
	    	                 + "		  ) " ;
	                  int[] pri2eiArr = pri2eiDAO.getFilteredCodeArray(pri2eiFil, 0, -1);
	                  Vector<RQPurchaseItem2EstimateItemShort> result = new Vector<>();
	                  for (int pp = 0; pp < pri2eiArr.length; pp++) {
	                	  result.add(pri2eiDAO.getShortObject(pri2eiArr[pp]));
					}

	                  RQPurchaseItem2EstimateItemShort[] purchItem2eiArr = new RQPurchaseItem2EstimateItemShort[result.size()];
	                  for(int j = 0;j < result.size();j++)
	                  	purchItem2eiArr[j] = ((RQPurchaseItem2EstimateItemShort)result.get(j));
	                 // возврат количества для закупки только для тех материлов по которым количество для закупки мы занулили путем подвязки естимейта к договору в этом плане закупок
	                 // и план закупок черновой . если не р\черновой то не возвращаем кол во . а только отвязка от договора (происходит выше )
	      	        if (purchItem2eiArr.length != 0 ){
	      	            purchaseLogic.acountMaterialsForPurchase(purchItem2eiArr); // пересчет кол-ва в плане закупок.. Учитываем количество материала с естимейта в строке плана закупок с пересчетом строк .
	      	        }


			   }



			} catch (SystemException e) {
				throw new EnergyproSystemException(e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}  finally {
				closeDOCConnection();
			}

		}





}
