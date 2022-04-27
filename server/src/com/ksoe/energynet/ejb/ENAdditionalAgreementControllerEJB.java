
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAdditionalAgreementDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;

/**
 * EJB Controller for ENAdditionalAgreement;
 *
 */

import com.ksoe.energynet.ejb.generated.ENAdditionalAgreementControllerEJBGen;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENAdditionalAgreementControllerEJB extends
		ENAdditionalAgreementControllerEJBGen {

	public ENAdditionalAgreementControllerEJB() {
	}
	
	private void checkDate(ENAdditionalAgreement object) throws DatasourceConnectException, PersistenceException {
		
		if(object == null || object.dateGen == null
				|| object.servicesobjectRef == null || object.servicesobjectRef.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не задані обов'язкові параметри!");
		}
		
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		
		ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(object.servicesobjectRef.code);
		
		Date dateToCheck = (servicesObject.contractDateServices == null) ? servicesObject.contractDate : servicesObject.contractDateServices;
		
		if(dateToCheck.compareTo(object.dateGen) == 1) {
			throw new SystemException(String.format("Дата договору (%s) більша ніж дата додаткової угоди (%s)"
					, Tools.dateFormatDefault.format(dateToCheck)
					, Tools.dateFormatDefault.format(object.dateGen)));
		}
		
		// Проверим что дата дополнительного соглашения не является более ранней чем даты добавленных и подписанных
		// доп. соглашений для этого договора (если такие есть)
		long count = dao.count(object.servicesobjectRef, object.dateGen, true);
		if(count > 0) {
			throw new SystemException(String.format(" Є підписанні доп. угоди починаючи з дати %s для цього договору!"
					, Tools.dateFormatDefault.format(object.dateGen)));
		}
		
	}
	
	public int add(ENAdditionalAgreement object) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			ENServicesObject servicesObject = servicesObjectDao.getObject(object.servicesobjectRef.code);
			
			if(servicesObject.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
				throw new SystemException(String.format("Договір № %s від %s не підписаний!"
						, servicesObject.contractNumberServices
						, Tools.dateFormatDefault.format(servicesObject.contractDateServices)));
			}
			
			if(object.isSigned != null && object.isSigned) {
				throw new SystemException("Помилка у статусі!");
			}
			
			this.checkDate(object);
			
			long existedNotSigned = dao.count(object.servicesobjectRef, null, false);
			
			if(existedNotSigned > 0) {
				throw new SystemException("Для цього договору вже є чорнова додаткова угода!\n"
						+ "Неможливо додавати іншу доки та не буде підписана!");
			}
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				object.sumWithoutVAT = BigDecimal.ZERO;
				object.sumVAT = BigDecimal.ZERO;
			}
			
			object.code = dao.add(object);
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				servicesCalculatorLogic.evaluateSumsByENServicesCost(servicesObject);
			}
			
			return object.code;
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENAdditionalAgreement object) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement oldObject = dao.getObject(object.code);
			
			boolean objectIsSigned = object.isSigned != null && object.isSigned;
			boolean oldObjectIsSigned = oldObject.isSigned != null && oldObject.isSigned;
			
			if(objectIsSigned != oldObjectIsSigned) {
				throw new SystemException("Статус доп. угоди необхідно змінювати через процедуру \"Підписання\\Відміни підписання\"!");
			}
			
			if(objectIsSigned) {
				throw new SystemException(String.format("Додаткову угоду № %s від %s підписано!\n"
						+ "Для зміни необхідно відмінити підписання!"
							, object.numberGen
							, Tools.dateFormatDefault.format(object.dateGen)));
			}
			
			this.checkDate(object);
			
			dao.save(object);
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(object.servicesobjectRef.code);
				servicesCalculatorLogic.evaluateSumsByENServicesCost(servicesObject);
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int code) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement object = dao.getObject(code);
			
			boolean objectIsSigned = object.isSigned != null && object.isSigned;
			
			if(objectIsSigned) {
				throw new SystemException(String.format("Додаткову угоду № %s від %s підписано!\n"
					+ "Для видалення необхідно відмінити підписання!"
						, object.numberGen
						, Tools.dateFormatDefault.format(object.dateGen)));
			}
			
			dao.remove(object.code);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	/**
	 * 
	 * Процедура подписания и отмены подписания дополнительного соглашения
	 * 
	 * @param object объект дополнительного соглашения
	 * @param isSign {@code true} - подписание, {@code false} - отмена
	 */
	public void signOrUnsign(ENAdditionalAgreement object, boolean isSign) {
		try {
			if(object == null || object.code == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("Немає об'єкту доп. угоди");
			}
			
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement oldObject = dao.getObject(object.code);
			
			boolean objectIsSigned = oldObject.isSigned != null && oldObject.isSigned;
			
			if(isSign) {
				if(objectIsSigned) {
					throw new SystemException(String.format("Додаткова угода № %s від %s вже підписана!"
							, oldObject.numberGen, Tools.dateFormatDefault.format(oldObject.dateGen)));
				}
			} else {
				if(!objectIsSigned) {
					throw new SystemException(String.format("Додаткова угода № %s від %s не підписана!"
							, oldObject.numberGen, Tools.dateFormatDefault.format(oldObject.dateGen)));
				}
				
				// Проверка, что не было дальнейших дополнительных соглашений при отмене подписания текущего.
				if(dao.countFutureAgreements(object) > 0) {
					throw new SystemException("Вже є наступні додаткові угоди! Для відміни підписання поточної додаткової угоди\n"
							+ " спочатку необхідно видалити наступні!");
				}
			}
			
			oldObject.isSigned = isSign;
			
			dao.save(oldObject);
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}

		
		
	}

} // end of EJB Controller for ENAdditionalAgreement