
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPriorityCoefficient;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPriorityCoefficientShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal value6;
	public BigDecimal value35;
	public BigDecimal value150;
	public String userGen;
	public Date dateEdit ;
	public int elementTypeRefCode = Integer.MIN_VALUE;
	public String elementTypeRefName;
	public int coeffTypeRefCode = Integer.MIN_VALUE;
	public String coeffTypeRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public BigDecimal getValue6() {
		return value6;
	}

	public void setValue6(BigDecimal value6) {
		this.value6 = value6;
	}

	public BigDecimal getValue35() {
		return value35;
	}

	public void setValue35(BigDecimal value35) {
		this.value35 = value35;
	}

	public BigDecimal getValue150() {
		return value150;
	}

	public void setValue150(BigDecimal value150) {
		this.value150 = value150;
	}


	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}


	public int getElementTypeRefCode(){
		return elementTypeRefCode;
	}

	public void setElementTypeRefCode(int elementTypeRefCode) {
		this.elementTypeRefCode = elementTypeRefCode;
	}

	public String getElementTypeRefName(){
		return elementTypeRefName;
	}

	public void setElementTypeRefName(String elementTypeRefName) {
		this.elementTypeRefName = elementTypeRefName;
	}

	public int getCoeffTypeRefCode(){
		return coeffTypeRefCode;
	}

	public void setCoeffTypeRefCode(int coeffTypeRefCode) {
		this.coeffTypeRefCode = coeffTypeRefCode;
	}

	public String getCoeffTypeRefName(){
		return coeffTypeRefName;
	}

	public void setCoeffTypeRefName(String coeffTypeRefName) {
		this.coeffTypeRefName = coeffTypeRefName;
	}



}
