
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBasePartialWriteOffDAOGen;
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBasePartialWriteOffShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for RegulatoryAssetBasePartialWriteOff;
 *
 */

public class RegulatoryAssetBasePartialWriteOffDAO extends RegulatoryAssetBasePartialWriteOffDAOGen {

    public RegulatoryAssetBasePartialWriteOffDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBasePartialWriteOffDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int removeByAssetCode(int assetCode) {
    	return BaseDAOUtils.executeUpdate(getConnection(), "DELETE FROM REGULATRSSTBSPRTLWRTFF WHERE assetrefcode = ?", Arrays.asList(assetCode), false);
    }
    
    public List<RegulatoryAssetBasePartialWriteOff> getListByAsset(RegulatoryAssetBase asset) throws PersistenceException {
    	if(asset == null || asset.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не задан параметр!");
    	RegulatoryAssetBasePartialWriteOffFilter filter = new RegulatoryAssetBasePartialWriteOffFilter();
    	filter.assetRef.code = asset.code;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	List<RegulatoryAssetBasePartialWriteOff> list = new Vector<RegulatoryAssetBasePartialWriteOff>();
    	for(int code : codes) list.add(this.getObject(code));
    	return list;
    }
    
    public RegulatoryAssetBasePartialWriteOffShortList getShortListByAsset(RegulatoryAssetBase asset) throws PersistenceException {
    	if(asset == null || asset.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не задан параметр!");
    	RegulatoryAssetBasePartialWriteOffFilter filter = new RegulatoryAssetBasePartialWriteOffFilter();
    	filter.assetRef.code = asset.code;
    	return this.getScrollableFilteredList(filter, 0, -1);
    }
    
    public String getConditionByFromToParameters(RegulatoryAssetBasePartialWriteOffFilter filter) {
    	String condition = "";
    	if(filter == null) return condition;
    	if(filter.getWriteOffDateFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBasePartialWriteOff.writeOffDate_QFielld), condition);
    	if(filter.getWriteOffDateTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBasePartialWriteOff.writeOffDate_QFielld), condition);
    	if(filter.getValueFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBasePartialWriteOff.value_QFielld), condition);
    	if(filter.getValueTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBasePartialWriteOff.value_QFielld), condition);
    	if(filter.getPercentageFrom() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s >= ?", RegulatoryAssetBasePartialWriteOff.percentage_QFielld), condition);
    	if(filter.getPercentageTo() != null)
    		condition = BaseDAOUtils.addToCondition(String.format("%s <= ?", RegulatoryAssetBasePartialWriteOff.percentage_QFielld), condition);
    	return condition;
    }
    
    public List<? extends Object> getParametersByFilter(RegulatoryAssetBasePartialWriteOffFilter filter) {
    	List<Object> result = new ArrayList<Object>();
    	if(filter != null) {
    		if(filter.code != Integer.MIN_VALUE) result.add(filter.code);
    		if(filter.writeOffNumber != null) result.add(BaseDAOUtils.getLikeString(filter.writeOffNumber));
    		if(filter.writeOffDate != null) result.add(filter.writeOffDate);
    		if(filter.value != null) result.add(filter.value);
    		if(filter.percentage != null) result.add(filter.percentage);
    	}
    	return result;
    }
    
    public List<? extends Object> getFromToParametersByFilter(RegulatoryAssetBasePartialWriteOffFilter filter) {
    	List<Object> result = new ArrayList<Object>();
    	if(filter != null) {
    		if(filter.getWriteOffDateFrom() != null) result.add(filter.getWriteOffDateFrom());
    		if(filter.getWriteOffDateTo() != null) result.add(filter.getWriteOffDateTo());
    		if(filter.getValueFrom() != null) result.add(filter.getValueFrom());
    		if(filter.getValueTo() != null) result.add(filter.getValueTo());
    		if(filter.getPercentageFrom() != null) result.add(filter.getPercentageFrom());
    		if(filter.getPercentageTo() != null) result.add(filter.getPercentageTo());
    	}
    	return result;    	
    }
} // end of RegulatoryAssetBasePartialWriteOffDAO
