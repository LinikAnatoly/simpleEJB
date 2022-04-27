
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement2Act;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2ActShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int elementRefCode = Integer.MIN_VALUE;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public String actRefFinMolCode;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public String actRefMolCodeObject;
	public Boolean actRefCheckedByAccountant;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setElementRefCode(int aValue){
		elementRefCode = aValue;
	}
	public int getElementRefCode(){
		return elementRefCode;
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

	public void setActRefFinMolCode(String aValue){
		actRefFinMolCode = aValue;
	}
	public String getActRefFinMolCode(){
		return actRefFinMolCode;
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

	public void setActRefMolCodeObject(String aValue){
		actRefMolCodeObject = aValue;
	}
	public String getActRefMolCodeObject(){
		return actRefMolCodeObject;
	}

	public void setActRefCheckedByAccountant(Boolean aValue){
		actRefCheckedByAccountant = aValue;
	}
	public Boolean getActRefCheckedByAccountant(){
		return actRefCheckedByAccountant;
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
