
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENIP;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public int yearGen = Integer.MIN_VALUE;
	public int version = Integer.MIN_VALUE;
	public String commentGen;
	public Date dateAdd ;
	public Date dateEdit ;
	public String userAdd;
	public String userEdit;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int parentRefCode = Integer.MIN_VALUE;
	public String parentRefName;
	public int parentRefYearGen = Integer.MIN_VALUE;
	public int parentRefVersion = Integer.MIN_VALUE;
	public String parentRefCommentGen;
	public Date parentRefDateAdd;
	public Date parentRefDateEdit;
	public String parentRefUserAdd;
	public String parentRefUserEdit;
	
    public int lastIpCode = Integer.MIN_VALUE;


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

	public void setYearGen(int aValue){
		yearGen = aValue;
	}

	public int getYearGen(){
		return yearGen;
	}

	public void setVersion(int aValue){
		version = aValue;
	}

	public int getVersion(){
		return version;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}

	public void setDateAdd(Date aValue){
		dateAdd = aValue;
	}

	public Date getDateAdd(){
		return dateAdd;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setUserAdd(String aValue){
		userAdd = aValue;
	}

	public String getUserAdd(){
		return userAdd;
	}

	public void setUserEdit(String aValue){
		userEdit = aValue;
	}

	public String getUserEdit(){
		return userEdit;
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

	public void setParentRefYearGen(int aValue){
		parentRefYearGen = aValue;
	}
	public int getParentRefYearGen(){
		return parentRefYearGen;
	}

	public void setParentRefVersion(int aValue){
		parentRefVersion = aValue;
	}
	public int getParentRefVersion(){
		return parentRefVersion;
	}

	public void setParentRefCommentGen(String aValue){
		parentRefCommentGen = aValue;
	}
	public String getParentRefCommentGen(){
		return parentRefCommentGen;
	}

	public void setParentRefDateAdd(Date aValue){
		parentRefDateAdd = aValue;
	}
	public Date getParentRefDateAdd(){
		return parentRefDateAdd;
	}

	public void setParentRefDateEdit(Date aValue){
		parentRefDateEdit = aValue;
	}
	public Date getParentRefDateEdit(){
		return parentRefDateEdit;
	}

	public void setParentRefUserAdd(String aValue){
		parentRefUserAdd = aValue;
	}
	public String getParentRefUserAdd(){
		return parentRefUserAdd;
	}

	public void setParentRefUserEdit(String aValue){
		parentRefUserEdit = aValue;
	}
	public String getParentRefUserEdit(){
		return parentRefUserEdit;
	}
	
    public int getLastIpCode() {
		return lastIpCode;
	}

	public void setLastIpCode(int lastIpCode) {
		this.lastIpCode = lastIpCode;
	}



}