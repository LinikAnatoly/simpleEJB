
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanProjectCalculation;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanProjectCalculationShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int tkProjWorkCalculationCode = Integer.MIN_VALUE;
	public String tkProjWorkCalculationName;
	public int projectWorkRefCode = Integer.MIN_VALUE;
	public String projectWorkRefProjectCipher;
	public String projectWorkRefProjectName;
	public String projectWorkRefUserGen;
	public Date projectWorkRefDateEdit;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setTkProjWorkCalculationCode(int aValue){
		tkProjWorkCalculationCode = aValue;
	}
	public int getTkProjWorkCalculationCode(){
		return tkProjWorkCalculationCode;
	}

	public void setTkProjWorkCalculationName(String aValue){
		tkProjWorkCalculationName = aValue;
	}
	public String getTkProjWorkCalculationName(){
		return tkProjWorkCalculationName;
	}

	public void setProjectWorkRefCode(int aValue){
		projectWorkRefCode = aValue;
	}
	public int getProjectWorkRefCode(){
		return projectWorkRefCode;
	}

	public void setProjectWorkRefProjectCipher(String aValue){
		projectWorkRefProjectCipher = aValue;
	}
	public String getProjectWorkRefProjectCipher(){
		return projectWorkRefProjectCipher;
	}

	public void setProjectWorkRefProjectName(String aValue){
		projectWorkRefProjectName = aValue;
	}
	public String getProjectWorkRefProjectName(){
		return projectWorkRefProjectName;
	}

	public void setProjectWorkRefUserGen(String aValue){
		projectWorkRefUserGen = aValue;
	}
	public String getProjectWorkRefUserGen(){
		return projectWorkRefUserGen;
	}

	public void setProjectWorkRefDateEdit(Date aValue){
		projectWorkRefDateEdit = aValue;
	}
	public Date getProjectWorkRefDateEdit(){
		return projectWorkRefDateEdit;
	}



}
