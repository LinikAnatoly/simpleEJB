
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.dataminer.User2StaffingDAO;
import com.ksoe.authorization.dataminer.UserDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.User;
import com.ksoe.authorization.valueobject.User2Staffing;
import com.ksoe.authorization.valueobject.filter.User2StaffingFilter;
import com.ksoe.authorization.valueobject.lists.User2StaffingShortList;
import com.ksoe.energynet.dataminer.FINExecutorDAO.InfoUpdFinExecutor;
import com.ksoe.energynet.dataminer.FINWorkerDAO.InfoUpdHumenItem;
import com.ksoe.energynet.dataminer.generated.ENSizObjectDAOGen;
import com.ksoe.energynet.ejb.ENPlanWorkController;
import com.ksoe.energynet.ejb.ENPlanWorkControllerHome;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.brief.ENSizObjectShort;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.filter.ENContractFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENContractShortList;
import com.ksoe.energynet.valueobject.lists.ENSizObjectShortList;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSizObject;
  *
  */

public class ENSizObjectDAO extends ENSizObjectDAOGen {


	public ENSizObjectDAO() {
		super();
	}

	public ENSizObjectDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENSizObjectDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public ENSizObjectShortList getScrollableFilteredList(ENSizObject aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENSizObjectShortList result = new ENSizObjectShortList();
		ENSizObjectShort anObject;
		result.list = new Vector<ENSizObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0) {
			orderBy = "ENSIZOBJECT.CODE";
		}

		if (quantity < 0) {
			quantity = Integer.MAX_VALUE / 2;
		}

		if (getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSIZOBJECT.CODE"+
			",ENSIZOBJECT.TABNUMBER"+
			",ENSIZOBJECT.PROFESION"+
			",ENSIZOBJECT.FIO"+
			",ENSIZOBJECT.SIZCODE"+
			",ENSIZOBJECT.STATUSCODE"+
			",ENSIZOBJECT.GENDER"+
			",ENSIZOBJECT.GROWTH"+
			",ENSIZOBJECT.SIZECLOTHING"+
			",ENSIZOBJECT.SIZESHOES"+
			",ENSIZOBJECT.SIZEHEAD"+
			", ENELEMENT.CODE " +
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +

		    ", (select p.name from enelement e, epren p " +
		    "    where e.renrefcode = p.code " +
		    "   and e.code = ensizobject.elementcode) as renName " +

		" FROM ENSIZOBJECT " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSIZOBJECT.ELEMENTCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENSIZOBJECT.DEPARTMENTREFCODE "+
		"";


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;

		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENSizObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.tabNumber = set.getString(2);
				anObject.profesion = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.sizCode = Integer.MIN_VALUE;
				}
				anObject.statusCode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.gender = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.gender = Integer.MIN_VALUE;
				}
				anObject.growth = set.getBigDecimal(8);
				if(anObject.growth != null) {
					anObject.growth = anObject.growth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeClothing = set.getBigDecimal(9);
				if(anObject.sizeClothing != null) {
					anObject.sizeClothing = anObject.sizeClothing.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeShoes = set.getBigDecimal(10);
				if(anObject.sizeShoes != null) {
					anObject.sizeShoes = anObject.sizeShoes.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeHead = set.getBigDecimal(11);
				if(anObject.sizeHead != null) {
					anObject.sizeHead = anObject.sizeHead.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.elementCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(14);
				anObject.departmentRefDateStart = set.getDate(15);
				anObject.departmentRefDateFinal = set.getDate(16);
				anObject.departmentRefRenCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(18);
				anObject.departmentRefKau_table_id_1884 = set.getInt(19);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(20);
				anObject.departmentRefName_1884 = set.getString(21);
				anObject.departmentRefHrmorganizationid = set.getString(22);

				anObject.renName = set.getString(23);


				result.list.add(anObject);
			}


			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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

        String SQL = " select siz.sizcode from ensizobject siz" +
                " where siz.elementcode = " + code ;

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

    public int getSizObjectCode(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select siz.code from ensizobject siz" +
                " where siz.elementcode = " + code ;

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


    public String getInvNumberSizObject(int code) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select siz.tabnumber from ensizobject siz" +
                " where siz.elementcode = " + code;

        String invNumber = "";

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                invNumber = set.getString(1);
            }

            return invNumber;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return invNumber;
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

    private transient java.sql.Connection connection = null;

    protected java.sql.Connection getConnection(String dataSourceName)
            throws DatasourceConnectException {
        try {
            InitialContext initialContext = new InitialContext();
            DataSource dataSource = (DataSource) initialContext
                    .lookup(dataSourceName);
            connection = dataSource.getConnection();
            return connection;
        } catch (NamingException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        } catch (SQLException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        }
    }

    public class DomainInfo {
        public String domainName;
        public int minCodeValue;
        public int maxCodeValue;
    }



    public DomainInfo getDomainInfo(String userName)
            throws PersistenceException, DatasourceConnectException {

        Connection connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);

        PreparedStatement statement = null;
        DomainInfo info = null;

        try {
            String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
                    + " from auth_domain d"
                    + " where d.name = (select user_domain"
                    + " from auth_user"
                    + " where user_name = " + "'" + userName + "')";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                info = new DomainInfo();
                info.domainName = resultSet.getString(1);
                info.minCodeValue = resultSet.getInt(2);
                info.maxCodeValue = resultSet.getInt(3);
            }
            resultSet.close();

            return info;
        } catch (SQLException e) {
            throw new PersistenceException("Can't get DomainInfo", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public int preparePlanBySizObject(Date date, int elementTypeCode) {
        int totalCount = 0;
        Connection conn = null;
        try {

            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

            conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            ENSizObjectDAO sizDAO = new ENSizObjectDAO(conn, userProfile);

            Vector list = sizDAO.getInfoForPlanSiz(date, elementTypeCode);
            totalCount = list.size();
            makePlanBySizObject(list, date);

            System.out.println("Make Plan By SizObject is done, total count = "
                    + list.size());
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e);
        } finally {
        	if (conn != null) {
                try {
                	conn.close();
                } catch (SQLException e) {
                }
            }
        }
        return totalCount;
    }

    public Vector getInfoForPlanSiz(Date date, int elementTypeCode)
            throws PersistenceException, DatasourceConnectException {

        Vector list = new Vector();
        String selectStr = null;
        Connection conn = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        int planMonth, planYear;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        planMonth = calendar.get(Calendar.MONTH) + 1;
        planYear = calendar.get(Calendar.YEAR);

        try {
            selectStr = " select enelement.code," +
                    " ensizobject.fio||' - '||ensizobject.profesion as ename," +
                    " ensizobject.tabnumber, epren.code, epren.name," +

                    " ( select dp.code from endepartment dp where dp.code = ensizobject.departmentrefcode ) as dpacode, " +
                    " ( select dp.name from endepartment dp where dp.code = ensizobject.departmentrefcode ) as dpacode, " +

                    " enelementtype.code," +
                    " cast(ensizobject.sizcode as numeric)" +

                    " from enelementtype, epren, enelement " +
                    " left join ensizobject on enelement.code = ensizobject.elementcode" +
                    " where enelementtype.code = enelement.typerefcode" +
                    " and enelement.renrefcode = epren.code" +
                    //" and ensizobject.tabnumber in ('11427') " + // DEBUG

                    /*  13.11.2011
                    *  кроме уволенных и тех, у которых уже есть месячные планы на этот месяц
                    */
                    " and enelement.code in (select s.elementcode from ensizobject s where s.statuscode = 0) " +
                    " and enelement.code not in " +
                    " (select pl.elementrefcode from enplanwork pl " +
                    " where pl.typerefcode = " + ENPlanWorkType.SIZ +
                    "  and pl.staterefcode = " + ENPlanWorkState.SIZ +
                    "  and pl.monthgen = " + planMonth + " and pl.yeargen = " + planYear + ")" +

                    //" and enelement.code = 1008002069 " +  // DEBUG

                    " and enelement.typerefcode = " + elementTypeCode;

            statement = conn.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                InfoForPlanSiz info = new InfoForPlanSiz();
                info.elementCode = resultSet.getInt(1);
                info.elementName = resultSet.getString(2);
                info.elementInvNumber = resultSet.getString(3);
                info.elementRenCode = resultSet.getInt(4);
                info.elementRenName = resultSet.getString(5);
                info.elementDepartmentCode = resultSet.getInt(6);
                info.elementDepartmentName = resultSet.getString(7);
                info.elementTypeCode = resultSet.getInt(8);
                info.elementSizCode = resultSet.getInt(9);

                list.add(info);
            }
            resultSet.close();
            System.out
                    .println("select InfoForPlanSiz is done ! Total count = "
                            + list.size());

            return list;
        } catch (SQLException e) {
            throw new PersistenceException("Can't InfoForPlanSiz codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (conn != null) {
                try {
                	conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    private void makePlanBySizObject(Vector list, Date date)
            throws DatasourceConnectException, PersistenceException {

        UserProfile userProfile = new UserProfile();
        userProfile.userName = "energynet";

        DomainInfo domainInfo = new DomainInfo();
        domainInfo = getDomainInfo(userProfile.userName);
        userProfile.domainInfo.domain = domainInfo.domainName;
        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

        DepartmentLogic departmentLogic = new DepartmentLogic(connection, userProfile);

        int planMonth, planYear;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        planMonth = calendar.get(Calendar.MONTH) + 1;
        planYear = calendar.get(Calendar.YEAR);

        Date planStartDate, planEndDate;

        Calendar start = Calendar.getInstance();
        start.setTime(date);
        start.set(Calendar.DATE, start.getActualMinimum(Calendar.DATE));
        planStartDate = start.getTime();

        Calendar end = Calendar.getInstance();
        end.setTime(date);
        end.set(Calendar.DATE, end.getActualMaximum(Calendar.DATE));
        planEndDate = end.getTime();

        try {

            Context context = new InitialContext();
            Object planRef = context.lookup(ENPlanWorkController.JNDI_NAME);
            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = planHome.create();


            ENPlanWork plan = null;
            for (int i = 0; i < list.size(); i++) {
                if (i % 100 == 0)
                    System.out.println("Ok! Plan By SizObject... planCount = " + i);

                ENSizObjectDAO.InfoForPlanSiz info = (ENSizObjectDAO.InfoForPlanSiz) list
                        .get(i);
                plan = new ENPlanWork();

                plan.dateGen = new Date();
                plan.dateStart = planStartDate;
                plan.dateFinal = planEndDate;
                plan.yearGen = planYear;
                plan.monthGen = planMonth;

                plan.sourceRef.code = ENPlanWorkSource.MANUAL;
                plan.elementRef.code = info.elementCode;
                plan.renRef.code = info.elementRenCode;
                plan.departmentRef.code = info.elementDepartmentCode;

                plan.typeRef.code = ENPlanWorkType.SIZ;
                plan.stateRef.code = ENPlanWorkState.SIZ;
                plan.kind.code = ENPlanWorkKind.CURRENT;
                plan.budgetRef.code = 500000003;  // 'СОТ';
                plan.responsibilityRef.code = 500000002;  // 'СОТ';
                plan.finExecutor.name = "Відділ матеріально-технічного постачання";
                plan.finExecutor.finCode = 45;
                plan.finExecutor.finTypeName = "Промышленный персонал";
                plan.finExecutor.finTypeCode = 1;
                plan.finExecutor.finKindName = "Відділ";
                plan.finExecutor.finKindCode = 3;
                plan.finExecutor.finCehName = "Апарат управління";
                plan.finExecutor.finCehCode = 3;

                ///// MDAX-441
                plan.finExecutor.axOrgId = "018";
                plan.finExecutor.axParentOrgId = "0001";
                plan.finExecutor.axParentOrgName = "АДМІНІСТРАТИВНО-УПРАВЛІНСЬКА ЧАСТИНА";
                plan.finExecutor.axOrgTypeId = 3;
                plan.finExecutor.axOrgTypeName = "Отдел";
                /////

                plan.status.code = ENPlanWorkStatus.GOOD;
                plan.formRef.code = ENPlanWorkForm.PLANNED;

                plan.code = planController.addAutoBySiz(plan, userProfile);

            }
            System.out.println("Make Plan By SizObject is done, total count = "
                    + list.size());

        } catch (NamingException e) {
            throw new EnergyproSystemException(e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e);
        }
    }

    public class InfoForPlanSiz {
        public int elementCode;
        public String elementName;
        public String elementInvNumber;
        public int elementRenCode;
        public String elementRenName;
        public int elementDepartmentCode;
        public String elementDepartmentName;
        public int elementTypeCode;
        public int elementSizCode;

        public InfoForPlanSiz() {
        }
    }

    public void fastUpdateFiredWorker(int sizObjectCode)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;
        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        try {
            sqlStr = " update ensizobject set statuscode = 1 where code = " + sizObjectCode;

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast oldWarning status update", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }



    public int compressFinWorker() {
        int totalCount = 0;
        Connection conn = null;
        try {

            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

            conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            FINWorkerDAO finDAO = new FINWorkerDAO(conn, userProfile);

            Vector list = finDAO.getCFList();
            totalCount = list.size();
            makecompressFinWorker(list);

            System.out.println("Make compressFinWorker is done, total count = "
                    + list.size());
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e);
        } finally {
        	if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
        }
        return totalCount;
    }

    private void makecompressFinWorker(Vector list)
            throws DatasourceConnectException, PersistenceException {

    	Connection conn = null;
        UserProfile userProfile = new UserProfile();
        userProfile.userName = "energynet";

        DomainInfo domainInfo = new DomainInfo();
        domainInfo = getDomainInfo(userProfile.userName);
        userProfile.domainInfo.domain = domainInfo.domainName;
        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

        try {
        	conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        	FINWorkerDAO fwDao = new FINWorkerDAO(conn, userProfile);

            for (int i = 0; i < list.size(); i++) {
                //if (i % 100 == 0)
                    System.out.println("start compress FinWorker = " + i + " :: " + list.size());

                FINWorkerDAO.InfoFinForker info = (FINWorkerDAO.InfoFinForker) list.get(i);

                System.out.println("start compress FinWorker tabNumber = " + info.tabNumber);

                Vector humenList = fwDao.getUpdHumenItem(info.tabNumber);

                System.out.println("updHumenItem by tabNumber = " + info.tabNumber);
                for (int h = 0; h < humenList.size(); h++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(h);
                    try {
    					fwDao.updHumenItem(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }

                System.out.println("updTransportItem by tabNumber = " + info.tabNumber);
                for (int t = 0; t < humenList.size(); t++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(t);
                    try {
    					fwDao.updTransportItem(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }

                System.out.println("updTravelsheet1 by tabNumber = " + info.tabNumber);
                for (int u = 0; u < humenList.size(); u++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(u);
                    try {
    					fwDao.updTravelsheet1(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }

                System.out.println("updTravelsheet2 by tabNumber = " + info.tabNumber);
                for (int p = 0; p < humenList.size(); p++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(p);
                    try {
    					fwDao.updTravelsheet2(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }

                System.out.println("updTravelsheet3 by tabNumber = " + info.tabNumber);
                for (int s = 0; s < humenList.size(); s++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(s);
                    try {
    					fwDao.updTravelsheet3(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }

                System.out.println("enworkorderbyt by tabNumber = " + info.tabNumber);
                for (int w = 0; w < humenList.size(); w++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(w);
                    fwDao.enworkorderbyt(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
                }

                System.out.println("enworkorderbytitem by tabNumber = " + info.tabNumber);
                for (int wi = 0; wi < humenList.size(); wi++) {

                    InfoUpdHumenItem infoUpdHumenItem = (InfoUpdHumenItem) humenList.get(wi);
                    fwDao.enworkorderbytitem(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    			    try {
    					fwDao.deleteFinWorker(infoUpdHumenItem.minCode, infoUpdHumenItem.codes, userProfile);
    				} catch (SQLException e) {
    					e.printStackTrace();
    				}
                }
            }

            System.out.println("Make compressFinWorker is done, total count = " + list.size());

        } finally {
        	if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
        }
    }



	public void compressFinexEcutor() {
		compressFinexEcutor compressFinexEcutor = new compressFinexEcutor();
		Thread t = new Thread(compressFinexEcutor);
		t.start();
	}


	public class compressFinexEcutor implements Runnable {
		@Override
		public void run() {

			int totalCount = 0;
			try {

				UserProfile userProfile = new UserProfile();
				userProfile.userName = "energynet";

				DomainInfo domainInfo = new DomainInfo();
				domainInfo = getDomainInfo(userProfile.userName);
				userProfile.domainInfo.domain = domainInfo.domainName;
				userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
				userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

				Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				FINExecutorDAO fxDAO = new FINExecutorDAO(connection, userProfile);

				Vector list = fxDAO.getCFList();
				totalCount = list.size();
				makecompressFinExecutor(list);

				// fxDAO.deleteFinExecutor();

				System.out.println("Make compressFinExecutor is done, total count = " + list.size());

			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException(e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e);
			}

		}

	}


    private void makecompressFinExecutor(Vector list)
            throws DatasourceConnectException, PersistenceException {

        UserProfile userProfile = new UserProfile();
        userProfile.userName = "energynet";

        DomainInfo domainInfo = new DomainInfo();
        domainInfo = getDomainInfo(userProfile.userName);
        userProfile.domainInfo.domain = domainInfo.domainName;
        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        for (int i = 0; i < list.size(); i++) {
            if (i % 100 == 0)
                System.out.println("start compress FinExecutor = " + i);

            FINExecutorDAO.InfoFinExecutor info = (FINExecutorDAO.InfoFinExecutor) list.get(i);

            System.out.println("start compress FinExecutor finCode = " + info.finCode);
            FINExecutorDAO fxDao = new FINExecutorDAO(connection, userProfile);

            Vector executorList = fxDao.getUpdFinExecutor(info.finCode);

            System.out.println("updFinExecutor by finCode = " + info.finCode);
            for (int h = 0; h < executorList.size(); h++) {

                InfoUpdFinExecutor infoUpdFinExecutor = (InfoUpdFinExecutor) executorList.get(h);
                fxDao.updFinexecutor2Plan(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);
            }


            System.out.println("updEnPlanWorkItem by finCode = " + info.finCode);
            for (int t = 0; t < executorList.size(); t++) {

                InfoUpdFinExecutor infoUpdFinExecutor = (InfoUpdFinExecutor) executorList.get(t);
                fxDao.updEnPlanWorkItem(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);
            }


            System.out.println("updEnElement by finCode = " + info.finCode);
            for (int t = 0; t < executorList.size(); t++) {

                InfoUpdFinExecutor infoUpdFinExecutor = (InfoUpdFinExecutor) executorList.get(t);
                fxDao.updEnElement(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);
            }


            System.out.println("updEpRen2FinExecutor by finCode = " + info.finCode);
            for (int t = 0; t < executorList.size(); t++) {

                InfoUpdFinExecutor infoUpdFinExecutor = (InfoUpdFinExecutor) executorList.get(t);
                fxDao.updEpRen2FinExecutor(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);
            }



            System.out.println("updPlanWork by finCode = " + info.finCode);
            for (int t = 0; t < executorList.size(); t++) {

                InfoUpdFinExecutor infoUpdFinExecutor = (InfoUpdFinExecutor) executorList.get(t);
                fxDao.updEnPlanWork(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);

                System.out.println("delete FinExecutor by finCode = " + info.finCode);
                fxDao.deleteFinExecutor(infoUpdFinExecutor.minCode, infoUpdFinExecutor.codes);
            }


        }
        System.out.println("Make compressFinExecutor is done, total count = " + list.size());
    }


    public void inspectTransaction() {
        try {

            PreparedStatement statement = null;
            PreparedStatement stm = null;
            Connection conn = null;

            // this.prepareUpdateFinWorker();
            // this.compressFinWorker();
            // this.checkServicesObject();
            // this.checkUsersInShtat();
            // this.deleteServicesObject();

            /*
            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;
            */

            // connection = getRemoteConnection(AuthorizationJNDINames.CN_IMMEDIATE_DATASOURCE);
            // CNLogic cnLogic = new CNLogic(connection, userProfile);
            // cnLogic.generationReportForSite();

            // connection = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            // this.checkServicesObject();

            // SCLogic sLogic = new SCLogic(connection, userProfile);
            // sLogic.getCounterSSS();

            //  ScheduledEventsManager ssched = new ScheduledEventsManager();
            // ssched.updateRecordpointPromInfo();


            String ipAddres = Tools.getInetAddress();

            if (ipAddres.equals("10.77.11.16")) {
            	conn = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);
            } else {
            	conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            }

            try {
                String selectStr = "select distinct w.procid, w.usename from ( "
                		+ " select pg_stat_activity.pid as procid, pg_stat_activity.usename as usename, "
                		+ " locktype, mode, granted, schemaname, relname, pg_stat_activity.client_addr "
                		+ " from pg_stat_activity, pg_locks "
                		+ " inner join pg_stat_user_tables on pg_locks.relation = pg_stat_user_tables.relid "
                		+ " where pg_stat_activity.pid = pg_locks.pid "
                		+ " and pg_stat_activity.usename not in ('net', 'postgres', 'bucardo', 'auth', 'Dispatcher', 'fitness', 'readdf', 'probank') ) w";


            	/*
            	String selectStr = "select distinct a.pid, a.usename "
            			+ " from pg_stat_activity a "
            			+ " where a.xact_start <= '2018-06-26 12:00:00' ";
            			// + " where a.xact_start between '2017-02-24 07:48:00' and '2017-02-24 10:00:00' ";
            	*/


                statement = conn.prepareStatement(selectStr);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int procpid = resultSet.getInt(1);
                    String userName = resultSet.getString(2);

                    if (procpid != Integer.MIN_VALUE) {

                        String str = "";
                        if (ipAddres.equals("10.77.11.16")) {
                            str = "select auth.kill_user_process(" + procpid + ")";
                        } else {
                            str = "select net.kill_user_process(" + procpid + ")";
                        }

                        stm = conn.prepareStatement(str);
                        ResultSet result = stm.executeQuery();

                        System.out.println("#### kill_user_process procpid = " + procpid + ", userName = " + userName);

                        result.close();
                        stm.close();
                    }
                 }

                resultSet.close();

            } catch (SQLException e) {
                throw new PersistenceException("Can't kill_user_process", e);
            } finally {
                try {
                    if (statement != null)
                        statement.close();
                } catch (SQLException e) {
                }
                if (stm != null) {
    				try {
    					stm.close();
    				} catch (SQLException e) {
    				}
    			}
                if (conn != null) {
    				try {
    					conn.close();
    				} catch (SQLException e) {
    				}
    			}
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e);
        }
    }


    public void checkUsersInShtat() {
        Connection finConn = null;
        Connection authConn = null;
        Connection netConn = null;
        try {

            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;


            netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            ENSizObjectDAO sizObjectDao = new ENSizObjectDAO(netConn, userProfile);

            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);
            AuthLogic authLogic = new AuthLogic(connection, userProfile);

            /*
            AuthLogic alogic = new AuthLogic(authConn, userProfile);
            if (alogic.checkUsesMDAXData()) {
            	finConn = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
            } else {
            	finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            }
            */

            finConn = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

            FINWorkerDAO fwDao = new FINWorkerDAO(finConn, userProfile);
            mDaxLogic mdLogic = new mDaxLogic(finConn, userProfile);

            User2StaffingDAO u2sDao = new User2StaffingDAO(authConn, userProfile);
        	UserDAO userDao = new UserDAO(authConn, userProfile);

        	User2StaffingFilter u2sFilter = new User2StaffingFilter();
        	u2sFilter.conditionSQL = " auth_user.statuscode =  " + User.USER_STATUS_LEGAL
        			+ " and user2staffing.xoe = " + ENConsts.YES;

        	User2StaffingShortList u2sList = u2sDao.getScrollableFilteredList(u2sFilter, u2sFilter.conditionSQL, null, 0, -1, null);


            FINWorkerShortList fwList = new FINWorkerShortList();
            FINWorkerFilter fwFilter = new FINWorkerFilter();
            // fwList = fwDao.getFINWorkerList(fwFilter, 0, -1, new Date(), true);
            fwList = mdLogic.getFINWorkerList(fwFilter, 0, -1, new Date(), true);


        	for (int u = 0; u < u2sList.totalCount; u++) {

        		System.out.println("#########  u = " + u +  ", total :: " + u2sList.totalCount);

        		/** не будем увольнять energynet... */
        		if (!u2sList.get(u).userName.toUpperCase().equals("energynet".toUpperCase())
        				&& !u2sList.get(u).userName.toUpperCase().equals("temp".toUpperCase())
        				/** Голова обласної профспілкової організації НПЕУ ПАТ"ЕК"Херсонобленерго" */
        				//&& !u2sList.get(u).userName.toUpperCase().equals("DergilyovYI".toUpperCase())
        				&& !u2sList.get(u).userName.toUpperCase().equals("GlebovaSL-guild".toUpperCase()) ) {

        			int userCode = u2sList.get(u).userCode;
            		User user = userDao.getObject(userCode);

            		boolean userFired = true;

					for (int s = 0; s < fwList.totalCount; s++) {

						if (fwList.get(s).tabNumber.equals(u2sList.get(u).tabNumber)) {

							userFired = false;

							User2StaffingFilter user2staffFilter = new User2StaffingFilter();
							user2staffFilter.user.code = userCode;
							int user2staffArr[] = u2sDao.getFilteredCodeArray(user2staffFilter, 0, -1);

							if (user2staffArr.length > 0) {
	                           	 User2Staffing oldUserData = u2sDao.getObject(user2staffArr[0]);

	                           	 FINExecutorFilter exFilter = new FINExecutorFilter();
	                           	 exFilter.axOrgId = fwList.get(s).departmentCode.substring(0,3);

	                           	 String cehNazv = "";
	                           	 FINExecutorShortList elList = mdLogic.getAXExecutorList(exFilter, 0, -1);
	                           	 if (elList.totalCount > 0) {
	                           		 cehNazv = elList.get(0).name;
	                           	 }

	                           	 String oldTerritorialOrgId = oldUserData.territorialOrgId;
	                           	 String newTerritorialOrgId = fwList.get(s).territorialOrgId;
	                           	 if (oldTerritorialOrgId == null) {
	                           		oldTerritorialOrgId = "";
	                           	 }
	                           	 if (newTerritorialOrgId == null) {
	                           		newTerritorialOrgId = "";
	                           	 }

	                           	 if (oldUserData.shtatId != fwList.get(s).doljnostid
	                           			 || oldUserData.postId != fwList.get(s).positionCode
	                           			 || !oldUserData.cehNazv.equals(cehNazv)
	                           			 || !oldUserData.postNazv.equals(fwList.get(s).positionName)
	                           			 || !oldUserData.podrName.equals(fwList.get(s).departmentName)
	                           			 || !oldUserData.fio.equals(fwList.get(s).name)
	                           			 || !oldTerritorialOrgId.equals(newTerritorialOrgId)) {

	                           		 System.out.println("#### UsersInShtat... user moving = " + userCode + " :: " + user.name +
	                           				 " :: " + oldUserData.postNazv + " :>>: " + fwList.get(s).positionName);

	                           		 oldUserData.shtatId = fwList.get(s).doljnostid;
	                           		 oldUserData.postId = fwList.get(s).positionCode;
	                           		 oldUserData.postNazv = fwList.get(s).positionName;
	                           		 oldUserData.podrCod = fwList.get(s).departmentCode;
	                           		 oldUserData.podrName = fwList.get(s).departmentName;
	                           		 oldUserData.cehId = fwList.get(s).cehid;
	                           		 oldUserData.fio = fwList.get(s).name;
	                           		 oldUserData.cehNazv = cehNazv;
	                           		 oldUserData.territorialOrgId = fwList.get(s).territorialOrgId;

	                           		 u2sDao.save(oldUserData);
	                           	 }
                            }
            			}
            		}

					if (userFired) {

						/** блокировка пользователя в ФК */
						authLogic.lockUserInFK(user.name);

						u2sDao.fastUpdateFiredWorker(userCode);
						System.out.println("#### UsersInShtat... user fired = "+ userCode + " :: " + user.name);
					}
				}
			}




			/** закрытие карточки работника по спецодежде */
			ENSizObjectFilter sizObjectFilter = new ENSizObjectFilter();
			sizObjectFilter.conditionSQL = " statuscode = " + ENConsts.NO;

			ENSizObjectShortList sizObjectShortList = sizObjectDao.getScrollableFilteredList(sizObjectFilter, 0, -1);

			for (int i = 0; i < sizObjectShortList.totalCount; i++) {

				ENSizObject sizObject = sizObjectDao.getObject(sizObjectShortList.get(i).code);

				boolean userFired = true;

				for (int s = 0; s < fwList.totalCount; s++) {

					if (fwList.get(s).tabNumber.equals(sizObjectShortList.get(i).tabNumber)) {

						userFired = false;
					}
				}

				if (userFired) {

					System.out.println("#### sizObject fired = " + sizObject.tabNumber);

					sizObject.statusCode = ENConsts.YES;
					sizObjectDao.save(sizObject);
				}
			}


        	System.out.println("#### Ok!!! UsersInShtat!!!");

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n" +
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} finally {
			if (finConn != null) {
				try {
					finConn.close();
				} catch (SQLException e) {
				}
			}
			if (authConn != null) {
				try {
					authConn.close();
				} catch (SQLException e) {
				}
			}
			if (netConn != null) {
				try {
					netConn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


    /**
     *  SUPP-30121.... 02.03.2015....
     *  в таблицу finWorker добавлены новые поля.... апдейтим данные.....
     *  вызов в inspectTransaction - this.prepareUpdateFinWorker();
     */
    public int prepareUpdateFinWorker() {
        int totalCount = 0;
        try {
        	System.out.println("Start update finWorker...");

            UserProfile userProfile = new UserProfile();
            userProfile.userName = "energynet";

            DomainInfo domainInfo = new DomainInfo();
            domainInfo = getDomainInfo(userProfile.userName);
            userProfile.domainInfo.domain = domainInfo.domainName;
            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

            ENSizObjectDAO sizDAO = new ENSizObjectDAO(connection, userProfile);
            FINWorkerDAO fwDaoFin = new FINWorkerDAO(connection, userProfile);

            // Vector list = sizDAO.getInfoForPlanSiz(date, elementTypeCode);
            FINWorkerShortList list = fwDaoFin.getFInworkerListForCategorAndWorktimeId(); // список табельны . дата плана

            totalCount = list.size();
            makeUpdateFinWorker(list);

            System.out.println("Make Plan By SizObject is done, total count = "
                    + list.size());
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e);
        } finally {
        }
        return totalCount;
    }


	private void makeUpdateFinWorker(FINWorkerShortList list)
		throws DatasourceConnectException, PersistenceException {

	        UserProfile userProfile = new UserProfile();
	        userProfile.userName = "energynet";

	        DomainInfo domainInfo = new DomainInfo();
	        domainInfo = getDomainInfo(userProfile.userName);
	        userProfile.domainInfo.domain = domainInfo.domainName;
	        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
	        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

	        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	        Connection finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	        FINWorkerDAO fwDaoFin = new FINWorkerDAO(finConn, userProfile);
	        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
	        FINWorkerDAO fwDAO = new FINWorkerDAO(userProfile, connection);

			for (int i = 0; i < list.size(); i++) {

				FINWorkerShort fin = (FINWorkerShort) list.get(i);

				System.out.print("###### fwList num " + i + " from "+ list.size() + " tabNumber = " + fin.tabNumber
				        + " date = " + fin.positionName );

				FINWorkerFilter fwFilter = new FINWorkerFilter();
				fwFilter.tabNumber = fin.tabNumber;

				FINWorkerShortList fwList_Fin = new FINWorkerShortList();

				DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
				Date date = null;
				try {
					date = format.parse(fin.positionName);
				} catch (ParseException e) {
					e.printStackTrace();
				} // тута дата

				fwList_Fin = fwDaoFin.getFINWorkerList(fwFilter, 0, -1, date, true);

				if (fwList_Fin.totalCount == 0) {
					continue;
				}


	              /// получили категорию и график рабочего времени , проадейтим теперь все записи finworker
                // по табельному и за дату которые в листе fwList

                FINWorkerFilter fwFilterUpd = new FINWorkerFilter();
               // fwFilterUpd.tabNumber = fwList.get(i).tabNumber;
                fwFilterUpd.conditionSQL = " finworker.code in ( with plan as (select p.code from enplanwork p \n"+
							" where p.datestart = '"+ fin.positionName +"'  \n"+
                		"  and p.kindcode in (3,4)  \n"+
                		"  )  \n"+
						"	select fw.code from enhumenitem hi , finworker fw  \n"+
						"	where hi.planrefcode in (select plan.code from plan)  \n"+
						"	and hi.finworkercode = fw.code  \n"+
						"	and fw.tabnumber = "+fin.tabNumber+" " +
						" union all \n"+
                        " select fw.code from entransportitem ti , finworker fw \n"+
					    "		where ti.planrefcode in (select plan.code from plan)  \n"+
						"	and ti.finworkercode = fw.code  \n"+
						"	and fw.tabnumber = "+fin.tabNumber+" " +
						 ")  ";

                FINWorkerShortList fwListUpd = fwDAO.getScrollableFilteredList(fwFilterUpd, 0, -1);
                for (int f = 0; f < fwListUpd.totalCount; f++) {
                	FINWorker fwupd = fwDAO.getObject(fwListUpd.get(f).code);
                	fwupd.categorId = fwList_Fin.get(0).categorId;
                	fwupd.categorName = fwList_Fin.get(0).categorName;
                	fwupd.workTimeId = fwList_Fin.get(0).workTimeId;

                	fwDAO.save(fwupd);
                }
                System.out.print("###### save FINWorker :: " + fwListUpd.totalCount);
			}
	}




	 public void checkAgreements() {
	        Connection finConn = null;
	        Connection netConn = null;
	        try {

	            UserProfile userProfile = new UserProfile();
	            userProfile.userName = "energynet";

	            DomainInfo domainInfo = new DomainInfo();
	            domainInfo = getDomainInfo(userProfile.userName);
	            userProfile.domainInfo.domain = domainInfo.domainName;
	            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
	            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

	            netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	        	ENServicesObjectDAO sDao = new ENServicesObjectDAO(finConn, userProfile);
	        	ENContractDAO contractDao = new ENContractDAO(netConn, userProfile);
	        	ENContractFilter contractFilter = new ENContractFilter();

	        	contractFilter.conditionSQL = " encontract.contractenddate is null";

	        	ENContractShortList contractList = contractDao.getScrollableFilteredList(contractFilter, 0, -1);
	        	/*
	        	for (int c = 0; c < contractList.totalCount; c++) {

	        		ENServicesObjectFilter sFilter = new ENServicesObjectFilter();
	        		sFilter.conditionSQL = " a.id = " +  contractList.get(c).finDocID;

	        		ENServicesObjectShortList result = sDao.getContractList(sFilter, 0, -1);

	        		if (result.totalCount > 0) {
	        			ENContract contract = contractDao.getObject(contractList.get(c).code);
	        			contract.contractEndDate = result.get(0).dateEdit;
	        			contractDao.save(contract);

	        			System.out.println("#### contractDao.save = " + contract.contractNumber + " :: " + result.get(0).dateEdit);
	        		}
	        	} */

	        	System.out.println("#### Ok!!! checkAgreements...");

			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException("\n\n" +
						"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...", e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e);
			} finally {
				if (finConn != null) {
					try {
						finConn.close();
					} catch (SQLException e) {
					}
				}
				if (netConn != null) {
					try {
						netConn.close();
					} catch (SQLException e) {
					}
				}
			}
		}

	 public void deleteServicesObject() {
	        Connection conn = null;
	        try {

	        	conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            UserProfile userProfile = new UserProfile();
	            userProfile.userName = "energynet";

	            DomainInfo domainInfo = new DomainInfo();
	            domainInfo = getDomainInfo(userProfile.userName);
	            userProfile.domainInfo.domain = domainInfo.domainName;
	            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
	            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

	            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(userProfile, conn);
	            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
	            soFilter.conditionSQL = " enservicesobject.code in (select s.code "
	            		+ " from enservicesobject s where s.partnercode is null "
	            		+ " and s.contractstatusrefcode = 1 "
	            		+ " and s.statusrefcode = 1 "
	            		+ " and s.contracttyperefcode = 2 "
	            		// + " and s.dateedit < '01.01.2015' "
	            		+ " and s.contractnumberservices is not null limit 300)";



	            int soArr[] = soDAO.getFilteredCodeArray(soFilter, 0, -1);
	            for (int s = 0; s < soArr.length; s++) {

	            	if (conn == null || conn.isClosed() ) {
	            		conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            	}

	            	ServicesLogic soLogic = new ServicesLogic(conn, userProfile);

	            	System.out.println("#### Ok!!! soLogic.remove = " + soArr[s] + ", i = " + s);
	            	soLogic.removeServicesObject(soArr[s]);
	            }



			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}
		}


		public void generationReportForSite() {
            try {
    			UserProfile userProfile = new UserProfile();
                userProfile.userName = "energynet";

                DomainInfo domainInfo = new DomainInfo();
				domainInfo = getDomainInfo(userProfile.userName);

	            userProfile.domainInfo.domain = domainInfo.domainName;
	            userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
	            userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

	            connection = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
	            CNLogic cnLogic = new CNLogic(connection, userProfile);
	            cnLogic.generationReportForSite();

            } catch (PersistenceException e) {
				e.printStackTrace();
			} catch (DatasourceConnectException e) {
				e.printStackTrace();
			}
		}


	/**
	 *  изменение статуса планов
	 *
	 *  @param yearGen - год планов
	 *  @param monthGen - месяц планов
	 *  @param statusCode - статус
	 *
     */
	public void updatePlanAfterCreatingOrder(int yearGen, int monthGen, int statusCode) {
		String sqlStr = null;
		PreparedStatement statement = null;
		Connection connection = null;
		try {
			connection = getConnection();

			sqlStr = "update enplanwork set statuscode = " + ENPlanWorkStatus.LOCKED + " where code in ( "
					+ " select pl.code from enplanwork pl "
					+ " where pl.statuscode = " + ENPlanWorkStatus.GOOD
					+ " and pl.yeargen = " + yearGen
					+ " and pl.monthgen = " + monthGen
					+ " and pl.typerefcode = " + ENPlanWorkType.SIZ
					+ " and pl.staterefcode = " + ENPlanWorkState.SIZ + ")";

			statement = connection.prepareStatement(sqlStr);
			statement.executeUpdate();

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
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


} // end of ENSizObjectDAO
