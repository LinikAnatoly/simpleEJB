
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.RegulatoryAssetBaseOutOfUseDAOGen;
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseOutOfUseFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseOutOfUseShortList;

/**
 * DAO Object for RegulatoryAssetBaseOutOfUse;
 *
 */

public class RegulatoryAssetBaseOutOfUseDAO extends RegulatoryAssetBaseOutOfUseDAOGen {

    public RegulatoryAssetBaseOutOfUseDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public RegulatoryAssetBaseOutOfUseDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int removeByAssetCode(int assetCode) {
    	return BaseDAOUtils.executeUpdate(getConnection(), "DELETE FROM regulatoryassetbasetfs WHERE assetrefcode = ?", Arrays.asList(assetCode), false);
    }

    public List<RegulatoryAssetBaseOutOfUse> getListByAsset(RegulatoryAssetBase asset) throws PersistenceException {
    	if(asset == null || asset.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не задан параметр!");
    	RegulatoryAssetBaseOutOfUseFilter filter = new RegulatoryAssetBaseOutOfUseFilter();
    	filter.assetRef.code = asset.code;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	List<RegulatoryAssetBaseOutOfUse> list = new Vector<RegulatoryAssetBaseOutOfUse>();
    	for(int code : codes) list.add(this.getObject(code));
    	return list;
    }
    
    public RegulatoryAssetBaseOutOfUseShortList getShortListByAsset(RegulatoryAssetBase asset) throws PersistenceException {
    	if(asset == null || asset.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не задан параметр!");
    	RegulatoryAssetBaseOutOfUseFilter filter = new RegulatoryAssetBaseOutOfUseFilter();
    	filter.assetRef.code = asset.code;
    	return this.getScrollableFilteredList(filter, 0, -1);
    }

} // end of RegulatoryAssetBaseOutOfUseDAO
