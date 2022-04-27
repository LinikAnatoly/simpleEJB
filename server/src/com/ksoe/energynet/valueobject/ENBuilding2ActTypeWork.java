
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding2ActTypeWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuilding2ActTypeWork implements Serializable {

	public static final int ENBUILDING2ACTTYPEWORK_PRICONNECTION = 1;
	public static final int ENBUILDING2ACTTYPEWORK_INVESTPROGRAM = 2;
	public static final int ENBUILDING2ACTTYPEWORK_OTHER = 3;
	
	public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "ENBUILDING2ACTTYPEWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING2ACTTYPEWORK.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBUILDING2ACTTYPEWORK.NAME";




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


} // end of ENBuilding2ActTypeWorkValueObject

