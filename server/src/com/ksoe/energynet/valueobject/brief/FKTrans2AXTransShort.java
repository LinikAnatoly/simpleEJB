
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FKTrans2AXTrans;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FKTrans2AXTransShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int monthGen = Integer.MIN_VALUE;
	public int yearGen = Integer.MIN_VALUE;
	public String taskOwner;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setMonthGen(int aValue){
		monthGen = aValue;
	}

	public int getMonthGen(){
		return monthGen;
	}

	public void setYearGen(int aValue){
		yearGen = aValue;
	}

	public int getYearGen(){
		return yearGen;
	}

	public void setTaskOwner(String aValue){
		taskOwner = aValue;
	}

	public String getTaskOwner(){
		return taskOwner;
	}




}