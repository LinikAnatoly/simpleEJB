
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENInvestProgramItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENInvestProgramItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String commentGen;
    public BigDecimal countGen;
    public BigDecimal price;
    public BigDecimal sumGen;
    public BigDecimal quarter1count;
    public BigDecimal quarter1sum;
    public BigDecimal quarter2count;
    public BigDecimal quarter2sum;
    public BigDecimal quarter3count;
    public BigDecimal quarter3sum;
    public BigDecimal quarter4count;
    public BigDecimal quarter4sum;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int investProgramRefCode = Integer.MIN_VALUE;
    public String investProgramRefName;
    public int investProgramRefYearGen = Integer.MIN_VALUE;
    public String investProgramRefCommentGen;
    public BigDecimal investProgramRefCountGen;
    public BigDecimal investProgramRefPrice;
    public BigDecimal investProgramRefSumGen;
    public BigDecimal investProgramRefQuarter1count;
    public BigDecimal investProgramRefQuarter1sum;
    public BigDecimal investProgramRefQuarter2count;
    public BigDecimal investProgramRefQuarter2sum;
    public BigDecimal investProgramRefQuarter3count;
    public BigDecimal investProgramRefQuarter3sum;
    public BigDecimal investProgramRefQuarter4count;
    public BigDecimal investProgramRefQuarter4sum;
    public String investProgramRefUserAdd;
    public Date investProgramRefDateAdd;
    public String investProgramRefUserGen;
    public Date investProgramRefDateEdit;
    public int materialRefCode = Integer.MIN_VALUE;
    public String materialRefName;
    public BigDecimal materialRefCost;
    public int materialRefDeliveryDate = Integer.MIN_VALUE;
    public String materialRefNumkatalog;
    public String materialRefIdentid;
    
    public int measurementCode = Integer.MIN_VALUE;
    public String measurementName;    

    public int getMeasurementCode() {
		return measurementCode;
	}

	public void setMeasurementCode(int measurementCode) {
		this.measurementCode = measurementCode;
	}

	public String getMeasurementName() {
		return measurementName;
	}

	public void setMeasurementName(String measurementName) {
		this.measurementName = measurementName;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }
    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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
    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }
    public void setQuarter1count(BigDecimal aValue){
       quarter1count = aValue;
    }

    public BigDecimal getQuarter1count(){
       return quarter1count;
    }
    public void setQuarter1sum(BigDecimal aValue){
       quarter1sum = aValue;
    }

    public BigDecimal getQuarter1sum(){
       return quarter1sum;
    }
    public void setQuarter2count(BigDecimal aValue){
       quarter2count = aValue;
    }

    public BigDecimal getQuarter2count(){
       return quarter2count;
    }
    public void setQuarter2sum(BigDecimal aValue){
       quarter2sum = aValue;
    }

    public BigDecimal getQuarter2sum(){
       return quarter2sum;
    }
    public void setQuarter3count(BigDecimal aValue){
       quarter3count = aValue;
    }

    public BigDecimal getQuarter3count(){
       return quarter3count;
    }
    public void setQuarter3sum(BigDecimal aValue){
       quarter3sum = aValue;
    }

    public BigDecimal getQuarter3sum(){
       return quarter3sum;
    }
    public void setQuarter4count(BigDecimal aValue){
       quarter4count = aValue;
    }

    public BigDecimal getQuarter4count(){
       return quarter4count;
    }
    public void setQuarter4sum(BigDecimal aValue){
       quarter4sum = aValue;
    }

    public BigDecimal getQuarter4sum(){
       return quarter4sum;
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


    public void setInvestProgramRefCode(int aValue){
       investProgramRefCode = aValue;
    }
    public int getInvestProgramRefCode(){
       return investProgramRefCode;
    }

    public void setInvestProgramRefName(String aValue){
       investProgramRefName = aValue;
    }
    public String getInvestProgramRefName(){
       return investProgramRefName;
    }

    public void setInvestProgramRefYearGen(int aValue){
       investProgramRefYearGen = aValue;
    }
    public int getInvestProgramRefYearGen(){
       return investProgramRefYearGen;
    }

    public void setInvestProgramRefCommentGen(String aValue){
       investProgramRefCommentGen = aValue;
    }
    public String getInvestProgramRefCommentGen(){
       return investProgramRefCommentGen;
    }

    public void setInvestProgramRefCountGen(BigDecimal aValue){
       investProgramRefCountGen = aValue;
    }
    public BigDecimal getInvestProgramRefCountGen(){
       return investProgramRefCountGen;
    }

    public void setInvestProgramRefPrice(BigDecimal aValue){
       investProgramRefPrice = aValue;
    }
    public BigDecimal getInvestProgramRefPrice(){
       return investProgramRefPrice;
    }

    public void setInvestProgramRefSumGen(BigDecimal aValue){
       investProgramRefSumGen = aValue;
    }
    public BigDecimal getInvestProgramRefSumGen(){
       return investProgramRefSumGen;
    }

    public void setInvestProgramRefQuarter1count(BigDecimal aValue){
       investProgramRefQuarter1count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter1count(){
       return investProgramRefQuarter1count;
    }

    public void setInvestProgramRefQuarter1sum(BigDecimal aValue){
       investProgramRefQuarter1sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter1sum(){
       return investProgramRefQuarter1sum;
    }

    public void setInvestProgramRefQuarter2count(BigDecimal aValue){
       investProgramRefQuarter2count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter2count(){
       return investProgramRefQuarter2count;
    }

    public void setInvestProgramRefQuarter2sum(BigDecimal aValue){
       investProgramRefQuarter2sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter2sum(){
       return investProgramRefQuarter2sum;
    }

    public void setInvestProgramRefQuarter3count(BigDecimal aValue){
       investProgramRefQuarter3count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter3count(){
       return investProgramRefQuarter3count;
    }

    public void setInvestProgramRefQuarter3sum(BigDecimal aValue){
       investProgramRefQuarter3sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter3sum(){
       return investProgramRefQuarter3sum;
    }

    public void setInvestProgramRefQuarter4count(BigDecimal aValue){
       investProgramRefQuarter4count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter4count(){
       return investProgramRefQuarter4count;
    }

    public void setInvestProgramRefQuarter4sum(BigDecimal aValue){
       investProgramRefQuarter4sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter4sum(){
       return investProgramRefQuarter4sum;
    }

    public void setInvestProgramRefUserAdd(String aValue){
       investProgramRefUserAdd = aValue;
    }
    public String getInvestProgramRefUserAdd(){
       return investProgramRefUserAdd;
    }


    public void setInvestProgramRefDateAdd(Date aValue){
       investProgramRefDateAdd = aValue;
    }
    public Date getInvestProgramRefDateAdd(){
       return investProgramRefDateAdd;
    }

    public void setInvestProgramRefUserGen(String aValue){
       investProgramRefUserGen = aValue;
    }
    public String getInvestProgramRefUserGen(){
       return investProgramRefUserGen;
    }


    public void setInvestProgramRefDateEdit(Date aValue){
       investProgramRefDateEdit = aValue;
    }
    public Date getInvestProgramRefDateEdit(){
       return investProgramRefDateEdit;
    }

    public void setMaterialRefCode(int aValue){
       materialRefCode = aValue;
    }
    public int getMaterialRefCode(){
       return materialRefCode;
    }

    public void setMaterialRefName(String aValue){
       materialRefName = aValue;
    }
    public String getMaterialRefName(){
       return materialRefName;
    }

    public void setMaterialRefCost(BigDecimal aValue){
       materialRefCost = aValue;
    }
    public BigDecimal getMaterialRefCost(){
       return materialRefCost;
    }

    public void setMaterialRefDeliveryDate(int aValue){
       materialRefDeliveryDate = aValue;
    }
    public int getMaterialRefDeliveryDate(){
       return materialRefDeliveryDate;
    }

    public void setMaterialRefNumkatalog(String aValue){
       materialRefNumkatalog = aValue;
    }
    public String getMaterialRefNumkatalog(){
       return materialRefNumkatalog;
    }

    public void setMaterialRefIdentid(String aValue){
       materialRefIdentid = aValue;
    }
    public String getMaterialRefIdentid(){
       return materialRefIdentid;
    }



}