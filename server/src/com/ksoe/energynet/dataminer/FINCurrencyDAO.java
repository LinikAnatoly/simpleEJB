
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
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
	 * �������� ������ �� �������� ����
	 * 
	 * @param value ��������
	 * @param fieldName ��� ����
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� ��������� ���
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
			throw new SystemException(String.format("���� ���������� %s � �����", fieldName));
		} catch (SecurityException e) {
			throw new SystemException("�������� �� ��������");
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} finally {
			
		}

	}
	
	/**
	 * 
	 * �������� ������ �� �����
	 * 
	 * @param sign ����
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� ������ ���
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyBySign(String sign) throws PersistenceException {
		return this.getCurrencyByValue(sign, FINCurrency.sign_Attr);
	}
	
	/**
	 * 
	 * �������� ������ �� ������������
	 * 
	 * @param name ������������
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� ������������� ���
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByName(String name) throws PersistenceException {
		return this.getCurrencyByValue(name, FINCurrency.name_Attr);
	}
	
	/**
	 * 
	 * �������� ������ �� ������������ ������������
	 * 
	 * @param shortName ����������� ������������
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� ����������� ������������� ���
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByShortName(String shortName) throws PersistenceException {
		return this.getCurrencyByValue(shortName, FINCurrency.shortName_Attr);
	}
	
	/**
	 * 
	 * �������� ������ �� ���������� ����-ISO
	 * 
	 * @param isoAlphabeticCode ��������� ���-ISO
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� ��������� �����-ISO ���
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByIsoAlphabeticCode(String isoAlphabeticCode) throws PersistenceException {
		return this.getCurrencyByValue(isoAlphabeticCode, FINCurrency.isoAlphabeticCode_Attr);
	}
	
	/**
	 * 
	 * �������� ������ �� ��������� ����-ISO
	 * 
	 * @param isoNumericCode �������� ���-ISO
	 * @return ������ {@link FINCurrency} ��� {@code null} ���� ������ � ����� �������� �����-ISO ���
	 * @throws PersistenceException
	 */
	public FINCurrency getCurrencyByIsoNumericCode(String isoNumericCode) throws PersistenceException {
		return this.getCurrencyByValue(isoNumericCode, FINCurrency.isoNumericCode_Attr);
	}

} // end of FINCurrencyDAO
