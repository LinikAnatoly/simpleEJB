
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDocAttachmentServer;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDocAttachmentServerShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;
	public String serverIp;
	public String userName;
	public String userPass;


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

	public void setServerIp(String aValue){
		serverIp = aValue;
	}

	public String getServerIp(){
		return serverIp;
	}

	public void setUserName(String aValue){
		userName = aValue;
	}

	public String getUserName(){
		return userName;
	}

	public void setUserPass(String aValue){
		userPass = aValue;
	}

	public String getUserPass(){
		return userPass;
	}




}
