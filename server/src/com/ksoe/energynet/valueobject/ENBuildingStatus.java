
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuildingStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuildingStatus implements Serializable {
	
	public static final int DRAFT = 1;
	public static final int SIGNED = 2;
	public static final int CLOSE = 3;

    public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "ENBUILDINGSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDINGSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBUILDINGSTATUS.NAME";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


} // end of ENBuildingStatusValueObject

