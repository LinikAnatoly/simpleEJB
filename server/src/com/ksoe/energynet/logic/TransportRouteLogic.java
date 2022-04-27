package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportRoute2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRoute2RQTransportInvoiceDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDistanceDAO;
import com.ksoe.energynet.dataminer.generated.ENTransportRoute2RQFKOrderDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder;
import com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQTransportInvoiceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRoute2RQFKOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKTransportClassification;
import com.ksoe.techcard.valueobject.TKTransportType;



public class TransportRouteLogic extends LogicModule{


	  public TransportRouteLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }

	  public BigDecimal getWeightCargoOnTheRoute(int entransportrouteCode) throws PersistenceException
	  {
		  BigDecimal out = new BigDecimal(0);
		  ENTransportRoute2RQFKOrderDAOGen tr2fkDAO = new ENTransportRoute2RQFKOrderDAOGen(connection, userProfile);
		  RQFKOrderDAO fkDAO = new RQFKOrderDAO(connection, userProfile);
		  ENTransportRoute2RQFKOrderFilter tr2fkFilter = new ENTransportRoute2RQFKOrderFilter();
		  tr2fkFilter.transportRouteRef.code = entransportrouteCode;
		  ENTransportRoute2RQFKOrderShortList tr2fkList = tr2fkDAO.getScrollableFilteredList(tr2fkFilter, 0, -1);

		  // ���� ���� ������ ��� ������� ������� �������� ����� �����
		  if (tr2fkList.totalCount != 0) {
			// ���� �� ������
		  }
		  for(int i = 0; i < tr2fkList.totalCount; i++)
		  {
			  out = out.add(fkDAO.getSumWeightCargoByFkOrder(tr2fkList.get(i).fkOrderRefCode));
		  }


		  return out;
	  }

	  public boolean isPresentRouteInPlan(int entransportitemCode) throws PersistenceException
	  {
		  boolean result = false;
		  ENTransportItemDAO tiDAO  = new ENTransportItemDAO(connection, userProfile);
		  ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);

		  // ���������� ��� ��  �� ��������� ���������� ����� ������������ �������� - ���� ���� ����� ��� ������
		  ENTransportItem ti = tiDAO.getObject(entransportitemCode);

			  ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			  routeFilter.planRef.code = ti.planRef.code;
			  ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter, 0, -1);
			  if (routeList.totalCount > 0 ){
				  // ����� ������� �� �������
				  result = true;
			  }



		  return result;

	  }

	  public void generateGSMEstimateByRoute(int transportItemCode) throws PersistenceException
	  {
		  generateGSMEstimateByRoute_(transportItemCode, false);
	  }

	  public void generateGSMEstimateByRoute_Forced(int transportItemCode) throws PersistenceException
	  {
		  generateGSMEstimateByRoute_(transportItemCode, true); //� �.�. � ��� ���, ��� ��� �������� � ��
	  }

	  public void generateGSMEstimateByRoute_(int transportItemCode , boolean force) throws PersistenceException
	  {
		  TransportLogic tLogic = new TransportLogic(connection, userProfile);
		  if (!force && tLogic.checkTransportItemInTravelSheet(transportItemCode, false)) return;
		  TransportLogic eLogic = new TransportLogic(connection, userProfile);
		  if (eLogic.checkTransportItemInTravelSheet(transportItemCode, false)) return;
		  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
		  ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
		  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);

		  ENTransportItem t = tDAO.getObject(transportItemCode);

		  if (t.tktransportType.code != TKTransportType.MECHANIZM){

		  BigDecimal rashod = new BigDecimal(0);
		  String tempComment = null;


		  BigDecimal val = new BigDecimal(0);
		  int estimateCode = Integer.MIN_VALUE;
		  if (t.transportReal != null){
			  if (t.transportReal.code > Integer.MIN_VALUE) {

				  // ������� ���� ����� ... ��������� �����. ��� ������� ������� ...
				 // ENPlanWork plan = new PlanWorkLogic(connection, userProfile).getPlanByCode(t.planRef.code);
				 // BigDecimal winterCoeff = calcWinterCoeff(plan.dateStart);

				  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
				  t2Filter.transportRef.code = transportItemCode;
				  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);

				  if ( t2eList.totalCount > 0){

					  for (int i=0; i < t2eList.totalCount; i++){
					     ENEstimateItem newEItem = eDAO.getObject(t2eList.get(i).estimateRefCode);
					     estimateCode = newEItem.code;
					     newEItem.materialRef.code = t.transportReal.fuelType.materialRef.code ;
					     if (t.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN )
					     {rashod = calculateFuelForAVTO_KRAN(transportItemCode);} // ��������
					     if (t.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO)
					     {
					    	 rashod = calculateFuelForAVTO_CARGO(transportItemCode); // �������� ���������
					    	 // ������� �������� � ���������� � ���������� � ���������
					    	 /*String rashodArr[] = calculateFuelForAVTO_CARGO2(transportItemCode);
					    	 if (rashodArr[0] != null){
							     rashod = new BigDecimal(rashodArr[0]);}
		                         else
		                         {rashod = new BigDecimal(0);}
					    	 if (rashodArr[1] != null){
					    		 tempComment = rashodArr[1];
					    	 }
					    	 else{
					    		 tempComment = "";
					    	 } */

					     } // �������� ���������



					     newEItem.commentGen = t.transportReal.name + ", ���.���: " + t.transportReal.gosNumber + ", ������� :" +  rashod.toString() + " �";

					     val = rashod.setScale(2, BigDecimal.ROUND_HALF_UP) ;

					     newEItem.countGen = val;

					     newEItem.countFact = newEItem.countGen;
						 newEItem.typeRef.code = ENEstimateItemType.AUTO;


					     eDAO.save(newEItem);
					  }
				  }
				  else{

					  if (t.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN )
					  rashod = calculateFuelForAVTO_KRAN(transportItemCode); // ��������
					  if (t.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO )
					  rashod = calculateFuelForAVTO_CARGO(transportItemCode); // �������� ���������
					  val = rashod.setScale(2, BigDecimal.ROUND_HALF_UP) ;// ��������� !!! ;)

					    if (val.doubleValue() > 0.009)
					    {
						    int eCode = Integer.MIN_VALUE;
							ENEstimateItem ee = new ENEstimateItem();
							ee.kindRef.code = ENEstimateItemKind.GSM;
							ee.planRef.code = t.planRef.code;
							ee.planItemRef.code = t.planItemRef.code;
							ee.countGen = val;
							ee.materialRef.code = t.transportReal.fuelType.materialRef.code ;
							ee.typeRef.code = ENEstimateItemType.AUTO;
							ee.countFact = val;
							ee.cost = new BigDecimal(0);
							ee.userGen = userProfile.userName;
							ee.dateEdit = new Date();

							ee.commentGen = t.transportReal.name + ", ���.��� " + t.transportReal.gosNumber + ", �������:" +  rashod.toString() + " �.";

							ee.statusRef.code = ENEstimateItemStatus.PLANNED;

						    eCode = eDAO.add(ee);
						    ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						    t2.transportRef.code = transportItemCode;
						    t2.estimateRef.code = eCode;
						    t2DAO.add(t2);
						    estimateCode = eCode;
					    }
				  }

				  // �������� �� 0 �� � ������� .. ���� 0 � ���� �������� - � ��� .. ����� �������� ...
				  if ( val.doubleValue() < 0.009 ){

					  if (estimateCode != Integer.MIN_VALUE){

					  EstimateLogic estLogic = new EstimateLogic(connection, userProfile);
					  FINMaterialsShortList fList = estLogic.getFINMaterialsListByEstimateItemCode(estimateCode);
					  if ( fList.totalCount > 0){
						  throw new EnergyproSystemException("�� ������ ��� ���� ����������������� �������� ... �������� �������������� !!!");
					  }
					  }
				  }
				  
				  ///// NET-4440 ��������� ������� ��� �� �����
				  // 27.02.15 ������� ������, �.�. ����� ����� ���������� �� ������� ������� � ������������!
				  // PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
				  // planLogic.generatePlanFuelHistory(t.planRef.code);
				  ///// 				  

			  } // �������� ��������
		  } // ���� ���� ���������
	  }
	  }

	  public BigDecimal calculateFuelForAVTO_KRAN(int transportItemCode) throws PersistenceException
	  {
		BigDecimal out = new BigDecimal(0);
		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItem tr = trDAO.getObject(transportItemCode);
        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
		// ��������� ������ ����� ������ ���� ���������  ...
		ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

		if ( pwi.countGen.doubleValue() <= 0.0 ){
			return out;
		}

		// ���� �� ��������� � �����
		ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
		routeFilter.planRef.code = tr.planRef.code;
		ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
		// ������� ������� Q� = 0,01 � �s � S � (1 + 0,01 � KE) + ��� � ��� � (1 + 0,01 � KE�),
		// �s - ������ ����� ����� ������� ������ �� ����� ������������ ���������, �/100 �� (�3/100 ��);
		BigDecimal nS = tr.transportReal.rashodProbeg;
		if (nS == null){
			  throw new EnergyproSystemException("������ �� ������ �� ������ ...");
		  }
	    // ��� - ����� ������� ������ �� ������ ������������ ����������, �/���. ��� ���� �� �������� �������� (���������� ��������, ����);
		BigDecimal nOB = tr.transportReal.rashodWork;
		//if (nOB == null){
		//	throw new EnergyproSystemException("������ �� ���������� �� ������ ...");
		//}
		// ��� - ��� ������ ����������, ����� ��� ������� ��������� ��������;
		BigDecimal tOB = tr.countWorkFact;
		BigDecimal sumKoef = new BigDecimal(0);
		BigDecimal byDistance = new BigDecimal(0);
		BigDecimal tempDist = new BigDecimal(0);
		BigDecimal tempHours = new BigDecimal(0);
		for (int i=0; i < routeList.totalCount; i++){
			// ��� ��� �������� ����� ���� ������ �� ������ �� ����������� ������� ������ � �����
			tempDist = new BigDecimal(0.01).multiply(nS).multiply(routeList.get(i).distance); //.multiply( (new BigDecimal(1).add(new BigDecimal(0.01)).multiply(sumKoef) ));
			tempDist = tempDist.multiply( new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)) );
			byDistance = byDistance.add(tempDist);
			tempDist = new BigDecimal(0);

		}
		// � ���������� ��� �� �� ������ ���������� ������ �� ������
		tempHours = nOB.multiply(tOB).multiply( new BigDecimal(1));
		out = byDistance.add(tempHours);
		out = out.setScale(2, BigDecimal.ROUND_HALF_UP);

		return out;
	  }

	  public BigDecimal calculateFuelForAVTO_CARGO(int transportItemCode) throws PersistenceException
	  {
		  BigDecimal out = new BigDecimal(0);
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportItem tr = trDAO.getObject(transportItemCode);
	        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			// ��������� ������ ����� ������ ���� ���������  ...
			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return out;
			}

			// ���� �� ��������� � �����
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.planRef.code = tr.planRef.code;
			ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);

			// �s - ������ ����� ����� ������� ������ �� ����� ������������ ���������, �/100 �� (�3/100 ��);
			BigDecimal nS = tr.transportReal.rashodProbeg;
		    // Hg - �����  ������� ������  �� ���� ����� ���������� ���� ������� ��� ����������� ����� � �.1.4,  �/100  �-��  (� ���./100 �-��)
			BigDecimal nG = new BigDecimal(0);
			if ((tr.transportReal.transportmark.fueltype.code == TKFuelType.A80)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A92)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
            nG = new BigDecimal(1.4);}
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
			{nG = new BigDecimal(0.9);}
			// Gnp - ���������� ���� ������� ��� �����������, �,
			BigDecimal gPR = new BigDecimal(0); // ��������� 5 ���� . �� ��������� ���� ����� ������� �� ��������� ����� "������������������"
			if (tr.isUseTrailer == 1 ){
				gPR = new BigDecimal(5);
			}
		    // Hw - ����� �� ����������� ������ ����� � �. 1.3, �/100 ��� (�3/100 ���),
			BigDecimal nW = new BigDecimal(0);
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.A80
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A92
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
				{nW = new BigDecimal(1.4);}
				if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
				{nW = new BigDecimal(0.9);}
			// W - ����� ����������� ������, ��� (W = G��� S���, �� G��� - ���� �������, S��� - ����� � ��������).
			BigDecimal w = new BigDecimal(0);
			//G��� - ���� �������
			BigDecimal gVAN = new BigDecimal(0);
			// S��� - ����� � ��������).
			BigDecimal sVAN = new BigDecimal(0);
			//�san - ����� ����� ������� ������ �� ����� ���������:	�san = Hs + Hg � Gnp, �/100 �� (�3/100 ��),
			BigDecimal nSAN = new BigDecimal(0);
			nSAN = nS.add(nG.multiply(gPR));
			BigDecimal sumKoef = new BigDecimal(0);
			BigDecimal tempOut = new BigDecimal(0);
			for (int i=0; i < routeList.totalCount; i++){
				gVAN = routeList.get(i).weight.divide(new BigDecimal(1000),BigDecimal.ROUND_HALF_UP); // this.getWeightCargoOnTheRoute(routeList.get(i).code);
				sVAN = routeList.get(i).distance;
				w = gVAN.multiply(sVAN);
				tempOut = new BigDecimal(0.01).multiply(nSAN.multiply(sVAN).add(nW.multiply(w))
						                                ).multiply(new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)));
				out = out.add(tempOut);
			}
			out = out.setScale(2, BigDecimal.ROUND_HALF_UP);

			return out;
	  }

	  public String[] calculateFuelForAVTO_CARGO2(int transportItemCode) throws PersistenceException
	  {
		  BigDecimal out = new BigDecimal(0);
		  String[] array;
	      array = new String[2];
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportItem tr = trDAO.getObject(transportItemCode);
	        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			// ��������� ������ ����� ������ ���� ���������  ...
			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return array;
			}

			// ���� �� ��������� � �����
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.planRef.code = tr.planRef.code;
			ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);

			// �s - ������ ����� ����� ������� ������ �� ����� ������������ ���������, �/100 �� (�3/100 ��);
			BigDecimal nS = tr.transportReal.rashodProbeg;
		    // Hg - �����  ������� ������  �� ���� ����� ���������� ���� ������� ��� ����������� ����� � �.1.4,  �/100  �-��  (� ���./100 �-��)
			BigDecimal nG = new BigDecimal(0);
			if ((tr.transportReal.transportmark.fueltype.code == TKFuelType.A80)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A92)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
            nG = new BigDecimal(1.4);}
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
			{nG = new BigDecimal(0.9);}
			// Gnp - ���������� ���� ������� ��� �����������, �,
			BigDecimal gPR = new BigDecimal(0); // ����� ����� ��� ������� ������ ���� ���� �� ���� ��� ����� tr.transportReal.ladenMass;
		    // Hw - ����� �� ����������� ������ ����� � �. 1.3, �/100 ��� (�3/100 ���),
			BigDecimal nW = new BigDecimal(0);
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.A80
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A92
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
				{nW = new BigDecimal(1.4);}
				if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
				{nW = new BigDecimal(0.9);}
			// W - ����� ����������� ������, ��� (W = G��� S���, �� G��� - ���� �������, S��� - ����� � ��������).
			BigDecimal w = new BigDecimal(0);
			//G��� - ���� �������
			BigDecimal gVAN = new BigDecimal(0);
			// S��� - ����� � ��������).
			BigDecimal sVAN = new BigDecimal(0);
			//�san - ����� ����� ������� ������ �� ����� ���������:	�san = Hs + Hg � Gnp, �/100 �� (�3/100 ��),
			BigDecimal nSAN = new BigDecimal(0);
			nSAN = nS.add(nG.multiply(gPR));
			BigDecimal sumKoef = new BigDecimal(0);
			BigDecimal tempOut = new BigDecimal(0);
			for (int i=0; i < routeList.totalCount; i++){
				gVAN = routeList.get(i).weight.divide(new BigDecimal(1000), BigDecimal.ROUND_HALF_UP); // this.getWeightCargoOnTheRoute(routeList.get(i).code);
				sVAN = routeList.get(i).distance;
				w = gVAN.multiply(sVAN);
				tempOut = new BigDecimal(0.01).multiply(nSAN.multiply(sVAN).add(nW.multiply(w))
						                                ).multiply(new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)));
				out = out.add(tempOut);
			}
			out = out.setScale(2, BigDecimal.ROUND_HALF_UP);

			  array[0] = out.toString();
		      array[1] = "����������";

			  return array;
	  }

	  /* �������� ������ �� ���� ����� �� ���������� ���������� */
	  public void recalcEntransportRouteBySpeedometer(ENTravelSheetItem travelSheetItem) throws PersistenceException
		{
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			ENTransportRoute rou = null;


			// ������� ��� ����� ������� ������ � ���������� ����� � �������� �������
			// ����� �������� ���� �������� ��� � ��������� ���� ��������
			  BigDecimal routeDistance = new BigDecimal(0);
			  ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			  routeFilter.planRef.code = travelSheetItem.planRef.code;
			  ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter, 0, -1);
			  for (int i=0; i < routeList.totalCount; i++){
				  rou = routeDAO.getObject(routeList.get(i).code);
				  rou.distanceNew = routeList.get(i).distance;
				  routeDistance = routeDistance.add(routeList.get(i).distance);
				  routeDAO.save(rou);

			}


			  // ������ ����� ��������� ���� � ����� ���� ��� �� � ���� �������� ��� ��������� ������� ��������� ���������� � ����� ���� ������ .
			  routeFilter.conditionSQL = " ENTRANSPORTROUTE.CODE in ( select tt.code from ENTRANSPORTROUTE tt where tt.planrefcode = " + travelSheetItem.planRef.code + " order by tt.code  desc limit 1   ) ";
			  int rouArr[] = routeDAO.getFilteredCodeArray(routeFilter,0, -1);
			  if (rouArr.length != 0) {

			   rou = routeDAO.getObject(rouArr[0]);
			  // ���� �� ���������� ���������� ������ ����� �� ��������� ����� �������� �������
			  BigDecimal distanceSpeedometr = travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart);
			  BigDecimal dif = new BigDecimal(0);
			  if (routeDistance.doubleValue() > distanceSpeedometr.doubleValue() ){
				  rou.distanceNew =  rou.distance.subtract(routeDistance.subtract(travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)));
			  }
			 // ���� �� ���������� ���������� ������ ����� �� ��������� ����� ���������� �������
			  if (routeDistance.doubleValue() < distanceSpeedometr.doubleValue() ){
				  dif = (travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)).subtract(routeDistance);
				  rou.distanceNew = rou.distance.add(dif);
				  // rou.distance =  rou.distance.add(travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)).subtract(routeDistance);
			  }
			  routeDAO.save(rou);
			  }

		}

/* ������ ������� �� ��������� ����������� ��� ��������� ���������� (������ ����) */
public BigDecimal calculateFuelDistanceByRouteForAVTO_CARGO(ENTravelSheet trsh , ENTravelSheetItem trshit ) throws PersistenceException
{
	BigDecimal out = new BigDecimal(0);
	// ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
	// ENTransportItem tr = trDAO.getObject(transportItemCode);
    ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
    ENTransportRouteDistanceDAO routeDistanceDAO = new ENTransportRouteDistanceDAO(connection, userProfile);
    TKTransportRealDAO trDAO = new TKTransportRealDAO(connection, userProfile);
    TransportLogic trLogic = new TransportLogic(connection, userProfile);
	
    // ���� �� ��������� � �����
	ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
	routeFilter.planRef.code = trshit.planRef.code;
	ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
	
	boolean isGPS = trLogic.isGPS(trsh.transportReal.code, trsh.dateFinal);

	// �s - ������ ����� ����� ������� ������ �� ����� ������������ ���������, �/100 �� (�3/100 ��);
	// BigDecimal nS = trsh.transportReal.transportmark.rashodProbeg;
	
	// ��������� ����������� ��� ������� ������� ��� ��������������
	BigDecimal sumFuelKoefOfTransport = trDAO.getAggregateSumKoefs(trsh.transportReal.code);
	sumFuelKoefOfTransport = sumFuelKoefOfTransport.add(trLogic.getTemperatureCoeff(trsh.transportReal.transportdepartmentRef.code, Tools.clearTimeOfDate(trshit.timeFinal)));
	// NET-3728 �� ������� ����� ��������� �632 �� 22.11.2012 ������� ��� ���� ����� � GPS-�������� 2% ������ ����������� ������� �������
	if(isGPS)
		sumFuelKoefOfTransport = sumFuelKoefOfTransport.add(new BigDecimal(0.02).setScale(2, BigDecimal.ROUND_HALF_UP));
	
	BigDecimal nS = trsh.transportReal.rashodProbeg;
	nS = nS.multiply(sumFuelKoefOfTransport).setScale(2, BigDecimal.ROUND_HALF_UP);
	
    // Hg - �����  ������� ������  �� ���� ����� ���������� ���� ������� ��� ����������� ����� � �.1.4,  �/100  �-��  (� ���./100 �-��)
	BigDecimal nG = new BigDecimal(0);
	if ((trsh.transportReal.transportmark.fueltype.code == TKFuelType.A80)
    	||
    	(trsh.transportReal.transportmark.fueltype.code == TKFuelType.A92)
    	||
    	(trsh.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
    nG = new BigDecimal(1.4);}
	if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.DT)
	{nG = new BigDecimal(0.9);}
	// Gnp - ���������� ���� ������� ��� �����������, �,
	BigDecimal gPR = new BigDecimal(0); //  ����� ����� ��� ������� ������ ���� ���� �� ���� ��� ����� tr.transportReal.ladenMass;
	BigDecimal massTrailer1 = new BigDecimal(0);
	BigDecimal massTrailer2 = new BigDecimal(0);

	if (trsh.trailer1.ladenMass != null ){
		massTrailer1 = trsh.trailer1.ladenMass;
	}
	if (trsh.trailer2.ladenMass != null ){
		massTrailer2= trsh.trailer2.ladenMass;
	}
	boolean isUseTrailer = (massTrailer1.doubleValue() != 0 || massTrailer2.doubleValue() != 0 );

	gPR = massTrailer1.add(massTrailer2).divide(new BigDecimal(1000), BigDecimal.ROUND_HALF_UP);
    // Hw - ����� �� ����������� ������ ����� � �. 1.3, �/100 ��� (�3/100 ���),
	BigDecimal nW = new BigDecimal(0);
	if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.A80
        	||
        	trsh.transportReal.transportmark.fueltype.code == TKFuelType.A92
        	||
        	trsh.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
		{nW = new BigDecimal(1.4);}
		if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.DT)
		{nW = new BigDecimal(0.9);}
	// W - ����� ����������� ������, ��� (W = G��� S���, �� G��� - ���� �������, S��� - ����� � ��������).
	BigDecimal w = new BigDecimal(0);
	//G��� - ���� �������
	BigDecimal gVAN = new BigDecimal(0);
	// S��� - ����� � ��������).
	BigDecimal sVAN = new BigDecimal(0);
	//�san - ����� ����� ������� ������ �� ����� ���������:	�san = Hs + Hg � Gnp, �/100 �� (�3/100 ��),
	BigDecimal nSAN = new BigDecimal(0);
	nSAN = nS.add(nG.multiply(gPR));
	BigDecimal sumKoef = new BigDecimal(0);
	BigDecimal tempOut = new BigDecimal(0);
	for (int i=0; i < routeList.totalCount; i++){
		gVAN = routeList.get(i).weight.divide(new BigDecimal(1000), BigDecimal.ROUND_HALF_UP); // this.getWeightCargoOnTheRoute(routeList.get(i).code);
		sVAN = routeList.get(i).distanceNew;
		
		// ��������� ����� � ����������� � �������������� ��� ������� �������
		ENTransportRouteDistanceFilter trdFilter = new ENTransportRouteDistanceFilter();
		trdFilter.transportRouteRef.code = routeList.get(i).code;
		ENTransportRouteDistanceShortList trdList = routeDistanceDAO.getScrollableFilteredList(trdFilter, 0, -1);
		
		// ���������� sVan �� ��������� � ��������������
		for(int j = 0; j < trdList.totalCount; j++)
			sVAN = sVAN.subtract(trdList.get(j).distance);
		
		w = gVAN.multiply(sVAN);
		tempOut = new BigDecimal(0.01).multiply(nSAN.multiply(sVAN).add(nW.multiply(w))
				                                ).multiply(new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)));
		
		// ������ ������� �������� ������������� ������� �������� �� ��������� �������
		BigDecimal[] fuelCountedByKoef = new BigDecimal[trdList.totalCount];
		for(int j = 0; j < trdList.totalCount; j++)
		{
			BigDecimal koef = routeDistanceDAO.getAggregateSumOfKoefs(trdList.get(j).code, sumFuelKoefOfTransport);
			BigDecimal rashodProbegWithKoef = trsh.transportReal.rashodProbeg.multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
			BigDecimal distanceKoef = trdList.get(j).distance;
			BigDecimal w1 = gVAN.multiply(distanceKoef); // w1 - ���������� w ��� ���������� ��������� � �������������� ��� �������� �������
			BigDecimal nSAN1 = rashodProbegWithKoef.add(nG.multiply(gPR)); // nSAN1 - ���������� nSAN ��� ���������� ��������� � �������������� ��� �������� �������
			
			fuelCountedByKoef[j] = new BigDecimal(0.01).multiply(nSAN1.multiply(distanceKoef).add(nW.multiply(w1))
            ).multiply(new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)));
			tempOut = tempOut.add(fuelCountedByKoef[j]);
		}
		

		
		
		out = out.add(tempOut);
		tempOut = new BigDecimal(0);
	}
	out = out.setScale(1, BigDecimal.ROUND_HALF_UP);

	return out;
}


/**
 * 
 * ������ ������� �� ��������� ����������� ��� ���� ����� (������ ����) 
 * 
 * @param trsh ������� ����
 * @param trshit ������ �������� �����
 * @return BigDecimal - ����������� �������
 * @throws PersistenceException
 */
public BigDecimal calculateFuelDistanceByRouteForAVTO_KRAN(ENTravelSheet trsh , ENTravelSheetItem trshit ) throws PersistenceException
{
	BigDecimal out = new BigDecimal(0);
	// ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
    // ENTransportItem tr = trDAO.getObject(transportItemCode);
    ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);


	// ���� �� ��������� � �����
	ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
	routeFilter.planRef.code = trshit.planRef.code;
	ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
	// ������� ������� Q� = 0,01 � �s � S � (1 + 0,01 � KE) + ��� � ��� � (1 + 0,01 � KE�),
	// �s - ������ ����� ����� ������� ������ �� ����� ������������ ���������, �/100 �� (�3/100 ��);
	BigDecimal nS = trsh.transportReal.rashodProbeg;
	if (nS == null){
		  throw new EnergyproSystemException("������ �� ������ �� ������ ...");
	  }
  // ��� - ����� ������� ������ �� ������ ������������ ����������, �/���. ��� ���� �� �������� �������� (���������� ��������, ����);
	BigDecimal nOB = trsh.transportReal.rashodWork;
	//if (nOB == null){
	//	throw new EnergyproSystemException("������ �� ���������� �� ������ ...");
	//}
	// ��� - ��� ������ ����������, ����� ��� ������� ��������� ��������;
	//BigDecimal tOB = new BigDecimal(0);
	BigDecimal sumKoef = new BigDecimal(0);
	BigDecimal byDistance = new BigDecimal(0);
	for (int i=0; i < routeList.totalCount; i++){
		// ��� ��� �������� ����� ���� ������ �� ������ �� ����������� ������� ������ � �����
		byDistance = byDistance.add(new BigDecimal(0.01).multiply(nS).multiply(routeList.get(i).distanceNew).multiply( new BigDecimal(1).add(new BigDecimal(0.01)).multiply(sumKoef) ));

	}
	// � ���������� ��� �� �� ������ ���������� ������ �� ������
	// out = byDistance.add(nOB).multiply(tOB).multiply( new BigDecimal(1));
	out = out.setScale(1, BigDecimal.ROUND_HALF_UP);

	return out;
}


	public void copyRoute(int planCode, int newPlanCode)
			throws PersistenceException {
		ENTransportRouteDAO tr2routeDAO = new ENTransportRouteDAO(connection, userProfile);
		ENTransportRouteFilter tr2routeFilter = new ENTransportRouteFilter();
		tr2routeFilter.planRef.code = planCode;
		int tr2routeArr[] = tr2routeDAO.getFilteredCodeArray(tr2routeFilter, 0,	-1);

		int routeParentCode = Integer.MIN_VALUE;

		if (tr2routeArr.length > 0) {
			for (int r = 0; r < tr2routeArr.length; r++) {
				ENTransportRoute route = tr2routeDAO.getObject(tr2routeArr[r]);
				ENTransportRoute routeNew = tr2routeDAO.getObject(tr2routeArr[r]);
				routeNew.code = Integer.MIN_VALUE;
				routeNew.planRef.code = newPlanCode;
				routeNew.parentRouteRef.code = routeParentCode;

				int routeNewCode = routeParentCode = tr2routeDAO.add(routeNew);

				/* ����� �������� � ��������� */
				ENTransportRoute2RQFKOrderDAO to2fkOrderDAO = new ENTransportRoute2RQFKOrderDAO(
						connection, userProfile);
				ENTransportRoute2RQFKOrderFilter to2fkOrderFilter = new ENTransportRoute2RQFKOrderFilter();
				to2fkOrderFilter.transportRouteRef.code = route.code;
				int to2fkOrder[] = to2fkOrderDAO.getFilteredCodeArray(to2fkOrderFilter, 0, -1);

				if (to2fkOrder.length > 0) {
					for (int t = 0; t < to2fkOrder.length; t++) {
						ENTransportRoute2RQFKOrder to2fkOrderNew = to2fkOrderDAO.getObject(to2fkOrder[t]);
						to2fkOrderNew.code = Integer.MIN_VALUE;
						to2fkOrderNew.transportRouteRef.code = routeNewCode;
						to2fkOrderDAO.add(to2fkOrderNew);
					}
				}

				/* ����� �������� � ������������ ��������� */
				ENTransportRoute2RQTransportInvoiceDAO to2invoiceDAO = new ENTransportRoute2RQTransportInvoiceDAO(
						connection, userProfile);
				ENTransportRoute2RQTransportInvoiceFilter to2invoiceFilter = new ENTransportRoute2RQTransportInvoiceFilter();
				to2invoiceFilter.transportRouteRef.code = route.code;
				int to2invoice[] = to2invoiceDAO.getFilteredCodeArray(to2invoiceFilter, 0, -1);

				if (to2invoice.length > 0) {
					for (int n = 0; n < to2invoice.length; n++) {
						ENTransportRoute2RQTransportInvoice to2invoiceNew = to2invoiceDAO.getObject(to2invoice[n]);
						to2invoiceNew.code = Integer.MIN_VALUE;
						to2invoiceNew.transportRouteRef.code = routeNewCode;
						to2invoiceDAO.add(to2invoiceNew);
					}
				}
			}
		}
	}

	public void deleteRoute(int planCode) throws PersistenceException {
		ENTransportRouteDAO tr2routeDAO = new ENTransportRouteDAO(connection, userProfile);
		ENTransportRouteFilter tr2routeFilter = new ENTransportRouteFilter();
		tr2routeFilter.planRef.code = planCode;
		tr2routeFilter.conditionSQL = " NOT EXISTS (select 1 from "
				+ ENTransportRoute.tableName + " as q1 where q1."
				+ ENTransportRoute.parentRouteRef_Field + " = "
				+ ENTransportRoute.code_QFielld + ")";
		
		int[] tr2routeArr = tr2routeDAO.getFilteredCodeArray(tr2routeFilter, 0, -1);
		int pCode = Integer.MIN_VALUE;
		if(tr2routeArr.length > 0)
			pCode = tr2routeArr[0];
		
		while(tr2routeArr.length > 0 && pCode != Integer.MIN_VALUE) {
			
			ENTransportRoute route = tr2routeDAO.getObject(pCode);
			
			/* ����� �������� � ��������� */
			ENTransportRoute2RQFKOrderDAO to2fkOrderDAO = new ENTransportRoute2RQFKOrderDAO(
					connection, userProfile);
			ENTransportRoute2RQFKOrderFilter to2fkOrderFilter = new ENTransportRoute2RQFKOrderFilter();
			to2fkOrderFilter.transportRouteRef.code = route.code;
			int to2fkOrder[] = to2fkOrderDAO.getFilteredCodeArray(to2fkOrderFilter, 0, -1);

			if (to2fkOrder.length > 0) {
				for (int t = 0; t < to2fkOrder.length; t++) {
					to2fkOrderDAO.remove(to2fkOrder[t]);
				}
			}

			/* ����� �������� � ������������ ��������� */
			ENTransportRoute2RQTransportInvoiceDAO to2invoiceDAO = new ENTransportRoute2RQTransportInvoiceDAO(
					connection, userProfile);
			ENTransportRoute2RQTransportInvoiceFilter to2invoiceFilter = new ENTransportRoute2RQTransportInvoiceFilter();
			to2invoiceFilter.transportRouteRef.code = route.code;
			int to2invoice[] = to2invoiceDAO.getFilteredCodeArray(to2invoiceFilter, 0, -1);

			if (to2invoice.length > 0) {
				for (int n = 0; n < to2invoice.length; n++) {
					to2invoiceDAO.remove(to2invoice[n]);
				}
			}
			
			tr2routeDAO.remove(pCode);
			
			// ���� ��������� ��� ��� ��������
			tr2routeFilter = new ENTransportRouteFilter();
			tr2routeFilter.planRef.code = planCode;
			tr2routeFilter.conditionSQL = " NOT EXISTS (select 1 from "
					+ ENTransportRoute.tableName + " as q1 where q1."
					+ ENTransportRoute.parentRouteRef_Field + " = "
					+ ENTransportRoute.code_QFielld + ")";
			
			tr2routeArr = tr2routeDAO.getFilteredCodeArray(tr2routeFilter, 0, -1);
			
			if(tr2routeArr.length > 0)
				pCode = tr2routeArr[0];
			
		}
		
	}

	public void addDistance(ENTransportRoute route, int planCode)
			throws PersistenceException {

		ENTransportItemDAO trItemDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
		trItemFilter.planRef.code = planCode;

		int trItemArr[] = trItemDAO.getFilteredCodeArray(trItemFilter, 0, -1);

		if (trItemArr.length > 0) {
			ENDistanceDAO distanceDAO = new ENDistanceDAO(connection, userProfile);
			ENDistanceFilter distanceFilter = new ENDistanceFilter();
			distanceFilter.transportItemRef.code = trItemArr[0];

			int dsArr[] = distanceDAO.getFilteredCodeArray_1(distanceFilter, null, null, 0, -1, null);

			ENDistance distance = new ENDistance();
			if (dsArr.length > 0) {
				distance = distanceDAO.getObject(dsArr[0]);
				distance.distance = distance.distance.add(route.distance);
				distanceDAO.save(distance);
			} else {
				distance.transportItemRef.code = trItemArr[0];
				distance.typeRef.code = ENDistanceType.DISTANCE_TO;
				distance.roadType.code = ENRoadType.GROUND;
				distance.distance = route.distance;
				distanceDAO.add(distance);
			}

			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			route.distanceRef.code = distance.code;
			route.distanceTypeRef.code = distance.typeRef.code;
			routeDAO.save(route);

		} else {
			throw new EnergyproSystemException(
					"�� �������� ���������� ������� �� ����!!!");
		}
	}

	public void recalcDistance(ENTransportRoute oldRoute, ENTransportRoute route, int planCode)
			throws PersistenceException {

		ENTransportItemDAO trItemDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
		trItemFilter.planRef.code = planCode;

		int trItemArr[] = trItemDAO.getFilteredCodeArray(trItemFilter, 0, -1);

		if (trItemArr.length > 0) {
			ENDistanceDAO distanceDAO = new ENDistanceDAO(connection, userProfile);
			ENDistanceFilter distanceFilter = new ENDistanceFilter();
			distanceFilter.transportItemRef.code = trItemArr[0];

			int dsArr[] = distanceDAO.getFilteredCodeArray_1(distanceFilter, null, null, 0, -1, null);

			ENDistance distance = new ENDistance();
			if (dsArr.length > 0) {
				distance = distanceDAO.getObject(dsArr[0]);
				distance.distance = (distance.distance.subtract(oldRoute.distance)).add(route.distance);
				distanceDAO.save(distance);
			} else {
				distance.transportItemRef.code = trItemArr[0];
				distance.typeRef.code = ENDistanceType.DISTANCE_TO;
				distance.roadType.code = ENRoadType.GROUND;
				distance.distance = route.distance;
				distanceDAO.add(distance);
			}

			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			route.distanceRef.code = distance.code;
			route.distanceTypeRef.code = distance.typeRef.code;
			routeDAO.save(route);

		} else {
			throw new EnergyproSystemException(
					"�� �������� ���������� ������� �� ����!!!");
		}
	}

	public void deleteDistance(ENTransportRoute route, int planCode)
			throws PersistenceException {

		ENTransportItemDAO trItemDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
		trItemFilter.planRef.code = planCode;

		int trItemArr[] = trItemDAO.getFilteredCodeArray(trItemFilter, 0, -1);

		if (trItemArr.length > 0) {
			ENDistanceDAO distanceDAO = new ENDistanceDAO(connection, userProfile);
			ENDistanceFilter distanceFilter = new ENDistanceFilter();
			distanceFilter.transportItemRef.code = trItemArr[0];

			int dsArr[] = distanceDAO.getFilteredCodeArray_1(distanceFilter, null, null, 0, -1, null);

			ENDistance distance = new ENDistance();
			if (dsArr.length > 0) {
				distance = distanceDAO.getObject(dsArr[0]);
				distance.distance = distance.distance.subtract(route.distance);
				distanceDAO.save(distance);
			}

		} else {
			throw new EnergyproSystemException(
					"�� �������� ���������� ������� �� ����!!!");
		}
	}


	public String getRoutesByPlan(int planCode) {
		String commentGen = "";
		String comment = "";

		try {

			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			ENTransportRouteFilter routesFilter = new ENTransportRouteFilter();
			routesFilter.planRef.code = planCode;
			ENTransportRouteShortList routesList;
			routesList = routeDAO.getScrollableFilteredList(routesFilter, 0, -1);

			if (routesList.totalCount > 0) {
				for (int r = 0; r < routesList.totalCount; r++) {
					comment = r+1 + ": " + routesList.get(r).destinationPointStart
							+ " - " +  routesList.get(r).destinationPointEnd;

					commentGen = commentGen + " " + comment + "; ";
				}
			} else {
				commentGen = "�����������";
			}
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		return commentGen;
	}
	
	/**
	 * 
	 * ��������� ���������� �� �������� � ��� ���������� 
	 * 
	 * @param code ��� ������������� ��������
	 * @return -1, 0, 1 - ���� ��������� �� �������� ������, ����� ��� ������ � ��������� � ��������� �� ���������� 
	 * @throws PersistenceException 
	 */
	public int checkRouteWithDistances(int code) throws PersistenceException
	{
		
		ENTransportRouteDistanceDAO trdDAO = new ENTransportRouteDistanceDAO(connection, userProfile);
		ENTransportRouteDAO trDAO = new ENTransportRouteDAO(connection, userProfile);
		
		ENTransportRoute trObj = trDAO.getObject(code);
		
		BigDecimal distanceRoute = (trObj.distanceNew == null) ? new BigDecimal(0) : trObj.distanceNew;
		BigDecimal sumDistances = trdDAO.getSumDistancesByTransportRouteCode(code);
		return distanceRoute.compareTo(sumDistances);
	}
	
	/**
	 * 
	 * �������� ��������� � ���������
	 * 
	 * @param fkOrderCode ��� ���������
	 * @param isException ���������� �� �������� ����������, ���� �����, �� �������� ����������,
	 * 	� ���. ������ ������ � ���� �����-�������, ���� ����-������
	 * 
	 * @return <b>true</b> ���� ��������� �������� � ��������, <b>false</b> - ���� ���.
	 * @throws PersistenceException 
	 */
	public boolean checkFKOrderInRoutes(int fkOrderCode, boolean isException) throws PersistenceException
	{
		boolean out = false;
		WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, userProfile);
        ENTransportRoute2RQFKOrderDAO tro2fkoDAO = new ENTransportRoute2RQFKOrderDAO(connection, userProfile);
        ENTransportRoute2RQFKOrderFilter tro2fkoFilter = new ENTransportRoute2RQFKOrderFilter();
        tro2fkoFilter.fkOrderRef.code = fkOrderCode;
        
        int tro2fkoArr[] = tro2fkoDAO.getFilteredCodeArray(tro2fkoFilter, 0, -1);
        
        out = tro2fkoArr.length > 0;
        
        if(out && isException)
        {
            String planCodes = "";
            String workOrderNums = "";
            for (int f = 0; f < tro2fkoArr.length; f++) {
                ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
                ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
                routeFilter.conditionSQL = " entransportroute.code in ( " +
                        " select t2fo.transportrouterefcode from entransportrot2rqfkrdr t2fo where t2fo.code = " + tro2fkoArr[f] + ")";

                ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter, 0, -1);
                if (routeList.totalCount > 0) {
                    for (int r = 0; r < routeList.totalCount; r++) {
                        planCodes = planCodes + " " + Integer.toString(routeList.get(r).planRefCode) + ",";
                        
                        // SUPP-16947 �������� ����� ����� �������� �����
                        ENWorkOrder workOrder = workOrderLogic.getWorkOrderByPlanCode(routeList.get(r).planRefCode, false);
                        if(workOrder != null)
                        {
                        	if(!workOrderNums.contains(workOrder.workOrderNumber))
                        	{
                        		if(workOrderNums.length() > 0)
                        			workOrderNums = workOrderNums + ", "+ workOrder.workOrderNumber + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen);
                        		else
                        			workOrderNums = workOrder.workOrderNumber + " �� " + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen);                       			
                        	}
                        }
                    }
                }
            }

            throw new EnergyproSystemException(
                    "\n �� �������� ��� �������� �� ������������� ��������!!! \n " +
            ((workOrderNums.length() > 0) ? "������ �����-�������: " + workOrderNums :
                    " ��� �����: " + planCodes));
        }
        
		return out;
	}

}


