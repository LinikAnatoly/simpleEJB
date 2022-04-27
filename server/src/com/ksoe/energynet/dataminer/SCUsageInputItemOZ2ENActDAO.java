//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZ2ENActDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ENActFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCUsageInputItemOZ2ENAct;
 *
 */

public class SCUsageInputItemOZ2ENActDAO extends SCUsageInputItemOZ2ENActDAOGen {

	  /**
	   * 
	   * Получить лист кодов актов {@link ENAct} по объекту сущности SCUsageInput
	   * 
	   * @param usageInput объект сущности {@link SCUsageInput} коды связок которой нужно получить 
	   * @return лист кодов актов {@code Integer}
	   * @throws PersistenceException
	   */
	public List<Integer> getActCodesListBySCUsageInput(SCUsageInput usageInput) throws PersistenceException {
		  List<Integer> result = new ArrayList<Integer>();
		  SCUsageInputItemOZDAO uiizDao = new SCUsageInputItemOZDAO(getConnection(), getUserProfile());
		  int[] uiizCodes = uiizDao.getFilteredCodeArrayBySCUsageInput(usageInput);
		  if(uiizCodes.length == 0) return new ArrayList<Integer>();
		  Vector<Object> binded = new Vector<Object>();
		  SCUsageInputItemOZ2ENActFilter uiiz2actFilter = new SCUsageInputItemOZ2ENActFilter();
		  uiiz2actFilter.conditionSQL = String.format("%s in (%s)", SCUsageInputItemOZ2ENAct.usageInputItemOZRef_QFielld
				  , Tools.repeatSymbol("?", ",", uiizCodes.length));
		  for(int uiizCode : uiizCodes) binded.add(uiizCode);
		  List<Double> list = this.getListOfPropertyValues(SCUsageInputItemOZ2ENAct.enActRef_QFielld, uiiz2actFilter, 0, -1, binded);
		  for(Double dbl : list) result.add(dbl.intValue());
		  return result;		
	}
	
    public SCUsageInputItemOZ2ENActDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInputItemOZ2ENActDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCUsageInputItemOZ2ENActDAO

