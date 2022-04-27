
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPowerReliabilityCategory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPowerReliabilityCategoryShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;
	public BigDecimal coef;
	public int settleTypeRefCode = Integer.MIN_VALUE;
	public String settleTypeRefName;
	public BigDecimal settleTypeRefCoef;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setCoef(BigDecimal aValue){
		coef = aValue;
	}

	public BigDecimal getCoef(){
		return coef;
	}


	public void setSettleTypeRefCode(int aValue){
		settleTypeRefCode = aValue;
	}
	public int getSettleTypeRefCode(){
		return settleTypeRefCode;
	}

	public void setSettleTypeRefName(String aValue){
		settleTypeRefName = aValue;
	}
	public String getSettleTypeRefName(){
		return settleTypeRefName;
	}

	public void setSettleTypeRefCoef(BigDecimal aValue){
		settleTypeRefCoef = aValue;
	}
	public BigDecimal getSettleTypeRefCoef(){
		return settleTypeRefCoef;
	}



}
