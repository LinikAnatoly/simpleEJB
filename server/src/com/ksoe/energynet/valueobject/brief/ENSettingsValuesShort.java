
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSettingsValues;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSettingsValuesShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date dateStart ;
	public Date dateFinal ;
	public String value;
	public String userAdd;
	public String commentGen;
	public String userGen;
	public int settingsRefCode = Integer.MIN_VALUE;
	public String settingsRefKey;
	public String settingsRefComment;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDateStart(Date aValue){
		dateStart = aValue;
	}

	public Date getDateStart(){
		return dateStart;
	}

	public void setDateFinal(Date aValue){
		dateFinal = aValue;
	}

	public Date getDateFinal(){
		return dateFinal;
	}

	public void setValue(String aValue){
		value = aValue;
	}

	public String getValue(){
		return value;
	}

	public void setUserAdd(String aValue){
		userAdd = aValue;
	}

	public String getUserAdd(){
		return userAdd;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}




	public void setSettingsRefCode(int aValue){
		settingsRefCode = aValue;
	}
	public int getSettingsRefCode(){
		return settingsRefCode;
	}

	public void setSettingsRefKey(String aValue){
		settingsRefKey = aValue;
	}
	public String getSettingsRefKey(){
		return settingsRefKey;
	}

	public void setSettingsRefComment(String aValue){
		settingsRefComment = aValue;
	}
	public String getSettingsRefComment(){
		return settingsRefComment;
	}



}