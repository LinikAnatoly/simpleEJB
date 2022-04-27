
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Arrays;
import java.util.Objects;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBaseFundingSourceDAOGen;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseFundingSource;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFundingSourceFilter;

/**
 * DAO Object for RegulatoryAssetBaseFundingSource;
 *
 */

public class RegulatoryAssetBaseFundingSourceDAO extends RegulatoryAssetBaseFundingSourceDAOGen {

    public RegulatoryAssetBaseFundingSourceDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBaseFundingSourceDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

	/**
	 * 
	 * Получить объект источника финансирования активов РБА {@link RegulatoryAssetBaseFundingSource} по наименованию
	 * без учета регистра
	 * 
	 * @param name наименование источника финансирования {@link RegulatoryAssetBaseFundingSource}
	 * @return объект источника финансирования активов РБА {@link RegulatoryAssetBaseFundingSource}
	 * @throws PersistenceException при ошибке считывания данных из базы
	 * @throws NullPointerException если наименование равно {@code null}
	 * @throws SystemException если наименование пусте
	 */    
    public RegulatoryAssetBaseFundingSource getByNameIgnoreCase(String name) throws PersistenceException {
    	Objects.requireNonNull(name, "Не задан обязательный параметр (наименование)!");
    	if(name.trim().length() == 0) throw new SystemException("Не задан обязательный параметр (наименование)!");
    	RegulatoryAssetBaseFundingSourceFilter filter = new RegulatoryAssetBaseFundingSourceFilter();
    	filter.conditionSQL = String.format("upper(%s) = ?", RegulatoryAssetBaseFundingSource.name_QFielld);
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1, new Vector<Object>(Arrays.asList(name.toUpperCase())));
    	if(codes.length > 1) throw new SystemException(String.format("Помилка у кількості для найменування \"%s\" (всього знайдено записів: %d)", name, codes.length));
		if(codes.length == 0) {
			return null;
		} else {
			return this.getObject(codes[0]);
		}
    }

} // end of RegulatoryAssetBaseFundingSourceDAO
