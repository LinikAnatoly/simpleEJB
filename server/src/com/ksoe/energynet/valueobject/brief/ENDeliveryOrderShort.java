
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDeliveryOrder;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENDeliveryOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int transportInRefCode = Integer.MIN_VALUE; 
    public int transportOutCode = Integer.MIN_VALUE; 

    public String outGosNomer;
    public String outName;
    public String outDriverName;
    
    public String outObject;
    public String outInvNumber;
    public BigDecimal outDistance = null;

    public BigDecimal getOutDistance() {
		return outDistance;
	}
	public void setOutDistance(BigDecimal outDistance) {
		this.outDistance = outDistance;
	}
	public String getOutDriverName() {
		return outDriverName;
	}
	public void setOutDriverName(String outDriverName) {
		this.outDriverName = outDriverName;
	}
	public String getOutGosNomer() {
		return outGosNomer;
	}
	public void setOutGosNomer(String outGosNomer) {
		this.outGosNomer = outGosNomer;
	}
	public String getOutObject() {
		return outObject;
	}
	public void setOutObject(String outObject) {
		this.outObject = outObject;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setTransportInRefCode(int aValue){
       transportInRefCode = aValue;
    }
    public int getTransportInRefCode(){
       return transportInRefCode;
    }
	
    public void setTransportOutCode(int aValue){
       transportOutCode = aValue;
    }
    public int getTransportOutCode(){
       return transportOutCode;
    }
	public String getOutInvNumber() {
		return outInvNumber;
	}
	public void setOutInvNumber(String outInvNumbert) {
		this.outInvNumber = outInvNumbert;
	}
	public String getOutName() {
		return outName;
	}
	public void setOutName(String outName) {
		this.outName = outName;
	}
	



}