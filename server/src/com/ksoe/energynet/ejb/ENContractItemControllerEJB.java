
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENContractItem;
  *
  */



import java.math.BigDecimal;
import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENContractDAO;
import com.ksoe.energynet.dataminer.ENContractItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.ejb.generated.ENContractItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.ENContractItem;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQTndIt2PrsIt2CntrctItDAO;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.ksoe.rqorder.valueobject.filter.RQTndIt2PrsIt2CntrctItFilter;

public class ENContractItemControllerEJB extends ENContractItemControllerEJBGen
 {

  public ENContractItemControllerEJB() {}

  @Override
public int add(ENContractItem object)
  {
   try
    {
     ENContractItemDAO objectDAO = new ENContractItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     ENContractDAO contractDAO = new ENContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     OrderItemLogic itemLogic = new OrderItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

     if (object.contract.code == Integer.MIN_VALUE)
     {
    	 object.contract.org.code = itemLogic.copyOrg(object.contract.org);
    	 object.contract.code = contractDAO.add(object.contract);
     }

     return objectDAO.add(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENContractItem%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }


  /*ENContractItem. Удалить*/
  /* удаление строки договора с отвязкой естимейтов от договора */
  @Override
public void remove(int contractItemCode)
   {
    try
     {
      ENContractItemDAO objectDAO = new ENContractItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      RQTndIt2PrsIt2CntrctItDAO ipt2it2icDAO = new RQTndIt2PrsIt2CntrctItDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

      ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
      eiFilter.conditionSQL = " enestimateitem.code in (  select distinct  ei.code  \n" +
    		  " from   \n" +
    		  " enestimateitem2contrct ei2ct  ,  \n" +
    		  " encontract ct  ,  \n" +
    		  " encontractitem ctit  ,  \n" +
    		  " enestimateitem ei  \n" +
    		  " where ei2ct.findocid = ct.findocid  \n" +
    		  " and ct.code = ctit.contractcode  \n" +
    		  " and ctit.code = "+ contractItemCode +" \n" +
    		  " and ei2ct.estimateitemcode = ei.code \n" +
    		  " and ei.materialrefcode = ctit.materialcode   )  " ;

      int eiArr[] = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
      // отвязка от договора
      if(eiArr.length > 0 ){

    	 Context ei2ContractCnt = new InitialContext();
         Object ei2ContractRef = ei2ContractCnt.lookup(ENEstimateItem2ContractController.JNDI_NAME);
         ENEstimateItem2ContractControllerHome ei2ContractHome = (ENEstimateItem2ContractControllerHome) PortableRemoteObject.narrow(ei2ContractRef, ENEstimateItem2ContractControllerHome.class);
         ENEstimateItem2ContractController ei2ContractController = ei2ContractHome.create();

         for (int i = 0; i < eiArr.length; i++) {
        	 ei2ContractController.removeByEstimateCode(eiArr[i]);
   	     }

     }

      RQTndIt2PrsIt2CntrctItFilter ipt2it2icFilter = new RQTndIt2PrsIt2CntrctItFilter();
      ipt2it2icFilter. contractItemRef.code  = contractItemCode;
      int[]  ipt2it2icArr = ipt2it2icDAO.getFilteredCodeArray(ipt2it2icFilter, 0, -1);

      for (int a = 0; a < ipt2it2icArr.length; a++) {
    	  ipt2it2icDAO.remove(ipt2it2icArr[a]);
	  }


      objectDAO.remove(contractItemCode);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENContractItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
    catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
    catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}
    finally                              {closeConnection();}
   }


  /*ENContractItem. Изменить*/
  @Override
public void save(ENContractItem object)
   {
    try
     {

    	ENContractItemDAO objectDAO = new ENContractItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	ENContractDAO contractDAO = new ENContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

    	ENContractItem oldObj = objectDAO.getObject(object.code);



    	// если меняется количество то проверим количество новое и сумму количества по привязанным естимейтам .
    	// если количество в новом объекте меньше чем кол-во по привязанным естимейтам то пошлем отвязывать естимейты от договора
    	if(oldObj.countGen.doubleValue() != object.countGen.doubleValue() ){
    		ENContract contractObj = contractDAO.getObject(object.contract.code);
    		BigDecimal countBindedMaterialsByContract = e2cDAO.getCountBindedMaterialsByContract(contractObj.finDocCode, oldObj.material.code);

    		if(countBindedMaterialsByContract.doubleValue() > object.countGen.doubleValue()){
    			throw new SystemException("\n\n Підв`язана до планів кількість перевищує кількість яку ви вказуєте.  \n Для зменшення кількості по договору виконуйте відв`язку матеріалів/послуг привязаних до договору на формі \"Робота з планом закупівель\"  ");
    		}

    	}
      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENContractItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

} // end of EJB Controller for ENContractItem