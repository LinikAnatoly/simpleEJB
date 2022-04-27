
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENDeliveryTime;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDeliveryTimeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.ejb.generated.ENDeliveryTimeControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENDeliveryKind;
import com.ksoe.energynet.valueobject.ENDeliveryTime;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;


public class ENDeliveryTimeControllerEJB extends ENDeliveryTimeControllerEJBGen
 {

	  public void save(ENDeliveryTime object)
	   {
	    try
	     {

	      if ( object.deliveryKind.code == ENDeliveryKind.TRANSPORT_HOE){
	    	  throw new EnergyproSystemException("�������� ����� ������ �������� ������ ����������� !!!");
	      }	      
	      
	      ENDeliveryTimeDAO objectDAO = new ENDeliveryTimeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	      ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	      
	      ENPlanWorkFilter plFil = new ENPlanWorkFilter();
	      plFil.conditionSQL = " enplanwork.code = ( select planrefcode from enhumenitem where enhumenitem.code = "+ object.humenItemRef.code +" )";
	      int[] plArr = plDAO.getFilteredCodeArrayNOSEGR(plFil, 0, -1);
	      if (plArr.length >= 0){
	    	  ENPlanWork plObj = plDAO.getObject(plArr[0]);
	    	  if( plObj.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT  ){
	    		  // ������  �� ��������� �������� �� ����. ������ ������ ��� ��������� ����������� 
	    		  /*SUPP-81390 ���� ������������ ��������� ��������� ����������� ���� �� �������� ��������� �� �ᒺ���*/
	    	      if (!auth.checkPermissionSilent("ksoe/energynet/ENDeliveryTimeController", "addForZbyt")) {
	                  throw new EnergyproSystemException("\n SUPP-81390...\n ����� �� ����������� ���� �� �������� ��������� ����������� � � �������� ��� �� ����������������!!!");
	              }
	    	  }
	      }
	      
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENDeliveryTime%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  
	  
	  public int add(ENDeliveryTime object)
	   {
	    try
	     {

	      ENDeliveryTimeDAO objectDAO = new ENDeliveryTimeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      if ( object.deliveryKind.code == ENDeliveryKind.TRANSPORT_HOE){
	    	  throw new EnergyproSystemException("��������� ����� ������ �������� ������ ����������� !!!");
	      }
	      
	      AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	      ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	      
	      ENPlanWorkFilter plFil = new ENPlanWorkFilter();
	      plFil.conditionSQL = " enplanwork.code = ( select planrefcode from enhumenitem where enhumenitem.code = "+ object.humenItemRef.code +" )";
	      int[] plArr = plDAO.getFilteredCodeArrayNOSEGR(plFil, 0, -1);
	      if (plArr.length >= 0){
	    	  ENPlanWork plObj = plDAO.getObject(plArr[0]);
	    	  if( plObj.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT  ){
	    		  // ������  �� ��������� �������� �� ����. ������ ������ ��� ��������� ����������� 
	    		  /*SUPP-81390 ���� ������������ ��������� ��������� ����������� ���� �� �������� ��������� �� �ᒺ���*/
	    	      if (!auth.checkPermissionSilent("ksoe/energynet/ENDeliveryTimeController", "addForZbyt")) {
	                  throw new EnergyproSystemException("\n SUPP-81390...\n ����� �� ����������� ���� �� �������� ��������� ����������� � � �������� ��� �� ����������������!!!");
	              }
	    	  }
	      }
	      
	      
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENDeliveryTime%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  
	  
	  public void remove(int code)
	   {
	    try
	     {
	      ENDeliveryTimeDAO objectDAO = new ENDeliveryTimeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENDeliveryTime obj = objectDAO.getObject(code);
	      if (obj.deliveryKind.code == ENDeliveryKind.TRANSPORT_HOE){
	    	  throw new EnergyproSystemException("������ ������� ������������� ��������� ����� �������� !!!");
	      }
	      objectDAO.remove(code);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENDeliveryTime%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }   
	  
  public ENDeliveryTimeControllerEJB() {}


} // end of EJB Controller for ENDeliveryTime