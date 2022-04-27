
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENIPItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPItemShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public String buhName;
	public String itemNumber;
	public String invNumber;
	public int isProjectDocument = Integer.MIN_VALUE;
	public String financing;
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
	public BigDecimal countGenInside;
	public BigDecimal priceInside;
	public BigDecimal sumGenInside;
	public BigDecimal mm1countInside;
	public BigDecimal mm1sumInside;
	public BigDecimal mm2countInside;
	public BigDecimal mm2sumInside;
	public BigDecimal mm3countInside;
	public BigDecimal mm3sumInside;
	public BigDecimal mm4countInside;
	public BigDecimal mm4sumInside;
	public BigDecimal mm5countInside;
	public BigDecimal mm5sumInside;
	public BigDecimal mm6countInside;
	public BigDecimal mm6sumInside;
	public BigDecimal mm7countInside;
	public BigDecimal mm7sumInside;
	public BigDecimal mm8countInside;
	public BigDecimal mm8sumInside;
	public BigDecimal mm9countInside;
	public BigDecimal mm9sumInside;
	public BigDecimal mm10countInside;
	public BigDecimal mm10sumInside;
	public BigDecimal mm11countInside;
	public BigDecimal mm11sumInside;
	public BigDecimal mm12countInside;
	public BigDecimal mm12sumInside;
	public String infoTenders;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public int measurementCode = Integer.MIN_VALUE;
	public String measurementName;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int invGroupRefCode = Integer.MIN_VALUE;
	public String invGroupRefName;
	public String invGroupRefCommentgen;
	public int renRefCode = Integer.MIN_VALUE;
	public String renRefName;
	public int purposeProgramRefCode = Integer.MIN_VALUE;
	public String purposeProgramRefName;
	public int ipRefCode = Integer.MIN_VALUE;
	public String ipRefName;
	public int ipRefYearGen = Integer.MIN_VALUE;
	public int ipRefVersion = Integer.MIN_VALUE;
	public String ipRefCommentGen;
	public Date ipRefDateAdd;
	public Date ipRefDateEdit;
	public String ipRefUserAdd;
	public String ipRefUserEdit;
	public int parentRefCode = Integer.MIN_VALUE;
	public String parentRefName;
	public String parentRefBuhName;
	public String parentRefItemNumber;
	public String parentRefInvNumber;
	public int parentRefIsProjectDocument = Integer.MIN_VALUE;
	public String parentRefFinancing;
	public String parentRefCommentGen;
	public BigDecimal parentRefCountGen;
	public BigDecimal parentRefPrice;
	public BigDecimal parentRefSumGen;
	public BigDecimal parentRefQuarter1count;
	public BigDecimal parentRefQuarter1sum;
	public BigDecimal parentRefQuarter2count;
	public BigDecimal parentRefQuarter2sum;
	public BigDecimal parentRefQuarter3count;
	public BigDecimal parentRefQuarter3sum;
	public BigDecimal parentRefQuarter4count;
	public BigDecimal parentRefQuarter4sum;
	public BigDecimal parentRefCountGenInside;
	public BigDecimal parentRefPriceInside;
	public BigDecimal parentRefSumGenInside;
	public BigDecimal parentRefMm1countInside;
	public BigDecimal parentRefMm1sumInside;
	public BigDecimal parentRefMm2countInside;
	public BigDecimal parentRefMm2sumInside;
	public BigDecimal parentRefMm3countInside;
	public BigDecimal parentRefMm3sumInside;
	public BigDecimal parentRefMm4countInside;
	public BigDecimal parentRefMm4sumInside;
	public BigDecimal parentRefMm5countInside;
	public BigDecimal parentRefMm5sumInside;
	public BigDecimal parentRefMm6countInside;
	public BigDecimal parentRefMm6sumInside;
	public BigDecimal parentRefMm7countInside;
	public BigDecimal parentRefMm7sumInside;
	public BigDecimal parentRefMm8countInside;
	public BigDecimal parentRefMm8sumInside;
	public BigDecimal parentRefMm9countInside;
	public BigDecimal parentRefMm9sumInside;
	public BigDecimal parentRefMm10countInside;
	public BigDecimal parentRefMm10sumInside;
	public BigDecimal parentRefMm11countInside;
	public BigDecimal parentRefMm11sumInside;
	public BigDecimal parentRefMm12countInside;
	public BigDecimal parentRefMm12sumInside;
	public String parentRefInfoTenders;
	public String parentRefUserAdd;
	public Date parentRefDateAdd;
	public String parentRefUserGen;
	public Date parentRefDateEdit;
	public int methodExecWorkRefCode = Integer.MIN_VALUE;
	public String methodExecWorkRefName;
	public int ipImplementTypeRefCode = Integer.MIN_VALUE;
	public String ipImplementTypeRefName;


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

	public void setBuhName(String aValue){
		buhName = aValue;
	}

	public String getBuhName(){
		return buhName;
	}

	public void setItemNumber(String aValue){
		itemNumber = aValue;
	}

	public String getItemNumber(){
		return itemNumber;
	}

	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
	}

	public void setIsProjectDocument(int aValue){
		isProjectDocument = aValue;
	}

	public int getIsProjectDocument(){
		return isProjectDocument;
	}

	public void setFinancing(String aValue){
		financing = aValue;
	}

	public String getFinancing(){
		return financing;
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

	public void setCountGenInside(BigDecimal aValue){
		countGenInside = aValue;
	}

	public BigDecimal getCountGenInside(){
		return countGenInside;
	}

	public void setPriceInside(BigDecimal aValue){
		priceInside = aValue;
	}

	public BigDecimal getPriceInside(){
		return priceInside;
	}

	public void setSumGenInside(BigDecimal aValue){
		sumGenInside = aValue;
	}

	public BigDecimal getSumGenInside(){
		return sumGenInside;
	}

	public void setMm1countInside(BigDecimal aValue){
		mm1countInside = aValue;
	}

	public BigDecimal getMm1countInside(){
		return mm1countInside;
	}

	public void setMm1sumInside(BigDecimal aValue){
		mm1sumInside = aValue;
	}

	public BigDecimal getMm1sumInside(){
		return mm1sumInside;
	}

	public void setMm2countInside(BigDecimal aValue){
		mm2countInside = aValue;
	}

	public BigDecimal getMm2countInside(){
		return mm2countInside;
	}

	public void setMm2sumInside(BigDecimal aValue){
		mm2sumInside = aValue;
	}

	public BigDecimal getMm2sumInside(){
		return mm2sumInside;
	}

	public void setMm3countInside(BigDecimal aValue){
		mm3countInside = aValue;
	}

	public BigDecimal getMm3countInside(){
		return mm3countInside;
	}

	public void setMm3sumInside(BigDecimal aValue){
		mm3sumInside = aValue;
	}

	public BigDecimal getMm3sumInside(){
		return mm3sumInside;
	}

	public void setMm4countInside(BigDecimal aValue){
		mm4countInside = aValue;
	}

	public BigDecimal getMm4countInside(){
		return mm4countInside;
	}

	public void setMm4sumInside(BigDecimal aValue){
		mm4sumInside = aValue;
	}

	public BigDecimal getMm4sumInside(){
		return mm4sumInside;
	}

	public void setMm5countInside(BigDecimal aValue){
		mm5countInside = aValue;
	}

	public BigDecimal getMm5countInside(){
		return mm5countInside;
	}

	public void setMm5sumInside(BigDecimal aValue){
		mm5sumInside = aValue;
	}

	public BigDecimal getMm5sumInside(){
		return mm5sumInside;
	}

	public void setMm6countInside(BigDecimal aValue){
		mm6countInside = aValue;
	}

	public BigDecimal getMm6countInside(){
		return mm6countInside;
	}

	public void setMm6sumInside(BigDecimal aValue){
		mm6sumInside = aValue;
	}

	public BigDecimal getMm6sumInside(){
		return mm6sumInside;
	}

	public void setMm7countInside(BigDecimal aValue){
		mm7countInside = aValue;
	}

	public BigDecimal getMm7countInside(){
		return mm7countInside;
	}

	public void setMm7sumInside(BigDecimal aValue){
		mm7sumInside = aValue;
	}

	public BigDecimal getMm7sumInside(){
		return mm7sumInside;
	}

	public void setMm8countInside(BigDecimal aValue){
		mm8countInside = aValue;
	}

	public BigDecimal getMm8countInside(){
		return mm8countInside;
	}

	public void setMm8sumInside(BigDecimal aValue){
		mm8sumInside = aValue;
	}

	public BigDecimal getMm8sumInside(){
		return mm8sumInside;
	}

	public void setMm9countInside(BigDecimal aValue){
		mm9countInside = aValue;
	}

	public BigDecimal getMm9countInside(){
		return mm9countInside;
	}

	public void setMm9sumInside(BigDecimal aValue){
		mm9sumInside = aValue;
	}

	public BigDecimal getMm9sumInside(){
		return mm9sumInside;
	}

	public void setMm10countInside(BigDecimal aValue){
		mm10countInside = aValue;
	}

	public BigDecimal getMm10countInside(){
		return mm10countInside;
	}

	public void setMm10sumInside(BigDecimal aValue){
		mm10sumInside = aValue;
	}

	public BigDecimal getMm10sumInside(){
		return mm10sumInside;
	}

	public void setMm11countInside(BigDecimal aValue){
		mm11countInside = aValue;
	}

	public BigDecimal getMm11countInside(){
		return mm11countInside;
	}

	public void setMm11sumInside(BigDecimal aValue){
		mm11sumInside = aValue;
	}

	public BigDecimal getMm11sumInside(){
		return mm11sumInside;
	}

	public void setMm12countInside(BigDecimal aValue){
		mm12countInside = aValue;
	}

	public BigDecimal getMm12countInside(){
		return mm12countInside;
	}

	public void setMm12sumInside(BigDecimal aValue){
		mm12sumInside = aValue;
	}

	public BigDecimal getMm12sumInside(){
		return mm12sumInside;
	}

	public void setInfoTenders(String aValue){
		infoTenders = aValue;
	}

	public String getInfoTenders(){
		return infoTenders;
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


	public void setMeasurementCode(int aValue){
		measurementCode = aValue;
	}
	public int getMeasurementCode(){
		return measurementCode;
	}

	public void setMeasurementName(String aValue){
		measurementName = aValue;
	}
	public String getMeasurementName(){
		return measurementName;
	}

	public void setStatusRefCode(int aValue){
		statusRefCode = aValue;
	}
	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefName(String aValue){
		statusRefName = aValue;
	}
	public String getStatusRefName(){
		return statusRefName;
	}

	public void setInvGroupRefCode(int aValue){
		invGroupRefCode = aValue;
	}
	public int getInvGroupRefCode(){
		return invGroupRefCode;
	}

	public void setInvGroupRefName(String aValue){
		invGroupRefName = aValue;
	}
	public String getInvGroupRefName(){
		return invGroupRefName;
	}

	public void setInvGroupRefCommentgen(String aValue){
		invGroupRefCommentgen = aValue;
	}
	public String getInvGroupRefCommentgen(){
		return invGroupRefCommentgen;
	}

	public void setRenRefCode(int aValue){
		renRefCode = aValue;
	}
	public int getRenRefCode(){
		return renRefCode;
	}

	public void setRenRefName(String aValue){
		renRefName = aValue;
	}
	public String getRenRefName(){
		return renRefName;
	}

	public void setPurposeProgramRefCode(int aValue){
		purposeProgramRefCode = aValue;
	}
	public int getPurposeProgramRefCode(){
		return purposeProgramRefCode;
	}

	public void setPurposeProgramRefName(String aValue){
		purposeProgramRefName = aValue;
	}
	public String getPurposeProgramRefName(){
		return purposeProgramRefName;
	}

	public void setIpRefCode(int aValue){
		ipRefCode = aValue;
	}
	public int getIpRefCode(){
		return ipRefCode;
	}

	public void setIpRefName(String aValue){
		ipRefName = aValue;
	}
	public String getIpRefName(){
		return ipRefName;
	}

	public void setIpRefYearGen(int aValue){
		ipRefYearGen = aValue;
	}
	public int getIpRefYearGen(){
		return ipRefYearGen;
	}

	public void setIpRefVersion(int aValue){
		ipRefVersion = aValue;
	}
	public int getIpRefVersion(){
		return ipRefVersion;
	}

	public void setIpRefCommentGen(String aValue){
		ipRefCommentGen = aValue;
	}
	public String getIpRefCommentGen(){
		return ipRefCommentGen;
	}

	public void setIpRefDateAdd(Date aValue){
		ipRefDateAdd = aValue;
	}
	public Date getIpRefDateAdd(){
		return ipRefDateAdd;
	}

	public void setIpRefDateEdit(Date aValue){
		ipRefDateEdit = aValue;
	}
	public Date getIpRefDateEdit(){
		return ipRefDateEdit;
	}

	public void setIpRefUserAdd(String aValue){
		ipRefUserAdd = aValue;
	}
	public String getIpRefUserAdd(){
		return ipRefUserAdd;
	}

	public void setIpRefUserEdit(String aValue){
		ipRefUserEdit = aValue;
	}
	public String getIpRefUserEdit(){
		return ipRefUserEdit;
	}

	public void setParentRefCode(int aValue){
		parentRefCode = aValue;
	}
	public int getParentRefCode(){
		return parentRefCode;
	}

	public void setParentRefName(String aValue){
		parentRefName = aValue;
	}
	public String getParentRefName(){
		return parentRefName;
	}

	public void setParentRefBuhName(String aValue){
		parentRefBuhName = aValue;
	}
	public String getParentRefBuhName(){
		return parentRefBuhName;
	}

	public void setParentRefItemNumber(String aValue){
		parentRefItemNumber = aValue;
	}
	public String getParentRefItemNumber(){
		return parentRefItemNumber;
	}

	public void setParentRefInvNumber(String aValue){
		parentRefInvNumber = aValue;
	}
	public String getParentRefInvNumber(){
		return parentRefInvNumber;
	}

	public void setParentRefIsProjectDocument(int aValue){
		parentRefIsProjectDocument = aValue;
	}
	public int getParentRefIsProjectDocument(){
		return parentRefIsProjectDocument;
	}

	public void setParentRefFinancing(String aValue){
		parentRefFinancing = aValue;
	}
	public String getParentRefFinancing(){
		return parentRefFinancing;
	}

	public void setParentRefCommentGen(String aValue){
		parentRefCommentGen = aValue;
	}
	public String getParentRefCommentGen(){
		return parentRefCommentGen;
	}

	public void setParentRefCountGen(BigDecimal aValue){
		parentRefCountGen = aValue;
	}
	public BigDecimal getParentRefCountGen(){
		return parentRefCountGen;
	}

	public void setParentRefPrice(BigDecimal aValue){
		parentRefPrice = aValue;
	}
	public BigDecimal getParentRefPrice(){
		return parentRefPrice;
	}

	public void setParentRefSumGen(BigDecimal aValue){
		parentRefSumGen = aValue;
	}
	public BigDecimal getParentRefSumGen(){
		return parentRefSumGen;
	}

	public void setParentRefQuarter1count(BigDecimal aValue){
		parentRefQuarter1count = aValue;
	}
	public BigDecimal getParentRefQuarter1count(){
		return parentRefQuarter1count;
	}

	public void setParentRefQuarter1sum(BigDecimal aValue){
		parentRefQuarter1sum = aValue;
	}
	public BigDecimal getParentRefQuarter1sum(){
		return parentRefQuarter1sum;
	}

	public void setParentRefQuarter2count(BigDecimal aValue){
		parentRefQuarter2count = aValue;
	}
	public BigDecimal getParentRefQuarter2count(){
		return parentRefQuarter2count;
	}

	public void setParentRefQuarter2sum(BigDecimal aValue){
		parentRefQuarter2sum = aValue;
	}
	public BigDecimal getParentRefQuarter2sum(){
		return parentRefQuarter2sum;
	}

	public void setParentRefQuarter3count(BigDecimal aValue){
		parentRefQuarter3count = aValue;
	}
	public BigDecimal getParentRefQuarter3count(){
		return parentRefQuarter3count;
	}

	public void setParentRefQuarter3sum(BigDecimal aValue){
		parentRefQuarter3sum = aValue;
	}
	public BigDecimal getParentRefQuarter3sum(){
		return parentRefQuarter3sum;
	}

	public void setParentRefQuarter4count(BigDecimal aValue){
		parentRefQuarter4count = aValue;
	}
	public BigDecimal getParentRefQuarter4count(){
		return parentRefQuarter4count;
	}

	public void setParentRefQuarter4sum(BigDecimal aValue){
		parentRefQuarter4sum = aValue;
	}
	public BigDecimal getParentRefQuarter4sum(){
		return parentRefQuarter4sum;
	}

	public void setParentRefCountGenInside(BigDecimal aValue){
		parentRefCountGenInside = aValue;
	}
	public BigDecimal getParentRefCountGenInside(){
		return parentRefCountGenInside;
	}

	public void setParentRefPriceInside(BigDecimal aValue){
		parentRefPriceInside = aValue;
	}
	public BigDecimal getParentRefPriceInside(){
		return parentRefPriceInside;
	}

	public void setParentRefSumGenInside(BigDecimal aValue){
		parentRefSumGenInside = aValue;
	}
	public BigDecimal getParentRefSumGenInside(){
		return parentRefSumGenInside;
	}

	public void setParentRefMm1countInside(BigDecimal aValue){
		parentRefMm1countInside = aValue;
	}
	public BigDecimal getParentRefMm1countInside(){
		return parentRefMm1countInside;
	}

	public void setParentRefMm1sumInside(BigDecimal aValue){
		parentRefMm1sumInside = aValue;
	}
	public BigDecimal getParentRefMm1sumInside(){
		return parentRefMm1sumInside;
	}

	public void setParentRefMm2countInside(BigDecimal aValue){
		parentRefMm2countInside = aValue;
	}
	public BigDecimal getParentRefMm2countInside(){
		return parentRefMm2countInside;
	}

	public void setParentRefMm2sumInside(BigDecimal aValue){
		parentRefMm2sumInside = aValue;
	}
	public BigDecimal getParentRefMm2sumInside(){
		return parentRefMm2sumInside;
	}

	public void setParentRefMm3countInside(BigDecimal aValue){
		parentRefMm3countInside = aValue;
	}
	public BigDecimal getParentRefMm3countInside(){
		return parentRefMm3countInside;
	}

	public void setParentRefMm3sumInside(BigDecimal aValue){
		parentRefMm3sumInside = aValue;
	}
	public BigDecimal getParentRefMm3sumInside(){
		return parentRefMm3sumInside;
	}

	public void setParentRefMm4countInside(BigDecimal aValue){
		parentRefMm4countInside = aValue;
	}
	public BigDecimal getParentRefMm4countInside(){
		return parentRefMm4countInside;
	}

	public void setParentRefMm4sumInside(BigDecimal aValue){
		parentRefMm4sumInside = aValue;
	}
	public BigDecimal getParentRefMm4sumInside(){
		return parentRefMm4sumInside;
	}

	public void setParentRefMm5countInside(BigDecimal aValue){
		parentRefMm5countInside = aValue;
	}
	public BigDecimal getParentRefMm5countInside(){
		return parentRefMm5countInside;
	}

	public void setParentRefMm5sumInside(BigDecimal aValue){
		parentRefMm5sumInside = aValue;
	}
	public BigDecimal getParentRefMm5sumInside(){
		return parentRefMm5sumInside;
	}

	public void setParentRefMm6countInside(BigDecimal aValue){
		parentRefMm6countInside = aValue;
	}
	public BigDecimal getParentRefMm6countInside(){
		return parentRefMm6countInside;
	}

	public void setParentRefMm6sumInside(BigDecimal aValue){
		parentRefMm6sumInside = aValue;
	}
	public BigDecimal getParentRefMm6sumInside(){
		return parentRefMm6sumInside;
	}

	public void setParentRefMm7countInside(BigDecimal aValue){
		parentRefMm7countInside = aValue;
	}
	public BigDecimal getParentRefMm7countInside(){
		return parentRefMm7countInside;
	}

	public void setParentRefMm7sumInside(BigDecimal aValue){
		parentRefMm7sumInside = aValue;
	}
	public BigDecimal getParentRefMm7sumInside(){
		return parentRefMm7sumInside;
	}

	public void setParentRefMm8countInside(BigDecimal aValue){
		parentRefMm8countInside = aValue;
	}
	public BigDecimal getParentRefMm8countInside(){
		return parentRefMm8countInside;
	}

	public void setParentRefMm8sumInside(BigDecimal aValue){
		parentRefMm8sumInside = aValue;
	}
	public BigDecimal getParentRefMm8sumInside(){
		return parentRefMm8sumInside;
	}

	public void setParentRefMm9countInside(BigDecimal aValue){
		parentRefMm9countInside = aValue;
	}
	public BigDecimal getParentRefMm9countInside(){
		return parentRefMm9countInside;
	}

	public void setParentRefMm9sumInside(BigDecimal aValue){
		parentRefMm9sumInside = aValue;
	}
	public BigDecimal getParentRefMm9sumInside(){
		return parentRefMm9sumInside;
	}

	public void setParentRefMm10countInside(BigDecimal aValue){
		parentRefMm10countInside = aValue;
	}
	public BigDecimal getParentRefMm10countInside(){
		return parentRefMm10countInside;
	}

	public void setParentRefMm10sumInside(BigDecimal aValue){
		parentRefMm10sumInside = aValue;
	}
	public BigDecimal getParentRefMm10sumInside(){
		return parentRefMm10sumInside;
	}

	public void setParentRefMm11countInside(BigDecimal aValue){
		parentRefMm11countInside = aValue;
	}
	public BigDecimal getParentRefMm11countInside(){
		return parentRefMm11countInside;
	}

	public void setParentRefMm11sumInside(BigDecimal aValue){
		parentRefMm11sumInside = aValue;
	}
	public BigDecimal getParentRefMm11sumInside(){
		return parentRefMm11sumInside;
	}

	public void setParentRefMm12countInside(BigDecimal aValue){
		parentRefMm12countInside = aValue;
	}
	public BigDecimal getParentRefMm12countInside(){
		return parentRefMm12countInside;
	}

	public void setParentRefMm12sumInside(BigDecimal aValue){
		parentRefMm12sumInside = aValue;
	}
	public BigDecimal getParentRefMm12sumInside(){
		return parentRefMm12sumInside;
	}

	public void setParentRefInfoTenders(String aValue){
		parentRefInfoTenders = aValue;
	}
	public String getParentRefInfoTenders(){
		return parentRefInfoTenders;
	}

	public void setParentRefUserAdd(String aValue){
		parentRefUserAdd = aValue;
	}
	public String getParentRefUserAdd(){
		return parentRefUserAdd;
	}

	public void setParentRefDateAdd(Date aValue){
		parentRefDateAdd = aValue;
	}
	public Date getParentRefDateAdd(){
		return parentRefDateAdd;
	}

	public void setParentRefUserGen(String aValue){
		parentRefUserGen = aValue;
	}
	public String getParentRefUserGen(){
		return parentRefUserGen;
	}

	public void setParentRefDateEdit(Date aValue){
		parentRefDateEdit = aValue;
	}
	public Date getParentRefDateEdit(){
		return parentRefDateEdit;
	}

	public void setMethodExecWorkRefCode(int aValue){
		methodExecWorkRefCode = aValue;
	}
	public int getMethodExecWorkRefCode(){
		return methodExecWorkRefCode;
	}

	public void setMethodExecWorkRefName(String aValue){
		methodExecWorkRefName = aValue;
	}
	public String getMethodExecWorkRefName(){
		return methodExecWorkRefName;
	}

	public void setIpImplementTypeRefCode(int aValue){
		ipImplementTypeRefCode = aValue;
	}
	public int getIpImplementTypeRefCode(){
		return ipImplementTypeRefCode;
	}

	public void setIpImplementTypeRefName(String aValue){
		ipImplementTypeRefName = aValue;
	}
	public String getIpImplementTypeRefName(){
		return ipImplementTypeRefName;
	}



}