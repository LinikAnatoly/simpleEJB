
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDocAttType2Action;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDocAttType2ActionShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;
	public int actionRefCode = Integer.MIN_VALUE;
	public String actionRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}


	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefCode(int typeRefCode) {
		this.typeRefCode = typeRefCode;
	}

	public String getTypeRefName(){
		return typeRefName;
	}

	public void setTypeRefName(String typeRefName) {
		this.typeRefName = typeRefName;
	}

	public int getActionRefCode(){
		return actionRefCode;
	}

	public void setActionRefCode(int actionRefCode) {
		this.actionRefCode = actionRefCode;
	}

	public String getActionRefName(){
		return actionRefName;
	}

	public void setActionRefName(String actionRefName) {
		this.actionRefName = actionRefName;
	}



}
