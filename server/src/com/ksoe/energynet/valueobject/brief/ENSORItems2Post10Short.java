
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSORItems2Post10;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSORItems2Post10Short implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int post10RefCode = Integer.MIN_VALUE;
	public int sorItemRefCode = Integer.MIN_VALUE;
	public String sorItemRefLocalityName;
	public String sorItemRefAddress;
	public String sorItemRefPylonNumbers;
	public BigDecimal sorItemRefJointLineLenght;
	public String sorItemRefLinePurpose;
	public String sorItemRefJointLineCableMark;
	public String sorItemRefBranchLineName;
	public String sorItemRefUserGen;
	public Date sorItemRefDateEdit;

	public String post10Name;
	public String line10Name;

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setPost10RefCode(int aValue){
		post10RefCode = aValue;
	}
	public int getPost10RefCode(){
		return post10RefCode;
	}

	public void setSorItemRefCode(int aValue){
		sorItemRefCode = aValue;
	}
	public int getSorItemRefCode(){
		return sorItemRefCode;
	}

	public void setSorItemRefLocalityName(String aValue){
		sorItemRefLocalityName = aValue;
	}
	public String getSorItemRefLocalityName(){
		return sorItemRefLocalityName;
	}

	public void setSorItemRefAddress(String aValue){
		sorItemRefAddress = aValue;
	}
	public String getSorItemRefAddress(){
		return sorItemRefAddress;
	}

	public void setSorItemRefPylonNumbers(String aValue){
		sorItemRefPylonNumbers = aValue;
	}
	public String getSorItemRefPylonNumbers(){
		return sorItemRefPylonNumbers;
	}

	public void setSorItemRefJointLineLenght(BigDecimal aValue){
		sorItemRefJointLineLenght = aValue;
	}
	public BigDecimal getSorItemRefJointLineLenght(){
		return sorItemRefJointLineLenght;
	}

	public void setSorItemRefLinePurpose(String aValue){
		sorItemRefLinePurpose = aValue;
	}
	public String getSorItemRefLinePurpose(){
		return sorItemRefLinePurpose;
	}

	public void setSorItemRefJointLineCableMark(String aValue){
		sorItemRefJointLineCableMark = aValue;
	}
	public String getSorItemRefJointLineCableMark(){
		return sorItemRefJointLineCableMark;
	}

	public void setSorItemRefBranchLineName(String aValue){
		sorItemRefBranchLineName = aValue;
	}
	public String getSorItemRefBranchLineName(){
		return sorItemRefBranchLineName;
	}

	public void setSorItemRefUserGen(String aValue){
		sorItemRefUserGen = aValue;
	}
	public String getSorItemRefUserGen(){
		return sorItemRefUserGen;
	}

	public void setSorItemRefDateEdit(Date aValue){
		sorItemRefDateEdit = aValue;
	}
	public Date getSorItemRefDateEdit(){
		return sorItemRefDateEdit;
	}

	public String getPost10Name() {
		return post10Name;
	}

	public void setPost10Name(String post10Name) {
		this.post10Name = post10Name;
	}

	public String getLine10Name() {
		return line10Name;
	}

	public void setLine10Name(String line10Name) {
		this.line10Name = line10Name;
	}



}