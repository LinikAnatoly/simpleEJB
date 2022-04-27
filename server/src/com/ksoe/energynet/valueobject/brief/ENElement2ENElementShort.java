
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement2ENElement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2ENElementShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int elementInRefCode = Integer.MIN_VALUE;
	public int elementOutRefCode = Integer.MIN_VALUE;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setElementInRefCode(int aValue){
		elementInRefCode = aValue;
	}
	public int getElementInRefCode(){
		return elementInRefCode;
	}

	public void setElementOutRefCode(int aValue){
		elementOutRefCode = aValue;
	}
	public int getElementOutRefCode(){
		return elementOutRefCode;
	}

	public void setTypeRefCode(int aValue){
		typeRefCode = aValue;
	}
	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefName(String aValue){
		typeRefName = aValue;
	}
	public String getTypeRefName(){
		return typeRefName;
	}



}