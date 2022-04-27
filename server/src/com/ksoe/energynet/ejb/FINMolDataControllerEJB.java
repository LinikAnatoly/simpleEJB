
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for FINMolData;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.dataminer.ConfigDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkENAct2OSDataDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.ejb.generated.FINMolDataControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.CounterLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.FINMolLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkENAct2OSDataFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkENAct2OSDataShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.util.WebServicesConsts;

public class FINMolDataControllerEJB extends FINMolDataControllerEJBGen
 {

  public FINMolDataControllerEJB() {}

  @Override
public int add(FINMolData obj){
	  try{

	  return Integer.MIN_VALUE;
	  }
	  finally
	  {
		  throw new EnergyproSystemException("error on run FINMolData.add(FINMolData obj)");
	  }
  }

  @Override
public void save(FINMolData obj){
	  throw new EnergyproSystemException("error on run FINMolData.save(FINMolData obj). Using save(FINMolData object, int parentCode, int parentTypeCode)");
  }

  @Override
public void remove(int objCode){
	  throw new EnergyproSystemException("error on run FINMolData.remove(int objCode). Using remove(int objectCode, int parentCode, int parentTypeCode)");
  }


  public void remove(int molDataCode, int parentCode, int parentTypeCode){
	  Connection finConn = null;
	  Connection enConn = null;
	  Connection finConnOS = null;
	  Connection authConn = null;
	   try
	    {
		      finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		      finConnOS = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		      enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		      authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
		      AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
		      
		      AuthLogic netAuth = new AuthLogic(authConn, getUserProfile());
		       
		      int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();
		      


		      // �������� � ��

		      EstimateLogic eLogic = new EstimateLogic(enConn, getUserProfile());
		      if (eLogic.getFINMaterialsListByFINMOLDataCode(molDataCode).totalCount > 0){
		    	  throw new EnergyproSystemException("���� ����������� ��������� �� ���� ... �������� �������� ����������");
		      }



		      // �� ���� ������� �������� ������
		      if (parentTypeCode == 1){

		        	// ��������� ������� ���� �� ��� ������� ... ���� ���� - � ��� !
		        	ActLogic actLogic = new ActLogic(enConn, getUserProfile());
		        	ENAct act = actLogic.getActByWorkOrderCode(parentCode, false);
		        	if ( act != null){
		        		throw new EnergyproSystemException("����� ��'������ � ����� ...� " + act.numberGen + ". ������� �����-�������� � ���� !!");
		        	}

		      FINMolDataDAO mDAO = new FINMolDataDAO(enConn, getUserProfile());
		      FINMolData m = mDAO.getObject(molDataCode);

		      ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
		      ENWorkOrder wo = woDAO.getObject(parentCode);



		      if ( m.molTypeRef.code == FINMolType.MASTER){

			        wo.finMolCode = null;
			        wo.finMolName = null;
			        wo.workOrderNumber = wo.numberInt + "/xx";
			        woDAO.save(wo);
		      }

		     	PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
		     	WorkOrderLogic woLogic = new WorkOrderLogic(enConn, getUserProfile() );

		        ENPlanWork plan = planLogic.getPlanByWorkOrderCode(parentCode);

		        /*01.03.2012 - ��������  ������� entransportitem'�� � ������� �� ��������� - ���� ����
		         * ��������� ���������� */
		        TransportOrderLogic toLogic = new TransportOrderLogic(enConn, getUserProfile());
		        toLogic.checkENTransportItemInTransportOrderByENPlanWorkCode(plan.code);
		        
		     // �������� ��������� �� �������� MDAX ( 0-������ � ���. , 1-� � ��� � � �� , 2- ������ � ��)		        
				String _messageId = "";
				/**  ������������� �������� ���������� � ��  */
		        if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {		        	
		  	      _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+60); 
		  	      System.out.println(" finmoldataController remove  axLogic.aifttsbegin , _messageId = " + _messageId );
				}
		 	   
		        String journalIdmDAX = "";

			      if ( plan.kind.code == ENPlanWorkKind.FACT  ){


			    	  // NET-4383 ��� �������� � ����� ���� ������� ������ �� ���������� ��� �������� �� ���� ��� �������� �� � ����������� ��������
			    	  if (plan.stateRef.code == ENPlanWorkState.WRITINGS_OS) {

			    		  if (plan == null){
			    			  throw new EnergyproSystemException(" \n NET-4383 ������� ��� �������� ��� � �����-�������� !!! ");
			    		  } else
			    			  if (plan.code == Integer.MIN_VALUE){
			    				  throw new EnergyproSystemException(" \n NET-4383 ������� ��� �������� ��� � �����-�������� !!! ");
			    			  }

			    		  ENPlanWorkENAct2OSDataDAO pl2actDAO = new ENPlanWorkENAct2OSDataDAO(enConn, getUserProfile());
				    	  ENPlanWorkENAct2OSDataFilter pl2actFilter = new ENPlanWorkENAct2OSDataFilter();
				    	  FKOSLogic OSLogic = new FKOSLogic(finConnOS, getUserProfile());

				    	  pl2actFilter.planWorkRef.code = plan.code;

				    	  ENPlanWorkENAct2OSDataShortList pl2actList = pl2actDAO.getScrollableFilteredList(pl2actFilter, 0, -1);

				    	  for (int i=0; i < pl2actList.totalCount; i++){
				    		  OSLogic.unlockOS(pl2actList.get(i).num_un); // ������� ���������� ��������� ��� ��������
				    		  pl2actDAO.remove(pl2actList.get(i).code);   // ������ ���� ��� ��������

				    	  }

			    	  }


					  int parentPlanCode = planLogic.getParentPlanWorkCode(plan);

					    if (m.molTypeRef.code == FINMolType.MASTER){


			   	    	FINDoc2MolDataDAO dao2 = new FINDoc2MolDataDAO(enConn, getUserProfile());
				    	FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
				    	f.molData.code = molDataCode;

				    	FINDoc2MolDataShortList docList = dao2.getScrollableFilteredList(f,0,-1);
				    	if (docList.totalCount > 0) {
				    	  	 // �������� ���� .. ��� ����� � ������ ������??
				    	  	 //if (plan.kind.code == ENPlanWorkKind.FACT){
				    	  		 planLogic.checkInSCCounterByPlanCode(plan.code);
				    	  	 //}
				    	}
				    	if (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION && plan.stateRef.code != ENPlanWorkState.WRITINGS_OS && plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT)
				    	 {  ENWorkOrder parentWorkOrder = woLogic.getWorkOrderByPlanCode(parentPlanCode);
			    		    parentWorkOrder.finMolCode = m.finMolCode;
			    		    parentWorkOrder.finMolName = m.finMolName;
			    		    parentWorkOrder.workOrderNumber = wo.numberInt + "/xx";
			    		    //ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
			    		    woDAO.save(parentWorkOrder);
				    	 }
			    	   }
			      }

		      // ������� �� �� ...
		      FINMolLogic molLogic = new FINMolLogic(enConn, getUserProfile());
		      molLogic.removeMOLData(molDataCode, parentCode);

		      if ( m.molTypeRef.code == FINMolType.MASTER){
		    	  new FINLogic(finConn, getUserProfile()).updateDocMOLByWorkOrderCode(wo.code);
		      }
		      // ������� �� ������� ???...


		      // ��������� � molLogic.removeMOLData(molDataCode);
		      //FINMolDataDAO objectDAO = new FINMolDataDAO(getUserProfile(),enConn);
		      //objectDAO.remove(molDataCode);
		      
		      // ������ AX
		      if((writeOffTmcConf == 1 || writeOffTmcConf ==2 ) && !_messageId.equals("")) {
			       	axLogic.aifttscommit(_messageId);
			   		}
		      
		      }
		      else{
		    	  throw new EnergyproSystemException("�� ���� ���� ������� �� ����� ?? ");
		      }
		      
		     
		      

	    }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
	   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
				if (authConn != null && ! authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
			}
	   }

  }


  public void save(FINMolData object, int parentCode, int parentTypeCode){
	  Connection finConn = null;
	  Connection enConn = null;

   try
    {
	      finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	      enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	      FINMolDataDAO objectDAO = new FINMolDataDAO(getUserProfile(),enConn);
	      ENMolDAO molDao = new ENMolDAO(getUserProfile(), enConn);
	      FINMolData oldObject = objectDAO.getObject(object.code);


	      // �������� � ��

	      EstimateLogic eLogic = new EstimateLogic(enConn, getUserProfile());
	      if (eLogic.getFINMaterialsListByFINMOLDataCode(object.code).totalCount > 0){
	    	  throw new EnergyproSystemException("���� ����������� ��������� �� ���� ... �������� �������� ����������");
	      }

	      FINMolLogic molLogic = new FINMolLogic(enConn, getUserProfile());
	      molLogic.checkMOLCount(parentCode, parentTypeCode, object);
	      
	      if(!oldObject.finMolCode.equals(object.finMolCode))molDao.checkMolStatus(object.finMolCode);

	      objectDAO.save(object);

	      //�������� ������ � ��

	      if ( parentTypeCode == 1) // ������!!!!!!!
	      {

	    	  	PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

	        	// ��������� ������� ���� �� ��� ������� ... ���� ���� - � ��� !
	        	ActLogic actLogic = new ActLogic(enConn, getUserProfile());
	        	ENAct act = actLogic.getActByWorkOrderCode(parentCode, false);
	        	if ( act != null){
	        		throw new EnergyproSystemException("����� ��'������ � ����� ...� " + act.numberGen + ". ������� �����-�������� � ���� !!");
	        	}

		        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
		        ENWorkOrder wo = woDAO.getObject(parentCode);

		        ENPlanWork plan = planLogic.getPlanByWorkOrderCode(parentCode);

		        if (object.molTypeRef.code == FINMolType.MASTER){

		    	  	 // �������� ���� .. ��� ����� � ������ ������??
		    	  	 if (plan.kind.code == ENPlanWorkKind.FACT){
		    	  		 planLogic.checkInSCCounterByPlanCode(plan.code);
		    	  	 }

			        wo.finMolCode = object.finMolCode;
			        wo.finMolName = object.finMolName;
			        wo.workOrderNumber = wo.numberInt + "/" + wo.finMolCode.substring(0,2);
			        woDAO.save(wo);
			        new FINLogic(finConn, getUserProfile()).updateDocMOLByWorkOrderCode(wo.code);
		        }
		        else{
			        if ( ! oldObject.finMolCode.equals(object.finMolCode))
			        {
			    		new FINLogic(finConn, getUserProfile()).updateDocMOLByFINMOLData(object, wo.workOrderNumber, wo.dateGen);
			    	}
		        }


	      	  	 // --------------------------------

	           	// ��� ��������� - �������� � ������������� ...
	    	  	      ENElement el = new ENElementDAO(enConn, getUserProfile()).getObject(plan.elementRef.code);

	    	  	      // ������ ��� ��������� - �������� ��� ��� �������� � ������������� ...
	    	  	      if (el.typeRef.code == ENElementType.METROLOGY_COUNTER &&
	    	  	    	  el.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
	    	  	    	  
	    	  	    	  CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
	    	  	    	  ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(el.code);
	    	  	    	  cntLogic.lockCounterForMetrology(cnt, wo, 1, plan.stateRef.code);
	    	  	    	  
	    	  	      }
	    	  	 // --------------------------------

		     	WorkOrderLogic woLogic = new WorkOrderLogic(enConn, getUserProfile() );

		        //ENPlanWork plan = planLogic.getPlanByWorkOrderCode(parentCode);

			      if ( plan.kind.code == ENPlanWorkKind.FACT ){

					  int parentPlanCode = planLogic.getParentPlanWorkCode(plan);
					  if (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION) {
						  ENWorkOrder parentWorkOrder = woLogic.getWorkOrderByPlanCode(parentPlanCode);
			    	   	if (object.molTypeRef.code == FINMolType.MASTER){
			    		   	parentWorkOrder.finMolCode = object.finMolCode;
			    		   	parentWorkOrder.finMolName = object.finMolName;
			    		   	parentWorkOrder.workOrderNumber = wo.numberInt + "/" + wo.finMolCode.substring(0,2);
			    		   	//ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
			    		   	woDAO.save(parentWorkOrder);
			    	   	}
					  }
			      }

/*
	        ENPlanWork plan = new PlanWorkLogic(enConn, getUserProfile()).getPlanByWorkOrderCode(parentCode);
	        if ( plan.kind.code == ENPlanWorkKind.NPW ){
		        if (oldObject.finMolCode != object.finMolCode)
		        {
		    		new FINLogic(finConn, getUserProfile()).updateDocMOLByFINMOLData(object, parentCode);
		    	}
	        }

	        if (plan.kind.code == ENPlanWorkKind.FACT){


	        }
*/
	      }



	      /*

	      FINDoc2MolDataFilter docObjFilter = new FINDoc2MolDataFilter();
	      docObjFilter.molData.code = object.code;
	      if (parentTypeCode == 1){
	    	  docObjFilter.workOrder.code = parentCode;
	      }
	      else
	      {
	    	  docObjFilter.act.code = parentCode;
	      }

	      FINDoc2MolDataDAO docObjDAO = new FINDoc2MolDataDAO(enConn, getUserProfile());

	      */



    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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

  public int add(FINMolData object, int parentCode, int parentTypeCode)
  {
	  Connection finConn = null;
	  Connection enConn = null;
	  Connection authConn = null;

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
		authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
        AuthLogic netAuth = new AuthLogic(authConn, getUserProfile());
       
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

	 int objCode = Integer.MIN_VALUE;
     FINMolDataDAO objectDAO = new FINMolDataDAO(getUserProfile(),enConn);
     ENMolDAO molDao = new ENMolDAO(getUserProfile(), enConn);

     FINMolLogic molLogic = new FINMolLogic(enConn, getUserProfile());
     molLogic.checkMOLCount(parentCode, parentTypeCode, object);
     molDao.checkMolStatus(object.finMolCode);

     FINLogic finLogic = new FINLogic(finConn, getUserProfile());

     //�� ���� ��� ������� ������ ��������� �� ������� !!!

     objCode = objectDAO.add(object);
     object.code = objCode;

 	    // �������� ��������� �� �������� MDAX ( 0-������ � ���. , 1-� � ��� � � �� , 2- ������ � ��)
      
 	  
		String _messageId = "";

		/**  ������������� �������� ���������� � ��  */
        if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
        	
  	      _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+60); 
  	      System.out.println(" axLogic.aifttsbegin , _messageId = " + _messageId );
		}
 	   
        String journalIdmDAX = "";

     if (parentTypeCode == 1) // ����� !!!
     {

     	// ��������� ������� ���� �� ��� ������� ... ���� ���� - � ��� !
     	ActLogic actLogic = new ActLogic(enConn, getUserProfile());
     	ENAct act = actLogic.getActByWorkOrderCode(parentCode, false);
     	if ( act != null){
     		throw new EnergyproSystemException("����� ��'������ � ����� ...� " + act.numberGen + ". ������� �����-�������� � ���� !!");
     	}

	      // ���� �� ����� - ���� �������� ����� ����� �� ����� � ����
     	PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
     	WorkOrderLogic woLogic = new WorkOrderLogic(enConn, getUserProfile() );

     	ENPlanWork plan = planLogic.getPlanByWorkOrderCode(parentCode);

     	//if (plan.kind.code == ENPlanWorkKind.NPW){
       	   ENWorkOrder wo = new ENWorkOrderDAO(enConn, getUserProfile()).getObject(parentCode);
    	   if (object.molTypeRef.code == FINMolType.MASTER){
    		   wo.finMolCode = object.finMolCode;
    		   wo.finMolName = object.finMolName;
    		   wo.workOrderNumber = wo.numberInt + "/" + wo.finMolCode.substring(0,2);
    		   ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
    		   woDAO.save(wo);


      	  	 // --------------------------------

           	// ��� ��������� - �������� � ������������� ...
    	  	      ENElement el = new ENElementDAO(enConn, getUserProfile()).getObject(plan.elementRef.code);

    	  	      // ������ ��� ��������� - �������� ��� ��� �������� � ������������� ...
    	  	      if (el.typeRef.code == ENElementType.METROLOGY_COUNTER &&
    	  	    	  el.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
    	  	    	  
    	  	    	  CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
    	  	    	  ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(el.code);
    	  	    	  // �������� ... �������� ... � ������� ...
    	  	    	  cntLogic.lockCounterForMetrology(cnt, wo, (-1) * ENMetrologyCounter.METROLOGY_LOCK, plan.stateRef.code);
    	  	    	  cntLogic.lockCounterForMetrology(cnt, wo, ENMetrologyCounter.METROLOGY_LOCK, plan.stateRef.code);
    	  	    	  
    	  	      }
    	  	 // --------------------------------

    	  	 // �������� ���� .. ��� ����� � ������ ������??
    	  	 // ��� � ���� ����� ������ ... ��� �������� ��(��� ���)-���������� � ��� �� �� ������ � ���� ...
    	  	 //if (plan.kind.code == ENPlanWorkKind.FACT){
    	  	//	 planLogic.checkInSCCounterByPlanCode(plan.code);
    	  	// }

    	   }

   		
   		  
           
    	   // NET-1026 �� ��� ���� ���� �������� ���������
    	   if(plan.stateRef.code != ENPlanWorkState.WRITINGS_COUNTERS) 
    		   finLogic.createDOCFromENWorkOrder2(wo, object, false);

    		   // AS 18.03.2011 ��� ��� ���� ���� .. ��� ����������� ��� ���� � ������ ...
    	   //  ���� ��������� .. ��� �������� ������� ����� ������������� �� �����/��
    	   // � ����� ��� ���������� ������������ ��� ������ � ������ ���� ���� ;))
    	   finLogic.updateDocMOLByWorkOrderCode(wo.code);

     	//} // NPW

    	  boolean isWriteOffOS = false;
    	  if (plan.stateRef.code == ENPlanWorkState.WRITINGS_OS && plan.typeRef.code == ENPlanWorkType.ENPLANWORKTYPE_WRITEOFF_OS){
    		       isWriteOffOS = true;
    	  }

	      if ( (plan.kind.code == ENPlanWorkKind.FACT) && (plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION && isWriteOffOS  == false) && (plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT)  ){

			  int parentPlanCode = planLogic.getParentPlanWorkCode(plan);
			  ENWorkOrder parentWorkOrder = woLogic.getWorkOrderByPlanCode(parentPlanCode);
	    	   if (object.molTypeRef.code == FINMolType.MASTER){
	    		   parentWorkOrder.finMolCode = object.finMolCode;
	    		   parentWorkOrder.finMolName = object.finMolName;
	    		   parentWorkOrder.workOrderNumber = wo.numberInt + "/" + wo.finMolCode.substring(0,2);
	    		   ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
	    		   woDAO.save(parentWorkOrder);



	        	  	 // --------------------------------

	              	// ��� ��������� - �������� � ������������� ...
	       	  	      //ENElement el = new ENElementDAO(enConn, getUserProfile()).getObject(plan.elementRef.code);

	       	  	      // ������ ��� ��������� - �������� ��� ��� �������� � ������������� ...
	       	  	      // �� � ����� ������ ������������� ���� ....
	       	  	      /*
	       	  	      if (el.typeRef.code == ENElementType.METROLOGY_COUNTER){
	       	  	    	  CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
	       	  	    	  ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(el.code);
	    	  	    	  // �������� ... �������� ... � ������� ...
	    	  	    	  cntLogic.lockCounterForMetrology( cnt, parentWorkOrder, (-1) * ENMetrologyCounter.METROLOGY_LOCK);
	    	  	    	  cntLogic.lockCounterForMetrology( cnt, parentWorkOrder, ENMetrologyCounter.METROLOGY_LOCK);
	       	  	    	  //cntLogic.lockCounterForMetrology( cnt, parentWorkOrder, 1);
	       	  	      }
	       	  	      */
	       	  	 // --------------------------------

	    	   }

     }// FACT


     }
     else
     { // ���
    	// docObj.act.code = parentCode;
    	// docObj.workOrder.code = Integer.MIN_VALUE;
     }
     
     
     if((writeOffTmcConf == 1 || writeOffTmcConf == 2) && !_messageId.equals("")) {
     	 axLogic.aifttscommit(_messageId);
 		}



     return objCode;
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
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
			if (authConn != null && ! authConn.isClosed()) {
				authConn.close();
				authConn = null;
			}
		} catch (SQLException e) {
		}
   }
  }

} // end of EJB Controller for FINMolData
