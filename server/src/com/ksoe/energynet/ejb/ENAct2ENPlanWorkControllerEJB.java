
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENAct2ENPlanWork;
  *
  */



import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2CostRecoveryDAO;
import com.ksoe.energynet.dataminer.ENAct2DFDocDecreeDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActInTechCond2ENActDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkENAct2OSDataDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkReasonDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkStateDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.generated.ENAct2ENPlanWorkControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.CounterLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkItemLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2CostRecovery;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemData;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkENAct2OSData;
import com.ksoe.energynet.valueobject.ENPlanWorkReason;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENAct2CostRecoveryFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkENAct2OSDataFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkReasonFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2CostRecoveryShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2FinShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkReasonShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTransportType;

public class ENAct2ENPlanWorkControllerEJB extends ENAct2ENPlanWorkControllerEJBGen
 {

    /*ENAct2ENPlanWork. ��������*/
    @Override
	public void save(ENAct2ENPlanWork object)
    {
        try
        {
            Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            UserProfile up = getUserProfile();



            ActLogic actLogic = new ActLogic(conn,up);

            actLogic.validateAct2Plan(object.actRef.code, object.plan.code);

            // �������� ����� �� ���� ��������� ���� ������ ������� ...
            AuthLogic l = new AuthLogic(conn, up);
            if ( ! l.checkPermission4PlanItems(object.plan.code) )
            {
                throw new EnergyproSystemException("Acces denied for method addBy... from method save(ENAct2ENPlanWork object)");
            }


            //ENAct act = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).getObject(object.actRef.code);

            //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            //ENPlanWork plan = planDAO.getObject(object.plan.code);

            //if (plan.stateRef.code != act.actTypeRef.code){
            //   plan.stateRef.code = act.actTypeRef.code;
            //   planDAO.save(plan);
            //}

        ENAct2ENPlanWorkDAO objectDAO = new ENAct2ENPlanWorkDAO(up,conn);
        objectDAO.save(object);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENAct2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public int add(ENAct2ENPlanWork object, int isClient) {
    	return add(object, isClient, false);
    }
    
    /*ENAct2ENPlanWork. ��������*/
    public int add(ENAct2ENPlanWork object, int isClient, boolean isFromBilling)
    {
        Connection finConn = null;
        Connection enConn = null;

        try
        {


		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"��� ����� � ������������ ... ������������ ������� ������ ��� ��� ���-�� ...",
					e);
		}

        enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        ActLogic actLogic = new ActLogic(enConn,getUserProfile());
        FKOSLogic fkOsLogic = new FKOSLogic(finConn, getUserProfile());
        HumenLogic humLogic = new HumenLogic(enConn,getUserProfile());


        // �������� ������� ����� � ��� .. ���� ���� ��� � ��� ������ �������� ����� - ������ ...
        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(enConn,getUserProfile());
        FINMaterialsDAO finDAO = new FINMaterialsDAO(enConn,getUserProfile());
        ENElementDAO elementDAO = new ENElementDAO(enConn,getUserProfile());
        FINWorkerDAO finWoDAO = new FINWorkerDAO(enConn, getUserProfile());
        ENPlanWorkStateDAO planWorkStateDAO = new ENPlanWorkStateDAO(enConn, getUserProfile());
        ENPlanWorkENAct2OSDataDAO pl2act2osDAO = new ENPlanWorkENAct2OSDataDAO(enConn, getUserProfile());
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn,getUserProfile());
        ENAct2ENPlanWorkDAO plan2actDAO = new ENAct2ENPlanWorkDAO(enConn, getUserProfile());

        CounterLogic counterLogic = new CounterLogic(enConn, getUserProfile());


        String woNumber = "";
        // ������� ���� ��� ��� ����� .. ������������� ���� !!!
        //if (isClient == 0){
            // ����������� + �������������� ;)������ � ��� ����� ( � ������ !!!;) ��� �� �������� ;))
            // !!!! !! �������� ������ ��� �������� ����� ;)) - ������ �� ����??
            //woNumber = " ... \n� ������ ����� �� ��. ���� (������ ����� �� ����� ������ ������) " + object.plan.code;
            WorkOrderLogic woLogic = new WorkOrderLogic(enConn,getUserProfile());
            ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(object.plan.code);
            woNumber = " ... \n� �����-�������� " + wo.workOrderNumber;

        //}

        // ����� ����� �� ��� �� ... ���� �� ������� ����
        // �� � ���

        // 06.11.2019 ����� ��������� � ����� ������ 
        // if (isClient == ENConsts.isClient_CLIENT)
        {
            ENTransportItemDAO tDAO = new ENTransportItemDAO(enConn,getUserProfile());

            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.planRef.code = object.plan.code;
            eFilter.kindRef.code = ENEstimateItemKind.GSM;
            int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
            for (int i = 0; i < eArr.length; i++){
                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.estimateItemRef.code = eArr[i];
                int[] fArr = finDAO.getFilteredCodeArray(finFilter,0, -1);
                if (fArr.length > 0){
                    ENTransportItemFilter tFilter = new ENTransportItemFilter();
                    tFilter.planRef.code = object.plan.code;
                    tFilter.conditionSQL = "entransportitem.code in "+
                    "(select ENTRANSPORT2ENESTIMATE.TRANSPORTREFCODE from ENTRANSPORT2ENESTIMATE where ENTRANSPORT2ENESTIMATE.ESTIMATEREFCODE = "+ eArr[i]+")" +
                    " and entransportitem.tktransporttypecode <> " + TKTransportType.MECHANIZM ; //" and entransportitem.numberlist is null";
                    int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
                    for (int j = 0; j < tArr.length; j++){
                        ENTransportItem t = tDAO.getObject(tArr[j]);
                        if (t.numberList == null){
                            throw new EnergyproSystemException("�� ������� ����� ������������ ����� ��� ��������� " + t.transportReal.name + woNumber);
                        }
                    }
                }

            }


            // ��������� �������� ... ��� ��� ���� ������� ...
            TravelSheetLogic travelLogic = new TravelSheetLogic(enConn,getUserProfile());
            ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(enConn,getUserProfile());
            ENTravelSheetItemFilter tsiFilter = new ENTravelSheetItemFilter();
            tsiFilter.planRef.code = object.plan.code;
            tsiFilter.kindRef.code = ENTravelSheetItemKind.FACT;
            ENTravelSheetItemShortList tsiList = tsiDAO.getScrollableFilteredList(tsiFilter, 0, -1);
            if (tsiList.totalCount > 0){
                ENTravelSheet ts = travelLogic.getTravelSheetByCode(tsiList.get(0).travelSheetRefCode);
                if (ts.statusRef.code != ENTravelSheetStatus.CLOSED){
                    throw new EnergyproSystemException("��������� ���������� ��������� ���� � " + ts.numberGen + woNumber);
                }
            }

        }


        // ������� ���������, ������� �� ������������ � ��, ��� �� � ��� �� �������� ������
        // ��� ���, ���� �� ����� ������ �������� �� �����
        // �� ������� �� ��������� SUPP-24812

        ENTransportItemDAO tiDAO = new ENTransportItemDAO(enConn, getUserProfile());
        ENTravelSheetItem2TransportItemDAO tsi2tiDAO = new ENTravelSheetItem2TransportItemDAO(enConn, getUserProfile());
        ENTransportItemFilter tiFilter = new ENTransportItemFilter();
        int zeroedTransport = 0;
        tiFilter.planRef.code = object.plan.code;
        int[] tiArr = tiDAO.getFilteredCodeArray(tiFilter, 0, -1);
        if (tiArr.length > 0) {
        	for (int a : tiArr) {
        		ENTravelSheetItem2TransportItemFilter tsi2tiFilter = new ENTravelSheetItem2TransportItemFilter();
        		tsi2tiFilter.transportItemRef.code = a;
        		int[] tsi2tiArr = tsi2tiDAO.getFilteredCodeArray(tsi2tiFilter, 0, -1);
        		if (tsi2tiArr.length > 0) {
        			continue;
        		} else {
        			ENTransportItem tiObj = tiDAO.getObject(a);
        			// ��� ���������� �� ����� ��������, � �� ����������� ������� �� ������ :)
        			if (tiObj.tktransportType.code == TKTransportType.MECHANIZM) {continue;}
           			tiObj.transportReal.code = Integer.MIN_VALUE;
        			tiObj.finWorker.code = Integer.MIN_VALUE;
        			tiObj.countWorkFact = new BigDecimal(0);
        			tiDAO.save(tiObj);
        			zeroedTransport++;
        		}
        	}

        	if (zeroedTransport > 0) {
        		System.out.println(String.format("�������� ��������� ������� - %d �� ����� - %d",  zeroedTransport, object.plan.code));
        	}
        }

        // ������ ���� !!! actLogic.validateAct2Plan(object.actRef.code, object.plan.code);



        ///////////////////////////////////////////////////////////////
        // �� ����� �������� � ��� ������, � ������� ���� ���������
        // � ��������� "������������ ��� ���������� ������", �� ��� �������� �� ��
        // �������� �������������� � ���
        EstimateLogic estimateLogic = new EstimateLogic(enConn,getUserProfile());
        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.planRef.code = object.plan.code;
        eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
        eFilter.accountingTypeRef.code = TKAccountingType.TMC;
        eFilter.conditionSQL = "enestimateitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem " +
                                " where enplanworkitem.countgen > 0 and enplanworkitem.planrefcode = enestimateitem.planrefcode )";

        ///// 05.04.13
        // ����� �������� ��-�������, �.�. � ����� �� ����� ������ ����� ���� ��������� ���������� � ����� � ��� �� ����� ����. ���������
        // (����� ������ ��� ��������� ����������� ����� �������, ����� �������� ������� �� 2)
        /*
        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);
        for (int i = 0; i < eList.totalCount; i++)
        {
            ENEstimateItemData data = estimateLogic.getTKMaterialDataByTechCard(eList.get(i).materialRefCode, eList.get(i).kartaRefCode);
            if (data.isObligatory == 1)
            {
                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.estimateItemRef.code = eList.get(i).code;
                int[] fArr = finDAO.getFilteredCodeArray(finFilter, 0, -1);
                if (fArr.length == 0)
                {
                    throw new EnergyproSystemException("�� �� ����'���� � ������ �� ������� \"" + eList.get(i).materialRefName +
                            "\", \n ���� � ����'������� ��� ��������� ������ " + eList.get(i).kartaNum + " " + eList.get(i).kartaRefName + woNumber);
                }
            }
        }
        */
        ENEstimateItem2FinShortList eList = eDAO.getShortListForBindingCheck(eFilter, 0, -1);
        for (int i = 0; i < eList.totalCount; i++)
        {
            if (eList.get(i).quantity.doubleValue() == 0)
            {
                ENEstimateItemData data = estimateLogic.getTKMaterialDataByTechCard(eList.get(i).materialRefCode, eList.get(i).kartaRefCode);
                if (data.isObligatory == 1)
                {
                    throw new EnergyproSystemException("�� �� ����'���� � ������ �� ������� \"" + eList.get(i).materialRefName +
                            "\", \n ���� � ����'������� ��� ��������� ������ " + eList.get(i).kartaNum + " " + eList.get(i).kartaRefName + woNumber);
                }
            }
        }
        /////
        ///////////////////////////////////////////////////////////////


        PlanWorkLogic planLogic = new PlanWorkLogic(enConn,getUserProfile());
        ENPlanWork plan = planLogic.getPlanByCode(object.plan.code);
        ENElement elementObj = elementDAO.getObject(plan.elementRef.code);

        Calendar c = Calendar.getInstance();
        c.setTime(Tools.clearTimeOfDate(new Date()));
        if (plan.dateStart.after(c.getTime()) &&
        	plan.elementRef.code != ENElement.NO_OBJECT_RECYCLABLE_MATERIALS)
        {
            throw new EnergyproSystemException(
                    "���� � ������� ������ �������� � ��� .. ��������� ���� ���� ����� = " + new SimpleDateFormat("dd.MM.yyyy").format(plan.dateStart).toString()
                    +", ��� �����=" + plan.code
                    );
        }

        // ������� ������, ������� �������� � ��������� ��� ���������� ��� ��������� � ���
        PlanWorkItemLogic piLogic = new PlanWorkItemLogic(enConn,getUserProfile());


        if (!getUserProfile().userName.equals("energynet")) {
        	piLogic.zeroWorkByPlanCode(plan.code);
        }

        // 09.09.2015 NET-4503 ���������, ��������� �� ����������� �� ������� � ����� (���������� ��� ������ ��������)
        if (! piLogic.checkCommentsForPlanWorkItems(plan))
        {
        	throw new SystemException("\n\nNET-4503 ��������, ���� �����, " +
        			"���� \"̳��� ������, ������ ����, �������, �� ����\" �� ��� ������� ����� (���, �� ������� ����� �� 0)!\n\n" +
        			"��� �����: " + plan.code);
        }

        /* 23.01.2012 +++ ��� ������ �� ������ */
        boolean isServices = false;
        if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                || plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
            isServices = true;
        }

        AuthLogic authLogic = new AuthLogic(enConn, getUserProfile());

        // ��� ������ �������� ����� �� ��������������� ���� �����
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            if (!authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        // NET-1026 ��� �������� ���������
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
        {
            if (!authLogic.checkPermission("ksoe/energynet/SCCounterController", "addCountersForWriteOff")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        //NET-1026 ��� �������� ��������� ��������, ��� �������� ���� �� ���� ������� ��� ��������
        if(plan.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
        {
        	SCCounterDAO cntDao = new SCCounterDAO(enConn, getUserProfile());
        	SCCounterFilter cntFilter = new SCCounterFilter();
        	cntFilter.conditionSQL = ENEstimateItem.planRef_QFielld + " = " + plan.code;
        	cntFilter.conditionSQL = cntFilter.conditionSQL + " AND " + ENEstimateItem.countFact_QFielld + " > 0";
        	cntFilter.conditionSQL = cntFilter.conditionSQL + " AND " + ENEstimateItem.kindRef_QFielld + " = " + ENEstimateItemKind.MATERIALS;
        	cntFilter.conditionSQL = cntFilter.conditionSQL + " AND " + SCCounter.statusRef_QFielld + " <> " + SCCounterStatus.CANCELED;

        	boolean isThereCounters = cntDao.getScrollableFilteredList(cntFilter, 0, 1).totalCount > 0;
        	if(!isThereCounters)
        		throw new EnergyproSystemException("� ���� ���� ����'������ ���������");
        }

        ///////////////////////////////////////////////////////////////
        // �� ����� �������� � ��� ������ �� �������� ����������, � ������� ���� ���������
        // ������������������� ��� �������� (���-�� �  ������ ������������ ��������� ������ ��� ���-�� ������������ � ���� ��������� � ��������� )

        if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {

        // EstimateLogic estimateProtLogic = new EstimateLogic(enConn,getUserProfile());
        ENEstimateItemFilter eProtFilter = new ENEstimateItemFilter();
        eProtFilter.planRef.code = object.plan.code;
        eProtFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
        eProtFilter.accountingTypeRef.code = TKAccountingType.TMC;
        eProtFilter.conditionSQL = "enestimateitem.code in (Select e.code from enplanwork p , enestimateitem e " +
                                        "  left join  finmaterials f  on (e.code = f.estimateitemrefcode and f.statusrefcode = 1 ) " +
                                        " Where p.code = " + object.plan.code +
                                        "    and p.code = e.planrefcode " +
                                        "    and e.countfact <> 0 " +
                                        "    group by e.code , e.countfact  " +
                                        "    having coalesce(e.countfact,0) - sum(coalesce(f.quantity,0)) > 0 )";
        ENEstimateItemShortList eProtList = eDAO.getScrollableFilteredList(eProtFilter, 0, -1);
        for (int i = 0; i < eProtList.totalCount; i++)
        {
            // ENEstimateItemData dataProt = estimateLogic.getTKMaterialDataByTechCard(eProtList.get(i).materialRefCode, eProtList.get(i).kartaRefCode);


                    throw new EnergyproSystemException("����'���� � ������ �� ������� �� � ������� �����  \"" + eProtList.get(i).materialRefName +
                            "\", \n  " + " ʳ������ ������������ �������� ������� ���������� ������� �������� �� ���������!!!" );


        }
        }

        ///////////////////////////////////////////////////////////////

        // �������� ����� �� ���� ��������� ���� ������ ������� ...
        if (isClient == ENConsts.isClient_CLIENT)
        {
            if ( ! authLogic.checkPermission4PlanItems(plan) )
            {
                throw new EnergyproSystemException("��� ������� � �������� ������ ���� ��� �� ����� ... (ENAct2ENPlanWork object)");
            }
        }


        /* 23.01.2012 +++ ������ �� ������� ���������� */
        if (!isServices) {
            if (plan.stateRef.code != ENPlanWorkState.TMC_TRANSFER) {
                planLogic.countRealResources(object.plan.code, woNumber);
            }
        }


        ///// 13.09.12 NET-3027
        if (plan.typeRef.code == ENPlanWorkType.TMC_TRANSFER && plan.servicesFSideFinId == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n \n NET-3027 �������� ������ ������ ������ �� ����! ");
        }
        /////


        if (plan.stateRef.code == ENPlanWorkState.PRODUCTION) /*�������� ������ �� ������������*/
        {
            ENEstimateItemFilter eProducedFilter = new ENEstimateItemFilter();
            eProducedFilter.planRef.code = plan.code;
            eProducedFilter.kindRef.code = ENEstimateItemKind.PRODUCED;
            ENEstimateItemShortList eProducedList = eDAO.getScrollableFilteredList(eProducedFilter, 0, -1);

            /*�������� ������������� ���������� � ������ � ����� ���� �� ������������*/
            if(eProducedList.totalCount == 0)
                throw new EnergyproSystemException("�� �������� ������������ �������� �� ����");

            if(eProducedList.totalCount != 1)
                throw new EnergyproSystemException("�� ���� ������ ���� ���� ������ ������������ ��������");

            ENEstimateItem eProduced = eDAO.getObject(eProducedList.get(0).code);

            ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(enConn,getUserProfile());
            ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
            piFilter.planRef.code = plan.code;
            piFilter.conditionSQL = "COUNTGEN <> 0";

            ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(piFilter,piFilter.conditionSQL,0,-1);

            TKTechCardDAO tkDAO = new TKTechCardDAO(enConn,getUserProfile());
            TKMaterialsDAO maDAO = new TKMaterialsDAO(enConn,getUserProfile());
            ENPlanWorkDAO pDAO = new ENPlanWorkDAO(enConn,getUserProfile());
            FINMaterialsDAO fDAO = new FINMaterialsDAO(enConn,getUserProfile());

            /*������� ����� ������������ ��� �������������� ���������*/
            FINMaterialsFilter fFilter = new FINMaterialsFilter();
            fFilter.estimateItemRef.code = eProduced.code;
            FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter,0,-1);

            /*������� ����������� �������� �� ������ �� ���������*/
            TKMaterials maObj = maDAO.getObject(eProduced.materialRef.code);

            if(fList.totalCount != 1)
                throw new EnergyproSystemException("������� � ������� ������������ �������� � ����, ���: "+plan.code);

            BigDecimal count = new BigDecimal(0);

            for(int i=0;i < piList.totalCount; i++)
            {
                TKTechCard tcObj = tkDAO.getObject(piList.get(i).kartaRefCode);

                /*�������� �� ���������� ���� ������ ��������� �� ������� � �������� ��������� �������������� ���������*/
                if(tcObj.measurement.code != maObj.measurement.code)
                    throw new EnergyproSystemException("�� ���������� ������� ����� �� ����� "+tcObj.name+" ("+tcObj.measurement.name+") �� ������������� �������� "+maObj.name+" ("+ maObj.measurement.name+")");

                count = count.add(piList.get(i).countGen);
            }

            /*�������� ���������� �� ���� ������� � ����� � ����������� �������������� ���������*/
            if(count.compareTo(eProduced.countFact) != 0)
                throw new EnergyproSystemException("������� ������� �� ������� ("+count+") �� ������� �� ������� ������������� �������� ("+eProduced.countFact+")");

            /*�������� ������������� ���������� �� ����� �� ������������ � �������������� ����������� �� ��� ���������� � ��� ������*/

            /*������ ���� ������ � ����*/
            ActLogic aLogic = new ActLogic(enConn,getUserProfile());
            String planCodes = aLogic.getPlanCodesByAct(object.actRef.code);

            ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
            pFilter.conditionSQL = "ENPLANWORK.CODE IN ("+planCodes+")";

            ENPlanWorkShortList pList = pDAO.getScrollableFilteredList(pFilter,pFilter.conditionSQL, 0,-1);


            for(int i=0;i < pList.totalCount; i++)
            {
                ENEstimateItemFilter eProducedFilter2 = new ENEstimateItemFilter();
                eProducedFilter2.planRef.code = pList.get(i).code;

                eProducedFilter2.kindRef.code = ENEstimateItemKind.PRODUCED;
                ENEstimateItemShortList eProducedList2 = eDAO.getScrollableFilteredList(eProducedFilter2, 0, -1);

                if(eProducedList2.totalCount > 1)
                    throw new EnergyproSystemException("������� � ������� ������������ �������� � �����: " + pList.get(i).workOrderNumber);

                /*�������� id ����������*/
                if(eProduced.materialRef.code != eProducedList2.get(0).materialRefCode)
                    throw new EnergyproSystemException("������������ ������� \""+maObj.name + "\" �� ������� � ����� ������������ ��������� \""+eProducedList2.get(0).materialRefName+"\" � ����� " + pList.get(i).workOrderNumber);


                /*������� ������������ ��� ������������� ���������� �� ������ ������ ���������� � ���*/
                FINMaterialsFilter fFilter2 = new FINMaterialsFilter();
                fFilter2.estimateItemRef.code = eProducedList2.get(0).code;
                FINMaterialsShortList fList2 = fDAO.getScrollableFilteredList(fFilter2,0,-1);

                if(!fList2.get(0).nn.equals(fList.get(0).nn))
                    throw new EnergyproSystemException("������������ '"+fList.get(0).nn+"' �� ������� � ������������� '"+fList2.get(0).nn+"' ");



            }
        } /* ����� �������� ����� �� ������������ */


        /*�������� ������ �� ���������*/
        if (plan.stateRef.code == ENPlanWorkState.REFINEMENT && elementObj.typeRef.code != ENElementType.METROLOGY_COUNTER)
        {
            ActLogic aLogic = new ActLogic(enConn,getUserProfile());
            ENPlanWorkDAO pDAO = new ENPlanWorkDAO(enConn,getUserProfile());
            String planCodes = aLogic.getPlanCodesByAct(object.actRef.code);

            /*������ ���� ������ � ����*/
            ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
            pFilter.conditionSQL = "ENPLANWORK.CODE IN ("+planCodes+")";
            int[] pCodes = pDAO.getFilteredCodeArray(pFilter, 0, -1);

            ENEstimateItemFilter eRefinedFilter = new ENEstimateItemFilter();
            eRefinedFilter.planRef.code = plan.code;
            eRefinedFilter.kindRef.code = ENEstimateItemKind.REFINEMENT;
            ENEstimateItemShortList eRefinedList = eDAO.getScrollableFilteredList(eRefinedFilter, 0, -1);

            /*�������� ������������ ���������� � ������ � ����� ���� ���������*/
            if(eRefinedList.totalCount > 1)
                throw new EnergyproSystemException("�� ���� ������ ���� ���� ������ ���������� ��������");

            if(eRefinedList.totalCount == 1)
            {
                ENEstimateItem eRefined = eDAO.getObject(eRefinedList.get(0).code);

                ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
                piFilter.planRef.code = plan.code;
                piFilter.conditionSQL = "COUNTGEN <> 0";

                FINMaterialsDAO fDAO = new FINMaterialsDAO(enConn,getUserProfile());

                /*������� ����� ������������ ��� ������������� ���������*/
                FINMaterialsFilter fFilter = new FINMaterialsFilter();
                fFilter.estimateItemRef.code = eRefined.code;
                FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter,0,-1);

                if(fList.totalCount != 1)
                    throw new EnergyproSystemException("������� � ������� ���������� �������� � ����, ���: "+plan.code);

                FINMaterials fMatRefined = fDAO.getObject(fList.get(0).code);




                    for(int i=0;i < pCodes.length; i++)
                    {
                        ENEstimateItemFilter eRefinedFilter2 = new ENEstimateItemFilter();
                        eRefinedFilter2.planRef.code = pCodes[i];
                        eRefinedFilter2.kindRef.code = ENEstimateItemKind.REFINEMENT;
                        ENEstimateItemShortList eRefinedList2 = eDAO.getScrollableFilteredList(eRefinedFilter2, 0, -1);

                        if(eRefinedList2.totalCount >= 1)
                        {
                            ENPlanWorkShort pwShortObj = pDAO.getShortObject(pCodes[i]);
                            throw new EnergyproSystemException("\n\n"
                            		+ "� ��� ��� � ���������� �������, ����� �����-��������: " + pwShortObj.workOrderNumber);
                        }
                    }

                /*������ � ���� �� ����� �������������� ��������*/
                ENEstimateItemFilter eBeforeRefinedFilter = new ENEstimateItemFilter();
                eBeforeRefinedFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
                eBeforeRefinedFilter.planRef.code = eRefined.planRef.code;
                eBeforeRefinedFilter.planItemRef.code = eRefined.planItemRef.code;
                eBeforeRefinedFilter.materialRef.code = eRefined.materialRef.code;
                eBeforeRefinedFilter.conditionSQL = "enestimateitem.countfact <> 0";
                int[] eBeforeRefined = eDAO.getFilteredCodeArray(eBeforeRefinedFilter, 0, -1);
                if (eBeforeRefined.length == 0)
                    throw new EnergyproSystemException("\n\n"
                    		+ "�� �������� ������� �� ������� ...");

                int countBeforeRefined = 0;
                FINMaterials fBeforeRefinedObj = new FINMaterials();

                for(int i = 0; i < eBeforeRefined.length; i++)
                {
                    FINMaterialsFilter fBeforeRefinedFilter = new FINMaterialsFilter();
                    fBeforeRefinedFilter.statusRef.code = FINMaterialsStatus.GOOD;
                    fBeforeRefinedFilter.estimateItemRef.code = eBeforeRefined[i];
                    FINMaterialsShortList fBeforeRefinedList = fDAO.getScrollableFilteredList(fBeforeRefinedFilter,0,-1);

                    if(fBeforeRefinedList.totalCount > 0)
                    {
                        if(fBeforeRefinedList.totalCount != 1)
                            throw new EnergyproSystemException("\n\n"
                            		+ "������� � ������� �������� �� �������");
                        countBeforeRefined += 1;
                        fBeforeRefinedObj = fDAO.getObject(fBeforeRefinedList.get(0).code);
                    }
                }

                /*�������� - �� ����� � ���������� ����� ��������� ������ ���� ����
                * �������� �� ���������*/
                if(countBeforeRefined == 0)
                    throw new EnergyproSystemException("\n\n"
                    		+ "�� �������� ������� �� �������");

                if(countBeforeRefined > 1)
                    throw new EnergyproSystemException("\n\n"
                    		+ "�������� ������� �������� �� �������");

                /*������������ ���������� �� � ����� ��������� ������ ����������*/
                /* 2014.08.01 SUPP-20892 ������ �.�. ��������� ���� ������ �����������*/
                /**if(fBeforeRefinedObj.mat_id == fList.get(0).mat_id)
                    throw new EnergyproSystemException("������������ �������� �� �� ���� ������� ������ ����������");*/

                /*���������� ���������� �� � ����� ��������� ������ ���������*/
                if(fBeforeRefinedObj.quantity.compareTo(fList.get(0).quantity) != 0)
                    throw new EnergyproSystemException("\n\n"
                    		+ "�� ������� ������� �������� �� �� ���� �������");

                /*�������� ������ ���������*/
                // ��� ������ ����������� �� AX ���� mu_id ����� ������
                /*
                if(fBeforeRefinedObj.mu_id != fMatRefined.mu_id)
                    throw new EnergyproSystemException("\n\n"
                    		+ "� �������� �� �� ���� ������� �� ���������� ������� �����");
                */
                if(! fBeforeRefinedObj.mu_name.equals(fMatRefined.mu_name))
                    throw new EnergyproSystemException("\n\n"
                    		+ "� �������� �� �� ���� ������� �� ���������� ������� �����");


            }

            /*�������� ���� �� ����� �������� ����� ��������� � � ���� ��� �����-�������
            * � ������������ ����������, �� �������� ����������*/
            if(eRefinedList.totalCount == 0)
            {
                    boolean isExistRefinedMaterial = false;
                    for(int i=0;i < pCodes.length; i++)
                    {
                        ENEstimateItemFilter eRefinedFilter2 = new ENEstimateItemFilter();
                        eRefinedFilter2.planRef.code = pCodes[i];
                        eRefinedFilter2.kindRef.code = ENEstimateItemKind.REFINEMENT;
                        ENEstimateItemShortList eRefinedList2 = eDAO.getScrollableFilteredList(eRefinedFilter2, 0, -1);

                        if(eRefinedList2.totalCount >= 1)
                            isExistRefinedMaterial = true;
                    }
                    if(!isExistRefinedMaterial)
                        throw new EnergyproSystemException("\n\n"
                        		+ "������� ������� ���� �������");
            }
        } /* ����� �������� ����� �� ��������� */


        // NET-4383 �������� ��� ������ �� �������� �� �������� ��� �� ���� ��������� ������ ��� �������� ENPlanWorkENAct2OSData
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_OS) {

        ENPlanWorkENAct2OSDataFilter pl2act2osFilter = new ENPlanWorkENAct2OSDataFilter();
        pl2act2osFilter.planWorkRef.code = object.plan.code;

        int[] pl2act2osArr =  pl2act2osDAO.getFilteredCodeArray(pl2act2osFilter, 0, -1);
        if(pl2act2osArr.length == 0 )
            throw new EnergyproSystemException("\n\n"
            		+ "�� ���� ������� ���������� ��� �������� �� !!! ");
        }

        ENActDAO actDAO = new ENActDAO(enConn,getUserProfile());
        ENAct act_ = actDAO.getObject(object.actRef.code);

        if (act_.statusRef.code != ENActStatus.GOOD){
            throw new EnergyproSystemException("\n\n"
            		+ "��� ��� �� �������� ... ��������� � ������ ��������, � ���� ��������� ����� � ��� ...");
        }

        // �������� ���� ���� � ����� ... � �� ��� ������??? ������!!!
        if (act_.dateGen.before(plan.dateStart)){
            throw new EnergyproSystemException("\n\n"
            		+ "���� ����("+ act_.code +") ������� ���� ����� �� ���� �����-��������("+plan.code+") ...");
        }

        actLogic.validateAct2Plan(act_, object.plan.code);

        ElementLogic elementLogic = new ElementLogic(enConn,getUserProfile());
        int eType = elementLogic.getElementTypeByPlanCode(object.plan.code);

        /*NET-2938*/
        boolean isOS = fkOsLogic.isOS(act_.element.code);
        if(isOS == true)
            {
                /*���� ������ ����� - �������� ��������, �� ����������� ����������� � ������������*/
                String invNumber = elementLogic.getElementInvNumber(act_.element.code);
                if(invNumber.length() == 5) invNumber = "0" + invNumber;
                boolean isInService = fkOsLogic.isInService(invNumber);
                if(!isInService)
                    throw new EnergyproSystemException("\n\n"
                    		+ "�������� ���� � ���. ������� " + invNumber + " �� �������� � ������������");
            }


        // �������� ����� � ������ ������� � ��� ������� ...
        // �������� ����� � ��
        if (
                (plan.dateStart.getMonth() != act_.dateAct.getMonth())
                || (plan.dateStart.getYear() != act_.dateAct.getYear())

                /** SUPP-6950... 11.09.2013 +++ �� ��������� ���� ���������� ����....
                || (plan.dateStart.getMonth() != act_.dateGen.getMonth())
                || (plan.dateStart.getYear() != act_.dateGen.getYear())
                */
        )
        {
            // ��� ����� �� ������� ����� ���� ��������� ��� �� ������ - � ���� ����� ���������� ������ � ������ �������
            // (� ��� ���� ������ ���� ���� - 28.09.11)
            //   if (eType != ENElementType.SERVICES_OBJECT && plan.budgetRef.code != ENConsts.ENBUDGET_VRTU && plan.budgetRef.code != ENConsts.ENBUDGET_SIT )

            if (plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT)
            {
                if(eType != ENElementType.SERVICES_OBJECT)
                    throw new EnergyproSystemException("\n" +
                            "г� �� ����� ���� � ����� ������ ��������� ...");
            }
        }

        // 28.10.2019 ��� ����� �� �����������/���������� �� ������� ����������� 
        // ��������� ����� � ��� ����� �������
        if (eType == ENElementType.TY_BYT) { // ���� ������ ��� ����
        	if (! isFromBilling && planLogic.checkPlanByServicesObjectForSupplier(plan.code, false)) {
        		// ��������, �� ������ �� ��� ��� ������� ������� �� �������� (���� ��, �� ���� ������ �������� � ���)
        		if (! planLogic.checkIfDataHubDisconnectionCompleted(plan.code)) {
        			if (! getUserProfile().userName.equalsIgnoreCase("energynet")) {
        				if (! authLogic.checkPermissionSilent("ksoe/energynet/ENActController", "addForDisconnectionWithoutBilling")) {
	        				throw new SystemException("\n\nNET-4576 ��� ���� �� �������� ������������� ��������-���� ���������� �� ���� " +
	        						"����������� �� ��� �������� ���� � �����!");
        				}
        			}
        		}
        	}
        }

        // ��� ���� �������� ����������� �� ����
        // ��� �������� ����� ;) ... ������ ��������� ������ ��� ��� ��� ������������ � �������� ...
        if (isClient == ENConsts.isClient_CLIENT){
            //ElementLogic elementLogic = new ElementLogic(enConn,getUserProfile());
            //int eType = elementLogic.getElementTypeByPlanCode(object.plan.code);
            if (eType == ENElementType.TY_BYT){

                ENRecordPointBytDAO rpBytDAO = new ENRecordPointBytDAO(enConn,getUserProfile());
                ENRecordPointBytFilter rpBytFilter = new ENRecordPointBytFilter();
                rpBytFilter.element.code = act_.element.code;
                int[] rpArr = rpBytDAO.getFilteredCodeArray(rpBytFilter,0,-1);
                if (rpArr.length != 1){
                    throw new EnergyproSystemException("\n\n"
                    		+ "�� �� ������� ... ��� ��������="+act_.element.code + woNumber);
                }

                ENRecordPointByt rpByt = rpBytDAO.getObject(rpArr[0]);
                act_.invNumber = rpByt.invNumber;
                actDAO.save(act_);
            }
        }

        ENAct2ENPlanWorkDAO objectDAO = new ENAct2ENPlanWorkDAO(getUserProfile(),enConn);

        //ENAct act = new ENActDAO(enConn,getUserProfile()).getObject(object.actRef.code);

        //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn,getUserProfile());

        //ENPlanWork plan = planDAO.getObject(object.plan.code);

        //plan.stateRef.code = act.actTypeRef.code;
        //planDAO.save(plan);

/*


        f3.workOrder.code = woLogic.getWorkOrderByPlanCode(object.plan.code).code;

        FINMolDataFilter f = new FINMolDataFilter();
        f.act.code = object.actRef.code;
        f.molTypeRef.code =
*/

        FINMolDataDAO molDataDAO = new FINMolDataDAO(enConn,getUserProfile());

        //WorkOrderLogic woLogic = new WorkOrderLogic(enConn,getUserProfile());

        FINMolDataDAO dao2 = new FINMolDataDAO(enConn,getUserProfile());
        FINMolDataFilter f2 = new FINMolDataFilter();
        f2.act.code = object.actRef.code;
        FINMolDataShortList actList = dao2.getScrollableFilteredList(f2,0,-1);


        FINMolDataFilter f3 = new FINMolDataFilter();
        f3.workOrder.code = wo.code; //woLogic.getWorkOrderByPlanCode(object.plan.code).code;
        //f3.conditionSQL = " FINDOC2MOLDATA.FINDOCTYPEREFCODE <> " + FINDocType.MOVE_28_302;

        FINMolDataShortList woList = dao2.getScrollableFilteredList(f3,0,-1);

        boolean isExist = false;
        if (actList.totalCount > 0 ) {
        for (int i = 0; i < woList.totalCount; i++){
            isExist = false;
            for (int j = 0; j < actList.totalCount; j++){
                if (
                        (actList.get(j).finMolCode.equals( woList.get(i).finMolCode))
                        && (actList.get(j).molTypeRefCode == woList.get(i).molTypeRefCode)
                    ){


                    isExist = true;
                    break;
                }
            }

            if (! isExist){
                FINMolData m = new FINMolData();
                m.finMolCode = woList.get(i).finMolCode;
                m.finMolName = woList.get(i).finMolName;
                m.molTypeRef.code = woList.get(i).molTypeRefCode;
                m.act.code = object.actRef.code;
                m.workOrder.code = Integer.MIN_VALUE;
                m.code = molDataDAO.add(m);
            }

        }
        }
        else{
            // ���� ������� �� ���� ... ��������� ��� � ����� ...
            for (int j=0; j<woList.totalCount; j++){
                FINMolData m = new FINMolData();
                m.finMolCode = woList.get(j).finMolCode;
                m.finMolName = woList.get(j).finMolName;
                m.molTypeRef.code = woList.get(j).molTypeRefCode;
                m.act.code = object.actRef.code;
                m.workOrder.code = Integer.MIN_VALUE;
                m.code = molDataDAO.add(m);

                if (woList.get(j).molTypeRefCode == FINMolType.MASTER ){
                    // ��� ������� �� ������ ;)
                    // if ()
                    ENAct act = actDAO.getObject(object.actRef.code);
                    act.finMolCode = woList.get(j).finMolCode;
                    act.finMolName = woList.get(j).finMolName;
                    actDAO.save(act);
                }

            }
        }


        /** 10.04.2014 +++ � ��� ����� �� ������� �����? */
        if (plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE
                && plan.typeRef.code != ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {

            /* NET-2677
             * ��� ��������� �� ���������
             * ����� ���� ������ ��������� ����������� ������ �������� � EnergyNet*/
            ENTechCond2PlanWorkDAO tc2pwDAO = new ENTechCond2PlanWorkDAO(enConn, getUserProfile());
            ENTechCond2PlanWorkFilter tc2pwFilter = new ENTechCond2PlanWorkFilter();
            tc2pwFilter.planRef.code = object.plan.code;
            ENTechCond2PlanWorkShortList tc2pwList = tc2pwDAO.getScrollableFilteredList(tc2pwFilter, 0, -1);

            if (tc2pwList.totalCount > 0) {
                ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(enConn, getUserProfile());
                ENTechConditionsServicesFilter tcServicesFilter = new ENTechConditionsServicesFilter();
                tcServicesFilter.code = tc2pwList.get(0).techConServicesRefCode;
                ENTechConditionsServicesShortList tcServicesList = tcServicesDAO.getScrollableFilteredListWITHOUT_SEGR(
                                tcServicesFilter, null, null, 0, 1, null);

                if (tcServicesList.get(0).contractNumber.equals(act_.numberGen) != true)
                    throw new EnergyproSystemException("\n\n" +
                            "����� ���� ������� ���������� ����������� ������ ��������, ����� "
                                    + tcServicesList.get(0).contractNumber);
            }
        }



/*
        if (arr2.length == 0){

            ENWorkOrder wo = woLogic.getWorkOrderByPlanCode(object.plan.code);

            FINMolData molData = new FINMolLogic(enConn,getUserProfile())
                                                .getFINMolDataByWorkOrderCode(wo.code, FINMolType.MASTER);



            molData.code = molDataDAO.add(molData);

            FINDoc2MolData molData2 = new FINDoc2MolData();
            molData2.act.code = object.actRef.code;
            molData2.workOrder.code = Integer.MIN_VALUE;
            molData2.finDocCode = Integer.MIN_VALUE;
            molData2.finDocTypeRef.code = FINDocType.MOVE_300;
            molData2.molData.code = molData.code;
            dao2.add(molData2);
        }
*/

        int out__ = objectDAO.add(object);

        // 08.06.2018 ��������, ��� � ��� �� ������� ��������� �� ������ �������� � ������� �������
        // 23.07.2019 SUPP-84238 ����� � ��� ���� �� ����������
        if(act_.actTypeRef.code == ENPlanWorkState.COUNTERS_STATE_VERIFICATION
        		|| act_.actTypeRef.code == ENPlanWorkState.COUNTERS_EXPERTISE) {
        	counterLogic.checkAccountsEqualityByActCode(act_.code, true);
        }

         /** NET-4422... 05.03.2015... +++ ������ �� ������ �������� (������� �� ������������� ����) */
		 if (eType != ENElementType.SERVICES_OBJECT) {
	        // ���� �� .. �������� ������� ���� ���� ;) .. �� ���� ..
	        int isSCCounterInAct = actLogic.checkInSCCounterByActCode(object.actRef.code, false, null);
	        //System.out.println("##act code = " + object.actRef.code + " planCode " + object.plan.code + " isSC = " + isSCCounter);
	        if (isClient == 1) {
	            if (isSCCounterInAct == 1)
	            {
	                System.out.println("actCode = " + object.actRef.code);
	                    System.out.println("planCode = " + object.plan.code);
	                throw new EnergyproSystemException("������� � ���� ��'������ � ���������� ... ����������� ���������� ... ");
	            }
	        }

	        if (isSCCounterInAct == 1) {
	            plan.status.code = ENPlanWorkStatus.LOCKED;
	            planDAO.save(plan);
	        }
		 }



        // NET-2409 // ��� ����� �� ������� ��� ����������� � ���� ������ �� ������� �� ������������� ������ �������� ����������
        if (eType != ENElementType.SERVICES_OBJECT || act_.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT ){
            ENAct2CostRecoveryDAO costDAO = new ENAct2CostRecoveryDAO(enConn,getUserProfile());
            
            if(!costDAO.costAlreadyIncludedByActCode(act_.code)) {
            	ENAct2CostRecoveryShortList costList = costDAO.getList4Cost(act_.element.code);
                // ���� ���� ������ � �������� �� ������������ � ������������ ��������� �����������
                for (int i=0; i < costList.totalCount; i++){
                    ENAct2CostRecovery objCost = new ENAct2CostRecovery();
                    objCost.actRef.code = act_.code;
                    objCost.classificationTypeRef.code = costList.get(i).classificationTypeRefCode;

                    objCost.name = costList.get(i).name;
                    objCost.measureUnitName = costList.get(i).measureUnitName;
                    objCost.countGen = costList.get(i).countGen;
                    objCost.price = costList.get(i).price;
                    objCost.summa = costList.get(i).summa;

                    costDAO.add(objCost);
                }
            }
        }

        // NET-2938
        ENTransportItemDAO tDAO = new ENTransportItemDAO(enConn,getUserProfile());
        ENTransportItemFilter tFilter = new ENTransportItemFilter();
        tFilter.planRef.code = object.plan.code;
        ENTransportItemShortList tsiList = tDAO.getScrollableFilteredList(tFilter, 0, -1);
        for(int i = 0; i < tsiList.totalCount; i++)
        {
            if(tsiList.get(i).transportRealCode != Integer.MIN_VALUE)
            {
                boolean isInService = fkOsLogic.isInService(tsiList.get(i).transportRealInvNumber);
                if(!isInService)
                    throw new EnergyproSystemException("�������� ���� " + tsiList.get(i).transportRealName + " �� �������� � ������������");
            }

            if(tsiList.get(i).finWorkerCode != Integer.MIN_VALUE)
            {
                // SUPP-2238 ���� ���������� ����������� ����� ��������� ������ � ���� �� �������� �������
                FINWorker fo = finWoDAO.getObject(tsiList.get(i).finWorkerCode);
                if(fo != null && fo.departmentCode.trim().equals((""+FKConsts.PODR_MANAGEMENT_ID).trim()))
                {
                    if(act_.actTypeRef.code != ENPlanWorkState.TRUCKING)
                    {
                        ENPlanWorkState actType = planWorkStateDAO.getObject(act_.actTypeRef.code);
                        throw new EnergyproSystemException("���������� " + tsiList.get(i).finWorkerName + " �� ������� ������ � ��� � ����� " + actType.name);
                    }
                }
            }
        }

        // �������� ������� ���������� ����� �� ����������, ��� �� � ���� ��� �� ����������
        // ���� � ������ �������� ����������
        // �� ������� ������� SUPP-69092
        ENPlanWorkReasonDAO planReasonDAO = new ENPlanWorkReasonDAO(enConn, getUserProfile());
        ENPlanWorkReasonFilter planReasonFilter = null;
        ENPlanWorkReason currentReason = new ENPlanWorkReason();
        int monthPlanCode = planLogic.getMonthPlanCodeByAnyPlanCode(object.plan.code, false);
        if(monthPlanCode != Integer.MIN_VALUE) {
            ENPlanWork monthPlan = planDAO.getObjectNOSEGR(monthPlanCode);

            planReasonFilter = new ENPlanWorkReasonFilter();
            /// ��������� ������� ��� �������� �����
            planReasonFilter.conditionSQL = " enplanworkreason.code in "
            		+ "(select enplanwork2planworkrsn.planworkreasonrefcode "
            		+ " from enplanwork2planworkrsn where planrefcode = " + monthPlan.code + ")";
            ENPlanWorkReasonShortList planReasonList = planReasonDAO.getScrollableFilteredList(planReasonFilter,0,-1);

            if (planReasonList.totalCount > 0)
            {
            	currentReason = planReasonDAO.getObject(planReasonList.get(0).code);
            }
        }

        /// ��������� ������� ��� ��� ���������� � ��� ������
       	String monthPlansCodes = "" + Integer.MIN_VALUE;
    	ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
    	act2planFilter.actRef.code = object.actRef.code;
    	ENAct2ENPlanWorkShortList act2planList = objectDAO.getScrollableFilteredList(act2planFilter, 0, -1);
    	for (int ii=0;ii<act2planList.totalCount;ii++) {
    		monthPlansCodes = monthPlansCodes + ", " + planLogic.getMonthPlanCodeByAnyPlanCode(act2planList.get(ii).planCode, false);
            }

    	ENPlanWorkFilter monthPlanFilter = new ENPlanWorkFilter();
    	monthPlanFilter.conditionSQL = " enplanwork.code in (" + monthPlansCodes + ")";
    	int[] planArr = planDAO.getFilteredCodeArray(monthPlanFilter, 0, -1);

    	for (int pp=0;pp<planArr.length;pp++) {

    		planReasonFilter = new ENPlanWorkReasonFilter();
        	planReasonFilter.conditionSQL = " enplanworkreason.code in "
    		+ "(select enplanwork2planworkrsn.planworkreasonrefcode "
    		+ " from enplanwork2planworkrsn where planrefcode in (" + planArr[pp] + "))";
    		ENPlanWorkReasonShortList planReasonOnActList = planReasonDAO.getScrollableFilteredList(planReasonFilter, 0, -1);

    		/// �������� �� ���������� ������� � ����� ����������, ���� ������������
    		if (planReasonOnActList.totalCount > 0)
    		{
    			if (currentReason.code == Integer.MIN_VALUE) {
    				throw new SystemException("��� ����� ���� ������� ϳ������ ���������! ������ �� �������� ���� � ����� ���������� ��� ���� ϳ������ ��������� ����!");
    			}

    			if (currentReason.code != Integer.MIN_VALUE) {
    				for (int bzz=0;bzz<planReasonOnActList.totalCount;bzz++)
    				{
    					ENPlanWorkReason reasonOnAct = planReasonDAO.getObject(planReasonOnActList.get(bzz).code);
    					if (reasonOnAct.code != currentReason.code) {
    						throw new SystemException("��� ���� �� ����� �� �������� ���� ������� ϳ������ ��������� - " + reasonOnAct.name + "\n" +
    					              " ��� ����� ����� ������� ϳ������ - " + currentReason.name + "\n" +
    								  " ��� ������ ������� ϳ������ ��������� ����, ��� ��������� ����� ��� ��������� ����!");
    					}
    				}
    			}
    		}

    		if (planReasonOnActList.totalCount == 0 && currentReason.code != Integer.MIN_VALUE) {
    			throw new SystemException("��� ���� �� ����� �� �������� ���� �� ������� ϳ������ ���������!" + "\n" +
    		              " ��� ����� ����� ������� ϳ������ - " + currentReason.name + "\n" +
    					  " ��� ������ ϳ������ ��������� ���� ��� ������� ����� � ���� ��������� ����� ������� �� ����, ��� ��������� ����� ��� ��������� ����!");
    		}

    	}

    	// ��� ����� �� ����������� �� ������� ����������� ������������ ���������� � DocFlow
    	planLogic.registerServiceFinishForSupplier(plan.code);
    	
    	// �������� �� ������ ����������� � ���� 
    	
    	AuthLogic netAuth = new AuthLogic(
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
        //FKLogic2 finLogic = new FKLogic2(getConnection(finConnectionData.connectionString), getUserProfile());
        mDaxLogic mdLogic = new mDaxLogic(getConnection(finConnectionData.connectionString), getUserProfile());
        
       ENAct2ENPlanWorkFilter a2pFil = new ENAct2ENPlanWorkFilter();
        a2pFil.actRef.code = act_.code;
        ENAct2ENPlanWorkShortList a2pList = plan2actDAO.getScrollableFilteredList(a2pFil,0,-1);
        for (int gg = 0; gg < a2pList.totalCount; gg++) {
			
		
        
		        FINWorkerFilter fFil = new FINWorkerFilter();
		        fFil.conditionSQL = " finworker.code in ( select f.code  from enhumenitem e , enplanworkitem e2 ,   finworker f   \n" +  
		                               " where e2.code =e.planitemrefcode \n" +
		                               " and e.finworkercode is not null   \n" +
		                               " and e2.countgen > 0 \n" +
		                               " and e.finworkercode = f.code \n" +		                               
		                               " and e2.planrefcode= "+ a2pList.get(gg).planCode +")   ";
		        FINWorkerShortList fList = finWoDAO.getScrollableFilteredList(fFil, 0, -1);
		        for (int d = 0; d < fList.totalCount; d++) {
					 
		        	boolean isWorkerOnHolidays = mdLogic.isWorkerOnHolidays(fList.get(d).tabNumber, a2pList.get(gg).planDateStart, 
		        			false , mdLogic.VACATION );
					if (isWorkerOnHolidays) {
						
						ENPlanWork plObj = planDAO.getObject(a2pList.get(gg).planCode); 
						
						throw new SystemException("\n\n " + fList.get(d).name + "(" + fList.get(d).tabNumber +") �� ���� " + new SimpleDateFormat("dd.MM.yyyy").format(plObj.dateStart)  + " �������� � ��������.\n"
								+ " ������ ������ ���������.");
					}
				}
    	}
        
        // �������� �� ���������� �������� ������� �� ���������� � ����� checkFinworkerCountfactWorkDay SUPP-104240 
        humLogic.checkFinworkerCountfactWorkDay(object.plan.code, "");
        
        return out__;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAct2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
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

    public void remove(int code, int isClient) {
    	remove(code, isClient, false);
    }
    
    /*ENAct2ENPlanWork. �������*/
    // isClient - 1 - �� �������, 0 - ���� �� ������������� , 100 - ����������� �������� ...
    public void remove(int code, int isClient, boolean isFromBilling)
    {
    	Connection finConn = null;
		Connection enConn = null;
        try
        {

        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


        ENAct2ENPlanWorkDAO objectDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), enConn);
        ENAct2ENPlanWork object = objectDAO.getObject(code);
        ENPlanWorkENAct2OSDataDAO pl2act2osDAO = new ENPlanWorkENAct2OSDataDAO(getUserProfile(), enConn);
        ENAct2DFDocDecreeDAO a2docdecrDAO = new ENAct2DFDocDecreeDAO(getUserProfile(),enConn);

        AuthLogic authLogic = new AuthLogic(enConn, getUserProfile());
        
        // �������� ����� �� ���� ��������� ���� ������ ������� ...
        // ���� ������ ������� - ����� ��������� �� ���� ???
         
        ENAct2DFDocDecreeFilter a2decrFil = new ENAct2DFDocDecreeFilter();
		a2decrFil.actRef.code = object.actRef.code;
		int[] a2decrArr = a2docdecrDAO.getFilteredCodeArray(a2decrFil, 0, -1);
		if (a2decrArr.length > 0) {
			throw new EnergyproSystemException("\n\n��� ���� ������� ������� ��������� ������������� ��� ������ �������!!!");
		/*	Context act2DocDecree = new InitialContext();
            Object  act2DocDecreeObj = act2DocDecree.lookup(ENAct2DFDocDecreeController.JNDI_NAME);
            ENAct2DFDocDecreeControllerHome act2DocDecreeHome = (ENAct2DFDocDecreeControllerHome) PortableRemoteObject.narrow(act2DocDecreeObj, ENAct2DFDocDecreeControllerHome.class);
            ENAct2DFDocDecreeController act2DocDecreeController = act2DocDecreeHome.create();
            
            for (int k = 0; k < a2decrArr.length; k++) {
            	ENAct2DFDocDecree aENAct2DFDocDecree = a2docdecrDAO.getObject(a2decrArr[k]);
            	act2DocDecreeController.removeByObj(aENAct2DFDocDecree);
    		}*/
		}
		

		
        
        if ( isClient == 1){

            if ( ! authLogic.checkPermission4PlanItems(object.plan.code) )
            {
                throw new EnergyproSystemException("Access denied for method addBy... from method add(ENAct2ENPlanWork object)");
            }

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), enConn);
            ENPlanWork p = planDAO.getObject(object.plan.code);
            // ��� ������ �������� ����� �� ��������������� ���� �����
            if (p.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || p.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || p.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                    throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
                }
            }

            // NET-1026 ��� �������� ���������
            if (p.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
            {
                if (!authLogic.checkPermission("ksoe/energynet/SCCounterController", "removeCountersForWriteOff")) {
                    throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
                }
            }
        }

        ENActDAO actDAO = new ENActDAO(enConn, getUserProfile());
        ENAct act = actDAO.getObject(object.actRef.code);
        ActLogic actLogic = new ActLogic(enConn, getUserProfile());
        
        ENActInTechCond2ENActDAO actIncome2ActDao = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
        ENActIncomeTechConditions actIncomeTechCond = actIncome2ActDao.getActIncomeByENActCode(act.code);
        if(actIncomeTechCond != null) {
        	throw new SystemException(String.format("���������� ��� � %s �� %s ��'������ � ����������� ����� �� �������� ������ � %s �� %s. �������� ���� ���������."
        			, act.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)
        			, actIncomeTechCond.numbergen, new SimpleDateFormat("dd.MM.yyyy").format(actIncomeTechCond.dategen)));
        }

         /** NET-4422... 05.03.2015... +++ ������ �� ������ �������� (������� �� ������������� ����) */
		 if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
			 if (isClient == 1) {
				 actLogic.checkInSCCounterByActCode(object.actRef.code, true);
		     }
		 }


        if (act.statusRef.code != ENActStatus.GOOD){
            // ��� ��������� �� ��� � �� ���������� ...
            if ( ! ((act.statusRef.code == ENActStatus.SIGNATURE) && (isClient == ENConsts.isClient_SCCOUNTER))){
                throw new EnergyproSystemException("��� ��� �� �������� ... ��������� � ������ ��������, � ���� ��������� ����� � ���� ...");
            }
        }

        PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
        
        // 28.10.2019 ��� ����� �� �����������/���������� �� ������� ����������� 
        // ��������� ����� � ��� (� ������� ����) ����� �������
        if (act.element.typeRef.code == ENElementType.TY_BYT) { // ���� ������ ��� ����
        	if (! isFromBilling && planLogic.checkPlanByServicesObjectForSupplier(object.plan.code, false)) {
        		if (! getUserProfile().userName.equalsIgnoreCase("energynet")) {
        			if (! authLogic.checkPermissionSilent("ksoe/energynet/ENActController", "addForDisconnectionWithoutBilling")) {
        				throw new SystemException("\n\nNET-4576 ��� ���� �� �������� ������������� ��������-���� ���������� �� ����������� � ���� ����� � �����!");
        			}
        		}
        	}
        }        
        
        actLogic.validateAct2Plan(act, object.plan.code);

        WorkOrderLogic woLogic = new WorkOrderLogic(enConn, getUserProfile());

        int woCode = woLogic.getWorkOrderByPlanCode(object.plan.code).code;

        FINMolDataDAO dao2 = new FINMolDataDAO(enConn, getUserProfile());

        FINMolDataFilter f2 = new FINMolDataFilter();
        f2.act.code = object.actRef.code;
        FINMolDataShortList actList = dao2.getScrollableFilteredList(f2,0,-1);

        int actCode = object.actRef.code;
        int planCode = object.plan.code;

        //ActCalculator actClc = new ActCalculator(enConn, getUserProfile());

        // ��� ��������� ��� �� ���� ...
        if (isClient != ENConsts.isClient_SCCOUNTER)
        {

        FINMolDataFilter f3 = new FINMolDataFilter();
        f3.conditionSQL = "  FINMOLDATA.WORKORDERCODE <> " + woCode +
                            " and FINMOLDATA.WORKORDERCODE in (select ENWORKORDER2ENPLANWORK.WORKORDERCODE from ENACT2ENPLANWORK, ENWORKORDER2ENPLANWORK where ENACT2ENPLANWORK.PLANCODE = ENWORKORDER2ENPLANWORK.PLANCODE "+
                            " and ENACT2ENPLANWORK.ACTREFCODE = "+ object.actRef.code +")";

        //f3.workOrder.code = woLogic.getWorkOrderByPlanCode(object.plan.code).code;
        FINMolDataShortList woList = dao2.getScrollableFilteredList(f3,0,-1);



        boolean isExist = false;

        for (int i = 0; i < actList.totalCount; i++){
            isExist = false;
            for (int j = 0; j < woList.totalCount; j++){
                if (
                        (actList.get(i).finMolCode.equals( woList.get(j).finMolCode))
                        && (actList.get(i).molTypeRefCode == woList.get(j).molTypeRefCode)
                    ){
                    isExist = true;
                    break;
                }
            }

            if ( ! isExist ){
                dao2.remove(actList.get(i).code);
                if (actList.get(i).molTypeRefCode == FINMolType.MASTER ){
                    //ENActDAO actDAO = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                    //ENAct act = actDAO.getObject(object.actRef.code);
                    act.finMolCode = null;
                    act.finMolName = null;
                    actDAO.save(act);
                }
                //molDataDAO.remove(actList.get(i).molDataCode);
            }
        }

            // ����� �� ���� ... � ����
            objectDAO.remove(code);

        } // ����� ��� ��������� // if (isClient != 100)
        else
        {
            for (int i = 0; i < actList.totalCount; i++){
                dao2.remove(actList.get(i).code);
            }

            // ������� ������� ������� �� ������ ...
            //ENPlan2HumenDAO p2hDAO = new ENPlan2HumenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            //p2hDAO.deleteByPlanCode(planCode);
            //actClc.deletePlan2HumenByTabNumberPlanCodeKindCode(null, planCode, Integer.MIN_VALUE);

            objectDAO.remove(code);
        }


        // NET-2409 // ��� ����� �� ������� ��� ����������� � ���� ������ �� ������� �� ������������� ������ �������� ����������
        // �������� �������� ���� � ������� �� �������� ��������� ������������

            ENAct2CostRecoveryDAO costDAO = new ENAct2CostRecoveryDAO(enConn, getUserProfile());
            ENAct2CostRecoveryFilter costFilter = new ENAct2CostRecoveryFilter();
            costFilter.actRef.code = actCode;
            ENAct2CostRecoveryShortList costList = costDAO.getScrollableFilteredList(costFilter, 0, -1);
                for (int i=0; i < costList.totalCount; i++){
                    costDAO.remove(costList.get(i).code);
            }

             // NET-4383 ���� ��� ���� �������� �� �� �������� � �������� enplanworkenact2osdata �������� � �������� � ����

                if ( act.actTypeRef.code == ENPlanWorkState.WRITINGS_OS) {

	                ENPlanWorkENAct2OSDataFilter pl2act2osFilter = new ENPlanWorkENAct2OSDataFilter();
	                pl2act2osFilter.actRef.code = act.code;
	
	                int[] pl2act2osArr =  pl2act2osDAO.getFilteredCodeArray(pl2act2osFilter, 0, -1);
	                if(pl2act2osArr.length > 0 ){
	                	ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getUserProfile(),enConn);
	                	ENWorkOrder2ENPlanWorkDAO  wo2plDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),enConn);
	
	                	ENPlanWorkENAct2OSData pl2act2osObj = pl2act2osDAO.getObject(pl2act2osArr[0]);
	
	                	pl2act2osObj.actRef.code = Integer.MIN_VALUE;
	                	pl2act2osObj.kod_ist = "";
	                	pl2act2osObj.name_ist = "";
	                	pl2act2osDAO.save(pl2act2osObj);
	
	                	// ��� �������� �� ���� ������ ���������� ��������� ��� �������� ��� ����� �������
	                	ENWorkOrder2ENPlanWorkFilter wo2plFilter = new ENWorkOrder2ENPlanWorkFilter();
	        	        wo2plFilter.plan.code = pl2act2osObj.planWorkRef.code;
	
	        	        ENWorkOrder2ENPlanWorkShortList wo2plList = wo2plDAO.getScrollableFilteredList(wo2plFilter, wo2plFilter.conditionSQL,
	        	        		"", 0, -1, null);
	
	        	        if (wo2plList.totalCount == 0 ){
	        	        	throw new EnergyproSystemException(" \n �� ���� �� �������� �����-�������� !!!");
	        	        }
	
	
	        	        ENWorkOrder woObject = woDAO.getObjectNOSEGR(wo2plList.get(0).workOrderCode);
	        	        FKOSLogic OSLogic = new FKOSLogic(finConn, getUserProfile());
	        	        OSLogic.lockOS(pl2act2osObj.num_un, RQConsts.TYPE_RESERVE_OS_WRITINGS, woObject.workOrderNumber, woObject.dateGen);
	
	                }

                }

            	// ��� ����� �� ����������� �� ������� ����������� �������� ����������� ���������� � DocFlow
            	planLogic.undoRegisterServiceFinishForSupplier(planCode);

            	// NET-4596 ���� � ���� �� �������� �������, �������� ��������� �������� � ����������������
            	// (������ ��� �� ����, ����� ����� �������� � ���, ������� ����� ����������� �� ���� -
            	// ��������, ���� � ��� �������� ����� � �������� "�� - ��������� ���", ��
            	// ����� ������������ ���������� "����������", ��� ����� ��� "����" � "�������" ��� ��-���)
            	ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
            	act2planFilter.actRef.code = actCode;
            	int[] act2planCodes = objectDAO.getFilteredCodeArray(act2planFilter, 0, -1);
            	if (act2planCodes.length == 0) {
    				actLogic.cancelDFDoc(actCode);
            	}
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENAct2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
       
        finally
        {
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

  public ENAct2ENPlanWorkControllerEJB() {}

  public void changeActType(int actCode, int actType) {
      try
      {
          Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
          UserProfile up = getUserProfile();

          ENActDAO actDAO = new ENActDAO(up, conn);
          ENAct act = actDAO.getObject(actCode);

          if (act.statusRef.code != ENActStatus.GOOD && act.statusRef.code != ENActStatus.SIGNATURE) {
        	  return;
          }
          
          boolean shouldReSignAct = (act.statusRef.code == ENActStatus.SIGNATURE);

          ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(up, conn);
          ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
          a2pFilter.actRef.code = actCode;
          
          int[] a2pArr = a2pDAO.getFilteredCodeArray(a2pFilter, 0, -1);          
          if (a2pArr.length != 1) {
        	  throw new SystemException("\n\nENAct2ENPlanWork.length = " + a2pArr.length + "! ActCode = " + actCode);
          }
          
          ///////////////
          Context context = new InitialContext();
          Object actRef = context.lookup(ENActController.JNDI_NAME);
          ENActControllerHome actHome = (ENActControllerHome) PortableRemoteObject.narrow(actRef, ENActControllerHome.class);
          ENActController actController = actHome.create();
          // ���� ��� �� ����������, ������� ������� ����������
          if (shouldReSignAct) {
        	  actController.unSignatured(actCode);
          }
          ///////////////

          ENAct2ENPlanWork a2pObject = a2pDAO.getObject(a2pArr[0]);
          int planCode = a2pObject.plan.code;

          // ������� ���� �� ����
          remove(a2pArr[0], ENConsts.isClient_SERVER);

          // ������ ��� ����
          act = actDAO.getObject(actCode);
          act.actTypeRef.code = actType;
          actDAO.save(act);
          
          // ��������� ���� ������� � ���
          a2pObject = new ENAct2ENPlanWork();
          a2pObject.actRef.code = actCode;
          a2pObject.plan.code = planCode;
          add(a2pObject, ENConsts.isClient_SERVER);

          // ���� ��� ��� �� ����������, ������ ��� � ���� ������
          if (shouldReSignAct) {
        	  actController.signatured(actCode);
          }          
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't changeActType",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  catch (NamingException e) {
		  throw new SystemException(e.getMessage(), e);
	  } catch (RemoteException e) {
		  throw new SystemException(e.getMessage(), e);
	  } catch (CreateException e) {
		  throw new SystemException(e.getMessage(), e);
	  }      
      finally {closeConnection();}  	
  }  

} // end of EJB Controller for ENAct2ENPlanWork
