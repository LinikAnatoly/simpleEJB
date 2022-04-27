
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement2Distance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2DistanceShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal distance;
	public int elementRefCode = Integer.MIN_VALUE;
	public int transportDepartmentCode = Integer.MIN_VALUE;
	public String transportDepartmentName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public BigDecimal getDistance() {
		return distance;
	}

	public void setDistance(BigDecimal distance) {
		this.distance = distance;
	}


	public int getElementRefCode(){
		return elementRefCode;
	}

	public void setElementRefCode(int elementRefCode) {
		this.elementRefCode = elementRefCode;
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
