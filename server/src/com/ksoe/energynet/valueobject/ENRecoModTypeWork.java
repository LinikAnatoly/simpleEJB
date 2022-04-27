
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRecoModTypeWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENRecoModTypeWork implements Serializable {
	
	public static final int OWNERWORK = 1; // собственные работы (без договора)
	public static final int ONSIDEWORK = 2; // работы на сторону (с договором)
	public static final int WITHSIDEWORK = 3; // работы со стороны (с договором)
	

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENRECOMODTYPEWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECOMODTYPEWORK.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENRECOMODTYPEWORK.NAME";


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


} // end of ENRecoModTypeWorkValueObject

