package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.valueobject.DFDocAttachment;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.docflow.valueobject.DFDocSignerType;
import com.ksoe.energynet.dataminer.ENAct2DFDocDAO;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActProj2OZ2DateDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZ2ENactDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2DFDoc;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENDocAttachmentType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTechContragentForm;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2DateFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQFKOrderType;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItemShortList;
import com.ksoe.techcard.valueobject.TKAccountingType;

public class ReportPrintingLogic extends LogicModule {

	private static final long serialVersionUID = 1L;

	private static final String ENERGYNET_REPORTS_JAR_PATH = "/com/ksoe/energynet/reports/";
	private static final String DOCFLOW_REPORTS_JAR_PATH = "/com/ksoe/docflow/reports/";

	public ReportPrintingLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	/**
	 * Получение списка отчетов для печати ордера
	 *
	 * @param fkOrder - объект ордера ({@link com.ksoe.rqorder.valueobject.RQFKOrder})
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	public EPReportRequestEx[] getReportsListForRQFKOrder(RQFKOrder fkOrder) {
		if (fkOrder == null || fkOrder.code <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт ордеру!");
		}

		try {
			RQFKOrderItemDAO fkOrderItemDAO = new RQFKOrderItemDAO(userProfile, connection);
			FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);

			List<EPReportRequestEx> resultList = new ArrayList<>();

			EPReportRequestEx request = createBaseRequest();
			String[] argNames = new String[] {"orderCode"};
			String[] args = new String[] {String.valueOf(fkOrder.code)};

			if (fkOrder.kind.code == RQFKOrderKind.PRIHOD_POSTAVKA || fkOrder.kind.code == RQFKOrderKind.PRIHOD_BUFET) {

				if (fkOrderLogic.hasCustomerMaterials(fkOrder.code)) {

					argNames = new String[] {"fkOrderCode", "reportType"};
					args = new String[] {String.valueOf(fkOrder.code), "2"};
					request = createRequest(argNames, args, "201109/ActTransferForServices/Act");

				} else {

					int orderYear = Tools.getYear(fkOrder.dateGen);
					int orderMonth = Tools.getMonth(fkOrder.dateGen) + 1;

					if (fkOrder.kind.code == RQFKOrderKind.PRIHOD_BUFET) {

						//request.reportName = "RepOrder/RQFKOrder/RQFKOrderIn";
						request = createRequest(argNames, args, "RepOrder/RQFKOrder/01082013/RQFKOrderIn");

					} else if (fkOrder.accountingTypeRef.code == TKAccountingType.OS) {

						if ((orderYear == 2013 && orderMonth >= 8) || orderYear > 2013) {
							request = createRequest(argNames, args, "RepOrder/RQFKOrder/01082013/RQFKOrderOSIn");
						} else {
							request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderOSIn");
						}

					} else if (Tools.checkValueInArray(fkOrder.accountingTypeRef.code, 
													   new int[] {TKAccountingType.SEAL,
																  TKAccountingType.IMP, 
																  TKAccountingType.HOLO})) {

						request = createRequest(argNames, args, "RepOrder/RQFKOrder/01082013/RQFKOrderInSeal");

					} else if ((orderYear == 2013 && orderMonth >= 8) || orderYear > 2013) {

						if (fkOrder.accountingTypeRef.code == TKAccountingType.COUNTERS && 
								fkOrderLogic.isRQFKOrderFromRQActCounterExpertise(fkOrder.code)) {

							request = createRequest(argNames, args, "RepOrder/RQFKOrder/actCounterExpertise");

						} else {

							request = createRequest(argNames, args, "RepOrder/RQFKOrder/01082013/RQFKOrderIn");

						}

					} else {

						request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderIn");

					}

				}

				resultList.add(request);

			} // if (fkOrder.kind.code == RQFKOrderKind.PRIHOD_POSTAVKA || fkOrder.kind.code == RQFKOrderKind.PRIHOD_BUFET)

			else if ( Arrays.asList(RQFKOrderKind.RASHOD_OE2REM, RQFKOrderKind.RASHOD_OE2OUT, RQFKOrderKind.RASHOD_TO_STORAGE).contains(fkOrder.kind.code)
				 && fkOrder.accountingTypeRef.code == TKAccountingType.COUNTERS	) {

				if (fkOrderLogic.hasZabalansCounters(fkOrder.code)) {

					request = createRequest(argNames, args, "RepOrder/RQFKOrder/actCounterExpertise");
					resultList.add(request);

				} else {

					String[] ozArgNames = new String[] {"codeoz", "scordercode"};

					RQFKOrderItemFilter fkOrderItemFilter = new RQFKOrderItemFilter();
					fkOrderItemFilter.fkOrderRef.code = fkOrder.code;

					int[] fkOrderItemCodes = fkOrderItemDAO.getFilteredCodeArray(fkOrderItemFilter, 0, -1);
					for (int fkOrderItemCode : fkOrderItemCodes) {
						// для каждого СКОрдера будем печатать свою ОЗ на перемещение
						int[] scOrderCodes = fkOrderLogic.getSCOrderCodesForRQFKOrderItem(fkOrderItemCode);

						for (int scOrderCode : scOrderCodes) {
							String[] ozArgs = new String[] {String.valueOf(fkOrderItemCode), String.valueOf(scOrderCode)};
							//request = createRequest(ozArgNames, ozArgs, "Counters/VN_PER/Counters_vn_per");
							request = createRequest(ozArgNames, ozArgs, "Counters/VN_PER/Counters_vn_perSign");
							
							resultList.add(request);
						}
					}

				}

			} else {
				if  (fkOrder.kind.code == RQFKOrderKind.RASHOD_OE2REM
						&& Arrays.asList(TKAccountingType.SEAL, TKAccountingType.IMP, TKAccountingType.HOLO).contains(fkOrder.accountingTypeRef.code)) {

					request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderSealOutSign");
					resultList.add(request);

				} else if ( (fkOrder.kind.code == RQFKOrderKind.RASHOD_TO_STORAGE && (fkOrder.account == null || fkOrder.account.equals("") ) )
	                      || (Arrays.asList(RQFKOrderKind.RASHOD_OE2REM, RQFKOrderKind.RASHOD_MBP, RQFKOrderKind.RASHOD_BUFET, RQFKOrderKind.OUT_FUEL).contains(fkOrder.kind.code)) ) {

					/*zzz*/request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderOut");
					resultList.add(request);

				} else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_OE2OUT && fkOrder.accountingTypeRef.code != TKAccountingType.OS) {

					request = createRequest(argNames, args, "201109/ActToOrderOut/Act");
					resultList.add(request);

				} else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_GIFT) {

					request = createRequest(argNames, args, "201109/ActToOrderGift/Act");
					resultList.add(request);

				} else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_MEASUREMENT_CHANGE) {

					if (fkOrder.status.code == RQFKOrderStatus.IN_FK) {
						request = createRequest(argNames, args, "201109/ActChangeMeasurement/Act_prov");
					} else {
						request = createRequest(argNames, args, "201109/ActChangeMeasurement/Act");
					}
					resultList.add(request);

	            } else if (Arrays.asList(RQFKOrderKind.RASHOD_LOADEXPL_MBP, RQFKOrderKind.RASHOD_LOADEXPL_MNMA).contains(fkOrder.kind.code)) {

	            	// если МНМА то еще напечатать АКТ
	            	if (fkOrder.kind.code == RQFKOrderKind.RASHOD_LOADEXPL_MNMA) {
	            		request = createRequest(argNames, args, "RepOrder/Load_in_Exploitation/OZ-1");
	            		// Пока новая форма ОЗ-1 не утверждена, будем формировать старую в Excel 
	            		// для ручного подписания (без ЭЦП)
	            		request.signingStatus = DFDocAttachment.NOT_SIGN;
	            		resultList.add(request);
	            	}

	                if (fkOrderLogic.isBrigadeZZ(fkOrder.code)) {
	                	request = createRequest(argNames, args, "RepOrder/Load_in_Exploitation/load_in_exp_MBP_MNMA2");
	                	resultList.add(request);
	                } else {
	                	request = createRequest(argNames, args, "RepOrder/Load_in_Exploitation/load_in_exp_MBP_MNMA");
	                	resultList.add(request);
	                }

	             } else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_MNMA) {

	            	 request = createRequest(argNames, args, "RepOrder/Load_in_Exploitation/OZ-1Sign"); /*zzzsigners*/
	            	 resultList.add(request);

	             } else if ( (fkOrder.kind.code == RQFKOrderKind.RASHOD_OE2REM_MNMA) ||
	            		 	 (fkOrder.kind.code == RQFKOrderKind.RASHOD_TO_STORAGE && fkOrder.account != null && !fkOrder.account.equals("")) ) {

	            	 //request = createRequest(argNames, args, "RepOrder/Rashod_MNMA_Out/OZ-1");
	            	 request = createRequest(argNames, args, "RepOrder/Load_in_Exploitation/OZ-1Sign"); // zzzsigners под одну форму 
	            	 resultList.add(request);

	             } else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_RETURN_PRODUCT) {

	            	 request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderOutReturn");
	            	 resultList.add(request);

	             } else if ( (Arrays.asList(RQFKOrderKind.OS_EXPL, RQFKOrderKind.OS_MOVEMENT).contains(fkOrder.kind.code) ||
	            		 	 (fkOrder.kind.code == RQFKOrderKind.RASHOD_OE2OUT && fkOrder.accountingTypeRef.code == TKAccountingType.OS)) ) {

	            	 if (fkOrder.typeRef != null && fkOrder.typeRef.code == RQFKOrderType.RQFKORDER_TYPE_ZVT) {
            			 request = createRequest(argNames, args, "RepOrder/RQFKOrder/RQFKOrderOSOut/RQFKOrderOSOut");
            			 resultList.add(request);
            			 return resultList.toArray(new EPReportRequestEx[0]);
	            	 }

	            	 if (fkOrder.kind.code == RQFKOrderKind.OS_EXPL) {
	            		 if (fkOrder.status.code == RQFKOrderStatus.GOOD) {
	            			 throw new SystemException("\n\nСпочатку переведіть ордер у статус \"Складений\"!");
	            		 }
	            		 fkOrderLogic.checkBuhDateForRQFKOrder(fkOrder.code);
	            	 }

	                 // Для ввода в эксплуатацию и внутр. перемещения ОС печатается отдельный документ для каждой строки (каждого ОС)
	                 RQFKOrderItemFilter fkOrderItemFilter = new RQFKOrderItemFilter();
	                 fkOrderItemFilter.fkOrderRef.code = fkOrder.code;

	                 RQFKOrderItemShortList fkOrderItemList = fkOrderItemDAO.getScrollableFilteredList(fkOrderItemFilter, 0, -1);

					 for (int i = 0; i < fkOrderItemList.totalCount; i++) {
		                 String ozReportName = "RepOrder/RQFKOrder/RQFKOrderOSOZ1Sign";

						 /////////////////////////////////////////////////////////////////////
						 if (fkOrder.kind.code == RQFKOrderKind.OS_EXPL) {
							 String debetAccount = fkOrderLogic.getOSDataAccountForRQFKOrderItem(fkOrderItemList.get(i).code);
		                     // Для 12-х счетов - другая форма (это НЕМАТЕРИАЛЬНЫЕ АКТИВЫ)
		                     // Если ОС оприходовано на счет 1540, то это тоже НЕМАТЕРИАЛЬНЫЕ АКТИВЫ
		                     if ((debetAccount != null && debetAccount.length() >= 2 && debetAccount.substring(0, 2).equals("12"))
		                    		 || (fkOrderItemList.get(i).nomenclatureBalSch != null && fkOrderItemList.get(i).nomenclatureBalSch.equals("1540"))) {
		                    	 ozReportName = "RepOrder/RQFKOrder/RQFKOrderOSNA1";
		                     }
						 }
						 /////////////////////////////////////////////////////////////////////

						 String[] ozArgNames = new String[] {"orderCode", "orderItemCode"};
						 String[] ozArgs = new String[] {String.valueOf(fkOrder.code), String.valueOf(fkOrderItemList.get(i).code)};

						 request = createRequest(ozArgNames, ozArgs, ozReportName);
						 resultList.add(request);
					 }

	             } else if (fkOrder.kind.code == RQFKOrderKind.RASHOD_WRITEOFFCOUNTERS &&
	            		 fkOrderLogic.isRQFKOrderFromRQActCounterExpertise(fkOrder.code)) {

	            	 request = createRequest(argNames, args, "RepOrder/RQFKOrder/actCounterExpertise");
	            	 resultList.add(request);

	             } else {

	            	 throw new SystemException("\n\nНевідомий тип ордеру!");

	             }

			}

			// Распечатка актов приема-передачи палет
			if (fkOrder.isPalletized == ENConsts.YES && fkOrderLogic.isRQFKOrderForPallet(fkOrder)) {
				request = createRequest(argNames, args, "RepOrder/RepPallet/printPalletActs", "pdf");
				// этот репорт не нуждается в подписании
				request.signingStatus = DFDocAttachment.NOT_SIGN;
				resultList.add(request);

				request = createRequest(argNames, args, "RepOrder/RepPallet/packingList");
				// этот репорт не нуждается в подписании
				request.signingStatus = DFDocAttachment.NOT_SIGN;
				resultList.add(request);
			}

			return resultList.toArray(new EPReportRequestEx[0]);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * Получение списка отчетов для печати акта
	 *
	 * @param act - объект акта ({@link com.ksoe.energynet.valueobject.ENAct})
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	// TODO: Пока для теста, доработать!!!
	public EPReportRequestEx[] getReportsListForENAct(ENAct act) {
		if (act == null || act.code <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт акта!");
		}

		List<EPReportRequestEx> resultList = new ArrayList<>();
		try {
			ENAct2ENPlanWorkDAO a2pDAO = new ENAct2ENPlanWorkDAO(userProfile, connection);
			ENPlanWorkDAO pDAO = new ENPlanWorkDAO(userProfile, connection);
			ENAct2ENPlanWorkFilter a2pFil = new ENAct2ENPlanWorkFilter();
			a2pFil.actRef.code = act.code;
			int[] a2pArr = a2pDAO.getFilteredCodeArray(a2pFil, 0, 1);
			if (a2pArr.length == 0) {
				throw new SystemException("\n\nВ акті з кодом " + act.code + " немає жодного наряд-завдання!\n" +
						"Додайте в нього наряд-завдання або видаліть цей акт!");
			}
			ENAct2ENPlanWork a2pObj = a2pDAO.getObject(a2pArr[0]); 
			ENPlanWork planObj = pDAO.getObject(a2pObj.plan.code);
			ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(userProfile, connection);
			ENAct2DFDocDAO a2dfDAO = new ENAct2DFDocDAO(userProfile, connection);
			ActLogic actLogic = new ActLogic(connection, userProfile);

			Connection docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			
			EPReportRequestEx request = createBaseRequest();
			String[] argNames = new String[] {"PcodeAkt", "actType", "dfDocSignerTypes"};
			String[] args = new String[3];
			args[0] = String.valueOf(act.code);

			if (act.actTypeRef.code == ENPlanWorkState.CAPITAL_REPAIR || act.actTypeRef.code == ENPlanWorkState.CURRENT_REPAIR) {
				args[1] = String.valueOf(2);
			} else if (act.actTypeRef.code == ENPlanWorkState.RECONSTRUCTION_MODERNIZATION) {
				if (planObj.typeRef.code == ENPlanWorkType.PRIEDNANNY) {
					args[1] = String.valueOf(1);
				} else {
					args[1] = String.valueOf(4);
				}
			} else if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION ||
					   act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {
				args[1] = String.valueOf(13);
				request = createRequest(argNames, args, "201109/AVWCommon2/ActMaterials/ActBufet/Realization/Act21");
				resultList.add(request);
				return resultList.toArray(new EPReportRequestEx[0]);
			} else if (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT) {
				args[1] = String.valueOf(7);

				// NET-4576 Для договоров на подключение/отключение по заявкам поставщиков
				if (act.element.typeRef.code == ENElementType.TY_BYT || act.element.typeRef.code == ENElementType.TY_PROM) {
					request = createRequest(argNames, args, "201109/ActServicesObject/ActSigning/Act21_enrecordpoint");
					resultList.add(request);
					return resultList.toArray(new EPReportRequestEx[0]);
				}

				int[] dfDocSignerTypes = {DFDocSignerType.EXECUTOR};
				args[2] = Tools.intArrayToStr(dfDocSignerTypes, ",");
				request = createRequest(argNames, args, "201109/AVWCommon2/ActSigning/ActServices");
				request.dfDocSignerTypes = dfDocSignerTypes;
				resultList.add(request);

				if (act.dateAct.compareTo(DFConsts.SCUSAGEINPUT_SIGNING_START) >= 0) {
					// Если есть единичная ОЗ-шка, то добавляем еще репорты для этой ОЗшки
					int[] scUsageInputCodes = actLogic.getSCUsageInputCodesForENAct(act.code);
					if (scUsageInputCodes.length > 0) {
						SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(userProfile, connection);
						for (int scUsageInputCode : scUsageInputCodes) {
							SCUsageInput scUsageInput = scUsageInputDao.getObjectNOSEGR(scUsageInputCode);
							EPReportRequestEx[] scUsageInputReports = getReportsListForSCUsageInput(scUsageInput, act.code);
							resultList.addAll(Arrays.asList(scUsageInputReports));
						}
					}
				}

				return resultList.toArray(new EPReportRequestEx[0]);
			} else {
				args[1] = String.valueOf(3);
			}

			int[] dfDocSignerTypes = {DFDocSignerType.EXECUTOR};
			args[2] = Tools.intArrayToStr(dfDocSignerTypes, ",");
			request = createRequest(argNames, args, "201109/AVWCommon2/ActSigning/Act21", "pdf");
			request.dfDocSignerTypes = dfDocSignerTypes;
			resultList.add(request);

            //АКТ ДЕМОНТАЖ МАТЕРИАЛОВ

			ENEstimateItemFilter eiFil = new ENEstimateItemFilter();
			eiFil.kindRef.code = ENEstimateItemKind.UNMOUNT;
			eiFil.conditionSQL =
		      " ENESTIMATEITEM.CODE in (select e.code from enestimateitem e, " +
		      "     enplanwork p, enact2enplanwork a2p " +
		      "   where e.planrefcode = p.code " +
		      "   and p.code = a2p.plancode " +
		      "   and a2p.actrefcode = " + String.valueOf(act.code) +
		      "   and e.kindrefcode = " + ENEstimateItemKind.UNMOUNT +
		      "   and e.accountingtyperefcode in (" + TKAccountingType.TMC + "," + TKAccountingType.COUNTERS + ")" +
		      "   and e.countfact <> 0)" ;

			int[] estimateArr = eiDAO.getFilteredCodeArray(eiFil, 0, -1);
		   	if (estimateArr.length > 0) {
			     //коммиссию вытянем из подписантов из докфлов
			     String singers = "";
			     ENAct2DFDocFilter a2dfFil = new ENAct2DFDocFilter();
			     a2dfFil.actRef.code = act.code;
			     a2dfFil.orderBySQL = " ENACT2DFDOC.CODE desc ";
			     int[] a2dfArr = a2dfDAO.getFilteredCodeArray(a2dfFil, 0, -1);
			     if(a2dfArr.length > 0) {
			    	 ENAct2DFDoc a2dfObj = a2dfDAO.getObject(a2dfArr[0]);
					 DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, userProfile, act);
					 DFDocSigner[] signersArr = docSigningLogic.getDFDocSigners(a2dfObj.dfDocCode);

					 for (int i = 0; i < signersArr.length; i++) {
						singers = singers.length() > 0 ? singers + "; " + signersArr[i].postInfo + " " +
								  signersArr[i].fio : signersArr[i].postInfo + " " + signersArr[i].fio;
					 }
			     }

			     String[] prihdemArgNames = new String[] {"PcodeAkt","Psingers"};
				 String[] prihdemArgs = new String[] { String.valueOf(act.code), singers };

				 request = createRequest(prihdemArgNames, prihdemArgs, "Act/PrihodDemontageSign", "pdf");
				 resultList.add(request);
			}

			if (actLogic.checkZKUMountingByAct(act)) {
				// формируем ОЗ-1
				if (act.dateAct.compareTo(DFConsts.SCUSAGEINPUT_SIGNING_START) >= 0) {
					dfDocSignerTypes = new int[] {DFDocSignerType.SENT, DFDocSignerType.RECEIVED};

					argNames = new String[] {"codeoz", "reportType", "dfDocSignerTypes"};
					args = new String[] {String.valueOf(act.code), "2", Tools.intArrayToStr(dfDocSignerTypes, ",")};

					request = createRequest(argNames, args, "Counters/Signing/ZKU/Counters_vvod_expl", "pdf");
					request.fileDescription = "ОЗ-1 Ліч № " + act.numberGen + " (введення в експлуатацію ЗКУ)";
					request.dfDocSignerTypes = dfDocSignerTypes;
					resultList.add(request);
				} else {
					String[] zkuArgNames = {"codeoz", "reportType"};
					String[] zkuArgs = {String.valueOf(act.code), "2"};

					request = createRequest(zkuArgNames, zkuArgs, "Counters/ZKU/Counters_vvod_expl");
					request.fileDescription = "ОЗ-1 № " + act.numberGen + " (введення в експлуатацію ЗКУ)";
					request.signingStatus = DFDocAttachment.NOT_SIGN;
					resultList.add(request);
				}
			}

			return resultList.toArray(new EPReportRequestEx[0]);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e1) {
			 throw new SystemException(e1.getMessage(), e1);
		}
	}

	/**
	 * Получение списка отчетов для печати "Повідомлення про надання послуги з приєднання"
	 * (доходного акта по договору на присоединение)
	 *
	 * @param act - объект акта ({@link com.ksoe.energynet.valueobject.ENActIncomeTechConditions})
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	public EPReportRequestEx[] getReportsListForENActIncomeTechConditions(ENActIncomeTechConditions act) {
		if (act == null || act.code <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт прибуткового акта!");
		}

		List<EPReportRequestEx> resultList = new ArrayList<>();

		String[] argNames = {"codeAct"};
		String[] args = {String.valueOf(act.code)};

		String reportName;

		ActIncomeLogic actIncomeLogic = new ActIncomeLogic(connection, userProfile);
		boolean isActIncomeTechConditionsReadyForSigning = actIncomeLogic.isActIncomeTechConditionsReadyForSigning(act.code);
		
		if (isActIncomeTechConditionsReadyForSigning) {
			argNames = new String[] {"actCode"};
			reportName = "TechConditions/notificationAct/notificationAct";
		} else {
			try {
				ENTechConditionsServicesDAO techCondServicesDAO = new ENTechConditionsServicesDAO(userProfile, connection);
				ENTechConditionsServices techCondServices = techCondServicesDAO.getObject(act.techCondServicesRef.code);

				if (techCondServices.contragentForm.code == ENTechContragentForm.SOLIDARY) {
					reportName = "TechConditions/ActPriPerSolidary";
				} else {
					reportName = "TechConditions/ActPriPer";
				}
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}

		EPReportRequestEx request = createRequest(argNames, args, reportName, "pdf");
		request.attachmentType = ENDocAttachmentType.ENACTINCOMETECHCONDITIONS;

		resultList.add(request);

		return resultList.toArray(new EPReportRequestEx[0]);
	}

	/**
	 * Получение списка отчетов для печати документа на ввод счетчиков в эксплуатацию
	 *
	 * @param scUsageInput - объект документа на ввод счетчиков в эксплуатацию ({@link com.ksoe.energynet.valueobject.SCUsageInput})
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	public EPReportRequestEx[] getReportsListForSCUsageInput(SCUsageInput scUsageInput) {
		return getReportsListForSCUsageInput(scUsageInput, Integer.MIN_VALUE);
	}

	/**
	 * Получение списка отчетов для печати документа на ввод счетчиков в эксплуатацию
	 *
	 * @param scUsageInput - объект документа на ввод счетчиков в эксплуатацию ({@link com.ksoe.energynet.valueobject.SCUsageInput})
	 * @param actCode - код акта при формировании единичной ОЗ-шки со стороны акта
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	public EPReportRequestEx[] getReportsListForSCUsageInput(SCUsageInput scUsageInput, int actCode) {
		if (scUsageInput == null || scUsageInput.code <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт документа на введення лічильників в експлуатацію!");
		}

		List<EPReportRequestEx> resultList = new ArrayList<>();

		try {
			SCUsageInputItemDAO scUsageInputItemDAO = new SCUsageInputItemDAO(userProfile, connection);
			SCUsageInputItemFilter scUsageInputItemFilter = new SCUsageInputItemFilter();
			scUsageInputItemFilter.usageInputRef.code = scUsageInput.code;
			int[] scUsageInputItemCodes = scUsageInputItemDAO.getFilteredCodeArray(scUsageInputItemFilter, 0, -1);
			if (scUsageInputItemCodes.length == 0) {
				throw new SystemException("\n\nУ документі на введення лічильників в експлуатацію з кодом " + scUsageInput.code + " немає жодної накладної!");
			}

			SCUsageInputItemOZDAO scUsageInputItemOZDao = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(connection, userProfile);

			EPReportRequestEx request;

			String strActCode = (actCode > 0 ? String.valueOf(actCode) : "-1");

			for (int scUsageInputItemCode : scUsageInputItemCodes) {
				SCUsageInputItem scUsageInputItem = scUsageInputItemDAO.getObject(scUsageInputItemCode);

				// if (scUsageInput.iszku == 1) return;
				SCUsageInputItemOZFilter scUsageInputItemOZFilter = new SCUsageInputItemOZFilter();
				scUsageInputItemOZFilter.usageInputItemRef.code = scUsageInputItemCode;
				int[] scUsageInputItemOZCodes = scUsageInputItemOZDao.getFilteredCodeArray(scUsageInputItemOZFilter, 0, -1);

				for (int scUsageInputItemOZCode : scUsageInputItemOZCodes) {
					SCUsageInputItemOZ oz = scUsageInputItemOZDao.getObject(scUsageInputItemOZCode);

					String[] argNames = {"codeoz"};
					String[] args = {String.valueOf(scUsageInputItemOZCode)};

					switch (scUsageInputItem.kindRef.code) {
						// ПРИ ВВОДЕ В ЭКСПЛ ФОРМИРУЕМ ОЗ-1 РЕЕСТР И АКТ
						case SCUsageInputItemKind.UsageInput:
							int[] dfDocSignerTypes;
							argNames = new String[] {"codeoz", "dfDocSignerTypes", "actCode"};

							// SUPP-67738 если нет счета, значит, это счетчик абонента, и не надо печатать реестры
							if (oz.account != null && oz.account.trim().length() > 0) {
								// формируем ОЗ-1
								dfDocSignerTypes = new int[] {DFDocSignerType.SENT, DFDocSignerType.RECEIVED};
								args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
								request = createRequest(argNames, args, "Counters/Signing/VVOD_EXPL/Counters_vvod_expl", "pdf");
								request.fileDescription = "ОЗ-1 Ліч № " + oz.numberDoc + " (введення в експлуатацію)";
								request.dfDocSignerTypes = dfDocSignerTypes;
								resultList.add(request);

								// формируем реестр к ОЗ-1
								dfDocSignerTypes = new int[] {DFDocSignerType.EXECUTOR};
								args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
								request = createRequest(argNames, args, "Counters/Signing/VVOD_EXPL/Counters_vvod_expl_reestr", "pdf");
								request.fileDescription = "Реєстр лічильників до ОЗ-1 Ліч № " + oz.numberDoc;
								request.dfDocSignerTypes = dfDocSignerTypes;
								resultList.add(request);
							}

							// формируем АКТ
							dfDocSignerTypes = new int[] {DFDocSignerType.EXECUTOR};
							args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
							String reportName;
							if (scUsageInput.iszku == 1) {
								reportName = "Counters/Signing/ActZKU/NormalAct/Act21";
							} else {
								reportName = "Counters/Signing/ActCounters/Act21";
							}
							request = createRequest(argNames, args, reportName, "pdf");
							request.fileDescription = "Акт монтажу (улаштування, заміни) лічильників № " + oz.numberDoc;
							request.dfDocSignerTypes = dfDocSignerTypes;
							resultList.add(request);
							break;

						// ПРИ ВЫВОДЕ ИЗ ЭКСПЛ ФОРМИРУЕМ ОЗ-1 по выводу
						case SCUsageInputItemKind.UsageOut:
							dfDocSignerTypes = new int[] {DFDocSignerType.SENT, DFDocSignerType.RECEIVED};
							argNames = new String[] {"codeoz", "dfDocSignerTypes", "actCode"};
							args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
							request = createRequest(argNames, args, "Counters/Signing/VIVOD_EXPL/Counters_vivod_expl", "pdf");
							request.fileDescription = "ОЗ-1 Ліч № " + oz.numberDoc + " (виведення з експлуатації)";
							request.dfDocSignerTypes = dfDocSignerTypes;
							resultList.add(request);
							break;

						// при приеме от абонентов формируем факт безоп
						case SCUsageInputItemKind.InputUsing:
							if (scUsageInputLogic.isForExpertise(scUsageInputItemOZCode)) {
								argNames = new String[] {"codeoz"};
								args = new String[] {String.valueOf(scUsageInputItemOZCode)};
								//request = createRequest(argNames, args, "Counters/Signing/actCounterExpertise", "pdf");
								request = createRequest(argNames, args, "RepOrder/RQFKOrder/actCounterExpertise");
								request.fileDescription = "Акт приймання - передачі лічильників № " + oz.numberDoc;
								request.signingStatus = DFDocAttachment.NOT_SIGN;
								resultList.add(request);
							} else {
								// Акт безоплатної передачі лічильників
								argNames = new String[] {"codeoz"};
								args = new String[] {String.valueOf(scUsageInputItemOZCode)};
								request = createRequest(argNames, args, "Counters/Signing/actCounterFull");
								request.fileDescription = "Акт безоплатної передачі лічильників № " + oz.numberDoc;
								request.signingStatus = DFDocAttachment.NOT_SIGN;
								resultList.add(request);

								// ПРИХОДНЫЙ ОРДЕР
								dfDocSignerTypes = new int[] {DFDocSignerType.SENT, DFDocSignerType.RECEIVED};
								argNames = new String[] {"codeoz", "dfDocSignerTypes", "actCode"};
								args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
								request = createRequest(argNames, args, "Counters/Signing/deliveryOrder", "pdf");
								request.fileDescription = "Прибутковий ордер № " + oz.numberDoc;
								request.dfDocSignerTypes = dfDocSignerTypes;
								resultList.add(request);
							}
							break;

						case SCUsageInputItemKind.UsageInputZKU:
							argNames = new String[] {"codeoz", "dfDocSignerTypes", "actCode"};

							// формируем ОЗ-1
							dfDocSignerTypes = new int[] {DFDocSignerType.SENT, DFDocSignerType.RECEIVED};
							args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
							request = createRequest(argNames, args, "Counters/Signing/ZKU/Counters_vvod_expl", "pdf");
							request.fileDescription = "ОЗ-1 Ліч № " + oz.numberDoc + " (введення в експлуатацію ЗКУ)";
							request.dfDocSignerTypes = dfDocSignerTypes;
							resultList.add(request);

							// формируем АКТ
							dfDocSignerTypes = new int[] {DFDocSignerType.EXECUTOR};
							args = new String[] {String.valueOf(scUsageInputItemOZCode), Tools.intArrayToStr(dfDocSignerTypes, ","), strActCode};
							request = createRequest(argNames, args, "Counters/Signing/ActZKU/Act21", "pdf");
							request.fileDescription = "Акт монтажу ЗКО № " + oz.numberDoc;
							request.dfDocSignerTypes = dfDocSignerTypes;
							resultList.add(request);
							break;
					}
				}

			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return resultList.toArray(new EPReportRequestEx[0]);
	}

	/**
	 * Получение списка отчетов для печати акта ОЗ-2
	 *
	 * @param actOz - объект акта ОЗ-2 ({@link com.ksoe.energynet.valueobject.ENReconstrModernOZ})
	 *
	 * @return массив объектов с параметрами для вызова отчетов 
	 */
	public EPReportRequestEx[] getReportsListForENReconstrModernOZ(ENReconstrModernOZ actOz) {
		if (actOz == null || actOz.code <= 0) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт акта ОЗ!");
		}

		try {
			ENReconstrModernOZ2ENactDAO reconstrModernOz2enActDao = new ENReconstrModernOZ2ENactDAO(connection, userProfile);
			ENReconstrModernOZ2ENactFilter reconstrModernOz2enActFilter = new ENReconstrModernOZ2ENactFilter();
			reconstrModernOz2enActFilter.ENReconstrModernOZRef.code = actOz.code;
			ENReconstrModernOZ2ENactShortList reconstrModernOz2enActList =
					reconstrModernOz2enActDao.getScrollableFilteredListForRM(reconstrModernOz2enActFilter, null, null, 0, -1);

			boolean isPrint = false;
			for (int i = 0; i < reconstrModernOz2enActList.totalCount; i++) {
				if (reconstrModernOz2enActList.get(i).isCalculationDate == 1) {
					isPrint = true;
					break;
				}
			}

			ENActProj2OZ2DateDAO actProj2Oz2DateDao = new ENActProj2OZ2DateDAO(connection, userProfile);
			ENActProj2OZ2DateFilter actProj2Oz2DateFilter = new ENActProj2OZ2DateFilter();
			actProj2Oz2DateFilter.conditionSQL =
					" enactproj2oz2date.code in " +
					" (select enactproj2oz2date.code " +
					"    from enactproj2oz2date, enactproj2oz2 " +
					"   where enactproj2oz2date.enactprojrefcode = enactproj2oz2.code " +
					"     and enactproj2oz2.enreconstrmodernozrfcd = " + actOz.code + ")";
			int[] actProj2Oz2DateCodes = actProj2Oz2DateDao.getFilteredCodeArray(actProj2Oz2DateFilter, 0, -1);

			if (! (isPrint || actProj2Oz2DateCodes.length > 0)) {
				throw new SystemException("\n\nПомилка при формуванні ОЗ-2!\n" +
						"По всім актам, які включено до ОЗ-2, відсутня ознака \"Урахування дат по наряд завданням\"!");
			}

			List<EPReportRequestEx> resultList = new ArrayList<>();

			String[] argNames = {"ozCode"};
			String[] args = {String.valueOf(actOz.code)};
			EPReportRequestEx request = createRequest(argNames, args, "OS_T/Signing/OZ-2", "pdf");

			resultList.add(request);

			return resultList.toArray(new EPReportRequestEx[0]);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public EPReportRequestEx createRequest(String[] argNames, String[] args, String reportName) {
		return createRequest(argNames, args, reportName, false);
	}

	public EPReportRequestEx createRequest(String[] argNames, String[] args, 
			String reportName, String reportType) {
		return createRequest(argNames, args, reportName, false, reportType);
	}

	public EPReportRequestEx createRequest(String[] argNames, String[] args,
			String reportName, boolean isForDocFlow) {
		return createRequest(argNames, args, reportName, isForDocFlow, "xls");
	}

	public EPReportRequestEx createRequest(String[] argNames, String[] args,
			String reportName, boolean isForDocFlow, String reportType) {
		EPReportRequestEx request = createBaseRequest(isForDocFlow, reportType);
		request.argNames = argNames;
		request.args = args;
		request.reportName = reportName;
		request.funcName = getReportFuncName(reportName, isForDocFlow);
		request.fileName = getFileName(reportName);
		return request;
	}

	private String getFileName(String reportName) {
		int slashIndex = reportName.lastIndexOf("/");
		if (slashIndex < 0) {
			throw new IllegalArgumentException("\n\nНекоректний формат вхідної строки (" + reportName + ") !");
		}

		return reportName.substring(slashIndex + 1);
	}

	private String getReportFuncName(String reportName, boolean isForDocFlow) {
		return (isForDocFlow ? DOCFLOW_REPORTS_JAR_PATH : ENERGYNET_REPORTS_JAR_PATH) + reportName + ".jasper";
	}

	private EPReportRequestEx createBaseRequest() {
		return createBaseRequest(false);
	}

	private EPReportRequestEx createBaseRequest(boolean isForDocFlow) {
		return createBaseRequest(isForDocFlow, "xls");
	}

	private EPReportRequestEx createBaseRequest(boolean isForDocFlow, String reportType) {
		EPReportRequestEx request = new EPReportRequestEx();
		request.reportType = reportType;
		request.isForDocFlow = isForDocFlow;
		request.signingStatus = DFDocAttachment.MUST_BE_SIGNED;
		return request;
	}

}
