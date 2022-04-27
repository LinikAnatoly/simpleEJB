package com.ksoe.energynet.logic;

import java.sql.Connection;

import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.FINCurrencyDAO;
import com.ksoe.energynet.valueobject.FINCurrency;

/**
 * 
 * Класс-логика для финансовых справочников
 * 
 * @author kreschishinma
 *
 */
public class FinanceLogic extends LogicModule {
	
	private static final int CURRENCY_SIGN_LENGTH = 1;
	private static final int CURRENCY_ISO_ALPHABETIC_CODE_LENGTH = 3;
	private static final int CURRENCY_ISO_NUMERIC_CODE_LENGTH = 3;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public FinanceLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}
	
	
	/**
	 * 
	 * Проверка валюты на правильность
	 * 
	 * Если свойства валюты неправильные, то будет сгенерировано исключение
	 * 
	 * @param currency валюта {@link FINCurrency}
	 */
	public void checkFINCurrencyValidity(FINCurrency currency) {
		if(currency == null) {
			throw new java.lang.NullPointerException("Валюта порожня");
		}
		
		if(currency.name == null) {
			throw new java.lang.NullPointerException("Найменування валюти повино бути заповнене");
		}
		
		if(currency.shortName == null) {
			throw new java.lang.NullPointerException("Скорочення валюти повино бути заповнене");
		}
		
		if(currency.sign != null && currency.sign.length() > CURRENCY_SIGN_LENGTH) {
			throw new SystemException(String.format("Довжина знаку валюти не повина перевищувати %d символ", CURRENCY_SIGN_LENGTH));
		}
		
		if(currency.isoAlphabeticCode == null || currency.isoAlphabeticCode.length() != CURRENCY_ISO_ALPHABETIC_CODE_LENGTH) {
			throw new SystemException(String.format("Довжина літерного коду-ISO повина дорівнювати %d символам"
					, CURRENCY_ISO_ALPHABETIC_CODE_LENGTH));
		}
		
		if(currency.isoNumericCode == null || currency.isoNumericCode.length() != CURRENCY_ISO_NUMERIC_CODE_LENGTH) {
			throw new SystemException(String.format("Довжина цифрового коду-ISO повина дорівнювати %d цифрам"
					, CURRENCY_ISO_NUMERIC_CODE_LENGTH));
		}
		
		if(!currency.isoNumericCode.matches(String.format("[0-9]{%d,%d}", CURRENCY_ISO_NUMERIC_CODE_LENGTH, CURRENCY_ISO_NUMERIC_CODE_LENGTH))) {
			throw new SystemException(String.format("Помилка у значенні цифрового коду-ISO \"%s\" - повинно складатися тільки із цифр"
					, currency.isoNumericCode));
		}
	}
	
	/**
	 * 
	 * Проверка валюты перед сохранением
	 * 
	 * @param currency валюта {@link FINCurrency}
	 * @throws PersistenceException
	 */
	public void checkFINCurrencyBeforeSaving(FINCurrency currency) throws PersistenceException {
		this.checkFINCurrencyValidity(currency);
		
		FINCurrencyDAO dao = new FINCurrencyDAO(connection, userProfile);
		
		FINCurrency otherCurrency = null;
		
		if(currency.sign != null && currency.sign.length() > 0) {
			otherCurrency = dao.getCurrencyBySign(currency.sign);
			if(otherCurrency != null && otherCurrency.code != currency.code) {
				throw new SystemException(String.format("Вже є валюта із знаком \"%s\" (системний код: %d)", currency.sign, otherCurrency.code));
			}
		}
		
		otherCurrency = dao.getCurrencyByName(currency.name);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("Вже є валюта із найменуванням \"%s\" (системний код: %d)", currency.name, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByShortName(currency.shortName);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("Вже є валюта із скороченням \"%s\" (системний код: %d)", currency.shortName, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByIsoAlphabeticCode(currency.isoAlphabeticCode);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("Вже є валюта із літерним кодом-ISO \"%s\" (системний код: %d)", currency.isoAlphabeticCode
					, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByIsoNumericCode(currency.isoNumericCode);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("Вже є валюта із цифровим кодом-ISO \"%s\" (системний код: %d)", currency.isoNumericCode
					, otherCurrency.code));
		}
	}

}
