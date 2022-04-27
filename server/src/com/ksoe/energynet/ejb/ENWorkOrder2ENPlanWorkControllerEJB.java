
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENWorkOrder2ENPlanWork;
  *
  */



import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.ejb.generated.ENWorkOrder2ENPlanWorkControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.CounterLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.ENWorkOrderStatus;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.filter.TKTransportRealFilter;
import com.ksoe.techcard.valueobject.lists.TKTransportRealShortList;

public class ENWorkOrder2ENPlanWorkControllerEJB extends ENWorkOrder2ENPlanWorkControllerEJBGen
 {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	
	/*ENWorkOrder2ENPlanWork. Добавить*/

	public int addWithCheck(ENWorkOrder2ENPlanWork object , boolean checkFinworkerTime)
    {
    	return this.add(object , true);
    }

	/*ENWorkOrder2ENPlanWork. Добавить*/
    @Override
	public int add(ENWorkOrder2ENPlanWork object)
    {
    	return this.add(object , false);
    }

	/*ENWorkOrder2ENPlanWork. Добавить*/

	public int add(ENWorkOrder2ENPlanWork object , boolean chekTimeFinWorker)
    {

        //Connection finConn = null;
        Connection enConn = null;

        try
        {

            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);



        ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        ENWorkOrder2ENPlanWorkFilter f = new ENWorkOrder2ENPlanWorkFilter();
        f.plan.code = object.plan.code;

        int[] arr = objectDAO.getFilteredCodeArray(f, null, null, 0, -1, null);
        if (arr.length > 0){
            throw new EnergyproSystemException("На цей план вже є Наряд-Завдання ...");
        }

        ENWorkOrder workOrder = object.workOrder;
        workOrder.statusWorkOrder.code = ENWorkOrderStatus.GOOD;

        workOrder.dateEdit = new Date();
        workOrder.userGen = getUserProfile().userName;


        ENWorkOrderDAO workOrderDAO = new ENWorkOrderDAO(getUserProfile(),enConn);

        workOrder.numberInt = workOrderDAO._collectAutoIncrementNumber();
        workOrder.workOrderNumber = workOrder.numberInt + "/xx";// + workOrder.finMolCode.substring(0,2);

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
        ENPlanWork plan = planDAO.getObject(object.plan.code);


        TransportLogic eLogic = new TransportLogic(enConn, getUserProfile());
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(enConn, getUserProfile());

        /// SUPP-25730 п.2 - придобавлении наряд задания на задании-план тоже нужно что бы проверялость ограничение работы реального транспорта на Задании План в часах в день на разных планах


        if (plan.kind.code == ENPlanWorkKind.NPW )
        {
        	/*SUPP-40656 Не надо проверять транспорт на обнуленных работах*/

        ENTransportItemFilter tiFilter = new ENTransportItemFilter();
        tiFilter.planRef.code = plan.code;
        tiFilter.conditionSQL = String.format(" (exists (select 1 from enplanworkitem as pi1 where pi1.code = %s and pi1.countgen > 0) or %s is null)",ENTransportItem.planItemRef_QFielld, ENTransportItem.planItemRef_QFielld);

        ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);

        for (int i = 0; i < tiList.totalCount; i++){
        ENTransportItem tiobj = tiDAO.getObject(tiList.get(i).code);

        if(tiobj.planItemRef.code != Integer.MIN_VALUE) {

        }
	        if(tiobj.countWorkFact.compareTo(new BigDecimal(0)) == 1)  // пропускаем проверку если обнуляют машино часы
	          if (tiobj.transportReal != null )
	     	   if (tiobj.transportReal.code != Integer.MIN_VALUE )
	     		  if (tiobj.tktransportType.code != TKTransportType.BRIGADE)  // бригадные машины не проверяем т.к на них не считается пмм
	                      eLogic.checkMaxWorkTimeForRealTransportByDay(tiobj.code , tiobj.transportReal.code , plan.dateStart , tiobj.countWorkFact );

	        }
        }
        // end SUPP-25730 п.2



        Calendar calendarPlan= Calendar.getInstance();
        calendarPlan.setTime(plan.dateStart);

        Calendar calendarWorkOrder= Calendar.getInstance();
        calendarWorkOrder.setTime(workOrder.dateGen);

        //  if (! plan.dateStart.equals(workOrder.dateGen))
        if ((calendarPlan.get(Calendar.YEAR)!=calendarWorkOrder.get(Calendar.YEAR))
                ||
            (calendarPlan.get(Calendar.MONTH)!=calendarWorkOrder.get(Calendar.MONTH))
                ||
            (calendarPlan.get(Calendar.DATE)!=calendarWorkOrder.get(Calendar.DATE))
                )
        {
            throw new EnergyproSystemException("\n Дата наряд-завдання повинна співпадати з датою плана!");
        }

        ENElement el = new ENElementDAO(enConn, getUserProfile()).getObject(plan.elementRef.code);

        if (el.typeRef.code == ENElementType.TRANSPORT)
            { TKTransportRealDAO trDAO = new TKTransportRealDAO(enConn, getUserProfile());
                TKTransportRealFilter trFilter = new TKTransportRealFilter();

                trFilter.enelement.code = el.code;
                TKTransportRealShortList trlist = trDAO.getFilteredList(trFilter);

                if (trlist.get(0).transportmarkCode == ENConsts.BKU_MARK
                        && !getUserProfile().userName.toUpperCase().equals("MalaOI".toUpperCase())
                        && plan.typeRef.code == ENPlanWorkType.TRUCKING) {
                    throw new EnergyproSystemException("Ввод нарядов для БКУ запрещен! Обращайтесь в Службу Транспорта ХОЭ!");
                }
            }

        int workOrderCode = workOrderDAO.add(workOrder);


        ENWorkOrder workOrder1 = workOrderDAO.getObject(workOrderCode);

        // добавим МОЛа - мастера в связку ...
/*            FINMolDataDAO molDAO = new FINMolDataDAO(enConn, getUserProfile());

            FINMolData mol = new FINMolData();
            mol.finMolCode = workOrder.finMolCode;
            mol.finMolName = workOrder.finMolName;
            mol.molTypeRef.code = FINMolType.MASTER;
            mol.code = molDAO.add(mol);

            FINLogic finLogic = new FINLogic(finConn, getUserProfile());
            finLogic.createDOCFromENWorkOrder2(workOrder1, mol);
*/

/*
        FINLogic finLogic = new FINLogic(finConn ,getUserProfile());

        finLogic.createDOCFromENWorkOrder(workOrder1);
*/

        object.workOrder.code = workOrderCode;


            if (plan.typeRef.code == ENPlanWorkType.TRUCKING)
            {
                if (plan.commentGen == null)
                    throw new EnergyproSystemException("Введіть маршрут КУДИ ... !");
                if (plan.commentGen.trim().length() == 0)
                    throw new EnergyproSystemException("Введіть маршрут КУДИ ... !");
            }

        // если на факте - надо накинуть почти такой же Наряд в План
        if ( plan.kind.code == ENPlanWorkKind.FACT &&  plan.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION
        		&& (plan.stateRef.code != ENPlanWorkState.WRITINGS_OS && plan.typeRef.code != ENPlanWorkType.ENPLANWORKTYPE_WRITEOFF_OS
        		&& plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT) ){
            throw new EnergyproSystemException("Обновите клиента!!! Добавление Наряда на ФАКТЕ ... ЗАПРЕЩЕНО");
            /* устарело ....
            *
                // проверить наличие АКТА на это Задание ... если есть - в сад !
                ActLogic actLogic = new ActLogic(enConn, getUserProfile());
                ENAct act = actLogic.getActByPlanCode(object.plan.code, false);
                if ( act != null){
                    throw new EnergyproSystemException("Наряд зв'язаний з Актом ...№ " + act.numberGen + ". Видаліть наряд-завдяння з акту !!");
                }


            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            int parentPlanCode = planLogic.getParentPlanWorkCode(plan);
            //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
            //ENPlanWork parentPlan = planDAO.getObject(parentPlanCode);

            FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(enConn, getUserProfile());
            FINDoc2WorkOrderFilter f = new FINDoc2WorkOrderFilter();
            f.workOrderRef.code = workOrderCode;

            ENWorkOrder parentWorkOrder = new ENWorkOrder();
            parentWorkOrder.dateGen =  workOrder1.dateGen;
            parentWorkOrder.department.code = workOrder1.department.code;
            parentWorkOrder.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
            parentWorkOrder.finMechanicCode = workOrder1.finMechanicCode;
            parentWorkOrder.finMechanicName = workOrder1.finMechanicName;
            parentWorkOrder.finMolCode = workOrder1.finMolCode;
            parentWorkOrder.finMolName = workOrder1.finMolName;
            parentWorkOrder.numberInt = workOrder1.numberInt;
            parentWorkOrder.workOrderNumber = workOrder1.workOrderNumber;
            parentWorkOrder.userGen = getUserProfile().userName;
            //parentWorkOrder. = workOrder1.finMechanicCode;
            parentWorkOrder.code = workOrderDAO.add(parentWorkOrder);

            ENWorkOrder2ENPlanWork w2p = new ENWorkOrder2ENPlanWork();
            w2p.plan.code = parentPlanCode;
            w2p.workOrder.code = parentWorkOrder.code;
            objectDAO.add(w2p);

            FINDoc2WorkOrderShortList l = f2wDAO.getScrollableFilteredList(f,0,-1);
            for (int i = 0; i < l.totalCount; i++){
                FINDoc2WorkOrder f2w = new FINDoc2WorkOrder();
                f2w.finDocMechanicCode = l.get(i).finDocMechanicCode;
                f2w.finDocMOLCode = l.get(i).finDocMOLCode;
                f2w.typeRef.code = l.get(i).typeRefCode;
                f2w.workOrderRef.code = parentWorkOrder.code;
                f2wDAO.add(f2w);
            }

            */

        }

        int outCode = objectDAO.add(object);

        // только для счетчиков - залочить его для движений в СканСчетчиках ...
        if (el.typeRef.code == ENElementType.METROLOGY_COUNTER &&
        	el.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {

            CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
            ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(plan.elementRef.code);
                // разлочим ... поменяем ... и залочим ...
                cntLogic.lockCounterForMetrology(cnt, workOrder1, (-1) * ENMetrologyCounter.METROLOGY_LOCK, plan.stateRef.code);
                cntLogic.lockCounterForMetrology(cnt, workOrder1, ENMetrologyCounter.METROLOGY_LOCK, plan.stateRef.code);
            //cntLogic.lockCounterForMetrology( cnt, workOrder1, 1);

            /*SUPP-4908, SUPP-4916*/
            /*Ограничение - нельзя делать больше одного наряд-задание на одну дату и на один инвентарный */
            ENMetrologyCounterDAO metrologyCounterDAO = new ENMetrologyCounterDAO(enConn, getUserProfile());
            ENMetrologyCounterFilter metrologyCounterFilter = new ENMetrologyCounterFilter();
            metrologyCounterFilter.invNumber = cnt.invNumber;
            ENMetrologyCounterShortList metrologyCounterList = metrologyCounterDAO.getScrollableFilteredList(metrologyCounterFilter, 0, -1);
            boolean isNaryad = false;
            String naryadNumber = "";
            for(int i = 0; i < metrologyCounterList.totalCount; i++)
            {
                ENWorkOrder2ENPlanWorkFilter wopwFilter = new ENWorkOrder2ENPlanWorkFilter();
                wopwFilter.conditionSQL = " ENPLANWORK.ELEMENTREFCODE = ?";
                wopwFilter.conditionSQL = wopwFilter.conditionSQL + " AND ENWORKORDER2ENPLANWORK.CODE <> ?";
                wopwFilter.conditionSQL = wopwFilter.conditionSQL + " AND ENPLANWORK.DATESTART = ? ";

                Vector<Object> bindObjects = new Vector<Object>();
                bindObjects.add(metrologyCounterList.get(i).elementCode);
                bindObjects.add(outCode);
                bindObjects.add(plan.dateStart);


                ENWorkOrder2ENPlanWorkShortList wopwList = objectDAO.getScrollableFilteredList(wopwFilter, 0, -1, bindObjects);
                if(wopwList.totalCount > 0)
                {
                    naryadNumber = wopwList.get(0).workOrderWorkOrderNumber + " від " + new SimpleDateFormat("dd.MM.yyyy").format(wopwList.get(0).workOrderDateGen);
                    isNaryad = true;
                    break;
                }

            }
            if(isNaryad)
                throw new EnergyproSystemException("На дату вже є наряд-завдання із цим інвентарним (" + cnt.invNumber + "). Наряд-завдання № " + naryadNumber);

        }
      
       if (chekTimeFinWorker) { 
	        //// проверка времени по работникам 
	        HumenLogic humLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        humLogic.checkFinworkerCountfactWorkDay(object.plan.code, "");
	        
	        // если к работе не подвязаны вообще работники тогда не даем добавлять наряд-задание 
	        
	        /*Выборка  настроек*/
	        ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) , getUserProfile());
		    String settingsForBindFinworker = settingsLogic.getValue(ENSettingsKeysConsts.CONDITION_FOR_BIND_FINWORKER, workOrder1.dateGen);
		    
	        ENPlanWorkItemDAO piDao = new ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENPlanWorkItemFilter piFil = new ENPlanWorkItemFilter();
	        piFil.conditionSQL = " enplanworkitem.code in (select i.code \n"+
				        		" from enplanworkitem i , enhumenitem hi1  , enplanwork \n"+  
				        		" 		 where i.code = hi1.planitemrefcode  \n"+
				        		" 		 and coalesce(i.countgen) > 0  \n"+
				        		" 		 and i.planrefcode = enplanwork.code \n"+ 
				        		" 		 and hi1.planrefcode = enplanwork.code \n"+
				        		" 		 and i.planrefcode = " + plan.code + 
				        		" 		 and " + settingsForBindFinworker + 
				        		" 		 group by i.code \n"+
				        		" 		 having count(hi1.finworkercode) = 0   )  ";
	        int[] piArr = piDao.getFilteredCodeArray(piFil, 0, -1);
	        
	        
	        
			
	        
	        boolean errorBindFinworker =  piArr.length>0; 
			/*
			 * && plan.typeRef.code != ENPlanWorkType.TMC_TRANSFER && plan.typeRef.code !=
			 * ENPlanWorkType.WRITINGS && plan.typeRef.code !=
			 * ENPlanWorkType.WRITINGOFFPROTECTION && plan.typeRef.code !=
			 * ENPlanWorkType.SERVICES_FROM_SIDE && plan.typeRef.code !=
			 * ENPlanWorkType.SERVICES_FROM_SIDE_INVEST && plan.stateRef.code !=
			 * ENPlanWorkState.TMC_TRANSFER
			 */ ; 
	        if( errorBindFinworker ) {
	        	ENPlanWorkItem piObj = piDao.getObject(piArr[0]);
	        	TechCardLogic tkLogic = new TechCardLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				TKTechCard tkObj =  tkLogic.getTechCardByCode(piObj.kartaRef.code);
	        	throw new EnergyproSystemException("\nПо роботі \"" + tkObj.name + "\" не прив'язані штатні працівники!!! "  );
	        }
       }

        return outCode;
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
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
        }
    }

    /*ENWorkOrder2ENPlanWork. Удалить*/
    @Override
	public void remove(int code)
    {

        //Connection finConn = null;
        Connection enConn = null;

        try
        {

            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


            ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),enConn);
            ENWorkOrder2ENPlanWork w2p = objectDAO.getObject(code);


            // проверить наличие АКТА на это Задание ... если есть - в сад !
            ActLogic actLogic = new ActLogic(enConn, getUserProfile());
            ENAct act = actLogic.getActByPlanCode(w2p.plan.code, false);
            if ( act != null){
                throw new EnergyproSystemException("Наряд зв'язаний з Актом ...№ " + act.numberGen + ". Видаліть наряд-завдяння з акту !!");
            }

            // счетчики БЫТА ..
            if (w2p.plan.kind.code == ENPlanWorkKind.FACT){
                PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
                planLogic.checkInSCCounterByPlanCode(w2p.plan.code);
            }


            //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
            //ENPlanWork plan = planDAO.getObject(w2p.);

            //if (w2p.plan.kind.code == ENPlanWorkKind.FACT){
            //    throw new EnergyproSystemException("На Факте наряд удалять НЕЛЬЗЯ !!!");
            //}


            // для счетчиков - разлочить в СканСчетчиках ...
            ENElement el = new ENElementDAO(enConn, getUserProfile()).getObject(w2p.plan.elementRef.code);

            // только для счетчиков - залочить его для движений в СканСчетчиках ...
            if (el.typeRef.code == ENElementType.METROLOGY_COUNTER && 
            	el.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) {
            	
                ENWorkOrder workOrder1 = new ENWorkOrderDAO(enConn, getUserProfile()).getObject(w2p.workOrder.code);
                CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
                ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(el.code);
                cntLogic.lockCounterForMetrology(cnt, workOrder1, (-1) * ENMetrologyCounter.METROLOGY_LOCK, w2p.plan.stateRef.code);
                
            }


            WorkOrderLogic workOrderLogic = new WorkOrderLogic(enConn, getUserProfile());
            //PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
            EstimateLogic eLogic = new EstimateLogic(enConn, getUserProfile());

            TransportLogic tLogic = new TransportLogic(enConn, getUserProfile());

            if ( w2p.plan.kind.code == ENPlanWorkKind.NPW ){
                // отменим ФИНМатериалы ....
                eLogic.canceledFINMaterialsByPlan(w2p.plan.code);

                tLogic.checkTransportItemInTravelSheetByPlanCode(w2p.plan.code, true);

                /*01.03.2012 - Проверка  наличия entransportitem'ов в заявках на транспорт - если есть
                * выводится исключение */
                TransportOrderLogic toLogic = new TransportOrderLogic(enConn, getUserProfile());
                toLogic.checkENTransportItemInTransportOrderByENPlanWorkCode(w2p.plan.code);


                // нафиг?? оно выносится при удлаении МОЛДаты ...
                workOrderLogic.removeWorkOrderForOpenPlanByWorkOrderCode2(w2p.workOrder.code, true);
            }

            if ( w2p.plan.kind.code == ENPlanWorkKind.FACT ){
                // запретим удалять на ФАКТЕ вааще ...
                throw new EnergyproSystemException("Изменяйте МОЛов или удаляйте всё Задание-Факт...");
                /*
                workOrderLogic.removeWorkOrderForOpenPlanByWorkOrderCode(w2p.workOrder.code, true);

                int parentPlanCode = planLogic.getParentPlanWorkCode(w2p.plan);
                ENWorkOrder parentWorkOrder = workOrderLogic.getWorkOrderByPlanCode(parentPlanCode, false);
                if ( parentWorkOrder != null){
                    workOrderLogic.removeWorkOrderForOpenPlanByWorkOrderCode(parentWorkOrder.code, false);
                }
                eLogic.canceledFINMaterialsByPlan(parentPlanCode);
                */
            }







/*
            if ( w2p.plan.kind.code == ENPlanWorkKind.NPW ) // почти такое же и для ФАКТА
            {
                // если есть развязанные материалы - отменить развязку ..
                //WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENWorkOrderDAO woDAO = new ENWorkOrderDAO(enConn, getUserProfile());
                ENWorkOrder workOrder = woDAO.getObject(w2p.workOrder.code);

                FINLogic finLogic = new FINLogic(finConn, getUserProfile());

                FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(enConn, getUserProfile());
                FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
                f2wFilter.workOrderRef.code = workOrder.code;

                // первую вынести 28 - при вставке она ссылаеться на 302 ...
                f2wFilter.typeRef.code = FINDocType.MOVE_28_302;
                //int[] f2wArr28 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
                FINDoc2WorkOrderShortList f2wList28 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);
                if (f2wList28.totalCount > 0){
                    finLogic.removeDoc(f2wList28.get(0).finDocMOLCode, 28 );
                    finLogic.removeDoc(f2wList28.get(0).finDocMechanicCode, 28 );
                }


                f2wFilter.typeRef.code = FINDocType.MOVE_302;
                //int[] f2wArr302 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
                FINDoc2WorkOrderShortList f2wList302 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);

                if (f2wList302.totalCount > 0){
                    finLogic.removeDoc(f2wList302.get(0).finDocMOLCode, 302 );
                    finLogic.removeDoc(f2wList302.get(0).finDocMechanicCode, 303 );
                }

                // отменим развязанные ФИНМатериалы !!!
                FINMaterialsDAO finDAO = new FINMaterialsDAO(enConn, getUserProfile());
                FINMaterialsFilter finFilter = new FINMaterialsFilter();
                finFilter.statusRef.code = FINMaterialsStatus.GOOD;
                finFilter.conditionSQL = " finmaterials.estimateitemrefcode in (select enestimateitem.code from enestimateitem where planrefcode = " + w2p.plan.code + ")";
                FINMaterialsShortList finList = finDAO.getScrollableFilteredList(finFilter,0,-1);
                for (int i = 0; i <  finList.totalCount; i++){
                    FINMaterials fin = finDAO.getObject(finList.get(i).code);
                    fin.statusRef.code = FINMaterialsStatus.CANCELED;
                    finDAO.save(fin);
                }


                // удалим развязку ...
                objectDAO.remove(w2p.code);

                // вынесем связку с кодыми для ФинКолл ...
                f2wFilter = new FINDoc2WorkOrderFilter();
                f2wFilter.workOrderRef.code = workOrder.code;

                //int[] f2wArr28 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
                int[] f2wArr = f2wDAO.getFilteredCodeArray(f2wFilter, null, null, 0, -1, null);

                for (int i = 0; i < f2wArr.length; i++){
                    f2wDAO.remove(f2wArr[i]);
                }

                // удалим Наряд !
                woDAO.remove(w2p.workOrder.code);

            } // удаление для НПЗ !!!

*/

        //ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        //objectDAO.remove(code);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
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
        }
    }


    /*ENWorkOrder2ENPlanWork. Изменить*/
    @Override
	public void save(ENWorkOrder2ENPlanWork object)
    {
        //Connection finConn = null;
        Connection enConn = null;

        try
        {
            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
            ENPlanWork plan = planDAO.getObject(object.plan.code);

            if (! plan.dateStart.equals(object.workOrder.dateGen))
            {
                throw new EnergyproSystemException("\n Дата наряд-завдання повинна співпадати з датою плана!");
            }

            ENWorkOrderDAO workOrderDAO = new ENWorkOrderDAO(getUserProfile(),enConn);

            workOrderDAO.save(object.workOrder);


            //ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),enConn);


            //objectDAO.save(object);


        //object.setDomain_info(null); // сохраним привязку к домену ...
/*
                // проверить наличие АКТА на это Задание ... если есть - в сад !
                ActLogic actLogic = new ActLogic(enConn, getUserProfile());
                ENAct act = actLogic.getActByPlanCode(object.plan.code, false);
                if ( act != null){
                    throw new EnergyproSystemException("Наряд зв'язаний з Актом ...№ " + act.numberGen + ". Видаліть наряд-завдяння з акту !!");
                }

            object.workOrder.dateEdit = new Date();
            object.workOrder.userGen = getUserProfile().userName;

            // возможность менять МОЛов ... если НЕТУ развязок ...
            ENWorkOrderDAO workOrderDAO = new ENWorkOrderDAO(getUserProfile(),enConn);

            EstimateLogic eLogic = new EstimateLogic(enConn, getUserProfile());
            PlanWorkLogic pLogic = new PlanWorkLogic(enConn, getUserProfile());
            WorkOrderLogic wLogic = new WorkOrderLogic(enConn, getUserProfile());

            ENWorkOrder oldWorkOrder =  workOrderDAO.getObject(object.workOrder.code);
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
            FINMaterialsShortList fList;
            FINLogic finLogic = new FINLogic(finConn, getUserProfile());

            //FINDoc2WorkOrder getFINDocCodeByWorkOrderCode

            //для Факта одна история .. для Плана ДРУГАя
            //для чистого ПЛАНА ... для Факта ниже ....

            if ( object.plan.kind.code == ENPlanWorkKind.NPW ){
                if ((oldWorkOrder.finMolCode != object.workOrder.finMolCode)
                    ||
                    (oldWorkOrder.finMechanicCode != object.workOrder.finMechanicCode)
                    )
                {
                    fList = eLogic.getFINMaterialsListByPlanCode(object.plan.code, Integer.MIN_VALUE);
                    if (fList.totalCount > 0){
                        throw new EnergyproSystemException("На этом наряде у Мастера или Механика есть развязанные материалы !!! Отмените развязку Материалов !");
                    }
                    finLogic.updateDocMOLByWorkOrder(object.workOrder );
                }
            }

            if ( object.plan.kind.code == ENPlanWorkKind.FACT ){
                if ((oldWorkOrder.finMolCode != object.workOrder.finMolCode)
                        ||
                        (oldWorkOrder.finMechanicCode != object.workOrder.finMechanicCode)
                        )
                    {

                // обновить наряд  на НПЗ-плане ...
//                // чекним план с которого был Факт ...
                ENPlanWork parentPlan = planDAO.getObject( pLogic.getParentPlanWorkCode(object.plan) );
                fList = eLogic.getFINMaterialsListByPlanCode(parentPlan.code, Integer.MIN_VALUE);
                if (fList.totalCount > 0){
                    throw new EnergyproSystemException("На этом наряде у Мастера или Механика есть развязанные материалы !!! Отмените развязку Материалов !");
                }

                ENWorkOrder parentWorkOrder = wLogic.getWorkOrderByPlanCode(parentPlan.code, true);

                parentWorkOrder.finMolCode = object.workOrder.finMolCode;
                parentWorkOrder.finMolName = object.workOrder.finMolName;

                parentWorkOrder.finMechanicCode = object.workOrder.finMechanicCode;
                parentWorkOrder.finMechanicName = object.workOrder.finMechanicName;
                workOrderDAO.save(parentWorkOrder);

                finLogic.updateDocMOLByWorkOrder(parentWorkOrder);




                // на Факте
                        fList = eLogic.getFINMaterialsListByPlanCode(object.plan.code, Integer.MIN_VALUE);
                        if (fList.totalCount > 0){
                            throw new EnergyproSystemException("На этом наряде у Мастера или Механика есть развязанные материалы !!! Отмените развязку Материалов !");
                        }
                        finLogic.updateDocMOLByWorkOrder(object.workOrder );
                    }

                // проверить Нарядь на Плане (НПЗ)


            }



            /*

            if (oldWorkOrder.finMolCode != object.workOrder.finMolCode){
                fList = eLogic.getFINMaterialsListByPlanCode(object.plan.code, ENEstimateItemKind.MATERIALS);
                if (fList.totalCount > 0){
                    throw new EnergyproSystemException("На этом наряде у Мастера есть развязанные материалы !!! Отмените развязку Материалов !");
                }
                //finLogic.updateDocMOL(object.workOrder.finMolCode);
            }

            if (oldWorkOrder.finMechanicCode != object.workOrder.finMechanicCode){
                fList = eLogic.getFINMaterialsListByPlanCode(object.plan.code, ENEstimateItemKind.GSM);
                if (fList.totalCount > 0){
                    throw new EnergyproSystemException("На этом наряде у Механика есть развязанные материалы !!! Отмените развязку ГСМ!!");
                }
            }

            */



        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
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
        }


    }



	public ENWorkOrder2ENPlanWorkControllerEJB() {
	}


	/* ENWorkOrder2ENPlanWorkController. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(ENWorkOrder2ENPlanWorkFilter filterObject,
			int fromPosition, int quantity) {
		try {
			ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getFilteredCodeArray(filterObject, fromPosition,
					quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get code array of {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENWorkOrder2ENPlanWorkController. Получить список ПК-кодов планов по фильтру */
	public int[] getPlanCodeArray(ENWorkOrder2ENPlanWorkFilter filterObject,
			int fromPosition, int quantity) {
		try {
			ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getPlanCodeArray(filterObject, fromPosition,
					quantity);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get code array of {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENWorkOrder2ENPlanWork