
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENEstimateItem2Contract;
  *
  */



import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.energynet.dataminer.ENContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.ejb.generated.ENEstimateItem2ContractControllerEJBGen;
import com.ksoe.energynet.logic.InvestProgramLogic;
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.ENContractType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENContractFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ContractShortList;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.rqorder.dataminer.RQBillDAO;
import com.ksoe.rqorder.dataminer.RQBillItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQBillItem2OrderItemDAO;
import com.ksoe.rqorder.dataminer.RQBillItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.ksoe.rqorder.logic.OrderLogic;
import com.ksoe.rqorder.valueobject.RQBill;
import com.ksoe.rqorder.valueobject.RQBillItem;
import com.ksoe.rqorder.valueobject.RQBillItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQOrder;
import com.ksoe.rqorder.valueobject.RQOrderItem;
import com.ksoe.rqorder.valueobject.RQOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQOrderKind;
import com.ksoe.rqorder.valueobject.brief.RQOrderItem2ENEstimateItemShort;
import com.ksoe.rqorder.valueobject.filter.RQBillItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQBillItem2OrderItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrderItem2ENEstimateItemShortList;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;


public class ENEstimateItem2ContractControllerEJB extends ENEstimateItem2ContractControllerEJBGen
 {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


public ENEstimateItem2ContractControllerEJB() {}

   public int addWithEstimateList(ENEstimateItem2Contract object,   ENEstimateItemShort[] estimateList)
    {
        try
        {
            //int outCode = Integer.MIN_VALUE;

            if (estimateList.length == 0){
                throw new EnergyproSystemException("Не обрано жодного матеріалу для зв'язку з договором!");
            }

            if (object.finDocID == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("Не введений договір!");
            }

            ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            OrderItemLogic itemLogic = new OrderItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            RQOrderItem2ENEstimateItemDAO oi2eDAO = new RQOrderItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQOrderItemDAO oiDAO = new RQOrderItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENIPItemDAO ipiDAO = new ENIPItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            TKMaterialsDAO mDAO = new TKMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            InvestProgramLogic ipLogic = new InvestProgramLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            /* 22.01.13 Это уже не актуально - отв. лица привязываются на справочнике договоров
            ENResponsiblesDAO respDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENResponsiblesFilter respFilter = new ENResponsiblesFilter();
            respFilter.conditionSQL = "enresponsibles.code in " +
                "(select rf.responsiblesrefcode from enresponsbls2fncntrcts rf " +
                " where rf.fincontractscode in " +
                " (select c.code from fincontracts c " +
                "  where c.findocid = " + object.finDocID + "))";
            int[] respArr;
            respArr = respDAO.getFilteredCodeArray(respFilter, 0, -1);

            if (respArr.length == 0)
            {
                throw new EnergyproSystemException("Обраний Вами договір не зв'язаний з відповідальною особою!\n" +
                                                "Спочатку зробіть прив'язку!");
            }
            */

            RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            OrderLogic ol = new OrderLogic(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQOrderDAO orderDAO = new RQOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQBillItem2OrderItemDAO bi2oiDAO = new RQBillItem2OrderItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            ///// NET-4529 План закупок , тендера
            ///// если пытаются подвязать договор на естимейты но эти естимейты есть в строке заявки и на строке заявки есть уже договор то не даем делать такую привязку -
            /////// говорим что бы отменяли привязку материалов из строки заявки от договора
            for (int oii=0; oii < estimateList.length; oii++){

            	 RQOrderItem2ENEstimateItemFilter oi2eFil = new RQOrderItem2ENEstimateItemFilter();
            	 oi2eFil.estimateItem.code = estimateList[oii].code;
            	 int[] oi2eArr = oi2eDAO.getFilteredCodeArray(oi2eFil, 0, -1);
            	 if (oi2eArr.length> 0 ) {
            		 RQOrderItem2ENEstimateItem oi2eObj = oi2eDAO.getObject(oi2eArr[0]);
            		 RQOrderItem oiObj = oiDAO.getObject(oi2eObj.orderItem.code);

            		 if (oiObj.finDocID != Integer.MIN_VALUE){
  		        	   throw new EnergyproSystemException("\n На позиції заявки вже вказаний договір ... Для Зміни договора відв`язуйте  матеріали з існуючого договору " + oiObj.contractNumber +"  !!! ");
  		             }
				}


            }
            Vector<Integer> vc = new Vector<Integer>();


            int[] array = null;



            for (int i=0; i < estimateList.length; i++) {
                ENEstimateItem estimateItem = eiDAO.getObject(estimateList[i].code);

                vc.add(new Integer(estimateItem.code));

                ///// 22.01.13 NET-4202
                //if (esimateItem.statusRef.code != ENEstimateItemStatus.PLANNED)
                //    throw new EnergyproSystemException("Зв'язувати з договором можна тільки матеріали зі статусом \"Запланований\"!");
                /// 30.01.13
                /*
                if (estimateItem.statusRef.code != ENEstimateItemStatus.PLANNED && estimateItem.statusRef.code != ENEstimateItemStatus.ORDERED)
                    throw new EnergyproSystemException("Зв'язувати з договором можна тільки матеріали зі статусом \"Запланований\" або \"Замовлений\"!");
                */
                if (estimateItem.statusRef.code != ENEstimateItemStatus.PLANNED && estimateItem.statusRef.code != ENEstimateItemStatus.ORDERED)
                {
                    if (estimateItem.statusRef.code != ENEstimateItemStatus.PRESENT)
                    {
                        throw new EnergyproSystemException("\n\nNET-4202 Зв'язувати з договором можна тільки матеріали зі статусом \"Запланований\", \"Замовлений\" або \"В наявності\"!");
                    }
                    else
                    {
                        // Проверим, чтобы материал не вкинули уже в какой-нибудь приход
                        RQFKOrderFilter fkOrderFilter = new RQFKOrderFilter();
                        fkOrderFilter.conditionSQL = "rqfkorder.code in ( " +
                                " select o.code " +
                                " from rqfkorderitem2enstmttm ie, rqfkorderitem oi, rqfkorder o " +
                                " where ie.fkorderitemrefcode = oi.code " +
                                "   and oi.fkorderrefcode = o.code " +
                                "   and ie.finmaterialsrefcode is null " +
                                "   and ie.estimateitemcode = " + estimateItem.code + ")";
                        RQFKOrderShortList fkOrderList = fkOrderDAO.getScrollableFilteredList(fkOrderFilter, 0, -1);
                        if (fkOrderList.totalCount > 0)
                        {
                            throw new EnergyproSystemException("\n\nNET-4202 Матеріал з кодом " + estimateItem.code + " вже включений у приходний ордер № " +
                                    fkOrderList.get(0).numberDoc + " від " + new SimpleDateFormat("dd.MM.yyyy").format(fkOrderList.get(0).dateGen));
                        }
                    }
                }
                ///
                /////


                ENEstimateItem2Contract e2c = new ENEstimateItem2Contract();

                e2c.org.code = itemLogic.copyOrg(object.org);

                e2c.contractDate = object.contractDate;
                e2c.contractNumber = object.contractNumber;
                e2c.finDocCode = object.finDocCode;
                e2c.finDocID = object.finDocID;
                //e2c.countFact = object.countFact;
                e2c.estimateItem.code = estimateList[i].code;
                e2c.countFact = estimateList[i].countFact;
                e2c.rqPurchItm2Estimate.code = estimateList[i].purchaseItem2EstimateitemCode;


                e2cDAO.add(e2c);

                ////////// 16042014 задание по ИП NET-4344 нада если естимейт привязали к договору то
                // если этот эстимейт привязан к ИП то пробовать одновить договор для пункта ИП
               /*!!!! вынес за цикел,, сразу по всем естимейтам что бы ENIPItemFilter ipiFilter = new ENIPItemFilter();
                ipiFilter.conditionSQL = " enipitem.code in ( \n" +
                		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
                		" where q.estimateitemcode  = " + estimateList[i].code  + "  \n" +
                		" and q.estimateitemcode = ei.code  \n" +
                		" and ei.planrefcode = pp.planrefcode ) \n" +
                		"  \n" ;

                ENIPItemShortList ipiList = ipiDAO.getScrollableFilteredList(ipiFilter, 0, -1);
                for (int c=0; c < ipiList.totalCount; c++){

                	ipLogic.recalcContract(ipiList.get(c).code);
                	ENIPItem ipiObj = ipiDAO.getObject(ipiList.get(c).code);
                	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
                     	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
         		    }
                }*/



                ///////// 22.01.13 NET-4202 Если материал уже заказан, апдейтим договор на строке заявки на тот, который мы привязываем
                if (estimateItem.statusRef.code == ENEstimateItemStatus.ORDERED || estimateItem.statusRef.code == ENEstimateItemStatus.PRESENT)
                {
                    RQOrderItem2ENEstimateItemFilter oi2eFilter = new RQOrderItem2ENEstimateItemFilter();
                    oi2eFilter.estimateItem.code = estimateItem.code;
                    RQOrderItem2ENEstimateItemShortList oi2eList = oi2eDAO.getScrollableFilteredList(oi2eFilter, 0, -1);

                    if (oi2eList.totalCount > 0)
                    {
                        RQOrderItem orderItem = oiDAO.getObject(oi2eList.get(0).orderItemCode);

                        ///// 23.01.13 Проверяем, чтобы не привязывали часть строки заявки под договор - только полностью
                        ///// (иначе ее придется делить на 2 строки - под одну подвязывать наш договор, а на второй (оставшаяся часть) оставлять старый)
                        RQOrderItem2ENEstimateItemFilter tmpOi2eFilter = new RQOrderItem2ENEstimateItemFilter();
                        tmpOi2eFilter.orderItem.code = orderItem.code;
                        RQOrderItem2ENEstimateItemShortList tmpOi2eList = oi2eDAO.getScrollableFilteredList(tmpOi2eFilter, 0, -1);

                        boolean inArray = false;

                        for (int j = 0; j < tmpOi2eList.totalCount; j++)
                        {


                            for (int k = 0; k < estimateList.length; k++)
                            {
                                if (estimateList[k].code == tmpOi2eList.get(j).estimateItemCode)
                                {
                                    inArray = true;
                                    break;
                                }
                            }


                        }

                        if (! inArray)
                        {
                        	TKMaterials mObj = mDAO.getObject(estimateItem.materialRef.code);
                            //throw new EnergyproSystemException("NET-4202 Кількість матеріала в позиції заявки перевищує кількість, що прив'язується до договора!");
                            // SUPP-39252 Выведем также кол-во эстимейта, а то код мало что говорит исполнителю
                        	/*throw new EnergyproSystemException(String.format("/n/n" +
                                    " NET-4202 Кількість матеріала в позиції заявки перевищує кількість, що прив'язується до договора (%s)! \n " +
                                    " код связки заявки-плана %d ", estimateItem.countFact, tmpOi2eList.get(j).code) + " \n В перелік позицій що привязуються до договору "
                                    		+ " треба обрати також позицію " + mObj.name + " у кількості "  + estimateItem.countFact  );*/
                        	throw new EnergyproSystemException(String.format("/n/n" +
                                    " NET-4202 Кількість матеріала в позиції заявки перевищує кількість, що прив'язується до договора (%s)! \n " +
                                    " код связки заявки-плана ", estimateItem.countFact) + " \n В перелік позицій що привязуються до договору "
                                    		+ " треба обрати також позицію " + mObj.name + " у кількості "  + estimateItem.countFact  );
                        }




                        orderItem.org.code = itemLogic.copyOrg(object.org);

                        if (object.finDocID > Integer.MIN_VALUE)
                        {
                            orderItem.finDocID = object.finDocID;
                            orderItem.finDocCode = object.finDocCode;
                            orderItem.contractNumber = object.contractNumber;
                            orderItem.contractDate = object.contractDate;

                        }
                        else
                        {
                            if (object.contractNumber != null && object.contractNumber != "")
                                orderItem.contractNumber = object.contractNumber;
                        }

                        // SUPP-28268 обновим цены на строках заявки . берем с договора
                        {
                        	ENEstimateItem2ContractFilter e2cFilter = new ENEstimateItem2ContractFilter();
                            e2cFilter.estimateItem.code = estimateItem.code;
                            ENEstimateItem2ContractShortList e2cList = e2cDAO.getScrollableFilteredList(e2cFilter, 0, -1);

                            BigDecimal priceByContract = new BigDecimal(0);
                            priceByContract = e2cList.get(0).priceByContract;

                            if (priceByContract.compareTo(new BigDecimal(0)) > 0)
                            {

	                            	RQOrder order = orderDAO.getObject(orderItem.orderRef.code);
	                            	// для услуг не будем апдейтить цену
	                            	if(order.kindRef.code != RQOrderKind.OE_PLANNED_SERVICES && order.kindRef.code != RQOrderKind.OE_NOPLANNED_SERVICES  ){

	                            	// проверим что бы на строку заявки не было счета
	                            	RQBillItem2OrderItemFilter bi2oiFilter = new RQBillItem2OrderItemFilter();
	                            	bi2oiFilter.orderItemRef.code = orderItem.code;
	                            	int[] bi2oiArr = bi2oiDAO.getFilteredCodeArray(bi2oiFilter, 0, -1);

	                            	if (bi2oiArr.length > 0 ){
	                            		throw new EnergyproSystemException("/n/n" +
	                                            " SUPP-28268 Помилка при оновленні договірної ціни на строках заявки. " +
	                                            " \n\n У заявці " + order.numberDoc + " по позиції " + orderItem.materialNameGen + " вже складений рахунок" );
	                            	}



	                            	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, order.orderPeriod);
	                                BigDecimal nds_coeff = nds.divide(new BigDecimal(100)).add(new BigDecimal(1));

	                            	orderItem.priceWithoutNds = priceByContract;
	                            	orderItem.priceWithNds = orderItem.priceWithoutNds.multiply(nds_coeff).setScale(2, BigDecimal.ROUND_HALF_UP);

	                            	orderItem.sumWithoutNds = orderItem.countFact.multiply(orderItem.priceWithoutNds).setScale(2, BigDecimal.ROUND_HALF_UP);
	                            	orderItem.sumGen = orderItem.countFact.multiply(orderItem.priceWithNds).setScale(2, BigDecimal.ROUND_HALF_UP);

	                            	orderItem.sumNds = new BigDecimal(0);
	                            	orderItem.nds = nds;
	                            	}
                            }
                        }



                        oiDAO.save(orderItem);

                        // SUPP-29334  не проставляется вид оплат в заявках если заявка уже сформирована и на строки материалов которые в этой строке
                        // заявки привязывают тендерные договора

                        // определим тип оплаты и значение для строки заявки
                        RQOrderItem tmpItem = itemLogic.getOrderItemWithTypePay(orderItem);

                        if (tmpItem != null)
                        {
                        	RQOrderItem oiObjectInserted = oiDAO.getObject(orderItem.code);
                        	RQOrder order = orderDAO.getObject(orderItem.orderRef.code);
                        	if (oiObjectInserted.finDocID > Integer.MIN_VALUE)
                            {
	                        	oiObjectInserted.typePayRef.code = tmpItem.typePayRef.code;
	                        	oiObjectInserted.paymentValue = tmpItem.paymentValue;
	                            // определим даты поставки и дату оплаты план
	                            RQOrderItem tmpItem2 = itemLogic.getOrderItemWithPlannedDates(oiObjectInserted, order);
	                            oiObjectInserted.plannedDatePays = tmpItem2.plannedDatePays;
	                            oiObjectInserted.plannedDateDelivery = tmpItem2.plannedDateDelivery;
	                            oiDAO.save(oiObjectInserted);
                            }

                        }

                    }
                }
                /////////

                array = new int[vc.size()];
                for(int cc = 0;cc < vc.size();cc++)
                 array[cc] = ((Integer)vc.get(cc)).intValue();
            }

           // !!!!!!!!!!!!

            ////////// 16042014 задание по ИП NET-4344 нада если естимейт привязали к договору то
            // по набору естимейтов одновим договор для пунктов ИП
           ENIPItemFilter ipiFilter = new ENIPItemFilter();
            ipiFilter.conditionSQL = " enipitem.code in ( \n" +
            		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
            		" where q.estimateitemcode  = any(array  " + Arrays.toString(array)  + " )  \n" +
            		" and q.estimateitemcode = ei.code  \n" +
            		" and ei.planrefcode = pp.planrefcode ) \n" +
            		"  \n" ;

            ENIPItemShortList ipiList = ipiDAO.getScrollableFilteredList(ipiFilter, 0, -1);
            for (int c=0; c < ipiList.totalCount; c++){

            	ipLogic.recalcContract(ipiList.get(c).code);
            	ENIPItem ipiObj = ipiDAO.getObject(ipiList.get(c).code);
            	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
                 	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
     		    }
            }

            return Integer.MIN_VALUE;

   }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.rqorder.valueobject.RQOrderItem%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
    }



   public void removeByEstimateCode(int estimateItemCode)
    {
        try
        {
            //int outCode = Integer.MIN_VALUE;


            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQBillItem2ENEstimateItemDAO bi2eiDAO = new RQBillItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENEstimateItem estimateItem = eDAO.getObject(estimateItemCode);
            TKMaterialsDAO mDAO = new TKMaterialsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQBillItemDAO biDAO = new RQBillItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQBillDAO bDAO = new RQBillDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            RQOrderItemDAO oiDAO = new RQOrderItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQOrderItem2ENEstimateItemDAO oi2eiDAO = new RQOrderItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENIPItemDAO ipiDAO = new ENIPItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            RQOrgDAO orgDAO = new RQOrgDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            InvestProgramLogic ipLogic = new InvestProgramLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENContractDAO ctrDAO = new ENContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ///// NET-4529 План закупок , тендера
            // / отменять привязку даем и на строках которые в заявке тоже
            /// но проверка если есть счет добавляется .
            if (estimateItem.statusRef.code != ENEstimateItemStatus.PLANNED 
            		&& estimateItem.statusRef.code != ENEstimateItemStatus.ORDERED 
            		&& estimateItem.statusRef.code != ENEstimateItemStatus.PRESENT )
                throw new EnergyproSystemException("Видаляти прив'язку можна тільки для матеріалів зі статусом \"Запланований\"  , \"Замовлений\" та \"У наявності\" але без рахунку   !");

            RQBillItem2ENEstimateItemFilter bi2eiFil = new RQBillItem2ENEstimateItemFilter();
            bi2eiFil.estimateItem.code = estimateItemCode;
            int[] bi2eiArr = bi2eiDAO.getFilteredCodeArray(bi2eiFil, 0, -1);

            if (bi2eiArr.length > 0 ){

            	RQBillItem2ENEstimateItem bi2eiObj = bi2eiDAO.getObject(bi2eiArr[0]);

            	RQBillItem biObj = biDAO.getObject(bi2eiObj.billItem.code);

            	RQBill bObj = bDAO.getObject(biObj.billRef.code);

            	TKMaterials mObj = mDAO.getObject(estimateItem.materialRef.code);

        		throw new EnergyproSystemException("/n/n" +
                        " SUPP-28268 Помилка при відв`язці матеріалів від договору  . Матеріал " + mObj.name + " вже у рахунку № " + bObj.numberDoc );

        	}

            ///// NET-4529 План закупок , тендера
            /// если естимейт в заявке и на строке заявки указан договор то уберем договор ------------!!!!!!!!!!!!! но тока важно что б для отвязки выбрали при вызове этой фукции все естимейты которпые в строке заявки
            RQOrderItem2ENEstimateItemFilter oi2eiFilter = new RQOrderItem2ENEstimateItemFilter();
            oi2eiFilter.estimateItem.code = estimateItemCode;
            RQOrderItem2ENEstimateItemShortList oi2eiList = oi2eiDAO.getScrollableFilteredList(oi2eiFilter, 0, -1);

            if (oi2eiList.totalCount > 0 ){
              RQOrderItem oiObj =oiDAO.getObject(oi2eiList.get(0).orderItemCode)	;

              if ( oiObj.finDocID != Integer.MIN_VALUE){

            	  oiObj.finDocID  = Integer.MIN_VALUE;
            	  oiObj.finDocCode = "";
            	  oiObj.contractDate = null;
            	  oiObj.contractNumber = "";

            	  //<< с Лесей согласовано - что если отвязіваем от договора то чистим и код проекта договора и ссылку на спецификацию
            	  // т.к если мы потом с этой строки завяки попытаемся создать еще проект договора то ругается что заявка уже включена к проекту договора .
            	  // а получилось так что проект договора был утвержден и после уже поставщик сказал что цены подымает - и мы отказались от договора и решили подтягивать
            	  // материалы с заявки к другому проекту
            	  oiObj.agreeDocNum = "";
            	  oiObj.specificationCode = Integer.MIN_VALUE;
            	  //>>>
            	  int orgCodeInOrderItemCode =  oiObj.org.code;
            	  oiObj.org.code = Integer.MIN_VALUE;

            	  oiDAO.save(oiObj);
            	  // SUPP-72963 не будем удалять (при добавлении нового не создавать просто если такая запись уже есть ) orgDAO.remove(orgCodeInOrderItemCode);


              }

            }
            ENEstimateItem2ContractFilter f = new ENEstimateItem2ContractFilter();
            f.estimateItem.code = estimateItemCode;

            int[] arr = e2cDAO.getFilteredCodeArray(f, 0, -1);
            if ((arr.length == 0) || (arr.length > 1)){
                throw new EnergyproSystemException("Кількість договорів на матеріалі " + arr.length);
            }

            ENEstimateItem2Contract e2c = e2cDAO.getObject(arr[0]);


            //<<<<<<<<<<этот метод вызывается также при переносе плана поэтому проверим . если договор еще с типом "проект договора "
            // то пока ругаться будем что бы отвязывали от проекта договора -- там отдельный метод есть (estimatelogic estimate2ProjectAgreeUnlink(ENEstimateItemShort[] eiList){ )
            ENContractFilter ctrFil = new ENContractFilter();
            ctrFil.contractNumber = e2c.contractNumber;
            ctrFil.org.okpo = e2c.org.okpo;

            int[] ctrArr = ctrDAO.getFilteredCodeArray(ctrFil, ctrFil.conditionSQL, "", 0, -1, null);
            if(ctrArr.length == 0 ) {
            	throw new EnergyproSystemException(" Не знайдено договір в ENContract   !!!! \n"
            			                 + " contractNumber =" + e2c.contractNumber + "\n"
            			                 + " org.okpo = " +  e2c.org.okpo );
            }
            ENContract ctrObj = ctrDAO.getObject(ctrArr[0]);
            if(ctrObj.contractType.code == ENContractType.CONTRACT_PROJECT) {
            	TKMaterials mObj = mDAO.getObject(estimateItem.materialRef.code);

            	throw new EnergyproSystemException(" Матеріал " + mObj.name + " з плану = " + estimateItem.planRef.code + " вже доданий до проекту договору № " + e2c.contractNumber
            			 + ". Відміняйте прив`язку матеріалу до проекту договору!!! ");
            }
            //>>>>>>>>>>>>>>>>>>>>>

            ////////// 16042014 задание по ИП NET-4344 нада если естимейт привязали к договору то
            // если этот эстимейт привязан к ИП то пробовать одновить договор для пункта ИП
            ENIPItemFilter ipiFilter = new ENIPItemFilter();
            ipiFilter.conditionSQL = " enipitem.code in ( \n" +
            		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
            		" where q.estimateitemcode  = " +estimateItemCode  + "  \n" +
            		" and q.estimateitemcode = ei.code  \n" +
            		" and ei.planrefcode = pp.planrefcode ) \n" +
            		"  \n" ;
            /////!!!!!выберем до удаления из связки а пересчитывать после удаления  --> ipiList
            ENIPItemShortList ipiList = ipiDAO.getScrollableFilteredList(ipiFilter, 0, -1);

            e2cDAO.remove(e2c.code);




            for (int c=0; c < ipiList.totalCount; c++){

            	ipLogic.recalcContract(ipiList.get(c).code);
            	ENIPItem ipiObj = ipiDAO.getObject(ipiList.get(c).code);
            	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
                 	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
     		    }
            }

          //  14.02.2018 не будем удалять .т.к на єтот орг можгут быть еще ссылки  orgDAO.remove(e2c.org.code);

  }
  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.rqorder.valueobject.RQOrderItem%} object.",e);}
  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
  finally                              {closeConnection();}
    }


   /**
    * отвязка естимейтов по строке заявки */
   public void removeByOrderItemCode(int OrderItemCode)
   {
       try
       {

    	   ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           RQOrderItem2ENEstimateItemDAO oiesDao = new RQOrderItem2ENEstimateItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           DocFlowLogic docFlowLogic = new DocFlowLogic(getUserProfile(),getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE));
           
           // SUPP-62132 Проверка, что материалы заявки не связаны с договором на закупку ТМЦ
           RQOrderItem2ENEstimateItemFilter oiesFilter = new RQOrderItem2ENEstimateItemFilter();
           oiesFilter.orderItem.code = OrderItemCode;
           RQOrderItem2ENEstimateItemShortList oiesList = oiesDao.getScrollableFilteredList(oiesFilter, 0, -1);
           for(RQOrderItem2ENEstimateItemShort oiesObj : oiesList.list) {
        	   docFlowLogic.checkEstimateExistsInDFDocAgreement(oiesObj.estimateItemCode, true);
           }


           RQOrderItemDAO oiDAO = new RQOrderItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           RQOrderItem oiObj = oiDAO.getObject(OrderItemCode);

           ENIPItemDAO ipiDAO = new ENIPItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

           RQOrgDAO orgDAO = new RQOrgDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

           InvestProgramLogic ipLogic = new InvestProgramLogic(
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ///// NET-4529 План закупок , тендера
           // / отменять привязку даем и на строках которые в заявке тоже
           /// но проверка если есть счет добавляется .
           ENEstimateItemFilter eiStatusFilter = new ENEstimateItemFilter();
           eiStatusFilter.conditionSQL = " enestimateitem.code \n" +
        		   				" in (select oi2ei.estimateitemcode from rqorderitem2enestimttm oi2ei , enestimateitem eii \n" +
        		   				" where oi2ei.orderitemcode = " + oiObj.code +" \n" +
        		   				" and oi2ei.estimateitemcode = eii.code \n" +
        		   				" and (( eii.statusrefcode not in ( /*PLANNED*/"+ENEstimateItemStatus.PLANNED +" , /*ORDERED*/"+ENEstimateItemStatus.ORDERED +" , /*PRESENT*/"+ENEstimateItemStatus.PRESENT +" ) ) \n"  +
        		   				"      or  \n"  +
        		   				" ( ( select count(bi2ei.estimateitemcode) from rqbillitem2enestimattm bi2ei where bi2ei.estimateitemcode = eii.code  ) > 0 ) \n"  +
        		   	            " ) \n"  +
        		   				" )  ";
           int[] eiStatusArr = eDAO.getFilteredCodeArray(eiStatusFilter, 0, -1);

           if (eiStatusArr.length > 0 )
               throw new EnergyproSystemException("Видаляти прив'язку можна тільки для матеріалів зі статусом \"Запланований\"  та \"Замовлений\" та \"У наявності\" але без рахунку   !");

           ////////// 16042014 задание по ИП NET-4344 нада если естимейт привязали к договору то
           // если этот эстимейт привязан к ИП то пробовать одновить договор для пункта ИП
           ENIPItemFilter ipiFilter = new ENIPItemFilter();
           ipiFilter.conditionSQL = " enipitem.code in ( \n" +
           		" select pp.ipitemrefcode from enestimateitem2contrct q , enestimateitem ei ,  enipitem2plan pp \n" +
           		" where q.estimateitemcode  in ( select rqorderitem2enestimttm.estimateitemcode from rqorderitem2enestimttm where rqorderitem2enestimttm.orderitemcode = " + oiObj.code + " ) " +
           		" and q.estimateitemcode = ei.code  \n" +
           		" and ei.planrefcode = pp.planrefcode ) \n" +
           		"  \n" ;
           /////!!!!!выберем до удаления из связки а пересчитывать после удаления  --> ipiList
           ENIPItemShortList ipiList = ipiDAO.getScrollableFilteredList(ipiFilter, 0, -1);

           e2cDAO.removeByOrderitem(oiObj.code);

           for (int c=0; c < ipiList.totalCount; c++){
            	ipLogic.recalcContract(ipiList.get(c).code);
            	ENIPItem ipiObj = ipiDAO.getObject(ipiList.get(c).code);
           	 if(ipiObj.parentRef.code != Integer.MIN_VALUE){
                	ipLogic.recalcParentIpItemInfoTenders(ipiObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
    		    }
           }

           orgDAO.removeByOrderItem(oiObj.code);

           // договора на строке заявки убрать
           oiObj.finDocCode = "";
           oiObj.finDocID = Integer.MIN_VALUE;
           oiObj.contractDate = null;
           oiObj.contractNumber = "";
           oiObj.generalContractRef.code = Integer.MIN_VALUE;
           oiDAO.save(oiObj);


 }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.rqorder.valueobject.RQOrderItem%} object.",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
   }


   /**
    * Получить кол-во материала по ТЕНДЕРНОМУ договору, еще не подвязанное под планы
    *
    * @param finDocCode - код договора из ФК
    * @param materialCode - код материала
    *
    * @return Кол-во материала
    */
   public BigDecimal getRestCountByContract(String finDocCode, int materialCode)
   {
    try
    {
        ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        return e2cDAO.getRestCountByContract(finDocCode, materialCode);
    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getRestCountByContract",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

} // end of EJB Controller for ENEstimateItem2Contract