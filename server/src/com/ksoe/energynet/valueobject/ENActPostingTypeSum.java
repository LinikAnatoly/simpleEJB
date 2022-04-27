
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActPostingTypeSum;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActPostingTypeSum implements Serializable {
	
	public static final int TYPESUM_ESV = 1; // ЕСВ по акту
	public static final int TYPESUM_GENERAL_PRODUCTION = 2; // Загальновиробничі витрати по акту
	public static final int TYPESUM_SALARY = 3; // Заробітня плата по акту
	public static final int TYPESUM_CLOSE_ESV = 4; // Закриття ЕСВ по акту
	public static final int TYPESUM_CLOSE_GENERAL_PRODUCTION = 5; // Закриття ЕСВ по акту
	public static final int TYPESUM_CLOSE_SALARY = 6; // Закриття заробітньої плати по акту
	
	
	

    public int  code = Integer.MIN_VALUE;
    public String  name; 


    public static final String tableName = "ENACTPOSTINGTYPESUM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPOSTINGTYPESUM.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACTPOSTINGTYPESUM.NAME";




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


} // end of ENActPostingTypeSumValueObject

