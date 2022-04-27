package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;

import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItem2ENEstimateItemShortList;

public class AVRLogic extends LogicModule{

	  public AVRLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }


	  public void recalcCurrentAVRByPlanWorkItem(ENPlanWorkItem planWorkItem, BigDecimal oldCountPlanWorkItem, ENEstimateItemShortList oldEList) throws PersistenceException
	  {


		     // -------------------------------

		     // дл€ ј¬– на Ќѕ«/‘акте накинет такую же работу на ћес€чный .. если надо .. или увеличим кол-во работ ...


		  		 PlanWorkLogic logic = new PlanWorkLogic(connection, userProfile);
		  		 EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
		    	 ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
		    	 ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(connection, userProfile);
		    	 ENPlanWorkItemDAO planWorkItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
		    	 ENPlanWorkDAO planWorkDao = new ENPlanWorkDAO(connection, userProfile);

		    	 ENPlanWork planWork = planWorkDao.getObjectNOSEGR(planWorkItem.planRef.code);


		    	 ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();

			     ENPlanWorkItem parentCurrentPlanItem = logic.getParentCurrentPlanWorkItem(planWorkItem.code);

			     // работы не было ... накинем ...
			     if (parentCurrentPlanItem.code == Integer.MIN_VALUE ){

			    	 parentCurrentPlanItem.kartaRef.code = planWorkItem.kartaRef.code;
			    	 parentCurrentPlanItem.countGen = planWorkItem.countGen;
			    	 parentCurrentPlanItem.commentGen = "работа создана с дочернего плана";
			    	 planWorkItemDAO.add(parentCurrentPlanItem);

				     //EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());
				     //eLogic.cancelENEstimateItem(object.code); // при добавлении нечего пересчитывать ...
				     //eLogic.createENEstimateItems(parentCurrentPlanItem.code);
			    	 estimateFilter = new ENEstimateItemFilter();

			    	 estimateFilter.planItemRef.code = planWorkItem.code;
			    	 estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

			    	 int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter, 0, -1);
			    	 for (int ii=0; ii < eArr.length; ii++){
			    		 ENEstimateItem e = estimateDAO.getObject(eArr[ii]);
			    		 e.planItemRef.code = parentCurrentPlanItem.code;
			    		 e.planRef.code = parentCurrentPlanItem.planRef.code;
			    		 estimateDAO.add(e);

			    		 ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
			    		 e2e.estimateItemInRef.code = e.code;
			    		 e2e.estimateItemOutRef.code = eArr[ii];
			    		 e2e.countGen = e.countFact;
			    		 e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
			    		 e2eDAO.add(e2e);
			    	 }
			     }
			     else
			     {
			    	 // работа была в поточном ...
			    	 BigDecimal workCount = planWorkItem.countGen.subtract( oldCountPlanWorkItem ).setScale(3, BigDecimal.ROUND_HALF_UP);

			    	 parentCurrentPlanItem.countGen = parentCurrentPlanItem.countGen.add( workCount ).setScale(3, BigDecimal.ROUND_HALF_UP);
			    	 if (parentCurrentPlanItem.countGen.doubleValue() < 0.001){
			    		 parentCurrentPlanItem.countGen = new BigDecimal(0);
			    	 }
			    	 planWorkItemDAO.save(parentCurrentPlanItem);

			    	 estimateFilter = new ENEstimateItemFilter();
			    	 estimateFilter.planItemRef.code = planWorkItem.code;
			    	 estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

			    	 ENEstimateItemShortList estimateList = estimateDAO.getScrollableFilteredList(estimateFilter, 0, -1);
			    	 for (int ii=0; ii < estimateList.totalCount; ii++){
			    		 ENEstimateItemFilter estimateFilter1 = new ENEstimateItemFilter();
			    		 estimateFilter1.materialRef.code = estimateList.get(ii).materialRefCode;
			    		 estimateFilter1.planItemRef.code = parentCurrentPlanItem.code;
			    		 estimateFilter1.kindRef.code = ENEstimateItemKind.MATERIALS;
			    		 int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter1, 0, -1);
			    		 if (eArr.length == 0){
			    			 // мат-л не найден ... накинем его ...
			    			 ENEstimateItem e1 = estimateDAO.getObject(estimateList.get(ii).code);
			    			 e1.planRef.code = parentCurrentPlanItem.planRef.code;
			    			 e1.planItemRef.code = parentCurrentPlanItem.code;
			    			 estimateDAO.add(e1);

				    		 ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
				    		 e2e.estimateItemInRef.code = e1.code;
				    		 e2e.estimateItemOutRef.code = estimateList.get(ii).code;
				    		 e2e.countGen = estimateList.get(ii).countFact;
				    		 e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
				    		 e2eDAO.add(e2e);

			    		 }
			    		 else{
				    		 for (int qq=0; qq<eArr.length; qq++){
				    			 ENEstimateItem e1 = estimateDAO.getObject(eArr[qq]);
				    			 BigDecimal deltaP = new BigDecimal(0);
				    			 BigDecimal deltaF = new BigDecimal(0);
				    			 for (int qq1=0; qq1 < oldEList.totalCount; qq1++){
				    				 if (oldEList.get(qq1).code == estimateList.get(ii).code){
				    					 deltaF = estimateList.get(ii).countFact.subtract(oldEList.get(qq1).countFact).setScale(6, BigDecimal.ROUND_HALF_UP);
				    					 deltaP = estimateList.get(ii).countGen.subtract(oldEList.get(qq1).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
				    				 }
				    			 }

				    			 BigDecimal prevCount = e1.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);

				    			 e1.countGen = e1.countGen.add(deltaP).setScale(6, BigDecimal.ROUND_HALF_UP);
				    			 e1.countFact = e1.countFact.add(deltaF).setScale(6, BigDecimal.ROUND_HALF_UP);

				    			 if (e1.countGen.doubleValue() < 0.000001 ){
				    				 e1.countGen = new BigDecimal(0);
				    			 }
				    			 if (e1.countFact.doubleValue() < 0.000001 ){
				    				 e1.countFact = new BigDecimal(0);
				    			 }

					    		 String orderStr = checkInOrders(e1);

					    		 //20140915 SUPP-22711
					    		 //”брана проверка на переданный материал. ¬ыкенем при закрытии мес€чного плана.
					    		 //if ((orderStr.length() > 0) && ( prevCount.doubleValue() > e1.countFact.doubleValue())){
					    		 //	 throw new EnergyproSystemException("÷ей матер≥ал вже знаходитьс€ в ордер≥ є " + orderStr);
					    		 //}
					    		 eLogic.checkInContract(e1.code);

					    		 // NET-4529	ѕлан закупок , тендера// если в плане закупок не даем мен€ть
					    		 if (planWork.kind.code == ENPlanWorkKind.CURRENT) {
					    			 eLogic.checkInPurchaseItem(e1);
					    		 }

					    		 // нах а «јя¬ ј??!!! ...
					    		 eLogic.checkInRQOrder(e1, true);

				    			 estimateDAO.save(e1);

				    			 ENEstimateItem2ENEstimateItemFilter e2eFilter = new ENEstimateItem2ENEstimateItemFilter();
				    			 e2eFilter.estimateItemInRef.code = e1.code;
				    			 e2eFilter.estimateItemOutRef.code = estimateList.get(ii).code;
				    			 e2eFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
				    			 int[] e2eArr = e2eDAO.getFilteredCodeArray(e2eFilter, 0, -1);

				    			 if (e2eArr.length == 0){
						    		 ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
						    		 e2e.estimateItemInRef.code = e1.code;
						    		 e2e.estimateItemOutRef.code = estimateList.get(ii).code;
						    		 e2e.countGen = estimateList.get(ii).countFact;
						    		 e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
						    		 e2eDAO.add(e2e);
				    			 }
				    			 else
				    			 {
				    				 ENEstimateItem2ENEstimateItem e2e = e2eDAO.getObject(e2eArr[0]);
				    				 e2e.countGen = estimateList.get(ii).countFact;
				    				 e2eDAO.save(e2e);
				    			 }

				    		 }
			    	    }
			    	 }

			     }

			     // пресчитаем ¬–≈ћя на работе ... дл€ коэф ...
			     new PlanWorkItemLogic(connection, userProfile).updateCoef(parentCurrentPlanItem.code);


		     // ---------------------------

	  }


	  public void recalcCurrentAVRByEstimateItem(ENEstimateItem estimateItem, BigDecimal oldCountFact, boolean isRemove) throws PersistenceException
	  {

		  // подвисает √—ћ на мес€чных планах ...
		  // + демонтаж??
		  if (estimateItem.kindRef.code != ENEstimateItemKind.MATERIALS) return;

	    	 ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
	    	 PlanWorkLogic logic = new PlanWorkLogic(connection, userProfile);
	    	 ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(connection, userProfile);

	    	 ENPlanWorkItem parentCurrentPlanItem = logic.getParentCurrentPlanWorkItem(estimateItem.planItemRef.code);

	    	 if ((parentCurrentPlanItem.code == Integer.MIN_VALUE) && ( ! isRemove))
	    	{

	    		 ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);

	    		 ENPlanWorkItem planItem = piDAO.getObject(estimateItem.planItemRef.code);

		    	 parentCurrentPlanItem.kartaRef.code = planItem.kartaRef.code;
		    	 parentCurrentPlanItem.countGen = planItem.countGen;
		    	 parentCurrentPlanItem.commentGen = "работа создана с дочернего плана";
		    	 piDAO.add(parentCurrentPlanItem);
	    	 }


		    	 ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
		    	 eFilter.planItemRef.code = parentCurrentPlanItem.code;
		    	 eFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
		    	 eFilter.materialRef.code = estimateItem.materialRef.code;
		    	 int[] currentArr = estimateItemDAO.getFilteredCodeArray(eFilter, 0, -1);
		    	 if ((currentArr.length == 0)  && ( ! isRemove))
		    	 {
		    		 int newECode = estimateItem.code;
		    		 ENEstimateItem currEstimate = estimateItem;
		    		 currEstimate.planRef.code = parentCurrentPlanItem.planRef.code;
		    		 currEstimate.planItemRef.code = parentCurrentPlanItem.code;
		    		 estimateItemDAO.add(currEstimate);

		    		 int curECode = currEstimate.code;

		    		 ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		    		 e2e.estimateItemInRef.code = curECode;
		    		 e2e.estimateItemOutRef.code = newECode;
		    		 e2e.countGen = estimateItem.countFact;
		    		 e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		    		 e2eDAO.add(e2e);

		    	 }
		    	 else
		    	 {

		    		 ///BigDecimal deltaP = object.countGen.subtract(oldObject.countGen).setScale(6 , BigDecimal.ROUND_HALF_UP);
		    		 BigDecimal deltaF = estimateItem.countFact.subtract(oldCountFact).setScale(6 , BigDecimal.ROUND_HALF_UP);

		    		 if (isRemove ) deltaF = oldCountFact.multiply(new BigDecimal(-1)).setScale(6, BigDecimal.ROUND_HALF_UP);

		    		 ENEstimateItem currEstimate = estimateItemDAO.getObject(currentArr[0]);

		    		 BigDecimal prevCount = currEstimate.countFact.setScale(6, BigDecimal.ROUND_HALF_UP);

		    		 currEstimate.countFact = currEstimate.countFact.add(deltaF).setScale(6 , BigDecimal.ROUND_HALF_UP);
		    		 if (currEstimate.countFact.doubleValue() < 0.000001){
		    			 currEstimate.countFact = new BigDecimal(0);
		    		 }

		    		 String orderStr = checkInOrders(currEstimate);

		    		 if ((orderStr.length() > 0) && ( prevCount.doubleValue() > currEstimate.countFact.doubleValue())){
		    			 throw new EnergyproSystemException("÷ей матер≥ал вже знаходитьс€ в ордер≥ є " + orderStr + ",\n к≥льк≥сть повинна бути не менша н≥ж " + prevCount);
		    		 }

		    		 estimateItemDAO.save(currEstimate);

		    		 if (isRemove) return;

	    			 ENEstimateItem2ENEstimateItemFilter e2eFilter = new ENEstimateItem2ENEstimateItemFilter();
	    			 e2eFilter.estimateItemInRef.code = currEstimate.code;
	    			 e2eFilter.estimateItemOutRef.code = estimateItem.code;
	    			 e2eFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
	    			 int[] e2eArr = e2eDAO.getFilteredCodeArray(e2eFilter, 0, -1);

	    			 if (e2eArr.length == 0){
			    		 ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
			    		 e2e.estimateItemInRef.code = currEstimate.code;
			    		 e2e.estimateItemOutRef.code = estimateItem.code;
			    		 e2e.countGen = estimateItem.countFact;
			    		 e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
			    		 e2eDAO.add(e2e);
	    			 }
	    			 else
	    			 {
	    				 ENEstimateItem2ENEstimateItem e2e = e2eDAO.getObject(e2eArr[0]);
	    				 e2e.countGen = estimateItem.countFact;
	    				 e2eDAO.save(e2e);
	    			 }

		    	 }

	    	 }

	  public String checkInOrders(ENEstimateItem estimateItem) throws PersistenceException
	  {
		String out = "";
		RQFKOrderItem2ENEstimateItemDAO oi2eDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
		RQFKOrderItem2ENEstimateItemFilter f = new RQFKOrderItem2ENEstimateItemFilter();
		f.estimateItem.code = estimateItem.code;
		RQFKOrderItem2ENEstimateItemShortList list = oi2eDAO.getScrollableFilteredList(f, 0, -1);

		if (list.totalCount > 0 ){
			out = list.get(0).fkOrderRefNumberGen + " в≥д " + new SimpleDateFormat("dd.MM.yyyy").format(list.get(0).fkOrderRefDateGen);
			//throw new EnergyproSystemException("÷ей матер≥ал вже знаходитьс€ в ордер≥ є " + list.get(0).fkOrderRefNumberGen
			//		+ " в≥д " + new SimpleDateFormat("dd.MM.yyyy").format(list.get(0).fkOrderRefDateGen)
			//);
		}

		return out;
	  }

}
