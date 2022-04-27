
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRealRepair;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportRealRepairShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateStart ;
	public Date dateFinal ;
	public String userGen;
	public Date dateEdit ;
	public String commentGen;
	public int realTransportCode = Integer.MIN_VALUE;
	public String realTransportName;
	public String realTransportInvNumber;
	public String realTransportGosNumber;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDateStart(Date aValue){
		dateStart = aValue;
	}

	public Date getDateStart(){
		return dateStart;
	}

	public void setDateFinal(Date aValue){
		dateFinal = aValue;
	}

	public Date getDateFinal(){
		return dateFinal;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}


	public void setRealTransportCode(int aValue){
		realTransportCode = aValue;
	}
	public int getRealTransportCode(){
		return realTransportCode;
	}

	public void setRealTransportName(String aValue){
		realTransportName = aValue;
	}
	public String getRealTransportName(){
		return realTransportName;
	}

	public void setRealTransportInvNumber(String aValue){
		realTransportInvNumber = aValue;
	}
	public String getRealTransportInvNumber(){
		return realTransportInvNumber;
	}

	public void setRealTransportGosNumber(String aValue){
		realTransportGosNumber = aValue;
	}
	public String getRealTransportGosNumber(){
		return realTransportGosNumber;
	}



}
