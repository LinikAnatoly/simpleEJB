//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.FINExecutor2PlanDAOGen;
import com.ksoe.energynet.valueobject.FINExecutor2Plan;
import com.ksoe.energynet.valueobject.brief.FINExecutor2PlanShort;
import com.ksoe.energynet.valueobject.lists.FINExecutor2PlanShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINExecutor2Plan;
 *
 */

public class FINExecutor2PlanDAO extends FINExecutor2PlanDAOGen {

    public FINExecutor2PlanDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINExecutor2PlanDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(FINExecutor2Plan anObject) throws PersistenceException {
        anObject.dateEdit = new Date();
        anObject.userGen = getUserProfile().userName;
        return super.add(anObject);
    }

    public void save(FINExecutor2Plan anObject) throws PersistenceException {
        anObject.dateEdit = new Date();
        anObject.userGen = getUserProfile().userName;
        super.save(anObject);
    }



    public FINExecutor2PlanShortList getScrollableFilteredList(
            FINExecutor2Plan aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) throws PersistenceException {
        FINExecutor2PlanShortList result = new FINExecutor2PlanShortList();
        FINExecutor2PlanShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE, FINEXECUTOR2PLAN.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
                "FINEXECUTOR2PLAN.CODE"+
                ",FINEXECUTOR2PLAN.PERCENTLOAD"+
                ",FINEXECUTOR2PLAN.DATESTART"+
                ",FINEXECUTOR2PLAN.DATEFINAL"+
                ",FINEXECUTOR2PLAN.TOTALTIMEHOURS"+
                ",FINEXECUTOR2PLAN.TOTALTIMEDAYS"+
                ",FINEXECUTOR2PLAN.USERGEN"+
                ",FINEXECUTOR2PLAN.DATEEDIT"+

                ", FINEXECUTORTYPE.CODE " +
                ", FINEXECUTORTYPE.NAME " +
                ", ENPLANWORK.CODE " +
                ", ENPLANWORK.DATEGEN " +
                ", ENPLANWORK.DATESTART " +
                ", ENPLANWORK.DATEFINAL " +
                ", ENPLANWORK.YEARGEN " +
                ", ENPLANWORK.MONTHGEN " +
                ", ENPLANWORK.YEARORIGINAL " +
                ", ENPLANWORK.MONTHORIGINAL " +
                ", ENPLANWORK.USERGEN " +
                ", ENPLANWORK.DATEEDIT " +
                ", ENPLANWORK.WORKORDERNUMBER " +
                ", ENPLANWORK.DATEWORKORDER " +
                ", ENPLANWORK.PRICONNECTIONNUMBER " +
                ", ENPLANWORK.DATEENDPRICONNECTION " +
                ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
                ", ENPLANWORK.SERVICESFSIDEFINID " +
                ", ENPLANWORK.SERVICESFSIDECNNUM " +
                ", ENPLANWORK.TOTALTIMEHOURS " +
                ", ENPLANWORK.TOTALTIMEDAYS " +
                ", FINEXECUTOR.CODE " +
                ", FINEXECUTOR.NAME " +
                ", FINEXECUTOR.FINCODE " +
                ", FINEXECUTOR.FINTYPENAME " +
                ", FINEXECUTOR.FINTYPECODE " +
                ", FINEXECUTOR.FINKINDNAME " +
                ", FINEXECUTOR.FINKINDCODE " +
                ", FINEXECUTOR.FINCEHNAME " +
                ", FINEXECUTOR.FINCEHCODE " +

                ", FINEXECUTOR2PLAN.TOTALTIMEMANHOURS "+
                ", FINEXECUTOR2PLAN.DELIVERYTIME "+

			    ", ENDEPARTMENT.CODE " +
			    ", ENDEPARTMENT.SHORTNAME " +
			    ", ENDEPARTMENT.DATESTART " +
			    ", ENDEPARTMENT.DATEFINAL " +
			    ", ENDEPARTMENT.RENCODE " +
			    ", ENDEPARTMENT.SHPZBALANS " +
			    ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			    ", ENDEPARTMENT.KAU_1884 " +
			    ", ENDEPARTMENT.NAME_1884 " +

		      	", FINEXECUTOR.AXORGID " +
		      	", FINEXECUTOR.AXPARENTORGID " +
		      	", FINEXECUTOR.AXPARENTORGNAME " +
		      	", FINEXECUTOR.AXORGTYPEID " +
		      	", FINEXECUTOR.AXORGTYPENAME " +
      
                " FROM FINEXECUTOR2PLAN " +
                ", FINEXECUTORTYPE " +
                ", ENPLANWORK " +
                ", FINEXECUTOR " +
                ", ENDEPARTMENT " +
                "";

        whereStr = " FINEXECUTORTYPE.CODE = FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE"; // +
        whereStr = whereStr + " AND ENPLANWORK.CODE = FINEXECUTOR2PLAN.PLANREFCODE"; // +
        whereStr = whereStr + " AND FINEXECUTOR.CODE = FINEXECUTOR2PLAN.FINEXECUTORCODE"; // +
        whereStr = whereStr +" AND ENDEPARTMENT.CODE = FINEXECUTOR2PLAN.BUDGETREFCODE"; //+

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.CODE = ?";
            }
            if (aFilterObject.percentLoad != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.PERCENTLOAD = ?";
            }
            if (aFilterObject.dateStart != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.DATESTART = ?";
            }
            if (aFilterObject.dateFinal != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEFINAL = ?";
            }
            if (aFilterObject.totalTimeHours != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEHOURS = ?";
            }
            if (aFilterObject.totalTimeDays != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEDAYS = ?";
            }
            if (aFilterObject.userGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*', 0) < 0
                        && aFilterObject.userGen.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(FINEXECUTOR2PLAN.USERGEN) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(FINEXECUTOR2PLAN.USERGEN) LIKE UPPER(?)";
            }
            if (aFilterObject.dateEdit != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEEDIT = ?";
            }
            if (aFilterObject.modify_time != Long.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.MODIFY_TIME = ?";
            }
            if (aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE = ? ";
            }
            if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINEXECUTOR2PLAN.PLANREFCODE = ? ";
            }
            if (aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "FINEXECUTOR2PLAN.FINEXECUTORCODE = ? ";
            }

            if(aFilterObject.totalTimeManHours != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEMANHOURS = ?";
            }
            if(aFilterObject.deliveryTime != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR2PLAN.DELIVERYTIME = ?";
            }

            if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "FINEXECUTOR2PLAN.BUDGETREFCODE = ? ";
            }
        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
        // + " WHERE" + сделано выше ????
        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE " + whereStr;

        // selectStr = selectStr + ") ";

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
                if (aFilterObject.percentLoad != null) {
                    number++;
                    aFilterObject.percentLoad = aFilterObject.percentLoad
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number, aFilterObject.percentLoad);
                }
                if (aFilterObject.dateStart != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateStart.getTime()));
                }
                if (aFilterObject.dateFinal != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateFinal.getTime()));
                }
                if (aFilterObject.totalTimeHours != null) {
                    number++;
                    aFilterObject.totalTimeHours = aFilterObject.totalTimeHours
                            .setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,
                            aFilterObject.totalTimeHours);
                }
                if (aFilterObject.totalTimeDays != null) {
                    number++;
                    aFilterObject.totalTimeDays = aFilterObject.totalTimeDays
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                    statement
                            .setBigDecimal(number, aFilterObject.totalTimeDays);
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
                if (aFilterObject.dateEdit != null) {
                    number++;
                    statement.setTimestamp(number, new java.sql.Timestamp(
                            aFilterObject.dateEdit.getTime()));
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
                if (aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,
                            aFilterObject.finExecutorTypeRef.code);
                }
                if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.planRef.code);
                }
                if (aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finExecutor.code);
                }
                if(aFilterObject.totalTimeManHours != null){
                    number++;
                    aFilterObject.totalTimeManHours = aFilterObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,aFilterObject.totalTimeManHours);
                }
                if(aFilterObject.deliveryTime != null){
                    number++;
                    aFilterObject.deliveryTime = aFilterObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,aFilterObject.deliveryTime);
                }

                if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,aFilterObject.budgetRef.code);
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                /*
                if (i < fromPosition)
                  continue;
                else if (i >= fromPosition + quantity) {
                  i++;
                  break;
                } */

                anObject = new FINExecutor2PlanShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;
                anObject.percentLoad = set.getBigDecimal(2);
                if (anObject.percentLoad != null)
                    anObject.percentLoad = anObject.percentLoad.setScale(3,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.dateStart = set.getDate(3);
                anObject.dateFinal = set.getDate(4);
                anObject.totalTimeHours = set.getBigDecimal(5);
                if (anObject.totalTimeHours != null)
                    anObject.totalTimeHours = anObject.totalTimeHours.setScale(
                            2, java.math.BigDecimal.ROUND_HALF_UP);
                anObject.totalTimeDays = set.getBigDecimal(6);
                if (anObject.totalTimeDays != null)
                    anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.userGen = set.getString(7);
                anObject.dateEdit = set.getTimestamp(8);

                anObject.finExecutorTypeRefCode = set.getInt(9);
                if (set.wasNull())
                    anObject.finExecutorTypeRefCode = Integer.MIN_VALUE;
                anObject.finExecutorTypeRefName = set.getString(10);
                anObject.planRefCode = set.getInt(11);
                if (set.wasNull())
                    anObject.planRefCode = Integer.MIN_VALUE;
                anObject.planRefDateGen = set.getDate(12);
                anObject.planRefDateStart = set.getDate(13);
                anObject.planRefDateFinal = set.getDate(14);
                anObject.planRefYearGen = set.getInt(15);
                if (set.wasNull())
                    anObject.planRefYearGen = Integer.MIN_VALUE;
                anObject.planRefMonthGen = set.getInt(16);
                if (set.wasNull())
                    anObject.planRefMonthGen = Integer.MIN_VALUE;
                anObject.planRefYearOriginal = set.getInt(17);
                if (set.wasNull())
                    anObject.planRefYearOriginal = Integer.MIN_VALUE;
                anObject.planRefMonthOriginal = set.getInt(18);
                if (set.wasNull())
                    anObject.planRefMonthOriginal = Integer.MIN_VALUE;
                anObject.planRefUserGen = set.getString(19);
                anObject.planRefDateEdit = set.getDate(20);
                anObject.planRefWorkOrderNumber = set.getString(21);
                anObject.planRefDateWorkOrder = set.getDate(22);
                anObject.planRefPriConnectionNumber = set.getString(23);
                anObject.planRefDateEndPriConnection = set.getDate(24);
                anObject.planRefInvestWorksDescription = set.getString(25);
                anObject.planRefServicesFSideFinId = set.getInt(26);
                if (set.wasNull())
                    anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
                anObject.planRefServicesFSideCnNum = set.getString(27);
                anObject.planRefTotalTimeHours = set.getBigDecimal(28);
                if (anObject.planRefTotalTimeHours != null)
                    anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours
                            .setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
                anObject.planRefTotalTimeDays = set.getBigDecimal(29);
                if (anObject.planRefTotalTimeDays != null)
                    anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                anObject.finExecutorCode = set.getInt(30);
                if (set.wasNull())
                    anObject.finExecutorCode = Integer.MIN_VALUE;
                anObject.finExecutorName = set.getString(31);
                anObject.finExecutorFinCode = set.getInt(32);
                if (set.wasNull())
                    anObject.finExecutorFinCode = Integer.MIN_VALUE;
                anObject.finExecutorFinTypeName = set.getString(33);
                anObject.finExecutorFinTypeCode = set.getInt(34);
                if (set.wasNull())
                    anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;
                anObject.finExecutorFinKindName = set.getString(35);
                anObject.finExecutorFinKindCode = set.getInt(36);
                if (set.wasNull())
                    anObject.finExecutorFinKindCode = Integer.MIN_VALUE;
                anObject.finExecutorFinCehName = set.getString(37);
                anObject.finExecutorFinCehCode = set.getInt(38);
                if (set.wasNull())
                    anObject.finExecutorFinCehCode = Integer.MIN_VALUE;

                anObject.totalTimeManHours = set.getBigDecimal(39);
                if(anObject.totalTimeManHours != null)
                    anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                anObject.deliveryTime = set.getBigDecimal(40);
                if(anObject.deliveryTime != null)
                    anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

				anObject.budgetRefCode = set.getInt(41);
				if (set.wasNull())
					anObject.budgetRefCode = Integer.MIN_VALUE;
				anObject.budgetRefShortName = set.getString(42);
				anObject.budgetRefDateStart = set.getDate(43);
				anObject.budgetRefDateFinal = set.getDate(44);
				anObject.budgetRefRenCode = set.getInt(45);
				if (set.wasNull())
					anObject.budgetRefRenCode = Integer.MIN_VALUE;
				anObject.budgetRefShpzBalans = set.getString(46);
				anObject.budgetRefKau_table_id_1884 = set.getInt(47);
				if (set.wasNull())
					anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
				anObject.budgetRefKau_1884 = set.getString(48);
				anObject.budgetRefName_1884 = set.getString(49);

		        anObject.finExecutorAxOrgId = set.getString(50);
		        anObject.finExecutorAxParentOrgId = set.getString(51);
		        anObject.finExecutorAxParentOrgName = set.getString(52);
		        anObject.finExecutorAxOrgTypeId = set.getInt(53);
		        if(set.wasNull())
		        	anObject.finExecutorAxOrgTypeId = Integer.MIN_VALUE;
		        anObject.finExecutorAxOrgTypeName = set.getString(54);
		        
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


    //public void updatePercentLoad(FINExecutor2Plan anObject) throws PersistenceException
    public void updatePercentLoad(int objectCode, BigDecimal percentLoad) throws PersistenceException
    {
        Connection connection = getConnection();

        String updPercentLoad =
            " UPDATE FINEXECUTOR2PLAN SET PERCENTLOAD = ? " +
            " WHERE CODE = ? ";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updPercentLoad);

            if (percentLoad != null)
                percentLoad = percentLoad.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(1, percentLoad);

            statement.setInt(2, objectCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updPercentLoad + "\n finExecutor2Plan.code = " + objectCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void updateTimes(FINExecutor2Plan anObject) throws PersistenceException
    {
        Connection connection = getConnection();

        String updString =
            " UPDATE FINEXECUTOR2PLAN SET DATEFINAL = ? , TOTALTIMEHOURS = ? , TOTALTIMEDAYS = ? , TOTALTIMEMANHOURS = ? , DELIVERYTIME = ? , DATESTART = ?  " +
            " WHERE CODE = ? ";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updString);

            if (anObject.dateFinal == null)
            statement.setDate(1,null);
            else
            statement.setDate(1,new java.sql.Date(anObject.dateFinal.getTime()));

            if (anObject.totalTimeHours != null)
            anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(2,anObject.totalTimeHours);

            if (anObject.totalTimeDays != null)
            anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(3,anObject.totalTimeDays);

            if (anObject.totalTimeManHours != null)
            anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(4,anObject.totalTimeManHours);

            if (anObject.deliveryTime != null)
            anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(5,anObject.deliveryTime);
            
            if (anObject.dateStart == null)
                statement.setDate(6,null);
                else
                statement.setDate(6,new java.sql.Date(anObject.dateStart.getTime()));

            statement.setInt(7, anObject.code);
            
            

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updString + "\n finExecutor2Plan.code = " + anObject.code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public void remove(int code) throws PersistenceException {
        super.remove(code);
    }

} // end of FINExecutor2PlanDAO
