
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2Transport;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2TransportShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String invNumber;
	public String name;
	public BigDecimal expense;
	public BigDecimal depreciationMonth;
	public BigDecimal depreciationHours;
	public BigDecimal timeWork;
	public BigDecimal paysWork;
	public BigDecimal repairCostsPerHour;
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
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;
    public int actRefFinDocCode = Integer.MIN_VALUE; 
    public int actRefFinDocMechanicCode = Integer.MIN_VALUE; 


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setExpense(BigDecimal aValue){
		expense = aValue;
	}

	public BigDecimal getExpense(){
		return expense;
	}

	public void setDepreciationMonth(BigDecimal aValue){
		depreciationMonth = aValue;
	}

	public BigDecimal getDepreciationMonth(){
		return depreciationMonth;
	}

	public void setDepreciationHours(BigDecimal aValue){
		depreciationHours = aValue;
	}

	public BigDecimal getDepreciationHours(){
		return depreciationHours;
	}

	public void setTimeWork(BigDecimal aValue){
		timeWork = aValue;
	}

	public BigDecimal getTimeWork(){
		return timeWork;
	}

	public void setPaysWork(BigDecimal aValue){
		paysWork = aValue;
	}

	public BigDecimal getPaysWork(){
		return paysWork;
	}

	public void setRepairCostsPerHour(BigDecimal aValue){
		repairCostsPerHour = aValue;
	}

	public BigDecimal getRepairCostsPerHour(){
		return repairCostsPerHour;
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

	public void setClassificationTypeRefCode(int aValue){
		classificationTypeRefCode = aValue;
	}
	public int getClassificationTypeRefCode(){
		return classificationTypeRefCode;
	}

	public void setClassificationTypeRefName(String aValue){
		classificationTypeRefName = aValue;
	}
	public String getClassificationTypeRefName(){
		return classificationTypeRefName;
	}

	public void setClassificationTypeRefKod(String aValue){
		classificationTypeRefKod = aValue;
	}
	public String getClassificationTypeRefKod(){
		return classificationTypeRefKod;
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

}
