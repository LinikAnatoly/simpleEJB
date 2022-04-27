
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSOPayBillProv;
 *
 */

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.ConfigDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENPayment2SODAO;
import com.ksoe.energynet.dataminer.ENSOBillDAO;
import com.ksoe.energynet.dataminer.ENSOPayBillProvDAO;
import com.ksoe.energynet.dataminer.ENServicesContractKindDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2ProvDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENSOPayBillProvControllerEJBGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENSOBill;
import com.ksoe.energynet.valueobject.ENSOPayBillProv;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2ProvFilter;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2ProvShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.logic.AXPostingLogic;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.custtransks.CustTransksActions;
import com.ksoe.mdax.services.ledgertransks.LedgerTransksActions;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.mdax.valueobject.lists.AXCustTransShortList;
import com.ksoe.mdax.valueobject.lists.AXLedgerTransShortList;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKFINWorkType2ENServicesContractKindDAO;
import com.ksoe.techcard.dataminer.TKFINWorkTypeDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKFINWorkType;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;

public class ENSOPayBillProvControllerEJB extends
		ENSOPayBillProvControllerEJBGen {

	public ENSOPayBillProvControllerEJB() {
	}


    public FKProvObjectShortList getPostings4BillList(int soPayBillProvCode)
    {
        FKProvObjectShortList result = new FKProvObjectShortList();

        Connection finConn = null;

        try
        {
        	ENSOPayBillProvDAO spbpDAO = new ENSOPayBillProvDAO(
        			getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        	ENSOPayBillProv spbp = spbpDAO.getObject(soPayBillProvCode);

            ENServicesObject2ProvFilter servicesObject2ProvFilter = new ENServicesObject2ProvFilter();
            servicesObject2ProvFilter.code = spbp.so2ProvRef.code;

            ENServicesObject2ProvDAO servicesObject2ProvDAO = new ENServicesObject2ProvDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObject2ProvShortList so2pList = servicesObject2ProvDAO.getScrollableFilteredList(servicesObject2ProvFilter, 0, -1);

            if (so2pList.totalCount == 0)
            {
                return result;
            }

            if (so2pList.totalCount > 1)
            {
                throw new EnergyproSystemException("Знайдено декілька (" + so2pList.totalCount + ") пачок проводок для цього договору!");
            }

            //enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            int partId = so2pList.get(0).partId;
            if (partId == Integer.MIN_VALUE)
            {
                throw new EnergyproSystemException("Відсутній код пачки проводок для цього договору!");
            }

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
            return fpLogic.getProvListFromFin(partId);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с БД Фин.Коллекции ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }


    /**
     *  Получить дату проведения по коду договора
     *
     *  @param soPayBillProvCode - код связки проводок счетов и оплат по договору
     *  @return datePostings - дата проведения
     */
    public Date getDatePostings4BillByPayBillProvCode(int soPayBillProvCode) {
        Date datePostings = null;
        try {
            ENSOPayBillProvDAO sopbpDAO = new ENSOPayBillProvDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENSOPayBillProv sobpb = sopbpDAO.getObject(soPayBillProvCode);

            ENServicesObject2ProvDAO provDAO = new ENServicesObject2ProvDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObject2Prov prov = provDAO.getObject(sobpb.so2ProvRef.code);

            datePostings = prov.datePosting;

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }

        return datePostings;
    }


	public FKProvResult moveToFK(ENSOPayBillProv soPayBillProv) {
		try {

			// по дефолту будем брать дату со счета, если не введена другая
			ENSOBillDAO soBillDAO = new ENSOBillDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENSOBill soBill = soBillDAO.getObject(soPayBillProv.soBillRef.code);
			Date postingDate = soBill.dateGen;

			return moveToFK(soPayBillProv, postingDate);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Помилка зв'язку з БД!", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
		}
	}


	public FKProvResult moveToFK(ENSOPayBillProv soPayBillProv, Date postingDate) {
		Connection enConn = null;
		Connection finConn = null;
		Connection authConn = null;

	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);


	            ENServicesContractKindDAO soKindDao = new ENServicesContractKindDAO(enConn, getUserProfile());

	            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
	            ENGeneralContractsDAO genContractDAO = new ENGeneralContractsDAO(enConn, getUserProfile());
	            ENServicesObject so = soDAO.getObject(soPayBillProv.soRef.code);

                DepartmentLogic depLogic = new DepartmentLogic(enConn, getUserProfile());

                AXPostingLogic axpLogic = new AXPostingLogic(finConn, getUserProfile());
                TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(getUserProfile(), enConn);
                FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
                AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
                
                TKFINWorkTypeDAO finWorkTypeDao = new TKFINWorkTypeDAO(enConn, getUserProfile());
                TKFINWorkType2ENServicesContractKindDAO finWorkType2ServicesContractKindDao = 
                		new TKFINWorkType2ENServicesContractKindDAO(enConn, getUserProfile());


                /** SUPP-58594... 23.01.2017 +++ при отсутствии связи с договором в АХ */
    			if (so.generalContractRef.code == Integer.MIN_VALUE) {
    				ContractLogic cLogic = new ContractLogic(enConn, getUserProfile());
    				so.generalContractRef.code = cLogic
    						.addByContractNumber(so.contractNumber, so.partnerCode, so.finDocCode, true, true);
    			}


                ENGeneralContractsFilter genContractFilter = new ENGeneralContractsFilter();
                genContractFilter.code = so.generalContractRef.code;

                ENGeneralContractsShortList genContractList = genContractDAO.getScrollableFilteredList(genContractFilter, 0, -1);


	          /*  if (!getUserProfile().domainInfo.domain.equals("root")) {
	                if (!getUserProfile().domainInfo.domain.equals(so.domain_info)) {
	                    throw new EnergyproSystemException(
	                            "У Вас немає прав на проведення документів цього підрозділу!");
	                }
	            } */

	            // /// Проверки на статус
	            if (so.statusRef.code == ENServicesObjectStatus.CLOSED) {
	                throw new EnergyproSystemException(
	                        "Договір вже проведений!");
	            }

              String cehCode = "";
              String cehCodePodr = "";
              
              // SUPP-103693
              cehCode = "000"; //cehCode = depLogic.getFINCehCodeByDepartmentCode(so.department.code, false);
              cehCodePodr = "000";  //cehCodePodr = depLogic.getFINCehCodePodrByDepartmentCode(so.department.code, false);

              if (cehCode == "")
              {
                  throw new SystemException("Невідомий Підрозділ у акті! Код: " +
                  		so.department.code + " (код акту: " +
                  		so.code + ") (1)");
              }

              if (cehCodePodr == "")
              {
                  throw new SystemException("Невідомий Підрозділ у акті! Код: " +
                  		so.department.code + " (код акту: " +
                  		so.code + ") (2)");
              }

              int[] classificationTypeCodes = ctDAO.getClassificationCodesArrayByServicesObjectCode(so.code, null, postingDate);
              if(classificationTypeCodes.length == 0) {
            	  classificationTypeCodes = new int[] {-1};
              }
              

              TKClassificationTypeFilter ctFilter = new TKClassificationTypeFilter();
              ctFilter.conditionSQL = String.format("tk.%s in (%s)"
             		 , TKClassificationType.code_Field
             		 , Tools.repeatSymbol("?", ",", classificationTypeCodes.length));
              Vector<Integer> parameters = new Vector<Integer>();
              for(int classificationTypeCode : classificationTypeCodes) parameters.add(classificationTypeCode);
              
              TKClassificationTypeShortList ctList = ctDAO.getScrollableFilteredList(ctFilter, 0, -1, parameters);
              
              
              ctFilter.conditionSQL = ctFilter.conditionSQL.replace("tk.", "");
              List<Double> finWorkTypeCodes = ctDAO.getListOfPropertyValues(TKClassificationType.finWorkType_QFielld, ctFilter, 0, -1, parameters);
              
              String kau = null;
              String account = null;
              
              for(Double finWorkTypeCode : finWorkTypeCodes) {
            	  TKFINWorkType finWorkType = finWorkTypeDao.getObject(finWorkTypeCode.intValue());
            	  
            	  if(finWorkType.finCode == null || finWorkType.finCode.length() == 0) finWorkType.finCode = "00";
            	  
            	  
            	  if(kau != null) {
            		if(!kau.equals(finWorkType.finCode)) {
            			throw new SystemException(String.format("Не співпадають коди видів робіт у переліку калькуляцій - %s та %s"
            					, kau, finWorkType.finCode));
            		}
            	  } else {
            		  kau = finWorkType.finCode;
            	  }
            	  
            	  if(account != null) {
            		if(!account.equals(finWorkType.account)) {
            			throw new SystemException(String.format("Не співпадають бух. рахунки для послуг у переліку калькуляцій - %s та %s"
            					, account, finWorkType.account));
            		}
            	  } else {
            		  account = finWorkType.account;
            	  }
              }
              
              
              TKFINWorkType finWorkType = finWorkType2ServicesContractKindDao.getTKFINWorkTypeByServicesContractKindCode(so.contractKindRef.code);

              
              /** SUPP-43796... +++ 19.01.2016 проводки пока только для двух видов договоров!!!!!
              1) в "Договори на видачу умов(ОКСН)" , 5-й знак должен быть Й, вместо П
              2) в "Договори відшкодування витрат(ОКСН)" 5-й знак должен быть Ч, вместо П
			  */

              /** 5-й знак определяется по виду договора */
              String contractKind = (finWorkType != null) ? finWorkType.finCode : "";
              String contractKind_AX = (finWorkType != null) ? finWorkType.axCode : "";
              if (so.contractKindRef.code == ENServicesContractKind.SHIFT_LINES_COMPANY_OBJ
            		  || so.contractKindRef.code == ENServicesContractKind.SHIFT_LINES_CUSTOMER_OBJ
            		  || so.contractKindRef.code == ENServicesContractKind.SUPPLIER_CONTRACT
            		  || so.contractKindRef.code == ENServicesContractKind.REMOVAL_LINE_RM_KB 
            		  || so.contractKindRef.code == ENServicesContractKind.SERVICES_LUZOD_ASKOE) {
            	  if(kau != null && kau.length() > 0) {
            		  contractKind = kau;
            	  }
              } 
              
              if (contractKind == null || contractKind.equals("")) {
            	  String kindName = soKindDao.getObject(so.contractKindRef.code).name;

            	  throw new SystemException("\n\n"
            	  		+ "Для виду договору " + kindName + " не вказано шаблон проводок!!!");
              }

              if(account == null || account.length() == 0) {
            	  if(Arrays.asList("Й", "2").contains(contractKind)) {
            		  account = "3615";
            	  } else {
            		  account = "3618";
            	  }
              }

              String V_Prov_Buffer = "";
              String description = "";

              description = "Договори на виконання робіт №" + so.contractNumberServices +
              		      " від " + new SimpleDateFormat("dd.MM.yyyy").format(so.contractDateServices).toString();

              ENSOBillDAO soBillDAO = new ENSOBillDAO(enConn, getUserProfile());
              ENSOBill soBill = soBillDAO.getObject(soPayBillProv.soBillRef.code);

              BigDecimal sumTotal = (soBill.sumTotal).setScale(2, BigDecimal.ROUND_HALF_UP);
              BigDecimal sumBase = soBill.sumGen.setScale(2, BigDecimal.ROUND_HALF_UP);
              BigDecimal sumVat = soBill.sumVat.setScale(2, BigDecimal.ROUND_HALF_UP);
              
              // под заданию SUPP-63611 добавим проверку (база + ндс = обща сумма) 
              if( (sumBase.add(sumVat).setScale(2, BigDecimal.ROUND_HALF_UP)).compareTo(sumTotal) != 0  ){
            	  throw new EnergyproSystemException(" \n Невірно заведені суми по рахунку від " + 
              new SimpleDateFormat("dd.MM.yyyy").format(soBill.dateGen).toString() 
              + "\n сумма Всього з ПДВ не дорівнює сумі ( Сума без ПДВ + ПДВ )  !!! "
            			  ); 
            	  
              }

              // посчитаем сумму оплат этого счета
              ENPayment2SODAO soPayDAO = new ENPayment2SODAO(enConn, getUserProfile());
              ENPayment2SOFilter soPayFilter = new ENPayment2SOFilter();
              soPayFilter.soBillRef.code = soBill.code;
              ENPayment2SOShortList soPayList = soPayDAO.getScrollableFilteredList(soPayFilter, 0, -1);

              BigDecimal sumTotalPay = new BigDecimal(0);

              for (int t=0;t<soPayList.totalCount;t++)
              {
            	  sumTotalPay = sumTotalPay.add(soPayList.get(t).sumTotal);
              }


            String _messageId = "";

              // Передача проводок по услугам со стороны Mdax ( 0-только в фин. , 1-и в фин и в АХ , 2- только в АХ)
            int posting_move_config = 0;

  			ConfigDAO configDAO = new ConfigDAO(getUserProfile(), authConn);
  			Config conf = configDAO.getObject(Config.CONFIG_USES_MDAX_SERVICESFROMSIDE_POSTING);
  			posting_move_config = Integer.parseInt(conf.value);

  			boolean posting_move_mdax = posting_move_config == 1 || posting_move_config == 2 ? true : false;



          	 AXLedgerTransShortList ledgerTransPostingPackList = null;
             AXCustTransShortList custTransPostingPackList = null;
             
             // 16.09.2019 Если в договоре не будет работ, то тогда проводки идут как нелицензионные
             boolean isLicensed = ctList.totalCount != 0 && ctList.get(0).isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;


             String axWorkTypeCode = (ctList.totalCount != 0)? ctList.get(0).axWorkTypeCode : "";

             String ax_licNoLic = "229000"; // 4-й знак при счете 7913....
 			if (axWorkTypeCode.equals("2010035")
 				|| axWorkTypeCode.equals("2010033")
 				|| axWorkTypeCode.equals("2010030")
 				|| axWorkTypeCode.equals("2010008")
 				|| axWorkTypeCode.equals("2010020")
 				|| axWorkTypeCode.equals("2010023")) {
 				ax_licNoLic = "229001";
 			}

 			/* Группа договора mDAX*/
            String axContractGroupCode = "";

            if (genContractList.totalCount == 0 ) {
            	throw new EnergyproSystemException(" Недостатньо даних по договору ФК/AX !!! ");
            } else {
            	so.partnerCode = genContractList.get(0).partnerCode;
            	so.finDocCode = genContractList.get(0).finDocCode;
            	so.contractNumber = genContractList.get(0).contractNumber;

            	so.axPartnerCode = genContractList.get(0).axPartnerCode;
            	so.axContractCode = genContractList.get(0).axContractCode; // для аналитик нужен код договора АХ
            	so.axContractNumber = genContractList.get(0).axContractNumber;
            	so.axContractAccount = genContractList.get(0).axContractAccount; // для проводки Custtrans рег. номер договора АХ

            	axContractGroupCode = genContractList.get(0).axContractGroupCode;

                if(posting_move_mdax && axContractGroupCode.equals("") ){
              	   throw new EnergyproSystemException(" Невідома група договору AX !!! ");
                }


            }


              if (sumTotalPay.compareTo(new BigDecimal(0)) > 0) {

   	    	V_Prov_Buffer = fpLogic.generateQuery4RentBillAndPay(
  						cehCode, cehCodePodr,
						so.partnerCode,
						so.finDocCode,
  						sumTotal, sumBase, sumVat,
  						sumTotalPay,
  						description,
  						postingDate,
  						contractKind,
  						account,
  						isLicensed);
				   	    	if (posting_move_mdax){
				   	    		ledgerTransPostingPackList = axpLogic.getLedger4RentBillAndPay(
				  						cehCode,
				  						cehCodePodr,
				  						so.axPartnerCode,
				  						so.axContractCode,
				  						sumTotal,
				  						sumBase,
				  						sumVat,
				  						sumTotalPay,
				  						description,
				  						postingDate,
				  						contractKind_AX,
				  						ax_licNoLic );

				   	    		custTransPostingPackList = axpLogic.getCustTrans4RentBillAndPay(
				  						cehCode,
				  						cehCodePodr,
				  						so.axPartnerCode,
				  						so.axContractCode,
				  						sumTotal,
				  						sumBase,
				  						sumVat,
				  						sumTotalPay,
				  						description,
				  						postingDate,
				  						contractKind_AX,
				  						ax_licNoLic,
				  						axContractGroupCode);
				   	    	}
              }

              else {
            	 V_Prov_Buffer = fpLogic.generateQuery4RentBillOnly(
    						cehCode, cehCodePodr,
    						so.partnerCode,
    						so.finDocCode,
    						sumTotal, sumBase, sumVat,
    						description,
    						postingDate,
    						contractKind,
    						account,
    						isLicensed);

            	 if (posting_move_mdax){
		   	    		ledgerTransPostingPackList = axpLogic.getLedger4RentBillOnly(
	    						cehCode,
	    						cehCodePodr,
	    						so.axPartnerCode,
	    						so.axContractCode,
	    						sumTotal,
	    						sumBase,
	    						sumVat,
	    						description,
	    						postingDate,
	    						contractKind_AX,
	    						ax_licNoLic);

		   	    		custTransPostingPackList = axpLogic.getCustTrans4RentBillOnly(
	    						cehCode,
	    						cehCodePodr,
	    						so.axPartnerCode,
	    						so.axContractCode,
	    						sumTotal,
	    						sumBase,
	    						sumVat,
	    						description,
	    						postingDate,
	    						contractKind_AX,
	    						ax_licNoLic,
	    						axContractGroupCode);

		   	    	}

              }

              FKProvResult provResult = new FKProvResult();

              if (V_Prov_Buffer != "")
              {
                  provResult = fpLogic.createPostings(V_Prov_Buffer);
              }
              else
              {
                  throw new EnergyproSystemException("Не знайдений перелік проводок!");
              }




              String retVouchermDAX = "";
              if (posting_move_mdax){
                 /**  торжественное открытие транзакции в АХ  */
            	_messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);
              	retVouchermDAX = axpLogic.movePostingToAX(ledgerTransPostingPackList , custTransPostingPackList);
              }

	            if (provResult.partId != Integer.MIN_VALUE || !retVouchermDAX.equals("") ) {
	                // сейвим развязку со счетом
	            	// сетим код пачки проводок
	            	ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(enConn, getUserProfile());
	            	ENServicesObject2Prov so2prov = new ENServicesObject2Prov();
	            	so2prov.datePosting = postingDate;
	            	so2prov.servicesObjectRef.code = soPayBillProv.soRef.code;
	            	so2prov.partId = provResult.partId;

                    /** SUPP-7343... 25.09.2013 +++ для услуг добавлена дата проведения (передачи проводок) */

                    so2prov.voucher = retVouchermDAX;

	            	soPayBillProv.so2ProvRef.code = so2provDAO.add(so2prov);
	            	ENSOPayBillProvDAO sopbpDAO = new ENSOPayBillProvDAO(enConn, getUserProfile());
	            	sopbpDAO.add(soPayBillProv);

	            }

	            /**  подтверждение транзакции в АХ  */
	    		///////// !?!?!?!?!?! какого то хрена не удаляются проводки если ругается комит
	                try {
	                	if (posting_move_mdax) {
	      		    	  axLogic.aifttscommit(_messageId);
	      		      }
	    			} catch (Exception e) {
	    				axLogic.aifttsabort(_messageId);
	    				throw new EnergyproSystemException(" \n Помилка при передачі проводок до АХ !!!" + " \n " + e.getMessage());
	    			}


	            return provResult;

	        } catch (DatasourceConnectException e) {
	            throw new EnergyproSystemException("Помилка зв'язку з БД!", e);
	        } catch (PersistenceException e) {
	            throw new EnergyproSystemException(e.getMessage(), e);
	        } finally {
	            closeConnection();
	            try {
	                if (enConn != null && !enConn.isClosed()) {
	                    enConn.close();
	                    enConn = null;
	                }
	            } catch (SQLException e) {
	            }
	        }
	    }


	    public void deleteFromFK(int  soPayBillProvCode) {
	        Connection enConn = null;
	        Connection finConn = null;
	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	            ENSOPayBillProvDAO pbpDAO = new ENSOPayBillProvDAO(enConn, getUserProfile());
	            ENSOPayBillProv pbp = pbpDAO.getObject(soPayBillProvCode);

	            ENServicesObject2ProvDAO so2pDAO = new ENServicesObject2ProvDAO(enConn, getUserProfile());
	            ENServicesObject2Prov so2p = so2pDAO.getObject(pbp.so2ProvRef.code);

	            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
	            AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());

	            fpLogic.deleteProv(so2p.partId, getUserProfile().userName);

	            pbpDAO.remove(pbp.code);
	            so2pDAO.remove(so2p.code);

	            String _messageId = "";
	            String voucher = ""; // для удаления проводок из аксапты
	            voucher = so2p.voucher;
	            if (voucher != null) {
	             if (!voucher.equals("")) {
	            	 /// открываем АХ транзакц
	           	    _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut);

		 	            LedgerTransksActions ltAct = new LedgerTransksActions(enConn ,  getUserProfile() );
		 	            ltAct.deletePostingToAX(voucher);

		 	            CustTransksActions cstAct = new CustTransksActions(enConn ,  getUserProfile() );
		 	            cstAct.deletePostingToAX(voucher);

	             // закрытие транзакции AX
	               	axLogic.aifttscommit(_messageId);
	               	}
	             }



	        } catch (DatasourceConnectException e) {
	            throw new EnergyproSystemException("Помилка зв'язку з БД!", e);
	        } catch (PersistenceException e) {
	            throw new EnergyproSystemException(e.getMessage(), e);
	        } finally {
	            closeConnection();
	            try {
	                if (enConn != null && !enConn.isClosed()) {
	                    enConn.close();
	                    enConn = null;
	                }
	            } catch (SQLException e) {
	            }
	        }
	    }


} // end of EJB Controller for ENSOPayBillProv