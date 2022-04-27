
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENChangePersonBytDAOGen;
import com.ksoe.energynet.valueobject.ENChangePersonByt;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.filter.ENChangePersonBytFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;

/**
 * DAO Object for ENChangePersonByt;
 *
 */

public class ENChangePersonBytDAO extends ENChangePersonBytDAOGen {

    public ENChangePersonBytDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENChangePersonBytDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * SUPP-47345 Изменение сущностей для одного плана на другой
     * 
     * Необходимо при удалении наряд-задания (тогда сущность этого плана копируется на месячный) 
     * и при создании наряд-задания (копируется опять на новое наряд-задание)
     * 
     * @param oldPlanCode
     * @param isUp для утверждения месячных планов - false - для отмены наряд-заданий - true
     * @throws PersistenceException 
     */
    public void changePlanForChangePersonByt(ENPlanWork oldPlan, boolean isUp) throws PersistenceException {
    	if(oldPlan.kind != null 
    			&& (oldPlan.kind.code == ENPlanWorkKind.CURRENT || oldPlan.kind.code == ENPlanWorkKind.NPW)) {
    		ENChangePersonBytFilter filter = new ENChangePersonBytFilter();
    		filter.planRef.code = oldPlan.code;
    		int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    		if(codes.length > 0) {
    			if(codes.length != 1) {
    				throw new EnergyproSystemException(String.format("Помилка у кількості %d", codes.length));
    			}
    			
    			if(oldPlan.kind.code == ENPlanWorkKind.CURRENT && isUp) {
    				return;
    			}
    			if(oldPlan.kind.code == ENPlanWorkKind.NPW && !isUp) {
    				return;
    			}
    			
    			int newPlanCode = Integer.MIN_VALUE;
    			ENPlanCorrectHistoryDAO corrDao = new ENPlanCorrectHistoryDAO(getConnection(), getUserProfile());
    			ENPlanCorrectHistoryFilter corrFilter = new ENPlanCorrectHistoryFilter();
    			if(isUp) {
    				corrFilter.planNewRef.code = oldPlan.code;
    				corrFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
    				ENPlanCorrectHistoryShortList corrList = corrDao.getScrollableFilteredList(corrFilter, 0, -1);
    				newPlanCode = corrList.get(0).planOldRefCode;
    			} else {
    				corrFilter.planOldRef.code = oldPlan.code;
    				corrFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
    				ENPlanCorrectHistoryShortList corrList = corrDao.getScrollableFilteredList(corrFilter, 0, -1);
    				newPlanCode = corrList.get(0).planNewRefCode;    				
    			}
    			
    			ENChangePersonByt obj = this.getObject(codes[0]);
    			obj.planRef.code = newPlanCode;
    			this.save(obj);
    		}
    		
    	}
    }

} // end of ENChangePersonBytDAO
