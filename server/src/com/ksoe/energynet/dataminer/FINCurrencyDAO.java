
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.FINCurrencyDAOGen;
import com.ksoe.energynet.valueobject.FINCurrency;
import com.ksoe.energynet.valueobject.filter.FINCurrencyFilter;

/**
 * DAO Object for FINCurrency;
 *
 */

public class FINCurrencyDAO extends FINCurrencyDAOGen {

    public FINCurrencyDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINCurrencyDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	/**
	 * 
	 * Получить валюту по значению поля
	 * 
	 * @param value значение
	 * @param fieldName имя поля
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким значением нет
	 * @throws PersistenceException
	 */
	private FINCurrency getCurrencyByValue(String value, String fieldName) throws PersistenceException {
		try {
			if(fieldName == null) {
				throw new java.lang.IllegalArgumentException();
			}
			
			FINCurrencyFilter filter = new FINCurrencyFilter();
			java.lang.reflect.Field field = FINCurrencyFilter.class.getField(fieldName);
			field.set(filter, value);
			
			int[] codes = this.getFilteredCodeArray(filter, 0, 1);
			
			if(codes.length == 0) {
				return null;
			} else {
				return this.getObject(codes[0]);
			}
		} catch (NoSuchFieldException e) {
			throw new SystemException(String.format("Немає властивості %s у валюті", fieldName));
		} catch (SecurityException e) {
			throw new SystemException("Проблеми із безпекою");
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} finally {
			
		}

	}
	
	/**
	 * 
	 * Получить валюту по знаку
	 * 
	 * @param sign знак
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким знаком нет
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyBySign(String sign) throws PersistenceException {
		return this.getCurrencyByValue(sign, FINCurrency.sign_Attr);
	}
	
	/**
	 * 
	 * Получить валюту по наименованию
	 * 
	 * @param name наименование
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким наименованием нет
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByName(String name) throws PersistenceException {
		return this.getCurrencyByValue(name, FINCurrency.name_Attr);
	}
	
	/**
	 * 
	 * Получить валюту по сокращенному наименованию
	 * 
	 * @param shortName сокращенное наименование
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким сокращенным наименованием нет
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByShortName(String shortName) throws PersistenceException {
		return this.getCurrencyByValue(shortName, FINCurrency.shortName_Attr);
	}
	
	/**
	 * 
	 * Получить валюту по буквенному коду-ISO
	 * 
	 * @param isoAlphabeticCode буквенный код-ISO
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким буквенным кодом-ISO нет
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByIsoAlphabeticCode(String isoAlphabeticCode) throws PersistenceException {
		return this.getCurrencyByValue(isoAlphabeticCode, FINCurrency.isoAlphabeticCode_Attr);
	}
	
	/**
	 * 
	 * Получить валюту по цифровому коду-ISO
	 * 
	 * @param isoNumericCode цифровой код-ISO
	 * @return валюту {@link FINCurrency} или {@code null} если валюты с таким цифровым кодом-ISO нет
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByIsoNumericCode(String isoNumericCode) throws PersistenceException {
		return this.getCurrencyByValue(isoNumericCode, FINCurrency.isoNumericCode_Attr);
	}

} // end of FINCurrencyDAO
