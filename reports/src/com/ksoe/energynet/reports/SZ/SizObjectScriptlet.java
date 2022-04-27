package com.ksoe.energynet.reports.SZ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import com.ksoe.lla.security.UserProfile;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.JRScriptletException;
import net.sf.jasperreports.engine.fill.JRFillParameter;

public class SizObjectScriptlet extends JRDefaultScriptlet {

	@Override
	public void beforeReportInit() throws JRScriptletException {

		getInitSql();
		System.out.println("############################ SizObjectScriptlet... beforeReportInit...");

	}


	public boolean getInitSql() {

		PreparedStatement statement = null;

		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");

		String sql = "set join_collapse_limit = 1;";

		try {

			statement = connection.prepareStatement(sql);
			statement.executeQuery();

		} catch (SQLException e) {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException ee) {
			}
		}

		return true;
	}

}
