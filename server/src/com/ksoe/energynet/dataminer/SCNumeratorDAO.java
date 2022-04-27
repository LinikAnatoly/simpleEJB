
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.energynet.dataminer.generated.SCNumeratorDAOGen;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for SCNumerator;
  *
  */

public class SCNumeratorDAO extends SCNumeratorDAOGen {


  public SCNumeratorDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCNumeratorDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public int getNextNumber()
  {

    Connection connection = getConnection();
      PreparedStatement preparedStatement = null;
      ResultSet resultSet = null;

      long modifyTime = System.currentTimeMillis();

      final int numberCode_ = 1;

      int out = Integer.MIN_VALUE;


      try {


          String sql = "select numberint from scnumerator where code = ?";

          synchronized(this)
          {

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, numberCode_);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                out = resultSet.getInt(1);
                out = out + 1;
            }

            resultSet.close();

            preparedStatement.close();


            sql = "update scnumerator set numberint = ? , modify_time = ? where code = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, out);
            preparedStatement.setBigDecimal(2, new BigDecimal(modifyTime));
            preparedStatement.setInt(3, numberCode_);

            preparedStatement.executeUpdate();
            preparedStatement.close();

          }

          return out;


      } catch (SQLException e) {
          throw new EnergyproSystemException(e);
      } finally {
          try {if (resultSet != null) resultSet.close();}               catch (SQLException e) {}
          try {if (preparedStatement != null) preparedStatement.close();} catch (SQLException e) {}
          if(connection != super.getConnection())
           {
            try{connection.close();} catch(SQLException e){}
           }
      }
  }

} // end of SCNumeratorDAO

