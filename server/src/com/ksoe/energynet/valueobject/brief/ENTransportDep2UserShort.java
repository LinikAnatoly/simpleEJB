
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportDep2User;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportDep2UserShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int transportDepartmentCode = Integer.MIN_VALUE;
	public String transportDepartmentName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}



	public int getTransportDepartmentCode(){
		return transportDepartmentCode;
	}

	public void setTransportDepartmentCode(int transportDepartmentCode) {
		this.transportDepartmentCode = transportDepartmentCode;
	}

	public String getTransportDepartmentName(){
		return transportDepartmentName;
	}

	public void setTransportDepartmentName(String transportDepartmentName) {
		this.transportDepartmentName = transportDepartmentName;
	}



}
