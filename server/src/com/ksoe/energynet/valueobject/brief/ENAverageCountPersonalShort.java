
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAverageCountPersonal;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAverageCountPersonalShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String codePodr;
	public String namePodr;
	public String codeCeh;
	public String nameCeh;
	public Date calculateDate ;
	public Date dateEdit ;
	public BigDecimal countGen;
	public String personalVidId;
	public String personalVidName;
	public String userGen;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setCodePodr(String aValue){
		codePodr = aValue;
	}

	public String getCodePodr(){
		return codePodr;
	}

	public void setNamePodr(String aValue){
		namePodr = aValue;
	}

	public String getNamePodr(){
		return namePodr;
	}

	public void setCodeCeh(String aValue){
		codeCeh = aValue;
	}

	public String getCodeCeh(){
		return codeCeh;
	}

	public void setNameCeh(String aValue){
		nameCeh = aValue;
	}

	public String getNameCeh(){
		return nameCeh;
	}

	public void setCalculateDate(Date aValue){
		calculateDate = aValue;
	}

	public Date getCalculateDate(){
		return calculateDate;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setCountGen(BigDecimal aValue){
		countGen = aValue;
	}

	public BigDecimal getCountGen(){
		return countGen;
	}

	public void setPersonalVidId(String aValue){
		personalVidId = aValue;
	}

	public String getPersonalVidId(){
		return personalVidId;
	}

	public void setPersonalVidName(String aValue){
		personalVidName = aValue;
	}

	public String getPersonalVidName(){
		return personalVidName;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}





}