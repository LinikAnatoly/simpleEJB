
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBuilding2ActTypeWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuilding2ActTypeWorkShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}




}
