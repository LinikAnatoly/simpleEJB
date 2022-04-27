
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2ActType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2ActType implements Serializable {

private static final long serialVersionUID = 1L;

	/** Зв'язок договору на виконання робіт із актом виконанних робіт */
	public static final int SERVICES_WORKS = 1;

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  commentGen; 
    public static final String tableName = "ENELEMENT2ACTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2ACTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENELEMENT2ACTTYPE.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENELEMENT2ACTTYPE.COMMENTGEN";



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


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


} // end of ENElement2ActTypeValueObject

