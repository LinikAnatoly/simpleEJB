
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENHumenItem;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENHumenItemControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.lists.TKElement2TechCardShortList;

public class ENHumenItemControllerEJB extends ENHumenItemControllerEJBGen
 {

  public ENHumenItemControllerEJB() {}

  @Override
public int add(ENHumenItem object)
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

	     if ( object.planRef.code == Integer.MIN_VALUE){
	    	 new EnergyproSystemException("planRef not found");
	     }

      //AuthLogic l = new AuthLogic(enConn, getUserProfile());
		  if ( ! l.checkPermission4PlanItems( object.planRef.code ))
		  {
			  throw new EnergyproSystemException("Acces denied for method addBy... from method ENHumenItem.add()");
		  }

	     PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());
	     TechCardLogic tkLogic = new TechCardLogic(enConn, getUserProfile());

	     ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(enConn, getUserProfile());
	     ENPlanWorkItem planItem = planItemDAO.getObject(object.planItemRef.code);

	     if (logic.isNotEditablePlan(object.planRef.code)) {
	    	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
	     }


	     /* 29.11.2011 +++ ����� ����� ��� �����������
	      *   ��������� ��������� ����������� ��������� � �����
	      */

	     ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

	     if (plan.typeRef.code != ENPlanWorkType.TRUCKING
	    		 && plan.stateRef.code != ENPlanWorkState.TRUCKING) {
		     // ���� �� ��������� ����� ��������, ������� ��� � ��������� ...
		     // NET-321
		     TKTechCard techCard = tkLogic.getTechCardByCode(planItem.kartaRef.code);
		     if (techCard == null){
		    	 throw new EnergyproSystemException("�������� �� �������� ... ��� = " + planItem.kartaRef.code);
		     }
		     TKElement2TechCardShortList workerList = tkLogic.getWorkerListByTechCard(techCard.code);
		     if (workerList.totalCount > 0)
		     {
		    	 throw new EnergyproSystemException("������������� ���������� �������� �� ����� ....", getUserProfile());
		     }
		     else
		     {
		    	 if ( techCard.digitWorks == null ){
		    		 throw new EnergyproSystemException("� �������� ���� ����������� ����� �� �� ������� ������� ������ ���� ...", getUserProfile());
		    	 }
		     }

		     ////////////////////////////////////////////////////

		     ENHumenItemDAO objectDAO = new ENHumenItemDAO(enConn, getUserProfile());
		     ENHumenItemFilter f = new ENHumenItemFilter();
		     f.planItemRef.code = planItem.code;
		     f.conditionSQL = "enhumenitem.finworkercode is null";
		     int[] arr = objectDAO.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);
		     if (arr.length > 0 ){
		    	 throw new EnergyproSystemException("�������� ����'���� �������� ���������� �� ��������� ������ ...");
		     }
	     }


	     //TKElement2TechCardShortList tkList = tkLogic.getTimeGenByTechCardAndPosition(planItem.kartaRef.code, object.positionGen.code);


     object.dateEdit = new Date();
     object.userGen = getUserProfile().userName;

     //ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

     if (object.planItemRef != null){
    	 if (object.planItemRef.code == Integer.MIN_VALUE){
    		 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
    	 }
    	 else
    	 {
    		 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
    	 }
     }
     else
     {
    	 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
     }

     HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());

     if (object.finWorker != null){
    	 if (object.finWorker.tabNumber != null) {

    		 //�������� �������� �� ������ ���������
  		   // ���� ����� �������� ��������� �� ���� ����� �����
    		 Date date_srez;

    		 ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
    		 date_srez = pw.getDateStart();


    		 // NET-4396 ��������� ������������ ���������� ��� �� ������� ������ �����������������
    		 // ����� ���� � ���
    		 String depName = object.finWorker.departmentName;
    		 if (depName.contains("����������")) {
    			 if ((pw.budgetRef.code != ENConsts.ENBUDGET_ODG  && pw.budgetRef.code != ENConsts.ENBUDGET_SPS && pw.budgetRef.code != ENConsts.ENBUDGET_ENERGOSBYT) && (!object.finWorker.departmentCode.equals("93"))){
    				 throw new EnergyproSystemException("��� ������� ���������� �� ���(���)! ���� ������� ���� ��� �������������� ���");
    			 }
    		 }


    		 FINLogic fLogicFin = new FINLogic(finConn ,getUserProfile());
    		 //FINLogic fLogicNet = new FINLogic(enConn,getUserProfile());

    		FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(),enConn);
    		FINWorker w = new FINWorker();

    		w.code = Integer.MIN_VALUE;
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

    		// ���� ������� ����� ����������� � ��������� ������� ���������� �� ����������� FINCHARGEHISTORY � ��� ���������� FINChargeType = 2
    		// ����� ������� ���������� ����� ����� �� ����������� �� ������ ��� ������� ����������  FINChargeType = 1

    		if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber,date_srez) > 0 )
    		{
                // ���� �������
    	        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
    	        w.chargeRef.code = FINChargeType.IS_INVALID;
    		}
    		else
    		{   // ���� �� �������
    			w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
    			w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
    		}

    		// 26.02.2015 ������� ��������� (������� ������� � ��). ���� ������� �������� �������
            w.categorId = object.finWorker.categorId;
            w.categorName = object.finWorker.categorName;
            w.workTimeId = object.finWorker.workTimeId;
            // MDAX-441
            w.positionId = object.finWorker.positionId;

    		object.finWorker.code = wDAO.add(w);
    	   }
     }


	  object.dateEdit = new Date();
	  object.userGen = getUserProfile().userName;

     int code = super.add(object);

     //HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
     //hLogic.calculateHumenItem(code);

     // ����������� ����� ... ��� �� �������
     //ElementLogic elLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
     //int eType = elLogic.getElementTypeByPlanCode(object.planRef.code);
     //if (eType != ENElementType.PREPRODUCTION_OBJECT){

     	new TransportLogic(enConn, getUserProfile()).createDeliveryTimeForPlan(object.planRef.code);

     	 HumenLogic hLogic1 = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    	 hLogic1.recalcHumenItemsByPlanItemCode(object.planItemRef.code);
     //}

         // �������� ��� �� �� ������ �� ����������� 1 ��������� ���������� ��� ��������� ����������� ���������� ������   
    	 hLogic1.checkBindingFinworkerToWork(object);
         
			return code;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENHumenItem%} object.",
					e);
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
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
			{
				closeConnection();
			}
		}
	}


	@Override
	public void save(ENHumenItem object) {
		save(object, false);
	}


	public void save(ENHumenItem object, boolean isFromWorkOrderByt) {
		try {

			HumenLogic humenLogic = new HumenLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			humenLogic.save(object, isFromWorkOrderByt);
			

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENHumenItem%} object.", e);
		}
		finally {
			closeConnection();
		}
	}



	@Override
	public void remove(int code) {
		remove(code, false);
	}

  /*ENHumenItem. �������*/
  public void remove(int code, boolean isFromWorkOrderByt)
   {
    try
     {
      ENHumenItemDAO objectDAO = new ENHumenItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

      ENHumenItem h = objectDAO.getObject(code);

	  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  if ( ! l.checkPermission4PlanItems( h.planRef.code ))
	  {
		  throw new EnergyproSystemException("Acces denied for method addBy... from method ENHumenItem.remove()");
	  }

	  //AS // ������ �� ��� ... ���� �� �������� ;)
	  //if (h.countGen.doubleValue() != 0){
	  if ((h.typeRef.code == ENEstimateItemType.AUTO)
			  || (h.typeRef.code == ENEstimateItemType.CORRECTED) // ���� ����� ���� ���� .. ����� ����� ...
		)
	  {
		  throw new EnergyproSystemException("��������� ���������� �� ����������� .. ������� ����'���� � ��������");
	  }


	     PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

	     if (logic.isNotEditablePlan(h.planRef.code)) {
	    	 throw new EnergyproSystemException("PlanWork closed or canceled , code = " + h.planRef.code);
	     }

	     if (! isFromWorkOrderByt)
	     {
	    	 ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();
	         itemFilter.humenItemRef.code = code;
	         ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	         ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getScrollableFilteredList(itemFilter, 0, -1);

	     	 if (itemList.totalCount > 0)
	     	 {
	     		 throw new SystemException("\n\nNET-4350 ����� ���������� ��� �������� � ����� �������� � " +
	     	                               itemList.get(0).workOrderBytRefNumberGen + " �� " +
	     	                               new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(0).workOrderBytRefDateGen) +
	     	                               " (���: " + itemList.get(0).workOrderBytRefCode + ") !" +
	     	                               "\n\n����������� ������������ ����� � ������� ��������!"
	     				 );
	     	 }
	     }

      objectDAO.remove(code);

      // ����������� ����� ...��� �� �������
      // ��� ������ � ��������� ...
	  //   ElementLogic elLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  //   int eType = elLogic.getElementTypeByPlanCode(h.planRef.code);
	  //   if (eType != ENElementType.PREPRODUCTION_OBJECT){
	    	  HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	  hLogic.recalcHumenItemsByPlanItemCode(h.planItemRef.code);
	  //   }




		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENHumenItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENHumenItem. �������� ������ */
	@Override
	public ENHumenItem getObject(int code) {
		try {
			ENHumenItemDAO objectDAO = new ENHumenItemDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getObject(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENHumenItem%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENHumenItem. �������� ������ ��� ��������� �� ������� */
	@Override
	public ENHumenItemShortList getScrollableFilteredList(
			ENHumenItemFilter filterObject, int fromPosition, int quantity) {
		try {
			ENHumenItemDAO objectDAO = new ENHumenItemDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredList(filterObject,
					fromPosition, quantity, null);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENHumenItem%} objects.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENHumenItem