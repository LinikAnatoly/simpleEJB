
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENEstimateItem2ENEstimateItem;
  *
  */



import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.exception.AuthorizationSystemException;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemStatusHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanCorrectHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.generated.ENEstimateItem2ENEstimateItemControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemStatusHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderData2FKPartyDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderData2FKParty;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderData2FKPartyFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;

public class ENEstimateItem2ENEstimateItemControllerEJB extends ENEstimateItem2ENEstimateItemControllerEJBGen
 {

	public boolean getChangeBudegt()
	{
		boolean out = true;
		try
	     {
			try{
			AuthLogic a = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			a.checkPermission("ksoe/energynet/ENEstimateItem2ENEstimateItemController", "getChangeBudegt");
			}
			catch (AuthorizationSystemException e) {
				// TODO: handle exception
				out = false;
			}
			return out;
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getChangeBudegt ",e);}
	    finally                              {closeConnection();}
	}


	  @Override
	public int add(ENEstimateItem2ENEstimateItem object)
	  {
		  return add(object, Integer.MIN_VALUE, new BigDecimal(0));
	  }



	  public int add(ENEstimateItem2ENEstimateItem object, int finCode, BigDecimal finCount)
	   {

		  /*
		   * 15.10.2011  пока запретили перебросу....
		   */
		  boolean allowed = false;

		  //if (1 == 1) {
		  if (! allowed) {
			  throw new EnergyproSystemException("Цю функцію заблоковано! Використовуйте ордера на перенесення матеріалів між об'єктами!");
		  }

		try
	     {

	      FINMaterialsDAO fmDAO = new FINMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
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
	      if ( ! (getChangeBudegt()) ){
		      if (planIN.budgetRef.code != planOUT.budgetRef.code )
		      {
		    	//this.getChangeBudegt();
		    	throw new EnergyproSystemException("Не співпадають Бюджетотримачі у планах ...");
		      }
	      }


	      EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	      ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

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
	    //	  throw new EnergyproSystemException("Кільсть не повинна перевищувати фактічну кількість ...");
	     // }


	      if (estOUT.countFact.doubleValue() < movedCount.doubleValue() ){
	    	  throw new EnergyproSystemException("Кількість не повинна перевищувати фактічну кількість ...");
	      }


	      int estOUTNewCode = Integer.MIN_VALUE;

	      if (estOUT.countFact.doubleValue() == movedCount.doubleValue() ){

		      // история статусов ..
		      ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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



finCount = finCount.setScale(6, BigDecimal.ROUND_HALF_UP);

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
		      RQFKOrderData2FKPartyDAO od2pDAO = new RQFKOrderData2FKPartyDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		      RQFKOrderDAO orderDAO = new RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		      RQFKOrderItemDAO orderItemDAO = new RQFKOrderItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

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
		    	  // Код партии из AX
		    	  vF.ax_party_id = od2p.axPartyCode;
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

		    	  vF.userGen = getUserProfile().userName;
		    	  vF.dateEdit = new Date();

		    	  vF.estimateItemRef.code = object.estimateItemOutRef.code;
		    	  fmDAO.add(vF);
		    	  inFIN = true;
		      }
	      }

	      if ( ! inFIN){
	    	throw new EnergyproSystemException("Какой смысл перекидывать материалы, которых нету в наличии ??");
	      }


	      ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
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
else
{
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

	  fm.quantity = finCount;
	  fm.estimateItemRef.code = estOUTNewCode; //estOUTNew.code ; //object.estimateItemOutRef.code;
	  fm.statusRef.code = FINMaterialsStatus.GOOD;
	  fm.parentRef.code = finCode;
	  fmDAO.add(fm);

}


/*

	      ENEstimateItem est = estDAO.getObject(object.estimateItemOutRef.code);

	      // история статусов ..
	      ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  @Override
	public void remove(int code)
	   {
	    try
	     {


	      ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      ENEstimateItem2ENEstimateItem object = objectDAO.getObject(code);


	      // история статусов ..
	      int prevStatus = Integer.MIN_VALUE; //ENEstimateItemStatus.MOVED;
	      ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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


	      FINMaterialsDAO fmDAO = new FINMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

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

	    	  fmFilterOut.statusRef.code = FINMaterialsStatus.GOOD;
	    	  //fmFilterOut.conditionSQL = "finmaterials.parentrefcode is not null";
	    	  arrOut = fmDAO.getFilteredCodeArray(fmFilterOut, 0, -1);
	    	  for (int j=0; j < arrOut.length; j++){
	    		  FINMaterials ff = fmDAO.getObject(arrOut[j]);
	    		  //movedCount = movedCount.add(ff.quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
	    		  FINMaterialsFilter fmFilter_ = new FINMaterialsFilter();
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
	    			  fmDAO.save(ff);
	    		  }
	    		  else
	    		  {
	    			  ff.estimateItemRef.code = object.estimateItemInRef.code;
	    			  ff.parentRef.code = Integer.MIN_VALUE;
	    			  fmDAO.add(ff);
	    		  }
	    		  fmDAO.remove(arrOut[j]);
	    	  }

	     }


	      fmFilter = new FINMaterialsFilter();

	      fmFilter.estimateItemRef.code = object.estimateItemInRef.code;
	      fmFilter.statusRef.code = FINMaterialsStatus.MOVED;
	      fmFilter.conditionSQL = "finmaterials.code not in (select ff.parentrefcode from finmaterials ff where ff.parentrefcode is not null) ";
	      RQFKOrderItem2ENEstimateItemDAO o2iDAO = new RQFKOrderItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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

	      FINMaterialsDAO fmDAO = new FINMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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
	      //ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

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

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  public int addMoveSCCounter(ENEstimateItem2ENEstimateItem object)
	  {
		    int out = Integer.MIN_VALUE;
		    try
		     {

		     object.typeRef.code = ENEstimateItem2Type.COUNTER_MOVED;

		      ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		      ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));



		      ENEstimateItem estIN = estDAO.getObject(object.estimateItemInRef.code);
		      if (estIN.countFact.doubleValue() == 0){
		    	  throw new EnergyproSystemException("Кількість 0 у лічильника з якого переноситься матеріал ...");
		      }

		      ENEstimateItem estOUT = estDAO.getObject(object.estimateItemOutRef.code);
		      if (estOUT.countFact.doubleValue() == 0){
		    	  throw new EnergyproSystemException("Кількість 0 у лічильника в який переноситься матеріал ...");
		      }

		      ENEstimateItem2ENEstimateItemFilter e2eFilter = new  ENEstimateItem2ENEstimateItemFilter();
		      e2eFilter.estimateItemInRef.code = estIN.code;
		      e2eFilter.typeRef.code = ENEstimateItem2Type.COUNTER_MOVED;
		      int[] e2eArr = objectDAO.getFilteredCodeArray(e2eFilter, 0, -1);
		      if (e2eArr.length > 0 ){
		    	  throw new EnergyproSystemException("Цей матеріал вже перенесено  !!!!!");
		      }

		      /*
		      if (estOUT.statusRef.code == ENEstimateItemStatus.PRESENT){
		    	throw new EnergyproSystemException("Навіщо переносити на вже наявний матеріал ...");
		      }
		      */

		      if ( estOUT.planRef.code == estIN.planRef.code){
		    	  throw new EnergyproSystemException("Це один й той же план ;)");
		      }

		      ENPlanCorrectHistoryDAO planHistDAO = new ENPlanCorrectHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		      ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());


		      // !!! накинуть бы проверок ... типы планов, подразделения, молы и т.д.
		      // этот же мат-л в фактах ..

		      PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		      ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		      ENPlanWork planIN = planLogic.getPlanByCode(estIN.planRef.code);
		      ENPlanWork planOUT = planLogic.getPlanByCode(estOUT.planRef.code);

		      if (planIN.budgetRef.code != planOUT.budgetRef.code ){
		    	  throw new EnergyproSystemException("На планах не співпадають бюджетотримачі ...");
		      }
		      if (planIN.departmentRef.code != planOUT.departmentRef.code ){
		    	  throw new EnergyproSystemException("На планах не співпадають підрозділи ...");
		      }

		      // МОЛы
		      // типы виды планов ??

		      int eTypeIN = elementLogic.getElementTypeByPlan(planIN);

		      if ((eTypeIN != ENElementType.PURCHASES_OBJECT) && (eTypeIN != ENElementType.PURCHASES_NO_OBJECT))
		      {
		    	  estIN.statusRef.code = ENEstimateItemStatus.MOVED;

		    	  int eTypeOUT = elementLogic.getElementTypeByPlan(planOUT);
		    	  if (eTypeOUT != eTypeIN){
		    		  throw new EnergyproSystemException("Не співпадають типи об'ектів ....");
		    	  }
		      }

		      // если есть что то ниже в САД
		      // но работа где висел счетчик может быть занулена ;)
		      // и типа он не заюзал тот материал??
		      /*
		      ENPlanCorrectHistoryFilter histFilter = new ENPlanCorrectHistoryFilter();
		      histFilter.planOldRef.code = estIN.planRef.code;
		      histFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
		      int[] histArr = planHistDAO.getFilteredCodeArray(histFilter, null, null, 0, -1, null);
		      if (histArr.length > 0 ){
		    	  throw new EnergyproSystemException("На плані з якого переносити лічільник вже є НПЗ ... видаляйте його ...");
		      }
		      */

		      // а что делать если не было работы на месячном?? давать??
		      if (estIN.planItemRef.code != Integer.MIN_VALUE){

		    	  String codes = planLogic.getCodesHistoryDown(estIN.planRef.code);
		    	  ENPlanWorkItem pi = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).getObject(estIN.planItemRef.code);

		    	  ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		    	  planFilter.elementRef.code = planIN.elementRef.code;
		    	  planFilter.yearGen = planIN.yearGen;
		    	  planFilter.monthGen = planIN.monthGen;
		    	  planFilter.conditionSQL = "enplanwork.code in (" +
		    	  " select pi.planrefcode from  enplanworkitem pi where pi.planrefcode " +
		    	  " in (" + codes + ") and pi.kartarefcode = " + pi.kartaRef.code + " and pi.countgen <>0 and pi.planrefcode  <> " + estIN.planRef.code + ")";

		    	  int[] qArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
		    	  if (qArr.length > 0){
		    		  //если реальный-левый счетчик использовали - пусть переносят ...
		    		  SCCounterDAO cntDAO = new SCCounterDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    		  com.ksoe.energynet.logic.SCLogic scNetLogic =
		    				  new com.ksoe.energynet.logic.SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
		    						  getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

		    		  int cntCode = scNetLogic.getSCCounterCodeByEstimateItem(estIN.code);

		    		  boolean isErr = false;
		    		  if (cntCode == Integer.MIN_VALUE){
		    			  //isErr = true;
		    		  }
		    		  else
		    		  {

			    		  SCCounter cnt = cntDAO.getObject(cntCode);
			    		  SCCounterFilter cntFilter = new SCCounterFilter();
			    		  cntFilter.kindRef.code = SCCounterKind.FOR_FACT;
			    		  cntFilter.conditionSQL = "estimateitemrefcode in (select e.code from enestimateitem e where e.accountingtyperefcode = 2 "+
			    		  						  " and e.kindrefcode = 1 and e.planrefcode in ("+ codes+") )";
			    		  SCCounterShortList cntList = cntDAO.getScrollableFilteredList(cntFilter, 0, -1);

			    		  for (int qq=0; qq < cntList.totalCount; qq++){
			    			  if (( cnt.invNumber.equals(cntList.get(qq).invNumber)) || (cnt.buildNumber.equals(cntList.get(qq).buildNumber))){
			    				  isErr = true;
			    			  }
			    		  }
		    		  }

		    		  if (isErr)
		    			  throw new EnergyproSystemException("На плані, з якого переноситься лічильник, вже є НПЗ ... з виконаною роботою, на яку був замовленый лічильник ...");
		    	  }

		      }

		      // перенесено вниз ... estDAO.save(estIN);

		      // в логике метод ...
		      // история статусов ..
		      ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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
		      estOUT.countFact = estIN.countFact;

		      //по всем планам вниз ...
		      //только для ОДНОГО ЧЕРНОВОГО НПЗ ... если несколько - в сад ...;) потом будет видно ..
		      // если есть еще, типа утвержденные НПЗ/Факт - в сад ...



		      String planCodes = planLogic.getCodesHistoryDown(estOUT.planRef.code);
		      ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		      planFilter.conditionSQL = "enplanwork.code in (" + planCodes + ")";
		      ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter, 0, -1);
		      //boolean isBug = false;
		      for (int i=0; i < planList.totalCount; i++){
		    	  if (
		    			  (planList.get(i).kindCode == ENPlanWorkKind.FACT)
		    			  || (
		    					  (planList.get(i).kindCode == ENPlanWorkKind.NPW)
		    					  && (planList.get(i).stateRefCode == ENPlanWorkStatus.LOCKED)
		    				  )
		    	  )
		    	  {
		    		  throw new EnergyproSystemException("На плані, куди переносите ЛІЧИЛЬНИК вже є затверджені Наряд-Завдання або Факти ...");
		    	  }
		      }

		      // одно ли НПЗ .. если НЕТ в сад ... в листе есть Месячный и одно НПЗ ...
		      if (planList.totalCount > 2){
		    	  throw new EnergyproSystemException("Вже є кілька НПЗ на плані куди переноситься ЛІЧИЛЬНИК");
		      }

		      for (int i=0; i < planList.totalCount; i++){
		    	  if (planList.get(i).kindCode == ENPlanWorkKind.NPW)
		    	  {
		    		ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
		    		estFilter.accountingTypeRef.code = estOUT.accountingTypeRef.code;
		    		estFilter.materialRef.code = estOUT.materialRef.code;
		    		estFilter.planRef.code = planList.get(i).code;
		    		estFilter.conditionSQL = "enestimateitem.countfact <> 0 and enestimateitem.planitemrefcode <> 0 and enestimateitem.statusrefcode <> " + ENEstimateItemStatus.PRESENT;
		    		//estFilter.statusRef.code
		    		int[] estOUTArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
		    		if (estOUTArr.length != 1){
		    			throw new EnergyproSystemException("У НПЗ, куди переносите лічильник, проблема з лічильником : кількість = 0 або кількість більше 1 або його не знайдено ...");
		    		}

		    		ENEstimateItem npzEst = estDAO.getObject(estOUTArr[0]);
		    		npzEst.statusRef.code = ENEstimateItemStatus.PRESENT;
		    		estDAO.save(npzEst);
		    	  }
		      }



		      /*
		      histFilter = new ENPlanCorrectHistoryFilter();
		      histFilter.planOldRef.code = estOUT.planRef.code;
		      histFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
		      int[] histArr = planHistDAO.getFilteredCodeArray(histFilter, null, null, 0, -1, null);
		      if (histArr.length > 0 ){
		    	  throw new EnergyproSystemException("На плані з якого переносити лічільник вже є НПЗ ... видаляйте його ...");
		      }
		      */



		      EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		      /* пока так делать НЕ СТОИТ ...
		      boolean isSCCounter = estimateLogic.checkCurrentEstimateInFKOrder(estIN.code);
		      if ( isSCCounter ){
		    	  // типа есть физически счетчик ...
		    	  SCCounterDAO counterDAO = new SCCounterDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		    	  com.ksoe.energynet.logic.SCLogic netCounterLogic = new com.ksoe.energynet.logic.SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		    	  int counterCode = netCounterLogic.getSCCounterCodeByEstimateItem(estIN.code);
		    	  if (counterCode == Integer.MIN_VALUE){
		    		  throw new EnergyproSystemException("Счетчик не найден ... а он есть ;) ... код мат-ла = " + estIN.code);
		    	  }

		    	  SCCounter counter = counterDAO.getObject(counterCode);
		    	  counter.estimateItemRef.code = estOUT.code;
		    	  counterDAO.save(counter);
		      }
		      */
		      estDAO.save(estIN);
		      estDAO.save(estOUT);


		      e2eFilter = new  ENEstimateItem2ENEstimateItemFilter();
		      e2eFilter.estimateItemOutRef.code = estIN.code;
		      e2eFilter.typeRef.code = ENEstimateItem2Type.COUNTER_MOVED;
		      e2eArr = objectDAO.getFilteredCodeArray(e2eFilter, 0, -1);
		      if (e2eArr.length == 0)
		      {
		    	  out = objectDAO.add(object);
		      }
		      else
		      {
		    	if (e2eArr.length > 1){
		    		throw new EnergyproSystemException("Ошибка в кол-ве связки СЧЕТЧИКОВ ...");
		    	}

		    	ENEstimateItem2ENEstimateItem e2e = objectDAO.getObject(e2eArr[0]);
		    	e2e.estimateItemOutRef.code = object.estimateItemOutRef.code;
		    	objectDAO.save(e2e);
		    	out = e2e.code;
		      }


		      return out;

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	  }


	  public void removeMoveSCCounter(int code)
	  {
		  try
		  {
			  ENEstimateItem2ENEstimateItemDAO objectDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			  ENEstimateItemDAO estDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			  ENPlanCorrectHistoryDAO planHistDAO = new ENPlanCorrectHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			  ENEstimateItem2ENEstimateItem object = objectDAO.getObject(code);

		      // история статусов ..
		      int prevStatus = Integer.MIN_VALUE; //ENEstimateItemStatus.MOVED;

		      ENEstimateItemStatusHistoryDAO estSHDAO = new ENEstimateItemStatusHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
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

		      ENEstimateItem estOUT = estDAO.getObject(object.estimateItemOutRef.code);

		      PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		      ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		      String planCodes = planLogic.getCodesHistoryDown(estOUT.planRef.code);
		      ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		      planFilter.conditionSQL = "enplanwork.code in (" + planCodes + ")";
		      ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter, 0, -1);
		      //boolean isBug = false;
		      for (int i=0; i < planList.totalCount; i++){
		    	  if (
		    			  (planList.get(i).kindCode == ENPlanWorkKind.FACT)
		    			  || (
		    					  (planList.get(i).kindCode == ENPlanWorkKind.NPW)
		    					  && (planList.get(i).stateRefCode == ENPlanWorkStatus.LOCKED)
		    				  )
		    	  )
		    	  {
		    		  throw new EnergyproSystemException("На плані, де видаляється перенесення ЛІЧІЛЬНИКа, вже є затверджені Наряд-Завдання або Факти ...");
		    	  }
		      }

		      // одно ли НПЗ .. если НЕТ в сад ... в листе есть Месячный и одно НПЗ ...
		      if (planList.totalCount > 2){
		    	  throw new EnergyproSystemException("Вже є кілька НПЗ на плані, де видаляється перенесення ЛІЧІЛЬНИКа");
		      }

		      for (int i=0; i < planList.totalCount; i++){
		    	  if (planList.get(i).kindCode == ENPlanWorkKind.NPW)
		    	  {
		    		ENEstimateItemFilter estFilter = new ENEstimateItemFilter();
		    		estFilter.accountingTypeRef.code = estOUT.accountingTypeRef.code;
		    		estFilter.materialRef.code = estOUT.materialRef.code;
		    		estFilter.planRef.code = planList.get(i).code;
		    		estFilter.conditionSQL = "enestimateitem.countfact <> 0 and enestimateitem.planitemrefcode <> 0 and enestimateitem.statusrefcode <> " + ENEstimateItemStatus.PRESENT;
		    		//estFilter.statusRef.code
		    		int[] estOUTArr = estDAO.getFilteredCodeArray(estFilter, 0, -1);
		    		if (estOUTArr.length != 1){
		    			throw new EnergyproSystemException("У НПЗ на плані, де видаляється перенесення ЛІЧІЛЬНИКа проблема з лічильником : кількість = 0 або кількість більше 1 або він не знайдено ...");
		    		}

		    		ENEstimateItem npzEst = estDAO.getObject(estOUTArr[0]);
		    		npzEst.statusRef.code = ENEstimateItemStatus.PRESENT;
		    		estDAO.save(npzEst);
		    	  }
		      }

		      /////////////////////////////

		      estOUT.statusRef.code = prevStatus;
		      estDAO.save(estOUT);
		      // и все вниз ...


		      ENEstimateItem estIN = estDAO.getObject(object.estimateItemInRef.code);

		      // если есть что то ниже в САД
		      ENPlanCorrectHistoryFilter histFilter = new ENPlanCorrectHistoryFilter();
		      histFilter.planOldRef.code = estIN.planRef.code;
		      histFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
		      int[] histArr = planHistDAO.getFilteredCodeArray(histFilter, null, null, 0, -1, null);
		      if (histArr.length > 0 ){
		    	  throw new EnergyproSystemException("На плані, з якого видаляється перенос лічільника, вже є НПЗ ... видаляйте його ...");
		      }

		      estIN.statusRef.code = ENEstimateItemStatus.PRESENT;
		      estDAO.save(estIN);

			  objectDAO.remove(code);

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	  }


  public ENEstimateItem2ENEstimateItemControllerEJB() {}


} // end of EJB Controller for ENEstimateItem2ENEstimateItem