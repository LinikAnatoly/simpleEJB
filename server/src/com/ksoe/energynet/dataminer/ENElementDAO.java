//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Fri Sep 18 11:06:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENElementDAOGen;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.valueobject.ENAccess2Enelement;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.energynet.valueobject.filter.ENAccess2EnelementFilter;
import com.ksoe.energynet.valueobject.lists.ENElementShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENElement;
 *
 */

public class ENElementDAO extends ENElementDAOGen {

    public ENElementDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElementDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    @Override
	public ENElement getObject(int uid) throws PersistenceException {
        return getObject(uid, true);
    }

    @Override
	public com.ksoe.energynet.valueobject.references.ENElementRef getRef(int anObjectCode) throws PersistenceException
    {
     com.ksoe.energynet.valueobject.references.ENElementRef ref = new com.ksoe.energynet.valueobject.references.ENElementRef();
     if(getObject(anObjectCode, false) != null)
      ref.code = anObjectCode;
     else
      ref.code = Integer.MIN_VALUE;
     return ref;
    }

    public ENElement getObject(int uid, boolean isSegregation)
            throws PersistenceException {
        ENElement result = new ENElement();
        result.code = uid;
        loadObject(result, isSegregation);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    @Override
	public void loadObject(ENElement anObject) throws PersistenceException {
        loadObject(anObject, true);
    }

    public void loadObject(ENElement anObject, boolean isSegregation)
            throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT  ENELEMENT.CODE, ENELEMENT.ORDERFIELD, ENELEMENT.DOMAIN_INFO, ENELEMENT.MODIFY_TIME, ENELEMENT.TYPEREFCODE, ENELEMENT.ELEMENTINREFCODE, ENELEMENT.ELEMENTOUTREFCODE, ENELEMENT.RENREFCODE, ENELEMENT.FINEXECUTORCODE, ENELEMENT.GEODEPARTMENTREFCODE "
				+" FROM ENELEMENT WHERE ENELEMENT.CODE = ?";

        if (isSegregation) {
            SegregationInfo segregationInfo = new SegregationProcessor()
                    .getSegregationInfoForDataAccess(ENElement.class.getName(),
                            DataAccessType.READ, getUserProfile()
                                    .getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied())
                throw new PersistenceException(
                        "{%ENElement.getObject%} access denied");

            String segregationWhereStr = SegregationQueryBuilder.addWhere(
                    "ENELEMENT", segregationInfo, getUserProfile()
                            .getDomainInfo());
            if (segregationWhereStr.length() > 0)
                selectStr = selectStr + " AND " + segregationWhereStr;
        }

        try {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1, anObject.code);
            set = statement.executeQuery();
            if (!set.next())
                anObject.code = Integer.MIN_VALUE;
            else {
                anObject.code = set.getInt(1);
                anObject.orderField = set.getBigDecimal(2);
                if (anObject.orderField != null)
                    anObject.orderField = anObject.orderField.setScale(5,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.domain_info = set.getString(3);
                anObject.modify_time = set.getLong(4);
                if (set.wasNull())
                    anObject.modify_time = Long.MIN_VALUE;
                anObject.typeRef.code = set.getInt(5);
                if (set.wasNull())
                    anObject.typeRef.code = Integer.MIN_VALUE;
                anObject.elementInRef.code = set.getInt(6);
                if (set.wasNull())
                    anObject.elementInRef.code = Integer.MIN_VALUE;
                anObject.elementOutRef.code = set.getInt(7);
                if (set.wasNull())
                    anObject.elementOutRef.code = Integer.MIN_VALUE;
                anObject.renRef.code = set.getInt(8);
                if (set.wasNull())
                    anObject.renRef.code = Integer.MIN_VALUE;
				anObject.finExecutor.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.finExecutor.code = Integer.MIN_VALUE;
				}
				anObject.geoDepartmentRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.geoDepartmentRef.code = Integer.MIN_VALUE;
				}

                if (anObject.typeRef.code != Integer.MIN_VALUE) {
                    anObject.setTypeRef(new com.ksoe.energynet.dataminer.generated.ENElementTypeDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.typeRef.code));
                }
                if (anObject.elementInRef.code != Integer.MIN_VALUE) {
                    anObject.setElementInRef(new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.elementInRef.code));
                }
                if (anObject.elementOutRef.code != Integer.MIN_VALUE) {
                    anObject.setElementOutRef(new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.elementOutRef.code));
                }
                if (anObject.renRef.code != Integer.MIN_VALUE) {
                    anObject.setRenRef(new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.renRef.code));
                }
				if(anObject.finExecutor.code != Integer.MIN_VALUE) {
					anObject.setFinExecutor(
						new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).getObject(anObject.finExecutor.code));
				}
                if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE) {
                    anObject.setGeoDepartmentRef(new com.ksoe.energynet.dataminer.generated.ENGeographicDepartmentDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.geoDepartmentRef.code));
                }
            }
        } catch (SQLException e) {
        	System.out.println("#####################  plan.elementRef.code + " + anObject.code);
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
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

    @Override
	public ENElementShortList getScrollableFilteredList(
            ENElement aFilterObject, String anCondition, String anOrderBy,
            int fromPosition, int quantity, Vector aBindObjects)
            throws PersistenceException {
        ENElementShortList result = new ENElementShortList();
        ENElementShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "ENELEMENT.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT ENELEMENT.CODE, "
                + " ENELEMENTTYPE.CODE, "
                + " ENELEMENTTYPE.NAME, "
                + " ENELEMENT.ELEMENTINREFCODE, "
                + " ENELEMENT.ELEMENTOUTREFCODE, "
                +
                // этот кейс заложен в логике при листании датасета ...
                // и теперь уехал во вьюху ;)
                /*
                * " ( case ENELEMENT.TYPEREFCODE when 1 then (select '(ПЛ 6-10) '||name from enline10 where elementcode = enelement.code ) "
                * +
                * " when 3 then (select '(ПC 6-10/0.4) '||name  from ensubstation04 where elementcode= enelement.code )"
                * +
                * " when 2 then (select '(ПЛ 0.4) '||name from enline04 where elementcode = enelement.code ) "
                * +
                * " when 5 then (select '(ПЛ 150-35) '||name from enline150 where elementcode = enelement.code ) "
                * +
                * " when 6 then (select '(ПС 150-35) '||name from ensubstation150 where elementcode = enelement.code ) "
                * + " end " + ")
                */
                  " null as objname "
                + ", EPREN.CODE, EPREN.NAME "
                + ", ENELEMENTDATA.ENAME "
                + ", ENELEMENTDATA.INVNUMBER "
                + ", ENELEMENTDATA.BUHNAME "
                + ", gd.code "
                + ", gd.name "
                + " FROM ENELEMENT "
                + "      left join ENELEMENTDATA on ENELEMENT.CODE = ENELEMENTDATA.ECODE"
                + "      left join engeographicdepartment gd on enelement.geodepartmentrefcode = gd.code, "
                + "      ENELEMENTTYPE, EPREN "
                +

                // " WHERE "
                "";
        whereStr = " ENELEMENTTYPE.CODE = ENELEMENT.TYPEREFCODE"; // +
        whereStr = whereStr + " AND ENELEMENT.RENREFCODE = EPREN.CODE ";
        // whereStr = whereStr + " AND ENELEMENT.CODE = ENELEMENTDATA.ECODE ";

        // только нужные ЕлементТИПЫ !!!
        // зайдем с другой стороны .... ИСКЛЮЧИМ ненужные !!!
        // whereStr = whereStr +
        // " AND ENELEMENT.TYPEREFCODE IN (1,2,3,5,6,7,8,9,10,11, 12, 13, 14, 15, 16, 17, 18) "
        // ;
        whereStr = whereStr + " AND ENELEMENT.TYPEREFCODE NOT IN (4) ";

        // whereStr = whereStr +" AND el1.code = ENELEMENT.ELEMENTINREFCODE" ;
        // //+
        // whereStr = whereStr +" AND el2.code = ENELEMENT.ELEMENTOUTREFCODE" ;
        // //+

        // selectStr = selectStr +
        // " ${s} ENELEMENT.CODE IN ( SELECT ENELEMENT.CODE FROM ENELEMENT ";

        // " ";
        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENELEMENT.CODE = ?";
            }
            if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENELEMENT.TYPEREFCODE = ? ";
            }
            if (aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENELEMENT.ELEMENTINREFCODE = ? ";
            }
            if (aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENELEMENT.ELEMENTOUTREFCODE = ? ";
            }
            if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENELEMENT.RENREFCODE = ? ";
            }

            if (aFilterObject.invNumber != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.invNumber.indexOf('*', 0) < 0
                        && aFilterObject.invNumber.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENELEMENTDATA.INVNUMBER) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENELEMENTDATA.INVNUMBER) LIKE UPPER(?)";
            }
            if (aFilterObject.name != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*', 0) < 0
                        && aFilterObject.name.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENELEMENTDATA.ENAME) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENELEMENTDATA.ENAME) LIKE UPPER(?)";
            }
            if (aFilterObject.buhName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.buhName.indexOf('*', 0) < 0
                        && aFilterObject.buhName.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENELEMENTDATA.BUHNAME) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENELEMENTDATA.BUHNAME) LIKE UPPER(?)";
            }

        }

        SegregationInfo segregationInfo = new SegregationProcessor()
                .getSegregationInfoForDataAccess(ENElement.class.getName(),
                        DataAccessType.READ_LIST, getUserProfile()
                                .getDomainInfo().getDomain());
        if (segregationInfo.isAccessDenied())
            throw new PersistenceException(
                    "{%ENElement.getList%} access denied");

        String domainWhereStr = SegregationQueryBuilder.addWhere("ENELEMENT",
                segregationInfo, getUserProfile().getDomainInfo());

        if (domainWhereStr.length() != 0) {
            // domainWhereStr = "  AND ENELEMENT.DOMAIN_INFO IS NOT NULL";
            // else
            if (whereStr.length() == 0)
                whereStr = domainWhereStr;
            else
                whereStr = " " + whereStr + " AND " + domainWhereStr;
        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
        // + " WHERE" + сделано выше ????
        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

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
                if (aFilterObject.orderField != null) {
                    number++;
                    aFilterObject.orderField = aFilterObject.orderField
                            .setScale(5, java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number, aFilterObject.orderField);
                }
                if (aFilterObject.domain_info != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.domain_info.indexOf('*', 0) < 0
                            && aFilterObject.domain_info.indexOf('?', 0) < 0)
                        whereStr = whereStr + " ENELEMENT.DOMAIN_INFO = ?";
                    else
                        whereStr = whereStr + " ENELEMENT.DOMAIN_INFO LIKE ?";

                    if (aFilterObject.domain_info != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.domain_info);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                    if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                        number++;
                        statement.setInt(number, aFilterObject.renRef.code);
                    }
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
                if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.typeRef.code);
                }
                if (aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.elementInRef.code);
                }
                if (aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.elementOutRef.code);
                }
                if (aFilterObject.renRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.renRef.code);
                }

                if (aFilterObject.invNumber != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.invNumber);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
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
                if (aFilterObject.buhName != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.buhName);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
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
                }*/

                anObject = new ENElementShort();

                anObject.code = set.getInt(1);

                anObject.typeRefCode = set.getInt(2);

                anObject.typeRefName = set.getString(3);

                anObject.elementInRefCode = set.getInt(4);

                anObject.elementOutRefCode = set.getInt(5);

                // anObject.objectName = set.getString(6);
                // String arr[] = elementLogic.getNameByCode(anObject.code,
                // anObject.typeRefCode);
                // anObject.objectName = arr[0] ;
                // anObject.objectInvNumber = arr[1];

                anObject.renRefCode = set.getInt(7);
                anObject.renRefName = set.getString(8);

                anObject.objectName = set.getString(9);
                anObject.objectInvNumber = set.getString(10);

                anObject.objectBuhName = set.getString(11);

                anObject.geoDepartmentRefCode = set.getInt(12);
				if (set.wasNull()) {
					anObject.geoDepartmentRefCode = Integer.MIN_VALUE;
				}
                anObject.geoDepartmentRefName = set.getString(13);

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

    @Override
	public int add(ENElement anObject) throws PersistenceException {

        int codeEnElement = super.add(anObject, true);

        // вставка в таблицу для доступа (все кроме быт пром )
        if (anObject.typeRef.code != ENElementType.TY_BYT
                && anObject.typeRef.code != ENElementType.TY_PROM) {
            ENAccess2EnelementDAO a2eDAO = new ENAccess2EnelementDAO(
                    super.getConnection(), super.getUserProfile());
            ENAccess2Enelement a2eObj = new ENAccess2Enelement();
            a2eObj.elementRef.code = codeEnElement;
            a2eObj.isAccess = Integer.MIN_VALUE;
            a2eDAO.add(a2eObj);
        }

        return codeEnElement;
    }

    @Override
	public void remove(int uid) throws PersistenceException {
        // удаление елемента по коду из таблицы доступа
        ENAccess2EnelementDAO a2eDAO = new ENAccess2EnelementDAO(
                super.getConnection(), super.getUserProfile());
        ENAccess2EnelementFilter a2eFilter = new ENAccess2EnelementFilter();
        a2eFilter.elementRef.code = uid;
        int[] a2eArr = a2eDAO.getFilteredCodeArray(a2eFilter, 0, -1);
        if (a2eArr.length != 0) {
            a2eDAO.remove(a2eArr[0]);
        }

        super.remove(uid);
    }
    
    /* колонка с названиями объектов и колонка с кодами объектов по набору естимейтов - для плана закупок */
	public ENElementShortList getGroupListObjectsByEstimteitemCodesStr(String enestimateitemString )
            throws PersistenceException {
        ENElementShortList result = new ENElementShortList();
        ENElementShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
       
        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = " 	         \n" +
        		" select string_agg(ecode,',') as ecodes ,string_agg(object,' ;') as objects      \n" +
        		"    from ( \n" +
        		"    select distinct eld.ecode::text as ecode , coalesce(eld.ename,'') || ' инв№ ' ||coalesce(eld.invnumber,'') as object \n" +
        		"    from enestimateitem ei , enplanwork p , enelementdata eld \n" +
        		"    where ei.planrefcode = p.code  \n" +
        		"    and p.elementrefcode = eld.ecode \n" +
        		"    and ei.code  = any((select distinct array2items(string_to_array( \n" +
        		"    '"+ enestimateitemString +"' \n" +
        		"    ,','))::double precision)) \n" +
        		"    ) as sel1 \n" +
        		"  \n" ;

    try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
           

         
            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
               

                anObject = new ENElementShort();

                anObject.objectInvNumber = set.getString(1); // коды 
                anObject.objectName = set.getString(2); // наименования 
                

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


    
    

} // end of ENElementDAO

