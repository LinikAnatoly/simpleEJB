
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSealColors;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSealColorsShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public int materialRefCode = Integer.MIN_VALUE;
	public String materialRefName;
	public BigDecimal materialRefCost;
	public int materialRefDeliveryDate = Integer.MIN_VALUE;
	public String materialRefNumkatalog;
	public String materialRefIdentid;


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


	public void setMaterialRefCode(int aValue){
		materialRefCode = aValue;
	}
	public int getMaterialRefCode(){
		return materialRefCode;
	}

	public void setMaterialRefName(String aValue){
		materialRefName = aValue;
	}
	public String getMaterialRefName(){
		return materialRefName;
	}

	public void setMaterialRefCost(BigDecimal aValue){
		materialRefCost = aValue;
	}
	public BigDecimal getMaterialRefCost(){
		return materialRefCost;
	}

	public void setMaterialRefDeliveryDate(int aValue){
		materialRefDeliveryDate = aValue;
	}
	public int getMaterialRefDeliveryDate(){
		return materialRefDeliveryDate;
	}

	public void setMaterialRefNumkatalog(String aValue){
		materialRefNumkatalog = aValue;
	}
	public String getMaterialRefNumkatalog(){
		return materialRefNumkatalog;
	}

	public void setMaterialRefIdentid(String aValue){
		materialRefIdentid = aValue;
	}
	public String getMaterialRefIdentid(){
		return materialRefIdentid;
	}



}