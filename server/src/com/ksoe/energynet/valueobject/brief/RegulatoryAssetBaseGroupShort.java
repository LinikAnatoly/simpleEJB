
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  import java.io.Serializable;


public class RegulatoryAssetBaseGroupShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String number;
	public String name;
	public int parentRefCode = Integer.MIN_VALUE;
	public String parentRefNumber;
	public String parentRefName;
	public Boolean hasChildren;
	public int usefulLife = Integer.MIN_VALUE;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public int getParentRefCode(){
		return parentRefCode;
	}

	public void setParentRefCode(int parentRefCode) {
		this.parentRefCode = parentRefCode;
	}

	public String getParentRefNumber(){
		return parentRefNumber;
	}

	public void setParentRefNumber(String parentRefNumber) {
		this.parentRefNumber = parentRefNumber;
	}

	public String getParentRefName(){
		return parentRefName;
	}

	public void setParentRefName(String parentRefName) {
		this.parentRefName = parentRefName;
	}

	public Boolean getHasChildren() {
		return hasChildren;
	}

	public void setHasChildren(Boolean hasChildren) {
		this.hasChildren = hasChildren;
	}

	public int getUsefulLife() {
		return usefulLife;
	}

	public void setUsefulLife(int usefulLife) {
		this.usefulLife = usefulLife;
	}



}
