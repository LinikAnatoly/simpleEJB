//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.energynet.dataminer.generated.CNRen2ENDepartmentDAOGen;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for CNRen2ENDepartment;
 *
 */

public class CNRen2ENDepartmentDAO extends CNRen2ENDepartmentDAOGen {

    public CNRen2ENDepartmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public CNRen2ENDepartmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int getDepartmentCode(int id_ren) throws PersistenceException {

        int departnmentCode = Integer.MIN_VALUE;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = "select c.departmentrefcode from cnren2endepartment c where c.cnrencode = " + id_ren;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                departnmentCode = set.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
        return departnmentCode;
    }

} // end of CNRen2ENDepartmentDAO

