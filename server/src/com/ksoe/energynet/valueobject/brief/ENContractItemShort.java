
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENContractItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENContractItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public BigDecimal price;
    public BigDecimal cost;
    public BigDecimal countReal;
    public String userGen;
    public Date dateEdit ;
    public int materialCode = Integer.MIN_VALUE;
    public String materialName;
    public int contractCode = Integer.MIN_VALUE;
    public String contractContractNumber;
    public Date contractContractDate;
    public String contractFinDocCode;
    public int contractFinDocID = Integer.MIN_VALUE;
    public String contractUserGen;
    public Date contractDateEdit;
    
    public BigDecimal countBinded;
    public BigDecimal countRest;
    public Date contractEndDate;
    
    public BigDecimal countbinded;

    public BigDecimal getCountbinded() {
		return countbinded;
	}

	public void setCountbinded(BigDecimal countbinded) {
		this.countbinded = countbinded;
	}

	public BigDecimal getCountBinded() {
		return countBinded;
	}

	public void setCountBinded(BigDecimal countBinded) {
		this.countBinded = countBinded;
	}

	public BigDecimal getCountRest() {
		return countRest;
	}

	public void setCountRest(BigDecimal countRest) {
		this.countRest = countRest;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }
    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }
    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }
    public void setCountReal(BigDecimal aValue){
       countReal = aValue;
    }

    public BigDecimal getCountReal(){
       return countReal;
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


    public void setMaterialCode(int aValue){
       materialCode = aValue;
    }
    public int getMaterialCode(){
       return materialCode;
    }

    public void setMaterialName(String aValue){
       materialName = aValue;
    }
    public String getMaterialName(){
       return materialName;
    }

    public void setContractCode(int aValue){
       contractCode = aValue;
    }
    public int getContractCode(){
       return contractCode;
    }

    public void setContractContractNumber(String aValue){
       contractContractNumber = aValue;
    }
    public String getContractContractNumber(){
       return contractContractNumber;
    }


    public void setContractContractDate(Date aValue){
       contractContractDate = aValue;
    }
    public Date getContractContractDate(){
       return contractContractDate;
    }

    public void setContractFinDocCode(String aValue){
       contractFinDocCode = aValue;
    }
    public String getContractFinDocCode(){
       return contractFinDocCode;
    }

    public void setContractFinDocID(int aValue){
       contractFinDocID = aValue;
    }
    public int getContractFinDocID(){
       return contractFinDocID;
    }

    public void setContractUserGen(String aValue){
       contractUserGen = aValue;
    }
    public String getContractUserGen(){
       return contractUserGen;
    }


    public void setContractDateEdit(Date aValue){
       contractDateEdit = aValue;
    }
    public Date getContractDateEdit(){
       return contractDateEdit;
    }



}