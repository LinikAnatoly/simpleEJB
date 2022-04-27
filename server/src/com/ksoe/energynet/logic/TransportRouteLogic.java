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

		  // если есть ордера под маршрут вытянем сумарную массу груза
		  if (tr2fkList.totalCount != 0) {
			// цикл по связке
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

		  // переделать что бы  из транспорт имтемского плана вытягивались маршруты - если есть тогда наш случай
		  ENTransportItem ti = tiDAO.getObject(entransportitemCode);

			  ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			  routeFilter.planRef.code = ti.planRef.code;
			  ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter, 0, -1);
			  if (routeList.totalCount > 0 ){
				  // нашли маршрут на дистанс
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
		  generateGSMEstimateByRoute_(transportItemCode, true); //В т.ч. и для тех, что уже включены в ПЛ
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

				  // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
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
					     {rashod = calculateFuelForAVTO_KRAN(transportItemCode);} // автокран
					     if (t.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO)
					     {
					    	 rashod = calculateFuelForAVTO_CARGO(transportItemCode); // грузовой транспорт
					    	 // пробуем вытянуть и расстояния и коментарии к естимейту
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

					     } // грузовой транспорт



					     newEItem.commentGen = t.transportReal.name + ", гос.ном: " + t.transportReal.gosNumber + ", витрати :" +  rashod.toString() + " л";

					     val = rashod.setScale(2, BigDecimal.ROUND_HALF_UP) ;

					     newEItem.countGen = val;

					     newEItem.countFact = newEItem.countGen;
						 newEItem.typeRef.code = ENEstimateItemType.AUTO;


					     eDAO.save(newEItem);
					  }
				  }
				  else{

					  if (t.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN )
					  rashod = calculateFuelForAVTO_KRAN(transportItemCode); // автокран
					  if (t.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO )
					  rashod = calculateFuelForAVTO_CARGO(transportItemCode); // грузовой транспорт
					  val = rashod.setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

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

							ee.commentGen = t.transportReal.name + ", гос.ном " + t.transportReal.gosNumber + ", витрати:" +  rashod.toString() + " л.";

							ee.statusRef.code = ENEstimateItemStatus.PLANNED;

						    eCode = eDAO.add(ee);
						    ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						    t2.transportRef.code = transportItemCode;
						    t2.estimateRef.code = eCode;
						    t2DAO.add(t2);
						    estimateCode = eCode;
					    }
				  }

				  // проверим не 0 ли в расходе .. если 0 и есть развязка - В САД .. пусть отменяют ...
				  if ( val.doubleValue() < 0.009 ){

					  if (estimateCode != Integer.MIN_VALUE){

					  EstimateLogic estLogic = new EstimateLogic(connection, userProfile);
					  FINMaterialsShortList fList = estLogic.getFINMaterialsListByEstimateItemCode(estimateCode);
					  if ( fList.totalCount > 0){
						  throw new EnergyproSystemException("На строке ГСМ есть зарезервированный материал ... Отмените резервирование !!!");
					  }
					  }
				  }
				  
				  ///// NET-4440 Сохраняем историю ГСМ по плану
				  // 27.02.15 Убираем отсюда, т.к. метод будет вызываться во внешних методах в контроллерах!
				  // PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
				  // planLogic.generatePlanFuelHistory(t.planRef.code);
				  ///// 				  

			  } // реальный транспрт
		  } // тоже реал транспорт
	  }
	  }

	  public BigDecimal calculateFuelForAVTO_KRAN(int transportItemCode) throws PersistenceException
	  {
		BigDecimal out = new BigDecimal(0);
		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItem tr = trDAO.getObject(transportItemCode);
        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
		// ТОРМОЗЗЗЗ работы гдето раньше надо проверять  ...
		ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

		if ( pwi.countGen.doubleValue() <= 0.0 ){
			return out;
		}

		// цикл по маршрутам в плане
		ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
		routeFilter.planRef.code = tr.planRef.code;
		ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
		// формула расчета Qн = 0,01 • Нs • S • (1 + 0,01 • KE) + Ноб • Тоб • (1 + 0,01 • KEс),
		// Нs - базова лінійна норма витрати палива на пробіг спеціального автомобіля, л/100 км (м3/100 км);
		BigDecimal nS = tr.transportReal.rashodProbeg;
		if (nS == null){
			  throw new EnergyproSystemException("Расход на пробег не найден ...");
		  }
	    // Ноб - норма витрати палива на роботу спеціального обладнання, л/год. або літри на виконану операцію (заповнення цистерни, тощо);
		BigDecimal nOB = tr.transportReal.rashodWork;
		//if (nOB == null){
		//	throw new EnergyproSystemException("Расход на машиночасы не найден ...");
		//}
		// Тоб - час роботи обладнання, годин або кількість виконаних операцій;
		BigDecimal tOB = tr.countWorkFact;
		BigDecimal sumKoef = new BigDecimal(0);
		BigDecimal byDistance = new BigDecimal(0);
		BigDecimal tempDist = new BigDecimal(0);
		BigDecimal tempHours = new BigDecimal(0);
		for (int i=0; i < routeList.totalCount; i++){
			// так как маршуров может быть дофига то расход по расстоянием считаем сперва в цикле
			tempDist = new BigDecimal(0.01).multiply(nS).multiply(routeList.get(i).distance); //.multiply( (new BigDecimal(1).add(new BigDecimal(0.01)).multiply(sumKoef) ));
			tempDist = tempDist.multiply( new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)) );
			byDistance = byDistance.add(tempDist);
			tempDist = new BigDecimal(0);

		}
		// к пощитаному кол ву за пробег прибавляем расход по работе
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
			// ТОРМОЗЗЗЗ работы гдето раньше надо проверять  ...
			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return out;
			}

			// цикл по маршрутам в плане
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.planRef.code = tr.planRef.code;
			ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);

			// Нs - базова лінійна норма витрати палива на пробіг спеціального автомобіля, л/100 км (м3/100 км);
			BigDecimal nS = tr.transportReal.rashodProbeg;
		    // Hg - норма  витрати палива  на одну тонну спорядженої маси причепа або напівпричепа згідно з п.1.4,  л/100  т-км  (м куб./100 т-км)
			BigDecimal nG = new BigDecimal(0);
			if ((tr.transportReal.transportmark.fueltype.code == TKFuelType.A80)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A92)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
            nG = new BigDecimal(1.4);}
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
			{nG = new BigDecimal(0.9);}
			// Gnp - споряджена маса причепа або напівпричепа, т,
			BigDecimal gPR = new BigDecimal(0); // принимаем 5 тонн . по нормативу если стоит галочка на транспорт итеме "используетсяприцеп"
			if (tr.isUseTrailer == 1 ){
				gPR = new BigDecimal(5);
			}
		    // Hw - норма на транспортну роботу згідно з п. 1.3, л/100 т•км (м3/100 т•км),
			BigDecimal nW = new BigDecimal(0);
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.A80
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A92
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
				{nW = new BigDecimal(1.4);}
				if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
				{nW = new BigDecimal(0.9);}
			// W - обсяг транспортної роботи, т•км (W = Gван• Sван, де Gван - маса вантажу, Sван - пробіг з вантажем).
			BigDecimal w = new BigDecimal(0);
			//Gван - маса вантажу
			BigDecimal gVAN = new BigDecimal(0);
			// Sван - пробіг з вантажем).
			BigDecimal sVAN = new BigDecimal(0);
			//Нsan - лінійна норма витрати палива на пробіг автопоїзда:	Нsan = Hs + Hg • Gnp, л/100 км (м3/100 км),
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
			// ТОРМОЗЗЗЗ работы гдето раньше надо проверять  ...
			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return array;
			}

			// цикл по маршрутам в плане
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.planRef.code = tr.planRef.code;
			ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);

			// Нs - базова лінійна норма витрати палива на пробіг спеціального автомобіля, л/100 км (м3/100 км);
			BigDecimal nS = tr.transportReal.rashodProbeg;
		    // Hg - норма  витрати палива  на одну тонну спорядженої маси причепа або напівпричепа згідно з п.1.4,  л/100  т-км  (м куб./100 т-км)
			BigDecimal nG = new BigDecimal(0);
			if ((tr.transportReal.transportmark.fueltype.code == TKFuelType.A80)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A92)
            	||
            	(tr.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
            nG = new BigDecimal(1.4);}
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
			{nG = new BigDecimal(0.9);}
			// Gnp - споряджена маса причепа або напівпричепа, т,
			BigDecimal gPR = new BigDecimal(0); // нужно найти для машинки прицеп если есть то сюда его массу tr.transportReal.ladenMass;
		    // Hw - норма на транспортну роботу згідно з п. 1.3, л/100 т•км (м3/100 т•км),
			BigDecimal nW = new BigDecimal(0);
			if (tr.transportReal.transportmark.fueltype.code == TKFuelType.A80
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A92
	            	||
	            	tr.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
				{nW = new BigDecimal(1.4);}
				if (tr.transportReal.transportmark.fueltype.code == TKFuelType.DT)
				{nW = new BigDecimal(0.9);}
			// W - обсяг транспортної роботи, т•км (W = Gван• Sван, де Gван - маса вантажу, Sван - пробіг з вантажем).
			BigDecimal w = new BigDecimal(0);
			//Gван - маса вантажу
			BigDecimal gVAN = new BigDecimal(0);
			// Sван - пробіг з вантажем).
			BigDecimal sVAN = new BigDecimal(0);
			//Нsan - лінійна норма витрати палива на пробіг автопоїзда:	Нsan = Hs + Hg • Gnp, л/100 км (м3/100 км),
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
		      array[1] = "Примечание";

			  return array;
	  }

	  /* пересчет роутов на план факте по показаниям спидометра */
	  public void recalcEntransportRouteBySpeedometer(ENTravelSheetItem travelSheetItem) throws PersistenceException
		{
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
			ENTransportRoute rou = null;


			// находим для плана который пробит в травелшите роуты и сумируем дистнсы
			// также апдейтим поле дистансе нью в показания поля дистансе
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


			  // найдем самый последний роут в плане факт что бы к нему отнимать или плюсовать разницу показания спидометра и суммы всех роутов .
			  routeFilter.conditionSQL = " ENTRANSPORTROUTE.CODE in ( select tt.code from ENTRANSPORTROUTE tt where tt.planrefcode = " + travelSheetItem.planRef.code + " order by tt.code  desc limit 1   ) ";
			  int rouArr[] = routeDAO.getFilteredCodeArray(routeFilter,0, -1);
			  if (rouArr.length != 0) {

			   rou = routeDAO.getObject(rouArr[0]);
			  // если по показаниям спидометра меньше тогда на последнем роуте отнимаем разницу
			  BigDecimal distanceSpeedometr = travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart);
			  BigDecimal dif = new BigDecimal(0);
			  if (routeDistance.doubleValue() > distanceSpeedometr.doubleValue() ){
				  rou.distanceNew =  rou.distance.subtract(routeDistance.subtract(travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)));
			  }
			 // если по показаниям спидометра больше тогда на последнем роуте прибавляем разницу
			  if (routeDistance.doubleValue() < distanceSpeedometr.doubleValue() ){
				  dif = (travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)).subtract(routeDistance);
				  rou.distanceNew = rou.distance.add(dif);
				  // rou.distance =  rou.distance.add(travelSheetItem.speedometerFinal.subtract(travelSheetItem.speedometerStart)).subtract(routeDistance);
			  }
			  routeDAO.save(rou);
			  }

		}

/* расчет топлива по маршрутам фактическим для грузового автомобиля (пробег тока) */
public BigDecimal calculateFuelDistanceByRouteForAVTO_CARGO(ENTravelSheet trsh , ENTravelSheetItem trshit ) throws PersistenceException
{
	BigDecimal out = new BigDecimal(0);
	// ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
	// ENTransportItem tr = trDAO.getObject(transportItemCode);
    ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);
    ENTransportRouteDistanceDAO routeDistanceDAO = new ENTransportRouteDistanceDAO(connection, userProfile);
    TKTransportRealDAO trDAO = new TKTransportRealDAO(connection, userProfile);
    TransportLogic trLogic = new TransportLogic(connection, userProfile);
	
    // цикл по маршрутам в плане
	ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
	routeFilter.planRef.code = trshit.planRef.code;
	ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
	
	boolean isGPS = trLogic.isGPS(trsh.transportReal.code, trsh.dateFinal);

	// Нs - базова лінійна норма витрати палива на пробіг спеціального автомобіля, л/100 км (м3/100 км);
	// BigDecimal nS = trsh.transportReal.transportmark.rashodProbeg;
	
	// Суммарный коэффициент для расчета топлива для автотранспорта
	BigDecimal sumFuelKoefOfTransport = trDAO.getAggregateSumKoefs(trsh.transportReal.code);
	sumFuelKoefOfTransport = sumFuelKoefOfTransport.add(trLogic.getTemperatureCoeff(trsh.transportReal.transportdepartmentRef.code, Tools.clearTimeOfDate(trshit.timeFinal)));
	// NET-3728 По приказу Главы Правления №632 от 22.11.2012 добавим для всех машин с GPS-трекером 2% сверху коэфициента расчета топлива
	if(isGPS)
		sumFuelKoefOfTransport = sumFuelKoefOfTransport.add(new BigDecimal(0.02).setScale(2, BigDecimal.ROUND_HALF_UP));
	
	BigDecimal nS = trsh.transportReal.rashodProbeg;
	nS = nS.multiply(sumFuelKoefOfTransport).setScale(2, BigDecimal.ROUND_HALF_UP);
	
    // Hg - норма  витрати палива  на одну тонну спорядженої маси причепа або напівпричепа згідно з п.1.4,  л/100  т-км  (м куб./100 т-км)
	BigDecimal nG = new BigDecimal(0);
	if ((trsh.transportReal.transportmark.fueltype.code == TKFuelType.A80)
    	||
    	(trsh.transportReal.transportmark.fueltype.code == TKFuelType.A92)
    	||
    	(trsh.transportReal.transportmark.fueltype.code == TKFuelType.A95)  ){
    nG = new BigDecimal(1.4);}
	if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.DT)
	{nG = new BigDecimal(0.9);}
	// Gnp - споряджена маса причепа або напівпричепа, т,
	BigDecimal gPR = new BigDecimal(0); //  нужно найти для машинки прицеп если есть то сюда его массу tr.transportReal.ladenMass;
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
    // Hw - норма на транспортну роботу згідно з п. 1.3, л/100 т•км (м3/100 т•км),
	BigDecimal nW = new BigDecimal(0);
	if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.A80
        	||
        	trsh.transportReal.transportmark.fueltype.code == TKFuelType.A92
        	||
        	trsh.transportReal.transportmark.fueltype.code == TKFuelType.A95 )
		{nW = new BigDecimal(1.4);}
		if (trsh.transportReal.transportmark.fueltype.code == TKFuelType.DT)
		{nW = new BigDecimal(0.9);}
	// W - обсяг транспортної роботи, т•км (W = Gван• Sван, де Gван - маса вантажу, Sван - пробіг з вантажем).
	BigDecimal w = new BigDecimal(0);
	//Gван - маса вантажу
	BigDecimal gVAN = new BigDecimal(0);
	// Sван - пробіг з вантажем).
	BigDecimal sVAN = new BigDecimal(0);
	//Нsan - лінійна норма витрати палива на пробіг автопоїзда:	Нsan = Hs + Hg • Gnp, л/100 км (м3/100 км),
	BigDecimal nSAN = new BigDecimal(0);
	nSAN = nS.add(nG.multiply(gPR));
	BigDecimal sumKoef = new BigDecimal(0);
	BigDecimal tempOut = new BigDecimal(0);
	for (int i=0; i < routeList.totalCount; i++){
		gVAN = routeList.get(i).weight.divide(new BigDecimal(1000), BigDecimal.ROUND_HALF_UP); // this.getWeightCargoOnTheRoute(routeList.get(i).code);
		sVAN = routeList.get(i).distanceNew;
		
		// Получение листа с дистанциями с коэффициентами для расчета топлива
		ENTransportRouteDistanceFilter trdFilter = new ENTransportRouteDistanceFilter();
		trdFilter.transportRouteRef.code = routeList.get(i).code;
		ENTransportRouteDistanceShortList trdList = routeDistanceDAO.getScrollableFilteredList(trdFilter, 0, -1);
		
		// Уменьшение sVan на дистанции с коэффициентами
		for(int j = 0; j < trdList.totalCount; j++)
			sVAN = sVAN.subtract(trdList.get(j).distance);
		
		w = gVAN.multiply(sVAN);
		tempOut = new BigDecimal(0.01).multiply(nSAN.multiply(sVAN).add(nW.multiply(w))
				                                ).multiply(new BigDecimal(1).add(new BigDecimal(0.01).multiply(sumKoef)));
		
		// Расчет топлива согласно коэффициентам топлива отдельно от основного расчета
		BigDecimal[] fuelCountedByKoef = new BigDecimal[trdList.totalCount];
		for(int j = 0; j < trdList.totalCount; j++)
		{
			BigDecimal koef = routeDistanceDAO.getAggregateSumOfKoefs(trdList.get(j).code, sumFuelKoefOfTransport);
			BigDecimal rashodProbegWithKoef = trsh.transportReal.rashodProbeg.multiply(koef).setScale(2, BigDecimal.ROUND_HALF_UP);
			BigDecimal distanceKoef = trdList.get(j).distance;
			BigDecimal w1 = gVAN.multiply(distanceKoef); // w1 - показатель w для занесенных дистанций с коэффициентами для расчетам топлива
			BigDecimal nSAN1 = rashodProbegWithKoef.add(nG.multiply(gPR)); // nSAN1 - показатель nSAN для занесенных дистанций с коэффициентами для расчетам топлива
			
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
 * расчет топлива по маршрутам фактическим для авто крана (пробег тока) 
 * 
 * @param trsh путевой лист
 * @param trshit строка путевого листа
 * @return BigDecimal - потраченное топливо
 * @throws PersistenceException
 */
public BigDecimal calculateFuelDistanceByRouteForAVTO_KRAN(ENTravelSheet trsh , ENTravelSheetItem trshit ) throws PersistenceException
{
	BigDecimal out = new BigDecimal(0);
	// ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
    // ENTransportItem tr = trDAO.getObject(transportItemCode);
    ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(connection, userProfile);


	// цикл по маршрутам в плане
	ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
	routeFilter.planRef.code = trshit.planRef.code;
	ENTransportRouteShortList routeList = routeDAO.getScrollableFilteredList(routeFilter,0, -1);
	// формула расчета Qн = 0,01 • Нs • S • (1 + 0,01 • KE) + Ноб • Тоб • (1 + 0,01 • KEс),
	// Нs - базова лінійна норма витрати палива на пробіг спеціального автомобіля, л/100 км (м3/100 км);
	BigDecimal nS = trsh.transportReal.rashodProbeg;
	if (nS == null){
		  throw new EnergyproSystemException("Расход на пробег не найден ...");
	  }
  // Ноб - норма витрати палива на роботу спеціального обладнання, л/год. або літри на виконану операцію (заповнення цистерни, тощо);
	BigDecimal nOB = trsh.transportReal.rashodWork;
	//if (nOB == null){
	//	throw new EnergyproSystemException("Расход на машиночасы не найден ...");
	//}
	// Тоб - час роботи обладнання, годин або кількість виконаних операцій;
	//BigDecimal tOB = new BigDecimal(0);
	BigDecimal sumKoef = new BigDecimal(0);
	BigDecimal byDistance = new BigDecimal(0);
	for (int i=0; i < routeList.totalCount; i++){
		// так как маршуров может быть дофига то расход по расстоянием считаем сперва в цикле
		byDistance = byDistance.add(new BigDecimal(0.01).multiply(nS).multiply(routeList.get(i).distanceNew).multiply( new BigDecimal(1).add(new BigDecimal(0.01)).multiply(sumKoef) ));

	}
	// к пощитаному кол ву за пробег прибавляем расход по работе
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

				/* связь маршрута с накладной */
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

				/* связь маршрута с транспортной накладной */
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
			
			/* связь маршрута с накладной */
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

			/* связь маршрута с транспортной накладной */
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
			
			// Ищем следующий код для удаления
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
					"Не знайдено транспортні ресурси на плані!!!");
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
					"Не знайдено транспортні ресурси на плані!!!");
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
					"Не знайдено транспортні ресурси на плані!!!");
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
				commentGen = "Перевезення";
			}
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		return commentGen;
	}
	
	/**
	 * 
	 * Сравнение расстояний на маршруте и его дистанциях 
	 * 
	 * @param code код транспортного маршрута
	 * @return -1, 0, 1 - если дистанция на маршруте меньше, равна или больше в сравнении с суммарной по дистанциям 
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
	 * Проверка накладной в маршрутах
	 * 
	 * @param fkOrderCode код накладной
	 * @param isException необходимо ли генерить исключение, если задан, то сгенерит исключение,
	 * 	в кот. укажет номера и даты наряд-заданий, либо коды-планов
	 * 
	 * @return <b>true</b> если накладная включена в маршруты, <b>false</b> - если нет.
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
                        
                        // SUPP-16947 Наверное лучше будет выводить наряд
                        ENWorkOrder workOrder = workOrderLogic.getWorkOrderByPlanCode(routeList.get(r).planRefCode, false);
                        if(workOrder != null)
                        {
                        	if(!workOrderNums.contains(workOrder.workOrderNumber))
                        	{
                        		if(workOrderNums.length() > 0)
                        			workOrderNums = workOrderNums + ", "+ workOrder.workOrderNumber + " від " + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen);
                        		else
                        			workOrderNums = workOrder.workOrderNumber + " від " + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen);                       			
                        	}
                        }
                    }
                }
            }

            throw new EnergyproSystemException(
                    "\n Цю накладну вже включено до транспортного маршруту!!! \n " +
            ((workOrderNums.length() > 0) ? "номера наряд-завдань: " + workOrderNums :
                    " код плану: " + planCodes));
        }
        
		return out;
	}

}


