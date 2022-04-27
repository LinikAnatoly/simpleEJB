
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Fri Sep 18 11:06:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENElementShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 
    public int elementInRefCode = Integer.MIN_VALUE; 
    public int elementOutRefCode = Integer.MIN_VALUE; 
    public int renRefCode = Integer.MIN_VALUE; 
    public String renRefName; 
    public int finExecutorCode = Integer.MIN_VALUE;
    public String finExecutorName;
    public int finExecutorFinCode = Integer.MIN_VALUE;
    public String finExecutorFinTypeName;
    public int finExecutorFinTypeCode = Integer.MIN_VALUE;
    public String finExecutorFinKindName;
    public int finExecutorFinKindCode = Integer.MIN_VALUE;
    public String finExecutorFinCehName;
    public int finExecutorFinCehCode = Integer.MIN_VALUE;
    public String finExecutorAxOrgId;
    public String finExecutorAxParentOrgId;
    public String finExecutorAxParentOrgName;
    public int finExecutorAxOrgTypeId = Integer.MIN_VALUE;
    public String finExecutorAxOrgTypeName;
    public int geoDepartmentRefCode = Integer.MIN_VALUE;
    public String geoDepartmentRefName;
    public String geoDepartmentRefCommentgen;
    public String geoDepartmentRefUserAdd;
    public Date geoDepartmentRefDateAdd;
    public String geoDepartmentRefUserGen;
    public Date geoDepartmentRefDateEdit;

    public String objectName;
    public String objectInvNumber;
    
    public String objectBuhName;
    
    public String getObjectInvNumber() {
		return objectInvNumber;
	}
	public void setObjectInvNumber(String objectInvNumber) {
		this.objectInvNumber = objectInvNumber;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }
	
    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }
	
    public void setElementInRefCode(int aValue){
       elementInRefCode = aValue;
    }
    public int getElementInRefCode(){
       return elementInRefCode;
    }
	
    public void setElementOutRefCode(int aValue){
       elementOutRefCode = aValue;
    }
    public int getElementOutRefCode(){
       return elementOutRefCode;
    }
	

    public void setObjectName(String aValue){
        objectName = aValue;
     }

     public String getObjectName(){
        return objectName;
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
	public String getObjectBuhName() {
		return objectBuhName;
	}
	public void setObjectBuhName(String objectBuhName) {
		this.objectBuhName = objectBuhName;
	}
    
	public void setFinExecutorCode(int aValue){
		finExecutorCode = aValue;
	}
	public int getFinExecutorCode(){
		return finExecutorCode;
	}

	public void setFinExecutorName(String aValue){
		finExecutorName = aValue;
	}
	public String getFinExecutorName(){
		return finExecutorName;
	}

	public void setFinExecutorFinCode(int aValue){
		finExecutorFinCode = aValue;
	}
	public int getFinExecutorFinCode(){
		return finExecutorFinCode;
	}

	public void setFinExecutorFinTypeName(String aValue){
		finExecutorFinTypeName = aValue;
	}
	public String getFinExecutorFinTypeName(){
		return finExecutorFinTypeName;
	}

	public void setFinExecutorFinTypeCode(int aValue){
		finExecutorFinTypeCode = aValue;
	}
	public int getFinExecutorFinTypeCode(){
		return finExecutorFinTypeCode;
	}

	public void setFinExecutorFinKindName(String aValue){
		finExecutorFinKindName = aValue;
	}
	public String getFinExecutorFinKindName(){
		return finExecutorFinKindName;
	}

	public void setFinExecutorFinKindCode(int aValue){
		finExecutorFinKindCode = aValue;
	}
	public int getFinExecutorFinKindCode(){
		return finExecutorFinKindCode;
	}

	public void setFinExecutorFinCehName(String aValue){
		finExecutorFinCehName = aValue;
	}
	public String getFinExecutorFinCehName(){
		return finExecutorFinCehName;
	}

	public void setFinExecutorFinCehCode(int aValue){
		finExecutorFinCehCode = aValue;
	}
	public int getFinExecutorFinCehCode(){
		return finExecutorFinCehCode;
	}

	public void setFinExecutorAxOrgId(String aValue){
		finExecutorAxOrgId = aValue;
	}
	public String getFinExecutorAxOrgId(){
		return finExecutorAxOrgId;
	}

	public void setFinExecutorAxParentOrgId(String aValue){
		finExecutorAxParentOrgId = aValue;
	}
	public String getFinExecutorAxParentOrgId(){
		return finExecutorAxParentOrgId;
	}

	public void setFinExecutorAxParentOrgName(String aValue){
		finExecutorAxParentOrgName = aValue;
	}
	public String getFinExecutorAxParentOrgName(){
		return finExecutorAxParentOrgName;
	}

	public void setFinExecutorAxOrgTypeId(int aValue){
		finExecutorAxOrgTypeId = aValue;
	}
	public int getFinExecutorAxOrgTypeId(){
		return finExecutorAxOrgTypeId;
	}

	public void setFinExecutorAxOrgTypeName(String aValue){
		finExecutorAxOrgTypeName = aValue;
	}
	public String getFinExecutorAxOrgTypeName(){
		return finExecutorAxOrgTypeName;
	}

	public int getGeoDepartmentRefCode(){
		return geoDepartmentRefCode;
	}

	public void setGeoDepartmentRefCode(int geoDepartmentRefCode) {
		this.geoDepartmentRefCode = geoDepartmentRefCode;
	}

	public String getGeoDepartmentRefName(){
		return geoDepartmentRefName;
	}

	public void setGeoDepartmentRefName(String geoDepartmentRefName) {
		this.geoDepartmentRefName = geoDepartmentRefName;
	}

	public String getGeoDepartmentRefCommentgen(){
		return geoDepartmentRefCommentgen;
	}

	public void setGeoDepartmentRefCommentgen(String geoDepartmentRefCommentgen) {
		this.geoDepartmentRefCommentgen = geoDepartmentRefCommentgen;
	}

	public String getGeoDepartmentRefUserAdd(){
		return geoDepartmentRefUserAdd;
	}

	public void setGeoDepartmentRefUserAdd(String geoDepartmentRefUserAdd) {
		this.geoDepartmentRefUserAdd = geoDepartmentRefUserAdd;
	}

	public Date getGeoDepartmentRefDateAdd(){
		return geoDepartmentRefDateAdd;
	}

	public void setGeoDepartmentRefDateAdd(Date geoDepartmentRefDateAdd) {
		this.geoDepartmentRefDateAdd = geoDepartmentRefDateAdd;
	}

	public String getGeoDepartmentRefUserGen(){
		return geoDepartmentRefUserGen;
	}

	public void setGeoDepartmentRefUserGen(String geoDepartmentRefUserGen) {
		this.geoDepartmentRefUserGen = geoDepartmentRefUserGen;
	}

	public Date getGeoDepartmentRefDateEdit(){
		return geoDepartmentRefDateEdit;
	}

	public void setGeoDepartmentRefDateEdit(Date geoDepartmentRefDateEdit) {
		this.geoDepartmentRefDateEdit = geoDepartmentRefDateEdit;
	}

}