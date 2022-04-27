
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENActIncomeTechConditions;
  *
  */



import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.dataminer.ENActInTechCond2ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomeTechConditionsDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2TechCondtnsServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.ejb.generated.ENActIncomeTechConditionsControllerEJBGen;
import com.ksoe.energynet.logic.ActIncomeLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.filter.ENActInTechCond2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENActInTechCond2ENActShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderFilter;

public class ENActIncomeTechConditionsControllerEJB extends ENActIncomeTechConditionsControllerEJBGen
 {

	public ENActIncomeTechConditionsControllerEJB() {}

  	/* ENActIncomeTechConditions. Добавить */
  	@Override
  	public int add(ENActIncomeTechConditions object) {
  		return add(object, null);
  	}

	public int add(ENActIncomeTechConditions object, DFDocSigner[] dfDocSigners) {
        Connection enConn = null;
        Connection docFlowConnection = null;

        try {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(getUserProfile(), enConn);
            ENTechConditionsServices tcObj = tcServicesDAO.getObject(object.techCondServicesRef.code);


            /** NET-4237... 12.07.2013 +++ новая методика.... порядковый номер договора на услуги... */
            ENServicesObject2TechCondtnsServicesDAO s2tDao= new ENServicesObject2TechCondtnsServicesDAO(getUserProfile(), enConn);
            ENServicesObject2TechCondtnsServicesFilter s2tFilter = new ENServicesObject2TechCondtnsServicesFilter();
            s2tFilter.techCondServRef.code = object.techCondServicesRef.code;

            int s2tArr[] = s2tDao.getFilteredCodeArray(s2tFilter, 0, -1);
            if (s2tArr.length > 0) {
                ENServicesObject2TechCondtnsServices s2t = s2tDao.getObject(s2tArr[0]);

                ENServicesObjectDAO soDao = new ENServicesObjectDAO(getUserProfile(), enConn);
                ENServicesObject sObj = soDao.getObject(s2t.servicesObjectRef.code);

                if (sObj.contractNumberServices.equals(object.numbergen) != true) {
                    throw new EnergyproSystemException("\n"
                            + "\n Номер акту повинен дорівнювати порядковому номеру договору, тобто "
                            + sObj.contractNumberServices);
                }

            } else {

                /*NET-2677 Номер акта должен равняться порядковому номеру договора в EnergyNet*/
                if(tcObj.contractNumber.equals(object.numbergen) != true)
                    {throw new EnergyproSystemException("\n" +
                            "\n Номер акту повинен дорівнювати порядковому номеру договору, тобто " + tcObj.contractNumber);}
            }

            /* один акт в периоде (договор, период)... */
            ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());
            int isInAct = actIncomeLogic.checkActIncomeTech(object.techCondServicesRef.code, object.actDateStart, object.actDateEnd, false);
            if (isInAct == 0) {
                System.out.println("actDateStart = "
                        + new SimpleDateFormat("dd.MM.yyyy").format(object.actDateStart).toString());
                System.out.println("actDateEnd = "
                        + new SimpleDateFormat("dd.MM.yyyy").format(object.actDateEnd).toString());
                throw new EnergyproSystemException(
                        "За вказаний період за цим договором вже складено прибутковий акт ...");
            }

            Date dd = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dd);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.add(Calendar.MONTH, 1);
            Date maxDate = calendar.getTime();

            if (object.dategen.after(maxDate)) {
                throw new EnergyproSystemException(
                        "Дата акту не повинна перевищувати "
                                + new SimpleDateFormat("dd.MM.yyyy").format(
                                        maxDate).toString(), getUserProfile());
            }

            object.setDomain_info(null);
            object.statusRef.code = ENActIncomeStatus.GOOD;

            ENActIncomeTechConditionsDAO objectDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
            object.code = objectDAO.add(object);


            //SUPP-3751. Если объект - стоительная площадка, базовая станция или малая
            //архитектурная форма сумма расходных актов не считается - их нет
            if ((tcObj.buildersArea != 1)
            && (tcObj.baseStation != 1 || tcObj.connectionKindRef.code == ENConnectionKind.NO_STANDART)
            && (tcObj.smallArchFrm != 1) || tcObj.connectionKindRef.code == ENConnectionKind.NO_STANDART)
            {
                int validateActIncome = validateActIncome(object, tcObj);

                if (validateActIncome == ENConsts.NO) {

                	AuthLogic authLogic = new AuthLogic(enConn, getUserProfile());
                	// http://jira:8080/browse/SUPP-102987?focusedCommentId=155250&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-155250
                	// Если у юзера есть права на создание доходного акта при отсутствии расходных, то не ругаемся и создаем акт с нулевой суммой
                	if (! authLogic.checkPermissionSilent("ksoe/energynet/ENActIncomeTechConditionsController", "createActIncomeWithoutActs")) {
	                    throw new EnergyproSystemException(
	                            "За вказаний період не знайдено видаткових актів зі статусом \" на підписанні \" або \" проведений в ФК \"...");
                	}

                }

                /** общая суммы по расходным актам */
                /** 25.07.2013 +++ для присоединений - расчетная стоимость */
                double totalSum = 0;
                BigDecimal totalVAT = new BigDecimal(0);
                BigDecimal totalSumWithVAT = new BigDecimal(0);

                // Рассчитываем сумму только в том случае, если есть расходные акты, иначе - 0
                if (validateActIncome == ENConsts.YES) {
	                if (tcObj.connectionKindRef.code == ENConnectionKind.NO_STANDART
	                        || tcObj.connectionKindRef.code == ENConnectionKind.STANDART) {

	                    totalSumWithVAT = tcObj.tySummaGen;
	                    totalVAT = tcObj.tySummaVat;

	                } else {
	                    ENActInTechCond2ENActDAO at2aDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
	                    ENActInTechCond2ENActFilter at2aFilter = new ENActInTechCond2ENActFilter();
	                    at2aFilter.actIncomeRef.code = object.code;
	                    ENActInTechCond2ENActShortList at2aList = at2aDAO.getScrollableFilteredList(at2aFilter, 0, -1);
	
	                    if (at2aList.totalCount > 0) {
	                        for (int i = 0; i < at2aList.totalCount; i++) {
	                            totalSum += at2aList.get(i).summaGen.doubleValue();
	                        }
	
	                        /**НДС 20% NET-4284*/   /**USE_NDS??? - непонятно к чему привязываться для определения какой ндс брать ,
	                        толи к дате приходного акта по присоединению, или отталкиваться от того когда был сделан  расчет стоимости присоединения */
	                        totalVAT = new BigDecimal(totalSum).setScale(2,BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(0.2)).setScale(2, BigDecimal.ROUND_HALF_UP);
	                        totalSumWithVAT = new BigDecimal(totalSum).setScale(2,BigDecimal.ROUND_HALF_UP).add(totalVAT).setScale(2, BigDecimal.ROUND_HALF_UP);
	                    }
	                }
                }

                ENActIncomeTechConditions actInTech = objectDAO.getObject(object.code);
                actInTech.summaGen = totalSumWithVAT;
                actInTech.summaVat = totalVAT;
                objectDAO.save(actInTech);
            }

	    	if (dfDocSigners != null && dfDocSigners.length > 0) {
	    		boolean isActIncomeTechConditionsReadyForSigning = actIncomeLogic.isActIncomeTechConditionsReadyForSigning(object.code);
	    		if (isActIncomeTechConditionsReadyForSigning) {
		    		docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
					DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), object);
					docSigningLogic.addDocWithSigners(object, dfDocSigners);
	    		}
	    	}

            return object.code;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENActIncomeTechConditions%} object.", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
        }
    }

    /* ENActIncomeTechConditions. Удалить + связка с расходными актами */
    @Override
	public void remove(int code) {
        Connection enConn = null;
        int i = 0;


        try {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


            ENActIncomeTechConditionsDAO objectDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
            ENActIncomeTechConditions actInTech = objectDAO.getObject(code);
            if (actInTech.statusRef.code != ENActStatus.GOOD) {
                throw new EnergyproSystemException("Видаляти акт дозволено тільки зі статусом \"Чорновий\"  !!! ...");
            }



            // вынесем связку ... если есть..
            ENActInTechCond2ENActDAO at2aDAO = new ENActInTechCond2ENActDAO(getUserProfile(), enConn);
            ENActInTechCond2ENActFilter at2aFilter = new ENActInTechCond2ENActFilter();
            at2aFilter.actIncomeRef.code = actInTech.code;
            ENActInTechCond2ENActShortList at2aList = at2aDAO.getScrollableFilteredList(at2aFilter, 0, -1);

            if (at2aList.totalCount != 0) {
                for (i = 0; i < at2aList.totalCount; i++) {
                    at2aDAO.remove(at2aList.get(i).code);
                }
            }

    		// NET-4596 Отменяем связанный с актом документ в документообороте
            ActIncomeLogic actIncomeLogic = new ActIncomeLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
            		getUserProfile());
            actIncomeLogic.cancelDFDocForENActIncomeTech(code);
            actIncomeLogic.removeENActIncomeTech2DFDoc(code, Integer.MIN_VALUE, true);

            objectDAO.remove(code);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't connect to DataSource", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    /* перевод доходного акта в статус на подписании */
    public void signaturedTech(int actCode) {
        try {
            ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            logic.siganturedTech(actCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't signaturedTech ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    /*Перевод доходного акта в статус Черновой из подписанного*/
    public void unSignaturedTech(int actCode) {
        try {
            ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            logic.unSiganturedTech(actCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't unSignaturedTech ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* проведение доходного акта в ФинКол */
    public void closeTech(int actCode) {
        try {
            ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            logic.closeTech(actCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't closeTech ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    /* отмена проведения доходного акта в ФинКол */
    public void unCloseTech(int actCode) {
        try {
            ActIncomeLogic logic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            logic.unCloseTech(actCode);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't unCloseTech ", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /*ENActIncomeTechConditions. Изменить*/
    @Override
	public void save(ENActIncomeTechConditions object) {
    	save(object, null);
    }

	public void save(ENActIncomeTechConditions object, DFDocSigner[] dfDocSigners) {
        if (object.statusRef.code == ENActStatus.CLOSED || object.statusRef.code == ENActStatus.SIGNATURE){
            throw new EnergyproSystemException("Акт проведений в Фін.Кол , або Складений  . Редагування заборонено!!! ...");
        }

        Connection enConn = null;
        Connection docFlowConn = null;

        try
        {
        	object.setDomain_info(null);

        	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        	/*NET-2677 Номер акта должен равняться порядковому номеру договора в EnergyNet*/
            ENTechConditionsServicesDAO tcServicesDAO = new ENTechConditionsServicesDAO(getUserProfile(), enConn);
            ENTechConditionsServices tcObj = tcServicesDAO.getObject(object.techCondServicesRef.code);
            if (tcObj.contractNumber.equals(object.numbergen) != true)
                throw new EnergyproSystemException("Номер акту повинен дорівнювати порядковому номеру договору № "+tcObj.contractNumber);

            //SUPP-3751. Если объект - стоительная площадка, базовая станция или малая
            //архитектурная форма сумма расходных актов не считается - их нет
            if ((tcObj.buildersArea != 1)
            		&& (tcObj.baseStation != 1 || tcObj.connectionKindRef.code == ENConnectionKind.NO_STANDART)
            		&& (tcObj.smallArchFrm != 1) || tcObj.connectionKindRef.code == ENConnectionKind.NO_STANDART)
            {
	            int validateActIncome = validateActIncome(object, tcObj);
	            // Если нет расходных актов, сумма должна быть нулевая (при добавлении таких актов сумма скидывается в ноль,
	            // соответственно, и при сохранении мы не должны давать вносить сумму, отличную от ноля)
	            if (validateActIncome == ENConsts.NO) {
	            	object.summaGen = object.summaVat = new BigDecimal(0);
	            }
            }

        	if (object.statusRef.code == ENActIncomeStatus.GOOD) {
        		if (DocSigningLogic.isReadyForSigning(object)) {
        			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());
        			boolean isActIncomeTechConditionsReadyForSigning = actIncomeLogic.isActIncomeTechConditionsReadyForSigning(object.code);
        			if (isActIncomeTechConditionsReadyForSigning) {
	    	    		docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
	    	    		DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConn, getUserProfile(), object);
	    	    		docSigningLogic.createOrRemoveDocWithSigners(object, dfDocSigners);
        			}
        		}
        	}

	        ENActIncomeTechConditionsDAO objectDAO = new ENActIncomeTechConditionsDAO(getUserProfile(), enConn);
	        objectDAO.save(object);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENActIncomeTechConditions%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally {
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
        	closeConnection();
        }
    }

	private int validateActIncome(ENActIncomeTechConditions object, ENTechConditionsServices tcObj) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт прибуткового акту!");
		}
		if (tcObj == null) {
			throw new IllegalArgumentException("\n\nНе заданий об'єкт технічних умов!");
		}

        Connection enConn = null;

        try {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ////////////////////////////////////////////////// 14.06.13 Для новых договоров - новая проверка
            /*
            ENServicesObject2TechCondtnsServicesDAO so2tcDAO = new ENServicesObject2TechCondtnsServicesDAO(enConn, getUserProfile());
            ENServicesObject2TechCondtnsServicesFilter so2tcFilter = new ENServicesObject2TechCondtnsServicesFilter();
            so2tcFilter.techCondServRef.code = tcObj.code;
            ENServicesObject2TechCondtnsServicesShortList so2tcList = so2tcDAO.getScrollableFilteredList(so2tcFilter, 0, -1);
            */
	        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
	        ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
	        soFilter.conditionSQL = "code in (select so2tc.servicesobjectrefcode " +
	                                        " from enservicesobject2techcondtnsservices so2tc " +
	                                        "where so2tc.techcondservrefcode = " + tcObj.code + ")";
	        //ENServicesObjectShortList soList = soDAO.getScrollableFilteredListNOSEGR(soFilter, 0, -1);
	        int soArr[] = soDAO.getFilteredCodeArrayNOSEGR(soFilter, 0, -1);

	        int validateActIncome = ENConsts.NO;

	        ActIncomeLogic actIncomeLogic = new ActIncomeLogic(enConn, getUserProfile());

	        if (soArr.length == 0)
	        {
	            validateActIncome = actIncomeLogic.validateActIncomeTech(object.code, object.techCondServicesRef.code,
	                    object.actDateStart, object.actDateEnd, false);
	        }
	        else
	        {
	            ENServicesObject soObj = soDAO.getObjectNoSegr(soArr[0]);
	            validateActIncome = actIncomeLogic.validateActIncomeTechForServicesConnections(object.code, object.techCondServicesRef.code,
	                    object.actDateStart, object.actDateEnd, soObj, false);
	        }
	        //////////////////////////////////////////////////

	        //int validateActIncode = lg.validateActIncomeTech(object.code, object.techCondServicesRef.code,
	        //        object.actDateStart, object.actDateEnd, false);

	        /** SUPP-100921... +++ 29.06.2021.... при отсутствии расходных актов, проверить наличие актов подряда */
	        if (validateActIncome == ENConsts.NO) {
	
	        	RQFKOrderDAO rqfkOrderDao = new RQFKOrderDAO(enConn, getUserProfile());
	
	        	RQFKOrderFilter rqfkOrderFilter = new RQFKOrderFilter();
	        	rqfkOrderFilter.conditionSQL = " code in ( "
	        			+ " select rf2pl.fkordercode from rqfkorder2planfact rf2pl "
	        			+ "  where rf2pl.plancode in ( "
	        			+ "   select ct2pl.planrefcode from entechcond2planwork ct2pl where ct2pl.techconservicesrefcode = " + object.techCondServicesRef.code + " ) ) ";
	
	        	int[] fArr = rqfkOrderDao.getFilteredCodeArray(rqfkOrderFilter, 0, -1);
	
	        	if (fArr.length > 0) {
	        		validateActIncome = ENConsts.YES;
	        	}
	        }
	        
	        return validateActIncome;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("Can't validateActIncome", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
	}

} // end of EJB Controller for ENActIncomeTechConditions