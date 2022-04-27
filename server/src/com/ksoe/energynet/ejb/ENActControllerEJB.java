
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.logic.signing.DocSigningProcessor;
import com.ksoe.docflow.logic.signing.DocSigningProcessorImpl;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.dataminer.ENAct2DFDocDecreeDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENAct2FinKodIstDAO;
import com.ksoe.energynet.dataminer.ENAct2HumenDAO;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.ENAct2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENAct2SCUsageInputDAO;
import com.ksoe.energynet.dataminer.ENAct2TransportDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActInTechCond2ENActDAO;
import com.ksoe.energynet.dataminer.ENDamageRecovery2ENActDAO;
import com.ksoe.energynet.dataminer.ENPlanCorrectHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcByActDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTransportOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.ejb.generated.ENActControllerEJBGen;
import com.ksoe.energynet.logic.ActCalculator;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.CounterLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.PostingLogic;
import com.ksoe.energynet.logic.ReportPrintingLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.LockUtils;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrderType;
import com.ksoe.energynet.valueobject.ENAct2SCUsageInput;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.brief.FINDoc2MolDataShort;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2FinKodIstFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2TransportFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENDamageRecovery2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENDamageRecovery2ENActShortList;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.netobjects.dataminer.ENLineCableDAO;
import com.ksoe.netobjects.valueobject.ENLineCable;
import com.ksoe.netobjects.valueobject.filter.ENLineCableFilter;
import com.ksoe.rqorder.dataminer.RQFKOrder2PlanFactDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.ejb.RQFKOrderController;
import com.ksoe.rqorder.ejb.RQFKOrderControllerHome;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.filter.RQFKOrder2PlanFactFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrder2PlanFactShortList;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.valueobject.TKTransportStatus;
import com.ksoe.techcard.valueobject.filter.TKTransportRealFilter;
import com.ksoe.techcard.valueobject.lists.TKTransportRealShortList;

public class ENActControllerEJB extends ENActControllerEJBGen {
	
	private static final long serialVersionUID = 1L;

	public void unSignaturedServicesFS(int actCode) {
        try {
            ActLogic logic = new ActLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            logic.checkInSCCounterByActCode(actCode, true);
            logic.unSignaturedServicesFS(actCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't unSignaturedServicesFS ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    // ����������� ���-�� �������� � �������� ������������ ����� (������ ��� ������� ������� �� ��)
    public int getCountProvByActCode(int actCode)
    {
        Connection finConn = null;
        Connection enConn = null;
        //int i = 0;
        int out = 0;

        try
        {

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            FKLogic2 finLogic = new FKLogic2(finConn,getUserProfile());

            FINDoc2MolDataDAO fmdDAO = new FINDoc2MolDataDAO(enConn, getUserProfile());
            FINDoc2MolDataFilter fmdFilter = new FINDoc2MolDataFilter();
            fmdFilter.conditionSQL = " moldatacode in (select aa.code from finmoldata aa where aa.actcode = " + actCode + ")";
            fmdFilter.finDocTypeRef.code = FINDocType.MAKET_ADD_COST;
            FINDoc2MolDataShortList fmdList = fmdDAO.getScrollableFilteredList(fmdFilter, 0, -1);
            int cntProv = 0;
            for (int i=0; i < fmdList.totalCount; i++){
                cntProv = cntProv + finLogic.getCountProvByTHeadId(fmdList.get(i).finDocCode);
            }

            out = cntProv;

            return out;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
    }


    public ENActShortList getActs4Recalc(int actCode)
    {
        try
        {
            ENActShortList out = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getActsList(actCode, false);
            return out;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't execute getActs4Recalc.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (ParseException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
            closeConnection();
        }
    }

    public ENPlan2HumenShortList getRelatedWorkOrdersByTabNumber(int actCode, String tabNumber)
    {
        try
        {
            ENPlan2HumenShortList out = new ActCalculator(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getWorkOrdersListByTabNumber(actCode, tabNumber);
            return out;
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error on run getRelatedWorkOrdersByTabNumber ",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
            closeConnection();
        }
    }


    public ENPlanWorkShortList getRelatedWorkOrders(int actCode)
    {
        try
        {
            ENPlanWorkShortList out = new ActCalculator(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getWorkOrdersList(actCode);
            return out;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't execute getActs4Recalc.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
            closeConnection();
        }
    }



	public void fillActData(int actCode) {
		signatured(actCode);
		// fillActData(actCode, true);
	}

	/** ������� ���� � ������ "�� ��������"
	 *
	 * @param actCode - ��� ����
     * @param isSignatured - �������� ��� �������� ���� � ������ "�� ��������"
     */
	public void fillActData(int actCode, boolean isSignatured) {
		try {

        // �������� ����� �� ���� ��������� ���� ������ ������� ...
        AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENAct act = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getObject(actCode);

        if (act.statusRef.code != ENActStatus.GOOD){
            throw new EnergyproSystemException("��� �� �������� ... �������� ���� ������� !!!", getUserProfile());
        }

        if ( ! l.checkPermission4PlanItemsByElement(act.element.code) )
        {
            throw new EnergyproSystemException("Acces denied for method addBy... from method remove(ENAct object)");
        }

        if (
                (act.actTypeRef.code != ENPlanWorkState.TRUCKING)
                && (act.actTypeRef.code != ENPlanWorkState.WRITINGS_TMC)
        )
        {
            HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ///// 02.07.13 SUPP-4874 SUPP-4896
            // hLogic.validateTimeGenByActCode(act.code);
            if (act.actTypeRef.code != ENPlanWorkState.WORK_IN_OUT)
            {
                hLogic.validateTimeGenByActCode(act.code);
            }
            else
            {
                if (act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {

                    ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENServicesObject servicesObj = servicesLogic.getServicesObjectByElementCode(act.element.code);

                    if (servicesObj != null)
                    {
                        // ����� ��-������ ��������� ������ ��� ����� ���������
                        if (servicesObj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT)
                        {
                            hLogic.validateTimeGenByActCodeForServices(act.code);
                        }
                        else
                        {
                            hLogic.validateTimeGenByActCode(act.code);
                        }
                    }
                    else
                    {
                        throw new EnergyproSystemException("\n\nSUPP-4874 SUPP-4896 �� �������� ��'��� ������ �� �������!");
                    }
                }
                /////

                }

        }

        new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
        		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile()).checkActInOZ(actCode, true);

        new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).fillActData(actCode, isSignatured);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            closeConnection();
        }

    }

	/**
	 * ����� ��� ������ ���������� �����, ����������� � ������� ���
	 * (��� ��������� ����)
	 *
	 * @param code
	 * @param isClient
	 */
	public void unCloseByEcp(int code, int isClient) {
		unClose(code, isClient);
	}

    // ������ !!! ���������� ���� � �� � ��
	public void unClose(int code, int isClient) {
		Connection finConn = null;
		Connection enConn = null;
		Connection finOSConn = null;
		Connection docFlowConn = null;

		boolean isLocked = false;

		int writeOffTmcConf = Integer.MIN_VALUE;
		String _messageId = "";
		AXTransactionsLogic axLogic = null;
		try {
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			AuthLogic authLogic = new AuthLogic(enConn, getUserProfile());
			ActLogic actLogic = new ActLogic(enConn, getUserProfile());
			axLogic = new AXTransactionsLogic(enConn, getUserProfile());
			mDaxLogic mdLogic = new mDaxLogic(enConn, getUserProfile());
			FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
			ENAct2ProvDAO a2pDAO = new ENAct2ProvDAO(enConn, getUserProfile());

			ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);
			ENAct act = objectDAO.getObject(code);
			
	        // 05.02.2020 ���������� ���������� � ����������� ������ ���� ����� ��� ������
	        // ��������������� � �������
			if(isClient == 1) {
				isLocked = LockUtils.lockEntity(code);
				
				if(!isLocked) {
					throw new SystemException(String.format("���������� ���� � %s �� %s ��� ����������"
	    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
				}				
			}
			
	        writeOffTmcConf = authLogic.checkUsesDataForWriteOff();
			
            // SUPP-78694 �������� - ���� ����� ������� "��������� � �����������"
            if(act.checkedByAccountant != null && act.checkedByAccountant == true) {
            	throw new SystemException(String.format("��������� ������� ���������� ���� � %s �� %s.\n"
            			+ " ��������� ����� ������ \"��������� � ���������\"!"
            			, act.numberGen
            			, Tools.dateFormatDefault.format(act.dateGen)));
            }

            // 24.07.2018 ������ ���������� ��������� ���
            if(actLogic.checkZKUMountingByAct(act)) {
            	actLogic.unMoveZKUsInsertedByAct(act);
            }

			/**
			 *  �������� �� ����������� � ����� ���������� ������, ���� �� ��� ����,
			 *  �� �� ����� �������� ����� ���
			 */
            ENDamageRecovery2ENActDAO damage2actDAO = new ENDamageRecovery2ENActDAO(getUserProfile(), enConn);
            ENDamageRecovery2ENActFilter damage2actFilter = new ENDamageRecovery2ENActFilter();
            damage2actFilter.actRef.code = code;
            ENDamageRecovery2ENActShortList damage2actList =  damage2actDAO.getScrollableFilteredList(damage2actFilter, 0, -1);
            if (damage2actList.totalCount > 0) {
            	throw new SystemException("��� ��� ����'����� �� ���� ������������ ������, ��������� �������� ���� �����! \n " +
             "������������ �� ���� :" +  damage2actList.get(0).damageRecoveryRefNumberGen + " �� " + damage2actList.get(0).damageRecoveryRefDateGen);
            }

    		/**  ������������� �������� ���������� � ��  ������� ���������� ������ ���� ����� � ������� */
            if((writeOffTmcConf == 1 || writeOffTmcConf == 2)  && isClient == 1 ) {
      	      _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+300);
      	      System.out.println(" enactcontroller unClose axLogic.aifttsbegin with TimeOut = " + WebServicesConsts.defaultTimeOut+300 + " , _messageId = " + _messageId );
    		}

            String userName = actLogic.getUserNameForFK(act.code);

	        /**
	         *  NET-4422... +++ �� ������� �� ������ �������� ���������� ������ ���������� ���� �� ������� ��....
	         */
	        ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());
	        SCLogic scLogic = new SCLogic(enConn, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
	        int InSCCounter = actLogic.checkInSCCounterByActCode(code, false);

	        if (InSCCounter > 0 && act.element.typeRef.code == ENElementType.SERVICES_OBJECT  && isClient == 1) {

	        	int usageInputCode = soLogic.getOZCodeByAct(code);
	        	if (usageInputCode != Integer.MIN_VALUE) {
	        		scLogic.cancelProcessInSC(usageInputCode);
	        	} else {
	        		throw new EnergyproSystemException("\n\n"
	        				+ "�� �������� �������� ��� ����� � ������������ ���������!\n"
	        				+ "�������������� ���!!!");
	        	}

	        } else {

	        	if (isClient == 1 && !(act.element.typeRef.code == ENElementType.SERVICES_OBJECT)) {
					actLogic.checkInSCCounterByActCode(code, true);
				}




	            FINLogic finLogic = new FINLogic( finConn,getUserProfile());
				ENPlanWorkDAO dao = new ENPlanWorkDAO(enConn, getUserProfile());

				if (act.statusRef.code == ENActStatus.REVERSED)
					throw new EnergyproSystemException("��� ����������");

				if (act.statusRef.code != ENActStatus.CLOSED) {
					throw new EnergyproSystemException("Act not closed. Act code =" + act.code);
				}

	        // ��� ������ �������� ����� �� ��������������� ���� �����
	        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	        {
	            if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufetToFK")) {
	                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
	            }
	        }

	        /** SUPP-21999... 27.08.2014 +++ �������� ��� �������� ��... */
	        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_OS) {
	            if (! authLogic.checkPermission("ksoe/energynet/ENPlanWorkENAct2OSDataController", "checkCloseUncolseAct")) {
	                throw new EnergyproSystemException("\n \n � ��� ���� ���� �� ����� �������� �� !");
	            }
	        }

            int dfDocCode = actLogic.getDFDocCodeForENAct(code);
	        if (dfDocCode > 0) {
				// SUPP-102789 ��� ����� �� ������� �� ������� ������� �������� ���������� ��������� ����
				if (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT &&
						act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
					soLogic.deleteServicesObjectFromFK(act);
				}
	        }

	        // �� ����� �������� ���������� ��������� ����� ��� ����� �� ������� � ����� ���� -
	        // ��� ������ ���������� � ����� �������� ������ � ���������

	        if (isClient == 1){
	           //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
	           actLogic.checkIfServicesObjectByAct(act, true);
	        }


	        // NET-2139  �� ����� �������� ��� � �������  � ��� ����. ������� � ������ � ��������� ������ �� ���������� ��� �������������� � ����������
	        /* 05.11.2013 SUPP-6949 �.�. ��������� ���� ������ ����� ��������� �������� �� ��������, �������� �������
	            if (isClient == 1){
	            ENActInTechCond2ENActDAO actInc2ActDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
	            ENActInTechCond2ENAct actInc2ActObj = null;
	            ENActIncomeTechConditions actIncObj = null;
	            ENActIncomeTechConditionsDAO actIncDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
	            ENActInTechCond2ENActFilter actInc2ActFilter = new ENActInTechCond2ENActFilter();
	            actInc2ActFilter.actRef.code = act.code;
	            int actInc2Act[] = actInc2ActDAO.getFilteredCodeArray(actInc2ActFilter, 0, -1);
	            if (actInc2Act.length > 0) {
	                actInc2ActObj = actInc2ActDAO.getObject(actInc2Act[0]);
	                actIncObj = actIncDAO.getObject(actInc2ActObj.actIncomeRef.code);
	                throw new EnergyproSystemException(" ��������� ������� ���������� � �� !!! ��� ��� ��`������ � ����������� ����� �  " + actIncObj.numbergen + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(actIncObj.dategen).toString() + ". ����� ������� ���������� ������������ ���� !!! " );
	            }
	            }
	        */

	        /*
	        *  16.02.2012 +++ ��� ����� �� �������,
	        *  ������ � ����� ���� ����������� ����� � ����� ������ � ���������
	        */


	        ENPlanWorkFilter pllFilter = new ENPlanWorkFilter();
	        pllFilter.conditionSQL = " enplanwork.code in ( " +
	                " select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = " + act.code + ")";
	        int pllArr[] = dao.getFilteredCodeArray(pllFilter, 0, -1);
	        ENPlanWork pll = dao.getObject(pllArr[0]);
	        boolean isServices = false;
	        if (pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
	                || pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
	            isServices = true;
	        }

	        if (isServices && isClient == 1) {
	            throw new EnergyproSystemException(
	                    "��� �������� ������� ��������� (��� �������) � ���� " +
	                    " \"��� ��������\" - \"������\" - \"���� ��������� ���� �� ������\" "  +
	                    " ����� ����, ������� \"����������\"!");
	        }


	            Calendar c = Calendar.getInstance();
	            c.setTime(act.dateGen);
	            if (
	                    (( c.get(Calendar.YEAR) == 2011 ) && ( c.get(Calendar.MONTH) >= Calendar.AUGUST ))
	                    || (c.get(Calendar.YEAR) > 2011)
	                )
	            {
	            	// ��� �����, ����������� ���, ��� ����� �� ���������
	                if (dfDocCode <= 0) {
	                	authLogic.checkPermission("ksoe/energynet/ENActController", "unclose20110801");
	                }
	            }

	        //if (act != null)
	        //throw new EnergyproSystemException("������ ����� �������� ��������� ... �������� �����");

	        // ���� ��� ���� �������� ;))
	        // ���� ��� ��������� ������ ����������� ��������� - ���������� ������
	        if (act.element.typeRef.code == ENElementType.METROLOGY_OBJECT &&
	        	act.element.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {

	            //throw new EnergyproSystemException("�� ������� ���������� ���� ������ ���������� ��� !!!");
	            CounterLogic cLogic = new CounterLogic(enConn, getUserProfile());

	            if (act.actTypeRef.code != ENPlanWorkState.COUNTERS_ACT_DEFECT)
	            {
	            	scLogic.removeDovvodInfoForMetrologyRepair(act.code);

	            	/////
	            	// �������� ���������� ���������� ���� �� ������ �� ������� (����������)
	            	ENAct2RQFKOrderDAO act2RQFKOrderDAO = new ENAct2RQFKOrderDAO(enConn, getUserProfile());

	            	ENAct2RQFKOrderFilter act2RQFKOrderFilter = new ENAct2RQFKOrderFilter();
	            	act2RQFKOrderFilter.actRef.code = act.code;
	            	act2RQFKOrderFilter.typeRef.code = ENAct2RQFKOrderType.SERVICES;

	            	ENAct2RQFKOrderShortList act2RQFKOrderList = act2RQFKOrderDAO.getScrollableFilteredList(act2RQFKOrderFilter, 0, -1);

					if (act2RQFKOrderList.totalCount == 0) {
						//throw new SystemException("\n\nNET-4559 ���������� ��� �� ��'����� � ����� �� ������� � ������� (�� ����������)!");
					} else {
		            	try {
		    				Context context = new InitialContext();

		    				Object fkOrderRef = context.lookup(RQFKOrderController.JNDI_NAME);
		    				RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject
		    						.narrow(fkOrderRef, RQFKOrderControllerHome.class);
		    				RQFKOrderController fkOrderController = fkOrderHome.create();

		    				fkOrderController.deletePostingFromFK(act2RQFKOrderList.get(0).fkOrderRefCode, 0, userName);

		            	} catch (NamingException e) {
		        			throw new SystemException(e.getMessage(), e);
		        		} catch (RemoteException e) {
		        			throw new SystemException(e.getMessage(), e);
		        		} catch (CreateException e) {
		        			throw new SystemException(e.getMessage(), e);
		        		}
					}
	    			/////
	            }
	            else
	            {
	            	// �������� ���������� ���� ���������� � ScanCounters
	            	scLogic.undoCloseActDefect(act);
	            }

	            cLogic.unLockByActForMetrology(act.code, 1);
	        }

	        // ������ ���������� �������� ���������
	        if(act.actTypeRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
	        {
	            scLogic.unMoveLikvidationActToSC(act.code);
	        }

//	        ----------------------------------------
	        // �������� �� ���������� ������ ��� ����
	        if(!finLogic.isFinansyOpen(act.dateGen))
	        {
	                Calendar calFinansyOpen = Calendar.getInstance();
	                calFinansyOpen.setTime(act.dateGen);
	                throw new EnergyproSystemException("����� " + Tools.getUkrNameOfMonth(calFinansyOpen.get(Calendar.MONTH)+1)+" "+calFinansyOpen.get(Calendar.YEAR)+" �. �������� � Գ�. ��������");
	        }

	//----------------------------------------

	        //mdaxwriteoff �� ���� energyNET �������� �������� �� ������� � �������
	        boolean isPostingAxJournal = mdLogic.isPostingAxJournalByEnAct(act);

	        // NET-923 �������� ��� ��������� �� ��������� ������ � ��������������� ��������� �� ����� � �������������
	        //finLogic.removeDOCFromAct2(act);

            finLogic.removeDOCFromActWithoutVivod(act);

	        // ������ �������� ����� � ��, ���� ��� ���� � ����
	        boolean actHasSeals = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.MATERIALS);
	        if (actHasSeals) {
	        	if (act.element.code == ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
	        		scLogic.undoInsertSealForLiquidation(act.code);
	        	} else {
	        		scLogic.undoInsertSealIntoExpl(act.code);
	        	}
	        }
	        ////
	        boolean actHasSealsForLiquidation = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.UNMOUNT);
	        if (actHasSealsForLiquidation) {
	        	scLogic.undoInsertSealForLiquidation(act.code);
	        }
	        ////


	        // �������� ...
	        finLogic.removeDOCFromActUnmount(act);

	        // ������������ ���������
	        if(act.actTypeRef.code == ENPlanWorkState.PRODUCTION) {
	        	if(new FINLogic(enConn, getUserProfile()).checkActOrRQFKOrderForProductionLink(act.code, true)) {
	        		finLogic.moveRQFKOrdersFromActProducedToFK(act, false);
	        	} else {
	                finLogic.removeDOCFromActProduced(act);
	        	}

	        }

	        //// �������� ������� �� �������
	        FKOrderLogic ordLogic = new FKOrderLogic(getUserProfile(), enConn);
	        ordLogic.removeMolFuelMotionByAct(act.code);
	// ------------------------------------------------------------------

	        ENPlanWorkFilter f = new ENPlanWorkFilter();
	        f.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code +")";
	        int[] planCodes = dao.getFilteredCodeArray(f, 0, -1);
	        for (int i = 0; i < planCodes.length; i++){

	            ENPlanWork plan = dao.getObject(planCodes[i]);

	            // yyy ��������� ������ ���������� �� �������� ������ � ������ "��������� � ������������" ���� (�������� ������� ������) ���� ��� ���
	            //if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
	            if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	            {
	                actLogic.unCloseStatusEstimateForWriteOff(plan.code);
	            }

	            plan.status.code = ENPlanWorkStatus.GOOD;
	            dao.save(plan);

	        }

	        // ������� ... ����� ������������� ... ;))
	        //ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(enConn, getUserProfile());
	        //a2hDAO.removeHumensByActCode(act.code);
	        /* NET-751 (28.09.11) �� ����� �������� ������, ����� ������ ���������� ��� � ������ "�� �������"
	        new ActLogic(enConn, getUserProfile()).deleteAct2Humen(act.code);
	        */

	        //act.statusRef.code = ENActStatus.GOOD;
	        // NET-751 (28.09.11) ����� ������ ���������� ��� � ������ "�� �������"
	        // mdaxwriteoff - ���� � ������� ��� �������� ������ ��� �� ��� ������ ���������� ������ ������ ���� �� ��������
	        if((writeOffTmcConf == 1 || writeOffTmcConf == 2 ) &&  isPostingAxJournal ) {
			        	// ��� ������ ������ ������ ����������� ��� � ������ "�� ���������� "
			        	ENAct temp_act = objectDAO.getObject(act.code);
			        	temp_act.statusRef.code = ENActStatus.SIGNATURE;
			        	objectDAO.save(temp_act);
                   // ������� � ��������
			       this.unSignatured(act.code);
	        } else
	        act.statusRef.code = ENActStatus.SIGNATURE;

	        act.dateEdit = new Date();
	        act.userGen = getUserProfile().userName;
	        objectDAO.save(act);

	        // ������� ����� �� ������������ ������ ...
	        //PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
	        //planLogic.removeIncompletePlansFromAct(act);


	            // ���� �������� ��
				if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_OS) {
					finOSConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
					FKOSLogic OSLogic = new FKOSLogic(finOSConn, getUserProfile());
					OSLogic.unMoveWriteOS(act);
				}

	        }

	        // �������� ���� ����� ������� �� ���� 
	        ENAct2ProvFilter a2pFilter = new ENAct2ProvFilter();
	        a2pFilter.actRef.code = act.code;
	        a2pFilter.datePosting = act.dateGen;
	        ENAct2ProvShortList a2pList = a2pDAO.getScrollableFilteredList(a2pFilter, 0, -1);
	        for (int a2p = 0; a2p < a2pList.totalCount; a2p++) {
	        	if (a2pList.get(a2p).partId != -1){
	        		fpLogic.deleteProv(a2pList.get(a2p).partId, userName);

		        	ENAct2Prov a2pObj = a2pDAO.getObject(a2pList.get(a2p).code);
		        	a2pObj.partId = -1;
		        	a2pDAO.save(a2pObj);	
	        	}
	        	
			}

	        scLogic.updateCountersAfterActMoving(act);

            // NET-4596 �������� �������� ���������� �������� � ����������������
	        if (isClient == 1) {
	            int dfDocCode = actLogic.getDFDocCodeForENAct(code);
	            if (dfDocCode > 0) {
	            	docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
	    			DocSigningProcessor docSigningProcessor = new DocSigningProcessorImpl(act, docFlowConn, getUserProfile());
	    			docSigningProcessor.doActionsForDocUnClosing(act);
	            }
	        }

	        // ������ ���� ����� � �������
	        if((writeOffTmcConf == 1 || writeOffTmcConf == 2) && !_messageId.equals("") && isClient == 1  ) {
	        	 axLogic.aifttscommit(_messageId);
	    		}

		} catch (Exception e) {
			if((writeOffTmcConf==1 || writeOffTmcConf==2) && !_messageId.equals("")  && isClient == 1  ) {
				System.out.println(" enactcontroller.unclose axLogic.aifttsabort , _messageId = " + _messageId);
				axLogic.aifttsabort(_messageId);
			}

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
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (finOSConn != null && !finOSConn.isClosed()) {
					finOSConn.close();
					finOSConn = null;
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
			if(isLocked) LockUtils.unLockEntity(code);
		}
	}


    public void unCloseZKU(int code, int isClient)
    {
        Connection finConn = null;
        Connection enConn = null;
        boolean isLocked = false;
        
        try
        {

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ActLogic actLogic = new ActLogic(enConn, getUserProfile());



            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        FINLogic finLogic = new FINLogic( finConn,getUserProfile());

        ENPlanWorkDAO dao = new ENPlanWorkDAO(enConn, getUserProfile());
        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);
        ENAct act = objectDAO.getObject(code);
        
        // 05.02.2020 ���������� ���������� � ����������� ������ ���� ����� ��� ������
        // ��������������� � �������
        if(isClient == 1) {
    		isLocked = LockUtils.lockEntity(code);
    		
    		if(!isLocked) {
    			throw new SystemException(String.format("���������� ���� � %s �� %s ��� ����������"
    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
    		}        	
        }

        if (isClient == 1){
            //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
            actLogic.checkInSCCounterByActCode(code, true);
        }
        
        // SUPP-78694 �������� - ���� ����� ������� "��������� � �����������"
        if(act.checkedByAccountant != null && act.checkedByAccountant == true) {
        	throw new SystemException(String.format("��������� ������� ���������� ���� � %s �� %s.\n"
        			+ " ��������� ����� ������ \"��������� � ���������\"!"
        			, act.numberGen
        			, Tools.dateFormatDefault.format(act.dateGen)));
        }

        if(act.statusRef.code == ENActStatus.REVERSED)
            throw new EnergyproSystemException("��� ����������");

        if (act.statusRef.code != ENActStatus.CLOSED){
            throw new EnergyproSystemException("Act not closed. Act code =" + act.code);
        }

        // ��� ������ �������� ����� �� ��������������� ���� �����
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());

            if (! al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufetToFK")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        // �� ����� �������� ���������� ��������� ����� ��� ����� �� ������� � ����� ���� -
        // ��� ������ ���������� � ����� �������� ������ � ���������

        if (isClient == 1){
           //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
           actLogic.checkIfServicesObjectByAct(act, true);
        }


        // NET-2139  �� ����� �������� ��� � �������  � ��� ����. ������� � ������ � ��������� ������ �� ���������� ��� �������������� � ����������
        /* 05.11.2013 SUPP-6949 �.�. ��������� ���� ������ ����� ��������� �������� �� ��������, �������� �������
            if (isClient == 1){
            ENActInTechCond2ENActDAO actInc2ActDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
            ENActInTechCond2ENAct actInc2ActObj = null;
            ENActIncomeTechConditions actIncObj = null;
            ENActIncomeTechConditionsDAO actIncDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
            ENActInTechCond2ENActFilter actInc2ActFilter = new ENActInTechCond2ENActFilter();
            actInc2ActFilter.actRef.code = act.code;
            int actInc2Act[] = actInc2ActDAO.getFilteredCodeArray(actInc2ActFilter, 0, -1);
            if (actInc2Act.length > 0) {
                actInc2ActObj = actInc2ActDAO.getObject(actInc2Act[0]);
                actIncObj = actIncDAO.getObject(actInc2ActObj.actIncomeRef.code);
                throw new EnergyproSystemException(" ��������� ������� ���������� � �� !!! ��� ��� ��`������ � ����������� ����� �  " + actIncObj.numbergen + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(actIncObj.dategen).toString() + ". ����� ������� ���������� ������������ ���� !!! " );
            }
            }
        */

        /*
        *  16.02.2012 +++ ��� ����� �� �������,
        *  ������ � ����� ���� ����������� ����� � ����� ������ � ���������
        */


        ENPlanWorkFilter pllFilter = new ENPlanWorkFilter();
        pllFilter.conditionSQL = " enplanwork.code in ( " +
                " select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = " + act.code + ")";
        int pllArr[] = dao.getFilteredCodeArray(pllFilter, 0, -1);
        ENPlanWork pll = dao.getObject(pllArr[0]);
        boolean isServices = false;
        if (pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                || pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
            isServices = true;
        }

        if (isServices && isClient == 1) {
            throw new EnergyproSystemException(
                    "��� �������� ������� ��������� (��� �������) � ���� " +
                    " \"��� ��������\" - \"������\" - \"���� ��������� ���� �� ������\" "  +
                    " ����� ����, ������� \"����������\"!");
        }


            Calendar c = Calendar.getInstance();
            c.setTime(act.dateGen);
            if (
                    (( c.get(Calendar.YEAR) == 2011 ) && ( c.get(Calendar.MONTH) >= Calendar.AUGUST ))
                    || (c.get(Calendar.YEAR) > 2011)
                )
            {
                AuthLogic l = new AuthLogic(enConn, getUserProfile());
                l.checkPermission("ksoe/energynet/ENActController", "unclose20110801");
            }

        //if (act != null)
        //throw new EnergyproSystemException("������ ����� �������� ��������� ... �������� �����");

        // ���� ��� ���� �������� ;))
        // ���� ��� ��������� ������ ����������� ��������� - ���������� ������
        if ( act.element.typeRef.code == ENElementType.METROLOGY_OBJECT){
            //throw new EnergyproSystemException("�� ������� ���������� ���� ������ ���������� ��� !!!");
            CounterLogic cLogic = new CounterLogic(enConn, getUserProfile());
            cLogic.unLockByActForMetrology(act.code, 1);
        }

//        ----------------------------------------
        // �������� �� ���������� ������ ��� ����
        if(!finLogic.isFinansyOpen(act.dateGen))
        {
                Calendar calFinansyOpen = Calendar.getInstance();
                calFinansyOpen.setTime(act.dateGen);
                throw new EnergyproSystemException("����� " + Tools.getUkrNameOfMonth(calFinansyOpen.get(Calendar.MONTH)+1)+" "+calFinansyOpen.get(Calendar.YEAR)+" �. �������� � Գ�. ��������");
        }

//----------------------------------------

        // NET-923 �������� ��� ��������� �� ��������� ������ � ��������������� ��������� �� ����� � �������������
        //finLogic.removeDOCFromAct2(act);

         finLogic.removeDOCFromActWithoutVivodZKU(act);

        // �������� ...
        finLogic.removeDOCFromActUnmount(act);

        // ������������ ���������
        if(act.actTypeRef.code == ENPlanWorkState.PRODUCTION)
            finLogic.removeDOCFromActProduced(act);

        //// �������� ������� �� �������
        FKOrderLogic ordLogic = new FKOrderLogic(getUserProfile(), enConn);
        ordLogic.removeMolFuelMotionByAct(act.code);
// ------------------------------------------------------------------

        ENPlanWorkFilter f = new ENPlanWorkFilter();
        f.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code +")";
        int[] planCodes = dao.getFilteredCodeArray(f, 0, -1);
        for (int i = 0; i < planCodes.length; i++){

            ENPlanWork plan = dao.getObject(planCodes[i]);

            // yyy ��������� ������ ���������� �� �������� ������ � ������ "��������� � ������������" ���� (�������� ������� ������) ���� ��� ���
            //if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
            if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
            {
                actLogic.unCloseStatusEstimateForWriteOff(plan.code);
            }

            plan.status.code = ENPlanWorkStatus.GOOD;
            dao.save(plan);

        }

        SCLogic scLogic = new SCLogic(enConn, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
        // ������ �������� ����� � ��, ���� ��� ���� � ����
        boolean actHasSeals = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.MATERIALS);
        if (actHasSeals) {
        	scLogic.undoInsertSealIntoExpl(act.code);
        }
        ////
        boolean actHasSealsForLiquidation = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.UNMOUNT);
        if (actHasSealsForLiquidation) {
        	scLogic.undoInsertSealForLiquidation(act.code);
        }
        ////

        // ������� ... ����� ������������� ... ;))
        //ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(enConn, getUserProfile());
        //a2hDAO.removeHumensByActCode(act.code);
        /* NET-751 (28.09.11) �� ����� �������� ������, ����� ������ ���������� ��� � ������ "�� �������"
        new ActLogic(enConn, getUserProfile()).deleteAct2Humen(act.code);
        */
        
        scLogic.updateCountersAfterActMoving(act);

        //act.statusRef.code = ENActStatus.GOOD;
        // NET-751 (28.09.11) ����� ������ ���������� ��� � ������ "�� �������"
        act.statusRef.code = ENActStatus.SIGNATURE;

        act.dateEdit = new Date();
        act.userGen = getUserProfile().userName;
        objectDAO.save(act);

        // ������� ����� �� ������������ ������ ...
        //PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
        //planLogic.removeIncompletePlansFromAct(act);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
            if(isLocked) LockUtils.unLockEntity(code);
        }
    }

    public void signatured(int actCode) {
    	signatured(actCode, true);
    }

    /**
     * ������� ���� �� ����������
     *
     * @param actCode - ��� ����
     * @param checkDocCode - ���� {@code true}, ��������� ������� ����������� �� ���� (�.�. ������ � ����������)
     */
	public void signatured(int actCode, boolean checkDocCode) {

		Connection docFlowConnection = null;
		boolean isLocked  = false;

		try {

			/**
			 * NET-4422... 05.03.2015... +++ ������ �� ������ �������� (������� �� ������������� ����)
			 */
			ENActDAO actDao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct act = actDao.getObject(actCode);
			
			isLocked = LockUtils.lockEntity(actCode);
			
			if(!isLocked) {
				throw new SystemException(String.format("��� � %s �� %s ��� ����������"
    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
			}

			ActLogic logic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			DocSigningLogic docSigningLogic = null;

			// NET-4596 �������� ����� ������� �����������
			if (DocSigningLogic.isSignable(act)) {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), act);
				if (checkDocCode) {
					docSigningLogic.checkDocCodeForObject(act);
				}
				docSigningLogic.checkIfSigningStartIsPossible(act);

				/* 24.12.2021 �.�.�. ������� �������� ����� (�����������) - ����������� ����� ��� ������
				// ���� ������ � ����� ����������� ��-���
				if (logic.actMustHaveSentAndReceivedSigners(act)) {
					// SUPP-105890 �������� ����������� ��� ���������
					DFDocSigner[] dfDocSigners = logic.getDFDocSigners(act);
					docSigningLogic.checkDocSigners(act, dfDocSigners);
				}
				*/
			}

			int InSCCounter = Integer.MIN_VALUE;

			if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
				logic.checkInSCCounterByActCode(actCode, true);
			}

			// 28.11.2016 NET-4543 �������� ���� �� ���� �������� �� ���������
			logic.checkForRecyclableMaterials(act);

			if (act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
				InSCCounter = logic.checkInSCCounterByActCode(actCode, false);
			}

			if (InSCCounter == 1) {
				SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

	            // �������� ������ ����������� ������...
				scLogic.createUsageInput(actCode);
			} else {
				logic.signatured(actCode, true);
			}

			// 28.05.15 NET-4453 ���������� ���������� c �/�
			/** 08.06.2015 ������� � ������ */
			// logic.calculateSalaryCharges(actCode);
			
			/*
			 * // ����������� ������� �������� �� ������� �� ������� if
			 * (act.element.typeRef.code == ENElementType.SERVICES_OBJECT ||
			 * act.actTypeRef.code == ENPlanWorkState.DESIGNING || act.element.typeRef.code
			 * == ENElementType.OPERATIVE_OBJECT ) {
			 * logic.setPostingTemplateAndFinKodIstByAct(act,true); }
			 */
			this.calculateENSOValuesTermsForConnectionIfNeeded(act);

			// NET-4596 ���������� ���������
			if (docSigningLogic != null) {
				docSigningLogic.createFirstDocMovementForSigning(act);
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't sigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			if(isLocked) LockUtils.unLockEntity(actCode);
	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
			closeConnection();
		}
	}



	public void unSignatured(int actCode) {
		unSignatured(actCode, true);
	}

	/** ������ ���������� ����
	 *  @param deleteUsageInput - �������� ��� �������� ���� �� ���������
	 */
	public void unSignatured(int actCode, boolean deleteUsageInput) {
		boolean isLocked = false;
		try {
			int InSCCounter = Integer.MIN_VALUE;
            ActLogic logic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            /**
			 * NET-4422... 05.03.2015... +++ ������ �� ������ �������� (������� �� ������������� ����)
			 */
			ENActDAO actDao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct act = actDao.getObject(actCode);

			isLocked = LockUtils.lockEntity(actCode);
			
			if(!isLocked) {
				throw new SystemException(String.format("ϳ�������� ���� � %s �� %s ��� ����������"
    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
			}
			
			if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT) {
				logic.checkInSCCounterByActCode(actCode, true);
			}

			/**
             *	�������� ������� ��������� ����
             */
			logic.checkActIncomeServices(actCode);
			
			/** 
			 *  �������� ������� ��������� ���� �� �����������
			 */
	        ENActInTechCond2ENActDAO actIncome2ActDao = new ENActInTechCond2ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENActIncomeTechConditions actIncomeTechCond = actIncome2ActDao.getActIncomeByENActCode(act.code);
	        if(actIncomeTechCond != null) {
	        	throw new SystemException(String.format("���������� ��� � %s �� %s ��'������ � ����������� ����� �� �������� ������ � %s �� %s. �������� ���� ���������."
	        			, act.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)
	        			, actIncomeTechCond.numbergen, new SimpleDateFormat("dd.MM.yyyy").format(actIncomeTechCond.dategen)));
	        }

			// 28.11.2016 NET-4543 �������� ���� �� ���� �������� �� ���������
			logic.checkForRecyclableMaterials(act);

			if (logic.checkCountersStateVerificationForAct(actCode)) {
				throw new SystemException("\n\nNET-4559 ��� ����������� ���� � ������ \"��������\" " +
						"������� �������� ����'���� �� ���� ��������� ������ � ����������!");
			}

			if (act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
				InSCCounter = logic.checkInSCCounterByActCode(actCode, false);
			}

			if (deleteUsageInput) {
				if (InSCCounter == 1) {
					SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
							getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

					ENAct2SCUsageInputDAO act2ozDao = new ENAct2SCUsageInputDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					ENAct2SCUsageInputFilter act2ozFilter = new ENAct2SCUsageInputFilter();
					act2ozFilter.actRef.code = actCode;

					int usageInputCode = Integer.MIN_VALUE;
					int act2ozArr[] = act2ozDao.getFilteredCodeArray(act2ozFilter, 0, -1);
					if (act2ozArr.length > 0) {
						ENAct2SCUsageInput act2oz = act2ozDao.getObject(act2ozArr[0]);
						usageInputCode = act2oz.scUsageInputRef.code;
					}

					if (usageInputCode != Integer.MIN_VALUE) {
						scLogic.undoFillUsageInput(usageInputCode, actCode);
					}
				}
			}


			logic.unSigantured(actCode);
			calculateENSOValuesTermsForConnectionIfNeeded(act);

			// NET-4596 �������� ��������� � ����� �������� � ����������������
			logic.cancelDFDoc(actCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't unSigantured ", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			if(isLocked) LockUtils.unLockEntity(actCode);
			closeConnection();
		}
	}

	public void close(int code, int isClient) {
		this.close(code, isClient, null);
	}

    // ���������� ���� � �� � ��
	public void close(int code, int isClient, Object caller) { /// c ����������� ��� AX �� ��������� ���������� ��� ��������/�������� ���������� � ��
		this.close(code, isClient, false, caller);
	}

	public void close(int code, int isClient, boolean isBeginAxTransaction) {
		close(code, isClient, isBeginAxTransaction, null);
	}

    // ���������� ���� � �� � ��
	public void close(int code, int isClient, boolean isBeginAxTransaction, Object caller) {
		Connection finConn = null;
		Connection finOSConn = null;
		Connection enConn = null;
		// int i = 0;
		int writeOffTmcConf = Integer.MIN_VALUE;
		AXTransactionsLogic axLogic = null;
		String _messageId = "";

		FKProvResult provResult = null;
		boolean isLocked = false;

		try {
			
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);
	        ENPlanWorkDAO dao = new ENPlanWorkDAO(enConn, getUserProfile());
	        ENTransportOrderDAO torderDAO = new ENTransportOrderDAO(getUserProfile(), enConn);
	        AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());
	        axLogic = new AXTransactionsLogic(enConn, getUserProfile());
	        ENAct2ProvDAO act2provDAO = new ENAct2ProvDAO(enConn, getUserProfile());
            ActLogic actLogic = new ActLogic(enConn, getUserProfile());
            PostingLogic pstLogic = new  PostingLogic(enConn, getUserProfile());  
	        
	        ENAct act = objectDAO.getObject(code);
	        
	        
	        // 05.02.2020 ���������� ���������� � ����������� ������ ���� ����� ��� ������
	        // ��������������� � �������
	        if(isClient == 1) {
				isLocked = LockUtils.lockEntity(code);
				
				if(!isLocked) {
					throw new SystemException(String.format("��� � %s �� %s ��� �����������"
	    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
				}	        	
	        }

            int dfDocCode = actLogic.getDFDocCodeForENAct(code);
            if (dfDocCode > 0) {
            	// �.�. ��� ���������� �� ������� ���������������� ���������� ���� �� �����, ����� ���������� ��� ������ ������ 
            	// ���. �������� caller, ����� ��������, ������ ����� (���� �� �������, ������, �������� ��-������� �� ������� ����)
            	if (caller == null) {
                	throw new SystemException("\n\nNET-4596 ��� ���������� ����� ���� ������� ��������� " + 
                			"���'����� �������� � �������������!\n" + "��� ���������: " + dfDocCode);
            	}
            
            	ENAct2ProvDAO provDao = new ENAct2ProvDAO(enConn, getUserProfile());
            	ENAct2ProvShortList provList = provDao.getListByAct(act, false);
            	int actPostingKindCode = Integer.MIN_VALUE;
            	if ( provList != null && provList.totalCount > 0  && provList.get(0).actPostingKindRefCode != Integer.MIN_VALUE) {
            		actPostingKindCode = provList.get(0).actPostingKindRefCode;
            	}
            	
            	// ����������� ������� �������� �� ������� �� ������� ���� �� ���������� �� ����������   
    			if ((act.element.typeRef.code == ENElementType.SERVICES_OBJECT 
    				|| act.actTypeRef.code == ENPlanWorkState.DESIGNING ) 
    					&& actPostingKindCode == Integer.MIN_VALUE
    					&& act.code != 1019649682 
    				) {
    				actLogic.setPostingTemplateAndFinKodIstByAct(act,true);
    			}
            
            }

	        writeOffTmcConf = netAuth.checkUsesDataForWriteOff(); 
	        /**  ������������� �������� ���������� � ��  !!!!!!!!!! ������ ��������� ���������� ������ ���� � ������� ��������� ���������� ���� */
	    	if((writeOffTmcConf==1 || writeOffTmcConf==2) && isBeginAxTransaction  ) {
	      	    _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+300);
	      	     System.out.println(" enactcontroller.close axLogic.aifttsbegin , _messageId = " + _messageId);
	    		}



	        
	        if (act.dateGen.after(new Date())) {
	        	throw new SystemException("���� ���� ������ ������� ����!");
	        }

	        if (act.dateAct.after(new Date())) {
	        	throw new SystemException("���� ���������� ���� ������ ������� ����!");
	        }

	        
	        /*temp esv-exception*/
	        /*
	        Date d01012016 = new SimpleDateFormat("dd.MM.yyyy").parse("01.01.2016");
	        if (act.dateAct.compareTo(d01012016)  >= 0) {
	        	throw new SystemException("���� ����� 01.01.2016 ��������� ���� ������! ����������� � ��!");
	        }
	        */

	        /**  NET-4422... +++ �� ������� �� ������ �������� ��� ���������� ���� ���������� ��, ������������� ��� � ����������� ������� �� ��������.....
	         *   ���������� ���������� ���� �� ������� ��....
	         */
	        ServicesLogic soLogic = new ServicesLogic(enConn, getUserProfile());
	        SCLogic scLogic = new SCLogic(enConn,
	        		getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
	        
	        int InSCCounter = actLogic.checkInSCCounterByActCode(code, false);

	        if (InSCCounter > 0 && act.element.typeRef.code == ENElementType.SERVICES_OBJECT && isClient == 1) {

	        	int usageInputCode = soLogic.getOZCodeByAct(act.code);
	        	if (usageInputCode != Integer.MIN_VALUE) {

	        		boolean countersServices = true;
	        		scLogic.processInSC(usageInputCode, countersServices, caller);

	        	} else {
	        		throw new EnergyproSystemException("\n\n"
	        				+ "�� �������� �������� ��� ����� � ������������ ���������!\n"
	        				+ "�������������� ���!!!");
	        	}

	        } else {

	            // 24.07.2018 ���������� ��������� ���
	            if(actLogic.checkZKUMountingByAct(act)) {
	            	actLogic.moveZKUsInsertedByAct(act);
	            }

	            if (isClient == 1 && !(act.element.typeRef.code == ENElementType.SERVICES_OBJECT)) {
	                //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
	                actLogic.checkInSCCounterByActCode(code, true);
	            }


	    // NET-2139  �� ����� �������� ��� � �������  � ��� ����. ������� � ������ � ��������� ������ �� ���������� ��� �������������� � ����������
	        /* 05.11.2013 SUPP-6949 �.�. ��������� ���� ������ ����� ��������� �������� �� ��������, �������� �������
	        if (isClient == 1){
	        ENActInTechCond2ENActDAO actInc2ActDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
	        ENActInTechCond2ENAct actInc2ActObj = null;
	        ENActIncomeTechConditions actIncObj = null;
	        ENActIncomeTechConditionsDAO actIncDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
	        ENActInTechCond2ENActFilter actInc2ActFilter = new ENActInTechCond2ENActFilter();
	        actInc2ActFilter.actRef.code = act.code;
	        int actInc2Act[] = actInc2ActDAO.getFilteredCodeArray(actInc2ActFilter, 0, -1);
	        if (actInc2Act.length > 0) {
	            actInc2ActObj = actInc2ActDAO.getObject(actInc2Act[0]);
	            actIncObj = actIncDAO.getObject(actInc2ActObj.actIncomeRef.code);
	            if(actIncObj != null)
	                throw new EnergyproSystemException(" ��������� �������� � �� !!! ��� ��� ��`������ � ����������� ����� �  " + actIncObj.numbergen + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(actIncObj.dategen).toString() + ". ���������� ��� ����������� ����������� ��� ��������� ������������ ����!!! " );
	            else
	                throw new EnergyproSystemException(" ��� �� � ����������� ���, �� ������� ��������� ���� � ���� ������� �� �������. ���������� ��� ����������� ����������� ��� ��������� ������������ ����!!! ");
	        }
	        }
	        */

	        // ��� ������ �������� ����� �� ��������������� ���� �����
	        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	        {
	            AuthLogic al = new AuthLogic(enConn, getUserProfile());

	            if (! al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufetToFK")) {
	                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
	            }
	        }

	        ENPlanWorkFilter pllFilter = new ENPlanWorkFilter();
	        pllFilter.conditionSQL = " enplanwork.code in ( " +
	                " select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = " + act.code + ")";
	        int pllArr[] = dao.getFilteredCodeArrayNOSEGR(pllFilter, 0, -1);
	        ENPlanWork pll = dao.getObjectNOSEGR(pllArr[0]);
	        boolean isServices = false;
	        if (pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
	                || pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
	            isServices = true;
	        }

	        // ��������� �� ������� �� ������� �� ������� �� ������� ��� �� � �������� ��� �������� ���� ����������� ����� ���������������
	        if (act.element.typeRef.code == ENElementType.SERVICES_OBJECT || isServices ){
	            FINLogic fLogic = new FINLogic(finConn,getUserProfile());
	            int CodeFormNalog = Integer.MIN_VALUE;
	            int codeOrg = Integer.MIN_VALUE; ; // ���� �����������
	            // ������ �� �������
	            if  (isServices){
	                RQFKOrder2PlanFactDAO f2pDAO = new RQFKOrder2PlanFactDAO(getUserProfile(), enConn);
	                RQFKOrder2PlanFactFilter f2pFilter = new RQFKOrder2PlanFactFilter();
	                f2pFilter.act.code = act.code;
	                RQFKOrder2PlanFactShortList f2pList = f2pDAO.getScrollableFilteredList(f2pFilter,0,-1);
	                if (f2pList.totalCount > 0){
	                    RQFKOrderDAO fDAO = new RQFKOrderDAO(getUserProfile(), enConn);
	                    RQFKOrder fkorder = fDAO.getObject(f2pList.get(0).fkorderCode);

	                    RQOrgDAO oDAO = new RQOrgDAO(getUserProfile(), enConn);
	                    RQOrg org = oDAO.getObject(fkorder.org.code);

	                    codeOrg = org.id;
	                    CodeFormNalog = fLogic.getCodeFormNalogByContragentCode(codeOrg);

	                }
	            }

	            // ������ �� �������
	            if  (act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {

	                ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());
	                ENServicesObject soObject = servicesLogic.getServicesObjectByElementCode(act.element.code);

	                if (soObject.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET) {
	                    if (soObject.contractStatusRef.code != ENServicesContractStatus.COMPLETED &&
	                    		soObject.contractStatusRef.code != ENServicesContractStatus.PAID) {
	                    	// ��������� ������ ��� ������� ����� (�.�. ������ � ������ �������� ��������� �� ���� - ��� ������ ������)
	                    	if (servicesLogic.checkIfStandardServicesObjectByAct(act)) {
	                    		throw new SystemException("\n\nSUPP-107222 ��� ���������� ���� ������ ������� ���� ������ \"������ �������\" ��� \"���������\"!");
	                    	}
	                    }
	                }

	                CodeFormNalog = fLogic.getCodeFormNalogByContragentCodeString(soObject.partnerCode);

	                /** SUPP-12236... 13.02.2014 +++ �������� ������� ����������� ������ �� ���� ��� ����� �� ������� */
	                if (soObject.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) {

	                    /** �� ��������� - ���� ������� ��������� � ������� "������ ����������" � ��� �������� */
	                    boolean recalcDeliveryCost = true;
	                    if (act.statusRef.code == ENActStatus.SIGNATURE
	                            && (soObject.contractStatusRef.code == ENServicesContractStatus.COMPLETED
	                                ||soObject.contractStatusRef.code == ENServicesContractStatus.PAID)) {
	                        recalcDeliveryCost = false;
	                    }

	                    if (recalcDeliveryCost) {
	                        ENServicesFactCalcByAct factCalcByAct = new ENServicesFactCalcByAct();
	                        factCalcByAct.deliveryCost = servicesLogic.getDeliveryCostByAct(act.code);

	                        double contractServicesDistance = 1;
	                        if (soObject.contractServicesDistance != null) {
	                            contractServicesDistance = soObject.contractServicesDistance.doubleValue();
	                        }

	                        if (factCalcByAct.deliveryCost.doubleValue() == 0 && contractServicesDistance >= 1) {
	                            throw new EnergyproSystemException("\n\nNET-4235 ��������� ������������ ��� �������� ���������!!!" +
	                                    "\n �������� ��������� ���� ��� ��������� �������� � ������ \"������ ��������\"!!!");
	                        }
	                    }

	                } else {

	                    /**  SUPP-14532... 01.04.2014 +++ �������� �������������� ��� ������ ���������...
	                     *   ����� �������������, ������� � �.�.. +++ ��� ������������ �����....
	                     *
	                    if ((soObject.contractTypeRef.code == ENServicesContractType.TY
	                            || soObject.contractTypeRef.code == ENServicesContractType.OTHERS
	                            || soObject.contractKindRef.code == ENServicesContractKind.OKSN_ACCESS
	                            || soObject.contractKindRef.code == ENServicesContractKind.OKSN_AGREE
	                            || soObject.contractKindRef.code == ENServicesContractKind.OKSN_TU
	                            || soObject.contractKindRef.code == ENServicesContractKind.OKSN_TU_MODIFY ) && !sl.isTKCalcKindNew(soObject.code) ) {

	                        // SUPP-35436 �������� ��������� ������ if (sl.isLicensed(soObject)) {
	                            sl.validateProfitability(soObject);
	                        // }
	                    }
	                     *  SUPP-77746... 05.12.2018 +++ �� ������������ c ������������ �� ��������� ��������������...
	                     */
	                }

	            }

	            // �� ���� ����������� ��������� ����������� �� �� ��� � ����������� ����� ���������������
	            // ���� ������������� ��������  ����� �� ���� �������� ���

	            if (CodeFormNalog == Integer.MIN_VALUE) {
	                throw new EnergyproSystemException("��� ����������� �� ������������ ������� ����� ������������� !");
	            }

	        }


	        // �� ����� ��������� ��������� ���� ��� ����� �� ������� � ����� ���� -
	        // ��� ������ ����������� � ����� �������� ������ � ���������

	        if (isClient == 1 && InSCCounter > 0 && act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
	          //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
	          actLogic.checkIfServicesObjectByAct(act, true);
	        }


	        // �������� �� ��, ��� ��� �������������
	        if(act.statusRef.code == ENActStatus.CLOSED)
	            throw new EnergyproSystemException("��� ��� �����������");

	        // �������� �� ����������� �� ���
	        if(act.statusRef.code == ENActStatus.REVERSED)
	            throw new EnergyproSystemException("��� ����������");

	        //if (act != null)
	        //throw new EnergyproSystemException("������ ����� �������� ��������� ... �������� �����");


	        /*
	        *  16.02.2012 +++ ��� ����� �� �������,
	        *  ������ � ����� ���� ����������� ����� � ����� ������ � ���������
	        */

	        if (isServices && isClient == 1 && InSCCounter > 0) {
	            throw new EnergyproSystemException(
	                    "��� �������� ������� ��������� (��� �������) � ���� " +
	                    " \"��� ��������\" - \"������\" - \"���� ��������� ���� �� ������\" "  +
	                    " ����� ����, ������� \"����������\"!");
	        }


	        /* 09.02.2012 +++ ����� ����� �� ������� */
	        // ��� �������� ��� ��������� �� ���� .. ��� ��� ����� � ����� ..
	        // ����� �� � ���������� ...
	        if (!isServices) {
	            if (
	                    (act.element.typeRef.code != ENElementType.WRITING_NO_OBJECT)
	                    && (act.actTypeRef.code != ENPlanWorkState.TMC_TRANSFER )
	                    && (act.actTypeRef.code != ENPlanWorkState.TRUCKING)
	                    && (act.actTypeRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT)
	                    && (act.actTypeRef.code != ENPlanWorkState.REFINEMENT)
	                    && (act.actTypeRef.code != ENPlanWorkState.WRITINGS_OS) // NET-4383 �������� ��������� ��� ������� ���������
	                    && (act.element.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) // NET-4561 �������� �����
	            )
	            {
	                // ����� �� ���� ����� ��� ����� ;))
	                ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(enConn, getUserProfile());
	                ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
	                a2hFilter.actRef.code = act.code;
	                int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFilter,null,null,0,-1,null);
	                if (a2hArr.length == 0){
	                    System.out.println("ActCode = " + act.code);
	                    throw new EnergyproSystemException("� ��� ���� �������� ... ����������� �� ... (���� ����)");
	                }
	            }
	        }

	        ///// 30.08.11 ��� ���� �� ������ �� �������� �� �� � ������ ��������,
	        //    ����� � ��� ���� �������� ��� �������-����� �� ���� ������, ������� ������ � ���� ��� ��������
	        if (act.element.typeRef.code == ENElementType.OPERATIVE_OBJECT)
	        {
	            ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
	            pFilter.kind.code = ENPlanWorkKind.FACT;
	            pFilter.elementRef.code = act.element.code;
	            pFilter.conditionSQL = "to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen).toString() + "', 'dd.MM.yyyy') >= " +
	                                    " (select p.datestart from enplanwork p where p.code = enplanwork.code)" +
	            " and (('" + act.finMolCode + "' = " +
	            " (select finmoldata.finmolcode from " +
	            "   FINMOLDATA, " +
	            "   enworkorder2enplanwork " +
	            "   where  " +
	            "    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode " +
	            "   and enworkorder2enplanwork.plancode = enplanwork.code " +
	            "   and finmoldata.moltyperefcode = " + FINMolType.MASTER + "))" +
	            " or " +
	            " ((select finmoldata.finmolcode from " +
	            "   FINMOLDATA, " +
	            "   enworkorder2enplanwork " +
	            "   where  " +
	            "    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode " +
	            "   and enworkorder2enplanwork.plancode = enplanwork.code " +
	            "   and finmoldata.moltyperefcode = " + FINMolType.MASTER + ") is null)" +
	            ")" +
	            " and enplanwork.code not in " +
	            "(select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode = " + act.code + ")" +
	            // NET-3281 -- ������� ������� �� ������������ �����
	            " and enplanwork.statuscode <> " + ENPlanWorkStatus.LOCKED
	            ;

	            ENPlanWorkShortList planList = dao.getScrollableFilteredListNOSEGR(pFilter, pFilter.conditionSQL, null, 0, -1, null);
	            if (planList.totalCount > 0)
	            {
	                throw new EnergyproSystemException("� �����-��������, ��� ������� �������� �� ����: " + planList.get(0).workOrderNumber);
	            }

	        }
	        /////

	        boolean isENERGOSBYT = false;

	        /// ��������� ��� ������ ���������� ���������� �� ������

	        ENTransportOrderFilter tordFilter = new ENTransportOrderFilter();
	        tordFilter.conditionSQL = " entransportorder.code in (select torfact.code " +
	                                     " from enact2enplanwork a2p, enplancorrecthistory pch, entransportorder torfact, tktransportreal tr " +
	                                     " where a2p.actrefcode = " + act.code +
	                                     " and a2p.plancode = pch.plannewrefcode " +
	                                     " and pch.planoldrefcode = torfact.planrefcode " +
	                                     " and torfact.transportorderstatuscd = " + ENTransportOrderStatus.IN_WORK +
	                                     " and tr.code = torfact.transportrealcode " +
	                                     " and tr.transportstatuscode = " + TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE +
	                                     " union all " +
	                                     " select torplan.code " +
	                                     " from enact2enplanwork a2p, entransportorder torplan, tktransportreal tr " +
	                                     " where a2p.actrefcode = " + act.code +
	                                     " and a2p.plancode =  torplan.planrefcode " +
	                                     " and torplan.transportorderstatuscd = " + ENTransportOrderStatus.IN_WORK +
	                                     " and tr.code = torplan.transportrealcode " +
	                                     " and tr.transportstatuscode = " + TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE + ")";

	        int[] torderCodes = torderDAO.getFilteredCodeArray(tordFilter, 0, -1);

	        for (int m=0; m < torderCodes.length; m++)
	            {
	            ENTransportOrder tOrder = torderDAO.getObject(torderCodes[m]);
	            tOrder.transportOrderStatus.code = ENTransportOrderStatus.CLOSED;
	            torderDAO.save(tOrder);
	            };


	        // ������� ��� ����� �� ����� ���� ...
	        ENPlanWorkFilter f = new ENPlanWorkFilter();

	        f.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code +")";
	        int[] planCodes = dao.getFilteredCodeArray(f, 0, -1);



	        for (int pp = 0; pp < planCodes.length; pp++){
	            ENPlanWork plan = dao.getObject(planCodes[pp]);
	            if (plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT)
	            {
	                isENERGOSBYT = true;
	            }
	        }

	        PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

            Calendar cPlan = Calendar.getInstance();
            Calendar cAct = Calendar.getInstance();
	        
            cAct.setTime(act.dateAct);
            
	        for (int i = 0; i < planCodes.length; i++){
	            ENPlanWork plan = dao.getObject(planCodes[i]);
	            
	            cPlan.setTime(plan.dateStart);

	            // �������� ����� � ������ ������� � ��� ������� ...
	            if((cPlan.get(Calendar.MONTH) != cAct.get(Calendar.MONTH))
	                    || (cPlan.get(Calendar.YEAR) != cAct.get(Calendar.YEAR))
	            )
	            {
	                // ��� ����� �� ������� ����� ���� ��������� ��� �� ������ - � ���� ����� ���������� ������ � ������ �������
	                // (� ��� ���� ������ ���� ���� - 28.09.11)
	                // if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT && (!isVRTU) && (!isSIT))

	                if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT && isENERGOSBYT ) {
	                    if (!isServices // NET-3690
	                            && (act.code != 500042930 && act.code != 500042933 && act.code != 90133029 && act.code != 90133083 && act.code != 90133084 ) ) {
	                        // SUPP-9136 -- �������� ������������ �� ��� ������ ������������ �� ���������� ����������� ����� �� �����������
	                        if (!getUserProfile().userName.toUpperCase().equals("SALYGINAOI"))
	                        {
	                        throw new EnergyproSystemException("г� �� ����� ���� � ����� ������ ��������� ...");
	                        }
	                    }
	                }
	            }

	            plan.status.code = ENPlanWorkStatus.LOCKED;
	            dao.save(plan);

	            /////// 25.02.2013
	            planLogic.checkForCorrectInvNumber(plan);
	            ///////
	        }

	        FINLogic finLogic = new FINLogic( finConn,getUserProfile());

	        //�������� ��� ���� � ���������� �� ��������� ������ � ����
	        // (����� ����� �� ������� � ����� �� �������)
	        //NET-3112 �������� ���������� ���������� ��� ���������� �����
	        /*if(act.actTypeRef.code != ENPlanWorkState.WORK_IN_OUT && act.actTypeRef.code != ENPlanWorkState.SERVICES_FROM_OUT)
	        {
	            Calendar calendar = Calendar.getInstance();
	            calendar.setTime(Tools.clearTimeOfDate(act.dateGen));
	            calendar.set(Calendar.DATE, 1);
	            Date provPeriod = calendar.getTime();

	            Calendar calendar1 = Calendar.getInstance();
	            calendar1.setTime(Tools.clearTimeOfDate(act.dateAct));
	            calendar1.set(Calendar.DATE, 1);
	            Date actPeriod = calendar1.getTime();

	            EstimateLogic esForCheckDates = new EstimateLogic(enConn,getUserProfile());
	            if(actPeriod.compareTo(provPeriod) != 0 && esForCheckDates.getFINMaterialsListByActCode(act.code, 1).totalCount > 0)
	            {
	                throw new EnergyproSystemException("��� ����� ���� ���� ����� ���� ���������� ������� ����������  ����� ��� ����");
	            }
	        }*/

	        // �������� �� ���������� ������ ��� ����
	        if(!finLogic.isFinansyOpen(act.dateGen))
	        {
	                Calendar calFinansyOpen = Calendar.getInstance();
	                calFinansyOpen.setTime(act.dateGen);

	                throw new EnergyproSystemException("����� " + Tools.getUkrNameOfMonth(calFinansyOpen.get(Calendar.MONTH)+1)+" "+calFinansyOpen.get(Calendar.YEAR)+" �. �������� � Գ�. ��������");
	        }

	        // NET-923 �������� ����� � ������ � ���������� ���������� ���
	        // ��������� �� ������ �� �������

	           
	        finLogic.createDOCFromActWithoutVivod(act); // ��������� ��� �������� ���������� � ���.  ���������   � �������  �� ����
	        

	        // �������� ����� � ��, ���� ��� ���� � ����
	        boolean actHasSeals = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.MATERIALS);
	        if (actHasSeals) {
	        	if (act.element.code == ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
	        		scLogic.insertSealForLiquidation(act.code, ENEstimateItemKind.MATERIALS);
	        	} else {
	        		scLogic.insertSealIntoExpl(act.code);
	        	}
	        }

	        boolean actHasSealsForLiquidation = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.UNMOUNT);
	        if (actHasSealsForLiquidation) {
	        	scLogic.insertSealForLiquidation(act.code);
	        }
	        ////

	        /// ������� ������� �� �������
	        FKOrderLogic ordLogic = new FKOrderLogic(getUserProfile(), enConn);
	        ordLogic.createMolFuelMotionByAct(act.code);

	        // �������� ...
	        finLogic.createDOCFromActUnmount(act);

	        // ������ �� ������������
	        if(act.actTypeRef.code == ENPlanWorkState.PRODUCTION) {
	        	if(new FINLogic(enConn, getUserProfile()).checkActOrRQFKOrderForProductionLink(act.code, true)) {
	        		finLogic.moveRQFKOrdersFromActProducedToFK(act, true);
	        	} else {
	                finLogic.createDOCFromActProduced(act);
	        	}

	        }

	        // ��� ���������� - ��������� � ����������� � NET-4306 ����������� ������� � �� ������������
	        if (act.element.typeRef.code == ENElementType.METROLOGY_OBJECT &&
	        	act.element.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {

	            CounterLogic cLogic = new CounterLogic(enConn, getUserProfile());
	            cLogic.unLockByActForMetrology(act.code, 0);

	            if (act.actTypeRef.code != ENPlanWorkState.COUNTERS_ACT_DEFECT)
	            {
	            	scLogic.insertDovvodInfoForMetrologyRepair(act);

	            	/////
	            	// �������� ��������� ��� �� ������ �� ������� (����������)
	            	if (actLogic.checkActTypeForCountersStateVerification(act)) {

		            	ENAct2RQFKOrderDAO act2RQFKOrderDAO = new ENAct2RQFKOrderDAO(enConn, getUserProfile());

		            	ENAct2RQFKOrderFilter act2RQFKOrderFilter = new ENAct2RQFKOrderFilter();
		            	act2RQFKOrderFilter.actRef.code = act.code;
		            	act2RQFKOrderFilter.typeRef.code = ENAct2RQFKOrderType.SERVICES;

		            	ENAct2RQFKOrderShortList act2RQFKOrderList = act2RQFKOrderDAO.getScrollableFilteredList(act2RQFKOrderFilter, 0, -1);

						if (act2RQFKOrderList.totalCount == 0) {
							throw new SystemException("\n\nNET-4559 ���������� ��� �� ��'����� � ����� �� ������� � ������� (�� ����������)!");
						}
						else {
			            	try {
			    				Context context = new InitialContext();

			    				Object fkOrderRef = context.lookup(RQFKOrderController.JNDI_NAME);
			    				RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject
			    						.narrow(fkOrderRef, RQFKOrderControllerHome.class);
			    				RQFKOrderController fkOrderController = fkOrderHome.create();

			    				fkOrderController.movePostingToFK(act2RQFKOrderList.get(0).fkOrderRefCode, 0);

			            	} catch (NamingException e) {
			        			throw new SystemException(e.getMessage(), e);
			        		} catch (RemoteException e) {
			        			throw new SystemException(e.getMessage(), e);
			        		} catch (CreateException e) {
			        			throw new SystemException(e.getMessage(), e);
			        		}
						}

	            	}
	    			/////
	            }
	            else
	            {
	            	//String[] allowedAccounts = {"1126", "2096"};

	            	// ���������, ����� ��������� ������� ���. ����� � ���� ��������� �� ����, � ����� ���� ��� ������ ���, ������� ������ ����
	            	cLogic.checkAccountsByActCode(act.code, ENConsts.COUNTERS_ALLOWED_ACCOUNTS_FOR_ACT_DEFECT, true);
	            	cLogic.checkAccountsEqualityByActCode(act.code, true);

	            	// �������� ��� ���������� (��� ���� � ��������� �� ����� ���� ���������� ���. ���� � ScanCounters)
	            	scLogic.closeActDefect(act);
	            }


	            if(act.actTypeRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION
	            		|| act.actTypeRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE) {
	            	scLogic.updatePhasityAndZonesForCounters(act);
	            }
	        }

	        // ���������� �������� ���������
	        if(act.actTypeRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
	        {
	        	scLogic.moveLikvidationActToSC(act);
	        }

	        act.statusRef.code = ENActStatus.CLOSED;
	        act.dateEdit = new Date();
	        act.userGen = getUserProfile().userName;
	        objectDAO.save(act);

	        boolean isPlanworkTypeWORK_IN_OUT = false;
	        
	        // ��������� ������ ���������� �� �������� ������ � ������ "�������" ���� �������� (������� ������) ���� ��� ���
	        for (int es = 0; es < planCodes.length; es++) {
	            ENPlanWork planEs = dao.getObject(planCodes[es]);
	            //if (planEs.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
	            if (planEs.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/
	            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/)
	            {
	                actLogic.CloseStatusEstimateForWriteOff(planEs.code  , act.code);
	            }
	            isPlanworkTypeWORK_IN_OUT = planEs.typeRef.code == ENPlanWorkType.WORK_IN_OUT;
	        }

	        finOSConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_OS ){
	        	FKOSLogic OSLogic = new FKOSLogic(finOSConn, getUserProfile());

	        	AuthLogic al = new AuthLogic(enConn, getUserProfile());

	            if (! al.checkPermission("ksoe/energynet/ENPlanWorkENAct2OSDataController", "checkCloseUncolseAct")) {
	                throw new EnergyproSystemException("\n \n � ��� ���� ���� �� �������� �� !");
	            }


	          OSLogic.moveWriteOS(act);
	        }


	        /** NET-4562... +++ 23.02.2018... ��� ���������� ���� �� �� ��� ��������� �����, ��������� ���� �� �� �������... */
	        if (act.element.typeRef.code == ENElementType.LINE_CABLE
	        		&& act.actTypeRef.code == ENPlanWorkState.CAPITAL_REPAIR) {

	        	ENLineCableDAO lineCableDao = new ENLineCableDAO(enConn, getUserProfile());
	        	ENLineCableFilter lineCableFilter = new ENLineCableFilter();
	        	lineCableFilter.element.code = act.element.code;

	        	int lcArr[] = lineCableDao.getFilteredCodeArray(lineCableFilter, 0, -1);
	        	for (int l = 0; l < lcArr.length; l++) {

	        		ENLineCable lineCable = lineCableDao.getObject(lcArr[l]);
	        		lineCable.lastRepairDate = act.dateAct;

	        		lineCableDao.save(lineCable);
				}
	        }
	        
	        // � 01.06.2017 �������� �������� �� ������������� � ��
	        Date startDateMoveProvsByAct_RM = Tools.encodeDate(2017,6,1); // ���� ������ ��� ����� ������������� ���������� � �������� 2017

	        Date startDateMoveProvsByAct_TO = Tools.encodeDate(2017,9,1); // ���� ������ ��� ����� �� � �������� 2017
	        
	        Date startDateMoveProvsByServicesOnTheSide = Tools.encodeDate(2019,6,1); // ���� ������ ��� ����� ������ �� �������  
	        
	        Date startDateMoveProvsByOperative_object = Tools.encodeDate(2021,10,1); // ���� �������� �������� �� ��'���� �������� �� �� �� ������
	        
	       // NET-2335 �������� �������� �� ���� ��������� �����

	    	   if ( (act.actTypeRef.code ==  ENPlanWorkState.RECONSTRUCTION_MODERNIZATION &&  act.dateGen.compareTo(startDateMoveProvsByAct_RM) >= 0  )
	    			   || (act.actTypeRef.code ==  ENPlanWorkState.TO && act.dateGen.compareTo(startDateMoveProvsByAct_TO) >= 0  )
	    			   // 07.09.2017 �������������� ���� �������� �.� ����� ���������� ������ � ������� ���������� � ������ , � ����� ��� ������ ����� ������ �� ���2����� � �� ������������� � ����
	    			   //|| (act.actTypeRef.code ==  ENPlanWorkState.COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE && act.dateGen.compareTo(startDateMoveProvsByAct_TO) >= 0  )
	    			   /*// tezzzt ��� ������ ���� ��� ����� */  
						|| ((act.element.typeRef.code == ENElementType.SERVICES_OBJECT
								|| act.actTypeRef.code == ENPlanWorkState.DESIGNING
								|| (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT && isPlanworkTypeWORK_IN_OUT))
								&& act.dateGen.compareTo(
										startDateMoveProvsByServicesOnTheSide) >= 0)
	    			   || act.actTypeRef.code == ENPlanWorkState.CURRENT_REPAIR || act.actTypeRef.code == ENPlanWorkState.CAPITAL_REPAIR
	    			   || (act.element.typeRef.code == ENElementType.OPERATIVE_OBJECT 
	    			       && act.dateGen.compareTo(startDateMoveProvsByOperative_object) >= 0  )  
	    			   ){
	    		    provResult = actLogic.movePostingByActWork(act);
	    		    //tezzzt ��������!!!!!!!!!!!!!!  provResult = pstLogic.movePostingByActWork_New(act); ///// SUPP-95923 ��������� ������������ ��������
	    		   String badprovstring = "";
	    		   if (provResult != null ){
	    			   if (provResult.badProvList.totalCount > 0 ) {
	   	               	badprovstring="  ������ �� :  ";
	   	               	for (int b = 0; b < provResult.badProvList.totalCount; b++) {

	   	               		badprovstring = badprovstring + "\n"
	   	               				+    " ����� ������ = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
	   	               				+    " \n ����������  = " + provResult.badProvList.get(b).primechan
	   	               				+    " \n bal_ceh " + provResult.badProvList.get(b).bal_ceh
	   	               				+    " \n bal_kau " + provResult.badProvList.get(b).bal_kau
	   	               				+    " \n bal_sch " + provResult.badProvList.get(b).bal_sch + provResult.badProvList.get(b).bal_sub_sch
	   	               				+    " \n kor_ceh " + provResult.badProvList.get(b).kor_ceh
	   	               				+    " \n kor_kau " + provResult.badProvList.get(b).kor_kau
	   	               				+    " \n kor_sch " + provResult.badProvList.get(b).kor_sch + provResult.badProvList.get(b).kor_sub_sch;
	   	   				}

	   	             throw new EnergyproSystemException( "\n" + badprovstring );

	   	               }


	   	   	        if (provResult.partId > Integer.MIN_VALUE  )
	   	               {
	   	   	                   ENAct2ProvFilter a2fFil = new ENAct2ProvFilter();
	   	   	                   a2fFil.actRef.code = act.code;
	   	   	                   int[] a2pFilArr = act2provDAO.getFilteredCodeArray(a2fFil, 0, -1);
	   	   	                   
	   	   	                   if (a2pFilArr.length==0){
	   	   	                	ENAct2Prov act2Prov = new ENAct2Prov();

	   	                        act2Prov.actRef.code = act.code;
	   	                        act2Prov.partId = provResult.partId;
	   	                        act2Prov.datePosting = act.dateGen;
	   	                        act2provDAO.add(act2Prov);  
	   	   	                   }
	   	   	                   else 
	   	   	                   {
	   	   	                	ENAct2Prov act2Prov = act2provDAO.getObject(a2pFilArr[0]);
	   	   	                	act2Prov.partId = provResult.partId;
 	                            act2Prov.datePosting = act.dateGen;
 	                            act2provDAO.save(act2Prov);  
	   	   	                   }

	   	               }

	    		    }

	    	   }
	     }
	        
	        scLogic.updateCountersAfterActMoving(act);



	        /**  ������������� ���������� � ��  !!!!!!!!! ���� �������� ��� � ��������� ������������� �� ����������  */
			if (!_messageId.equals("") && isBeginAxTransaction ) {
				axLogic.aifttscommit(_messageId);
			}
        }
        /*catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);} catch (RemoteException e) {
        	throw new SystemException(e.getMessage(), e);
		} catch (ParseException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}*/
		catch (Exception e) {
			/* !!!! ����� ���������� ���� �������� ��� � ������� ( ������ �� ������� ���� ���������� ���� ����� � ���������� ����������� ��� ) */
        	if((writeOffTmcConf==1 || writeOffTmcConf==2) && isBeginAxTransaction ) {
				System.out.println(" enactcontroller.close axLogic.aifttsabort , _messageId = " + _messageId);
				axLogic.aifttsabort(_messageId);
			}
        	throw new  EnergyproSystemException(e.getMessage(), e);
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
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (finOSConn != null && ! finOSConn.isClosed()) {
                	finOSConn.close();
                	finOSConn = null;
                }
            } catch (SQLException e) {
            }

			{
				closeConnection();
			}
			if(isLocked) LockUtils.unLockEntity(code);
		}
	}


    public void closeZKU(int code, int isClient)
    {
        Connection finConn = null;
        Connection enConn = null;
        boolean isLocked = false;
        
        try
        {

        enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        ActLogic actLogic = new ActLogic(enConn, getUserProfile());

            if (isClient == 1){
                //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
                actLogic.checkInSCCounterByActCode(code, true);
            }

        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);

        ENPlanWorkDAO dao = new ENPlanWorkDAO(enConn, getUserProfile());

        ENTransportOrderDAO torderDAO = new ENTransportOrderDAO(getUserProfile(), enConn);

        ENAct act = objectDAO.getObject(code);
        
        // 05.02.2020 ���������� ���������� � ����������� ������ ���� ����� ��� ������
        // ��������������� � �������
        if(isClient == 1) {
    		isLocked = LockUtils.lockEntity(code);
    		
    		if(!isLocked) {
    			throw new SystemException(String.format("��� � %s �� %s ��� �����������"
    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
    		}        	
        }

        
        if (act.dateGen.after(new Date())) {
        	throw new SystemException("���� ���� ������ ������� ����!");
        }

        if (act.dateAct.after(new Date())) {
        	throw new SystemException("���� ���������� ���� ������ ������� ����!");
        }


    // NET-2139  �� ����� �������� ��� � �������  � ��� ����. ������� � ������ � ��������� ������ �� ���������� ��� �������������� � ����������
        /* 05.11.2013 SUPP-6949 �.�. ��������� ���� ������ ����� ��������� �������� �� ��������, �������� �������
        if (isClient == 1){
        ENActInTechCond2ENActDAO actInc2ActDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
        ENActInTechCond2ENAct actInc2ActObj = null;
        ENActIncomeTechConditions actIncObj = null;
        ENActIncomeTechConditionsDAO actIncDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
        ENActInTechCond2ENActFilter actInc2ActFilter = new ENActInTechCond2ENActFilter();
        actInc2ActFilter.actRef.code = act.code;
        int actInc2Act[] = actInc2ActDAO.getFilteredCodeArray(actInc2ActFilter, 0, -1);
        if (actInc2Act.length > 0) {
            actInc2ActObj = actInc2ActDAO.getObject(actInc2Act[0]);
            actIncObj = actIncDAO.getObject(actInc2ActObj.actIncomeRef.code);
            if(actIncObj != null)
                throw new EnergyproSystemException(" ��������� �������� � �� !!! ��� ��� ��`������ � ����������� ����� �  " + actIncObj.numbergen + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(actIncObj.dategen).toString() + ". ���������� ��� ����������� ����������� ��� ��������� ������������ ����!!! " );
            else
                throw new EnergyproSystemException(" ��� �� � ����������� ���, �� ������� ��������� ���� � ���� ������� �� �������. ���������� ��� ����������� ����������� ��� ��������� ������������ ����!!! ");
        }
        }
        */

        // ��� ������ �������� ����� �� ��������������� ���� �����
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());

            if (! al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufetToFK")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        ENPlanWorkFilter pllFilter = new ENPlanWorkFilter();
        pllFilter.conditionSQL = " enplanwork.code in ( " +
                " select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = " + act.code + ")";
        int pllArr[] = dao.getFilteredCodeArrayNOSEGR(pllFilter, 0, -1);
        ENPlanWork pll = dao.getObjectNOSEGR(pllArr[0]);
        boolean isServices = false;
        if (pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
                || pll.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
            isServices = true;
        }

        // ��������� �� ������� �� ������� �� ������� �� ������� ��� �� � �������� ��� �������� ���� ����������� ����� ���������������
        if (act.element.typeRef.code == ENElementType.SERVICES_OBJECT || isServices ){
            FINLogic fLogic = new FINLogic(finConn,getUserProfile());
            int CodeFormNalog = Integer.MIN_VALUE;
            int codeOrg = Integer.MIN_VALUE; ; // ���� �����������
            // ������ �� �������
            if  (isServices){
                RQFKOrder2PlanFactDAO f2pDAO = new RQFKOrder2PlanFactDAO(getUserProfile(), enConn);
                RQFKOrder2PlanFactFilter f2pFilter = new RQFKOrder2PlanFactFilter();
                f2pFilter.act.code = act.code;
                RQFKOrder2PlanFactShortList f2pList = f2pDAO.getScrollableFilteredList(f2pFilter,0,-1);
                if (f2pList.totalCount > 0){
                    RQFKOrderDAO fDAO = new RQFKOrderDAO(getUserProfile(), enConn);
                    RQFKOrder fkorder = fDAO.getObject(f2pList.get(0).fkorderCode);

                    RQOrgDAO oDAO = new RQOrgDAO(getUserProfile(), enConn);
                    RQOrg org = oDAO.getObject(fkorder.org.code);

                    codeOrg = org.id;
                    CodeFormNalog = fLogic.getCodeFormNalogByContragentCode(codeOrg);

                }
            }
            // ������ �� �������
            if  (act.element.typeRef.code == ENElementType.SERVICES_OBJECT){


                ServicesLogic sl = new ServicesLogic(enConn, getUserProfile());
                ENServicesObject soObject = sl.getServicesObjectByElementCode(act.element.code);

                CodeFormNalog = fLogic.getCodeFormNalogByContragentCodeString(soObject.partnerCode);


            }

            // �� ���� ����������� ��������� ����������� �� �� ��� � ����������� ����� ���������������
            // ���� ������������� ��������  ����� �� ���� �������� ���



            if (CodeFormNalog == Integer.MIN_VALUE) {
                throw new EnergyproSystemException("��� ����������� �� ������������ ������� ����� ������������� !");
            }
        }


        // �� ����� ��������� ��������� ���� ��� ����� �� ������� � ����� ���� -
        // ��� ������ ����������� � ����� �������� ������ � ���������

        if (isClient == 1){
          //ActLogic actLogic = new ActLogic(enConn, getUserProfile());
          actLogic.checkIfServicesObjectByAct(act, true);
        }


        // �������� �� ��, ��� ��� �������������
        if(act.statusRef.code == ENActStatus.CLOSED)
            throw new EnergyproSystemException("��� ��� �����������");

        // �������� �� ����������� �� ���
        if(act.statusRef.code == ENActStatus.REVERSED)
            throw new EnergyproSystemException("��� ����������");

        //if (act != null)
        //throw new EnergyproSystemException("������ ����� �������� ��������� ... �������� �����");


        /*
        *  16.02.2012 +++ ��� ����� �� �������,
        *  ������ � ����� ���� ����������� ����� � ����� ������ � ���������
        */

        if (isServices && isClient == 1) {
            throw new EnergyproSystemException(
                    "��� �������� ������� ��������� (��� �������) � ���� " +
                    " \"��� ��������\" - \"������\" - \"���� ��������� ���� �� ������\" "  +
                    " ����� ����, ������� \"����������\"!");
        }


        /* 09.02.2012 +++ ����� ����� �� ������� */
        // ��� �������� ��� ��������� �� ���� .. ��� ��� ����� � ����� ..
        // ����� �� � ���������� ...
        if (!isServices) {
            if (
                    (act.element.typeRef.code != ENElementType.WRITING_NO_OBJECT)
                    && (act.actTypeRef.code != ENPlanWorkState.TMC_TRANSFER )
                    && (act.actTypeRef.code != ENPlanWorkState.TRUCKING)
                    && (act.actTypeRef.code != ENPlanWorkState.REFINEMENT_BY_CONTRACT)
                    && (act.actTypeRef.code != ENPlanWorkState.REFINEMENT)
            )
            {
                // ����� �� ���� ����� ��� ����� ;))
                ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(enConn, getUserProfile());
                ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
                a2hFilter.actRef.code = act.code;
                int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFilter,null,null,0,-1,null);
                if (a2hArr.length == 0){
                    System.out.println("ActCode = " + act.code);
                    throw new EnergyproSystemException("� ��� ���� �������� ... ����������� �� ... (���� ����)");
                }
            }
        }

        ///// 30.08.11 ��� ���� �� ������ �� �������� �� �� � ������ ��������,
        //    ����� � ��� ���� �������� ��� �������-����� �� ���� ������, ������� ������ � ���� ��� ��������
        if (act.element.typeRef.code == ENElementType.OPERATIVE_OBJECT)
        {
            ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
            pFilter.kind.code = ENPlanWorkKind.FACT;
            pFilter.elementRef.code = act.element.code;
            pFilter.conditionSQL = "to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen).toString() + "', 'dd.MM.yyyy') >= " +
                                    " (select p.datestart from enplanwork p where p.code = enplanwork.code)" +
            " and (('" + act.finMolCode + "' = " +
            " (select finmoldata.finmolcode from " +
            "   FINMOLDATA, " +
            "   enworkorder2enplanwork " +
            "   where  " +
            "    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode " +
            "   and enworkorder2enplanwork.plancode = enplanwork.code " +
            "   and finmoldata.moltyperefcode = " + FINMolType.MASTER + "))" +
            " or " +
            " ((select finmoldata.finmolcode from " +
            "   FINMOLDATA, " +
            "   enworkorder2enplanwork " +
            "   where  " +
            "    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode " +
            "   and enworkorder2enplanwork.plancode = enplanwork.code " +
            "   and finmoldata.moltyperefcode = " + FINMolType.MASTER + ") is null)" +
            ")" +
            " and enplanwork.code not in " +
            "(select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode = " + act.code + ")" +
            // NET-3281 -- ������� ������� �� ������������ �����
            " and enplanwork.statuscode <> " + ENPlanWorkStatus.LOCKED
            ;

            ENPlanWorkShortList planList = dao.getScrollableFilteredListNOSEGR(pFilter, pFilter.conditionSQL, null, 0, -1, null);
            if (planList.totalCount > 0)
            {
                throw new EnergyproSystemException("� �����-��������, ��� ������� �������� �� ����: " + planList.get(0).workOrderNumber);
            }

        }
        /////

        boolean isENERGOSBYT = false;

        /// ��������� ��� ������ ���������� ���������� �� ������

        ENTransportOrderFilter tordFilter = new ENTransportOrderFilter();
        tordFilter.conditionSQL = " entransportorder.code in (select torfact.code " +
                                     " from enact2enplanwork a2p, enplancorrecthistory pch, entransportorder torfact, tktransportreal tr " +
                                     " where a2p.actrefcode = " + act.code +
                                     " and a2p.plancode = pch.plannewrefcode " +
                                     " and pch.planoldrefcode = torfact.planrefcode " +
                                     " and torfact.transportorderstatuscd = " + ENTransportOrderStatus.IN_WORK +
                                     " and tr.code = torfact.transportrealcode " +
                                     " and tr.transportstatuscode = " + TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE +
                                     " union all " +
                                     " select torplan.code " +
                                     " from enact2enplanwork a2p, entransportorder torplan, tktransportreal tr " +
                                     " where a2p.actrefcode = " + act.code +
                                     " and a2p.plancode =  torplan.planrefcode " +
                                     " and torplan.transportorderstatuscd = " + ENTransportOrderStatus.IN_WORK +
                                     " and tr.code = torplan.transportrealcode " +
                                     " and tr.transportstatuscode = " + TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE + ")";

        int[] torderCodes = torderDAO.getFilteredCodeArray(tordFilter, 0, -1);

        for (int m=0; m < torderCodes.length; m++)
            {
            ENTransportOrder tOrder = torderDAO.getObject(torderCodes[m]);
            tOrder.transportOrderStatus.code = ENTransportOrderStatus.CLOSED;
            torderDAO.save(tOrder);
            };


        // ������� ��� ����� �� ����� ���� ...
        ENPlanWorkFilter f = new ENPlanWorkFilter();

        f.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code +")";
        int[] planCodes = dao.getFilteredCodeArray(f, 0, -1);



        for (int pp = 0; pp < planCodes.length; pp++){
            ENPlanWork plan = dao.getObject(planCodes[pp]);
            if (plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT)
            {
                isENERGOSBYT = true;
            }
        }

        PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

        Calendar cAct = Calendar.getInstance();
        Calendar cPlan = Calendar.getInstance();
        
        cAct.setTime(act.dateAct);
        
        for (int i = 0; i < planCodes.length; i++){
            ENPlanWork plan = dao.getObject(planCodes[i]);

            cPlan.setTime(plan.dateStart);
            
            // SUPP-68304 ������ �������� ���� ���������� (dateGen) ����� ����������� dateAct
            // �������� ����� � ������ ������� � ��� ������� ...
            if (
                    (cPlan.get(Calendar.MONTH) != cAct.get(Calendar.MONTH))
                    || (cPlan.get(Calendar.YEAR) != cAct.get(Calendar.YEAR))
            )
            {
                // ��� ����� �� ������� ����� ���� ��������� ��� �� ������ - � ���� ����� ���������� ������ � ������ �������
                // (� ��� ���� ������ ���� ���� - 28.09.11)
                // if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT && (!isVRTU) && (!isSIT))

                if (act.element.typeRef.code != ENElementType.SERVICES_OBJECT && isENERGOSBYT ) {
                    if (!isServices // NET-3690
                            && (act.code != 500042930 && act.code != 500042933 && act.code != 90133029 && act.code != 90133083 && act.code != 90133084 ) ) {
                        // SUPP-9136 -- �������� ������������ �� ��� ������ ������������ �� ���������� ����������� ����� �� �����������
                        throw new EnergyproSystemException("г� �� ����� ���� � ����� ������ ��������� ...");
                    }
                }
            }

            plan.status.code = ENPlanWorkStatus.LOCKED;
            dao.save(plan);

            /////// 25.02.2013
            planLogic.checkForCorrectInvNumber(plan);
            ///////
        }

        FINLogic finLogic = new FINLogic( finConn,getUserProfile());

        //�������� ��� ���� � ���������� �� ��������� ������ � ����
        // (����� ����� �� ������� � ����� �� �������)
        //NET-3112 �������� ���������� ���������� ��� ���������� �����
        /*if(act.actTypeRef.code != ENPlanWorkState.WORK_IN_OUT && act.actTypeRef.code != ENPlanWorkState.SERVICES_FROM_OUT)
        {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(Tools.clearTimeOfDate(act.dateGen));
            calendar.set(Calendar.DATE, 1);
            Date provPeriod = calendar.getTime();

            Calendar calendar1 = Calendar.getInstance();
            calendar1.setTime(Tools.clearTimeOfDate(act.dateAct));
            calendar1.set(Calendar.DATE, 1);
            Date actPeriod = calendar1.getTime();

            EstimateLogic esForCheckDates = new EstimateLogic(enConn,getUserProfile());
            if(actPeriod.compareTo(provPeriod) != 0 && esForCheckDates.getFINMaterialsListByActCode(act.code, 1).totalCount > 0)
            {
                throw new EnergyproSystemException("��� ����� ���� ���� ����� ���� ���������� ������� ����������  ����� ��� ����");
            }
        }*/

        // �������� �� ���������� ������ ��� ����
        if(!finLogic.isFinansyOpen(act.dateGen))
        {
                Calendar calFinansyOpen = Calendar.getInstance();
                calFinansyOpen.setTime(act.dateGen);

                throw new EnergyproSystemException("����� " + Tools.getUkrNameOfMonth(calFinansyOpen.get(Calendar.MONTH)+1)+" "+calFinansyOpen.get(Calendar.YEAR)+" �. �������� � Գ�. ��������");
        }

        // NET-923 �������� ����� � ������ � ���������� ���������� ���
        // ��������� �� ������ �� �������

          finLogic.createDOCFromActWithoutVivodZKU(act);

        /// ������� ������� �� �������
        FKOrderLogic ordLogic = new FKOrderLogic(getUserProfile(), enConn);
        ordLogic.createMolFuelMotionByAct(act.code);

        // �������� ...
        finLogic.createDOCFromActUnmount(act);

        // ������ �� ������������
        if(act.actTypeRef.code == ENPlanWorkState.PRODUCTION)
            finLogic.createDOCFromActProduced(act);

        // ��� ���������� - ��������� � �����������
        if ( act.element.typeRef.code == ENElementType.METROLOGY_OBJECT){
            CounterLogic cLogic = new CounterLogic(enConn, getUserProfile());
            cLogic.unLockByActForMetrology(act.code, 0);
        }

        SCLogic scLogic = new SCLogic(enConn, getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
        // �������� ����� � ��, ���� ��� ���� � ����
        boolean actHasSeals = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.MATERIALS);
        if (actHasSeals) {
        	scLogic.insertSealIntoExpl(act.code);
        }

        boolean actHasSealsForLiquidation = scLogic.checkSealsInAct(act.code, ENEstimateItemKind.UNMOUNT);
        if (actHasSealsForLiquidation) {
        	scLogic.insertSealForLiquidation(act.code);
        }
        ////


        act.statusRef.code = ENActStatus.CLOSED;
        act.dateEdit = new Date();
        act.userGen = getUserProfile().userName;
        objectDAO.save(act);

        // ��������� ������ ���������� �� �������� ������ � ������ "�������" ���� �������� (������� ������) ���� ��� ���
        for (int es = 0; es < planCodes.length; es++) {
            ENPlanWork planEs = dao.getObject(planCodes[es]);
            //if (planEs.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
            if (planEs.stateRef.code == ENPlanWorkState.WRITINGS_MBP
            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/
            		|| planEs.stateRef.code == ENPlanWorkState.WRITINGS_COUNTERS /*NET-1026*/)
            {
                actLogic.CloseStatusEstimateForWriteOff(planEs.code  , act.code);
            }
        }
        
        scLogic.updateCountersAfterActMoving(act);

        // ����������� ������������ ������ ...
        //PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
        //planLogic.createIncompletePlansFromAct(act);


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
            if(isLocked) LockUtils.unLockEntity(code);
        }
    }



    /*ENAct. ������� - ������ ������� + ������� �������� �� ���.��������*/
    public void remove(int code, int isClient)
    {
        Connection finConn = null;
        Connection enConn = null;
        int i = 0;
        try
        {

        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
        enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);
        ENActInTechCond2ENActDAO actIncome2ActDao = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
        ENAct2ProvDAO a2provDAO = new ENAct2ProvDAO(getUserProfile(), enConn);
        ENAct2DFDocDecreeDAO a2docdecrDAO = new ENAct2DFDocDecreeDAO(getUserProfile(),enConn);

        ENAct act = objectDAO.getObject(code);
        
        ENAct2DFDocDecreeFilter a2decrFil = new ENAct2DFDocDecreeFilter();
		a2decrFil.actRef.code = code;
		int[] a2decrArr = a2docdecrDAO.getFilteredCodeArray(a2decrFil, 0, -1);
		if (a2decrArr.length >0){
			
			throw new EnergyproSystemException("��� ���� ������� ������� ��������� ������������� ��� ������ �������!!!");
			// ������� ��� �� ������� ������� ������������  
		/*	Context act2DocDecree = new InitialContext();
            Object  act2DocDecreeObj = act2DocDecree.lookup(ENAct2DFDocDecreeController.JNDI_NAME);
            ENAct2DFDocDecreeControllerHome act2DocDecreeHome = (ENAct2DFDocDecreeControllerHome) PortableRemoteObject.narrow(act2DocDecreeObj, ENAct2DFDocDecreeControllerHome.class);
            ENAct2DFDocDecreeController act2DocDecreeController = act2DocDecreeHome.create();
            
            for (int k = 0; k < a2decrArr.length; k++) {
            	ENAct2DFDocDecree aENAct2DFDocDecree = a2docdecrDAO.getObject(a2decrArr[k]);
            	act2DocDecreeController.removeByObj(aENAct2DFDocDecree);
    		}*/
		}

        ENActIncomeTechConditions actIncomeTechCond = actIncome2ActDao.getActIncomeByENActCode(act.code);
        if(actIncomeTechCond != null) {
        	throw new SystemException(String.format("���������� ��� � %s �� %s ��'������ � ����������� ����� �� �������� ������ � %s �� %s. �������� ���� ���������."
        			, act.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)
        			, actIncomeTechCond.numbergen, new SimpleDateFormat("dd.MM.yyyy").format(actIncomeTechCond.dategen)));
        }

        // �� �� ����� ������� � ����������� (� ������ ������������)
        if (act.statusRef.code != ENActStatus.GOOD){

            if ( ! ((act.statusRef.code == ENActStatus.SIGNATURE) && (isClient == ENConsts.isClient_SCCOUNTER))){
                throw new EnergyproSystemException("��� � ����� �������� �� ���������� !!!");
            }
        }


        // ��� ������ �������� ����� �� ��������������� ���� �����
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION  || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());

            if (! al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        // NET-1026 ��� �������� ���������
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());
            if (!al.checkPermission("ksoe/energynet/SCCounterController", "removeCountersForWriteOff")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        ActLogic actLogic = new ActLogic(enConn, getUserProfile());
        //boolean isSCCounter = false;
        int isSCCounter = Integer.MIN_VALUE;
        isSCCounter = actLogic.checkInSCCounterByActCode(act.code, false);

        if (isClient == ENConsts.isClient_CLIENT){

            if (isSCCounter == 1){
                throw new EnergyproSystemException("������� � ���� ��'������ � ���������� ... ����������� ���������� ... ");
            }
        }

        // ������ ��� ���������� �������� ... ;) ... �� ����� ����� ;)
        if (isClient == ENConsts.isClient_CLIENT){
            // �������� ����� �� ���� ��������� ���� ������ ������� ...
            AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            if ( ! l.checkPermission4PlanItemsByElement(act.element.code) )
            {
                throw new EnergyproSystemException("Acces denied for method addBy... from method remove(ENAct object)");
            }
        }

        // ������ � �����������
        ENAct2FinKodIstDAO act2KodIstDao = new ENAct2FinKodIstDAO(enConn, getUserProfile());
        ENAct2FinKodIstFilter act2KodIstFilter = new  ENAct2FinKodIstFilter();
        act2KodIstFilter.actRef.code = act.code;
        int[] act2KodIstCodes = act2KodIstDao.getFilteredCodeArray(act2KodIstFilter, 0, -1);
        for(int act2KodIstCode : act2KodIstCodes) {
        	act2KodIstDao.remove(act2KodIstCode);
        }

        // ������� ������ ����� � ������ ... ���� ���� ..
        ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(getUserProfile(),enConn);
        ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
        a2pFilter.actRef.code = act.code;

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

        /*
        int[] a2pArr = a2pDAO.getFilteredCodeArray(a2pFilter, null, null, 0, -1, null);

        if (a2pArr.length > 0){
            // ����;%:�� �������� �� �������� ;( ...throw new EnergyproSystemException("�������� ������� ������ � ����� ����  ");

        }
        */


        ENAct2ENPlanWorkShortList a2pList = a2pDAO.getScrollableFilteredList(a2pFilter,0,-1);

            //------------------------
            Context context = new InitialContext();
            Object objAct2PlanRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
            ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject.narrow(objAct2PlanRef, ENAct2ENPlanWorkControllerHome.class);
            ENAct2ENPlanWorkController act2planController = act2planHome.create();


        for (i=0; i< a2pList.totalCount; i++){

            //a2pDAO.remove(a2pList.get(i).code);
            act2planController.remove(a2pList.get(i).code, isClient);

            if (isSCCounter == 1) {
                ENPlanWork plan = planDAO.getObject(a2pList.get(i).planCode);
                plan.status.code = ENPlanWorkStatus.GOOD;
                planDAO.save(plan);
            }
        }

        // ������� ����� � ��������� ...
        ENAct2HumenFilter a2hFilter = new ENAct2HumenFilter();
        ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(enConn, getUserProfile());
        a2hFilter.actRef.code = act.code;
        int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFilter, 0, -1);
        for (int ff=0; ff < a2hArr.length; ff++){
            a2hDAO.remove(a2hArr[ff]);
        }


        ENAct2TransportDAO a2tDAO = new ENAct2TransportDAO(enConn, getUserProfile());
        ENAct2TransportFilter a2tFilter = new ENAct2TransportFilter();
        a2tFilter.actRef.code = act.code;
        int[] a2tArr = a2tDAO.getFilteredCodeArray(a2tFilter, 0, -1);
        for (int ff = 0; ff < a2tArr.length; ff++){
            a2tDAO.remove(a2tArr[ff]);
        }


    	// �������� ������� �� ������� enservicesfactcalcbyct

        ENServicesFactCalcByActDAO calcFactDao = new ENServicesFactCalcByActDAO(enConn, getUserProfile());
        ENServicesFactCalcByActFilter calcFactFilter = new ENServicesFactCalcByActFilter();
        calcFactFilter.actRef.code = act.code;

        int calcFactArr[] = calcFactDao.getFilteredCodeArray(calcFactFilter, 0, -1);
        for (int cf = 0; cf < calcFactArr.length; cf++) {
        	calcFactDao.remove(calcFactArr[cf]);
        }

        
        // ������� ������ ���� � ����������� 
        ENAct2ProvFilter a2provFil = new ENAct2ProvFilter();
        a2provFil.actRef.code = act.code;
		ENAct2ProvShortList a2provList = a2provDAO.getScrollableFilteredList(a2provFil, 0, -1);
		for (int j = 0; j < a2provList.totalCount; j++) {
			if (a2provList.get(j).partId < 0 || a2provList.get(j).partId == Integer.MIN_VALUE ){
				a2provDAO.remove(a2provList.get(j).code);
			}
		}

		// NET-4596 �������� ��������� � ����� �������� � ����������������
		actLogic.cancelDFDoc(code);
		actLogic.removeENAct2DFDoc(code, Integer.MIN_VALUE, true);

        /*
        *
        * !!!!!!!!!!!!
        *  ��� ��� �� ��� ��������
        *

        FINLogic finLogic = new FINLogic( finConn,getUserProfile());

        finLogic.validateDocDate(act.dateGen);
        // ������ �������� � ���������

        // for Master
        finLogic.removeDoc(act.finDocCode, 300);

        // for Mechanic
        finLogic.removeDoc(act.finDocMechanicCode, 301);

        // �������� ����/��� ...
        // + estimates !!!
        //
        ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(getUserProfile(),enConn);
        //ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getUserProfile(), enConn);

        PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());



        ENAct2ENPlanWorkFilter a2pFilter = new ENAct2ENPlanWorkFilter();
        a2pFilter.actRef.code = act.code;
        String planCodes = "";
        ENAct2ENPlanWorkShortList a2pList = a2pDAO.getScrollableFilteredList(a2pFilter,0,-1);


        for (i=0; i< a2pList.totalCount; i++){
            // + �������� ���� ��������� !!!! � 0 !!! ���� �� ����� !!!! ... � � ���??

            // ����� ��������� ��� � ������??? ���� ������������� ��� ??
            /* ���� ���� ������ �� ���� ...
            ENEstimateItemFilter esFilter = new ENEstimateItemFilter();
            esFilter.planRef.code = a2pList.get(i).planCode;
            ENEstimateItemShortList esList = eDAO.getScrollableFilteredList(esFilter, 0, -1);
            for (int j=0; j<esList.totalCount; j++){
                ENEstimateItem es = eDAO.getObject(esList.get(j).code);
                es.countFact = new BigDecimal(0);
            }
            */

        /* AS
            if ( ! planLogic.isNotEditablePlan(a2pList.get(i).planCode) ){

            if ( planCodes.length() > 0 )
                planCodes = planCodes + ", " + a2pList.get(i).planCode;
            else
                planCodes = "" + a2pList.get(i).planCode;
            }
            else
                throw new EnergyproSystemException("Plan closed or removed");

            a2pDAO.remove(a2pList.get(i).code);
        }

        // ������� ������������� !!! ��� ��������� ��������� ����� ����� - ���� !!!
        FINMaterialsDAO fmDAO = new FINMaterialsDAO(getUserProfile(), enConn);
        FINMaterialsFilter fmFilter = new FINMaterialsFilter();
        //fmFilter.estimateItemRef.code = act.finDocCode;
        if  (planCodes.length() > 0 ) // ������ �� ���� ���� ... ���������� ���������� ����� ���� !!!
        {
            planCodes = "(" + planCodes + ")";
            fmFilter.conditionSQL = " finmaterials.estimateitemrefcode in "+
                        "(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in "+ planCodes +")";

            FINMaterialsShortList fmList = fmDAO.getScrollableFilteredList(fmFilter, 0, -1);
            for (i=0; i< fmList.totalCount; i++){
                FINMaterials fm = fmDAO.getObject(fmList.get(i).code);
                fm.statusRef.code = FINMaterialsStatus.CANCELED;
                fmDAO.save(fm);
            }

        }
        */

        // ��� �� ����-���� ��� �� ����� ;)
        // ��� ��� ;) .. ������� � ����� ������ ;))

        if (isClient != ENConsts.isClient_SCCOUNTER){
            // ��������� �� ��������� �� ��� ;)

            act = objectDAO.getObject(code);

            if (act.statusRef.code != ENActStatus.GOOD){
                throw new EnergyproSystemException("��� � ����� �������� �� ���������� !!!");
            }
            /*
            act.statusRef.code = ENActStatus.CANCELED;
            act.userGen = getUserProfile().userName;
            act.dateEdit = new Date();
            //act.commentGen += " finCode="+act.finDocCode;
            //act.finDocCode = Integer.MIN_VALUE;... �������� !!! ����������� ��� �����������"��
            objectDAO.save(act);
            */
            // � ������� ;)
            objectDAO.remove(code);

        }
        else
        {
            objectDAO.remove(code);
        }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (NamingException e) {
            throw new EnergyproSystemException(e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e);
        }
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
    }

    /*ENAct. �������� + �������� � ���.������*/
    @Override
    public int add(ENAct object) {
    	return add(object, null);
    }

	public int add(ENAct object, DFDocSigner[] dfDocSigners)
    {
        //Connection finConn = null;
        Connection enConn = null;
        Connection docFlowConnection = null;

        try
        {
            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


            // �������� ����� �� ���� ��������� ���� ������ ������� ...
            AuthLogic l = new AuthLogic(enConn, getUserProfile());
            if ( ! l.checkPermission4PlanItemsByElement(object.element.code) )
            {
                throw new EnergyproSystemException("Acces denied for method addBy... from method add(ENAct object)");
            }

            // ��� ������ �������� ����� �� ��������������� ���� �����
            if (object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                if (! l.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                    throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
                }
            }

            // NET-1026 ��� �������� ���������
            if (object.actTypeRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
            {

                if (!l.checkPermission("ksoe/energynet/SCCounterController", "addCountersForWriteOff")) {
                    throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
                }
            }

            // 28.11.2016 NET-4543 �������� ���� �� ���� �������� �� ���������
			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			actLogic.checkForRecyclableMaterials(object);

			// SUPP-103456 ���� ���������� ���� ����� ������ ������ ����������
			actLogic.checkDatePostings(object);

            // NET-3213 ����������� ������������� ��������������
            if(object.element.typeRef.code == ENElementType.TRANSPORT)
            {
                    TKTransportRealDAO trDAO = new TKTransportRealDAO(getUserProfile(), enConn);
                    TKTransportRealFilter trFilter = new TKTransportRealFilter();
                    trFilter.enelement.code = object.element.code;
                    TKTransportRealShortList trList = trDAO.getScrollableFilteredList(trFilter, 0, -1);

                    if(trList.totalCount != 1)
                        throw new EnergyproSystemException("������� � ������� ��������������");

                    if(trList.get(0).isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
                        throw new EnergyproSystemException("��������� " + trList.get(0).name + " ���������� ���������������");
            }

            // ���� ������ � ������� !!! ���� ����� � �� ;)
                Date dd = new Date();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(dd);
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.SECOND, 0);
                calendar.set(Calendar.MILLISECOND, 0);
                calendar.add(Calendar.MONTH, 1);
                Date maxDate = calendar.getTime();

            if (object.dateGen.after(maxDate)){
                throw new EnergyproSystemException("���� ���� �� ������� ������������ " + new SimpleDateFormat("dd.MM.yyyy").format(maxDate).toString(), getUserProfile());
            }


	/*
        FINLogic finLogic = new FINLogic( finConn, getUserProfile());
        finLogic.validateDocDate(object.dateGen);
	
        // �������� ��� ����
        object.finDocCode = finLogic.createDoc(object, 300); // for Master - kod operacii - 300 !!!
        if (object.finDocCode == Integer.MIN_VALUE)
            throw new EnergyproSystemException("error inserting DOC in FinCollection");
	
        // �������� ��� �������� ...
        object.finDocMechanicCode = finLogic.createDoc(object, 301); // for Master - kod operacii - 300 !!!
        if (object.finDocMechanicCode == Integer.MIN_VALUE)
            throw new EnergyproSystemException("error inserting DOC in FinCollection");
	
	*/
        object.setDomain_info(null);
	
        object.statusRef.code = ENActStatus.GOOD;
	
        object.userGen = getUserProfile().userName;
        object.dateEdit = new Date();
	
        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);
	        int actCode = objectDAO.add(object);
        //return super.add(object);

	    	if (dfDocSigners != null && dfDocSigners.length > 0) {
	    		object.code = actCode;
	    		docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), object);
				docSigningLogic.addDocWithSigners(object, dfDocSigners);
        }

	    	return actCode;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            //try {
            //    if (finConn != null && ! finConn.isClosed()) {
            //        finConn.close();
            //        finConn = null;
            //    }
            //} catch (SQLException e) {
            //}
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
        }
			} catch (SQLException e) {
			}            
    }
    }

    /*ENAct. ��������� + ���.���.*/
    @Override
	public void save(ENAct object) {
    	save(object, null);
    }

	public void save(ENAct object, DFDocSigner[] dfDocSigners)
    {
        //Connection finConn = null;
        Connection enConn = null;
        Connection docFlowConn = null;

        try
        {
            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            if (object.statusRef.code != ENActStatus.GOOD){
                throw new EnergyproSystemException("��� � ����� �������� �� ���������� !!!");
            }

            ActLogic actLogic = new ActLogic(enConn, getUserProfile());
            actLogic.checkInSCCounterByActCode(object.code, true);

        // �������� ����� �� ���� ��������� ���� ������ ������� ...
        AuthLogic l = new AuthLogic(enConn, getUserProfile());
        if ( ! l.checkPermission4PlanItemsByElement(object.element.code) )
        {
            throw new EnergyproSystemException("Acces denied for method addBy... from method save(ENAct object)");
        }

        // ��� ������ �������� ����� �� ��������������� ���� �����
        if (object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || object.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());

            if (! al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        // NET-1026 ��� �������� ���������
        if (object.actTypeRef.code == ENPlanWorkState.WRITINGS_COUNTERS)
        {
            AuthLogic al = new AuthLogic(enConn, getUserProfile());
            if (!al.checkPermission("ksoe/energynet/SCCounterController", "addCountersForWriteOff")) {
                throw new EnergyproSystemException("� ��� ���� ���� �� �� ��������!");
            }
        }

        // 28.11.2016 NET-4543 �������� ���� �� ���� �������� �� ���������
		actLogic.checkForRecyclableMaterials(object);

		// SUPP-103456 ���� ���������� ���� ����� ������ ������ ����������
		actLogic.checkDatePostings(object);

        ENActDAO objectDAO = new ENActDAO(getUserProfile(), enConn);

        // ���� ������ � ������� !!! ���� ����� � �� ;)
            Date dd = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dd);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.add(Calendar.MONTH, 1);
            Date maxDate = calendar.getTime();

        if (object.dateGen.after(maxDate)){
            throw new EnergyproSystemException("���� ���� �� ������� ������������ " + new SimpleDateFormat("dd.MM.yyyy").format(maxDate).toString(), getUserProfile());
        }

        ENAct oldAct = objectDAO.getObject(object.code);

        // �������� ���� ...
        ENPlanWorkFilter f = new ENPlanWorkFilter();
        ENPlanWorkDAO dao = new ENPlanWorkDAO(enConn, getUserProfile());

        f.stateRef.code = object.actTypeRef.code;

        if (oldAct.element.typeRef.code != ENElementType.METROLOGY_OBJECT && oldAct.element.typeRef.code != ENElementType.ROUTE_BYT){
            f.elementRef.code = oldAct.element.code;
        }

        f.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ object.code +")";
        ENPlanWorkShortList list = dao.getScrollableFilteredList(f,0,-1);

        boolean isENERGOSBYT = false;
        
        Calendar cPlan = Calendar.getInstance();
        Calendar cAct = Calendar.getInstance();
        Calendar cActDateGen = Calendar.getInstance();
        
        cAct.setTime(object.dateAct);
        cActDateGen.setTime(object.dateGen);
        
        for (int i = 0; i < list.totalCount; i++){
            if (list.get(i).dateStart.after(object.dateGen) ){
                throw new EnergyproSystemException("���� ���� �� ������ ���� ������ ���� ������, �" + list.get(i).workOrderNumber);
            }

            if (list.get(i).budgetRefCode == ENConsts.ENBUDGET_ENERGOSBYT)
            {
                isENERGOSBYT = true;
            }
            
            cPlan.setTime(list.get(i).dateStart);
            
            if (
                    (cPlan.get(Calendar.MONTH) != cAct.get(Calendar.MONTH))
                    || (cPlan.get(Calendar.YEAR) != cAct.get(Calendar.YEAR))

                    || (cPlan.get(Calendar.MONTH) != cActDateGen.get(Calendar.MONTH))
                    || (cPlan.get(Calendar.YEAR) != cActDateGen.get(Calendar.YEAR))
            )
            {
                // ��� ����� �� ������� ����� ���� ��������� ��� �� ������ - � ���� ����� ���������� ������ � ������ �������
                // (� ��� ���� ������ ���� ����)
                // if (oldAct.element.typeRef.code != ENElementType.SERVICES_OBJECT && (! isVRTU) && (! isSIT))
                if (oldAct.element.typeRef.code != ENElementType.SERVICES_OBJECT && isENERGOSBYT)
                    throw new EnergyproSystemException("г� �� ����� ���� � ����� ������ ��������� ...");
            }
            ///

        }

        /* NET-2677
        * ��� ��������� �� ���������
        * ����� ���� ������ ��������� ����������� ������ �������� � EnergyNet*/
        if(oldAct.numberGen.equals(object.numberGen) != true)
        {
            ENTechCond2PlanWorkDAO tc2pwDAO = new ENTechCond2PlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            ENTechCond2PlanWorkFilter tc2pwFilter = new ENTechCond2PlanWorkFilter();
            if(list.totalCount > 0)
            {
                tc2pwFilter.planRef.code = list.get(0).code;
                ENTechCond2PlanWorkShortList tc2pwList = tc2pwDAO.getScrollableFilteredList(tc2pwFilter, 0, -1);

                if(tc2pwList.totalCount > 0)
                {
                ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                ENTechConditionsServicesFilter tcServicesFilter = new ENTechConditionsServicesFilter();
                tcServicesFilter.code = tc2pwList.get(0).techConServicesRefCode;
                ENTechConditionsServicesShortList tcServicesList = tcServicesDAO.getScrollableFilteredListWITHOUT_SEGR(tcServicesFilter, null, null, 0, 1, null);
                    if(tcServicesList.get(0).contractNumber.equals(object.numberGen) != true)
                        throw new EnergyproSystemException("����� ���� ������� ���������� ����������� ������ ��������, ����� "+tcServicesList.get(0).contractNumber);
                }
            }

        }

    	if (object.statusRef.code == ENActStatus.GOOD) {
    		if (DocSigningLogic.isReadyForSigning(object)) {
				if (dfDocSigners != null && dfDocSigners.length > 0) {
					// NET-4596 ���� � ���� ��� �������, �� ���� ��������� �����������
					// (������ ��� �� ����, ����� ����� �������� � ���, ������� ����� ����������� -
					// ��������, ���� � ��� �������� ����� � �������� "�� - ��������� ���", ��
					// ����� ������������ ���������� "����������", ��� ����� ��� "����" � "�������" ��� ��-���)
					ENAct2ENPlanWorkDAO act2planDao = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					List<Integer> planCodes = act2planDao.getListOfPlanCodesByActCode(object.code);
					if (planCodes.size() == 0) {
						throw new SystemException("\n\nNET-4596 �������� ������� �� ���� �����-��������!");
					}
				}
	    		docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
	    		DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConn, getUserProfile(), object);
	    		docSigningLogic.createOrRemoveDocWithSigners(object, dfDocSigners);
    		}
    	}

        object.userGen = getUserProfile().userName;
        object.dateEdit = new Date();


        objectDAO.save(object);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            /*
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
            */
            try {
                if (enConn != null && ! enConn.isClosed()) {
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
	
	public void saveDFDocSigners(ENAct object) {
		saveDFDocSigners(object, null);
	}

	public void saveDFDocSigners(ENAct object, DFDocSigner[] dfDocSigners) {
		if (object == null) {
			throw new IllegalArgumentException("\n\n�� ������� ��'��� ����!");
		}

    	if (object.statusRef.code != ENActStatus.GOOD) {
    		throw new SystemException("\n\nNET-4596 �������� ����������� ������������ ���� �� �������� ����������!");
    	}

    	Connection docFlowConn = null;
    	try {
			if (DocSigningLogic.isReadyForSigning(object)) {
				if (dfDocSigners != null && dfDocSigners.length > 0) {
					// NET-4596 ���� � ���� ��� �������, �� ���� ��������� �����������
					// (������ ��� �� ����, ����� ����� �������� � ���, ������� ����� ����������� -
					// ��������, ���� � ��� �������� ����� � �������� "�� - ��������� ���", ��
					// ����� ������������ ���������� "����������", ��� ����� ��� "����" � "�������" ��� ��-���)
					ENAct2ENPlanWorkDAO act2planDao = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					List<Integer> planCodes = act2planDao.getListOfPlanCodesByActCode(object.code);
					if (planCodes.size() == 0) {
						throw new SystemException("\n\nNET-4596 �������� ������� �� ���� �����-��������!");
					}
				}
	    		docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
	    		DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConn, getUserProfile(), object);
	    		docSigningLogic.createOrRemoveDocWithSigners(object, dfDocSigners);
			} else {
				throw new SystemException("\n\nNET-4596 ��� ����� ��������� ��������� �� �� ����������! ��� ����: " + object.code);
			}
    	} catch (DatasourceConnectException e) {
    		throw new SystemException(e.getMessage(), e);
    	} catch (PersistenceException e) {
    		throw new SystemException(e.getMessage(), e);
		} finally {
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
        }
	}

  public ENActControllerEJB() {}


    public void changeDateMove(ENAct object) {
        try {

            ENActDAO objectDAO = new ENActDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;

            objectDAO.save(object);

        } catch (EnergyproSystemException e) {
            e.printStackTrace();
        } catch (DatasourceConnectException e) {
            e.printStackTrace();
        } catch (PersistenceException e) {
            e.printStackTrace();
        }
    }

    public void moveToReversed(int actCode)
    {
        Connection enConn = null;
        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ENActDAO actDAO = new ENActDAO(getUserProfile(), enConn);

            ENAct act = actDAO.getObject(actCode);

            if(act.statusRef.code != ENActStatus.CLOSED)
                throw new EnergyproSystemException(" ��� � " + act.numberGen + " �� " +
                        new SimpleDateFormat("dd.MM.yyyy").format(act.dateAct)+ " ������� ���� ����������");

            act.statusRef.code = ENActStatus.REVERSED;
            actDAO.save(act);
        } catch (DatasourceConnectException e) {
        	throw new SystemException(e);
        } catch (PersistenceException e) {
        	throw new SystemException(e);
        }
        finally
        {
            try {
                if (enConn != null && ! enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            	throw new SystemException(e);
            }
        }
    }

    public int createActForRecyclableMaterials(ENAct act)
    {
    	return createActForRecyclableMaterials(act, true);
    }

    public int createActForRecyclableMaterials(ENAct act, boolean isActEmptyException)
    {
        try
        {
        	act.element.code = ENElement.NO_OBJECT_RECYCLABLE_MATERIALS;
        	act.actTypeRef.code = ENPlanWorkState.WRITINGS_TMC;

        	// ���� ����� ������ ������� ����� (���� ���� ���� �������, �� ������� �� ����, ������� �������)
        	if(act.dateGen == null) {
            	act.dateGen = new Date();
        	}

        	if(act.dateAct == null) {
            	act.dateAct = new Date();
        	}

        	act.statusRef.code = ENActStatus.GOOD;

        	int actCode = this.add(act);

        	PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	int factCode = planLogic.createPlanForRecyclableMaterialsByAct(act);

        	planLogic.reserveMaterialsForRecyclableMaterials(factCode);

        	/////
        	try {
				Context context = new InitialContext();

				Object act2planRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
				ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
						.narrow(act2planRef, ENAct2ENPlanWorkControllerHome.class);
				ENAct2ENPlanWorkController act2planController = act2planHome.create();

				ENAct2ENPlanWork act2plan = new ENAct2ENPlanWork();
				act2plan.actRef.code = actCode;
				act2plan.plan.code = factCode;

				act2planController.add(act2plan, 0);

        	} catch (NamingException e) {
    			throw new SystemException(e.getMessage(), e);
    		} catch (RemoteException e) {
    			throw new SystemException(e.getMessage(), e);
    		} catch (CreateException e) {
    			throw new SystemException(e.getMessage(), e);
    		}
			/////

        	this.signatured(actCode);

        	///// ���� ��� ������ (��� ����������� ����������), ���������� ���
        	ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        	ENActFilter actFilter = new ENActFilter();
        	actFilter.conditionSQL =
        			"ENACT.CODE in (" +
					" select ap.actrefcode " +
					" from enact2enplanwork ap, finmaterials fm, enestimateitem ei " +
					" where ap.actrefcode = " + actCode +
					"   and ap.plancode = ei.planrefcode " +
					"   and fm.estimateitemrefcode = ei.code " +
        			")";
        	int[] actArr = actDAO.getFilteredCodeArray(actFilter, 0, -1);

        	if (actArr.length == 0)
        	{
        		if (isActEmptyException)
        		{
        			throw new SystemException("\n\nNET-4543 �� �������� �������� ��� ���������� ����!");
        		}
        		else
        		{
        			this.removeActForRecyclableMaterials(actCode);
        			return Integer.MIN_VALUE;
        		}
        	}
        	/////
        	return actCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
    		throw new SystemException(e.getMessage(), e);
		}
    }

    public void removeActForRecyclableMaterials(int actCode)
    {
        try
        {
        	System.out.println("$$$ BEGIN ACT REMOVING: " + actCode + " $$$");

        	// �������� ���������� ����
        	this.unSignatured(actCode);
        	System.out.println("$$$ unSignatured (actCode: " + actCode + ") $$$");

        	/////
        	try {
				Context context = new InitialContext();

				Object act2planRef = context.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
				ENAct2ENPlanWorkControllerHome act2planHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
						.narrow(act2planRef, ENAct2ENPlanWorkControllerHome.class);
				ENAct2ENPlanWorkController act2planController = act2planHome.create();

				Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
				ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
						.narrow(planRef, ENPlanWorkControllerHome.class);
				ENPlanWorkController planController = planHome.create();

		        Object finMaterialsRef = context.lookup(FINMaterialsController.JNDI_NAME);
		        FINMaterialsControllerHome finMaterialsHome = (FINMaterialsControllerHome) PortableRemoteObject.
		        		narrow(finMaterialsRef, FINMaterialsControllerHome.class);
		        FINMaterialsController finMaterialsController = finMaterialsHome.create();

				ENPlanCorrectHistoryDAO pchDAO = new ENPlanCorrectHistoryDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				FINMaterialsDAO finMaterialsDAO = new FINMaterialsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
				act2planFilter.actRef.code = actCode;

				ENAct2ENPlanWorkShortList act2planList = act2planController.getScrollableFilteredList(act2planFilter, 0, -1);

				for (int i = 0; i < act2planList.totalCount; i++)
				{
					int factCode = act2planList.get(i).planCode;

					ENPlanCorrectHistoryFilter pchFilter = new ENPlanCorrectHistoryFilter();
					pchFilter.reason.code = ENPlanCorrectReason.MOVE_TO_FACT;
					pchFilter.planNewRef.code = factCode;

					ENPlanCorrectHistoryShortList pchList = pchDAO.getScrollableFilteredList(pchFilter, 0, -1);

					int npzCode = Integer.MIN_VALUE;

					if (pchList.totalCount > 0)
					{
						npzCode = pchList.get(0).planOldRefCode;
					}

					// ������� ����� �� ����
					act2planController.remove(act2planList.get(i).code, 0);
					System.out.println("$$$ act2planController.remove (actCode: " + actCode + ") $$$");

					// ������� ����������� ��������� �� �������-�����
					FINMaterialsFilter finMaterialsFilter = new FINMaterialsFilter();
					finMaterialsFilter.conditionSQL =
							" code in " +
							" ( " +
							"   select fm.code " +
							"   from enestimateitem ei, finmaterials fm " +
							"   where ei.planrefcode = " + factCode +
							"     and fm.estimateitemrefcode = ei.code " +
							"     and fm.statusrefcode = " + FINMaterialsStatus.GOOD +
							"     and ei.kindrefcode = " + ENEstimateItemKind.MATERIALS +
							" ) ";
					int[] finMaterialsArr = finMaterialsDAO.getFilteredCodeArray(finMaterialsFilter, 0, -1);

					for (int j = 0; j < finMaterialsArr.length; j++)
					{
						finMaterialsController.removeMaterials(finMaterialsArr[j]);
					}

					// ������� �������-����
					planController.openPlanWork(factCode);
					System.out.println("$$$ openPlanWork (factCode: " + factCode + ") $$$");

					// ������� �������-����
					planController.openPlanWork(npzCode);
					System.out.println("$$$ openPlanWork (npzCode: " + npzCode + ") $$$");
				}

	        	// ������� ���
	        	this.remove(actCode);
	        	System.out.println("$$$ remove (actCode: " + actCode + ") $$$");

        	} catch (NamingException e) {
    			throw new SystemException(e.getMessage(), e);
    		} catch (RemoteException e) {
    			throw new SystemException(e.getMessage(), e);
    		} catch (CreateException e) {
    			throw new SystemException(e.getMessage(), e);
    		} catch (PersistenceException e) {
        		throw new SystemException(e.getMessage(), e);
			}
			/////

        	System.out.println("$$$ END ACT REMOVING: " + actCode + " $$$");

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        }
    }
    
    public FKProvObjectShortList getPostingsList(int actCode, boolean isMaterials)
    {
        FKProvObjectShortList result = new FKProvObjectShortList();
        
		List<Integer> partIds = new Vector<Integer>();

        Connection finConn = null;

        try
        {
            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
        	if(!isMaterials) {
        		// ��������
                ENAct2ProvFilter act2ProvFilter = new ENAct2ProvFilter();
                act2ProvFilter.actRef.code = actCode;
                ENAct2ProvDAO act2ProvDAO= new ENAct2ProvDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                ENAct2ProvShortList act2pList = act2ProvDAO.getScrollableFilteredList(act2ProvFilter, 0, -1);

                if (act2pList.totalCount == 0)
                {
                    return result;
                }

                if (act2pList.totalCount > 1)
                {
                    throw new EnergyproSystemException("�������� ������� (" + act2pList.totalCount + ") ����� �������� ��� ����� ����!");
                }

                //enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
                int partId = act2pList.get(0).partId;
                if (partId == Integer.MIN_VALUE) {
                    throw new EnergyproSystemException("³������ ��� ����� �������� ��� ����� ����!");
                }
                
                partIds.add(partId);       		
        	} else {
        		// ���� ���������
        		FKLogic2 fkLogic = new FKLogic2(finConn, getUserProfile());
        		FINDoc2MolDataDAO finDocDao = new FINDoc2MolDataDAO(getUserProfile()
        				, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        		FINDoc2MolDataShortList finDocList = finDocDao.getListByActCode(actCode);
        		for(FINDoc2MolDataShort finDoc : finDocList.list) {
        			Integer partId = fkLogic.getPartIdByTheadId(finDoc.finDocCode);
        			if(partId != null)partIds.add(partId);
        		}        	
        	}
        	
    		FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
    		for(int partId : partIds) {
    			result.list.addAll(fpLogic.getProvListFromFin(partId).list);
    		}
    		result.totalCount = (result.list == null) ? 0 : result.list.size();
    		
    		return result;
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("��� ����� � �� ���.��������� ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
    
    /**
     * 
     * ������������ ��� ������ �������� "��������� � �����������"
     * 
     * @param actCode ��� ���������� ���� ������ {@link ENAct}
     * @param isChecked true - ������������ ��������, false - ������ �������� 
     */
    public void checkOrUncheckByAccountant(int actCode, boolean isChecked) {
        try {

     	   ENActDAO dao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

     	   ENAct act = dao.getObject(actCode);

     	   // �������� �������
     	   dao.checkENActStatuses(act, true, true, ENActStatus.CLOSED);
     	   
     	   if(act.checkedByAccountant == null || act.checkedByAccountant == false) {
     		   if(!isChecked) {
     			   throw new SystemException(String.format("������ \"��������� � ���������\" ��� ����� ��� ���� � %s �� %s!"
     					   , act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
     		   }    		   
     	   } else {
     		   if(isChecked) {
     			   throw new SystemException(String.format("��� � %s �� %s ��� �������� � ���������!"
     					   , act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
     		   }
     	   }

     	   // ���������� ������ �������
     	   act.checkedByAccountant = isChecked;

     	   dao.save(act);


        } catch (EnergyproSystemException e) {
     	   throw new SystemException(e);
        } catch (DatasourceConnectException e) {
            throw new SystemException(e);
        } catch (PersistenceException e) {
            throw new SystemException(e);
    }
    }

    public EPReportRequestEx[] getReportsListForENAct(ENAct act) {
 		try {
 			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
 			return reportPrintingLogic.getReportsListForENAct(act);
 		} catch (DatasourceConnectException e) {
 			throw new SystemException("Can't getReportsListForENAct", e);
 		} finally {
 			closeConnection();
 		}
    }

    /**
     * 
     * ���������, ��� ��� ������ � ��������� ������������� � ���� ��, ��
     * ������������� ��� ���. ��������� �� ������ �������������
     * 
     * @param act
     * @throws DatasourceConnectException 
     * @throws PersistenceException 
     */
    private void calculateENSOValuesTermsForConnectionIfNeeded(ENAct act) throws DatasourceConnectException, PersistenceException {
    	if(!ENConsts.ACT_TYPES_FOR_CALCULATION_OF_CONNECTION_WORK_TERM.contains(act.actTypeRef.code)) return;
    	ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile()
    			, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	ENAct2ENPlanWorkDAO act2PlanDao = new ENAct2ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		
		Collection<Integer> excludedDDSCodes = settingsLogic.getVectorWithIntValues(ENSettingsKeysConsts.DDS_CODES_TO_EXCLUDE_FROM_CONNECTION_FINISH_WORKS);
		
    	List<Integer> planCodes = act2PlanDao.getListOfPlanCodesByActCode(act.code);
    	
		// ���� ��������� � ������� ��� ����������� ������������ ���� ��� �� ������ ������������ � ������� ����������� ���� ����������� �����.
		boolean isExcludedByDds = false;
		if(excludedDDSCodes.size() > 0) {
			
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.conditionSQL = String.format("%s in (%s)", ENPlanWork.code_QFielld, Tools.repeatSymbol("?", ",", planCodes.size()));
			planFilter.conditionSQL += String.format(" AND %s in (%s)", ENPlanWork.ddsCodes_QFielld, Tools.repeatSymbol("?", ",", excludedDDSCodes.size()));
			
			Vector<Integer> params = new Vector<Integer>();
			params.addAll(planCodes);
			params.addAll(excludedDDSCodes);
			
			isExcludedByDds = planDao.getScrollableFilteredList(planFilter, 0, -1, params).totalCount > 0;
		}
		
		if(isExcludedByDds) {
			return;
		}

    	
    	ENServicesObject servicesObject = servicesObjectDao.getObjectByENAct(act);
    	if(servicesObject != null) {
    		servicesLogic.calculateENSOValuesTermsIfNeeded(servicesObject);
    		return;
    	}
    	
    	for(int planCode : planCodes) {
    		ENPlanWork plan = new ENPlanWork();
    		plan.code = planCode;
    		ENTechConditionsServices techCond = techCondDao.getENTechConditionsServicesByPlan(plan);
    		if(techCond != null) {
    			servicesObject = servicesObjectDao.getObjectByTechConditionsServices(techCond);
    			servicesLogic.calculateENSOValuesTermsIfNeeded(servicesObject);
    		}
    	}
    	
    }

} // end of EJB Controller for ENAct