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
 * �����-������ ��� ���������� ������������
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
	 * �������� ������ �� ������������
	 * 
	 * ���� �������� ������ ������������, �� ����� ������������� ����������
	 * 
	 * @param currency ������ {@link FINCurrency}
	 */
	public void checkFINCurrencyValidity(FINCurrency currency) {
		if(currency == null) {
			throw new java.lang.NullPointerException("������ �������");
		}
		
		if(currency.name == null) {
			throw new java.lang.NullPointerException("������������ ������ ������ ���� ���������");
		}
		
		if(currency.shortName == null) {
			throw new java.lang.NullPointerException("���������� ������ ������ ���� ���������");
		}
		
		if(currency.sign != null && currency.sign.length() > CURRENCY_SIGN_LENGTH) {
			throw new SystemException(String.format("������� ����� ������ �� ������ ������������ %d ������", CURRENCY_SIGN_LENGTH));
		}
		
		if(currency.isoAlphabeticCode == null || currency.isoAlphabeticCode.length() != CURRENCY_ISO_ALPHABETIC_CODE_LENGTH) {
			throw new SystemException(String.format("������� �������� ����-ISO ������ ���������� %d ��������"
					, CURRENCY_ISO_ALPHABETIC_CODE_LENGTH));
		}
		
		if(currency.isoNumericCode == null || currency.isoNumericCode.length() != CURRENCY_ISO_NUMERIC_CODE_LENGTH) {
			throw new SystemException(String.format("������� ��������� ����-ISO ������ ���������� %d ������"
					, CURRENCY_ISO_NUMERIC_CODE_LENGTH));
		}
		
		if(!currency.isoNumericCode.matches(String.format("[0-9]{%d,%d}", CURRENCY_ISO_NUMERIC_CODE_LENGTH, CURRENCY_ISO_NUMERIC_CODE_LENGTH))) {
			throw new SystemException(String.format("������� � ������� ��������� ����-ISO \"%s\" - ������� ���������� ����� �� ����"
					, currency.isoNumericCode));
		}
	}
	
	/**
	 * 
	 * �������� ������ ����� �����������
	 * 
	 * @param currency ������ {@link FINCurrency}
	 * @throws PersistenceException
	 */
	public void checkFINCurrencyBeforeSaving(FINCurrency currency) throws PersistenceException {
		this.checkFINCurrencyValidity(currency);
		
		FINCurrencyDAO dao = new FINCurrencyDAO(connection, userProfile);
		
		FINCurrency otherCurrency = null;
		
		if(currency.sign != null && currency.sign.length() > 0) {
			otherCurrency = dao.getCurrencyBySign(currency.sign);
			if(otherCurrency != null && otherCurrency.code != currency.code) {
				throw new SystemException(String.format("��� � ������ �� ������ \"%s\" (��������� ���: %d)", currency.sign, otherCurrency.code));
			}
		}
		
		otherCurrency = dao.getCurrencyByName(currency.name);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("��� � ������ �� ������������� \"%s\" (��������� ���: %d)", currency.name, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByShortName(currency.shortName);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("��� � ������ �� ����������� \"%s\" (��������� ���: %d)", currency.shortName, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByIsoAlphabeticCode(currency.isoAlphabeticCode);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("��� � ������ �� ������� �����-ISO \"%s\" (��������� ���: %d)", currency.isoAlphabeticCode
					, otherCurrency.code));
		}
		
		otherCurrency = dao.getCurrencyByIsoNumericCode(currency.isoNumericCode);
		if(otherCurrency != null && otherCurrency.code != currency.code) {
			throw new SystemException(String.format("��� � ������ �� �������� �����-ISO \"%s\" (��������� ���: %d)", currency.isoNumericCode
					, otherCurrency.code));
		}
	}

}
