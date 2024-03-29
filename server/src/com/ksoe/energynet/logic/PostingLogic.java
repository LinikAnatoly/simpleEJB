package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Vector;
import java.util.regex.Pattern;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DocFlowLogic.ApplicationStatus;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENAct2FinInfoProvDAO;
import com.ksoe.energynet.dataminer.ENAct2HumenDAO;
import com.ksoe.energynet.dataminer.ENAct2OSTableDAO;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.ENAct2TransportDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomServ2ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomeServicesDAO;
import com.ksoe.energynet.dataminer.ENActPostingKindDAO;
import com.ksoe.energynet.dataminer.ENActPostingKindItemDAO;
import com.ksoe.energynet.dataminer.ENActPostingSpecCharactersDAO;
import com.ksoe.energynet.dataminer.ENConnectionKindDAO;
import com.ksoe.energynet.dataminer.ENContragentDAO;
import com.ksoe.energynet.dataminer.ENCountersStateVerificationDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimeDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENPlan2HumenDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2HumenDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkStateDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkTypeDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZ2ENactDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2ENActDAO;
import com.ksoe.energynet.ejb.ENServicesObjectController;
import com.ksoe.energynet.ejb.ENServicesObjectControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.ENAct2OSTable;
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.ENAct2Transport;
import com.ksoe.energynet.valueobject.ENActIncomServ2ENAct;
import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.ENActPostingKind;
import com.ksoe.energynet.valueobject.ENActPostingKindItem;
import com.ksoe.energynet.valueobject.ENActPostingSpecCharacters;
import com.ksoe.energynet.valueobject.ENActPostingTypeSum;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENCountersStateVerification;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2PlanType;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2Humen;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.brief.ENAct2HumenShort;
import com.ksoe.energynet.valueobject.brief.ENAct2OSTableShort;
import com.ksoe.energynet.valueobject.brief.FINMaterialsShort;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.brief.SCSealShort;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2FinInfoProvFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2OSTableFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2TransportFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindFilter;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindItemFilter;
import com.ksoe.energynet.valueobject.filter.ENActPostingSpecCharactersFilter;
import com.ksoe.energynet.valueobject.filter.ENConnectionKindFilter;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.filter.ENCountersStateVerificationFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimeFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.filter.ENPlan2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkStateFilter;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ENActFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2OSTableShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2TransportShortList;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindItemShortList;
import com.ksoe.energynet.valueobject.lists.ENActPostingSpecCharactersShortList;
import com.ksoe.energynet.valueobject.lists.ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENContragentShortList;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimeShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkStateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energynet.valueobject.lists.SCSealShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ENActShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemShortList;
import com.ksoe.energypro.exception.EnergyproBusinessException;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.logic.FKLogic;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.techcard.dataminer.TKAccountingTypeDAO;
import com.ksoe.techcard.dataminer.TKFINWorkTypeDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKCalcKind;
import com.ksoe.techcard.valueobject.TKTransportStatus;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.filter.TKFINWorkTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKTransportRealFilter;
import com.ksoe.techcard.valueobject.lists.TKFINWorkTypeShortList;
import com.ksoe.techcard.valueobject.lists.TKTransportRealShortList;

public class PostingLogic extends LogicModule{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	

	public BigDecimal getTimeGen4DriverByPositionAndSalary(String tabNumber,
			int planCode, Date planDate, int positionCode, BigDecimal salary,
			String positionId) throws PersistenceException {

		ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);
		TransportLogic transportLogic = new TransportLogic(connection, userProfile);
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

        BigDecimal out = new BigDecimal(0);

        BigDecimal workerWorkTime = new BigDecimal(0);
        BigDecimal workerWorkTimeOnly = new BigDecimal(0);

        ENTransportItemShortList transportList = transportDAO.getListForActCalcNormsByPositionAndSalary(tabNumber, planCode, positionCode, salary, positionId);
        String trPlanCodes = "" + Integer.MIN_VALUE;
        for (int j=0; j < transportList.totalCount; j++){


            // ����� ������ � ������ ��� ���� ����������� .. ����� ���������� ����
            if (transportList.get(j).tktransportTypeCode != TKTransportType.BRIGADE)
            {
                workerWorkTime = workerWorkTime.add(transportList.get(j).countWorkFact).setScale(2, BigDecimal.ROUND_HALF_UP);
                workerWorkTimeOnly = workerWorkTimeOnly.add(transportList.get(j).countWorkFact).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            // ����� ��� ������� �������� ������ ��������� ���� � ������������ ..
            if ((transportList.get(j).tktransportTypeCode == TKTransportType.BRIGADE)
                // ����� ��� ... ����� ���� ���������� �������� - �  �����. 0 ....
                //&& (transportList.get(j).distance.doubleValue() > 0 )
            )
            {
                trPlanCodes = trPlanCodes + ", " + transportList.get(j).planRefCode;
            }

            // ������� ����� �������� ...
            // ����� ������ .. ����� �������������� !!!
            // �� 01.06.2011 ������������������ ;))) :(

            BigDecimal[] distArr = transportLogic.getDistancesByTransport(transportList.get(j).code, false); // ��� ����� ������� ��� ���������� ...
            if ( distArr != null){
                BigDecimal delTime = transportLogic.calcTimeByDistaces(distArr[0], distArr[1], distArr[2], planLogic.isWinterMonth( planDate ), transportLogic.isTraktor(transportList.get(j).code)).setScale(2, BigDecimal.ROUND_HALF_UP);
                workerWorkTime = workerWorkTime.add(delTime).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

        }

       

        out = workerWorkTime.setScale(2, BigDecimal.ROUND_HALF_UP);

        return out;
    }

   

    public ENAct getActByWorkOrderCode(int workOrderCode, boolean isGenException) throws PersistenceException
    {
        ENWorkOrder2ENPlanWorkDAO dao = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
        ENWorkOrder2ENPlanWorkFilter f = new ENWorkOrder2ENPlanWorkFilter();
        f.workOrder.code = workOrderCode;

        ENWorkOrder2ENPlanWorkShortList list = dao.getScrollableFilteredList(f,0,-1);

        if (list.totalCount > 0){
            return null; //getActByPlanCode(list.get(0).planCode, isGenException);
        }
        else{
            return null;
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
                throw new DatasourceConnectException("��� ����� � ���.���������� ... ������� ������ ��� ��� ��� �� ...", e);
            }
        }

        
   




    /**
     * ���������� ����� �������� ���.  �� ���� ����� �� ������� ��� ������������ ��������
     * 
     * @param isWithDelivery -- ���� �� ���� � ������ �������� � �� ��������� 
     * */
        public FKTrans2AXTransItemShortList getDataForProvsSalaryByActServicesRed(int actCode , int tkcalckind , boolean isWithDelivery)  throws PersistenceException
        {
        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
    		FKTrans2AXTransItemShort anObject;
    		result.list = new Vector<FKTrans2AXTransItemShort>();

    		String selectStr;
    		PreparedStatement statement = null;
    		ResultSet  set = null;

    		selectStr = 
    				  
    				 new String( tkcalckind == TKCalcKind.OLD ? " select sum(p2h.paysworkbonus)::numeric(15,2) as payswork  \n"  
    		                            : isWithDelivery == true ? " select (   sum(coalesce(p2h.paysworkbonus,0)) \n" +
    		                              " 		 + sum(coalesce(p2h.paysworksurcharge,0))  \n" + 
    		                              " 	     + sum(coalesce(p2h.paysworkpremium,0))  \n" +
    		                              " 	     + sum(coalesce(p2h.paysworkadditional,0)) )::numeric(15,2) "
    		                            :  " select (   sum(coalesce(p2h.paysworkbonuswithotdlv,0)) \n" +
											 " 		  + sum(coalesce(p2h.paysworksurchrgwthtdlv,0)) \n" + 
											 "	      + sum(coalesce(p2h.paysworkpremiumwthtdlv,0))  \n" +
											 "	      + sum(coalesce(p2h.paysworkadditnlwthtdlv,0)) )::numeric(15,2) "
    		                       ) + 
    		                              " ,  p2h.cehid   " + 
    		                              " ,  p2h.balans as balans " + 
    				" from \n"+
    				" enact2enplanwork as a2p \n"+
    				" inner join enplanwork as pw on a2p.plancode = pw.code \n"+
    				" inner join enplanworkitem as pwi on pw.code = pwi.planrefcode \n"+
    				" inner join enplanworkitem2humen as p2h on pwi.code = p2h.plaitemrefcode \n"+
    				" inner join tktechcard as tc on pwi.kartarefcode = tc.code \n"+
    				" inner join tkclassificationtype as tkcls on tc.classificationtypecode = tkcls.code \n"+
    				" where  a2p.actrefcode =  " + actCode +
    				" and pwi.countgen <> 0 \n"+
    				" and (tkcls.costworkscontractor is null or tkcls.costworkscontractor = 0) \n"+
    				" group by p2h.cehid , p2h.balans  \n";
    		try {
    			statement = connection.prepareStatement(selectStr);
    			set = statement.executeQuery();
    			int c=0;
    			while(set.next()) {
    				if(set.getBigDecimal(1).doubleValue()>0){
    					
    					anObject = new FKTrans2AXTransItemShort();

        				anObject.amountCur = set.getBigDecimal(1);
        				if(anObject.amountCur != null) {
        					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        				}
        				anObject.balCeh = set.getString(2);
        				
        				anObject.balans = set.getString(3);

        				result.list.add(anObject);
        				c++;
    				}
    				
    			}

    			result.setTotalCount(c);
    			return result;
    		} catch (SQLException e) {
                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                return result;
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
         * ���������� ����� �������� ���.  �� ���� ����� �� ������� ��� ������������ ��������
         * */
            public FKTrans2AXTransItemShortList getDataForProvsSalaryByActServices(int actCode , int tkcalckind , boolean isWithDelivery )  throws PersistenceException
            {
            	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
        		FKTrans2AXTransItemShort anObject;
        		result.list = new Vector<FKTrans2AXTransItemShort>();

        		String selectStr;
        		PreparedStatement statement = null;
        		ResultSet  set = null;

        		selectStr =     " select  sum(payswork) as payswork, cehid from( "   +
        				        new String( tkcalckind == TKCalcKind.OLD ? " select sum(p2h.paysworkbonus)::numeric(15,2) as payswork  \n"  
        				        : isWithDelivery == true ? " select (   sum(coalesce(p2h.paysworkbonus,0)) \n" +
	                              " 		 + sum(coalesce(p2h.paysworksurcharge,0))  \n" + 
	                              " 	     + sum(coalesce(p2h.paysworkpremium,0))  \n" +
	                              " 	     + sum(coalesce(p2h.paysworkadditional,0)) )::numeric(15,2)  as payswork "
	                            :  " select (   sum(coalesce(p2h.paysworkbonuswithotdlv,0)) \n" +
									 " 		  + sum(coalesce(p2h.paysworksurchrgwthtdlv,0)) \n" + 
									 "	      + sum(coalesce(p2h.paysworkpremiumwthtdlv,0))  \n" +
									 "	      + sum(coalesce(p2h.paysworkadditnlwthtdlv,0)) )::numeric(15,2) as payswork "
									 ) + 
        		                              " ,  p2h.cehid   " +  
        				" from \n"+
        				" enact2enplanwork as a2p \n"+
        				" inner join enplanwork as pw on a2p.plancode = pw.code \n"+
        				" inner join enplanworkitem as pwi on pw.code = pwi.planrefcode \n"+
        				" inner join enplanworkitem2humen as p2h on pwi.code = p2h.plaitemrefcode \n"+
        				" inner join tktechcard as tc on pwi.kartarefcode = tc.code \n"+
        				" inner join tkclassificationtype as tkcls on tc.classificationtypecode = tkcls.code \n"+
        				" where  a2p.actrefcode =  " + actCode +
        				" and pwi.countgen <> 0 \n"+
        				" and (tkcls.costworkscontractor is null or tkcls.costworkscontractor = 0) \n"+
        				" group by p2h.cehid \n"+
        				" , p2h.chargepercent \n"+
        				" , p2h.chargerefcode \n"+
        				" , a2p.actrefcode \n"+
        				" , p2h.bonus \n"+
        				" , p2h.tabnumber \n"+
        				" , p2h.fio \n"+
        				" , p2h.salary \n"+
        				" , p2h.timemonth \n"+
        				" , p2h.salaryhours \n"+
        				" , p2h.humenkindrefcode \n"+ 
        				" , p2h.balans \n"+
        				" ,substring( p2h.podrcod from 1 for 3 ) \n"+ 
        				" ) as s1 group by cehid "; /// zzzz

        		try {
        			statement = connection.prepareStatement(selectStr);
        			set = statement.executeQuery();
        			int c=0;
        			while (set.next()) {
        				
        				if(set.getBigDecimal(1).doubleValue() > 0  ){
        				
        					anObject = new FKTrans2AXTransItemShort();

            				anObject.amountCur = set.getBigDecimal(1);
            				if(anObject.amountCur != null) {
            					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            				}
            				anObject.balCeh = set.getString(2);
            			

            				result.list.add(anObject);
            				c++;
        				}
        				
        			}

        			result.setTotalCount(c);
        			return result;
        		} catch (SQLException e) {
                    System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                    return result;
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
             * ���������� ����� ��� ���.  �� ���� ��� ������������ ��������
             * */
                public FKTrans2AXTransItemShortList getDataForProvsESV_Red_new(boolean isServices, int actCode , int tkcalckind, boolean isWithDelivery )  throws PersistenceException
                {
                	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
            		FKTrans2AXTransItemShort anObject;
            		result.list = new Vector<FKTrans2AXTransItemShort>();

            		String selectStr;
            		PreparedStatement statement = null;
            		ResultSet  set = null;
            		
            		if (!isServices) {
            			selectStr = " select sum(CHARGESUM)::numeric(15,2) as CHARGESUM ,a2h.cehid, overlay(a2h.balans placing '3' from 8 ) as balans " + 
            			        " from enact2humen a2h where a2h.paysworkbonus::numeric(15,2) > 0  " +
            			        " and a2h.actrefcode =  " + actCode    + 
            			        " group by a2h.cehid ,  overlay(a2h.balans placing '3' from 8 ) "  ;	
            		} else             		 

            		selectStr =  new String (isWithDelivery==true ? " select sum(CHARGESUM)::numeric(15,2) as CHARGESUM  \n"   
                    : " select sum(CHARGESUMWITHOUTDELIV)::numeric(15,2) as CHARGESUMWITHOUTDELIV  \n") +
            		"             ,cehid,overlay(balans placing '3' from 8 ) as balans , classificationtypecode \n" +
            		"                                 from ( \n" +
            		"                       Select \n" +
            		"                        tabnumber \n" +
            		"                      , fio \n" +
            		"                      , salary \n" +
            		"                      , timemonth \n" +
            		"                      , salaryhours \n" +
            		"                      , sum(timework) as timework \n" +
            		"                      , (sum(payswork))::numeric(15,2)  as payswork \n" +
            		"                      , sum(paysWorkBonusWithoutDelivery)::numeric(15,2) as paysWorkBonusWithoutDelivery /* �� ��������� ��� ������� � ��� ��������� */ \n" +
            		"                      , cast(sum(paysworkAdditional) as numeric(15,2)) as paysworkAdditional \n" +
            		"                      , case when replacecounterkindcode = 2 and isnopay = 1 then 0 else \n" +
            		"                          cast(sum(generalexpenses) as numeric(15,2)) end as generalexpenses \n" +
            		"                      , chargepercent \n" +
            		"                      , chargerefcode \n" +
            		"                      , balanskod as balans  \n" +
            		"                      , bonus \n" +
            		"                      , bonusdditional \n" +
            		"                      , humenkindrefcode \n" +
            		"                      , sum(CHARGESUM)::numeric(15,2) as  CHARGESUM \n" +
            		"                      , sum(CHARGESUMWITHOUTDELIV)::numeric(15,2) as CHARGESUMWITHOUTDELIV /*������ ������ �� ������������'������ �������� ��������� ����������� ���������*/ \n" +
            		"                      , coalesce((select * from getENconnectionKindByActCode(actrefcode) ),'') as isPriconnection \n" +
            		"                      , sum(timeDelivery) as timeDelivery \n" +
            		"                      , cehid \n" +
            		"                      , classificationtypecode \n" +
            		"                      from ( \n" +
            		"                          Select \n" +        
            		"                            p2h.tabnumber \n" +
            		"                          , p2h.fio \n" +
            		"                          , cast(p2h.salary as numeric) as salary \n" +
            		"                          , cast(p2h.timemonth as numeric) as timemonth \n" +
            		"                          , cast(p2h.salaryhours as numeric) as salaryhours \n" +
            		"                          , cast(p2h.timework as numeric) as timework \n" +
            		"                          , (coalesce(p2h.paysworkbonus,0) + coalesce(p2h.paysworksurcharge,0) + coalesce(p2h.paysworkpremium,0) + coalesce(p2h.paysworkadditional,0) ) as payswork \n" +
            		"                          , (coalesce(p2h.paysworkbonuswithotdlv,0) + coalesce(p2h.paysworksurchrgwthtdlv,0) + coalesce(p2h.paysworkpremiumwthtdlv,0) + coalesce(p2h.paysworkadditnlwthtdlv,0)) as paysWorkBonusWithoutDelivery \n" +
            		"                          , p2h.generalexpenses \n" +
            		"                          , p2h.chargepercent \n" +
            		"                          , p2h.chargerefcode \n" +
            		"                          , p2h.balans  as balanskod \n" +
            		"                          , p2h.bonus \n" +
            		"                          , coalesce((coalesce(p2h.percentsurcharge,0) + coalesce(p2h.percentpremium,0)  + coalesce(p2h.percentadditional,0) ),0) as bonusdditional \n" +
            		"                          , tkcls.replacecounterkindcode \n" +
            		"                          , coalesce((p2h.paysworksurcharge + p2h.paysworkpremium + p2h.paysworkadditional),0)::numeric(15,8) as paysworkAdditional \n" +
            		"                          , so.isnopay , a2p.actrefcode , p2h.humenkindrefcode \n" +
            		"                          , p2h.timeDelivery \n" +
            		"                          , p2h.CHARGESUM \n" +
            		"                          , p2h.CHARGESUMWITHOUTDELIV \n" +
            		"                          , p2h.cehid \n" +
            		"                          , tc.classificationtypecode \n" +
            		"                          from \n" +
            		"                          enact2enplanwork as a2p \n" +
            		"                          inner join enplanwork as pw on a2p.plancode = pw.code          \n" +
            		"                          inner join enplanworkitem as pwi on pw.code = pwi.planrefcode \n" +
            		"                          inner join enplanworkitem2humen as p2h on pwi.code = p2h.plaitemrefcode \n" +
            		"                          inner join tktechcard as tc on pwi.kartarefcode = tc.code \n" +
            		"                          inner join tkclassificationtype as tkcls on tc.classificationtypecode = tkcls.code \n" +
            		"                          inner join enservicesobject as so on pw.elementrefcode = so.elementcode \n" +
            		"                          where  a2p.actrefcode = "+ actCode +" \n" +
            		"                           and pwi.countgen <> 0 \n" +
            		"                          and (tkcls.costworkscontractor is null or tkcls.costworkscontractor = 0) \n" +
            		"                      ) as q1 \n" +
            		"                      group by chargepercent \n" +
            		"                      , chargerefcode \n" +
            		"                      , actrefcode \n" +
            		"                      , tabnumber \n" +
            		"                      , fio \n" +
            		"                      , salary \n" +
            		"                      , timemonth \n" +
            		"                      , salaryhours \n" +
            		"                      , humenkindrefcode \n" +
            		"                      , replacecounterkindcode \n" +
            		"                      , isnopay \n" +
            		"                      , bonus \n" +
            		"                      , bonusdditional  \n" +
            		"                      , balanskod \n" +
            		"                      , cehid \n" +
            		"                      , classificationtypecode \n" +
            		"                      order by tabnumber \n" +
            		"                              ) as qq \n" +
            		"   group by classificationtypecode , cehid ,  overlay(balans placing '3' from 8 ) ";
            		
            		try {
            			statement = connection.prepareStatement(selectStr);
            			set = statement.executeQuery();
            			int c=0;
            			while (set.next()) {
            				
            				if(set.getBigDecimal(1).doubleValue() > 0  ){
            				
            					anObject = new FKTrans2AXTransItemShort();

                				anObject.amountCur = set.getBigDecimal(1);
                				if(anObject.amountCur != null) {
                					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                				}
                				anObject.balCeh = set.getString(2);
                				
                				anObject.balans = set.getString(3);

                				result.list.add(anObject);
                				c++;
            				}
            				
            			}

            			result.setTotalCount(c);
            			return result;
            		} catch (SQLException e) {
                        System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                        return result;
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
                 * ���������� ����� ����������������� ������� ���.  �� ���� ����� �� ������� ��� ������������ ��������
                 * */
                    public FKTrans2AXTransItemShortList getDataForProvsTotalExpencByActServices(int actCode , int tkcalckind
                    		, boolean isWithDelivery)  throws PersistenceException
                    {
                    	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
                		FKTrans2AXTransItemShort anObject;
                		result.list = new Vector<FKTrans2AXTransItemShort>();

                		String selectStr;
                		PreparedStatement statement = null;
                		ResultSet  set = null;
                		
            			/* 14.01.2020 SUPP-88628 ����������� ������� ����� �������������������� ������ ��� ������ ������� ����� � ������ 
            			 * ���������� � ���������
            			
            			*/
            			
            			String selectSum = null;
            			switch(tkcalckind) {
            			case TKCalcKind.OLD:
            				selectSum = "paysworkbonus";
            				break;
            			case TKCalcKind.NEW:
            				selectSum = (isWithDelivery) ? "paysworkbonusWithAdditional" : "paysworkbonusWithAdditionalWithoutDelivery";
            				break;
            			case TKCalcKind.NEW2:
            				selectSum = "paysworkbonusWithAdditional";
            				break;
            			default:
            				throw new SystemException(String.format("�������� ��� ���������� ����������� - %d", tkcalckind));
            			}

	selectStr = /*new String( tkcalckind == TKCalcKind.OLD ? " select ( sum(p2h.paysworkbonus)::numeric(15,2) * calc_info.productionexpenssprcnt / 100 )::numeric(15,2) as payswork  \n"  
	        : isWithDelivery == true ? " select ((   sum(coalesce(p2h.paysworkbonus,0)) \n" +
              " 		 + sum(coalesce(p2h.paysworksurcharge,0))  \n" + 
              " 	     + sum(coalesce(p2h.paysworkpremium,0))  \n" +
              " 	     + sum(coalesce(p2h.paysworkadditional,0)) )::numeric(15,2) * calc_info.productionexpenssprcnt / 100 )::numeric(15,2) "
                                     : " select ((   sum(coalesce(p2h.paysworkbonuswithotdlv,0)) \n" +
				 " 		  + sum(coalesce(p2h.paysworksurchrgwthtdlv,0)) \n" + 
				 "	      + sum(coalesce(p2h.paysworkpremiumwthtdlv,0))  \n" +
				 "	      + sum(coalesce(p2h.paysworkadditnlwthtdlv,0)) )::numeric(15,2) * calc_info.productionexpenssprcnt / 100 )::numeric(15,2) "
				 ) +*/
//			" select ( sum(paysworkbonusExpence)  )::numeric(15,2)  from ( \n" + 
//			new String( tkcalckind == TKCalcKind.OLD ? " select sum(p2h.paysworkbonus)::numeric(15,2) * productionexpenssprcnt / 100  as paysworkbonusExpence \n"   
//	          : isWithDelivery == true ? " select sum(paysworkbonusWithAdditional)::numeric(15,2) * productionexpenssprcnt / 100 as paysworkbonusExpence \n"  
//                                       : " select sum(paysworkbonusWithAdditionalWithoutDelivery)::numeric(15,2)  * productionexpenssprcnt / 100 as paysworkbonusExpence \n" 
				 

	
			
			
			// SUPP-83425 ������� ����������������� ������� �� �� ������ �� ������� 		
" select ( sum(paysworkbonusExpence)  )::numeric(15,2)  from ( \n" + 
			" select (sum(" + selectSum + ")::numeric(15,2)  * productionexpenssprcnt / 100)::numeric(15,2) as paysworkbonusExpence \n"	+ 	 
				 " , productionexpenssprcnt \n" +
			" from ( \n"+	 
			" select sum(p2h.paysworkbonus)::numeric(15,2) as paysworkbonus \n"+	 
			" , sum(coalesce(p2h.paysworkbonus,0) + coalesce(p2h.paysworksurcharge,0) + coalesce(p2h.paysworkpremium,0) + coalesce(p2h.paysworkadditional,0))::numeric(15,2) as paysworkbonusWithAdditional \n"+ 
			" , sum(coalesce(p2h.paysworkbonuswithotdlv,0) + coalesce(p2h.paysworksurchrgwthtdlv,0) + coalesce(p2h.paysworkpremiumwthtdlv,0) + coalesce(p2h.paysworkadditnlwthtdlv,0))::numeric(15,2) as paysworkbonusWithAdditionalWithoutDelivery \n"+
			" , tc.classificationtypecode \n"+
			" , calc_info.productionexpenssprcnt \n"+
			" , p2h.tabnumber \n"+
			" from \n"+
			" enact2enplanwork as a2p \n"+
			" inner join enplanwork as pw on a2p.plancode = pw.code \n"+
			" inner join enplanworkitem as pwi on pw.code = pwi.planrefcode \n"+
			" inner join enplanworkitem2humen as p2h on pwi.code = p2h.plaitemrefcode \n"+
			" inner join tktechcard as tc on pwi.kartarefcode = tc.code \n"+
			" inner join tkclassificationtype as tkcls on tc.classificationtypecode = tkcls.code \n"+
			" left join ( \n"+
			" 		select acpw1.actrefcode, pwcl1.productionexpenssprcnt, pwcl1.calckindrefcode from enact2enplanwork as acpw1 \n"+
			" 		    inner join enplancorrecthistory as his_f1 on acpw1.plancode = his_f1.plannewrefcode \n"+
			" 		    inner join enplancorrecthistory as his_p1 on his_f1.planoldrefcode = his_p1.plannewrefcode \n"+
			" 		    inner join enplancorrecthistory as his_m1 on his_p1.planoldrefcode = his_m1.plannewrefcode \n"+
			" 		    inner join enplanwork2classfctntp as pwcl1 on his_m1.planoldrefcode = pwcl1.planrefcode \n"+
			"       where his_f1.reasoncode = 5 and his_p1.reasoncode = 4 and his_m1.reasoncode = 13 and acpw1.actrefcode = " + actCode +
			" 		union all \n"+
			" 		select acpw1.actrefcode, co1.productionexpenssprcnt, co1.calckindrefcode from enact2enplanwork as acpw1 \n"+
			" 		    inner join enplancorrecthistory as his_f1 on acpw1.plancode = his_f1.plannewrefcode \n"+
			" 		    inner join enplancorrecthistory as his_p1 on his_f1.planoldrefcode = his_p1.plannewrefcode \n"+
			" 		    inner join enservicescost as sco1 on his_p1.planoldrefcode = sco1.planrefcode \n"+
			" 		    inner join tkcalccost as co1 on sco1.tkcalccostrefcode = co1.code \n"+
			" 		    where his_f1.reasoncode = 5 and his_p1.reasoncode = 4 and acpw1.actrefcode = " + actCode +
			" 		    limit 1) as calc_info on calc_info.actrefcode = a2p.actrefcode \n"+ 
			" where  a2p.actrefcode =  " + actCode +
			" and pwi.countgen <> 0 \n"+
			" and (tkcls.costworkscontractor is null or tkcls.costworkscontractor = 0) \n"+ 
			" group by tc.classificationtypecode, calc_info.productionexpenssprcnt, p2h.tabnumber   \n" +
			" ) as q1 \n"+  
	        " group by productionexpenssprcnt , classificationtypecode  \n" + 
	        " ) as q2  "
	        + " \n";
                		try {
                			statement = connection.prepareStatement(selectStr);
                			set = statement.executeQuery();
                			int c=0;
                			while (set.next()) {
                				
                				if(set.getBigDecimal(1).doubleValue() > 0  ) {
                					
                					anObject = new FKTrans2AXTransItemShort();

                    				anObject.amountCur = set.getBigDecimal(1);
                    				if(anObject.amountCur != null) {
                    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                    				}
                    				
                    				result.list.add(anObject);
                    				c++;
                				}
                				
                			}

                			result.setTotalCount(c);
                			return result;
                		} catch (SQLException e) {
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
                	}        
                    
                    
                    /**
                     * ���������� ����� ����������������� ������� ���.  �� ���� ��� ������������ ��������
                     * */
         public FKTrans2AXTransItemShortList getDataForProvsTotalExpencByAct(int actCode  )  throws PersistenceException
                        {
                        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
                    		FKTrans2AXTransItemShort anObject;
                    		result.list = new Vector<FKTrans2AXTransItemShort>();

                    		String selectStr;
                    		PreparedStatement statement = null;
                    		ResultSet  set = null;

    	selectStr = " select ( sum(a2h.paysworkbonus)::numeric(15,2) " + 
    			    "                 * " + 
    			    "                 (select * from get_productionexpencespercent(a2h.actrefcode::integer)) / 100 )::numeric(15,2) as payswork " +  
    			    "  from enact2humen a2h where a2h.paysworkbonus::numeric(15,2) > 0  " +  
    			    "  and a2h.actrefcode =  " + actCode + 
    			    "  group by a2h.actrefcode ";
    	
                    		try {
                    			statement = connection.prepareStatement(selectStr);
                    			set = statement.executeQuery();
                    			int c=0;
                    			while (set.next()) {
                    				
                    				if(set.getBigDecimal(1).doubleValue() > 0  ) {
                    					
                    					anObject = new FKTrans2AXTransItemShort();

                        				anObject.amountCur = set.getBigDecimal(1);
                        				if(anObject.amountCur != null) {
                        					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                        				}
                        				
                        				result.list.add(anObject);
                        				c++;
                    				}
                    				
                    			}

                    			result.setTotalCount(c);
                    			return result;
                    		} catch (SQLException e) {
                                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                                return result;
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
                 * ���������� ����� ��� ���.  �� ���� ����� �� ������� ��� ������������ ��������
                 * */
                    public FKTrans2AXTransItemShortList getDataForProvsESV_new(boolean isServices, int actCode , int tkcalckind  , boolean isWithDelivery  )  throws PersistenceException
                    {
                    	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
                		FKTrans2AXTransItemShort anObject;
                		result.list = new Vector<FKTrans2AXTransItemShort>();

                		String selectStr;
                		PreparedStatement statement = null;
                		ResultSet  set = null;

                		if(!isServices) {
                		selectStr = " select sum(CHARGESUM)::numeric(15,2) as CHARGESUM , a2h.cehid  " + 
            			        " from enact2humen a2h where a2h.paysworkbonus::numeric(15,2) > 0  " +
            			        " and a2h.actrefcode =  " + actCode    + 
            			        " group by a2h.cehid  "  ;
                		} else 
                		
                		
                		selectStr =  new String (isWithDelivery==true ? " select sum(CHARGESUM)::numeric(15,2) as CHARGESUM  \n"   
                                : " select sum(CHARGESUMWITHOUTDELIV)::numeric(15,2) as CHARGESUMWITHOUTDELIV  \n") +
                        		"             ,cehid , classificationtypecode \n" +
                        		"                                 from ( \n" +
                        		"                       Select \n" +
                        		"                        tabnumber \n" +
                        		"                      , fio \n" +
                        		"                      , salary \n" +
                        		"                      , timemonth \n" +
                        		"                      , salaryhours \n" +
                        		"                      , sum(timework) as timework \n" +
                        		"                      , (sum(payswork))::numeric(15,2)  as payswork \n" +
                        		"                      , sum(paysWorkBonusWithoutDelivery)::numeric(15,2) as paysWorkBonusWithoutDelivery /* �� ��������� ��� ������� � ��� ��������� */ \n" +
                        		"                      , cast(sum(paysworkAdditional) as numeric(15,2)) as paysworkAdditional \n" +
                        		"                      , case when replacecounterkindcode = 2 and isnopay = 1 then 0 else \n" +
                        		"                          cast(sum(generalexpenses) as numeric(15,2)) end as generalexpenses \n" +
                        		"                      , chargepercent \n" +
                        		"                      , chargerefcode \n" +
                        		"                      , balanskod as balans  \n" +
                        		"                      , bonus \n" +
                        		"                      , bonusdditional \n" +
                        		"                      , humenkindrefcode \n" +
                        		"                      , sum(CHARGESUM)::numeric(15,2) as  CHARGESUM \n" +
                        		"                      , sum(CHARGESUMWITHOUTDELIV)::numeric(15,2) as CHARGESUMWITHOUTDELIV /*������ ������ �� ������������'������ �������� ��������� ����������� ���������*/ \n" +
                        		"                      , coalesce((select * from getENconnectionKindByActCode(actrefcode) ),'') as isPriconnection \n" +
                        		"                      , sum(timeDelivery) as timeDelivery \n" +
                        		"                      , cehid \n" +
                        		"                      , classificationtypecode \n"+
                        		"                      from ( \n" +
                        		"                          Select \n" +        
                        		"                            p2h.tabnumber \n" +
                        		"                          , p2h.fio \n" +
                        		"                          , cast(p2h.salary as numeric) as salary \n" +
                        		"                          , cast(p2h.timemonth as numeric) as timemonth \n" +
                        		"                          , cast(p2h.salaryhours as numeric) as salaryhours \n" +
                        		"                          , cast(p2h.timework as numeric) as timework \n" +
                        		"                          , (coalesce(p2h.paysworkbonus,0) + coalesce(p2h.paysworksurcharge,0) + coalesce(p2h.paysworkpremium,0) + coalesce(p2h.paysworkadditional,0) ) as payswork \n" +
                        		"                          , (coalesce(p2h.paysworkbonuswithotdlv,0) + coalesce(p2h.paysworksurchrgwthtdlv,0) + coalesce(p2h.paysworkpremiumwthtdlv,0) + coalesce(p2h.paysworkadditnlwthtdlv,0)) as paysWorkBonusWithoutDelivery \n" +
                        		"                          , p2h.generalexpenses \n" +
                        		"                          , p2h.chargepercent \n" +
                        		"                          , p2h.chargerefcode \n" +
                        		"                          , p2h.balans  as balanskod \n" +
                        		"                          , p2h.bonus \n" +
                        		"                          , coalesce((coalesce(p2h.percentsurcharge,0) + coalesce(p2h.percentpremium,0)  + coalesce(p2h.percentadditional,0) ),0) as bonusdditional \n" +
                        		"                          , tkcls.replacecounterkindcode \n" +
                        		"                          , coalesce((p2h.paysworksurcharge + p2h.paysworkpremium + p2h.paysworkadditional),0)::numeric(15,8) as paysworkAdditional \n" +
                        		"                          , so.isnopay , a2p.actrefcode , p2h.humenkindrefcode \n" +
                        		"                          , p2h.timeDelivery \n" +
                        		"                          , p2h.CHARGESUM \n" +
                        		"                          , p2h.CHARGESUMWITHOUTDELIV \n" +
                        		"                          , p2h.cehid \n" +
                        		"                          , tc.classificationtypecode \n" +
                        		"                          from \n" +
                        		"                          enact2enplanwork as a2p \n" +
                        		"                          inner join enplanwork as pw on a2p.plancode = pw.code          \n" +
                        		"                          inner join enplanworkitem as pwi on pw.code = pwi.planrefcode \n" +
                        		"                          inner join enplanworkitem2humen as p2h on pwi.code = p2h.plaitemrefcode \n" +
                        		"                          inner join tktechcard as tc on pwi.kartarefcode = tc.code \n" +
                        		"                          inner join tkclassificationtype as tkcls on tc.classificationtypecode = tkcls.code \n" +
                        		"                          inner join enservicesobject as so on pw.elementrefcode = so.elementcode \n" +
                        		"                          where  a2p.actrefcode = "+ actCode +" \n" +
                        		"                           and pwi.countgen <> 0 \n" +
                        		"                          and (tkcls.costworkscontractor is null or tkcls.costworkscontractor = 0) \n" +
                        		"                      ) as q1 \n" +
                        		"                      group by chargepercent \n" +
                        		"                      , chargerefcode \n" +
                        		"                      , actrefcode \n" +
                        		"                      , tabnumber \n" +
                        		"                      , fio \n" +
                        		"                      , salary \n" +
                        		"                      , timemonth \n" +
                        		"                      , salaryhours \n" +
                        		"                      , humenkindrefcode \n" +
                        		"                      , replacecounterkindcode \n" +
                        		"                      , isnopay \n" +
                        		"                      , bonus \n" +
                        		"                      , bonusdditional  \n" +
                        		"                      , balanskod \n" +
                        		"                      , cehid \n" +
                        		"                      , classificationtypecode \n" +
                        		"                      order by tabnumber \n" +
                        		"                              ) as qq \n" +
                        		"   group by classificationtypecode, cehid  ";
                		try {
                			statement = connection.prepareStatement(selectStr);
                			set = statement.executeQuery();
                			int c=0;
                			while (set.next()) {
                				
                				if (set.getBigDecimal(1).doubleValue() > 0  ){
                					
                					anObject = new FKTrans2AXTransItemShort();

                    				anObject.amountCur = set.getBigDecimal(1);
                    				if(anObject.amountCur != null) {
                    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                    				}
                    				anObject.balCeh = set.getString(2);
                    				
                    				result.list.add(anObject);
                    				c++;
                					
                				}
                				
                			}

                			result.setTotalCount(c);
                			return result;
                		} catch (SQLException e) {
                            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                            return result;
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
 * ���������� ����� �������� ���.  �� ���� ��� ������������ ��������
 * */
    public FKTrans2AXTransItemShortList getDataForProvsSalaryByAct(int actCode)  throws PersistenceException
    {
    	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
		FKTrans2AXTransItemShort anObject;
		result.list = new Vector<FKTrans2AXTransItemShort>();

		String selectStr;
		PreparedStatement statement = null;
		ResultSet  set = null;

		selectStr = " select sum(a2h.paysworkbonus)::numeric(15,2) , a2h.cehid  from enact2humen a2h" +
					" where  a2h.paysworkbonus > 0 and a2h.actrefcode =  " + actCode + " group by a2h.cehid " ;

		try {
			statement = connection.prepareStatement(selectStr);
			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new FKTrans2AXTransItemShort();

				anObject.amountCur = set.getBigDecimal(1);
				if(anObject.amountCur != null) {
					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.balCeh = set.getString(2);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            return result;
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
     * ���������� ����� �������� ���.  �� �� ��� ������������ ��������
     * */
        public FKTrans2AXTransItemShortList getDataForProvsSalaryByOZ(int ozCode , int iszku , int scUsageInputItemKind )  throws PersistenceException
        {
        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
    		FKTrans2AXTransItemShort anObject;
    		result.list = new Vector<FKTrans2AXTransItemShort>();

    		String selectStr = "";
    		PreparedStatement statement = null;
    		ResultSet  set = null;



    		if(iszku==0 && scUsageInputItemKind != 4 && scUsageInputItemKind != 5 ){
    			selectStr = " select sum(a2h.paysworkbonus)::numeric(15,2) , a2h.cehid  from enact2humen a2h "+
    				    " where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act "+
    				    " 	where oz.code= "+ ozCode +
    				    " 	and oz.code = oz2act.usageinputitemozrefcod) "+
    				    " 		group by a2h.cehid ";
    		}
    		if(iszku==1 && scUsageInputItemKind != 4 && scUsageInputItemKind != 5 ){
    			/*��� ���������� ���� � ����  '201109/ActZKU/NormalAct/Act21';
    		 	*  ��� ������� �������� � ������ � ������ � ����� 112 -  �� - ������ �������� � ������� ��� */
    			selectStr =  " select coalesce(sum(payswork),0)::numeric(15,2) as payswork , cehid from (  " +
        				" select a2h.paysworkbonus as payswork , a2h.cehid  " +
        				" from enact2humen a2h " +
        				" where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
        				" where oz.code=" + ozCode +
        				 	" and oz.code = oz2act.usageinputitemozrefcod" +
        				 	" ) " +
        				 	//SUPP-106909" and a2h.payworkcou>0  " +
        				 	" and a2h.humenkindrefcode = 1 " +  // ������������ ��������� � ���������
        				 " union all " +
        				 " select a2h.paysworkbonus as payswork, a2h.cehid 	" +
        				 " from enact2humen a2h , enact2enplanwork ap , enplanwork p " +
        				 " where a2h.actrefcode = ap.actrefcode " +
        				 " and ap.plancode = p.code " +
        				 " and p.typerefcode= 112 " +
        				 " And a2h.humenkindrefcode = 2 " +
        				 " and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
        				 	" where oz.code=" + ozCode +
        				 	" and oz.code = oz2act.usageinputitemozrefcod " +
        				 	" ) " +
        				 	//SUPP-106909	" and a2h.payworkcou>0 " +
        				 " ) as dat1 " +
        				 " group by dat1.cehid  " ;
    		}
    		// �� ������� ������� reportName := '201109/ActZKU/Act21';
    		if(scUsageInputItemKind == 4 ){
    			selectStr ="  select sum(payswork)::numeric(15,2) as payswork , cehid  , korPodr from \n" +
    					"  ( \n" +
    					"  select  en2h.paysworkbonus-coalesce(en2h.payworkcou,0) as payswork  , en2h.cehid \n" +
    					"   /* ����������� ������������� ��� */ \n" +
    					"    , ( select /*string_agg(sc.code::text ,',')*/ coalesce(sc.podrcodezku,'') From \n" +
    					"              sccounter sc , \n" +
    					"              enestimateitem eni , \n" +
    					"              enplanwork enp , \n" +
    					"              enelement el \n" +
    					"          where sc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/ \n" +
    					"            and sc.estimateitemrefcode = eni.code \n" +
    					"            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"            and enp.code = eni.planrefcode \n" +
    					"            and enp.elementrefcode = el.code \n" +
    					"            and enp.code = ap.plancode \n" +
    					"            and eni.kindrefcode=1 \n" +
    					"            and eni.accountingtyperefcode=2 \n" +
    					"     ) as korPodr \n" +
    					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
    					"     Where en2h.humenkindrefcode = 1 \n" +
    					"       and en2h.actrefcode = ap.actrefcode \n" +
    					"       and en2h.humenkindrefcode = hk.code \n" +
    					"       and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
    					"       and ap.plancode in (select enp.code as planworkcode  From \n" +
    					"                          scusageinputtmz2sccntr sci2scc , \n" +
    					"                          sccounter sc , \n" +
    					"                          enestimateitem eni , \n" +
    					"                          enplanwork enp , \n" +
    					"                          enelement el, \n" +
    					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
    					"                          where sci2scc.ozrefcode = " + ozCode + " \n" +
    					"                            and sc.statusrefcode = 2  \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode \n" +
    					"                            and sc.estimateitemrefcode = eni.code \n" +
    					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"                            and enp.code = eni.planrefcode \n" +
    					"                            and enp.elementrefcode = el.code \n" +
    					"                            and md.workordercode=wp.workordercode \n" +
    					"                            and md.moltyperefcode=1 \n" +
    					"                            and wp.plancode=enp.code \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
    					"         \n" +
    					"  union all \n" +
    					"  Select en2h.paysworkbonus as payswork, en2h.cehid  \n" +
    					"   /* ����������� ������������� ��� */ \n" +
    					"    , ( select /*string_agg(sc.code::text ,',')*/ coalesce(sc.podrcodezku,'') From \n" +
    					"              sccounter sc , \n" +
    					"              enestimateitem eni , \n" +
    					"              enplanwork enp , \n" +
    					"              enelement el \n" +
    					"          where sc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/ \n" +
    					"            and sc.estimateitemrefcode = eni.code \n" +
    					"            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"            and enp.code = eni.planrefcode \n" +
    					"            and enp.elementrefcode = el.code \n" +
    					"            and enp.code = ap.plancode \n" +
    					"            and eni.kindrefcode=1 \n" +
    					"            and eni.accountingtyperefcode=2 \n" +
    					"     ) as korPodr \n" +
    					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
    					"     Where en2h.humenkindrefcode = 2 \n" +
    					"     and en2h.actrefcode = ap.actrefcode \n" +
    					"     and en2h.humenkindrefcode = hk.code \n" +
    					"     and ap.plancode in (select enp.code as planworkcode  From \n" +
    					"                          scusageinputtmz2sccntr sci2scc , \n" +
    					"                          sccounter sc , \n" +
    					"                          enestimateitem eni , \n" +
    					"                          enplanwork enp , \n" +
    					"                          enelement el, \n" +
    					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
    					"                          where sci2scc.ozrefcode = " + ozCode + " \n" +
    					"                            and sc.statusrefcode = 2  \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode \n" +
    					"                            and sc.estimateitemrefcode = eni.code \n" +
    					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"                            and enp.code = eni.planrefcode \n" +
    					"                            and enp.elementrefcode = el.code \n" +
    					"                            and md.workordercode=wp.workordercode \n" +
    					"                            and md.moltyperefcode=1 \n" +
    					"                            and wp.plancode=enp.code \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
    					"       \n" +
    					"  ) dat \n" +
    					"  group by cehid , korPodr \n" ;
    		}


    		if(selectStr.length()== 0 ){
    			throw new EnergyproSystemException(" �� �������� ������ ��� �������� !!! ");
    		}
    		try {

    			statement = connection.prepareStatement(selectStr);
    			set = statement.executeQuery();

    			int i;
    			for (i = 0; set.next(); i++) {
    				anObject = new FKTrans2AXTransItemShort();

    				anObject.amountCur = set.getBigDecimal(1);
    				if(anObject.amountCur != null) {
    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    				}
    				anObject.balCeh = set.getString(2);

    				if(scUsageInputItemKind == 4 ){
    					anObject.korCeh = set.getString(3);
    				}


    				result.list.add(anObject);
    			}

    			result.setTotalCount(i);
    			return result;
    		} catch (SQLException e) {
                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                return result;
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
     * ���������� ����� �������� ���.  �� ���� ��� ������������ ��������   c ����������� �� ���������� ���� ����������
     * */
        public FKTrans2AXTransItemShortList getDataForProvsSalaryByActRed(int actCode)  throws PersistenceException
        {
        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
    		FKTrans2AXTransItemShort anObject;
    		result.list = new Vector<FKTrans2AXTransItemShort>();

    		String selectStr;
    		PreparedStatement statement = null;
    		ResultSet  set = null;

    		selectStr = " select sum(a2h.paysworkbonus)::numeric(15,2) , a2h.balans , a2h.cehid  from enact2humen a2h" +
    					" where a2h.paysworkbonus::numeric(15,2) > 0 and a2h.actrefcode =  " + actCode + " group by a2h.balans  , a2h.cehid  " ;

    		try {
    			statement = connection.prepareStatement(selectStr);
    			set = statement.executeQuery();
    			int i;
    			for (i = 0; set.next(); i++) {
    				anObject = new FKTrans2AXTransItemShort();

    				anObject.amountCur = set.getBigDecimal(1);
    				if(anObject.amountCur != null) {
    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    				}
    				anObject.balans = set.getString(2);
    				anObject.balCeh = set.getString(3);

    				result.list.add(anObject);
    			}

    			result.setTotalCount(i);
    			return result;
    		} catch (SQLException e) {
                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                return result;
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
         * ���������� ����� �������� ���.  �� �� ��� ������������ ��������   c ����������� �� ���������� ���� ����������
         * */
            public FKTrans2AXTransItemShortList getDataForProvsSalaryByOZRed(int ozCode , int iszku , int scUsageInputItemKind )  throws PersistenceException
            {
            	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
        		FKTrans2AXTransItemShort anObject;
        		result.list = new Vector<FKTrans2AXTransItemShort>();

        		String selectStr= "";
        		PreparedStatement statement = null;
        		ResultSet  set = null;

        		if(iszku==0){
        			selectStr = " select sum(a2h.paysworkbonus)::numeric(15,2) , a2h.balans , a2h.cehid  from enact2humen a2h " +
          					    " where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
          					    " 		where oz.code= " + ozCode +
          					    " 	and oz.code = oz2act.usageinputitemozrefcod) " +
          					    " 	group by a2h.balans  , a2h.cehid  " ;
        		}

        		if(iszku==1){
        			/*��� ���������� ���� � ����
            		 * ��� ������� �������� � ������ � ������ � ����� 112 -  �� - ������ �������� � ������� ��� */
            		    		selectStr =  " select sum(payswork)::numeric(15,2) as payswork , balans , cehid from (  " +
            		    				" select a2h.paysworkbonus as payswork , a2h.cehid , a2h.balans  " +
            		    				" from enact2humen a2h " +
            		    				" where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
            		    				" where oz.code=" + ozCode +
            		    				 	" and oz.code = oz2act.usageinputitemozrefcod" +
            		    				 	" ) " +
            		    				 	//SUPP-106909	" and a2h.payworkcou>0 " +
            		    				 	" and a2h.humenkindrefcode = 1 " +  // ������������ ��������� � ���������
            		    				 " union all " +
            		    				 " select a2h.paysworkbonus as payswork , a2h.cehid  , a2h.balans	" +
            		    				  " from enact2humen a2h , enact2enplanwork ap , enplanwork p " +
            		    				 " where a2h.actrefcode = ap.actrefcode " +
            		    				 " and ap.plancode = p.code " +
            		    				 " and p.typerefcode= 112 " +
            		    				 " And a2h.humenkindrefcode = 2 " +
            		    				 " and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
            		    				 	" where oz.code=" + ozCode +
            		    				 	" and oz.code = oz2act.usageinputitemozrefcod " +
            		    				 	" ) " +
            		    				 	//SUPP-106909	" and a2h.payworkcou>0 " +
            		    				 " ) as dat1 " +
            		    				  " group by dat1.balans ,  dat1.cehid  " ;
        		}

        		// �� ������� ������� reportName := '201109/ActZKU/Act21';
        		if(scUsageInputItemKind == 4 ){
        			selectStr = "   \n" +
        					"  select sum(payswork)::numeric(15,2) as payswork , balans , cehid from \n" +
        					"  (  \n" +
        					"  select  en2h.paysworkbonus-coalesce(en2h.payworkcou,0) as payswork  , en2h.cehid , en2h.balans  \n" +
        					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
        					"     Where en2h.humenkindrefcode = 1 \n" +
        					"       and en2h.actrefcode = ap.actrefcode \n" +
        					"       and en2h.humenkindrefcode = hk.code \n" +
        					"       and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
        					"       and ap.plancode in (select enp.code as planworkcode  From \n" +
        					"                          scusageinputtmz2sccntr sci2scc , \n" +
        					"                          sccounter sc , \n" +
        					"                          enestimateitem eni , \n" +
        					"                          enplanwork enp , \n" +
        					"                          enelement el, \n" +
        					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
        					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
        					"                            and sc.statusrefcode = 2  \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode \n" +
        					"                            and sc.estimateitemrefcode = eni.code \n" +
        					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"                            and enp.code = eni.planrefcode \n" +
        					"                            and enp.elementrefcode = el.code \n" +
        					"                            and md.workordercode=wp.workordercode \n" +
        					"                            and md.moltyperefcode=1 \n" +
        					"                            and wp.plancode=enp.code \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
        					"         \n" +
        					"  union all \n" +
        					"  Select en2h.paysworkbonus as payswork, en2h.cehid , en2h.balans  \n" +
        					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
        					"     Where en2h.humenkindrefcode = 2 \n" +
        					"     and en2h.actrefcode = ap.actrefcode \n" +
        					"     and en2h.humenkindrefcode = hk.code \n" +
        					"     and ap.plancode in (select enp.code as planworkcode  From \n" +
        					"                          scusageinputtmz2sccntr sci2scc , \n" +
        					"                          sccounter sc , \n" +
        					"                          enestimateitem eni , \n" +
        					"                          enplanwork enp , \n" +
        					"                          enelement el, \n" +
        					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
        					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
        					"                            and sc.statusrefcode = 2  \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode \n" +
        					"                            and sc.estimateitemrefcode = eni.code \n" +
        					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"                            and enp.code = eni.planrefcode \n" +
        					"                            and enp.elementrefcode = el.code \n" +
        					"                            and md.workordercode=wp.workordercode \n" +
        					"                            and md.moltyperefcode=1 \n" +
        					"                            and wp.plancode=enp.code \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
        					"       \n" +
        					"  ) dat \n" +
        					"  group by cehid , balans ";
        		}

        		try {
        			statement = connection.prepareStatement(selectStr);
        			set = statement.executeQuery();
        			int i;
        			for (i = 0; set.next(); i++) {
        				anObject = new FKTrans2AXTransItemShort();

        				anObject.amountCur = set.getBigDecimal(1);
        				if(anObject.amountCur != null) {
        					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        				}
        				anObject.balans = set.getString(2);
        				anObject.balCeh = set.getString(3);

        				result.list.add(anObject);
        			}

        			result.setTotalCount(i);
        			return result;
        		} catch (SQLException e) {
                    System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                    return result;
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
     * ���������� ����� ���������� ��� �����  �� ���� �������������� �� ���� � ������� ��������� - ������� /�� �������  ��� ������������ �������� ������
     *
     * */
        public FKTrans2AXTransItemShortList getDataForBlackProvs�hargesumByAct(int actCode)  throws PersistenceException
        {
        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
    		FKTrans2AXTransItemShort anObject;
    		result.list = new Vector<FKTrans2AXTransItemShort>();

    		String selectStr;
    		PreparedStatement statement = null;
    		ResultSet  set = null;

    		selectStr =  /*" select sum(a2h.chargesum)::numeric(15,2) , a2h.cehid , a2h.chargerefcode from enact2humen a2h \n" +
    				 " where a2h.actrefcode =  " + actCode +
    				 " group by a2h.cehid , a2h.chargerefcode ";*/
    				 " select sum(chargesum) , cehid , chargerefcode from ( " +
    				 " select a2h.chargesum::numeric(15,2) as chargesum , a2h.cehid , a2h.chargerefcode from enact2humen a2h " +
    				 " where a2h.chargesum::numeric(15,2) > 0 and a2h.actrefcode =  " + actCode + " ) as ddd group by cehid , chargerefcode " ;

    		try {
    			statement = connection.prepareStatement(selectStr);
    			set = statement.executeQuery();
    			int i;
    			for (i = 0; set.next(); i++) {
    				anObject = new FKTrans2AXTransItemShort();



    				anObject.amountCur = set.getBigDecimal(1);
    				if(anObject.amountCur != null) {
    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    				}

    				anObject.balCeh = set.getString(2);
    				anObject.chargerefcode = set.getInt(3);

    				result.list.add(anObject);
    			}

    			result.setTotalCount(i);
    			return result;
    		} catch (SQLException e) {
                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                return result;
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
         * ���������� ����� ���������� ��� �����  �� �� �������������� �� ���� � �� ���� ��������� - ������� /�� �������  ��� ������������ �������� ������
         *
         * */
            public FKTrans2AXTransItemShortList getDataForBlackProvs�hargesumByOZ(int ozCode , int iszku , int scUsageInputItemKind )  throws PersistenceException
            {
            	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
        		FKTrans2AXTransItemShort anObject;
        		result.list = new Vector<FKTrans2AXTransItemShort>();

        		String selectStr="";
        		PreparedStatement statement = null;
        		ResultSet  set = null;
        		
        		if(iszku==0){
        			selectStr = " select sum(chargesum) , cehid , chargerefcode from ( " +
            				"  select a2h.chargesum::numeric(15,2) as chargesum , a2h.cehid , a2h.chargerefcode from enact2humen a2h " +
            				"   where a2h.paysworkbonus > 0 " +
            				"     and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
            				"     							where oz.code= " + ozCode +
            				" 							and oz.code = oz2act.usageinputitemozrefcod)   ) as ddd group by cehid , chargerefcode ";
        		}
        		if(iszku==1){
        			selectStr =	" select sum(chargesum) as chargesum , cehid ,  chargerefcode from ( " +
    				" select /*a2h.chargesum::numeric(15,2)*/ ((coalesce(a2h.paysworkbonus,0)*a2h.chargepercent)/100)::numeric(15,2) as chargesum , a2h.cehid  ,  a2h.chargerefcode " +
    				" from enact2humen a2h " +
    				" where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
    				" where oz.code= " + ozCode +
    				" and oz.code = oz2act.usageinputitemozrefcod " +
    				" )  " +
    				//SUPP-106909" and a2h.payworkcou>0  " +
    				" and a2h.humenkindrefcode = 1 " +  // ������������ ��������� � ���������
    				" union all " +
    				" select /*a2h.chargesum::numeric(15,2)*/ (((a2h.paysworkbonus/* � ������ �� ���������� -coalesce(a2h.payworkcou,0)*/)*a2h.chargepercent)/100)::numeric(15,2) as chargesum , a2h.cehid , a2h.chargerefcode " +
    				" from enact2humen a2h , enact2enplanwork ap , enplanwork p  " +
    				" where a2h.actrefcode = ap.actrefcode  " +
    				" and ap.plancode = p.code  " +
    				" and p.typerefcode= 112 " +
    				" And a2h.humenkindrefcode = 2 " +
    				" and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
    				" where oz.code= " + ozCode +
    				" and oz.code = oz2act.usageinputitemozrefcod " +
    				" )  " +
    				//SUPP-106909" and a2h.payworkcou>0  " +
    				" ) as dat1 " +
    				" group by dat1.cehid , dat1.chargerefcode " ;
        		}


        		// �� ������� ������� reportName := '201109/ActZKU/Act21';
        		if(scUsageInputItemKind == 4 ){
        			selectStr = "  select sum(chargesum) as chargesum , cehid ,  chargerefcode  , korPodr  from \n" +
        					"  (  \n" +
        					"  select (((coalesce(en2h.paysworkbonus)-coalesce(en2h.payworkcou,0))*en2h.chargepercent)/100)::numeric(15,2) as chargesum , en2h.cehid  ,  en2h.chargerefcode  \n" +
        					"   /* ����������� ������������� ��� */ \n" +
        					"    , ( select /*string_agg(sc.code::text ,',')*/ coalesce(sc.podrcodezku,'') From \n" +
        					"              sccounter sc , \n" +
        					"              enestimateitem eni , \n" +
        					"              enplanwork enp , \n" +
        					"              enelement el \n" +
        					"          where sc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/ \n" +
        					"            and sc.estimateitemrefcode = eni.code \n" +
        					"            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"            and enp.code = eni.planrefcode \n" +
        					"            and enp.elementrefcode = el.code \n" +
        					"            and enp.code = ap.plancode \n" +
        					"            and eni.kindrefcode=1 \n" +
        					"            and eni.accountingtyperefcode=2 \n" +
        					"     ) as korPodr       \n" +
        					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
        					"     Where en2h.humenkindrefcode = 1 \n" +
        					"       and en2h.actrefcode = ap.actrefcode \n" +
        					"       and en2h.humenkindrefcode = hk.code \n" +
        					"       and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
        					"       and ap.plancode in (select enp.code as planworkcode  From \n" +
        					"                          scusageinputtmz2sccntr sci2scc , \n" +
        					"                          sccounter sc , \n" +
        					"                          enestimateitem eni , \n" +
        					"                          enplanwork enp , \n" +
        					"                          enelement el, \n" +
        					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
        					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
        					"                            and sc.statusrefcode = 2  \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode \n" +
        					"                            and sc.estimateitemrefcode = eni.code \n" +
        					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"                            and enp.code = eni.planrefcode \n" +
        					"                            and enp.elementrefcode = el.code \n" +
        					"                            and md.workordercode=wp.workordercode \n" +
        					"                            and md.moltyperefcode=1 \n" +
        					"                            and wp.plancode=enp.code \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
        					"         \n" +
        					"  union all \n" +
        					"  Select ((en2h.paysworkbonus*en2h.chargepercent)/100)::numeric(15,2) as chargesum , en2h.cehid  ,  en2h.chargerefcode  \n" +
        					"   /* ����������� ������������� ��� */ \n" +
        					"    , ( select /*string_agg(sc.code::text ,',')*/ coalesce(sc.podrcodezku,'') From \n" +
        					"              sccounter sc , \n" +
        					"              enestimateitem eni , \n" +
        					"              enplanwork enp , \n" +
        					"              enelement el \n" +
        					"          where sc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/ \n" +
        					"            and sc.estimateitemrefcode = eni.code \n" +
        					"            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"            and enp.code = eni.planrefcode \n" +
        					"            and enp.elementrefcode = el.code \n" +
        					"            and enp.code = ap.plancode \n" +
        					"            and eni.kindrefcode=1 \n" +
        					"            and eni.accountingtyperefcode=2 \n" +
        					"     ) as korPodr       \n" +
        					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
        					"     Where en2h.humenkindrefcode = 2 \n" +
        					"     and en2h.actrefcode = ap.actrefcode \n" +
        					"     and en2h.humenkindrefcode = hk.code \n" +
        					"     and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
        					"     and ap.plancode in (select enp.code as planworkcode  From \n" +
        					"                          scusageinputtmz2sccntr sci2scc , \n" +
        					"                          sccounter sc , \n" +
        					"                          enestimateitem eni , \n" +
        					"                          enplanwork enp , \n" +
        					"                          enelement el, \n" +
        					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
        					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
        					"                            and sc.statusrefcode = 2  \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode \n" +
        					"                            and sc.estimateitemrefcode = eni.code \n" +
        					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
        					"                            and enp.code = eni.planrefcode \n" +
        					"                            and enp.elementrefcode = el.code \n" +
        					"                            and md.workordercode=wp.workordercode \n" +
        					"                            and md.moltyperefcode=1 \n" +
        					"                            and wp.plancode=enp.code \n" +
        					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
        					"       \n" +
        					"  ) dat \n" +
        					"  group by cehid , chargerefcode , korPodr  ";
        		}

        		try {
        			statement = connection.prepareStatement(selectStr);
        			set = statement.executeQuery();
        			int i;
        			for (i = 0; set.next(); i++) {
        				anObject = new FKTrans2AXTransItemShort();



        				anObject.amountCur = set.getBigDecimal(1);
        				if(anObject.amountCur != null) {
        					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        				}

        				anObject.balCeh = set.getString(2);
        				anObject.chargerefcode = set.getInt(3);

        				if(scUsageInputItemKind == 4 ){
        					anObject.korCeh = set.getString(4);
        				}

        				result.list.add(anObject);
        			}

        			result.setTotalCount(i);
        			return result;
        		} catch (SQLException e) {
                    System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                    return result;
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
         * ���������� ����� ���������� ��� �����  �� ���� �������������� �� ���� , ��� � ������� ��������� - ������� /�� �������  ��� ������������ �������� �������
         *  !!!!!!!!!!!!! ������ 8 ������� � ��� �� ����� 3
         * */
            public FKTrans2AXTransItemShortList getDataForRedProvs�hargesumByAct(int actCode)  throws PersistenceException
            {
            	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
        		FKTrans2AXTransItemShort anObject;
        		result.list = new Vector<FKTrans2AXTransItemShort>();

        		String selectStr;
        		PreparedStatement statement = null;
        		ResultSet  set = null;

        		selectStr = " select sum(chargesum) as chargesum , cehid  , chargerefcode , balans from ( " +
        				 " select a2h.chargesum::numeric(15,2) as chargesum , a2h.cehid  , a2h.chargerefcode , overlay(a2h.balans placing '3' from 8 ) as balans from enact2humen a2h \n" +
        				 " where a2h.chargesum::numeric(15,2) > 0 and a2h.actrefcode =  " + actCode + " ) as ddd "+
        				 " group by cehid , chargerefcode  , balans ";
        		try {
        			statement = connection.prepareStatement(selectStr);
        			set = statement.executeQuery();
        			int i;
        			for (i = 0; set.next(); i++) {
        				anObject = new FKTrans2AXTransItemShort();



        				anObject.amountCur = set.getBigDecimal(1);
        				if(anObject.amountCur != null) {
        					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        				}

        				anObject.balCeh = set.getString(2);
        				anObject.chargerefcode = set.getInt(3);
        				anObject.balans = set.getString(4);

        				result.list.add(anObject);
        			}

        			result.setTotalCount(i);
        			return result;
        		} catch (SQLException e) {
                    System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                    return result;
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
     * ���������� ����� ���������� ��� �����  �� ���� �������������� �� ���� , ��� � ������� ��������� - ������� /�� �������  ��� ������������ �������� �������
     *  !!!!!!!!!!!!! ������ 8 ������� � ��� �� ����� 3
     * */
        public FKTrans2AXTransItemShortList getDataForRedProvs�hargesumByOZ(int ozCode ,int iszku , int scUsageInputItemKind )  throws PersistenceException
        {
        	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
    		FKTrans2AXTransItemShort anObject;
    		result.list = new Vector<FKTrans2AXTransItemShort>();

    		String selectStr="";
    		PreparedStatement statement = null;
    		ResultSet  set = null;

    		if(iszku==0){
    			selectStr = " select sum(chargesum) as chargesum , cehid ,chargerefcode , balans from ( " +
    					    " select a2h.chargesum::numeric(15,2) as chargesum  , a2h.cehid , a2h.chargerefcode , overlay(a2h.balans placing '3' from 8 ) as balans " +
    					    " from enact2humen a2h  " +
    					    " where a2h.paysworkbonus > 0 " +
    					    "  and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
    					    " where oz.code=" + ozCode  + " 	and oz.code = oz2act.usageinputitemozrefcod) " +
    					    " ) as dat1 " +
    					    " group by cehid , chargerefcode  , balans " ;
    		}

    		if(iszku==1){
    			selectStr =  " select sum(chargesum)::numeric(15,2) as chargesum , cehid ,  chargerefcode , overlay(balans placing '3' from 8 ) from ( " +
    					" select /*a2h.chargesum::numeric(15,2)*/ ((coalesce(a2h.paysworkbonus,0)*a2h.chargepercent)/100)::numeric(15,2) as chargesum  , a2h.cehid  ,  a2h.chargerefcode , a2h.balans  " +
    					" from enact2humen a2h  " +
    					" where a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
    					" where oz.code=" + ozCode  +
    					" and oz.code = oz2act.usageinputitemozrefcod " +
    					" )  " +
    					//SUPP-106909" and a2h.payworkcou>0  " +
    					" and a2h.humenkindrefcode = 1 " +  // ������������ ��������� � ���������
    					" union all " +
    					" select /*a2h.chargesum::numeric(15,2)*/ (((a2h.paysworkbonus/* � ������ �� ���������� -coalesce(a2h.payworkcou,0)*/)*a2h.chargepercent)/100)::numeric(15,2) as chargesum , a2h.cehid , a2h.chargerefcode , a2h.balans " +
    					" from enact2humen a2h , enact2enplanwork ap , enplanwork p  " +
    					" where a2h.actrefcode = ap.actrefcode " +
    					" and ap.plancode = p.code " +
    					" and p.typerefcode= 112 " +
    					" And a2h.humenkindrefcode = 2 " +
    					" and a2h.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
    					" where oz.code=" + ozCode +
    					" and oz.code = oz2act.usageinputitemozrefcod " +
    					" ) " +
    					//SUPP-106909" and a2h.payworkcou>0  " +
    					" ) as dat1 " +
    					" group by dat1.cehid , dat1.chargerefcode , overlay(balans placing '3' from 8 )" ;
    		}

    		// �� ������� ������� reportName := '201109/ActZKU/Act21';
    		if(scUsageInputItemKind == 4 ){
    			selectStr = "  select sum(chargesum) as chargesum , cehid ,  chargerefcode  , overlay(balans placing '3' from 8 ) as balans  from \n" +
    					"  (  \n" +
    					"  select (((coalesce(en2h.paysworkbonus)-coalesce(en2h.payworkcou,0))*en2h.chargepercent)/100)::numeric(15,2) as chargesum , en2h.cehid  ,  en2h.chargerefcode , en2h.balans    \n" +
    					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
    					"     Where en2h.humenkindrefcode = 1 \n" +
    					"       and en2h.actrefcode = ap.actrefcode \n" +
    					"       and en2h.humenkindrefcode = hk.code \n" +
    					"       and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
    					"       and ap.plancode in (select enp.code as planworkcode  From \n" +
    					"                          scusageinputtmz2sccntr sci2scc , \n" +
    					"                          sccounter sc , \n" +
    					"                          enestimateitem eni , \n" +
    					"                          enplanwork enp , \n" +
    					"                          enelement el, \n" +
    					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
    					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
    					"                            and sc.statusrefcode = 2  \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode \n" +
    					"                            and sc.estimateitemrefcode = eni.code \n" +
    					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"                            and enp.code = eni.planrefcode \n" +
    					"                            and enp.elementrefcode = el.code \n" +
    					"                            and md.workordercode=wp.workordercode \n" +
    					"                            and md.moltyperefcode=1 \n" +
    					"                            and wp.plancode=enp.code \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
    					"         \n" +
    					"  union all \n" +
    					"  Select ((en2h.paysworkbonus*en2h.chargepercent)/100)::numeric(15,2) as chargesum , en2h.cehid  ,  en2h.chargerefcode  , en2h.balans  \n" +
    					"     From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk \n" +
    					"     Where en2h.humenkindrefcode = 2 \n" +
    					"     and en2h.actrefcode = ap.actrefcode \n" +
    					"     and en2h.humenkindrefcode = hk.code \n" +
    					"     and (en2h.paysworkbonus-coalesce(en2h.payworkcou,0))>0 \n" +
    					"     and ap.plancode in (select enp.code as planworkcode  From \n" +
    					"                          scusageinputtmz2sccntr sci2scc , \n" +
    					"                          sccounter sc , \n" +
    					"                          enestimateitem eni , \n" +
    					"                          enplanwork enp , \n" +
    					"                          enelement el, \n" +
    					"                          finmoldata  md,enworkorder2enplanwork  wp \n" +
    					"                          where sci2scc.ozrefcode = "+ ozCode +" \n" +
    					"                            and sc.statusrefcode = 2  \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode \n" +
    					"                            and sc.estimateitemrefcode = eni.code \n" +
    					"                            and eni.accountingtyperefcode = 2 /*�������� */ \n" +
    					"                            and enp.code = eni.planrefcode \n" +
    					"                            and enp.elementrefcode = el.code \n" +
    					"                            and md.workordercode=wp.workordercode \n" +
    					"                            and md.moltyperefcode=1 \n" +
    					"                            and wp.plancode=enp.code \n" +
    					"                            and sc.code = sci2scc.sccounterrefcode) \n" +
    					"       \n" +
    					"  ) dat \n" +
    					"  group by cehid , chargerefcode , overlay(balans placing '3' from 8 ) ";
    		}

    		try {

    			statement = connection.prepareStatement(selectStr);
    			set = statement.executeQuery();

    			int i;
    			for (i = 0; set.next(); i++) {
    				anObject = new FKTrans2AXTransItemShort();

    				anObject.amountCur = set.getBigDecimal(1);
    				if(anObject.amountCur != null) {
    					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    				}

    				anObject.balCeh = set.getString(2);
    				anObject.chargerefcode = set.getInt(3);
    				anObject.balans = set.getString(4);

    				result.list.add(anObject);
    			}

    			result.setTotalCount(i);
    			return result;
    		} catch (SQLException e) {
                System.out.println(e.getMessage() + "\nstatement - " + selectStr);
                return result;
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
 *
 * ��������� ���������� ������������� �������� �������������������� ������
 *
 * �� ���� ���� ������� �������������������� ������ ��������� 50%, �� ������� ��������� 0.5
 *
 * @param codeAct ��� ����
 * @return ���������� ������������� �������� �������������������� ������
 */
public BigDecimal getProductionExpencesRateByAct(int codeAct) {
	BigDecimal percent = getProductionExpencesPercentByAct(codeAct);
	return (percent == null) ? null : percent.divide(new BigDecimal(100).setScale(2, BigDecimal.ROUND_HALF_UP));
}

/**
 *
 * ��������� ���������� ������������� �������� �������������������� ������ �� �������� ����
 *
 * �� ���� ���� ������� �������������������� ������ ��������� 50%, �� ������� ��������� 0.5
 *
 * @param date �������� ����
 * @return ���������� ������������� �������� �������������������� ������
 */
public BigDecimal getProductionExpencesRateByDate(Date date) {
	BigDecimal percent = this.getProductionExpencesPercentByDate(date);
	return (percent == null) ? null : percent.divide(new BigDecimal(100).setScale(2, BigDecimal.ROUND_HALF_UP));
}

/**
 *
 * ��������� ������� �������������������� ������ �� �������� ����
 *
 * @param date �������� ����
 * @return ������� �������������������� ������
 */
public BigDecimal getProductionExpencesPercentByDate(Date date) {
	ENStandardConstDAO dao = new ENStandardConstDAO(connection, userProfile);
	return dao.getENStandardConstEntryOnDate(ENStandardConst.PERCENT_COMPANY, date);
}

/**
 *
 * ��������� ������� �������������������� ������ �� ���� ����
 *
 * @param codeAct ��� ����
 * @return ������� �������������������� ������
 */
public BigDecimal getProductionExpencesPercentByAct(int codeAct) {

    BigDecimal result = new BigDecimal(0);
    PreparedStatement statement = null;
    ResultSet set = null;


    String sql = " select * from get_productionexpencespercent("+codeAct+")";


    try {
        statement = connection.prepareStatement(sql);
        set = statement.executeQuery();

        while (set.next()) {
            result = set.getBigDecimal(1);
        }

        if (result == null)
            result = new BigDecimal(0);

        return result;

    } catch (SQLException e) {
        System.out.println(e.getMessage() + "\nstatement - " + sql);
        return result;
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
 * ���������� ����� ����������� ���.  �� ���� ����� �� ������� ��� ������������ ��������
 * */
    public FKTrans2AXTransItemShortList getDataForProvsAmortizationByActServices(int actCode , int tkcalckind , boolean isWithDelivery )  throws PersistenceException
    {
    	FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
		FKTrans2AXTransItemShort anObject;
		result.list = new Vector<FKTrans2AXTransItemShort>();

		String selectStr;
		PreparedStatement statement = null;
		ResultSet  set = null;

		selectStr = " SELECT \n " +
				   " en2tr.invnumber, en2tr.name , sum(en2tr.payswork) as payswork \n " +
				   " FROM \n " +
				   "  enact2transport en2tr , entransportitem ti, enact2enplanwork a2pw, tktransportreal treal, \n " + 
				"  enplanworkitem pwi \n " + 
				"    where en2tr.actrefcode = " + actCode + 
				"   and ti.planrefcode =  a2pw.plancode \n " +
				"   and a2pw.actrefcode = en2tr.actrefcode \n " +
				"   and en2tr.invnumber = treal.invnumber \n " +
				"   and treal.code = ti.transportrealcode \n " +
				"   and a2pw.plancode = pwi.planrefcode \n " +
				"   and ti.planitemrefcode = pwi.code \n " +
				"  group by en2tr.invnumber, en2tr.name , en2tr.payswork \n " +
				"  Order by en2tr.invnumber " ;
		try {
			statement = connection.prepareStatement(selectStr);
			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new FKTrans2AXTransItemShort();

				anObject.accountDimension1 = set.getString(1); // ��� ��� 
				anObject.accountDimension2 = set.getString(2); // ������������ ���
				
				anObject.amountCur = set.getBigDecimal(3);
				if(anObject.amountCur != null) {
					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				
			

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            return result;
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
	 *
	 * ���������� ���� �� ������� ��� ���� (���� � �����)
	 *
	 * SUPP-67738 ��������� ������� �������� - ������ ����� ����������
	 * � �� ������� ��� ��� - ��� ��� ��� �������� ���������
	 * � ������ ���� ����� ������������� ����� ��
	 *
	 * @param actCode ��� ���� {@link ENAct}
	 * @param isException ���������� �� ������������ ����������
	 * @param isMount {@code true} - ���� �� ������� �� ����, {@code false} - ���� �� ������� �� �����
	 * , {@code null} - ���� �� ����� �������
	 * @param doNotCheckProm {@code true} - ����������� �������� �� ������������ - ����� ������ ����� ���������� 0, {@code false} - ��������� �������� �� ������������,
	 * ����� ����������� ������ �������� � ��������� ��������� ��� ������������� �������
	 * @return 0 - ���, 1 - ����
	 * @throws PersistenceException
	 */
   public int checkInSCCounterByActCode(int actCode, boolean isException, Boolean isMount, boolean doNotCheckProm) throws PersistenceException
   {

   	/**
		 *  SUPP-65483... 06.09.2017... +++ ���������� �������� ������������� �������...
		 *  ��� ��-���� ������ �� ���������...
		 */
   	ENActDAO actDao = new ENActDAO(connection, userProfile);
   	ENAct act = actDao.getObject(actCode);

   	if (doNotCheckProm && act.element.typeRef.code == ENElementType.TY_PROM) {
			return 0;
		}

       SCCounterDAO cDAO = new SCCounterDAO(connection, userProfile);
       SCCounterFilter cFilter = new SCCounterFilter();
       cFilter.kindRef.code = SCCounterKind.FOR_FACT;
       cFilter.conditionSQL =  "code in (select cc.code from  " +
       " sccounter cc , enestimateitem e , enact2enplanwork a2p,enplanwork p " +
       " where " +
       " cc.estimateitemrefcode = e.code " +
       " and e.planrefcode = a2p.plancode " +
       " and a2p.plancode=p.code "+
       " and a2p.actrefcode = ?" +
       ((isMount == null) ? "" : " and e.kindrefcode = ?")
       + ")" ;

       Vector<Object> binded = new Vector<Object>();
       binded.add(actCode);
       if(isMount != null) {
       	if(isMount) {
       		binded.add(ENEstimateItemKind.MATERIALS);
       	} else {
       		binded.add(ENEstimateItemKind.UNMOUNT);
       	}
       }

       //cFilter.conditionSQL = "estimateitemrefcode in " +
       //    "(select e.code from enestimateitem e, enact2enplanwork a2p where e.planrefcode = a2p.plancode and a2p.actrefcode = "+ actCode +")";
       int[] cArr = cDAO.getFilteredCodeArray(cFilter, 0, -1, binded);
       if (cArr.length != 0){
           if (isException)
               throw new EnergyproSystemException("������� � ���� ��'������ � ���������� ... ����������� ���������� ... ");
           else
               return 1;
       }
       return 0;
   }
    
    
    /**
    *
    * ���������� �� � ���� ������ �� ��������� ���
    *
    * SUPP-73861 31.07.2018 �� ������ ���������� ������� �������� �������� ���, ��� � ���� ��� �� ���������
    * ��� ������ ��������� ���� ����
    *
    * � ������������ ���� ������ ����� ����� ��������� �������� � ����� � ����� ��������� ���
    * (���� ����� ������� � ����������)
    *
    * @param act ������ ���� {@link ENAct}
    * @return {@code true} - � ���� ���� ����� � �������� ����� ��������� ���, {@code false} - � ���� ��� ������ � ����� ��������� ���
    * @throws PersistenceException
    */
   public boolean checkZKUMountingByAct(ENAct act) throws PersistenceException {

	ActLogic aLogic = new ActLogic(connection, userProfile);   
   	String planCodesStr = aLogic.getPlanCodesByAct(act.code);

   	ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
   	ENTechConditionsServicesDAO techCondServicesDao = new ENTechConditionsServicesDAO(connection, userProfile);
   	ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);

   	ENPlanWorkFilter filter = new ENPlanWorkFilter();
   	filter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, planCodesStr);
   	int[] planCodes = planDao.getFilteredCodeArray(filter, 0, 1);
   	
   	// ���� ������� ������� ����� ������������ � ����� � ��������
   	Date dateToCompare = act.dateAct;

   	if(planCodes.length == 0) return false;

   	ENPlanWork plan = planDao.getObject(planCodes[0]);
   	
   	ENTechConditionsServices techCondServices = techCondServicesDao.getENTechConditionsServicesByPlan(plan);
   	
   	/* SUPP-78547 � ������� ���������� ���� ����������� ��������. 
   	 * � ������, ���� ��� ����� ���� ������ � ��������� �� �������������,
   	 * �� ����� ����������� ���� ����� ��������, � �� ����. */
   	/* 
   	 * ��������� �������� ��� ���� ����������, ������ ��� ���� �������� 
   	 * ������� �� �� ������
   	 */
   	if(techCondServices != null) {
   		ENContragentDAO cntDAO = new ENContragentDAO(connection, userProfile);
   		ENContragentFilter cntFilter = new ENContragentFilter();
   		cntFilter.techCondServicesRef.code = techCondServices.code;
   		ENContragentShortList cntList = cntDAO.getScrollableFilteredList(cntFilter, 0, -1);
   		if (cntList.totalCount > 0) {
   			dateToCompare = cntList.get(0).techConObjectsDateGen;;
   		}
   		
   	}

   	boolean hasCounter = this.checkInSCCounterByActCode(act.code, false, null, false) > 0;
   	boolean isZkuMount =  planDao.checkENPlanWorkTypes(plan, false, true, ENPlanWorkType.EZ_SETUP_ZKU);

   	// 24.07.2018  ���� ��� ������ �� ��������� ����� ������ ������ ����������� �� �������,
   	//			   �� ���� ����� �������� ����� ��������� � ������������ ����� ���
   	// 30.07.2018 ��� ����� ����������� �� ������������� ����� - ����� �������� ����������
   	// ����� ��������� ����� ������.
   	if(hasCounter) {
   		Date checkDate = settingsLogic.getDateValue(ENSettingsKeysConsts.DATE_MOUNT_ZKU_WITHOUT_COUNTER, act.dateAct);
   		if(isZkuMount && dateToCompare.compareTo(checkDate) >= 0) {
   			ENPlanWorkTypeDAO planTypeDao = new ENPlanWorkTypeDAO(connection, userProfile);
   			ENPlanWorkType planType = planTypeDao.getObject(ENPlanWorkType.EZ_SETUP_ZKU);
   			throw new SystemException(String.format("�� %s ��������� ������ ����� ���� \"%s\" ����� �� ���������� � �����! ��� �����: %d"
   					, Tools.dateFormatDefault.format(checkDate)
   					, planType.name
   					, plan.code));
   		}
   		return false;
   	}

   	return isZkuMount;
   }


	/**
	 *
	 * ������� ��� � ������������ �� ������ ��� ����
	 *
	 * @param act {@link ENAct} ��� �� �������� ���������� �������� ���
	 */
	public void insertZKUsByAct(ENAct act) {
		Connection finConn = null;
		try {
			if(act == null || act.code == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException();
			}

			finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			ENActDAO actDao = new ENActDAO(connection, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			FINMolLogic finMolLogic = new FINMolLogic(connection, userProfile);
			PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
			ENTechConditionsServicesDAO tcServicesDao = new ENTechConditionsServicesDAO(connection, userProfile);
			ElementLogic elementLogic = new ElementLogic(connection, userProfile);
			com.ksoe.energynet.dataminer.SCLogicDAO scDao = new com.ksoe.energynet.dataminer.SCLogicDAO(finConn, userProfile);
			SCCounterDAO counterDao = new SCCounterDAO(connection, userProfile);
			ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
			ENAct2OSTableDAO act2OstableDao = new ENAct2OSTableDAO(connection, userProfile);

			actDao.checkENActStatuses(act, true, true, ENActStatus.GOOD);

			ActLogic aLogic = new ActLogic(connection, userProfile);
			
			String planCodesStr = aLogic.getPlanCodesByAct(act.code);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, planCodesStr);
			int[] planCodes = planDao.getFilteredCodeArray(planFilter, 0, -1);
			if(planCodes.length == 0) throw new SystemException(String.format("� ��� � %s �� %s ���� ������!"
					, act.numberGen, new SimpleDateFormat("dd.mm.yyyy").format(act.dateAct)));
			for(int planCode : planCodes) {
				ENPlanWork plan = planDao.getObject(planCode);
				// ���� ���� ����� ��� �������� �� "��������� ���", �� ����� ����������� ������
				planDao.checkENPlanWorkTypes(plan, true, true, ENPlanWorkType.EZ_SETUP_ZKU);
				ENWorkOrder workOrder = planWorkLogic.getWorkOrderByPlanCode(plan.code);
				FINMolData finMolData = finMolLogic.getFINMolDataByWorkOrderCode(workOrder.code, FINMolType.MASTER);
				ENTechConditionsServices tcServices = tcServicesDao.getENTechConditionsServicesByPlan(plan);
				Boolean isStandardConnection = null;
				if(tcServices != null) {
				            switch (tcServices.connectionKindRef.code) {
				            case ENConnectionKind.STANDART:
				                isStandardConnection = true;
				                break;
				            case ENConnectionKind.NO_STANDART:
				                isStandardConnection = false;
				                break;
				            case ENConnectionKind.READY_MADE:
				                isStandardConnection = false;
				                break;
				            default:
				                throw new SystemException(String.format("��� �������� � %s ����� %s ����� ���������� ��� �������������",
				                        tcServices.contractNumber, new SimpleDateFormat("dd.MM.yyyy").format(tcServices.contractDate)));
				            }
				}
				if(finMolData == null) throw new SystemException(String.format("�� �������� ����� �� ��� ��� ����� � ����� %d", plan.code));

				String accountNumber = elementLogic.getElementInvNumber(plan.elementRef.code);

				ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
				estimateFilter.planRef.code = plan.code;
				int[] estimateCodes = estimateDao.getFilteredCodeArray(estimateFilter, 0, -1);

				int codeZKU = scDao.transferCounterMountInSCZKU(
						Integer.MIN_VALUE
						, act.numberGen
						, act.dateGen
						, userProfile.userName
						, new Date()
						, ""
						, counterDao.getAddr(estimateCodes[0])
						, act.dateAct
						, accountNumber
						, "���-" + accountNumber
						, "���"
						, finMolData.finMolCode
						, (tcServices == null ? null : tcServices.contractNumber)
						, (tcServices == null ? null : tcServices.contractDate)
						, isStandardConnection);

				String invNumberZKU = scDao.getInvNumberZKU(codeZKU);

				// ������ ����������� ���� � ������������ � ������ � �����
				ENAct2OSTable act2Ostable = new ENAct2OSTable();
				act2Ostable.num_un = codeZKU;
				act2Ostable.invNumber = invNumberZKU;
				act2Ostable.actRef.code = act.code;
				act2OstableDao.add(act2Ostable);

			}
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
	          try {
	              if (finConn != null && ! finConn.isClosed()) {
	                  finConn.close();
	                  finConn = null;
	              }
	          } catch (SQLException e) {
	          }
	          this.closeConnection();
		}
	}

	private static final int ZKUS_INSERTED_BY_ACT_REMOVAL = 0;
	private static final int ZKUS_INSERTED_BY_ACT_MOVE = 1;
	private static final int ZKUS_INSERTED_BY_ACT_UNMOVE = 2;
	
	
	

	/**
	 *
	 * �������� ����������� ��� �� ����
	 *
	 * @param act {@link ENAct} ��� �� �������� ���������� ������� ���
	 */
	public void removeZKUsInsertedByAct(ENAct act) {
		this.workWithZKUsInsertedByAct(act, ENActStatus.SIGNATURE, ZKUS_INSERTED_BY_ACT_REMOVAL);
	}

	/**
	 *
	 * �������� ����������� ��� �� ����
	 *
	 * @param act {@link ENAct} ��� �� �������� ���������� �������� ���
	 */
	public void moveZKUsInsertedByAct(ENAct act) {
		this.workWithZKUsInsertedByAct(act, ENActStatus.SIGNATURE, ZKUS_INSERTED_BY_ACT_MOVE);
	}

	/**
	 *
	 * ������ ���������� ��� �� ����
	 *
	 * @param act {@link ENAct} ��� �� �������� ���������� �������� ���������� ���
	 */
	public void unMoveZKUsInsertedByAct(ENAct act) {
		this.workWithZKUsInsertedByAct(act, ENActStatus.CLOSED, ZKUS_INSERTED_BY_ACT_UNMOVE);
	}

	/**
	 *
	 * �����, �������, � ����������� �� ���������� � ���� ��������� {@code action}
	 * ������������ ������������ �������� � ��� ���������� � ������
	 *
	 * @param act ������ ����
	 * @param actStatusCode ������, � ������� ������ ���� ���
	 * (���� ��� �� ����� � ���� �������, �� ����� ����������� ����������)
	 * @param action ����� �����, � ����� �� �������� �������� (0 - �������� ���;
	 * 1 - ���������� ���; 2 - ������ ���������� ���)
	 */
	private void workWithZKUsInsertedByAct(ENAct act, int actStatusCode, int action) {
		Connection finConn = null;
		try {
			if(act == null || act.code == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException();
			}
			finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			com.ksoe.energynet.dataminer.SCLogicDAO scDao = new com.ksoe.energynet.dataminer.SCLogicDAO(finConn, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			ENAct2OSTableDAO act2OstableDao = new ENAct2OSTableDAO(connection, userProfile);
			ENActDAO actDao = new ENActDAO(connection, userProfile);

			actDao.checkENActStatuses(act, true, true, actStatusCode);

			ActLogic aLogic = new ActLogic(connection, userProfile);
			String planCodesStr = aLogic.getPlanCodesByAct(act.code);
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, planCodesStr);
			int[] planCodes = planDao.getFilteredCodeArray(planFilter, 0, -1);
			if(planCodes.length == 0) throw new SystemException(String.format("� ��� � %s �� %s ���� ������!"
					, act.numberGen, new SimpleDateFormat("dd.mm.yyyy").format(act.dateAct)));
			for(int planCode : planCodes) {
				ENPlanWork plan = planDao.getObject(planCode);
				// ���� ���� ����� ��� �������� �� "��������� ���", �� ����� ����������� ������
				planDao.checkENPlanWorkTypes(plan, true, true, ENPlanWorkType.EZ_SETUP_ZKU);
			}

			ENAct2OSTableFilter act2OstableFilter = new ENAct2OSTableFilter();
			act2OstableFilter.actRef.code = act.code;

			ENAct2OSTableShortList act2OstableList = act2OstableDao.getScrollableFilteredList(act2OstableFilter, 0, -1);

			for(ENAct2OSTableShort act2Ostable : act2OstableList.list) {
				switch(action) {
				case ZKUS_INSERTED_BY_ACT_REMOVAL:
					scDao.untransferCounterMountInSCZKU(act2Ostable.num_un);
					act2OstableDao.remove(act2Ostable.code);
					break;
				case ZKUS_INSERTED_BY_ACT_MOVE:


					ENAct2HumenDAO actHumenDao = new ENAct2HumenDAO(connection, userProfile);

					ENAct2HumenFilter actHumenFilter = new ENAct2HumenFilter();
					actHumenFilter.actRef.code = act.code;

					ENAct2HumenShortList actHumenList = actHumenDao.getFilteredList(actHumenFilter);

					BigDecimal sumSalary = new BigDecimal(0).setScale(2,  BigDecimal.ROUND_HALF_UP);
					BigDecimal sumTaxes = new BigDecimal(0).setScale(2,  BigDecimal.ROUND_HALF_UP);

					for(ENAct2HumenShort actHumen : actHumenList.list) {
						sumSalary = sumSalary.add(actHumen.paysWorkBonus);
						sumTaxes = sumTaxes.add(actHumen.chargeSum);
					}

					int idZKU = scDao.provCounterMountInSCZKU(
					        Integer.MIN_VALUE,
					         act2Ostable.num_un,
					         act.dateGen,
					         aLogic.getSumByActCode(act.code),
					         aLogic.getSumOfMaterialsInAct(act, null, false, TKAccountingType.COUNTERS),
					         aLogic.getSumOfMaterialsInAct(act, true, false, TKAccountingType.COUNTERS),
					         sumSalary,
					         sumTaxes
					);

					for(ENAct2HumenShort actHumen : actHumenList.list) {
						scDao.dovvodCounterMountInSCZKU(idZKU, actHumen.tabNumber, actHumen.balans, actHumen.paysWorkBonus, actHumen.chargeSum);
					}
					break;
				case ZKUS_INSERTED_BY_ACT_UNMOVE:
					scDao.unprovCounterMountInSCZKU(act2Ostable.num_un);
					break;
				default: throw new java.lang.IllegalArgumentException("������������ �������� ��� ��������� action");
				}
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
	          try {
	              if (finConn != null && ! finConn.isClosed()) {
	                  finConn.close();
	                  finConn = null;
	              }
	          } catch (SQLException e) {
	          }
	          this.closeConnection();
		}
	}


//NET-2335 �������� �������� �� ���� ��������� ����� FK & AX
public FKProvResult movePostingByOZ(SCUsageInputItemOZ oz , SCUsageInput ui ){
	    Connection finConn = null;
		//Connection enConn = null;

		try {
	 FKProvResult provResult = null;

	 finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

     FKPostingLogic fpLogic = new FKPostingLogic(finConn , userProfile);
     ENPlanWorkDAO plDao = new ENPlanWorkDAO(connection, userProfile);
     SCUsageInputItemOZ2ENActDAO oz2actDAO = new SCUsageInputItemOZ2ENActDAO(connection, userProfile);
     ENActDAO aDAO = new ENActDAO(connection, userProfile);

     mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);

     SCUsageInputItemDAO usiDAO = new SCUsageInputItemDAO(connection, userProfile);
     SCCounterDAO cDAO = new SCCounterDAO(connection, userProfile);
     
     ActLogic aLogic = new ActLogic(connection, userProfile);

     SCUsageInputItemFilter usiFilter = new SCUsageInputItemFilter();
     usiFilter.conditionSQL =  " SCUsageInputItem.code in (select ii.code from scusageinputitem ii, scusageinputitemoz oz "
     		+ " where ii.code = oz.usageinputitemrefcode and oz.code = " + oz.code +" )";
     SCUsageInputItemShortList usiList = usiDAO.getScrollableFilteredList(usiFilter, 0, -1);
     SCUsageInputItem usiObject = usiDAO.getObject(usiList.get(0).code);

     // SUPP-67738 ����������� �� ��� ��������� ���������
     boolean isAbonCounter = (oz.account == null || oz.account.trim().length() == 0);

     /*�� ����������� ����� � ����*/
     /*ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
     a2hFilter.chargeRef.code = FINChargeType.IS_NOT_INVALID;
     a2hFilter.actRef.code = act.code;
     ENAct2HumenShortList a2hList = a2hDAO.getScrollableFilteredList(a2hFilter, 0, -1);
     if (a2hList.totalCount>0){
     	chargepercent = a2hList.get(0).chargePercent;
     }*/

      /*!!!! ���� ��� ���� = ����������� ������������ � ������ ����� � ������ � ���� ���� ���� �� ������� ()
       * ( 100	�� - ������� ����� ���������
       *   102	�� - ��������� ����� ���������
       *   103	�� - ��������� ������������ ���������
       *   106	�� - ��������� ���
       *   111	�� - ��������� ��� � �������(���������) ��������
       *   112	�� - ������ �������� � ������� ��� )
      !!!!! �� ���������� , ����� ����� ...�.� ����� ��� �������� �������� �� ��*/

     ENPlanWorkFilter plFil = new ENPlanWorkFilter();
     plFil.conditionSQL = "  enplanwork.code in ( select p.code from enplanwork p  , enact2enplanwork a2p \n"+
                         " where a2p.actrefcode in (select oz2act.enactrefcode from scusageinputitemoz oz , scusageinputitemoz2nct oz2act " +
													" where oz.code=" + oz.code  +
													" and oz.code = oz2act.usageinputitemozrefcod ) " +
                         " and a2p.plancode = p.code  \n"+
                         " and p.typerefcode in ( "+ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER +" , "
                         +ENPlanWorkType.EZ_NOPLANED_CHANGE_COUNTER +" , "
                         +ENPlanWorkType.EZ_NOPLANED_SETUP_COUNTER +" , "
                         +ENPlanWorkType.EZ_SETUP_ZKU  +" , "
                         +ENPlanWorkType.EZ_CHANGE_ZKU  +" , "
                         +ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU +" ) "
                         		+ " union \n" + // ������ ��� �� ������� ���� � scusage
                         		"  /* ������� ���*/ \n" +
                         		"  select enp.code  From \n" +
                         		"  scusageinputtmz2sccntr sci2scc , \n" +
                         		"  sccounter sc , \n" +
                         		"  enestimateitem eni , \n" +
                         		"  enplanwork enp , \n" +
                         		"  enelement el, \n" +
                         		"  finmoldata  md, \n" +
                         		"  enworkorder2enplanwork  wp \n" +
                         		"  where sci2scc.ozrefcode = " + oz.code  + "  /*�������� ���� ��*/ \n" +
                         		"    and sc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/ \n" +
                         		"    and sc.code = sci2scc.sccounterrefcode \n" +
                         		"    and sc.estimateitemrefcode = eni.code \n" +
                         		"    and eni.accountingtyperefcode = 2 /*�������� */ \n" +
                         		"    and enp.code = eni.planrefcode \n" +
                         		"    and enp.elementrefcode = el.code \n" +
                         		"    and md.workordercode=wp.workordercode \n" +
                         		"    and md.moltyperefcode=1 \n" +
                         		"    and wp.plancode=enp.code  \n" +
                         		"    and sc.code = sci2scc.sccounterrefcode \n" +
                         		") "   ;
     int[] plFilArr = plDao.getFilteredCodeArrayNOSEGR(plFil, 0, -1);
     // �� �������� �������� ��� ����� ��� ��������� (���� ��)
     // - ��������� � ������������
     // - ������ �/� � ��
     // - ��������� � ������������ � ������ ��� . //
     if (plFilArr.length == 0 || usiObject.kindRef.code == SCUsageInputItemKind.UsageOut
    		                  || usiObject.kindRef.code == SCUsageInputItemKind.InputUsing
    		                  || usiObject.kindRef.code == SCUsageInputItemKind.UsageInputInZKU  ){
     	return provResult;
     }
     
     ////
     int connectionKind = Integer.MIN_VALUE;
     boolean isPricon = false;

     ENActFilter aFil = new ENActFilter();
     aFil.conditionSQL = " enact.code in (  select u2a.enactrefcode from scusageinputitemoz2nct u2a where u2a.usageinputitemozrefcod = "+ oz.code+" \n" +
						"  union  \n" +
						"  select a2p.actrefcode from scusageinputtmz2sccntr oz2sc, sccounter sc , enestimateitem ei , enact2enplanwork a2p \n" +
						"  where oz2sc.ozrefcode = "+ oz.code+"  \n" +
						"  and sc.code = oz2sc.sccounterrefcode \n" +
						"  and sc.estimateitemrefcode = ei.code  \n" +
						"  and ei.planrefcode = a2p.plancode )       ";

     int[] aArr = aDAO.getFilteredCodeArray(aFil, 0, -1);

     if (aArr.length == 0 ){
    	 throw new EnergyproSystemException(" \n ��� �������� �������� �� ��������� ������ ���� ��������� ���� ");
     }

     connectionKind = aLogic.getConnectionKind(aArr[0]);
    	if(connectionKind != Integer.MIN_VALUE){
    		isPricon = true;
    	}

		String V_Prov_Buffer = "";
		// ��������� �������� ��� ���
		if ( ui.iszku == Integer.MIN_VALUE || ui.iszku == 0 ){
			String  kodPodr = "";
			// ��������� ��� ���� �� �������� mdax
			if(usiObject.kindRef.code == SCUsageInputItemKind.UsageInputZKU || usiObject.kindRef.code == SCUsageInputItemKind.UsageInput ){
				 // ��� ������������� � ������� �������� ���
					SCCounterFilter cFil = new SCCounterFilter();
					cFil.conditionSQL = " sccounter.invnumber is not null and sccounter.code in ( select qq.sccounterrefcode from scusageinputtmz2sccntr qq where qq.ozrefcode = "+ oz.code +" )";
					int[] cArr = cDAO.getFilteredCodeArray(cFil, 0, -1);
					if(cArr.length > 0 ){
						SCCounter cObj = cDAO.getObject(cArr[0]);
						kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(cObj.departmetFKCode, ui.dateGen);
					} else {
						kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(ui.department.hrmorganizationid, ui.dateGen);
					}
				}
			else
	        kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(ui.department.hrmorganizationid, ui.dateGen);

			if(kodPodr.equals("") ){
				throw new EnergyproSystemException(" \n ��� �������� �������� �� ��������� ��� ���� �� �� !!! \n ui.department.hrmorganizationid = " + ui.department.hrmorganizationid  );
			}



	         // -- ���� �� �� ����� � ������������ �������� �� ��� ���� ������� �� �������� ������� ��������  ,, 1-� ���� ��� =1 , 2-� ���� ��� = (���� ������� �� = 5 ������ 4)
	         // -- ���� �� �� ����� � ������������ ��� �� ��� ���� = 1531 ,, 1-� ���� ��� = 2 , 2 ���� ��� = (���� ������� �� = 5 ������ 4)

		     //~!!!!!!!! 14.09.2017  --- ��������� �� ����������� ��� ����� ���� ������� ����� � 15 ����� �� ���� 4 ����� ��������� ���������� 15..
		     ///!!!!!!!!!!!!!!!  � ���� ����� � 11 ����� �� ��� ���� = 1532 ����� , ��� ������� �������� � ��� ����� ����� � ����� ��������� � ������� ���
		     String IIII =""; // ��� ���� �� ���������
		     String BBBBBBBBBBB="";
			 ///String BBBBBBBBBBB_otchisl="";
		     String infoDescript = " ������ ��������� ";

		     if( usiObject.kindRef.code == SCUsageInputItemKind.UsageInput ||
		         usiObject.kindRef.code == SCUsageInputItemKind.UsageInputInZKU	 ){
		    	 // SUPP-67738 ���� ������� ��������, �� ���� - 2320
		    	 if(isAbonCounter) {
		    		 IIII = "2320";
		    	 } else {
			    	 if(  oz.account.substring(0, 2).equals("11") ){
			    		 IIII = "1532";
			    	 } else
			    	 {
			    		 IIII = oz.account;
			    	 }
		    	 }

		    	 //BBBBBBBBBBB= "1"+ new String(isPricon == true ? "5" : "4") + "000000000";
		    	 // 20.09.2017 -- �� ��������� ��� ���������� �� ������������� ��� ��� . ��� = 14000000000
		    	 // SUPP-67738 ���� ������� ��������, �� ��� - 00506300001
		    	 if(isAbonCounter) {
			    	 BBBBBBBBBBB= "00503300001";
		    	 } else {
			    	 BBBBBBBBBBB= "14000000000";
		    	 }
		    	 infoDescript = " ������ ��������� ";

		     } else {

		    	/* if(  oz.account.substring(0, 2).equals("11") ){
		    		 IIII = "1532";
		    	 } else
		    	 {
		    		 IIII = oz.account;
		    	 }*/
		    	 IIII = "1531"; // � ��������� �������� ��� ���� ������ ��� �� ���� 1531
		    	 BBBBBBBBBBB= "2"+ new String(isPricon == true ? "5" : "4") + "000000000";
		    	 infoDescript = " ������ ���  ";
		     }




  	         // I �������� �� �� ������
		    FKTrans2AXTransItemShortList fkTrans2axTransList = this.getDataForProvsSalaryByOZ(oz.code, ui.iszku , usiObject.kindRef.code);

	        if(fkTrans2axTransList.get(0).balCeh == null || fkTrans2axTransList.get(0).balCeh.equals("") ){
	        	SCUsageInputItemOZ2ENActFilter oz2actFilter = new SCUsageInputItemOZ2ENActFilter();

	        	oz2actFilter.conditionSQL = " scusageinputitemoz2nct.enactrefcode in (  select u2a.enactrefcode from scusageinputitemoz2nct u2a where u2a.usageinputitemozrefcod = "+ oz.code+" \n" +
						"  union  \n" +
						"  select a2p.actrefcode from scusageinputtmz2sccntr oz2sc, sccounter sc , enestimateitem ei , enact2enplanwork a2p \n" +
						"  where oz2sc.ozrefcode = "+ oz.code+"  \n" +
						"  and sc.code = oz2sc.sccounterrefcode \n" +
						"  and sc.estimateitemrefcode = ei.code  \n" +
						"  and ei.planrefcode = a2p.plancode )       ";
	        	SCUsageInputItemOZ2ENActShortList oz2actList = oz2actDAO.getScrollableFilteredList(oz2actFilter, 0, -1);
	        	for (int a = 0; a < oz2actList.totalCount ; a++) {
	        		this.recalcENAct2HumenCehIdbyAct(oz2actList.get(a).enActRefCode); // ���� ������ ��� ������������ � ������� ������ ������
				}

	        	  fkTrans2axTransList = this.getDataForProvsSalaryByOZ(oz.code, ui.iszku , usiObject.kindRef.code);
	         }
	          // ���� �������� �� ���������� ��� - ����� ������
	          if(fkTrans2axTransList.get(0).balCeh == null || fkTrans2axTransList.get(0).balCeh.equals("") ){
	        	  throw new EnergyproSystemException(" \n ��� �������� �� ��������� ��� ���� !!! ������� ������� ���������� ���� !!! ");
	          }

	          BigDecimal zpByAct = new BigDecimal(0);
	          for (int i = 0; i < fkTrans2axTransList.totalCount; i++) {

	        	  if(usiObject.kindRef.code == SCUsageInputItemKind.UsageInputZKU ){ // !!!!!!!!  ���� ��������� ��� �� ��� ��� ��� ��� ���
	        		  kodPodr = fkTrans2axTransList.get(i).korCeh;
	        	  }


	        	  zpByAct = zpByAct.add(fkTrans2axTransList.get(i).amountCur);
	        	  V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
	        		ui.dateGen,              // ���� ��������� (���� ��� ���������� �� ������� �������� ��� )
	        		fkTrans2axTransList.get(i).amountCur ,          //����� � �������
	        		fkTrans2axTransList.get(i).balCeh ,
	          		"6610" ,           // ���������� ����
	          		"00000000130",     // ����������  ���
	          		kodPodr,           // ����.��� ( ��� ���� ��� 000 ���� ������������� ��� )
	          		IIII ,             // ����.����
	             	// ����.���
	          		BBBBBBBBBBB	,
	        		oz.numberDoc  ,
	          		ui.dateGen ,
	          		"to_net_oz ��� � "+oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
			            );
				}
	       // I �������� �� �� �������, �������� ����� �� � ������������ �� ��� ����������   � ���
	           fkTrans2axTransList = this.getDataForProvsSalaryByOZRed(oz.code, ui.iszku , usiObject.kindRef.code );
	           for (int ir = 0; ir < fkTrans2axTransList.totalCount; ir++) {
		        	  V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
		        		ui.dateGen,              // ���� ���������
		        		fkTrans2axTransList.get(ir).amountCur.negate() ,          //����� � �������
		        		fkTrans2axTransList.get(ir).balCeh ,
		          		"6610" ,           // ���������� ����
		          		"00000000130",             // ����������  ���
		          		fkTrans2axTransList.get(ir).balCeh,                    // �����������������  ���
		          		fkTrans2axTransList.get(ir).balans.substring(0, 4) ,            // �����������������  ���� ��� ���������� ����
		             	// �����������������  ���
		          		fkTrans2axTransList.get(ir).balans.substring(4, 15)
		        		,
		        		oz.numberDoc  ,
		          		ui.dateGen ,
		          		"to_net_oz ��� � "+oz.numberDoc +", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
				            );
					}

	            // II ����� �������� ������ ������ �� ������������'������ �������� ��������� ����������� - ������
	            fkTrans2axTransList = this.getDataForBlackProvs�hargesumByOZ(oz.code, ui.iszku , usiObject.kindRef.code );
		           for (int c = 0; c < fkTrans2axTransList.totalCount; c++) {
		        	   V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
		   	        		ui.dateGen,              // ���� ���������
		   	        		fkTrans2axTransList.get(c).amountCur ,          //����� � �������
		   	        		fkTrans2axTransList.get(c).balCeh ,
		   	        		fkTrans2axTransList.get(c).chargerefcode == FINChargeType.IS_NOT_INVALID ? "6510"  : "6512",           // ���������� ����
		   	          		"00000000130",             // ����������  ���
		   	          		kodPodr,                   // �����������������  ���
		   	             	IIII ,             // �����������������  ����
		   	                BBBBBBBBBBB  , // �����������������  ���
		   	        		oz.numberDoc ,
		   	          		ui.dateGen ,
		   	          		"to_net_oz ��� � "+ oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
		   			            );
		           }

		        // ������ ������ �� ������������'������ �������� ��������� ����������� - �������  , �������� �� ����  , ��� , ���� ��������� - ������� / �� �������
		            fkTrans2axTransList = this.getDataForRedProvs�hargesumByOZ(oz.code, ui.iszku , usiObject.kindRef.code );
			           for (int c = 0; c < fkTrans2axTransList.totalCount; c++) {
			        	  if (fkTrans2axTransList.get(c).amountCur.doubleValue() > 0 ){
			        		  V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
					   	        		ui.dateGen,              // ���� ���������
					   	        		fkTrans2axTransList.get(c).amountCur.negate() ,          //����� � �������
					   	        		fkTrans2axTransList.get(c).balCeh ,
					   	        		fkTrans2axTransList.get(c).chargerefcode == FINChargeType.IS_NOT_INVALID ? "6510"  : "6512",           // ���������� ����
					   	          		"00000000130",                                                 // ����������  ���
					   	          	    fkTrans2axTransList.get(c).balCeh,                             // �����������������  ���
					   	             	fkTrans2axTransList.get(c).balans.substring(0, 4) ,            // �����������������  ���� ��� ���������� ����
					             	  // �����������������  ���
					          	    	fkTrans2axTransList.get(c).balans.substring(4, 15)
					   	        		,
					   	        		oz.numberDoc  ,
					   	          		ui.dateGen ,
					   	          		"to_net_oz ��� � "+oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
					   			            );  
			        	      } 
			        	   
			           }

			}
		// ��������� �������� d� ������ ��� !!!!!!!!!!!!!!!!!!!!!!!!!!!!
				if ( ui.iszku == 1 ){
					String  kodPodr = "";
					// ��������� ��� ���� �� �������� mdax
					if( usiObject.kindRef.code == SCUsageInputItemKind.UsageInput){
					 // ��� ������������� � ������� �������� ���
						SCCounterFilter cFil = new SCCounterFilter();
                        cFil.conditionSQL = " sccounter.invnumber is not null and sccounter.code in ( select qq.sccounterrefcode from scusageinputtmz2sccntr qq where qq.ozrefcode = "+ oz.code +" )";
						int[] cArr = cDAO.getFilteredCodeArray(cFil, 0, -1);
						if(cArr.length == 0 ){
							if(isAbonCounter) {
								kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(ui.department.hrmorganizationid, ui.dateGen);
							}
						} else {
							SCCounter cObj = cDAO.getObject(cArr[0]);
							// kodPodr = cObj.departmetFKCode; 04.10.2017
							kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(cObj.departmetFKCode, ui.dateGen);
						}
					} else if (	usiObject.kindRef.code == SCUsageInputItemKind.UsageInputZKU  ){
						// ������������� ������������ �� ���� ��� ���
						kodPodr = "0"+usiObject.molCode.substring(0, 2);
					} else {
						kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(ui.department.hrmorganizationid, ui.dateGen);
					}



					if(kodPodr.equals("") ){
						throw new EnergyproSystemException(" \n ��� �������� �������� �� ��������� ��� ���� �� �� !!! \n ui.department.hrmorganizationid = " + ui.department.hrmorganizationid  );
					}

				  // -- ���� �� �� ����� � ������������ �������� �� ��� ���� ������� �� �������� ������� ��������  ,, 1-� ���� ��� =1 , 2-� ���� ��� = (���� ������� �� = 5 ������ 4)
			         // -- ���� �� �� ����� � ������������ ��� �� ��� ���� = 1531 ,, 1-� ���� ��� = 2 , 2 ���� ��� = (���� ������� �� = 5 ������ 4)
				     String IIII =""; // ��� ���� �� ���������
				     String BBBBBBBBBBB="";
					 ///String BBBBBBBBBBB_otchisl="";
				     String infoDescript = " ������ ��������� ";

				     if( usiObject.kindRef.code == SCUsageInputItemKind.UsageInput ||
				         usiObject.kindRef.code == SCUsageInputItemKind.UsageInputInZKU	 ){
				    	 //IIII = oz.account; 14.09.2017
				    	 // SUPP-67738 ���� ������� ��������, �� ���� - 2320
				    	 if(isAbonCounter) {
				    		 IIII = "2320";
				    	 } else {
					    	 if(  oz.account.substring(0, 2).equals("11") ){
					    		 IIII = "1532";
					    	 } else
					    	 {
					    		 IIII = oz.account;
					    	 }
				    	 }

				    	 // SUPP-67738 ���� ������� ��������, �� ��� - 00506300001
				    	 if(isAbonCounter) {
					    	 BBBBBBBBBBB= "00506300001";
				    	 } else {
					    	 BBBBBBBBBBB= "14000000000";
				    	 }

				    	 infoDescript = " ������ ��������� ";

				     } else {

				    	 /*if(  oz.account.substring(0, 2).equals("11") ){
				    		 IIII = "1532";
				    	 } else
				    	 {
				    		 IIII = oz.account;
				    	 }*/
				    	 IIII = "1531"; // � ��������� �������� ��� ���� ������ ��� �� ���� 1531
				    	 BBBBBBBBBBB= "2"+ new String(isPricon == true ? "5" : "4") + "000000000";
				    	 infoDescript = " ������ ��� ";

				     }




		  	         // I �������� �� �� ������
				    FKTrans2AXTransItemShortList fkTrans2axTransList = this.getDataForProvsSalaryByOZ(oz.code , ui.iszku , usiObject.kindRef.code);

			        if(fkTrans2axTransList.get(0).balCeh == null || fkTrans2axTransList.get(0).balCeh.equals("") ){
			        	SCUsageInputItemOZ2ENActFilter oz2actFilter = new SCUsageInputItemOZ2ENActFilter();
			        	oz2actFilter.conditionSQL = " scusageinputitemoz2nct.enactrefcode in (  select u2a.enactrefcode from scusageinputitemoz2nct u2a where u2a.usageinputitemozrefcod = "+ oz.code+" \n" +
						"  union  \n" +
						"  select a2p.actrefcode from scusageinputtmz2sccntr oz2sc, sccounter sc , enestimateitem ei , enact2enplanwork a2p \n" +
						"  where oz2sc.ozrefcode = "+ oz.code+"  \n" +
						"  and sc.code = oz2sc.sccounterrefcode \n" +
						"  and sc.estimateitemrefcode = ei.code  \n" +
						"  and ei.planrefcode = a2p.plancode )       ";
			        	SCUsageInputItemOZ2ENActShortList oz2actList = oz2actDAO.getScrollableFilteredList(oz2actFilter, 0, -1);
			        	for (int a = 0; a < oz2actList.totalCount ; a++) {
			        		this.recalcENAct2HumenCehIdbyAct(oz2actList.get(a).enActRefCode); // ���� ������ ��� ������������ � ������� ������ ������
						}

			        	  fkTrans2axTransList = this.getDataForProvsSalaryByOZ(oz.code , ui.iszku , usiObject.kindRef.code );
			         }
			          // ���� �������� �� ���������� ��� - ����� ������
			          if(fkTrans2axTransList.get(0).balCeh == null || fkTrans2axTransList.get(0).balCeh.equals("") ){
			        	  throw new EnergyproSystemException(" \n ��� �������� �� ��������� ��� ���� !!! ������� ������� ���������� ���� !!! ");
			          }

			          BigDecimal zpByAct = new BigDecimal(0);
			          for (int i = 0; i < fkTrans2axTransList.totalCount; i++) {

			        	  if(usiObject.kindRef.code == SCUsageInputItemKind.UsageInputZKU ){ // !!!!!!!!  ���� ��������� ��� �� ��� ��� ��� ��� ���
			        		  kodPodr = fkTrans2axTransList.get(i).korCeh;
			        		  kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(kodPodr, ui.dateGen);
			        	  }

			        	  zpByAct = zpByAct.add(fkTrans2axTransList.get(i).amountCur);
			        	  V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
			        		ui.dateGen,              // ���� ���������
			        		fkTrans2axTransList.get(i).amountCur ,          //����� � �������
			        		fkTrans2axTransList.get(i).balCeh ,
			          		"6610" ,           // ���������� ����
			          		"00000000130",     // ����������  ���
			          		kodPodr,           // ����.��� ( ��� ���� ��� 000 ���� ������������� ��� )
			          		IIII ,             // ����.����
			             	// ����.���
			          		BBBBBBBBBBB	,
			        		oz.numberDoc  ,
			          		ui.dateGen ,
			          		"to_net_oz ��� � "+oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
					            );
						}
			       // I �������� �� �� �������, �������� ����� �� � ������������ �� ��� ����������   � ���
			           fkTrans2axTransList = this.getDataForProvsSalaryByOZRed(oz.code , ui.iszku , usiObject.kindRef.code );
			           for (int ir = 0; ir < fkTrans2axTransList.totalCount; ir++) {
				        	  V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
				        		ui.dateGen,              // ���� ���������
				        		fkTrans2axTransList.get(ir).amountCur.negate() ,          //����� � �������
				        		fkTrans2axTransList.get(ir).balCeh ,
				          		"6610" ,           // ���������� ����
				          		"00000000130",             // ����������  ���
				          		fkTrans2axTransList.get(ir).balCeh,                    // �����������������  ���
				          		fkTrans2axTransList.get(ir).balans.substring(0, 4) ,            // �����������������  ���� ��� ���������� ����
				             	// �����������������  ���
				          		fkTrans2axTransList.get(ir).balans.substring(4, 15)
				        		,
				        		oz.numberDoc  ,
				          		ui.dateGen ,
				          		"to_net_oz ��� � "+oz.numberDoc +", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
						            );
							}

			            // II ����� �������� ������ ������ �� ������������'������ �������� ��������� ����������� - ������
			         fkTrans2axTransList = this.getDataForBlackProvs�hargesumByOZ(oz.code, ui.iszku , usiObject.kindRef.code );
				           for (int c = 0; c < fkTrans2axTransList.totalCount; c++) {

				        	   if(usiObject.kindRef.code == SCUsageInputItemKind.UsageInputZKU ){ // !!!!!!!!  ���� ��������� ��� �� ��� ��� ��� ��� ���
					        		  kodPodr = fkTrans2axTransList.get(c).korCeh;
					        		  kodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(kodPodr, ui.dateGen);
					        	  }

				        	   V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
				   	        		ui.dateGen,              // ���� ���������
				   	        		fkTrans2axTransList.get(c).amountCur ,          //����� � �������
				   	        		fkTrans2axTransList.get(c).balCeh ,
				   	        		fkTrans2axTransList.get(c).chargerefcode == FINChargeType.IS_NOT_INVALID ? "6510"  : "6512",           // ���������� ����
				   	          		"00000000130",             // ����������  ���
				   	          		kodPodr,                   // �����������������  ���
				   	             	IIII ,             // �����������������  ����
				   	                BBBBBBBBBBB  , // �����������������  ���
				   	        		oz.numberDoc ,
				   	          		ui.dateGen ,
				   	          		"to_net_oz ��� � "+ oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
				   			            );
				           }

				        // ������ ������ �� ������������'������ �������� ��������� ����������� - �������  , �������� �� ����  , ��� , ���� ��������� - ������� / �� �������
				            fkTrans2axTransList = this.getDataForRedProvs�hargesumByOZ(oz.code, ui.iszku , usiObject.kindRef.code );
					           for (int c = 0; c < fkTrans2axTransList.totalCount; c++) {
					        	   V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
					   	        		ui.dateGen,              // ���� ���������
					   	        		fkTrans2axTransList.get(c).amountCur.negate() ,          //����� � �������
					   	        		fkTrans2axTransList.get(c).balCeh ,
					   	        		fkTrans2axTransList.get(c).chargerefcode == FINChargeType.IS_NOT_INVALID ? "6510"  : "6512",           // ���������� ����
					   	          		"00000000130",                                                 // ����������  ���
					   	          	    fkTrans2axTransList.get(c).balCeh,                             // �����������������  ���
					   	             	fkTrans2axTransList.get(c).balans.substring(0, 4) ,            // �����������������  ���� ��� ���������� ����
					             	  // �����������������  ���
					          	    	fkTrans2axTransList.get(c).balans.substring(4, 15)
					   	        		,
					   	        		oz.numberDoc  ,
					   	          		ui.dateGen ,
					   	          		"to_net_oz ��� � "+oz.numberDoc+", "+ new SimpleDateFormat("dd.MM.yyyy").format(ui.dateGen) + infoDescript
					   			            );
					           }

					}

			provResult = new FKProvResult();
			provResult =  fpLogic.createPostings(V_Prov_Buffer);
			String badprovstring = "";
			if (provResult.badProvList.totalCount > 0 ) {
         	badprovstring="  ������ �� :  ";
         	for (int b = 0; b < provResult.badProvList.totalCount; b++) {

         		badprovstring = badprovstring
         				+  " ����� ������ = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
         				+  " \n ����������  = " + provResult.badProvList.get(b).primechan
         				+    " \n  bal_ceh " + provResult.badProvList.get(b).bal_ceh
         				+    "  bal_kau " + provResult.badProvList.get(b).bal_kau
         				+    "  bal_sch " + provResult.badProvList.get(b).bal_sch
         				+    "    bal_sub_sch " + provResult.badProvList.get(b).bal_sub_sch
         				+    " \n  kor_ceh " + provResult.badProvList.get(b).kor_ceh
         				+    "    kor_kau " + provResult.badProvList.get(b).kor_kau
         				+    "    kor_sch " + provResult.badProvList.get(b).kor_sch
         				+    "    kor_sub_sch " + provResult.badProvList.get(b).kor_sub_sch;
				}

         	System.out.print("\n \n \n hernya partid badprovstring =  error provResult = " +  badprovstring );
         }


		    return provResult;
   }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("�� ������� �������� ��������!",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	 // catch (ParseException e)             {throw new EnergyproSystemException(e.getMessage(),e);}

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




    public PostingLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    public class DataForTransAmortizacRed
    {

        String ceh;
        String kodZatrat;
        String vidOS;
        String balSch;
        BigDecimal summa;

        public DataForTransAmortizacRed(String vCeh,  String vKodZatrat,  String vVidOS, String vBalSch , BigDecimal vSumma)
        {
        	ceh = vCeh;
        	kodZatrat = vKodZatrat;
        	vidOS = vVidOS;
        	balSch = vBalSch;
        	summa = vSumma;
        }

        @Override
		public int hashCode()
        {
            // return agree_code.hashCode();
            return (ceh + kodZatrat+vidOS+balSch).hashCode();
        }

        @Override
		public boolean equals(Object obj)
        {
            if (obj instanceof DataForTransAmortizacRed)
            {
            	DataForTransAmortizacRed other = (DataForTransAmortizacRed)obj;
                // return this.agree_code.equals(other.agree_code);
            	return this.ceh.equals(other.ceh) && this.kodZatrat.equals(other.kodZatrat) &&  this.vidOS.equals(other.vidOS) &&  this.balSch.equals(other.balSch);
            }
            else
            {
                return false;
            }
        }
    }

    public class DataForTransAmortizacBlack
    {

        String ceh;
        String vidOS;
        String balSch;
        BigDecimal summa;

        public DataForTransAmortizacBlack(String vCeh,  String vVidOS, String vBalSch , BigDecimal vSumma)
        {
        	ceh = vCeh;
        	vidOS = vVidOS;
        	balSch = vBalSch;
        	summa = vSumma;
        }

        @Override
		public int hashCode()
        {
            // return agree_code.hashCode();
            return (ceh + vidOS + balSch ).hashCode();
        }

        @Override
		public boolean equals(Object obj)
        {
            if (obj instanceof DataForTransAmortizacBlack)
            {
            	DataForTransAmortizacBlack other = (DataForTransAmortizacBlack)obj;
                // return this.agree_code.equals(other.agree_code);
            	return this.ceh.equals(other.ceh) &&  this.vidOS.equals(other.vidOS) &&  this.balSch.equals(other.balSch) ;
            }
            else
            {
                return false;
            }
        }
    }


    public void recalcENAct2HumenCehIdbyAct(int actCode )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;


        try {
        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            FINLogic finLogic = new FINLogic(fkConnection, userProfile);
        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(connection, userProfile);

        String sql = " select distinct a2h.tabnumber , a.dategen from enact2humen a2h , enact a \n"+
        		" where a2h.actrefcode = a.code \n"+
        		" and a.code = " + actCode  +
        		// " and a2h.cehid is null \n"+
        		" group by a2h.tabnumber , a.dategen \n"+
        		" order by a.dategen  ";


        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
        resultSet = statement.executeQuery();

        while(resultSet.next()) {

    		ENAct2Humen a2hObj = finLogic.getBalansWithMainCeh(resultSet.getString(1), resultSet.getDate(2));
    	    		String balans = a2hObj.balans;
    	    		String cehId = a2hObj.cehId;

    	    ENAct2HumenFilter a2hFil = new ENAct2HumenFilter();
    	    a2hFil.conditionSQL = " enact2humen.code in ( select a2h.code from enact2humen a2h , enact a " +
					              " where a2h.actrefcode = a.code " +
					              " and a.dategen = '"+ resultSet.getDate(2) +"'" +
					              " and a2h.tabnumber = '"+ resultSet.getString(1) +"' )";
    	    int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFil, 0, -1);
    	    if (a2hArr.length > 0 ){
    	    	for (int j = 0; j < a2hArr.length; j++) {
    	    		ENAct2Humen a2hObjUpd = a2hDAO.getObject(a2hArr[j]);
    	    		a2hObjUpd.cehId = cehId;
    	    		a2hObjUpd.balans = balans;
    	    		a2hDAO.save(a2hObjUpd);
    	    		System.out.println(" recalcENAct2HumenCehIdbyAct enact2humen.code = " + a2hArr[j] + " tabn =" + resultSet.getString(1) + " cehid = " + cehId );
				}
    	    }
        }
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
    
    public void recalcenplanworkitem2humenbyAct(int actCode )
   	{
   		   PreparedStatement statement = null;
           ResultSet  resultSet = null;

           Connection fkConnection = null;


           try {
           	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
               FINLogic finLogic = new FINLogic(fkConnection, userProfile);
               ENPlanWorkItem2HumenDAO pi2hDAO = new ENPlanWorkItem2HumenDAO(connection, userProfile);

           String sql = " select distinct pi2h.tabnumber , a.dategen  from  enact2enplanwork a2p ,  enplanworkitem pii , enplanworkitem2humen pi2h , enact a " +
        		   "  where a2p.actrefcode = " + actCode  + 
        		   " 		 and a2p.plancode = pii.planrefcode " +
        		   " 		 and pi2h.plaitemrefcode = pii.code " +
        		   " 		 and a.code = a2p.actrefcode ";


           statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
           resultSet = statement.executeQuery();

           while(resultSet.next()) {

       		ENAct2Humen a2hObj = finLogic.getBalansWithMainCeh(resultSet.getString(1), resultSet.getDate(2));
       	    		String balans = a2hObj.balans;
       	    		String cehId = a2hObj.cehId;

       	    ENPlanWorkItem2HumenFilter pi2hFil = new ENPlanWorkItem2HumenFilter();
       	    /*pi2hFil.conditionSQL = " ENPLANWORKITEM2HUMEN.code in ( select a2h.code from enact2humen a2h , enact a " +
   					              " where a2h.actrefcode = a.code " +
   					              " and a.dategen = '"+ resultSet.getDate(2) +"'" +
   					              " and a2h.tabnumber = '"+ resultSet.getString(1) +"   ' )";*/
       	    
       	 pi2hFil.conditionSQL = " ENPLANWORKITEM2HUMEN.code in (  select pi2h.code from  enact2enplanwork a2p ,  enplanworkitem pii , enplanworkitem2humen pi2h , enact a " +
       	 " where a2p.actrefcode = " + actCode  + 
       	 " and a2p.plancode = pii.planrefcode " +
       	 " and pi2h.plaitemrefcode = pii.code " +
       	 " and a.code = a2p.actrefcode " +
       	 " and pi2h.tabnumber = '"+ resultSet.getString(1) +"')";
       	 
       	    int[] pi2hArr = pi2hDAO.getFilteredCodeArray(pi2hFil, 0, -1);
       	    if (pi2hArr.length > 0 ){
       	    	for (int j = 0; j < pi2hArr.length; j++) {
       	    		ENPlanWorkItem2Humen pi2hObjUpd = pi2hDAO.getObject(pi2hArr[j]);
       	    		//if(pi2hObjUpd.cehId.equalsIgnoreCase("") || pi2hObjUpd.balans.equalsIgnoreCase("") ){
       	    			pi2hObjUpd.cehId = cehId;
           	    		pi2hObjUpd.balans = balans;
           	    		pi2hDAO.save(pi2hObjUpd);
           	    		System.out.println(" recalcenplanworkitem2humenbyAct lanworkitem2humen.code = " + pi2hArr[j] + " tabn =" + resultSet.getString(1) + " cehid = " + cehId );	
       	    		//}
       	    		
   				}
       	    }
           }
           }
           catch (Exception e) {
               System.out.println("Error :" + e.getMessage());
               throw new SystemException(e) ;
           }


   	}

    

    public boolean checkCountersStateVerificationForAct(int actCode) {

    	try {

	    	ENCountersStateVerificationDAO stateVerificationDAO = new ENCountersStateVerificationDAO(connection, userProfile);

    		ENCountersStateVerificationFilter stateVerificationFilter = new ENCountersStateVerificationFilter();
    		stateVerificationFilter.actRef.code = actCode;

    		int[] stateVerificationArr = stateVerificationDAO.getFilteredCodeArray(stateVerificationFilter, 0, -1);

    		return (stateVerificationArr.length > 0);

    	} catch (PersistenceException e) {

    		throw new SystemException(e.getMessage(), e);

    	}

    }



    public ENAct2Humen getBalansWithMainCeh(ENAct act, Connection finConn) {

    	try {

			if ( act.molCodeObject == null || act.molCodeObject == "" ){
				throw new EnergyproSystemException("\n\n�� ���(������� �������) ��������� ������� ��� ��'���� ���� !!! ");
			}

			ENMolDAO molDAO = new ENMolDAO(connection, userProfile);

			ENMolFilter molFil = new ENMolFilter();
			molFil.finCode = act.molCodeObject;
			molFil.statusRef.code = ENMolStatus.VALID;
			int[] enmolArr = molDAO.getFilteredCodeArray(molFil, 0, -1);
			if (enmolArr.length == 0 ){
				throw new EnergyproSystemException("\n\n��������� ������ ���������� �� ���� " + act.molCodeObject + " � ������� (��������-����������-������� ���(����))!!! ");
			}

			ENMol molObj = molDAO.getObject(enmolArr[0]);

			if (molObj.tabNumber == null || molObj.tabNumber.equals("")){
				throw new EnergyproSystemException("\n\n� �������� (��������-����������-������� ���(����)) ��� ���� " + act.molCodeObject + " ��������� ������� ��������� ����� ����������� !!! ");
			}

			FINLogic finLogic = new FINLogic(finConn, userProfile);

			// ������� ��� � ������������� �� ����������
			ENAct2Humen a2hObj = finLogic.getBalansWithMainCeh(molObj.tabNumber, act.dateGen,
					"\n������ ��������� ��� ��'���� ���� �� ��� � " + act.numberGen + " �� " +
					new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen) + " !");

			String balans = a2hObj.balans;
			String cehId = a2hObj.cehId;

			if (balans == null || balans.equals("")){
				throw new EnergyproSystemException("\n\n������� ��� ���������� ��� ���� ��`���� !!!");
			}

			if (cehId == null || cehId.equals("")){
				throw new EnergyproSystemException("\n\n������� ��� ���������� �������� ���� ��`���� !!!");
			}

			return a2hObj;

    	} catch (PersistenceException e) {
    		throw new SystemException(e.getMessage(), e);
    	}
    }


    /**
     *	�������� ������� ��������� ����
     *	@param actCode - ��� ����
     */
	public void checkActIncomeServices(int actCode) {
		try {
			ENActIncomServ2ENActDAO actIncomServ2ENActDao = new ENActIncomServ2ENActDAO(connection, userProfile);
			ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(connection, userProfile);

			ENActIncomServ2ENActFilter actIncomServ2ENActFilter = new ENActIncomServ2ENActFilter();
			actIncomServ2ENActFilter.actRef.code = actCode;

			int aArr[] = actIncomServ2ENActDao.getFilteredCodeArray(actIncomServ2ENActFilter, 0, -1);
			if (aArr.length > 0) {

				ENActIncomServ2ENAct actIncomServ2ENAct = actIncomServ2ENActDao.getObject(aArr[0]);
				ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomServ2ENAct.actIncomeRef.code);

				throw new SystemException("\n\n"
						+ "���������� ��������� ���������!\n"
						+ "��� �������� �� ������������ ���� � = " + actIncomeServices.numberGen
						+ " �� " + new SimpleDateFormat("dd.MM.yyyy").format(actIncomeServices.dateGen) + ".");
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}
	
	/*
	 * ����������� ������� �������� 
	 * */
	public void setPostingTemplateByAct(ENAct actObj )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try {
        	
        ENAct2ProvDAO a2pDO = new ENAct2ProvDAO(connection, userProfile);

        String sql = "    /*����������� ������� ��������*/ \n" +
        		"    select coalesce( postingtemplatecode ,-1) as postingtemplatecode                \n" +
        		"    from (  \n" +
        		"     /*������ '�������� ������������'  */ \n" +
        		"     select 1 as postingtemplatecode   \n" +
        		"     from  enservicesobject so , enact a  \n" +
        		"     where so.elementcode = a.elementcode   \n" +
        		"     and a.code = "+ actObj.code +" \n" +
        		"     AND so.CONTRACTTYPEREFCODE = 8/*������� ������� �� �������*/  \n" +
        		"     AND coalesce(so.contracttyperefcode, -1) <> 5  \n" +
        		"      \n" +
        		"     UNION ALL    \n" +
        		"      \n" +
        		"     /*������ '������� �� �������' � '�������� ������' */ \n" +
        		"    select 2 as postingtemplatecode from tkclassificationtype tct , tktechcard tk , enplanworkitem pi , enplanwork pp , enact a  , enservicesobject so   \n" +
        		"    where tct.finworktypecode <> 25 /*25    �0    ��������� �������������������� ��������*/ \n" +
        		"    and tct.code = tk.classificationtypecode \n" +
        		"    and pi.kartarefcode=tk.code \n" +
        		"    and pi.planrefcode=pp.code  \n" +
        		"    and pp.kindcode=4 \n" +
        		"    and pp.elementrefcode=a.elementcode \n" +
        		"    and so.elementcode=a.elementcode \n" +
        		"    and so.elementcode=pp.elementrefcode \n" +
        		"    and coalesce(so.contracttyperefcode, -1) <> 5 \n" +
        		"    and (so.CONTRACTKINDREFCODE = 1/*������� ������� �� �������*/  or so.CONTRACTTYPEREFCODE = 7  /*������� �������� ������*/ ) \n" +
        		"    and a.code = "+ actObj.code +"  \n" +
        		"    and not ( tct.kod  like '2.2.04%' and coalesce(so.isnopay,0) <> 0 ) \n" +
        		"    and not ( tct.kod like '2.1.07%' and coalesce(so.isnopay,0) <> 0 ) \n" +
        		"     \n" +
        		"     UNION ALL  \n" +
        		"      \n" +
        		"     (/*������ ��� (������ �� ������� ���  ������������) �� ���������*/ \n" +
        		"     select 3 as postingtemplatecode \n" +
        		"     from enact2enplanwork a2p , entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc ,  entechconditionsservcs ts, enconnectionkind k , enact act    \n" +
        		"     where a2p.actrefcode =  "+ actObj.code +"   \n" +
        		"     and a2p.plancode= tc2p.planrefcode   \n" +
        		"     and tc2p.techconservicesrefcode = s2tc.techcondservrefcode   \n" +
        		"     and ts.code = s2tc.techcondservrefcode    \n" +
        		"     and ts.connectionkindrefcode = k.code  \n" +
        		"     and a2p.actrefcode=act.code  \n" +
        		"     and act.acttyperefcode in ( 29 , 7 ) \n" +
        		"     union all \n" +
        		"     /*������ ��� (������ �� ������� ���  ������������) �� ���������*/ \n" +
        		"     select 3 as postingtemplatecode  \n" +
        		"      from enservicesobject so , enact act  ,  enservicesobject2techcondtnsservices so2pric ,   \n" +
        		"      entechconditionsservcs ts, enconnectionkind k     \n" +
        		"      where so.elementcode = act.elementcode    \n" +
        		"      and act.code =   "+ actObj.code +"   \n" +
        		"      and so.code = so2pric.servicesobjectrefcode   \n" +
        		"      and ts.code = so2pric.techcondservrefcode    \n" +
        		"      and ts.connectionkindrefcode = k.code  \n" +
        		"      AND so.CONTRACTTYPEREFCODE = 5   \n" +
        		"      AND so.CONTRACTKINDREFCODE = 1 \n" +
        		"      and act.acttyperefcode in ( 29 , 7 ) \n" +
        		"     union all \n" +
        		"     /*������ ��� (������ �� ������� ���  ������������) �� ���������*/ \n" +
        		"     select 3 as postingtemplatecode    \n" +
        		"     from  ENSOProj2SOConn pfj2so , enservicesobject so , enact act , enservicesobject2techcondtnsservices so2pric , entechconditionsservcs ts, enconnectionkind k   \n" +
        		"     where pfj2so.soprojrefcode = so.code   \n" +
        		"     and so.elementcode = act.elementcode   \n" +
        		"     and act.code =  "+ actObj.code +"    \n" +
        		"     and so2pric.servicesobjectrefcode = pfj2so.soconnrefcode   \n" +
        		"     and ts.code = so2pric.techcondservrefcode     \n" +
        		"     and ts.connectionkindrefcode = k.code \n" +
        		"     AND so.CONTRACTTYPEREFCODE = 5   \n" +
        		"     AND so.CONTRACTKINDREFCODE = 1  \n" +
        		"     and act.acttyperefcode in ( 29 , 7 ) \n" +
        		"     ) \n" +
        		"       \n" +
        		"     UNION ALL \n" +
        		"      \n" +
        		"     /*������ '������� �� �������(��������� �������������������� ��������) ��� ���� � ������ = 0E' */ \n" +
        		"    select 4 as postingtemplatecode from tkclassificationtype tct , tktechcard tk , enplanworkitem pi , enplanwork pp , enact a  , enservicesobject so   \n" +
        		"    where tct.finworktypecode = 25 /*25    �0    ��������� �������������������� ��������*/ \n" +
        		"    and tct.code = tk.classificationtypecode \n" +
        		"    and pi.kartarefcode=tk.code \n" +
        		"    and pi.planrefcode=pp.code  \n" +
        		"    and pp.kindcode=4 \n" +
        		"    and pp.elementrefcode=a.elementcode \n" +
        		"    and so.elementcode=a.elementcode \n" +
        		"    and so.elementcode=pp.elementrefcode \n" +
        		"    and coalesce(so.contracttyperefcode, -1) <> 5 \n" +
        		"    and (so.CONTRACTKINDREFCODE = 1/*������� ������� �� �������*/  or so.CONTRACTTYPEREFCODE = 7  /*������� �������� ������*/ ) \n" +
        		"    and a.code = "+ actObj.code +"  \n" +
        		"     \n" +
        		"       UNION ALL \n" +
        		"      \n" +
        		"     /*������ ��� ���� ������� �� ������� (����������) ����������� 2.2.04�..(��������������) */ \n" +
        		"    select 5 as postingtemplatecode \n" +
        		"    from tkclassificationtype tct , tktechcard tk , enplanworkitem pi , enplanwork pp , enact a  , enservicesobject so   \n" +
        		"    where tct.finworktypecode <> 25 /*25    �0    ��������� �������������������� ��������*/ \n" +
        		"    and tct.code = tk.classificationtypecode \n" +
        		"    and pi.kartarefcode=tk.code \n" +
        		"    and pi.planrefcode=pp.code  \n" +
        		"    and pp.kindcode=4 \n" +
        		"    and pp.elementrefcode=a.elementcode \n" +
        		"    and so.elementcode=a.elementcode \n" +
        		"    and so.elementcode=pp.elementrefcode \n" +
        		"    and coalesce(so.contracttyperefcode, -1) <> 5 \n" +
        		"    and (so.CONTRACTKINDREFCODE = 1/*������� ������� �� �������*/  or so.CONTRACTTYPEREFCODE = 7  /*������� �������� ������*/ ) \n" +
        		"    and tct.kod like '2.2.04%' \n" +
        		"    and coalesce(so.isnopay,0) <> 0 \n" +
        		"    and a.code = "+ actObj.code +" \n" +
        		"   \n" +
        		"    UNION ALL \n" +
        		"     \n" +
        		"    /*������ ��� ���� ������� �� ������� (����������) ����������� 2.1.07�..(�������������) */ \n" +
        		"    select 6 as postingtemplatecode \n" +
        		"    from tkclassificationtype tct , tktechcard tk , enplanworkitem pi , enplanwork pp , enact a  , enservicesobject so   \n" +
        		"    where tct.finworktypecode <> 25 /*25    �0    ��������� �������������������� ��������*/ \n" +
        		"    and tct.code = tk.classificationtypecode \n" +
        		"    and pi.kartarefcode=tk.code \n" +
        		"    and pi.planrefcode=pp.code  \n" +
        		"    and pp.kindcode=4 \n" +    
        		"    and pp.elementrefcode=a.elementcode \n" +
        		"    and so.elementcode=a.elementcode \n" +
        		"    and so.elementcode=pp.elementrefcode \n" +
        		"    and coalesce(so.contracttyperefcode, -1) <> 5 \n" +
        		"    and (so.CONTRACTKINDREFCODE = 1/*������� ������� �� �������*/  or so.CONTRACTTYPEREFCODE = 7  /*������� �������� ������*/ ) \n" +
        		"    and tct.kod like '2.1.07%' \n" +
        		"    and coalesce(so.isnopay,0) <> 0 \n" +
        		"    and a.code = "+ actObj.code +" \n" +
        		"    ) as sel1 order by coalesce( postingtemplatecode ,-1) desc limit 1  \n" +
        		"     \n" +
        		"   ";


        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
        resultSet = statement.executeQuery();

        while(resultSet.next()) {

        	ENAct2ProvFilter a2pFilter = new ENAct2ProvFilter();
        	a2pFilter.actRef.code = actObj.code;
        	
        	int[] a2pArr = a2pDO.getFilteredCodeArray(a2pFilter, 0, -1);
        	if (a2pArr.length==0){
        	 ENAct2Prov a2pObj = new ENAct2Prov();
        	 a2pObj.isIncomeAct = Integer.MIN_VALUE;
        	 
        	 a2pObj.actRef.code = actObj.code;
        	 a2pObj.actPostingKindRef.code = resultSet.getInt(1);
        	 a2pObj.partId = -1;
        	 a2pDO.add(a2pObj);
        	}
        	else 
        	{
        		ENAct2Prov a2pObj = a2pDO.getObject(a2pArr[0]);
        		a2pObj.actPostingKindRef.code = resultSet.getInt(1);
        		a2pDO.save(a2pObj);
        	}
        	
        	break;
        }
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	/*zamena sfifra na konkretnoe znachenie */
	/**
	 * 
	 * @param fieldAtr
	 * @param piItem
	 * @param postingkind
	 * @param aMapSpecChar
	 * @param fkTrans2axTransListValue - �������� � ����� ��� ��������
	 * @return
	 */
	public String convertProvValue(String fieldAtr ,
			ENActPostingKindItem  piItem ,
			ENActPostingKind postingkind ,
			Map<String,	String> aMapSpecChar ,
			String fkTrans2axTransListValue , 
			FKTrans2AXTransItemShort fkTrans2axTransShort
			)
	{
		String outvalue = "";
        try {
        	
        ENAct2ProvDAO a2pDO = new ENAct2ProvDAO(connection, userProfile);

       /* if (piItem.accountKt_QFielld.equalsIgnoreCase("ENACTPOSTINGKINDITEM.ACCOUNTKT") ) {
        	outvalue = "accountKt";
        }*/ 
        
        
        if (fieldAtr.equalsIgnoreCase("cehKt")) {outvalue=piItem.cehKt;}
        if (fieldAtr.equalsIgnoreCase("accountKt")) {outvalue=piItem.accountKt;}
        if (fieldAtr.equalsIgnoreCase("kauKt")) {outvalue=piItem.kauKt;}
        if (fieldAtr.equalsIgnoreCase("cehDt")) {outvalue=piItem.cehDt;}
        if (fieldAtr.equalsIgnoreCase("accountDt")) {outvalue=piItem.accountDt;}
        if (fieldAtr.equalsIgnoreCase("kauDt")) {outvalue=piItem.kauDt;}
        if (fieldAtr.equalsIgnoreCase("kau_expense")) {outvalue=postingkind.kau_expense;}
        if (fieldAtr.equalsIgnoreCase("kau_closing")) {outvalue=postingkind.kau_closing;}
        
        for (Map.Entry entry : aMapSpecChar.entrySet()) {
		 
        	System.out.println("Key: " + entry.getKey() + " Value: " + entry.getValue());        	
        	
        	 // outvalue.replaceAll(entry.getKey()+"", entry.getValue()+"")
        	//StringBuilder sb = new StringBuilder( outvalue  ) ; 
        	//outvalue = Pattern.compile("\\"+entry.getKey()+"\\").matcher(sb).replaceAll(entry.getValue()+"");
        	outvalue = outvalue.replace(entry.getKey()+"", entry.getValue()+"");
		}
        
        for (Map.Entry entry : aMapSpecChar.entrySet()) {
        	//��� ������������ ������ ��������
        	if(entry.getValue().equals(ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_z)  && outvalue.contains(ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_z)   ) {
        	outvalue = this.setSymbolsFromPostingKind(postingkind.kau_expense , outvalue, ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_z);	
        	}
        	// ��� � ���� ��� ���  
        	if(entry.getValue().equals(ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_b)  && outvalue.contains(ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_b)   ) {
        		 if (fieldAtr.equalsIgnoreCase("kauKt")||fieldAtr.equalsIgnoreCase("kauKt") ) {
        			 outvalue = this.setSymbolsFromProductionCost(fkTrans2axTransShort.balans , "____"+outvalue, ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_b );
        			 outvalue = outvalue.replace("_", "");
        		 } else 
        			 outvalue = this.setSymbolsFromProductionCost(fkTrans2axTransShort.balans , outvalue, ENActPostingSpecCharacters.ENACTPOSTINGSPECCHARACTERS_b );
        			
            }
        	
		}
        
        

        return outvalue;
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	
	
	/* ����������� ������� � ENActPostingKindItem �� ENActPostingKind */
	public String setSymbolsFromPostingKind( String source , String receiver ,String symbol   )
	{
		String outvalue = "";
        try {
        	
        	int lastIndex = 0;
            List<Integer> listpos = new ArrayList<Integer>();

            StringBuilder outStr = new StringBuilder(receiver);
            while(lastIndex != -1) {

                lastIndex = outStr.indexOf(symbol,lastIndex+1);

                if(lastIndex != -1){
				    
                	outStr.replace(lastIndex, lastIndex+symbol.length(), source.substring(lastIndex, lastIndex+1 ) );
                	
                	listpos.add(lastIndex);               	
                	
                }
            }
        	
        return outStr.toString();
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	
	/* ����������� ������� �� ��� */
	public String setSymbolsFromProductionCost( String source , String receiver ,String symbol   )
	{
		String outvalue = "";
        try {
        	
        	int lastIndex = 0;
            List<Integer> listpos = new ArrayList<Integer>();

            StringBuilder outStr = new StringBuilder(receiver);
            while(lastIndex != -1) {

                lastIndex = outStr.indexOf(symbol,lastIndex);

                if(lastIndex != -1){
				    
                	outStr.replace(lastIndex, lastIndex+symbol.length(), source.substring(lastIndex, lastIndex+1 ) );                	
                	listpos.add(lastIndex);
                	lastIndex++;             	
                	
                }
            }
        	
        return outStr.toString();
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	
	
	 public FKProvResult movePostingByActWork_New(ENAct act ){
		    Connection finConn = null;
		    try {
		     finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		     ENAct2ProvDAO a2pDAO = new ENAct2ProvDAO(connection, userProfile);
		     ENActPostingKindDAO  kindDAO = new ENActPostingKindDAO(connection, userProfile);
		     ENActPostingKindItemDAO kindItemDAO = new ENActPostingKindItemDAO(connection, userProfile); 
		     ENActPostingSpecCharactersDAO specCharDAO = new ENActPostingSpecCharactersDAO(connection, userProfile);
		     ENServicesObjectDAO soDao = new ENServicesObjectDAO(connection, userProfile);
		     ENGeneralContractsDAO genContractDAO = new ENGeneralContractsDAO(connection, userProfile);
		     ActLogic aLogic = new ActLogic(connection, userProfile);
		     ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
		     TechCardLogic techCardLogic = new TechCardLogic(connection, userProfile);
		     FKPostingLogic fpLogic = new FKPostingLogic(finConn , userProfile);
		     
		     FKProvResult provResult = null;
		     ENAct2ProvFilter a2pFil = new ENAct2ProvFilter();
				a2pFil.actRef.code = act.code;
				ENAct2ProvShortList a2pList = a2pDAO.getScrollableFilteredList(a2pFil, 0, -1);
				
				if (a2pList.totalCount <= 0) {throw new EnergyproSystemException(
						" \n �� �������� ������ ��� ��������!!! (���/�������� �� ����) ");
				};
				
				ENActPostingKindFilter pstFil = new ENActPostingKindFilter();
				int[] pstKindArr = kindDAO.getFilteredCodeArray(pstFil, 0, -1);
				List<Integer> pstKindList = new ArrayList<Integer>();
				for (int ar : pstKindArr)
				{
					pstKindList.add(ar);
				}

					if (!pstKindList.contains(a2pList.get(0).actPostingKindRefCode)) {
						throw new EnergyproSystemException(
								" \n �� �������� ������ ��� ����������� ���� ��������� ����!!! (���/�������� �� ����) ");
					}

					boolean isIncomeAct; 
					if(a2pList.get(0).isIncomeAct == 1){
						isIncomeAct = true;
					} else if(a2pList.get(0).isIncomeAct == 0|| a2pList.get(0).isIncomeAct == Integer.MIN_VALUE ){
						isIncomeAct = false;
					} else 	throw new  SystemException(
							" \n �� ������� ������ �������� ������������ ���� ��� ���� ��������� ���� !!! (���/�������� �� ����) ");
					
					boolean isPricon = false;
					int connectionKind = aLogic.getConnectionKind(act.code);
			       	if(connectionKind != Integer.MIN_VALUE){
			       		isPricon = true;
			       	}	
			       	
			       	
			        // ��� ���������� �����������  
					int tkCalcKindByActCode = techCardLogic.getTKCalcKindByActCode(act.code);
					if (tkCalcKindByActCode ==Integer.MIN_VALUE){
						
								if (!isPricon){	
									throw new EnergyproSystemException(" \n �� �������� ��� ���������� ����������� !!! ");
								}
					}
					
				    /////�� �� ���� ���� �� ������������� � ����� ������� ��� �� ��������� ��� ������ �� �������� � �� ��������� 
					boolean isWithDelivery = false;
					if ( isPricon || (tkCalcKindByActCode==TKCalcKind.OLD || tkCalcKindByActCode==TKCalcKind.NEW2 )  ){
						isWithDelivery = true;	
					}
			       	
			      /// ������ ����� �� �������
			       	ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
			       	soFilter.conditionSQL = " enservicesobject.code in ( \n"+
			       			 " select so.code from enact2enplanwork a2p , entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc , enservicesobject so \n"+
							 "	where a2p.actrefcode = " + act.code +
							 "	and a2p.plancode= tc2p.planrefcode \n"+
							 "	and tc2p.techconservicesrefcode = s2tc.techcondservrefcode \n"+
							 "	and s2tc.servicesobjectrefcode = so.code  " +
							 " and so.code = enservicesobject.code   \n"+
							 " union \n"+
							 " select so.code from enact act , enservicesobject so \n"+
							 " where act.code = " + act.code +
							 " and   act.elementcode = so.elementcode \n"+
			       			 " limit 1 )" ;

			       	int[] soArr = soDao.getFilteredCodeArrayNOSEGR(soFilter, 0, -1);
			       	

			       	ENServicesObject soObj = null;  
			       	ENGeneralContracts genContract = new ENGeneralContracts();

			       	boolean isLicensedWork = false; 
			       	
			       	if (isPricon) 
			       	  {isLicensedWork = true;}
			       	
			       	if (soArr.length > 0 ){
			       		soObj = soDao.getObject(soArr[0]);
			       		genContract = genContractDAO.getObject(soObj.generalContractRef.code);
			       		if (!isPricon) { 
			       		isLicensedWork = soLogic.isLicensed(soObj);}
			       	}
			       	
			      if ( soArr.length == 0 && connectionKind == ENConnectionKind.GENERAL_CONNECTION  ){
			       	 ENGeneralContractsFilter gecContrFil = new ENGeneralContractsFilter();
			       	 gecContrFil.conditionSQL = " engeneralcontracts.code in  ( select gc.code  from enact2enplanwork a2p , entechcond2planwork tc2p  , entechconditionsservcs vcs  ,  enconnectionkind k , engeneralcontracts gc  \n"+ 
						" where a2p.actrefcode = " + act.code + " \n"+
						" and a2p.plancode= tc2p.planrefcode  \n"+
						" and tc2p.techconservicesrefcode = vcs.code \n"+ 
						" and vcs.connectionkindrefcode = k.code \n"+
						" and gc.findocid = vcs.findocid \n"+
						" and gc.partnercode = vcs.partnercode ) \n" ;
			       	ENGeneralContractsShortList gecContrlist = genContractDAO.getScrollableFilteredList(gecContrFil, 0, -1);
				       	if (gecContrlist.totalCount > 0 ) {
				       		genContract = genContractDAO.getObject(gecContrlist.get(0).code);
						}
			       	}

			        /******** �������� �������� */
			       	
			    	String finDocCode = "";

			    	if (  genContract != null ){
			        	finDocCode = genContract.finDocCode;
			    	}
					
					
	                //!!!!! ������ ����. �������� ������� ������������ � ��������� ��� ����				
					Map<String, String> aMapSpecChar = new HashMap<>();
					ENActPostingSpecCharactersFilter specCharFil = new ENActPostingSpecCharactersFilter();
					specCharFil.conditionSQL = " ENACTPOSTINGSPCCHRCTRS.code in (  select hr.code  from enact2prov a2p , enactpostingkinditem pki , enactpostingspcchrctrs hr  \r\n" + 
							" where a2p.actrefcode = "+act.code+" \r\n" + 
							" and a2p.actpostingkindrefcode=pki.enactpostingkindcode\r\n" + 
							" and (  POSITION(hr.name in  pki.cehkt ) > 0\n" + 
							" or  POSITION(hr.name in  pki.accountkt ) > 0 \n" + 
							" or  POSITION(hr.name in  pki.kaukt ) > 0 \n" + 
							" or  POSITION(hr.name in  pki.cehdt ) > 0 \n" + 
							" or  POSITION(hr.name in  pki.accountdt ) > 0 \n" + 
							" or  POSITION(hr.name in  pki.kaudt ) > 0) ) ";   
					ENActPostingSpecCharactersShortList specCharList = specCharDAO.getScrollableFilteredList(specCharFil, 0, -1);
					
					for (int i = 0; i < specCharList.totalCount; i++) {
					String value;
	 	
						switch(specCharList.get(i).name) {
	        			case "[ooo]":  //��� - ��� ������ (000), ���� ���������� ������������ � ���� �� �������� , �������� ����� ��, ����� ���������� �� ������� �� ����������
	        				value="[ooo]";
	        				break;
	        			case "[LLL]": //LLL - ��� ������ (000), ���� �� ������� ��������� � �������
	        				value= this.get_LLL_byAct(act , soObj , isPricon);
	        				break;
	        	 /*???*/case "[lll]": //(((??? �������� ��� �������� , ���� ������ �� ��� ������))) ��� ������ (000) ���� �������������� ������� ��
	        				value= this.get_lll_byAct(act );
	        				break;	
	        	        case "[vr]": // ��� ���� � ������ -- �� tkclassification 
     				        value= this.get_vr_byAct(act );
     				       break;	
	        	        case "[z]": // ���� �� ��� ������ expence(��������� ����� ������ � ������ �������) 
     				        value= new String("[z]");// this.get_vr_byAct11(act );  // �������� (���� ������ �� �� ����������� ) 
     				       break; 
	        	        case "[b]": // ���� �� ��� ���������� �� ���� balans 
     				        value= new String("[b]"); 
     				       break;   
     				       
	        			
	        			default:
	        				throw new SystemException(String.format(" �������� ��� ����� ��� �������� %s ", specCharList.get(i).name ));
	        			}
	 
						aMapSpecChar.put(specCharList.get(i).name, value);	
					}
					
					for (Map.Entry entry : aMapSpecChar.entrySet()) {
					    System.out.println("Key: " + entry.getKey() + " Value: "
					        + entry.getValue());
					}
					
					
					ENActPostingKindItemFilter piFil = new ENActPostingKindItemFilter();
					piFil.ENActPostingKind.code = a2pList.get(0).actPostingKindRefCode;
					int[] piArr = kindItemDAO.getFilteredCodeArray(piFil, 0, -1);		
					
					
					ENActPostingKind kindObj = kindDAO.getObject( a2pList.get(0).actPostingKindRefCode);
					String kau_expense = this.convertProvValue(kindObj.kau_expense_Attr, null , kindObj , aMapSpecChar , "" , null ) ;
					String kau_closing = this.convertProvValue(kindObj.kau_closing_Attr, null , kindObj , aMapSpecChar , "", null ) ;
					String account_expense  = this.convertProvValue(kindObj.account_expense_Attr , null , kindObj , aMapSpecChar, "" , null) ;
					String account_closing  = this.convertProvValue(kindObj.account_closing_Attr , null , kindObj , aMapSpecChar, "" , null ) ;
					
					kindObj.kau_expense = kau_expense;
					kindObj.kau_closing = kau_closing;
					kindObj.account_expense = account_expense;
					kindObj.account_closing = account_closing;
					
					
			String V_Prov_Buffer = "";
			
			for (int p = 0; p < piArr.length; p++) {
				
				ENActPostingKindItem itemObj = kindItemDAO.getObject(piArr[p]);
				
				
				FKTrans2AXTransItemShortList fkTrans2axTransList = null;
				FKTrans2AXTransItemShort  fkTrans2axTransShort = null ;
				if (itemObj.ENActPostingTypeSum.code ==  ENActPostingTypeSum.TYPESUM_ESV && itemObj.plusMinus.equals("-") ) {
					//�������� �� ��� [-]
					fkTrans2axTransList = this.getDataForProvsESV_Red_new(act.element.typeRef.code == ENElementType.SERVICES_OBJECT , act.code , tkCalcKindByActCode , isWithDelivery );
					for (int s = 0; s < fkTrans2axTransList.totalCount; s++) {
						fkTrans2axTransShort = fkTrans2axTransList.get(s);
						V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
		      	        		act.dateGen,              // ���� ���������
		      	        		fkTrans2axTransList.get(s).amountCur.negate(),          //����� � ������� 
		      	        		this.convertProvValue(itemObj.cehKt_Attr, itemObj , kindObj , aMapSpecChar , fkTrans2axTransList.get(s).balCeh , fkTrans2axTransShort ) ,  
								this.convertProvValue(itemObj.accountKt_Attr, itemObj , kindObj , aMapSpecChar , "" , fkTrans2axTransShort ) /* itemObj.accountKt */ ,           // ���������� ����
								this.convertProvValue(itemObj.kauKt_Attr, itemObj , kindObj ,  aMapSpecChar , "" , fkTrans2axTransShort) /*itemObj.kauKt*/ ,                // ����������  ���
								this.convertProvValue(itemObj.cehDt_Attr, itemObj , kindObj , aMapSpecChar , "" , fkTrans2axTransShort) ,           // ����.��� ( ��� ���� ��� 000 ���� ������������� ��� )
								this.convertProvValue(itemObj.accountDt_Attr, itemObj , kindObj,  aMapSpecChar , "" , fkTrans2axTransShort) , // SUPP-88025"2373" , // ���� ���� 		      	           
								this.convertProvValue(itemObj.kauDt_Attr, itemObj , kindObj , aMapSpecChar , "" , fkTrans2axTransShort) 	, // ����.���
		      	        		act.numberGen  ,
		      	          		act.dateGen ,
		      	          		"servise"+act.numberGen+", "+ new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)  + "  "+ itemObj.description // ����������
		      			            );	
					}
				}
				if (itemObj.ENActPostingTypeSum.code ==  ENActPostingTypeSum.TYPESUM_ESV && itemObj.plusMinus.equals("+") ) {
					//�������� �� ��� [+] 
					fkTrans2axTransList = this.getDataForProvsESV_new(act.element.typeRef.code == ENElementType.SERVICES_OBJECT , act.code , tkCalcKindByActCode , isWithDelivery );
					for (int s = 0; s < fkTrans2axTransList.totalCount; s++) {
						fkTrans2axTransShort = fkTrans2axTransList.get(s);
						V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
		      	        		act.dateGen,              // ���� ���������
		      	        		fkTrans2axTransList.get(s).amountCur,          //����� � ������� 
		      	        		this.convertProvValue(itemObj.cehKt_Attr, itemObj , kindObj , aMapSpecChar , fkTrans2axTransList.get(s).balCeh , fkTrans2axTransShort ) ,  
								this.convertProvValue(itemObj.accountKt_Attr, itemObj , kindObj , aMapSpecChar , "" , fkTrans2axTransShort) /* itemObj.accountKt */ ,           // ���������� ����
								this.convertProvValue(itemObj.kauKt_Attr, itemObj , kindObj ,  aMapSpecChar , "" , fkTrans2axTransShort) /*itemObj.kauKt*/ ,                // ����������  ���
								this.convertProvValue(itemObj.cehDt_Attr, itemObj , kindObj , aMapSpecChar , "" ,fkTrans2axTransShort) ,           // ����.��� ( ��� ���� ��� 000 ���� ������������� ��� )
								this.convertProvValue(itemObj.accountDt_Attr, itemObj , kindObj,  aMapSpecChar , "" , fkTrans2axTransShort) , // SUPP-88025"2373" , // ���� ���� 		      	           
								this.convertProvValue(itemObj.kauDt_Attr, itemObj , kindObj , aMapSpecChar , "" , fkTrans2axTransShort) 	, // ����.���
		      	        		act.numberGen  ,
		      	          		act.dateGen ,
		      	          		"servise"+act.numberGen+", "+ new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)  + "  "+ itemObj.description // ����������
		      			            );	
					}
				}
				
				if (itemObj.ENActPostingTypeSum.code ==  ENActPostingTypeSum.TYPESUM_GENERAL_PRODUCTION && itemObj.plusMinus.equals("+") ) {
					//����������������� ������� �� ���� [+] 
					fkTrans2axTransList = this.getDataForProvsESV_new(act.element.typeRef.code == ENElementType.SERVICES_OBJECT , act.code , tkCalcKindByActCode , isWithDelivery );
					for (int s = 0; s < fkTrans2axTransList.totalCount; s++) {
						fkTrans2axTransShort = fkTrans2axTransList.get(s);
						V_Prov_Buffer = new String(V_Prov_Buffer.length()>0 ? V_Prov_Buffer + " UNION ALL " : "")  +	fpLogic.generateQueryTransSHABLON(
		      	        		act.dateGen,              // ���� ���������
		      	        		fkTrans2axTransList.get(s).amountCur,          //����� � ������� 
		      	        		this.convertProvValue(itemObj.cehKt_Attr, itemObj , kindObj , aMapSpecChar , fkTrans2axTransList.get(s).balCeh,fkTrans2axTransShort ) ,  
								this.convertProvValue(itemObj.accountKt_Attr, itemObj , kindObj , aMapSpecChar , "",fkTrans2axTransShort) /* itemObj.accountKt */ ,           // ���������� ����
								this.convertProvValue(itemObj.kauKt_Attr, itemObj , kindObj ,  aMapSpecChar , "",fkTrans2axTransShort) /*itemObj.kauKt*/ ,                // ����������  ���
								this.convertProvValue(itemObj.cehDt_Attr, itemObj , kindObj , aMapSpecChar , "",fkTrans2axTransShort) ,           // ����.��� ( ��� ���� ��� 000 ���� ������������� ��� )
								this.convertProvValue(itemObj.accountDt_Attr, itemObj , kindObj,  aMapSpecChar , "",fkTrans2axTransShort) , // SUPP-88025"2373" , // ���� ���� 		      	           
								this.convertProvValue(itemObj.kauDt_Attr, itemObj , kindObj , aMapSpecChar , "",fkTrans2axTransShort) 	, // ����.���
		      	        		act.numberGen  ,
		      	          		act.dateGen ,
		      	          		"servise"+act.numberGen+", "+ new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)  + "  "+ itemObj.description // ����������
		      			            );	
					}
				}
			}
					
					
					provResult = fpLogic.createPostings(V_Prov_Buffer);
					String badprovstring = "";
					if (provResult.badProvList.totalCount > 0 ) {
			        	badprovstring="  ������ �� :  ";
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

			        	System.out.print("\n \n \n partid badprovstring =  error provResult = " +  badprovstring );
			        }
				
			return provResult;	
		    	
		    }//catch (DatasourceConnectException e) {throw new EnergyproSystemException("�� ������� �������� ��������!",e);}
	         catch (PersistenceException | DatasourceConnectException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    

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

	 /*LLL - ��� ������ (000), ���� �� ������� ��������� � �������*/
	public String get_LLL_byAct(ENAct act , ENServicesObject soObj , boolean isPricon ) {
        String KodPodr = "???";
        try {
        	ActLogic aLogic = new ActLogic(connection, userProfile);
        	ENDepartmentDAO departmDAO = new ENDepartmentDAO(connection, userProfile);
        	mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
        
             
        	if(soObj!=null){
				if(!isPricon){
				ENDepartment depObj = departmDAO.getObject(soObj.department.code);
			    KodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(depObj.hrmorganizationid, act.dateGen);
					}

			  if (isPricon){
				   /* ��� �� ���� 18.03.2020 CNPackFilter cnpFil = new CNPackFilter();
				   cnpFil.packCode = soObj.cnPackCode;
				   CNPackShortList packList = packDAO.getCNPackList(cnpFil , 0, -1);*/
				   ENDepartmentFilter depFil = new ENDepartmentFilter();
				   Vector<Object> parameters = null;
				   /*SUPP-92995 ��� ��������� �� �������������� ���������� �������������
				    * ����� ������ �������� ��������� �� ������������� */
				   if(soObj.contractTypeRef.code == ENServicesContractType.PROJECT) {
					   depFil.conditionSQL = " EXISTS (SELECT FROM ENSOProj2SOConn AS pfj2so1 \n" + 
						   		"INNER JOIN enservicesobject2techcondtnsservices AS so2pric1 ON so2pric1.servicesobjectrefcode = pfj2so1.soconnrefcode \n" + 
						   		"INNER JOIN entechconditionsservcs AS ts1 ON so2pric1.techcondservrefcode = ts1.code \n" + 
						   		" WHERE \n" + 
						   		" ts1.departmentcode = endepartment.code " +
						   		" AND pfj2so1.soprojrefcode = ?)";
					   parameters = new Vector<Object>();
					   parameters.add(soObj.code);
				   } else {
					  // depFil.conditionSQL = " endepartment.code in (select x.departmentcode from entechconditionsservcs x , enservicesobject2techcondtnsservices so2techss where so2techss.servicesobjectrefcode = " + soObj.code + " and so2techss.techcondservrefcode=x.code )";
					   depFil.conditionSQL = " endepartment.code in ( select oo.departmentcode from entechconditionsservcs qq , ENContragent cc , entechconditionsobjcts oo " + 
					   " where qq.code = cc.techcondservicesrefcod \n"+ 
					   " and oo.code = cc.techconobjectscode \n"+
					   " and qq.code in \n "+ 
					            " (select so2tc.techcondservrefcode from enservicesobject2techcondtnsservices so2tc \n"+ 
					            " where so2tc.servicesobjectrefcode = "+soObj.code+" ) ) ";
					   
				   }
				   ENDepartmentShortList deList = departmDAO.getScrollableFilteredList(depFil, 0, -1, parameters);
				   if (deList.totalCount==0){
					   throw new EnergyproSystemException(" \n ������� ��� ���������� ���� �������� ��� �������� !!! (���/�������� �� ����) ");
				   }else {
					   KodPodr = mdLogic.getMAINORGANIZATIONIDByHRMORGANIZATIONID(deList.get(0).hrmorganizationid, act.dateGen);
				   }
			   }
			}	
            return KodPodr;

        } catch (PersistenceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return KodPodr;
		} 
          finally {
            
        }
    }
	
	
	 /*lll - ��� ������ (000) ���� �������������� ������� �� */
		public String get_lll_byAct(ENAct act  ) {
	        String KodPodr = "???";
	        Connection finConn = null;
	        try {
	        	finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	        	ElementLogic elLogic = new ElementLogic(connection, userProfile);
	        	FKPostingLogic fpLogic = new FKPostingLogic(finConn , userProfile);
	        	
	        	String invNumber = ""; 
	            if (act.element.typeRef.code != ENElementType.TY_BYT && act.element.typeRef.code != ENElementType.TY_PROM  ){
	            	invNumber = elLogic.getElementInvNumber(act.element.code);	
	            }
	            
	            if(invNumber.length() == 5 ){
					invNumber = "0"+invNumber;
				}
	        
	        	KodPodr =  fpLogic.getKodPodr(act.invNumber);
	        	
	            return KodPodr;

	        } catch (DatasourceConnectException e) {
	        	// TODO Auto-generated catch block
	        	e.printStackTrace();
	        	}
	        catch (PersistenceException e) {
	        	// TODO Auto-generated catch block
	        	e.printStackTrace();
	        	} 
	          finally {
	            
	        }
			return KodPodr;
	    }
		
		
		/*��� ���� � ������ -- �� tkclassification  */
		public String get_vr_byAct(ENAct act  ) {
	        String vr = "??";
	        Connection finConn = null;
	        try {
	        	finConn = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	        	TKFINWorkTypeDAO fwTpDAO = new TKFINWorkTypeDAO(connection, userProfile);
	        	
	        	
	        	TKFINWorkTypeFilter fwTpFilter = new TKFINWorkTypeFilter();
				fwTpFilter.conditionSQL = "  tkfinworktype.code in ( \n" +
						"  select cl.finworktypecode from tkclassificationtype cl  , tkfinworktype fwt  , enplanwork2classfctntp p2cl  , \n" +
						"  enplanwork p , enelementdata eld , enservicesobject so , enact a \n" +
						"  where cl.finworktypecode = fwt.code \n" +
						"  and cl.code = p2cl.classificationtyperfcd \n" +
						"  and p2cl.planrefcode = p.code \n" +
						"  and p.elementrefcode=eld.ecode \n" +
						"  and so.elementcode = p.elementrefcode \n" +
						"  and so.elementcode = a.elementcode \n" +
						"  and a.code = " + act.code +
						"  UNION \n" +
						"   select  tkclt.finworktypecode from enact2enplanwork as acpw1 \n" + 
						"   inner join enplancorrecthistory as his_f1 on acpw1.plancode = his_f1.plannewrefcode \n" + 
						"   inner join enplancorrecthistory as his_p1 on his_f1.planoldrefcode = his_p1.plannewrefcode \n" + 
						"   inner join enservicescost as sco1 on his_p1.planoldrefcode = sco1.planrefcode \n" + 
						"   inner join tkcalccost as co1 on sco1.tkcalccostrefcode = co1.code \n" + 
						"   inner join tkclassificationtype tkclt on co1.classificationtyperfcd = tkclt.code \n" +
						"    where his_f1.reasoncode = "+ENPlanCorrectReason.MOVE_TO_FACT + " and his_p1.reasoncode = "+ ENPlanCorrectReason.MOVE_TO_NPW + " and acpw1.actrefcode = "+ act.code + " \n" + 
						 "  )    ";
				TKFINWorkTypeShortList fwTpList = fwTpDAO.getScrollableFilteredList(fwTpFilter, 0, -1);
				if (fwTpList.totalCount == 0 ){
					 
					 throw new EnergyproSystemException(" \n ��� ���������� �������� �� ��������� ��� ���� � ������ !!! ");
					 
				} else {
					vr  = fwTpList.get(0).finCode;
				}
	            return vr;

	        } catch (DatasourceConnectException e) {
	        	// TODO Auto-generated catch block
	        	e.printStackTrace();
	        	}
	        catch (PersistenceException e) {
	        	// TODO Auto-generated catch block
	        	e.printStackTrace();
	        	} 
	          finally {
	            
	        }
			return vr;
	    }
	
	

}
