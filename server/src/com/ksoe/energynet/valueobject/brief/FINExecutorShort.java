
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINExecutor;
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FINExecutorShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public int finCode = Integer.MIN_VALUE;
    public String finTypeName;
    public int finTypeCode = Integer.MIN_VALUE;
    public String finKindName;
    public int finKindCode = Integer.MIN_VALUE;
    public String finCehName;
    public int finCehCode = Integer.MIN_VALUE;
    public String axOrgId;
    public String axParentOrgId;
    public String axParentOrgName;
    public int axOrgTypeId = Integer.MIN_VALUE;
    public String axOrgTypeName;

    public int main_podr_id = Integer.MIN_VALUE;
    public int podr_id = Integer.MIN_VALUE;

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
    public void setFinCode(int aValue){
       finCode = aValue;
    }

    public int getFinCode(){
       return finCode;
    }
    public void setFinTypeName(String aValue){
       finTypeName = aValue;
    }

    public String getFinTypeName(){
       return finTypeName;
    }
    public void setFinTypeCode(int aValue){
       finTypeCode = aValue;
    }

    public int getFinTypeCode(){
       return finTypeCode;
    }
    public void setFinKindName(String aValue){
       finKindName = aValue;
    }

    public String getFinKindName(){
       return finKindName;
    }
    public void setFinKindCode(int aValue){
       finKindCode = aValue;
    }

    public int getFinKindCode(){
       return finKindCode;
    }
    public void setFinCehName(String aValue){
       finCehName = aValue;
    }

    public String getFinCehName(){
       return finCehName;
    }
    public void setFinCehCode(int aValue){
       finCehCode = aValue;
    }

    public int getFinCehCode(){
       return finCehCode;
    }

    public void setAxOrgId(String aValue){
       axOrgId = aValue;
    }

    public String getAxOrgId(){
       return axOrgId;
    }
    public void setAxParentOrgId(String aValue){
       axParentOrgId = aValue;
    }

    public String getAxParentOrgId(){
       return axParentOrgId;
    }

    public void setAxParentOrgName(String aValue){
       axParentOrgName = aValue;
    }

    public String getAxParentOrgName(){
       return axParentOrgName;
    }
    public void setAxOrgTypeId(int aValue){
       axOrgTypeId = aValue;
    }

    public int getAxOrgTypeId(){
       return axOrgTypeId;
    }
    public void setAxOrgTypeName(String aValue){
       axOrgTypeName = aValue;
    }

    public String getAxOrgTypeName(){
       return axOrgTypeName;
    }

	public int getMain_podr_id() {
		return main_podr_id;
	}

	public void setMain_podr_id(int main_podr_id) {
		this.main_podr_id = main_podr_id;
	}

	public int getPodr_id() {
		return podr_id;
	}

	public void setPodr_id(int podr_id) {
		this.podr_id = podr_id;
	}


}