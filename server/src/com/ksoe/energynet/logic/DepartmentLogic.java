package com.ksoe.energynet.logic;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.dataminer.BaseDAOUtils.Transformator;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDepartmentDAO;
import com.ksoe.docflow.valueobject.DFDepartment;
import com.ksoe.docflow.valueobject.filter.DFDepartmentFilter;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDepartmentType;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetDepartmentInfo;
import com.ksoe.energynet.valueobject.ENManagement;
import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;
import com.ksoe.energypro.dataminer.EPRenDAO;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPRen;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class DepartmentLogic extends LogicModule{

    public ENDepartment2EPRenShort getFKDataByBudegetCode(int budgetCode, boolean isException) throws PersistenceException
    {
        ENDepartment2EPRenShort out = null;
        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();
        f.departmentRef.code = budgetCode;
        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f,0,1);


        if ((l.totalCount == 0) && (isException)){
            throw new EnergyproSystemException("ид ЦФО не найдено для бюджетодержателя с кодом = " + budgetCode);
        }

        if ((l.totalCount == 0) && (!isException)) {
        	out = null;
        	return out;
        }

        out = l.get(0);

        return out;
    }

    /**
     *
     * Возвращает подразделение РЭС {@link ENDepartment} для заданного кода подразделения
     *
     * Например если было послано дочернее подразделение какого-либо РЭС, то функция
     * возвратит объект {@link ENDepartment} этого РЭС
     *
     * @param departmentCode код подразделения
     * @return объект подразделения РЭС {@link ENDepartment} или {@code null} если подразделение не является РЭСом или не находится в РЭСе
     *
     * @throws PersistenceException
     */
    public ENDepartment getRemByDepartmentCode(int departmentCode) throws PersistenceException {
    	return this.getParentDepartmentByDepartmentCode(departmentCode, ENDepartment.ENDEPARTMENT_REM);
    }

    /**
     *
     * Возвращает подразделение РЭС {@link ENDepartment} для заданного кода подразделения ВДРМ или НВКО
     *
     *
     * @param departmentCode код подразделения ВДРМ или НВКО или дочерних
     * @return код РЭС или {@code null}
     * @throws PersistenceException
     */
    public Integer getRemCodeByVdrmOrNvkoDepartment(int departmentCode) throws PersistenceException {
    	Integer oldRem = this.getOldRemCode(departmentCode);
    	if(oldRem == null) {
    		ENDepartment vdrm = this.getParentDepartmentByDepartmentCode(departmentCode, ENDepartment.ENDEPARTMENT_DISTRIBUTION_NETWORKS);
    		if(vdrm != null) oldRem = this.getOldRemCode(vdrm.code);
    		if(oldRem == null) {
    			ENDepartment nvko = this.getParentDepartmentByDepartmentCode(departmentCode
    					, ENDepartment.ENDEPARTMENT_OF_CLIENT_OPERATIONS);
    			if(nvko != null) oldRem = this.getOldRemCode(nvko.code);
    		}
    	}
		return (oldRem == null) ? null : oldRem;
    }

    /**
    *
    * Возвращает родительское подразделение {@link ENDepartment} для заданного кода подразделения
    *
    * @param departmentCode код подразделения
    * @param rootDepartmentCode код основного подразделения которое содержит в себе родительское заданному
    * @return объект подразделения РЭС {@link ENDepartment} или {@code null} если для заданного подразделения не удалось найти родительское
    *
    * @throws PersistenceException
    */
    public ENDepartment getParentDepartmentByDepartmentCode(int departmentCode, int rootDepartmentCode) throws PersistenceException {
	    String sql =  "select sub_query.code from  \n " +
	   			 "( \n " +
	   			 " \n " +
	   			 "with recursive tree as (  \n " +
	   			 "   select code,  \n " +
	   			 "   		parentrefcode \n " +
	   			 "   from net.endepartment \n " +
	   			 "   where code = ? \n " +
	   			 " \n " +
	   			 "   union all  \n " +
	   			 " \n " +
	   			 "   select p.code, \n " +
	   			 "   		p.parentrefcode \n " +
	   			 "   from net.endepartment p \n " +
	   			 "    \n " +
	   			 "   /* all children */ \n " +
	   			 "   join tree t on t.parentrefcode = p.code \n " +
	   			 "    \n " +
	   			 ") \n " +
	   			 "select * \n " +
	   			 "from tree) as sub_query \n " +
	   			 "where sub_query.parentrefcode = ? \n ";

	   	Vector<Integer> vec = new Vector<>();
	   	vec.add(departmentCode);
	   	vec.add(rootDepartmentCode);

	   	Integer mainRemCode = BaseDAOUtils.executeStatementAndReadObject(connection, sql, vec, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);

	   	if(mainRemCode != null && mainRemCode != Integer.MIN_VALUE) {
	   		ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
	   		return dao.getObject(mainRemCode);
	   	} else {
	   		return null;
	   	}
    }

    public int getCFOfkCodeByBudjetCode(int budgetCode, boolean isException) throws PersistenceException
    {
        ENDepartment2EPRenShort qq = getFKDataByBudegetCode(budgetCode, isException);
        if ((qq == null) && (! isException))
        {
            return Integer.MIN_VALUE;
        }
        return qq.finRenCode;
    }

    public String getCFOCodeForAXByBudgetCode(int budgetCode, boolean isException) throws PersistenceException
    {
        ENDepartment2EPRenShort qq = getFKDataByBudegetCode(budgetCode, isException);

        if ((qq == null) && (! isException))
        {
            return "";
        }

        if ((qq == null) && isException) {
            throw new EnergyproSystemException("\n\nДля бюджетодержателя с кодом " + budgetCode + " не найдено ЦФО!");
        }

        String cfo = qq.finCFOCode;

        if (cfo == null)
        {
        	cfo = "";
        }

        return cfo;
    }

    public void validateCFOfkCodeByBudjetCode(int budgetCode, int budgetCoreId) throws PersistenceException {
        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();

        f.departmentRef.code = budgetCode;
        f.finRenCode = budgetCoreId;

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f,0,1);

        if ((l.totalCount == 0) ){
            throw new EnergyproSystemException("Не співпадає код ЦФО з кодом бюджетотримача ");
        }
    }

    /**
     *
     * Массив кодов всех бюджетодержателей
     *
     * @return
     * @throws PersistenceException
     */
    public int[] getBudgetCodes() throws PersistenceException {
    	ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
    	ENDepartmentFilter filter = new ENDepartmentFilter();
    	filter.typeRef.code = ENDepartmentType.BUDGET;
    	return dao.getFilteredCodeArray(filter, 0, -1);
    }

    /**
     * Метод возвращает код бюджетодержателя по коду ЦФО
     *
     * @param budgetCoreId - код ЦФО
     *
     * @return код бюджетодержателя
     *
     * @throws PersistenceException
     */
    public int getBudgetCodeByCFO(int budgetCoreId) throws PersistenceException
    {
        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);

        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();
        f.finRenCode = budgetCoreId;

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f, 0, 1);

        if (l.totalCount > 0)
        {
        	return l.get(0).departmentRefCode;
        }

        return Integer.MIN_VALUE;
    }


    public int getFINDepartment2Department(int departmentCode, boolean isException) throws PersistenceException
    {
        int out = Integer.MIN_VALUE; // если нету связки по дефолту ОБЛ !!!

        ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
        ENDepartment dep = depDAO.getObject(departmentCode);

        if ((dep == null) && (isException))
        {
            throw new EnergyproSystemException("Підрозділ не знайдено (1)  ... код = " + departmentCode);
        }

        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();

        if (dep.renCode == Integer.MIN_VALUE){
            f.departmentRef.code = departmentCode;
        }
        if (dep.renCode == dep.code) {
            f.departmentRef.code = dep.renCode;
        }
        else
        {
            f.departmentRef.code = dep.code;
        }

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f,0,1);

        if (l.totalCount > 0)
            out = l.get(0).finRenCode;

        if ((out == Integer.MIN_VALUE) && (isException)){
            throw new EnergyproSystemException("Підрозділ не знайдено (2)  ... код = " + departmentCode);
        }

        if (out == 0) // Пытаемся найти еще раз
        {
            f.departmentRef.code = departmentCode;
            l = dao.getScrollableFilteredList(f,0,1);

            if (l.totalCount > 0)
                out = l.get(0).finRenCode;

            if ((out == Integer.MIN_VALUE) && (isException)){
                throw new EnergyproSystemException("Підрозділ не знайдено (3)  ... код = " + departmentCode);
            }
        }

        return out;
    }



    public int getEPRen2Department(int departmentCode) throws PersistenceException
    {
        int out = 0; // если нету связки по дефолту ОБЛ !!!

        ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
        ENDepartment dep = depDAO.getObject(departmentCode);

        if (dep != null){

            ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
            ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();

            if (dep.renCode == Integer.MIN_VALUE){
                f.departmentRef.code = departmentCode;
            }
            else
            {
            	// SUPP-101041 вместо f.departmentRef.code будет использоваться f.renRef.code
                f.renRef.code = dep.renCode;
            }

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f,0,1);

        if (l.totalCount > 0)
            out = l.get(0).renRefCode;
        }

        return out;
    }


    public String getFINCehCodeByDepartmentCode(int departmentCode, boolean isException) throws PersistenceException
    {
        String out = "";

        ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
        ENDepartment dep = depDAO.getObject(departmentCode);

        if ((dep == null) && (isException))
        {
            throw new EnergyproSystemException("Підрозділ не знайдено (1)  ... код = " + departmentCode);
        }

        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();

        if (dep.renCode == Integer.MIN_VALUE){
            f.departmentRef.code = departmentCode;
        }
        else
        if (dep.renCode == dep.code) {
            f.departmentRef.code = dep.renCode;
        } else
        {
            f.departmentRef.code = dep.code;
        }

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f, 0, 1);

        if (l.totalCount > 0)
            out = l.get(0).finServicesCode;

        if (out == null)
            out = "";

        if ((out == null || out == "") && (isException)){
            throw new EnergyproSystemException("Підрозділ не знайдено (2)  ... код = " + departmentCode);
        }

        return out;
    }

    public String getFINCehCodePodrByDepartmentCode(int departmentCode, boolean isException) throws PersistenceException
    {
        String out = "";

        ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
        ENDepartment dep = depDAO.getObject(departmentCode);

        if ((dep == null) && (isException))
        {
            throw new EnergyproSystemException("Підрозділ не знайдено (1)  ... код = " + departmentCode);
        }

        ENDepartment2EPRenDAO dao = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter f = new ENDepartment2EPRenFilter();

        /*
        if (dep.renCode == Integer.MIN_VALUE){
            f.departmentRef.code = departmentCode;
        }
        else
        {
            f.departmentRef.code = dep.renCode;
        }
        */

        f.departmentRef.code = departmentCode;

        ENDepartment2EPRenShortList l = dao.getScrollableFilteredList(f, 0, 1);

        if (l.totalCount > 0)
            out = l.get(0).finServicesCode;

        if (out == null)
            out = "";

        if ((out == null || out == "") && (isException)){
            throw new EnergyproSystemException("Підрозділ не знайдено (2)  ... код = " + departmentCode);
        }

        return out;
    }

    public String getAXDepartmentByMOLCode(String molCode) throws PersistenceException
    {
    	String depCode = "0" + molCode.substring(0, 2);

        ENDepartment2EPRenDAO drDAO = new ENDepartment2EPRenDAO(connection, userProfile);
        ENDepartment2EPRenFilter drFilter = new ENDepartment2EPRenFilter();

        drFilter.conditionSQL =
        		" ENDEPARTMENT2EPREN.CODE in " +
		        " ( " +
				"   select dr.code " +
				"   from endepartment2epren dr " +
				"   where coalesce(dr.renrefcode, 0) <> 0 " +
				"     and dr.finservicescode <> '000' " +
				" )";

        ENDepartment2EPRenShortList drList = drDAO.getScrollableFilteredList(drFilter, 0, -1);

        for (int i = 0; i < drList.totalCount; i++)
        {
        	if (drList.get(i).finServicesCode != null && drList.get(i).finServicesCode.equals(depCode))
        	{
        		return depCode;
        	}
        }

        return "000";
    }

    public int getDepartmentBySizObjectCode(int elementCode)
            throws PersistenceException {
        int out = 0; // если нету связки по дефолту ОБЛ !!!

        ENElementDAO elDAO = new ENElementDAO(connection, userProfile);
        ENElement element = elDAO.getObject(elementCode);

        ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
        ENDepartmentFilter f = new ENDepartmentFilter();
        f.conditionSQL = " code = (select o.podrid from ensizobject o where o.elementcode = " + elementCode + ")";
        ENDepartmentShortList l = dao.getScrollableFilteredList(f, 0, 1);

        if (l.totalCount > 0) {
            out = l.get(0).code;
        } else {
            ENDepartmentDAO dao2 = new ENDepartmentDAO(connection, userProfile);
            ENDepartmentFilter f2 = new ENDepartmentFilter();
            f2.conditionSQL = " code in (select departmentrefcode from endepartment2epren where renrefcode = " + element.renRef.code + ")";
            ENDepartmentShortList l2 = dao2.getScrollableFilteredList(f2, 0, 1);
            out = l2.get(0).code;
        }

        return out;
    }



    public int getDepartmentByElementCode(int elementCode, boolean isException) throws PersistenceException {
        int out = ENDepartment.ENDEPARTMENT_KSOE;

        ENElementDAO elementDAO = new ENElementDAO(connection, userProfile);
        ENElement element = elementDAO.getObject(elementCode);


        ENDepartmentDAO departmentDAO = new ENDepartmentDAO(connection, userProfile);
        ENDepartmentFilter departmentFilter = new ENDepartmentFilter();

        // departmentFilter.conditionSQL = " code in (select departmentrefcode from endepartment2epren where renrefcode = " + element.renRef.code + ")";
        departmentFilter.conditionSQL = " code in ( "
        		+ " select d2r.departmentrefcode "
        		+ " from endepartment2epren d2r, endepartment d "
        		+ " where d2r.renrefcode = " + element.renRef.code
        		+ " and d2r.departmentrefcode = d.code "
        		+ " and d.managementrefcode = " + ENManagement.COMMERCIAL + " ) ";

        ENDepartmentShortList departmentList = departmentDAO.getScrollableFilteredList(departmentFilter, 0, 1);

        if (departmentList.totalCount > 0) {
        	out = departmentList.get(0).code;
        } else {
        	if (isException) {
        		throw new SystemException("\n\nНе вдалося визначити підрозділ для об'єкту (elementCode = " + elementCode + ")!");
        	}
        }

        return out;
    }



    public boolean checkDepartmentForMOL(String molCode, ENPlanWork plan) throws PersistenceException
    {
        ENMolDAO molDAO = new ENMolDAO(connection, userProfile);
        ENMolFilter molFilter = new ENMolFilter();
        molFilter.finCode = molCode;
        ENMolShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);
        Integer oldRem = this.getRemCodeByVdrmOrNvkoDepartment(plan.departmentRef.code);

        if (molList.totalCount == 0)
        {
            throw new EnergyproSystemException("Невідомий код МВО! Потрібно оновити довідник МВО!");
        }

        // Кладовщику Центрального Склада можно передавать материалы под любые планы
        if (molList.get(0).typeRefCode == ENMolType.STOREKEEPER_CENTRAL)
        {
            return true;
        }

        // В начале просто выбираем подразделения из подразделений заданного МОЛа (из связки enmol2department)
        ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
        ENDepartmentFilter f = new ENDepartmentFilter();
        f.conditionSQL = "code in (" +
            " select md.departmentrefcode from enmol2department md, enmol e \n" +
            " where md.molcode = e.code \n" +
            "   and e.fincode = '" + molCode + "')";

        //ENDepartmentShortList l = dao.getScrollableFilteredList(f, 0, -1);
        int[] arr = dao.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);
        for (int i = 0; i < arr.length; i++)
        {
            //if (l.get(i).code == plan.departmentRef.code)
            if (arr[i] == plan.departmentRef.code || (oldRem != null && oldRem.equals(arr[i])))
                return true;
        }

        ManningTableLogic mtLogic = new ManningTableLogic(connection, userProfile);

        // Если прямого соответствия не нашли, пытаемся искать по дочерним подразделениям
        for (int i = 0; i < arr.length; i++)
        {
            String codes = "";
            //codes = new ManningTableLogic(connection, userProfile).getDepartmentCodesDown(l.get(i).code);
            codes = mtLogic.getDepartmentCodesDown(arr[i]);

            if (codes.equals("")) return false;

            ENDepartmentFilter f2 = new ENDepartmentFilter();
            f2.conditionSQL = "code in (" + codes + ")";

            //ENDepartmentShortList l2 = dao.getScrollableFilteredList(f2, 0, -1);
            int[] arr2 = dao.getFilteredCodeArray(f2, f2.conditionSQL, null, 0, -1, null);
            for (int j = 0; j < arr2.length; j++)
            {
                //if (l2.get(j).code == plan.departmentRef.code)
                if (arr2[j] == plan.departmentRef.code || (oldRem != null && oldRem.equals(arr2[j])))
                    return true;
            }
        }

        return false;
    }

    public DepartmentLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    /**
     * определение категории РЭС
     *
     *
     * @param codeRem
     * @return
     *
     */
    public int getCategoryRen(int codeRem) {

        int categoryRen = Integer.MIN_VALUE;

        int REN_I_CATEGORY[] = ENDepartment.REN_I_CATEGORY;
        for (int i = 0; i < REN_I_CATEGORY.length; i++) {
            if (REN_I_CATEGORY[i] == codeRem) {
                categoryRen = ENDepartment.I_CATEGORY;
            }
        }

        int REN_II_CATEGORY[] = ENDepartment.REN_II_CATEGORY;
        for (int i = 0; i < REN_II_CATEGORY.length; i++) {
            if (REN_II_CATEGORY[i] == codeRem) {
                categoryRen = ENDepartment.II_CATEGORY;
            }
        }

        int REN_III_CATEGORY[] = ENDepartment.REN_III_CATEGORY;
        for (int i = 0; i < REN_III_CATEGORY.length; i++) {
            if (REN_III_CATEGORY[i] == codeRem) {
                categoryRen = ENDepartment.III_CATEGORY;
            }
        }

        int REN_IV_CATEGORY[] = ENDepartment.REN_IV_CATEGORY;
        for (int i = 0; i < REN_IV_CATEGORY.length; i++) {
            if (REN_IV_CATEGORY[i] == codeRem) {
                categoryRen = ENDepartment.IV_CATEGORY;
            }
        }

        return categoryRen;
    }



    public class BillingServerData implements Serializable {
    	public String billingServerIp;
    	public String billingServerJnpPort;
    	public String billingServerPort;
    	public int epRenCode = Integer.MIN_VALUE;
    }

    /**
     *
     * Получить полный список информации для подключения к серверам биллинга {@link BillingServerData}
     *
     * @return список с информацией для подключения к серверам биллинга {@link BillingServerData}
     */
    public List<BillingServerData> getServerData() {
    	String sql = "SELECT DISTINCT billingserverip, billingserverjnpport, billingserverport "
    					+ "	FROM endepartment2epren AS deep WHERE deep.billingserverip IS NOT NULL";

    	return BaseDAOUtils.executeStatementAndReadObjects(this.connection, sql, null, new Transformator<BillingServerData, ResultSet>() {

			@Override
			public BillingServerData transform(ResultSet set) throws Exception {
				BillingServerData data = new BillingServerData();
				data.billingServerIp = set.getString(1);
				data.billingServerJnpPort = set.getString(2);
				data.billingServerPort = set.getString(3);
				return data;
			}

    	}, false);
    }

    /**
     *  Возвращает IP адрес, jnpPort бытового биллинга
     *
     *  @param  departmentCode - код подразделения
     *
     *  @return  billingServerData
     */
    public BillingServerData getServerDataByDepartmentCode(int departmentCode) {

    	BillingServerData serverData = new BillingServerData();

        PreparedStatement statement = null;
        ResultSet set = null;

        String sql = " select de.billingserverip, de.billingserverjnpport, de.billingserverport, de.renrefcode " +
                " from endepartment2epren de where de.departmentrefcode = " + departmentCode;

        try {
            statement = connection.prepareStatement(sql);
            set = statement.executeQuery();

            while (set.next()) {
            	serverData.billingServerIp = set.getString(1);
            	serverData.billingServerJnpPort = set.getString(2);
            	serverData.billingServerPort = set.getString(3);
            	serverData.epRenCode = set.getInt(4);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
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
        }

        return serverData;
    }

    /**
     *  Возвращает IP адрес, jnpPort биллинга
     *
     *  @param  renCode - код РЭСа (EPRen)
     *
     *  @return  billingServerData
     */
    public BillingServerData getServerDataByRenCode(int renCode) {

    	BillingServerData serverData = new BillingServerData();

        PreparedStatement statement = null;
        ResultSet set = null;

        String sql =
        		" select distinct de.billingserverip, de.billingserverjnpport, de.billingserverport " +
        		" from endepartment2epren de " +
        		" where de.renrefcode = " + renCode +
        		"   and de.billingserverip is not null";

        try {
            statement = connection.prepareStatement(sql);
            set = statement.executeQuery();

            while (set.next()) {
            	serverData.billingServerIp = set.getString(1);
            	serverData.billingServerJnpPort = set.getString(2);
            	serverData.billingServerPort = set.getString(3);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
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
        }

        return serverData;
    }


    public List<ENFuelDistributionSheetDepartmentInfo> getListOfDepartmentInfoForENFuelDistributionSheet() throws PersistenceException {
		ResultSet  resultSet = null;
		PreparedStatement statement = null;
		List<ENFuelDistributionSheetDepartmentInfo> list = new ArrayList<>();

		try {
	    	String sql_old =
	    	    	" select getdepartmentcodesdown(dp.code) " +
	    	    	" || case when dp.code = " + ENConsts.ENDEPARTMENT_CO + " then '," + ENConsts.ENDEPARTMENT_KSOE + " ' else '' end as decode " +
	    	    	" , dp.name as depname, dp.code as podr_code,  1 as ord " +
	    	    	"    from endepartment dp " +
	    	    	"                where dp.parentrefcode in (" + ENDepartment.ENDEPARTMENT_REM + ", " + ENDepartment.ENDEPARTMENT_HOE + ") " +
	    	    	"                  and dp.typerefcode = " + ENDepartmentType.DEPARTMENT + " " +
	    	    	"                  and dp.code not in (3,4,5,500000019) /*берислав белозерку не берем , ПАТ ЕКХерсонобленерго перенесем в апарат управления  */ " +
	    	    	" union all " +
	    	    	" select getdepartmentcodesdown4pmm(dp.code), 'Апарат управління (інше)', dp.code as podr_code,  -1 as ord " +
	    	    	"  from endepartment dp " +
	    	    	" where " +
	    	    	" dp.code = " + ENConsts.ENDEPARTMENT_CO + " "+
	    	    	" union all " +
	    	    	" select getdepartmentcodesdown(dp.code), 'Апарат управління (' || dp.shortname || ')', " +
	    	    	" dp.code as podr_code, " +
	    	    	" 0 as ord " +
	    	    	"  from endepartment dp " +
	    	    	" where " +
	    	    	" dp.code  in (79, 73, 70, 71, 91, 775, 675) " +
	    	    	" " +
	    	    	" order by 4, 2";
	    	/*под новое штатное SUPP-97016 */
	    String	sql = "  select getdepartmentcodesdown(dp.code)  || case when dp.code = 3 then ',500000019 ' else '' end as decode  , \n" +
	    			"                         dp.shortname as depname, dp.code as podr_code,  1 as ord   from endepartment dp         \n" +
	    			"                         where dp.code in (500000142    /*Високопільське відділення    Високопільське ВДРМ*/, \n" +
	    			"                                           500000143    /*Голопристанське відділення    Голопристанське ВДРМ*/,  \n" +
	    			"                                           500000144    /*Скадовське відділення    Скадовське ВДРМ*/, \n" +
	    			"                                           500000145    /*Олешківське відділення    Олешківське ВДРМ*/, \n" +
	    			"                                           500000146    /*Великолепетиське відділення    Великолепетиське ВДРМ*/, \n" +
	    			"                                           500000147    /*Чаплинське відділення    Чаплинське ВДРМ*/, \n" +
	    			"                                           500000281    /*Херсонське відділення    Херсонське ВДРМ*/, \n" +
	    			"                                           500000282    /*Генічеське відділення    Генічеське ВДРМ*/, \n" +
	    			"                                           500000283    /*Каховське відділення    Каховське ВДРМ*/, \n" +
	    			"                                           500000284    /*Іванівське відділення    Іванівське ВДРМ*/, \n" +
	    			"                                           500000285    /*Новотроїцьке відділення    Новотроїцьке ВДРМ*/, \n" +
	    			"                                           500000286    /*Новокаховське відділення    Новокаховське ВДРМ*/, \n" +
	    			"                                            \n" +
	    			"                                           500000060    /*Високопільське міжрайонне відділення комерційного обліку    Високопільське МВКО*/, \n" +
	    			"                                           500000061    /*Голопристанське районне відділення комерційного обліку    Голопристанське РВКО*/, \n" +
	    			"                                           500000062    /*Скадовське районне відділення комерційного обліку    Скадовське РВКО*/, \n" +
	    			"                                           500000063    /*Олешківське районне відділення комерційного обліку    Олешківське РВКО*/, \n" +
	    			"                                           500000064    /*Херсонське міжрайонне відділення комерційного обліку    Херсонське МВКО*/ ,  \n" +
	    			"                                           500000065    /*Великолепетиське міжрайонне відділення комерційного обліку    Великолепетиське МВКО*/ ,  \n" +
	    			"                                           500000066    /*Генічеське районне відділення комерційного обліку    Генічеське РВКО*/ ,  \n" +
	    			"                                           500000067    /*Каховське міжрайонне відділення комерційного обліку    Каховське МВКО*/ ,  \n" +
	    			"                                           500000068    /*Іванівське міжрайонне відділення комерційного обліку    Іванівське МВКО*/ ,  \n" +
	    			"                                           500000069    /*Новотроїцьке районне відділення комерційного обліку    Новотроїцьке РВКО*/ ,  \n" +
	    			"                                           500000070    /*Чаплинське міжрайонне відділення комерційного обліку    Чаплинське МВКО*/ ,  \n" +
	    			"                                           500000071    /*Новокаховське міжрайонне відділення комерційного обліку    Новокаховське МВКО*/  \n" +
	    			"                                           )               \n" +
	    			"                         union all   \n" +
	    			"                         select getdepartmentcodesdown4pmm(dp.code), 'Апарат управління (інше)', dp.code as podr_code,  -1 as ord   \n" +
	    			"                         from endepartment dp  where  dp.code = 3   \n" +
	    			"                         union all  \n" +
	    			"                         select getdepartmentcodesdown(dp.code), 'Апарат управління (' || dp.shortname || ')',  dp.code as podr_code,  0 as ord   from endepartment dp  where  dp.code  in (79, 73, 70, 71, 91, 775, 675) \n" +
	    			"                         order by 4, 2         ";

	    	statement = connection.prepareStatement(sql);

	    	resultSet =  statement.executeQuery();


			while(resultSet.next()) {
		    	ENFuelDistributionSheetDepartmentInfo info = new ENFuelDistributionSheetDepartmentInfo();
				info.departmentCodesDown = resultSet.getString(1);
				info.depName = resultSet.getString(2);
				info.code = resultSet.getInt(3);
				list.add(info);
			}

	       return list;
		} catch (SQLException e) {
			throw new PersistenceException("Could not getDepartmentInfoForENFuelDistributionSheet", e);
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(statement != null) {
					statement.close();
				}
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		}


    }
    public Hashtable<Integer, ENFuelDistributionSheetDepartmentInfo> getHashtableOfDepartmentInfoForENFuelDistributionSheet() throws PersistenceException {
    	List<ENFuelDistributionSheetDepartmentInfo> list = this.getListOfDepartmentInfoForENFuelDistributionSheet();
    	Hashtable<Integer, ENFuelDistributionSheetDepartmentInfo> hash = new Hashtable<>();
    	for(int i = 0; i < list.size(); i++) {
    		hash.put(list.get(i).code, list.get(i));
    	}
    	return hash;
    }

 // возвращает строку fincode из finexecutor (код подразделения из кадров) по коду подразделения из аксапты
    public String getpodrFinCodeBypodrAxCodeFromFinexecutor(String podrAxCode) {
        String podrFkCodes = "";

        PreparedStatement statement = null;
        ResultSet set = null;

        String sql = "select distinct fincode from net.finexecutor f where f.axorgid = ? " ;

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, podrAxCode);
            set = statement.executeQuery();

            while (set.next()) {
            	if (podrFkCodes.equals("")){
            		podrFkCodes = "'"+set.getString(1)+"'";
            	} else
            	{
            		podrFkCodes = podrFkCodes + "," +"'"+ set.getString(1)+"'";
            	}

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
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
        }
        return podrFkCodes;
    }


    public Integer getOldRemCode(int newCode) {
    	return BaseDAOUtils.executeStatementAndReadObject(this.connection
    			, "SELECT dd.department_code FROM net.endepartment2department AS dd WHERE dd.ref_department_code = ?"
    			, Arrays.asList(newCode), new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    }

	public String getFINCehCodePodrByRenCode(int renCode) {

        PreparedStatement statement = null;
        ResultSet set = null;
        String sql = null;

        String cehCodePodr = "";

        try {

        	EPRenDAO renDao = new EPRenDAO(connection, userProfile);
        	EPRen ren = renDao.getObject(renCode);


        	sql = "select w.finservicescode "
	        		+ " from endepartment2epren w, endepartment d, epren r "
	        		+ " where d.code = w.departmentrefcode "
	        		+ " and d.datefinal is null "
	        		+ " and d.typerefcode = " + ENDepartmentType.DEPARTMENT
	        		+ " and d.shortname = r.name "
	        		+ " and d.name like '%" + ren.name + "%'" ;


            statement = connection.prepareStatement(sql);
            set = statement.executeQuery();

            while (set.next()) {
            	cehCodePodr = set.getString(1);
			}

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
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
		}

		return cehCodePodr;
	}
	
	/**
	 * 
	 * Получить множество кодов бюджетодержателей
	 * 
	 * Получить множество кодов бюджетодержателей заданных на планах по заданному акту
	 * 
	 * @param act заданный акт
	 * @return
	 * @throws PersistenceException
	 */
	public Set<Integer> getBudgetCodesByAct(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий акт!");
		}
		ENDepartmentDAO dao = new ENDepartmentDAO(connection, userProfile);
		ENDepartmentFilter filter = new ENDepartmentFilter();
		filter.conditionSQL = "EXISTS (SELECT FROM enact2enplanwork AS acpw\n"
				+ "INNER JOIN enplanwork AS pw ON acpw.plancode = pw.code\n"
				+ "WHERE acpw.actrefcode = ?\n"
				+ "AND pw.budgetrefcode = ENDEPARTMENT.code\n)";
		Vector<Integer> binded = new Vector<>(Arrays.asList(act.code));
		int[] arr = dao.getFilteredCodeArray(filter, 0, -1, binded);
		return IntStream.of(arr).boxed().collect(Collectors.toSet());
		
	}

	/**
	 * Возвращает дочерние подразделения для заданного, используя parent-ссылку в таблице {@code DFDEPARTMENT}.
	 * Например, для Західного РУКОЕЕ вернет Олешківське РВКО и Херсонське МВКО.
	 *
	 * @param enDepartmentCode - код подразделения (код {@code com.ksoe.energynet.valueobject.ENDepartment})
	 * @return список кодов подразделений ({@code com.ksoe.energynet.valueobject.ENDepartment})
	 */
	public List<Integer> getChildEnDepartments(int enDepartmentCode) {
		if (enDepartmentCode <= 0) {
			throw new IllegalArgumentException("\n\nНе задано код підрозділу EnergyNet!");
		}

		List<Integer> childDepartments = new ArrayList<>();

		Connection docFlowConnection = null;
		try {
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

			DFDepartmentDAO dfDepatmentDao = new DFDepartmentDAO(docFlowConnection, userProfile);
			DFDepartmentFilter dfDepartmentFilter = new DFDepartmentFilter();
			dfDepartmentFilter.conditionSQL =
					" parentrefcode in ( " +
					"   select d.code " +
					"   from dfdepartment d " +
					"   where d.endepartmentcode = " + enDepartmentCode +
					" )";
			int[] dfDepartmentCodes = dfDepatmentDao.getFilteredCodeArray(dfDepartmentFilter, 0, -1);
			if (dfDepartmentCodes.length == 0) {
				return childDepartments;
			}

			for (int dfDepartmentCode : dfDepartmentCodes) {
				DFDepartment dfDepartment = dfDepatmentDao.getObject(dfDepartmentCode);
				childDepartments.add(dfDepartment.enDepartmentCode);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		return childDepartments;
	}

}
