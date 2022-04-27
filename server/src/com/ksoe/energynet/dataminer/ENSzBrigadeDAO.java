
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENSzBrigadeDAOGen;
import com.ksoe.energynet.valueobject.ENSzBrigade;
import com.ksoe.energynet.valueobject.brief.ENSzBrigadeShort;
import com.ksoe.energynet.valueobject.lists.ENSzBrigadeShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSzBrigade;
  *
  */

public class ENSzBrigadeDAO extends ENSzBrigadeDAOGen {

	public ENSzBrigadeDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENSzBrigadeDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public ENSzBrigadeShortList getScrollableFilteredList(
			ENSzBrigade aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector aBindObjects)
			throws PersistenceException {

		ENSzBrigadeShortList result = new ENSzBrigadeShortList();
		ENSzBrigadeShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENSZBRIGADE.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT "
				+ " ENSZBRIGADE.CODE "
				+ ",ENSZBRIGADE.NAZV "
				+ ",ENSZBRIGADE.CEH_NAZV "
				+ ",ENSZBRIGADE.MAIN_PODR_NAZV "
				+ ",ENSZBRIGADE.SIZCODE "
				+ ",ENSZBRIGADE.PODRID "
				+ ",ENSZBRIGADE.CEHID "
				+ ",ENSZBRIGADE.QUANTITY "

				+ ", ENSZBRIGADE.ELEMENTCODE "

				+ ", ENSZBRIGADE.MOLCODE "
				+ ", ENSZBRIGADE.MOLNAME "

				+ ", ENSZBRIGADE.STATUSCODE " +

				" FROM ENSZBRIGADE " +

     			"";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSZBRIGADE.CODE = ?";
        }
         if (aFilterObject.nazv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nazv.indexOf('*',0) < 0 && aFilterObject.nazv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSZBRIGADE.NAZV) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSZBRIGADE.NAZV) LIKE UPPER(?)";
         }
         if (aFilterObject.ceh_nazv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ceh_nazv.indexOf('*',0) < 0 && aFilterObject.ceh_nazv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSZBRIGADE.CEH_NAZV) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSZBRIGADE.CEH_NAZV) LIKE UPPER(?)";
         }
         if (aFilterObject.main_podr_nazv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.main_podr_nazv.indexOf('*',0) < 0 && aFilterObject.main_podr_nazv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSZBRIGADE.MAIN_PODR_NAZV) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSZBRIGADE.MAIN_PODR_NAZV) LIKE UPPER(?)";
         }
        if(aFilterObject.sizCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSZBRIGADE.SIZCODE = ?";
        }
        if(aFilterObject.podrId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSZBRIGADE.PODRID = ?";
        }
        if(aFilterObject.cehId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSZBRIGADE.CEHID = ?";
        }
        if(aFilterObject.quantity != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSZBRIGADE.QUANTITY = ?";
        }
        if (aFilterObject.molCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSZBRIGADE.MOLCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSZBRIGADE.MOLCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.molName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSZBRIGADE.MOLNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSZBRIGADE.MOLNAME) LIKE UPPER(?)";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSZBRIGADE.ELEMENTCODE = ? ";
        }

      }


      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

    selectStr = selectStr + " ORDER BY " + orderBy;

    selectStr = selectStr + " OFFSET " + fromPosition;
    if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.nazv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nazv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.ceh_nazv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ceh_nazv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.main_podr_nazv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.main_podr_nazv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.sizCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.sizCode);
         }
         if(aFilterObject.podrId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.podrId);
         }
         if(aFilterObject.cehId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cehId);
         }
         if(aFilterObject.quantity != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.quantity);
         }

         if(aFilterObject.molCode != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.molCode);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }

         if(aFilterObject.molName != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.molName);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }

       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
       }
      }

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
//				if (i < fromPosition)
//					continue;
//				else if (i >= fromPosition + quantity) {
//					i++;
//					break;
//				}

				anObject = new ENSzBrigadeShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.nazv = set.getString(2);
				anObject.ceh_nazv = set.getString(3);
				anObject.main_podr_nazv = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if (set.wasNull())
					anObject.sizCode = Integer.MIN_VALUE;
				anObject.podrId = set.getInt(6);
				if (set.wasNull())
					anObject.podrId = Integer.MIN_VALUE;
				anObject.cehId = set.getInt(7);
				if (set.wasNull())
					anObject.cehId = Integer.MIN_VALUE;
				anObject.quantity = set.getInt(8);
				if (set.wasNull())
					anObject.quantity = Integer.MIN_VALUE;

				anObject.elementCode = set.getInt(9);
				if (set.wasNull())
					anObject.elementCode = Integer.MIN_VALUE;

				anObject.molCode = set.getString(10);
				anObject.molName = set.getString(11);

				anObject.statusCode = set.getInt(12);
				if (set.wasNull())
					anObject.statusCode = Integer.MIN_VALUE;


				result.list.add(anObject);
			}

			result.setTotalCount(i);

			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
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
	}


    public int getSizCode(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select bsz.sizcode from enszbrigade bsz"
                + " where bsz.elementcode = " + code;

        int sizCode = Integer.MIN_VALUE;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                sizCode = set.getInt(1);
                if (set.wasNull())
                    sizCode = Integer.MIN_VALUE;
            }

            return sizCode;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return sizCode;
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
    }

    public int getBrigadeQuantity(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select bsz.quantity from enszbrigade bsz"
                + " where bsz.elementcode = " + code;

        int quantity = Integer.MIN_VALUE;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                quantity = set.getInt(1);
                if (set.wasNull())
                    quantity = Integer.MIN_VALUE;
            }

            return quantity;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return quantity;
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
    }

    public int getSizCodeByTP(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select s.sizcode from ensubstation04 s " +
                " where s.elementcode = " + code;

        int sizCode = Integer.MIN_VALUE;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                sizCode = set.getInt(1);
                if (set.wasNull())
                    sizCode = Integer.MIN_VALUE;
            }

            return sizCode;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return sizCode;
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
    }

    public int getSizCodeByPS(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select s.sizcode from ensubstation150 s " +
                " where s.elementcode = " + code;

        int sizCode = Integer.MIN_VALUE;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                sizCode = set.getInt(1);
                if (set.wasNull())
                    sizCode = Integer.MIN_VALUE;
            }

            return sizCode;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return sizCode;
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
    }

} // end of ENSzBrigadeDAO

