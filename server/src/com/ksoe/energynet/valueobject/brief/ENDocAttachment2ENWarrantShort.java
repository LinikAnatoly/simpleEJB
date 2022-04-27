
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDocAttachment2ENWarrant;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDocAttachment2ENWarrantShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int docAttachmentRefCode = Integer.MIN_VALUE;
	public String docAttachmentRefCommentGen;
	public String docAttachmentRefFileLink;
	public String docAttachmentRefUserAdd;
	public Date docAttachmentRefDateAdd;
	public String docAttachmentRefUserGen;
	public Date docAttachmentRefDateEdit;
	public int warrantRefCode = Integer.MIN_VALUE;
	public String warrantRefNumbergen;
	public String warrantRefName;
	public String warrantRefWarrantFIO;
	public String warrantRefWarrantShortFIO;
	public String warrantRefWarrantPosition;
	public String warrantRefGenitiveFIO;
	public String warrantRefGenitivePosition;
	public String warrantRefPassport;
	public String warrantRefAddress;
	public int warrantRefPower = Integer.MIN_VALUE;
	public BigDecimal warrantRefMaxSum;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setDocAttachmentRefCode(int aValue){
		docAttachmentRefCode = aValue;
	}
	public int getDocAttachmentRefCode(){
		return docAttachmentRefCode;
	}

	public void setDocAttachmentRefCommentGen(String aValue){
		docAttachmentRefCommentGen = aValue;
	}
	public String getDocAttachmentRefCommentGen(){
		return docAttachmentRefCommentGen;
	}

	public void setDocAttachmentRefFileLink(String aValue){
		docAttachmentRefFileLink = aValue;
	}
	public String getDocAttachmentRefFileLink(){
		return docAttachmentRefFileLink;
	}

	public void setDocAttachmentRefUserAdd(String aValue){
		docAttachmentRefUserAdd = aValue;
	}
	public String getDocAttachmentRefUserAdd(){
		return docAttachmentRefUserAdd;
	}

	public void setDocAttachmentRefDateAdd(Date aValue){
		docAttachmentRefDateAdd = aValue;
	}
	public Date getDocAttachmentRefDateAdd(){
		return docAttachmentRefDateAdd;
	}

	public void setDocAttachmentRefUserGen(String aValue){
		docAttachmentRefUserGen = aValue;
	}
	public String getDocAttachmentRefUserGen(){
		return docAttachmentRefUserGen;
	}

	public void setDocAttachmentRefDateEdit(Date aValue){
		docAttachmentRefDateEdit = aValue;
	}
	public Date getDocAttachmentRefDateEdit(){
		return docAttachmentRefDateEdit;
	}

	public void setWarrantRefCode(int aValue){
		warrantRefCode = aValue;
	}
	public int getWarrantRefCode(){
		return warrantRefCode;
	}

	public void setWarrantRefNumbergen(String aValue){
		warrantRefNumbergen = aValue;
	}
	public String getWarrantRefNumbergen(){
		return warrantRefNumbergen;
	}

	public void setWarrantRefName(String aValue){
		warrantRefName = aValue;
	}
	public String getWarrantRefName(){
		return warrantRefName;
	}

	public void setWarrantRefWarrantFIO(String aValue){
		warrantRefWarrantFIO = aValue;
	}
	public String getWarrantRefWarrantFIO(){
		return warrantRefWarrantFIO;
	}

	public void setWarrantRefWarrantShortFIO(String aValue){
		warrantRefWarrantShortFIO = aValue;
	}
	public String getWarrantRefWarrantShortFIO(){
		return warrantRefWarrantShortFIO;
	}

	public void setWarrantRefWarrantPosition(String aValue){
		warrantRefWarrantPosition = aValue;
	}
	public String getWarrantRefWarrantPosition(){
		return warrantRefWarrantPosition;
	}

	public void setWarrantRefGenitiveFIO(String aValue){
		warrantRefGenitiveFIO = aValue;
	}
	public String getWarrantRefGenitiveFIO(){
		return warrantRefGenitiveFIO;
	}

	public void setWarrantRefGenitivePosition(String aValue){
		warrantRefGenitivePosition = aValue;
	}
	public String getWarrantRefGenitivePosition(){
		return warrantRefGenitivePosition;
	}

	public void setWarrantRefPassport(String aValue){
		warrantRefPassport = aValue;
	}
	public String getWarrantRefPassport(){
		return warrantRefPassport;
	}

	public void setWarrantRefAddress(String aValue){
		warrantRefAddress = aValue;
	}
	public String getWarrantRefAddress(){
		return warrantRefAddress;
	}

	public void setWarrantRefPower(int aValue){
		warrantRefPower = aValue;
	}
	public int getWarrantRefPower(){
		return warrantRefPower;
	}

	public void setWarrantRefMaxSum(BigDecimal aValue){
		warrantRefMaxSum = aValue;
	}
	public BigDecimal getWarrantRefMaxSum(){
		return warrantRefMaxSum;
	}



}