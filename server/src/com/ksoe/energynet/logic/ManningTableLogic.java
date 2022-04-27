package com.ksoe.energynet.logic;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENManningTableDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENManningTable;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterialsFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;
import com.ksoe.techcard.valueobject.lists.TKMaterialsShortList;

public class ManningTableLogic extends LogicModule{

	public String getFullDepartmentName(int manningCode) throws PersistenceException
	{
		ENManningTableDAO md = new ENManningTableDAO(connection, userProfile);
		ENManningTable m = md.getObject(manningCode);

		return m.position.name +" " + getDepartmentNamesUp(m.department.code,"");
	}

	public String getDepartmentCodesDownFromFK(int departmentCode, int[] arr) throws PersistenceException
	{
	    String outStr = "";
		outStr = getDepartmentCodesDownFromFK(departmentCode,outStr,arr);
		return outStr;
	}

	public String getDepartmentCodesDownFromFK(int departmentCode) throws PersistenceException
	{
	    String outStr = "";
		outStr = getDepartmentCodesDownFromFK(departmentCode,outStr,null);
		return outStr;
	}

	private boolean codeInArray(int code, int[] arr){
		boolean out = false;

		if ( arr == null){
			return true;
		}

		for (int i=0; i< arr.length; i++){
			if (code == arr[i]){
				return true;
			}
		}
		return out;
	}

	public String getDepartmentCodesDownFromFK(int departmentCode, String codesIn, int[] departmentType) throws PersistenceException
	{
		String codes = "";
		FINExecutorFilter f = new FINExecutorFilter();
		//f.parentRef.code = departmentCode;
		//f.conditionSQL = "p.Main_Podr_Id = " + departmentCode;

		f.finCehCode = departmentCode;

		FINExecutorDAO d = new FINExecutorDAO(connection, userProfile);
		FINExecutorShortList l = d.getFINExecutorList(f,0,-1); // getScrollableFilteredList(f,0,-1);

		if (l.totalCount > 0){
			for (int i=0; i < l.totalCount; i++){
			    if (codes.length() == 0 )
				    codes = getDepartmentCodesDownFromFK( l.get(i).finCode , codesIn, departmentType);
			    else
			    	codes = codes + ", " + getDepartmentCodesDownFromFK( l.get(i).finCode , codesIn, departmentType);
			}
		}

		// выясним тип подразделения текущего Департмента
		FINExecutorFilter f1 = new FINExecutorFilter();
		f1.finCode = departmentCode;


		FINExecutorShortList ll = d.getFINExecutorList(f1,0,-1);

		if (codeInArray( ll.get(0).finKindCode , departmentType)) // определиться КИНД или ТАЙП ;)
		{
			if (codes.length() == 0 )
				codes = "" + departmentCode;
			else
				codes += ", " + departmentCode;
			}
		else
			codes = "";

		return codesIn + codes;
	}

	public String getDepartmentNamesUp(int departmentCode, String namesIn) throws PersistenceException
	{
		String names = "";

		ENDepartmentDAO d = new ENDepartmentDAO(connection, userProfile);
		ENDepartment o = d.getObject(departmentCode);


		if (o.parentRef.code > Integer.MIN_VALUE){
			ENDepartmentFilter f = new ENDepartmentFilter();
			f.code = o.parentRef.code;

			ENDepartmentShortList l = d.getScrollableFilteredList(f,0,-1);


			if (l.totalCount > 0){

     			for (int i=0; i < l.totalCount; i++){
    				//if ( l.get(i).typeRefCode != 0)
    				{
				    	names = getDepartmentNamesUp( l.get(i).code , namesIn) + " " + names;
    				}
				}

     			//if (l.get(0).typeRefCode != 0)
     			if (o.typeRef.code != 0)
				  //names = l.get(0).shortName + " " + names;
     				names = o.shortName + " " + names;
			}
		} // нужный тип департмента



		return names + namesIn;
		/*}
		else
			//return namesIn ;//+ o.shortName;
		{
			if (o.parentRef.code > Integer.MIN_VALUE)
			    return getDepartmentNamesUp(o.parentRef.code, namesIn);
			else
				return names + namesIn;
		}*/
	}

	public String getDepartmentCodesDown(int departmentCode) throws PersistenceException
	{
	    String outStr = "";
		outStr = getDepartmentCodesDown(departmentCode,outStr);
		return outStr;
	}

	public String getDepartmentCodesDown(int departmentCode, String codesIn) throws PersistenceException {
		return 	this.getDepartmentCodesDown(departmentCode, codesIn, null);
	}

	public String getDepartmentCodesDown(int departmentCode, String codesIn, String codesExclude) throws PersistenceException
	{
		String codes = "";
		ENDepartmentFilter f = new ENDepartmentFilter();
		f.parentRef.code = departmentCode;
		if(codesExclude != null && codesExclude.length() > 0) {
			f.conditionSQL = String.format("%s not in (%s)", ENDepartment.code_QFielld, codesExclude);
		}
		ENDepartmentDAO d = new ENDepartmentDAO(connection, userProfile);
		ENDepartmentShortList l = d.getScrollableFilteredList(f,0,-1);

		if (l.totalCount > 0){
			for (int i=0; i < l.totalCount; i++){
			    if (codes.length() == 0 )
				    codes = getDepartmentCodesDown( l.get(i).code , codesIn);
			    else
			    	codes = codes + ", " + getDepartmentCodesDown( l.get(i).code , codesIn);
			}
		}
		if (codes.length() == 0 )
			codes = "" + departmentCode;
		else
			codes += ", " + departmentCode;

		return codesIn + codes;

	}

	public String getAXDepartmentCodesDown(int departmentCode) throws PersistenceException
	{
	    String outStr = "";
		outStr = getAXDepartmentCodesDown(departmentCode,outStr);
		return outStr;
	}
	
	public String getAXDepartmentCodesDown(int departmentCode, String codesIn) throws PersistenceException
	{
		String codes = "";
		ENDepartmentFilter f = new ENDepartmentFilter();
		f.parentRef.code = departmentCode;
		ENDepartmentDAO d = new ENDepartmentDAO(connection, userProfile);
		ENDepartmentShortList l = d.getScrollableFilteredList(f,0,-1);

		if (l.totalCount > 0){
			for (int i=0; i < l.totalCount; i++){
			    if (codes.length() == 0 )
				    codes = getAXDepartmentCodesDown( l.get(i).code , codesIn);
			    else
			    	codes = codes + ", " + getAXDepartmentCodesDown( l.get(i).code , codesIn);
			}
		}
		
		ENDepartment department = d.getObject(departmentCode);
		String axOrgId = department.hrmorganizationid;
		
		if (codes.length() == 0 )
			codes = "'" + axOrgId + "'";
		else
			codes += ", '" + axOrgId + "'";

		return codesIn + codes;
	}	
	
	public void getCodesDepartmentsDown1(int departmentCode, String codes){


	}


	public String getTKclassificationtypeCodesDown(int classificationtypeCode) throws PersistenceException
	{
	    String outStr = "";
		outStr = getTKclassificationtypeCodesDown(classificationtypeCode,outStr);
		return outStr;
	}

	public String getTKclassificationtypeCodesDown(int classificationtypeCode, String codesIn) throws PersistenceException
	{
		
		String codes = "";
		TKClassificationTypeFilter f = new TKClassificationTypeFilter();
		f.parentRef.code = classificationtypeCode;
		TKClassificationTypeDAO d = new TKClassificationTypeDAO(connection, userProfile);
		TKClassificationTypeShortList l = d.getScrollableFilteredList(f,0,-1);

		if (l.totalCount > 0){
			for (int i=0; i < l.totalCount; i++){
			    if (codes.length() == 0 )
				    codes = getTKclassificationtypeCodesDown( l.get(i).code , codesIn);
			    else
			    	codes = codes + ", " + getTKclassificationtypeCodesDown( l.get(i).code , codesIn);
			}
		}
		if (codes.length() == 0 )
			codes = "" + classificationtypeCode;
		else
			codes += ", " + classificationtypeCode;

		return codesIn + codes;

	}
	
	public String getTKMaterialsCodesDown(int materialCode) throws PersistenceException
	{
	    String outStr = "";
		outStr = getTKMaterialsCodesDown(materialCode,outStr);
		return outStr;
	}

	public String getTKMaterialsCodesDown(int materialCode, String codesIn) throws PersistenceException
	{
		String codes = "";		
		TKMaterialsFilter f = new TKMaterialsFilter();
		f.parentRef.code = materialCode;
		TKMaterialsDAO d = new TKMaterialsDAO(connection, userProfile);
		TKMaterialsShortList l = d.getScrollableFilteredList(f,0,-1);

		if (l.totalCount > 0){
			for (int i=0; i < l.totalCount; i++){
			    if (codes.length() == 0 )
				    codes = getTKMaterialsCodesDown( l.get(i).code , codesIn);
			    else
			    	codes = codes + "," + getTKMaterialsCodesDown( l.get(i).code , codesIn);
			}
		}
		if (codes.length() == 0 )
			codes = "" + materialCode;
		else
			codes += "," + materialCode;

		return codesIn + codes;

	}

	  public ManningTableLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }

}
