
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActIncomServ2ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomServ2ProvDAO;
import com.ksoe.energynet.dataminer.ENActIncomeServices2SOBillDAO;
import com.ksoe.energynet.dataminer.ENActIncomeServicesDAO;
import com.ksoe.energynet.dataminer.ENSOBillDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.ejb.generated.ENActIncomeServicesControllerEJBGen;
import com.ksoe.energynet.logic.ActIncomeLogic;
import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENSOBill;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServices2SOBillShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServices2SOBillFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENActIncomeServices2SOBillShortList;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENActIncomeServicesControllerEJB extends ENActIncomeServicesControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public ENActIncomeServicesControllerEJB() {
	}

	/* ENActIncomeServices. Добавить */
	@Override
	public int add(ENActIncomeServices actIncomeServices) {
		try {
			ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDao = new ENServicesObjectDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENStandardConstDAO standardConstDao = new ENStandardConstDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			BigDecimal vat = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, actIncomeServices.dateGen);
			vat = vat.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);

			actIncomeServices.statusRef.code = ENActIncomeStatus.GOOD;

			actIncomeServices.dateAdd = new Date();
			actIncomeServices.userGen = getUserProfile().userName;
			actIncomeServices.dateEdit = new Date();
			
			if(actIncomeServices.isManualSum != null && actIncomeServices.isManualSum) {
				if(actIncomeServices.actDateStart == null) {
					actIncomeServices.actDateStart = actIncomeServices.dateGen;
				}
				if(actIncomeServices.actDateEnd == null) {
					actIncomeServices.actDateEnd = actIncomeServices.dateGen;
				}
			}

			int actIncomeCode = actIncomeServicesDao.add(actIncomeServices);
			
			ENServicesObject servicesObject = soDao.getObject(actIncomeServices.servicesObjectRef.code);
			
			if(actIncomeServices.isManualSum != null && actIncomeServices.isManualSum) {
				this.createSOBill(servicesObject, actIncomeServices);
				return actIncomeCode;
			}

			int validateActIncome = 0;
			boolean isException = false;

			validateActIncome = actIncomeLogic.validateActIncomeServices(actIncomeCode, actIncomeServices.actDateStart,
					actIncomeServices.actDateEnd, servicesObject, isException);

			if (validateActIncome == 0) {
                throw new SystemException("\n\n"
                		+ "За вказаний період не знайдено видаткових актів зі статусом \" на підписанні \" або \" проведений в ФК \"...");
            }

			actIncomeLogic.recalcActIncomeServices(actIncomeCode);

			ENActIncomeServices actIncomeServicesAdd = actIncomeServicesDao.getObject(actIncomeCode);
			this.createSOBill(servicesObject, actIncomeServicesAdd);

			return actIncomeCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENActIncomeServices%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void removeActFromActIncomeServices(int actCode) {
		try {
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			actIncomeLogic.removeActFromActIncomeServices(actCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	private void createSOBill(ENServicesObject servicesObject, ENActIncomeServices object) throws DatasourceConnectException, PersistenceException {
		ActIncomeLogic actIncomeLogic = new ActIncomeLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		actIncomeLogic.createSOBill(servicesObject, object);
	}

	/* ENActIncomeServices. Удалить */
	@Override
	public void remove(int actIncomeCode) {
		try {
			ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActIncomServ2ENActDAO actIncomServ2ENActDao = new ENActIncomServ2ENActDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeCode);

			if (actIncomeServices.statusRef.code != ENActIncomeStatus.GOOD) {
				throw new SystemException("\n\n"
						+ "Акт повинен бути чорновим!!!");
			}

			ENActIncomServ2ENActFilter incomServ2ENActFilter = new ENActIncomServ2ENActFilter();
			incomServ2ENActFilter.actIncomeRef.code = actIncomeCode;

			int aArr[] = actIncomServ2ENActDao.getFilteredCodeArray(incomServ2ENActFilter, 0, -1);
			for (int i = 0; i < aArr.length; i++) {
				actIncomServ2ENActDao.remove(aArr[i]);
			}
			
			// NET-4572 Удаление счета и связки со счетом
			ENSOBillDAO soBillDao = new ENSOBillDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActIncomeServices2SOBillDAO actIncome2SOBillDao = new ENActIncomeServices2SOBillDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENActIncomeServices2SOBillFilter actIncome2SoBillFilter = new ENActIncomeServices2SOBillFilter();
			actIncome2SoBillFilter.actIncomeRef.code = actIncomeCode;
			
			ENActIncomeServices2SOBillShortList actIncome2SoBillList = actIncome2SOBillDao
					.getScrollableFilteredList(actIncome2SoBillFilter, 0, -1);
			
			for(ENActIncomeServices2SOBillShort actIncome2SoBill : actIncome2SoBillList.list) {
				actIncome2SOBillDao.remove(actIncome2SoBill.code);
				soBillDao.remove(actIncome2SoBill.soBillRefCode);
			}


			actIncomeServicesDao.remove(actIncomeCode);
			


		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENActIncomeServices%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENActIncomeServices object) {
		try {
			ENActIncomeServicesDAO objectDAO = new ENActIncomeServicesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActIncomeServices2SOBillDAO actIncome2SOBillDao = new ENActIncomeServices2SOBillDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENSOBillDAO soBillDao = new ENSOBillDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENActIncomeServices old = objectDAO.getObject(object.code);

			if (old.statusRef.code != ENActIncomeStatus.GOOD) {
				throw new SystemException("\n\nАкт повинен бути чорновим!!!");
			}
			
			object.statusRef.code = ENActIncomeStatus.GOOD;

		    objectDAO.save(object);
		    
			if(object.summaGen != null && object.summaVat != null
					&& (Objects.compare(object.summaGen, old.summaGen, BigDecimal::compareTo) != 0
						|| Objects.compare(object.summaVat, old.summaVat, BigDecimal::compareTo) != 0)) {
				ENActIncomeServices2SOBillFilter actIncome2SoBillFilter = new ENActIncomeServices2SOBillFilter();
				actIncome2SoBillFilter.actIncomeRef.code = object.code;
				
				ENActIncomeServices2SOBillShortList actIncome2SoBillList = actIncome2SOBillDao
						.getScrollableFilteredList(actIncome2SoBillFilter, 0, -1);
				
				if(actIncome2SoBillList.totalCount > 0) {
					if(actIncome2SoBillList.totalCount != 1) {
						throw new SystemException(String.format("Помилка у кількості рахунків для прибуткового акту № %s!", object.numberGen));
					}
					// Изменение счета при изменении сумм в приходном акте
					ENSOBill bill = soBillDao.getObject(actIncome2SoBillList.get(0).soBillRefCode);
					bill.sumVat = object.summaVat;
					bill.sumTotal = object.summaGen;
					bill.sumGen = bill.sumTotal.subtract(bill.sumVat);
					soBillDao.save(bill);
				}
			}
		    
		    
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENActIncomeServices%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 *	Получить дату проведения по коду доходного акта
	 *
	 *	@param actIncomeServicesCode - код доходного акта
	 *	@return datePostings - дата проведения
	 */
    public Date getDatePostingsByActIncomeServicesCode(int actIncomeServicesCode) {
        Date datePostings = null;
        try {
        	ActIncomeLogic actIncomeLogic = new ActIncomeLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            datePostings = actIncomeLogic.getDatePostingsByActIncomeServicesCode(actIncomeServicesCode);

            return datePostings;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
        	closeConnection();
        }
    }


    /**
     *	Получить список проводок по доходному акту
     *
     *	@param actIncomeServicesCode - код доходного акта
     *
     */
	public FKProvObjectShortList getPostingsList(int actIncomeServicesCode) {

		FKProvObjectShortList result = new FKProvObjectShortList();
		Connection finConn = null;

		try {
			ENActIncomServ2ProvDAO incomServ2ProvDao = new ENActIncomServ2ProvDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENActIncomServ2ProvFilter actIncomServ2ProvFilter = new ENActIncomServ2ProvFilter();
			actIncomServ2ProvFilter.actIncomeRef.code = actIncomeServicesCode;

			ENActIncomServ2ProvShortList actIncomServ2ProvShortList = incomServ2ProvDao.getScrollableFilteredList(actIncomServ2ProvFilter, 0, -1);

			if (actIncomServ2ProvShortList.totalCount == 0) {
				return result;
			}

			if (actIncomServ2ProvShortList.totalCount > 1) {
				throw new SystemException("\n\n"
						+ "Знайдено декілька (" + actIncomServ2ProvShortList.totalCount + ") пачок проводок для цього акту!");
			}

			int partId = actIncomServ2ProvShortList.get(0).partId;
			if (partId == Integer.MIN_VALUE) {
				throw new SystemException("\n\n"
						+ "Відсутній код пачки проводок для цього акту!");
			}

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());

			return fpLogic.getProvListFromFin(partId);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с БД Фин.Коллекции ...", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}

			closeConnection();
		}
	}



} // end of EJB Controller for ENActIncomeServices