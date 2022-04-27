
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINCurrency;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FINCurrencyShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public String shortName;
	public String isoAlphabeticCode;
	public String isoNumericCode;
	public String sign;


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

	public void setShortName(String aValue){
		shortName = aValue;
	}

	public String getShortName(){
		return shortName;
	}

	public void setIsoAlphabeticCode(String aValue){
		isoAlphabeticCode = aValue;
	}

	public String getIsoAlphabeticCode(){
		return isoAlphabeticCode;
	}

	public void setIsoNumericCode(String aValue){
		isoNumericCode = aValue;
	}

	public String getIsoNumericCode(){
		return isoNumericCode;
	}

	public void setSign(String aValue){
		sign = aValue;
	}

	public String getSign(){
		return sign;
	}




}