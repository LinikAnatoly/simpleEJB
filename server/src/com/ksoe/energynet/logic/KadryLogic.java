package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.energynet.dataminer.ENAverageCountPersonalDAO;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

public class KadryLogic extends LogicModule{



	public ENAverageCountPersonalShortList calculateAverageCountPersonal(String tabstring , String datestr   ) throws PersistenceException
	{



        ENAverageCountPersonalDAO aDAO = new ENAverageCountPersonalDAO(connection, userProfile);
		ENAverageCountPersonalShortList aList = aDAO.getGroupListAveragePersonal(tabstring , datestr);

		return aList;


     }

	// инсерт табельных во временную таблицу
	public void insertTabnInTempTable(String tabn) throws PersistenceException
	{
		PreparedStatement statement = null;
		ResultSet  set = null;
		String sql = "";


			sql = " insert into energynet.entemptabn (tabn) values (?)";

		try
		{
			statement = connection.prepareStatement(sql);
			statement.setString(1,tabn);
		    set = statement.executeQuery();
		}
	  	catch(SQLException e)
	  	 {
	  	  System.out.println(e.getMessage()+"\nstatement - " + sql);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	 }
//	    finally
//	    {
//	     try {if (set != null) set.close();}             catch (SQLException e) {}
//	     try {if (statement != null) statement.close();} catch (SQLException e) {}
//	     statement = null;
//	    }

	}



	public KadryLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }

}