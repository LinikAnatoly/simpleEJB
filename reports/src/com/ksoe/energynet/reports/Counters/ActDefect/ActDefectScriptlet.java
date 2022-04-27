package com.ksoe.energynet.reports.Counters.ActDefect;


import java.sql.Connection;
import java.util.HashMap;

import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.fill.JRFillParameter;
import com.ksoe.energynet.dataminer.SCLogicDAO;


public class ActDefectScriptlet extends JRDefaultScriptlet {

	private SCLogicDAO logicDao = null;

	public String getLastAccount(String invNumber) {
		try {
			if(logicDao == null) {
				JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
				Connection finConnection = (Connection) ((HashMap) jrParameterMap.getValue()).get("finConnection");
				UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");
				logicDao = new SCLogicDAO(finConnection, userProfile);
			}
			return logicDao.getLastAccount(invNumber);			
		} catch(Exception e) {
			throw new SystemException(e);
		}


	}

}

