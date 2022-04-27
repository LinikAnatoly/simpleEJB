package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.authorization.dataminer.ConfigDAO;
import com.ksoe.authorization.exception.AuthorizationSystemException;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Action;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.authorization.valueobject.User;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.logic.RQAuthLogic;

public class AuthLogic extends LogicModule{


	@Override
	public User getCurrentUser() {
        return getUserByAlias(userProfile.userName.toLowerCase());
    }


    public User getUserByAlias(String userAlias) {
    	Connection connection = null;

        String sql = "SELECT " + User.code_QField + "," + User.name_QField
                + "," + User.alias_QField + "," + User.status_QField + ","
                + User.languageID_QField + "," + User.domain_QField + " FROM  "
                + User.tableName + " " + " WHERE " + User.alias_QField + "="
                + "?";
        try {
        	connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
            PreparedStatement statement = connection.prepareStatement(sql);

            // System.out.println("<<<<<<<<<< getUserByAlias >>>>>>>>>>");

            statement.setString(1, userAlias);
            ResultSet resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                throw new AuthorizationSystemException("The user {%"
                        + userAlias + "%} was not found in system");
            }
            User currentUser = new User();
            int fn = 0;
            currentUser.code = resultSet.getInt(++fn);
            currentUser.name = resultSet.getString(++fn);
            currentUser.alias = resultSet.getString(++fn);
            currentUser.status.code = resultSet.getInt(++fn);
            currentUser.languageID = resultSet.getInt(++fn);
            currentUser.domain = resultSet.getString(++fn);
            resultSet.close();
            statement.close();

			return currentUser;

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}


    public boolean checkPermissionMOL(String molCode)
            throws PersistenceException {
        String uDomain = userProfile.domainInfo.domain.toLowerCase();

        if (uDomain.equals("root"))
            return true;

        RQAuthLogic l = new RQAuthLogic(connection, userProfile);
        String mDomain = l.getDomainByMOLCode(molCode);

        if (mDomain == null)
            return true;

        mDomain = mDomain.toLowerCase();

        if (!mDomain.startsWith(uDomain)) {
            throw new EnergyproSystemException(
                    "У Вас немає доступу до підзвіту " + molCode);
        }

        return true;
    }

    public boolean checkPermissionGSM(String div_code)
    {
        if (
                (
                // молы ГСМ - Голик(1004) и Батманов(1012)
                    // 1008 Ищенко, 1015 - Хмара
                //((object.div_code.equals("1004")) уволен
                //((div_code.equals("1008"))
                    ((div_code.equals("1016"))
                ||
                //(object.div_code.equals("1012"))) уволен
                // (div_code.equals("1015")))
                ((div_code.equals("1020")))
                ))
                &&
                ( ! (
                    // юзера - Хмара и Исченко Марина ;)
                    //(userProfile.userName.toLowerCase().equals("hmaravv"))
                    //||
                    //(userProfile.userName.toLowerCase().equals("ishenkoma"))
                    //||
                    //(getUserProfile().userName.toLowerCase().equals("vishnevskiyov"))
                    //||
                    //(getUserProfile().userName.toLowerCase().equals("ishenkoio"))
                    //||
                    (userProfile.userName.toLowerCase().equals("chaykavv"))
                    ||
                    (userProfile.userName.toLowerCase().equals("kudassu"))
                    //(userProfile.userName.toLowerCase().equals("nemirovaan"))

                )
                )
            )
            {
                throw new EnergyproSystemException("Разносить топливо ХОЕ имею право только Кудас С.Ю. и Чайка В.В ( а не "+ userProfile.userName.toLowerCase() +")", userProfile);
            }
        return true;
    }

    public boolean checkPermission4PlanItems(ENPlanWork plan)   throws PersistenceException
    {
        //ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        //ENPlanWork p = planDAO.getObject(planCode);

        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement e = elementDAO.getObject(plan.elementRef.code, false);

        /** 07.11.2013 +++ пропускаем, если объект Договор о выполнении Тех.Условий */
        if (e.typeRef.code == ENElementType.TECHCONDITIONSSERVICES) {
            return true;
        }

        // 27.02.14 Для CallCenter'а тоже не проверяем
        if (e.typeRef.code == ENElementType.CALLCENTER_OBJECT) {
            return true;
        }


        /** 14.05.2020... пропускаем сайт... */
        if (userProfile.userName.equals("site")) {
        	return true;
        }

        /*
        * !!!!!!!!!!! ПРОВЕРКИ
        if (p != null){

        }
        else{

        }
        */
        return checkEditableObject(e.typeRef.code, "ENPlanWorkController");
    }


    public boolean checkPermission4PlanItems(int planCode)   throws PersistenceException
    {

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork p = planDAO.getObject(planCode);

        return checkPermission4PlanItems(p);

        //ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        //ENElement e = elementDAO.getObject(p.elementRef.code);

        /*
        * !!!!!!!!!!! ПРОВЕРКИ
        if (p != null){

        }
        else{

        }
        */
        //return checkEditableObject(e.typeRef.code, "ENPlanWorkController");
    }

    public boolean checkPermission4PlanItemsByElement(int elementCode)   throws PersistenceException
    {
        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement e = elementDAO.getObject(elementCode);

        /** 07.11.2013 +++ пропускаем, если объект Договор о выполнении Тех.Условий */
        if (e.typeRef.code == ENElementType.TECHCONDITIONSSERVICES) {
            return true;
        }


        /*
        * !!!!!!!!!!! ПРОВЕРКИ
        if (p != null){

        }
        else{

        }
        */
        return checkEditableObject(e.typeRef.code, "ENPlanWorkController");
    }

// проверим может ли создавать юзер план на обьект .. по коду ТРАНСПОРТИТЕМА
    public boolean checkPermission4PlanItemsByTransportItemCode(int transportItemCode)   throws PersistenceException
    {
        //ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        //ENElement e = elementDAO.getObject(elementCode);

        ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItem transport = transportDAO.getObject(transportItemCode);


        return  checkPermission4PlanItems(transport.planRef.code) ;//checkEditableObject(e.typeRef.code, "ENPlanWorkController");
    }


    public boolean checkPermission4NoplannedPlans(ENPlanWork plan) throws PersistenceException
    {
        String actionJNDI = "ksoe/energynet/ENPlanWorkController";
        String action = "editPreConfirm";

        return checkPermission(actionJNDI, action);
    }

    public boolean checkPermission4YearPlans() throws PersistenceException
    {
        String actionJNDI = "ksoe/energynet/ENPlanWorkController";
        String action = "editYearPlans";

        return checkPermission(actionJNDI, action);
    }


    /*
    *  @param objType
    *  @param String actionJNDI
    *
    */
    public boolean checkEditableObject(int objType, String actionJNDI)   throws PersistenceException
    {
        boolean out = false;
        String action = "";

        String actionJNDI_ = "ksoe/energynet/"+actionJNDI;

        switch (objType) {
            case ENElementType.LINE04 :
            case ENElementType.SUBSTATION04 :
            case ENElementType.LINE10 :
            case ENElementType.TRANSFORMER04 :
            case ENElementType.LINE_CABLE :
            {
                action = "addBySRS";
                break;
            }

            case ENElementType.LINE150 :{
                action = "addBySVES";
                break;
            }

            case ENElementType.SUBSTATION150 :{
                action = "addBySPS";
                break;
            }

            case ENElementType.TY_BYT : {
                action = "addByByt";
                break;
            }

            case ENElementType.TY_PROM : {
                action = "addByProm";
                break;
            }

            case ENElementType.RZA : {
                action = "addByRZA";
                break;
            }

            case ENElementType.SDTU : {
                action = "addBySDTU";
                break;
            }

            case ENElementType.TRANSPORT : {
                action = "addByTransport";
                break;
            }

            case ENElementType.BUILDER : {
                action = "addByBuilder";
                break;
            }

            case ENElementType.METROLOGY_OBJECT : {
                //action = "addByMetrologyCounters";
                action = "addByMetrology";
                break;
            }
            case ENElementType.METROLOGY_COUNTER : {
                //action = "addByMetrologyCounters";
                action = "addByMetrology";
                break;
            }

            case ENElementType.METROLOGY_DEVICE : {
                //action = "addByMetrologyDevices";
                action = "addByMetrology";
                break;
            }

            case ENElementType.SIT : {
                action = "addBySIT";
                break;
            }

            case ENElementType.ISOLATION : {
                action = "addByIzolation";
                break;
            }

            case ENElementType.PURCHASES_OBJECT : {
                action = "addByPurchasesObject";
                break;
            }
            case ENElementType.PURCHASES_NO_OBJECT : {
                action = "addByPurchasesNoObject";
                break;
            }

            case ENElementType.TRANSFORMER_OBJECT : {
                action = "addByTransformerObject";
                break;
            }

            case ENElementType.OPERATIVE_OBJECT : {
                action = "addByOperativeObject";
                break;
            }

            case ENElementType.SERVICES_OBJECT : {
                action = "addByServicesObject";
                break;
            }
            case ENElementType.PREPRODUCTION_OBJECT : {
                action = "addByPreproductionObject";
                break;
            }
            case ENElementType.METROLOGY_SUBSTATION : {
                action = "addByMetrologySubstation";
                break;
            }
            case ENElementType.EB_OBJECTS : {
                action = "addByEB";
                break;
            }
            case ENElementType.WRITING_NO_OBJECT: {
                action = "addByWritingNoObject";
                break;
            }
            case ENElementType.SIZ : {
                action = "addBySiz";
                break;
            }
            case ENElementType.BSZ : {  // для бригадных тоже самое......
                action = "addBySiz";
                break;
            }
            case ENElementType.EQUIPMENT_OBJECTS : {
                action = "addByEquipment";
                break;
            }
            case ENElementType.EQUIPMENT_REPAIR_OBJECTS : {
                action = "addByEquipmentRepair";
                break;
            }
            // для ПВЗ
            case ENElementType.NO_OBJECT_RESTOCKING: {
                action = "addByPVZ";
                break;
            }
            case ENElementType.SERVICES_FROM_SIDE_OBJECT : {
                action = "addByServicesFromSideObject";
                break;
            }

            /* 06.03.2012 +++ нарисоваласть перевозка грузов */
            case ENElementType.CARGO_OBJECT : {
                action = "addByTransport";
                break;
            }

            case ENElementType.ROUTE_BYT : {
                action = "addByByt";
                break;
            }

            case ENElementType.GIFT :
            {
                action = "addByGift";
                break;
            }

            case ENElementType.NO_OBJECT_AVR16 :
            {
                action = "addByAVR16";
                break;
            }

            case ENElementType.NO_OBJECT_AVZ :
            {
                action = "addByAVZ";
                break;
            }

            case ENElementType.NO_OBJECT_COUNTERS_SERVICES :
            {
                action = "add";
                break;
            }

            default : return false;
        }


        //select action ///

        //String actionCodeSQL = "select aa.action_code from auth_action aa where aa.action_method = ? "+
                            //"and aa.action_jndi = ?";

        //String userCodeSQL = "select user_code from auth_user where UPPER(user_name) = UPPER(?)";

        //AuthorizationSessionStatelessControllerEJB qq = new AuthorizationSessionStatelessControllerEJB();
        //qq.

        return checkPermission(actionJNDI_, action);

    }


    public boolean checkPermission(String jndi, String method) {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;

        try {
        	// System.out.println("<<<<<<<<<< checkPermission >>>>>>>>>>");

        	User currentUser = getCurrentUser();

            String sql = "SELECT " + Action.code_QField + ","
                    + Action.name_QField + "," + Action.method_QField + ","
                    + Action.jndiName_QField + " " + " FROM  "
                    + Action.tableName + " " + " WHERE "
                    + Action.jndiName_QField + "= ?" + " AND   "
                    + Action.method_QField + "= ?";

            connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            statement = connection.prepareStatement(sql);

            int pn = 0;
            statement.setString(++pn, jndi);
            statement.setString(++pn, method);

            resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                throw new AuthorizationSystemException("The action " + method
                        + " and jndi " + jndi + " was not found in system");
            }

            Action currentAction = new Action();
            int fn = 0;
            currentAction.setCode(resultSet.getInt(++fn));
            currentAction.setName(resultSet.getString(++fn));
            currentAction.setMethod(resultSet.getString(++fn));
            currentAction.setJndiName(resultSet.getString(++fn));

            resultSet.close();
            statement.close();

            boolean response = checkUserPermission(currentUser.getCode(),
                    currentAction)
                    || checkGroupPermission(currentUser.getCode(),
                            currentAction);

            if (!response) {
                System.err.println("checkPermission" + "exception 1");
                throw new AuthorizationSystemException("\n\n У ВАС НЕМАЄ ПРАВ НА ЦЮ ОПЕРАЦІЮ! " + "\n "
                		+ "The user {%"
                        + currentUser.getName()
                        + "%} is not authorized to use action %{ " + currentAction.getCode() + " - "
                        + currentAction.getName() + " %}");
            }

            return true;

        } catch (SQLException sqle) {
            System.err.println("checkPermission" + sqle.getMessage());
            throw new AuthorizationSystemException(sqle);
        } catch (DatasourceConnectException dce) {
            System.err.println("checkPermission" + dce.getMessage());
            throw new AuthorizationSystemException(dce);
        } catch (PersistenceException pe) {
            System.err.println("checkPermission" + pe.getMessage());
            throw new AuthorizationSystemException(pe);
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }

            try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
        }
    }


    public AuthLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    public boolean checkPermissionSilent(String jndi, String method) {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;

        try {
        	// System.out.println("<<<<<<<<<< checkPermissionSilent >>>>>>>>>>");

        	User currentUser = getCurrentUser();

            String sql = "SELECT " + Action.code_QField + ","
                    + Action.name_QField + "," + Action.method_QField + ","
                    + Action.jndiName_QField + " " + " FROM  "
                    + Action.tableName + " " + " WHERE "
                    + Action.jndiName_QField + "= ?" + " AND   "
                    + Action.method_QField + "= ?";

            connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            statement = connection.prepareStatement(sql);

            int pn = 0;
            statement.setString(++pn, jndi);
            statement.setString(++pn, method);

            resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                throw new AuthorizationSystemException("The action " + method
                        + " and jndi " + jndi + " was not found in system");
            }

            Action currentAction = new Action();
            int fn = 0;
            currentAction.setCode(resultSet.getInt(++fn));
            currentAction.setName(resultSet.getString(++fn));
            currentAction.setMethod(resultSet.getString(++fn));
            currentAction.setJndiName(resultSet.getString(++fn));

            resultSet.close();
            statement.close();

            boolean response = checkUserPermission(currentUser.getCode(),
                    currentAction)
                    || checkGroupPermission(currentUser.getCode(),
                            currentAction);

            return response;

        } catch (SQLException sqle) {
            System.err.println("checkPermission" + sqle.getMessage());
            throw new AuthorizationSystemException(sqle);
        } catch (DatasourceConnectException dce) {
            System.err.println("checkPermission" + dce.getMessage());
            throw new AuthorizationSystemException(dce);
        } catch (PersistenceException pe) {
            System.err.println("checkPermission" + pe.getMessage());
            throw new AuthorizationSystemException(pe);
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }

            try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}

    public boolean checkGroupPermissionSilent(int groupCode) {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
    	Connection connection = null;

        try {
        	// System.out.println("<<<<<<<<<< checkGroupPermission >>>>>>>>>>");
        	User currentUser = getCurrentUser();

        	connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            String sql = "select UG.USER_GROUP_CODE as CODE"
                    + "  from AUTH_USER_GROUP UG"
                    + " where UG.GROUP_CODE = ?"
                    + "   and UG.USER_CODE  = ?";

            statement = connection.prepareStatement(sql);

            statement.setInt(1, groupCode);
            statement.setInt(2, currentUser.getCode());
            resultSet = statement.executeQuery();

            boolean response = (resultSet != null) && (resultSet.next());
            return response;
        } catch (SQLException sqle) {
            System.err.println("checkPermission " + sqle.getMessage());
            throw new AuthorizationSystemException(sqle);
        } catch (DatasourceConnectException dce) {
            System.err.println("checkPermission " + dce.getMessage());
            throw new AuthorizationSystemException(dce);
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }        	
        	try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
    }

    /**
     * Проверяет, есть ли у пользователя права бухгалтера
     *
     * @return {@code true}, если есть права бухгалтера, иначе {@code false} 
     */
    public boolean isUserBuh() {
    	return checkGroupPermissionSilent(AuthConsts.AUTH_USER_GROUP_BUH);
    }

    public boolean checkUsesMDAXData(int value) {
		boolean usesMDAXData = false;
		Connection connection = null;

		try {
			// System.out.println("<<<<<<<<<< checkUsesMDAXData 1 >>>>>>>>>>");

			connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_IMMEDIATE_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, connection);
			Config conf = configDAO.getObject(value);

			if (conf.value.equals(Config.USES_MDAX_DATA_YES)) {
				usesMDAXData = true;
			}

			return usesMDAXData;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}


	public boolean checkUsesMDAXData() {
		boolean usesMDAXData = false;
		Connection connection = null;

		try {
			// System.out.println("<<<<<<<<<< checkUsesMDAXData 30 >>>>>>>>>>");

			connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, connection);
			Config conf = configDAO.getObject(Config.CONFIG_USES_MDAX_DATA);

			if (conf.value.equals(Config.USES_MDAX_DATA_YES)) {
				usesMDAXData = true;
			}

			return usesMDAXData;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}

	public  boolean checkUsesMDAXDataForReport() {
		boolean usesMDAXData = false;
		Connection connection = null;

		try {
			// System.out.println("<<<<<<<<<< checkUsesMDAXDataForReport >>>>>>>>>>");

			connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, connection);
			Config conf = configDAO.getObject(Config.CONFIG_USES_MDAX_DATA_REPORT);

			if (conf.value.equals(Config.USES_MDAX_DATA_YES)) {
				usesMDAXData = true;
			}

			return usesMDAXData;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}

	/**
	 * Возвращает строку для создания коннекта к ФинКоллекции либо Аксапте
	 * (в зависимости от того, что используется в данный момент)
	 *
	 * @return Строка для создания подключения
	 */
	public String getFinConnectionString()
	{
    	if (checkUsesMDAXData())
    	{
    		return AuthorizationJNDINames.MDAX_DATASOURCE;
    	}
    	else
    	{
			return AuthorizationJNDINames.FINMATERIAL_DATASOURCE;
    	}
	}

	public class FinConnectionData {
		public String connectionString;
		public String datasourceConnectExceptionString;
	}

	/**
	 * Возвращает объект с данными для создания коннекта к ФинКоллекции либо Аксапте
	 * (в зависимости от того, что используется в данный момент), включая строку
	 * для подключения и матюк, который нужно показывать в случае отсутствия связи
	 *
	 * @return Объект с данными для создания подключения
	 */
	public FinConnectionData getFinConnectionData()
	{
		FinConnectionData connectionData = new FinConnectionData();

		if (checkUsesMDAXData())
		{
			connectionData.connectionString = AuthorizationJNDINames.MDAX_DATASOURCE;
			connectionData.datasourceConnectExceptionString = "\n\nНет связи с Axapta!";
		}
		else
		{
			connectionData.connectionString = AuthorizationJNDINames.FINMATERIAL_DATASOURCE;
			connectionData.datasourceConnectExceptionString = "\n\nНет связи с ФинКоллекцией!";
		}

		return connectionData;
	}

	/*
	 *  Списание ТМЦ в АКСАПТЕ  0-только в фин. , 1-и в фин и в АХ , 2- только в АХ
	 * */
	public int checkUsesDataForWriteOff() {
		int usesMDAXData = 0;
		Connection connection = null;

		try {
			// System.out.println("<<<<<<<<<< checkUsesDataForWriteOff >>>>>>>>>>");

			connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

			ConfigDAO configDAO = new ConfigDAO(userProfile, connection);

			Config conf = configDAO.getObject(Config.CONFIG_USES_MDAX_WRITEOFF_TMC);
			usesMDAXData = Integer.parseInt(conf.value);

			return usesMDAXData;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}



	/**
	 * блокировка пользователя в ФК
	 *
	 * @param userName
	 */
	public void lockUserInFK(String userName) {

		Connection finConnection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStmt = null;

		try {

			finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			String sql = "select count(username) cnt "
					+ " from dba_users "
					+ " where username = upper(?)";

			statement = finConnection.prepareStatement(sql);
			statement.setString(1, userName);

			resultSet = statement.executeQuery();

			while (resultSet.next()) {

				if (resultSet.getInt(1) == 1 ) {

					String updQuery = "ALTER USER " + userName.toUpperCase() + " ACCOUNT LOCK";
					preparedStmt = finConnection.prepareStatement(updQuery);

					preparedStmt.executeQuery();

					System.out.println("#### lockUserInFK... user.name = " + userName.toUpperCase() );
				}
			}


		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}

			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}

			try {
				if (finConnection != null && !finConnection.isClosed()) {
					finConnection.close();
					finConnection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}

    private boolean checkUserPermission(int userCode, Action action)
            throws DatasourceConnectException, SQLException {

    	Connection connection = null;
    	try {
    		// System.out.println("<<<<<<<<<< checkUserPermission >>>>>>>>>>");

    		connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

    		String sql = "select USER_ACTION_CODE from AUTH_USER_ACTION where USER_CODE = ? and ACTION_CODE = ?";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, userCode);
			statement.setInt(2, action.getCode());
			ResultSet resultSet = statement.executeQuery();
			boolean response = resultSet.next();

			resultSet.close();
			statement.close();
			return response;

		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}

    private boolean checkGroupPermission(int userCode, Action action)
            throws DatasourceConnectException, PersistenceException,
            SQLException {

    	Connection connection = null;
        try {
        	// System.out.println("<<<<<<<<<< checkGroupPermission >>>>>>>>>>");

        	connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            String sql = "select  GA.GROUP_ACTION_CODE as CODE"
                    + "  from  AUTH_GROUP_ACTION GA" + "     ,  AUTH_USER U"
                    + "     ,  AUTH_GROUP G" + "     ,  AUTH_USER_GROUP UG"
                    + " where  GA.ACTION_CODE = ? "
                    + "   and  G.GROUP_CODE = GA.GROUP_CODE"
                    + "   and  UG.GROUP_CODE = G.GROUP_CODE"
                    + "   and  UG.USER_CODE  = U.USER_CODE"
                    + "   and  U.USER_CODE = ?";

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, action.getCode());
            statement.setInt(2, userCode);
            ResultSet resultSet = statement.executeQuery();

            boolean response = (resultSet != null) && (resultSet.next());
            resultSet.close();
            statement.close();
            return response;
        } catch (SQLException se) {
            System.err.println("checkGroupPermission response: "
                    + se.getMessage());
            throw new PersistenceException(se.getMessage());
        } finally {
        	try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
    }


}
