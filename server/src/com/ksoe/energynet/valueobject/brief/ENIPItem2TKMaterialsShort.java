
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENIPItem2TKMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPItem2TKMaterialsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public int isMaterialForCount = Integer.MIN_VALUE;
	public int ipItemRefCode = Integer.MIN_VALUE;
	public String ipItemRefName;
	public String ipItemRefBuhName;
	public String ipItemRefItemNumber;
	public String ipItemRefInvNumber;
	public int ipItemRefIsProjectDocument = Integer.MIN_VALUE;
	public String ipItemRefFinancing;
	public String ipItemRefCommentGen;
	public BigDecimal ipItemRefCountGen;
	public BigDecimal ipItemRefPrice;
	public BigDecimal ipItemRefSumGen;
	public BigDecimal ipItemRefQuarter1count;
	public BigDecimal ipItemRefQuarter1sum;
	public BigDecimal ipItemRefQuarter2count;
	public BigDecimal ipItemRefQuarter2sum;
	public BigDecimal ipItemRefQuarter3count;
	public BigDecimal ipItemRefQuarter3sum;
	public BigDecimal ipItemRefQuarter4count;
	public BigDecimal ipItemRefQuarter4sum;
	public BigDecimal ipItemRefCountGenInside;
	public BigDecimal ipItemRefPriceInside;
	public BigDecimal ipItemRefSumGenInside;
	public BigDecimal ipItemRefMm1countInside;
	public BigDecimal ipItemRefMm1sumInside;
	public BigDecimal ipItemRefMm2countInside;
	public BigDecimal ipItemRefMm2sumInside;
	public BigDecimal ipItemRefMm3countInside;
	public BigDecimal ipItemRefMm3sumInside;
	public BigDecimal ipItemRefMm4countInside;
	public BigDecimal ipItemRefMm4sumInside;
	public BigDecimal ipItemRefMm5countInside;
	public BigDecimal ipItemRefMm5sumInside;
	public BigDecimal ipItemRefMm6countInside;
	public BigDecimal ipItemRefMm6sumInside;
	public BigDecimal ipItemRefMm7countInside;
	public BigDecimal ipItemRefMm7sumInside;
	public BigDecimal ipItemRefMm8countInside;
	public BigDecimal ipItemRefMm8sumInside;
	public BigDecimal ipItemRefMm9countInside;
	public BigDecimal ipItemRefMm9sumInside;
	public BigDecimal ipItemRefMm10countInside;
	public BigDecimal ipItemRefMm10sumInside;
	public BigDecimal ipItemRefMm11countInside;
	public BigDecimal ipItemRefMm11sumInside;
	public BigDecimal ipItemRefMm12countInside;
	public BigDecimal ipItemRefMm12sumInside;
	public String ipItemRefInfoTenders;
	public String ipItemRefUserAdd;
	public Date ipItemRefDateAdd;
	public String ipItemRefUserGen;
	public Date ipItemRefDateEdit;
	public int materialRefCode = Integer.MIN_VALUE;
	public String materialRefName;
	public BigDecimal materialRefCost;
	public int materialRefDeliveryDate = Integer.MIN_VALUE;
	public String materialRefNumkatalog;
	public String materialRefIdentid;
	
	public String materialMasurement;


	public String getMaterialMasurement() {
		return materialMasurement;
	}

	public void setMaterialMasurement(String materialMasurement) {
		this.materialMasurement = materialMasurement;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getUserAdd() {
		return userAdd;
	}

	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
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


	public int getIsMaterialForCount() {
		return isMaterialForCount;
	}

	public void setIsMaterialForCount(int isMaterialForCount) {
		this.isMaterialForCount = isMaterialForCount;
	}


	public int getIpItemRefCode(){
		return ipItemRefCode;
	}

	public void setIpItemRefCode(int ipItemRefCode) {
		this.ipItemRefCode = ipItemRefCode;
	}

	public String getIpItemRefName(){
		return ipItemRefName;
	}

	public void setIpItemRefName(String ipItemRefName) {
		this.ipItemRefName = ipItemRefName;
	}

	public String getIpItemRefBuhName(){
		return ipItemRefBuhName;
	}

	public void setIpItemRefBuhName(String ipItemRefBuhName) {
		this.ipItemRefBuhName = ipItemRefBuhName;
	}

	public String getIpItemRefItemNumber(){
		return ipItemRefItemNumber;
	}

	public void setIpItemRefItemNumber(String ipItemRefItemNumber) {
		this.ipItemRefItemNumber = ipItemRefItemNumber;
	}

	public String getIpItemRefInvNumber(){
		return ipItemRefInvNumber;
	}

	public void setIpItemRefInvNumber(String ipItemRefInvNumber) {
		this.ipItemRefInvNumber = ipItemRefInvNumber;
	}

	public int getIpItemRefIsProjectDocument(){
		return ipItemRefIsProjectDocument;
	}

	public void setIpItemRefIsProjectDocument(int ipItemRefIsProjectDocument) {
		this.ipItemRefIsProjectDocument = ipItemRefIsProjectDocument;
	}

	public String getIpItemRefFinancing(){
		return ipItemRefFinancing;
	}

	public void setIpItemRefFinancing(String ipItemRefFinancing) {
		this.ipItemRefFinancing = ipItemRefFinancing;
	}

	public String getIpItemRefCommentGen(){
		return ipItemRefCommentGen;
	}

	public void setIpItemRefCommentGen(String ipItemRefCommentGen) {
		this.ipItemRefCommentGen = ipItemRefCommentGen;
	}

	public BigDecimal getIpItemRefCountGen(){
		return ipItemRefCountGen;
	}

	public void setIpItemRefCountGen(BigDecimal ipItemRefCountGen) {
		this.ipItemRefCountGen = ipItemRefCountGen;
	}

	public BigDecimal getIpItemRefPrice(){
		return ipItemRefPrice;
	}

	public void setIpItemRefPrice(BigDecimal ipItemRefPrice) {
		this.ipItemRefPrice = ipItemRefPrice;
	}

	public BigDecimal getIpItemRefSumGen(){
		return ipItemRefSumGen;
	}

	public void setIpItemRefSumGen(BigDecimal ipItemRefSumGen) {
		this.ipItemRefSumGen = ipItemRefSumGen;
	}

	public BigDecimal getIpItemRefQuarter1count(){
		return ipItemRefQuarter1count;
	}

	public void setIpItemRefQuarter1count(BigDecimal ipItemRefQuarter1count) {
		this.ipItemRefQuarter1count = ipItemRefQuarter1count;
	}

	public BigDecimal getIpItemRefQuarter1sum(){
		return ipItemRefQuarter1sum;
	}

	public void setIpItemRefQuarter1sum(BigDecimal ipItemRefQuarter1sum) {
		this.ipItemRefQuarter1sum = ipItemRefQuarter1sum;
	}

	public BigDecimal getIpItemRefQuarter2count(){
		return ipItemRefQuarter2count;
	}

	public void setIpItemRefQuarter2count(BigDecimal ipItemRefQuarter2count) {
		this.ipItemRefQuarter2count = ipItemRefQuarter2count;
	}

	public BigDecimal getIpItemRefQuarter2sum(){
		return ipItemRefQuarter2sum;
	}

	public void setIpItemRefQuarter2sum(BigDecimal ipItemRefQuarter2sum) {
		this.ipItemRefQuarter2sum = ipItemRefQuarter2sum;
	}

	public BigDecimal getIpItemRefQuarter3count(){
		return ipItemRefQuarter3count;
	}

	public void setIpItemRefQuarter3count(BigDecimal ipItemRefQuarter3count) {
		this.ipItemRefQuarter3count = ipItemRefQuarter3count;
	}

	public BigDecimal getIpItemRefQuarter3sum(){
		return ipItemRefQuarter3sum;
	}

	public void setIpItemRefQuarter3sum(BigDecimal ipItemRefQuarter3sum) {
		this.ipItemRefQuarter3sum = ipItemRefQuarter3sum;
	}

	public BigDecimal getIpItemRefQuarter4count(){
		return ipItemRefQuarter4count;
	}

	public void setIpItemRefQuarter4count(BigDecimal ipItemRefQuarter4count) {
		this.ipItemRefQuarter4count = ipItemRefQuarter4count;
	}

	public BigDecimal getIpItemRefQuarter4sum(){
		return ipItemRefQuarter4sum;
	}

	public void setIpItemRefQuarter4sum(BigDecimal ipItemRefQuarter4sum) {
		this.ipItemRefQuarter4sum = ipItemRefQuarter4sum;
	}

	public BigDecimal getIpItemRefCountGenInside(){
		return ipItemRefCountGenInside;
	}

	public void setIpItemRefCountGenInside(BigDecimal ipItemRefCountGenInside) {
		this.ipItemRefCountGenInside = ipItemRefCountGenInside;
	}

	public BigDecimal getIpItemRefPriceInside(){
		return ipItemRefPriceInside;
	}

	public void setIpItemRefPriceInside(BigDecimal ipItemRefPriceInside) {
		this.ipItemRefPriceInside = ipItemRefPriceInside;
	}

	public BigDecimal getIpItemRefSumGenInside(){
		return ipItemRefSumGenInside;
	}

	public void setIpItemRefSumGenInside(BigDecimal ipItemRefSumGenInside) {
		this.ipItemRefSumGenInside = ipItemRefSumGenInside;
	}

	public BigDecimal getIpItemRefMm1countInside(){
		return ipItemRefMm1countInside;
	}

	public void setIpItemRefMm1countInside(BigDecimal ipItemRefMm1countInside) {
		this.ipItemRefMm1countInside = ipItemRefMm1countInside;
	}

	public BigDecimal getIpItemRefMm1sumInside(){
		return ipItemRefMm1sumInside;
	}

	public void setIpItemRefMm1sumInside(BigDecimal ipItemRefMm1sumInside) {
		this.ipItemRefMm1sumInside = ipItemRefMm1sumInside;
	}

	public BigDecimal getIpItemRefMm2countInside(){
		return ipItemRefMm2countInside;
	}

	public void setIpItemRefMm2countInside(BigDecimal ipItemRefMm2countInside) {
		this.ipItemRefMm2countInside = ipItemRefMm2countInside;
	}

	public BigDecimal getIpItemRefMm2sumInside(){
		return ipItemRefMm2sumInside;
	}

	public void setIpItemRefMm2sumInside(BigDecimal ipItemRefMm2sumInside) {
		this.ipItemRefMm2sumInside = ipItemRefMm2sumInside;
	}

	public BigDecimal getIpItemRefMm3countInside(){
		return ipItemRefMm3countInside;
	}

	public void setIpItemRefMm3countInside(BigDecimal ipItemRefMm3countInside) {
		this.ipItemRefMm3countInside = ipItemRefMm3countInside;
	}

	public BigDecimal getIpItemRefMm3sumInside(){
		return ipItemRefMm3sumInside;
	}

	public void setIpItemRefMm3sumInside(BigDecimal ipItemRefMm3sumInside) {
		this.ipItemRefMm3sumInside = ipItemRefMm3sumInside;
	}

	public BigDecimal getIpItemRefMm4countInside(){
		return ipItemRefMm4countInside;
	}

	public void setIpItemRefMm4countInside(BigDecimal ipItemRefMm4countInside) {
		this.ipItemRefMm4countInside = ipItemRefMm4countInside;
	}

	public BigDecimal getIpItemRefMm4sumInside(){
		return ipItemRefMm4sumInside;
	}

	public void setIpItemRefMm4sumInside(BigDecimal ipItemRefMm4sumInside) {
		this.ipItemRefMm4sumInside = ipItemRefMm4sumInside;
	}

	public BigDecimal getIpItemRefMm5countInside(){
		return ipItemRefMm5countInside;
	}

	public void setIpItemRefMm5countInside(BigDecimal ipItemRefMm5countInside) {
		this.ipItemRefMm5countInside = ipItemRefMm5countInside;
	}

	public BigDecimal getIpItemRefMm5sumInside(){
		return ipItemRefMm5sumInside;
	}

	public void setIpItemRefMm5sumInside(BigDecimal ipItemRefMm5sumInside) {
		this.ipItemRefMm5sumInside = ipItemRefMm5sumInside;
	}

	public BigDecimal getIpItemRefMm6countInside(){
		return ipItemRefMm6countInside;
	}

	public void setIpItemRefMm6countInside(BigDecimal ipItemRefMm6countInside) {
		this.ipItemRefMm6countInside = ipItemRefMm6countInside;
	}

	public BigDecimal getIpItemRefMm6sumInside(){
		return ipItemRefMm6sumInside;
	}

	public void setIpItemRefMm6sumInside(BigDecimal ipItemRefMm6sumInside) {
		this.ipItemRefMm6sumInside = ipItemRefMm6sumInside;
	}

	public BigDecimal getIpItemRefMm7countInside(){
		return ipItemRefMm7countInside;
	}

	public void setIpItemRefMm7countInside(BigDecimal ipItemRefMm7countInside) {
		this.ipItemRefMm7countInside = ipItemRefMm7countInside;
	}

	public BigDecimal getIpItemRefMm7sumInside(){
		return ipItemRefMm7sumInside;
	}

	public void setIpItemRefMm7sumInside(BigDecimal ipItemRefMm7sumInside) {
		this.ipItemRefMm7sumInside = ipItemRefMm7sumInside;
	}

	public BigDecimal getIpItemRefMm8countInside(){
		return ipItemRefMm8countInside;
	}

	public void setIpItemRefMm8countInside(BigDecimal ipItemRefMm8countInside) {
		this.ipItemRefMm8countInside = ipItemRefMm8countInside;
	}

	public BigDecimal getIpItemRefMm8sumInside(){
		return ipItemRefMm8sumInside;
	}

	public void setIpItemRefMm8sumInside(BigDecimal ipItemRefMm8sumInside) {
		this.ipItemRefMm8sumInside = ipItemRefMm8sumInside;
	}

	public BigDecimal getIpItemRefMm9countInside(){
		return ipItemRefMm9countInside;
	}

	public void setIpItemRefMm9countInside(BigDecimal ipItemRefMm9countInside) {
		this.ipItemRefMm9countInside = ipItemRefMm9countInside;
	}

	public BigDecimal getIpItemRefMm9sumInside(){
		return ipItemRefMm9sumInside;
	}

	public void setIpItemRefMm9sumInside(BigDecimal ipItemRefMm9sumInside) {
		this.ipItemRefMm9sumInside = ipItemRefMm9sumInside;
	}

	public BigDecimal getIpItemRefMm10countInside(){
		return ipItemRefMm10countInside;
	}

	public void setIpItemRefMm10countInside(BigDecimal ipItemRefMm10countInside) {
		this.ipItemRefMm10countInside = ipItemRefMm10countInside;
	}

	public BigDecimal getIpItemRefMm10sumInside(){
		return ipItemRefMm10sumInside;
	}

	public void setIpItemRefMm10sumInside(BigDecimal ipItemRefMm10sumInside) {
		this.ipItemRefMm10sumInside = ipItemRefMm10sumInside;
	}

	public BigDecimal getIpItemRefMm11countInside(){
		return ipItemRefMm11countInside;
	}

	public void setIpItemRefMm11countInside(BigDecimal ipItemRefMm11countInside) {
		this.ipItemRefMm11countInside = ipItemRefMm11countInside;
	}

	public BigDecimal getIpItemRefMm11sumInside(){
		return ipItemRefMm11sumInside;
	}

	public void setIpItemRefMm11sumInside(BigDecimal ipItemRefMm11sumInside) {
		this.ipItemRefMm11sumInside = ipItemRefMm11sumInside;
	}

	public BigDecimal getIpItemRefMm12countInside(){
		return ipItemRefMm12countInside;
	}

	public void setIpItemRefMm12countInside(BigDecimal ipItemRefMm12countInside) {
		this.ipItemRefMm12countInside = ipItemRefMm12countInside;
	}

	public BigDecimal getIpItemRefMm12sumInside(){
		return ipItemRefMm12sumInside;
	}

	public void setIpItemRefMm12sumInside(BigDecimal ipItemRefMm12sumInside) {
		this.ipItemRefMm12sumInside = ipItemRefMm12sumInside;
	}

	public String getIpItemRefInfoTenders(){
		return ipItemRefInfoTenders;
	}

	public void setIpItemRefInfoTenders(String ipItemRefInfoTenders) {
		this.ipItemRefInfoTenders = ipItemRefInfoTenders;
	}

	public String getIpItemRefUserAdd(){
		return ipItemRefUserAdd;
	}

	public void setIpItemRefUserAdd(String ipItemRefUserAdd) {
		this.ipItemRefUserAdd = ipItemRefUserAdd;
	}

	public Date getIpItemRefDateAdd(){
		return ipItemRefDateAdd;
	}

	public void setIpItemRefDateAdd(Date ipItemRefDateAdd) {
		this.ipItemRefDateAdd = ipItemRefDateAdd;
	}

	public String getIpItemRefUserGen(){
		return ipItemRefUserGen;
	}

	public void setIpItemRefUserGen(String ipItemRefUserGen) {
		this.ipItemRefUserGen = ipItemRefUserGen;
	}

	public Date getIpItemRefDateEdit(){
		return ipItemRefDateEdit;
	}

	public void setIpItemRefDateEdit(Date ipItemRefDateEdit) {
		this.ipItemRefDateEdit = ipItemRefDateEdit;
	}

	public int getMaterialRefCode(){
		return materialRefCode;
	}

	public void setMaterialRefCode(int materialRefCode) {
		this.materialRefCode = materialRefCode;
	}

	public String getMaterialRefName(){
		return materialRefName;
	}

	public void setMaterialRefName(String materialRefName) {
		this.materialRefName = materialRefName;
	}

	public BigDecimal getMaterialRefCost(){
		return materialRefCost;
	}

	public void setMaterialRefCost(BigDecimal materialRefCost) {
		this.materialRefCost = materialRefCost;
	}

	public int getMaterialRefDeliveryDate(){
		return materialRefDeliveryDate;
	}

	public void setMaterialRefDeliveryDate(int materialRefDeliveryDate) {
		this.materialRefDeliveryDate = materialRefDeliveryDate;
	}

	public String getMaterialRefNumkatalog(){
		return materialRefNumkatalog;
	}

	public void setMaterialRefNumkatalog(String materialRefNumkatalog) {
		this.materialRefNumkatalog = materialRefNumkatalog;
	}

	public String getMaterialRefIdentid(){
		return materialRefIdentid;
	}

	public void setMaterialRefIdentid(String materialRefIdentid) {
		this.materialRefIdentid = materialRefIdentid;
	}



}
