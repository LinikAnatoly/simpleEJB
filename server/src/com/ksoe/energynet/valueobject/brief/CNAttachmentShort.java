
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNAttachment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNAttachmentShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int soCode = Integer.MIN_VALUE;
	public String name;
	public Date date_doc ;
	public String filename;
	public String filelink;
	
	public String prefix;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setSoCode(int aValue){
		soCode = aValue;
	}

	public int getSoCode(){
		return soCode;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setDate_doc(Date aValue){
		date_doc = aValue;
	}

	public Date getDate_doc(){
		return date_doc;
	}

	public void setFilename(String aValue){
		filename = aValue;
	}

	public String getFilename(){
		return filename;
	}

	public void setFilelink(String aValue){
		filelink = aValue;
	}

	public String getFilelink(){
		return filelink;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}




}
