
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENWorkOrderByt;
 *
 */

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.ejb.SMSInformController;
import com.ksoe.callcenter.ejb.SMSInformControllerHome;
import com.ksoe.callcenter.valueobject.SMSInform;
import com.ksoe.callcenter.valueobject.SMSInformOperator;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanInformCustomerDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCSeal2ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.generated.ENWorkOrderBytControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.util.CCIdentifierEjbCache;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanInformCustomer;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanInformCustomerFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanInformCustomerShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKClassificationType;

public class ENWorkOrderBytControllerEJB extends
		ENWorkOrderBytControllerEJBGen {

	public ENWorkOrderBytControllerEJB() {
	}

	/* ENWorkOrderByt. �������� */
	@Override
	public int add(ENWorkOrderByt object) {
		int workOrderBytCode = Integer.MIN_VALUE;

		try {
			object.statusRef.code = ENWorkOrderBytStatus.DRAFT;

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			workOrderBytCode = workOrderLogic.addWorkOrderByt(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.", e);
		}

		return workOrderBytCode;
	}


	/* ENWorkOrderByt. �������� �� �������� (��� �������� ������) */
	public int addForRaid(ENWorkOrderByt object)
	{
		object.typeRef.code = ENWorkOrderBytType.RAID_BY_BILLING;

		return add(object);
	}

	/* ENWorkOrderByt. �������� �� �������� (��� ������ ���������) */
	public int addForControl(ENWorkOrderByt object)
	{
		object.typeRef.code = ENWorkOrderBytType.CONTROL;

		return add(object);
	}

   	/* ENWorkOrderByt. �������� */
	@Override
	public void save(ENWorkOrderByt object)
	{
	   Connection finConn = null;
	   Connection enConn = null;

	   try
	   {
		   /////
		   AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		   FinConnectionData finConnectionData = l.getFinConnectionData();
		   /////

		   //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		   finConn = getConnection(finConnectionData.connectionString);
		   enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	       if (object.finWorker != null){
	    	 if (object.finWorker.tabNumber != null) {

	    		 //�������� �������� �� ������ ���������
	    		HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
	    		FINLogic fLogicFin = new FINLogic(finConn ,getUserProfile());
	    		//FINLogic fLogicNet = new FINLogic(enConn,getUserProfile());


	    		FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(),enConn);
	    		FINWorker w = new FINWorker();

	    		if  (object.finWorker.code > Integer.MIN_VALUE){
	    			w = wDAO.getObject(object.finWorker.code);
	    		}
	    		w.code = object.finWorker.code;
	    		w.name = object.finWorker.name;
	    		w.tabNumber = object.finWorker.tabNumber;
	    		w.positionCode = object.finWorker.positionCode;
	    		w.positionName = object.finWorker.positionName;
	    		w.departmentCode = object.finWorker.departmentCode;
	    		w.departmentName = object.finWorker.departmentName;
	    		w.priceGen = object.finWorker.priceGen;
	    		w.categor = object.finWorker.categor;
	    		w.finCode = object.finWorker.finCode;
	    		///// 07.12.11 ������� ������� "���������������" ������, ������ ��� � ��� ����������� �������������� �/�
	    		//w.isSentAssignment = object.finWorker.isSentAssignment;
	    		w.isSentAssignment = 0;
	    		/////
	    		w.kindRef.code = object.finWorker.kindRef.code;
                // MDAX-441
                w.positionId = object.finWorker.positionId;

	    		// ���� ������� ����� ����������� � ��������� ������� ���������� �� ����������� FINCHARGEHISTORY � ��� ���������� FINChargeType = 2
	    		// ����� ������� ���������� ����� ����� �� ����������� �� ������ ��� ������� ����������  FINChargeType = 1
	    		if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber, object.dateGen) > 0)
	    		{
	                // ���� �������
	    	        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID, object.dateGen);
	    	        w.chargeRef.code = FINChargeType.IS_INVALID;
	    		}
	    		else
	    		{   // ���� �� �������
	    			w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, object.dateGen);
	    			w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
	    		}

	    		object.finWorker.code = wDAO.add(w);

	    		/*
	    		if  (object.finWorker.code == Integer.MIN_VALUE){
	    			object.finWorker.code = wDAO.add(w);
	    		}
	    		else
	    		{
	    			wDAO.save(w);
	    		} */

	    	   }
		     }

		    super.save(object);

	   }
	   catch (DatasourceConnectException e)
	   {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.", e);
	   }
	   catch (PersistenceException e)
	   {
			throw new SystemException(e.getMessage(), e);
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
	   }
	}

	@Override
	public void remove(int code)
	{
		remove(code, false);
	}

	public void removeForRaid(int code)
	{
		remove(code, true);
	}

	public void removeForControl(int code)
	{
		remove(code, true);
	}

	public void remove(int code, boolean isFromBilling)
	{
		try
		{
    		ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(code);

    		if (workOrderByt == null)
    		{
    			throw new SystemException("\n\nNET-4350 �� �������� ����� ��������! ��� = " + code);
    		}

			if (workOrderByt.typeRef.code == ENWorkOrderBytType.RAID_BY_BILLING && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 �� �������� ���� ���������� � �����! ��������� ������� ����� ���� � �����!");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 ������������ ��� ������� ��������! ��� ��������: " + code +
						", ��� ����: " + workOrderByt.typeRef.code);
			}

			///// ��������, ���� �� � ������� ������. ���� ���� - ������� ������������ ����� (����� �� �������� �� foreign'�)
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = code;

			int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			if (workOrderBytItemArr.length > 0)
			{
				throw new SystemException("\n\nNET-4350 ��� ��������� ����� ������� �������� �������� ������� ������ � �����!");
			}
			/////

			super.remove(code);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.",
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

	public void removeBadRaid(int code) {
		try {
    		ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(code);

    		if (workOrderByt == null) {
    			throw new SystemException("\n\nNET-4350 �� �������� ����� ��������! ��� = " + code);
    		}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING) {
				throw new SystemException("\n\nNET-4431 ������������ ��� ������� ��������! ��� ��������: " + code +
						", ��� ����: " + workOrderByt.typeRef.code);
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.DRAFT) {
				throw new SystemException("\n\n�������� ������������ ����� ������ ���� ��������! ��� ��������: " + code);
			}

			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = code;
			int[] workOrderBytItemCodes = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			for (int workOrderBytItemCode : workOrderBytItemCodes) {
				workOrderBytItemDAO.remove(workOrderBytItemCode);
			}

			super.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public ENWorkOrderBytShortList getScrollableFilteredListForRaid(ENWorkOrderBytFilter filterObject, int fromPosition, int quantity)
	{
		return getScrollableFilteredList(filterObject, fromPosition, quantity);
	}

	public ENWorkOrderByt getObjectForRaid(int code)
	{
		return getObject(code);
	}

	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode)
	{
		addSeals(workOrderBytCode, seals, accountingTypeCode, false);
	}

	/**
	 * �������� ����� � �������� ������� (�� �����)
	 *
	 * @param workOrderBytCode - ��� �������� �������
	 * @param seals - ������ � ��������
	 * @param accountingTypeCode - ��� ����� (������/���/����������)
	 * @param noBindingToPlans - ����������� �� ������ � ���������� ������ (true - �� �����������, false - �����������)
	 */
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 �������� ��� ��'����!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ������ �����!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ��� �����!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " �� ������������� ��� ���� �������� ��� (" +
						workOrderByt.typeRef.code + ") !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi, " +
				    "     enworkorderbytitem wbi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and wbi.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
				    "     and ei.countfact > 0 " +
				    //"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.accountingtyperefcode = " + accountingTypeCode +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// ���� � ����� ������ ������ �� �����, ����� ������� �� "�������� �����"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 � ����� ������� ������� ���� ����, � ���� ���������������� ������!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
						//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					// ��������, ����� ���� ��� �� ����������� � ���� (������ ���, ���� ����� ���� ��������� � ���� �� ����,
					// ��� � ������� ������� � ���� �������� ������, �� �� ����� ������ ��� ����� �� ��������)
					//if (estimateItem.planRef.code != planCode) // ����� �� ������� ���� ������ ���
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 �� �������� ���� � ����� " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 ���� � ����� " + plan.code + " �� � �������� ���������-������!\n" +
				        			"��� ����'���� ����� �� ����� ��������� ����� �������� � ������ \"��������\"!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemArr[i] +
						    " )";
					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ����� ������� �������� � ��������!");
					}

					//for (int j = 1; j <= estimateItemCount; j++)
					for (int j = 1; j <= estimateItemCount4Binding; j++)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
							//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
							return;
						}

						ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

						System.out.println("estimateItem " + estimateItemArr[i] + " - " +
								"seal " + tmpSeal.buildNumber);

						SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

						// ��������, ����� �������� ���, � �������� �� ����������� ������, � ���, ������� � ��� � �����-������� �� �����
						String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
						if (! seal.molCode.equals(finMolCode))
						{
							throw new SystemException("\n\nNET-4530 ���, � ��� ������������ ������ (" + seal.molCode +
									"), �� ������� � ��� �� �����-������� � ���� (" + finMolCode + ") !");
						}

						seal.estimateItemRef.code = estimateItemArr[i];

						int sealCode = sealDAO.add(seal);

						/* ����� ��������� ������ ������ � ������ ������� ������� � ���������� (� �� ���� ������ � ����� �������
						 * ����� ������� �������� �������� ��� ������������� ����� �� �����)
						for (int w = 0; w < workOrderBytItemArr.length; w++)
						{
							SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
							seal2workOrderByt.sealRef.code = sealCode;
							seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
							seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
							seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2workOrderBytDAO.add(seal2workOrderByt);
						}
						*/
						SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
						seal2workOrderByt.sealRef.code = sealCode;
						seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
						seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
						seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
						seal2workOrderBytDAO.add(seal2workOrderByt);

						// � ������, ���� � ��� ��������� ����� �������, ����� ����� ������ � ������!
						ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

						if (workOrderBytItem == null)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ������ ������� �������� � ����� " + workOrderBytItemArr[0] + " !");
						}

						if (workOrderBytItem.finWorker == null)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������ ������� �������� � ����� " + workOrderBytItemArr[0] + " !");
						}

						// ����� ������ � ScanCounters
						scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
										 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
										 ENMetrologyCounter.BILLING_LOCK /* ?? */);

						sealsByPlansCount = sealsArrIndex;
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// ������� ����� (�.�. ��, ��� ������ ������ �����������)
			// ����� ��������� ��� ��� ������� ������� (��� ������ �� ���������� workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 �������� ������ ��������, ����� ������ ��������� � ��������� �� ������ ������� � ������ �������
				// (���� � ������ 2 ������� � ������� �������� ��������� �������, �� � ����� � ��� �� ������ - ��. SUPP-49304).
				// � ���� ������ �� �� ������ ������ ��������� � ���� ������ (��� ������ �� � ��������������, �������������?).
				// �����, �� ����� ������ ����� ������!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 ��� \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "��� ������������� ������ � ������ ������� ������� � " + workOrderBytOther.numberGen + " �� " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (���: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������� �������� � ����� " + workOrderBytCode + " !");
					}

					// ����� ������ � ScanCounters. ������ �� ����������� ����� � ������ �������, � �� �� ������,
					// �.�. ��� � ��� ��� ��� �������� � ���������� ������
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSeals", e);
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

	/**
	 * �������� ����� � �������� ������� ��� �������� ������� (�� �����)
	 *
	 * @param workOrderBytCode - ��� �������� �������
	 * @param seals - ������ � ��������
	 * @param accountingTypeCode - ��� ����� (������/���/����������)
	 * @param noBindingToPlans - ����������� �� ������ � ���������� ������ (true - �� �����������, false - �����������)
	 */
	public void addSealsForRaid(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 �������� ��� ��'����!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ������ �����!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ��� �����!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " �� ������������� ��� ���� �������� ��� (" +
						workOrderByt.typeRef.code + ") !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi, " +
				    "     enworkorderbytitem wbi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and wbi.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
				    "     and ei.countfact > 0 " +
				    //"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.accountingtyperefcode = " + accountingTypeCode +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// ���� � ����� ������ ������ �� �����, ����� ������� �� "�������� �����"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 � ����� ������� ������� ���� ����, � ���� ���������������� ������!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
						//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					// ��������, ����� ���� ��� �� ����������� � ���� (������ ���, ���� ����� ���� ��������� � ���� �� ����,
					// ��� � ������� ������� � ���� �������� ������, �� �� ����� ������ ��� ����� �� ��������)
					//if (estimateItem.planRef.code != planCode) // ����� �� ������� ���� ������ ���
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 �� �������� ���� � ����� " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 ���� � ����� " + plan.code + " �� � �������� ���������-������!\n" +
				        			"��� ����'���� ����� �� ����� ��������� ����� �������� � ������ \"��������\"!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemArr[i] +
						    " )";
					workOrderBytItemFilter.orderBySQL = "customername";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ����� ������� �������� � ��������!");
					}

					int j = 1;

					//for (int j = 1; j <= estimateItemCount4Binding; j++)
					//while (j <= estimateItemCount4Binding)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
							//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
							return;
						}

						String tmpCustomerNumber = "";

						for (int w = 0; w < workOrderBytItemArr.length && j <= estimateItemCount4Binding; w++)
						{
							ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[w]);

							if (workOrderBytItem == null)
							{
								throw new SystemException("\n\nNET-4530 �� �������� ������ ������� �������� � ����� " + workOrderBytItemArr[w] + " !");
							}

							if (! workOrderBytItem.customerName.equals(tmpCustomerNumber))
							{
								tmpCustomerNumber = workOrderBytItem.customerName;
							}
							else
							{
								continue;
							}

							///// ���� � ������� ������ �������� ������� ��� ��������� ���������� �����, ����� �� ����������
							SCSeal2ENWorkOrderBytFilter seal2WorkOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
							seal2WorkOrderBytFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2WorkOrderBytFilter.workOrderBytItemRef.code = workOrderBytItemArr[w];

							int[] seal2WorkOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2WorkOrderBytFilter, 0, -1);

							int countByTechCard = estimateLogic.getEstimateCountByTechCard(estimateItemArr[i]).intValue();
							int count4Binding = countByTechCard - seal2WorkOrderBytArr.length;

							if (count4Binding <= 0)
							{
								continue;
							}
							/////

							//for (int c = 1; c <= countByTechCard; c++)
							for (int c = 1; c <= count4Binding; c++)
							{
								if (sealsArrIndex > seals.length - 1)
								{
									// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
									//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
									return;
								}

								ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

								System.out.println("estimateItem " + estimateItemArr[i] + " - " +
										"seal " + tmpSeal.buildNumber);

								SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

								// ��������, ����� �������� ���, � �������� �� ����������� ������, � ���, ������� � ��� � �����-������� �� �����
								String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
								if (! seal.molCode.equals(finMolCode))
								{
									throw new SystemException("\n\nNET-4530 ���, � ��� ������������ ������ (" + seal.molCode +
											"), �� ������� � ��� �� �����-������� � ���� (" + finMolCode + ") !");
								}

								seal.estimateItemRef.code = estimateItemArr[i];

								int sealCode = sealDAO.add(seal);

								SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
								seal2workOrderByt.sealRef.code = sealCode;
								seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
								seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
								seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
								seal2workOrderBytDAO.add(seal2workOrderByt);

								if (workOrderBytItem.finWorker == null)
								{
									throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������ ������� �������� � ����� " + workOrderBytItemArr[w] + " !");
								}

								// ����� ������ � ScanCounters
								scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
												 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
												 ENMetrologyCounter.BILLING_LOCK /* ?? */);

								sealsByPlansCount = sealsArrIndex;

								j++;
							}
						}

					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// ������� ����� (�.�. ��, ��� ������ ������ �����������)
			// ����� ��������� ��� ��� ������� ������� (��� ������ �� ���������� workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 �������� ������ ��������, ����� ������ ��������� � ��������� �� ������ ������� � ������ �������
				// (���� � ������ 2 ������� � ������� �������� ��������� �������, �� � ����� � ��� �� ������ - ��. SUPP-49304).
				// � ���� ������ �� �� ������ ������ ��������� � ���� ������ (��� ������ �� � ��������������, �������������?).
				// �����, �� ����� ������ ����� ������!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 ��� \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "��� ������������� ������ � ������ ������� ������� � " + workOrderBytOther.numberGen + " �� " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (���: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������� �������� � ����� " + workOrderBytCode + " !");
					}

					// ����� ������ � ScanCounters. ������ �� ����������� ����� � ������ �������, � �� �� ������,
					// �.�. ��� � ��� ��� ��� �������� � ���������� ������
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsForRaid", e);
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

	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode)
	{
		addSealsByFact(workOrderBytCode, seals, accountingTypeCode, false);
	}

	/**
	 * �������� ����� � �������� ������� (�� �����)
	 *
	 * @param workOrderBytCode - ��� �������� �������
	 * @param seals - ������ � ��������
	 * @param accountingTypeCode - ��� ����� (������/���/����������)
	 * @param noBindingToPlans - ����������� �� ������ � ���������� ������ (true - �� �����������, false - �����������)
	 */
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 �������� ��� ��'����!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ������ �����!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ��� �����!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " �� ������������� ��� ���� �������� ��� (" +
						workOrderByt.typeRef.code + ") !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();

			// 08.07.16 ��������� ��������, ����� ������ � �������� ��������� ��� � �������-����
			// (��� ����� ������ �������� ������ � ������ � �������-�����)
			/*
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei1.code " +
					"   from " +
					"     enestimateitem ei, enestimateitem ei1, " +
					"     enestimateitem2nstmttm ei2ei, " +
					"     enplanworkitem pi, " +
					"     enworkorderbytitem wbi, " +
					"     enplanwork p " +
					"   where ei.planitemrefcode = pi.code " +
					"     and ei.materialrefcode = ei1.materialrefcode " +
					"     and ei2ei.estimateiteminrefcode = ei.code " +
					"     and ei2ei.estimateitemoutrefcode = ei1.code " +
					"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
					"     and ei1.planrefcode = p.code and p.statuscode = " + ENPlanWorkStatus.GOOD +
					"     and wbi.planitemrefcode = pi.code " +
					"     and pi.countgen > 0 " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0 " +
					"     and ei1.countfact > 0 " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					//"     and ei1.accountingtyperefcode = " + accountingTypeCode +
					" ) ";
			*/
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei.code " +
					"   from " +
					"      ENWORKORDERBYTITEM wbi, " +
					"      enestimateitem ei, " +
					"      enplanwork plan, " +
					"      enplanwork fact, " +
					"      enplancorrecthistory ch " +
					"  where " +
					"      ei.planrefcode = fact.code " +
					"      and wbi.planrefcode = plan.code " +
					"      and plan.code = ch.planoldrefcode " +
					"      and fact.code = ch.plannewrefcode " +
					"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
					"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"      and wbi.workorderbytrefcode = " + workOrderBytCode +
					"      and ei.countfact > 0 " +
					"      and ei.accountingtyperefcode = " + accountingTypeCode +
					" ) ";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// ���� � ����� ������ ������ �� �����, ����� ������� �� "�������� �����"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 � ����� ������� ������� ���� ���� (� ���������-������), � ���� ���������������� ������!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
						//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					//if (estimateItem.planRef.code != planCode) // ����� �� ������� ���� ������ ���
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 �� �������� ���� � ����� " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 ����'������� ������ �� ����� ������������ ����� �� �������� ���������-������!\n" +
				        			"���� � ����� " + plan.code + " �� � �������� ���������-������!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					// ��� �������� ���� �������� 2 lockTyp'�, ������ ���, ���� �����-�� ������ ��������� � ��������,
					// �� lockType ��������� �� SCSealLockType.FOR_FACT
					//sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;
					sealFilter.conditionSQL = "locktyperefcode in (" + SCSealLockType.FOR_WORKORDERBYT + ", " + SCSealLockType.FOR_FACT + ")";

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"     enestimateitem ei, enestimateitem ei1, " +
							"     enestimateitem2nstmttm ei2ei, " +
							"     enplanworkitem pi, " +
							"     enworkorderbytitem wbi " +
							"   where ei.planitemrefcode = pi.code " +
							"     and ei.materialrefcode = ei1.materialrefcode " +
							"     and ei2ei.estimateiteminrefcode = ei.code " +
							"     and ei2ei.estimateitemoutrefcode = ei1.code " +
							"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
							"     and wbi.planitemrefcode = pi.code " +
							"     and wbi.workorderbytrefcode = " + workOrderBytCode +
							"     and ei1.code = " + estimateItemArr[i] +
							" )";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						// ���� �� ����� �� ������ ����������, ������, ������ ���� ��������� ��� �� �������-����,
						// � ����� ������ ��-�������
						workOrderBytItemFilter.conditionSQL =
								" code in ( " +
								"   select wbi.code " +
								"   from " +
								"      ENWORKORDERBYTITEM wbi, " +
								"      enestimateitem ei, " +
								"      enplanwork plan, " +
								"      enplanwork fact, " +
								"      enplancorrecthistory ch " +
								"  where " +
								"      ei.code = " + estimateItemArr[i] +
								"      and ei.planrefcode = fact.code " +
								"      and wbi.planrefcode = plan.code " +
								"      and plan.code = ch.planoldrefcode " +
								"      and fact.code = ch.plannewrefcode " +
								"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
								"      and fact.code = " + plan.code +
								"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
								"      and wbi.workorderbytrefcode = " + workOrderBytCode +
								"      and ei.countfact > 0 " +
								"      and ei.accountingtyperefcode = " + accountingTypeCode +
								" )";

						workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

						if (workOrderBytItemArr.length == 0)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ����� ������� �������� � ��������!");
						}
					}

					//for (int j = 1; j <= estimateItemCount; j++)
					for (int j = 1; j <= estimateItemCount4Binding; j++)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
							//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
							return;
						}

						ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

						System.out.println("estimateItem " + estimateItemArr[i] + " - " +
								"seal " + tmpSeal.buildNumber);

						SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

						// ��������, ����� �������� ���, � �������� �� ����������� ������, � ���, ������� � ��� � �����-������� �� �����
						String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
						if (! seal.molCode.equals(finMolCode))
						{
							throw new SystemException("\n\nNET-4530 ���, � ��� ������������ ������ (" + seal.molCode +
									"), �� ������� � ��� �� �����-������� � ���� (" + finMolCode + ") !");
						}

						scLogic.checkSealLastMovementDateWithPlanDate(seal, plan);

						seal.estimateItemRef.code = estimateItemArr[i];



						int sealCode = sealDAO.add(seal);

						/* ����� ��������� ������ ������ � ������ ������� ������� � ���������� (� �� ���� ������ � ����� �������
						 * ����� ������� �������� �������� ��� ������������� ����� �� �����)
						for (int w = 0; w < workOrderBytItemArr.length; w++)
						{
							SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
							seal2workOrderByt.sealRef.code = sealCode;
							seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
							seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
							seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2workOrderBytDAO.add(seal2workOrderByt);
						}
						*/
						SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
						seal2workOrderByt.sealRef.code = sealCode;
						seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
						seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
						seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
						seal2workOrderBytDAO.add(seal2workOrderByt);

						// � ������, ���� � ��� ��������� ����� �������, ����� ����� ������ � ������!
						ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

						if (workOrderBytItem == null)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ������ ������� �������� � ����� " + workOrderBytItemArr[0] + " !");
						}

						if (workOrderBytItem.finWorker == null)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������ ������� �������� � ����� " + workOrderBytItemArr[0] + " !");
						}

						// ����� ������ � ScanCounters
						scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
										 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
										 ENMetrologyCounter.BILLING_LOCK /* ?? */);

						sealsByPlansCount = sealsArrIndex;
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// ������� ����� (�.�. ��, ��� ������ ������ �����������)
			// ����� ��������� ��� ��� ������� ������� (��� ������ �� ���������� workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 �������� ������ ��������, ����� ������ ��������� � ��������� �� ������ ������� � ������ �������
				// (���� � ������ 2 ������� � ������� �������� ��������� �������, �� � ����� � ��� �� ������ - ��. SUPP-49304).
				// � ���� ������ �� �� ������ ������ ��������� � ���� ������ (��� ������ �� � ��������������, �������������?).
				// �����, �� ����� ������ ����� ������!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 ��� \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "��� ������������� ������ � ������ ������� ������� � " + workOrderBytOther.numberGen + " �� " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (���: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������� �������� � ����� " + workOrderBytCode + " !");
					}

					// ����� ������ � ScanCounters. ������ �� ����������� ����� � ������ �������, � �� �� ������,
					// �.�. ��� � ��� ��� ��� �������� � ���������� ������
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsByFact", e);
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

	/**
	 * �������� ����� � �������� ������� ��� �������� ������� (�� �����)
	 *
	 * @param workOrderBytCode - ��� �������� �������
	 * @param seals - ������ � ��������
	 * @param accountingTypeCode - ��� ����� (������/���/����������)
	 * @param noBindingToPlans - ����������� �� ������ � ���������� ������ (true - �� �����������, false - �����������)
	 */
	public void addSealsForRaidByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 �������� ��� ��'����!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ������ �����!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 �� ������� ��� �����!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " �� ������������� ��� ���� �������� ��� (" +
						workOrderByt.typeRef.code + ") !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();

			// 08.07.16 ��������� ��������, ����� ������ � �������� ��������� ��� � �������-����
			// (��� ����� ������ �������� ������ � ������ � �������-�����)
			/*
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei1.code " +
					"   from " +
					"     enestimateitem ei, enestimateitem ei1, " +
					"     enestimateitem2nstmttm ei2ei, " +
					"     enplanworkitem pi, " +
					"     enworkorderbytitem wbi, " +
					"     enplanwork p " +
					"   where ei.planitemrefcode = pi.code " +
					"     and ei.materialrefcode = ei1.materialrefcode " +
					"     and ei2ei.estimateiteminrefcode = ei.code " +
					"     and ei2ei.estimateitemoutrefcode = ei1.code " +
					"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
					"     and ei1.planrefcode = p.code and p.statuscode = " + ENPlanWorkStatus.GOOD +
					"     and wbi.planitemrefcode = pi.code " +
					"     and pi.countgen > 0 " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0 " +
					"     and ei1.countfact > 0 " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					//"     and ei1.accountingtyperefcode = " + accountingTypeCode +
					" ) ";
			*/
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei.code " +
					"   from " +
					"      ENWORKORDERBYTITEM wbi, " +
					"      enestimateitem ei, " +
					"      enplanwork plan, " +
					"      enplanwork fact, " +
					"      enplancorrecthistory ch " +
					"  where " +
					"      ei.planrefcode = fact.code " +
					"      and wbi.planrefcode = plan.code " +
					"      and plan.code = ch.planoldrefcode " +
					"      and fact.code = ch.plannewrefcode " +
					"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
					"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"      and wbi.workorderbytrefcode = " + workOrderBytCode +
					"      and ei.countfact > 0 " +
					"      and ei.accountingtyperefcode = " + accountingTypeCode +
					" ) ";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// ���� � ����� ������ ������ �� �����, ����� ������� �� "�������� �����"!!!
			if (estimateItemArr.length == 0)
			{
				// 27.09.2017 �������� ������, ����� ��� ����� ��� ���������� (�.�. ���� ���������),
				// � ��� ���� �������� ��������� ������ (��� �� ������, ��� � ������, �� �������� 
				// ��� �������-�����, � �� ������ ��������)
				estimateItemFilter.conditionSQL =
						" code in ( " +
						"   select distinct ei.code " +
						"   from " +
						"      ENWORKORDERBYTITEM wbi, " +
						"      enestimateitem ei, " +
						"      enplanwork plan, " +
						"      enplanwork fact, " +
						"      enplancorrecthistory ch " +
						"  where " +
						"      ei.planrefcode = fact.code " +
						"      and wbi.planrefcode = plan.code " +
						"      and plan.code = ch.planoldrefcode " +
						"      and fact.code = ch.plannewrefcode " +
						// ����� �������� ��� �������-�����, � �� ������ ��������!
						//"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
						"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
						"      and wbi.workorderbytrefcode = " + workOrderBytCode +
						"      and ei.countfact > 0 " +
						"      and ei.accountingtyperefcode = " + accountingTypeCode +
						" ) ";

				estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);				
				
				if (estimateItemArr.length > 0) {
					throw new SystemException("\n\nNET-4530 �� ��������-����� � ����� ������� �������� ��� ����������!\n" + 
							"��� ����'���� ����� �������� ������ ���������� ���� (��� ������������ �������-�����, ���� ���� ����)!");
				}
				
				throw new SystemException("\n\nNET-4530 � ����� ������� ������� ���� ���� (� ���������-������), � ���� ���������������� ������!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
						//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					//if (estimateItem.planRef.code != planCode) // ����� �� ������� ���� ������ ���
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 �� �������� ���� � ����� " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 ����'������� ������ �� ����� ������������ ����� �� �������� ���������-������!\n" +
				        			"���� � ����� " + plan.code + " �� � �������� ���������-������!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					// ��� �������� ���� �������� 2 lockTyp'�, ������ ���, ���� �����-�� ������ ��������� � ��������,
					// �� lockType ��������� �� SCSealLockType.FOR_FACT
					//sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;
					sealFilter.conditionSQL = "locktyperefcode in (" + SCSealLockType.FOR_WORKORDERBYT + ", " + SCSealLockType.FOR_FACT + ")";

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"     enestimateitem ei, enestimateitem ei1, " +
							"     enestimateitem2nstmttm ei2ei, " +
							"     enplanworkitem pi, " +
							"     enworkorderbytitem wbi " +
							"   where ei.planitemrefcode = pi.code " +
							"     and ei.materialrefcode = ei1.materialrefcode " +
							"     and ei2ei.estimateiteminrefcode = ei.code " +
							"     and ei2ei.estimateitemoutrefcode = ei1.code " +
							"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
							"     and wbi.planitemrefcode = pi.code " +
							"     and wbi.workorderbytrefcode = " + workOrderBytCode +
							"     and ei1.code = " + estimateItemArr[i] +
							" )";
					workOrderBytItemFilter.orderBySQL = "customername";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						// ���� �� ����� �� ������ ����������, ������, ������ ���� ��������� ��� �� �������-����,
						// � ����� ������ ��-�������
						workOrderBytItemFilter.conditionSQL =
								" code in ( " +
								"   select wbi.code " +
								"   from " +
								"      ENWORKORDERBYTITEM wbi, " +
								"      enestimateitem ei, " +
								"      enplanwork plan, " +
								"      enplanwork fact, " +
								"      enplancorrecthistory ch " +
								"  where " +
								"      ei.code = " + estimateItemArr[i] +
								"      and ei.planrefcode = fact.code " +
								"      and wbi.planrefcode = plan.code " +
								"      and plan.code = ch.planoldrefcode " +
								"      and fact.code = ch.plannewrefcode " +
								"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
								"      and fact.code = " + plan.code +
								"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
								"      and wbi.workorderbytrefcode = " + workOrderBytCode +
								"      and ei.countfact > 0 " +
								"      and ei.accountingtyperefcode = " + accountingTypeCode +
								" )";

						workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

						if (workOrderBytItemArr.length == 0)
						{
							throw new SystemException("\n\nNET-4530 �� �������� ����� ������� �������� � ��������!");
						}
					}

					int j = 1;

					//for (int j = 1; j <= estimateItemCount4Binding; j++)
					//while (j <= estimateItemCount4Binding)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
							//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
							return;
						}

						String tmpCustomerNumber = "";

						for (int w = 0; w < workOrderBytItemArr.length && j <= estimateItemCount4Binding; w++)
						{
							ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[w]);

							if (workOrderBytItem == null)
							{
								throw new SystemException("\n\nNET-4530 �� �������� ������ ������� �������� � ����� " + workOrderBytItemArr[w] + " !");
							}

							if (! workOrderBytItem.customerName.equals(tmpCustomerNumber))
							{
								tmpCustomerNumber = workOrderBytItem.customerName;
							}
							else
							{
								continue;
							}

							///// ���� � ������� ������ �������� ������� ��� ��������� ���������� �����, ����� �� ����������
							SCSeal2ENWorkOrderBytFilter seal2WorkOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
							seal2WorkOrderBytFilter.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
							seal2WorkOrderBytFilter.workOrderBytItemRef.code = workOrderBytItemArr[w];

							// ���� TYPE_OBJECT � OSTABLE (� ScanCounters): ��� ��������� (1 - �������, 2 - ������, 3 - ���������, 4 - ����������)
							int scTypeObject = Integer.MIN_VALUE;

							switch (accountingTypeCode)
							{
								case TKAccountingType.SEAL:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_SEAL;
									break;

								case TKAccountingType.IMP:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_INDICATOR;
									break;

								case TKAccountingType.HOLO:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_HOLOGRAM;
									break;

								default:
									scTypeObject = Integer.MIN_VALUE;
							}

							if (scTypeObject == Integer.MIN_VALUE)
							{
								throw new SystemException("\n\nNET-4530 �������� ��� ��������� � ScanCounters!\n" +
										"type_object: " + scTypeObject);
							}

							seal2WorkOrderBytFilter.conditionSQL =
								" SCSEAL2ENWORKORDERBYT.sealrefcode in " +
								"   (select s.code from scseal s where s.typerefcode = " + scTypeObject +
								"       and s.code = SCSEAL2ENWORKORDERBYT.sealrefcode) ";

							int[] seal2WorkOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2WorkOrderBytFilter, 0, -1);

							int countByTechCard = estimateLogic.getEstimateCountByTechCard(estimateItemArr[i]).intValue();
							int count4Binding = countByTechCard - seal2WorkOrderBytArr.length;

							if (count4Binding <= 0)
							{
								continue;
							}
							/////

							//for (int c = 1; c <= countByTechCard; c++)
							for (int c = 1; c <= count4Binding; c++)
							{
								if (sealsArrIndex > seals.length - 1)
								{
									// ������� (����� �� ������ ����������� �������, ��������, �������� � ��������� �� ��������� ��� - �� ������ �������)
									//throw new SystemException("\n\nNET-4530 ������ ���������� ������� ����� ��� ������� ��������!");
									return;
								}

								ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

								System.out.println("estimateItem " + estimateItemArr[i] + " - " +
										"seal " + tmpSeal.buildNumber);

								SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

								// ��������, ����� �������� ���, � �������� �� ����������� ������, � ���, ������� � ��� � �����-������� �� �����
								String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
								if (! seal.molCode.equals(finMolCode))
								{
									throw new SystemException("\n\nNET-4530 ���, � ��� ������������ ������ (" + seal.molCode +
											"), �� ������� � ��� �� �����-������� � ���� (" + finMolCode + ") !");
								}

								seal.estimateItemRef.code = estimateItemArr[i];

								int sealCode = sealDAO.add(seal);

								SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
								seal2workOrderByt.sealRef.code = sealCode;
								seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
								seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
								seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
								seal2workOrderBytDAO.add(seal2workOrderByt);

								if (workOrderBytItem.finWorker == null)
								{
									throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������ ������� �������� � ����� " + workOrderBytItemArr[w] + " !");
								}

								// ����� ������ � ScanCounters
								scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
												 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
												 ENMetrologyCounter.BILLING_LOCK /* ?? */);

								sealsByPlansCount = sealsArrIndex;

								j++;
							}
						}
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// ������� ����� (�.�. ��, ��� ������ ������ �����������)
			// ����� ��������� ��� ��� ������� ������� (��� ������ �� ���������� workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 �������� ������ ��������, ����� ������ ��������� � ��������� �� ������ ������� � ������ �������
				// (���� � ������ 2 ������� � ������� �������� ��������� �������, �� � ����� � ��� �� ������ - ��. SUPP-49304).
				// � ���� ������ �� �� ������ ������ ��������� � ���� ������ (��� ������ �� � ��������������, �������������?).
				// �����, �� ����� ������ ����� ������!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 ��� \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "��� ������������� ������ � ������ ������� ������� � " + workOrderBytOther.numberGen + " �� " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (���: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 �� �������� ��������� ��� ������� �������� � ����� " + workOrderBytCode + " !");
					}

					// ����� ������ � ScanCounters. ������ �� ����������� ����� � ������ �������, � �� �� ������,
					// �.�. ��� � ��� ��� ��� �������� � ���������� ������
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsForRaidByFact", e);
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


	public void removeSeals(int workOrderBytCode, int[] sealCodes)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			String strSealCodes = "";

			for (int i = 0; i < sealCodes.length; i++)
			{
				if (strSealCodes.length() == 0)
				{
					strSealCodes = "" + sealCodes[i];
				}
				else
				{
					strSealCodes += ", " + sealCodes[i];
				}
			}

			if (strSealCodes.length() == 0)
			{
				throw new SystemException("\n\nNET-4530 �� ������� ������ ����� ��� ���������!");
			}

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.conditionSQL = "sealrefcode in (" + strSealCodes + ")";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

				// ��������, ����� �� ����� �� ��� ������ ����, � �� ���� ����� ��������� ���������� �� �������� �������
				// (� � ���� ����������� ����������� �� ����� ������) - � ����� ������� � ������� �������� ����� �� �������
				scLogic.checkPlanStatusForSeal(seal, "���� �������� ����'���� ����� ������� ���� �� �������-���� " +
						"(���� ����������� ������� �������� � ������ \"��������\")!");

				// �������� ���. ���� ������ � ScanCounters
				scLogic.checkSealSCAccount(seal.scCode, "2013", "�� ������ �� ����� �������� � ��������!");

				// ����������� ������ � ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK /* ?? */);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);
				sealDAO.remove(seal.code);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't removeSeals", e);
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

	public void removeSealsByFact(int workOrderBytCode, int[] sealCodes)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			// �������� ������� �������� �������
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			String strSealCodes = "";

			for (int i = 0; i < sealCodes.length; i++)
			{
				if (strSealCodes.length() == 0)
				{
					strSealCodes = "" + sealCodes[i];
				}
				else
				{
					strSealCodes += ", " + sealCodes[i];
				}
			}

			if (strSealCodes.length() == 0)
			{
				throw new SystemException("\n\nNET-4530 �� ������� ������ ����� ��� ���������!");
			}

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.conditionSQL = "sealrefcode in (" + strSealCodes + ")";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

				if (seal.statusRef.code != SCSealStatus.GOOD && seal.statusRef.code != SCSealStatus.SPOILED)
				{
					throw new SystemException("\n\nNET-4530 ������ � " + seal.buildNumber + " ��� ����������� � �����!");
				}

				//scLogic.checkPlanStatusForSeal(seal, "");
				/////
				if (seal.estimateItemRef != null)
				{
					if (seal.estimateItemRef.code != Integer.MIN_VALUE)
					{
						// ���� ������ ����, �� � ������ ������ "ǳ�������", ��� ���������� ��� �����, ����������� � ������!!!
						if (seal.statusRef.code != SCSealStatus.GOOD)
						{
							throw new SystemException("\n\nNET-4530 ������ � " + seal.buildNumber +
									"�� ����������� ������ ��� ���� ��������!");
						}

						ENEstimateItem estimateItem = estimateItemDAO.getObject(seal.estimateItemRef.code);
						ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

						if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
							throw new SystemException("\n\nNET-4530 ����, �� ����� ����'����� ������ � " + seal.buildNumber +
									", �� � �������� ���������-������!");
				        }

						ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
						act2planFilter.plan.code = plan.code;

						int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

						if (act2planArr.length > 0)
						{
							throw new SystemException("\n\nNET-4530 ��������-����, �� ����� ����'����� ������ � " + seal.buildNumber +
									", ��� �������� �� ����! ��� ��������-�����: " + plan.code);
						}
					}
				}
				/////

				/////
				// ����� ����� ����� �� ������ �� �������-����� � ������� �� ���� (������ �� �������)
				SCSealFilter scSealFilter = new SCSealFilter();
				scSealFilter.scCode = seal.scCode;
				scSealFilter.conditionSQL =
						" code in " +
						" ( " +
						"   select s1.code " +
						"   from " +
						"     scseal s, scseal s1, " +
						"     scseal2enworkorderbyt swb, scseal2enworkorderbyt swb1 " +
						"   where swb.sealrefcode = s.code " +
						"     and swb.workorderbytrefcode = " + workOrderBytCode +
						"     and s.sccode = " + seal.scCode +
						"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
						"     and swb1.sealrefcode = s1.code " +
						"     and swb1.workorderbytrefcode = swb.workorderbytrefcode " +
						"     and swb1.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
						"     and s1.sccode = s.sccode " +
						" ) ";

				int[] scSealArr = sealDAO.getFilteredCodeArray(scSealFilter, 0, -1);

				for (int j = 0; j < scSealArr.length; j++)
				{
					SCSeal2ENWorkOrderBytFilter seal2workOrderBytPlanFilter = new SCSeal2ENWorkOrderBytFilter();
					seal2workOrderBytPlanFilter.sealRef.code = scSealArr[j];
					seal2workOrderBytPlanFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytPlanFilter.workOrderBytRef.code = workOrderBytCode;

					int[] seal2workOrderBytPlanArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytPlanFilter, 0, -1);

					for (int s = 0; s < seal2workOrderBytPlanArr.length; s++)
					{
						seal2workOrderBytDAO.remove(seal2workOrderBytPlanArr[s]);
					}

					sealDAO.remove(scSealArr[j]);
				}
				/////

				// ����������� ������ � ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK /* ?? */);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);
				sealDAO.remove(seal.code);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't removeSealsByFact", e);
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

	public void makeFormed(int workOrderBytCode) 
	{

		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"�������\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.FORMED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeFormed", e);
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

	public void undoMakeFormed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.FORMED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"��������\" !");
			}

            ///// �� ����� �������� ������� ������� � ������ "��������", ���� ��� ���� ����������� ������
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			if (seal2workOrderBytArr.length > 0)
			{
				throw new SystemException("\n\nNET-4530 �� ������� ������� ��� � ������������ ������! �������� ������� ������� ������������!");
			}
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.DRAFT;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeFormed", e);
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

	public void makeApproved(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.FORMED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"��������\" !");
			}

			/////
			/* 12.06.16 ��� ����������� �������� �� ����� ������� ��������
			// ������� ����� ���-�� �����, ����������� �� �������, � ����������� ���-���.
			// �� ��� ���, ���� �� ����� ��������� ����������� ���-��, �� ����� ��������� ������� � ������ "�����������"
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			int sealsTotalCount = scLogic.getSealsCountForWorkOrderByt(workOrderBytCode);
			int sealsCountReserved = scLogic.getSealsCountReservedByPlanForWorkOrderByt(workOrderBytCode);

            if (sealsCountReserved < sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 ʳ������ �������������� ����� �� ������� ������� ����� �� �������� ���������!\n" +
            			"�������������: " + sealsCountReserved + ", ���������: " + sealsTotalCount);
            }
            */
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.APPROVED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeApproved", e);
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

	public void undoMakeApproved(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"�����������\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.FORMED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeApproved", e);
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

	public void makeCompleted(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"�����������\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.COMPLETED;
			workOrderBytDAO.save(workOrderByt);

			/////
			// ��������� ��� �������� �������-����� �� ����� �������� ������� � �������-�����
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.status.code = ENPlanWorkStatus.GOOD;
			planFilter.conditionSQL =
					" code in " +
					" ( " +
					"   select distinct bi.planrefcode " +
					"     from enworkorderbytitem bi " +
					"    where bi.workorderbytrefcode = " + workOrderBytCode +
					" )";

			int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

			if (planArr.length > 0)
			{
	            Context planCnt = new InitialContext();
	            Object planRef = planCnt.lookup(ENPlanWorkController.JNDI_NAME);
	            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
	            ENPlanWorkController planController = planHome.create();

	            for (int i = 0; i < planArr.length; i++)
	            {
	            	planController.closePlanWork(planArr[i]);
	            }
			}
			/////

            ///// �������� ������, �� ����������� � ������ (����������� ����������� ���� � planController.closePlanWork)
            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            SCSeal2ENWorkOrderBytDAO seal2wbDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            SCSealFilter sealFilter = new SCSealFilter();

            sealFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
        		" ) " +
        		" and estimateitemrefcode is null ";

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

            for (int i = 0; i < sealArr.length; i++)
            {
            	SCSeal scSeal = sealDAO.getObject(sealArr[i]);
            	int newSealCode = sealDAO.add(scSeal);

                // ������� ������ SCSeal2WorkOrderByt �� �������� �� ����� SCSeal'� � kindRefCode = 2 (����) !!!!!
                SCSeal2ENWorkOrderBytFilter scSeal2wbFilter = new SCSeal2ENWorkOrderBytFilter();
                scSeal2wbFilter.workOrderBytRef.code = workOrderBytCode;
                scSeal2wbFilter.sealRef.code = sealArr[i];
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
            /////
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeCompleted", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (NamingException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (RemoteException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (CreateException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void undoMakeCompleted(int workOrderBytCode)
	{
		// ��������!!!
		/*
		if (1 == 1)
		{
			throw new SystemException("\n\nNET-4530 �� ������� ��������� ����������� !");
		}
		*/

		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.COMPLETED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"��������\" !");
			}

			/*
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			// ��������, ��� � ��������
			scLogic.checkSealsStatusesForWorkOrderByt(workOrderBytCode, true, "³������ ����������� �������� � ������ \"��������\" ����������!");
			*/

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;

			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			if (seal2workOrderBytArr.length > 0)
			{
				throw new SystemException("\n\nNET-4530 �������� ������� ������� ������������ ��� ��� ����� (�����, �������� ����'����)!\n\n" +
						"��� ��������� �������� � ��������� ������ ������'������, ���� �� ������� ����'����� ����-��� ������, ����� ���� " +
						"�������� ����������� � ������ \"��������\"!");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.APPROVED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeCompleted", e);
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

	public void makeClosed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.COMPLETED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"��������\" !");
			}

			/////
			// ������� ����� ���-�� �����, ����������� �� �������, � ����������� ���-��� �� �����.
			// �� ��� ���, ���� �� ����� ��������� ����������� ���-��, �� ����� ��������� ������� � ������ "���������"
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			int sealsTotalCount = scLogic.getSealsCountByFactForWorkOrderByt(workOrderBytCode);

            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            SCSealFilter sealFilter = new SCSealFilter();
            sealFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is not null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is not null ";

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

            // ������ ������ ��������, � �� ������� � ������ �� ������ ����� countfact �� ���������� � �������� ����� ��������
            /*
            if (sealArr.length < sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 ʳ������ �������������� ����� �� ������� ������� ����� �� ���������!\n" +
            			"�������������: " + sealArr.length + ", ���������: " + sealsTotalCount);
            }
            */

            // � ��� ��������� ������ ������ ������!!!
            if (sealArr.length > sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 ʳ������ �������������� ����� �� ������� ������� ����� �� ���������!\n" +
            			"�������������: " + sealArr.length + ", ���������: " + sealsTotalCount);
            }
			/////

            TechCardLogic techCardLogic = new TechCardLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            
            /////
            // 12.07.16 ��� �������� �������� ������� � ������ "�����������" ����� ���������, ����� ��� ������, ����������� ��� �����,
            // ���� ����������� � �������� (��� �� ����� ����������� � ����������������/�����������)
            for (int i = 0; i < sealArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealArr[i]);

            	/// ������ ���� ��� ������
            	/// ���� � ����� ��� ��������������, �� �� ����� ���������, ��� �� ���������� � ��������
            	ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            	ENEstimateItem ei = eiDAO.getObject(seal.estimateItemRef.code);

            	ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            	ENPlanWork pw = pwDAO.getObject(ei.planRef.code);

            	Boolean isParametrisationPlan = false;
            	if (pw.stateRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION || pw.stateRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE) {
            		isParametrisationPlan = true;
            	}

            	// 28.02.2018 NET-4549 ���� �� ����������� ���������� ������� "���������������� �������� � �������� ��������������� ������",
            	// �� �� ��������� � ��������
            	Boolean isMetrology = false;
            	TKClassificationType tkClassificationType = techCardLogic.getTKClassificationTypeByPlanWorkItemCode(ei.planItemRef.code);
            	if (tkClassificationType != null) {
            		if (tkClassificationType.isMetrology == 1) {
            			isMetrology = true;
            		}
            	}
            	
    			if (seal.statusRef.code == SCSealStatus.GOOD && !isParametrisationPlan && !isMetrology)
    			{
    				throw new SystemException("\n\nNET-4530 ��� ����������� ������� �������� � ������ \"���������\"" +
    						" ������� �������� �� ���������� ������ ���������� � ����� (���, ���� ������ �� �����������," +
    						" ��������� �� � ������������/�������)!\n" +
    						"������ � " + seal.buildNumber + " �� �� ����������� � �����!");
    			}
            }
            /////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.CLOSED;
			workOrderBytDAO.save(workOrderByt);

            /////
            // ��� ���������������� �� ������� ������ ����� ���������
            SCSealFilter sealUnusedFilter = new SCSealFilter();
            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
            sealUnusedFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is null ";

            int[] sealUnusedArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

            for (int i = 0; i < sealUnusedArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealUnusedArr[i]);

            	// ����������� ������ � ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK, true);
            }
            /////
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeClosed", e);
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

	public void undoMakeClosed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 �� �������� ����� �������� � ����� " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.CLOSED)
			{
				throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderBytCode + " ������� ���� � ������ \"���������\" !");
			}

			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			// ��������, ��� � ��������
			scLogic.checkSealsStatusesForWorkOrderByt(workOrderBytCode, true, "³������ ����������� �������� � ������ \"���������\" ����������!");

			/* ������ ������ �� ����, ������ ��� ���� ������ ���� ���������, �� �����
			 * ��� ����-�� ������� � ����������. ����� ������ ������� �� ������ �� �������� (��. ����).
            /////
            // �������� ��� ���������������� �� ������� ������ �������� �������
			SCSealFilter sealUnusedFilter = new SCSealFilter();
            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
            sealUnusedFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is null ";

            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            int[] sealUnusedArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

            for (int i = 0; i < sealUnusedArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealUnusedArr[i]);

            	// ����� ������ � ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 ENMetrologyCounter.BILLING_LOCK, true);
            }
            /////
            */

            /////
            // ��� ���������������� �� ������� ������ ������� ������ �� ��������
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;
			seal2workOrderBytFilter.conditionSQL = "workorderbytitemrefcod is null";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2workOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSealFilter sealUnusedFilter = new SCSealFilter();
	            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
	            sealUnusedFilter.code = seal2workOrderByt.sealRef.code;
	            sealUnusedFilter.conditionSQL = "estimateitemrefcode is null";

	            int[] sealArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);

	            for (int j = 0; j < sealArr.length; j++)
	            {
	            	sealDAO.remove(sealArr[j]);
	            }
			}
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.COMPLETED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeClosed", e);
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

	public boolean checkWorkOrderBytForStatus(int workOrderBytCode, int statusCode, boolean isException)
	{
		try
		{
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return scLogic.checkWorkOrderBytForStatus(workOrderBytCode, statusCode, isException);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't checkWorkOrderBytForStatus", e);
		}
		finally
		{
			closeConnection();
		}
	}

	public boolean checkWorkOrderBytForStatus(ENWorkOrderByt workOrderByt, int statusCode, boolean isException)
	{
		try
		{
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return scLogic.checkWorkOrderBytForStatus(workOrderByt, statusCode, isException);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't checkWorkOrderBytForStatus", e);
		}
		finally
		{
			closeConnection();
		}
	}

} // end of EJB Controller for ENWorkOrderByt