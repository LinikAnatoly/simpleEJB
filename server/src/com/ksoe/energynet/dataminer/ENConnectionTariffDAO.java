//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENConnectionTariffDAOGen;
import com.ksoe.energynet.valueobject.ENConnectionTariff;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffShort;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.energypro.util.Tools;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENConnectionTariff;
 *
 */

public class ENConnectionTariffDAO extends ENConnectionTariffDAOGen {

    public ENConnectionTariffDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionTariffDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects, Date dateTY) throws PersistenceException {
        ENConnectionTariffShortList result = new ENConnectionTariffShortList();
        ENConnectionTariffShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (dateTY == null) {
            dateTY = new Date();
        }

        if (orderBy.length() == 0)
            orderBy = "ENCONNECTIONTARIFF.CODE desc";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
                " ENCONNECTIONTARIFF.CODE " +
                ", ENCONNECTIONTARIFF.NAME " +
                ", ENCONNECTIONTARIFF.SHORTNAME " +
                ", ENCONNECTIONTARIFF.USERGEN " +

                ", ENCONNECTIONLEVEL.CODE " +
                ", ENCONNECTIONLEVEL.NAME " +
                ", ENPOWERRELIABILITYCTGR.CODE " +
                ", enpowerreliabilityctgr.name || ' - ' || ensettletype.name " +
                ", ENCONNECTIONPOWERPOINT.CODE " +
                ", ENCONNECTIONPOWERPOINT.NAME " +
                ", ENCONNECTIONPHASITY.CODE " +
                ", ENCONNECTIONPHASITY.NAME " +
                
				", ENCONNECTIONLINETYPE.CODE " +
				", ENCONNECTIONLINETYPE.NAME " +
				", ENCONNECTIONINSTLLTNTP.CODE " +
				", ENCONNECTIONINSTLLTNTP.NAME " +
				", ENCONNECTIONLOCATIONTP.CODE " +
				", ENCONNECTIONLOCATIONTP.NAME " +
				", ENCONNECTIONTARIFFTYPE.CODE " +
				", ENCONNECTIONTARIFFTYPE.NAME " +
				", ENDEPARTMENT.CODE " +
				", ENDEPARTMENT.NAME " + 
                
                ", tt.tecode, tt.value, tt.startdate " +

                " FROM  " +
                " enconnectiontariff " +
                " LEFT JOIN ENCONNECTIONLEVEL ON (ENCONNECTIONLEVEL.CODE = ENCONNECTIONTARIFF.LEVELREFCODE)" +
                " LEFT JOIN ENPOWERRELIABILITYCTGR ON (ENPOWERRELIABILITYCTGR.CODE = ENCONNECTIONTARIFF.CATEGORYREFCODE) " +
                " LEFT JOIN ensettletype on (ensettletype.code = enpowerreliabilityctgr.settletyperefcode) " +
                " LEFT JOIN ENCONNECTIONPOWERPOINT ON (ENCONNECTIONPOWERPOINT.CODE = ENCONNECTIONTARIFF.POWERPOINTREFCODE) " + 
                " LEFT JOIN ENCONNECTIONPHASITY ON (ENCONNECTIONPHASITY.CODE = ENCONNECTIONTARIFF.PHASITYREFCODE) " +
			    " LEFT JOIN ENCONNECTIONLINETYPE on ENCONNECTIONLINETYPE.CODE = ENCONNECTIONTARIFF.LINETYPEREFCODE "+
			    " LEFT JOIN ENCONNECTIONINSTLLTNTP on ENCONNECTIONINSTLLTNTP.CODE = ENCONNECTIONTARIFF.INSTALLATIONTYPEREFCOD " +
			    " LEFT JOIN ENCONNECTIONLOCATIONTP on ENCONNECTIONLOCATIONTP.CODE = ENCONNECTIONTARIFF.LOCATIONTYPEREFCODE " +
			    " LEFT JOIN ENCONNECTIONTARIFFTYPE on ENCONNECTIONTARIFFTYPE.CODE = ENCONNECTIONTARIFF.TARIFTYPEREFCODE " +
			    " LEFT JOIN ENDEPARTMENT on (enconnectiontariff.departmentrefcode = ENDEPARTMENT.code)" +  
                
                " left join " +
                " (select enconnectiontariffentr.startdate, enconnectiontariffentr.value, " +
                "         enconnectiontariffentr.code as tecode, enconnectiontariffentr.tariffrefcode as tcode " +
                "    from (select tariffrefcode, max(startdate) as dat1 " +
                "            from enconnectiontariffentr " +
                //           where startdate <= " + Tools.convertDateTimeToSQLString(dateTY) +
                "              where (startdate <= " + Tools.convertDateTimeToSQLString(dateTY) +
                "               or startdate = (select min(startdate) from enconnectiontariffentr)) " +
                "            group by tariffrefcode) tt0 " +
                "     left join enconnectiontariffentr on tt0.tariffrefcode = enconnectiontariffentr.tariffrefcode " +
                "           and tt0.dat1 = enconnectiontariffentr.startdate) tt on enconnectiontariff.code = tt.tcode " +

                "";

    //    whereStr = " tt.value > 0";


        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENCONNECTIONTARIFF.CODE = ?";
            }
            if (aFilterObject.name != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*', 0) < 0
                        && aFilterObject.name.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENCONNECTIONTARIFF.NAME) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENCONNECTIONTARIFF.NAME) LIKE UPPER(?)";
            }
            if (aFilterObject.shortname != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.shortname.indexOf('*', 0) < 0
                        && aFilterObject.shortname.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENCONNECTIONTARIFF.SHORTNAME) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENCONNECTIONTARIFF.SHORTNAME) LIKE UPPER(?)";
            }
            if (aFilterObject.userGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*', 0) < 0
                        && aFilterObject.userGen.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENCONNECTIONTARIFF.USERGEN) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENCONNECTIONTARIFF.USERGEN) LIKE UPPER(?)";
            }
            if (aFilterObject.modify_time != Long.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENCONNECTIONTARIFF.MODIFY_TIME = ?";
            }
            if (aFilterObject.levelRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.LEVELREFCODE = ? ";
            }
            if (aFilterObject.categoryRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.CATEGORYREFCODE = ? ";
            }
            if (aFilterObject.powerPointRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "ENCONNECTIONTARIFF.POWERPOINTREFCODE = ? ";
            }
            if (aFilterObject.phasityRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.PHASITYREFCODE = ? ";
            }
            
            if (aFilterObject.lineTypeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.LINETYPEREFCODE = ? ";
            }
            
            if (aFilterObject.installationTypeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.INSTALLATIONTYPEREFCOD = ? ";
            }
            
            if (aFilterObject.locationTypeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.LOCATIONTYPEREFCODE = ? ";
            }
            
            if (aFilterObject.tarifTypeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.TARIFTYPEREFCODE = ? ";
            }
            
            if (aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENCONNECTIONTARIFF.departmentrefcode = ? ";
            }

        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE " + whereStr;

        selectStr = selectStr + " ORDER BY " + orderBy;

        selectStr = selectStr + " OFFSET " + fromPosition;
        if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }

                if (aFilterObject.name != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.name);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.shortname != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.shortname);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.userGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.userGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }
                if (aFilterObject.levelRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.levelRef.code);
                }
                if (aFilterObject.categoryRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.categoryRef.code);
                }
                if (aFilterObject.powerPointRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.powerPointRef.code);
                }
                if (aFilterObject.phasityRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.phasityRef.code);
                }
                if (aFilterObject.lineTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.lineTypeRef.code);
                }
                if (aFilterObject.installationTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.installationTypeRef.code);
                }
                if (aFilterObject.locationTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.locationTypeRef.code);
                }
                if (aFilterObject.tarifTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.tarifTypeRef.code);
                }
                if (aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.departmentRef.code);
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
//                if (i < fromPosition)
//                    continue;
//                else if (i >= fromPosition + quantity) {
//                    i++;
//                    break;
//                }

                anObject = new ENConnectionTariffShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;
                anObject.name = set.getString(2);
                anObject.shortname = set.getString(3);
                anObject.userGen = set.getString(4);

                anObject.levelRefCode = set.getInt(5);
                if (set.wasNull())
                    anObject.levelRefCode = Integer.MIN_VALUE;
                anObject.levelRefName = set.getString(6);
                anObject.categoryRefCode = set.getInt(7);
                if (set.wasNull())
                    anObject.categoryRefCode = Integer.MIN_VALUE;
                anObject.categoryRefName = set.getString(8);
                anObject.powerPointRefCode = set.getInt(9);
                if (set.wasNull())
                    anObject.powerPointRefCode = Integer.MIN_VALUE;
                anObject.powerPointRefName = set.getString(10);
                anObject.phasityRefCode = set.getInt(11);
                if (set.wasNull())
                    anObject.phasityRefCode = Integer.MIN_VALUE;
                anObject.phasityRefName = set.getString(12);
                
                anObject.lineTypeRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.lineTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.lineTypeRefName = set.getString(14);
				anObject.installationTypeRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.installationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.installationTypeRefName = set.getString(16);
				anObject.locationTypeRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.locationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.locationTypeRefName = set.getString(18);
				anObject.tarifTypeRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.tarifTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.tarifTypeRefName = set.getString(20); 
				
				anObject.departmentRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(22); 

                anObject.tariffEntryCode = set.getInt(23);
                if (set.wasNull())
                    anObject.tariffEntryCode = Integer.MIN_VALUE;
                anObject.value = set.getBigDecimal(24);
                if(anObject.value != null)
                    anObject.value = anObject.value.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                anObject.startDate = set.getDate(25);

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

} // end of ENConnectionTariffDAO

