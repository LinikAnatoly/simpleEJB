
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSORItems2Post04;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSORItems2Post04Short implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int post04RefCode = Integer.MIN_VALUE;
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
	
	public String post04Name;
	public String line04Name;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setPost04RefCode(int aValue){
		post04RefCode = aValue;
	}
	public int getPost04RefCode(){
		return post04RefCode;
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

	public String getPost04Name() {
		return post04Name;
	}

	public void setPost04Name(String post04Name) {
		this.post04Name = post04Name;
	}

	public String getLine04Name() {
		return line04Name;
	}

	public void setLine04Name(String line04Name) {
		this.line04Name = line04Name;
	}



}