
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2FinKodIst;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2FinKodIstShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefFinDocCode = Integer.MIN_VALUE;
	public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public int kodIstRefCode = Integer.MIN_VALUE;
	public String kodIstRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setActRefCode(int aValue){
		actRefCode = aValue;
	}
	public int getActRefCode(){
		return actRefCode;
	}

	public void setActRefNumberGen(String aValue){
		actRefNumberGen = aValue;
	}
	public String getActRefNumberGen(){
		return actRefNumberGen;
	}

	public void setActRefDateGen(Date aValue){
		actRefDateGen = aValue;
	}
	public Date getActRefDateGen(){
		return actRefDateGen;
	}

	public void setActRefFinDocCode(int aValue){
		actRefFinDocCode = aValue;
	}
	public int getActRefFinDocCode(){
		return actRefFinDocCode;
	}

	public void setActRefFinDocMechanicCode(int aValue){
		actRefFinDocMechanicCode = aValue;
	}
	public int getActRefFinDocMechanicCode(){
		return actRefFinDocMechanicCode;
	}

	public void setActRefFinMolName(String aValue){
		actRefFinMolName = aValue;
	}
	public String getActRefFinMolName(){
		return actRefFinMolName;
	}

	public void setActRefFinMechanicName(String aValue){
		actRefFinMechanicName = aValue;
	}
	public String getActRefFinMechanicName(){
		return actRefFinMechanicName;
	}

	public void setActRefInvNumber(String aValue){
		actRefInvNumber = aValue;
	}
	public String getActRefInvNumber(){
		return actRefInvNumber;
	}

	public void setActRefUserGen(String aValue){
		actRefUserGen = aValue;
	}
	public String getActRefUserGen(){
		return actRefUserGen;
	}

	public void setActRefDateEdit(Date aValue){
		actRefDateEdit = aValue;
	}
	public Date getActRefDateEdit(){
		return actRefDateEdit;
	}

	public void setActRefDateAct(Date aValue){
		actRefDateAct = aValue;
	}
	public Date getActRefDateAct(){
		return actRefDateAct;
	}

	public void setKodIstRefCode(int aValue){
		kodIstRefCode = aValue;
	}
	public int getKodIstRefCode(){
		return kodIstRefCode;
	}

	public void setKodIstRefName(String aValue){
		kodIstRefName = aValue;
	}
	public String getKodIstRefName(){
		return kodIstRefName;
	}



}