
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSettings;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSettingsShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String key;
	public String comment;
	public String currentValue;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setKey(String aValue){
		key = aValue;
	}

	public String getKey(){
		return key;
	}

	public void setComment(String aValue){
		comment = aValue;
	}

	public String getComment(){
		return comment;
	}
	
	public void setCurrentValue(String value) {
		this.currentValue = value;
	}
	
	public String getCurrentValue() {
		return this.currentValue;
	}




}