
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDamageRecovery;
 *
 */

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDamageRecoveryDAO;
import com.ksoe.energynet.ejb.generated.ENDamageRecoveryControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.ENDamageRecoveryStatus;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;


public class ENDamageRecoveryControllerEJB extends
		ENDamageRecoveryControllerEJBGen {

	public ENDamageRecoveryControllerEJB() {
	}

	@Override
	public void save(ENDamageRecovery object) {
		try {
			ENDamageRecoveryDAO objectDAO = new ENDamageRecoveryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			if (object.statusRef.code == ENDamageRecoveryStatus.CLOSED) {
				throw new SystemException("Акт вже проведено!");
			}

		    object.setDomain_info(null);
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENDamageRecovery%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENDamageRecovery. Добавить */
	@Override
	public int add(ENDamageRecovery object) {
		try {
			ENDamageRecoveryDAO objectDAO = new ENDamageRecoveryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.setDomain_info(null);
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        object.statusRef.code = ENDamageRecoveryStatus.DRAFT;
	        object.datePosting = object.dateGen;
	        object.partId = Integer.MIN_VALUE;

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDamageRecovery%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	  public void changeDatePosting(ENDamageRecovery object) {
	        try {

	        	ENDamageRecoveryDAO objectDAO = new ENDamageRecoveryDAO(
						getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	        	if (object.statusRef.code != ENDamageRecoveryStatus.SUM_BY_ACT_CALCULATED) {
	        		throw new SystemException("Дату проводок можно менять только при статусе акта \"Сума по актам расчитана\"!");
	        	}

	        	objectDAO.save(object);

	        } catch (EnergyproSystemException e) {
	            e.printStackTrace();
	        } catch (DatasourceConnectException e) {
	            e.printStackTrace();
	        } catch (PersistenceException e) {
	            e.printStackTrace();
	        }
	    }


	  public FKProvObjectShortList getFKPostingsList(int damageRecoveryCode) {

	        Connection finConn = null;
	        try {

	        	ENDamageRecoveryDAO objectDAO = new ENDamageRecoveryDAO(
						getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	        	ENDamageRecovery damageRecovery = objectDAO.getObject(damageRecoveryCode);

	            int partId = damageRecovery.partId;

	            if (partId != Integer.MIN_VALUE) {


	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
	            return fpLogic.getProvListFromFin(partId);
	            }

	            return null;
	        } catch (DatasourceConnectException e) {
	            throw new EnergyproSystemException(
	                    "Нет связи с БД Фин.Коллекции ...", e);
	        } catch (PersistenceException e) {
	            throw new EnergyproSystemException(e.getMessage(), e);
	        } finally {
	            try {
	                if (finConn != null && !finConn.isClosed()) {
	                    finConn.close();
	                    finConn = null;
	                }
	            } catch (SQLException e) {
	            }
	        }
	    }

	  public FKProvResult movePostingToFK(int damageRecoveryCode) {
	        Connection enConn = null;
	        Connection finConn = null;

	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	            ENDamageRecoveryDAO damRecDAO = new ENDamageRecoveryDAO(getUserProfile(), enConn);
	            ENDamageRecovery damageRecovery = damRecDAO.getObject(damageRecoveryCode);
                DepartmentLogic depLogic = new DepartmentLogic(enConn, getUserProfile());
	            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

	            /* if (!getUserProfile().domainInfo.domain.equals("root")) {
	                if (!getUserProfile().domainInfo.domain.equals(damageRecovery.domain_info)) {
	                    throw new EnergyproSystemException(
	                            "У Вас немає прав на проведення документів цього підрозділу!");
	                }
	            } */

	            // /// Проверки на статус
	            if (damageRecovery.statusRef.code == ENDamageRecoveryStatus.CLOSED) {
	                throw new EnergyproSystemException(
	                        "Цей акт вже проведений!");
	            }

                if (damageRecovery.partId != Integer.MIN_VALUE)
                {
                    throw new EnergyproSystemException("Для цього договору вже є проводки у Фінансах! Код пачки: " + damageRecovery.partId);
                }

                String cehCode = "";
                String cehCodePodr = "";

                cehCode = depLogic.getFINCehCodeByDepartmentCode(damageRecovery.department.code, false);
                cehCodePodr = depLogic.getFINCehCodePodrByDepartmentCode(damageRecovery.department.code, false);

                if (cehCode == "")
                {
                    throw new SystemException("Невідомий Підрозділ у акті! Код: " +
                    		damageRecovery.department.code + " (код акту: " +
                    		damageRecovery.code + ") (1)");
                }

                if (cehCodePodr == "")
                {
                    throw new SystemException("Невідомий Підрозділ у акті! Код: " +
                    		damageRecovery.department.code + " (код акту: " +
                    		damageRecovery.code + ") (2)");
                }

                String V_Prov_Buffer = "";
                String description = "";

                description = "Відшкодування збитків згідно акту №" + damageRecovery.numberGen +
                		      " від " + new SimpleDateFormat("dd.MM.yyyy").format(damageRecovery.dateGen).toString();

                BigDecimal sumTotal = (damageRecovery.damageAmmount.multiply(new BigDecimal(1.2))).setScale(2, BigDecimal.ROUND_HALF_UP);
                BigDecimal sumBase = damageRecovery.damageAmmount.setScale(2, BigDecimal.ROUND_HALF_UP);
                BigDecimal sumVat = ((damageRecovery.damageAmmount.multiply(new BigDecimal(1.2)).setScale(2, BigDecimal.ROUND_HALF_UP)).divide(new BigDecimal(6),2,BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP);

                 
                
                Date d_date_supp_92242 = Tools.convertStringToDate("09.06.2020");
                
                int withProvNds = 1;
                if(damageRecovery.dateGen.compareTo(d_date_supp_92242) >=0 ){
                	withProvNds	= 0;
                }
                
     	    	V_Prov_Buffer = fpLogic.generateQuery4DamageRecovery(
    						cehCode, cehCodePodr,
    						damageRecovery.FKpartnerCode,
    						damageRecovery.FKdocCode,
    						sumTotal, sumBase, sumVat,
    						description,
    						damageRecovery.datePosting,
    						withProvNds);


     	    	/*if (posting_move_mdax){
	   	    		ledgerTransPostingPackList = axpLogic.getLedger4RentBillAndPay(
	   	    				cehCode,
	   	    				cehCodePodr,
    						damageRecovery.ax,
    						damageRecovery.FKdocCode,
    						sumTotal,
    						sumBase,
    						sumVat,
    						description,
    						damageRecovery.datePosting);

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
	   	    	}*/

                FKProvResult provResult = new FKProvResult();

                if (V_Prov_Buffer != "")
                {
                    provResult = fpLogic.createPostings(V_Prov_Buffer);
                }
                else
                {
                    throw new EnergyproSystemException("Не знайдений перелік проводок!");
                }

	            if (provResult.partId != Integer.MIN_VALUE) {
	                // Меняем бух. статус на "Проведенный в ФК"
	            	// сетим код пачки проводок
	            	damageRecovery.statusRef.code = ENDamageRecoveryStatus.CLOSED;
	            	damageRecovery.partId = provResult.partId;
	            	damRecDAO.save(damageRecovery);
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


	    public void deletePostingFromFK(int damageRecoveryCode) {
	        Connection enConn = null;
	        Connection finConn = null;
	        try {
	            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	            ENDamageRecoveryDAO objectDAO = new ENDamageRecoveryDAO(getUserProfile(), enConn);
	            ENDamageRecovery damageRecovery = objectDAO.getObject(damageRecoveryCode);
	            FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

	            /* Проверка на статус */
	            if (damageRecovery.statusRef.code != ENDamageRecoveryStatus.CLOSED) {
	                throw new EnergyproSystemException(
	                        "Цей акт ще не проведений!");
	            }

	            /* удаляем проводки из Финансов */
	            if (damageRecovery.partId == Integer.MIN_VALUE) {
	                throw new EnergyproSystemException(
	                        "Немає проводок для видалення!");
	            }
	            fpLogic.deleteProv(damageRecovery.partId, getUserProfile().userName);

	            /* Меняем статус на "Расчитанный" */
	            damageRecovery.statusRef.code = ENDamageRecoveryStatus.SUM_BY_ACT_CALCULATED;
	            damageRecovery.partId = Integer.MIN_VALUE;
	            objectDAO.save(damageRecovery);


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


} // end of EJB Controller for ENDamageRecovery