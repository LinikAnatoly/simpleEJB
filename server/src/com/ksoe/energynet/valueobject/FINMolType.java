
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINMolTypeFINMolType;  	
  */

import java.io.Serializable;


public class FINMolType implements Serializable {

	public static final int MASTER = 1;
	public static final int MECHANIC = 2;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "FINMOLTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINMOLTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINMOLTYPE.NAME";


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

;

} // end of FINMolTypeValueObject

