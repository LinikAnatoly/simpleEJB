
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2DFDocDecree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2DFDocDecreeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String commentGen;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public String specifications;
	public int numberHours = Integer.MIN_VALUE;
	public int DFDocDecreeCode = Integer.MIN_VALUE;
	public int dfDocCode = Integer.MIN_VALUE;
	public String responsFIO;
	public String responsPosition;
	public String responsGenitiveFIO;
	public String responsGenitivePosition;
	public String responsSurname;
	public String responsSurnameGenitive;
	public String responsName;
	public String responsNameGenitive;
	public String responsPatronimic;
	public String responsPatronimicGenitive;
	public String departmentName;
	public String departmentNameGenitive;
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

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}

	public void setUserAdd(String aValue){
		userAdd = aValue;
	}

	public String getUserAdd(){
		return userAdd;
	}

	public void setDateAdd(Date aValue){
		dateAdd = aValue;
	}

	public Date getDateAdd(){
		return dateAdd;
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


	public void setSpecifications(String aValue){
		specifications = aValue;
	}

	public String getSpecifications(){
		return specifications;
	}

	public void setNumberHours(int aValue){
		numberHours = aValue;
	}

	public int getNumberHours(){
		return numberHours;
	}

	public void setDFDocDecreeCode(int aValue){
		DFDocDecreeCode = aValue;
	}

	public int getDFDocDecreeCode(){
		return DFDocDecreeCode;
	}

	public void setDfDocCode(int aValue){
		dfDocCode = aValue;
	}

	public int getDfDocCode(){
		return dfDocCode;
	}

	public void setResponsFIO(String aValue){
		responsFIO = aValue;
	}

	public String getResponsFIO(){
		return responsFIO;
	}

	public void setResponsPosition(String aValue){
		responsPosition = aValue;
	}

	public String getResponsPosition(){
		return responsPosition;
	}

	public void setResponsGenitiveFIO(String aValue){
		responsGenitiveFIO = aValue;
	}

	public String getResponsGenitiveFIO(){
		return responsGenitiveFIO;
	}

	public void setResponsGenitivePosition(String aValue){
		responsGenitivePosition = aValue;
	}

	public String getResponsGenitivePosition(){
		return responsGenitivePosition;
	}

	public void setResponsSurname(String aValue){
		responsSurname = aValue;
	}

	public String getResponsSurname(){
		return responsSurname;
	}

	public void setResponsSurnameGenitive(String aValue){
		responsSurnameGenitive = aValue;
	}

	public String getResponsSurnameGenitive(){
		return responsSurnameGenitive;
	}

	public void setResponsName(String aValue){
		responsName = aValue;
	}

	public String getResponsName(){
		return responsName;
	}

	public void setResponsNameGenitive(String aValue){
		responsNameGenitive = aValue;
	}

	public String getResponsNameGenitive(){
		return responsNameGenitive;
	}

	public void setResponsPatronimic(String aValue){
		responsPatronimic = aValue;
	}

	public String getResponsPatronimic(){
		return responsPatronimic;
	}

	public void setResponsPatronimicGenitive(String aValue){
		responsPatronimicGenitive = aValue;
	}

	public String getResponsPatronimicGenitive(){
		return responsPatronimicGenitive;
	}

	public void setDepartmentName(String aValue){
		departmentName = aValue;
	}

	public String getDepartmentName(){
		return departmentName;
	}

	public void setDepartmentNameGenitive(String aValue){
		departmentNameGenitive = aValue;
	}

	public String getDepartmentNameGenitive(){
		return departmentNameGenitive;
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
