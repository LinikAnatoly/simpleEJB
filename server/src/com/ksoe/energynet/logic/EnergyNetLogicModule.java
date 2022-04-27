package com.ksoe.energynet.logic;

import java.sql.Connection;

import com.ksoe.lla.persistence.GenericSessionStatelessBean;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class EnergyNetLogicModule extends GenericSessionStatelessBean {

	protected Connection connection = null;
	protected Connection finConnection = null;
	protected UserProfile userProfile = null;

	public EnergyNetLogicModule(Connection connection,
			Connection finConnection, UserProfile userProfile) {
		this.connection = connection;
		this.finConnection = finConnection;
		this.userProfile = userProfile;

		if (connection == null || userProfile == null || finConnection == null) {
			throw new SystemException("invalid arguments");
		}
	}

}
