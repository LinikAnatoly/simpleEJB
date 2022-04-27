package com.ksoe.energynet.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.lla.persistence.exception.SystemException;

public class DBConnector {

	public void checkOracleConnection(String dataSourceName) {

		String msg = "";
		Connection connection = null;

		try {

			if (dataSourceName.equals(AuthorizationJNDINames.FINMATERIAL_DATASOURCE)) {
				msg = "Нет связи с ФинКолекцией...";
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(dataSourceName);

			connection = dataSource.getConnection();

			System.out.println("##################################### check " + dataSourceName + "... oK...");

		} catch (Exception e) {
			throw new SystemException("\n\n" + msg, e);
		} finally {
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
			}
		}
	}



}
