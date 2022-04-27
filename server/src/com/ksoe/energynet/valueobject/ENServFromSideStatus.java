
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServFromSideStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServFromSideStatus implements Serializable {
	
	
	public static final int DRAFT = 1;
	public static final int SIGNED = 2;
	public static final int PAY = 3;
	public static final int WORK_EXECUTE = 4;
	public static final int WORK_COMPLETED= 5;
	
    public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "ENSERVFROMSIDESTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVFROMSIDESTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVFROMSIDESTATUS.NAME";




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


} // end of ENServFromSideStatusValueObject

