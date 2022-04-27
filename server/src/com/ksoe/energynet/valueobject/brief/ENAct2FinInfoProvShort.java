
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2FinInfoProv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2FinInfoProvShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int kau_card_object_id = Integer.MIN_VALUE;
	public String kau_card_object_kod;
	public String kau_card_object_name;
	public int kau_element_expenses_id = Integer.MIN_VALUE;
	public String kau_element_expenses_kod;
	public String kau_element_expenses_name;
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


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setKau_card_object_id(int aValue){
		kau_card_object_id = aValue;
	}

	public int getKau_card_object_id(){
		return kau_card_object_id;
	}

	public void setKau_card_object_kod(String aValue){
		kau_card_object_kod = aValue;
	}

	public String getKau_card_object_kod(){
		return kau_card_object_kod;
	}

	public void setKau_card_object_name(String aValue){
		kau_card_object_name = aValue;
	}

	public String getKau_card_object_name(){
		return kau_card_object_name;
	}

	public void setKau_element_expenses_id(int aValue){
		kau_element_expenses_id = aValue;
	}

	public int getKau_element_expenses_id(){
		return kau_element_expenses_id;
	}

	public void setKau_element_expenses_kod(String aValue){
		kau_element_expenses_kod = aValue;
	}

	public String getKau_element_expenses_kod(){
		return kau_element_expenses_kod;
	}

	public void setKau_element_expenses_name(String aValue){
		kau_element_expenses_name = aValue;
	}

	public String getKau_element_expenses_name(){
		return kau_element_expenses_name;
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



}
