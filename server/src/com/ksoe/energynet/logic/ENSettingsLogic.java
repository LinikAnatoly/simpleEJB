package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.ParseException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.ENSettingsValuesDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class ENSettingsLogic extends LogicModule {
	
	private static final long serialVersionUID = 1L;

	public ENSettingsLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}
	
	public String getValue(String key) throws PersistenceException {
		return this.getValue(key, new Date());
	}

	public String getValue(String key, Date date) throws PersistenceException {
		return getValue(key, date, true);
	}

	public String getValue(String key, boolean isException) throws PersistenceException {
		return this.getValue(key, new Date(), isException);
	}

	public String getValue(String key, Date date, boolean isException) throws PersistenceException {
		ENSettingsValuesDAO valuesDao = new ENSettingsValuesDAO(connection, userProfile);
		return valuesDao.getValue(key, date, isException);
	}
	
	/** Получить вектор с настройками 
	 * 
	 * Если настройка представлена в виде перечня значений через запятую
	 * 
	 * @throws PersistenceException */
	public Vector<String> getVectorWithValues(String key) throws PersistenceException {
		return getVectorWithValues(key, true);
	}

	public Vector<String> getVectorWithValues(String key, boolean isException) throws PersistenceException {
		String input = this.getValue(key, isException);
		return (input != null ? Tools.divideOnWords(input, ",") : null);
	}

	public Vector<Integer> getVectorWithIntValues(String key) throws PersistenceException {
		return getVectorWithIntValues(key, true); 
	}

	/**
	 * 
	 * Получить вектор с настройками со значениями в массиве целых чисел
	 * 
	 * Если настройка представлена в виде перечня целых чисел через запятую
	 * 
	 * @param key
	 * @return
	 * @throws PersistenceException
	 */
	public Vector<Integer> getVectorWithIntValues(String key, boolean isException) throws PersistenceException {
		Vector<Integer> vec = new Vector<Integer>();
		Vector<String> strVec = this.getVectorWithValues(key, isException);
		if(strVec == null) return null;
		for(String item : strVec) {
			int number = Integer.valueOf(item.trim());
			vec.add(number);
		}
		return vec;
	}
	
	public int getIntValue(String key) throws NumberFormatException, PersistenceException {
		return this.getIntValue(key, new Date());
	}
	public int getIntValue(String key, Date date) throws NumberFormatException, PersistenceException {
		return Integer.valueOf(this.getValue(key, date));
	}
	
	public boolean getBooleanValue(String key) throws NumberFormatException, PersistenceException {
		return this.getBooleanValue(key, new Date());
	}
	public boolean getBooleanValue(String key, Date date) throws NumberFormatException, PersistenceException {
		return Boolean.valueOf(this.getValue(key, date));
	}
	
	/**
	 * 
	 * Получить значение настройки как {@link Date}
	 * 
	 * @param key ключ
	 * @return значение настройки приведенное в тип Date с помощью стандартного формата дд.ММ.гггг 
	 * @throws PersistenceException
	 */
	public Date getDateValue(String key) throws PersistenceException {
		return this.getDateValue(key, new Date());
	}
	
	/**
	 * 
	 * Получить значение настройки как {@link Date}
	 * 
	 * @param key ключ
	 * @param date дата настройки
	 * @return значение настройки приведенное в тип Date с помощью стандартного формата дд.ММ.гггг 
	 * @throws PersistenceException
	 */
	public Date getDateValue(String key, Date date) throws PersistenceException {
		ENSettingsValuesDAO valuesDao = new ENSettingsValuesDAO(connection, userProfile);
		try {
			return Tools.dateFormatDefault.parse(valuesDao.getValue(key, date));
		} catch (ParseException e) {
			throw new SystemException(e);
		}
	}
	
	/**
	 * 
	 * Получить значение настройки как {@link BigDecimal} неокругленное
	 * 
	 * @param key ключ
	 * @return значение настройки приведенное в тип BigDecimal неокругленное
	 * @throws PersistenceException
	 */
	public BigDecimal getBigDecimalValue(String key) throws PersistenceException {
		return this.getBigDecimalValue(key, new Date());
	}
	/**
	 * 
	 * Получить значение настройки как {@link BigDecimal} неокругленное
	 * 
	 * @param key ключ
	 * @param date дата настройки
	 * @return значение настройки приведенное в тип BigDecimal неокругленное
	 * @throws PersistenceException
	 */
	public BigDecimal getBigDecimalValue(String key, Date date) throws PersistenceException {
		ENSettingsValuesDAO valuesDao = new ENSettingsValuesDAO(connection, userProfile);
		return new BigDecimal(valuesDao.getValue(key, date));
	}
}
