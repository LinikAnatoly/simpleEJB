package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENElementTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.netobjects.dataminer.ENLine04DAO;
import com.ksoe.netobjects.dataminer.ENLine10DAO;
import com.ksoe.netobjects.dataminer.ENLine150DAO;
import com.ksoe.netobjects.dataminer.ENSubstation04DAO;
import com.ksoe.netobjects.dataminer.ENSubstation150DAO;
import com.ksoe.netobjects.valueobject.ENLine04;
import com.ksoe.netobjects.valueobject.ENLine10;
import com.ksoe.netobjects.valueobject.ENLine150;
import com.ksoe.netobjects.valueobject.ENSubstation04;
import com.ksoe.netobjects.valueobject.ENSubstation150;
import com.ksoe.netobjects.valueobject.filter.ENLine04Filter;
import com.ksoe.netobjects.valueobject.filter.ENLine10Filter;
import com.ksoe.netobjects.valueobject.filter.ENLine150Filter;
import com.ksoe.netobjects.valueobject.filter.ENSubstation04Filter;
import com.ksoe.netobjects.valueobject.filter.ENSubstation150Filter;
import com.ksoe.netobjects.valueobject.lists.ENLine04ShortList;
import com.ksoe.netobjects.valueobject.lists.ENLine10ShortList;
import com.ksoe.netobjects.valueobject.lists.ENLine150ShortList;
import com.ksoe.netobjects.valueobject.lists.ENSubstation04ShortList;
import com.ksoe.netobjects.valueobject.lists.ENSubstation150ShortList;

public class ElementLogic extends LogicModule {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 
	 * 
	 * Добавляет новый элемент и возвращает его код
	 * 
	 * @param departmentCode код подразделения
	 * @param typeCode код типа элемента
	 * @return код созданного элемента
	 * @throws PersistenceException
	 */
	public int addElement(int departmentCode, int typeCode) throws PersistenceException {
		if(typeCode == Integer.MIN_VALUE) {
			throw new SystemException("Помилка - незаповнений тип елемента");
		}
		ENElementDAO dao = new ENElementDAO(connection, userProfile);
		DepartmentLogic departmentLogic = new DepartmentLogic(connection, userProfile);
		
		ENElement e = new ENElement();
		e.code = Integer.MIN_VALUE;
		if(departmentCode != Integer.MIN_VALUE) {
			e.renRef.code = departmentLogic.getEPRen2Department(departmentCode);	
		}
		e.typeRef.code = typeCode;
		e.code = dao.add(e);
		return e.code;
	}

	public int getElementTypeByPlanCode(int planCode) throws PersistenceException
	{
		int out = Integer.MIN_VALUE;

		ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
		out =getElementTypeByPlan(dao.getObjectNOSEGR(planCode));
		return out;
	}
	public String getElementInvNumber(int elementCode) throws PersistenceException
	{
		/*Берет инвентарный из основных */
		String invNumber = "";

		String sql = "select invnumber from enelementdata where ecode = " +elementCode;

		PreparedStatement statement = null;
		ResultSet  resultSet = null;

		try {

			String strOut = "";
			boolean boolOut = false;

			statement = connection.prepareStatement(sql);

			resultSet = statement.executeQuery();

			while(resultSet.next())
			{
				invNumber = resultSet.getString(1);
			}

			if(invNumber == null)
				invNumber="";

			return invNumber;
		}
		catch (SQLException e) {
			System.out.println(	e.getMessage());
			throw new PersistenceException(e.getMessage());
	}
		finally {
	     try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	}


	}

	public int getElementTypeByPlanNOSEGR(ENPlanWork plan) throws PersistenceException
	{
		int out = Integer.MIN_VALUE;
		out = getElementTypeByCode(plan.elementRef.code, false);
		return out;
	}

	public int getElementTypeByPlan(ENPlanWork plan) throws PersistenceException
	{
		int out = Integer.MIN_VALUE;
		out = getElementTypeByCode(plan.elementRef.code);
		return out;
	}


	public int getElementTypeByCode(int elementCode) throws PersistenceException
	{
		int out = Integer.MIN_VALUE;
		ENElementDAO dao = new ENElementDAO(connection, userProfile);
		out = dao.getObject(elementCode, false).typeRef.code;
		return out;

	}

	public int getElementTypeByCode(int elementCode, boolean isSegregation) throws PersistenceException
	{
		int out = Integer.MIN_VALUE;
		ENElementDAO dao = new ENElementDAO(connection, userProfile);
		out = dao.getObject(elementCode, isSegregation).typeRef.code;
		return out;

	}

	public ENElement getElementByCode(int elementCode) throws PersistenceException
	{
		ENElement out = null;
		ENElementDAO dao = new ENElementDAO(connection, userProfile);
		out = dao.getObject(elementCode, false);
		return out;
	}
	
	public String[] getNameByCode(int elementCode) throws PersistenceException{
		ENElementDAO dao = new ENElementDAO(connection, userProfile);
		ENElement obj = dao.getObject(elementCode);
		return getNameByCode(elementCode, obj.typeRef.code);
	}

	/**
	 * 
	 * Возвращает массив из двух элементов - первый тип и наименование объекта, 
	 * 	а второй - инвентарный номер объекта
	 * 
	 * @param elementCode код элемента
	 * @param typeCode код типа
	 * @return
	 * @throws PersistenceException
	 */
	public String[] getNameByCode(int elementCode, int typeCode)throws PersistenceException{
		String outName[] = new String[2];
		outName[0] = "undefine";
		outName[1] = "";

		switch (typeCode)
	    {
	    case ENElementType.LINE04 :
	    	outName[0] = "(ПЛ 0.4) ";
	    	ENLine04 l04 = getLine04ByElementCode(elementCode);
	    	outName[0] += l04.name;
	    	outName[1] = l04.invNumber;
	        break;

	    case ENElementType.LINE10 :
	        outName[0] = "(ПЛ 6-10) ";
	        ENLine10 l10 = getLine10ByElementCode(elementCode);
	        outName[0] += l10.name;
	        outName[1] = l10.invNumber;
	        break;

	    case ENElementType.SUBSTATION04 :
	        outName[0] = "(ПC 6-10/0.4) ";
	        ENSubstation04 s04 = getSubstation04ByElementCode(elementCode);
	        outName[0] += s04.name;
	        outName[1] = s04.invNumber;
	        break;

	    case ENElementType.LINE150 :
	        outName[0] = "(ПЛ 150-35) ";
	        ENLine150 l150 = getLine150ByElementCode(elementCode);
	        outName[0] += l150.name;
	        outName[1] = l150.invNumber;
	        break;

	    case ENElementType.SUBSTATION150 :
	        outName[0] = "(ПС 150-35) ";
	        ENSubstation150 s150 = getSubstation150ByElementCode(elementCode);
	        outName[0] += s150.name;
	        outName[1] = s150.invNumber;
	        break;

	    default :
	    	
	    	ENElementTypeDAO elementTypeDao = new ENElementTypeDAO(connection, userProfile);
	    	
	    	ENElementType elementType = elementTypeDao.getObject(typeCode);
	    	if(elementType == null) {
		    	throw new EnergyproSystemException("getNameByCode: unknown elementType =" + typeCode);	    		
	    	}
	    	
	    	String sql = "select e.ename, e.invnumber from enelementdata as e where e.ecode = ?";
	    	Vector<Integer> params = new Vector<Integer>();
	    	params.add(elementCode);
	    	Object[] arr = BaseDAOUtils.executeStatementAndReadObject(connection, sql, params
	    			, new BaseDAOUtils.ObjectArrayFromResultSetTransformator(), false);
	    	
	    	if(arr != null && arr.length == 2) {
		    	outName[0] = String.format("(%s) %s", elementType.name, (arr[0] != null ? arr[0] : null));
		    	outName[1] = (arr[1] != null) ? arr[1].toString() : null;	    		
	    	}


	    }	// SWITCH elementType

		return outName;
	}


	public ENLine04 getLine04ByElementCode(int elementCode) throws PersistenceException
	{
		ENLine04DAO dao = new ENLine04DAO(connection, userProfile);
		ENLine04Filter f = new ENLine04Filter();
		f.element.code = elementCode;

		ENLine04ShortList l = dao.getScrollableFilteredList(f,0,-1);
		if (l.totalCount == 1){
			ENLine04 out = dao.getObject(l.get(0).code);
			return out;
		}else
			throw new EnergyproSystemException("getSubstation04ByElementCode: ENSubstation04 not found by elementCode=" + elementCode);
	}

	public ENLine10 getLine10ByElementCode(int elementCode) throws PersistenceException
	{
		ENLine10DAO dao = new ENLine10DAO(connection, userProfile);
		ENLine10Filter f = new ENLine10Filter();
		f.element.code = elementCode;

		ENLine10ShortList l = dao.getScrollableFilteredList(f,0,-1);
		if (l.totalCount == 1){
			ENLine10 out = dao.getObject(l.get(0).code);
			return out;
		}else
			throw new EnergyproSystemException("getSubstation04ByElementCode: ENSubstation04 not found by elementCode=" + elementCode);
	}

	public ENLine150 getLine150ByElementCode(int elementCode) throws PersistenceException
	{
		ENLine150DAO dao = new ENLine150DAO(connection, userProfile);
		ENLine150Filter f = new ENLine150Filter();
		f.element.code = elementCode;

		ENLine150ShortList l = dao.getScrollableFilteredList(f,0,-1);
		if (l.totalCount == 1){
			ENLine150 out = dao.getObject(l.get(0).code);
			return out;
		}else
			throw new EnergyproSystemException("getSubstation04ByElementCode: ENSubstation04 not found by elementCode=" + elementCode);
	}

	public ENSubstation04 getSubstation04ByElementCode(int elementCode) throws PersistenceException
	{
		ENSubstation04DAO dao = new ENSubstation04DAO(connection, userProfile);
		ENSubstation04Filter f = new ENSubstation04Filter();
		f.element.code = elementCode;

		ENSubstation04ShortList l = dao.getScrollableFilteredList(f,0,-1);
		if (l.totalCount == 1){
			ENSubstation04 out = dao.getObject(l.get(0).code);
			return out;
		}else
			throw new EnergyproSystemException("getSubstation04ByElementCode: ENSubstation04 not found by elementCode=" + elementCode);
	}

	public ENSubstation150 getSubstation150ByElementCode(int elementCode) throws PersistenceException
	{
		ENSubstation150DAO dao = new ENSubstation150DAO(connection, userProfile);
		ENSubstation150Filter f = new ENSubstation150Filter();
		f.element.code = elementCode;

		ENSubstation150ShortList l = dao.getScrollableFilteredList(f,0,-1);
		if (l.totalCount == 1){
			ENSubstation150 out = dao.getObject(l.get(0).code);
			return out;
		}else
			throw new EnergyproSystemException("getSubstation150ByElementCode: ENSubstation04 not found by elementCode=" + elementCode);
	}

	public int getElementCodeByPlanCode(int planCode)
			throws PersistenceException {
		int out = Integer.MIN_VALUE;
		ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
		out = getElementCodeByPlan(dao.getObjectNOSEGR(planCode));
		return out;
	}

	public int getElementCodeByPlan(ENPlanWork plan)
			throws PersistenceException {
		int out = Integer.MIN_VALUE;
		out = plan.elementRef.code;
		return out;
	}

	public String getRepairElementInvNumber(int elementCode)
			throws PersistenceException {
		String invNumber = "";

		String sql = " select d.invnumber from enelementdata d where d.ecode = ( " +
				" select p.elementrefcode from enplanwork p where p.code = ( " +
				" select e.planrefcode from enestimateitem e where e.code = ( " +
				" select ee.estimateitemrefcode " +
				" from enelement2estimateitem ee where ee.elementrefcode = " + elementCode +
				" ))) ";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {

			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				invNumber = resultSet.getString(1);
			}

			if (invNumber == null)
				invNumber = "";

			return invNumber;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}
	
	
	/**
	 * инвентарный номер объекта на плане по естимейту 
	 * 
	 * */
	public String getElementInvNumberByIstimateItemCode(int enestimateitemcode) throws PersistenceException
	{

		String invNumber = "";

		String sql = " select eld.invnumber from enestimateitem ei , enplanwork p , enelementdata eld " + 
				" where ei.code = " + enestimateitemcode  +
				" and ei.planrefcode = p.code  " +
				" and p.elementrefcode = eld.ecode " ;

		PreparedStatement statement = null;
		ResultSet  resultSet = null;

		try {

			String strOut = "";
			boolean boolOut = false;

			statement = connection.prepareStatement(sql);

			resultSet = statement.executeQuery();

			while(resultSet.next())
			{
				invNumber = resultSet.getString(1);
			}

			if(invNumber == null)
				invNumber="";

			return invNumber;
		}
		catch (SQLException e) {
			System.out.println(	e.getMessage());
			throw new PersistenceException(e.getMessage());
	}
		finally {
	     try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	}


	}

	  public ElementLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }


}
